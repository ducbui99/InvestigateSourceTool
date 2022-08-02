//************************************************************************
//*
//*		Systeme			:	新会計システム
//*		Program			:	固定摘要マスタ				　　
//*		ProgramID		:	JNTCRP020000
//*		Name			:	Y.Ichihashi
//*		Create			:	2000/08/01
//*		Comment			:	XXXXXXXXXXXXXXXXXXXXXX
//*		History			:	XXXX/XX/XX	XX修正者XX（所属）
//*										XXXXXXXXXX更新内容XXXXXXXXXX
//*
//*	00/12/22	HIS0001	H.Endo(企業ｼｽﾃﾑ企画設計)
//*						TekiPopupMenuの摘要分類追加(Tekiyou),固定摘要追加(Kotei),
//*						修正(syuusei)をTekiPopupMenuから削除する
//*	00/12/22	HIS0002	H.Endo(企業ｼｽﾃﾑ企画設計)
//*						詳細のTabの動き
//*	00/12/22	HIS0003	H.Endo(企業ｼｽﾃﾑ企画設計)
//*						Combo選択で同一を選択された時読み込みをしない
//*	00/12/22	HIS0004	H.Endo(企業ｼｽﾃﾑ企画設計)
//*						TreeViewの移動と同時にRecordSelecterの移動処理
//*	00/12/22	HIS0005	H.Endo(企業ｼｽﾃﾑ企画設計)
//*						詳細画面から一覧画面へ戻るときTreeViewの選択されているCode
//*						へﾌｫｰｶｽを移動させる
//*	00/12/25	HIS0006	H.Endo(企業ｼｽﾃﾑ企画設計)
//*						参照と入力を切り替える
//*	01/01/24	HIS0007	H.Endo(企業ｼｽﾃﾑ企画設計)
//*						Treeの表示・削除の条件修正
//*	01/01/30	HIS0008	H.Endo(企業ｼｽﾃﾑ企画設計)
//*						ｽﾄｱﾄﾞの初期処理
//*	01/01/30	HIS0009	H.Endo(企業ｼｽﾃﾑ企画設計)
//*						科目連想登録でTreeViewに表示する科目名に外部コードを付加
//*
//*	2002/04/01	HIS0010	Y.Ichihashi	仕訳で固定摘要コードを使用されているときに削除ボタンを
//*									押されたらメッセージを出す。
//*	2002/04/18	HIS0011	Y.Ichihashi	Insert,UpdateのSQL文の変更(''をいれるとエラーになるため）
//*	2002/04/23	HIS0012	Y.Ichihashi	同一ｺｰﾄﾞのときエラーメッセージを表示
//*	2002/04/24	HIS0013	Y.Ichihashi	他の分類へコピーした後、コピーしたものを削除した後、
//*									コピーすると削除したものが復活するのを制御。
//*	2002/05/21	HIS0014	Y.Ichihashi	RenCharとTekiCharで重複ﾁｪｯｸ
//*	2002/05/24	HIS0015	Y.Ichihashi	摘要文字列のﾁｪｯｸをBeforeChengColumnからBeforeChnegeNodeに変更
//*	2002/05/24	HIS0016	Y.Ichihashi	ｺｰﾄﾞは数字のみなので数字ﾁｪｯｸはいらず、Enterを押された時に
//*									Beepを鳴らさないように修正
//*	2002/06/05	HIS0017	Y.Ichihashi	FieldNameが違っているので修正
//*	2002/06/25	HIS0018	Y.Ichihashi	科目連想（摘要順）を作成
//*	2002/07/25	HIS0019	Y.Ichihashi	科目連想（科目順）での摘要コードを摘要コード順に出力されるように修正
//*	2002/07/26	HIS0020	Y.Ichihashi	詳細画面での科目連想Gridで直接科目ｺｰﾄﾞを入力してEnterをおしたときに摘要残高に
//*									ﾌｫｰｶｽ移動しないのを修正
//*	2002/10/17	HIS0021	Y.Ichihashi	詳細画面で科目連想登録Gridでの摘要残高登録でSumSMに
//*									追加or修正かけたときのSumSMとSwkCInfoのTblHistoryに更新処理を追加
//*	2002/11/01	HIS0022	Y.Ichihashi	科目連想リストでの摘要連想名順を追加
//*	2002/08		HIS0023	Y.Ichihashi	摘要文字列での入力した文字が元の文字にセットされたり、文字がかけたり、文字化けするのを修正
//*	2002/11/26	HIS0024	Y.Ichihashi	連想リストで印刷DLGで連想順にコードを取得されるのでMemDataのセットの仕方を変更
//*	2002/12/05	HIS0025	Y.Ichihashi	マスタが採用されていない時はコード桁数などの設定はしないように修正
//*	2002/12/05	HIS0026	Y.Ichihashi	HIS0025の修正により不具合がおきないようにするため
//*									コード桁数が0～2の時、又はMasterInfoにレコードがない時はコード桁数を4でセットする
//*	2003/01/07	HIS0027	Y.Ichihashi	仕訳入力では、部署で入れた摘要マスタは固定摘要としては扱わず、
//*									文字列に展開して入力する。この判断を、摘要マスタの入力部署コードフィールドに
//*									部署コードがあるか？でチェックする。よって、摘要登録では部署にて登録した
//*									マスタには部署コードを設定する。
//* 2004/06/28  HIS0028 Y.Ichihashi 検索処理対応
//
//* 2005/02/22  HIS0029 Y.Mogi(LEAD)    FX対応  （スキーマ・内部コード対応）//
//* 2005/03/08  HIS0030 Y.Inoue(LEAD)   FX対応  （050307スキーマファイルに対応）
//
//* 2005/05/16  HIS0031 K.Iiduka(LEAD)  FX-Style対応
//* 2005/05/16  HIS0032 K.Iiduka(LEAD)  050513DBスキーマファイルに対応(内部コード対応)
//* 2005/05/19  HIS0033 K.Iiduka(LEAD)  採用区分FX仕様対応
//* 2005/09/05  HIS0035 K.Iiduka(LEAD)  内部ｺｰﾄﾞ取得方法修正(親子関係を正確に取得出来ないため)
//* 2005/09/13  HIS0036 K.Iiduka(LEAD)  共通・会計系連絡表№123
//* 2005/09/13  HIS0037 K.Iiduka(LEAD)  共通・会計系連絡表№124
//* 2005/08/26  <PRN>   K.Iiduka(LEAD)  印刷機能実装
//* 2005/11/07  <     > K.Katou(PRIME)  FX-Style対応＋
//* 2005/11/07  HIS0038 K.Katou(PRIME)  ｷｰ動作修正
//* 2005/11/07  HIS0039 K.Katou(PRIME)  固定摘要＞詳細ﾀﾌﾞ＞科目連想ｸﾞﾘｯﾄﾞの科目EXP対応（今後複数選択EXPにも対応予定）
//* 2005/11/07  HIS0040 K.Katou(PRIME)  固定摘要の実在ｸﾞﾘｯﾄﾞ表示時に付箋ﾎﾞﾀﾝが無効になることがある不具合修正
//* 2005/11/15  HIS0041 K.Katou(PRIME)  履歴対応
//* 2006/01/13  HIS0042 y.Aoki (PRIME)  印刷機能復活
//* 2006/01/13  HIS0043 y.Aoki (PRIME)  科目連想登録ﾘｽﾄ（科目ｺｰﾄﾞ順）追加
//* 2006/01/13  HIS0044 y.Aoki (PRIME)  科目連想登録ﾘｽﾄ（摘要ｺｰﾄﾞ順）追加
//* 2006/01/13  HIS0045 K.Katou(PRIME)  ﾌﾟﾚﾋﾞｭｰ中に終了時にｴﾗｰとなる不具合修正
//* 2006/01/13  <     > K.Katou(PRIME)  摘要のﾌｨｰﾙﾄﾞSizeを60に拡張
//* 2006/01/30  HIS0046 y.Aoki (PRIME)  固定摘要一覧表追加
//* 2006/01/30  <     > y.Aoki (PRIME)  CmnMemDataPrintKanaOrderのstrDescriptionのサイズを60に変更
//* 2006/01/31  HIS0047 y.Aoki (PRIME)  固定摘要体系登録ﾘｽﾄ追加
//* 2006/01/30  <     > y.Aoki (PRIME)  DPrintdxMemData4のBunName・TekiCharのサイズを60に変更
//* 2006/02/01  HIS0048 y.Aoki (PRIME)  固定摘要分類登録ﾘｽﾄ追加
//* 2006/02/01  <     > y.Aoki (PRIME)  DPrintdxMemData3のTekiCharのサイズを60に変更
//* 2006/02/01  <     > y.Aoki (PRIME)  DPrintdxMemData5のMTekiCharNのサイズを60に変更
//* 2006/02/01  <     > y.Aoki (PRIME)  DPrintdxMemData6のTekiCharのサイズを60に変更
//* 2006/02/02  HIS0049 y.Aoki (PRIME)  Const定義を使用するよう変更
//* 2006/02/02  <     > y.Aoki (PRIME)  DPrintdxMemData1のTekiCharのサイズを60に変更
//* 2006/02/09  <CHK>   y.Aoki (PRIME)  削除ﾁｪｯｸ追加
//* 2006/02/14  HIS0050 y.Aoki (PRIME)  ﾏｽﾀｰ区分をｺﾝｽﾄに変更
//* 2006/03/15  HIS0051 K.Katou(PRIME)  MTabでの→←ｷｰの動きを修正
//* 2006/12/07  HIS0052 K.Katou(PRIME)	仕訳辞書登録対応
//* 2007/01/09	HIS0053 K.Katou(PRIME)	HIS0046～HIS0048を復帰
//* 2007/02/06	HIS0054 K.Katou(PRIME)	消費税率の区分と名称が合わない不具合修正
//*	2007/02/13	HIS0055	K.Katou(PRIME)	仕訳辞書の補助の区分は部門・社員のみ当該選択可能とする
//*	2007/02/15	HIS0056 K.Katou(PRIME)	検索Expで部門・ｾｸﾞﾒﾝﾄのBS/PLを見ていない不具合修正
//*	2007/02/15	HIS0057	K.Katou(PRIME)	仕訳情報ｸﾞﾘｯﾄﾞの最後の行で次のｺﾝﾄﾛｰﾙに移動するように修正
//*	2007/03/07	<SYNC> 	K.Katou(PRIME)	ﾏｽﾀ同期対応
//* 2007/03/09	HIS0058	K.Katou(PRIME)	固定摘要ｺｰﾄﾞ桁数対応(6桁固定→採用情報で最大8桁までに変更可能)
//*	2007/03/14	HIS0059 K.Katou(PRIME)	ｺﾝﾄﾛｰﾙのEnterｲﾍﾞﾝﾄでﾌｫｰｶｽ変数を更新するようにあちこち修正
//* 2007/03/22	HIS0060 K.Katou(PRIME)	ﾏｽﾀ重複対応(ﾒｯｾｰｼﾞの統一)
//* 2007/04/05	HIS0061 T.Satoh(IDC)	VISTA対応(縦スクロールバー)
//* 2007/04/06	HIS0062 K.Katou(PRIME)	ﾏｽﾀ同期対応(翌期更新対応)
//* 2007/04/09	HIS0063 K.Katou(PRIME)	印刷処理見直し
//* 2007/04/27	HIS0064 T.Satoh(IDC)	摘要分類から戻った場合に消費税区分が表示される不具合を修正
//*	2007/05/17	HIS0065 K.Katou(PRIME)	ﾏｽﾀ同期 配信ﾀﾞｲｱﾛｸﾞ対応
//*	2007/05/17	HIS0066	K.Katou(PRIME)	ﾏｽﾀ同期 関連付け関係のﾒｯｾｰｼﾞに簡略名称がなかったので追加
//*	2007/05/17	HIS0067	K.Katou(PRIME)	ﾏｽﾀ同期 子会社で登録時に他の子会社のRELを作っていない不具合修正
//*	2007/06/12	HIS0068	K.Katou(PRIME)	仕訳辞書の社員が再表示できない不具合修正 EDB.inc
//*	2007/06/26	HIS0069	K.Katou(PRIME)	初期表示時に削除ﾎﾞﾀﾝが押せないようにする
//*	2007/06/26	HIS0070	K.Katou(PRIME)	ﾎﾟｯﾌﾟｱｯﾌﾟ表示時の不具合修正
//*	2007/06/29	HIS0071	E.Nanba(LABO)	決算確定後、固定摘要の詳細画面で科目連想グリッドが編集可能になっているのを修正
//* 2007/07/03  HIS0072 S.Suzuki(PRIME) 科目連想のｸﾞﾘｯﾄﾞでｺｰﾄﾞを入力して↓ｷｰを押下して取消ﾎﾞﾀﾝを押下するとｸﾞﾘｯﾄﾞの行が消えてしまう不具合を修正
//* 2007/08/09  HIS0073 S.Suzuki(PRIME) 配信ﾀﾞｲｱﾛｸﾞの呼び出し条件の修正
//* 2007/08/28  HIS0074 S.Suzuki(PRIME) 追加権限なしおよび修正権限なしの場合、詳細画面のﾎﾟｯﾌﾟｱｯﾌﾟで付箋の削除ができてしまう不具合を修正
//* 2007/08/28  HIS0075 S.Szuuki(PRIME) 追加権限なしおよび修正権限なしの場合、ﾂﾘｰのﾎﾟｯﾌﾟｱｯﾌﾟで付箋の削除、備考修正ができてしまう不具合を修正
//* 2008/03/14  HIS0076 F.Ootake(LEAD)  更新担当者内部ｺｰﾄﾞのｾｯﾄ
//* 2008/03/17  HIS0077 T.Seki(PRIME)	部門(ｾｸﾞﾒﾝﾄ)の検索EXPの表示が正しくない不具合を修正
//*	2008/07/14	HIS0078	S.Saito(MSS)	TreeViewからの消費税情報が表示されない不具合
//* 2008/08/26  HIS0079 M.Nishioka(PRIME)  「標準設定に従う」を追加
//* 2008/09/01  <DKAI>  E.Nanba(Lab)    名称に改行が入らないようにする
//*	2008/09/09	HIS0080	S.Saito(MSS)	初回TreeViewクリック時ツールバーの設定がうまく言ってない不具合回避
//*				HIS0081	S.Saito(MSS)	HIS0079の修正を次リリースで出さないため一時元に戻す
//*				HIS0082	S.Saito(MSS)	登録時の未登録エラーなどの不具合修正
//*				HIS0083	S.Saito(MSS)	HIS0079の復活
//* 2009/10/13	HIS0084	Y.Yoshizawa(MJS)GWF-0149対応（一覧画面で更新するとBusDicKbnが0で更新される件の修正）
//* 2009/11/30  HIS0085 T.Ogawa(RIT)    固定摘要を削除してもTekiTreeから消えない不具合修正
//* 2009/11/30  FUKKYU  T.Ogawa(RIT)    Ctrl+Shift+HomeでTekiTreeに残っている不要な固定摘要を削除出来るようにする
//* 2010/04/23  HIS0086 Y.Yoshizawa(MJS)プロジェクト採用が(2：任意入力)の場合に仕訳情報補助グリッドに登録できない件の対応（JNTCRP020000EDB.incのみ）
//================================== ver4.00 ===================================
//* 2010/05/21  HIS0087 T.Ogawa(RIT)    MLBplLoader対応(LoadPackageの置き換え)
//
//================================== ver4.01 ===================================
//* 2010/07/15  HIS0088 T.Ogawa(RIT)    部署伝票辞書区分(TekiMA.BusDicKbn)はチェックボックスで更新できるように修正
//* 2010/07/22  HIS0089 T.Ogawa(RIT)    仕訳情報グリッドに選択した同一コード部門が反映されない不具合対応
//
//================================== ver4.02 ===================================
//* 2010/10/04  HIS0090 Y.Kuroda        仕訳辞書摘要登録ﾘｽﾄの印刷ﾌﾟﾚﾋﾞｭｰで科目別補助の名称が表示されない不具合対応
//* 2010/10/04  HIS0091 Y.Kuroda        仕訳辞書摘要登録ﾘｽﾄのカラムがずれて出力されている不具合修正
//
//================================== ver4.03 ===================================
//* 2010/11/02  HIS0092 S.Otahara(MSI)  「部署伝票の辞書として使用する」にチェックが無くとも、貸借科目の登録があれば、印刷およびファイル出力にて出力するように修正
//*                                     また、その有無も分かるように、部署伝票辞書の項目を追加
//*                                     摘要残高管理の有無が印刷内容からだと分かり難いため、その表示内容を変更
//
//================================== ver4.05 ===================================
//* 2011/04/28  HIS0093 Y.Yoshizawa(MJS) 部署伝票辞書を登録した固定摘要を選択して「詳細」から「一覧」に遷移して終了すると
//*                                      終了時に更新処理が実行され部署伝票辞書の登録内容がクリアされる件を修正
//
//================================== ver4.06 ===================================
//* 2011/05/17  HIS0094 S.Otahara(MSI)	科目の採用が共通部門または共通ｾｸﾞﾒﾝﾄの場合、部門またはｾｸﾞﾒﾝﾄの登録ができない不具合を修正
//*             HIS0095 S.Otahara(MSI)  「fnGetBumonNameのSQL」、「GetCommonSectionのｾｸﾞﾒﾝﾄｺｰﾄﾞと名称が取れない」の２つの不具合も合わせて修正
//*             HIS0096 S.Otahara(MSI)  貸借科目の採用の判断は「nClassCode」ではなく「nUseKbn」でするように修正。「nClassCode」は科目の属性(B/S or P/L)を持つように修正。
//================================== ver4.08/5.01 ===================================
//* 2011/10/24  HIS0097 T.Ogawa(LEAD)	勘定科目コード入力欄で不正コードでEnterキー押下でも次へ進めてしまう不具合対応
//*             HIS0098 T.Ogawa(LEAD)	グリッドの補助コードが不正でも先へ進めないようにガードをかける対応
//* 2012/01/24  HIS0099 T.Ogawa(LEAD)   固定摘要体系登録リストのファイル出力は加算先のコードと名称は行毎に出力する対応。
//* 2012/02/01  Shift   T.Ogawa(LEAD)   KeyDataToShiftState ⇒ MJSKeyDataToShiftState
//
//================================== ver4.09/5.02 ===================================
//* 2012/05/28  HIS0100 T.Ogawa(LEAD)   新規登録時は削除ボタン・詳細ボタンは使用不可とする対応
//
//================================== MLX 固定資産 ===================================
//* 2013/01/15  <MLXDEP>K.Iwata(NTC)	MLX固定資産・リース対応
//* 2013/01/25  <MLXDEP-2>K.Yoshida(MJS)削除時に財務・債務のﾁｪｯｸｽﾄｱﾄﾞが流れないように修正
//
//================================== ver4.11/5.04 ===================================
//* 2013/07/11  HIS0101 M.Makino(MJS)   H26消費税率改正対応
//* 2012/10/22  HIS0102 T.Ogawa(LEAD)   科目連想グリッドで連想科目コードが読み込み専用状態のときは、F4キーも押下できなくする。(ML2と同じ挙動)
//* 2012/10/23  HIS0103 T.Ogawa(LEAD)   下記の修正を実施した
//                                      ◆ TreeViewクリック時に「不正な浮動小数点演算命令」と表示される対策
//                                      ◆ グリッドにフォーカスされているとき、Alt+Uで更新した場合、グリッドの挙動がおかしくなる対策
//
//================================== ver5.06 ===================================
//* 2014/06/11  HIS0104 T.Ooshita(3A)   有価証券の消費税コード名称変更
//
//================================== ver5.07 ===================================
//* 2014/09/12  <>      T.Ogawa(LEAD)   コード１６桁拡張(プロパティ修正のみ)
//* 2014/12/05  HIS0105 T.Ogawa(LEAD)   第６種業種対応
//* 2014/12/09  HIS0106 T.Ogawa(LEAD)   仕訳情報グリッドの部門・社員の適用期間終了日の条件を除外する。
//* 2014/12/16  HIS0107 T.Ogawa(LEAD)   仕訳情報グリッドにて検索EXPで選択したときのEnterキーの挙動を修正
//* 2015/02/03  HIS0108 T.Ogawa(LEAD)   仕訳情報の科目を変更後、画面を非表示にしたときデスクトップ側で例外が発生するための対策
//
//================================== ver4.13/5.08 ===================================
//* 2015/03/17  HIS0109 T.Ogawa(LEAD)   旧GaliのVer4.11以前も第６種を出さないようにする
//* 2015/07/10  HIS0110 T.Ogawa(LEAD)   売上科目なのに「80」番台の消費税コードが登録できてしまう不具合対応
//
//================================== ver4.14/5.09 ===================================
//* 2015/09/14  HIS0111 T.Ogawa(LEAD)   仕入で特定の消費税コードの場合、税率「3％」は認めない対応
//* 2015/09/14  HIS0112 T.Ogawa(LEAD)   工種採用時の仕訳辞書グリッド上で操作不能になるための対策
//
//================================== ver1.02/5.13 ===================================
//* 2019/03/04  <#TAX10> T.Komatsu       H31消費税率改正対応

//================================== ver1.07/5.18 ===================================
//* 2021/04/15  HIS0113 D.Sanada         複合勘定は分析コードが非会計であっても分析コードを非会計とはみなさいように修正
//******************************************************************************
(*khattori*)//20030421	摘要登録画面での仕訳辞書登録対応
(*H0001 20030818 khattori 検索EXPで科目を選択した時、消費税の入力が出来ない*)
(*H0002 20030820 khattori syuusei 会社単独廃止対応*)
(*H0003 20030821 khattori syuusei Drag & Drop 対応*)
(*H0004 20031127 khattori syuusei 可変は２つまでー＞可変は４つまで*)
(*H0004 20031222 khattori syuusei 分類に摘要を詳細登録で追加した時、その分類の子供にならない*)
(*H0005 20031224 khattori syuusei 科目連想リスト・摘要順に消費税コードを追加*)
(*H0006 20031225 khattori syuusei 摘要残管理有無の更新は、詳細画面で摘要残管理有無を変更した時だけにする*)
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
(*H0008 20040901 khattori syuusei 工種入力対応*)

{$DEFINE TaxRateInfo_JNT}       //<#TAX10> ADD

unit JNTCRP020000u;

interface

uses
    JNTCommonu,
    JNTMasComu,
    JNTSelGlobal,
    JNTMasWndIFu,
    JNTFuncU,
    Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
    VCL.ExtCtrls, MJSPanel, ComCtrls, dxTL, dxDBGrid, dxCntner,  VCL.ImgList, Commctrl,
    VCL.StdCtrls,Db, dxmdaset, Buttons, dxGrClms,FireDAC.Comp.Client,Menus,daDatMod,ToolWin,

    MJSComboBox,
    MJSGroupBox,
    MJSLabel,
    MJSPageControl,
    MJSFunctionBar,
    MJSSpeedButton,
    MJSSPFunctionBar,
    MJSEdits,
    MJSTab,
    MjsDBModuleu,
    MJSQuery,
    MJSStatusBar,
    MJSCheckBox,
    MJSBitBtn,
    MjsDispCtrl,
    MJSCommonu,
    MjsMsgStdu,
    MjsPreviewIFu,
    MjsPrnDlgu,
    MjsPrnSupportu,

  ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppCache, ppDBPipe,

  ppModule,
  ppDBJIT,
  SeriesCheckU,//<MLXDEP>

  JNTSelCorpSys,JNTExPGlobal,JNTPDlg,{<PRN>}

  MJSStrCtrl,	// <HIS0052> ADD

  JNTCRP020101u, MJSToolBar
  //<HIS0031>MasMailEntu,
  ,MLBplLoaderU //<HIS0087> ADD
  ,MJSKeyDataState  //<Shift> ADD
  ,Variants, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, ppDesignLayer, ppParameter,
  FireDAC.Comp.DataSet, System.ImageList
  ;

  const
    BOOLSTRING : array[Boolean] of String = ('False', 'True');  //*Log*
	WM_ONPAINT	= WM_APP + 1;	//OnPaint 時の処理起動メッセージ用
	WM_SHOW_MESSAGE	= WM_APP + 2;	//メッセージ起動用

// <HIS0053> MOD start
(*
    //<HIS0043><HIS0044>
    C_TOUROKU   = 0;
    C_KMKRENSO  = 1;
    C_TEKIRENSO = 2;
    //<HIS0043><HIS0044>
    C_SWDICTEKI = 3;	// 仕訳辞書摘要登録ﾘｽﾄ<HIS0052>

    C_ICHIRAN   = 5;    //<HIS0046>
    C_TAIKEI    = 2;    //<HIS0047>
    C_BUNRUI    = 1;    //<HIS0048>
*)
    C_TOUROKU   = 0; 	// 固定摘要登録ﾘｽﾄ
    C_SWDICTEKI = 1;	// 仕訳辞書摘要登録ﾘｽﾄ
    C_BUNRUI    = 2;	// 固定摘要分類登録ﾘｽﾄ
    C_TAIKEI    = 3;	// 固定摘要体系登録ﾘｽﾄ
    C_KMKRENSO  = 4;	// 科目連想ﾘｽﾄ(科目順)
    C_TEKIRENSO = 5;	// 科目連想ﾘｽﾄ(摘要順)
    C_ICHIRAN   = 6;	// 固定摘要一覧表
// <HIS0053> MOD end

    C_KANASU    = 43;   //<HIS0046>

{$I JNTConst.inc}               // HIS0049
type
	TreeViewRec	  = Record
					nDivision: Byte;
					nExCode  : Integer;
					strName  : String;
end;

type
	TreeViewRec2  = Record
					nExCode: Integer;
					strName: String;
end;

type
	TagInfo		  = Record
					fChecked  : Boolean;
					strComment: String;
end;

type
// <HIS0052> ADD start
	TRecDicPrint  = Record								// 仕訳辞書印刷用
					iMasterKbn		: Integer;			// ﾏｽﾀ区分
					iAttr			: Integer;			// 属性
					iDigit			: Integer;			// 桁数
					strCode			: String;			// 外部ｺｰﾄﾞ
					strName			: String;			// 名称
	end;

	TAryDicPrint = array[0..40] of TRecDicPrint;

	TRecMaster	  = Record								// 仕訳辞書の補助情報
    				iMasterKbn		: Integer;			// ﾏｽﾀ区分
					iKbn			: Integer;			// 区分(0:基準 1:可変科目 2:当該科目)
					strGCode		: String;			// 外部ｺｰﾄﾞ
					exNCode			: Extended;			// 内部ｺｰﾄﾞ
    end;
// <HIS0052> ADD end

// <HIS0052> MOD start
(*	MasterData	  = Record
					nSumDivision	: Integer;			// 摘要/分類区分
					nExCodeParent	: Integer;			// 摘要(分類)ｺｰﾄﾞ(親)
					nExCode			: Integer;			// 摘要(分類)ｺｰﾄﾞ
					strAssociation	: String;			// 連想
					strName			: String;			// 摘要文字列
					fDetails		: Boolean;			// 詳細更新区分
					nDealDivision	: Integer;			// 取引先区分
					nDealClass		: Integer;			// 取引先分類
					nSDicDivision	: Integer;			// 仕訳辞書摘要区分
					nExCodeK1Deb	: Integer;			// 仕訳情報(借方): 科目ｺｰﾄﾞ
					nExCodeK2Deb	: String;			//				 : 細目科目ｺｰﾄﾞ
					strExCodeBUDeb	: String;			//				 : 部門ｺｰﾄﾞ
					strExCodeSGDeb	: String;			//				 : ｾｸﾞﾒﾝﾄｺｰﾄﾞ
					strExCodeH1Deb	: String;			//				 : 第1補助ｺｰﾄﾞ
					strExCodeH2Deb	: String;			//				 : 第2補助ｺｰﾄﾞ
					strExCodeKODeb	: String;			//				 : 工事ｺｰﾄﾞ
					strExCodeKSDeb	: String;			//				 : 工種ｺｰﾄﾞ
					nExCodeK1Cre	: Integer;			// 仕訳情報(貸方): 科目ｺｰﾄﾞ
					nExCodeK2Cre	: String;			//				 : 細目科目ｺｰﾄﾞ
					strExCodeBUCre	: String;			//				 : 部門ｺｰﾄﾞ
					strExCodeSGCre	: String;			//				 : ｾｸﾞﾒﾝﾄｺｰﾄﾞ
					strExCodeH1Cre	: String;			//				 : 第1補助ｺｰﾄﾞ
					strExCodeH2Cre	: String;			//				 : 第2補助ｺｰﾄﾞ
					strExCodeKOCre	: String;			//				 : 工事ｺｰﾄﾞ
					strExCodeKSCre	: String;			//				 : 工種ｺｰﾄﾞ
					nTaxDivision	: Integer;			// 消費税関係	 : 売上/仕入区分
					nTaxCode		: Integer;			//				 : 消費税ｺｰﾄﾞ
					nTaxRate		: Integer;			//				 : 消費税率
					nTypeCode		: Integer;			//				 : 業種ｺｰﾄﾞ
end;
*)
	MasterData	  = Record
					nSumDivision	: Integer;			// 摘要/分類区分
					nExCodeParent	: Integer;			// 摘要(分類)ｺｰﾄﾞ(親)
					nExCode			: Integer;			// 摘要(分類)ｺｰﾄﾞ
					strAssociation	: String;			// 連想
					strName			: String;			// 摘要文字列
					fDetails		: Boolean;			// 詳細更新区分
					nDealDivision	: Integer;			// 取引先区分
					nDealClass		: Integer;			// 取引先分類
					nSDicDivision	: Integer;			// 仕訳辞書摘要区分
					nExCodeK1Deb	: Integer;			// 仕訳情報(借方): 科目ｺｰﾄﾞ
					nExCodeK1Cre	: Integer;			// 仕訳情報(貸方): 科目ｺｰﾄﾞ
                    									// 				   借方補助
                    aryDHojyo		: array [0..40] of TRecMaster;
                    									// 				   貸方補助
                    aryCHojyo		: array [0..40] of TRecMaster;
					nTaxDivision	: Integer;			// 消費税関係	 : 売上/仕入区分
					nTaxCode		: Integer;			//				 : 消費税ｺｰﾄﾞ
					nTaxRate		: Integer;			//				 : 消費税率
					nTypeCode		: Integer;			//				 : 業種ｺｰﾄﾞ
end;

// <HIS0052> MOD end

type
	AdoptInfo	  = Record
					nMasterDivision	: Integer;			// ﾏｽﾀ区分
					nAdoption		: Integer;			// 採用区分
					strDescription	: String;			// 名称
					nCodeDigit		: Integer;			// ｺｰﾄﾞ桁数
					nCodeAttribute	: Integer;			// ｺｰﾄﾞ属性
end;

type
	CodeAttribute = Record
					nMasterDivision	: Integer;
					strCaption		: String;
					nDigit			: Integer;
					nAttribute		: Integer;
					nClassCode		: Integer;			// 科目の属性[0:B/S, 1:P/L]     //<HIS0096>ｺﾒﾝﾄ修正 （旧→部門分類ｺｰﾄﾞ (部門のみ)）
                    nUseKbn         : Integer;          // 貸借科目の採用の判断[0:採用なし, 1:採用あり, 2:採用あり(共通)] <HIS0096>
					fEnabled		: Boolean;
                    fKousyu			: Boolean;			// 工事/ﾌﾟﾛｼﾞｪｸﾄの工種/ｻﾌﾞ採用有無<HIS0052> ADD
end;

type
	AssSubjects	  = Record
					nExCode			: Integer;
					nCtrlDivision	: Integer;
end;

type
	//========================================================
	//  TaxItems
	//========================================================
	TaxItems = record				//
		sWord	:	String;			//	文言
		iRate	:	Integer;		//	税率
		iType	:	Integer;		//	業種
	end;

//--- HIS0028 St -----
//	検索情報 構造体
type
	SearchInfoRec = Record
		iTekiCD	:	Integer;		// 検索摘要
        iSumKbn :   Integer;        // 実在・合計区分
		iItem	:	Integer;		// 検索するItemの位置
		iStItem	:	Integer;		// 最初に一致したItemNo
		bFstFlg	:	Boolean;		// 初回判定ﾌﾗｸﾞ
end;
//--- HIS0028 Ed -----

type
	EdtCompSet	  = Record
		typ		:	integer;
		Cmb		:	TMComboBox;
		Num		:	TMNumEdit;
		Fre		:	TMTxtEdit;
		Dsc		:	TMLabel;
end;
//<HIS0105> ADD St
type
    TTypeCode = record
        MinCode : Integer;
        MaxCode : Integer;
end;
//<HIS0105> ADD Ed
type
{$i ActionInterface.inc}
{$i JNTMASFUSENBIKODLGIFH.inc}
{$i JNTMASWND_ColorDef.inc}
{$i JNTMasWndIF2_H.inc}

(*H0002 20030820 khattori syuusei 会社単独廃止対応*)
{$I JNTMASExceptIFI.inc}
{$I JNTMASExceptIFH.inc}
{$I JNTMASSEARCHDLGIFH.inc}		// 検索DLG		//HIS0028
{$include JNTSelPrtIF.inc}              		// <PRN>
{$I JNTCRPSyncMasterH.inc}        				// <SYNC> ﾏｽﾀ同期共通ﾍｯﾀﾞ部
{$I JNTSyncMasterIFH.inc}   					// <HIS0065> 配信ﾀﾞｲｱﾛｸﾞ共通ﾍｯﾀﾞ部
{$I MASTaxRateInfoH.inc}						// <HIS0101> 税率情報クラス
//{$I Log_Writer_1.inc}  //*Log*

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

  	TJNTCRP020000f = class(TForm)

	DPrintdxMemData1: TdxMemData;
	DPrintdxMemData2: TdxMemData;
	DPrintdxMemData3: TdxMemData;
	DPrintdxMemData4: TdxMemData;
	DPrintdxMemData5: TdxMemData;
	DPrintdxMemData6: TdxMemData;
	DPrintdxMemData7: TdxMemData;

	DPrintDBPipeline1: TppDBPipeline;
	DPrintDBPipeline2: TppDBPipeline;
	DPrintDBPipeline3: TppDBPipeline;
	DPrintDBPipeline4: TppDBPipeline;
	DPrintDBPipeline5: TppDBPipeline;
	DPrintDBPipeline6: TppDBPipeline;
	DPrintDBPipeline7: TppDBPipeline;

	DPrintDataSource1: TDataSource;
	DPrintDataSource2: TDataSource;
	DPrintDataSource3: TDataSource;
	DPrintDataSource4: TDataSource;
	DPrintDataSource5: TDataSource;
	DPrintDataSource6: TDataSource;
	DPrintDataSource7: TDataSource;

	RReport1: TppReport;
	RReport2: TppReport;
	RReport3: TppReport;
	RReport4: TppReport;
	RReport5: TppReport;
	RReport6: TppReport;
	RReport7: TppReport;

	LCorpCode1: TppLabel;
	LCorpCode2: TppLabel;
	LCorpCode3: TppLabel;
	LCorpCode4: TppLabel;
	LCorpCode5: TppLabel;
	LCorpCode6: TppLabel;

	LCorpName1: TppLabel;
	LCorpName2: TppLabel;
	LCorpName3: TppLabel;
	LCorpName4: TppLabel;
	LCorpName5: TppLabel;
	LCorpName6: TppLabel;

	ppHeaderBand1: TppHeaderBand;
	ppHeaderBand2: TppHeaderBand;
	ppHeaderBand3: TppHeaderBand;
	ppHeaderBand6: TppHeaderBand;
	ppHeaderBand8: TppHeaderBand;
	ppHeaderBand9: TppHeaderBand;
	ppHeaderBand10: TppHeaderBand;
	ppHeaderBand12: TppHeaderBand;

	ppFooterBand1: TppFooterBand;
	ppFooterBand2: TppFooterBand;
	ppFooterBand3: TppFooterBand;
	ppFooterBand6: TppFooterBand;
	ppFooterBand8: TppFooterBand;
	ppFooterBand9: TppFooterBand;
	ppFooterBand10: TppFooterBand;
	ppFooterBand12: TppFooterBand;

	ppColumnHeaderBand1: TppColumnHeaderBand;
	ppColumnHeaderBand2: TppColumnHeaderBand;
	ppColumnHeaderBand3: TppColumnHeaderBand;
	ppColumnHeaderBand4: TppColumnHeaderBand;
	ppColumnHeaderBand5: TppColumnHeaderBand;
	ppColumnHeaderBand6: TppColumnHeaderBand;
	ppColumnHeaderBand7: TppColumnHeaderBand;

	ppColumnFooterBand1: TppColumnFooterBand;
	ppColumnFooterBand2: TppColumnFooterBand;
	ppColumnFooterBand3: TppColumnFooterBand;
	ppColumnFooterBand4: TppColumnFooterBand;
	ppColumnFooterBand5: TppColumnFooterBand;
	ppColumnFooterBand6: TppColumnFooterBand;

	ppLine1: TppLine;
	ppLine2: TppLine;
	ppLine3: TppLine;
	ppLine4: TppLine;
	ppLine5: TppLine;
	ppLine6: TppLine;
	ppLine7: TppLine;
	ppLine8: TppLine;
	ppLine9: TppLine;
	ppLine10: TppLine;
	ppLine11: TppLine;
	ppLine12: TppLine;
	ppLine13: TppLine;
	ppLine14: TppLine;
	ppLine15: TppLine;
	ppLine16: TppLine;
	ppLine17: TppLine;
	ppLine18: TppLine;
	ppLine19: TppLine;
	ppLine20: TppLine;
	ppLine21: TppLine;
	ppLine22: TppLine;
	ppLine23: TppLine;
	ppLine24: TppLine;
	ppLine25: TppLine;
	ppLine26: TppLine;
	ppLine27: TppLine;
	ppLine28: TppLine;
	ppLine29: TppLine;
	ppLine30: TppLine;
	ppLine31: TppLine;
	ppLine32: TppLine;
	ppLine33: TppLine;
	ppLine34: TppLine;
	ppLine35: TppLine;
	ppLine36: TppLine;
	ppLine37: TppLine;
	ppLine38: TppLine;
	ppLine39: TppLine;
	ppLine40: TppLine;
	ppLine41: TppLine;
	ppLine42: TppLine;
	ppLine43: TppLine;
	ppLine44: TppLine;
	ppLine45: TppLine;
	ppLine46: TppLine;
	ppLine47: TppLine;
	ppLine48: TppLine;
	ppLine49: TppLine;
	ppLine50: TppLine;
	ppLine51: TppLine;
	ppLine52: TppLine;
	ppLine53: TppLine;
	ppLine54: TppLine;
	ppLine55: TppLine;
	ppLine56: TppLine;
	ppLine57: TppLine;
	ppLine58: TppLine;
	ppLine59: TppLine;
	ppLine60: TppLine;
	ppLine61: TppLine;
	ppLine62: TppLine;
	ppLine63: TppLine;
	ppLine64: TppLine;
	ppLine65: TppLine;
	ppLine75: TppLine;
	ppLine76: TppLine;
	ppLine77: TppLine;
	ppLine78: TppLine;
	ppLine79: TppLine;
	ppLine80: TppLine;
	ppLine82: TppLine;
	ppLine93: TppLine;
	ppLine94: TppLine;
	ppLine95: TppLine;
	ppLine96: TppLine;
	ppLine97: TppLine;
	ppLine98: TppLine;
	ppLine99: TppLine;
	ppLine100: TppLine;
	ppLine101: TppLine;
	ppLine102: TppLine;
	ppLine103: TppLine;
	ppLine104: TppLine;
	ppLine105: TppLine;
	ppLine106: TppLine;
	ppLine107: TppLine;
	ppLine114: TppLine;
	ppLine115: TppLine;
	ppLine117: TppLine;
	ppLine119: TppLine;
	ppLine120: TppLine;
	ppLine121: TppLine;
	ppLine122: TppLine;
	ppLine124: TppLine;
	ppLine125: TppLine;
	ppLine126: TppLine;
	ppLine129: TppLine;
	ppLine130: TppLine;
	ppLine131: TppLine;
	ppLine132: TppLine;
	ppLine133: TppLine;
	ppLine135: TppLine;
	ppLine148: TppLine;
	ppLine149: TppLine;
	ppLine150: TppLine;
	ppLine151: TppLine;
	ppLine154: TppLine;
	ppLine155: TppLine;
	ppLine156: TppLine;
	ppLine157: TppLine;
	ppLine158: TppLine;
	ppLine159: TppLine;
	ppLine160: TppLine;
	ppLine161: TppLine;
	ppLine162: TppLine;
	ppLine174: TppLine;
	ppLine176: TppLine;
	ppLine177: TppLine;
	ppLine178: TppLine;
	ppLine179: TppLine;
	ppLine180: TppLine;
	ppLine181: TppLine;
	ppLine182: TppLine;
	ppLine183: TppLine;

	ppLabel1: TppLabel;
	ppLabel2: TppLabel;
	ppLabel3: TppLabel;
	ppLabel4: TppLabel;
	ppLabel5: TppLabel;
	ppLabel6: TppLabel;
	ppLabel7: TppLabel;
	ppLabel8: TppLabel;
	ppLabel9: TppLabel;
	ppLabel10: TppLabel;
	ppLabel12: TppLabel;
	ppLabel13: TppLabel;
	ppLabel14: TppLabel;
	ppLabel15: TppLabel;
	ppLabel16: TppLabel;
	ppLabel17: TppLabel;
	ppLabel18: TppLabel;
	ppLabel19: TppLabel;
	ppLabel20: TppLabel;
	ppLabel21: TppLabel;
	ppLabel54: TppLabel;
	ppLabel58: TppLabel;
	ppLabel59: TppLabel;
	ppLabel60: TppLabel;
	ppLabel61: TppLabel;
	ppLabel67: TppLabel;
	ppLabel68: TppLabel;
	ppLabel69: TppLabel;
	ppLabel70: TppLabel;
	ppLabel71: TppLabel;
	ppLabel72: TppLabel;
	ppLabel73: TppLabel;
	ppLabel74: TppLabel;
	ppLabel76: TppLabel;
	ppLabel77: TppLabel;
	ppLabel78: TppLabel;
	ppLabel79: TppLabel;
	ppLabel80: TppLabel;
	ppLabel81: TppLabel;
	ppLabel83: TppLabel;
	ppLabel89: TppLabel;
	ppLabel90: TppLabel;
	ppLabel91: TppLabel;
	ppLabel107: TppLabel;
	ppLabel108: TppLabel;
	ppLabel109: TppLabel;
	ppLabel110: TppLabel;
	ppLabel119: TppLabel;
	ppLabel123: TppLabel;
	ppLabel124: TppLabel;
	ppLabel125: TppLabel;
	ppLabel126: TppLabel;

	ppDBText1: TppDBText;
	ppDBText2: TppDBText;
	ppDBText7: TppDBText;
	ppDBText8: TppDBText;
	ppDBText9: TppDBText;
	ppDBText10: TppDBText;
	ppDBText11: TppDBText;
	ppDBText12: TppDBText;
	ppDBText13: TppDBText;
	ppDBText14: TppDBText;
	ppDBText15: TppDBText;
	ppDBText16: TppDBText;
	ppDBText17: TppDBText;
	ppDBText67: TppDBText;
	ppDBText68: TppDBText;
	ppDBText69: TppDBText;
	ppDBText70: TppDBText;
	ppDBText75: TppDBText;
	ppDBText76: TppDBText;
	ppDBText77: TppDBText;
	ppDBText78: TppDBText;
	ppDBText79: TppDBText;
	ppDBText80: TppDBText;
	ppDBText83: TppDBText;
	ppDBText84: TppDBText;
	ppDBText85: TppDBText;
	ppDBText86: TppDBText;
	ppDBText87: TppDBText;
	ppDBText88: TppDBText;
	ppDBText89: TppDBText;
	ppDBText90: TppDBText;
	ppDBText91: TppDBText;
	ppDBText92: TppDBText;
	ppDBText94: TppDBText;
	ppDBText95: TppDBText;
	ppDBText96: TppDBText;
	ppDBText97: TppDBText;
	ppDBText98: TppDBText;
	ppDBText99: TppDBText;
	ppDBText100: TppDBText;
	ppDBText101: TppDBText;
	ppDBText104: TppDBText;
	ppDBText105: TppDBText;
	ppDBText108: TppDBText;
	ppDBText109: TppDBText;
	ppDBText110: TppDBText;
	ppDBText111: TppDBText;
	ppDBText114: TppDBText;
	ppDBText115: TppDBText;
	ppDBText116: TppDBText;
	ppDBText117: TppDBText;
	ppDBText120: TppDBText;
	ppDBText121: TppDBText;
	ppDBText122: TppDBText;
	ppDBText123: TppDBText;
	ppDBText128: TppDBText;
	ppDBText129: TppDBText;
	ppDBText130: TppDBText;
	ppDBText131: TppDBText;

	ppDBImage1: TppDBImage;
	PFuterLine: TppLine;

	PLienST: TppLine;

	LppCorpCode: TppLabel;
	LppCorpName: TppLabel;

	SVppPage: TppSystemVariable;
	SVppPage1: TppSystemVariable;
	SVppPage2: TppSystemVariable;
	SVppPage3: TppSystemVariable;
	SVppPage4: TppSystemVariable;
	SVppPage5: TppSystemVariable;
	SVppPage6: TppSystemVariable;

	SVppDate: TppSystemVariable;
	SVppData1: TppSystemVariable;
	SVppDate2: TppSystemVariable;
	SVppDate3: TppSystemVariable;
	SVppDate4: TppSystemVariable;
	SVppDate5: TppSystemVariable;
	SVppDate6: TppSystemVariable;

	LppAccOffice: TppLabel;

	LAccOffice1: TppLabel;
	LAccOffice2: TppLabel;
	LAccOffice3: TppLabel;
	LAccOffice4: TppLabel;
	LAccOffice5: TppLabel;
	LAccOffice6: TppLabel;

	PLineKT: TppLine;
	PLineKR: TppLine;
	PLine1KB: TppLine;

	PDetailBandKR: TppDetailBand;
	PDetailBand: TppDetailBand;
	PDetailBandKT: TppDetailBand;
	PDetailBandM: TppDetailBand;
	PDetailBandST: TppDetailBand;
	PDetailBandKB: TppDetailBand;

	SDetailBand: TppDetailBand;
	ppDetailBand_CmnReportSystem: TppDetailBand;

	MStatusBar1  : TMStatusBar;

	DPrintdxMemData1Gcode: TIntegerField;
	DPrintdxMemData1TekiChar: TStringField;
	DPrintdxMemData1RenChar: TStringField;
	DPrintdxMemData1StaxKbn: TStringField;
	DPrintdxMemData1StaxCode: TIntegerField;
	DPrintdxMemData1StaxRate: TStringField;
	DPrintdxMemData1TypeCode: TStringField;
	DPrintdxMemData1ZanKbn: TStringField;
	DPrintdxMemData1ExgKbn: TStringField;
	DPrintdxMemData1BunCode: TStringField;
	DPrintdxMemData1UpdateTime: TDateTimeField;
	DPrintdxMemData1Fusen: TGraphicField;

	DPrintdxMemData2Gcode: TIntegerField;
	DPrintdxMemData2TekiChar: TStringField;
	DPrintdxMemData2RenChar: TStringField;
	DPrintdxMemData2Staxcode: TIntegerField;
	DPrintdxMemData2UpDateTime: TDateTimeField;

	DPrintdxMemData2DKmkCode: TIntegerField;
    DPrintdxMemData2DHoj1Code: TStringField;
	DPrintdxMemData2DHojyo1Name: TStringField;

	DPrintdxMemData2CKmkCode: TIntegerField;
	DPrintdxMemData2CHojyo1Code: TStringField;

	DPrintdxMemData2CKmkName: TStringField;
	DPrintdxMemData2CHojyo1Name: TStringField;

	DPrintdxMemData2StaxKbn: TStringField;
	DPrintdxMemData2StaxRate: TStringField;
	DPrintdxMemData2TypeCode: TStringField;
	DPrintdxMemData2ZanKbn: TStringField;
	DPrintdxMemData2Fusen: TGraphicField;

	DPrintdxMemData3Gcode: TIntegerField;
	DPrintdxMemData3TekiChar: TStringField;
	DPrintdxMemData3RenChar: TStringField;
	DPrintdxMemData3UpDateTime: TDateTimeField;

	DPrintdxMemData4Gcode: TIntegerField;
	DPrintdxMemData4BunName: TStringField;
	DPrintdxMemData4GcodeT: TIntegerField;
	DPrintdxMemData4TekiChar: TStringField;

	DPrintdxMemData5KGcodeC: TStringField;
	DPrintdxMemData5KTekiCharN: TStringField;
	DPrintdxMemData5MGcodec: TStringField;
	DPrintdxMemData5MTekiCharN: TStringField;
	DPrintdxMemData5TRenChar: TStringField;
	DPrintdxMemData5RenChar: TStringField;

	DPrintdxMemData6TekiCode: TIntegerField;
	DPrintdxMemData6TRenChar: TStringField;
	DPrintdxMemData6TekiChar: TStringField;
    DPrintdxMemData6TaxCode: TStringField;
	DPrintdxMemData6Kmkcode: TIntegerField;
	DPrintdxMemData6RenChar: TStringField;
	DPrintdxMemData6SimpleName: TStringField;

	P_Tree1Panel: TMPanel;
	ComInstructionBar: TMPanel;

	CmnSplitter: TSplitter;
	CmnComboBoxInstruction: TMComboBox;
	CmnImageGeneral: TImageList;

	MPanel2: TMPanel;
	MLabel27: TMLabel;

	DtlCmnClientPanel: TMPanel;
	DtlCmnTab: TMTab;

	DtlCmnButtonUpdate: TMBitBtn;
	DtlCmnButtonCancel: TMBitBtn;
	DtlCmnScrollBox: TScrollBox;

	DtlCmnPopupMenu: TPopupMenu;
	DtlCmnPopupMenuTagOff: TMenuItem;
	DtlCmnPopupMenuTag01: TMenuItem;
	DtlCmnPopupMenuTag02: TMenuItem;
	DtlCmnPopupMenuTag03: TMenuItem;
	DtlCmnPopupMenuTag04: TMenuItem;

	DtlCmnMemData: TdxMemData;
	DtlCmnMemDataControl: TdxMemData;
	DtlCmnMemDatanCtrlDivision: TSmallintField;
	DtlCmnMemDatanExCode: TIntegerField;
	DtlCmnMemDatastrSubjectDesc: TStringField;
	DtlCmnMemDatastrDivisionDesc: TStringField;
	DtlCmnMemDatanDivisionData: TSmallintField;

	DtlCmnDataSource: TDataSource;

	N1: TMenuItem;
	N2: TMenuItem;
	CmnToolbarDropDownMenu: TPopupMenu;
	CmnToolbarDropDownMenuTag01: TMenuItem;
	CmnToolbarDropDownMenuTag02: TMenuItem;
	CmnToolbarDropDownMenuTag03: TMenuItem;
	CmnToolbarDropDownMenuTag04: TMenuItem;
	CmnToolbarImage: TImageList;

	CmnDataSourcePrintKanaOrder: TDataSource;

	CmnMemDataPrintKanaOrder: TdxMemData;
	CmnMemDataPrintKanaOrderstrDescription: TStringField;
	CmnMemDataPrintKanaOrdernExCode: TIntegerField;

	CmnPanelTreeViewTop: TMPanel;
	CmnPipelinePrintKanaOrder: TppDBPipeline;
	CmnPrintFieldExCode: TppDBText;
	CmnPrintFieldDescription: TppDBText;

	CmnReportSystemLabelTitle: TppLabel;
	CmnReportKanaOrder: TppReport;
	CmnReportKanaOrderLabelCorpCode: TppLabel;
	CmnReportKanaOrderLabelCorpName: TppLabel;
	CmnReportKanaOrderSysVarPage: TppSystemVariable;
	CmnReportKanaOrderDepAccOffice: TppLabel;
	CmnReportKanaOrderSysVarDate: TppSystemVariable;

	CmnTreeView: TTreeView;
	CmnTreeViewImage: TImageList;
	CmnTreeViewPopupMenu: TPopupMenu;
	CmnTreeViewPopupMenuDetail: TMenuItem;
	CmnTreeViewPopupMenuCopy: TMenuItem;
	CmnTreeViewPopupMenuPaste: TMenuItem;
	CmnTreeViewPopupMenuDelete: TMenuItem;
	CmnTreeViewPopupMenuErase: TMenuItem;
	CmnTreeViewPopupMenuEx: TPopupMenu;
	CmnTreeViewPopupMenuExErase: TMenuItem;
	CmnTreeViewPopupMenuTagOff: TMenuItem;
	CmnTreeViewPopupMenuTagComment: TMenuItem;

	CmnTreeViewPopupMenuBreak01: TMenuItem;
	CmnTreeViewPopupMenuBreak02: TMenuItem;
	CmnTreeViewPopupMenuBreak03: TMenuItem;
	CmnTreeViewPopupMenuTag01: TMenuItem;
	CmnTreeViewPopupMenuTag03: TMenuItem;
	CmnTreeViewPopupMenuTag02: TMenuItem;
	CmnTreeViewPopupMenuTag04: TMenuItem;
	CmnTreeViewPopupMenuItemTag01: TMenuItem;
	CmnTreeViewPopupMenuItemTag02: TMenuItem;
	CmnTreeViewPopupMenuItemTag03: TMenuItem;
	CmnTreeViewPopupMenuItemTag04: TMenuItem;
	CmnTreeViewPopupMenuItemTag01Ex: TMenuItem;
	CmnTreeViewPopupMenuItemTag02Ex: TMenuItem;
	CmnTreeViewPopupMenuItemTag03Ex: TMenuItem;
	CmnTreeViewPopupMenuItemTag04Ex: TMenuItem;

	MenuItem2: TMenuItem;

	StdCmnTab: TMTab;

	StdCmnClientPanel: TMPanel;
	StdCmnClientPanelTotal: TMPanel;
	StdCmnClientPanelExist: TMPanel;

	StdCmnDataSourceExist: TDataSource;
	StdCmnDataSourceTotal: TDataSource;

	StdCmnMemDataExist: TdxMemData;
	StdCmnMemDataExistgrTag: TGraphicField;
	StdCmnMemDataExistName: TStringField;
	StdCmnMemDataExistnExCode: TIntegerField;
	StdCmnMemDataExiststrComment: TStringField;
	StdCmnMemDataExistAssociation: TStringField;

	StdCmnMemDataTotal: TdxMemData;
	StdCmnMemDataTotalName: TStringField;
	StdCmnMemDataTotalnExCode: TIntegerField;
	StdCmnMemDataTotalAssociation: TStringField;

	StdCmnGridExist: TdxDBGrid;
	StdCmnGridExistTag: TdxDBGridGraphicColumn;
	StdCmnGridExistName: TdxDBGridColumn;
	StdCmnGridExistCode: TdxDBGridColumn;
	StdCmnGridExistComment: TdxDBGridColumn;
	StdCmnGridExistAssociation: TdxDBGridColumn;

	StdCmnGridTotal: TdxDBGrid;
	StdCmnGridTotalName: TdxDBGridColumn;
	StdCmnGridTotalCode: TdxDBGridColumn;
	StdCmnGridTotalAssociation: TdxDBGridColumn;

	StdCmnGridPopupMenu: TPopupMenu;
	StdCmnGridPopupMenuTagOff: TMenuItem;
	StdCmnGridPopupMenuTag01: TMenuItem;
	StdCmnGridPopupMenuTag03: TMenuItem;
	StdCmnGridPopupMenuTag02: TMenuItem;
	StdCmnGridPopupMenuTag04: TMenuItem;
	StdCmnGridPopupMenuTagComment: TMenuItem;

	StdCmnGridPopupMenuItemTag01: TMenuItem;
	StdCmnGridPopupMenuItemTag02: TMenuItem;
	StdCmnGridPopupMenuItemTag03: TMenuItem;
	StdCmnGridPopupMenuItemTag04: TMenuItem;

	StdCmnGridPopupMenuItemTag01Ex: TMenuItem;
	StdCmnGridPopupMenuItemTag02Ex: TMenuItem;
	StdCmnGridPopupMenuItemTag03Ex: TMenuItem;
	StdCmnGridPopupMenuItemTag04Ex: TMenuItem;

	IntegerField1: TIntegerField;
	StringField1: TStringField;

	ppName: TppLabel;
	ppLine: TppLine;

	ppPageStyle1: TppPageStyle;

	ppShape1: TppShape;

	PLine: TppLine;

	DPrintdxMemData7TGCode: TIntegerField;
	DPrintdxMemData7TekiChar: TStringField;
	DPrintdxMemData7KGCode: TIntegerField;
	DPrintdxMemData7SimpleName: TStringField;


	FLine: TppLine;
	pTitleName: TppLabel;
	pTitleLine: TppLine;
    PPanelSpeed: TMPanel;
    BSpeedButtonEnd: TMSpeedButton;
    CmnToolbarButtonPrint: TMSpeedButton;
    B_Change: TMSpeedButton;
    CmnToolbarButtonDetail: TMSpeedButton;
    CmnToolbarButtonDelete: TMSpeedButton;
    ImLst: TImageList;
    MToolBar1: TMToolBar;
    CmnToolbarButtonTag: TToolButton;
    DisableImage: TImageList;
    DtlCmnPanelAddition: TMPanel;
    DtlCmnPanelAddition1: TMPanel;
    DtlCmnLbelDealDivisionTitle: TMLabel;
    DtlCmnLbelDealClassTitle: TMLabel;
    DtlCmnLbelDealDivisionDesc: TMLabel;
    DtlCmnLbelDealClassDesc: TMLabel;
    MLabel1: TMLabel;
    MLabel3: TMLabel;
    DtlCmnEditDealDivision: TMNumEdit;
    DtlCmnEditDealClass: TMNumEdit;
    DtlCmnImageTag: TImage;
    DtlCLblExCdTitle: TMLabel;
    DtlCEdtExCd: TMNumEdit;
    DtlCmnPanelAddition3: TMPanel;
    LRen: TMLabel;
    LTeki: TMLabel;
    DtlCmnEditAssociation: TMTxtEdit;
    DtlCmnEditName: TMTxtEdit;
    DtlCmnPanelAddition2: TMPanel;
    DtlCmnLbelGroupComTaxInfo: TMLabel;
    B_Search: TMSpeedButton;
    MSPFunctionBar: TMSPFunctionBar;
    CmnTreeViewPopupMenuTag001: TMenuItem;
    CmnTreeViewPopupMenuTag002: TMenuItem;
    CmnTreeViewPopupMenuTag003: TMenuItem;
    CmnTreeViewPopupMenuTag004: TMenuItem;
    SPMasTeki: TFDStoredProc;
    SPPayTeki: TFDStoredProc;
    MLabel6: TMLabel;
    MLabel7: TMLabel;
    MLabel8: TMLabel;
    MPanel1: TMPanel;
    MPanel3: TMPanel;
    DtlDSwkGrid: TdxDBGrid;
    DtlDSwkGridColumnLookup: TdxDBGridLookupColumn;
    dxDBGridColumnKbn: TdxDBGridColumn;
    dxDBGridColumnKbnName: TdxDBGridMaskColumn;
    DtlDSwkGridColumnCode: TdxDBGridButtonColumn;
    dxDBGridColumnName: TdxDBGridColumn;
    DtlDSwkDataSource: TDataSource;
    DtlDSwkMem: TdxMemData;
    StringField2: TStringField;
    SmallintField1: TSmallintField;
    StringField3: TStringField;
    SmallintField2: TSmallintField;
    DtlDSwkMemstrMaster: TStringField;
    DtlDSwkGridColumnMaster: TdxDBGridColumn;
    DtlSwkKbnList: TdxMemData;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    DtlCSwkDataSource: TDataSource;
    DtlCSwkMem: TdxMemData;
    StringField5: TStringField;
    SmallintField3: TSmallintField;
    StringField6: TStringField;
    SmallintField4: TSmallintField;
    StringField7: TStringField;
    DtlDSwkMemiMasterKbn: TIntegerField;
    DtlCSwkMemiMasterKbn: TIntegerField;
    DtlDSwkMemstrGCode: TStringField;
    DtlCSwkMemstrGCode: TStringField;
    ppColumnFooterBand7: TppColumnFooterBand;
    DtlCSwkGrid: TdxDBGrid;
    dxDBGridColumn1: TdxDBGridColumn;
    DtlCSwkGridColumnLookup: TdxDBGridLookupColumn;
    dxDBGridColumn2: TdxDBGridColumn;
    dxDBGridMaskColumn1: TdxDBGridMaskColumn;
    DtlCSwkGridColumnCode: TdxDBGridButtonColumn;
    dxDBGridColumn3: TdxDBGridColumn;
    DtlDSwkMemiAttr: TIntegerField;
    DtlDSwkMemiDigit: TIntegerField;
    DtlCSwkMemiAttr: TIntegerField;
    DtlCSwkMemiDigit: TIntegerField;
    DtlDSwkGridColumnAttr: TdxDBGridColumn;
    DtlDSwkGridColumn8: TdxDBGridColumn;
    DtlCSwkGridColumnAttr: TdxDBGridColumn;
    DtlCSwkGridColumn8: TdxDBGridColumn;
    DtlDSwkMemexNCode: TFloatField;
    DtlCSwkMemexNCode: TFloatField;
    DMemSwDicTekiCSV: TdxMemData;
    IntegerField2: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    IntegerField4: TIntegerField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    DateTimeField1: TDateTimeField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField17: TStringField;
    DMemSwDicTekiCSVDKmkKbn: TStringField;
    DMemSwDicTekiCSVDKmkName: TStringField;
    DPrintdxMemData2DKmkName: TStringField;
    DMemSwDicTekiCSVDSubKbn: TStringField;
    DMemSwDicTekiCSVDSubCode: TStringField;
    DMemSwDicTekiCSVDSubName: TStringField;
    DMemSwDicTekiCSVDBmnKbn: TStringField;
    DMemSwDicTekiCSVDBmnCode: TStringField;
    DMemSwDicTekiCSVDBmnName: TStringField;
    DMemSwDicTekiCSVDSegKbn1: TStringField;
    DMemSwDicTekiCSVDSegCode1: TStringField;
    DMemSwDicTekiCSVDSegName1: TStringField;
    DMemSwDicTekiCSVDSegKbn2: TStringField;
    DMemSwDicTekiCSVDSegCode2: TStringField;
    DMemSwDicTekiCSVDSegName2: TStringField;
    DMemSwDicTekiCSVDSegKbn3: TStringField;
    DMemSwDicTekiCSVDSegCode3: TStringField;
    DMemSwDicTekiCSVDSegName3: TStringField;
    DMemSwDicTekiCSVDSegKbn4: TStringField;
    DMemSwDicTekiCSVDSegCode4: TStringField;
    DMemSwDicTekiCSVDSegName4: TStringField;
    DMemSwDicTekiCSVDSegKbn5: TStringField;
    DMemSwDicTekiCSVDSegCode5: TStringField;
    DMemSwDicTekiCSVDSegName5: TStringField;
    DMemSwDicTekiCSVDSegKbn6: TStringField;
    DMemSwDicTekiCSVDSegCode6: TStringField;
    DMemSwDicTekiCSVDSegName6: TStringField;
    DMemSwDicTekiCSVDSegKbn7: TStringField;
    DMemSwDicTekiCSVDSegCode7: TStringField;
    DMemSwDicTekiCSVDSegName7: TStringField;
    DMemSwDicTekiCSVDSegKbn8: TStringField;
    DMemSwDicTekiCSVDSegCode8: TStringField;
    DMemSwDicTekiCSVDSegName8: TStringField;
    DMemSwDicTekiCSVDSegKbn9: TStringField;
    DMemSwDicTekiCSVDSegCode9: TStringField;
    DMemSwDicTekiCSVDSegName9: TStringField;
    DMemSwDicTekiCSVDSegKbn10: TStringField;
    DMemSwDicTekiCSVDSegCode10: TStringField;
    DMemSwDicTekiCSVDSegName10: TStringField;
    DMemSwDicTekiCSVDPrjKbn1: TStringField;
    DMemSwDicTekiCSVDPrjCode1: TStringField;
    DMemSwDicTekiCSVDPrjName1: TStringField;
    DMemSwDicTekiCSVDPrjKbn2: TStringField;
    DMemSwDicTekiCSVDPrjCode2: TStringField;
    DMemSwDicTekiCSVDPrjName2: TStringField;
    DMemSwDicTekiCSVDPrjKbn3: TStringField;
    DMemSwDicTekiCSVDPrjCode3: TStringField;
    DMemSwDicTekiCSVDPrjName3: TStringField;
    DMemSwDicTekiCSVDPrjKbn4: TStringField;
    DMemSwDicTekiCSVDPrjCode4: TStringField;
    DMemSwDicTekiCSVDPrjName4: TStringField;
    DMemSwDicTekiCSVDPrjKbn5: TStringField;
    DMemSwDicTekiCSVDPrjCode5: TStringField;
    DMemSwDicTekiCSVDPrjName5: TStringField;
    DMemSwDicTekiCSVDPrjKbn6: TStringField;
    DMemSwDicTekiCSVDPrjCode6: TStringField;
    DMemSwDicTekiCSVDPrjName6: TStringField;
    DMemSwDicTekiCSVDPrjKbn7: TStringField;
    DMemSwDicTekiCSVDPrjCode7: TStringField;
    DMemSwDicTekiCSVDPrjName7: TStringField;
    DMemSwDicTekiCSVDPrjKbn8: TStringField;
    DMemSwDicTekiCSVDPrjCode8: TStringField;
    DMemSwDicTekiCSVDPrjName8: TStringField;
    DMemSwDicTekiCSVDPrjKbn9: TStringField;
    DMemSwDicTekiCSVDPrjCode9: TStringField;
    DMemSwDicTekiCSVDPrjName9: TStringField;
    DMemSwDicTekiCSVDPrjKbn10: TStringField;
    DMemSwDicTekiCSVDPrjCode10: TStringField;
    DMemSwDicTekiCSVDPrjName10: TStringField;
    DMemSwDicTekiCSVDPjSubKbn1: TStringField;
    DMemSwDicTekiCSVDPjSubCode1: TStringField;
    DMemSwDicTekiCSVDPjSubName1: TStringField;
    DMemSwDicTekiCSVDPjSubKbn2: TStringField;
    DMemSwDicTekiCSVDPjSubCode2: TStringField;
    DMemSwDicTekiCSVDPjSubName2: TStringField;
    DMemSwDicTekiCSVDPjSubKbn3: TStringField;
    DMemSwDicTekiCSVDPjSubCode3: TStringField;
    DMemSwDicTekiCSVDPjSubName3: TStringField;
    DMemSwDicTekiCSVDPjSubKbn4: TStringField;
    DMemSwDicTekiCSVDPjSubCode4: TStringField;
    DMemSwDicTekiCSVDPjSubName4: TStringField;
    DMemSwDicTekiCSVDPjSubKbn5: TStringField;
    DMemSwDicTekiCSVDPjSubCode5: TStringField;
    DMemSwDicTekiCSVDPjSubName5: TStringField;
    DMemSwDicTekiCSVDPjSubKbn6: TStringField;
    DMemSwDicTekiCSVDPjSubCode6: TStringField;
    DMemSwDicTekiCSVDPjSubName6: TStringField;
    DMemSwDicTekiCSVDPjSubKbn7: TStringField;
    DMemSwDicTekiCSVDPjSubCode7: TStringField;
    DMemSwDicTekiCSVDPjSubName7: TStringField;
    DMemSwDicTekiCSVDPjSubKbn8: TStringField;
    DMemSwDicTekiCSVDPjSubCode8: TStringField;
    DMemSwDicTekiCSVDPjSubName8: TStringField;
    DMemSwDicTekiCSVDPjSubKbn9: TStringField;
    DMemSwDicTekiCSVDPjSubCode9: TStringField;
    DMemSwDicTekiCSVDPjSubName9: TStringField;
    DMemSwDicTekiCSVDPjSubKbn10: TStringField;
    DMemSwDicTekiCSVDPjSubCode10: TStringField;
    DMemSwDicTekiCSVDPjSubName10: TStringField;
    DMemSwDicTekiCSVDBankKbn: TStringField;
    DMemSwDicTekiCSVDBankCode: TStringField;
    DMemSwDicTekiCSVDBankName: TStringField;
    DMemSwDicTekiCSVDCsKbn: TStringField;
    DMemSwDicTekiCSVDCsCode: TStringField;
    DMemSwDicTekiCSVDCsName: TStringField;
    DMemSwDicTekiCSVDEmpKbn: TStringField;
    DMemSwDicTekiCSVDEmpCode: TStringField;
    DMemSwDicTekiCSVDEmpName: TStringField;
    DMemSwDicTekiCSVDMulKbn1: TStringField;
    DMemSwDicTekiCSVDMulCode1: TStringField;
    DMemSwDicTekiCSVDMulName1: TStringField;
    DMemSwDicTekiCSVDMulKbn2: TStringField;
    DMemSwDicTekiCSVDMulCode2: TStringField;
    DMemSwDicTekiCSVDMulName2: TStringField;
    DMemSwDicTekiCSVDMulKbn3: TStringField;
    DMemSwDicTekiCSVDMulCode3: TStringField;
    DMemSwDicTekiCSVDMulName3: TStringField;
    DMemSwDicTekiCSVDMulKbn4: TStringField;
    DMemSwDicTekiCSVDMulCode4: TStringField;
    DMemSwDicTekiCSVDMulName4: TStringField;
    DMemSwDicTekiCSVDMulKbn5: TStringField;
    DMemSwDicTekiCSVDMulCode5: TStringField;
    DMemSwDicTekiCSVDMulName5: TStringField;
    DMemSwDicTekiCSVCSubKbn: TStringField;
    DMemSwDicTekiCSVCSubCode: TStringField;
    DMemSwDicTekiCSVCSubName: TStringField;
    DMemSwDicTekiCSVCBmnKbn: TStringField;
    DMemSwDicTekiCSVCBmnCode: TStringField;
    DMemSwDicTekiCSVCBmnName: TStringField;
    DMemSwDicTekiCSVCSegKbn1: TStringField;
    DMemSwDicTekiCSVCSegCode1: TStringField;
    DMemSwDicTekiCSVCSegName1: TStringField;
    DMemSwDicTekiCSVCSegKbn2: TStringField;
    DMemSwDicTekiCSVCSegCode2: TStringField;
    DMemSwDicTekiCSVCSegName2: TStringField;
    DMemSwDicTekiCSVCSegKbn3: TStringField;
    DMemSwDicTekiCSVCSegCode3: TStringField;
    DMemSwDicTekiCSVCSegName3: TStringField;
    DMemSwDicTekiCSVCSegKbn4: TStringField;
    DMemSwDicTekiCSVCSegCode4: TStringField;
    DMemSwDicTekiCSVCSegName4: TStringField;
    DMemSwDicTekiCSVCSegKbn5: TStringField;
    DMemSwDicTekiCSVCSegCode5: TStringField;
    DMemSwDicTekiCSVCSegName5: TStringField;
    DMemSwDicTekiCSVCSegKbn6: TStringField;
    DMemSwDicTekiCSVCSegCode6: TStringField;
    DMemSwDicTekiCSVCSegName6: TStringField;
    DMemSwDicTekiCSVCSegKbn7: TStringField;
    DMemSwDicTekiCSVCSegCode7: TStringField;
    DMemSwDicTekiCSVCSegName7: TStringField;
    DMemSwDicTekiCSVCSegKbn8: TStringField;
    DMemSwDicTekiCSVCSegCode8: TStringField;
    DMemSwDicTekiCSVCSegName8: TStringField;
    DMemSwDicTekiCSVCSegKbn9: TStringField;
    DMemSwDicTekiCSVCSegCode9: TStringField;
    DMemSwDicTekiCSVCSegName9: TStringField;
    DMemSwDicTekiCSVCSegKbn10: TStringField;
    DMemSwDicTekiCSVCSegCode10: TStringField;
    DMemSwDicTekiCSVCSegName10: TStringField;
    DMemSwDicTekiCSVCPrjKbn1: TStringField;
    DMemSwDicTekiCSVCPrjCode1: TStringField;
    DMemSwDicTekiCSVCPrjName1: TStringField;
    DMemSwDicTekiCSVCPrjKbn2: TStringField;
    DMemSwDicTekiCSVCPrjCode2: TStringField;
    DMemSwDicTekiCSVCPrjName2: TStringField;
    DMemSwDicTekiCSVCPrjKbn3: TStringField;
    DMemSwDicTekiCSVCPrjCode3: TStringField;
    DMemSwDicTekiCSVCPrjName3: TStringField;
    DMemSwDicTekiCSVCPrjKbn4: TStringField;
    DMemSwDicTekiCSVCPrjCode4: TStringField;
    DMemSwDicTekiCSVCPrjName4: TStringField;
    DMemSwDicTekiCSVCPrjKbn5: TStringField;
    DMemSwDicTekiCSVCPrjCode5: TStringField;
    DMemSwDicTekiCSVCPrjName5: TStringField;
    DMemSwDicTekiCSVCPrjKbn6: TStringField;
    DMemSwDicTekiCSVCPrjCode6: TStringField;
    DMemSwDicTekiCSVCPrjName6: TStringField;
    DMemSwDicTekiCSVCPrjKbn7: TStringField;
    DMemSwDicTekiCSVCPrjCode7: TStringField;
    DMemSwDicTekiCSVCPrjName7: TStringField;
    DMemSwDicTekiCSVCPrjKbn8: TStringField;
    DMemSwDicTekiCSVCPrjCode8: TStringField;
    DMemSwDicTekiCSVCPrjName8: TStringField;
    DMemSwDicTekiCSVCPrjKbn9: TStringField;
    DMemSwDicTekiCSVCPrjCode9: TStringField;
    DMemSwDicTekiCSVCPrjName9: TStringField;
    DMemSwDicTekiCSVCPrjKbn10: TStringField;
    DMemSwDicTekiCSVCPrjCode10: TStringField;
    DMemSwDicTekiCSVCPrjName10: TStringField;
    DMemSwDicTekiCSVCPjSubKbn1: TStringField;
    DMemSwDicTekiCSVCPjSubCode1: TStringField;
    DMemSwDicTekiCSVCPjSubName1: TStringField;
    DMemSwDicTekiCSVCPjSubKbn2: TStringField;
    DMemSwDicTekiCSVCPjSubCode2: TStringField;
    DMemSwDicTekiCSVCPjSubName2: TStringField;
    DMemSwDicTekiCSVCPjSubKbn3: TStringField;
    DMemSwDicTekiCSVCPjSubCode3: TStringField;
    DMemSwDicTekiCSVCPjSubName3: TStringField;
    DMemSwDicTekiCSVCPjSubKbn4: TStringField;
    DMemSwDicTekiCSVCPjSubCode4: TStringField;
    DMemSwDicTekiCSVCPjSubName4: TStringField;
    DMemSwDicTekiCSVCPjSubKbn5: TStringField;
    DMemSwDicTekiCSVCPjSubCode5: TStringField;
    DMemSwDicTekiCSVCPjSubName5: TStringField;
    DMemSwDicTekiCSVCPjSubKbn6: TStringField;
    DMemSwDicTekiCSVCPjSubCode6: TStringField;
    DMemSwDicTekiCSVCPjSubName6: TStringField;
    DMemSwDicTekiCSVCPjSubKbn7: TStringField;
    DMemSwDicTekiCSVCPjSubCode7: TStringField;
    DMemSwDicTekiCSVCPjSubName7: TStringField;
    DMemSwDicTekiCSVCPjSubKbn8: TStringField;
    DMemSwDicTekiCSVCPjSubCode8: TStringField;
    DMemSwDicTekiCSVCPjSubName8: TStringField;
    DMemSwDicTekiCSVCPjSubKbn9: TStringField;
    DMemSwDicTekiCSVCPjSubCode9: TStringField;
    DMemSwDicTekiCSVCPjSubName9: TStringField;
    DMemSwDicTekiCSVCPjSubKbn10: TStringField;
    DMemSwDicTekiCSVCPjSubCode10: TStringField;
    DMemSwDicTekiCSVCPjSubName10: TStringField;
    DMemSwDicTekiCSVCBankKbn: TStringField;
    DMemSwDicTekiCSVCBankCode: TStringField;
    DMemSwDicTekiCSVCBankName: TStringField;
    DMemSwDicTekiCSVCCsKbn: TStringField;
    DMemSwDicTekiCSVCCsCode: TStringField;
    DMemSwDicTekiCSVCCsName: TStringField;
    DMemSwDicTekiCSVCEmpKbn: TStringField;
    DMemSwDicTekiCSVCEmpCode: TStringField;
    DMemSwDicTekiCSVCEmpName: TStringField;
    DMemSwDicTekiCSVCMulKbn1: TStringField;
    DMemSwDicTekiCSVCMulCode1: TStringField;
    DMemSwDicTekiCSVCMulName1: TStringField;
    DMemSwDicTekiCSVCMulKbn2: TStringField;
    DMemSwDicTekiCSVCMulCode2: TStringField;
    DMemSwDicTekiCSVCMulName2: TStringField;
    DMemSwDicTekiCSVCMulKbn3: TStringField;
    DMemSwDicTekiCSVCMulCode3: TStringField;
    DMemSwDicTekiCSVCMulName3: TStringField;
    DMemSwDicTekiCSVCMulKbn4: TStringField;
    DMemSwDicTekiCSVCMulCode4: TStringField;
    DMemSwDicTekiCSVCMulName4: TStringField;
    DMemSwDicTekiCSVCMulKbn5: TStringField;
    DMemSwDicTekiCSVCMulCode5: TStringField;
    DMemSwDicTekiCSVCMulName5: TStringField;
    DPrintdxMemData2bDtlLast: TBooleanField;
    DPrintdxMemData2iLine: TIntegerField;
    DPrintdxMemData2DiAttr: TIntegerField;
    DPrintdxMemData2CiAttr: TIntegerField;
    DMemSwDicTekiCSVCKmkKbn: TStringField;
    DtlDSwkGridColumn9: TdxDBGridColumn;
    DtlCSwkGridColumn9: TdxDBGridColumn;
    PSwkDKmk: TMPanel;
    LDKamoku: TMLabel;
    cCmbK1DCmb: TMComboBox;
    cEdtK1DNum: TMNumEdit;
    cLblK1DDsc: TMLabel;
    PSwkCKmk: TMPanel;
    MLabel10: TMLabel;
    cCmbK1CCmb: TMComboBox;
    cEdtK1CNum: TMNumEdit;
    cLblK1CDsc: TMLabel;
    PTaxInfo: TMPanel;
    DtlCmnLbelTaxDivisionTitle: TMLabel;
    DtlCmnLbelTaxCodeTitle: TMLabel;
    DtlCmnEditTaxDivision: TMNumEdit;
    DtlCmnEditTaxCode: TMNumEdit;
    DtlCmnLbelTaxDivisionDesc: TMLabel;
    DtlCmnLbelTaxCodeDesc: TMLabel;
    DtlCmnLbelTaxRateTitle: TMLabel;
    DtlCmnLbelTypeCodeTitle: TMLabel;
    DtlCmnEditTaxRate: TMNumEdit;
    DtlCmnEditTypeCode: TMNumEdit;
    DtlCmnLbelTaxRateDesc: TMLabel;
    DtlCmnLbelTypeCodeDesc: TMLabel;
    DtlCmnPanelAddition4: TMPanel;
    MLabel5: TMLabel;
    Pnl_RensoTitle: TMLabel;
    DtlCmnPanelGrid: TMPanel;
    DtlCmnGrid: TdxDBGrid;
    DtlCmnGridColumn5: TdxDBGridColumn;
    DtlCmnGridColumnExCode: TdxDBGridButtonColumn;
    DtlCmnGridColumnCtrlDivision: TdxDBGridLookupColumn;
    DtlCmnGridColumnSubjectDesc: TdxDBGridColumn;
    DtlCmnGridColumnDivisionDesc: TdxDBGridMaskColumn;
    chk_Busyo: TMCheckBox;
    DtlDSwkMemstrGCode_Save: TStringField;
    DtlCSwkMemstrGCode_Save: TStringField;
    DPrintdxMemData2BusDicKbn: TStringField;
    DMemSwDicTekiCSVBusDicKbn: TStringField;

	procedure fnJNTCRP020000fOnShow(Sender: TObject);
	procedure fnJNTCRP020000fOnCreate(Sender: TObject);
	procedure fnJNTCRP020000fOnClose(Sender: TObject; var Action: TCloseAction);
	procedure fnJNTCRP020000fOnActivate(Sender: TObject);
	procedure fnJNTCRP020000fOnCloseQuery(Sender: TObject; var CanClose: Boolean);
	procedure fnJNTCRP020000fOnHide(Sender: TObject);
	procedure fnJNTCRP020000fOnDestroy(Sender: TObject);
	procedure fnJNTCRP020000fOnPaint(Sender: TObject);

	constructor	fnCreateForm (pRec: Pointer);
	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;

	procedure fnCommonFunctionOnEnter01(Sender: TObject);	// <HIS0059> ADD
	procedure fnCommonFunctionOnEnter02(Sender: TObject);
	procedure fnOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure fnOnChange(Sender: TObject);

	procedure fnCmnTreeViewOnChange(Sender: TObject; Node: TTreeNode);
	procedure fnCmnTreeViewOnDragDrop(Sender, Source: TObject; X, Y: Integer);
	procedure fnCmnTreeViewOnDragOver(Sender, Source: TObject; X, Y: Integer;
	  State: TDragState; var Accept: Boolean);
	procedure fnCmnTreeViewOnEnter(Sender: TObject);

	procedure fnCmnTreeViewPopupMenuCopyOnClick(Sender: TObject);
	procedure fnCmnTreeViewPopupMenuOnPopup(Sender: TObject);
	procedure fnCmnTreeViewPopupMenuTagOnClick  (Sender: TObject);
	procedure fnCmnTreeViewPopupMenuTagOnClickEx(Sender: TObject);
	procedure fnCmnTreeViewPopupMenuPasteOnClick(Sender: TObject);
	procedure fnCmnTreeViewPopupMenuDeleteOnClick(Sender: TObject);
	procedure fnCmnTreeViewPopupMenuEraseOnClick(Sender: TObject);
	procedure fnCmnTreeViewPopupMenuDetailOnClick(Sender: TObject);
	procedure fnCmnTreeViewPopupMenuExEraseOnClick(Sender: TObject);
	procedure fnCmnTreeViewPopupMenuExOnPopup(Sender: TObject);

	procedure fnCmnToolbarDropDownMenuItemOnClick(Sender: TObject);
	procedure fnCmnToolbarButtonDetailOnClick(Sender: TObject);
	procedure fnCmnToolbarButtonTagOnClick(Sender: TObject);
	procedure fnCmnToolbarButtonDeleteOnClick(Sender: TObject);
	procedure fnCmnToolbarButtonPrintOnClick(Sender: TObject);

	procedure fnCmnComboBoxInstructionOnChange(Sender: TObject);
	procedure fnCmnComboBoxInstructionOnEnter(Sender: TObject);
	procedure fnCmnComboBoxInstructionOnKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);

	procedure B_ChangeClick(Sender: TObject);
	procedure B_EndClick(Sender: TObject);
	procedure BeforePrint(Sender: TObject);

	procedure fnDtlCmnButtonCancelOnClick(Sender: TObject);
	procedure fnDtlCmnButtonUpdateOnClick(Sender: TObject);

	procedure fnDtlCmnEditDealClassOnChange(Sender: TObject);
	procedure fnDtlCmnEditDealDivisionOnChange(Sender: TObject);
	procedure fnDtlCmnEditTaxDivisionOnChange(Sender: TObject);
	procedure fnDtlCmnEditTaxCodeOnChange(Sender: TObject);
	procedure fnDtlCmnEditTaxRateOnChange(Sender: TObject);
	procedure fnDtlCmnEditTypeCodeOnChange(Sender: TObject);
	procedure fnDtlCmnEditDealDivisionOnExit(Sender: TObject);
	procedure fnDtlCmnEditDealClassOnExit(Sender: TObject);
	procedure fnDtlCmnEditTaxDivisionOnExit(Sender: TObject);
	procedure fnDtlCmnEditTaxRateOnExit(Sender: TObject);
	procedure fnDtlCmnEditTypeCodeOnExit(Sender: TObject);
	procedure fnDtlCmnEditTaxCodeOnExit(Sender: TObject);

	procedure FusenRedClick(Sender: TObject);
	procedure FusenGreenClick(Sender: TObject);
	procedure FusenBlueClick(Sender: TObject);
	procedure FusenOrangeClick(Sender: TObject);

	procedure fnDtlCmnTabOnChange(Sender: TObject);
	procedure fnDtlCmnTabOnKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure fnStdCmnTabOnChange(Sender: TObject);
	procedure fnStdCmnTabOnEnter(Sender: TObject);
	procedure fnStdCmnTabOnKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);

	procedure PDetailBandMBeforeGenerate(Sender: TObject);
	procedure PDetailBandSTBeforeGenerate(Sender: TObject);
	procedure PDetailBandKBBeforeGenerate(Sender: TObject);
	procedure PDetailBandKTBeforeGenerate(Sender: TObject);
	procedure PDetailBandKRBeforeGenerate(Sender: TObject);
	procedure PDetailBandBeforeGenerate(Sender: TObject);

	procedure fnStdCmnGridExistOnBeforeChangeColumn(Sender: TObject;
	  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
	  NewColumn: Integer; var CanChange: Boolean);
	procedure fnStdCmnGridExistOnChangeNodeEx(Sender: TObject);
	procedure fnStdCmnGridExistOnEnter(Sender: TObject);
	procedure fnStdCmnGridExistOnMouseDown(Sender: TObject;
	  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
	procedure fnStdCmnGridExistOnGetNodeDragText(Sender: TObject;
	  Node: TdxTreeListNode; Column: TdxTreeListColumn; var AText: String);
	procedure fnStdCmnGridExistOnBeforeChangeNode(Sender: TObject; Node,
	  NewNode: TdxTreeListNode; var CanChange: Boolean);
	procedure fnStdCmnGridExistOnMouseMove(Sender: TObject; Shift: TShiftState;
	  X, Y: Integer);
	procedure fnStdCmnGridExistOnColumnClick(Sender: TObject;
	  Column: TdxDBTreeListColumn);
	procedure fnStdCmnGridExistOnKeyPress(Sender: TObject; var Key: Char);

	procedure fnStdCmnMemDataExistBeforePost(DataSet: TDataSet);
	procedure fnStdCmnMemDataTotalBeforePost(DataSet: TDataSet);

	procedure fnStdCmnDataSourceExistOnStateChange(Sender: TObject);
	procedure fnStdCmnDataSourceTotalOnStateChange(Sender: TObject);

	procedure fnStdCmnGridTotalOnBeforeChangeColumn(Sender: TObject;
	  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
	  NewColumn: Integer; var CanChange: Boolean);
	procedure fnStdCmnGridTotalOnChangeNodeEx(Sender: TObject);
	procedure fnStdCmnGridTotalOnEnter(Sender: TObject);
	procedure fnStdCmnGridTotalOnKeyPress(Sender: TObject; var Key: Char);
	procedure fnStdCmnGridTotalOnColumnClick(Sender: TObject;
	  Column: TdxDBTreeListColumn);

	procedure fnDtlCEdtExCdOnEnter(Sender: TObject);
	procedure fnDtlCEdtExCdOnExit(Sender: TObject);
	procedure fnDtlCEdtExCdOnChange(Sender: TObject);
	procedure fnDtlCEdtExCdOnArrowClick(Sender: TObject);
	procedure fnDtlCEdtExCdK1OnChange(Sender: TObject);
	procedure fnDtlCEdtExCdK1OnKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure fnDtlCEdtExCdK1OnArrowClick(Sender: TObject);
	procedure fnDtlCEdtExCdK2OnArrowClick(Sender: TObject);
	procedure fncEdtOAC(Sender: TObject);
	procedure fnDtlCEdtExCdK1OnExit(Sender: TObject);
//	procedure fnDtlCEdtExCdK2OnExit(Sender: TObject);	// <HIS0052> DEL
//	procedure fncEdtOEx(Sender: TObject);				// <HIS0052> DEL

	procedure fnStdCmnGridPopupMenuOnPopup(Sender: TObject);
	procedure fnStdCmnGridPopupMenuTagOnClick  (Sender: TObject);
	procedure fnStdCmnGridPopupMenuTagOnClickEx(Sender: TObject);

	procedure fnDtlCmnPopupMenuOnPopup(Sender: TObject);
	procedure fnDtlCmnPopupMenuTagOnClick(Sender: TObject);
	procedure fnDtlCmnFunctionOnEnter(Sender: TObject);
	procedure fnDtlCmnGridColumnExCodeOnEditButtonClick(Sender: TObject);
	procedure fnDtlCmnGridOnMouseDown(Sender: TObject; Button: TMouseButton;
	  Shift: TShiftState; X, Y: Integer);
	procedure fnDtlCmnGridOnKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure fnDtlCmnGridOnBeforeChangeColumn(Sender: TObject;
	  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
	  NewColumn: Integer; var CanChange: Boolean);
	procedure fnDtlCmnMemDataBeforePost(DataSet: TDataSet);
	procedure fnDtlCmnDataSourceOnStateChange(Sender: TObject);
	procedure fnDtlCmnGridOnChangeNodeEx(Sender: TObject);
	procedure fnDtlCmnGridOnEnter(Sender: TObject);
	procedure fnDtlCmnDataSourceOnDataChange(Sender: TObject; Field: TField);
	procedure fnDtlCmnGridOnKeyPress(Sender: TObject; var Key: Char);
	procedure StdCmnGridTotalBeforeChangeNode(Sender: TObject; Node,
	  NewNode: TdxTreeListNode; var CanChange: Boolean);
	procedure SDetailBandBeforeGenerate(Sender: TObject);
	procedure MComboBoxChange(Sender: TObject);
	procedure MComboBoxClick(Sender: TObject);
	procedure MComboBoxKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure MCheckBox1KeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure MCheckBox1Click(Sender: TObject);
	procedure ChangeCompColor(Sender: TObject);
    procedure MLabel27Click(Sender: TObject);
    procedure B_SearchClick(Sender: TObject);
    procedure CmnTreeViewExit(Sender: TObject);
    procedure CmnArrowClick (Sender: TObject);
    procedure evtcCmbK1CmbChange(Sender: TObject);
    procedure evtcEdtKmkNumExit(Sender: TObject);
    procedure evtDtlSwkGridChangeNode(Sender: TObject; OldNode,
      Node: TdxTreeListNode);
    procedure evtDtlSwkGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure evtDtlSwkGridKeyPress(Sender: TObject; var Key: Char);
    procedure evtdxDBGridColumnCodeEditButtonClick(Sender: TObject);
    procedure evtDtlSwkMemBeforePost(DataSet: TDataSet);
    procedure evtDtlSwkGridEnter(Sender: TObject);
    procedure evtDtlSwkGridEditing(Sender: TObject; Node: TdxTreeListNode;
      var Allow: Boolean);
    procedure evtDtlSwkGridExit(Sender: TObject);

  private
		{ Private 宣言 }

	MASTER_SEGMENT  		:	Integer;		//	ｾｸﾞﾒﾝﾄ(可変)    <HIS0033>
    MASTER_CONSTRUCT		:	Integer;		//	工事(可変)      <HIS0033>
    MASTER_CONSTKIND		:	Integer;		//	工種(可変)      <HIS0033>

    MASTER_HOJYO1           :   Integer;        //  第一補助        <HIS0033>
    MASTER_HOJYO2           :   Integer;        //  第二補助        <HIS0033>

    uvExpOpenSW:        Boolean;                            // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)
//<HIS0078 start>
//	uvPostExpOpenSW:    Boolean;                            // ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)
//<HIS0078 end>
    m_InsFlg                :   Boolean;    //<HIS0032>
    m_NCodeUse              :   Boolean;    //<HIS0032>
    m_cJNTArea              :   TJNTCommon; //<HIS0032>

	m_pRec					:	^TMjsAppRecord;
	m_cDataModule			:	TMDataModulef;
	m_cComArea				:	TJNTMASCom;
	m_cDBSelect				:	TFDConnection;
	m_cACControl			:	TWinControl;
//<HIS0078 start>
//	m_cAppPrm				:	TAppParam;
//<HIS0078 end>
	m_cPrnSupport			:	TMJSPrnSupport;
//<HIS0078 start>
//	m_cPreview				:	TMJSPreviewIF;
//<HIS0078 end>
	m_cErrorMsgRec			:	TMJSMsgRec;

	m_cNodePrevSelect		:	TTreeNode;
	m_cNodeRightClick		:	TTreeNode;
//<HIS0078 start>
//	m_arAssSubjects			:	array of AssSubjects;
//<HIS0078 end>
// <HIS0052> MOD start
//	m_stAdoptInfo			:	array [0..16] of AdoptInfo;
//	m_stCurDtlCodeAttr		:	array [0..15] of CodeAttribute;
	m_stAdoptInfo			:	array [0..40] of AdoptInfo;			// 補助ﾏｽﾀ配列
	m_stCurDtlCodeAttr		:	array [0..81] of CodeAttribute; 	// 仕訳情報41*2
// <HIS0052> MOD end
	m_stCdAtSngl			:	CodeAttribute;
	m_stWorkRecPaste		:	TreeViewRec;
	m_stMasterData			:	MasterData;
	m_nDateFormatDivision	:	Integer;
	m_nReferMode			:	Integer;
	m_nProcDivision			:	Integer;
	m_nExCodeCurrent		:	Integer;
	m_nCompDivision			:	Integer;
	m_nTaxAccDivision		:	Integer;		//	消費税基本情報:	会計処理区分	(0:免税業者)
	m_nGridExistRecords		:	Integer;
	m_nGridTotalRecords		:	Integer;
	m_nSelectTagKind		:	Integer;
	m_nMailAdoption			:	Integer;
	m_nDBErrorCode			:	Integer;
	m_nHintPosition			:	Integer;
	m_fAppExit				:	Boolean;
	m_fUnderConstruction	:	Boolean;
	m_fUnderConstruction2	:	Boolean;

	//	グリッドにフォーカスがある時、削除後のスクロールを防ぐ
	m_fUnderConstruction3	:	Boolean;

	m_fComboBoxListDraw		:	Boolean;
	m_fUpdateRecord			:	Boolean;
	m_fDtlNewRecord			:	Boolean;
	m_fAccessTab			:	Boolean;
	m_fIgnoreProc			:	Boolean;
	m_fIgnoreDtlCmnGrid		:	Boolean;
	m_fDtlExCodeChange		:	Boolean;
	m_fChangeDetails		:	Boolean;
	m_fExCodeKMCheck		:	array [0..1] of	Boolean;
	m_fDeleteTekiTree		:	array [0..1] of	Boolean;
	m_fDeleteSwDicTeki		:	Boolean;
	m_nExCode				:	Integer;		//HIS0014

	m_fDeleteTekizan		:	Boolean;		//HIS0021

	m_ComCode				:	Integer;		//HIS0027
	m_DataKbn				:	Integer;		//HIS0027

    m_dateKStDate       	: 	TDateTime;      // 決算開始年月日 <HIS0052> ADD
    m_dateKEdDate       	: 	TDateTime;      // 決算終了年月日 <HIS0052> ADD

//<HIS0078 start>
//	m_iDlg					:	Integer;
//	m_iJnSitei				:	Integer;		//	順序指定:	0=コード順	1	=連想順
//<HIS0078 end>
	m_iHnSitei				:	Integer;		//	範囲指定:	0=なし,	1=あり
//<HIS0078 start>
//	m_iKaisi				:	Integer;		//	開始外部ｺｰﾄﾞ
//	m_iOwari				:	Integer;		//	終了外部ｺｰﾄﾞ
//<HIS0078 end>
	miInit					:	Integer;		//	０＝初回

	m_iTaxKbn				:	Integer;

	m_sBSComBmnCd			:	String;			//	ＢＳ共通部門
    m_exBSComBmnNCd			:	Extended;		//  ＢＳ共通部門(内部ｺｰﾄﾞ)	//<HIS0094>Add
	m_sBSComBmnNm			:	String;			//	ＢＳ共通部門
// <HIS0052> MOD start
//	m_sBSComSg1Cd			:	String;			//	ＢＳ共通セグメント１
//	m_sBSComSg1Nm			:	String;			//	ＢＳ共通セグメント１
												//	ＢＳ共通セグメント１～１０
	m_sBSComSgCd			:	array[0..9] of String;
    m_exBSComSgNCd			:   array[0..9] of Extended;		//内部ｺｰﾄﾞ	//<HIS0094>Add
	m_sBSComSgNm			:	array[0..9] of String;
// <HIS0052> MOD end
	m_sPLComBmnCd			:	String;			//	ＰＬ共通部門
    m_exPLComBmnNCd			:	Extended;		//  ＰＬ共通部門(内部ｺｰﾄﾞ)	//<HIS0094>Add
	m_sPLComBmnNm			:	String;			//	ＰＬ共通部門
// <HIS0052> MOD start
//	m_sPLComSg1Cd			:	String;			//	ＰＬ共通セグメント１
//	m_sPLComSg1Nm			:	String;			//	ＰＬ共通セグメント１
												//	ＰＬ共通セグメント１～１０
	m_sPLComSgCd			:	array[0..9] of String;
    m_exPLComSgNCd			:   array[0..9] of Extended;		//内部ｺｰﾄﾞ	//<HIS0094>Add
	m_sPLComSgNm			:	array[0..9] of String;
// <HIS0052> MOD end

	m_iBsPlKbnDeb			:	Integer;
	m_iBsPlKbnCre			:	Integer;

	m_cTaxItems				:	TaxItems;

	m_iDtlCEdtExCd			:	Integer;
	m_iKmkGCodeDeb			:	Integer;
	m_iKmkGCodeCre			:	Integer;

	m_iCntKahen				:	Integer;

	m_iSpe010301			:	Integer;
	m_iSpe010302			:	Integer;

(*H0002 20030820 khattori syuusei 会社単独廃止対応*)
	m_cExcept				:	TJNTMASExceptIF;
	m_iRet					:	Integer;

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	m_bLog					:	Boolean;
	m_bSkip					:	Boolean;
	m_stMsgRec				:	TMJSMsgRec;

  	m_SearchInfo	        :	SearchInfoRec;                  //HIS0028   検索対象分類情報
//<HIS0078 start>
//	m_cEdtSet				:	array[0..15]	of	EdtCompSet;
//<HIs0078 end>
	m_iKmkCode1				:	Integer;
	m_iKmkCode2				:	Integer;
	m_iKmkCode3				:	Integer;
	m_iKmkCode4				:	Integer;
	m_iKmkCode5				:	Integer;
	m_iKmkCode6				:	Integer;
	m_iKmkCode8				:	Integer;
	m_iKmkCode9				:	Integer;
//<HIS0078 start>
//	m_iPtnNo		   	:	array	[0..2]	of	Integer;
//<HIS0078 end>
    m_FusenClrIdx       : Integer;

    m_IsUpdate          : Boolean;
    uvHani              : TJNTHani;		                        // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry   	: TPrintAppEntry;                       // <PRN>
    ArrHdl              : Array[0..100] of Pointer;			    // <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		    : rcPrtParam;                           // <PRN>
    DmqPrint            : TMQuery;                              // <PRN> 印刷用ｸｴﾘｰ
	uvSelSys            : TJNTSelCorpSys; 	                    // <PRN> 会社ｼｽﾃﾑ情報
	m_nOrderDivision    : Integer;								// 印刷範囲指定: 0=ｺｰﾄﾞ順, 1=連想順
	m_strExCodeScopeStr : String;								// 印刷開始部門外部ｺｰﾄﾞ
	m_strExCodeScopeEnd : String;								// 印刷終了部門外部ｺｰﾄﾞ
    m_iExCodeStr        : Integer;
    m_iExCodeEnd        : Integer;

	m_iTekiDigit		: Integer;		// 摘要ｺｰﾄﾞ桁数 <HIS0058> ADD

// <SYNC> ADD start
   	m_iGrpCorp	  		: Integer;  	// ｸﾞﾙｰﾌﾟ管理有無(0: なし 1: あり)
	m_iTransKbn	  		: Integer;  	// ｸﾞﾙｰﾌﾟ会計送受信区分(0: 親会社 1: 子会社)
    m_iSecMasterKbn		: Integer;		// ｸﾞﾙｰﾌﾟ管理の採用ｾｸﾞﾒﾝﾄﾏｽﾀ区分
    m_SyncMaster        : TSyncMaster;	// ﾏｽﾀ同期ｸﾗｽ
// <SYNC> ADD end
//<HIS0082 start>
	iKmk1				: Integer;
	iKmk2				: Integer;
	s_Code				: String;
	fSearch				: Boolean;
	fFirst				: Boolean;
	iMasterKbn1			: Integer;
//<HIS0082 end>
    m_bNewRecord        : Boolean;  //<HIS0088> ADD
    m_TaxRateInfo		: TMASTaxRateInfo;	//<HIS0101> ADD
//<HIS0105> ADD St
    m_iDataVer          : Integer;
    m_cTypeCode         : TTypeCode;
//<HIS0105> ADD Ed
    m_TaxSalesItems     : array of TaxItems;  //<HIS0110> ADD

//    m_Log           : TLog_Writer;  //*Log*

	procedure	fnAddTreeViewUnconnectedItems	();

	function	fnChangeSelectionScreen			(): Boolean;
	procedure	fnChangeGridCondition			();
	procedure	fnChangeToolbarButtonsCondition	(nSumDivision: Integer);
	procedure	fnChangePartsCondition			(nReferMode: Integer);

(*H0002 20030820 khattori syuusei 会社単独廃止対応*)
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	function	fnExceptCheck(bErrorMsg:Boolean=true;bMsgString:Boolean=false;bBeep:Boolean=true): Integer;
//	procedure	fnExceptCheck;

	function	fnCheckMasterDataRecordValid	(nSumDivision: Integer; nExCode: Integer): Boolean;
	function	fnCheckMasterTreePasteValid		(nSumDivision: Integer; nExCodeSrc: Integer; cNodeDst: TTreeNode): Boolean;
	function	fnCheckTreeViewDropItem			(cNodeDst: TTreeNode; nExCodeSrc: Integer; nDivisionSrc: Integer): Boolean;
	function	fnCheckMasterRecordUpdate		(): Boolean;
	function	fnCheckBusyoDenpyouJisyo		(): Boolean;
	function	fnCheckDescription				(nSumDivision: Integer; nExCode: Integer; strAssociation: String; strDescription: String): Integer;	//HIS0014
	function	fnCheckDealDivision				(nDealDivision: Integer; var strDescription: String): Integer;
	function	fnCheckDealClass				(nDealClass: Integer; var strDescription: String): Integer;
	function	fnCheckExCodeKmkMA				(nMasterDivision: Integer; nDCDivision: Integer; nExCode: Integer; nExCodeSub: String; var strDescription: String): Integer;
//<HIS0089> DEL	function	fnCheckExCodeHojyoMA			(nPosition: Integer; strExCode: String; var strDescription: String): Integer;
    function	fnCheckExCodeHojyoMA			(nPosition: Integer; strExCode: String; var strDescription: String; iNCode : Extended = 0): Integer;  //<HIS0089> ADD
	function	fnCheckTaxDivision				(nTaxDivision: Integer; var strDescription: String): Integer;
	function	fnCheckTaxCode					(nTaxDivision: Integer; nTaxCode: Integer; var strDescription: String): Integer;
	function	fnCheckTaxRate					(nTaxRate: Integer; var strDescription: String): Integer;
	function	fnCheckTypeCode					(nTypeCode: Integer; var strDescription: String): Integer;
	function	fnCheckSubjectCodeAss			(nSubjectCode: Integer; var strDescription: String): Boolean;

	procedure	fnCleanupTreeViewNewItem		(fSelected: Boolean);
	procedure	fnCleanupTreeViewNewItemEx		();

	procedure	fnCreateTreeViewItems01			(cSrcNode: TTreeNode);
	procedure	fnCreateTreeViewItems02			(cSrcNode: TTreeNode);
	procedure	fnCreateTreeViewItem01			(dqMasterData: TMQuery; cSrcNode: TTreeNode);
	procedure	fnCreateTreeViewItem02			(dqMasterData: TMQuery; cSrcNode: TTreeNode);

(*H0003 20030821 khattori syuusei Drag & Drop 対応*)
	function	fnDeleteMasterRecord			(nSumDivision: Integer; nExCode: Integer): Boolean;
	function	fnDeleteMasterTreeRecord		(nSumDivision: Integer; nExCode: Integer): Boolean;
	function	fnDeleteMasterDataRecord		(nSumDivision: Integer; nExCode: Integer): Boolean;
// <HIS0052> MOD start 引数を外部→内部ｺｰﾄﾞに
//	function	fnDeleteMasterDataAddition		(nExCode: Integer): Boolean;
	function	fnDeleteMasterDataAddition		(exNCode: Extended): Boolean;
// <HIS0052> MOD end
	procedure	fnDeleteTreeViewItems			(nSumDivision: Integer; nExCode: Integer);

	function	fnEraseMasterTreeRecord			(nExCode: Integer; nExCodeParent: Integer): Boolean;
	procedure	fnEraseTreeViewItems			(cNodeTarget: TTreeNode);

	procedure	fnEnableToolbarButtonTag		(fEnabled: Boolean);

	function	fnGetMasterInfoData				(nMasDiv: Integer;nPos: Integer):Integer;overload;
	function	fnGetMasterInfoData				(nMasDiv: Integer):Integer;overload;
	function	fnGetMasterDataTagInfo			(nExCode: Integer): Integer;
	function	fnGetTagColorBitmap				(nTagColor: Integer): TBitmap;
	function	fnGetMinimumExCode				(): Integer;
	function	fnGetControlDivision			(nSubjectCode: Integer; nExCode: Integer): Integer;

	procedure	fnInitializeDetailScreen		(fClearExCode: Boolean);
	procedure	fnInsertMasterTreeRecord		(cNodeDst: TTreeNode; nSumDivision: Integer; nExCode: Integer; strName: String);
//<HIS0078 satrt>
//	function	fnMakeSQLConstructionKmkMA		(nMasterDivision: Integer; nDCDivision: Integer; nExCode: Integer): String;
//	function	fnMakeSQLConstructionHojyoMA	(nMasterDivision: Integer; nDCDivision: Integer): String;
//<HIS0078 end>
	procedure	fnMoveMasterTreeRecord			(cNodeSrc: TTreeNode; cNodeDst: TTreeNode);
	procedure	fnMoveTreeViewItems				(cNodeSrc: TTreeNode; cNodeDst: TTreeNode);
	procedure	fnMoveGridRecordSelecter		(nSumDivision: Integer; nExCode: Integer);

	function	fnOutputConfirmationMessage		(nDivision: Integer): Integer;
	procedure	fnOutputDBErrorMessage			();
	procedure	fnOutputDescErrorMessage		(nSumDivision: Integer);		//HIS0014
//<HIS0078 start>
//	procedure	fnPrintKanaOrder				(cDlgPrint: TMJSPrnDlgf);
//<HIS0078 end>
	procedure	fnRebuildTreeViewItems			();
	function	fnRebuildMasterTreeRecords		(nExCode: Integer): Boolean;
	procedure	fnResetParentItemsInfo			();
	procedure	fnResetDetailScreenAddition		();

	procedure	fnSelectTreeViewItem			(nSumDivision: Integer; nExCode: Integer);
	procedure	fnSetMasterInfoData				();
	procedure	fnSetGridMemDataExist			(dqMasterData: TMQuery);
	procedure	fnSetGridMemDataTotal			(dqMasterData: TMQuery);
	procedure	fnSetGridMemDataDetails			(nExCode: Integer);
	procedure	fnSetParentItemsInfoEx			(nSumDivision: Integer; nExCode: Integer; nExCodeParent: Integer; strName: String);
	procedure	fnSetSummaryItemsInfo			();
	function	fnSetDetailScreenInfo			(nExCode: Integer; nSumDivision: Integer): Boolean;
	procedure	fnSetDetailScreenAddition		(nExCode: Integer; nAddition: Integer);
	procedure	fnSetDtlEditExCodeAttribute		(nExCode: Integer; nDivision: Integer; bCheck: Boolean=false);
// <HIS0052> DEL
//	procedure	fnSetDtlEditExCodeCondition		(nEditType: Integer; nDivision: Integer; nPos: Integer);
	procedure	fnSetDtlEditTaxCodeSelectItems	(nDivision: Integer);
	procedure	fnSetGridTagInfo				(nTagKind: Integer);
	procedure	fnShowDetailScreen				();
	procedure	fnSortGridRecords				(nDivision: Integer; cColumn: TdxDBTreeListColumn);
	function	fnSetControlDivision			(nSubjectCode: Integer; nExCode: Integer; nDivision: Integer): Boolean;

	function	GetTaxKbn(iDKmkCode,iCKmkCode: Integer): Integer;
	procedure	GetHukugouCode;
	procedure	ChangeTaxEdit(iDKmkCode,iCKmkCode: Integer);
	procedure	ClearTaxEdit(iItem,iMode: Integer);
//	procedure	SetCommonSection(iDbCr: Integer);	// <HIS0052> DEL
	procedure	fnSetField(cEdtNum:TMNumEdit;cEdtTxt:TMTxtEdit;cLbl:TMLabel;sValue:String;sName:String;bNull:Boolean;index:Integer);

	function	fnUpdateDetailsScreenRecord		(): Boolean;
	function	fnUpdateMasterRecord			(): Boolean;
	procedure	fnUpdateMasterRecordAddition	();
	function	fnUpdateMasterTreeRecord		(): Boolean;
	function	fnUpdateMasterDataRecord		(): Boolean;
	procedure	fnUpdateTreeViewItems			(nSumDivision: Integer; nExCode: Integer; strName: String; nAccessMethod: Integer);
	procedure	fnUpdateParentItemsInfoCaption	(nExCode: Integer; strName: String);
	function	fnUpdateMasterDataTagInfo		(nExCode: Integer; var nTagKind: Integer): Boolean;
	procedure	fnUpdateGridMemDataRecord		(nExCode: Integer; nTagKind: Integer);
//<HIS0078 start>
//	procedure PrintDlg;
//	procedure PrintMem1	(cDlgPrint: TMJSPrnDlgf);
//	procedure PrintMem2	(cDlgPrint: TMJSPrnDlgf);
//	procedure PrintMem3 (cDlgPrint: TMJSPrnDlgf);
//	procedure PrintMem4 (cDlgPrint: TMJSPrnDlgf);
//	procedure PrintMem5 (cDlgPrint: TMJSPrnDlgf);
//	procedure PrintMem6 (cDlgPrint: TMJSPrnDlgf; iKbn: Integer);
//	procedure FileOut;
//<HIS0078 end>
	procedure SelectFusenColor(SelectFusen: Integer);
//<HIS0078 start>
//	procedure SetFileOutTF(Select: Integer; var sTitle: TStringList; var sMemFld: TStringList);
//<HIS0078 end>
	function  SetDspCodeAttr(sCode: String; iLength,iAttr: integer): String;
	function  fnMakeSQL(FLAG,StratEndFlag: Boolean):String;

	function  fnSwkDetailCheck(nSumDivision: Integer; nExCode: Integer):Integer;	//HIS0010

	function  fnSectionCodeCheck(nSumDivision: Integer; nExCode: Integer):String;	//HIS0027
	procedure MComboBoxInit(Sender: TObject);
	procedure fnUpdateTekiyouBunrui(Sender: TObject);

	procedure	WMShowMessage(var Msg: TMessage); message WM_SHOW_MESSAGE;

    //--- HIS0028 St -----
	procedure fnSearch		();
	function  fnDownSearch	():Boolean;
    //--- HIS0028 Ed -----
//<HIS0078 start>
//	function	fnGetKousyu(	nDivision : Integer ):integer;
//<HIS0078 end>
//	procedure	fnEditInit;		// <HIS0052> DEL
    function    fnGetNCode(TblKbn,iSumKbn,iGCode:Integer;Def:Extended=-1):Extended;
    function    fnGetHojNCode(iMstKbn:Integer;sGCode:String):Extended;
//    function    fnGetKmkGCode(MstKbn:Integer;pNCode:Extended):Integer;
    function    fnGetHojGCode(TblKbn:Integer; pNCode:Extended):String;
    function    fnGetKmkSubNCode(iGCode:Integer; sSubCode:String):Extended;

    function    fnGetKmkGCodeInt(pNCode:Extended):Integer;
// <HIS0052> MOD start
//    function    fnGetKmkGCodeStr(pNCode:Extended):String;
    function    fnGetKmkGCodeStr(pNCode: Extended; pSubNCode:Extended):String;
// <HIS0052> MOD end
//<HIS0078 start>
//	function    fnGetDspData(nCount:Integer; sCode: String ;MaxDigitKbn:Boolean): String;
//<HIS0078 end>
    procedure   fnGetMasterKbnFX();
    procedure   fnChgBtnAction;
    procedure   fnGetGrants();
    procedure   fnCreatePrintMem1();    //<PRN>
    //<HIS0043>
    procedure   fnCreatePrintMem5();
    //<HIS0043>

    //<HIS0044>
    procedure   fnCreatePrintMem6();
    //<HIS0044>

    procedure	fnCreatePrintIchiran ();    //<HIS0046>
    procedure	fnCreatePrintTaikei ();     //<HIS0047>
    procedure   fnCreatePrintBunrui ();     //<HIS0048>
    procedure	fnCreatePrintSwDicTeki();	//<HIS0052>

    function    fnGetNCode2(iSumKbn,iGCode:Integer; var strName: String):Extended;  // <CHK>
    function    fnDelCheck(exNCode: Extended; var strErr: String): Boolean;         // <CHK>
	// <HIS0052>
	function  fnGetCode(iMasterKbn: Integer; strCode: String; iDCKbn: Integer): String;
    function  GetSwDicCode(iMasterKbn: Integer; iDCKbn: Integer; var exNCode: Extended): String;
	function  fnGetKbn(iMasterKbn: Integer; iDCKbn: Integer): Integer;
    function  IsBusyoDenpyo(): Boolean;
    function  GetDicKbn(iMasterKbn: Integer; iDCKbn: Integer; qry: TMQuery): Integer;
	function  GetDicNCode(iMasterKbn: Integer; iDCKbn: Integer; qry: TMQuery): Extended;
    function  GetAryIndex(iMasterKbn: Integer; iDCKbn: Integer): Integer;
    function  GetMasterIndex(iMasterKbn: Integer): Integer;
	function  GetKmkNCode(iKmkCode: Integer): Extended;
    function  GetTableName(iMasterKbn: Integer):String;
    function  GetWhere(iMasterKbn: Integer; strJoin: String = ''):String;
    function  CheckInputCode(iMasterKbn: Integer; iDCKbn: Integer; var strGCode: String;
										var exNCode: Extended; var strName: String): Boolean;
	function  GetKbnName(iMasterKbn: Integer; iKbn: Integer): String;
	function  GetZanKbnName(iZanKbn: Integer): String;
	function  GetSTaxKbnName(iSTaxKbn: Integer): String;
	function  GetSTaxRateName(iSTaxRate: Integer): String;
	function  GetTypeCodeName(iTypeCode: Integer): String;
    function  GetKmkHojDspCd(exKmkNCode: Extended; exNCode: Extended): String;
//<HIS0078 start>
//	function  GetTaxCode(iDKmkCode: Integer; iCKmkCode: Integer; var iRate: Integer): Integer;
	function  GetTaxCode(iDKmkCode: Integer; iCKmkCode: Integer; var iRate: Integer;var iTypeCode:Integer): Integer;
//<HIS0078 end>
    function  IsKousyuSaiyo(iMasterKbn: Integer; exNCode: Extended): Boolean;
    function  GetPrjAryIndex(iMasterKbn: Integer): Integer;
    function  IsUriageKmk(iDKmkCode: Integer; iCKmkCode: Integer): Boolean;
//<HIS0094>↓↓引数追加
//  procedure RemakeSwkTypeList(iMasterKbn: Integer);
    procedure RemakeSwkTypeList(iMasterKbn: Integer; iCmnFlg: Integer = 0);
//<HIS0094>↑↑
    procedure ChangeSwDic(iDCKbn: Integer);
    procedure SetInputParam(iMasterKbn: Integer; iDCKbn: Integer; par: TFDParam);
//<HIS0094>↓↓引数追加
//	procedure GetCommonSection(iDCKbn: Integer; iIndex: integer;
//									var strCode: String; var strName: String);
	procedure GetCommonSection(iDCKbn: Integer; iIndex: integer;
									var strCode: String; var exNCode: Extended; var strName: String);
//<HIS0094>↑↑
// <HIS0056> MOD start
//	procedure SetExpParam(iMasterKbn: Integer; var lvExpSend: rcJNTExpSend; exKmkNCode: Extended);
//<HIS0094>↓↓引数追加
//	procedure SetExpParam(iMasterKbn: Integer; var lvExpSend: rcJNTExpSend; iBPKbn: Integer; exKmkNCode: Extended);
	procedure SetExpParam(iMasterKbn: Integer; var lvExpSend: rcJNTExpSend; iBPKbn: Integer; exKmkNCode: Extended; iDCKbn: Integer);
//<HIS0094>↑↑
// <HIS0056> MOD end
// <HIS0090>DEL↓
//  procedure GetSwkDicName(iMasterKbn: Integer; exNCode: Extended;
//									var strCode: String; var strName: String);
// <HIS0090>DEL↑
// <HIS0090>ADD↓
    procedure GetSwkDicName(iMasterKbn: Integer; exKmkNCode,exNCode: Extended;
                                    var strCode: String; var strName: String);
// <HIS0090>ADD↑
    procedure GetSwDicPrnInfo(iMasterKbn: Integer; iDCKbn: Integer; QryDic: TMQuery;
									var strCode: String; var strName: String);
	procedure CopyCSVSwDicTeki(QryDic: TMQuery; aryDHojyo: TAryDicPrint; aryCHojyo: TAryDicPrint);
	procedure ChangeTaxKbn();
    procedure ClearAry(var aryTarget: array of TRecMaster);
	// <SYNC> ADD start
    function  fnCorpRelation(iGCode: Integer; iSumKbn: Integer): Integer;
    function  fnAllCorpRelation(iGCode: Integer; exNCode: Extended): Boolean;
    function  fnDelCheckChild(exNCode: Extended): Boolean;
	function  GetSecMain(): Boolean;
	function  CheckMasterRange(iGCode: Integer; exSegNCode: Extended): Boolean;
    function  GetUpdNCode(var exNCode: Extended): Boolean;
	procedure ExecParentDBTran(iTrnKind: Integer);
	procedure ErrorMessageDsp(Query: TMQuery);

	// <SYNC> ADD end
    function  GetTekiMasterInfo(): Integer;	// <HIS0058> ADD
	procedure CallSyncDlg();				// <HIS0065> ADD

    function  fnDelCRLF(sData: String): String;	// <DKAI> 改行削除
    function  fnTekiTreeFukkyu(): Boolean;  //<FUKKYU> ADD
	procedure ToolBarObjectMove;			//<XXX>
    procedure SettingTypeCode();  //<HIS0105>
    procedure CustomSetFocus(oComs : array of TWinControl; index: Integer=0);   //<HIS0108> ADD
    procedure CreateTaxSalesItems();  //<HIS0110> ADD
    function fnCheckTaxValue(pDivision, pTaxRate, pTaxCode : Integer): Integer;  //<HIS0111> ADD
  public
	{ Public 宣言 }
  end;

function AppEntry(pPar : Pointer) : integer;

exports
	AppEntry;

implementation

(*H0002 20030820 khattori syuusei 会社単独廃止対応*)
{$I JNTMASExceptIFB.inc}
//{$I Log_Writer_2.inc}  //*Log*

var
	//	売上																			税率	業種
//	_TaxSalesItems: array [0..18] of TaxItems	 =      // <HIS0079> DEL	<HIS0081>復活 <HIS0083>削除
//<HIS0110> DEL St
{
	_TaxSalesItems: array [0..19] of TaxItems	 =      // <HIS0079> ADD	<HIS0081>削除 <HIS0083>復活
		(
			(sWord:' 0: 科目設定に従う'					;	iRate:0;	iType:0	),
			(sWord:' 0: 標準設定に従う'					;	iRate:0;	iType:0	),                  // <HIS0079> ADD	<HIS0081>削除 <HIS0083>復活
			(sWord:'10: 課税売上(内税)'					;	iRate:1;	iType:1	),	//	○		○
			(sWord:'12: 課税売上控除(内税)'				;	iRate:1;	iType:1	),	//	○		○
			(sWord:'13: 課税貸倒償却(内税)'				;	iRate:1;	iType:0	),	//	○
			(sWord:'15: 課税貸倒回収(内税)'				;	iRate:1;	iType:0	),	//	○
			(sWord:'20: 課税売上(外税)'					;	iRate:1;	iType:1	),	//	○		○
			(sWord:'22: 課税売上控除(外税)'				;	iRate:1;	iType:1	),	//	○		○
			(sWord:'23: 課税貸倒償却(外税)'				;	iRate:1;	iType:0	),	//	○
			(sWord:'25: 課税貸倒回収(外税)'				;	iRate:1;	iType:0	),	//	○
			(sWord:'30: 非課税売上'						;	iRate:0;	iType:0	),
//			(sWord:'34: 有価証券売上高(非課税)'			;	iRate:0;	iType:0	),                  // <HIS0104> MOD
			(sWord:'34: 有価証券売上等(非課税)'			;	iRate:0;	iType:0	),                  // <HIS0104> MOD
			(sWord:'40: 不課税売上(精算取引)'			;	iRate:0;	iType:0	),
			(sWord:'60: 輸出売上'						;	iRate:0;	iType:0	),
			(sWord:'64: 非課税輸出売上'					;	iRate:0;	iType:0	),
			(sWord:'80: 課税仕入対応特定収入'			;	iRate:0;	iType:0	),
			(sWord:'81: 共通仕入対応特定収入'			;	iRate:0;	iType:0	),
			(sWord:'84: 非課税仕入対応特定収入'			;	iRate:0;	iType:0	),
			(sWord:'89: 使途不特定の特定収入'			;	iRate:0;	iType:0	),
			(sWord:'99: 不明'							;	iRate:0;	iType:0	)
		);
}
//<HIS0110> DEL Ed
	//	仕入																			税率	業種
//	_TaxStockItems: array [0..23] of TaxItems	 =      // <HIS0079> DEL	<HIS0081>復活 <HIS0083>削除
//	_TaxStockItems: array [0..24] of TaxItems	 =      // <HIS0079> ADD	<HIS0081>削除 <HIS0083>復活
//	_TaxStockItems: array [0..28] of TaxItems	 =		// <HIS0101> ADD 仕入消費税CD「15」「16」「25」「26」追加
    _TaxStockItems: array [0..34] of TaxItems	 =      // <#TAX10> ADD 仕入消費税CD「80」「81」「82」「84」「85」「86」追加
		(
			(sWord:' 0: 科目設定に従う'					;	iRate:0;	iType:0	),
			(sWord:' 0: 標準設定に従う'					;	iRate:0;	iType:0	),                  // <HIS0079> ADD	<HIS0081>削除 <HIS0083>復活
			(sWord:'10: 課税仕入(内税)'					;	iRate:1;	iType:0	),	//	○
			(sWord:'11: 共通仕入(内税)'					;	iRate:1;	iType:0	),	//	○
			(sWord:'12: 課税仕入控除(内税)'				;	iRate:1;	iType:0	),	//	○
			(sWord:'14: 非課税売上対応仕入(内税)'		;	iRate:1;	iType:0	),	//	○
			(sWord:'15: 共通仕入控除(内税)'				;	iRate:1;	iType:0	),	//	○          //<HIS0101> ADD
			(sWord:'16: 非課税売上対応仕入控除(内税)'	;	iRate:1;	iType:0	),	//	○          //<HIS0101> ADD
			(sWord:'20: 課税仕入(外税)'					;	iRate:1;	iType:0	),	//	○
			(sWord:'21: 共通仕入(外税)'					;	iRate:1;	iType:0	),	//	○
			(sWord:'22: 課税仕入控除(外税)'				;	iRate:1;	iType:0	),	//	○
			(sWord:'24: 非課税売上対応仕入(外税)'		;	iRate:1;	iType:0	),	//	○
			(sWord:'25: 共通仕入控除(外税)'				;	iRate:1;	iType:0	),	//	○          //<HIS0101> ADD
			(sWord:'26: 非課税売上対応仕入控除(外税)'	;	iRate:1;	iType:0	),	//	○          //<HIS0101> ADD
			(sWord:'30: 非課税仕入'						;	iRate:0;	iType:0	),
			(sWord:'40: 不課税仕入(精算取引)'			;	iRate:0;	iType:0	),
			(sWord:'50: 棚卸調整消費税(課税)'			;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
			(sWord:'51: 棚卸調整消費税(共通)'			;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
			(sWord:'54: 棚卸調整消費税(非課税)'			;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
			(sWord:'60: 輸入仕入(外税)'					;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
			(sWord:'61: 輸入共通仕入(外税)'				;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
			(sWord:'64: 非課税売上対応輸入(外税)'		;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
			(sWord:'65: 輸入仕入(地方消費税)'			;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
			(sWord:'66: 輸入共通仕入(地方消費税)'		;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
			(sWord:'69: 非課税売上対応輸入(地方)'		;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
			(sWord:'70: 輸入仕入(内税)'					;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
			(sWord:'71: 輸入共通仕入(内税)'				;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
			(sWord:'74: 非課税売上対応輸入(内税)'		;	iRate:1;	iType:0	),  //	○          //<#TAX10> iRate:0→1
 			(sWord:'80: 課税売上対応特定課税仕入'		;	iRate:1;	iType:0	),  //	○          //<#TAX10> ADD
            (sWord:'81: 共通売上対応特定課税仕入'		;	iRate:1;	iType:0	),  //	○          //<#TAX10> ADD
            (sWord:'82: 課税売上対応特定課税仕入控除'	;	iRate:1;	iType:0	),  //	○          //<#TAX10> ADD
            (sWord:'84: 非課税売上対応特定課税仕入'		;	iRate:1;	iType:0	),  //	○          //<#TAX10> ADD
            (sWord:'85: 共通売上対応特定課税仕入控除'   ;	iRate:1;	iType:0	),  //	○          //<#TAX10> ADD
            (sWord:'86: 非課税売上対応特定課税仕入控'	;	iRate:1;	iType:0	),  //	○          //<#TAX10> ADD
			(sWord:'99: 不明'							;	iRate:0;	iType:0	)
		);

	//	共通																			税率	業種
//	_TaxCommonItems: array [0..5] of TaxItems	 =      // <HIS0079> DEL	<HIS0081>復活 <HIS0083>削除
	_TaxCommonItems: array [0..6] of TaxItems	 =      // <HIS0079> ADD	<HIS0081>削除 <HIS0083>復活
		(
			(sWord:' 0: 科目設定に従う'					;	iRate:0;	iType:0	),
			(sWord:' 0: 標準設定に従う'					;	iRate:0;	iType:0	),	// <HIS0079> ADD	<HIS0081>削除 <HIS0083>復活
			(sWord:'10: 課税取引'						;	iRate:1;	iType:1	),	//	○		○
			(sWord:'20: 課税取引'						;	iRate:1;	iType:1	),	//	○		○
			(sWord:'30: 非課税取引'						;	iRate:0;	iType:0	),
			(sWord:'40: 不課税取引（精算取引）'			;	iRate:0;	iType:0	),
			(sWord:'99: 不明'							;	iRate:0;	iType:0	)
		);

	_KanaOrderChar  : array [0..44] of Char		 =
		(
			'ｱ', 'ｲ', 'ｳ', 'ｴ', 'ｵ', 'ｶ', 'ｷ', 'ｸ', 'ｹ', 'ｺ',
			'ｻ', 'ｼ', 'ｽ', 'ｾ', 'ｿ', 'ﾀ', 'ﾁ', 'ﾂ', 'ﾃ', 'ﾄ',
			'ﾅ', 'ﾆ', 'ﾇ', 'ﾈ', 'ﾉ', 'ﾊ', 'ﾋ', 'ﾌ', 'ﾍ', 'ﾎ',
			'ﾏ', 'ﾐ', 'ﾑ', 'ﾒ', 'ﾓ', 'ﾔ', 'ﾕ', 'ﾖ',
			'ﾗ', 'ﾘ', 'ﾙ', 'ﾚ', 'ﾛ', 'ﾜ', 'ﾝ'
		);

	_KanaOrderSymbol: array [0..44] of String	 =
		(
			'あ', 'い', 'う', 'え', 'お', 'か', 'き', 'く', 'け', 'こ',
			'さ', 'し', 'す', 'せ', 'そ', 'た', 'ち', 'つ', 'て', 'と',
			'な', 'に', 'ぬ', 'ね', 'の', 'は', 'ひ', 'ふ', 'へ', 'ほ',
			'ま', 'み', 'む', 'め', 'も', 'や', 'ゆ', 'よ',
			'ら', 'り', 'る', 'れ', 'ろ', 'わ', 'ん'
		);

const
	CHECKLIST				=	990100;	//	帳票ｸﾞﾙｰﾌﾟNo(ﾁｪｯｸﾘｽﾄ系)

	//	参照フラグ時に使用		HIS0004
	NORMAL					=	1;		//	通常処理
	BASICONLY				=	2;		//	基本のみ設定可能(詳細ボタン使用不可)
	REFER					=	3;		//	参照

	KOTEITEKIYOU			=	1;		//	固定摘要
	SHIEAKE					=	2;		//	仕訳辞書摘要
	TEKIYOUBUNRUI			=	3;		//	固定摘要分類
	TEKIYOUTAIKEI			=	4;		//	固定摘要体系
	KAMOKURENSOU1			=	5;		//	科目連想(科目順)
	KAMOKURENSOU2			=	6;		//	科目連想(摘要コード順)
	KAMOKURENSOU3			=	7;		//	科目連想(摘要連想順)
	KANAORDER				=	9;		//	固定摘要一覧表


	DIVISION_SUBJECT		=	88;
	DIVISION_NEWRECORD		=	99;

	ACCESS_TREE_ADD			=	1;
	ACCESS_TREE_INSERT		=	2;
	ACCESS_TREE_UPDATE		=	3;
	ACCESS_TREE_DELETE		=	4;

	MASTER_SUBJECT			=	1;		//	勘定科目
	MASTER_SUBJECTPLUS		=	2;		//	細目科目
	MASTER_BANK				=	21;		//	銀行
	MASTER_CUSTOMER			=	22;		//	取引先
	MASTER_CUSTOMERPLUS01	=	23;		//	得意先
	MASTER_CUSTOMERPLUS02	=	24;		//	仕入先
	MASTER_STAFF			=	25;		//	社員
	MASTER_GENERAL01		=	31;		//	汎用補助①
	MASTER_GENERAL02		=	32;		//	汎用補助②
	MASTER_GENERAL03		=	33;		//	汎用補助③
	MASTER_GENERAL04		=	34;		//	汎用補助④
	MASTER_GENERAL05		=	35;		//	汎用補助⑤
	MASTER_SECTION			=	41;		//	部門
	MASTER_SEGMENT01		=	42;		//	ｾｸﾞﾒﾝﾄ①
	MASTER_SEGMENT02		=	43;		//	ｾｸﾞﾒﾝﾄ②
	MASTER_SEGMENT03		=	44;		//	ｾｸﾞﾒﾝﾄ③
	MASTER_SEGMENT04		=	45;		//	ｾｸﾞﾒﾝﾄ④

//<HIS0033>	MASTER_CONSTRUCT		=	51;		//	工事
//<HIS0033>	MASTER_CONSTKIND		=	52;		//	工種

    ucSSG_MKBN              =   101;     //  ｾｸﾞﾒﾝﾄ開始     <HIS0033>
    ucESG_MKBN              =   199;     //  ｾｸﾞﾒﾝﾄ終了     <HIS0033>

    ucSKO_MKBN              =   201;     //  ﾌﾟﾛｼﾞｪｸﾄ開始   <HIS0033>
    ucEKO_MKBN              =   299;     //  ﾌﾟﾛｼﾞｪｸﾄ開始   <HIS0033>

	TYPE_EDIT_K1			=	0;		//	科目
	TYPE_EDIT_K2			=	1;		//	細目科目
	TYPE_EDIT_BU			=	2;		//	部門
	TYPE_EDIT_SG			=	3;		//	ｾｸﾞﾒﾝﾄ
	TYPE_EDIT_H1			=	4;		//	第1補助
	TYPE_EDIT_H2			=	5;		//	第2補助
	TYPE_EDIT_KO			=	6;		//	工事
	TYPE_EDIT_KS			=	7;		//	工種

	CHECK_OK				=	0;
	CHECK_NG				=	-1;
	CHECK_NORECORD			=	-2;		//	ｴﾗｰｺｰﾄﾞ:【共通    】該当ﾚｺｰﾄﾞなし
	CHECK_KM_NOENTRY		=	-11;	//	ｴﾗｰｺｰﾄﾞ:【勘定科目】入力不可
	CHECK_KM_NOENTRY_POS	=	-12;	//	ｴﾗｰｺｰﾄﾞ:【勘定科目】入力不可(正残側のみ)
	CHECK_KM_NOENTRY_NEG	=	-13;	//	ｴﾗｰｺｰﾄﾞ:【勘定科目】入力不可(負残側のみ)
	CHECK_KM_NOENTRY_AC		=	-14;	//	ｴﾗｰｺｰﾄﾞ:【勘定科目】入力不可(会計科目のみ)
	CHECK_KM_NOENTRY_ACF	=	-15;	//	ｴﾗｰｺｰﾄﾞ:【勘定科目】入力不可(非会計科目のみ)
	CHECK_BU_NOENTRY_PL		=	-21;	//	ｴﾗｰｺｰﾄﾞ:【部門    】入力不可(P/L部門のみ)
	CHECK_BU_NOENTRY_BS		=	-22;	//	ｴﾗｰｺｰﾄﾞ:【部門    】入力不可(B/S部門のみ)
	CHECK_HO_NOENTRY_SA		=	-31;	//	ｴﾗｰｺｰﾄﾞ:【補助    】入力不可(得意先未採用)
	CHECK_HO_NOENTRY_ST		=	-32;	//	ｴﾗｰｺｰﾄﾞ:【補助    】入力不可(仕入先未採用)

	TABLE_TEKIMA			=	131;	//	ﾃｰﾌﾞﾙ:【TekiMA   】固定摘要ﾏｽﾀ
	TABLE_SWDICTEKI			=	132;	//	ﾃｰﾌﾞﾙ:【SwDicTeki】仕訳辞書摘要ﾏｽﾀ
	TABLE_TEKITREE			=	133;	//	ﾃｰﾌﾞﾙ:【TekiTree 】固定摘要分類体系ﾏｽﾀ

	CONFIRM_EDITCODE		=	0;		//	ｺｰﾄﾞ欄編集
	CONFIRM_CANCEL			=	1;		//	取消ﾎﾞﾀﾝ
	CONFIRM_EXIT			=	2;		//	終了ﾎﾞﾀﾝ

	CONFIRM_THROUGH			=	0;
	CONFIRM_RETFOCUSED		=	1;		//	元の位置にﾌｫｰｶｽを戻す
	CONFIRM_EXITWRITE		=	2;		//	ﾃﾞｰﾀを保存して処理を終了

//<HIS0031>
    EXCEPT_RET_OK           =   0;
    EXCEPT_RET_NG           =   1;

    TBL_TEKI                =   1;      // HIS0035
    TBL_KAMOK               =   2;      // HIS0035

// <HIS0052> ADD start
										// 科目の区分
	KMKKBN_KIJUN			= 0;		// 基準
    KMKKBN_OKIKAE			= 1;		// 置換

										// 区分
	KBN_KIJUN				= 0;		// 基準
    KBN_KAHEN				= 1;		// 可変
    KBN_TOUGAI				= 2;		// 当該

    TEXT_KIJUN				= '基準';
    TEXT_OKIKAE				= '置換';
    TEXT_KAHEN				= '可変';
    TEXT_TOUGAI				= '当該';

    PRN_TEXT_KAHEN	  		= '可変マスタ';
    PRN_TEXT_TOUGAI	  		= '当該マスタ';
										// 仕訳辞書ｸﾞﾘｯﾄﾞのｶﾗﾑindex
	SWKCLM_KBN				= 1;		// 区分
	SWKCLM_CODE				= 3;		// ｺｰﾄﾞ
    SWKCLM_ATTR				= 5;		// 属性(不可視)
	SWKCLM_DIGIT			= 6;		// 桁数(不可視)
    SWKCLM_MASTERKBN		= 8;		// ﾏｽﾀ区分(不可視)

	CODE_ATTR_NUM		    = 0;		// ｺｰﾄﾞ属性 0：数字(Number)
	CODE_ATTR_0NUM		    = 1;		// ｺｰﾄﾞ属性 1：前ｾﾞﾛ数字(Char)
	CODE_ATTR_FREE		    = 2; 	    // ｺｰﾄﾞ属性 2：ﾌﾘｰ(Char)

    DBDIGIT_TEKIYO			= 6;		// 固定摘要ｺｰﾄﾞのDB上のﾃﾞﾌｫﾙﾄ桁数(数字) <HIS0058> ADD
    DBDIGIT_KAMOKU          = 8;        // 科目ｺｰﾄﾞのDB上の桁数(数字)
    DBDIGIT_ETC             = 16;       // 科目以外のDB上の桁数(数字/前ｾﾞﾛ数字)

	DC_KARIKATA				= 0;		// 借方
    DC_KASIKATA				= 1;		// 貸方

    // 消費税区分
    TAXKBN_OTHER			= 0;		// 対象外
    TAXKBN_URIAGE			= 1;		// 売上科目
    TAXKBN_SIIRE			= 2;		// 仕入科目

	// 採用情報配列のindex
	IDX_KAMOKU				= 0;		// 科目
	IDX_BUMON				= 1;		// 部門
    IDX_PRJ1				= 2;		// ﾌﾟﾛｼﾞｪｸﾄ1
    IDX_PRJSUB1				= 3;		// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1
    IDX_PRJ2				= 4;
    IDX_PRJSUB2				= 5;
    IDX_PRJ3				= 6;
    IDX_PRJSUB3				= 7;
    IDX_PRJ4				= 8;
    IDX_PRJSUB4				= 9;
    IDX_PRJ5				= 10;
    IDX_PRJSUB5				= 11;
    IDX_PRJ6				= 12;
    IDX_PRJSUB6				= 13;
    IDX_PRJ7				= 14;
    IDX_PRJSUB7				= 15;
    IDX_PRJ8				= 16;
    IDX_PRJSUB8				= 17;
    IDX_PRJ9				= 18;
    IDX_PRJSUB9				= 19;
    IDX_PRJ10				= 20;		// ﾌﾟﾛｼﾞｪｸﾄ10
    IDX_PRJSUB10			= 21;		// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ10
    IDX_KMKHOJ				= 22;		// 科目別補助
    IDX_BANK				= 23;		// 銀行
    IDX_TORIHIKI			= 24;		// 取引先
    IDX_SYAIN				= 25;		// 社員
    IDX_HANYOU1				= 26;		// 汎用補助1
    IDX_HANYOU2				= 27;
    IDX_HANYOU3				= 28;
    IDX_HANYOU4				= 29;
    IDX_HANYOU5				= 30;		// 汎用補助5
    IDX_SEG1				= 31;		// ｾｸﾞﾒﾝﾄ1
    IDX_SEG2				= 32;
    IDX_SEG3				= 33;
    IDX_SEG4				= 34;
    IDX_SEG5				= 35;
    IDX_SEG6				= 36;
    IDX_SEG7				= 37;
    IDX_SEG8				= 38;
    IDX_SEG9				= 39;
    IDX_SEG10				= 40;

// <HIS0052> ADD end

// <SYNC> ADD start
	// ﾏｽﾀ同期ｸﾗｽの採用ﾌﾗｸﾞ
// <HIS0062> MOD start
//	GRP_SYNC_CHILD			= 1;		// ｸﾞﾙｰﾌﾟ会計採用あり&子会社
//	GRP_SYNC_NOTCHILD		= 0;		// ｸﾞﾙｰﾌﾟ会計採用なし または 採用がある場合の親会社
	GRP_SYNC_CHILD			= 1;		// ｸﾞﾙｰﾌﾟ会計採用あり 子会社
	GRP_SYNC_PARENT			= 0;		// ｸﾞﾙｰﾌﾟ会計採用あり 親会社
	GRP_SYNC_NOTUSE			= -1;		// ｸﾞﾙｰﾌﾟ会計採用なし
// <HIS0062> MOD end

	// ｸﾞﾙｰﾌﾟ会計採用区分
	GRP_NOUSE				= 0;		// 採用なし
	GRP_USE					= 1;		// 採用あり

	// ｸﾞﾙｰﾌﾟ会計送受信区分
    GRP_TRANSKBN_PARENT		= 0;		// 親会社
	GRP_TRANSKBN_CHILD		= 1;		// 子会社

	// ｸﾞﾙｰﾌﾟ会計採用時の親会社DBへの指示
	GRP_PARENTDB_BEGINTRAN	= 0;		// ﾄﾗﾝｻﾞｸｼｮﾝ開始
	GRP_PARENTDB_ROLLBACK	= 1;		// ﾛｰﾙﾊﾞｯｸ
	GRP_PARENTDB_COMMIT		= 2;		// ｺﾐｯﾄ

	// 実在/合計区分
	SUMKBN_JITUZAI			= 0;		// 実在
	SUMKBN_GOUKEI			= 1;		// 合計

	PNL_KMKRENSO_TOP		= 76;		// 科目連想ﾊﾟﾈﾙのTop移動位置

	// ﾒｯｾｰｼﾞ
	MSGCAP_GRP				= 'グループ会計';	// <HIS0062> ADD
	MSG_GRP_CODERANGE_ERR	= 'グループ会計での登録可能範囲外のコードです。';
	MSG_GRP_RELATION_ERR	= '自社への関連付けに失敗しました。';
    MSG_GRP_RELATIONALL_ERR	= '子会社への関連付けに失敗しました。';
// <SYNC> ADD end
    MSG_TAXRATEANDCODE      = '選択した消費税コードでは設定できない消費税率です。';  //<HIS0111> ADD

{$R *.DFM}
{$I JNTMASFUSENBIKODLGIFB.inc}
{$i JNTMasWndIF2_B.inc}
{$I JNTCRPSyncMasterB.inc}    		// <SYNC> ﾏｽﾀ同期共通実装部
{$I JNTSyncMasterIFB.inc}   		// <HIS0065> 配信ﾀﾞｲｱﾛｸﾞ共通実装部
{$i JNTCRP020000DTB.inc}
{$i JNTCRP020000EDB.inc}
{$i JNTCRP020000PRB.inc}
{$I JNTMASSEARCHDLGIFB.inc}		    // 検索DLG		HIS0028
{$I MASTaxRateInfoB.inc}			// <HIS0101> 税率情報クラス


//************************************************************************
//	Proccess		:   AppEntry
//	Name			:   Y.Ichihashi
//	Data			:   2000/08/04
//  Parameter	   :   Nothing
//  Return		  :   Nothing
//  History		 :
//************************************************************************
function	AppEntry (pPar :Pointer): Integer;
var
	pForm  : ^TJNTCRP020000f;
	pRecord: ^TMjsAppRecord;

begin
	Result	:= ACTID_RET_OK;
	pRecord	:= Pointer (TAppParam (pPar^).pRecord);

	case (TAppParam (pPar^).iAction) of

		//	Form Create要求
		ACTID_FORMCREATESTART:
			begin
				New (pForm);

				//	ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
				try
					pForm^	:= TJNTCRP020000f.fnCreateForm (pRecord);
					pRecord^.m_pChildForm	:= pForm;
				except
					Dispose (pForm);
					Result	:= ACTID_RET_NG;
				end;
			end;

		//	Form Create&Show要求
		ACTID_FORMCREATESHOWSTART:
			begin
				New (pForm);

				//	ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
				try
					pForm^	:= TJNTCRP020000f.fnCreateForm (pRecord);
					pForm^.Show ();
					pRecord^.m_pChildForm	:= pForm;
				except
					Dispose (pForm);
					Result	:= ACTID_RET_NG;
				end;
			end;

		//	Form Close要求
		ACTID_FORMCLOSESTART:
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);
				pForm^.Close ();
				pForm^.Free  ();
				Dispose (pForm);
			end;

		//	Form CanClose要求
		ACTID_FORMCANCLOSESTART:
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);

				if	(pForm^.CloseQuery () = false) then
					Result	:= ACTID_RET_NG;
			end;

		//	Show要求
		ACTID_SHOWSTART:
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);
				pForm^.Show ();
			end;

		//	Hide要求
		ACTID_HIDESTART:
			begin
				pForm	:= Pointer (pRecord^.m_pChildForm);

				if	(pForm^.Parent <> nil) then
					pForm^.Hide ();
			end;
	end;
end;

//************************************************************************
//	Proccess		:   CreateForm
//	Name			:   Y.Ichihashi
//	Data			:   2000/08/04
//  Parameter	   :   Nothing
//  Return		  :   Nothing
//  History		 :
//************************************************************************
constructor	TJNTCRP020000f.fnCreateForm (pRec: Pointer);
var
	CTRL_DB		:	TFDConnection;
	DmqCtrlDb	:	TMQuery;
	DmqData		:	TMQuery;
	iTanCD		:	Extended;		//	担当者ｺｰﾄﾞ
	sTanName	:	String;			//	担当者名
	bFlag		:	Boolean;		//	担当者がいるかいないか
//	sMessage	:	String;			// <SYNC>DEL
begin
    m_NCodeUse      := false;       //更新ﾎﾞﾀﾝ押し時にON

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	m_bLog			:=	false;//:=	true;
	m_bSkip			:=	false;
	m_stMsgRec.sMsg	:=	'';

	//	初期処理
	bFlag			:=	false;
	iTanCD			:=	0;			//	担当者ｺｰﾄﾞ
	sTanName		:=	'';			//	担当者名
    m_FusenClrIdx   :=  0;

	m_fAccessTab	:= false;

//<HIS0032> Add
    m_cJNTArea      :=  TJNTCommon.Create(Self);
    m_cJNTArea.Init(pRec);
	m_cJNTArea.setMasAppRecord;	    					                        // 販売ポインタ設定

	m_pRec			:= pRec;
//    m_Log := TLog_Writer.Init(0,rcCOMMONAREA ( m_pRec^.m_pCommonArea^ ).SysCliRoot);  //*Log*
	m_cDataModule	:= TMDataModulef (m_pRec^.m_pDBModule^  );
	m_cComArea		:= TJNTMASCom	 (m_pRec^.m_pSystemArea^);

	m_cDBSelect		:= m_cDataModule.COPDBOpen(1, m_pRec.m_iCorpID);

	if	(m_cDBSelect = nil) then
	begin
		ShowMessage ('ｴﾗｰ');
		raise EMathError.Create ('ｴﾗｰ');
	end;

//	ｽﾄｱﾄﾞの初期処理	********			HIS0008
// <SYNC> MOD start
//	DmqData := TMQuery.Create( Application );					//	MQueryの構築
	DmqData := TMQuery.Create( Self );							//	MQueryの構築
// <SYNC> MOD end
	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, DmqData );		//	DBとMQueryの接続

	//	共通ﾒﾓﾘﾎﾟｲﾝﾀの担当者内部ｺｰﾄﾞ		HIS0010
	if (rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD <> -1) then
	begin
		//	CTLDBOpen
		CTRL_DB	:=	m_cDataModule.CTLDBOpen(0);
		if CTRL_DB = nil then
		begin
			ShowMessage('エラー');
			raise EMathError.Create('エラー');
		end;

// <SYNC> MOD start
//		DmqCtrlDb	:=	TMQuery.Create( Application );		 		//	MQueryの構築
		DmqCtrlDb	:=	TMQuery.Create( Self );		 				//	MQueryの構築
// <SYNC> MOD end
		m_cDataModule.SetDBInfoToQuery( CTRL_DB, DmqCtrlDb );		//	DBとMQueryの接続

		DmqCtrlDb.Close;
		DmqCtrlDb.SQL.Clear;
		DmqCtrlDb.SQL.Add('SELECT '				);
		DmqCtrlDb.SQL.Add(	'Name, '			);		//	担当者名
		DmqCtrlDb.SQL.Add(	'NCode '			);		//	担当者ｺｰﾄﾞ
		DmqCtrlDb.SQL.Add('FROM '				);
		DmqCtrlDb.SQL.Add(	'MOS_OFFICE_STAFF '	);
		DmqCtrlDb.SQL.Add('WHERE '				);
		DmqCtrlDb.SQL.Add(	'NCode = :NCode'	);		//	担当者内部ｺｰﾄﾞ
		DmqCtrlDb.ParamByName('NCode').AsFloat	:=	rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
		DmqCtrlDb.Open;

		if (DmqCtrlDb.Eof <> true) then
		begin
			iTanCD		:=	DmqCtrlDb.GetFLD('NCode').AsFloat;
			sTanName	:=	DmqCtrlDb.GetFLD('Name' ).AsString;
		end;

		bFlag	:=	true;

		DmqCtrlDb.Close;
		DmqCtrlDb.Free;
	end;
// HIS0041↓復帰
//{
	DmqData.Close;
	DmqData.SQL.Clear;
	DmqData.SQL.Add(fnMakeSQL(bFlag, true));

	if bFlag = true then
	begin
		DmqData.ParamByName('TANCD'  ).AsFloat := iTanCD;
	end;

	if (DmqData.ExecSQL  = false) then		// MP200010呼出
	begin
// <SYNC> MOD start
(*		sMessage	:=	IntToStr (m_cComArea. m_MsgStd.GetDBCode(DmqData));
		showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりましたが気にせず進んで下さい。');
*)
		ErrorMessageDsp(DmqData);			// DBｴﾗｰﾒｯｾｰｼﾞ表示
// <SYNC> MOD end
	end;

	DmqData.Close;
	DmqData.Free;
//}
// <SYNC> ADD start
    // SyncMasterｸﾗｽの生成
    try
        m_SyncMaster := TSyncMaster.Create(Self, m_pRec, m_cJNTArea, m_cDBSelect);
        m_SyncMaster.InitData();
// <HIS0062> ADD start
											// 子会社の場合
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
		begin								// 同期ｽﾄｱﾄﾞ呼出
			m_SyncMaster.fnCall_SYNC(JNTSYNC_TEKIMA);
        end;
// <HIS0062> ADD end

    except
        raise;
    end;

    GetSecMain();   						// ｾｷｭﾘﾃｨ基本情報取得
// <SYNC> ADD end

//*****************************************

(*H0002 20030820 khattori syuusei 会社単独廃止対応*)
	m_cExcept	:=	nil;
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	m_iRet		:=	EXCEPT_RET_NG;
//	m_iRet		:=	EXCEPT_RET_OK;

(*khattori*)
	miInit	:=	0;		//	０＝初回

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

    m_SyncMaster.m_AOwner := TForm(m_pRec^.m_pOwnerForm^);  // <SYNC> ADD

inherited Create(TForm(m_pRec^.m_pOwnerForm^))

end;

//************************************************************************
//*	 ProgramID	   :   JNTCRP020000
//*	 Component	   :   FormCreate（ﾌｫｰﾑを作成した時）
//*	 Name			:   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnJNTCRP020000fOnCreate (Sender: TObject);
var
	dqMasterData: TMQuery;
    iRet        :   Integer;        // <PRN>
    lvHandle    :   THandle;        // <PRN>
	iIndex		:	Integer;		// <HIS0052>
	sMLWF       :   String;         // <MLXDEP>
begin
	Parent	:= TPanel (m_pRec^.m_pOwnerPanel^);
	Align	:= alClient;

	dqMasterData	:= TMQuery.Create (Self);       									// MQueryの構築

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData	);						// DBとMQueryの接続

// <HIS0063> DEL start
(*	PRB.incで参照しているだけなので削除(PRB.incは使われない)
	m_cPreview	:= TMJSPreviewIF.Create ();
	m_cPreview.Init (m_pRec);
*)
// <HIS0063> DEL end

    fnGetMasterKbnFX();     //<HIS0033>
    fnGetGrants();          // 権限取得

	with (dqMasterData) do
	begin
		Close ();
		SQL.Clear ();

// <HIS0052> MOD start
//		SQL.Add   ('SELECT YearKbn ,ComKbn3, ComKbn4, DataKbn, ComCode FROM DTMAIN,DTMAIN_MAS');
//<HIS0105> DEL		SQL.Add   ('SELECT YearKbn ,ComKbn3, ComKbn4, DataKbn, ComCode, KStDate, KEdDate FROM DTMAIN,DTMAIN_MAS');
// <HIS0052> MOD end
//<HIS0105> ADD St
        SQL.Add(' SELECT ');
        SQL.Add('     YearKbn, ');
        SQL.Add('     ComKbn3, ');
        SQL.Add('     ComKbn4, ');
        SQL.Add('     DataKbn, ');
        SQL.Add('     ComCode, ');
        SQL.Add('     KStDate, ');
        SQL.Add('     KEdDate, ');
        SQL.Add('     DataVer ');
        SQL.Add(' FROM ');
        SQL.Add('     DTMAIN, ');
        SQL.Add('     DTMAIN_MAS ');
//<HIS0105> ADD Ed

		Open ();

		m_nDateFormatDivision	:= FieldByName ('YearKbn').AsInteger;					// 和暦/西暦区分
		m_nMailAdoption			:= FieldByName ('ComKbn3').AsInteger;					// ﾒｰﾙ会計処理区分
		m_nCompDivision			:= FieldByName ('ComKbn4').AsInteger;					// 公益法人区分

		m_DataKbn				:= FieldByName ('DataKbn').AsInteger;	//HIS0027
		m_ComCode				:= FieldByName ('ComCode').AsInteger;	//HIS0027

	    m_dateKStDate   		:= FieldByName ('KStDate').AsDateTime;  // 決算開始年月日 <HIS0052> ADD
    	m_dateKEdDate   		:= FieldByName ('KEdDate').AsDateTime;  // 決算終了年月日 <HIS0052> ADD

        m_iDataVer              := FieldByName ('DataVer').AsInteger;   // 会社DBバージョン  //<HIS0105> ADD
		Close ();
	end;

    CreateTaxSalesItems();  //<HIS0110> ADD

	if	(m_nMailAdoption = 1) then
	begin
		CmnToolbarButtonDelete	.Visible	:= false;
		CmnTreeViewPopupMenuDelete.Visible	:= false;
	end;

	//	複合科目コード取得
	GetHukugouCode;

	//	消費税基本情報: 会計処理区分 (0:免税業者)
	m_nTaxAccDivision	:= 0;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT AccProKbn FROM TaxInfo');

		Open ();

		//	会計処理区分 (0:免税, 1:税込, 2:税抜)
		if	(not EOF) then
			m_nTaxAccDivision	:= GetFld ('AccProKbn').AsInteger;

		Close ();
	end;

	dqMasterData.Free ();

	m_nProcDivision		:= 0;
	m_nExCodeCurrent	:= -1;
	m_nSelectTagKind	:= 0;
	m_nDBErrorCode		:= 0;
	m_cNodePrevSelect	:= nil;
	m_fAppExit			:= false;
	m_fDtlNewRecord		:= false;
	m_fUpdateRecord		:= true;
	m_fComboBoxListDraw	:= true;
	m_fDeleteSwDicTeki	:= false;
	m_fChangeDetails	:= false;

	m_fDeleteTekiTree [0]	:= false;
	m_fDeleteTekiTree [1]	:= false;

	m_fDeleteTekizan	:= false;		//HIS0021

	m_stWorkRecPaste.nDivision	:= 9;
	m_stWorkRecPaste.nExCode	:= 0;
	m_stWorkRecPaste.strName	:= '';
//<HIS0082 start>
	fSearch				:= False;
	fFirst				:= True;
	iMasterKbn1			:= 0;
//<HIS0082 end>
	CmnTreeView				.Enabled	:=	false;
	CmnSplitter				.Enabled	:=	false;
//	CmnToolbarButtonPrint	.Enabled	:=	false;
	CmnToolbarButtonDetail	.Enabled	:=	false;
	CmnToolbarButtonDelete	.Enabled	:=	false;
    fnEnableToolbarButtonTag(False);
	StdCmnClientPanel		.Enabled	:=	false;
	DtlCmnClientPanel		.Enabled	:=	false;
	DtlCmnClientPanel		.Visible	:=	false;

   	m_SearchInfo.iTekiCD    := 0;												//HIS0028

	//	会計処理区分: 0=免税
	if	(m_nTaxAccDivision = 0) then
	begin
//		DtlCmnLbelGroupSepTaxInfo	.Visible	:=	false;	// <HIS0052> DEL
		DtlCmnLbelGroupComTaxInfo	.Visible	:=	false;
		ClearTaxEdit(1,1);
		ClearTaxEdit(2,1);
		ClearTaxEdit(3,1);
		ClearTaxEdit(4,1);
//<HIS0101> MOD st
//	end;
		m_TaxRateInfo := Nil;
	end
    else
    begin
        m_TaxRateInfo := TMASTaxRateInfo.Create(m_pRec, m_cDBSelect);
        //<#TAX10> Mod↓標準税率を表示させる
        //m_TaxRateInfo.StdTaxRateName := '科目設定に従う';
        m_TaxRateInfo.AddReducedExpress := 1;       //軽減表記付与(税率の後ろに「軽減」)
        //<#TAX10> Mod↑
        m_TaxRateInfo.IntInpKbn		 := 0;	// 消費税率入力区分取得を行わせない為。(使わないので。)
        m_TaxRateInfo.Initialize();
        DtlCmnEditTaxRate.SelectItems.Text := m_TaxRateInfo.GetTextOfRateCDsAndTaxNames();
    end;
//<HIS0101> MOD ed

	StdCmnGridExist.FocusedColumn   	:= 1;
	StdCmnGridTotal.FocusedColumn   	:= 0;

	fnSetMasterInfoData ();

    iIndex := GetMasterIndex(MKBN_TORIHIKI);// <HIS0052> ADD

// <HIS0052> MOD start
//	DtlCmnLbelDealDivisionTitle.Caption	:= m_stAdoptInfo [3].strDescription + '区分';
//	DtlCmnLbelDealClassTitle   .Caption	:= m_stAdoptInfo [3].strDescription + '分類';
	DtlCmnLbelDealDivisionTitle.Caption	:= m_stAdoptInfo [iIndex].strDescription + '区分';
	DtlCmnLbelDealClassTitle   .Caption	:= m_stAdoptInfo [iIndex].strDescription + '分類';
// <HIS0052> MOD end

	DtlCmnEditDealDivision.SelectItems.Add (' 0: なし');
// <HIS0052> MOD start
//	DtlCmnEditDealDivision.SelectItems.Add ('22: ' + m_stAdoptInfo [3].strDescription);
	DtlCmnEditDealDivision.SelectItems.Add ('22: ' + m_stAdoptInfo [iIndex].strDescription);
// <HIS0052> MOD end
	DtlCmnEditDealDivision.SelectItems.Add ('23: 得意先');
	DtlCmnEditDealDivision.SelectItems.Add ('24: 仕入先');

// <HIS0058> ADD start
	// 固定摘要のｺｰﾄﾞ桁数取得
    m_iTekiDigit := GetTekiMasterInfo();

	// 固定摘要ｺｰﾄﾞの桁数設定
	DtlCEdtExCd.Digits := m_iTekiDigit;     // 詳細
    										// 実在ｸﾞﾘｯﾄﾞ
    StdCmnGridExistCode.MaxLength := m_iTekiDigit;
    										// 合計ｸﾞﾘｯﾄﾞ
    StdCmnGridTotalCode.MaxLength := m_iTekiDigit;
// <HIS0058> ADD end

// <SYNC> ADD start
											// 子会社の場合
	if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
    begin                            		// 科目連想ﾊﾟﾈﾙを上に移動
    	DtlCmnPanelAddition4.Top := PNL_KMKRENSO_TOP;
        DtlCmnPanelAddition2.Visible := False;
    end;
// <SYNC> ADD end

	m_cACControl	:= CmnComboBoxInstruction;
	m_fAccessTab	:= true;

	MJSColorChange (TJNTCRP020000f (Self), m_cComArea.SystemArea.SysColorB, m_cComArea.SystemArea.SysColorD,
									m_cComArea.SystemArea.SysBaseColorB, m_cComArea.SystemArea.SysBaseColorD,
															rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	MJSFontResize (TJNTCRP020000f (Self),Pointer (m_pRec));

	DtlCmnGrid.GridLineColor	:= m_cComArea.SystemArea.SysColorB;
	DtlCmnGrid.BandColor		:= m_cComArea.SystemArea.SysColorD;
	DtlCmnGrid.HeaderColor		:= m_cComArea.SystemArea.SysColorD;
	DtlCmnGrid.HighlightColor	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor;

	//	詳細画面ｸﾞﾘｯﾄﾞ[摘要残管理]用MemData 初期化
	DtlCmnMemDataControl.Open   ();
	DtlCmnMemDataControl.Append ();
	DtlCmnMemDataControl.FieldByName ('nDivision'	 ).AsInteger	:= 0;
	DtlCmnMemDataControl.FieldByName ('strDescription').AsString	:= '管理なし';
	DtlCmnMemDataControl.Post   ();
	DtlCmnMemDataControl.Append ();
	DtlCmnMemDataControl.FieldByName ('nDivision'	 ).AsInteger	:= 1;
	DtlCmnMemDataControl.FieldByName ('strDescription').AsString	:= '管理あり';
	DtlCmnMemDataControl.Post ();

// <HIS0055> ADD start
	RemakeSwkTypeList(MKBN_BUMON);          // 選択肢全てを作っておく
// <HIS0055> ADD end

	m_iKmkCode1		:=	-1;		//	工事未収入金
	m_iKmkCode2		:=	-1;		//	未成工事受入金
	m_iKmkCode3		:=	-1;		//	開始工事売上科目ｺｰﾄﾞ
	m_iKmkCode4		:=	-1;		//	終了工事売上科目ｺｰﾄﾞ
	m_iKmkCode5		:=	-1;		//	売上基準科目ｺｰﾄﾞ
	m_iKmkCode6		:=	-1;		//	工事通過勘定コード
	m_iKmkCode8		:=	-1;		//	開始未成工事支出金
	m_iKmkCode9		:=	-1;		//	終了未成工事支出金

//	fnEditInit;	// <HIS0052> DEL

// <PRN> -----------Add↓-----------------

    // MQueryの構築
    DmqPrint    :=  TMQuery.Create (self);
    // DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery(m_cDBSelect,DmqPrint );


    { ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理}
//<HIS0078 start>
//	lvHandle := 0;
//<HIS0078 end>
	try
//<HIS0087> DEL		lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP020000L.BPL');
		lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP020000L.BPL');  //<HIS0087> ADD

        if ( lvHandle = 0 ) then
            Abort;
	except
		MjsMessageBox(Self, 'JNTCRP020000LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(Self,'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
//<HIS0087> ADD    	UnloadPackage( lvHandle );
    	UnloadPackageHelper( lvHandle );  //<HIS0087> ADD
    end;

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

		iRet := PrintAppEntry(Self,m_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

//<MLXDEP>↓
	sMLWF := '';
	if (TMSeries.IsMjsLink3) then     //<MLXDEP>
		sMLWF	:= '_DEP_';
//<MLXDEP>↑

    // 帳票用ﾊﾟﾗﾒｰﾀ初期化
    gfnHaniInit(Self,
                m_pRec,
                m_cDataModule,
                m_cComArea,
                m_cDBSelect,
//              'JNTCRP020000',             //<MLXDEP>
	            'JNTCRP020000' + sMLWF,		//<MLXDEP>
                uvHani,
                uvSelSys);

// <PRN> -----------Add↑-----------------
    SettingTypeCode(); //<HIS0105> ADD
end;


//************************************************************************
//*	 ProgramID	   :   JNTCRP020000
//*	 Component	   :   FormActivate
//*	 Name			:   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnJNTCRP020000fOnActivate (Sender: TObject);
var
	cAppParam: TAppParam;
begin
	cAppParam.iAction		:= ACTID_ACTIVEEND;
	cAppParam.pRecord		:= Pointer (m_pRec);
	cAppParam.pActionParam	:= nil;

	TMjsAppRecord (m_pRec^).m_pOwnerEntry (@cAppParam);
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnJNTCRP020000fOnPaint (Sender: TObject);
begin
	if	(m_fComboBoxListDraw) then
	begin
		m_fComboBoxListDraw					:= false;

    	CmnComboBoxInstruction.ItemIndex	:=	0;
        fnCmnComboBoxInstructionOnChange(Sender);

        CmnToolbarButtonDelete.Enabled := False;	// 初期表示時は削除ﾎﾞﾀﾝ無効 <HIS0069> ADD

//<MLXDEP>
		if (TMSeries.IsMjsLink3) then
		begin
			StdCmnTab.Visible					:= False;
            MLabel27.Visible					:= False;
            CmnComboBoxInstruction.Visible		:= False;
            P_Tree1Panel.Visible				:= False;
			m_cACControl := StdCmnGridExist;
			m_cACControl.SetFocus;
		end;
//<MLXDEP>
	end;
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   FormHide
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnJNTCRP020000fOnHide (Sender: TObject);
begin
	MJSBtnVisible (TJNTCRP020000f (Self), false);

// <HIS0063> MOD start
//	if	m_cPreview.IsPreView	then	m_cPreview.Hide;
	if uvHani.mjspre.IsPreview then
	begin
		uvHani.mjspre.Hide;
	end;
// <HIS0063> MOD end
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnOnChange (TObject)											*/
//*																											*/
//*	目的	: 摘要登録処理 共通 OnChange ｲﾍﾞﾝﾄ																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnOnChange (Sender: TObject);
begin
	if	m_pRec^.m_pChildForm=nil	then	Exit;

	if	((not m_fChangeDetails) and (not m_fUnderConstruction)) then
		m_fChangeDetails	:= true;
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   OnEnter
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnTreeViewOnEnter (Sender: TObject);
var
	cNode	   : TTreeNode;
    stSelectRec: ^TreeViewRec;

begin
	if	CmnTreeView.Items.Count=0	then	Exit;

	cNode			:=	CmnTreeView.Selected;
	stSelectRec		:=	cNode.Data;

    if	(stSelectRec^.nDivision = 0) then
	begin
		stSelectRec			:= cNode.Parent.Data;
		m_nExCodeCurrent	:= stSelectRec^.nExCode;
	end
	else
		m_nExCodeCurrent	:= stSelectRec^.nExCode;
	fnChangeToolbarButtonsCondition (stSelectRec^.nDivision);	// ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ状態変更
//<HIS0080 start>
	if Sender = CmnTreeView then	fnCmnTreeViewOnChange(Self,CmnTreeView.Selected);
//<HIS0080 end>
	m_cACControl	:=	CmnTreeView;

end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   Copy1Click
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnTreeViewPopupMenuCopyOnClick (Sender: TObject);
var
	cNode    : TTreeNode;
	stWorkRec: ^TreeViewRec;

begin
	cNode       := m_cNodeRightClick;
	stWorkRec   := cNode.Data;

	m_stWorkRecPaste.nDivision	:= stWorkRec^.nDivision;
	m_stWorkRecPaste.nExCode	:= stWorkRec^.nExCode;
	m_stWorkRecPaste.strName	:= stWorkRec^.strName;

	cNode.Selected	:= true;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   Paste1Click
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnTreeViewPopupMenuPasteOnClick (Sender: TObject);
var
	cNode  : TTreeNode;
	strName: String;
begin
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	cNode	:= m_cNodeRightClick;

	cNode.Selected	:= true;

	strName	:= MjsHanCopy (m_stWorkRecPaste.strName, 7, 30);

	fnInsertMasterTreeRecord (cNode, m_stWorkRecPaste.nDivision, m_stWorkRecPaste.nExCode, strName);

	CmnTreeView.FullExpand ();

	if	(m_nProcDivision = 1) then	fnResetParentItemsInfo ();
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   TekiDeleteClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnTreeViewPopupMenuDeleteOnClick (Sender: TObject);
var
	cNode		: TTreeNode;
	stWorkRec	: ^TreeViewRec;
	stMessageRec: TMJSMsgRec;
	strMessage	: String;
	fResult		: Integer;

    exNCode     :Extended;                          // <CHK>
    strErr, strName, strMsg    :   String;          // <CHK>

begin


(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	cNode       := m_cNodeRightClick;
	stWorkRec   := cNode.Data;

	m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 4);

// <HIS0058> MOD start
//	strMessage	:= '"' + Copy (stWorkRec^.strName, 8, 256);
											// ｺｰﾄﾞ_名称 の名称を取り出す
	strMessage	:= '"' + MjsHanCopy (stWorkRec^.strName, m_iTekiDigit + 2, 256);
// <HIS0058> MOD end

	if	(stWorkRec^.nDivision = 0) then
		strMessage	:= strMessage + '"の固定摘要を' + stMessageRec.sMsg
	else
		strMessage	:= strMessage + '"の摘要分類を' + stMessageRec.sMsg;

	if	(MJSMessageBoxEx (Self,strMessage, stMessageRec.sTitle, stMessageRec.icontype,
			stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType) = mrYes) then
	begin
		//部署の時	HIS0027
    	if m_DataKbn = 3 then
	    begin
			if fnSectionCodeCheck(stWorkRec^.nDivision, stWorkRec^.nExCode) = '' then
			begin
				m_cComArea.m_MsgStd.GetMsg( stMessageRec, 30,18);
				stMessageRec.sMsg	:= '経理側で入力した摘要の為、部署側では削除できません。';

				MjsMessageBoxEx (Self,stMessageRec.sMsg, stMessageRec.sTitle,
								 stMessageRec.icontype, mjOk, stMessageRec.btndef, false);
				Exit;
			end;
		end;

//------------------------------------------------------------------------------HIS0010Start
		fResult	:= fnSwkDetailCheck(stWorkRec^.nDivision, stWorkRec^.nExCode);

		if fResult = 0 then		//仕訳で固定摘要コードが使用されているとき
        begin
			m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,18);
    		MjsMessageBoxEx(Self,'仕訳が存在する為削除' + m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,
				m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
			Exit;
		end
		else if fResult = -1 then
			Exit;
//------------------------------------------------------------------------------HIS0010End

//------------------------------------------------------------------------------HIS0013Start
		if (stWorkRec.nDivision = m_stWorkRecPaste.nDivision) and
           (stWorkRec.nExCode   = m_stWorkRecPaste.nExCode  ) then
		begin
			m_stWorkRecPaste.nDivision := 0;
			m_stWorkRecPaste.nExCode   := 0;
			m_stWorkRecPaste.strName   := '';
		end;
//------------------------------------------------------------------------------HIS0013End

        // <CHK>↓
        //内部ｺｰﾄﾞ取得

        exNCode :=  fnGetNCode2(stWorkRec^.nDivision, stWorkRec^.nExCode, strName);

        if	(exNCode = -1) then
		begin
			fnOutputDBErrorMessage ();
			Exit;
		end;
                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
        if not fnDelCheck(exNCode, strErr) then
        begin                               // 「ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
            strMsg := IntToStr(stWorkRec^.nExCode) + ' ' + strName + ' ' + strErr ;
            MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
            Exit;
        end;
        // <CHK>↑

// <SYNC> ADD start
		// 親会社の場合は子会社で使われていないかﾁｪｯｸ
// <HIS0062> MOD start
//        if (m_iGrpCorp = GRP_USE) and (m_iTransKbn = GRP_TRANSKBN_PARENT) then
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_PARENT) then
// <HIS0062> MOD end
        begin
			if not fnDelCheckChild(exNCode) then
			begin							// 「子会社で使用しているため、削除できません。」
        	    MjsMessageBoxEx(Self, JNTSYNC_MSG_USE_CHILD, '削除', mjInformation, mjOk, mjDefOk);
				Exit;
            end;
		end;
// <SYNC> ADD end

		fnDeleteMasterRecord (stWorkRec^.nDivision, stWorkRec^.nExCode);

		fnResetParentItemsInfo ();
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   FormShow
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnJNTCRP020000fOnShow (Sender: TObject);
begin
	JNTMasSetCaption (m_pRec);

	MJSBtnVisible (TJNTCRP020000f (Self), true);

	DtlCmnImageTag.Visible	:= false;

	if	(m_nMailAdoption = 1) then
	begin
		CmnToolbarButtonDelete    .Visible	:= false;
		CmnTreeViewPopupMenuDelete.Visible	:= false;
	end;

(*khattori*)
//	MComboBoxInit(Sender);

(*khattori*)
	if	miInit=0	then
	begin
		MComboBoxInit(Sender);
		miInit	:=	1;				//	０＝初回
	end;

//<MLXDEP>
	if (TMSeries.IsMjsLink3) then
	begin
        B_Search.Visible					:= False;
        CmnToolbarButtonDetail.Visible		:= False;
		ToolBarObjectMove;
	end;
//<MLXDEP>

//	MCheckBox1Click(Sender);		// <HIS0059> DEL

// <HIS0063> MOD start
(*
	if	(m_cPreview.IsPreView ()) then
		m_cPreview.Show ()
*)
	if uvHani.mjspre.IsPreview() then
		uvHani.mjspre.Show()
// <HIS0063> MOD end
	else
		m_cACControl.SetFocus ();

end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCommonFunctionOnEnter01 (TObject) <HIS0059> ADD								*/
//*																											*/
//*	目的	: 摘要登録処理 共通 OnEnter ｲﾍﾞﾝﾄ																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP020000f.fnCommonFunctionOnEnter01 (Sender: TObject);
begin
	m_cACControl := Screen.ActiveControl;
//<HIS0082 start>
	if Sender = cEdtK1DNum then			iKmk1	:= Trunc(TMNumEdit(Sender).Value)
	else if Sender = cEdtK1CNum then	iKmk2	:= Trunc(TMNumEdit(Sender).Value);
//<HIS0082 end>
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCommonFunctionOnEnter02 (TObject)											*/
//*																											*/
//*	目的	: 摘要登録処理 共通 OnEnter ｲﾍﾞﾝﾄ																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP020000f.fnCommonFunctionOnEnter02 (Sender: TObject);
begin
	if	(m_nReferMode <> BASICONLY) then
		CmnToolbarButtonDetail.Enabled	:= true
	else
		CmnToolbarButtonDetail.Enabled	:= false;

	CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete;

	m_cACControl	:= Screen.ActiveControl;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnOnKeyDown (TObject; var Word; TShiftState)						*/
//*																											*/
//*	目的	: 摘要登録処理 共通 OnKeyDown ｲﾍﾞﾝﾄ																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
// <HIS0052> DEL start
(*
var
	iKousyu	:	Integer;
	iIndex	:	Integer;
	iDvCr	:	Integer;
*)
// <HIS0052> DEL end
begin
// <HIS0052> DEL start
(*
	if	(Key = VK_RETURN) then
	begin
		iDvCr	:=	-1;
		if	(Sender = cEdtKODNum) or (Sender = cEdtKODFre)	then	iDvCr	:=	0;
		if	(Sender = cEdtKOCNum) or (Sender = cEdtKOCFre)	then	iDvCr	:=	1;
		if	iDvCr>-1	then
		begin
			iKousyu	:=	fnGetKousyu(iDvCr);
			iIndex	:=	iDvCr*8+7;
			with	m_cEdtSet[iIndex]	do
			begin
				m_stCurDtlCodeAttr [iIndex].fEnabled	:= (fnGetMasterInfoData (MASTER_CONSTKIND, iIndex ) <> 0) and (iKousyu=1);
// <HIS0052> MOD start
//				Cmb.Enabled	:= MCheckBox1.Checked	and	m_stCurDtlCodeAttr [iIndex].fEnabled;
				Cmb.Enabled	:= IsBusyoDenpyo()	and	m_stCurDtlCodeAttr [iIndex].fEnabled;
// <HIS0052> MOD end
				Num.Enabled	:= m_stCurDtlCodeAttr [iIndex].fEnabled;
				ChangeCompColor(Num);
				Dsc.Enabled	:= m_stCurDtlCodeAttr [iIndex].fEnabled;
				if	iKousyu=0	then
				begin
					Dsc.caption				:=	'';
				end;
				if	iKousyu=2	then
				begin
					Num.InputFlag			:=	false;
					Num.InputFlagEnabled	:=	true;
					Num.Zero				:=	true;
					Num.Value				:=	0;
					Dsc.caption				:=	'工種諸口ー自動';
				end;
			end;
		end;
	end;
*)
// <HIS0052> DEL end
	if	(Key = VK_RETURN) then
		MjsDispCtrl.MjsNextCtrl (Self)
	else if	((Key = VK_ESCAPE) or (Key = VK_END)) then
	begin
		if	Sender = DtlCEdtExCd		then
		CmnComboBoxInstruction.SetFocus ()
		else
		DtlCmnButtonUpdate.SetFocus ();
	end
	else if	((Key = VK_LEFT) or (Key = VK_UP)) then
	begin
		if	Sender <> DtlCEdtExCd		then
		begin
			if	(Sender is TMTxtEdit) then
			begin
				if	(MJSChkCurTop (Sender as TComponent)) then
					MJSDispCtrl.MjsPrevCtrl (Self);
			end
			else
				MJSDispCtrl.MjsPrevCtrl (Self);
		end;
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	((GetKeyState (VK_MENU) < 0) and (Key = VK_DOWN)) then						// Altｷｰが押された時
			Exit;

		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   fnCmnComboBoxInstructionOnChange
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnComboBoxInstructionOnChange (Sender: TObject);
begin
	if	(m_fIgnoreProc) then
	begin
		m_fIgnoreProc	:= false;
		Exit;
	end;

	if	(not CmnComboBoxInstruction.DroppedDown) then
		fnChangeSelectionScreen ();


    fnEnableToolbarButtonTag(False);
    B_Search.Enabled := True;

end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   TreeView1Change
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnTreeViewOnChange (Sender: TObject; Node: TTreeNode);
var
	stSelectRec  : ^TreeViewRec;
	stParentRec  : ^TreeViewRec;
	nExCodeParent: Integer;
	strName		 : String;

begin
//OutPutDebugString(PCHAR('TreeView Change Start cEdK1DNum:' + IntToStr(Trunc(cEdtK1DNum.Value)) + ' cEdtK1CNum:' + IntToStr(Trunc(cEdtK1CNum.Value))));
cEdtK1DNum.Value	:= 0;
cEdtK1CNum.Value	:= 0;
	if	(m_fUnderConstruction)	then	Exit;

	if	(m_nProcDivision <> 1)	then	Exit;					// 固定摘要以外

	stSelectRec	:= Node.Data;

	fnChangeToolbarButtonsCondition (stSelectRec^.nDivision);	// ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ状態変更

	if	(stSelectRec^.nDivision = DIVISION_NEWRECORD) then
		Exit;

	fnCleanupTreeViewNewItem (false);

	if	(stSelectRec^.nDivision = 1) then
	begin
		StdCmnTab.Items [0].Selected	:= true;
		StdCmnTab.Items [1].Selected	:= false;
		StdCmnTab.Items [1].Enabled		:= false;
	end
	else
		StdCmnTab.Items [1].Enabled		:= true;

	if	(stSelectRec^.nDivision = 0) then
	begin
		stParentRec		:= Node.Parent.Data;
		nExCodeParent	:= stParentRec^.nExCode;
		strName			:= stParentRec^.strName;
	end
	else
	begin
		nExCodeParent	:= stSelectRec^.nExCode;
		strName			:= stSelectRec^.strName;
	end;

	fnSetParentItemsInfoEx (stSelectRec^.nDivision, stSelectRec^.nExCode, nExCodeParent, strName);

	if	(DtlCmnClientPanel.Visible) then
	begin
		if	(stSelectRec^.nDivision = 9) then
		begin
			DtlCmnClientPanel.Visible	:= false;
			StdCmnClientPanel.Visible	:= true;

 			CmnToolbarButtonDetail.Caption	:= '詳細(&T)';
		end
		else
		begin
			fnShowDetailScreen ();

			m_cNodePrevSelect	:= CmnTreeView.Selected;
		end;
	end
	else
		fnMoveGridRecordSelecter (stSelectRec^.nDivision, stSelectRec^.nExCode);

//<HIS0078 start>
	// 会計処理区分: 0=免税業者
	if	(m_nTaxAccDivision <> 0) and (IsBusyoDenpyo) then		// 部署伝票として使用する場合
	begin
		ChangeTaxEdit(Trunc(cEdtK1DNum.Value),Trunc(cEdtK1CNum.Value));
	end;
//<HIS0078 end>
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   DMAdxDBGridChangeNodeEx
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnGridExistOnChangeNodeEx (Sender: TObject);
var
	fValueCheck: Boolean;

begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	m_bLog	then	MLabel27.caption:=MLabel27.caption+'-1';

	//	処理区分: 2=科目連想
	if	(m_nProcDivision = 2) then
	begin
		CmnToolbarButtonDetail.Enabled	:= false;
		CmnToolbarButtonDelete.Enabled	:= false;
        fnEnableToolbarButtonTag(False);

		Exit;
	end;

	fValueCheck	:= true;

	if	(not StdCmnGridExist.DataSource.DataSet.FieldByName ('nExCode').IsNull) then
	begin
		if	((StdCmnMemDataExist.State in [dsInsert]) and
			 (StdCmnGridExist.DataSource.DataSet.FieldByName ('nExCode').AsInteger = 0)) then
			fValueCheck	:= false;
	end;

	if  ((StdCmnGridExist.DataSource.DataSet.FieldByName ('nExCode').IsNull) or (not fValueCheck)) then
	begin
		StdCmnGridExist.FocusedColumn   := 1;

		CmnToolbarButtonDetail.Enabled	:= false;
		CmnToolbarButtonDelete.Enabled	:= false;
        fnEnableToolbarButtonTag(False);

	end
	else
	begin
		if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then
		begin
//<HIS0100> MOD St
{
			if	(m_nReferMode <> BASICONLY) then
				CmnToolbarButtonDetail.Enabled	:= true
			else
				CmnToolbarButtonDetail.Enabled	:= false;

			CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete;
			fnEnableToolbarButtonTag (true);
}
            with Sender as TdxDBGrid do
            begin
                if not (DataSource.DataSet.State in [dsInsert]) then
                begin
                    if	(m_nReferMode <> BASICONLY) then
                        CmnToolbarButtonDetail.Enabled	:= true
                    else
                        CmnToolbarButtonDetail.Enabled	:= false;

                    CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete;
                    fnEnableToolbarButtonTag (true);
                end;
            end
//<HIS0100> MOD Ed
		end;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   DTreedxDBGridChangeNodeEx
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnGridTotalOnChangeNodeEx (Sender: TObject);
var
	fValueCheck	:	Boolean;
begin
	fValueCheck	:=	true;

	if	(not StdCmnGridTotal.DataSource.DataSet.FieldByName ('nExCode').IsNull) then
	begin
		if	((StdCmnMemDataTotal.State in [dsInsert]) and
			 (StdCmnGridTotal.DataSource.DataSet.FieldByName ('nExCode').AsInteger = 0)) then
			fValueCheck := false;
    end;

	if  ((StdCmnGridTotal.DataSource.DataSet.FieldByName ('nExCode').IsNull) or (not fValueCheck)) then
	begin
		StdCmnGridTotal.FocusedColumn   := 0;

		CmnToolbarButtonDetail.Enabled	:= false;
		CmnToolbarButtonDelete.Enabled	:= false;
        fnEnableToolbarButtonTag(False);

	end
	else
	begin
		if	(StdCmnGridTotal.Focused) then
		begin
			if	(m_nReferMode <> BASICONLY) then
				CmnToolbarButtonDetail.Enabled	:= true
			else
				CmnToolbarButtonDetail.Enabled	:= false;

			CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete;
		end;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   TreeDeleteClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnTreeViewPopupMenuEraseOnClick (Sender: TObject);
var
	cNode          : TTreeNode;
	cNodeErase     : TTreeNode;
	stWorkRec      : ^TreeViewRec;
	stWorkRecParent: ^TreeViewRec;

begin


(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	cNode			:= m_cNodeRightClick;
	cNodeErase		:= cNode;
	stWorkRec		:= cNode.Data;
	cNode			:= cNode.Parent;
	stWorkRecParent	:= cNode.Data;

	if	(fnEraseMasterTreeRecord (stWorkRec^.nExCode, stWorkRecParent^.nExCode)) then
	begin
		fnEraseTreeViewItems (cNodeErase);

		if	(m_nProcDivision = 1) then
			fnResetParentItemsInfo ();
	end;
end;


procedure	TJNTCRP020000f.fnCmnTreeViewPopupMenuExEraseOnClick (Sender: TObject);
var
	cNode          : TTreeNode;
	cNodeErase     : TTreeNode;
	stWorkRec      : ^TreeViewRec;
	stWorkRecParent: ^TreeViewRec;

begin
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	cNode			:= m_cNodeRightClick;
	cNodeErase		:= cNode;
	stWorkRec		:= cNode.Data;
	cNode			:= cNode.Parent;
	stWorkRecParent	:= cNode.Data;

	if	(fnEraseMasterTreeRecord (stWorkRec^.nExCode, stWorkRecParent^.nExCode)) then
	begin
		fnEraseTreeViewItems (cNodeErase);

		cNode.Selected	:= true;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   DMAdxMemDataBeforePost
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnMemDataExistBeforePost (DataSet: TDataSet);
var
	cFieldWork : TField;
	fValueCheck: Boolean;
	fDescError : Boolean;

begin
	if	(not m_fUpdateRecord) then
		Exit;

	fValueCheck	:= true;
	fDescError	:= false;

	with (DataSet) do
	begin
		cFieldWork	:= FieldByName ('nExCode');

		if	(cFieldWork.IsNull) then
			fValueCheck	:= false;

		if	(fValueCheck and (StdCmnMemDataExist.State in [dsInsert])) then
		begin
			if	(cFieldWork.AsInteger = 0) then
				fValueCheck	:= false;
		end;

		if	(fValueCheck and (StdCmnMemDataExist.State in [dsInsert])) then
		begin
			if  (not fnCheckMasterDataRecordValid (0, cFieldWork.AsInteger)) then
				fValueCheck	:= false
		end;

		if	(fnCheckDescription (0, StdCmnMemDataExist.FieldByName ('nExCode').AsInteger,					//HIS0014
									StdCmnMemDataExist.FieldByName ('strAssociation').AsString,
									StdCmnMemDataExist.FieldByName ('strName').AsString) <> CHECK_OK) then

		begin
			fValueCheck	:= false;
			fDescError	:= true;
		end;

// <SYNC> ADD start
											// 入力ﾁｪｯｸOKで新規
		if (fValueCheck) and (State <> dsEdit) then
		begin
            // 親会社に既に同一ｺｰﾄﾞが登録されている場合、関連付を行い同期をとる
            if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD ) then
			begin
                // 会社関連付処理
                case fnCorpRelation(cFieldWork.AsInteger, SUMKBN_JITUZAI) of
                    0:  begin
                            // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
							// →親にinsert
                        end;
                    1:  begin
                            // 正常に関連付が行えた場合は、画面の再描画を行う
							// Treeを作成
                            fnAddTreeViewUnconnectedItems();
                            // TreeView再表示
                            fnRebuildTreeViewItems();
							// ｸﾞﾘｯﾄﾞ再表示
                            fnResetParentItemsInfo();
                            StdCmnMemDataExist.Last();	// とりあえず、ﾌｫｰｶｽ位置は最終行
                            cFieldWork.FocusControl();
                            Abort;
                        end;
                    2:  begin
                            // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                            cFieldWork.FocusControl();
                            Abort;
                        end;
                    -9: begin
                            // 例外ｴﾗｰ
							StdCmnMemDataExist.Cancel();
                            Abort;
                        end;
                end;
            end;
		end;
// <SYNC> ADD end

		if	(fValueCheck) then
		begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	m_bLog	then	MLabel27.caption:=MLabel27.caption+'-s';

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
			if	fnExceptCheck(false,true,true)<>EXCEPT_RET_OK	then
			begin
				StdCmnMemDataExist.Cancel ();
				PostMessage(Self.Handle, WM_SHOW_MESSAGE, 0, 0);
				Abort;
			end;

			m_stMasterData.nSumDivision		:= 0;
			m_stMasterData.nExCodeParent	:= m_nExCodeCurrent;
			m_stMasterData.nExCode			:= StdCmnMemDataExist.FieldByName ('nExCode'       ).AsInteger;
			m_stMasterData.strAssociation	:= StdCmnMemDataExist.FieldByName ('strAssociation').AsString;
			m_stMasterData.strName			:= StdCmnMemDataExist.FieldByName ('strName'       ).AsString;
			m_stMasterData.fDetails			:= false;

			if	(not fnUpdateMasterRecord ()) then
			begin
				StdCmnMemDataExist.Cancel ();
				StdCmnGridExist   .FocusedColumn	:= 1;

				Abort;
			end;
		end
		else
		begin
			Beep ();

			if	(fDescError) then
			begin
				fnOutputDescErrorMessage (0);	//HIS0014

				FieldByName ('strName').FocusControl ();
			end;

			Abort;
		end;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   DTreedxMemDataBeforePost
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnMemDataTotalBeforePost (DataSet: TDataSet);
var
    cFieldWork : TField;
    fValueCheck: Boolean;
	fDescError : Boolean;

begin
	if	(not m_fUpdateRecord) then
		Exit;

	fValueCheck	:= true;
	fDescError	:= false;

	with (DataSet) do
	begin
		cFieldWork	:= FieldByName ('nExCode');

		if	(cFieldWork.IsNull) then
			fValueCheck	:= false;

		if	(fValueCheck and (StdCmnMemDataTotal.State in [dsInsert])) then
		begin
			if	(cFieldWork.AsInteger = 0) then
				fValueCheck	:= false;
		end;

		if	(fValueCheck and (StdCmnMemDataTotal.State in [dsInsert])) then
		begin
			if  (not fnCheckMasterDataRecordValid (1, cFieldWork.AsInteger)) then
				fValueCheck	:= false
		end;

		if	(fnCheckDescription (1, StdCmnMemDataTotal.FieldByName ('nExCode').AsInteger,							//HIS0014
									StdCmnMemDataTotal.FieldByName ('strAssociation').AsString,
									StdCmnMemDataTotal.FieldByName ('strName').AsString) <> CHECK_OK) then
		begin
			fValueCheck	:= false;
			fDescError	:= true;
		end;

// <SYNC> ADD start
											// 入力ﾁｪｯｸOKで新規
		if (fValueCheck) and (State <> dsEdit) then
		begin
            // 親会社に既に同一ｺｰﾄﾞが登録されている場合、関連付を行い同期をとる
            if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD ) then
			begin
                // 会社関連付処理
                case fnCorpRelation(cFieldWork.AsInteger, SUMKBN_GOUKEI) of
                    0:  begin
                            // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
							// →親にinsert
                        end;
                    1:  begin
                            // 正常に関連付が行えた場合は、画面の再描画を行う
							// Treeを作成
                            fnAddTreeViewUnconnectedItems();
                            // TreeView再表示
                            fnRebuildTreeViewItems();
							// ｸﾞﾘｯﾄﾞ再表示
                            fnResetParentItemsInfo();
                            StdCmnMemDataTotal.Last();	// とりあえず、ﾌｫｰｶｽ位置は最終行
                            cFieldWork.FocusControl();
                            Abort;
                        end;
                    2:  begin
                            // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                            cFieldWork.FocusControl();
                            Abort;
                        end;
                    -9: begin
                            // 例外ｴﾗｰ
							StdCmnMemDataTotal.Cancel();
                            Abort;
                        end;
                end;
            end;
		end;
// <SYNC> ADD end

		if	(fValueCheck) then
		begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
			if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

			m_stMasterData.nSumDivision		:= 1;
			m_stMasterData.nExCodeParent	:= m_nExCodeCurrent;
			m_stMasterData.nExCode			:= StdCmnMemDataTotal.FieldByName ('nExCode'       ).AsInteger;
			m_stMasterData.strAssociation	:= StdCmnMemDataTotal.FieldByName ('strAssociation').AsString;
			m_stMasterData.strName			:= StdCmnMemDataTotal.FieldByName ('strName'       ).AsString;
			m_stMasterData.fDetails			:= false;

			if	(not fnUpdateMasterRecord ()) then
			begin
				StdCmnMemDataTotal.Cancel ();
				StdCmnGridTotal   .FocusedColumn	:= 0;

				Abort;
			end;
		end
		else
		begin
			Beep ();

			if	(fDescError) then
			begin
				fnOutputDescErrorMessage (1);	//HIS0014

				FieldByName ('strName').FocusControl ();
			end;

			Abort;
		end;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   DMAdxDBGridBeforeChangeColumn
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnGridExistOnBeforeChangeColumn (Sender: TObject; Node: TdxTreeListNode;
							Column: Integer; NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
	cField	 : TField;
begin
	if	(Column = 1) then																// 摘要(分類)ｺｰﾄﾞ
	begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	m_bLog	then	MLabel27.caption:=MLabel27.caption+'-2';

		with (StdCmnDataSourceExist.DataSet) do
		begin
			if	(State <> dsInsert) then
				Exit;

			cField	:= FieldByName ('nExCode');

			////////////////////////////////////////////////////////////////
			if	(cField.IsNull) then
				cField.AsInteger	:= fnGetMinimumExCode ();
			////////////////////////////////////////////////////////////////

			if	(StdCmnMemDataExist.State in [dsInsert]) then
			begin

				////////////////////////////////////////////////////////////////
				if	(cField.AsInteger = 0) then
					cField.AsInteger	:= fnGetMinimumExCode ();
				////////////////////////////////////////////////////////////////
			end;

// <SYNC> ADD start
            // 使用可能ｺｰﾄﾞのﾁｪｯｸ
            if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD ) then
            begin
				// この子会社が使えるｺｰﾄﾞかﾁｪｯｸ
				if not CheckMasterRange(cField.AsInteger, m_SyncMaster.m_nSegNCode) then
				begin
											// 「ｸﾞﾙｰﾌﾟ会計での登録可能範囲外のｺｰﾄﾞです。」
		    		MjsMessageBoxEx(Self, MSG_GRP_CODERANGE_ERR, '確認', mjInformation, mjOk, mjDefOk);
                    cField.FocusControl();	// 使用不可なのでﾌｫｰｶｽ位置を戻す
                    Abort;
				end;
            end;
// <SYNC> ADD end
			// 重複ﾁｪｯｸ
			if	(not StdCmnGridExist.Columns [1].ReadOnly) then
			begin
				if	(not fnCheckMasterDataRecordValid (0, cField.AsInteger)) then
				begin
					Beep ();
//---------------------------------------------------------------------------------------------HIS0012
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
		    		MjsMessageBoxEx(Self,m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype ,
						m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
//---------------------------------------------------------------------------------------------
					cField.FocusControl ();

					Abort;
				end;
			end;

// <SYNC> ADD start
            // 親会社に既に同一ｺｰﾄﾞが登録されている場合、関連付を行い同期をとる
            if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD ) then
			begin
                // 会社関連付処理
                case fnCorpRelation(cField.AsInteger, SUMKBN_JITUZAI) of
                    0:  begin
                            // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
							// →親にinsert
                        end;
                    1:  begin
                            // 正常に関連付が行えた場合は、画面の再描画を行う
							// Treeを作成
                            fnAddTreeViewUnconnectedItems();
                            // TreeView再表示
                            fnRebuildTreeViewItems();
							// ｸﾞﾘｯﾄﾞ再表示
                            fnResetParentItemsInfo();
                            StdCmnMemDataExist.Last();	// とりあえず、ﾌｫｰｶｽ位置は最終行
                            cField.FocusControl();
                            Abort;
                        end;
                    2:  begin
                            // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                            cField.FocusControl();
                            Abort;
                        end;
                    -9: begin
                            // 例外ｴﾗｰ
                            cField.FocusControl();
                            Abort;
                        end;
                end;
            end;
// <SYNC> ADD end
		end;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   fnStdCmnGridExistOnBeforeChangeNode
//*    　　　　　
//*     					HIS0015
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnGridExistOnBeforeChangeNode(Sender: TObject;
  Node, NewNode: TdxTreeListNode; var CanChange: Boolean);
begin
	if	m_bSkip	then	abort;

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	m_bLog	then	MLabel27.caption:=MLabel27.caption+'-3';

	if StdCmnGridExist.FocusedColumn = 3 then
	begin
    	if	(fnCheckDescription (0, StdCmnMemDataExist.FieldByName('nExCode').AsInteger,
									StdCmnMemDataExist.FieldByName('strAssociation').AsString,
									StdCmnMemDataExist.FieldByName('strName').AsString) <> CHECK_OK) then	//HIS0014
		begin
			m_bSkip		:=	true;
			Beep ();

			fnOutputDescErrorMessage (0);	//HIS0014

			StdCmnGridExist.SetFocus;
			m_bSkip		:=	false;

			Abort;
		end;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   DTreedxDBGridBeforeChangeColumn
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnGridTotalOnBeforeChangeColumn (Sender: TObject; Node: TdxTreeListNode;
							Column: Integer; NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
	cField: TField;

begin
	if	(Column = 0) then																// 摘要(分類)ｺｰﾄﾞ
	begin
		with (StdCmnDataSourceTotal.DataSet) do
		begin
			if	(State <> dsInsert) then
				Exit;

			cField	:= FieldByName ('nExCode');

			if	(cField.IsNull) then
			begin
				Beep ();
				cField.FocusControl ();

				Abort;
			end;

			if	(StdCmnMemDataTotal.State in [dsInsert]) then
			begin
				if  (cField.AsInteger = 0) then
				begin
					Beep ();
					cField.FocusControl ();

					Abort;
				end;
			end;

// <SYNC> ADD start
            // 使用可能ｺｰﾄﾞのﾁｪｯｸ
            if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD ) then
            begin
				// この子会社が使えるｺｰﾄﾞかﾁｪｯｸ
				if not CheckMasterRange(cField.AsInteger, m_SyncMaster.m_nSegNCode) then
				begin
											// 「ｸﾞﾙｰﾌﾟ会計での登録可能範囲外のｺｰﾄﾞです。」
		    		MjsMessageBoxEx(Self, MSG_GRP_CODERANGE_ERR, '確認', mjInformation, mjOk, mjDefOk);
                    cField.FocusControl();			// 使用不可なのでﾌｫｰｶｽ位置を戻す
                    Abort;
				end;
            end;
// <SYNC> ADD end
			// 重複ﾁｪｯｸ
			if	(not StdCmnGridTotal.Columns [0].ReadOnly) then
			begin
				if	(not fnCheckMasterDataRecordValid (1, cField.AsInteger)) then
				begin
					Beep ();
//---------------------------------------------------------------------------------------------HIS0012
					//	同一コードが存在してます
					m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,8);
					m_cErrorMsgRec.sMsg := m_cComArea.m_MsgStd.MsgChange( m_cErrorMsgRec.sMsg, '@', 'コード' );
		    		MjsMessageBoxEx(Self,m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype ,
						m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
//---------------------------------------------------------------------------------------------
					cField.FocusControl ();

					Abort;
				end;
			end;
// <SYNC> ADD start
            // 親会社に既に同一ｺｰﾄﾞが登録されている場合、関連付を行い同期をとる
            if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD ) then
			begin
                // 会社関連付処理
                case fnCorpRelation(cField.AsInteger, SUMKBN_GOUKEI) of
                    0:  begin
                            // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
							// →親にinsert
                        end;
                    1:  begin
                            // 正常に関連付が行えた場合は、画面の再描画を行う
							// Treeを作成
                            fnAddTreeViewUnconnectedItems();
                            // TreeView再表示
                            fnRebuildTreeViewItems();
							// ｸﾞﾘｯﾄﾞ再表示
                            fnResetParentItemsInfo();
                            StdCmnMemDataTotal.Last();  // とりあえず、ﾌｫｰｶｽ位置は最終行
                            cField.FocusControl();
                            Abort;
                        end;
                    2:  begin
                            // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                            cField.FocusControl();
                            Abort;
                        end;
                    -9: begin
                            // 例外ｴﾗｰ
                            cField.FocusControl();
                            Abort;
                        end;
                end;
            end;
// <SYNC> ADD end
		end;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   StdCmnGridTotalBeforeChangeNode
//*    　　　　　
//*     					HIS0015
//************************************************************************
procedure TJNTCRP020000f.StdCmnGridTotalBeforeChangeNode(Sender: TObject;
  Node, NewNode: TdxTreeListNode; var CanChange: Boolean);
begin
	if StdCmnGridTotal.FocusedColumn = 2 then
	begin
    	if	(fnCheckDescription (1, StdCmnMemDataTotal.FieldByName('nExCode').AsInteger,
									StdCmnMemDataTotal.FieldByName('strAssociation').AsString,
									StdCmnMemDataTotal.FieldByName('strName').AsString) <> CHECK_OK) then	//HIS0014
		begin
			Beep ();

			fnOutputDescErrorMessage (1);		//HIS0014

			StdCmnGridTotal.SetFocus();

			Abort;
		end;
	end;
end;


(*H0003 20030821 khattori syuusei Drag & Drop 対応*)
//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   TreeView1DragDrop
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnTreeViewOnDragDrop (Sender, Source: TObject; X, Y: Integer);
var
	cNodeSrc	: TTreeNode;
	cNodeDst	: TTreeNode;
	stRecDst	: ^TreeViewRec;
	stRecWork	: ^TreeViewRec;
	nCount		: Integer;
	nExCode		: Integer;
	strName		: String;

	//***********************************************************************************************************/
	//*	関数	: TJNTCRP020000f.fnSelectTreeViewItem (Integer; Integer)											*/
	//***********************************************************************************************************/
	function	fnSelectTreeViewItemLocal (nSumDivision: Integer; nExCode: Integer):Integer;
	var
		stRecWork: ^TreeViewRec;
		nCount   : Integer;

	begin
		nCount:=-1;
		result:=nCount;
		stRecWork	:= CmnTreeView.Selected.Data;

		if	((stRecWork^.nDivision = nSumDivision) and (stRecWork^.nExCode = nExCode)) then
			Exit;

		for nCount := 1 to CmnTreeView.Items.Count do
		begin
			stRecWork	:= CmnTreeView.Items [nCount - 1].Data;

			if	((stRecWork^.nDivision = nSumDivision) and (stRecWork^.nExCode   = nExCode)) then
			begin
//				CmnTreeView.Items [nCount - 1].Selected	:= true;
				Break;
			end;
		end;
		result:=nCount;
	end;
begin
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	cNodeDst	:= CmnTreeView.DropTarget;
	stRecDst	:= cNodeDst.Data;

	if	(CmnTreeView.Focused) then
	begin
		cNodeSrc	:= CmnTreeView.Selected;
		stRecWork	:= cNodeSrc.Data;

		if	(not fnCheckTreeViewDropItem (cNodeDst, stRecWork^.nExCode, stRecWork^.nDivision)) then
			Exit;

		fnMoveMasterTreeRecord (cNodeSrc, cNodeDst);

		if	(stRecDst^.nDivision = 0) then
		begin
			stRecWork			:= cNodeDst.Parent.Data;
			m_nExCodeCurrent	:= stRecWork^.nExCode;
		end
		else
			m_nExCodeCurrent	:= stRecDst^.nExCode;

		if	(m_nProcDivision = 1) then													// 処理区分: 1=固定摘要
			fnResetParentItemsInfo ();
	end
	else if	StdCmnGridExist.SelectedCount>0	then
	begin
		for	nCount := 0 to StdCmnGridExist.SelectedCount - 1 do
		begin
			StdCmnGridExist.DataSource.DataSet.GotoBookmark (StdCmnGridExist.SelectedRows [nCount]);

			nExCode	:= StdCmnGridExist.DataSource.DataSet.FieldValues ['nExCode'];
			strName	:= StdCmnGridExist.DataSource.DataSet.FieldValues ['strName'];

			if	(not fnCheckTreeViewDropItem (cNodeDst, nExCode, 0)) then
				Continue;

			if	(stRecDst^.nDivision = 0) then
			begin
				stRecWork			:= cNodeDst.Parent.Data;
				m_nExCodeCurrent	:= stRecWork^.nExCode;
			end
			else
				m_nExCodeCurrent	:= stRecDst^.nExCode;

			fnInsertMasterTreeRecord (cNodeDst, 0, nExCode, strName);
		end;
	end
	else
	begin
		nExCode	:= StdCmnGridExist.DataSource.DataSet.FieldValues ['nExCode'];
		cNodeSrc	:= CmnTreeView.Items [fnSelectTreeViewItemLocal (0, nExCode)-1];

		if	(fnCheckTreeViewDropItem (cNodeDst, nExCode, 0)) then
		begin
			fnMoveMasterTreeRecord (cNodeSrc, cNodeDst);
			StdCmnMemDataExist.Delete;
		end;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   TreeView1DragOver
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnTreeViewOnDragOver (Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
	cNodeSrc     : TTreeNode;
	cNodeDst     : TTreeNode;
	cNodeTop	 : TTreeNode;
	cNodeTopNext : TTreeNode;
	cNodeLast	 : TTreeNode;
	cNodeLastPrev: TTreeNode;
	cNodeWork	 : TTreeNode;
	cNodeScroll	 : TTreeNode;
	stRecSrc	 : ^TreeViewRec;
	stRecDst	 : ^TreeViewRec;
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

	if	(CmnTreeView.Focused) then
	begin
		cNodeSrc	:= CmnTreeView.Selected;											// ﾄﾞﾗｯｸﾞ元ﾉｰﾄﾞ
		stRecSrc	:= cNodeSrc.Data;													// ﾄﾞﾗｯｸﾞ元ﾉｰﾄﾞ･ﾃﾞｰﾀ
	end
	else
		stRecSrc	:= nil;

	if  (cNodeDst = nil) then
	begin
		Accept  := false;
		Exit;
	end;

	if	(CmnTreeView.Focused) then
	begin
		if	((stRecSrc^.nDivision = 9) or (stRecSrc^.nDivision = DIVISION_SUBJECT)) then
		begin
			Accept  := false;
			Exit;
	    end;

		if	(stRecSrc^.nDivision = 1) then
		begin
			stRecDst	:= cNodeDst.Data;

			if	(stRecDst^.nDivision = 1) then
			begin
				Accept	:= false;
				Exit;
			end;

			if	(stRecDst^.nDivision <> 9) then
			begin
				stRecDst	:= cNodeDst.Parent.Data;

				if	(stRecDst^.nDivision <> 9) then
				begin
					Accept	:= false;
					Exit;
				end;
			end;
		end;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   DMADataSourceStateChange
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnDataSourceExistOnStateChange (Sender: TObject);
begin
	if  (StdCmnMemDataExist.State in [dsInsert]) then
    	StdCmnMemDataExistnExCode.ReadOnly		:= false	//HIS0023
//		StdCmnGridExist.Columns [1].ReadOnly    := false
	else
		StdCmnMemDataExistnExCode.ReadOnly		:= true;	//HIS0023
//		StdCmnGridExist.Columns [1].ReadOnly    := true;

	if  (StdCmnMemDataExist.Active and (StdCmnDataSourceExist.DataSet <> nil)) then
	begin
		if  (StdCmnGridExist.DataSource.DataSet.RecordCount = 0) then
  			StdCmnMemDataExistnExCode.ReadOnly	:= false;	//HIS0023
//			StdCmnGridExist.Columns [1].ReadOnly    := false;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   DTreeDataSourceStateChange
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnDataSourceTotalOnStateChange (Sender: TObject);
begin
	if  (StdCmnMemDataTotal.State in [dsInsert]) then
		StdCmnMemDataTotalnExCode.ReadOnly	:= false
	else
		StdCmnMemDataTotalnExCode.ReadOnly	:= true;

	if  (StdCmnMemDataTotal.Active and (StdCmnDataSourceTotal.DataSet <> nil)) then
	begin
		if  (StdCmnGridTotal.DataSource.DataSet.RecordCount = 0) then
			StdCmnMemDataTotalnExCode.ReadOnly	:= false
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   DMAdxDBGridEnter
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnGridExistOnEnter (Sender: TObject);
var
	fValueCheck: Boolean;

begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	m_bLog	then	MLabel27.caption:=MLabel27.caption+'-4';

	fnCommonFunctionOnEnter02 (Sender);

	StdCmnGridExist.FocusedColumn	:= 1;

	if	(m_nProcDivision = 2) then														// 処理区分: 2=科目連想
	begin
		CmnToolbarButtonDetail.Enabled	:= false;
		CmnToolbarButtonDelete.Enabled	:= false;
//		CmnToolbarButtonTag   .Enabled	:= false;
        fnEnableToolbarButtonTag(False);

		Exit;
	end;

	fValueCheck	:= true;

	if	(not StdCmnGridExist.DataSource.DataSet.FieldByName ('nExCode').IsNull) then
	begin
		if	((StdCmnMemDataExist.State in [dsInsert]) and
			 (StdCmnGridExist.DataSource.DataSet.FieldByName ('nExCode').AsInteger = 0)) then
			fValueCheck	:= false;
	end;

	if  ((StdCmnGridExist.DataSource.DataSet.FieldByName ('nExCode').IsNull) or (not fValueCheck)) then
	begin
		CmnToolbarButtonDetail.Enabled	:= false;
		CmnToolbarButtonDelete.Enabled	:= false;
//		CmnToolbarButtonTag   .Enabled	:= false;
        fnEnableToolbarButtonTag(False);
	end
	else
	begin
		if	(m_nReferMode <> BASICONLY) then
			CmnToolbarButtonDetail.Enabled	:= true
		else
			CmnToolbarButtonDetail.Enabled	:= false;
    // <HIS0040>
        fnEnableToolbarButtonTag(True);     // 付箋ﾎﾞﾀﾝ有効

//<HIS0100> ADD St
        if (StdCmnGridExist.DataSource.DataSet.State in [dsInsert]) then
        begin
            CmnToolbarButtonDelete.Enabled	:= false;
            CmnToolbarButtonDetail.Enabled	:= false;
        end;
//<HIS0100> ADD Ed
	end;

end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   DTreedxDBGridEnter
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnGridTotalOnEnter (Sender: TObject);
var
	fValueCheck: Boolean;

begin
	fnCommonFunctionOnEnter02 (Sender);

    fnEnableToolbarButtonTag(False);

	StdCmnGridTotal.FocusedColumn	:= 0;

	fValueCheck	:= true;

	if	(not StdCmnGridTotal.DataSource.DataSet.FieldByName ('nExCode').IsNull) then
	begin
		if	((StdCmnMemDataTotal.State in [dsInsert]) and
			 (StdCmnGridTotal.DataSource.DataSet.FieldByName ('nExCode').AsInteger = 0)) then
			fValueCheck	:= false;
	end;

	if  ((StdCmnGridTotal.DataSource.DataSet.FieldByName ('nExCode').IsNull) or (not fValueCheck)) then
	begin
		CmnToolbarButtonDetail.Enabled	:= false;
		CmnToolbarButtonDelete.Enabled	:= false;
	end
	else
	begin
		if	(m_nReferMode <> BASICONLY) then
			CmnToolbarButtonDetail.Enabled	:= true
		else
			CmnToolbarButtonDetail.Enabled	:= false;
	end;
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   TekiPopupMenuPopup
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnTreeViewPopupMenuOnPopup (Sender: TObject);
var
    cNode          : TTreeNode;
    cNodeParent    : TTreeNode;
    stWorkRec      : ^TreeViewRec;
    stWorkRecParent: ^TreeViewRec;
	nTagDivision   : Integer;

begin
// <HIS0075> ADD start
											// 追加権限なしまたは修正権限なしの場合、ﾂﾘｰのﾎﾟｯﾌﾟｱｯﾌﾟの付箋機能を無効にする
	CmnTreeViewPopupMenuTagOff    .Enabled  := m_cJNTArea.IsFusen;
    CmnTreeViewPopupMenuTagComment.Enabled  := m_cJNTArea.IsFusen;
// <HIS0075> ADD end

	CmnTreeViewPopupMenuTagOff    .Visible	:= m_cJNTArea.IsFusen;
	CmnTreeViewPopupMenuTagComment.Visible	:= m_cJNTArea.IsFusen;

	cNode				:= CmnTreeView.Selected;
	m_cNodeRightClick	:= cNode;
	stWorkRec			:= cNode.Data;

	m_cNodeRightClick.Selected	:= true;

	if	(m_stWorkRecPaste.nExCode = 0) then
		CmnTreeViewPopupMenuPaste.Enabled	:= false
	else
		CmnTreeViewPopupMenuPaste.Enabled	:= m_IsUpdate;

	if	((stWorkRec^.nDivision = 9) or (m_nProcDivision = 2)) then
		CmnTreeViewPopupMenuDetail.Enabled	:= false
	else
		CmnTreeViewPopupMenuDetail.Enabled	:= true;

	if	(not fnCheckMasterTreePasteValid (m_stWorkRecPaste.nDivision, m_stWorkRecPaste.nExCode, cNode)) then
		CmnTreeViewPopupMenuPaste.Enabled	:= false;

	if  ((stWorkRec^.nDivision = 1) or (stWorkRec^.nDivision = 9) or (stWorkRec^.nDivision = DIVISION_SUBJECT)) then
	begin
		CmnTreeViewPopupMenuCopy  .Enabled	:= false;
		CmnTreeViewPopupMenuDelete.Enabled	:= false;
		CmnTreeViewPopupMenuTag01 .Enabled	:= false;
		CmnTreeViewPopupMenuTag02 .Enabled	:= false;
		CmnTreeViewPopupMenuTag03 .Enabled	:= false;
		CmnTreeViewPopupMenuTag04 .Enabled	:= false;

		CmnTreeViewPopupMenuTagOff    .Visible	:= false;
		CmnTreeViewPopupMenuTagComment.Visible	:= false;

		if	(stWorkRec^.nDivision = 1)  then
			CmnTreeViewPopupMenuDelete.Enabled	:= m_cJNTArea.IsDelete;
    end
    else
    begin
    	if	(m_nProcDivision = 2) then
			CmnTreeViewPopupMenuDelete.Enabled	:= false
		else
			CmnTreeViewPopupMenuDelete.Enabled	:= m_cJNTArea.IsDelete;

		CmnTreeViewPopupMenuCopy .Enabled	:= m_IsUpdate;
		CmnTreeViewPopupMenuTag01.Enabled	:= m_cJNTArea.IsFusen;
		CmnTreeViewPopupMenuTag02.Enabled	:= m_cJNTArea.IsFusen;
		CmnTreeViewPopupMenuTag03.Enabled	:= m_cJNTArea.IsFusen;
		CmnTreeViewPopupMenuTag04.Enabled	:= m_cJNTArea.IsFusen;

		nTagDivision	:= fnGetMasterDataTagInfo (stWorkRec^.nExCode);

		if	(nTagDivision > 0) then
		begin
			CmnTreeViewPopupMenuTagOff    .Visible	:= true;
			CmnTreeViewPopupMenuTagComment.Visible	:= true;

			case (nTagDivision) of
				1:	begin
						CmnTreeViewPopupMenuTagOff.Bitmap	:= CmnTreeViewPopupMenuTag01.Bitmap;
						CmnTreeViewPopupMenuTag01 .Visible	:= false;
						CmnTreeViewPopupMenuTag02 .Visible	:= true;
						CmnTreeViewPopupMenuTag03 .Visible	:= true;
						CmnTreeViewPopupMenuTag04 .Visible	:= true;
					end;
				2:	begin
						CmnTreeViewPopupMenuTagOff.Bitmap	:= CmnTreeViewPopupMenuTag03.Bitmap;
						CmnTreeViewPopupMenuTag01 .Visible	:= true;
						CmnTreeViewPopupMenuTag02 .Visible	:= TRUE;
						CmnTreeViewPopupMenuTag03 .Visible	:= FALSE;
						CmnTreeViewPopupMenuTag04 .Visible	:= true;
					end;
				3:	begin
						CmnTreeViewPopupMenuTagOff.Bitmap	:= CmnTreeViewPopupMenuTag02.Bitmap;
						CmnTreeViewPopupMenuTag01 .Visible	:= true;
						CmnTreeViewPopupMenuTag02 .Visible	:= FALSE;
						CmnTreeViewPopupMenuTag03 .Visible	:= TRUE;
						CmnTreeViewPopupMenuTag04 .Visible	:= true;
					end;
				4:	begin
						CmnTreeViewPopupMenuTagOff.Bitmap	:= CmnTreeViewPopupMenuTag04.Bitmap;
						CmnTreeViewPopupMenuTag01 .Visible	:= true;
						CmnTreeViewPopupMenuTag02 .Visible	:= true;
						CmnTreeViewPopupMenuTag03 .Visible	:= true;
						CmnTreeViewPopupMenuTag04 .Visible	:= false;
					end;
			end;
		end
		else
		begin
			CmnTreeViewPopupMenuTagOff    .Visible	:= false;
			CmnTreeViewPopupMenuTagComment.Visible	:= false;

			CmnTreeViewPopupMenuTag01.Visible	:= true;
			CmnTreeViewPopupMenuTag02.Visible	:= true;
			CmnTreeViewPopupMenuTag03.Visible	:= true;
			CmnTreeViewPopupMenuTag04.Visible	:= true;
		end;
	end;

	cNodeParent := cNode.Parent;

	if  (cNodeParent = nil) then
		CmnTreeViewPopupMenuErase.Enabled	:= false
    else
	begin
		stWorkRecParent	:= cNodeParent.Data;

		if	(stWorkRecParent^.nDivision = 9) then
			CmnTreeViewPopupMenuErase.Enabled	:= false
        else
		begin
			CmnTreeViewPopupMenuErase.Enabled	:= m_IsUpdate;
		end;
    end;
end;


procedure	TJNTCRP020000f.fnCmnTreeViewPopupMenuExOnPopup (Sender: TObject);
var
    cNode          : TTreeNode;
    cNodeParent    : TTreeNode;
    stWorkRecParent: ^TreeViewRec;

begin
	cNode				:= CmnTreeView.Selected;
	m_cNodeRightClick	:= cNode;
	cNodeParent			:= cNode.Parent;

	if  (cNodeParent = nil) then
		CmnTreeViewPopupMenuExErase.Enabled	:= false
    else
	begin
		stWorkRecParent	:= cNodeParent.Data;

		if	(stWorkRecParent^.nDivision = 9) then
			CmnTreeViewPopupMenuExErase.Enabled	:= false
        else
		begin
//			if	(m_nReferMode <> REFER) then
				CmnTreeViewPopupMenuExErase.Enabled	:= m_IsUpdate;
//			else
//				CmnTreeViewPopupMenuExErase.Enabled	:= false;
		end;
    end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnStdCmnGridPopupMenuOnPopup (TObject)											*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要Grid用ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ OnPopup ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnStdCmnGridPopupMenuOnPopup (Sender: TObject);
var
	nTagDivision: Integer;

begin

	StdCmnGridPopupMenuTagOff    .Enabled	:= m_cJNTArea.IsFusen;
	StdCmnGridPopupMenuTagComment.Enabled	:= m_cJNTArea.IsFusen;

	StdCmnGridPopupMenuTag01.Enabled	:= m_cJNTArea.IsFusen;
	StdCmnGridPopupMenuTag02.Enabled	:= m_cJNTArea.IsFusen;
	StdCmnGridPopupMenuTag03.Enabled	:= m_cJNTArea.IsFusen;
	StdCmnGridPopupMenuTag04.Enabled	:= m_cJNTArea.IsFusen;

	if	(StdCmnMemDataExist.FieldByName ('nExCode').AsInteger <> 0) then
	begin

		nTagDivision	:= fnGetMasterDataTagInfo (StdCmnMemDataExist.FieldByName ('nExCode').AsInteger);

		if	(nTagDivision > 0) then
		begin
			StdCmnGridPopupMenuTagOff    .Visible	:= true;
			StdCmnGridpopupMenuTagComment.Visible	:= true;

			case (nTagDivision) of
				1:	begin
						StdCmnGridPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag01.Bitmap;
						StdCmnGridPopupMenuTag01 .Visible	:= false;
						StdCmnGridPopupMenuTag02 .Visible	:= true;
						StdCmnGridPopupMenuTag03 .Visible	:= true;
						StdCmnGridPopupMenuTag04 .Visible	:= true;
					end;
				2:	begin
						StdCmnGridPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag03.Bitmap;
						StdCmnGridPopupMenuTag01 .Visible	:= true;
						StdCmnGridPopupMenuTag02 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag03 .Visible	:= FALSE;
						StdCmnGridPopupMenuTag04 .Visible	:= true;
					end;
				3:	begin
						StdCmnGridPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag02.Bitmap;
						StdCmnGridPopupMenuTag01 .Visible	:= true;
						StdCmnGridPopupMenuTag02 .Visible	:= FALSE;
						StdCmnGridPopupMenuTag03 .Visible	:= TRUE;
						StdCmnGridPopupMenuTag04 .Visible	:= true;
					end;
				4:	begin
						StdCmnGridPopupMenuTagOff.Bitmap	:= StdCmnGridPopupMenuTag04.Bitmap;
						StdCmnGridPopupMenuTag01 .Visible	:= true;
						StdCmnGridPopupMenuTag02 .Visible	:= true;
						StdCmnGridPopupMenuTag03 .Visible	:= true;
						StdCmnGridPopupMenuTag04 .Visible	:= false;
					end;
			end;
		end
		else
		begin
			StdCmnGridPopupMenuTagOff    .Visible	:= false;
			StdCmnGridPopupMenuTagComment.Visible	:= false;

			StdCmnGridPopupMenuTag01.Visible	:= true;
			StdCmnGridPopupMenuTag02.Visible	:= true;
			StdCmnGridPopupMenuTag03.Visible	:= true;
			StdCmnGridPopupMenuTag04.Visible	:= true;
		end;
	end
	else
	begin
		StdCmnGridPopupMenuTagOff    .Visible	:= false;
		StdCmnGridPopupMenuTagComment.Visible	:= false;

		StdCmnGridPopupMenuTag01.Visible	:= true;
		StdCmnGridPopupMenuTag02.Visible	:= true;
		StdCmnGridPopupMenuTag03.Visible	:= true;
		StdCmnGridPopupMenuTag04.Visible	:= true;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCmnTreeViewPopupMenuTagOnClick (TObject)										*/
//*																											*/
//*	目的	: 摘要登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[各種付箋関係] OnClick ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnCmnTreeViewPopupMenuTagOnClick (Sender: TObject);
var
	cMenuItem: TMenuItem;
	stItemRec: ^TreeViewRec;
	nTagKind : Integer;

begin
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	cMenuItem	:= Sender as TMenuItem;

	if		(cMenuItem.Name = CmnTreeViewPopupMenuTagOff.Name)		then		nTagKind	:= 0
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag01.Name)	then		nTagKind	:= 1
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag02.Name)	then		nTagKind	:= 3
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag03.Name)	then		nTagKind	:= 2
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag04.Name)	then		nTagKind	:= 4
	else																		nTagKind	:= 0;

	stItemRec	:= m_cNodeRightClick.Data;

	if	(stItemRec^.nDivision = 0) then	m_cNodeRightClick.Selected	:= true;

	fnUpdateMasterDataTagInfo (stItemRec^.nExCode, nTagKind);
	fnUpdateGridMemDataRecord (stItemRec^.nExCode, nTagKind);


    if (DtlCmnClientPanel.Visible = True) then
    begin
   		case (nTagKind) of
    		0:	DtlCmnImageTag.Picture	:= nil;
	    	1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
		    2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
   			3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
    		4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
	    end;

        if nTagKind <> 0 then
            DtlCmnImageTag.Visible := True
        else
            DtlCmnImageTag.Visible := False;
    end;

	m_nSelectTagKind	:= nTagKind;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCmnTreeViewPopupMenuTagOnClickEx (TObject)										*/
//*																											*/
//*	目的	: 摘要登録処理 ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[各種付箋関係] OnClick ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnCmnTreeViewPopupMenuTagOnClickEx (Sender: TObject);
var
	dqMasterData: TMQuery;
	cMasDlgParam: TJNTMasDLGParam;
	cMasDlgIF	: TJNTMASFUSENBIKODLGIF;
	cMenuItem	: TMenuItem;
	stItemRec	: ^TreeViewRec;
	nCount		: Integer;
	nTagKindWork: Integer;
	fIgnore		: Boolean;

begin
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	cMenuItem		:= Sender as TMenuItem;
	nTagKindWork	:= 0;
	fIgnore			:= false;

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

		fIgnore	:= true;
	end
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag01Ex.Name) then	nTagKindWork	:= 1
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag02Ex.Name) then	nTagKindWork	:= 3
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag03Ex.Name) then	nTagKindWork	:= 2
	else if	(cMenuItem.Name = CmnTreeViewPopupMenuItemTag04Ex.Name) then	nTagKindWork	:= 4
	else																	Exit;

	m_cNodeRightClick	:= CmnTreeView.Selected;
	stItemRec			:= CmnTreeView.Selected.Data;

	if	(not fIgnore) then
	begin
		fnUpdateMasterDataTagInfo (stItemRec^.nExCode, nTagKindWork);
		fnUpdateGridMemDataRecord (stItemRec^.nExCode, nTagKindWork);

    	m_nSelectTagKind	:= nTagKindWork;

        if (DtlCmnClientPanel.Visible = True) then
        begin
       		case (nTagKindWork) of
        		0:	DtlCmnImageTag.Picture	:= nil;
	        	1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
		        2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
       			3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
        		4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
    	    end;

            if nTagKindWork <> 0 then
                DtlCmnImageTag.Visible := True
            else
                DtlCmnImageTag.Visible := False;
        end;

	end;

	cMasDlgIF	:= TJNTMASFUSENBIKODLGIF.Create ();
	cMasDlgIF.Init (self, Pointer (m_pRec));

	cMasDlgParam	:= TJNTMasDLGParam.CreateParam ();

	cMasDlgParam.m_iMasterkbn	:= 61;													// ﾏｽﾀ区分
	cMasDlgParam.m_iNCode		:= fnGetNCode(TBL_TEKI,0,stItemRec^.nExCode,0);			// 科目ｺｰﾄﾞ
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

			SQL.Clear ();

            SQL.Add ('SELECT FusenCmnt FROM MFusenInfo   '); // HIS0029
			SQL.Add ('WHERE  MasterKbn = 61                 '); // HIS0029
            SQL.Add ('  AND  Ncode     = :nExCode           '); // HIS0029
            SQL.Add ('  AND  SubNCode   = 0                  '); // HIS0029

            ParamByName ('nExCode').AsFloat := fnGetNCode(TBL_TEKI,0,stItemRec^.nExCode);

			Open ();

			StdCmnMemDataExist.Edit ();

			if	(not EOF) then
				StdCmnMemDataExist.FieldByName ('strComment').AsString	:= FieldByName ('FusenCmnt').AsString
			else
				StdCmnMemDataExist.FieldByName ('strComment').AsString	:= '';

			StdCmnMemDataExist.Post ();
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
//*	関数	: TJNTCRP020000f.fnStdCmnGridPopupMenuTagOnClick (TObject)											*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要Grid用ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[付箋] OnClick ｲﾍﾞﾝﾄ									*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnStdCmnGridPopupMenuTagOnClick (Sender: TObject);
var
	cMenuItem: TMenuItem;
	nTagKind : Integer;

begin
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	cMenuItem	:= Sender as TMenuItem;

	if		(cMenuItem.Name = StdCmnGridPopupMenuTagOff.Name)		then	nTagKind	:= 0
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag01.Name)	then	nTagKind	:= 1
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag02.Name)	then	nTagKind	:= 3
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag03.Name)	then	nTagKind	:= 2
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag04.Name)	then	nTagKind	:= 4
	else																	nTagKind	:= 0;

	fnSetGridTagInfo (nTagKind);

    if (DtlCmnClientPanel.Visible = True) then
    begin
   		case (nTagKind) of
    		0:	DtlCmnImageTag.Picture	:= nil;
	    	1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
		    2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
   			3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
    		4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
	    end;

        if nTagKind <> 0 then
            DtlCmnImageTag.Visible := True
        else
            DtlCmnImageTag.Visible := False;
    end;

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnStdCmnGridPopupMenuTagOnClickEx (TObject)										*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要Grid用ﾎﾟｯﾌﾟｱｯﾌﾟﾒﾆｭｰ[付箋] OnClick ｲﾍﾞﾝﾄ									*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnStdCmnGridPopupMenuTagOnClickEx (Sender: TObject);
var
	dqMasterData: TMQuery;
	cMasDlgParam: TJNTMasDLGParam;
	cMasDlgIF	: TJNTMASFUSENBIKODLGIF;
	cMenuItem	: TMenuItem;
	nCount		: Integer;
	nTagKindWork: Integer;
	fIgnore		: Boolean;

begin
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	cMenuItem		:= Sender as TMenuItem;
	nTagKindWork	:= 0;
	fIgnore			:= false;

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

		fIgnore	:= true;
	end
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag01Ex.Name) then		nTagKindWork	:= 1
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag02Ex.Name) then		nTagKindWork	:= 3
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag03Ex.Name) then		nTagKindWork	:= 2
	else if	(cMenuItem.Name = StdCmnGridPopupMenuItemTag04Ex.Name) then		nTagKindWork	:= 4
	else																	Exit;

	if	(not fIgnore) then
		fnSetGridTagInfo (nTagKindWork);


    if (DtlCmnClientPanel.Visible = True) then
    begin
   		case (nTagKindWork) of
    		0:	DtlCmnImageTag.Picture	:= nil;
	    	1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
		    2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
   			3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
    		4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
	    end;

        if nTagKindWork <> 0 then
            DtlCmnImageTag.Visible := True
        else
            DtlCmnImageTag.Visible := False;
    end;


	cMasDlgIF	:= TJNTMASFUSENBIKODLGIF.Create ();
	cMasDlgIF.Init (self, Pointer (m_pRec));

	cMasDlgParam	:= TJNTMasDLGParam.CreateParam ();


	cMasDlgParam.m_iMasterkbn	:= 61;													// ﾏｽﾀ区分
	cMasDlgParam.m_iNCode		:= fnGetNCode(TBL_TEKI,0,Trunc (StdCmnMemDataExist.FieldByName ('nExCode').AsInteger),0);
	cMasDlgParam.m_iSubNCode		:= 0;													// 科目別補助ｺｰﾄﾞ
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

            SQL.Add ('SELECT FusenCmnt FROM MFusenInfo '); // HIS0029
			SQL.Add ('WHERE  MasterKbn = 61            '); // HIS0029
            SQL.Add ('  AND  Ncode     = :nExCode      '); // HIS0029
            SQL.Add ('  AND  SubNCode   = 0            '); // HIS0029


            ParamByName ('nExCode').AsFloat := fnGetNCode(TBL_TEKI,0,Trunc (StdCmnMemDataExist.FieldByName ('nExCode').AsInteger),0);

			Open ();

			StdCmnMemDataExist.Edit ();

			if	(not EOF) then
				StdCmnMemDataExist.FieldByName ('strComment').AsString	:= FieldByName ('FusenCmnt').AsString
			else
				StdCmnMemDataExist.FieldByName ('strComment').AsString	:= '';

			StdCmnMemDataExist.Post ();
		end;

		dqMasterData.Close ();
		dqMasterData.Free  ();
	end;

	cMasDlgParam.Free ();

	cMasDlgIF.Term ();
	cMasDlgIF.Free ();
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   B_ChangeClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.B_ChangeClick(Sender: TObject);
begin

	m_fUnderConstruction	:= true;

    fnChgBtnAction;

	m_fUnderConstruction	:= false;
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   B_EndClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.B_EndClick(Sender: TObject);
begin
    Close;
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   CMChildKey
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.CMChildKey (var Msg: TWMKey);
var
	cShiftState: TShiftState;
	strDummy   : String;
	iRecNo	   : Integer;					// <HIS0052> ADD
begin
//<Shift> DEL	cShiftState	:= KeyDataToShiftState (Msg.KeyData);									// Shiftｷｰの取得
	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);									// Shiftｷｰの取得  <Shift> ADD
//<FUKKYU> ADD St
    if (Msg.CharCode = VK_HOME) and (cShiftState=[ssShift,ssCtrl]) then		// Ctrl+Shift+Home
    begin
        if mrYes = MjsMessageBoxEX(Self,'摘要分類体系の復旧を行います。よろしいですか？',
												'固定摘要登録',
												mjInformation,mjYesNo,mjDefYes) then
            if fnTekiTreeFukkyu() = True then  // TekiTree復旧処理
                MjsMessageBoxEX(Self,'復旧しました。','固定摘要登録',mjInformation,mjOK,mjDefOK);
        Abort;
    end;
//<FUKKYU> ADD Ed
    // ｺﾝﾎﾞ
	if	(Screen.ActiveControl.Name = CmnComboBoxInstruction.Name) then					// 指示ｺﾝﾎﾞﾎﾞｯｸｽ
	begin
        // ESC Or End
		if	((Msg.CharCode = VK_ESCAPE) or (Msg.CharCode = VK_END)) then				// End & Esc
		begin
			Close ();
			Abort;
		end;

        // Shift + Tab      <HIS0036>
    	if	((Msg.CharCode = VK_TAB) and (cShiftState=[ssShift])) then									// Shift+Tab
	    	Abort;

        // Return Or Tab    <HIS0036>
    	if	((Msg.CharCode = VK_RETURN) or (Msg.CharCode = VK_TAB)) then										// Enter & Tab
	    begin
    		m_fIgnoreProc	:= true;

	    	if	(fnChangeSelectionScreen ()) then
            begin
// <HIS0038>↓ｺﾝﾎﾞでのTab, Returnはﾂﾘｰに移動
                CmnTreeView.SetFocus;
{                if DtlCmnClientPanel.Visible then
                    DtlCEdtExCd.SetFocus
                else
                begin
                    if StdCmnTab.Items.Selected = 0 then
                        StdCmnGridExist.SetFocus
                    else if StdCmnTab.Items.Selected = 1 then
                        StdCmnGridTotal.SetFocus;
                end;
}
// <HIS0038>↑
            end;
    		Abort;
	    end;
		Exit;
	end;

    //--- HIS0028 St -----
	// F3
	if (Msg.CharCode = VK_F3) and (cShiftState=[]) then
	begin
		if m_SearchInfo.iTekiCD = 0 then				// 検索対象ｺｰﾄﾞが存在しない時
			B_SearchClick(Self)							// 検索DLG表示
		else 											// 検索対象ｺｰﾄﾞが存在する時
			fnSearch();									// 検索
    end;
    //--- HIS0028 Ed -----

    // ﾂﾘｰ
	if	(Screen.ActiveControl.Name = CmnTreeView.Name) then
	begin
		if	(Msg.CharCode = VK_RETURN) then
		begin
			if	(DtlCmnClientPanel.Visible) then
			begin
				if	(m_nReferMode <> REFER) then
				begin
					m_cACControl	:= DtlCEdtExCd;
					m_cACControl.SetFocus ();
				end;

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
// <HIS0038>↓
        if (Msg.CharCode = VK_TAB) then
        begin
            if cShiftState = [] then
                MjsNextCtrl(Self)
            else if cShiftState = [ssShift] then
                MjsPrevCtrl(Self);
            Abort;

        end;
// <HIS0038>↑
	end;
    // 実在ｸﾞﾘｯﾄﾞ(固定摘要)
	if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then							// 実在Grid
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
					m_cACControl	:= CmnComboBoxInstruction;
					m_cACControl.SetFocus ();

					Abort;
				end
				else
				begin
					StdCmnGridExist.FocusedColumn	:= 3;
					Abort;
				end;
			end;
		end;

		if	((Msg.CharCode = VK_ESCAPE) and (cShiftState = [])) then					// Esc
		begin
			if	((StdCmnDataSourceExist.DataSet.State in [dsEdit, dsInsert]) or			// ﾃﾞｰﾀ変更中
				 (StdCmnGridExist.EditingText <> '')) then								// ﾃﾞｰﾀ入力中
				Exit;

//<MLXDEP>↓
            if (TMSeries.IsMjsLink3) then
			begin
				Close ();
				Abort;
			end
			else begin
				m_cACControl	:= CmnComboBoxInstruction;
				m_cACControl.SetFocus ();
				Abort;
			end;

//*			m_cACControl	:= CmnComboBoxInstruction;
//*			m_cACControl.SetFocus ();

//*			Abort;
//<MLXDEP>↑

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

		Exit;
	end;
    // 合計ｸﾞﾘｯﾄﾞ(摘要分類)
	if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then							// 合計Grid
	begin
		if	((Msg.CharCode = VK_HOME) and (cShiftState <> [ssCtrl])) then				// Home
		begin
			if	(StdCmnGridTotal.EditingText = '') then
			begin
				StdCmnGridTotal.FocusedColumn	:= 0;
				Abort;
			end;
		end;

		if	((Msg.CharCode = VK_END) and (cShiftState <> [ssCtrl])) then				// End
		begin
	 		if	(StdCmnGridTotal.EditingText = '') then
			begin
				if	(StdCmnGridTotal.FocusedColumn = 0) then
				begin
					m_cACControl	:= CmnComboBoxInstruction;
					m_cACControl.SetFocus ();

					Abort
				end
				else
				begin
					StdCmnGridTotal.FocusedColumn	:= 2;
					Abort;
				end;
			end;
		end;

		if	((Msg.CharCode = VK_ESCAPE) and (cShiftState = [])) then					// Esc
		begin
			if	((StdCmnDataSourceTotal.DataSet.State in [dsEdit, dsInsert]) or			// ﾃﾞｰﾀ変更中
				 (StdCmnGridTotal.EditingText <> '')) then								// ﾃﾞｰﾀ入力中
				Exit;

			m_cACControl	:= CmnComboBoxInstruction;
			m_cACControl.SetFocus ();

			Abort;

		end;

		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			if	(StdCmnGridTotal.FocusedColumn = 0) then
			begin
				m_cACControl	:= StdCmnTab;
				m_cACControl.SetFocus ();

				Abort;
			end;
		end;

		Exit;
	end;

//<MLXDEP>
	// 詳細
	if	(Screen.ActiveControl.Name = DtlCEdtExCd.Name) and (TMSeries.IsMjsLink3) then
	begin
		if	((Msg.CharCode = VK_ESCAPE) and (cShiftState = [])) then					// Esc
		begin
			Close ();
			Abort;
		end;
	end;
//<MLXDEP>

    // ﾀﾌﾞ
	if	((StdCmnTab.Focused) or (DtlCmnTab.Focused)) then								// 一覧/詳細ﾀﾌﾞ
	begin
		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			m_cACControl	:= CmnComboBoxInstruction;
			m_cACControl.SetFocus ();

			Abort;
		end;

        //<HIS0037>---------------------------------------------------
    	if	(not m_fAccessTab) then
	    	Exit;

        if DtlCmnClientPanel.Visible then
        begin
            // 詳細TAB
        	if	((Msg.CharCode = VK_RETURN) or (Msg.CharCode = VK_DOWN) or (Msg.CharCode = VK_TAB)) then
	        begin
		        if	(m_nReferMode <> REFER) then
        		begin
	        		m_cACControl	:= DtlCEdtExCd;
       		    end;

   	        	m_cACControl.SetFocus ();
                Abort;
       	    end;
        end else
        begin
            // 一覧TAB
        	if	((Msg.CharCode = VK_RETURN) or (Msg.CharCode = VK_DOWN) or (Msg.CharCode = VK_TAB)) then
	        begin
    		    if	(StdCmnTab.Items [0].Selected) then											// 実在Grid
        			m_cACControl	:= StdCmnGridExist
	        	else																			// 合計Grid
		        	m_cACControl	:= StdCmnGridTotal;

   	        	m_cACControl.SetFocus ();
                Abort;
	        end;
        end;
        //<HIS0037>---------------------------------------------------

        // <HIS0038>↓ﾀﾌﾞで左右ｷｰはｺﾝﾄﾛｰﾙに任せる
        if (Msg.CharCode = VK_RIGHT) or (Msg.CharCode = VK_LEFT) then
            Exit;
        // <HIS0038>↑
	end;

	if	(DtlCmnClientPanel.Visible) then
	begin
		if	((GetKeyState (VK_MENU) < 0) and (Msg.CharCode = VK_DOWN)) then				//	Altｷｰが押された時
			Exit;

	end;

	if	(Screen.ActiveControl.Name = DtlCEdtExCd.Name) then						// ｴﾃﾞｨｯﾄ[摘要(分類)ｺｰﾄﾞ]
	begin
		if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
		begin
			m_cACControl	:= DtlCmnTab;
			m_cACControl.SetFocus ();

			Abort;
		end;
// <HIS0038>ｺﾒﾝﾄｱｳﾄ
//		Exit;
	end;

// <HIS0052> ADD start
	// ｺﾝﾎﾞ
    if Screen.ActiveControl is TMComboBox then
    begin                  					// ↑↓ｷｰはｺﾝﾎﾞに任せる
    	if (Msg.CharCode = VK_UP) or (Msg.CharCode = VK_DOWN) then
        begin
        	Exit;
        end;
        									// ﾄﾞﾛｯﾌﾟﾀﾞｳﾝ中以外のEsc, Endｷｰ
        if ((Msg.CharCode = VK_END) or(Msg.CharCode = VK_ESCAPE)) and
        	 (not TMComboBox(Screen.ActiveControl).DroppedDown) then
        begin                               // 更新へ
			m_cACControl := DtlCmnButtonUpdate;
			m_cACControl.SetFocus ();
			Abort;
		end;
    end;

    // 科目ｺｰﾄﾞ
    if (Screen.ActiveControl.Name = cEdtK1DNum.Name) or
    	(Screen.ActiveControl.Name = cEdtK1CNum.Name) then
    begin                        			// Esc, Endｷｰ
        if (Msg.CharCode = VK_END) or (Msg.CharCode = VK_ESCAPE) then
        begin                               // 更新へ
			m_cACControl := DtlCmnButtonUpdate;
			m_cACControl.SetFocus ();
			Abort;
		end;
    end;

	// 仕訳辞書ｸﾞﾘｯﾄﾞ
    if (Screen.ActiveControl.Name = DtlDSwkGrid.Name) or
    	(Screen.ActiveControl.Name = DtlCSwkGrid.Name) then
    begin
		if	((Msg.CharCode = VK_END) or (Msg.CharCode = VK_ESCAPE)) then
		begin
			with (TdxDBGrid(Screen.ActiveControl).DataSource.DataSet) do
			begin
            	if State <> dsEdit then
                begin
					m_cACControl := DtlCmnButtonUpdate;
					m_cACControl.SetFocus ();
					Abort;
				end;
			end;
		end;

		if (Msg.CharCode = VK_RETURN)  then
		begin                        		// ｺｰﾄﾞ列の最終行
        	iRecNo := TdxDBGrid(Screen.ActiveControl).DataSource.DataSet.RecNo;
    		if (iRecNo = TdxDBGrid(Screen.ActiveControl).DataSource.DataSet.RecordCount) and
	        	(TdxDBGrid(Screen.ActiveControl).FocusedColumn = SWKCLM_CODE) then
            begin
// <HIS0057> DEL 編集ﾓｰﾄﾞでも移動する
//            	if (TdxDBGrid(Screen.ActiveControl).State <> tsEditing) then
//				begin
//<HIS0107> ADD St
                // 事前にPostしないとフォーカス遷移しないための対策
                if (TdxDBGrid(Screen.ActiveControl).State in [tsEditing]) then
                begin
                    TdxDBGrid(Screen.ActiveControl).DataSource.DataSet.Post();
                end;
//<HIS0107> ADD Ed
                MjsNextCtrl(Self);
                abort;
//				end;
            end;
		end;
        if (Msg.CharCode = VK_TAB) then
        begin
            if (cShiftState = []) then      // TAB
                MjsNextCtrl(Self)
            else if (cShiftState = [ssShift]) then
                MjsPrevCtrl(Self);          // TAB + Shift
            Abort;
        end;

        Exit;								// その他はｸﾞﾘｯﾄﾞに任せる
    end;

// <HIS0052> ADD end

    // 科目連想ｸﾞﾘｯﾄﾞ
	if	(Screen.ActiveControl.Name = DtlCmnGrid.Name) then								// 科目連想ｸﾞﾘｯﾄﾞ
	begin
		if	((Msg.CharCode = VK_END) or (Msg.CharCode = VK_ESCAPE)) then
		begin
//			if	(not fnCheckDtlCmnGridRecords ()) then
//				DtlCmnMemData.Cancel ();

			with (DtlCmnDataSource.DataSet) do
			begin
				if	(not DtlCmnGrid.Columns [1].ReadOnly) then
				begin
					if	(not fnCheckSubjectCodeAss (Trunc (FieldByName ('nExCode').AsInteger), strDummy)) then
					begin
						if	(not DtlCmnMemData.IsEmpty ()) then
							DtlCmnMemData.Delete ();
					end;
				end;
			end;

			m_cACControl	:= DtlCmnButtonUpdate;
			m_cACControl.SetFocus ();

			Abort;
		end;

		if (Msg.CharCode = VK_RETURN)  then
		begin
			with (DtlCmnDataSource.DataSet) do
			begin
				if FieldByName('nExCode').IsNull = true then
				begin
					if (DtlCmnGrid.State <> tsEditing) then
					begin
						DtlCmnButtonUpdate.SetFocus;
						abort;
					end;
				end;
			end;
		end;
// <HIS0038>↓
        if (Msg.CharCode = VK_TAB) then
        begin
            if (cShiftState = []) then      // TAB
                MjsNextCtrl(Self)
            else if (cShiftState = [ssShift]) then
                MjsPrevCtrl(Self);          // TAB + Shift
            Abort;
        end
// <HIS0038>↑
	end;
//------------------------------------------------------------------------------HIS0020End
    // 更新ﾎﾞﾀﾝ
	if	(DtlCmnButtonUpdate.Focused) then												// 詳細画面 ﾎﾞﾀﾝ[更新]
	begin
		if	(((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or						// ←
			 ((Msg.CharCode = VK_UP  ) and (cShiftState = []))) then
		begin
			MJSDispCtrl.MjsPrevCtrl (Self);
			Abort;
		end;
	end;

	if	(Screen.ActiveControl.ClassName='TMComboBox') then
	begin
		if	(Msg.CharCode = VK_RIGHT) then
		begin
			MjsDispCtrl.MjsNextCtrl (Self);
			abort;
		end;
		if	(Msg.CharCode = VK_LEFT) then
		begin
			MjsDispCtrl.MjsPrevCtrl (Self);
			abort;
		end;
	end;

    // <KEY> St-----------------------------------------------------------------
    if DtlCmnClientPanel.Visible and (Screen.ActiveControl <> DtlCmnGrid) then
    begin
        if (Screen.ActiveControl is  TMBitBtn) = False then
        begin
// <HIS0038>↓TxtEditでは文字間の移動
            if Screen.ActiveControl is TMTxtEdit then
            begin
                if (not MjsChkCurTop(Screen.ActiveControl)) and
                    (Msg.CharCode = VK_LEFT) then
                    Exit;
                if (not MjsChkCurEnd(Screen.ActiveControl)) and
                    (Msg.CharCode = VK_RIGHT) then
                    Exit;
            end;
// <HIS0038>↑
            // [Return] [Tab] [↓] [→]
            if ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
                ((Msg.CharCode = VK_DOWN) and (cShiftState = [])) or
                ((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or
                 ((Msg.CharCode = VK_RETURN) and (cShiftState = [])) then
            begin
                MjsDispCtrl.MjsNextCtrl (Self);
                abort;
            end;

            // [Shift + Tab]  [←][↑]
    		if	 ((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or
	    		 ((Msg.CharCode = VK_UP  ) and (cShiftState = [])) or
                 ((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
            begin
                MJSDispCtrl.MjsPrevCtrl (Self);
                abort;
            end;
// <HIS0038>↓
        end
        else                                // ﾎﾞﾀﾝだったらReturn以外有効
        begin
            // [Tab] [↓] [→]
            if ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
                ((Msg.CharCode = VK_RIGHT) and (cShiftState = [])) or
                ((Msg.CharCode = VK_DOWN) and (cShiftState = [])) then
            begin
                MjsDispCtrl.MjsNextCtrl (Self);
                abort;
            end;

            // [Shift + Tab]  [←][↑]
    		if	 ((Msg.CharCode = VK_LEFT) and (cShiftState = [])) or
	    		 ((Msg.CharCode = VK_UP  ) and (cShiftState = [])) or
                 ((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) then
            begin
                MJSDispCtrl.MjsPrevCtrl (Self);
                abort;
            end;
        end;
// <HIS0038>↑

    end;

    // <KEY> Ed-----------------------------------------------------------------


	inherited;
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   MComboBoxKeyDown
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnComboBoxInstructionOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

(* // <HIS0036>
	if	((Key = VK_ESCAPE) or (Key = VK_END)) then										// End & Esc
	begin
		Close;
		Abort;
	end;

	if	((Key = VK_TAB) and (Shift = [ssShift])) then									// Shift+Tab
		Abort;

	if	((Key = VK_RETURN) or (Key = VK_TAB)) then										// Enter & Tab
	begin
		m_fIgnoreProc	:= true;

		if	(fnChangeSelectionScreen ()) then
    		CmnTreeView.SetFocus ();

		Abort;
	end;
*)
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   B_DeleteClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnToolbarButtonDeleteOnClick (Sender: TObject);
var
	cNode		: TTreeNode;
	stWorkRec	: ^TreeViewRec;
	stMessageRec: TMJSMsgRec;
	nExCode		: Integer;
	nSumDivision: Integer;
	strMessage	: String;

	fResult		: Integer;

    exNCode         :   Extended;           // <CHK>
    strErr          :   String;             // <CHK>
    strMsg          :   String;             // <CHK>
//    strCode, strName    :   String;         // <CHK> 	// <HIS0052> DEL
    strName    		:   String;         	// <CHK>	// <HIS0052> ADD

begin
//<HIS0078 start>
	stWorkRec	:= nil;
//<HIS0078 end>
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	if	(CmnTreeView.Focused) then														// ﾂﾘｰ･ﾋﾞｭｰ
	begin
		cNode			:= CmnTreeView.Selected;
		stWorkRec		:= cNode.Data;
		nExCode			:= stWorkRec^.nExCode;
		nSumDivision	:= stWorkRec^.nDivision;
		strMessage		:= '"' + MjsHanCopy (stWorkRec^.strName, 8, 256);
	end
	else if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then						// 固定摘要ｸﾞﾘｯﾄﾞ
	begin
		nExCode			:= StdCmnGridExist.DataSource.DataSet.FieldByName ('nExCode').AsInteger;
		nSumDivision	:= 0;
		strMessage		:= '"' + StdCmnGridExist.DataSource.DataSet.FieldByName ('strName').AsString;
        strName         := StdCmnGridExist.DataSource.DataSet.FieldByName ('strName').AsString; // <CHK>
	end
	else if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then						// 摘要分類ｸﾞﾘｯﾄﾞ
	begin
		nExCode			:= StdCmnGridTotal.DataSource.DataSet.FieldByName ('nExCode').AsInteger;
		nSumDivision	:= 1;
		strMessage		:= '"' + StdCmnGridTotal.DataSource.DataSet.FieldByName ('strName').AsString;
        strName         := StdCmnGridTotal.DataSource.DataSet.FieldByName ('strName').AsString; // <CHK>
	end
	else
	begin
		nExCode	:= Trunc (DtlCEdtExCd.Value);

		if	(DtlCmnTab.Items [0].Selected) then
			nSumDivision	:= 0
		else
			nSumDivision	:= 1;

        strMessage	:= '"' + DtlCmnEditName.Text;
        strName     := DtlCmnEditName.Text;     // <CHK>
	end;

	m_cComArea.m_MsgStd.GetMsg (stMessageRec, 30, 4);

//	strMessage	:= '"' + Format ('%d', [nExCode]);


	if	(nSumDivision = 0) then
		strMessage	:= strMessage + '"の固定摘要を' + stMessageRec.sMsg
	else
		strMessage	:= strMessage + '"の摘要分類を' + stMessageRec.sMsg;

	if	(MJSMessageBoxEx (Self,strMessage, stMessageRec.sTitle, stMessageRec.icontype,
									stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType) = mrYes) then
	begin

		//部署の時	HIS0027
    	if m_DataKbn = 3 then
	    begin
			if fnSectionCodeCheck(nSumDivision, nExCode) = '' then
			begin
				m_cComArea.m_MsgStd.GetMsg( stMessageRec, 30,18);
				stMessageRec.sMsg	:= '経理側で入力した摘要の為、部署側では削除できません。';

				MjsMessageBoxEx (Self,stMessageRec.sMsg, stMessageRec.sTitle,
								 stMessageRec.icontype, mjOk, stMessageRec.btndef, false);

				Exit;
			end;
		end;

//------------------------------------------------------------------------------HIS0010Start
		fResult	:= fnSwkDetailCheck(nSumDivision, nExCode);

		if fResult = 0 then		//仕訳で固定摘要コードが使用されているとき
        begin
			m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,18);
    		MjsMessageBoxEx(Self,'仕訳が存在する為削除' + m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype , m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);

			Exit;
		end
		else if fResult = -1 then
			Exit;
//------------------------------------------------------------------------------HIS0010End

//------------------------------------------------------------------------------HIS0013Start
		if	(CmnTreeView.Focused) then														// ﾂﾘｰ･ﾋﾞｭｰ
		begin
			if (stWorkRec.nDivision = m_stWorkRecPaste.nDivision) and
    	       (stWorkRec.nExCode   = m_stWorkRecPaste.nExCode  ) then
			begin
				m_stWorkRecPaste.nDivision := 0;
				m_stWorkRecPaste.nExCode   := 0;
				m_stWorkRecPaste.strName   := '';
			end;
		end
		else
		begin
			if (nSumDivision = m_stWorkRecPaste.nDivision) and
               (nExCode      = m_stWorkRecPaste.nExCode  ) then
			begin
				m_stWorkRecPaste.nDivision := 0;
				m_stWorkRecPaste.nExCode   := 0;
				m_stWorkRecPaste.strName   := '';
			end;
		end;
//------------------------------------------------------------------------------HIS0013End

        // <CHK>↓
        //内部ｺｰﾄﾞ取得

        exNCode :=  fnGetNCode2(nSumDivision, nExCode, strname);

        if	(exNCode = -1) then
		begin
			fnOutputDBErrorMessage ();
			Exit;
		end;
                                            // 削除ﾁｪｯｸｽﾄｱﾄﾞ実行
        if not fnDelCheck(exNCode, strErr) then
        begin                                            // 「ｺｰﾄﾞ 簡略名称 は、xxxのため削除できません。」
			// <SYNC> MOD start strErrは「は～のため削除できません」
(*            strMsg := IntToStr(nExCode) + ' ' + strName + ' は、' + strErr +
                    'のため削除できません。';
*)
            strMsg := IntToStr(nExCode) + ' ' + strName + ' ' + strErr;
			// <SYNC> MOD end
            MjsMessageBoxEx(Self, strMsg, '確認', mjInformation, mjOk, mjDefOk);
            Exit;
        end;
        // <CHK>↑

// <SYNC> ADD start
		// 親会社の場合は子会社で使われていないかﾁｪｯｸ
// <HIS0062> MOD start
//        if (m_iGrpCorp = GRP_USE) and (m_iTransKbn = GRP_TRANSKBN_PARENT) then
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_PARENT) then
// <HIS0062> MOD end
        begin
			if not fnDelCheckChild(exNCode) then
			begin
        	    MjsMessageBoxEx(Self, JNTSYNC_MSG_USE_CHILD, '削除', mjInformation, mjOk, mjDefOk);
				Exit;
			end;
        end;
// <SYNC> ADD end

(*H0003 20030821 khattori syuusei Drag & Drop 対応*)
		if	(CmnTreeView.Focused) then														// ﾂﾘｰ･ﾋﾞｭｰ
		begin
			fnDeleteMasterRecord (nSumDivision, nExCode);
//HIS0034			fnResetParentItemsInfo ();
		end

		else if	(Screen.ActiveControl = StdCmnGridExist) then						// 固定摘要ｸﾞﾘｯﾄﾞ
		begin
			//	グリッドにフォーカスがある時、削除後のスクロールを防ぐ
			m_fUnderConstruction3	:= true;

			if	fnDeleteMasterRecord (nSumDivision, nExCode)	then
			if	StdCmnGridExist.DataSource.DataSet.FieldByName ('nExCode').AsInteger=nExCode	then
			StdCmnMemDataExist.Delete;
		end

		else if	(Screen.ActiveControl = StdCmnGridTotal) then						// 摘要分類ｸﾞﾘｯﾄﾞ
		begin
			//	グリッドにフォーカスがある時、削除後のスクロールを防ぐ
			m_fUnderConstruction3	:= true;

			if	fnDeleteMasterRecord (nSumDivision, nExCode)	then
			if	StdCmnGridTotal.DataSource.DataSet.FieldByName ('nExCode').AsInteger = nExCode	then
			StdCmnMemDataTotal.Delete;
		end

		else					// 摘要分類ｸﾞﾘｯﾄﾞ
		begin
			fnDeleteMasterRecord (nSumDivision, nExCode);
//HIS0034			fnResetParentItemsInfo ();
		end;
//		fnDeleteMasterRecord (nSumDivision, nExCode);
		fnResetParentItemsInfo ();  //HIS0034 Add
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCmnToolbarButtonTagOnClick (TObject)												*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ [付箋] OnClick ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnCmnToolbarButtonTagOnClick (Sender: TObject);
var
	stItemRec	: ^TreeViewRec;
	nTagKindWork: Integer;

begin
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	nTagKindWork	:= 0;

	case (CmnToolbarButtonTag.ImageIndex) of
		0:	nTagKindWork	:= 1;
		1:	nTagKindWork	:= 3;
		2:	nTagKindWork	:= 2;
		3:	nTagKindWork	:= 4;
	end;

    if (DtlCmnClientPanel.Visible = True) then
    begin
        if fnGetNCode(TBL_TEKI,0,DtlCEdtExCd.AsInteger) <>-1 then
        begin
            fnUpdateMasterDataTagInfo (DtlCEdtExCd.AsInteger, nTagKindWork);
          	fnUpdateGridMemDataRecord (DtlCEdtExCd.AsInteger, nTagKindWork);

    		case (nTagKindWork) of
	    		0:	DtlCmnImageTag.Picture	:= nil;
		    	1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
			    2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
    			3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
	    		4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
		    end;

            if nTagKindWork <> 0 then
                DtlCmnImageTag.Visible := True
            else
                DtlCmnImageTag.Visible := False;
        end;
    end
    else begin
    	if	((Screen.ActiveControl.Name = StdCmnGridExist.Name) or							// 実在補助ｸﾞﾘｯﾄﾞ
    	  	 (Screen.ActiveControl.Name = StdCmnGridTotal.Name)) then						// 合計補助ｸﾞﾘｯﾄﾞ
    		fnSetGridTagInfo (nTagKindWork)
    	else if	(Screen.ActiveControl.Name = CmnTreeView.Name) then							// ﾂﾘｰﾋﾞｭｰ
    	begin
    		stItemRec	:= CmnTreeView.Selected.Data;

	    	fnUpdateMasterDataTagInfo (stItemRec^.nExCode, nTagKindWork);
		    fnUpdateGridMemDataRecord (stItemRec^.nExCode, nTagKindWork);
    	end;
    end;
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   B_SyousaiClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnToolbarButtonDetailOnClick (Sender: TObject);
var
	cNode		 : TTreeNode;
	stSelectRec	 : ^TreeViewRec;
	stParentRec	 : ^TreeViewRec;
	nExCodeParent: Integer;
	strName		 : String;
    nReturn      : Integer; //HIS0093

begin
	if	(DtlCmnClientPanel.Visible) then
	begin
//HIS0093↓
        //詳細画面で編集中？
        if m_fChangeDetails then
        begin
            //キャンセルしますか？
            nReturn	:= fnOutputConfirmationMessage (CONFIRM_CANCEL);
            //いいえの場合は一覧へ遷移しない。
            if nReturn = 1 then Exit;
        end;
//HIS0093↑
		DtlCmnClientPanel.Visible	:= false;
		StdCmnClientPanel.Visible	:= true;

		cNode		:= CmnTreeView.Selected;
		stSelectRec	:= cNode.Data;

		if	(stSelectRec^.nDivision = 0) then
		begin
			stParentRec		:= cNode.Parent.Data;
			nExCodeParent	:= stParentRec^.nExCode;
			strName			:= stParentRec^.strName;
		end
		else
		begin
			nExCodeParent	:= stSelectRec^.nExCode;
			strName			:= stSelectRec^.strName;
		end;

		fnSetParentItemsInfoEx   (stSelectRec^.nDivision, stSelectRec^.nExCode, nExCodeParent, strName);
		fnMoveGridRecordSelecter (stSelectRec^.nDivision, stSelectRec^.nExCode);

		m_cACControl	:= CmnTreeView;
		m_cACControl.SetFocus ();

		CmnToolbarButtonDetail.Caption	:= '詳細(&T)';
//HIS0093↓
        //変更フラグはFalseにする。（直前のイベントによりTrueになることがあり終了時に詳細情報の更新が実行されてしまうため）
        m_fChangeDetails := False;
//HIS0093↑
	end
	else
	begin
		fnShowDetailScreen ();

		if	(m_nReferMode <> REFER) then
		begin
			m_cACControl	:= DtlCEdtExCd;
			m_cACControl.SetFocus ();
		end;

		CmnToolbarButtonDetail.Caption	:= '一覧(&T)';

//<HIS0078 start>
		fnCmnTreeViewOnChange(CmnTreeView,CmnTreeView.Selected);
//<HIS0078 end>
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   Syousai_DetailClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnTreeViewPopupMenuDetailOnClick (Sender: TObject);
var
	cNode: TTreeNode;

begin
	cNode			:= m_cNodeRightClick;
	cNode.Selected	:= true;

	fnShowDetailScreen ();

	CmnToolbarButtonDetail.Caption:= '一覧(&T)';

	if	(m_nReferMode = REFER) then
	begin
		DtlCmnButtonUpdate.Enabled	:=	false;											// [詳細] 更新ﾎﾞﾀﾝ
		DtlCmnButtonCancel.Enabled	:=	false;											// [詳細] 取消ﾎﾞﾀﾝ

		m_cACControl	:= CmnTreeView;
		m_cACControl.SetFocus ();

		Exit;
	end
	else
	begin
		DtlCmnButtonUpdate.Enabled	:=	true;											// [詳細] 更新ﾎﾞﾀﾝ
		DtlCmnButtonCancel.Enabled	:=	true;											// [詳細] 取消ﾎﾞﾀﾝ
	end;

	m_cACControl	:= DtlCEdtExCd;
	m_cACControl.SetFocus ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnButtonUpdateOnClick (TObject)												*/
//*																											*/
//*	目的	: 摘要登録処理 更新ﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnButtonUpdateOnClick (Sender: TObject);
var
	nSumDivision: Integer;
    oEventHandler : TNotifyEvent;  //<HIS0103> ADD
begin
//<HIS0103> ADD St
    if (m_cACControl is TdxDBGrid) then
    begin
        oEventHandler := TdxDBGrid(m_cACControl).OnExit;
        if Assigned(oEventHandler) then
        begin
            // Exitイベントを経由して以下の処理を行う
            oEventHandler(m_cACControl);
        end;
    end;
//<HIS0103> ADD Ed
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck<>EXCEPT_RET_OK	then	Abort;

	if	(fnUpdateDetailsScreenRecord ()) then
	begin

		if	(DtlCmnTab.Items [0].Selected) then
			nSumDivision	:= 0
		else
			nSumDivision	:= 1;

		fnSelectTreeViewItem (nSumDivision, Trunc (DtlCEdtExCd.Value));

		m_cNodePrevSelect	:= CmnTreeView.Selected;

		m_fChangeDetails	:= false;

		fnCleanupTreeViewNewItem (false);

        m_NCodeUse := true;     //fnShowDetailScreen時にNCodeから画面上にGCodeを表示
		fnShowDetailScreen		 ();
        m_NCodeUse := false;

		m_cACControl	:= DtlCEdtExCd;
		m_cACControl.SetFocus ();
        CmnToolbarButtonDelete.Enabled := m_cJNTArea.IsDelete;  // 更新後は権限に基づいて使用可 <HIS0100> ADD
	end;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnButtonCancelOnClick (TObject)												*/
//*																											*/
//*	目的	: 摘要登録処理 取消ﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnButtonCancelOnClick (Sender: TObject);
var
	nReturn		: Integer;
	nSumDivision: Integer;

begin
	if	(DtlCmnTab.Items [0].Selected) then
		nSumDivision	:= 0
	else
		nSumDivision	:= 1;

	fnSelectTreeViewItem (nSumDivision, Trunc (DtlCEdtExCd.Value));

	nReturn	:= fnOutputConfirmationMessage (CONFIRM_CANCEL);

	if	(nReturn = CONFIRM_THROUGH) then
	begin
		fnCleanupTreeViewNewItem (true);

		fnSetDetailScreenInfo (Trunc (DtlCEdtExCd.Value), nSumDivision);

		m_fChangeDetails	:= false;

		m_cACControl	:= DtlCEdtExCd;
		m_cACControl.SetFocus ();
	end;
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   EStaxRateExit
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.fnDtlCmnEditTaxRateOnExit(Sender: TObject);
var
	nReturn		  : Integer;
	strDescription: String;
begin
	nReturn	:= fnCheckTaxRate (Trunc (DtlCmnEditTaxRate.Value), strDescription);

	DtlCmnLbelTaxRateDesc.Caption	:= strDescription;

	if	((nReturn <> CHECK_OK) and (not m_fAppExit)) then
	begin
		Beep ();

		m_cACControl	:= DtlCmnEditTaxRate;
		m_cACControl.SetFocus ();

		Abort;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   ETypeCodeExit
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.fnDtlCmnEditTypeCodeOnExit(Sender: TObject);
var
	nReturn		  : Integer;
	strDescription: String;

begin
	nReturn	:= fnCheckTypeCode (Trunc (DtlCmnEditTypeCode.Value), strDescription);

	DtlCmnLbelTypeCodeDesc.Caption	:= strDescription;

	if	((nReturn <> CHECK_OK) and (not m_fAppExit)) then
	begin
		Beep ();

		m_cACControl	:= DtlCmnEditTypeCode;
		m_cACControl.SetFocus ();

		Abort;
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   FusenRedClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.FusenRedClick(Sender: TObject);
begin
    SelectFusenColor(1);
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   FusenGreenClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.FusenGreenClick(Sender: TObject);
begin
    SelectFusenColor(2);
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   FusenBlueClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.FusenBlueClick(Sender: TObject);
begin
    SelectFusenColor(3);
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   FusenOrangeClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.FusenOrangeClick(Sender: TObject);
begin
    SelectFusenColor(4);
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   SelectFusenColor
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.SelectFusenColor(SelectFusen: Integer);
begin
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   EDKmkCodeArrowClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnDtlCEdtExCdK1OnArrowClick (Sender: TObject);
// <HIS052> DEL start
(*
var
	cEditNumeric: TMNumEdit;
	cLabelDesc	: TMLabel;
	cMasWndParam: TJNTMasWndParam;
	cMasWndIF	: TJNTMasWndIF;
	nDivision	: Integer;
	nExCode		: Integer;
*)// <HIS0052> DEL end
begin
{
	cEditNumeric	:= Sender as TMNumEdit;
	nDivision		:= -1;

	if	(cEditNumeric.Name = cEdtK1DNum.Name) then
	begin
		cLabelDesc	:= cLblK1DDsc;
		nDivision	:= 0;
	end
	else if	(cEditNumeric.Name = cEdtK1CNum.Name) then
	begin
		cLabelDesc	:= cLblK1CDsc;
		nDivision	:= 1;
	end
	else
		cLabelDesc	:= nil;

	if	(nDivision = -1) then
		Exit;

	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (Pointer (m_pRec));

	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'GCode';												// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'Renso'; 											// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';										// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'KmkMA';												// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_SQL_Where	:= fnMakeSQLConstructionKmkMA (MASTER_SUBJECT, nDivision, 0);
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);									// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= 6;													// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= 0;													// ｺｰﾄﾞ属性
	cMasWndParam.m_ColorCASE	:= JNTMASWND_COLOR_KAMOK_SEIZOU_BLUE;

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		nExCode	:= StrToInt (cMasWndParam.m_ExpRetCode);

		fnSetDtlEditExCodeAttribute (nExCode, nDivision);

(*H0001 20030818 khattori 検索EXPで科目を選択した時、消費税の入力が出来ない*)
		if	cEditNumeric.Value<>nExCode	then
		m_fExCodeKMCheck [nDivision]	:= true;
		cEditNumeric.Value		:= nExCode;
		cLabelDesc  .Caption	:= cMasWndParam.m_ExpRetText;

//		m_fExCodeKMCheck [nDivision]	:= false;
	end;

	cMasWndParam.Free ();
	cMasWndIF   .Term ();
	cMasWndIF   .Free ();
}
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   EDSubCodeArrowClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnDtlCEdtExCdK2OnArrowClick (Sender: TObject);
// <HIS0052> DEL start
(*
var
	cEditNumeric: TMtxtEdit;
	cLabelDesc	: TMLabel;
	cMasWndParam: TJNTMasWndParam;
	cMasWndIF	: TJNTMasWndIF;
	nDivision	: Integer;
	nExCode		: Integer;
*)//<HIS0052> DEL end
begin
{
	cEditNumeric	:= Sender as TMTxtEdit;
	nDivision		:= -1;

	if	(cEditNumeric.Name = cEdtK2DNum.Name) then
	begin
		cLabelDesc	:= cLblK2DDsc;
		nDivision	:= 0;
		nExCode		:= Trunc (cEdtK1DNum.Value);
	end
	else if	(cEditNumeric.Name = cEdtK2CNum.Name) then
	begin
		cLabelDesc	:= cLblK2CDsc;
		nDivision	:= 1;
		nExCode		:= Trunc (cEdtK1CNum.Value);
	end
	else
	begin
		cLabelDesc	:= nil;
		nExCode		:= 0;
	end;

	if	(nDivision = -1) then
		Exit;

	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (Pointer (m_pRec));

	cMasWndParam	:= TJNTMasWndParam.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'SubCode';											// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'Renso'; 											// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';										// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'KmkMA';												// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_SQL_Where	:= fnMakeSQLConstructionKmkMA (MASTER_SUBJECTPLUS, nDivision, nExCode);
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);									// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_stCurDtlCodeAttr [nDivision * 8 + 1].nDigit;			// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_stCurDtlCodeAttr [nDivision * 8 + 1].nAttribute;		// ｺｰﾄﾞ属性
	cMasWndParam.m_ColorCASE	:= JNTMASWND_COLOR_KAMOK_SEIZOU_BLUE;

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		if	(cMasWndParam.m_ExpRetCode <> '') then
		begin
			cEditNumeric.text		:= cMasWndParam.m_ExpRetCode;
			cEditNumeric.InputFlag	:= false;
			cLabelDesc  .Caption	:= cMasWndParam.m_ExpRetText;
		end;
	end;

	cMasWndParam.Free ();
	cMasWndIF   .Term ();
	cMasWndIF   .Free ();
}
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnEditDealDivisionOnChange (TObject)										*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[取引先区分] OnChange ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnEditDealDivisionOnChange (Sender: TObject);
var
	nDivision	  : Integer;
	nWork		  : Integer;
	strDescription: String;

begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	fnOnChange (Sender);

	nDivision	:= Trunc (DtlCmnEditDealDivision.Value);

	fnCheckDealDivision (nDivision, strDescription);
	DtlCmnLbelDealDivisionDesc.Caption	:= strDescription;								// 名称ｾｯﾄ

	if	(nDivision = 0) then
	begin
		DtlCmnLbelDealClassTitle.Enabled	:= false;

		DtlCmnEditDealClass.Clear ();
		DtlCmnEditDealClass.Enabled	:= false;
		DtlCmnEditDealClass.Color	:= TJNTCRP020000f (Self).Color;

		DtlCmnLbelDealClassDesc.Caption	:= '';
	end
	else
	begin
		DtlCmnLbelDealClassTitle.Enabled	:= true;

		nWork	:= Trunc (DtlCmnEditDealClass.Value);

//		if	(m_nReferMode <> REFER) then
 		DtlCmnEditDealClass.Enabled	:= true;

		DtlCmnEditDealClass.Color		:= clWindow;
		DtlCmnEditDealClass.Value		:= nWork;
		DtlCmnEditDealClass.InputFlag	:= false;

		if	((nWork >= 0) and (nWork <= 3)) then
			DtlCmnLbelDealClassDesc.Caption	:= MjsHanCopy (DtlCmnEditDealClass.SelectItems.Strings [nWork], 4, 14)
		else
			DtlCmnLbelDealClassDesc.Caption	:= '';
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCEdtExCdK1OnChange (TObject)											*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[勘定科目](借方/貸方共通) OnChange ｲﾍﾞﾝﾄ									*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCEdtExCdK1OnChange (Sender: TObject);
var
	cEditNumeric: TMNumEdit;
	nDivision	: Integer;

begin
	fnOnChange (Sender);

	if	(m_fUnderConstruction) then
		Exit;

	cEditNumeric	:= Sender as TMNumEdit;
	nDivision		:= -1;

	if	(cEditNumeric.Name = cEdtK1DNum.Name) then
		nDivision	:= 0
	else if	(cEditNumeric.Name = cEdtK1CNum.Name) then
		nDivision	:= 1;

	if	(nDivision = -1) then
		Exit;

	m_fExCodeKMCheck [nDivision]	:= true;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnEditTaxDivisionOnChange (TObject)											*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[消費税区分] OnChange ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnEditTaxDivisionOnChange (Sender: TObject);
var
	nWork		:	Integer;
	strDesc		:	String;

begin
	if	(m_pRec^.m_pChildForm = nil) then	Exit;

// <HIS0052> MOD start
//	if	MCheckBox1.Checked	then	Exit;
	if IsBusyoDenpyo() then					// 部署伝票として使用する場合
    	Exit;
// <HIS0052> MOD end

	fnOnChange (Sender);

	m_iTaxKbn	:= Trunc (DtlCmnEditTaxDivision.Value);

	fnCheckTaxDivision (m_iTaxKbn, strDesc);
	DtlCmnLbelTaxDivisionDesc.Caption	:= strDesc;

	if	(m_iTaxKbn = 0) then
	begin
		ClearTaxEdit(2,2);
		ClearTaxEdit(3,1);
		ClearTaxEdit(4,1);
	end
	else
	begin
		fnSetDtlEditTaxCodeSelectItems (m_iTaxKbn);

		ClearTaxEdit(2,3);

		DtlCmnEditTaxCode.Value		:= Trunc (DtlCmnEditTaxCode.Value);
		DtlCmnEditTaxCode.InputFlag	:= false;

		fnCheckTaxCode (m_iTaxKbn, Trunc (DtlCmnEditTaxCode.Value), strDesc);

		DtlCmnLbelTaxCodeDesc.Caption	:= strDesc;

		if	(Trunc (DtlCmnEditTaxCode.Value) <> 0) then
		begin
			if	m_cTaxItems.iRate=1	then
			begin
				nWork	:=  Trunc (DtlCmnEditTaxRate.Value);

				ClearTaxEdit(3,3);

				DtlCmnEditTaxRate		.Value		:= nWork;
				DtlCmnEditTaxRate		.InputFlag	:= false;

//<HIS0101> MOD st
//				if	((nWork >= 0) and (nWork <= 2)) then
//					DtlCmnLbelTaxRateDesc.Caption	:= Copy (DtlCmnEditTaxRate.SelectItems.Strings [nWork], 4, 14)
				if	(m_TaxRateInfo.IsExistRateCD(nWork) = True) then
					DtlCmnLbelTaxRateDesc.Caption	:= m_TaxRateInfo.GetTaxNameByRateCD(nWork)
//<HIS0101> MOD ed
				else
					DtlCmnLbelTaxRateDesc.Caption	:= '';
			end
			else
			begin
				ClearTaxEdit(3,1);
			end;

// <HIS0052> MOD start
//			if	m_cTaxItems.iType=1	then
                                       // 売上科目がある場合
//<HIS0105> DEL        	if IsUriageKmk(Trunc(cEdtK1DNum.Value), Trunc(cEdtK1CNum.Value)) then
// <HIS0052> MOD end
//<HIS0105> ADD St
            if ((m_cTaxItems.iType = 1) and
                (IsUriageKmk(Trunc(cEdtK1DNum.Value), Trunc(cEdtK1CNum.Value)))) then
//<HIS0105> ADD Ed
			begin
				nWork	:= Trunc (DtlCmnEditTypeCode.Value);

				ClearTaxEdit(4,3);

				DtlCmnEditTypeCode      .Value		:= nWork;
				DtlCmnEditTypeCode      .InputFlag	:= false;

//<HIS0105> DEL				if	((nWork >= 0) and (nWork <= 5)) then
				if	((nWork >= m_cTypeCode.MinCode) and (nWork <= m_cTypeCode.MaxCode)) then  //<HIS0105> ADD
					DtlCmnLbelTypeCodeDesc.Caption	:= MjsHanCopy (DtlCmnEditTypeCode.SelectItems.Strings [nWork], 4, 14)
				else
					DtlCmnLbelTypeCodeDesc.Caption	:= '';
			end
			else
			begin
				ClearTaxEdit(4,1);
			end;
		end
		else
		begin
			ClearTaxEdit(3,1);
			ClearTaxEdit(4,1);
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnEditTaxCodeOnChange (TObject)												*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[消費税ｺｰﾄﾞ] OnChange ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnEditTaxCodeOnChange (Sender: TObject);
var
	nTaxCode	  : Integer;
	nWork		  : Integer;
	strDescription: String;
begin

	if	(m_pRec^.m_pChildForm = nil) then	Exit;

	fnOnChange (Sender);

	nTaxCode	:= Trunc (DtlCmnEditTaxCode.Value);

// <HIS0052> MOD start
//	if	MCheckBox1.Checked	then
	if	IsBusyoDenpyo()	then				// 部署伝票として使用する場合
// <HIS0052> MOD end
	begin
		if	(m_iTaxKbn <> 0) then
			DtlCmnEditTaxCode.InputFlag	:= false;

		fnCheckTaxCode (m_iTaxKbn, nTaxCode, strDescription);
	end
	else
	begin
		if	(Trunc (DtlCmnEditTaxDivision.Value) <> 0) then
			DtlCmnEditTaxCode.InputFlag	:= false;

		fnCheckTaxCode (Trunc (DtlCmnEditTaxDivision.Value), nTaxCode, strDescription);
	end;

	DtlCmnLbelTaxCodeDesc.Caption	:= strDescription;

	if	(m_iTaxKbn = 0) then
	begin
// <HIS0052> MOD start
// 		ClearTaxEdit(3,1);
		ClearTaxEdit(3,3);
// <HIS0052> MOD end
		ClearTaxEdit(4,1);
	end
	else
	begin
// <HIS0052> MOD start
(*		if	m_cTaxItems.iRate=1	then
		begin
			nWork	:=  Trunc (DtlCmnEditTaxRate.Value);

			ClearTaxEdit(3,3);

			DtlCmnEditTaxRate		.Value		:= nWork;
			DtlCmnEditTaxRate		.InputFlag	:= false;
			fnCheckTaxRate (nWork, strDescription);
			DtlCmnLbelTaxRateDesc	.Caption	:= strDescription;
		end
		else
		begin
			ClearTaxEdit(3,1);
		end;
*)
		nWork	:=  Trunc (DtlCmnEditTaxRate.Value);

		ClearTaxEdit(3,3);

		DtlCmnEditTaxRate		.Value		:= nWork;
		DtlCmnEditTaxRate		.InputFlag	:= false;
		fnCheckTaxRate (nWork, strDescription);
		DtlCmnLbelTaxRateDesc	.Caption	:= strDescription;
// <HIS0052> MOD end

// <HIS0052> MOD start
//		if	m_cTaxItems.iType=1	then
                                       // 売上科目がある場合
//<HIS0105> DEL       	if IsUriageKmk(Trunc(cEdtK1DNum.Value), Trunc(cEdtK1CNum.Value)) then
// <HIS0052> MOD end
//<HIS0105> ADD St
		if (m_cTaxItems.iType = 1) and
            (IsUriageKmk(Trunc(cEdtK1DNum.Value), Trunc(cEdtK1CNum.Value))) then
//<HIS0105> ADD Ed
		begin
			nWork	:= Trunc (DtlCmnEditTypeCode.Value);

			ClearTaxEdit(4,3);

			DtlCmnEditTypeCode		.Value		:= nWork;
			DtlCmnEditTypeCode		.InputFlag	:= false;
			fnCheckTypeCode (nWork, strDescription);
			DtlCmnLbelTypeCodeDesc	.Caption	:= strDescription;
		end
		else
		begin
			ClearTaxEdit(4,1);
		end;
//<HIS0111> ADD St
        if (fnCheckTaxValue(m_iTaxKbn, DtlCmnEditTaxRate.AsInteger,
            DtlCmnEditTaxCode.AsInteger) <> CHECK_OK) then
        begin
            if ((not m_fUnderConstruction) and (DtlCmnEditTaxRate.CanFocus)) then
            begin
                MjsMessageBoxEx(self, MSG_TAXRATEANDCODE,
                                '確認', mjInformation, mjOk, mjDefOk);
                beep;
                DtlCmnEditTaxRate.Value := 0;
                DtlCmnEditTaxRate.SetFocus;
                Abort;
            end;
        end;
//<HIS0111> ADD Ed
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnEditTaxRateOnChange (TObject)												*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[消費税率] OnChange ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnEditTaxRateOnChange (Sender: TObject);
var
	nTaxRate	  : Integer;
	strDescription: String;

begin

	if	(m_pRec^.m_pChildForm = nil) then	Exit;

	fnOnChange (Sender);

	nTaxRate	:= Trunc (DtlCmnEditTaxRate.Value);

	fnCheckTaxRate (nTaxRate, strDescription);

	DtlCmnLbelTaxRateDesc.Caption	:= strDescription;
//<HIS0111> ADD St
    if (fnCheckTaxValue(m_iTaxKbn, DtlCmnEditTaxRate.AsInteger,
        DtlCmnEditTaxCode.AsInteger) <> CHECK_OK) then
    begin
        if ((not m_fUnderConstruction) and (DtlCmnEditTaxRate.CanFocus)) then
        begin
            MjsMessageBoxEx(self, MSG_TAXRATEANDCODE,
                            '確認', mjInformation, mjOk, mjDefOk);
            beep;
            DtlCmnEditTaxRate.Value := 0;
            DtlCmnEditTaxRate.SetFocus;
            Abort;
        end;
    end;
//<HIS0111> ADD Ed
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnEditTypeCodeOnChange (TObject)											*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[業者ｺｰﾄﾞ] OnChange ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnEditTypeCodeOnChange (Sender: TObject);
var
	nTypeCode	  : Integer;
	strDescription: String;

begin
	if	(m_pRec^.m_pChildForm = nil) then	Exit;

	fnOnChange (Sender);

	nTypeCode	:= Trunc (DtlCmnEditTypeCode.Value);

	fnCheckTypeCode (nTypeCode, strDescription);

	DtlCmnLbelTypeCodeDesc.Caption	:= strDescription;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnEditDealDivisionOnExit (TObject)											*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[取引先区分] OnExit ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnEditDealDivisionOnExit (Sender: TObject);
var
	nReturn		  : Integer;
	strDescription: String;

begin
	nReturn	:= fnCheckDealDivision (Trunc (DtlCmnEditDealDivision.Value), strDescription);

	DtlCmnLbelDealDivisionDesc.Caption	:= strDescription;

	if	((nReturn <> CHECK_OK) and (not m_fAppExit)) then
	begin
		Beep ();

		m_cACControl	:= DtlCmnEditDealDivision;
		m_cACControl.SetFocus ();

		Abort;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnEditDealClassOnExit (TObject)												*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[取引先分類] OnExit ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnEditDealClassOnExit (Sender: TObject);
var
	nReturn		  : Integer;
	strDescription: String;

begin
	nReturn	:= fnCheckDealClass (Trunc (DtlCmnEditDealClass.Value), strDescription);

	DtlCmnLbelDealClassDesc.Caption	:= strDescription;

	if	((nReturn <> CHECK_OK) and (not m_fAppExit)) then
	begin
		Beep ();

		m_cACControl	:= DtlCmnEditDealClass;
		m_cACControl.SetFocus ();

		Abort;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCEdtExCdK1OnExit (TObject)												*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[勘定科目](借方/貸方共通) OnExit ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCEdtExCdK1OnExit (Sender: TObject);
var
	cEditNumeric	:	TMNumEdit;
	cLabelDesc		:	TMLabel;
	nDivision		:	Integer;
	nReturn			:	Integer;
	strDescription	:	String;
begin
	cEditNumeric	:=	Sender as TMNumEdit;
	nDivision		:=	-1;

	if	(cEditNumeric.Name = cEdtK1DNum.Name) then
	begin
		cLabelDesc	:=	cLblK1DDsc;
		nDivision	:=	0;
	end
	else if	(cEditNumeric.Name = cEdtK1CNum.Name) then
	begin
		cLabelDesc	:=	cLblK1CDsc;
		nDivision	:=	1;
	end
	else
		cLabelDesc	:=	nil;

	if	(nDivision = -1)	then	Exit;

	if	(not m_fExCodeKMCheck [nDivision])	then	Exit;

	fnSetDtlEditExCodeAttribute (Trunc (cEditNumeric.Value), nDivision);

	nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECT, nDivision, Trunc (cEditNumeric.Value), '', strDescription);

	cLabelDesc.Caption	:= strDescription;

	if	((nReturn <> CHECK_OK) and (not m_fAppExit)) then
	begin
		Beep ();

		m_cACControl	:= cEditNumeric;
		m_cACControl.SetFocus ();

		Abort;
	end;

	m_fExCodeKMCheck [nDivision]	:= false;

	// 会計処理区分: 0=免税業者
	if	(m_nTaxAccDivision <> 0) then
	begin
// <HIS0052> MOD start
//		if	MCheckBox1.Checked	then
		if	IsBusyoDenpyo()	then			// 部署伝票として使用する場合
// <HIS0052> MOD end
		begin
			ChangeTaxEdit(Trunc(cEdtK1DNum.Value),Trunc(cEdtK1CNum.Value));
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCEdtExCdK2OnExit (TObject)													*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[細目科目](借方/貸方共通) OnExit ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
// <HIS0052> DEL start
(*procedure	TJNTCRP020000f.fnDtlCEdtExCdK2OnExit (Sender: TObject);
var
	cEditExCode	  : TMNumEdit;
	cEditExCodeSub: TMtxtEdit;
	cLabelDesc	  : TMLabel;
	nDivision	  : Integer;
	nReturn		  : Integer;
	strDescription: String;

begin
	cEditExCode		:= nil;
	cEditExCodeSub	:= Sender as TMtxtEdit;
	nDivision		:= -1;

	if	(cEditExCodeSub.Name = cEdtK2DNum.Name) then
	begin
		cEditExCode	:= cEdtK1DNum;
		cLabelDesc	:= cLblK2DDsc;
		nDivision	:= 0;
	end
	else if	(cEditExCodeSub.Name = cEdtK2CNum.Name) then
	begin
		cEditExCode	:= cEdtK1CNum;
		cLabelDesc	:= cLblK2CDsc;
		nDivision	:= 1;
	end
	else
		cLabelDesc	:= nil;

	if	(nDivision = -1) then
		Exit;

    if	(cEditExCodeSub.InputFlag) then
	begin
		cLabelDesc.Caption	:= '';
		Exit;
	end;


	if	(cEditExCodeSub.text = '') and (cEditExCodeSub.InputFlag) then
		nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS,
        											nDivision, Trunc (cEditExCode.Value), '', strDescription)
	else
		nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS, nDivision,
										Trunc (cEditExCode.Value), fnGetDspData(1,cEditExCodeSub.text,True), strDescription);

	cLabelDesc.Caption	:= strDescription;
    cEditExCodeSub.text :=fnGetDspData(1,cEditExCodeSub.text,false);


	if	((nReturn <> CHECK_OK) and (not m_fAppExit)) then
	begin
		Beep ();

		m_cACControl	:= cEditExCodeSub;
		m_cACControl.SetFocus ();

		Abort;
	end;

end;
*)
// <HIS0052> DEL end
{
var
	cEditExCode	  : TMNumEdit;
	cEditExCodeSub: TMNumEdit;
	cLabelDesc	  : TMLabel;
	nDivision	  : Integer;
	nReturn		  : Integer;
	strDescription: String;

begin
	cEditExCode		:= nil;
	cEditExCodeSub	:= Sender as TMNumEdit;
	nDivision		:= -1;

	if	(cEditExCodeSub.Name = cEdtK2DNum.Name) then
	begin
		cEditExCode	:= cEdtK1DNum;
		cLabelDesc	:= cLblK2DDsc;
		nDivision	:= 0;
	end
	else if	(cEditExCodeSub.Name = cEdtK2CNum.Name) then
	begin
		cEditExCode	:= cEdtK1CNum;
		cLabelDesc	:= cLblK2CDsc;
		nDivision	:= 1;
	end
	else
		cLabelDesc	:= nil;

	if	(nDivision = -1) then
		Exit;

    if	(cEditExCodeSub.InputFlag) then
	begin
		cLabelDesc.Caption	:= '';
		Exit;
	end;

	if	((Trunc (cEditExCodeSub.Value) = 0) and cEditExCodeSub.InputFlag) then
		nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS,
        											nDivision, Trunc (cEditExCode.Value), '', strDescription)
	else
		nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS, nDivision,
										Trunc (cEditExCode.Value), cEditExCodeSub.text, strDescription);

	cLabelDesc.Caption	:= strDescription;

	if	((nReturn <> CHECK_OK) and (not m_fAppExit)) then
	begin
		Beep ();

		m_cACControl	:= cEditExCodeSub;
		m_cACControl.SetFocus ();

		Abort;
	end;

end;
}
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCEdtExCdBUOnExit (TObject)													*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[部門](借方/貸方共通) OnExit ｲﾍﾞﾝﾄ											*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
// <HIS0052> DEL start
(*procedure	TJNTCRP020000f.fncEdtOEx (Sender: TObject);
var
	nReturn		  : Integer;
	strExCode	  : String;
	strDescription: String;

	nDivision	: Integer;
	nIndex		: Integer;
begin
	nIndex		:=	0;	//
	case	TWinControl(Sender).TabOrder	of
		0..1:	nIndex:=0;	//	科目
		2..3:	nIndex:=1;	//	細目科目
		4..6:	nIndex:=2;	//	部門
		7..9:	nIndex:=3;	//	セグメント１
		10..12:	nIndex:=4;	//	第１補助
		13..15:	nIndex:=5;	//	第２補助
		16..18:	nIndex:=6;	//	工事
		19..21:	nIndex:=7;	//	工種

		22..23:	nIndex:=8;	//	科目
		24..25:	nIndex:=9;	//	細目科目
		26..28:	nIndex:=10;	//	部門
		29..31:	nIndex:=11;	//	セグメント１
		32..34:	nIndex:=12;	//	第１補助
		35..37:	nIndex:=13;	//	第２補助
		38..40:	nIndex:=14;	//	工事
		41..43:	nIndex:=15;	//	工種
		else	Exit;
	end;

	nDivision	:= nIndex	div	8;

	if	(Sender is TMNumEdit) then
	begin
		if	(m_cEdtSet[nIndex].Num.InputFlag) then
		begin
			m_cEdtSet[nIndex].Dsc.Caption	:= '';
			Exit;
		end;

//HIS0033		strExCode	:= Format ('%.16d', [Trunc (m_cEdtSet[nIndex].Num.Value)]);
		strExCode	:= Format ('%.16d', [Trunc (m_cEdtSet[nIndex].Num.Value)]);
	end
	else
	begin
		strExCode	:= m_cEdtSet[nIndex].Fre.Text;
	end;

	nReturn	:= fnCheckExCodeHojyoMA (nIndex, strExCode, strDescription);

	m_cEdtSet[nIndex].Dsc.Caption	:= strDescription;

	if	((nReturn <> CHECK_OK) and (not m_fAppExit)) then
	begin
		Beep ();

		if	(m_stCurDtlCodeAttr [nIndex].nAttribute <= 1) then
        begin
            if nIndex <>1 then
    			m_cACControl	:= m_cEdtSet[nIndex].Num
            else
                m_cACControl	:= m_cEdtSet[nIndex].Fre;
        end
	    else
			m_cACControl	:= m_cEdtSet[nIndex].Fre;

		m_cACControl.SetFocus ();
		Abort;
	end;
end;
*)
// <HIS0052> DEL end

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnEditTaxDivisionOnExit (TObject)											*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[消費税区分] OnExit ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnEditTaxDivisionOnExit (Sender: TObject);
var
	nReturn		  : Integer;
	strDesc: String;

begin
	nReturn	:= fnCheckTaxDivision (Trunc (DtlCmnEditTaxDivision.Value), strDesc);

	DtlCmnLbelTaxDivisionDesc.Caption	:= strDesc;

	if	((nReturn <> CHECK_OK) and (not m_fAppExit)) then
	begin
		Beep ();

		m_cACControl	:= DtlCmnEditTaxDivision;
		m_cACControl.SetFocus ();

		Abort;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnEditTaxCodeOnExit (TObject)												*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[消費税ｺｰﾄﾞ] OnExit ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnEditTaxCodeOnExit (Sender: TObject);
var
	nReturn		:	Integer;
	strDesc		:	String;
begin
	nReturn	:= fnCheckTaxCode (m_iTaxKbn, Trunc (DtlCmnEditTaxCode.Value), strDesc);

	DtlCmnLbelTaxCodeDesc.Caption	:= strDesc;

	if	((nReturn <> CHECK_OK) and (not m_fAppExit)) then
	begin
		Beep ();

		m_cACControl	:= DtlCmnEditTaxCode;
		m_cACControl.SetFocus ();

		Abort;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCEdtExCdK1OnKeyDown (TObject; var Word; TShiftState)							*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[勘定科目](借方/貸方共通) OnKeyDown ｲﾍﾞﾝﾄ									*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCEdtExCdK1OnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
var
	cEditNumeric	:	TMNumEdit;
	cLabelDesc		:	TMLabel;
	nDivision		:	Integer;
	nReturn			:	Integer;
	strDesc			:	String;
//	iTaxKbn			:	Integer;			// <HIS0052> DEL
begin
	cEditNumeric	:=	Sender as TMNumEdit;
	nDivision		:=	-1;

	if	(cEditNumeric.Name = cEdtK1DNum.Name) then
	begin
		cLabelDesc	:= cLblK1DDsc;
		nDivision	:= 0;
	end
	else if	(cEditNumeric.Name = cEdtK1CNum.Name) then
	begin
		cLabelDesc	:= cLblK1CDsc;
		nDivision	:= 1;
	end
	else
		cLabelDesc	:= nil;

	if	(nDivision = -1) then
	begin
		fnOnKeyDown (Sender, Key, Shift);
		Exit;
	end;

	if	(not m_fExCodeKMCheck [nDivision]) then
	begin
		fnSetDtlEditExCodeAttribute (Trunc (cEditNumeric.Value), nDivision,true);
//		SetCommonSection(nDivision);		// <HIS0052> DEL▲
		fnOnKeyDown (Sender, Key, Shift);
		Exit;
	end;

	if	(Key = VK_RETURN) then
	begin
		fnSetDtlEditExCodeAttribute (Trunc (cEditNumeric.Value), nDivision);

		nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECT, nDivision, Trunc (cEditNumeric.Value), '', strDesc);

		cLabelDesc.Caption	:= strDesc;

		if	(nReturn <> CHECK_OK) then
		begin
			Beep ();

			m_cACControl	:= cEditNumeric;
			m_cACControl.SetFocus ();

			Abort;
		end;

		m_fExCodeKMCheck [nDivision]	:= false;
	end
	else if	((Key = VK_RIGHT) or (Key = VK_DOWN)) then
	begin
		if	(Sender is TMTxtEdit) then
		begin
			if	(MJSChkCurEnd (Sender as TComponent)) then
			begin
				fnSetDtlEditExCodeAttribute (Trunc (cEditNumeric.Value), nDivision);

				nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECT, nDivision, Trunc (cEditNumeric.Value), '', strDesc);

				cLabelDesc.Caption	:= strDesc;

				if	(nReturn <> CHECK_OK) then
				begin
					Beep ();

					m_cACControl	:= cEditNumeric;
					m_cACControl.SetFocus ();

					Abort;
				end;

				m_fExCodeKMCheck [nDivision]	:= false;
			end;
		end
		else
		begin
			fnSetDtlEditExCodeAttribute (Trunc (cEditNumeric.Value), nDivision);

			nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECT, nDivision, Trunc (cEditNumeric.Value), '', strDesc);

			cLabelDesc.Caption	:= strDesc;

			if	(nReturn <> CHECK_OK) then
			begin
				Beep ();
				m_cACControl	:= cEditNumeric;
				m_cACControl.SetFocus ();
				Abort;
			end;

			m_fExCodeKMCheck[nDivision]	:=	false;
		end;
	end;
	if	(Key = VK_RETURN) or (Key = VK_RIGHT) or (Key = VK_DOWN) or
		(Key = VK_LEFT) or (Key = VK_UP) or (Key = VK_TAB) then
	begin
		// 会計処理区分: 0=免税業者
		if	(m_nTaxAccDivision <> 0) then
		begin
// <HIS0052> MOD start
//			if	MCheckBox1.Checked	then
			if	IsBusyoDenpyo()	then		// 部署伝票として使用する場合
// <HIS0052> MOD end
			begin
				ChangeTaxEdit(Trunc(cEdtK1DNum.Value),Trunc(cEdtK1CNum.Value));
			end;
		end;

		//	共通部門セット
//		SetCommonSection(nDivision);		// <HIS0052> DEL
	end;

	fnOnKeyDown (Sender, Key, Shift);
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnStdCmnGridExistOnMouseDown (TObject; TMouseButton; TShiftState; Integer)		*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要ｸﾞﾘｯﾄﾞ OnMouseDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnStdCmnGridExistOnMouseDown (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	cField: TField;

begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	m_bLog	then	MLabel27.caption:=MLabel27.caption+'-5';		

	if	(StdCmnGridExist.SelectedCount > 1) then
		StdCmnGridExist.DragCursor	:= crMultiDrag
	else
		StdCmnGridExist.DragCursor	:= crDrag;

	if	(StdCmnGridExist.FocusedColumn = 0) then										// ﾌｫｰｶｽ位置: 0=付箋
	begin
		cField	:= StdCmnDataSourceExist.DataSet.FieldByName ('nExCode');
		cField.FocusControl ();

		Abort;
		Exit;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnEditDealClassOnChange (TObject)										*/
//*																											*/
//*	目的	: 摘要登録処理 ｴﾃﾞｨｯﾄ[取引先分類] OnChange ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnEditDealClassOnChange (Sender: TObject);
var
	nClassCode: Integer;

begin
	if	(m_pRec^.m_pChildForm = nil) then
		Exit;

	fnOnChange (Sender);

	nClassCode	:= Trunc (DtlCmnEditDealClass.Value);

	if	(Trunc (DtlCmnEditDealDivision.Value) <> 0) then
		DtlCmnEditDealClass.InputFlag	:= false;

	if	((nClassCode >= 0) and (nClassCode <= 3)) then
		DtlCmnLbelDealClassDesc.Caption	:= MjsHanCopy (DtlCmnEditDealClass.SelectItems.Strings [nClassCode], 4, 14)
	else
		DtlCmnLbelDealClassDesc.Caption	:= '';
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   ECodeNExit
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnDtlCEdtExCdOnEnter (Sender: TObject);
begin
	fnCommonFunctionOnEnter02 (Sender);

	m_fDtlExCodeChange	:= false;
end;

procedure	TJNTCRP020000f.fnDtlCEdtExCdOnChange (Sender: TObject);
begin
	m_fDtlExCodeChange	:= true;
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   ECodeNExit
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnDtlCEdtExCdOnExit (Sender: TObject);
var
	fNewRecord	: Boolean;
	stWorkRec	: ^TreeViewRec;
	cNode		: TTreeNode;
	cNodeWork	: TTreeNode;
	nExCode		: Integer;
	nSumDivision: Integer;
	nCount		: Integer;

begin
	if	(m_pRec^.m_pChildForm = nil)	then	Exit;

	if	(not m_fDtlExCodeChange)		then	Exit;

	nExCode	:= Trunc (DtlCEdtExCd.Value);

	if	(DtlCmnTab.Items [0].Selected) then
	begin
		nSumDivision	:= 0;

		if	(nExCode = 0) then
		begin
			nExCode	:= fnGetMinimumExCode ();

			DtlCEdtExCd.Value	:= nExCode;
		end;
	end
	else
	begin
		if	(nExCode = 0) then
		begin
			Beep ();

			m_cACControl	:= DtlCEdtExCd;
			m_cACControl.SetFocus ();

			Abort;
		end;

		nSumDivision	:= 1;
	end;
// <SYNC> ADD start
    // 使用可能ｺｰﾄﾞのﾁｪｯｸ
    if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
    begin
		// この子会社が使えるｺｰﾄﾞかﾁｪｯｸ
		if not CheckMasterRange(nExCode, m_SyncMaster.m_nSegNCode) then
		begin
											// 「ｸﾞﾙｰﾌﾟ会計での登録可能範囲外のｺｰﾄﾞです。」
    		MjsMessageBoxEx(Self, MSG_GRP_CODERANGE_ERR, '確認', mjInformation, mjOk, mjDefOk);
       	    DtlCEdtExCd.SetFocus();			// 使用不可なのでﾌｫｰｶｽを戻す
											// →Enterｲﾍﾞﾝﾄで変更ﾌﾗｸﾞがFalseになる
            m_fDtlExCodeChange := True;     // 次回もﾁｪｯｸさせるため、変更ﾌﾗｸﾞはTrueにする
   	        Abort;
		end;
    end;
// <SYNC> ADD end

	m_fDtlNewRecord	:= false;

	fNewRecord	:= fnSetDetailScreenInfo (nExCode, nSumDivision);

// <SYNC> ADD start
    // 新規で親会社に既に同一ｺｰﾄﾞが登録されている場合、関連付を行い同期をとる
    if (fNewRecord) and (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
	begin
        // 会社関連付処理
        case fnCorpRelation(nExCode, nSumDivision) of
            0:  begin
                    // 親会社に該当ﾃﾞｰﾀがない場合は何も行わない(通常)
					// →親にinsert
                end;
            1:  begin
                    // 正常に関連付が行えた場合は、画面の再描画を行う
					// Treeを作成
                    fnAddTreeViewUnconnectedItems();
                    // TreeView再表示
                    fnRebuildTreeViewItems();
                    fNewRecord := False;	// 既存ﾃﾞｰﾀ扱い
                end;
            2:  begin
                    // 会社関連付をｷｬﾝｾﾙした場合、ﾌｫｰｶｽ位置を戻す
                    DtlCEdtExCd.SetFocus();	// →Enterｲﾍﾞﾝﾄで変更ﾌﾗｸﾞがFalseになる
                    						// 次回もﾁｪｯｸさせるため、変更ﾌﾗｸﾞはTrueにする
                    m_fDtlExCodeChange := True;
                    Abort;
                end;
            -9: begin
                    // 例外ｴﾗｰ
                    DtlCEdtExCd.SetFocus();
                    m_fDtlExCodeChange := True;
                    Abort;
                end;
        end;
    end;
// <SYNC> ADD end

	if	(fNewRecord) then												// 新規ﾚｺｰﾄﾞ
	begin
		cNode				:= CmnTreeView.Selected;
		m_cNodePrevSelect	:= cNode;
		stWorkRec			:= cNode.Data;

		if	(stWorkRec^.nDivision = 0) then
			cNode	:= cNode.Parent;

		cNodeWork	:= cNode.GetFirstChild ();							// 先頭の子ﾉｰﾄﾞ取得

		while (true) do
		begin
			if  (cNodeWork = nil) then	Break;

			stWorkRec	:= cNodeWork.Data;								// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

			if	((stWorkRec^.nExCode   > nExCode) and
				 (stWorkRec^.nDivision = nSumDivision)) then	Break;

			if	((nSumDivision = 1) and (stWorkRec^.nDivision = 0)) then	Break;

			cNodeWork	:= cNodeWork.GetNextSibling ();					// 次の子ﾉｰﾄﾞ取得
		end;

		m_fDtlNewRecord	:= true;
        CmnToolbarButtonDelete.Enabled := False;  // 新規レコードは削除不可  <HIS0100> ADD
	end
	else
	begin
		cNode				:= CmnTreeView.Selected;
		m_cNodePrevSelect	:= cNode;
		stWorkRec			:= cNode.Data;

		if	((stWorkRec^.nExCode   = nExCode) and
			 (stWorkRec^.nDivision = nSumDivision)) then
			Exit;

		for nCount := 1 to CmnTreeView.Items.Count do
		begin
			stWorkRec   := CmnTreeView.Items [nCount - 1].Data;

			if	((stWorkRec^.nExCode   = nExCode) and
				 (stWorkRec^.nDivision = nSumDivision)) then
			begin
				CmnTreeView.Items [nCount - 1].Selected	:= true;
				Break;
			end;
		end;
        CmnToolbarButtonDelete.Enabled := m_cJNTArea.IsDelete;  // 既存レコードは権限に基づいて使用可 <HIS0100> ADD
	end;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   Syousai_TabChange
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnDtlCmnTabOnChange (Sender: TObject);
var
	stWorkRec	: ^TreeViewRec;
	cNode	    : TTreeNode;
	cNodeWork	: TTreeNode;
	cTabItem    : TMTabItems;
	nSumDivision: Integer;

begin
	cTabItem	:= Sender as TMTabItems;

	if	(not m_fAccessTab) then
		Exit;

	if	(m_fDtlNewRecord) then
	begin
		fnCleanupTreeViewNewItemEx ();
		Exit;
	end;

	stWorkRec	:= CmnTreeView.Selected.Data;

	if	(stWorkRec^.nDivision = 0) then
		nSumDivision	:= 1
	else
		nSumDivision	:= 0;


	if	(cTabItem [nSumDivision].Selected) then
	begin
		cNode				:= CmnTreeView.Selected;
		m_cNodePrevSelect	:= cNode;
		stWorkRec			:= cNode.Data;

		if	(nSumDivision = 0) then
		begin
			if	(stWorkRec^.nDivision = 0) then
				cNode	:= cNode.Parent;
		end
		else
			cNode	:= CmnTreeView.Items [0];

		cNodeWork	:= cNode.GetFirstChild ();							// 先頭の子ﾉｰﾄﾞ取得

		while (true) do
		begin
			if  (cNodeWork = nil) then
				Break;

			stWorkRec	:= cNodeWork.Data;								// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

			if	((stWorkRec^.nExCode   > 0) and
				 (stWorkRec^.nDivision = nSumDivision)) then
				Break;

			if	((nSumDivision = 1) and (stWorkRec^.nDivision = 0)) then
				Break;

			cNodeWork	:= cNodeWork.GetNextSibling ();					// 次の子ﾉｰﾄﾞ取得
		end;

        // Tag制御
        if nSumDivision = 0 then
            fnEnableToolbarButtonTag(True)
        else
            fnEnableToolbarButtonTag(False);



		m_fDtlNewRecord		:= true;

		fnInitializeDetailScreen (true);

		if	(nSumDivision = 0) then										// 摘要/分類区分: 0=固定摘要
		begin
			DtlCLblExCdTitle.Caption	:= '固定摘要コード';
			DtlCmnPanelAddition   .Visible	:= true;
// <SYNC> MOD start
//            DtlCmnPanelAddition2  .Visible 	:= true;					// 仕訳辞書<HIS0052> ADD
			{ 子会社では仕訳情報を非表示にする }
			if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
            begin
	            DtlCmnPanelAddition2.Visible:= false;
			end
            else
            begin
	            DtlCmnPanelAddition2.Visible:= true;
            end;
            DtlCmnPanelAddition4  .Visible	:= true;
// <SYNC> MOD end
            DtlCmnPanelGrid       .Visible  := True;
            Pnl_RensoTitle        .Visible  := True;

//<MLXDEP>
			if (TMSeries.IsMjsLink3) then
			begin
				DtlCmnPanelAddition   .Visible	:= False;
    	        DtlCmnPanelAddition2  .Visible 	:= False;
        	    DtlCmnPanelAddition4  .Visible	:= False;
            	DtlCmnPanelGrid       .Visible  := False;
	            Pnl_RensoTitle        .Visible  := False;
			end;
//<MLXDEP>
		end
		else															// 摘要/分類区分: 1=摘要分類
		begin
			DtlCLblExCdTitle.Caption	:= '摘要分類コード';
			DtlCmnPanelAddition   .Visible	:= false;
            DtlCmnPanelAddition2  .Visible 	:= false;					// 仕訳辞書<HIS0052>
            DtlCmnPanelAddition4  .Visible	:= false;					// <SYNC> ADD
            DtlCmnPanelGrid       .Visible  := false;
            Pnl_RensoTitle        .Visible  := False;
		end;
	end
	else
		fnCleanupTreeViewNewItem (true);

// HIS0051↓
//	if	(m_nReferMode <> REFER) then
	if	(m_nReferMode <> REFER) and (m_cACControl <> DtlCmnTab) then    // 詳細のﾀﾌﾞにﾌｫｰｶｽ時はｺｰﾄﾞに入らない
// HIS0051↑
	begin
		m_cACControl	:= DtlCEdtExCd;
		m_cACControl.SetFocus ();
	end;
end;



//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   SetDspCodeAttr
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
function	TJNTCRP020000f.SetDspCodeAttr (sCode: String; iLength, iAttr: integer): String;
var
	strExchangeCode: String;
	strFormat	   : String;

begin
	strExChangeCode	:= '';

	if	(Trim (sCode) = '') then
	begin
		Result	:= strExchangeCode;
		Exit;
	end;

	strExchangeCode	:= Trim (sCode);

	if	(iAttr <= 1) then
	begin
		case (iAttr) of
			0:	strFormat	:= '%'  + IntToStr (iLength) + 'd';
			1:	strFormat	:= '%.' + IntToStr (iLength) + 'd';
		end;

		strExchangeCode	:= Format (strFormat, [StrToInt64 (Trim (strExchangeCode))]);
	end;

	strExchangeCode := Trim(strExchangeCode);	// <HIS0052> ADD
	Result	:= strExchangeCode;
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   FormClose
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnJNTCRP020000fOnClose (Sender: TObject; var Action: TCloseAction);
var
	cAppPrm	 : TAppParam;
	stItemRec: ^TreeViewRec;
	nCount	 : Integer;
begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	fnExceptCheck(false,false,false)=EXCEPT_RET_OK	then

	//	摘要分類更新
	fnUpdateTekiyouBunrui(Sender);

	// TblHistory 更新処理
{
<HIS0031>
	MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_TEKIMA   , 61, 0, 0);
	MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_SWDICTEKI, 61, 0, 0);
	MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_TEKITREE , 61, 1, 0);
	MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_TEKITREE , 61, 2, 0);

	if (m_fDeleteTekizan) then	//HIS0021
	begin
		MailHisUpdate (m_cDBSelect, m_cDataModule, 201, 0, 0, 0);
		MailHisUpdate (m_cDBSelect, m_cDataModule, 301, 0, 0, 0);
	end;

	if	(m_fDeleteSwDicTeki) then
		MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_SWDICTEKI, 61, 0, 1);

	if	(m_fDeleteTekiTree [0]) then
		MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_TEKITREE , 61, 1, 1);

	if	(m_fDeleteTekiTree [1]) then
		MailHisUpdate (m_cDBSelect, m_cDataModule, TABLE_TEKITREE , 61, 2, 1);

}


// <HIS0065> ADD start ﾏｽﾀ同期一括配信ﾀﾞｲｱﾛｸﾞ呼出
											// ｸﾞﾙｰﾌﾟ会計採用あり
    if m_SyncMaster.m_flgGrpCorp <> GRP_SYNC_NOTUSE then
    begin
// <HIS0073> MOD start
//    	if (m_nReferMode <> REFER) and (m_SyncMaster.m_CEComKbn5 = 0) then
        if ((m_cJNTArea.IsAppend) or        // 追加権限あり
           (m_cJNTArea.IsModify) or         // 修正権限あり
           (m_cJNTArea.IsDelete)) and       // 削除権限あり
           (m_SyncMaster.m_CEComKbn5 = 0) and
           (m_SyncMaster.m_PEComKbn5 = 0) then	// 表示のみでなくて翌期更新済みでもない場合
// <HIS0073> MOD end
        begin
			CallSyncDlg();				   	// 配信ﾀﾞｲｱﾛｸﾞ呼出
        end;
    end;
// <HIS0065> ADD end

// <SYNC> ADD start
    m_SyncMaster.fnSyncTerm();				// ｽﾄｱﾄﾞ終了処理呼出
// <SYNC> ADD end

	m_fUnderConstruction	:= true;

	for nCount := 1 to CmnTreeView.Items.Count do
	begin
		stItemRec	:= CmnTreeView.Items [nCount - 1].Data;

		Dispose (stItemRec);
	end;

	m_fUnderConstruction	:= true;

(*H0002 20030820 khattori syuusei 会社単独廃止対応*)
	if	m_cExcept<>nil	then
	begin
		m_cExcept.ResetTerm;
		m_cExcept.Free;
		m_cExcept		:=	nil;
	end;


    m_cJNTArea.Free;    //<HIS0032>

    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if uvExpOpenSW = TRUE then
        fnJNTExpFree;

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

	Action	:= caFree;

	m_cDataModule.COPDBClose (m_cDBSelect);	// 子会社DBのClose

//<HIS0101> ADD st
	if Assigned(m_TaxRateInfo) then
    begin
		m_TaxRateInfo.Free();
        m_TaxRateInfo := Nil;
    end;
//<HIS0101> ADD ed

// <SYNC> ADD start
    if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
    begin									// 親会社DBのClose
        m_cDataModule.COPDBClose(m_SyncMaster.m_cPDBSelect);
    end;
// <SYNC> ADD end

	m_pRec^.m_iDelete		:= 1;

	cAppPrm.iAction			:= ACTID_FORMCLOSEEND;			// 呼び出し区分設定
	cAppPrm.pRecord			:= Pointer (m_pRec);			// 管理構造体ﾎﾟｲﾝﾀ設定
	cAppPrm.pActionParam	:= nil;				  			// 予備ﾎﾟｲﾝﾀ設定

	TMjsAppRecord (m_pRec^).m_pOwnerEntry (@cAppPrm);
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   FormCloseQuery
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnJNTCRP020000fOnCloseQuery (Sender: TObject; var CanClose: Boolean);
var
	stMessageRec: TMJSMsgRec;
	nReturn		: Integer;

begin
// HIS0045↓
{	if	(m_cPreview.IsPreView ()) then
	begin
		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10040, 2);

		MJSMessageBoxEx (Self,stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

		CanClose	:= false;
	end;
}
	if	(uvHani.mjspre <> nil) then         // ﾌﾟﾚﾋﾞｭｰの状態ﾁｪｯｸ
	begin
        if (uvHani.mjspre.IsPreview = True) then
        begin
    		m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10040, 2);
            Beep;
	    	MJSMessageBoxEx (Self,stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);

		    CanClose	:= false;
            Exit;
        end;
	end;
// HIS0045↑
	nReturn	:= fnOutputConfirmationMessage (CONFIRM_EXIT);

	if	(nReturn = CONFIRM_RETFOCUSED) then
	begin
		CanClose	:= false;
		Exit;
	end
	else if	(nReturn = CONFIRM_EXITWRITE) then
	begin
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
		if	fnExceptCheck(false,false,false)<>EXCEPT_RET_OK	then
		begin
			CanClose	:= false;
			Exit;
		end;

		if	(not fnUpdateDetailsScreenRecord ()) then
		begin
			CanClose	:= false;
			Exit;
		end;
	end;

	m_fAppExit			:= true;
	m_fChangeDetails	:= false;
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   DMAdxDBGridEditing
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnStdCmnTabOnChange (Sender: TObject);
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


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnStdCmnTabOnEnter (TObject)														*/
//*																											*/
//*	目的	: 摘要登録処理 ﾀﾌﾞ OnEnter ｲﾍﾞﾝﾄ														        */
//*																											*/
//*	戻り値	: なし,                                                                         		        */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnStdCmnTabOnEnter (Sender: TObject);
begin
	CmnToolbarButtonDetail.Enabled	:= false;
	CmnToolbarButtonDelete.Enabled	:= false;
//	CmnToolbarButtonTag   .Enabled	:= false;
    fnEnableToolbarButtonTag(False);

	m_cACControl := Screen.ActiveControl;	// <HIS0059> ADD
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnStdCmnTabOnEnter (TObject)														*/
//*																											*/
//*	目的	: 摘要登録処理 ﾀﾌﾞ OnKeyDown ｲﾍﾞﾝﾄ														        */
//*																											*/
//*	戻り値	: なし,                                                                         		        */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnStdCmnTabOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

(* <HIS0037>
	if	(not m_fAccessTab) then
		Exit;

	if	((Key = VK_RETURN) or (Key = VK_DOWN)) then
	begin
		if	(StdCmnTab.Items [0].Selected) then											// 実在Grid
			m_cACControl	:= StdCmnGridExist
		else																			// 合計Grid
			m_cACControl	:= StdCmnGridTotal;

		m_cACControl.SetFocus ();
	end;
*)
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnTabOnEnter (TObject)														*/
//*																											*/
//*	目的	: 摘要登録処理 ﾀﾌﾞ OnKeyDown ｲﾍﾞﾝﾄ														        */
//*																											*/
//*	戻り値	: なし,                                                                         		        */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnTabOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

(*<HIS0037>
	if	(not m_fAccessTab) then
		Exit;

	if	((Key = VK_RETURN) or (Key = VK_DOWN)) then
	begin
		if	(m_nReferMode <> REFER) then
		begin
			m_cACControl	:= DtlCEdtExCd;
			m_cACControl.SetFocus ();
		end;
	end;

*)
end;

(*H0002 20030820 khattori syuusei 会社単独廃止対応*)
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
//**********************************************************************
//*		Proccess	:	財務排他処理
//*		Name		:	K.Hattori
//*		Date		:	2003/08/20
//**********************************************************************
function	TJNTCRP020000f.fnExceptCheck(bErrorMsg,bMsgString,bBeep:Boolean): Integer;
//var
//	stMessageRec	:	TMJSMsgRec;			// <HIS0052> DEL
begin
{
<HIS0031>
	m_cComArea.m_MsgStd.GetMSG(stMessageRec,10,113);

	m_stMsgRec.sMsg			:=	'';
	m_stMsgRec.sTitle		:=	stMessageRec.sTitle;
	m_stMsgRec.icontype		:=	stMessageRec.icontype;
	m_stMsgRec.btntype		:=	stMessageRec.btntype;
	m_stMsgRec.btndef		:=	stMessageRec.btndef;
	m_stMsgRec.LogType		:=	stMessageRec.LogType;

	//	初期処理
	if	(m_cExcept=nil)	then
	begin
		try
			m_cExcept := TJNTMASExceptIF.Init(m_pRec);
		except
			//	成功するまで、排他ＮＧのまま
			if	bBeep		then	Beep ();
			if	bMsgString	then	m_stMsgRec.sMsg	:=	'排他制御処理の初期処理に失敗しました。';
			if	bErrorMsg	then	MjsMessageBox(Self, '排他制御処理の初期処理に失敗しました。', mjError, mjDefOk);
			result:=EXCEPT_RET_NG;
			exit;
		end;
	end;

	//	何度も呼ばれるが、処理は最初だけ
	if	(m_iRet=EXCEPT_RET_NG)	then
	begin
		try
			// 561番の排他
			m_iRet := m_cExcept.SetExcept(ID_CHK_TEKIYO);

			if	(m_iRet = EXCEPT_RET_OK)	and
				(m_cExcept.Status100 = 0)	and
				(m_cExcept.Status400 = 0)	then
			begin
				// 562番の排他
				m_iRet := m_cExcept.SetExcept(ID_CHK_TEKIYO+1);
			end;
		except
			m_iRet	:=	EXCEPT_RET_NG;
		end;

		if	(m_iRet <> EXCEPT_RET_OK)	or
			(m_cExcept.Status100 <> 0)	or
			(m_cExcept.Status400 <> 0)	then
		begin
			m_cExcept.ResetTerm;

			if	bBeep		then	Beep ();
			if	bMsgString	then	m_stMsgRec	:=	stMessageRec;
			if	bErrorMsg	then	MjsMessageBoxEx(Self, stMessageRec.sMsg,
													stMessageRec.sTitle,
													stMessageRec.icontype,
													stMessageRec.btntype,
													stMessageRec.btndef,
													stMessageRec.LogType);

			m_iRet	:=	EXCEPT_RET_NG;
		end
		else	m_iRet		:=	EXCEPT_RET_OK;
	end;
	result:=m_iRet;
}
    m_iRet := EXCEPT_RET_OK;
	result:=m_iRet;


end;

//**********************************************************************
//*		Proccess	:	参照・更新時のｺﾝﾎﾟｰﾈﾝﾄ制御処理
//*		Name		:	H.Endo
//*		Date		:	2000/12/25
//*		Parameter	:	Select		:	REFER(参照)･NORMAL(通常処理)･BASICONLY(基本のみ設定可能)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure	TJNTCRP020000f.fnChangePartsCondition (nReferMode: Integer);
//var
//	nCount	: Integer;						// <HIS0052> DEL
begin
	if	(nReferMode = REFER) then
	begin
		CmnTreeView                 .DragMode	:= dmManual;
		StdCmnGridExistCode         .ReadOnly	:= true;
		StdCmnGridTotalCode         .ReadOnly	:= true;
		StdCmnGridExistAssociation  .ReadOnly	:= true;
		StdCmnGridTotalAssociation  .ReadOnly	:= true;
		StdCmnGridExistName         .ReadOnly 	:= true;
		StdCmnGridTotalName         .ReadOnly 	:= true;
		StdCmnGridExist             .PopupMenu	:= nil;
		StdCmnGridTotal             .PopupMenu	:= nil;

		DtlCmnTab                   .Enabled	:= false;
		DtlCEdtExCd				    .Enabled	:= True;

        DtlCmnPanelAddition1.Enabled := false; // ChkBox・区分・分類

//        DtlCmnPanelAddition2.Enabled := false; // 貸方・借方仕訳情報	// <HIS0052> DEL

        DtlCmnPanelAddition3.Enabled := false; // 摘要名・連想

// <HIS0052> ADD start
		// 借方・貸方仕訳情報の参照ﾓｰﾄﾞ
		PSwkDKmk.Enabled := False;
		PSwkCKmk.Enabled := False;
        PTaxInfo.Enabled := False;
        									// ｸﾞﾘｯﾄﾞを行選択状態にする
        DtlDSwkGrid.Options := DtlDSwkGrid.Options + [egoRowSelect];
        DtlCSwkGrid.Options := DtlCSwkGrid.Options + [egoRowSelect];
// <HIS0052> ADD end

		DtlCmnGrid.Options := DtlCmnGrid.Options + [egoRowSelect];// <HIS0071>
{
		DtlCmnEditAssociation       .Enabled	:= false;
		DtlCmnEditName              .Enabled	:= false;
		DtlCmnEditDealDivision      .Enabled	:= false;
		DtlCmnEditDealClass         .Enabled	:= false;


		MCheckBox1 		 			.Enabled	:= false;
		for	nCount := 0 to 15 do
		begin
            if (nCount <> 1) and (nCount <> 9) then
    			m_cEdtSet[nCount].Num.Enabled	:= false;

			if	m_cEdtSet[nCount].Fre<>nil	then
			m_cEdtSet[nCount].Fre.Enabled	:= false;
		end;

		DtlCmnEditTaxDivision       .Enabled	:= false;
		DtlCmnEditTaxCode           .Enabled	:= false;
		DtlCmnEditTaxRate           .Enabled	:= false;
		DtlCmnEditTypeCode          .Enabled	:= false;
}
		if	(m_nProcDivision = 1) then
		begin
			StdCmnGridExist.PopupMenu	:= StdCmnGridPopupMenu;
//			StdCmnGridTotal.PopupMenu	:= StdCmnGridPopupMenu;
		end
		else
		begin
			StdCmnGridExist.PopupMenu	:= nil;
			StdCmnGridTotal.PopupMenu	:= nil;
		end;


		DtlCmnButtonUpdate          .Enabled	:= false;
		DtlCmnButtonCancel          .Enabled	:= false;
	end
	else
	begin
		CmnTreeView					.DragMode	:= dmAutomatic;
		StdCmnGridExistCode			.ReadOnly	:= false;
		StdCmnGridTotalCode			.ReadOnly	:= false;
		StdCmnGridExistAssociation	.ReadOnly	:= false;
		StdCmnGridTotalAssociation	.ReadOnly	:= false;
		StdCmnGridExistName			.ReadOnly	:= false;
		StdCmnGridTotalName			.ReadOnly	:= false;

		if	(m_nProcDivision = 1) then
		begin
			StdCmnGridExist.PopupMenu	:= StdCmnGridPopupMenu;
//			StdCmnGridTotal.PopupMenu	:= StdCmnGridPopupMenu;
		end
		else
		begin
			StdCmnGridExist.PopupMenu	:= nil;
			StdCmnGridTotal.PopupMenu	:= nil;
		end;

		DtlCmnButtonUpdate.Enabled		:= true;
		DtlCmnButtonCancel.Enabled		:= true;
	end;

	fnChangeGridCondition ();
end;
//**********************************************************************
//*		Proccess	:	ｽﾄｱﾄﾞのSQL文作成
//*		Name		:	H.Endo
//*		Date		:	2001/1/30
//*		Parameter	:	TAN_CD		:	担当者ｺｰﾄﾞ
//*						TAN_NAME	:	担当者名
//*						FLAG		:	担当者選択なし(-1以外:true/-1:false)
//*		Return		:	作成したSQL文
//*		History		:
//**********************************************************************
function	TJNTCRP020000f.fnMakeSQL(FLAG,StratEndFlag: Boolean):String;
var
	sSQL	:	String;
begin
	sSQL := '';
	if (StratEndFlag = true) then
		sSQL	:=	'CALL MP200010(0'	//	ｽﾄｱﾄﾞの開始
	else
		sSQL	:=	'CALL MP200010(1';	//	ｽﾄｱﾄﾞの終了
	if (FLAG) then		//	担当者選択なし
	begin
		sSQL	:=	sSQL + ',:TANCD'
	end;
	sSQL	:=	sSQL + ')';

	Result	:=	sSQL;
end;


//************************************************************************
//*		Component		:	TJNTCRP020000f ( TForm )
//*
//*		Event			:	OnDestroy
//*		Name			:	H.Endo（企業ｼｽﾃﾑ企画設計）
//************************************************************************
procedure	TJNTCRP020000f.fnJNTCRP020000fOnDestroy (Sender: TObject);
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

// <HIS0063> DEL start
(*
	m_cPreview.Term ();
	m_cPreview.Free ();
*)
// <HIS0063> DEL end

    // <SYNC> ADD start
    if (m_SyncMaster <> nil) then
	begin
		m_SyncMaster.Free();				// ﾏｽﾀ同期ｸﾗｽ破棄
	end;
    // <SYNC> ADD end
end;



//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnAddTreeViewUnconnectedItems ()													*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ未接続ｱｲﾃﾑ追加処理														*/
//*																											*/
//*	戻り値	: なし,                         								                                */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnAddTreeViewUnconnectedItems ();
var
	dqMasterData: TMQuery;
	dqMasterTree: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);
	dqMasterTree	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();

        SQL.Add ('SELECT tm.SumKbn, tm.GCode, tm.NCode, tm.TekiChar, tt.MasterKbn                   '); // HIS0029
        SQL.Add ('FROM TekiMA tm LEFT OUTER JOIN TekiTree tt                                  '); // HIS0029
        SQL.Add ('ON tm.MasterKbn = tt.MasterKbn AND tm.NCode = tt.BasedNCode AND tt.TekiKbn = 1    '); // HIS0029
        SQL.Add ('WHERE  tm.MasterKbn = 61 AND tm.SumKbn = 0 AND tm.RDelKbn = 0                     '); // HIS0029
        SQL.Add ('ORDER BY tm.GCode ');                                                                 // HIS0029


		Open ();

		while (not EOF) do
		begin
			if	(FieldByName ('MasterKbn').IsNull) then									// 未接続ｱｲﾃﾑ
			begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
				if	fnExceptCheck(false,false,false)=EXCEPT_RET_NG	then	Break;

				dqMasterTree.Close ();

				dqMasterTree.SQL.Clear ();

                dqMasterTree.SQL.Add   ('INSERT INTO TekiTree (MasterKbn, TekiKbn, SumNCode, BasedNCode, RDelKbn, ');    // HIS0029
                dqMasterTree.SQL.Add   ('UpdTantoNCode) ');    // HIS0076
				dqMasterTree.SQL.Add   ('VALUES (61, 1, 0, :nExCode, 0,');                                                  // HIS0029
                dqMasterTree.SQL.Add   (':nUpdTantoNCode) ');  // HIS0076
                dqMasterTree.ParamByName ('nExCode').AsFloat	:= dqMasterData.FieldByName ('NCode').AsFloat;                  // HIS0032
                dqMasterTree.ParamByName ('nUpdTantoNCode').AsFloat	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0076
				dqMasterTree.ExecSQL ();

				if	(dqMasterTree.Status <> 0) then										// ｴﾗｰ
					Break;
			end;

			NEXT;
		end;

		Close ();
	end;

	dqMasterData.Free ();
	dqMasterTree.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnChangeSelectionScreen ()														*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要/科目連想 切替処理														*/
//*																											*/
//*	戻り値	: Boolean,																						*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnChangeSelectionScreen (): Boolean;
{
<HIS0031>
var
	nReturn: TRetID;
}
var
	iRet	: Integer;						// <SYNC> ADD
begin
	if	(CmnComboBoxInstruction.ItemIndex + 1 = m_nProcDivision) then
	begin
		Result	:= true;
		Exit;
	end;

// <SYNC> ADD start
	// ｸﾞﾙｰﾌﾟ会計[採用/ｺｰﾄﾞ属性,桁数ﾁｪｯｸ]
    if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD ) then
    begin
	    iRet := m_SyncMaster.fnChkP_MasterInfo(MKBN_KOTEKI);
        if iRet < 0 then                    // 入力不可の場合は印刷ﾎﾞﾀﾝも無効にする
        begin
        	CmnToolbarButtonPrint.Enabled := False;
        end;
        case iRet of
            -1: begin						// 「全社にて当該ﾏｽﾀが採用されていません。
											// 全社で当該ﾏｽﾀを採用してください。」
                    MjsMessageBoxEx(Self, JNTSYNC_MSG_NO_USE,
                                'マスタ同期', mjInformation, mjOk, mjDefOk);
                    Result := false;
                    Abort;
                    Exit;
                end;
            -2: begin						// 「ﾏｽﾀのｺｰﾄﾞ属性、桁数が、
											// 全社と子会社で異なっています。
											// 会社基本情報をご確認ください。」
                    MjsMessageBoxEx(Self, JNTSYNC_MSG_DIFF_C,
                                'マスタ同期', mjInformation, mjOk, mjDefOk);
                    Result := false;
                    Abort;
                    Exit;
                end;
            -9: begin   // 例外ｴﾗｰ
                    Result := false;
                    Abort;
                    Exit;
                end;
        end;
    end;
//<SYNC> ADD end

	m_nProcDivision	:= CmnComboBoxInstruction.ItemIndex + 1;

	if	(m_nProcDivision = 1) then									// 処理区分: 1=固定摘要
		CmnTreeView.PopupMenu	:= CmnTreeViewPopupMenu
	else if	(m_nProcDivision = 2) then								// 処理区分: 2=科目連想
		CmnTreeView.PopupMenu	:= CmnTreeViewPopupMenuEx;

	CmnTreeView          .Enabled	:= true;
	CmnSplitter          .Enabled	:= true;
//<HIS0042>
//   	CmnToolbarButtonPrint.Enabled	:= m_cJNTArea.IsPrint;
    CmnToolbarButtonPrint.Enabled	:= m_cJNTArea.IsPrint;
//<HIS0042>
	StdCmnClientPanel    .Enabled	:= true;
	DtlCmnClientPanel    .Enabled	:= true;

	StdCmnTab.Items [1].Selected	:= false;
	StdCmnTab.Items [0].Selected	:= true;

	StdCmnTab.Items [1].Enabled		:= true;

	if	(m_nProcDivision = 2) then									// 処理区分: 2=科目連想
		StdCmnTab.Items [1].Enabled	:= false;

	DtlCmnClientPanel.Visible		:= false;
	StdCmnClientPanel.Visible		:= true;

	CmnToolbarButtonDetail.Caption	:= '詳細(&T)';

	if	(m_nProcDivision = 1) then	fnAddTreeViewUnconnectedItems;	// 処理区分: 1=固定摘要

	fnRebuildTreeViewItems;

	if	(m_nProcDivision = 2) then	fnSetSummaryItemsInfo;			// 処理区分: 2=科目連想

	fnChangeGridCondition;
{
//<HIS0031>
	nReturn	:= MailEntCheck (m_cDBSelect, m_cDataModule, m_cComArea, 61, 1);

	case (nReturn) of
		DISPOSE_SETTLE    :	m_nReferMode	:= REFER;				// 決算確定の為参照のみ
		DISPOSE_MAILNOTUSE:	m_nReferMode	:= NORMAL;				// ﾒｰﾙ未採用の為通常処理
		DISPOSE_USUALLY   :	m_nReferMode	:= NORMAL;				// 通常処理
		DISPOSE_BASIC     :	m_nReferMode	:= BASICONLY;			// 基本のみ設定可能
		DISPOSE_REFER     :	m_nReferMode	:= REFER;				// 参照のみ
	end;
}

//    m_nReferMode	:= NORMAL;				// 通常処理<HIS0031>

(*H0002 20030820 khattori syuusei 会社単独廃止対応*)
(*H0007 20040121 khattori syuusei 排他タイミング変更*)
//	fnExceptCheck;

	fnChangePartsCondition (m_nReferMode);

	Result	:= true;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnChangeGridCondition ()															*/
//*																											*/
//*	目的	: 摘要登録処理 ｸﾞﾘｯﾄﾞ状態変更																	*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnChangeGridCondition ();
begin
	if	(m_nProcDivision = 1) then									// 処理区分: 1=固定摘要
	begin
(*H0003 20030821 khattori syuusei Drag & Drop 対応*)
//		StdCmnGridExist.DragMode	:= dmManual;

		if	(m_nReferMode = REFER) then
		begin
(*H0003 20030821 khattori syuusei Drag & Drop 対応*)
			StdCmnGridExist.DragMode	:= dmManual;
			StdCmnGridExist.Options		:= [egoColumnSizing, egoTabs, egoTabThrough,
											egoConfirmDelete, egoCanNavigation,
											egoCancelOnExit, egoImmediateEditor, egoIndicator, egoMultiSelect];
			StdCmnGridTotal.Options		:= [egoColumnSizing, egoTabs, egoTabThrough,
											egoConfirmDelete, egoCanNavigation,
											egoCancelOnExit, egoImmediateEditor, egoIndicator, egoMultiSelect];
		end
		else
		begin
(*H0003 20030821 khattori syuusei Drag & Drop 対応*)
			StdCmnGridExist.DragMode	:= dmAutomatic;
			StdCmnGridExist.Options		:= [egoColumnSizing, egoEditing, egoTabs, egoTabThrough,
											egoConfirmDelete, egoCanNavigation, egoCanAppend,
											egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator];
			StdCmnGridTotal.Options		:= [egoColumnSizing, egoEditing, egoTabs, egoTabThrough,
											egoConfirmDelete, egoCanNavigation, egoCanAppend,
											egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator];
		end;
	end
	else															// 処理区分: 2=科目連想
	begin
		if	(m_nReferMode = REFER) then
		begin
			StdCmnGridExist.DragMode	:= dmManual;
			StdCmnGridExist.Options		:= [egoColumnSizing, egoTabs, egoTabThrough, egoConfirmDelete,
											egoCanNavigation, egoCancelOnExit, egoImmediateEditor, egoIndicator];
		end
		else
		begin
			StdCmnGridExist.DragMode	:= dmAutomatic;
			StdCmnGridExist.Options		:= [egoColumnSizing, egoTabs, egoTabThrough,
											egoMultiSelect, egoConfirmDelete,
											egoCanNavigation, egoCancelOnExit, egoImmediateEditor, egoIndicator];
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnChangeToolbarButtonsCondition (Integer)										*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂｰﾙﾊﾞｰ･ﾎﾞﾀﾝ状態変更																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 実在/合計区分	(0:実在, 1:合計...)												*/
//*                                                                                 		                */
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnChangeToolbarButtonsCondition (nSumDivision: Integer);
begin
	if	(m_nProcDivision <> 1) then								// 固定摘要以外
	begin
		CmnToolbarButtonDetail.Enabled	:= false;
		CmnToolbarButtonDelete.Enabled	:= false;
        fnEnableToolbarButtonTag(False);
		Exit;
	end;

	if	((nSumDivision = 9) or									// 体系
		 (nSumDivision = DIVISION_NEWRECORD)) then				// 新規作成
	begin
		CmnToolbarButtonDetail.Enabled	:= false;
		CmnToolbarButtonDelete.Enabled	:= false;
        fnEnableToolbarButtonTag(False);
	end
	else
	begin
		if	(m_nReferMode <> BASICONLY) then					// 基本のみ以外
			CmnToolbarButtonDetail.Enabled	:= true
		else
			CmnToolbarButtonDetail.Enabled	:= false;

		CmnToolbarButtonDelete.Enabled	:= m_cJNTArea.IsDelete;
		if	(nSumDivision = 0) then
			fnEnableToolbarButtonTag (true)
		else
            fnEnableToolbarButtonTag(False);

	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckMasterDataRecordValid (Integer; Integer)									*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要ﾏｽﾀ 有効ﾚｺｰﾄﾞ･ﾁｪｯｸ														*/
//*																											*/
//*	戻り値	: Boolean, (true:ﾁｪｯｸOK, false:ﾁｪｯｸNG)								                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 摘要/分類区分													                */
//*			  nExCode		= 摘要(分類)ｺｰﾄﾞ																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckMasterDataRecordValid (nSumDivision: Integer; nExCode: Integer): Boolean;
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);			 // DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();

        SQL.Add   ('SELECT MasterKbn FROM TekiMA ');                     // HIS0029
        SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = :nSumDivision');     // HIS0029
        SQL.Add   ('       and GCode = :nExCode and RDelKbn = 0');          // HIS0029

		ParamByName ('nSumDivision').AsInteger	:= nSumDivision;
		ParamByName ('nExCode'     ).AsInteger	:= nExCode;

		Open ();

		if  (not EOF) then
			Result	:= false
		else
			Result  := true;

		Close ();
	end;

	dqMasterData.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckMasterTreePasteValid (Integer; Integer; TTreeNode)							*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要分類体系ﾏｽﾀ 張付ﾁｪｯｸ														*/
//*																											*/
//*	戻り値	: Boolean, (true:ﾁｪｯｸOK, false:ﾁｪｯｸNG)								                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCodeSrc	= 張付元摘要(分類)ｺｰﾄﾞ															*/
//*			  cNodeDst		= 張付先ﾉｰﾄﾞ																	*/
//*                                                                             		                    */
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckMasterTreePasteValid (nSumDivision: Integer;
															nExCodeSrc: Integer; cNodeDst: TTreeNode): Boolean;
var
	dqMasterData: TMQuery;
	stRecDst	: ^TreeViewRec;

    exSumNCode   : Extended;
    exBasedNCode : Extended;

begin
	stRecDst	:= cNodeDst.Data;

	if	(stRecDst^.nDivision = 0) then
		stRecDst	:= cNodeDst.Parent.Data;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

        exSumNCode      := fnGetNCode(TBL_TEKI,1,stRecDst^.nExCode);

		if	(nSumDivision = 0) then
		begin
			SQL.Clear ();
            SQL.Add   ('SELECT BasedNCode FROM TekiTree ');
            SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = :nDivision AND SumNCode = :nExCodeDst');    // HIS0029

			ParamByName ('nDivision' ).AsInteger	:= m_nProcDivision;
			ParamByName ('nExCodeDst').AsFloat	    := exSumNCode;

			Open ();

			while (not EOF) do
			begin

            exBasedNCode := fnGetNCode(TBL_TEKI,0,nExCodeSrc);
            if	(exBasedNCode = FieldByName ('BasedNCode').AsFloat) then
				begin
					dqMasterData.Free ();

					Result	:= false;
					Exit;
				end;

				NEXT;
			end;
		end
		else
		begin
			SQL.Clear ();
            SQL.Add   ('SELECT MasterKbn FROM TekiMA ');                                                             // HIS0029
            SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = 1 AND GCode = :nExCode AND RDelKbn = 0');  // HIS0029

			ParamByName ('nExCode').AsInteger	:= nExCodeSrc;

			Open ();

			if	(not EOF) then
			begin
				dqMasterData.Free ();

				Result	:= false;
				Exit;
			end;
		end;

		Close ();
	end;

	dqMasterData.Free ();

	Result	:= true;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckTreeViewDropItem (TTreeNode; Integer; Integer)								*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ･ﾄﾞﾛｯﾌﾟｱｲﾃﾑ ﾁｪｯｸ処理 (固定摘要/科目連想 共通)								*/
//*																											*/
//*	戻り値	: Boolean, (true:ﾁｪｯｸOK, false:ﾁｪｯｸNG)															*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cNodeDst		= 移動先摘要(分類)/科目ｱｲﾃﾑ･ﾉｰﾄﾞ												*/
//*			  nExCodeSrc	= ﾄﾞﾗｯｸﾞ元摘要(分類)ｺｰﾄﾞ														*/
//*			  nDivisionSrc	= ﾄﾞﾗｯｸﾞ元摘要/分類区分															*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckTreeViewDropItem (cNodeDst: TTreeNode; nExCodeSrc: Integer; nDivisionSrc: Integer): Boolean;
var
	dqMasterData: TMQuery;
	stRecDst	: ^TreeViewRec;

    exSumNCode   : Extended;
    exBasedNCode : Extended;

begin
	stRecDst	:= cNodeDst.Data;

	if	(stRecDst^.nDivision = 0) then
		stRecDst	:= cNodeDst.Parent.Data;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin

        // HIS0032 NCode取得
        exSumNCode      := fnGetNCode(m_nProcDivision,1,stRecDst^.nExCode);
        exBasedNCode    := fnGetNCode(TBL_TEKI,0,nExCodeSrc);

		Close ();
		SQL.Clear ();

		if	(nDivisionSrc = 0) then
		begin
            SQL.Add ('SELECT MasterKbn FROM TekiTree ');
			SQL.Add ('WHERE  MasterKbn = 61 AND TekiKbn = :nDivision AND ');
            SQL.Add ('       SumNCode = :nSumCode AND BasedNCode = :nBasedCode');

			ParamByName ('nDivision' ).AsInteger	:= m_nProcDivision;

			ParamByName ('nSumCode'  ).AsFloat	:= exSumNCode;
			ParamByName ('nBasedCode').AsFloat	:= exBasedNCode;
		end
		else
		begin

            SQL.Add ('SELECT MasterKbn FROM TekiMA           ');
            SQL.Add ('WHERE  MasterKbn = 61 AND SumKbn = 1      ');
            SQL.Add ('AND GCode = :nExCode                      ');
            SQL.ADd ('AND RDelKbn = 0 ');

			ParamByName ('nExCode').AsInteger	:= nExCodeSrc;
		end;

		Open ();

		if	(not EOF) then
		begin
			dqMasterData.Free ();

			Result	:= false;															// ﾁｪｯｸNG
			Exit;
		end;
	end;

	dqMasterData.Free ();

	Result	:= true;																	// ﾁｪｯｸOK
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckMasterRecordUpdate ()														*/
//*																											*/
//*	目的	: 摘要登録処理																					*/
//*																											*/
//*	戻り値	: Boolean, (true:ﾁｪｯｸOK, false:ﾁｪｯｸNG)															*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckMasterRecordUpdate (): Boolean;
var
	nReturn		: Integer;
	strExCode	: String;
	strDummy	: String;
	index		: Integer;
    iCdIndex	: Integer;  				// <HIS0052> ADD
    iKbn		: Integer;  				// <HIS0052> ADD
    iMasterKbn	: Integer;					// <HIS0052> ADD
//<HIS0082 start>
	iIndex		: Integer;
	iErrIndex	: Integer;
//<HIS0082 end>
//<HIS0094>↓↓Add
	iDCKbn		: Integer;
    strComGCd	: String;
    exComNCd    : Extended;
    strComName  : String;
//<HIS0094>↑↑
begin
//<HIS0082 start>
	Result	:= True;	iErrIndex	:= 0;
//<HIS0082 end>
//	if	(fnCheckDescription (m_stMasterData.nSumDivision,
//										m_stMasterData.nExCode, m_stMasterData.strName) <> CHECK_OK) then
	if	(fnCheckDescription (m_stMasterData.nSumDivision,													//HIS0014
			m_stMasterData.nExCode, m_stMasterData.strAssociation, m_stMasterData.strName) <> CHECK_OK) then
	begin
		m_cACControl	:= DtlCmnEditName;
		Result			:= false;
		Exit;
	end;

	if	(fnCheckDealDivision (m_stMasterData.nDealDivision, strDummy) <> CHECK_OK) then
	begin
		m_cACControl	:= DtlCmnEditDealDivision;
		Result			:= false;
		Exit;
	end;

	if	(fnCheckDealClass (m_stMasterData.nDealClass, strDummy) <> CHECK_OK) then
	begin
		m_cACControl	:= DtlCmnEditDealClass;
		Result			:= false;
		Exit;
	end;

// <HIS0052> ADD start
											// 貸方に何か入力していて、借方が基準で未入力
	if ((cCmbK1CCmb.ItemIndex <> KMKKBN_KIJUN) or (cEdtK1CNum.Value <> 0)) and // 貸方入力あり
    	(cCmbK1DCmb.ItemIndex = KMKKBN_KIJUN) and
    	(cEdtK1DNum.Value = 0) then
    begin
    	m_cACControl := cEdtK1DNum;			// 借方ｺｰﾄﾞ未入力！
        Result := False;
        Exit;
    end;
											// 借方に何か入力していて、貸方が基準で未入力
	if ((cCmbK1DCmb.ItemIndex <> KMKKBN_KIJUN) or (cEdtK1DNum.Value <> 0)) and // 借方入力あり
    	(cCmbK1CCmb.ItemIndex = KMKKBN_KIJUN) and
    	(cEdtK1CNum.Value = 0) then
    begin
    	m_cACControl := cEdtK1CNum;			// 貸方ｺｰﾄﾞ未入力！
        Result := False;
        Exit;
    end;
// <HIS0052> ADD end
	nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECT, 0, m_stMasterData.nExCodeK1Deb, '', strDummy);

	if	(nReturn <> CHECK_OK) then
	begin
		m_cACControl	:= cEdtK1DNum;
		Result			:= false;
		Exit;
	end;

	nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECT, 1, m_stMasterData.nExCodeK1Cre, '', strDummy);

	if	(nReturn <> CHECK_OK) then
	begin
		m_cACControl	:= cEdtK1CNum;
		Result			:= false;
		Exit;
	end;

// <HIS0052> MOD start
(*
	if	((m_stMasterData.nExCodeK2Deb <> '') and (m_stMasterData.nSDicDivision <> 0)) then
	begin
		nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS, 0,
						m_stMasterData.nExCodeK1Deb, m_stMasterData.nExCodeK2Deb, strDummy);

		if	(nReturn <> CHECK_OK) then
		begin
			m_cACControl	:= cEdtK2DNum;
			Result			:= false;
			Exit;
		end;
	end;

	if	((m_stMasterData.nExCodeK2Cre <> '') and (m_stMasterData.nSDicDivision <> 0)) then
	begin
		nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS, 1,
						m_stMasterData.nExCodeK1Cre, m_stMasterData.nExCodeK2Cre, strDummy);

		if	(nReturn <> CHECK_OK) then
		begin
			m_cACControl	:= cEdtK2CNum;
			Result			:= false;
			Exit;
		end;
	end;


	for index:=0 to 15	do
	begin
		if	index in [0,1,8,9]	then	continue;
		if	(not ((m_stCurDtlCodeAttr [index].nAttribute <= 1) and (m_cEdtSet[index].Num.text=''))) then
//		if	(not ((m_stCurDtlCodeAttr [index].nAttribute <= 1) and (m_cEdtSet[index].Num.InputFlag))) then
		begin
			case	index	of
				2:	strExCode	:=	m_stMasterData.strExCodeBUDeb;
				3:	strExCode	:=	m_stMasterData.strExCodeSGDeb;
				4:	strExCode	:=	m_stMasterData.strExCodeH1Deb;
				5:	strExCode	:=	m_stMasterData.strExCodeH2Deb;
				6:	strExCode	:=	m_stMasterData.strExCodeKODeb;
				7:	strExCode	:=	m_stMasterData.strExCodeKSDeb;
				10:	strExCode	:=	m_stMasterData.strExCodeBUCre;
				11:	strExCode	:=	m_stMasterData.strExCodeSGCre;
				12:	strExCode	:=	m_stMasterData.strExCodeH1Cre;
				13:	strExCode	:=	m_stMasterData.strExCodeH2Cre;
				14:	strExCode	:=	m_stMasterData.strExCodeKOCre;
				15:	strExCode	:=	m_stMasterData.strExCodeKSCre;
			end;

			if	(fnCheckExCodeHojyoMA (index, strExCode, strDummy) <> CHECK_OK) then
			begin
				if  (m_stCurDtlCodeAttr [index].nAttribute <= 1)
				then	m_cACControl	:= m_cEdtSet[index].Num
				else	m_cACControl	:= m_cEdtSet[index].Fre;
				Result	:= false;
				Exit;
			end;
		end;
	end;
*)

	for index := 0 to High(m_stCurDtlCodeAttr) do
    begin
		if index > 40 then
        begin
	    	iCdIndex := index - 41;
        end
        else
        begin
        	iCdIndex := index;
        end;

    										// 科目が両方未入力の場合はﾁｪｯｸしない
    	if (cEdtK1DNum.Value = 0) and (cEdtK1CNum.Value = 0) then
        begin
        	break;
        end;
		case index of
			IDX_KAMOKU, IDX_KAMOKU + 41:	// 科目は飛ばす
			begin
				Continue;
			end;
			IDX_KMKHOJ:						// 借方科目別補助
			begin
        		if m_stMasterData.aryDHojyo[iCdIndex].iMasterKbn = 0 then
                begin
                	Continue;
                end;
				if m_stMasterData.aryDHojyo[iCdIndex].iKbn = KBN_KIJUN then
				begin              			// 未入力
                	if m_stMasterData.aryDHojyo[iCdIndex].strGCode = '' then
                    begin
                    	nReturn := CHECK_NG;
                    end
                    else
                    begin
						nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS, 0,
									m_stMasterData.nExCodeK1Deb, m_stMasterData.aryDHojyo[iCdIndex].strGCode, strDummy);
                    end;

					if	(nReturn <> CHECK_OK) then
					begin
						m_cACControl	:= DtlDSwkGrid;
						Result			:= false;
//<HIS0082 start>
//						Exit;
						iErrIndex		:= iCdIndex;
						break;
//<HIS0082 end>
					end;
				end;
			end;
			IDX_KMKHOJ + 41:				// 貸方科目別補助
			begin
            	if m_stMasterData.aryCHojyo[iCdIndex].iMasterKbn = 0 then
                begin
                	Continue;
                end;
				if m_stMasterData.aryCHojyo[iCdIndex].iKbn = KBN_KIJUN then
				begin						// 未入力
                	if m_stMasterData.aryCHojyo[iCdIndex].strGCode = '' then
                    begin
                    	nReturn := CHECK_NG;
                    end
                    else
                    begin
						nReturn	:= fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS, 1,
									m_stMasterData.nExCodeK1Cre, m_stMasterData.aryCHojyo[iCdIndex].strGCode, strDummy);
                    end;

					if	(nReturn <> CHECK_OK) then
					begin
						m_cACControl	:= DtlCSwkGrid;
						Result			:= false;
//<HIS0082 start>
//						Exit;
						iErrIndex		:= iCdIndex;
						break;
//<HIS0082 end>
					end;
				end;
			end;
//<HIS0082 start>
			IDX_PRJSUB1,IDX_PRJSUB2,IDX_PRJSUB3,IDX_PRJSUB4,IDX_PRJSUB5,
			IDX_PRJSUB6,IDX_PRJSUB7,IDX_PRJSUB8,IDX_PRJSUB9,IDX_PRJSUB10,
			IDX_PRJSUB1+41,IDX_PRJSUB2+41,IDX_PRJSUB3+41,IDX_PRJSUB4+41,IDX_PRJSUB5+41,
			IDX_PRJSUB6+41,IDX_PRJSUB7+41,IDX_PRJSUB8+41,IDX_PRJSUB9+41,IDX_PRJSUB10+41:
			begin
				if index < 41 then			// 借方
				begin
					iMasterKbn		:= m_stMasterData.aryDHojyo[iCdIndex].iMasterKbn;
					strExCode		:= m_stMasterData.aryDHojyo[iCdIndex].strGCode;
					iKbn			:= m_stMasterData.aryDHojyo[iCdIndex].iKbn;
					m_cACControl	:= DtlDSwkGrid;
				end
				else						// 貸方
				begin
					iMasterKbn		:= m_stMasterData.aryCHojyo[iCdIndex].iMasterKbn;
					strExCode		:= m_stMasterData.aryCHojyo[iCdIndex].strGCode;
					iKbn			:= m_stMasterData.aryCHojyo[iCdIndex].iKbn;
					m_cACControl	:= DtlCSwkGrid;
				end;
                if iMasterKbn = 0 then	Continue;

                if iKbn = KBN_KIJUN then
                begin
					if m_stCurDtlCodeAttr[index].fKousyu then
					begin
	                	if strExCode = '' then  // 未入力
    	                begin
							Result		:= false;
							iErrIndex	:= iCdIndex;
							break;
						end;
					end;
					if (strExCode <> '') then
					begin
						if (fnCheckExCodeHojyoMA(index,strExCode,strDummy) <> CHECK_OK) then	// ﾁｪｯｸ
						begin
							Result		:= false;
							iErrIndex	:= iCdIndex;
							break;
						end;
					end;
                end;
			end
//<HIS0082 end>
			else
			begin
											// 外部ｺｰﾄﾞ
				if index < 41 then			// 借方
				begin
                	iMasterKbn := m_stMasterData.aryDHojyo[iCdIndex].iMasterKbn;
					strExCode := m_stMasterData.aryDHojyo[iCdIndex].strGCode;
                    iKbn := m_stMasterData.aryDHojyo[iCdIndex].iKbn;
                    iDCKbn := DC_KARIKATA;		//<HIS0094>Add 科目の貸借判別(借方)
				end
				else						// 貸方
				begin
                	iMasterKbn := m_stMasterData.aryCHojyo[iCdIndex].iMasterKbn;
					strExCode := m_stMasterData.aryCHojyo[iCdIndex].strGCode;
                    iKbn := m_stMasterData.aryCHojyo[iCdIndex].iKbn;
                    iDCKbn := DC_KASIKATA;		//<HIS0094>Add 科目の貸借判別(貸方)
				end;
                if iMasterKbn = 0 then
                begin
                	Continue;
                end;
                if iKbn = KBN_KIJUN then
                begin
                	if strExCode = '' then  // 未入力
                    begin
						if index < 41 then
						begin	  			// 借方
							m_cACControl	:= DtlDSwkGrid;
						end
						else
						begin	  			// 貸方
							m_cACControl	:= DtlCSwkGrid;
						end;
						Result	:= false;
//<HIS0082 start>
//						Exit;
						iErrIndex		:= iCdIndex;
						break;
//<HIS0082 end>
					end;

//<HIS0094>↓↓共通部門or共通ｾｸﾞﾒﾝﾄの場合は、その内部ｺｰﾄﾞを取得してﾁｪｯｸ
                    exComNCd := 0;		// 初期化

                    // 部門またはｾｸﾞﾒﾝﾄの場合
                    if (iMasterKbn in [MKBN_BUMON, MKBN_SEG1..MKBN_SEG10]) then
                    begin
                        // 科目の採用が共通部門または共通ｾｸﾞﾒﾝﾄの場合
                        if (m_stCurDtlCodeAttr[index].nUseKbn = 2) then
                        begin
                            // 共通部門または共通ｾｸﾞﾒﾝﾄの内部ｺｰﾄﾞを取得
                            GetCommonSection(iDCKbn, iCdIndex, strComGCd, exComNCd, strComName);
                        end;
                    end;

											// ﾁｪｯｸ
//					if (fnCheckExCodeHojyoMA (index, strExCode, strDummy) <> CHECK_OK) then
                    if (fnCheckExCodeHojyoMA (index, strExCode, strDummy, exComNCd) <> CHECK_OK) then
//<HIS0094>↑↑
					begin
						if index < 41 then
						begin	  			// 借方
							m_cACControl	:= DtlDSwkGrid;
						end
						else
						begin	  			// 貸方
							m_cACControl	:= DtlCSwkGrid;
						end;
						Result	:= false;
//<HIS0082 start>
//						Exit;
						iErrIndex		:= iCdIndex;
						break;
//<HIS0082 end>
					end;
                end;
			end;
		end;
    end;
//<HIS0082 start>
	if not Result then
	begin
		TdxDBGrid(m_cACControl).DataSource.DataSet.First;
		iIndex	:= m_stMasterData.aryDHojyo[iErrIndex].iMasterKbn;
		while not TdxDBGrid(m_cACControl).DataSource.DataSet.Eof do
		begin
			if TdxDBGrid(m_cACControl).DataSource.DataSet.FieldByName('iMasterKbn').AsInteger = iIndex then break;
			TdxDBGrid(m_cACControl).DataSource.DataSet.Next;
		end;
		TdxDBGrid(m_cACControl).FocusedColumn	:= SWKCLM_CODE;
		exit;
	end;
//<HIS0082 end>
// <HIS0052> MOD end

	if	(fnCheckTaxDivision (m_stMasterData.nTaxDivision, strDummy) <> CHECK_OK) then
	begin
		m_cACControl	:= DtlCmnEditTaxDivision;
		Result			:= false;
		Exit;
	end;

	if	(m_iTaxKbn = 0) then											// 消費税区分: 0=なし
//	if	not	MCheckBox1.Checked	then
//	if	(m_stMasterData.nTaxDivision = 0) then							// 消費税区分: 0=なし
	begin
		Result	:= true;
		Exit;
	end;


//	if	MCheckBox1.Checked	then
//	begin
		if	(fnCheckTaxCode (m_iTaxKbn, m_stMasterData.nTaxCode, strDummy) <> CHECK_OK) then
		begin
			m_cACControl	:= DtlCmnEditTaxCode;
			Result			:= false;
			Exit;
		end;
//	end
//	else
//	begin
//		if	(fnCheckTaxCode (m_stMasterData.nTaxDivision, m_stMasterData.nTaxCode, strDummy) <> CHECK_OK) then
//		begin
//			m_cACControl	:= DtlCmnEditTaxCode;
//			Result			:= false;
//			Exit;
//		end;
//	end;

	if	(fnCheckTaxRate (m_stMasterData.nTaxRate, strDummy) <> CHECK_OK) then
	begin
		m_cACControl	:= DtlCmnEditTaxRate;
		Result			:= false;
		Exit;
	end;

	if	(fnCheckTypeCode (m_stMasterData.nTypeCode, strDummy) <> CHECK_OK) then
	begin
		m_cACControl	:= DtlCmnEditTypeCode;
		Result			:= false;
		Exit;
	end;
//<HIS0111> ADD St
	if	(fnCheckTaxValue (m_iTaxKbn, m_stMasterData.nTaxRate,
        m_stMasterData.nTaxCode) <> CHECK_OK) then
	begin
		m_cACControl	:= DtlCmnEditTaxRate;
		Result			:= false;
		Exit;
	end;
//<HIS0111> ADD Ed
	if	(not DtlCmnMemData.IsEmpty ()) then
	begin
		DtlCmnMemData.First ();

		while (not DtlCmnMemData.Eof) do
		begin
			if	(not fnCheckSubjectCodeAss (DtlCmnMemData.FieldValues ['nExCode'], strDummy)) then
			begin
				DtlCmnMemData.Edit ();
				DtlCmnMemData.FieldByName ('strSubjectDesc').AsString	:= strDummy;
				DtlCmnMemData.FieldByName ('nDivisionData' ).Clear ();
				DtlCmnMemData.FieldByName ('nCtrlDivision' ).Clear ();
				DtlCmnMemData.Post ();

				m_cACControl	:= DtlCmnGrid;

				Result	:= false;
				Exit;
			end;

			DtlCmnMemData.Next ();
		end;
	end;

	Result	:= true;																	// ﾁｪｯｸOK
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckBusyoDenpyouJisyo ()														*/
//*																											*/
//*	目的	:	部署伝票辞書チェック																		*/
//*																											*/
//*	戻り値	: Boolean, (true:ﾁｪｯｸOK, false:ﾁｪｯｸNG)															*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckBusyoDenpyouJisyo (): Boolean;
// <HIS0052> MOD start
(*
var
	nCount	:	Integer;

	//	エラーの時、Ｔｒｕｅを返す
	//	数値型
	function	fnCheckNumCode(cCmb:TMComboBox;cNum:TMNumEdit): Boolean;
	var
		bRtn  : Boolean;
	begin
		bRtn  :=	false;
		if	(cCmb.Enabled)and(cCmb.ItemIndex=0)and(cNum.value=0)and(cNum.InputFlag)	then
		begin
			m_cACControl	:=	cNum;
			bRtn			:=	true;
		end;
		result:=bRtn;
	end;
	//	文字型
	function	fnCheckTxtCode(cCmb:TMComboBox;cFre:TMTxtEdit): Boolean;
	var
		bRtn  : Boolean;
	begin
		bRtn  :=	false;
		if	(cCmb.Enabled)and(cCmb.ItemIndex=0)and(cFre.Text='')	then
		begin
			m_cACControl	:=	cFre;
			bRtn			:=	true;
		end;
		result:=bRtn;
	end;
	//	共通
	function	fnCheckEdtCode(iEdtId:Integer): Boolean;
	var
		bRtn  : Boolean;
	begin
		bRtn  :=	false;

		with	m_cEdtSet[iEdtId]	do
		begin
			if	(m_stCurDtlCodeAttr [iEdtId].nAttribute <= 1)
			then	bRtn:=fnCheckNumCode(Cmb,Num)		//	数値型
			else	bRtn:=fnCheckTxtCode(Cmb,Fre);		//	文字型

	(*H0004 20031127 khattori syuusei 可変は２つまでー＞可変は４つまで*)
(*// <HIS0052> ADD
			//	可変は４つまで
			if	(not bRtn)	and	(Cmb.ItemIndex=1)	then
			begin
				inc(m_iCntKahen);
				if	m_iCntKahen>4	then
	//			if	m_iCntKahen>2	then
				begin
					m_cACControl	:=	Cmb;
					bRtn			:=	true;
				end;
			end;
		end;

		result:=bRtn;
	end;
begin
	Result		:=	false;
	m_iCntKahen	:=	0;

	//	借方

	//	科目
	if	(cCmbK1DCmb.Enabled)and(cCmbK1DCmb.ItemIndex=0)and(cEdtK1DNum.value=0)	then
	begin
		m_cACControl	:= cEdtK1DNum;
		Exit;
	end;
//	for nCount := 1 to 7	do	if	fnCheckEdtCode(nCount)	then	Exit;
	for nCount := 2 to 7	do	if	fnCheckEdtCode(nCount)	then	Exit;

	//	貸方

	//	科目
	if	(cCmbK1CCmb.Enabled)and(cCmbK1CCmb.ItemIndex=0)and(cEdtK1CNum.value=0)	then
	begin
		m_cACControl	:= cEdtK1CNum;
		Exit;
	end;
//	for nCount := 9 to 15	do	if	fnCheckEdtCode(nCount)	then	Exit;
	for nCount := 10 to 15	do	if	fnCheckEdtCode(nCount)	then	Exit;

	Result	:= true;																	// ﾁｪｯｸOK
*)
var
	iRecNo	: Integer;
begin
	Result		:=	false;
	m_iCntKahen	:=	0;						// 可変の数

	// 貸借科目のどちらも入力されていない場合はﾁｪｯｸなし(基準でも置換でも)
    if (cEdtK1DNum.Value = 0) and (cEdtK1CNum.Value = 0) then
    begin
    	Result := True;
        Exit;
    end;

	//	借方
    										// 基準選択時で科目入力あり
	if	(cCmbK1DCmb.Enabled) and (cCmbK1DCmb.ItemIndex = KBN_KIJUN) and
    	(cEdtK1DNum.value <> 0) then
	begin
		{ 借方補助の可変の数ﾁｪｯｸ }
	    if DtlDSwkMem.RecordCount > 0 then
    	begin
	    	DtlDSwkMem.DisableControls;
	    	iRecNo := DtlDSwkMem.RecNo;
		    DtlDSwkMem.First;
			while not DtlDSwkMem.Eof do
		    begin
            								// 可変?
				if DtlDSwkMem.FieldByName('strDivisionDesc').AsString = TEXT_KAHEN then
        		begin
	        		Inc(m_iCntKahen);
	    	    end;
    	    	DtlDSwkMem.Next;
	    	end;
	    	DtlDSwkMem.RecNo := iRecNo;
		    DtlDSwkMem.EnableControls;
	    end;

	    if m_iCntKahen > 4 then				// 可変が5つ以上ある
    	begin
    		m_cACControl := DtlDSwkGrid;	// 借方ｸﾞﾘｯﾄﾞに戻す
	    	Exit;
    	end;
	end;
    m_iCntKahen := 0;

	//	貸方
    										// 基準選択時で科目入力あり
	if	(cCmbK1CCmb.Enabled) and (cCmbK1CCmb.ItemIndex = KBN_KIJUN) and
    	(cEdtK1CNum.value <> 0) then
	begin
		{ 貸方補助の可変の数ﾁｪｯｸ }
	    if DtlCSwkMem.RecordCount > 0 then
    	begin
	    	DtlCSwkMem.DisableControls;
	    	iRecNo := DtlCSwkMem.RecNo;
		    DtlCSwkMem.First;
			while not DtlCSwkMem.Eof do
		    begin
				if DtlCSwkMem.FieldByName('strDivisionDesc').AsString = TEXT_KAHEN then
        		begin
        			Inc(m_iCntKahen);
		        end;
    		    DtlCSwkMem.Next;
	    	end;
	    	DtlCSwkMem.RecNo := iRecNo;
		    DtlCSwkMem.EnableControls;
	    end;

	    if m_iCntKahen > 4 then				// 可変が5つ以上ある
    	begin
    		m_cACControl := DtlDSwkGrid;	// 貸方ｸﾞﾘｯﾄﾞに戻す
	    	Exit;
    	end;
    end;
	Result	:= true;																	// ﾁｪｯｸOK

// <HIS0052> MOD end

end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckDescription (Integer; String)												*/
//*																											*/
//*	目的	: 摘要登録処理  摘要文字列ﾁｪｯｸ処理																*/
//*																											*/
//*	戻り値	: Integer, (ｴﾗｰ･ｺｰﾄﾞ)																			*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision		= 摘要/分類区分																*/
//*			  nExCode			= 摘要(分類)ｺｰﾄﾞ															*/
//*			  strDescription	= 摘要文字列																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckDescription (nSumDivision: Integer; nExCode: Integer; strAssociation: String; strDescription: String): Integer;
var
	dqMasterData: TMQuery;
begin
	if	(Trim (strDescription) = '') then
	begin
		Result	:= CHECK_OK;
		Exit;
	end;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	m_nExCode	:= 0;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();

        SQL.Add	  ('SELECT GCode,Renso,TekiChar FROM TekiMA ');			// HIS0029
        SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = :nSumDivision ');    // HIS0029
        SQL.Add   ('    AND GCode <> :nExCode');                            // HIS0029
        SQL.Add   ('    AND RDelKbn = 0 ');                                 // HIS0029

		ParamByName ('nSumDivision').AsInteger	:= nSumDivision;						// 摘要/分類区分
		ParamByName ('nExCode'     ).AsInteger	:= nExCode;								// 摘要(分類)ｺｰﾄﾞ

		Open ();

		while (not EOF) do
		begin
			if	(FieldByName ('TekiChar').AsString = strDescription) and
                (FieldByName ('Renso').AsString  = strAssociation) then				// HIS0029
			begin
				m_nExCode	:= FieldByName('GCode').AsInteger;		//HIS0014

				dqMasterData.Close ();
				dqMasterData.Free  ();


				Result	:= CHECK_NG;
				Exit;
			end;

			NEXT;
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= CHECK_OK;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckDealDivision (Integer; var String)											*/
//*																											*/
//*	目的	: 摘要登録処理 取引先区分 ﾁｪｯｸ & 記述取得処理													*/
//*																											*/
//*	戻り値	: Integer, (ｴﾗｰ･ｺｰﾄﾞ)																			*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDealDivision		= 取引先区分																*/
//*			  strDescription	= 取引先区分記述															*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckDealDivision (nDealDivision: Integer; var strDescription: String): Integer;
var
	iIndex	: Integer;						// <HIS0052> ADD
begin
	iIndex := GetMasterIndex(MKBN_TORIHIKI);// <HIS0052> ADD
	strDescription	:= '';

	case (nDealDivision) of
		 0:	strDescription	:= 'なし';
// <HIS0052> MOD start
//		22:	strDescription	:= m_stAdoptInfo [3].strDescription;
		22:	strDescription	:= m_stAdoptInfo [iIndex].strDescription;
// <HIS0052> MOD end
		23:	strDescription	:= '得意先';
		24:	strDescription	:= '仕入先';
	end;

	if	(strDescription = '') then
	begin
		Result	:= CHECK_NG;
		Exit;
	end;

	Result	:= CHECK_OK;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckDealClass (Integer; var String)											*/
//*																											*/
//*	目的	: 摘要登録処理 取引先分類 ﾁｪｯｸ & 記述取得処理													*/
//*																											*/
//*	戻り値	: Integer, (ｴﾗｰ･ｺｰﾄﾞ)																			*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDealClass		= 取引先分類																*/
//*			  strDescription	= 取引先分類記述															*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckDealClass (nDealClass: Integer; var strDescription: String): Integer;
begin
	if	((not DtlCmnEditDealClass.Enabled) or (not DtlCmnEditDealClass.Visible)) then
	begin
		Result	:= CHECK_OK;
		Exit;
	end;

	strDescription	:= '';

	case (nDealClass) of
		0:	strDescription	:= 'その他一般';
		1:	strDescription	:= '連結子(親)会社';
		2:	strDescription	:= '非連結子会社';
		3:	strDescription	:= '関連会社';
	end;

	if	(strDescription = '') then
	begin
		Result	:= CHECK_NG;
		Exit;
	end;

	Result	:= CHECK_OK;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckExCodeKmkMA (Integer; Integer; Integer; Integer; var String)				*/
//*																											*/
//*	目的	: 摘要登録処理 科目ﾁｪｯｸ & 簡略名称取得処理														*/
//*																											*/
//*	戻り値	: Integer, (ｴﾗｰｺｰﾄﾞ)																			*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nMasterDivision	= ﾏｽﾀ区分 (MASTER_SUBJECT:勘定科目, MASTER_SUBJECTPLUS:細目科目)			*/
//*			  nDCDivision		= 借方/貸方区分 (0:借方, 1:貸方)											*/
//*			  nExCode			= 科目ｺｰﾄﾞ																	*/
//*			  nExCodeSub		= 細目ｺｰﾄﾞ																	*/
//*			  strDescription	= 科目簡略名称																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckExCodeKmkMA (nMasterDivision: Integer; nDCDivision: Integer;
									nExCode: Integer; nExCodeSub: String; var strDescription: String): Integer;
var
	dqMasterData	:	TMQuery;
//	cEditnumeric	:	TMNumEdit;		   	// <HIS0052> DEL
	nDCWork			:	Integer;
	nOwnAnaCode		:	Integer;
	nOthAnaCode		:	Integer;
	nInputDivision	:	Integer;
	nOwnNCode		:	Integer;			// <HIS0113>
	nOthNCode		:	Integer;			// <HIS0113>
	bChkFlg			:	Bool;				// <HIS0113>
begin
	strDescription	:= '';
	nOwnNCode := 0;		// <HIS0113>
	nOthNCode := 0;		// <HIS0113>
	nOwnAnaCode := 0;	// <HIS0113>
	nOthAnaCode := 0;	// <HIS0113>

	if	((nMasterDivision = MASTER_SUBJECT) and (nExCode = 0)) then
	begin
		Result	:= CHECK_OK;
		Exit;
	end;

	if	((nMasterDivision = MASTER_SUBJECTPLUS) and (nExCodeSub = '')) then
	begin
		Result	:= CHECK_OK;
		Exit;
	end;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
//<HIS0113> ST
    	SQL.Add   ('SELECT SimpleName, DCKbn, AnalyzeCode, InputKbn, NCode ');
//    	SQL.Add   ('SELECT SimpleName, DCKbn, AnalyzeCode, InputKbn ');
//<HIS0113> ED
		SQL.Add   ('FROM   KmkMA ');
		SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND ');
// <HIS0052> MOD start
//		SQL.Add   ('       RDelKbn = 0 AND GCode = :nExCode AND SubCode = :nExCodeSub');
		SQL.Add   ('       RDelKbn = 0 AND GCode = :nExCode ');
											// 科目別補助の場合
        if nMasterDivision = MASTER_SUBJECTPLUS then
        begin                               // 科目別補助ｺｰﾄﾞ追加
	        SQL.Add	  ('	   AND SubCode = :nExCodeSub');
        end;
// <HIS0052> MOD end

		ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;
		ParamByName ('nExCode'        ).AsInteger	:= nExCode;

// <HIS0052> MOD start
//		ParamByName ('nExCodeSub'     ).AsString	:= nExCodeSub;
											// 科目別補助の場合
        if nMasterDivision = MASTER_SUBJECTPLUS then
        begin
			ParamByName ('nExCodeSub'     ).AsString	:= nExCodeSub;
        end;
// <HIS0052> MOD end

		Open ();

		if	(not EOF) then
		begin
			nDCWork			:= GetFld ('DCKbn'      ).AsInteger;
			nOwnAnaCode		:= GetFld ('AnalyzeCode').AsInteger;
			nInputDivision	:= GetFld ('InputKbn'   ).AsInteger;
			strDescription	:= GetFld ('SimpleName' ).AsString;
			nOwnNCode		:= GetFld ('NCode').AsInteger;			// <HIS0113>
		end
		else
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= CHECK_NORECORD;													// ｴﾗｰ: 該当ﾚｺｰﾄﾞなし
			Exit;
		end;

		Close ();

		if	(nMasterDivision = MASTER_SUBJECT) then										// 勘定科目
		begin
//			if	(nDCDivision = 0)	then	cEditNumeric	:=	cEdtK1CNum	else	cEditNumeric	:=	cEdtK1DNum;

(*20030618 khattori tuika*)
//<HIS0113> ST
			bChkFlg := False;
            SQL.Clear ();
            SQL.Add   ('SELECT NCode, AnalyzeCode FROM KmkMA ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND ');
            SQL.Add   ('       RDelKbn = 0 AND GCode = :nExCode ');

            ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;
            ParamByName ('nExCode'        ).AsInteger	:= Trunc (cEdtK1DNum.Value);

            Open ();

            if	(not EOF) then
            begin
                nOthNcode		:= GetFld ('NCode').AsInteger;
                nOthAnaCode		:= GetFld ('AnalyzeCode').AsInteger;
				bChkFlg := True;
            end;
//<HIS0113> ED
			if	(nDCDivision = 1) then

//<HIS0113> ST
			if	(Trunc (cEdtK1DNum.Value) <> 0) then

//			if	(Trunc (cEdtK1DNum.Value) <> 0				)	then
//			if	(Trunc (cEdtK1DNum.Value) <> m_iSpe010301	)	then
//			if	(Trunc (cEdtK1DNum.Value) <> m_iSpe010302	)	then
//			if	(Trunc (cEdtK1CNum.Value) <> m_iSpe010301	)	then
//			if	(Trunc (cEdtK1CNum.Value) <> m_iSpe010302	)	then
//<HIS0113> ED
//			if	(Trunc (cEditNumeric.Value) <> 0) then
			begin
//<HIS0113> ST
                if	((nOthAnaCode = 0) and (Trunc (nOthNcode) = m_iSpe010301) or (Trunc (nOthNcode) = m_iSpe010302)) then
                    nOthAnaCode := 1;

                if	((nOwnAnaCode = 0) and (Trunc (nOwnNCode) = m_iSpe010301) or (Trunc (nOwnNCode) = m_iSpe010302)) then
                    nOwnAnaCode := 1;

//				SQL.Clear ();
//				SQL.Add   ('SELECT AnalyzeCode FROM KmkMA ');
//				SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND ');
//				SQL.Add   ('       RDelKbn = 0 AND GCode = :nExCode AND SubCode = :nExCodeSub');
//
//				ParamByName ('nMasterDivision').AsInteger	:= nMasterDivision;
//				ParamByName ('nExCode'        ).AsInteger	:= Trunc (cEdtK1DNum.Value);
//				ParamByName ('nExCodeSub'     ).AsInteger	:= 0;
//
//				Open ();
//
//				if	(not EOF) then
				if	(bChkFlg) then
//<HIS0113> ED
				begin
					//nOthAnaCode		:= GetFld ('AnalyzeCode').AsInteger;	// <HIS0113>
					if	((nOwnAnaCode = 0) and (nOthAnaCode <> 0)) then
					begin
						dqMasterData.Close ();
						dqMasterData.Free  ();

						Result	:= CHECK_KM_NOENTRY_AC;									// ｴﾗｰ: 入力不可科目(会計のみ)
						Exit;
					end;

					if	((nOwnAnaCode <> 0) and (nOthAnaCode = 0)) then
					begin
						dqMasterData.Close ();
						dqMasterData.Free  ();

						Result	:= CHECK_KM_NOENTRY_ACF;								// ｴﾗｰ: 入力不可科目(非会計のみ)
						Exit;
					end;
				end;
			end;

			if	(nInputDivision = 1) then												// 仕訳入力区分: 1=正残側のみ
			begin
				if	(nDCDivision <> nDCWork) then
				begin
					dqMasterData.Free ();

					Result	:= CHECK_KM_NOENTRY_POS;									// ｴﾗｰ: 入力不可科目(正残側のみ)
    				Exit;
				end;
			end
			else if	(nInputDivision = 2) then											// 仕訳入力区分: 2=負残側のみ
			begin
				if	(nDCDivision = nDCWork) then
				begin
					dqMasterData.Free ();

					Result	:= CHECK_KM_NOENTRY_NEG;									// ｴﾗｰ: 入力不可科目(負残側のみ)
    				Exit;
				end;
			end
			else if	(nInputDivision = 9) then											// 仕訳入力区分: 9=入力不可
			begin
				dqMasterData.Free ();

				Result	:= CHECK_KM_NOENTRY;											// ｴﾗｰ: 入力不可科目
				Exit;
			end;
		end;
	end;

	dqMasterData.Free ();

	Result	:= CHECK_OK;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckExCodeHojyoMA (Integer; String; var String)								*/
//*																											*/
//*	目的	: 摘要登録処理 補助ﾁｪｯｸ & 簡略名称取得処理														*/
//*																											*/
//*	戻り値	: Integer, (ｴﾗｰｺｰﾄﾞ)																			*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nPosition			= ｺｰﾄﾞ入力位置																*/
//*			  strExCode			= 補助ｺｰﾄﾞ																	*/
//*			  strDescription	= 補助簡略名称																*/
//*																											*/
//***********************************************************************************************************/
//<HIS0089> DEL function	TJNTCRP020000f.fnCheckExCodeHojyoMA (nPosition: Integer; strExCode: String; var strDescription: String): Integer;
function	TJNTCRP020000f.fnCheckExCodeHojyoMA (nPosition: Integer; strExCode: String; var strDescription: String; iNCode : Extended=0): Integer;  //<HIS0089> ADD
var
	dqMasterData : TMQuery;
	nWorkMaster	 : Integer;
	nHODivision01: Integer;
	nHODivision02: Integer;

begin
//<HIS0078 satrt>
	nHODivision01	:= 0;	nHODivision02	:= 0;
//<HIS0078 end>
	strDescription	:= '';

	if	(Trim (strExCode) = '') then
	begin
		Result	:= CHECK_OK;
		Exit;
	end;

	if	((m_stCurDtlCodeAttr [nPosition].nMasterDivision = MASTER_CUSTOMERPLUS01) or
		 (m_stCurDtlCodeAttr [nPosition].nMasterDivision = MASTER_CUSTOMERPLUS02)) then
		nWorkMaster	:= MASTER_CUSTOMER
	else
		nWorkMaster	:= m_stCurDtlCodeAttr [nPosition].nMasterDivision;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();
		SQL.Clear ();
{//HIS0033
   		SQL.Add   ('SELECT SimpleName, HojyoKbn1, HojyoKbn2 FROM HojyoMA ');
    	SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND RDelKbn = 0 AND GCode = :strExCode');
   		ParamByName ('nMasterDivision').AsInteger	:= nWorkMaster;
    	ParamByName ('strExCode'      ).AsString	:= strExCode;
}
        //HIS0033 取引先はMTOKUIより取得
        if m_stCurDtlCodeAttr [nPosition].nMasterDivision = MASTER_CUSTOMER then
        begin
    		SQL.Add   ('SELECT NMK as SimpleName, HojyoKbn1, HojyoKbn2 FROM MTOKUI ');
	    	SQL.Add   ('Where SumKbn = 0 AND RDelKbn = 0 AND GCode = :strExCode');
	    	ParamByName ('strExCode'      ).AsString	:= strExCode;
        end
// <HIS0052> ADD start
		// 社員はHAPSCより取得
		else if m_stCurDtlCodeAttr [nPosition].nMasterDivision = MKBN_SYAIN then
        begin
	        SQL.Add	  ('select MOS.NCode, MOS.SimpleName ' +
                    'from HAPSC HAP left outer join MOS_OFFICE_STAFF MOS ' +
                    'on HAP.NCode = MOS.NCode ' +
                    'where MOS.RDelKbn = 0 ' +
                    'and HAP.GCode = :strExCode ');
//<HIS0106> DEL                    'and (HAP.TEndDate >= :parStartDate and HAP.TStartDate <= :parEndDate) ');
	    	ParamByName ('strExCode'      ).AsString	:= strExCode;
            								// 適用期間
//<HIS0106> DEL			ParamByName ('parStartDate'	  ).AsDateTime := m_dateKStDate;
//<HIS0106> DEL			ParamByName ('parEndDate'	  ).AsDateTime := m_dateKEdDate;
        end
// <HIS0052> ADD end
        else
        begin
       		SQL.Add   ('SELECT SimpleName, HojyoKbn1, HojyoKbn2 FROM HojyoMA ');
        	SQL.Add   ('WHERE  MasterKbn = :nMasterDivision AND SumKbn = 0 AND RDelKbn = 0 AND GCode = :strExCode');
   		    ParamByName ('nMasterDivision').AsInteger	:= nWorkMaster;
        	ParamByName ('strExCode'      ).AsString	:= strExCode;

//<HIS0089> ADD St
            if iNCode <> 0 then
            begin
                SQL.Add   (' AND NCode = :iNCode ');
                ParamByName ('iNCode').AsFloat	:= iNCode;
            end;
            SQL.Add   (' ORDER BY TStartDate DESC ');
//<HIS0089> ADD Ed
        end;

		Open ();

		if	(not EOF) then
		begin
// <HIS0052> MOD start
//			nHODivision01	:= FieldByName ('HojyoKbn1' ).AsInteger;
//			nHODivision02	:= FieldByName ('HojyoKbn2' ).AsInteger;
											// 社員以外
        	if m_stCurDtlCodeAttr [nPosition].nMasterDivision <> MKBN_SYAIN then
            begin
      			nHODivision01	:= FieldByName ('HojyoKbn1' ).AsInteger;
				nHODivision02	:= FieldByName ('HojyoKbn2' ).AsInteger;
            end;
// <HIS0052> MOD end

			strDescription	:= FieldByName ('SimpleName').AsString;
		end
		else
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= CHECK_NORECORD;													// ｴﾗｰ: 該当ﾚｺｰﾄﾞなし
			Exit;
		end;

		Close ();

//<HIS0033>		if	((nWorkMaster = MASTER_SECTION) or (nWorkMaster = MASTER_SEGMENT01)) then	// 部門 or ｾｸﾞﾒﾝﾄ
		if	((nWorkMaster = MASTER_SECTION) or (nWorkMaster = MASTER_SEGMENT)) then	// 部門 or ｾｸﾞﾒﾝﾄ
		begin
//<HIS0096>↓↓科目がP/Lの場合
//			if	(m_stCurDtlCodeAttr [nPosition].nClassCode = 0) then					// P/L部門
			if	(m_stCurDtlCodeAttr [nPosition].nClassCode = 1) then
//<HIS0096>↑↑
			begin
				if	(nHODivision02 = 2) then											// 部門分類: 2=B/S部門
				begin
					dqMasterData.Free  ();

					Result	:= CHECK_BU_NOENTRY_PL;										// ｴﾗｰ: 入力不可部門(P/Lのみ)
					Exit;
				end;
			end
//<HIS0096>↓↓科目がB/Sの場合
//			else if	(m_stCurDtlCodeAttr [nPosition].nClassCode = 2) then				// B/S部門
			else if	(m_stCurDtlCodeAttr [nPosition].nClassCode = 0) then
//<HIS0096>↑↑
			begin
				if	(nHODivision02 = 0) then											// 部門分類: 0=P/L部門
				begin
					dqMasterData.Free  ();

					Result	:= CHECK_BU_NOENTRY_BS;										// ｴﾗｰ: 入力不可部門(B/Sのみ)
					Exit;
				end;
			end;
		end;

		if	(m_stCurDtlCodeAttr [nPosition].nMasterDivision = MASTER_CUSTOMERPLUS01) then
		begin
			if	(nHODivision01 = 0) then												// 得意先区分: 0=採用なし
			begin
				dqMasterData.Free  ();

				Result	:= CHECK_HO_NOENTRY_SA;											// ｴﾗｰ: 入力不可(得意先未採用)
				Exit;
			end;
		end;

		if	(m_stCurDtlCodeAttr [nPosition].nMasterDivision = MASTER_CUSTOMERPLUS02) then
		begin
			if	(nHODivision02 = 0) then												// 仕入先区分: 0=採用なし
			begin
				dqMasterData.Free  ();

				Result	:= CHECK_HO_NOENTRY_ST;											// ｴﾗｰ: 入力不可(仕入先未採用)
				Exit;
			end;
		end;
	end;

	dqMasterData.Free ();

	Result	:= CHECK_OK;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckTaxDivision (Integer; var String)											*/
//*																											*/
//*	目的	: 摘要登録処理 消費税区分 ﾁｪｯｸ & 記述取得処理													*/
//*																											*/
//*	戻り値	: Integer, (ｴﾗｰ･ｺｰﾄﾞ)														                    */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nTaxDivision		= 消費税区分 (1:売上, 2:仕入)												*/
//*			  strDescription	= 消費税記述																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckTaxDivision (nTaxDivision: Integer; var strDescription: String): Integer;
begin
	strDescription	:= '';

	if	((nTaxDivision >= 0) and (nTaxDivision <= 2)) then
		strDescription	:= MjsHanCopy (DtlCmnEditTaxDivision.SelectItems.Strings [nTaxDivision], 4, 4);

	if	(strDescription = '') then
	begin
		Result	:= CHECK_NG;
		Exit;
	end;

	Result	:= CHECK_OK;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckTaxCode (Integer; Integer; var String)										*/
//*																											*/
//*	目的	: 摘要登録処理 消費税ｺｰﾄﾞ ﾁｪｯｸ & 記述取得処理													*/
//*																											*/
//*	戻り値	: String, (消費税記述)														                    */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nTaxDivision		= 消費税区分 (1:売上, 2:仕入)												*/
//*			  nTaxCode			= 消費税ｺｰﾄﾞ																*/
//*			  strDescription	= 消費税記述																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckTaxCode (nTaxDivision: Integer; nTaxCode: Integer; var strDescription: String): Integer;

	procedure GetDesc(srTax:array of TaxItems);
	var
		nCount	:	Integer;
		iStart	:	Integer;
	begin
// <HIS0052> MOD start
//		if	MCheckBox1.Checked	then	iStart:=1	else	iStart:=0;
		if	IsBusyoDenpyo()	then	iStart:=1	else	iStart:=0;
// <HIS0052> MOD end
		for nCount	:=	iStart	to	length(srTax)-1	do
		begin
			if	strtoint(Copy (srTax [nCount].sWord,1,2))=nTaxCode	then
			begin
//<HIS0101> MOD st
//				strDescription	:=	Copy (srTax [nCount].sWord, 5, 24);
//<#TAX10> Mod ↓
//				strDescription	:=	Copy (srTax [nCount].sWord, 5, 28);
				strDescription	:=	MjsHanCopy (srTax [nCount].sWord, 5, 34);
//<#TAX10> Mod ↑
//<HIS0101> MOD ed
				m_cTaxItems		:=	srTax [nCount];
				break;
			end;
		end;
	end;
begin
	strDescription		:=	'';
	m_cTaxItems.sWord	:=	'';
	m_cTaxItems.iRate	:=	0;
	m_cTaxItems.iType	:=	0;

	case	nTaxDivision	of
		1:	GetDesc(m_TaxSalesItems);	// 消費税区分: 1=売上   <HIS0110>
		2:	GetDesc(_TaxStockItems);	// 消費税区分: 2=仕入
		3:	GetDesc(_TaxCommonItems);	// 消費税区分: 3=共通
	end;

	if	(strDescription = '') then
	begin
		Result	:= CHECK_NG;
		Exit;
	end;

	Result	:= CHECK_OK;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckTaxRate (Integer; var String)												*/
//*																											*/
//*	目的	: 摘要登録処理 消費税率ｺｰﾄﾞ ﾁｪｯｸ & 記述取得処理													*/
//*																											*/
//*	戻り値	: String, (消費税記述)														                    */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nTaxRate			= 消費税率ｺｰﾄﾞ																*/
//*			  strDescription	= 消費税率記述																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckTaxRate (nTaxRate: Integer; var strDescription: String): Integer;
begin
	strDescription	:= '';

//<HIS0101> MOD st
//	if	((nTaxRate >= 0) and (nTaxRate <= 2)) then
//		strDescription	:= Copy (DtlCmnEditTaxRate.SelectItems.Strings [nTaxRate], 4, 14)
	if	(m_TaxRateInfo.IsExistRateCD(nTaxRate) = True) then
		strDescription	:= m_TaxRateInfo.GetTaxNameByRateCD(nTaxRate)
//<HIS0101> MOD ed
	else
	begin
		Result	:= CHECK_NG;
		Exit;
	end;

	Result	:= CHECK_OK;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckTypeCode (Integer; var String)												*/
//*																											*/
//*	目的	: 摘要登録処理 業種ｺｰﾄﾞ ﾁｪｯｸ & 記述取得処理														*/
//*																											*/
//*	戻り値	: String, (業種記述)														                    */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nTypeCode			= 業種ｺｰﾄﾞ																	*/
//*			  strDescription	= 業種記述																	*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckTypeCode (nTypeCode: Integer; var strDescription: String): Integer;
begin
	strDescription	:= '';

//<HIS0105> DEL	if	((nTypeCode >= 0) and (nTypeCode <= 5)) then
	if	((nTypeCode >= m_cTypeCode.MinCode) and (nTypeCode <= m_cTypeCode.MaxCode)) then  //<HIS0105> ADD
		strDescription	:= MjsHanCopy (DtlCmnEditTypeCode.SelectItems.Strings [nTypeCode], 4, 14)
	else
	begin
		Result	:= CHECK_NG;
		Exit;
	end;

	Result	:= CHECK_OK;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCleanupTreeViewNewItem (Boolean)												*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ新規作成ｱｲﾃﾑ削除処理														*/
//*																											*/
//*	戻り値	: なし,                 		        						                                */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: fSelected	= 区分 (true:以前選択されていたﾉｰﾄﾞに戻す)											*/
//*                                                                                             		    */
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnCleanupTreeViewNewItem (fSelected: Boolean);
var
	stWorkRec: ^TreeViewRec;
	cNode	 : TTreeNode;
	nCount   : Integer;

begin
	m_fUnderConstruction	:= true;

	for nCount := 1 to CmnTreeView.Items.Count do
	begin
		cNode		:= CmnTreeView.Items [nCount - 1];
		stWorkRec	:= cNode.Data;

		if	(stWorkRec^.nDivision = DIVISION_NEWRECORD) then
		begin
			cNode.Delete;
			Break;
		end;
	end;

	m_fUnderConstruction	:= false;

	if	(fSelected and (m_cNodePrevSelect <> nil)) then
		m_cNodePrevSelect.Selected	:= true;

	m_fDtlNewRecord	:= false;
end;


//***********************************************************************************************************/
//*                                                                                             		    */
//*	関数	: TJNTCRP020000f.fnCleanupTreeViewNewItemEx ()														*/
//*																											*/
//*	目的	: 補助登録処理 ﾂﾘｰﾋﾞｭｰ新規作成ｱｲﾃﾑ削除処理 (ｴｷｽﾄﾗ･ｳﾞｧｰｼﾞｮﾝ)										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*                                                                                             		    */
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnCleanupTreeViewNewItemEx ();
var
	stWorkRec: ^TreeViewRec;
	cNode	 : TTreeNode;
	nCount   : Integer;

begin
	m_fUnderConstruction	:= true;

    for nCount := 1 to CmnTreeView.Items.Count do
    begin
		cNode		:= CmnTreeView.Items [nCount - 1];
		stWorkRec	:= cNode.Data;

		if	(stWorkRec^.nDivision = DIVISION_NEWRECORD) then
		begin
			cNode.Delete;
			Break;
		end;
    end;

	CmnTreeView.Selected	:= nil;

	m_fUnderConstruction	:= false;

	if	(m_cNodePrevSelect <> nil) then
		m_cNodePrevSelect.Selected	:= true;

	m_fDtlNewRecord	:= false;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCreatTreeViewItems01 (TTreeNode)												*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ作成処理																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cSrcNode  = ｱｲﾃﾑ作成ﾉｰﾄﾞ(親)                                  		                        */
//*                                                                                 		                */
//***********************************************************************************************************/
procedure   TJNTCRP020000f.fnCreateTreeViewItems01 (cSrcNode: TTreeNode);
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();

        SQL.Add   ('SELECT SumKbn, GCode, TekiChar FROM TekiMA ');                         // HIS0029
        SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = 1 AND RDelKbn = 0 ORDER BY GCode');    // HIS0029

		Open ();

		while (not EOF) do
		begin
			fnCreateTreeViewItem01 (dqMasterData, cSrcNode);
			NEXT;
		end;

		Close ();
    end;

	dqMasterData.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCreatTreeViewItems02 (TTreeNode)												*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ作成処理																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cSrcNode  = ｱｲﾃﾑ作成ﾉｰﾄﾞ(親)                                  		                        */
//*                                                                                 		                */
//***********************************************************************************************************/
procedure   TJNTCRP020000f.fnCreateTreeViewItems02 (cSrcNode: TTreeNode);
var
	dqMasterData: TMQuery;
	stWorkRec   : ^TreeViewRec;
    exSumNCode  : Extended;

begin
	stWorkRec		:= cSrcNode.Data;
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();

        SQL.Add   ('SELECT tt.BasedNCode, tm.SumKbn, tm.TekiChar, tm.GCode FROM TekiTree tt, TekiMA tm  '); // HIS0029
        SQL.Add   ('WHERE  tt.MasterKbn = 61 AND tt.SumNCode = :nExCode AND tt.TekiKbn = :nSumDivision AND    '); // HIS0029
        SQL.Add   ('       tm.Masterkbn = tt.MasterKbn AND tm.SumKbn = 0 AND                                  '); // HIS0029
        SQL.Add   ('        tm.NCode = tt.BasedNCode AND tm.RDelKbn = 0 ORDER BY tm.GCode                     '); // HIS0029

        exSumNCode   := fnGetNCode(m_nProcDivision,1,stWorkRec^.nExCode);
		ParamByName ('nSumDivision').AsInteger	:= m_nProcDivision;
		ParamByName ('nExCode'     ).AsFloat	:= exSumNCode;
		Open ();

		while (not EOF) do
		begin
			fnCreateTreeViewItem02 (dqMasterData, cSrcNode);
			NEXT;
		end;

		Close ();
	end;

	dqMasterData.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCreatTreeViewItem01 (TMQuery; TTreeNode)										*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ作成処理																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: dqMasterData	= 摘要体系ﾃﾞｰﾀ用ｸｴﾘｰ															*/
//*			  cSrcNode		= ｱｲﾃﾑ作成ﾉｰﾄﾞ(親)																*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnCreateTreeViewItem01 (dqMasterData: TMQuery; cSrcNode: TTreeNode);
var
	stChildRec : ^TreeViewRec;
	cNode      : TTreeNode;
	strItemName: String;
	strFormat  : String;					// <HIS0058> ADD
begin
	New (stChildRec);

	with (dqMasterData) do
	begin
// <HIS0058> MOD start
//		strItemName	:= Format ('%6d', [FieldByName ('GCode').AsInteger]);
											// 最大桁数に合わせてﾌｫｰﾏｯﾄ
		strFormat := '%' + IntToStr(m_iTekiDigit) + 'd';
		strItemName	:= Format (strFormat, [FieldByName ('GCode').AsInteger]);
// <HIS0058> MOD end

		strItemName	:= strItemName + ' ' + FieldByName ('TekiChar').AsString;

		stChildRec^.nDivision	:= FieldByName ('SumKbn').AsInteger;
		stChildRec^.nExCode		:= FieldbyName ('GCode' ).AsInteger;
		stChildRec^.strName		:= strItemName;

		cNode	:= CmnTreeView.Items.AddChildObject (cSrcNode, stChildRec^.strName, stChildRec);

		cNode.ImageIndex    := 0;
		cNode.SelectedIndex := 2;

		fnCreateTreeViewItems02 (cNode);
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCreatTreeViewItem02 (TMQuery; TTreeNode)										*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ作成処理																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: dqMasterData	= 摘要体系ﾃﾞｰﾀ用ｸｴﾘｰ															*/
//*			  cSrcNode		= ｱｲﾃﾑ作成ﾉｰﾄﾞ(親)																*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnCreateTreeViewItem02 (dqMasterData: TMQuery; cSrcNode: TTreeNode);
var
	stChildRec : ^TreeViewRec;
	cNode	   : TTreeNode;
	strItemName: String;
	strFormat  : String;					// <HIS0058> ADD
begin
	New (stChildRec);

	with (dqMasterData) do
	begin
// <HIS0058> MOD start
//        strItemName	:= Format ('%6d', [FieldByName ('GCode').AsInteger]);  // HIS0029
											// 桁数に合わせてﾌｫｰﾏｯﾄ
		strFormat := '%' + IntToStr(m_iTekiDigit) + 'd';
        strItemName	:= Format (strFormat, [FieldByName ('GCode').AsInteger]);
// <HIS0058> MOD end

		strItemName	:= strItemName + ' ' + FieldByName ('TekiChar').AsString;

        stChildRec^.nExCode		:= FieldByName ('GCode').AsInteger;    // HIS0029
		stChildRec^.nDivision	:= FieldByName ('SumKbn'   ).AsInteger;
		stChildRec^.strName		:= strItemName;

		cNode	:= CmnTreeView.Items.AddChildObject (cSrcNode, stChildRec^.strName, stChildRec);

		if	(stChildRec^.nDivision = 0) then
        begin
			cNode.ImageIndex    := 1;
			cNode.SelectedIndex := 3;
		end
		else
		begin
			cNode.ImageIndex    := 0;
			cNode.SelectedIndex := 2;

			fnCreateTreeViewItems02 (cNode);
		end;
	end;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDeleteMasterRecord (Integer; Integer)											*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要ﾏｽﾀ削除						                                   		    */
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 摘要/分類区分 (0:摘要, 1:分類)												*/
//*           nExCode		= 摘要(分類)ｺｰﾄﾞ																*/
//*                                                     		                                            */
//***********************************************************************************************************/
(*H0003 20030821 khattori syuusei Drag & Drop 対応*)
function	TJNTCRP020000f.fnDeleteMasterRecord (nSumDivision: Integer; nExCode: Integer): Boolean;
//procedure	TJNTCRP020000f.fnDeleteMasterRecord (nSumDivision: Integer; nExCode: Integer);
var
	fReturn: Boolean;
	exNCode: Extended;												// <HIS0052> ADD
begin
(*H0003 20030821 khattori syuusei Drag & Drop 対応*)
	result:=false;
	m_cDataModule.BeginTran (m_cDBSelect);							// ﾄﾗﾝｻﾞｸｼｮﾝ開始

    exNCode := fnGetNCode(TBL_TEKI,0,nExCode);						// 内部ｺｰﾄﾞ取得<HIS0052> ADD

	fReturn	:= fnDeleteMasterTreeRecord (nSumDivision, nExCode);	// 固定摘要分類体系ﾏｽﾀ更新

	if	(not fReturn) then											// ｴﾗｰ
	begin
		fnOutputDBErrorMessage ();

		m_cDataModule.Rollback (m_cDBSelect);						// ﾛｰﾙﾊﾞｯｸ(破棄)
		Exit;
	end;

	// ここから親会社にも更新する可能性がある(TekiTreeは親子間の同期なし)
	ExecParentDBTran(GRP_PARENTDB_BEGINTRAN);						// 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝ開始 <SYNC> ADD

	fReturn	:= fnDeleteMasterDataRecord (nSumDivision, nExCode);	// 固定摘要ﾏｽﾀ更新

	if	(not fReturn) then											// ｴﾗｰ
	begin
		fnOutputDBErrorMessage ();

		m_cDataModule.Rollback (m_cDBSelect);               		// ﾛｰﾙﾊﾞｯｸ(破棄)
		ExecParentDBTran(GRP_PARENTDB_ROLLBACK);					// 親会社DBもﾛｰﾙﾊﾞｯｸ <SYNC> ADD
		Exit;
	end;

	if	(nSumDivision = 0) then
	begin
// <HIS0052> MOD start 内部ｺｰﾄﾞを渡す
//		fReturn	:= fnDeleteMasterDataAddition (nExCode);			// その他ﾏｽﾀ削除
		fReturn	:= fnDeleteMasterDataAddition (exNCode);			// その他ﾏｽﾀ削除(仕訳辞書・付箋)
// <HIS0052> MOD end

		if	(not fReturn) then
		begin
			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);					// ﾛｰﾙﾊﾞｯｸ(破棄)
			ExecParentDBTran(GRP_PARENTDB_ROLLBACK);				// 親会社DBもﾛｰﾙﾊﾞｯｸ <SYNC> ADD
			Exit;
		end;
	end;

	m_cDataModule.Commit (m_cDBSelect);								// ｺﾐｯﾄ(反映)
	ExecParentDBTran(GRP_PARENTDB_COMMIT);							// 親会社DBもｺﾐｯﾄ <SYNC> ADD

	fnDeleteTreeViewItems (nSumDivision, nExCode);

(*H0003 20030821 khattori syuusei Drag & Drop 対応*)
	result:=true;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDeleteMasterTreeRecord (Integer; Integer)										*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要分類体系ﾏｽﾀ削除															*/
//*																											*/
//*	戻り値	: Boolean, (true:正常終了, false:異常終了)														*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 摘要/分類区分 (0:摘要, 1:分類)												*/
//*           nExCode		= 摘要(分類)ｺｰﾄﾞ																*/
//*
//*          ※TekiTreeに残るｺﾞﾐﾃﾞｰﾀはﾄﾘｶﾞにて対応？																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnDeleteMasterTreeRecord (nSumDivision: Integer; nExCode: Integer): Boolean;
var
	dqMasterTree      : TMQuery;
	dqMasterTreeUpdate: TMQuery;
	fUpdateRecord     : Boolean;

    exSumNCode        : Extended;
//    exBasedNCode      : Extended;			// <HIS0052> DEL

begin
	dqMasterTree		:= TMQuery.Create (Self);
	dqMasterTreeUpdate	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree      );					// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTreeUpdate);					// DBとMQueryの接続

    // HIS0032
//<HIS0085> DEL    exSumNCode   := fnGetNCode(TBL_TEKI,1,nExCode);
    exSumNCode   := fnGetNCode(TBL_TEKI,nSumDivision,nExCode);  //<HIS0085> ADD

	if	(nSumDivision = 1) then															// 摘要/分類区分: 1=分類
	begin
		with (dqMasterTree) do
		begin
			Close ();

			SQL.Clear ();

            SQL.Add   ('SELECT BasedNCode FROM TekiTree ');                                                     // HIS0029
            SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = 1 AND SumNCode = :nExCode ORDER BY BasedNCode');    // HIS0029

            ParamByName ('nExCode').AsFloat	:= exSumNCode;

			if	(not Open ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);

				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

				dqMasterTree      .Close ();
				dqMasterTreeUpdate.Close ();
				dqMasterTree      .Free  ();
				dqMasterTreeUpdate.Free  ();

				Result	:= false;
				Exit;
			end;

			while (not EOF) do
			begin
                //HIS0032
				with (dqMasterTreeUpdate) do
				begin
					Close ();

					SQL.Clear ();
                    SQL.Add   ('SELECT MasterKbn FROM TekiTree ');   // HIS0029
					SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = 1 AND ');
                    SQL.Add   ('       SumNCode <> :nSumCode AND BasedNCode = :nBasedCode');  // HIS0029

    				ParamByName ('nSumCode'  ).AsFloat	:= exSumNCode;
                    ParamByName ('nBasedCode').AsFloat	:= dqMasterTree.FieldByName ('BasedNCode').AsFloat;


					if	(not Open ()) then
					begin
						m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTreeUpdate);

						m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

						dqMasterTree      .Close ();
						dqMasterTreeUpdate.Close ();
						dqMasterTree      .Free  ();
						dqMasterTreeUpdate.Free  ();

						Result	:= false;
						Exit;
					end;

					if	(not EOF) then
						fUpdateRecord	:= false
					else
						fUpdateRecord	:= true;

					Close ();
				end;

				if	(fUpdateRecord) then
				begin
					with (dqMasterTreeUpdate) do
					begin
						Close ();

						SQL.Clear ();
                        SQL.Add   ('UPDATE TekiTree SET SumNCode = 0 '); // HIS0029
                        SQL.Add   (',UpdTantoNCode = :nUpdTantoNCode '); // HIS0076
						SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = 1 AND ');
                        SQL.Add   ('       SumNCode = :nSumCode AND BasedNCode = :nBasedCode'); // HIS0029

						ParamByName ('nSumCode'  ).AsFloat	:= exSumNCode;
                        ParamByName ('nBasedCode').AsFloat	:= dqMasterTree.FieldByName ('BasedNCode').AsFloat;
                        ParamByName ('nUpdTantoNCode').AsFloat	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0076

						if	(not ExecSQL ()) then
						begin
							m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTreeUpdate);

							m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

							dqMasterTree      .Close ();
							dqMasterTreeUpdate.Close ();
							dqMasterTree      .Free  ();
							dqMasterTreeUpdate.Free  ();

							Result	:= false;
							Exit;
						end;
					end;
				end
				else
				begin
					with (dqMasterTreeUpdate) do
					begin
						Close ();

						SQL.Clear ();
                        SQL.Add   ('DELETE FROM TekiTree '); // HIS0029
						SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = 1 AND ');
                        SQL.Add   ('       SumNCode = :nSumCode AND BasedNCode = :nBasedCode'); // HIS0029

						ParamByName ('nSumCode'  ).AsFloat	:= exSumNCode;
                        ParamByName ('nBasedCode').AsFloat	:= dqMasterTree.FieldByName ('BasedNCode').AsFloat;

						if	(not ExecSQL ()) then
						begin
							m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTreeUpdate);

							m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);

							dqMasterTree      .Close ();
							dqMasterTreeUpdate.Close ();
							dqMasterTree      .Free  ();
							dqMasterTreeUpdate.Free  ();

							Result	:= false;
							Exit;
						end;

						m_fDeleteTekiTree [0]	:= true;
					end;
				end;

				NEXT;
			end;

			Close ();
		end;

		dqMasterTree      .Close ();
		dqMasterTreeUpdate.Close ();
		dqMasterTree      .Free  ();
		dqMasterTreeUpdate.Free  ();

		Result	:= true;
		Exit;
	end;

	with (dqMasterTree) do
	begin
		Close ();

		SQL.Clear ();
        SQL.Add   ('DELETE FROM TekiTree WHERE MasterKbn = 61 AND TekiKbn = 1 AND BasedNCode = :nExCode');   // HIS0029

		ParamByName ('nExCode').AsFloat	:= exSumNCode;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			dqMasterTree      .Close ();
			dqMasterTreeUpdate.Close ();
			dqMasterTree      .Free  ();
			dqMasterTreeUpdate.Free  ();

			Result	:= false;
			Exit;
		end;

		m_fDeleteTekiTree [0]	:= true;
	end;

	dqMasterTree      .Close ();
	dqMasterTreeUpdate.Close ();
	dqMasterTree      .Free  ();
	dqMasterTreeUpdate.Free  ();

	Result	:= true;																	// 正常終了
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDeleteMasterDataRecord (Integer; Integer)										*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要ﾏｽﾀ削除処理																*/
//*																											*/
//*	戻り値	: Boolean, (true:正常終了, false:異常終了)														*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 摘要/分類区分 (0:摘要, 1:分類)												*/
//*			  nExCode		= 摘要(分類)ｺｰﾄﾞ																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnDeleteMasterDataRecord (nSumDivision: Integer; nExCode: Integer): Boolean;
var
	dqMasterData : TMQuery;
// HIS0032	nInCodeDelete: Integer;
	nInCodeDelete: Extended;
begin

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続
	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
        SQL.Add   ('SELECT NCode FROM TekiMA '); // HIS0029
        SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = :nSumDivision AND GCode = :nExCode AND RDelKbn = 0 '); // HIS0029

		ParamByName ('nSumDivision').AsInteger	:= nSumDivision;

		ParamByName ('nExCode'     ).AsInteger	:= nExCode;
		Open ();

		if	(EOF) then																	// ｴﾗｰ
		begin
			dqMasterData.Free ();

			Result	:= false;
			Exit;
		end;

		nInCodeDelete	:= FieldByName ('NCode').AsFloat;

// <SYNC> ADD start
											// ｸﾞﾙｰﾌﾟ管理採用 & 子会社選択時
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
		begin
        	Close();
        									// 親会社DBとMQueryの接続
			m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, dqMasterData);
			// この子会社の関連付けを削除
			Close();
			SQL.Clear ();
			SQL.Add ('UPDATE TekiMA_REL SET ' +
            		' RDelKbn_REL = 1, ' +
            		' UpdDateTM   = CURRENT_TIMESTAMP ' +
					'WHERE NCode = :parNCode ' +
					'AND GrpSegNCode = :parGrpSegNCode ');
											// 摘要内部ｺｰﾄﾞ
			ParamByName('parNCode').AsFloat := nInCodeDelete;
											// 会社識別ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ
			ParamByName('parGrpSegNCode').AsFloat := m_SyncMaster.m_nSegNCode;
			if	(not ExecSQL ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);
				Result	:= false;			// ｴﾗｰ
				Close ();
				Free  ();
				Exit;
			end;

			Close ();
			Free  ();

			// 同期ｽﾄｱﾄﾞ呼出
			if not m_SyncMaster.fnCall_SYNC(JNTSYNC_TEKIMA) then
			begin
				Result := false;			// ｴﾗｰ
			end
			else
			begin
				Result	:= true;			// 正常終了
			end;
			Exit;
		end;
// <SYNC> ADD end

		Close ();

		SQL.Clear ();
        SQL.Add   ('UPDATE TekiMA SET RDelKbn = 1 ');    // HIS0029
        SQL.Add   (',UpdTantoNCode = :nUpdTantoNCode '); // HIS0076
        SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = :nSumDivision AND GCode = :nExCode AND RDelKbn = 0');  // HIS0029

		ParamByName ('nSumDivision').AsInteger	:= nSumDivision;
		ParamByName ('nExCode'     ).AsInteger	:= nExCode;
        ParamByName ('nUpdTantoNCode').AsFloat	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0076

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= false;
			Exit;
		end;

		//	伝票辞書削除
		Close ();

		SQL.Clear ();
        SQL.Add   ('DELETE from TekiTree');                                          // HIS0029
        SQL.Add   ('WHERE  MasterKbn = 62 AND TekiKbn = 1 AND BasedNCode = :nExCode');  // HIS0029

        ParamByName ('nExCode'     ).AsFloat	    := nInCodeDelete;           // HIS0032

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= false;
			Exit;
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= true;																	// 正常終了
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDeleteMasterDataAddition (Integer)→Extended												*/
//*																											*/
//*	目的	: 摘要登録処理 その他ﾏｽﾀ削除						                                 		    */
//*																											*/
//*	戻り値	: Boolean, (true:正常終了, false:異常終了)														*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode	= 固定摘要ｺｰﾄﾞ																		*/
//*                                                         		                                        */
//***********************************************************************************************************/
// <HIS0052> MOD 引数を外部→内部ｺｰﾄﾞに
//function	TJNTCRP020000f.fnDeleteMasterDataAddition (nExCode: Integer): Boolean;
function	TJNTCRP020000f.fnDeleteMasterDataAddition (exNCode: Extended): Boolean;
var
	dqMasterData: TMQuery;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
// <HIS0052> MOD start
//		SQL.Add   ('SELECT MasterKbn FROM SwDicTeki WHERE MasterKbn = 61 AND TekiNCode = :nExCode');
//		ParamByName ('nExCode').AsFloat	:= fnGetNCode(TBL_TEKI,0,nExCode);

		SQL.Add   ('SELECT MasterKbn FROM SwDicTeki WHERE MasterKbn = 61 AND NCode = :nExCode');
        									// 内部ｺｰﾄﾞで検索
		ParamByName ('nExCode').AsFloat	:= exNCode;
// <HIS0052> MOD end

		Open ();

		if	(EOF) then																	// ｴﾗｰ
		begin
			dqMasterData.Free ();

			Result	:= true;
			Exit;
		end;
// <HIS0052> ADD start
		Close ();

		SQL.Clear ();
        									// 仕訳辞書摘要ﾏｽﾀ削除
		SQL.Add   ('DELETE FROM SwDicTeki WHERE MasterKbn = 61 AND NCode = :nExCode');
        									// 内部ｺｰﾄﾞ
		ParamByName ('nExCode').AsFloat	:= exNCode;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();
			Result	:= false;
			Exit;
		end;
// <HIS0052> ADD end
		Close ();

		SQL.Clear ();
		SQL.Add   ('DELETE FROM MFusenInfo ');
		SQL.Add   ('WHERE  MasterKbn = 61 AND NCode = :nExCode AND SubNCode = 0 ');

// <HIS0052> MOD start
//		ParamByName ('nExCode').AsFloat	:=  fnGetNCode(TBL_TEKI,0,nExCode);
											// 内部ｺｰﾄﾞ
		ParamByName ('nExCode').AsFloat	:=  exNCode;
// <HIS0052> MOD end

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= false;
			Exit;
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= true;																	// 正常終了
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDeleteTreeViewItems (Integer; Integer)											*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ削除処理																*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 摘要/分類区分 (0:摘要, 1:分類)												*/
//*			  nExCode		= 摘要(分類)ｺｰﾄﾞ																*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP020000f.fnDeleteTreeViewItems (nSumDivision: Integer; nExCode: Integer);
var
	stRecTreeItem: ^TreeViewRec;														// ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ･ﾃﾞｰﾀ
	stRecTreeWork: ^TreeViewRec;														// ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ･ﾃﾞｰﾀ
	cNodeChild	 : TTreeNode;															// 子ﾉｰﾄﾞ
	cNodeTarget	 : TTreeNode;															// 子ﾉｰﾄﾞ
	cNodeWork	 : TTreeNode;															// 子ﾉｰﾄﾞ
	nCount01     : Integer;																// ｶｳﾝﾀｰ
	nCount02     : Integer;																// ｶｳﾝﾀｰ
	fMove		 : Boolean;

begin
	nCount01	:= CmnTreeView.Items.Count + 1;

	while (true) do
	begin
		nCount01	:= nCount01 - 1;

		if  (nCount01 <= 0) then
			Break;

		stRecTreeItem	:= CmnTreeView.Items [nCount01 - 1].Data;						// 検索ｱｲﾃﾑ･ﾃﾞｰﾀ取得

		if	((stRecTreeItem^.nExCode   = nExCode) and									// ｱｲﾃﾑが一致
			 (stRecTreeItem^.nDivision = nSumDivision)) then
		begin
			if	(stRecTreeItem^.nDivision = 1) then
			begin
				cNodeChild	:= CmnTreeView.Items [nCount01 - 1].GetFirstChild ();

				while (true) do
				begin
					if  (cNodeChild = nil) then
						Break;

					stRecTreeItem	:= cNodeChild.Data;									// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

					fMove	:= true;

					for nCount02 := 1 to CmnTreeView.Items.Count do
					begin
						stRecTreeWork	:= CmnTreeView.Items [nCount02 - 1].Data;

						if	((cNodeChild <> CmnTreeView.Items [nCount02 - 1]) and
							 (stRecTreeWork^.nExCode   = stRecTreeItem^.nExCode) and
							 (stRecTreeWork^.nDivision = stRecTreeItem^.nDivision)) then
						begin
							fMove	:= false;
							Break;
						end;
					end;

					cNodeTarget	:= cNodeChild;
					cNodeChild	:= cNodeChild.GetNextSibling ();						// 次の子ﾉｰﾄﾞ取得

					if	(fMove) then
					begin
						stRecTreeItem	:= cNodeTarget.Data;

						cNodeWork	:= CmnTreeView.Items [0].GetFirstChild ();			// 先頭の子ﾉｰﾄﾞ取得

						while (true) do
						begin
							if  (cNodeWork = nil) then
								Break;

							stRecTreeWork	:= cNodeWork.Data;							// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

							if	((stRecTreeWork^.nExCode   > stRecTreeItem^.nExCode) and
								 (stRecTreeWork^.nDivision = stRecTreeItem^.nDivision)) then
								Break;

							cNodeWork	:= cNodeWork.GetNextSibling ();					// 次の子ﾉｰﾄﾞ取得
						end;

						if	(cNodeWork = nil) then
							cNodeTarget.MoveTo (CmnTreeView.Items [0], naAddChild)		// 挿入先ﾉｰﾄﾞの子として末尾に移動
						else
							cNodeTarget.MoveTo (cNodeWork, naInsert);
					end;
				end;
			end;

			CmnTreeView.Items [nCount01 - 1].Delete ();
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnEraseMasterTreeRecord (Integer; Integer)										*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要分類体系ﾏｽﾀ消去 (固定摘要/科目連想 共通)									*/
//*																											*/
//*	戻り値	: Boolean, (true:正常終了, false:異常終了)														*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode		= 摘要(分類)ｺｰﾄﾞ																*/
//*           nExCodeParent	= 摘要(分類)/科目ｺｰﾄﾞ															*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnEraseMasterTreeRecord (nExCode: Integer; nExCodeParent: Integer): Boolean;
var
	dqMasterTree      : TMQuery;
	dqMasterTreeUpdate: TMQuery;
	fUpdateRecord     : Boolean;

    exSumNCode      : Extended;
    exBasedNCode    : Extended;

begin


    //HIS0032 内部ｺｰﾄﾞ取得
    exSumNCode   := fnGetNCode(m_nProcDivision,1,nExCodeParent,0);
    exBasedNCode := fnGetNCode(TBL_TEKI,0,nExCode,0);

	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	dqMasterTree		:= TMQuery.Create (Self);
	dqMasterTreeUpdate	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree      );					// DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTreeUpdate);					// DBとMQueryの接続

	with (dqMasterTree) do
	begin
		if	(m_nProcDivision = 1) then													// 処理区分: 1=固定摘要
		begin
			Close ();

			SQL.Clear ();
            SQL.Add   ('SELECT BasedNCode FROM TekiTree ');  // HIS0029
            SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = 1 AND SumNCode <> :nSumCode AND BasedNCode = :nBasedCode'); // HIS0029

			ParamByName ('nSumCode'  ).AsFloat	:= exSumNCode;
			ParamByName ('nBasedCode').AsFloat	:= exBasedNCode;

			Open ();

			if	(not EOF) then
				fUpdateRecord	:= false
			else
				fUpdateRecord	:= true;
		end
		else																			// 処理区分: 2=科目連想
			fUpdateRecord	:= false;

		if	(fUpdateRecord) then
		begin
			with (dqMasterTreeUpdate) do
			begin
				Close ();

				SQL.Clear ();
                SQL.Add   ('UPDATE TekiTree SET SumNCode = 0 '); // HIS0029
                SQL.Add   (', UpdTantoNCode = :nUpdTantoNCode '); // HIS0076
                SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = 1 AND SumNCode = :nSumCode AND BasedNCode = :nBasedCode');      // HIS0029


    			ParamByName ('nSumCode'  ).AsFloat	:= exSumNCode;
	    		ParamByName ('nBasedCode').AsFloat	:= exBasedNCode;
                ParamByName ('nUpdTantoNCode').AsFloat	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0076

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

					Result	:= false;
                    Exit;
				end;
			end;
		end
		else
		begin
			with (dqMasterTreeUpdate) do
			begin
				Close ();

				SQL.Clear ();
                SQL.Add   ('DELETE FROM TekiTree ');    // HIS0029
				SQL.Add   ('WHERE  MasterKbn = 61 AND ');
                SQL.Add   ('       TekiKbn = :nDivision AND SumNCode = :nSumCode AND BasedNCode = :nBasedCode');    // HIS0029

				ParamByName ('nDivision' ).AsInteger	:= m_nProcDivision;
    			ParamByName ('nSumCode'  ).AsFloat	:= exSumNCode;
	    		ParamByName ('nBasedCode').AsFloat	:= exBasedNCode;


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

					Result	:= false;
					Exit;
				end;

(*H0006 20031225 khattori syuusei 摘要残管理有無の更新は、詳細画面で摘要残管理有無を変更した時だけにする*)
//				if	(m_nProcDivision = 2) then
//				begin
//					if	(not fnSetControlDivision (nExCodeParent, nExCode, 0)) then
//					begin
//						m_cDataModule.Rollback (m_cDBSelect);							// ﾛｰﾙﾊﾞｯｸ(破棄)
//						dqMasterTree .Close	   ();
//						dqMasterTree .Free	   ();
//
//						Result	:= false;
//						Exit;
//					end;
//				end;

				m_fDeleteTekiTree [m_nProcDivision - 1]	:= true;
			end;
		end;

		Close ();
	end;

	m_cDataModule     .Commit (m_cDBSelect);											// ｺﾐｯﾄ(反映)
	dqMasterTree      .Close  ();
	dqMasterTreeUpdate.Close  ();
	dqMasterTree      .Free	  ();
	dqMasterTreeUpdate.Free	  ();

	Result	:= true;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnEraseTreeViewItems (TTreeNode)													*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ(体系)消去処理 (固定摘要/科目連想 共通)								*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cNodeTarget	= 体系消去対象ﾉｰﾄﾞ																*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnEraseTreeViewItems (cNodeTarget: TTreeNode);
var
	cNodeWork  : TTreeNode;
	stRecTarget: ^TreeViewRec;															// ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ･ﾃﾞｰﾀ
	stRecWork  : ^TreeViewRec;															// ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ･ﾃﾞｰﾀ
	nCount	   : Integer;																// ｶｳﾝﾀｰ

begin
	stRecTarget	:= cNodeTarget.Data;

	for	nCount := 1 to CmnTreeView.Items.Count do
	begin
		stRecWork	:= CmnTreeView.Items [nCount - 1].Data;

		if	((CmnTreeView.Items [nCount - 1] <> cNodeTarget) and
			 (stRecWork^.nDivision = stRecTarget^.nDivision) and (stRecWork^.nExCode = stRecTarget^.nExCode)) then
		begin
			cNodeTarget.Delete ();
			Exit;
		end;
	end;

	if	(m_nProcDivision = 2) then														// 処理区分: 2=科目連想
	begin
		cNodeTarget.Delete ();
		Exit;
	end;

	cNodeWork	:= CmnTreeView.Items [0].GetFirstChild ();

	while (true) do
	begin
		if	(cNodeWork = nil) then
			Break;

		stRecWork	:= cNodeWork.Data;													// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

		if	((stRecWork^.nExCode   > stRecTarget^.nExCode) and
			 (stRecWork^.nDivision = stRecTarget^.nDivision)) then
			Break;

		cNodeWork	:= cNodeWork.GetNextSibling ();										// 次の子ﾉｰﾄﾞ取得
	end;

	if	(cNodeWork = nil) then
		cNodeTarget.MoveTo (CmnTreeView.Items [0], naAddChild)							// 挿入先ﾉｰﾄﾞの子として末尾に移動
	else
		cNodeTarget.MoveTo (cNodeWork, naInsert);
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnGetMasterInfoData (Integer; var String; Integer; Integer; Integer)				*/
//*																											*/
//*	目的	: 摘要登録処理								             		                                */
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnGetMasterInfoData	(nMasDiv: Integer;nPos: Integer):Integer;
//procedure	TJNTCRP020000f.fnGetMasterInfoData (nMasterDivision: Integer; var strCaption: String;
//						var nCodeDigit: Integer; var nCodeAttribute: Integer; var nAdoption: Integer);
var
	nWrkDiv		:	Integer;
	nCount		:	Integer;
	nAdopt		:	Integer;
begin
	with	m_stCurDtlCodeAttr [nPos]	do
	begin
		strCaption	:=	'';
		nDigit		:=	6;
		nAttribute	:=	0;
		nAdopt		:=	0;

		if	((nMasDiv = MASTER_CUSTOMERPLUS01) or (nMasDiv = MASTER_CUSTOMERPLUS02))
		then	nWrkDiv	:= MASTER_CUSTOMER
		else	nWrkDiv	:= nMasDiv;
// <HIS0052> MOD start
//		for	nCount := 0 to 16 do
		for	nCount := 0 to High(m_stAdoptInfo) do
// <HIS0052> MOD end
		begin
			if	(m_stAdoptInfo [nCount].nMasterDivision = nWrkDiv) then
			begin
				strCaption		:=	m_stAdoptInfo [nCount].strDescription;
				nDigit			:=	m_stAdoptInfo [nCount].nCodeDigit;
				nAttribute		:=	m_stAdoptinfo [nCount].nCodeAttribute;
				nAdopt			:=	m_stAdoptInfo [nCount].nAdoption;
// <HIS0052> MOD start
(*				if	nMasDiv=MASTER_SUBJECTPLUS
				then	nMasterDivision	:= MASTER_SUBJECT
				else	nMasterDivision	:= nMasDiv;
*)
				nMasterDivision	:= nMasDiv;
// <HIS0052> MOD end
				Break;
			end;
		end;

		if	((nMasDiv = MASTER_CUSTOMERPLUS01) and (nAdopt <> 0)) then
		begin
			strCaption	:= '得意先';
			nAdopt		:= 2;
		end;

		if	((nMasDiv = MASTER_CUSTOMERPLUS02) and (nAdopt <> 0)) then
		begin
			strCaption	:= '仕入先';
			nAdopt		:= 3;
		end;
	end;

	result	:=	nAdopt;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnGetMasterInfoData (Integer; var String; Integer; Integer; Integer)				*/
//*																											*/
//*	目的	: 摘要登録処理								             		                                */
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnGetMasterInfoData	(nMasDiv: Integer):Integer;
//procedure	TJNTCRP020000f.fnGetMasterInfoData (nMasterDivision: Integer; var strCaption: String;
//						var nCodeDigit: Integer; var nCodeAttribute: Integer; var nAdoption: Integer);
var
	nWrkDiv		:	Integer;
	nCount		:	Integer;
	nAdopt		:	Integer;
begin
	with	m_stCdAtSngl	do
	begin
		strCaption	:=	'';
		nDigit		:=	6;
		nAttribute	:=	0;
		nAdopt		:=	0;

		if	((nMasDiv = MASTER_CUSTOMERPLUS01) or (nMasDiv = MASTER_CUSTOMERPLUS02))
		then	nWrkDiv	:= MASTER_CUSTOMER
		else	nWrkDiv	:= nMasDiv;

// <HIS0052> MOD start
//		for	nCount := 0 to 16 do
		for	nCount := 0 to High(m_stAdoptInfo) do
// <HIS0052> MOD end
		begin
			if	(m_stAdoptInfo [nCount].nMasterDivision = nWrkDiv) then
			begin
				strCaption		:=	m_stAdoptInfo [nCount].strDescription;
				nDigit			:=	m_stAdoptInfo [nCount].nCodeDigit;
				nAttribute		:=	m_stAdoptinfo [nCount].nCodeAttribute;
				nAdopt			:=	m_stAdoptInfo [nCount].nAdoption;
// <HIS0052> MOD start
(*				if	nMasDiv=MASTER_SUBJECTPLUS
				then	nMasterDivision	:= MASTER_SUBJECT
				else	nMasterDivision	:= nMasDiv;
*)
				nMasterDivision	:= nMasDiv;
// <HIS0052> MOD end
				Break;
			end;
		end;

		if	((nMasDiv = MASTER_CUSTOMERPLUS01) and (nAdopt <> 0)) then
		begin
			strCaption	:= '得意先';
			nAdopt		:= 2;
		end;

		if	((nMasDiv = MASTER_CUSTOMERPLUS02) and (nAdopt <> 0)) then
		begin
			strCaption	:= '仕入先';
			nAdopt		:= 3;
		end;
	end;

	result	:=	nAdopt;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnGetTagColorBitmap (Integer)											            */
//*																											*/
//*	目的	: 摘要登録処理 ﾏｽﾀ付箋管理情報取得   		             		                                */
//*																											*/
//*	戻り値	: TBitmap,															                            */
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnGetTagColorBitmap (nTagColor: Integer): TBitmap;
var
	bmpTagColor : TBitmap;

begin
	bmpTagColor := nil;

	case (nTagColor) of
		1:	bmpTagColor	:= CmnTreeViewPopupMenuTag001.Bitmap;
		2:	bmpTagColor	:= CmnTreeViewPopupMenuTag003.Bitmap;
        3:	bmpTagColor	:= CmnTreeViewPopupMenuTag002.Bitmap;
		4:	bmpTagColor	:= CmnTreeViewPopupMenuTag004.Bitmap;
	end;

	Result	:= bmpTagColor;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnInitializeDetailScreen (Boolean)												*/
//*																											*/
//*	目的	: 摘要登録処理 詳細画面初期化																	*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: fClearExCode	= 外部ｺｰﾄﾞ消去 (true:する, false:しない)										*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnInitializeDetailScreen (fClearExCode: Boolean);
begin
	if	(fClearExCode) then
	begin
		DtlCEdtExCd.Value	:=	0;
		DtlCEdtExCd.Clear;
	end;

	DtlCmnEditAssociation	.Text	:=	'';
	DtlCmnEditName			.Text	:=	'';

	DtlCmnEditDealDivision	.Value	:=	0;
	DtlCmnEditDealClass		.Value	:=	0;
	DtlCmnEditDealClass		.Clear;

	DtlCmnLbelDealClassTitle.Enabled	:=	false;

	DtlCmnEditDealClass.Enabled	:=	false;
	DtlCmnEditDealClass.Color	:=	TJNTCRP020000f (Self).Color;

	DtlCmnLbelDealDivisionDesc	.Caption	:=	'なし';
	DtlCmnLbelDealClassDesc	.Caption	:=	'';

	fnResetDetailScreenAddition;
	m_iKmkGCodeDeb:=Trunc(cEdtK1DNum.Value);
	m_iKmkGCodeCre:=Trunc(cEdtK1CNum.Value);
	m_iDtlCEdtExCd:=Trunc(DtlCEdtExCd.Value);

	m_nSelectTagKind	:=	0;

	DtlCmnImageTag.Picture	:=	nil;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnInsertMasterTreeRecord (TTreeNode; Integer; Integer; String)					*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要分類体系ﾏｽﾀ ﾚｺｰﾄﾞ挿入処理 (固定摘要/科目連想 共通)						*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cNodeDst		= 挿入先摘要(分類)/科目ｱｲﾃﾑ･ﾉｰﾄﾞ												*/
//*			  nSumDivision	= 挿入元ｱｲﾃﾑ 摘要/分類区分														*/
//*			  nExCode		= 挿入元ｱｲﾃﾑ 摘要(分類)ｺｰﾄﾞ														*/
//*			  strName		= 挿入元ｱｲﾃﾑ 摘要文字列															*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnInsertMasterTreeRecord (cNodeDst: TTreeNode; nSumDivision: Integer; nExCode: Integer; strName: String);
var
	dqMasterTree: TMQuery;
	stWorkRec	: ^TreeViewRec;
	nSumCode	: Integer;

    exSumNCode  : Extended;
    exBasedNCode : Extended;

begin
	stWorkRec	:= cNodeDst.Data;

	if	(stWorkRec^.nDivision = 0) then													// 挿入先が固定摘要
		stWorkRec	:= cNodeDst.Parent.Data;

	nSumCode	:= stWorkRec^.nExCode;

	dqMasterTree	:= TMQuery.Create (Self);									// MQueryの構築

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	with (dqMasterTree) do
	begin
		Close ();

		SQL.Clear ();
        SQL.Add   ('INSERT INTO TekiTree (MasterKbn, TekiKbn, SumNCode, BasedNCode, RDelKbn ');  // HIS0029
        SQL.Add   (', UpdTantoNCode) ');  // HIS0076
        SQL.Add	  ('VALUES (61, :nProcDivision, :nSumCode, :nBasedCode ,0');   // HIS0029
        SQL.Add	  (', :nUpdTantoNCode)');   // HIS0029

		ParamByName ('nProcDivision').AsInteger	:= m_nProcDivision;

        //HIS0032 内部ｺｰﾄﾞ取得
        exSumNCode   := fnGetNCode(m_nProcDivision,1,nSumCode);
        exBasedNCode := fnGetNCode(TBL_TEKI,0,nExCode);

		ParamByName ('nSumCode'  ).AsFloat	:= exSumNCode;
  		ParamByName ('nBasedCode').AsFloat	:= exBasedNCode;
        ParamByName ('nUpdTantoNCode').AsFloat	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0076


		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)
			dqMasterTree.Close ();
			dqMasterTree.Free  ();
			Exit;
		end;
	end;

	fnUpdateTreeViewItems (nSumDivision, nExCode, strName, ACCESS_TREE_INSERT);

	m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)
	dqMasterTree .Close  ();
	dqMasterTree .Free   ();
end;
//<HIS0078 start>
(*
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnMakeSQLConstructionKmkMA (Integer; Integer; Integer)							*/
//*																											*/
//*	目的	: 摘要登録処理 条件SQL文取得処理																*/
//*																											*/
//*	戻り値	: String, (条件SQL文)												                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nMasterDivision	= ﾏｽﾀ区分		(1:勘定科目, 2:細目科目)									*/
//*			  nDCDivision		= 借方/貸方区分	(0:借方, 1:貸方)											*/
//*			  nExCode			= 勘定科目ｺｰﾄﾞ	(ﾏｽﾀ区分=2:細目科目の時のみ)								*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnMakeSQLConstructionKmkMA (nMasterDivision: Integer;
																nDCDivision: Integer; nExCode: Integer): String;
var
	strSQLConst: String;

begin
    strSQLConst	:= 'MasterKbn = ' + Format ('%d ', [nMasterDivision]) + 'AND SumKbn = 0 AND RDelKbn = 0 AND ';  // HIS0029

	if	(nMasterDivision = MASTER_SUBJECT) then											// ﾏｽﾀ区分: 1=勘定科目
	begin
		strSQLConst	:= strSQLConst + 'CNCode = 0 AND (InputKbn = 0 OR (';

		if	(nDCDivision = 0) then														// 借方/貸方区分: 0=借方
			strSQLConst	:= strSQLConst + 'DCKbn = 0 AND InputKbn = 1) OR (DCKbn = 1 AND InputKbn = 2))'
		else															   				// 借方/貸方区分: 1=貸方
			strSQLConst	:= strSQLConst + 'DCKbn = 1 AND InputKbn = 1) OR (DCKbn = 0 AND InputKbn = 2))';
	end
	else
		strSQLConst	:= strSQLConst + 'GCode = ' + Format ('%d', [nExCode]);

	Result	:= strSQLConst;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnMakeSQLConstructionHojyoMA (Integer; Integer)									*/
//*																											*/
//*	目的	: 摘要登録処理 条件SQL文取得処理																*/
//*																											*/
//*	戻り値	: String, (条件SQL文)												                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nMasterDivision	= ﾏｽﾀ区分																	*/
//*			  nDCDivision		= 借方/貸方区分	(0:借方, 1:貸方)											*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnMakeSQLConstructionHojyoMA (nMasterDivision: Integer; nDCDivision: Integer): String;
var
	strSQLConst: String;
	nMasterWork: Integer;
	nPosition  : Integer;

begin
	if	((nMasterDivision = MASTER_CUSTOMERPLUS01) or (nMasterDivision = MASTER_CUSTOMERPLUS02)) then
		nMasterWork	:= MASTER_CUSTOMER
	else
		nMasterWork	:= nMasterDivision;

    if nMasterWork = MASTER_CUSTOMER then
        strSQLConst	:= 'SumKbn = 0 AND RDelKbn = 0'
    else
        strSQLConst	:= 'MasterKbn = ' + Format ('%d ', [nMasterWork]) + 'AND SumKbn = 0 AND RDelKbn = 0';

	if	((nMasterDivision = MASTER_SECTION) or (nMasterDivision = MASTER_SEGMENT)) then
	begin
		if	(nMasterDivision = MASTER_SECTION) then
			nPosition	:= 2 + nDCDivision * 8
		else
			nPosition	:= 3 + nDCDivision * 8;

		case (m_stCurDtlCodeAttr [nPosition].nClassCode) of
			0:	strSQLConst	:= strSQLConst + ' AND HojyoKbn2 <> 2';
			2:	strSQLConst	:= strSQLConst + ' AND HojyoKbn2 <> 0';
		end;
	end
	else if	(nMasterDivision = MASTER_CUSTOMERPLUS01) then								// 得意先
		strSQLConst	:= strSQLConst + ' AND HojyoKbn1 = 1'
	else if	(nMasterDivision = MASTER_CUSTOMERPLUS02) then								// 仕入先
		strSQLConst	:= strSQLConst + ' AND HojyoKbn2 = 1'

	else if	(nMasterDivision = MASTER_CONSTKIND		) then								//	工種
		if	m_iPtnNo[nDCDivision]>0	then
			strSQLConst	:= strSQLConst + ' AND GCode in (Select GCode from KousyuPtn WHERE PtnNo ='+
			inttostr(m_iPtnNo[nDCDivision])+' AND GCode <> '''')';

	Result	:= strSQLConst;
end;
*)
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnMoveMasterTreeRecord (TTreeNode; TTreeNode)										*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要分類体系ﾏｽﾀ ﾚｺｰﾄﾞ移動処理 (固定摘要/科目連想 共通)						*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cNodeSrc	= 移動元摘要(分類)ｱｲﾃﾑ･ﾉｰﾄﾞ															*/
//*			: cNodeDst	= 移動先摘要(分類)/科目ｱｲﾃﾑ･ﾉｰﾄﾞ													*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnMoveMasterTreeRecord (cNodeSrc: TTreeNode; cNodeDst: TTreeNode);
var
	dqMasterTree: TMQuery;
	stWorkRecSrc: ^TreeViewRec;
	stWorkRec	: ^TreeViewRec;
	nSumCodePrev: Integer;
	nSumCode	: Integer;
	nBasedCode	: Integer;

    PrebSumNCode : Extended;
    exSumNCode   : Extended;
    exBasedNCode : Extended;


begin
	stWorkRecSrc	:=	cNodeSrc.Data;
	stWorkRec		:=	cNodeDst.Data;

	if	(stWorkRec^.nDivision = 0) then													// 挿入先が固定摘要
		stWorkRec	:=	cNodeDst.Parent.Data;

	nSumCode		:=	stWorkRec^.nExCode;
	nBasedCode		:=	stWorkRecSrc^.nExCode;

	stWorkRec		:=	cNodeSrc.Parent.Data;
	nSumCodePrev	:=	stWorkRec^.nExCode;

	dqMasterTree	:=	TMQuery.Create (Self);									// MQueryの構築

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続
	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	with (dqMasterTree) do
	begin
		Close ();
		SQL.Clear ();
        SQL.Add   ('UPDATE TekiTree SET SumNCode = :nSumCode '); // HIS0029
        SQL.Add   (',UpdTantoNCode = :nUpdTantoNCode '); // HIS0076
		SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = :nDivision AND ');
        SQL.Add   ('       SumNCode = :nSumCodePrev AND BasedNCode = :nBasedCode'); // HIS0029


        //HIS0032 内部ｺｰﾄﾞ取得

        PrebSumNCode    := fnGetNCode(TBL_TEKI,1,nSumCodePrev);
        exSumNCode      := fnGetNCode(TBL_TEKI,1,nSumCode);
        exBasedNCode    := fnGetNCode(TBL_TEKI,0,nBasedCode);

		ParamByName ('nDivision'   ).AsInteger	:= m_nProcDivision;

		ParamByName ('nSumCodePrev').AsFloat	:= PrebSumNCode;
		ParamByName ('nSumCode'    ).AsFloat	:= exSumNCode;
		ParamByName ('nBasedCode'  ).AsFloat	:= exBasedNCode;
        ParamByName ('nUpdTantoNCode').AsFloat	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0076

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)

			dqMasterTree.Close ();
			dqMasterTree.Free  ();
			Exit;
		end;
	end;

	fnMoveTreeViewItems (cNodeSrc, cNodeDst);

	m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)
	dqMasterTree .Close  ();
	dqMasterTree .Free   ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnMoveTreeViewItems (TTreeNode; TTreeNode)										*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ移動処理 (固定摘要/科目連想 共通)									*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: cNodeSrc	= 移動元摘要(分類)ｱｲﾃﾑ･ﾉｰﾄﾞ															*/
//*			: cNodeDst	= 移動先摘要(分類)/科目ｱｲﾃﾑ･ﾉｰﾄﾞ													*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnMoveTreeViewItems (cNodeSrc: TTreeNode; cNodeDst: TTreeNode);
var
	cNodeTarget: TTreeNode;
	cNodeWork  : TTreeNode;
	stRecSrc   : ^TreeViewRec;
	stRecWork  : ^TreeViewRec;

begin
	stRecSrc	:= cNodeSrc.Data;
	stRecWork	:= cNodeDst.Data;

	if	(stRecWork^.nDivision = 0) then
		cNodeTarget	:= cNodeDst.Parent
	else
		cNodeTarget	:= cNodeDst;

	cNodeWork	:= cNodeTarget.GetFirstChild ();										// 先頭の子ﾉｰﾄﾞ取得

	while (true) do
	begin
		if	(cNodeWork = nil) then
			Break;

		stRecWork	:= cNodeWork.Data;													// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

		if	((stRecWork^.nExCode   > stRecSrc^.nExCode) and
			 (stRecWork^.nDivision = stRecSrc^.nDivision)) then
			Break;

		if	((stRecSrc^.nDivision = 1) and (stRecWork^.nDivision = 0)) then
			Break;

		cNodeWork	:= cNodeWork.GetNextSibling ();										// 次の子ﾉｰﾄﾞ取得
	end;

	if	(cNodeWork = nil) then
		cNodeSrc.MoveTo (cNodeTarget, naAddChild)										// 挿入先ﾉｰﾄﾞの子として末尾に移動
	else
		cNodeSrc.MoveTo (cNodeWork, naInsert);

	cNodeTarget.Expand (true);
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnMoveGridRecordSelecter (Integer; Integer)										*/
//*																											*/
//*	目的	: 摘要登録処理 ｸﾞﾘｯﾄﾞ ﾚｺｰﾄﾞ･ｾﾚｸﾀｰ移動処理														*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 実在/合計区分 (0:実在, 1:合計...)												*/
//*			  nExCode		= 部門ｺｰﾄﾞ																		*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnMoveGridRecordSelecter (nSumDivision: Integer; nExCode: Integer);
var
	cMemData : TdxMemData;
	nRetRecNo: Integer;
	nRecMax	 : Integer;

begin
	if	(nSumDivision = 0) then
	begin
		cMemData	:= StdCmnMemDataExist;
		nRecMax		:= m_nGridExistRecords;
	end
	else
	begin
		cMemData	:= StdCmnMemDataTotal;
		nRecMax		:= m_nGridTotalRecords;
	end;

	nRetRecNo	:= cMemData.GetRecNoByFieldValue (nExCode, 'nExCode');

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


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnRebuildTreeViewItems ()															*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ再作成処理																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP020000f.fnRebuildTreeViewItems ();
var
	dqMasterData: TMQuery;
	stItemRec	: ^TreeViewRec;
	cNode		: TTreeNode;
	cNodeLast	: TTreeNode;
	nCount		: Integer;
	strItemName	: String;

begin
	m_fUnderConstruction	:= true;

	CmnTreeView.Items.BeginUpdate ();

	for nCount := 1 to CmnTreeView.Items.Count do
	begin
		stItemRec	:= CmnTreeView.Items [nCount - 1].Data;

		Dispose (stItemRec);
	end;

	CmnTreeView.Items.Clear ();

	if	(m_nProcDivision = 1) then														// 処理区分: 1=固定摘要
	begin
		New (stItemRec);

		stItemRec^.nDivision	:= 9;
		stItemRec^.nExCode		:= 0;
		stItemRec^.strName		:= '摘要分類体系';

		cNode	:= CmnTreeView.Items.AddChildObject (nil, stItemRec^.strName, stItemRec);

		cNode.ImageIndex	:= 0;
		cNode.SelectedIndex	:= 2;

		fnCreateTreeViewItems01 (cNode);
		fnCreateTreeViewItems02 (cNode);
	end
	else																				// 処理区分: 2=科目連想
	begin
		dqMasterData	:= TMQuery.Create (Self);

		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// DBとMQueryの接続

		with (dqMasterData) do
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT GCode, SimpleName FROM KmkMA ');
			SQL.Add   ('WHERE  MasterKbn = 1 AND SumKbn = 0 AND RDelKbn = 0 ORDER BY GCode');
			Open ();

			while (not EOF) do
			begin
				strItemName	:= Format ('%6d', [GetFld ('GCode').AsInteger]);
				strItemName	:= strItemName + ' ' + GetFld ('SimpleName').AsString;

				New (stItemRec);

				stItemRec^.nDivision	:= DIVISION_SUBJECT;
				stItemRec^.nExCode		:= GetFld ('GCode').AsInteger;
				stItemRec^.strName		:= strItemName;

				cNode	:= CmnTreeView.Items.AddChildObject (nil, stItemRec^.strName, stItemRec);

				cNode.ImageIndex	:= 0;
				cNode.SelectedIndex	:= 2;

				fnCreateTreeViewItems02 (cNode);

				NEXT;
			end;
		end;

		dqMasterData.Close ();
		dqMasterData.Free  ();
	end;

	m_fUnderConstruction	:= false;

	if	(m_nProcDivision = 1) then														// 処理区分: 1=固定摘要
	begin
		cNodeLast	:= nil;

		if	(CmnTreeView.Items.Count > 0) then
		begin
			cNodeLast	:= CmnTreeView.Items [0].GetLastChild ();

			if	(cNodeLast <> nil) then
			begin
				while (true) do
				begin
					cNode	:= cNodeLast.GetLastChild ();

					if	(cNode = nil) then
						Break;

					cNodeLast	:= cNode;
				end;
			end;
		end;

		CmnTreeView.FullExpand ();

		if	(cNodeLast <> nil) then
		begin
			CmnTreeView.TopItem		:= cNodeLast;
			cNodeLast  .Selected	:= true;
		end
		else
			CmnTreeView.Items [0].Selected	:= true;
	end
	else
	begin
		if	(CmnTreeView.Items.Count > 0) then
			CmnTreeView.Items [0].Selected	:= true;
	end;

	m_cNodePrevSelect	:= CmnTreeView.Selected;

	CmnTreeView.Items.EndUpdate ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnResetParentItemsInfo ()															*/
//*																											*/
//*	目的	: 摘要登録処理 現在選択されている親に対する子情報を再ｾｯﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP020000f.fnResetParentItemsInfo ();
var
    dqMasterData    : TMQuery;
    strParentCaption: String;
	strFormat		: String;				// <HIS0058> ADD
begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
        SQL.Add   ('SELECT TekiChar FROM TekiMA ');  // HIS0029
        SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = :nSumDivision AND GCode = :nExCode AND RDelKbn = 0 '); // HIS0029

		if	(m_nExCodeCurrent = 0) then
			ParamByName ('nSumDivision').AsInteger	:= 9
		else
			ParamByName ('nSumDivision').AsInteger	:= 1;

		ParamByName ('nExCode').AsInteger	:= m_nExCodeCurrent;

		Open ();

		if	(m_nExCodeCurrent = 0) then
			strParentCaption	:= FieldByName ('TekiChar').AsString
		else
		begin
// <HIS0058> MOD start
//			strParentCaption	:= Format ('%6d', [m_nExCodeCurrent]);
											// 最大桁数に合わせる
			strFormat := '%' + IntToStr(m_iTekiDigit) + 'd';
			strParentCaption	:= Format (strFormat, [m_nExCodeCurrent]);
// <HIS0058> MOD end
			strParentCaption	:= strParentCaption + ' ' + FieldByName ('TekiChar').AsString;
		end;

		Close ();
	end;

	StdCmnTab.BorderCaption := strParentCaption;
	DtlCmnTab.BorderCaption := strParentCaption;

	DtlCmnTab.Items [0].BorderCaption	:= strParentCaption;

	StdCmnMemDataExist.Active	:= false;
	StdCmnMemDataTotal.Active	:= false;
	StdCmnMemDataExist.Active	:= true;
	StdCmnMemDataTotal.Active	:= true;

	StdCmnDataSourceExist.DataSet	:= nil;
	StdCmnDataSourceTotal.DataSet	:= nil;

	m_nGridExistRecords	:= 0;
	m_nGridTotalRecords	:= 0;

	with (dqMasterData) do
	begin
		if	(m_nExCodeCurrent = 0) then													// 摘要分類体系
		begin
			Close ();

			SQL.Clear ();
            SQL.Add   ('SELECT GCode, Renso, TekiChar FROM TekiMA ');                                            // HIS0029
            SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = 1 AND RDelKbn = 0 ORDER BY GCode');    // HIS0029

			Open ();

			while (not EOF) do
			begin
				fnSetGridMemDataTotal (dqMasterData);
				NEXT;
			end;
		end;

		Close ();

		SQL.Clear ();
        SQL.Add   ('SELECT tt.BasedNCode, tm.SumKbn, tm.Renso, tm.TekiChar, fi.FusenKbn, fi.FusenCmnt, tm.GCode '); // HIS0029
        SQL.Add   ('FROM   TekiTree tt, TekiMA tm LEFT OUTER JOIN MFusenInfo fi                        '); // HIS0029
        SQL.Add   ('ON     fi.MasterKbn = tm.MasterKbn AND fi.NCode = tm.NCode                                  '); // HIS0029
		SQL.Add   ('WHERE  tt.MasterKbn = 61 AND tt.SumNCode = :nExCode AND tt.MasterKbn = tm.MasterKbn AND     '); // HIS0029
        SQL.Add   ('       tt.TekiKbn = :nDivision AND tm.SumKbn = 0                                            '); // HIS0029
        SQL.Add   ('       AND tt.BasedNCode = tm.NCode AND tm.RDelKbn = 0                                      '); // HIS0029
		SQL.Add   ('ORDER BY tm.GCode');                                                                            // HIS0029

		ParamByName ('nExCode'  ).AsInteger	:= m_nExCodeCurrent;
		ParamByName ('nDivision').AsInteger	:= m_nProcDivision;

		Open ();

		while (not EOF) do
		begin
			fnSetGridMemDataExist (dqMasterData);
			NEXT;
		end;

		Close ();
	end;

	StdCmnDataSourceExist.DataSet	:= StdCmnMemDataExist;
	StdCmnDataSourceTotal.DataSet	:= StdCmnMemDataTotal;

	StdCmnMemDataExist.First ();
	StdCmnMemDataTotal.First ();

	dqMasterData.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetMasterInfoData ()															*/
//*																											*/
//*	目的	: 摘要登録処理 ﾏｽﾀ基本情報 採用ﾃﾞｰﾀ ｾｯﾄ処理														*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnSetMasterInfoData ();
var
	dqMasterInfo	:	TMQuery;
	nItemPosition	:	Integer;
//	nMasterDivision	:	Integer;			// <HIS0052> DEL
    iSegIdx			:	Integer;			// ｾｸﾞﾒﾝﾄ用index <HIS0052> ADD

	function	fnGetBumonName(iItem:Integer;var sBumonCd:String):String;
	var
		dqBumon	:	TMQuery;
		sReturn	:	String;
	begin
		sReturn:='';

		dqBumon	:= TMQuery.Create (Self);

		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqBumon);		// DBとMQueryの接続

		with (dqBumon) do
		begin
			Close ();

			SQL.Clear ();
//<HIS0095>↓↓内部ｺｰﾄﾞで検索するように修正（sBumonCd は内部ｺｰﾄﾞで受取って、外部ｺｰﾄﾞとして返している）。また、NCode=0のﾚｺｰﾄﾞは無いため、sBumonCd=''の場合の検索は不要。
//			if	sBumonCd=''

//			then	SQL.Add   ('SELECT GCode,SimpleName FROM HojyoMA Where MasterKbn='+IntToStr(iItem)+' and SumKbn=0 and RDelKbn=0 and NCode=0')
//			else	SQL.Add   ('SELECT GCode,SimpleName FROM HojyoMA Where MasterKbn='+IntToStr(iItem)+' and SumKbn=0 and RDelKbn=0 and GCode='''+sBumonCd+'''');
            if (sBumonCd <> '') then
            	SQL.Add   ('SELECT GCode,SimpleName FROM HojyoMA Where MasterKbn='+IntToStr(iItem)+' and SumKbn=0 and RDelKbn=0 and NCode='''+sBumonCd+'''');
//<HIS0095>↑↑


			Open ();

			while (not EOF) do
			begin
				sBumonCd	:=	GetFld('GCode').AsString;
				sReturn		:=	GetFld('SimpleName').AsString;
				break;
			end;

			Close ();
		end;
		dqBumon.Free ();

		result:=sReturn;
	end;
begin
// <HIS0052> DEL start
(*
	nMasterDivision	:= 0;

	for	nItemPosition := 0 to 16 do
	begin
		case (nItemPosition) of
			 0:	nMasterDivision	:= MASTER_SUBJECT;				//	勘定科目
			 1:	nMasterDivision	:= MASTER_SUBJECTPLUS;			//	細目科目
			 2:	nMasterDivision	:= MASTER_BANK;					//	銀行
			 3:	nMasterDivision	:= MASTER_CUSTOMER;				//	取引先
			 4:	nMasterDivision	:= MASTER_STAFF;				//	社員
			 5:	nMasterDivision	:= MASTER_GENERAL01;			//	汎用補助①
			 6:	nMasterDivision	:= MASTER_GENERAL02;			//	汎用補助②
			 7:	nMasterDivision	:= MASTER_GENERAL03;			//	汎用補助③
			 8:	nMasterDivision	:= MASTER_GENERAL04;			//	汎用補助④
			 9:	nMasterDivision	:= MASTER_GENERAL05;			//	汎用補助⑤
			10:	nMasterDivision	:= MASTER_SECTION;				//	部門
//HIS0033			11:	nMasterDivision	:= MASTER_SEGMENT01;			//	ｾｸﾞﾒﾝﾄ①
			11:	nMasterDivision	:= MASTER_SEGMENT;			    //	ｾｸﾞﾒﾝﾄ
			12:	nMasterDivision	:= MASTER_SEGMENT02;			//	ｾｸﾞﾒﾝﾄ②
			13:	nMasterDivision	:= MASTER_SEGMENT03;			//	ｾｸﾞﾒﾝﾄ③
			14:	nMasterDivision	:= MASTER_SEGMENT04;			//	ｾｸﾞﾒﾝﾄ④
			15:	nMasterDivision	:= MASTER_CONSTRUCT;			//	工事
			16:	nMasterDivision	:= MASTER_CONSTKIND;			//	工種
		end;

		m_stAdoptInfo [nItemPosition].nMasterDivision	:= nMasterDivision;
		m_stAdoptInfo [nItemPosition].nAdoption			:= 0;
		m_stAdoptInfo [nItemPosition].nCodeDigit		:= 4;					//HIS0026
//		m_stAdoptInfo [nItemPosition].nCodeDigit		:= 6;
		m_stAdoptInfo [nItemPosition].nCodeAttribute	:= 0;

		case (nItemPosition) of
			 0:	m_stAdoptInfo [nItemPosition].strDescription	:= '勘定科目';
			 1:	m_stAdoptInfo [nItemPosition].strDescription	:= '補助';
			 2:	m_stAdoptInfo [nItemPosition].strDescription	:= '銀行';
			 3:	m_stAdoptInfo [nItemPosition].strDescription	:= '取引先';
			 4:	m_stAdoptInfo [nItemPosition].strDescription	:= '社員';
			 5:	m_stAdoptInfo [nItemPosition].strDescription	:= '汎用補助1';
			 6:	m_stAdoptInfo [nItemPosition].strDescription	:= '汎用補助2';
			 7:	m_stAdoptInfo [nItemPosition].strDescription	:= '汎用補助3';
			 8:	m_stAdoptInfo [nItemPosition].strDescription	:= '汎用補助4';
			 9:	m_stAdoptInfo [nItemPosition].strDescription	:= '汎用補助5';
			10:	m_stAdoptInfo [nItemPosition].strDescription	:= '部門';
			11:	m_stAdoptInfo [nItemPosition].strDescription	:= 'ｾｸﾞﾒﾝﾄ1';
			12:	m_stAdoptInfo [nItemPosition].strDescription	:= 'ｾｸﾞﾒﾝﾄ2';
			13:	m_stAdoptInfo [nItemPosition].strDescription	:= 'ｾｸﾞﾒﾝﾄ3';
			14:	m_stAdoptInfo [nItemPosition].strDescription	:= 'ｾｸﾞﾒﾝﾄ4';
			15:	m_stAdoptInfo [nItemPosition].strDescription	:= '工事';
			16:	m_stAdoptInfo [nItemPosition].strDescription	:= '工種';
		end;
	end;
*)
// <HIS0052> DEL end

	dqMasterInfo	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterInfo);							// DBとMQueryの接続

	with (dqMasterInfo) do
	begin
		Close ();
		SQL.Clear ();
		SQL.Add   ('SELECT MasterKbn, UseKbn, JHojyoName, CodeDigit, CodeAttr, SpHojyoNCd1, SpHojyoNCd2 FROM MasterInfo ORDER BY MasterKbn');

		Open ();

		while (not EOF) do
		begin
// <HIS0052> DEL start
(*
			nItemPosition	:= -1;

			case (GetFld ('MasterKbn').AsInteger) of
				MASTER_SUBJECT    :	nItemPosition	:= 0;		// 勘定科目
				MASTER_SUBJECTPLUS:	nItemPosition	:= 1;		// 細目科目
				MASTER_BANK       :	nItemPosition	:= 2;		// 銀行
				MASTER_CUSTOMER	  :	nItemPosition	:= 3;		// 取引先
				MASTER_STAFF	  :	nItemPosition	:= 4;		// 社員
				MASTER_GENERAL01  :	nItemPosition	:= 5;		// 汎用補助①
				MASTER_GENERAL02  :	nItemPosition	:= 6;		// 汎用補助②
				MASTER_GENERAL03  :	nItemPosition	:= 7;		// 汎用補助③
				MASTER_GENERAL04  :	nItemPosition	:= 8;		// 汎用補助④
				MASTER_GENERAL05  :	nItemPosition	:= 9;		// 汎用補助⑤
				MASTER_SECTION	  :	nItemPosition	:= 10;		// 部門
//<HIS0033>				MASTER_SEGMENT01  :	nItemPosition	:= 11;		// ｾｸﾞﾒﾝﾄ
//<HIS0033>				MASTER_SEGMENT02  :	nItemPosition	:= 12;		// ｾｸﾞﾒﾝﾄ②
//<HIS0033>				MASTER_SEGMENT03  :	nItemPosition	:= 13;		// ｾｸﾞﾒﾝﾄ③
//<HIS0033>				MASTER_SEGMENT04  :	nItemPosition	:= 14;		// ｾｸﾞﾒﾝﾄ④
//<HIS0033>				MASTER_CONSTRUCT  :	nItemPosition	:= 15;		// 工事
//<HIS0033>				MASTER_CONSTKIND  :	nItemPosition	:= 16;		// 工種
			end;

            if (GetFld ('MasterKbn').AsInteger) = MASTER_SEGMENT    then  nItemPosition	:= 11; // ｾｸﾞﾒﾝﾄ
            if (GetFld ('MasterKbn').AsInteger) = MASTER_CONSTRUCT  then  nItemPosition	:= 15; // 工事
            if (GetFld ('MasterKbn').AsInteger) = MASTER_CONSTKIND  then  nItemPosition	:= 16; // 工種
*)
// <HIS0052> DEL end
// <HIS0052> ADD start
											// 設定したいindexを取得
			nItemPosition := GetAryIndex(GetFld('MasterKbn').AsInteger, DC_KARIKATA);
// <HIS0052> ADD end

// <HIS0052> MOD start
//			if	(nItemPosition >= 0) then
			if	(nItemPosition > 0) then
// <HIS0052> MOD end
			begin
            								// <HIS0052> ADD
				m_stAdoptInfo [nItemPosition].nMasterDivision 	:= GetFld ('MasterKbn' ).AsInteger;
				m_stAdoptInfo [nItemPosition].nAdoption			:= GetFld ('UseKbn'    ).AsInteger;

				//HIS0026
				if GetFld ('UseKbn'    ).AsInteger <> 0 then
				begin
					case GetFld ('CodeDigit' ).AsInteger of
//<HIS0033>						3..10: m_stAdoptInfo [nItemPosition].nCodeDigit	:= GetFld ('CodeDigit' ).AsInteger;
						3..16: m_stAdoptInfo [nItemPosition].nCodeDigit	:= GetFld ('CodeDigit' ).AsInteger;
						else   m_stAdoptInfo [nItemPosition].nCodeDigit	:= 4;
					end;
				end
				else
					m_stAdoptInfo [nItemPosition].nCodeDigit			:= 4;

				m_stAdoptInfo [nItemPosition].nCodeAttribute	:= GetFld ('CodeAttr'  ).AsInteger;

                // 細目ｺｰﾄﾞの属性対応<HIS0032>
// <HIS0052> DEL start 科目が決まってから設定
(*                if nItemPosition = 1 then
                begin
                    case m_stAdoptInfo [nItemPosition].nCodeAttribute of
                        0:
                        begin
                            cEdtK2DNum.InputAttr    :=  iaZeroSup;
                            cEdtK2CNum.InputAttr    :=  iaZeroSup;
                        end;
                        1:
                        begin
                            cEdtK2DNum.InputAttr    :=  iaZeroPad;
                            cEdtK2CNum.InputAttr    :=  iaZeroPad;
                        end;
                        2:
                        begin
                            cEdtK2DNum.InputAttr    :=  iaFree;
                            cEdtK2CNum.InputAttr    :=  iaFree;
                        end;
                    end;
                end;
*)
// <HIS0052> DEL end

				if	(GetFld ('JHojyoName').AsString <> '') then
					m_stAdoptInfo [nItemPosition].strDescription	:= GetFld ('JHojyoName').AsString;

				//	部門
// <HIS0052> MOD start
//				if	(nItemPosition = 10) then
				if GetFld('MasterKbn').AsInteger = MKBN_BUMON then
// <HIS0052> MOD end
				begin
					m_sBSComBmnCd	:=	GetFld ('SpHojyoNCd1').AsString;					//	ＢＳ共通部門
                	m_exBSComBmnNCd :=  GetFld ('SpHojyoNCd1').AsFloat;                     //	ＢＳ共通部門(内部ｺｰﾄﾞ)	//<HIS0094>Add	下記ﾒｿｯﾄﾞ(fnGetBumonName)により、m_sBSComBmnCdは外部ｺｰﾄﾞになるため、内部ｺｰﾄﾞを保持
					m_sBSComBmnNm	:=	fnGetBumonName(MASTER_SECTION,m_sBSComBmnCd);		//	ＢＳ共通部門
					m_sPLComBmnCd	:=	GetFld ('SpHojyoNCd2').AsString;					//	ＰＬ共通部門
                    m_exPLComBmnNCd	:=  GetFld ('SpHojyoNCd2').AsFloat;						//  ＰＬ共通部門(内部ｺｰﾄﾞ)	//<HIS0094>Add	下記ﾒｿｯﾄﾞ(fnGetBumonName)により、m_sBSComBmnCdは外部ｺｰﾄﾞになるため、内部ｺｰﾄﾞを保持
					m_sPLComBmnNm	:=	fnGetBumonName(MASTER_SECTION,m_sPLComBmnCd);		//	ＰＬ共通部門
				end;

// <HIS0052> MOD start
(*
				//	セグメント１
				if	(nItemPosition = 11) then
				begin

					m_sBSComSg1Cd	:=	GetFld ('SpHojyoNCd1').AsString;					//	ＢＳ共通セグメント１
//HIS0033					m_sBSComSg1Nm	:=	fnGetBumonName(MASTER_SEGMENT01,m_sBSComSg1Cd);		//	ＢＳ共通セグメント１
					m_sBSComSg1Nm	:=	fnGetBumonName(MASTER_SEGMENT,m_sBSComSg1Cd);		//	ＢＳ共通セグメント１
					m_sPLComSg1Cd	:=	GetFld ('SpHojyoNCd2').AsString;					//	ＰＬ共通セグメント１
//HIS0033					m_sPLComSg1Nm	:=	fnGetBumonName(MASTER_SEGMENT01,m_sPLComSg1Cd);		//	ＰＬ共通セグメント１
					m_sPLComSg1Nm	:=	fnGetBumonName(MASTER_SEGMENT,m_sPLComSg1Cd);		//	ＰＬ共通セグメント１
				end;
*)
				// セグメント１～１０
				if GetFld('MasterKbn').AsInteger in [MKBN_SEG1..MKBN_SEG10] then
                begin
											// ex) ﾏｽﾀ区分101→index0
                	iSegIdx := GetFld('MasterKbn').AsInteger - 100 - 1;
											//	ＢＳ共通セグメントコード
					m_sBSComSgCd[iSegIdx] := GetFld ('SpHojyoNCd1').AsString;
                                            //	ＢＳ共通ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ          //<HIS0094>Add
                    m_exBSComSgNCd[iSegIdx] := GetFld ('SpHojyoNCd1').AsFloat;  //<HIS0094>Add
											//	ＢＳ共通セグメント名称
					m_sBSComSgNm[iSegIdx] := fnGetBumonName(GetFld('MasterKbn').AsInteger, m_sBSComSgCd[iSegIdx]);
											//	ＰＬ共通セグメントコード
					m_sPLComSgCd[iSegIdx] := GetFld ('SpHojyoNCd2').AsString;
                                            //	ＰＬ共通ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ          //<HIS0094>Add
                    m_exPLComSgNCd[iSegIdx] := GetFld ('SpHojyoNCd2').AsFloat;  //<HIS0094>Add
											//	ＰＬ共通セグメント名称
					m_sPLComSgNm[iSegIdx] := fnGetBumonName(GetFld('MasterKbn').AsInteger, m_sPLComSgCd[iSegIdx]);
				end;
// <HIS0052> MOD end


			end;

			NEXT;
		end;

		Close ();
	end;

	dqMasterInfo.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetGridMemDataExist (TMQuery)													*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ ｾｯﾄ														*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: dqMasterData	= 固定摘要ﾏｽﾀ用ｸｴﾘｰ																*/
//*                                                                                             		    */
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnSetGridMemDataExist (dqMasterData: TMQuery);
var
	nExCode: Integer;

begin
	m_fUpdateRecord	:= false;

	with (dqMasterData) do
	begin
// HIS0029		if	(m_nProcDivision = 1) then
// HIS0029			nExCode	:= GetFld ('BasedCode').AsInteger
// HIS0029            nExCode	:= GetFld ('BasedNCode').AsInteger   // HIS0029
// HIS0029		else
			nExCode	:= GetFld ('GCode').AsInteger;

		StdCmnMemDataExist.Append;
		StdCmnMemDataExist.FieldByName ('grTag'         ).AsSign (fnGetTagColorBitmap (GetFld ('FusenKbn').AsInteger));
		StdCmnMemDataExist.FieldByName ('nExCode'       ).AsInteger	:= nExCode;
// HIS0029		StdCmnMemDataExist.FieldByName ('strAssociation').AsString	:= FieldByName ('RenChar'  ).AsString;
        StdCmnMemDataExist.FieldByName ('strAssociation').AsString	:= FieldByName ('Renso'  ).AsString;    // HIS0029
		StdCmnMemDataExist.FieldByName ('strName'       ).AsString	:= FieldByName ('TekiChar' ).AsString;
		StdCmnMemDataExist.FieldByName ('strComment'    ).AsString	:= FieldByName ('FusenCmnt').AsString;
		StdCmnMemDataExist.Post;

		m_nGridExistRecords	:= m_nGridExistRecords + 1;
	end;

	m_fUpdateRecord	:= true;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetGridMemDataTotal (TMQuery)													*/
//*																											*/
//*	目的	: 摘要登録処理 摘要分類ｸﾞﾘｯﾄﾞ用Memﾃﾞｰﾀ ｾｯﾄ														*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: dqMasterData	= 固定摘要ﾏｽﾀ用ｸｴﾘｰ																*/
//*                                                                                             		    */
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnSetGridMemDataTotal (dqMasterData: TMQuery);
begin
	m_fUpdateRecord	:= false;

	with (dqMasterData) do
	begin
		StdCmnMemDataTotal.Append;
		StdCmnMemDataTotal.FieldByName ('nExCode'       ).AsInteger	:= GetFld ('GCode'   ).AsInteger;
// HIS0029		StdCmnMemDataTotal.FieldByName ('strAssociation').AsString  := GetFld ('RenChar' ).AsString;
        StdCmnMemDataTotal.FieldByName ('strAssociation').AsString  := GetFld ('Renso' ).AsString;      // HIS0029
		StdCmnMemDataTotal.FieldByName ('strName'       ).AsString  := GetFld ('TekiChar').AsString;
		StdCmnMemDataTotal.Post;

		m_nGridTotalRecords	:= m_nGridTotalRecords + 1;
	end;

	m_fUpdateRecord	:= true;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetParentItemsInfoEx (Integer; Integer; Integer; String)						*/
//*																											*/
//*	目的	: 摘要登録処理 現在選択されている親に対する子情報をｾｯﾄ											*/
//*																											*/
//*	戻り値	: なし,														        		                    */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 実在/合計区分 (0:実在, 1:合計, 9:体系...)										*/
//*			  nExCode		= 摘要外部ｺｰﾄﾞ																	*/
//*			  nExCodeParent	= 摘要分類ｺｰﾄﾞ(親)																*/
//*			  strName	   	= 名称																			*/
//*                                                                             		                    */
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnSetParentItemsInfoEx
				(nSumDivision: Integer; nExCode: Integer; nExCodeParent: Integer; strName: String);
var
	dqMasterData: TMQuery;
    exSumNCode  : Extended;
begin
	//	グリッドにフォーカスがある時、削除後のスクロールを防ぐ
	if	(m_fUnderConstruction3)	then
	begin
		m_fUnderConstruction3	:= false;
		Exit;
	end;

	if	(m_nProcDivision <> 1) then														// 処理区分: 1=固定摘要
		Exit;

	if	(nSumDivision = 0) then
		m_nExCodeCurrent	:= nExCodeParent
	else
		m_nExCodeCurrent	:= nExCode;

	StdCmnTab.BorderCaption := strName;
	DtlCmnTab.BorderCaption := strName;

	DtlCmnTab.Items [0].BorderCaption	:= strName;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	StdCmnMemDataExist.Active		:= false;
	StdCmnMemDataTotal.Active		:= false;
	StdCmnMemDataExist.Active		:= true;
	StdCmnMemDataTotal.Active		:= true;

	StdCmnDataSourceExist.DataSet	:= nil;
	StdCmnDataSourceTotal.DataSet	:= nil;

	m_nGridExistRecords	:= 0;
	m_nGridTotalRecords	:= 0;

	with (dqMasterData) do
	begin
		if	(m_nExCodeCurrent = 0) then													// 摘要分類体系
		begin
			Close ();

			SQL.Clear ();
            SQL.Add   ('SELECT NCode, GCode, Renso, TekiChar FROM TekiMA ');                   // HIS0029
            SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = 1 AND RDelKbn = 0 ORDER BY GCode');    // HIS0029

			Open ();

			while (not EOF) do
			begin
				fnSetGridMemDataTotal (dqMasterData);
				NEXT;
			end;
		end;

		Close ();

		SQL.Clear ();

        SQL.Add   ('SELECT tt.BasedNCode, tm.SumKbn, tm.Renso, tm.TekiChar, fi.FusenKbn, fi.FusenCmnt, tm.GCode '); // HIS0029
        SQL.Add   ('FROM   TekiTree tt, TekiMA tm LEFT OUTER JOIN MFusenInfo fi ');                        // HIS0029
        SQL.Add   ('ON     fi.MasterKbn = tm.MasterKbn AND fi.NCode = tm.NCode ');                                  // HIS0029
		SQL.Add   ('WHERE  tt.MasterKbn = 61 AND tt.SumNCode = :nExCode AND tt.MasterKbn = tm.MasterKbn AND ');     // HIS0029
		SQL.Add   ('       tt.TekiKbn = 1 AND tm.SumKbn = 0 ');                                                     // HIS0029
        SQL.Add   ('       AND tt.BasedNCode = tm.NCode AND tm.RDelKbn = 0 ');                                      // HIS0029
		SQL.Add   ('ORDER BY tm.GCode');                                                                            // HIS0029

        exSumNCode   := fnGetNCode(TBL_TEKI,1,m_nExCodeCurrent);

		ParamByName ('nExCode').AsFloat	:= exSumNCode;

		Open ();

		while (not EOF) do
		begin
			fnSetGridMemDataExist (dqMasterData);
			NEXT;
		end;

		Close ();
	end;

	StdCmnDataSourceExist.DataSet	:= StdCmnMemDataExist;
	StdCmnDataSourceTotal.DataSet	:= StdCmnMemDataTotal;

	StdCmnMemDataExist.First ();
	StdCmnMemDataTotal.First ();

	dqMasterData.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetSummaryItemsInfo ()															*/
//*																											*/
//*	目的	: 摘要登録処理 全ての固定摘要(分類は除く)情報をｾｯﾄ												*/
//*																											*/
//*	戻り値	: なし,														            		                */
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP020000f.fnSetSummaryItemsInfo ();
var
	dqMasterData: TMQuery;

begin
	StdCmnTab.BorderCaption	:= '';
	DtlCmnTab.BorderCaption := '';

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	StdCmnMemDataExist.Active	:= false;
	StdCmnMemDataTotal.Active	:= false;
	StdCmnMemDataExist.Active	:= true;
	StdCmnMemDataTotal.Active	:= true;

	StdCmnDataSourceExist.DataSet	:= nil;
	StdCmnDataSourceTotal.DataSet	:= nil;

	m_nGridExistRecords	:= 0;
	m_nGridTotalRecords	:= 0;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
        SQL.Add   ('SELECT tm.SumKbn, tm.GCode, tm.Renso, tm.TekiChar, fi.FusenKbn, fi.FusenCmnt ');                        // HIS0029
        SQL.Add   ('FROM   TekiMA tm LEFT OUTER JOIN MFusenInfo fi ');                                                // HIS0029
        SQL.Add   ('ON     fi.MasterKbn = tm.MasterKbn AND fi.NCode = tm.NCode ');                                          // HIS0029
		SQL.Add   ('WHERE  tm.MasterKbn = 61 AND tm.SumKbn = 0 AND tm.RDelKbn = 0 ORDER BY tm.GCode'); // HIS0029

		Open ();

		while (not EOF) do
		begin
			fnSetGridMemDataExist (dqMasterData);
			NEXT;
		end;

		Close ();
	end;

	StdCmnDataSourceExist.DataSet	:= StdCmnMemDataExist;
	StdCmnDataSourceTotal.DataSet	:= StdCmnMemDataTotal;

	StdCmnMemDataExist.First ();
	StdCmnMemDataTotal.First ();

	dqMasterData.Free ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetDetailScreenInfo (Integer; var Integer)										*/
//*																											*/
//*	目的	: 摘要登録処理 詳細情報を詳細画面にｾｯﾄ															*/
//*																											*/
//*	戻り値	: Boolean, (true:新規ﾚｺｰﾄﾞ, false:既存ﾚｺｰﾄﾞ)													*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode		= 摘要(分類)ｺｰﾄﾞ																*/
//*			  nSumDivision	= 摘要/分類区分	(0:固定摘要, 1:摘要分類)										*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnSetDetailScreenInfo (nExCode: Integer; nSumDivision: Integer): Boolean;
var
	dqMasterData  : TMQuery;
	fNewRecord    : Boolean;
	nWork		  : Integer;
	strDescription: String;

begin
	fNewRecord	:= true;

	if	(m_pRec^.m_pChildForm = nil) then
	begin
		Result	:= fNewRecord;
		Exit;
	end;

	m_fUnderConstruction	:= true;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
        SQL.Add   ('SELECT tm.GCode, tm.Renso, tm.TekiChar, tm.ExgKbn, tm.BunCode, tm.SwDicKbn, ');
		SQL.Add   ('       fi.FusenKbn, fi.FusenCmnt ');
		SQL.Add   ('       , tm.BusDicKbn ');  //<HIS0088> ADD  部署伝票辞書区分
        SQL.Add   ('FROM   TekiMA tm LEFT OUTER JOIN MFusenInfo fi ');
        SQL.Add   ('ON     fi.MasterKbn = tm.MasterKbn AND fi.NCode = tm.NCode ');
		SQL.Add   ('WHERE  tm.MasterKbn = 61 AND ');
        SQL.Add   ('       tm.SumKbn = :nSumDivision AND tm.GCode = :nExCode AND tm.RDelKbn = 0 ');

		ParamByName ('nSumDivision').AsInteger	:= nSumDivision;
		ParamByName ('nExCode'     ).AsInteger	:= nExCode;

		Open ();

		if	(not EOF) then
		begin
            m_bNewRecord := false;  //<HIS0088> ADD
			DtlCEdtExCd				.Value	:= GetFld ('GCode'   ).AsInteger;			// 摘要(分類)ｺｰﾄﾞ
            DtlCmnEditAssociation	.Text	:= GetFld ('Renso' ).AsString;			    // 連想 // HIS0029
			DtlCmnEditName			.Text	:= GetFld ('TekiChar').AsString;			// 摘要文字列

            chk_Busyo.Checked := GetFld ('BusDicKbn').AsInteger <> 0;   //<HIS0088> ADD  True:チェックボックスON False:チェックボックスOFF

			if	(nSumDivision = 0) then													// 摘要/分類区分: 0=固定摘要
			begin

                fnEnableToolbarButtonTag(True);

				DtlCmnEditDealDivision.Value		:= FieldByName ('ExgKbn').AsInteger;
				DtlCmnEditDealDivision.InputFlag	:= false;

				fnCheckDealDivision (FieldByName ('ExgKbn').AsInteger, strDescription);

				DtlCmnLbelDealDivisionDesc.Caption	:= strDescription;

				if	(FieldByName ('ExgKbn').AsInteger = 0) then
				begin
					DtlCmnLbelDealClassTitle.Enabled	:= false;

					DtlCmnEditDealClass.Value		:= 0;
					DtlCmnEditDealClass.InputFlag	:= true;
					DtlCmnEditDealClass.Enabled		:= false;
					DtlCmnEditDealClass.Color		:= TJNTCRP020000f (Self).Color;

					DtlCmnLbelDealClassDesc.Caption	:= '';
				end
				else
				begin
					DtlCmnLbelDealClassTitle.Enabled	:= true;

					nWork	:= FieldByName ('BunCode').AsInteger;						// 取引先分類

                    if	(m_nReferMode <> REFER) then
						DtlCmnEditDealClass.Enabled	:= true;

					DtlCmnEditDealClass.Color		:= clWindow;
					DtlCmnEditDealClass.Value		:= nWork;
					DtlCmnEditDealClass.InputFlag	:= false;

					if	((nWork >= 0) and (nWork <= 4)) then
						DtlCmnLbelDealClassDesc.Caption	:= MjsHanCopy (DtlCmnEditDealClass.SelectItems.Strings [nWork], 4, 14)
    				else
    					DtlCmnLbelDealClassDesc.Caption	:= '';
				end;

				fnSetDetailScreenAddition (nExCode, FieldByName ('SwDicKbn').AsInteger);

				m_nSelectTagKind	:= FieldByName ('FusenKbn').AsInteger;				// 付箋情報

				case (m_nSelectTagKind) of
					0:	DtlCmnImageTag.Picture	:= nil;
					1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
					2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
					3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
					4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
				end;

                if m_nSelectTagKind <> 0 then
                begin
                    DtlCmnImageTag.Visible := True;
                end
                else
                    DtlCmnImageTag.Visible := False;

				fnSetGridMemDataDetails (FieldByName ('GCode').AsInteger);

				DtlCmnPanelAddition.Visible	:= true;
// <SYNC> MOD start
//				DtlCmnPanelAddition2.Visible	:= true;	// 仕訳辞書<HIS0052> ADD

				{ 子会社では仕訳情報を非表示にする }
				if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
        	    begin
					DtlCmnPanelAddition2.Visible := false;
	            end
    	        else
        	    begin
				  	DtlCmnPanelAddition2.Visible := true;
	            end;
           	    DtlCmnPanelAddition4.Visible	:= true;
// <SYNC> MOD end
                DtlCmnPanelGrid       .Visible  := True;
                Pnl_RensoTitle        .Visible  := TRue;

//<MLXDEP>
				if (TMSeries.IsMjsLink3) then
				begin
					DtlCmnPanelAddition   .Visible	:= False;
    	    	    DtlCmnPanelAddition2  .Visible 	:= False;
        	    	DtlCmnPanelAddition4  .Visible	:= False;
	            	DtlCmnPanelGrid       .Visible  := False;
		            Pnl_RensoTitle        .Visible  := False;
				end;
//<MLXDEP>
			end
			else																		// 摘要/分類区分: 1=摘要分類
            begin
				DtlCmnPanelAddition.Visible	:= false;
				DtlCmnPanelAddition2.Visible	:= false;	// 仕訳辞書<HIS0052> ADD
                DtlCmnPanelAddition4.Visible	:= false;	// <SYNC> ADD
                DtlCmnPanelGrid       .Visible  := false;
                Pnl_RensoTitle        .Visible  := False;
                fnEnableToolbarButtonTag(False);
            end;
			fNewRecord	:= false;
        end
		else
		begin
            m_bNewRecord := True;         //<HIS0088> ADD
            chk_Busyo.Checked := false;   //<HIS0088> ADD
			fnInitializeDetailScreen (false);
            fnEnableToolbarButtonTag(False);
			fNewRecord	:= true;
		end;

		Close ();
    end;

	dqMasterData.Free ();

	m_fUnderConstruction	:= false;

	Result	:= fNewRecord;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetDtlEditTaxCodeSelectItems (Integer)											*/
//*																											*/
//*	目的	: 摘要登録処理																					*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 消費税売上/仕入区分 (1:売上, 2:仕入)												*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP020000f.fnSetDtlEditTaxCodeSelectItems (nDivision: Integer);
var
	nCount	:	Integer;
	iStart	:	Integer;
begin
	DtlCmnEditTaxCode.SelectItems.Clear ();

// <HIS0052> MOD start
//	if	MCheckBox1.Checked	then	iStart:=1	else	iStart:=0;
	if	IsBusyoDenpyo()	then	iStart:=1	else	iStart:=0;
// <HIS0052> MOD end

	case	nDivision	of
		1:	begin
				for nCount := iStart to length(m_TaxSalesItems)-1 do  //<HIS0110>
				begin
//<HIS0110> DEL St
{
					if	((m_nCompDivision <> 1) and								// 公益法人区分: 1=公益法人
						((nCount >= 14) and (nCount <= 17))) then				// 消費税ｺｰﾄﾞ80番台は除く
						Continue;
}
//<HIS0110> DEL Ed
					DtlCmnEditTaxCode.SelectItems.Add (m_TaxSalesItems [nCount].sWord);  //<HIS0110>
				end;
			end;
		2:	begin
				for nCount := iStart to  length(_TaxStockItems)-1 do
					DtlCmnEditTaxCode.SelectItems.Add (_TaxStockItems [nCount].sWord);
			end;
		3:	begin
				for nCount := iStart to  length(_TaxCommonItems)-1 do
					DtlCmnEditTaxCode.SelectItems.Add (_TaxCommonItems [nCount].sWord);
			end;
	end;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetGridTagInfo (Integer)														*/
//*																											*/
//*	目的	: 摘要登録処理											                                 		*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nTagKind	= 付箋種類 (0:なし, 1:赤, 2:緑, 3:青, 4:橙)											*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnSetGridTagInfo (nTagKind: Integer);
var
	nTagKindWork: Integer;

begin
	nTagKindWork	:= nTagKind;

	fnUpdateMasterDataTagInfo (StdCmnMemDataExist.FieldByName ('nExCode').AsInteger, nTagKindWork);
	fnUpdateGridMemDataRecord (StdCmnMemDataExist.FieldByName ('nExCode').AsInteger, nTagKindWork);
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnShowDetailScreen ()																*/
//*																											*/
//*	目的	: 摘要登録処理 詳細画面表示処理																	*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnShowDetailScreen ();
var
	cNode       : TTreeNode;
	stWorkRec   : ^TreeViewRec;
	nExCode		: Integer;
	nSumDivision: Integer;
	nCount		: Integer;
	fNewRecord	: Boolean;

begin
	m_fUnderConstruction	:= true;

	//	固定摘要ｸﾞﾘｯﾄﾞ
	if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) then
	begin
		nExCode			:= StdCmnMemDataExist.FieldByName ('nExCode').AsInteger;
		nSumDivision	:= 0;
	end
	//	摘要分類ｸﾞﾘｯﾄﾞ
	else if	(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then
	begin
		nExCode			:= StdCmnMemDataTotal.FieldByName ('nExCode').AsInteger;
		nSumDivision	:= 1;
	end
	//	ﾂﾘｰﾋﾞｭｰ
	else
	begin
		cNode		:= CmnTreeView.Selected;
		stWorkRec	:= cNode.Data;

		nExCode			:= stWorkRec^.nExCode;
		nSumDivision	:= stWorkRec^.nDivision;
	end;

	fNewRecord	:= fnSetDetailScreenInfo (nExCode, nSumDivision);

	case (nSumDivision) of
		0:	begin
				DtlCLblExCdTitle.Caption	:= '固定摘要コード';

				DtlCmnTab.Items [0].Selected	:= true;
				DtlCmnTab.Items [1].Selected	:= false;
			end;
		1:	begin
				DtlCLblExCdTitle.Caption	:= '摘要分類コード';

				DtlCmnTab.Items [1].Selected	:= true;
				DtlCmnTab.Items [0].Selected	:= false;
			end;
	end;

	if	(not fNewRecord) then
	begin
		if	(Screen.ActiveControl.Name = StdCmnGridExist.Name) or		//	固定摘要ｸﾞﾘｯﾄﾞ
			(Screen.ActiveControl.Name = StdCmnGridTotal.Name) then		//	摘要分類ｸﾞﾘｯﾄﾞ
		begin
			for nCount := 1 to CmnTreeView.Items.Count do
			begin
				stWorkRec   := CmnTreeView.Items [nCount - 1].Data;

				if	((stWorkRec^.nExCode   = nExCode) and
					 (stWorkRec^.nDivision = nSumDivision)) then
				begin
					CmnTreeView.Items [nCount - 1].Selected	:= true;
					Break;
				end;
			end;
		end;
	end;

	StdCmnClientPanel.Visible	:= false;
	DtlCmnClientPanel.Visible	:= true;

	m_fUnderConstruction	:= false;
	m_fChangeDetails		:= false;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnUpdateTreeViewItems (Integer; Integer; String; Integer)							*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ更新処理 (固定摘要/科目連想 共通)									*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 摘要/分類区分 (0:摘要, 1:分類)												*/
//*			  nExCode		= 摘要(分類)ｺｰﾄﾞ																*/
//*           strName		= 摘要文字列																	*/
//*           nAccessMethod	= ｱｸｾｽ方法      (ACCESS_TREE_ADD:追加, ACCESS_TREE_UPDATE:変更...)				*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnUpdateTreeViewItems (nSumDivision: Integer; nExCode: Integer; strName: String; nAccessMethod: Integer);
var
	cNode       : TTreeNode;
	cNodeWork	: TTreeNode;
	cNodeTarget	: TTreeNode;
	stWorkRec   : ^TreeViewRec;
	stWorkRecAdd: ^TreeViewRec;
	nCount      : Integer;
	nCmpExCode	: Integer;
	nCmpDivision: Integer;
	strItemName	: String;
	strFormat	: String;					// <HIS0058> ADD
begin
	nCmpExCode		:= nExCode;
	nCmpDivision	:= nSumDivision;

// <HIS0058> ADD start
	if nSumDivision = 0 then				// 摘要の場合
	begin
		strFormat := '%' + IntToStr(m_iTekiDigit) + 'd';
	end
	else									// 科目連想の場合
	begin
		strFormat := '%6d';
	end;
// <HIS0058> ADD end
	case (nAccessMethod) of
		ACCESS_TREE_ADD,
		ACCESS_TREE_INSERT:
			begin
				if	(nSumDivision = 1) then
				begin
					nCmpExCode		:= 0;
					nCmpDivision	:= 9;
				end
				else
				begin
					nCmpExCode	:= m_nExCodeCurrent;

					if	(nCmpExCode = 0) then
						nCmpDivision	:= 9
					else
					begin
						if	(m_nProcDivision = 1) then
							nCmpDivision	:= 1
						else
							nCmpDivision	:= DIVISION_SUBJECT;
					end;
				end;
			end;

		ACCESS_TREE_UPDATE,
		ACCESS_TREE_DELETE:
			begin
				nCmpExCode		:= nExCode;
				nCmpDivision	:= nSumDivision;
			end;
	end;

	for nCount := 1 to CmnTreeView.Items.Count do
	begin
		stWorkRec	:= CmnTreeView.Items [nCount - 1].Data;

		if	((stWorkRec^.nExCode   = nCmpExCode) and
			 (stWorkRec^.nDivision = nCmpDivision)) then
		begin
			cNode		:= CmnTreeView.Items [nCount - 1];
			cNodeTarget	:= cNode;

			if	((nAccessMethod = ACCESS_TREE_ADD) or (nAccessMethod = ACCESS_TREE_INSERT)) then
			begin
// <HIS0058> MOD start
//				strItemName	:= Format ('%6d', [nExCode]);
				strItemName	:= Format (strFormat, [nExCode]);
// <HIS0058> MOD end
				strItemName	:= strItemName + ' ' + strName;

				New (stWorkRecAdd);

				stWorkRecAdd^.nDivision	:= nSumDivision;
				stWorkRecAdd^.nExCode	:= nExCode;
				stWorkRecAdd^.strName	:= strItemName;

				cNodeWork	:= cNode.GetFirstChild ();									// 先頭の子ﾉｰﾄﾞ取得

				while (true) do
				begin
					if  (cNodeWork = nil) then
						Break;

					stWorkRec	:= cNodeWork.Data;										// 子ﾉｰﾄﾞ･ﾃﾞｰﾀ取得

					if	((stWorkRec^.nExCode   > nExCode) and
						 (stWorkRec^.nDivision = nSumDivision)) then
						Break;

					if	((nSumDivision = 1) and (stWorkRec^.nDivision = 0)) then
						Break;

					cNodeWork	:= cNodeWork.GetNextSibling ();							// 次の子ﾉｰﾄﾞ取得
				end;

				if	(cNodeWork = nil) then
					cNode	:= CmnTreeView.Items.AddChildObject (cNode, stWorkRecAdd^.strName, stWorkRecAdd)
				else
					cNode	:= CmnTreeView.Items.InsertObject (cNodeWork, stWorkRecAdd^.strName, stWorkRecAdd);

				if	(nSumDivision = 0) then
				begin
					cNode.ImageIndex	:= 1;
					cNode.SelectedIndex	:= 3;
				end
				else
				begin
					cNode.ImageIndex	:= 0;
					cNode.SelectedIndex	:= 2;

					if	(nAccessMethod = ACCESS_TREE_INSERT) then
						fnCreateTreeViewItems02 (cNode);
				end;

				cNodeTarget.Expand (true);
			end;

			if	(nAccessMethod = ACCESS_TREE_UPDATE) then								// ｱｲﾃﾑ変更
			begin
				stWorkRec	:= cNode.Data;
// <HIS0058> MOD start
//				strItemName	:= Format ('%6d', [nExCode]);
				strItemName	:= Format (strFormat, [nExCode]);
// <HIS0058> MOD end
				strItemName	:= strItemName + ' ' + strName;

				stWorkRec^.strName	:= strItemName;
				cNode     .Text		:= strItemName;

				fnUpdateParentItemsInfoCaption (stWorkRec^.nExCode, stWorkRec^.strName);
			end;

			if	(nAccessMethod = ACCESS_TREE_DELETE) then								// ｱｲﾃﾑ削除
				cNode.Delete;
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnUpdateParentItemsInfoCaption (Integer; String)									*/
//*																											*/
//*	目的	: 摘要登録処理 現在選択されている親情報を更新													*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode	= 摘要分類ｺｰﾄﾞ																		*/
//*			  strName	= 摘要文字列																		*/
//*                                                                         		                        */
//***********************************************************************************************************/
procedure   TJNTCRP020000f.fnUpdateParentItemsInfoCaption (nExCode: Integer; strName: String);
var
	strCaption: String;
	strFormat	: String;					// <HIS0058> ADD
begin
	if	(m_nExCodeCurrent <> nExCode) then
		Exit;

// <HIS0058> MOD start
//	strCaption	:= Format ('%6d', [nExCode]);
											// 最大桁数に合わせる
	strFormat := '%' + IntToStr(m_iTekiDigit) + 'd';
	strCaption	:= Format (strFormat, [nExCode]);
// <HIS0058> MOD end
	strCaption	:= strCaption + ' ' + strName;

	StdCmnTab.BorderCaption := strCaption;
	DtlCmnTab.BorderCaption := strCaption;

	DtlCmnTab.Items [0].BorderCaption	:= strCaption;
end;

{
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnUpdateGridMemDataRecord (Integer; Integer)										*/
//*																											*/
//*	目的	: 摘要登録処理 																					*/
//*																											*/
//*	戻り値	: なし,																                            */
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode	= 固定摘要ｺｰﾄﾞ																		*/
//*			  nTagKind	= 付箋種類 (0:なし, 1:赤, 2:緑...)													*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnUpdateGridMemDataRecord (nExCode: Integer; nTagKind: Integer);
begin
	if	(StdCmnClientPanelExist.Visible and StdCmnTab.Items [0].Selected) then
	begin
		StdCmnMemDataExist.Edit ();
		StdCmnMemDataExist.FieldByName ('grTag').AsSign (fnGetTagColorBitmap (nTagKind));
		StdCmnMemDataExist.Post ();
	end;
end;
}
//***************************************************************************************************/
//*                                                                                                 */
//*	関数	: TJNTCRP020000f.fnUpdateGridMemDataRecord (Integer; String; Integer)						*/
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
procedure	TJNTCRP020000f.fnUpdateGridMemDataRecord (nExCode: Integer; nTagKind: Integer);
var
	cMemData	 : TdxMemData;
	strExCodeWork: String;
	strFormat	 : String;
	nRetRecNo	 : Integer;

begin
	strExCodeWork	:= IntToStr(nExCode);
{
	if	(m_CodeAttr <= 1) then
	begin
		case (m_CodeAttr) of
			0:	strFormat	:= '%'  + IntToStr (m_CodeDigit) + 'd';
			1:	strFormat	:= '%.' + IntToStr (m_CodeDigit) + 'd';
		end;

		strExCodeWork	:= Format (strFormat, [StrToInt64 (Trim (strExCodeWork))]);
	end;
}

// <HIS0058> MOD start
//    strFormat	:= '%'  + IntToStr (6) + 'd';
    strFormat	:= '%'  + IntToStr (m_iTekiDigit) + 'd';
// <HIS0058> MOD end
	strExCodeWork	:= Format (strFormat, [StrToInt64 (Trim (strExCodeWork))]);

	cMemData	:= StdCmnMemDataExist;

	nRetRecNo	:= cMemData.GetRecNoByFieldValue (strExCodeWork, 'nExCode');

	if	(nRetRecNo > 0) then
	begin
		if	(nRetRecNo = 1) then
			cMemData.First ()
		else
			cMemData.RecNo	:= nRetRecNo;

		cMemData.Edit ();
		cMemData.FieldByName ('grTag').AsSign (fnGetTagColorBitmap (nTagKind));
		cMemData.Post ();
	end;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnOutputConfirmationMessage (Integer)												*/
//*																											*/
//*	目的	: 摘要登録処理 終了･取消時, 確認ﾒｯｾｰｼﾞ出力処理													*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 処理区分																			*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnOutputConfirmationMessage (nDivision: Integer): Integer;
var
	stMessageRec: TMJSMsgRec;
	nMessageID	: Integer;
	nReturn		: Integer;

begin
	if	(not m_fChangeDetails) then
	begin
		Result	:= CONFIRM_THROUGH;
		Exit;
	end;

	nMessageID	:= 1;

	if	(nDivision = CONFIRM_EXIT) then													// 終了ﾎﾞﾀﾝ
	begin
		if	(DtlCEdtExCd.Value = 0) then
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
//*	関数	: TJNTCRP020000f.fnOutputDBErrorMessage ()															*/
//*																											*/
//*	目的	: 摘要登録処理 DBｴﾗｰﾒｯｾｰｼﾞ出力処理																*/
//*																											*/
//*	戻り値	: なし,                         																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 処理区分																			*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnOutputDBErrorMessage ();
begin
	if	(m_nDBErrorCode <> 0) then
	begin
		case (m_nDBErrorCode) of
			1:	m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 0, 1);
			2:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 5);
					m_cErrorMsgRec.sMsg	:= '摘要残高管理を行っているため削除できません。';
				end;
			3:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '子供が存在するため削除' + m_cErrorMsgRec.sMsg;
				end;
			4:	begin
					m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 30, 18);
					m_cErrorMsgRec.sMsg	:= '仕訳が存在するため削除' + m_cErrorMsgRec.sMsg;
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
			//<HIS0060> ADD start
	        -193, -196:
	        begin
    	        // 重複ｴﾗｰ
        	    m_cComArea.m_MsgStd.GetMsg ( m_cErrorMsgRec, 10000, 10017 );
	        end;
    	    -210:
        	begin
            	// ﾛｯｸｴﾗｰ
	            m_cComArea.m_MsgStd.GetMsg ( m_cErrorMsgRec, 10000, 10016 );
        	end;
			//<HIS0060> ADD end
		end;
	end;

	MJSMessageBoxEx (Self,m_cErrorMsgRec.sMsg, m_pRec^.m_ProgramName, m_cErrorMsgRec.icontype,
						m_cErrorMsgRec.btntype, m_cErrorMsgRec.btndef, m_cErrorMsgRec.LogType);

	m_nDBErrorCode	:= 0;
end;

procedure	TJNTCRP020000f.fnDtlCmnPopupMenuTagOnClick (Sender: TObject);
var
	cMenuItem	: TMenuItem;
	nTagKindWork: Integer;

begin
	cMenuItem	:= Sender as TMenuItem;

	if		(cMenuItem.Name = DtlCmnPopupMenuTagOff.Name) then		nTagKindWork	:= 0
	else if	(cMenuItem.Name = DtlCmnPopupMenuTag01.Name	) then		nTagKindWork	:= 1
	else if	(cMenuItem.Name = DtlCmnPopupMenuTag02.Name	) then		nTagKindWork	:= 3
	else if	(cMenuItem.Name = DtlCmnPopupMenuTag03.Name	) then		nTagKindWork	:= 2
	else if	(cMenuItem.Name = DtlCmnPopupMenuTag04.Name	) then		nTagKindWork	:= 4
	else															nTagKindWork	:= 0;

	case (nTagKindWork) of
		0:	DtlCmnImageTag.Picture	:= nil;
		1:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag01.Bitmap);
		2:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag03.Bitmap);
		3:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag02.Bitmap);
		4:	DtlCmnImageTag.Picture	:= TPicture (DtlCmnPopupMenuTag04.Bitmap);
	end;

    if nTagKindWork = 0 then
        DtlCmnImageTag.Visible := False
    else
        DtlCmnImageTag.Visible := True;


	fnUpdateMasterDataTagInfo (DtlCEdtExCd.AsInteger, nTagKindWork);
	fnUpdateGridMemDataRecord (DtlCEdtExCd.AsInteger, nTagKindWork);

{
	if	(nTagKindWork <> m_nSelectTagKind) then
		fnOnChange (Sender);
}
	m_nSelectTagKind	:= nTagKindWork;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSelectTreeViewItem (Integer; Integer)											*/
//*																											*/
//*	目的	: 摘要登録処理 ﾂﾘｰﾋﾞｭｰ･ｱｲﾃﾑ更新処理																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSumDivision	= 摘要/分類区分 (0:摘要, 1:分類)												*/
//*			  nExCode		= 摘要(分類)ｺｰﾄﾞ																*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnSelectTreeViewItem (nSumDivision: Integer; nExCode: Integer);
var
	stRecWork: ^TreeViewRec;
	nCount   : Integer;

begin
	stRecWork	:= CmnTreeView.Selected.Data;

	if	((stRecWork^.nDivision = nSumDivision) and (stRecWork^.nExCode = nExCode)) then
		Exit;

	for nCount := 1 to CmnTreeView.Items.Count do
	begin
		stRecWork	:= CmnTreeView.Items [nCount - 1].Data;

		if	((stRecWork^.nDivision = nSumDivision) and (stRecWork^.nExCode   = nExCode)) then
		begin
			CmnTreeView.Items [nCount - 1].Selected	:= true;
			Break;
		end;
	end;
end;


procedure	TJNTCRP020000f.fnCmnComboBoxInstructionOnEnter (Sender: TObject);
begin
//	CmnToolbarButtonDetail.Enabled	:= false;
//	CmnToolbarButtonDelete.Enabled	:= false;

    fnEnableToolbarButtonTag(False);

	m_cACControl	:= Screen.ActiveControl;
	m_fIgnoreProc	:= false;

	CmnToolbarButtonDetail.Enabled	:= false;
	CmnToolbarButtonDelete.Enabled	:= false;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnGetMinimumExCode ()																*/
//*																											*/
//*	目的	: 摘要登録処理 最小摘要ｺｰﾄﾞ取得																	*/
//*																											*/
//*	戻り値	: Integer, (最小摘要ｺｰﾄﾞ)																		*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnGetMinimumExCode (): Integer;
var
	dqMasterData: TMQuery;
	nMinExCode	: Integer;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	nMinExCode	:= 1;

	with (dqMasterData) do
	begin
		while (true) do
		begin
			Close ();

			SQL.Clear ();
            SQL.Add   ('SELECT GCode FROM TekiMA ');                                                                 // HIS0029
            SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = 0 AND GCode = :nExCode AND RDelKbn = 0 '); // HIS0029

			ParamByName ('nExCode').AsInteger	:= nMinExCode;

			Open ();

			if  (EOF) then
				Break;

			nMinExCode	:= nMinExCode + 1;
		end;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= nMinExCode;
end;


procedure	TJNTCRP020000f.fnDtlCmnFunctionOnEnter (Sender: TObject);
begin
	if	(DtlCmnTab.Items [1].Selected) then
	begin
		if	(Trunc (DtlCEdtExCd.Value) = 0) then
		begin
			Beep ();

			m_cACControl	:= DtlCEdtExCd;
			m_cACControl.SetFocus ();

			Abort;
		end;
	end;
	m_cACControl := Screen.ActiveControl;	// <HIS0059> ADD
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: fnEnableToolbarButtonTag (fEnabled: Boolean)																*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnEnableToolbarButtonTag (fEnabled: Boolean);
begin

    if m_cJNTArea.IsFusen then
    begin
        CmnToolbarButtonTag.Enabled := fEnabled;

	    if	(fEnabled) then
            CmnToolbarButtonTag.ImageIndex := m_FusenClrIdx
    	else
            CmnToolbarButtonTag.ImageIndex := 4;    // 灰色
    end else
    begin
        CmnToolbarButtonTag.ImageIndex := 4;    // 灰色
        CmnToolbarButtonTag.Enabled := False;
    end;


end;
//***********************************************************************************************************/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnCmnToolbarDropDownMenuItemOnClick (Sender: TObject);
begin
	CmnToolbarButtonTag.ImageIndex	:= (Sender as TMenuItem).ImageIndex;
    m_FusenClrIdx := CmnToolbarButtonTag.ImageIndex;

end;


procedure	TJNTCRP020000f.fnStdCmnGridExistOnGetNodeDragText (Sender: TObject;
											Node: TdxTreeListNode; Column: TdxTreeListColumn; var AText: String);
begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	m_bLog	then	MLabel27.caption:=MLabel27.caption+'-6';

	if	(StdCmnGridExist.SelectedCount > 1) then
		AText	:= '複数行選択中...'
	else
		AText	:= StdCmnGridExist.Columns [3].Field.Text;
end;


procedure	TJNTCRP020000f.fnStdCmnGridExistOnKeyPress (Sender: TObject; var Key: Char);
begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	m_bLog	then	MLabel27.caption:=MLabel27.caption+'-7';

	if	(StdCmnGridExist.FocusedColumn = 1) then
	begin
		if	(((Key < '0') or (Key > '9')) and
//			  (Key <> #8) and (Key <> #27) and (Key <> #9)) then						// #8=BackSpace, #27=Esc, #9=Tab
		//HIS0016
  		    (Key <> #8) and (Key <> #9) and (Key <> #13) and (Key <> #27)) then
		begin
			Beep ();
			Abort;
		end;
	end;
end;


procedure	TJNTCRP020000f.fnStdCmnGridTotalOnKeyPress (Sender: TObject; var Key: Char);
begin
	if	(StdCmnGridTotal.FocusedColumn = 0) then
	begin
		if	(((Key < '0') or (Key > '9')) and
//			  (Key <> #8) and (Key <> #27) and (Key <> #9)) then						// #8=BackSpace, #27=Esc, #9=Tab

		//HIS0016
		    (Key <> #8) and (Key <> #9) and (Key <> #13) and (Key <> #27)) then
		begin
			Beep ();
			Abort;
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnStdCmnGridExistOnColumnClick (TObject; TdxDBTreeListColumn)						*/
//*																											*/
//*	目的	: 摘要登録処理 OnColumnClick ｲﾍﾞﾝﾄ																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnStdCmnGridExistOnColumnClick (Sender: TObject; Column: TdxDBTreeListColumn);
begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
	if	m_bLog	then	MLabel27.caption:=MLabel27.caption+'-8';

	fnSortGridRecords (0, Column);
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnStdCmnGridTotalOnColumnClick (TObject; TdxDBTreeListColumn)						*/
//*																											*/
//*	目的	: 摘要登録処理 OnColumnClick ｲﾍﾞﾝﾄ																*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnStdCmnGridTotalOnColumnClick (Sender: TObject; Column: TdxDBTreeListColumn);
begin
	fnSortGridRecords (1, Column);
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSortGridRecords (Integer; TdxDBTreeListColumn)									*/
//*																											*/
//*	目的	: 摘要登録処理																					*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nDivision	= 処理区分   (0:固定摘要, 1:摘要分類)												*/
//*			  cColumn	= ｿｰﾄ対象ｶﾗﾑ (ｺｰﾄﾞ/連想)															*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnSortGridRecords (nDivision: Integer; cColumn: TdxDBTreeListColumn);
var
	cMemData: TdxMemData;

begin
	if	(nDivision = 0) then												// 処理区分: 0=固定摘要
	begin
		if	((cColumn.FieldName = StdCmnGridExistTag .FieldName) or			// 付箋
			 (cColumn.FieldName = StdCmnGridExistName.FieldName)) then		// 摘要
			Exit;															// 対象外

		if	(cColumn.FieldName = StdCmnGridExistCode.FieldName) then
			StdCmnGridExistAssociation.Sorted	:= csNone
		else
			StdCmnGridExistCode       .Sorted	:= csNone;

		cMemData	:= StdCmnMemDataExist;
	end
	else																	// 処理区分: 1=摘要分類
	begin
		if	(cColumn.FieldName = StdCmnGridTotalName.FieldName) then		// 摘要
			Exit;															// 対象外

		if	(cColumn.FieldName = StdCmnGridTotalCode.FieldName) then
			StdCmnGridTotalAssociation.Sorted	:= csNone
		else
			StdCmnGridTotalCode       .Sorted	:= csNone;

		cMemData	:= StdCmnMemDataTotal;
	end;

	cMemData.SortedField	:= cColumn.FieldName;

	if	((cColumn.Sorted = csNone) or (cColumn.Sorted = csDown)) then
	begin
		cColumn .Sorted			:= csUp;
		cMemData.SortOptions	:= [];
	end
	else
	begin
		cColumn .Sorted			:= csDown;
		cMemData.SortOptions	:= [soDesc];
	end;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetGridMemDataDetails (Integer)													*/
//*																											*/
//*	目的	: 摘要登録処理																					*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode	= 固定摘要ｺｰﾄﾞ																		*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnSetGridMemDataDetails (nExCode: Integer);
var
	dqMasterData: TMQuery;
    exBasedNCode : Extended;
begin
	DtlCmnMemData.Active	:= false;
	DtlCmnMemData.Active	:= true;

	DtlCmnMemDataControl.Open ();

	if	(nExCode = 0) then
		Exit;																			// 以下, 未処理

	m_fUnderConstruction2	:= true;

	DtlCmnDataSource.DataSet	:= nil;

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT km.GCode, km.SimpleName ');
        SQL.Add   ('FROM   TekiTree tt LEFT OUTER JOIN KmkMA km ');

        SQL.Add   ('ON     tt.SumNCode = km.NCode AND km.MasterKbn = 1 AND km.SumKbn = 0 AND km.RDelKbn = 0 ');
        SQL.Add   ('WHERE  tt.MasterKbn = 61 AND tt.TekiKbn = 2 AND tt.BasedNCode = :nExCode ORDER BY tt.SumNCode');


        exBasedNCode := fnGetNCode(TBL_TEKI,0,nExCode);
		ParamByName ('nExCode').AsFloat	:= exBasedNCode;


		Open ();

		while (not EOF) do
		begin
			if	(FieldByName ('GCode').AsInteger <> 0) then
			begin
				DtlCmnMemData.Append ();

				DtlCmnMemData.FieldByName ('nExCode'       ).AsInteger	:= FieldByName ('GCode'     ).AsInteger;
				DtlCmnMemData.FieldByName ('strSubjectDesc').AsString	:= FieldByName ('SimpleName').AsString;
				DtlCmnMemData.FieldByName ('nDivisionData' ).AsInteger	:= fnGetControlDivision (
																		FieldByName ('GCode').AsInteger, nExCode);

				DtlCmnMemData.Post ();
			end;

//			NEXT;;
			NEXT;							// <HIS0052> MOD
		end;
	end;

	DtlCmnDataSource.DataSet	:= DtlCmnMemData;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	m_fUnderConstruction2	:= false;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnGridOnEnter (TObject)														*/
//*																											*/
//*	目的	: 摘要登録処理 科目連想ｸﾞﾘｯﾄﾞ OnEnter ｲﾍﾞﾝﾄ														*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnGridOnEnter (Sender: TObject);
begin
	if	(DtlCmnGrid.FocusedColumn <> 1) then
		DtlCmnGrid.FocusedColumn	:= 1;

	m_fIgnoreDtlCmnGrid	:= true;
	m_cACControl := Screen.ActiveControl;	// <HIS0059> ADD
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnGridOnBeforeChangeColumn (TObject; TdxTreeListNode; Integer...)			*/
//*																											*/
//*	目的	: 摘要登録処理 科目連想ｸﾞﾘｯﾄﾞ OnBeforeChangeColumn ｲﾍﾞﾝﾄ										*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnGridOnBeforeChangeColumn (Sender: TObject; Node: TdxTreeListNode;
							Column: Integer; NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
	cFieldWork	  : TField;
    strDescription: String;

begin

// HIS0072 ADD start
                         	// Browseの場合はBeforeChangeColumnを回避
    if (DtlCmnMemData.State = dsBrowse) then
    begin
    	Exit;
    end;
// HIS0072 ADD end

	if	(m_fUnderConstruction2) then
		Exit;


	if	(Column = 1) then																// 連想科目ｺｰﾄﾞ
	begin
		with (DtlCmnDataSource.DataSet) do
		begin
			cFieldWork	:= FieldByName ('nExCode');

			if	(not DtlCmnGrid.Columns [1].ReadOnly) then
			begin
				if	(not fnCheckSubjectCodeAss (Trunc (cFieldWork.AsInteger), strDescription)) then
				begin
					Beep ();

					cFieldWork.FocusControl ();


					Abort;

				end
				else
				begin
					DtlCmnMemData.Edit ();
					DtlCmnMemData.FieldByName ('strSubjectDesc').AsString	:= strDescription;
					DtlCmnMemData.FieldByName ('nDivisionData' ).AsInteger	:= fnGetControlDivision (
													Trunc (cFieldWork.AsInteger), Trunc (DtlCEdtExCd.Value));
					DtlCmnMemData.Post ();
				end;
			end;
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnGridOnChangeNodeEx (TObject)												*/
//*																											*/
//*	目的	: 摘要登録処理 科目連想ｸﾞﾘｯﾄﾞ OnChangeNodeEx ｲﾍﾞﾝﾄ												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnGridOnChangeNodeEx (Sender: TObject);
begin
//<KEY>	if	(DtlCmnGrid.DataSource.DataSet.FieldByName ('nExCode').IsNull) then
		DtlCmnGrid.FocusedColumn	:= 1;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnGridOnKeyDown (TObject; Word; TShiftState)								*/
//*																											*/
//*	目的	: 摘要登録処理 科目連想ｸﾞﾘｯﾄﾞ OnKeyDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnGridOnKeyDown (Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(DtlCmnGrid.FocusedColumn = 1) then					// 連想科目ｺｰﾄﾞ
	begin
		if	((Key = VK_DELETE) and DtlCmnGrid.Columns [1].ReadOnly) then
		begin
			if	(not DtlCmnMemData.IsEmpty) then
				DtlCmnMemData.Delete ();
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnGridOnMouseDown (TObject; TMouseButton; TShiftState; Integer; Integer)	*/
//*																											*/
//*	目的	: 摘要登録処理 科目連想ｸﾞﾘｯﾄﾞ OnMouseDown ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnGridOnMouseDown (Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	cFieldWork: TField;

begin
	if	((DtlCmnGrid.FocusedColumn = 2) or					// ﾌｫｰｶｽ位置: 1=連想科目名称
		 (DtlCmnGrid.FocusedColumn = 4)) then				// ﾌｫｰｶｽ位置: 3=摘要管理記述
	begin
		if	(DtlCmnGrid.FocusedColumn = 2) then
			cFieldWork	:= DtlCmnDataSource.DataSet.FieldByName ('nExCode')
		else
			cFieldWork	:= DtlCmnDataSource.DataSet.FieldByName ('nCtrlDivision');

		cFieldWork.FocusControl ();

		Abort;
		Exit;
	end;
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnMemDataBeforePost (TDataSet)												*/
//*																											*/
//*	目的	: 摘要登録処理 MemData BeforePost ｲﾍﾞﾝﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnMemDataBeforePost (DataSet: TDataSet);
var
	cFieldWork	  : TField;
	strDescription: String;

begin
	if	(m_fUnderConstruction2) then
		Exit;

	with (DataSet) do                      
	begin
		cFieldWork	:= FieldByName ('nExCode');

		if	(DtlCmnMemData.State in [dsInsert]) then
		begin

			if	(not fnCheckSubjectCodeAss (Trunc (cFieldWork.AsInteger), strDescription)) then
			begin
				Beep  ();
				cFieldWork.FocusControl ();
				Abort;
// HIS0072 MOD start
//			end;
			end
            else  							// ﾃﾞｰﾀが存在する場合はｸﾞﾘｯﾄﾞに名称および摘要残高を表示する
            begin
            	DtlCmnMemData.Edit ();
				DtlCmnMemData.FieldByName ('strSubjectDesc').AsString  := strDescription;
				DtlCmnMemData.FieldByName ('nDivisionData' ).AsInteger := fnGetControlDivision (
													Trunc (cFieldWork.AsInteger), Trunc (DtlCEdtExCd.Value));
            end;
// HIS0072 MOD end
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnDataSourceOnDataChange (TObject; TField)									*/
//*																											*/
//*	目的	: 摘要登録処理 DataSource OnDataChange ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnDataSourceOnDataChange (Sender: TObject; Field: TField);
begin
	if	(DtlCmnMemData.Active and (DtlCmnDataSource.DataSet <> nil)) then
	begin
		if	(DtlCmnGrid.DataSource.DataSet.RecordCount = 0) then
		begin
			DtlCmnGrid.Columns [1].ReadOnly			:= false;
			DtlCmnGrid.Columns [1].DisableEditor	:= false;
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnDataSourceOnStateChange (TObject)											*/
//*																											*/
//*	目的	: 摘要登録処理 DataSource OnStateChange ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnDataSourceOnStateChange (Sender: TObject);
begin
	if	(DtlCmnMemData.State in [dsInsert]) then
	begin
		DtlCmnGrid.Columns [1].ReadOnly			:= false;
		DtlCmnGrid.Columns [1].DisableEditor	:= false;
	end
	else
	begin
		DtlCmnGrid.Columns [1].ReadOnly			:= true;
//<KEY>		DtlCmnGrid.Columns [1].DisableEditor	:= true;
		DtlCmnGrid.Columns [1].DisableEditor	:= true;   //<HIS0102> ADD
	end;

	if	(DtlCmnMemData.Active and (DtlCmnDataSource.DataSet <> nil)) then
	begin
		if	(DtlCmnGrid.DataSource.DataSet.RecordCount = 0) then
		begin
			DtlCmnGrid.Columns [1].ReadOnly			:= false;
			DtlCmnGrid.Columns [1].DisableEditor	:= false;
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnCheckSubjectCodeAss (Integer; var String)										*/
//*																											*/
//*	目的	: 摘要登録処理 連想科目ｺｰﾄﾞ ﾁｪｯｸ処理															*/
//*																											*/
//*	戻り値	: Boolean, (true:ﾁｪｯｸOK, false:ﾁｪｯｸNG)															*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSubjectCode		= 連想科目ｺｰﾄﾞ																*/
//*			  strDescription	= 連想科目名称																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnCheckSubjectCodeAss (nSubjectCode: Integer; var strDescription: String): Boolean;
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
		SQL.Add   ('WHERE  MasterKbn = 1 AND SumKbn = 0 AND RDelKbn = 0 AND GCode = :nSubjectCode');

		ParamByName ('nSubjectCode').AsInteger	:= nSubjectCode;

		Open ();

		if	(EOF) then
		begin
			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= false;
			Exit;
		end;

		strDescription	:= FieldByName ('SimpleName').AsString;
	end;

	dqMasterData.Close  ();
	dqMasterData.Free	();

	Result	:= true;																	// ﾁｪｯｸOK
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnGetControlDivision (Integer; Integer)											*/
//*																											*/
//*	目的	: 摘要登録処理 摘要残高管理区分 取得処理														*/
//*																											*/
//*	戻り値	: Integer, (-1:ｴﾗｰ, 0:管理なし, 1:管理あり)														*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSubjectCode	= 連想科目ｺｰﾄﾞ																	*/
//*			  nExCode		= 固定摘要ｺｰﾄﾞ																	*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnGetControlDivision (nSubjectCode: Integer; nExCode: Integer): Integer;
var
	dqMasterData : TMQuery;
	nCtrlDivision: Integer;

    nSubjectNCode: Extended;
    nExNCode     : Extended;

begin

	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
//		SQL.Add   ('SELECT NMonth FROM "MJSDBMASTER"."SumSM" ');
//		SQL.Add   ('WHERE  NMonth = 0 AND MasterKbn = 0 AND BmnCode = '''' AND KmkCode = :nSubjectCode AND ');
//		SQL.Add   ('       HojyoKbn = 61 AND TekiCode = :nExCode AND SumKbn = 1 AND AddKbn = 0');

		SQL.Add   ('SELECT NMonth FROM SumSM ');
		SQL.Add   (' WHERE  NMonth = 0 ');
        SQL.Add   (' AND MasterKbn = 0 ');
        SQL.Add   (' AND BmnNCode = 0 ');
        SQL.Add   (' AND KmkNCode = :nSubjectCode ');
		SQL.Add   (' AND HojyoKbn = 61 ');
        SQL.Add   (' AND TekiNCode = :nExCode ');
        SQL.Add   (' AND SumKbn = 1 ');
        SQL.Add   (' AND AddKbn = 0 ');

        nSubjectNCode   := fnGetNCode(TBL_KAMOK,0,nSubjectCode,0);
        nExNCode        := fnGetNCode(TBL_TEKI,0,nExCode,0);

		ParamByName ('nSubjectCode').AsFloat	:= nSubjectNCode;
		ParamByName ('nExCode'     ).AsFloat	:= nExNCode;

//		Open ();

		if	(not Open ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			Close ();
			Free  ();
			Result	:= 0;
			Exit;
		end;

		if	(EOF) then
			nCtrlDivision	:= 0
		else
			nCtrlDivision	:= 1;
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= nCtrlDivision;															// 摘要残高管理区分

//    Result := 0;

end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetControlDivision (Integer; Integer; Integer)									*/
//*																											*/
//*	目的	: 摘要登録処理 摘要残高管理区分 ｾｯﾄ処理															*/
//*																											*/
//*	戻り値	: Boolean, (true:正常終了, false:異常終了)														*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nSubjectCode	= 連想科目ｺｰﾄﾞ																	*/
//*			  nExCode		= 固定摘要ｺｰﾄﾞ																	*/
//*			  nDivision		= 摘要残高管理区分 (0:なし, 1:あり)												*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnSetControlDivision (nSubjectCode: Integer; nExCode: Integer; nDivision: Integer): Boolean;
var
	dqMasterData: TMQuery;
	nSumDivision: Integer;

    fSubjectNCode : Extended;
    fExNCode      : Extended;

begin

	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始
    dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

    fSubjectNCode := fnGetNCode(TBL_KAMOK,0,nSubjectCode,0);
    fExNCode      := fnGetNCode(TBL_TEKI,0,nExCode,0);


	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT SumKbn FROM "MJSDBMASTER"."SumSM" ');
//		SQL.Add   ('WHERE  NMonth = 0 AND MasterKbn = 0 AND BmnCode = '''' AND KmkCode = :nSubjectCode AND ');
//		SQL.Add   ('       HojyoKbn = 61 AND HojyoCode = '''' AND TekiCode = :nExCode');

		SQL.Add   ('WHERE  NMonth = 0 ');
        SQL.Add   ('AND MasterKbn = 0 ');
        SQL.Add   ('AND Isnull(BmnNCode,0) = 0 ');
        SQL.Add   ('AND KmkNCode = :nSubjectCode ');
		SQL.Add   ('AND HojyoKbn = 61 ');
        SQL.Add   ('AND Isnull(HojyoNCode,0) = 0 ');
        SQL.Add   ('AND TekiNCode = :nExCode ');

		ParamByName ('nSubjectCode').AsFloat	:= fSubjectNCode;
		ParamByName ('nExCode'     ).AsFloat	:= fExNCode;

		Open ();

		if	(EOF and (nDivision = 1)) then
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('INSERT INTO "MJSDBMASTER"."SumSM" ');
//			SQL.Add   ('(NMonth, MasterKbn, BmnNCode, KmkNCode, HojyoKbn, HojyoNCode, ');
//			SQL.Add   (' TekiNCode, SumKbn, DebitSum, DebitTax, CreditSum, CreditTax, AddKbn) ');
//			SQL.Add   ('VALUES (0, 0, '''', :nSubjectCode, 61, '''', :nExCode, 1, 0, 0, 0, 0, 0)');

//			ParamByName ('nSubjectCode').AsInteger	:= nSubjectCode;
//			ParamByName ('nExCode'     ).AsInteger	:= nExCode;

			SQL.Add   ('(NMonth,MasterKbn, KmkNCode, HojyoKbn,HojyoNCode, ');
            SQL.Add   (' BaseNCode,BmnNCode,PrjKbn,PrjNCode,PjSubNCode,');
			SQL.Add   (' TekiNCode, SumKbn, DebitSum, DebitTax, CreditSum, CreditTax, AddKbn) ');
			SQL.Add   ('VALUES (0, 0,:nSubjectCode, 61, 0, ');
            SQL.Add   ('0,0,0,0,0,');
            SQL.Add   (':nExCode, 1, 0, 0, 0, 0, 0)');

    		ParamByName ('nSubjectCode').AsFloat	:= fSubjectNCode;
	    	ParamByName ('nExCode'     ).AsFloat	:= fExNCode;

			if	(not ExecSQL ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

				fnOutputDBErrorMessage ();

				m_cDataModule.Rollback (m_cDBSelect);									// ﾛｰﾙﾊﾞｯｸ(破棄)
				dqMasterData .Close	   ();
				dqMasterData .Free	   ();

				Result	:= false;
				Exit;
			end;

			m_fDeleteTekizan	:= true;
		end
		else if	(not EOF) then
		begin
			if	(((FieldByName ('SumKbn').AsInteger =  1) and (nDivision = 0)) or
				 ((FieldByName ('SumKbn').AsInteger = 99) and (nDivision = 1))) then
			begin
				nSumDivision	:= FieldByName ('SumKbn').AsInteger;

				Close ();

				SQL.Clear ();
				SQL.Add   ('UPDATE "MJSDBMASTER"."SumSM" SET SumKbn = '+ IntToStr (100 - nSumDivision));
//				SQL.Add   ('WHERE  NMonth = 0 AND MasterKbn = 0 AND ');
//				SQL.Add   ('       BmnCode = '''' AND KmkCode = :nSubjectCode AND ');
//				SQL.Add   ('       HojyoKbn = 61 AND HojyoCode = '''' AND TekiCode = :nExCode');

				SQL.Add   ('WHERE  NMonth = 0 AND MasterKbn = 0 AND ');
				SQL.Add   ('       KmkNCode = :nSubjectCode AND ');
				SQL.Add   ('       HojyoKbn = 61 AND TekiNCode = :nExCode');

//				ParamByName ('nSubjectCode').AsInteger	:= nSubjectCode;
//				ParamByName ('nExCode'     ).AsInteger	:= nExCode;

        		ParamByName ('nSubjectCode').AsFloat	:= fSubjectNCode;
		        ParamByName ('nExCode'     ).AsFloat	:= fExNCode;

				if	(not ExecSQL ()) then
				begin
					m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

					m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

					fnOutputDBErrorMessage ();

					m_cDataModule.Rollback (m_cDBSelect);								// ﾛｰﾙﾊﾞｯｸ(破棄)
					dqMasterData .Close	   ();
					dqMasterData .Free	   ();

					Result	:= false;
					Exit;
				end;

				m_fDeleteTekizan	:= true;
			end;
		end;
	end;

	m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)
	dqMasterData .Close  ();
	dqMasterData .Free	 ();

	Result	:= true;																	// 正常終了
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnStdCmnGridExistOnMouseMove (TObject; TShiftState; Integer)						*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要ｸﾞﾘｯﾄﾞ OnMouseMove ｲﾍﾞﾝﾄ													*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnStdCmnGridExistOnMouseMove (Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
	nExCodeSelect: Integer;
begin

(*H0007 20040121 khattori syuusei 排他タイミング変更*)
//	if	m_bLog	then	MLabel27.caption:=MLabel27.caption+'-9';

	inherited;

	if	((Y <= StdCmnGridExist.HeaderPanelHeight) or
		 (X <= StdCmnGridExist.GrIndicatorWidth ) or
		 (X >= (StdCmnGridExist.GrIndicatorWidth + StdCmnGridExistTag.Width))) then
	begin
		m_nHintPosition	:= 0;

		StdCmnGridExist.Hint		:= '';
		StdCmnGridExist.ShowHint	:= false;

		Exit;
	end;

	if	((StdCmnGridExist.GetNodeAt (X, Y) <> nil) and
		 (not VarIsNull (TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [1]))) then
	begin
		nExCodeSelect	:= TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [1];

		if	(nExCodeSelect <> m_nHintPosition) then
		begin
			m_nHintPosition	:= nExCodeSelect;

			StdCmnGridExist.Hint		:= '';
			StdCmnGridExist.ShowHint	:= false;

			Exit;
		end;

		if	((nExCodeSelect = m_nHintPosition) and StdCmnGridExist.ShowHint) then
			Exit;

		if	(VarIsNull (TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [4])) then
			Exit;

		if	(TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [4] <> '') then
		begin
			StdCmnGridExist.Hint		:= TdxTreeListNode (StdCmnGridExist.GetNodeAt (X, Y)).Values [4];
			StdCmnGridExist.ShowHint	:= true;
		end;
	end
	else
	begin
		m_nHintPosition	:= 0;

		StdCmnGridExist.Hint		:= '';
		StdCmnGridExist.ShowHint	:= false;
	end;
end;

procedure	TJNTCRP020000f.fnDtlCmnGridOnKeyPress (Sender: TObject; var Key: Char);
begin
	if	(DtlCmnGrid.FocusedColumn = 1) then
	begin
		if	(((Key < '0') or  (Key > '9')) and
			  (Key <> #8) and (Key <> #27) and (Key <> #9)) then		// #8=BackSpace, #27=Esc, #9=Tab
		begin
			Beep ();
			Abort;
		end;
	end;
end;


//***********************************************************************************************************/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnOutputDescErrorMessage (nSumDivision: Integer);
begin
	m_cComArea.m_MsgStd.GetMsg (m_cErrorMsgRec, 1010, 1);

//	m_cErrorMsgRec.sMsg	:= '既に登録されている摘要と重複しています。';

	if nSumDivision = 0 then
		m_cErrorMsgRec.sMsg	:= 'No.' + IntToStr(m_nExCode) + 'の固定摘要と重複しています｡'
	else
		m_cErrorMsgRec.sMsg	:= 'No.' + IntToStr(m_nExCode) + 'の摘要分類と重複しています｡';

//	MJSMessageBoxEx (m_cErrorMsgRec.sMsg, m_pRec^.m_ProgramName, m_cErrorMsgRec.icontype,
//											m_cErrorMsgRec.btntype, m_cErrorMsgRec.btndef, m_cErrorMsgRec.LogType);
	MJSMessageBoxEx (Self,m_cErrorMsgRec.sMsg, m_pRec^.m_ProgramName, mjInformation,
						m_cErrorMsgRec.btntype, m_cErrorMsgRec.btndef, m_cErrorMsgRec.LogType);

	m_nDBErrorCode	:= 0;
end;

//*************************************************************************************************************
//	HIS0010
//*************************************************************************************************************
function TJNTCRP020000f.fnSwkDetailCheck(nSumDivision,nExCode: Integer): Integer;
//var
//	dqMasterData : TMQuery;					// <HIS0052> DEL
begin

{<HIS0031> SwkDetailが存在しない為ｺﾒﾝﾄ

	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);		// DBとMQueryの接続

	//仕訳で固定摘要コードを使用されているか検索
	dqMasterData.Close;
	dqMasterData.SQL.Clear;
	dqMasterData.SQL.Add('Select TekiCd1,TekiCd2,TekiCd3,TekiCd4,TekiCd5 from SwkDetail ');
	dqMasterData.SQL.Add('where TekiCd1 = :Teki1 or TekiCd2 = :Teki2 or TekiCd3 = :Teki3 ');
	dqMasterData.SQL.Add('or TekiCd4 = :Teki4 or TekiCd5 = :Teki5 ');
	dqMasterData.ParamByName('Teki1').AsInteger	:= nExCode;
	dqMasterData.ParamByName('Teki2').AsInteger	:= nExCode;
	dqMasterData.ParamByName('Teki3').AsInteger	:= nExCode;
	dqMasterData.ParamByName('Teki4').AsInteger	:= nExCode;
	dqMasterData.ParamByName('Teki5').AsInteger	:= nExCode;
	if dqMasterData.Open = false then
	begin
		Result	:= -1;
		dqMasterData.Close;
		dqMasterData.Free;
		Exit;
	end;

	if not dqMasterData.Eof then
	begin
		if nSumDivision = 0 then	//実在
			Result	:= 0
		else             			//合計
			Result	:= 1;
	end
	else
		Result	:= 1;

	dqMasterData.Close;
	dqMasterData.Free;
}

	Result	:= 1;
end;

procedure TJNTCRP020000f.fnDtlCEdtExCdOnArrowClick(Sender: TObject);
// <HIS0052> DEL start
(*var
	MasWndParam :	TJNTMasWndParam;
   	Wnd			:	TJNTMasWndIF;
	sSQL		:	String;
*)
// <HIS0052> DEL end
begin
{
	//初期処理
   	Wnd := TJNTMasWndIF.Create();
	Wnd.Init( pointer ( m_pRec ) );

	MasWndParam 					:=	TJNTMasWndParam.CreateParam();
	MasWndParam.m_GCodeFD			:=	'GCode';			//	コードフィールド名
    MasWndParam.m_RenCharFD			:=	'Renso';			//	連想フィールド名    // HIS0029
	MasWndParam.m_SimpleNameFD  	:=	'TekiChar';			//	摘要フィールド名
    MasWndParam.m_TableName			:=	'TekiMA';		//	テーブル名          // HIS0029

	if DtlCmnTab.Items[0].Selected = true
    then	sSQL := 'Masterkbn = 61 and RDelKbn = 0 and Sumkbn = 0 '    // HIS0029
    else	sSQL := 'Masterkbn = 61 and RDelKbn = 0 and Sumkbn = 1 ';   // HIS0029

	MasWndParam.m_SQL_Where 		:=	sSQL;				//	Where句の条件
   	MasWndParam.m_pApRec 			:=	pointer( m_pRec );	//	ApRecのポインタ
	MasWndParam.m_iCodeLength 		:=	8;					//　6桁//コード桁数
	MasWndParam.m_iCodeAttr 		:=	0;					//　前０なし数字//コード属性

    If Wnd.DoDlg(MasWndParam) = mrOk then
	begin
		if (MasWndParam.m_ExpRetCode = '') then
			Exit
		else
        	DtlCEdtExCd.Value	:= StrToInt64(MasWndParam.m_ExpRetCode);

		MjsDispCtrl.MjsNextCtrl (Self);
   	end;
	MasWndParam.Free();

	//終了処理
	Wnd.Term();
   	Wnd.Free();
}
end;

function TJNTCRP020000f.fnSectionCodeCheck(nSumDivision,
  nExCode: Integer): String;
var
	dqMasterData : TMQuery;
begin
	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);		// DBとMQueryの接続

	with dqMasterData do
	begin
		Close;
		SQL.Clear;
        SQL.Add('SELECT SectionNCode FROM TekiMA   ');   // HIS0029
		SQL.Add('WHERE  MasterKbn = 61            ');
		SQL.Add('AND    SumKbn    = :nSumDivision ');
        SQL.Add('AND    GCode     = :nExCode      ');
        SQL.Add('AND    RDelKbn   = 0             ');       // HIS0029
		ParamByName('nSumDivision').AsInteger	:= nSumDivision;
		ParamByName('nExCode').AsInteger		:= nExCode;
		if Open = false then
		begin
			Close;
			Free;
			Result	:= '';
			Exit;
		end;

		if not Eof then
            Result	:= GetFld('SectionNCode').AsString  // HIS0029
		else
			Result	:= '';
	end;

	dqMasterData.Close;
	dqMasterData.Free;
end;

procedure TJNTCRP020000f.MComboBoxClick(Sender: TObject);
begin
//
//showmessage('MComboBoxClick');
end;

procedure TJNTCRP020000f.MComboBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if		(Key = VK_RETURN)						then	MjsDispCtrl.MjsNextCtrl (Self)
	else if	((Key = VK_ESCAPE) or (Key = VK_END))	then	DtlCmnButtonUpdate.SetFocus ();
end;

procedure TJNTCRP020000f.MCheckBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
	if	(Key = VK_RETURN)	then	MjsDispCtrl.MjsNextCtrl (Self);
end;

procedure TJNTCRP020000f.MCheckBox1Click(Sender: TObject);
begin
// <HIS0052> MOD start
//	cCmbK1DCmb.Enabled	:=	MCheckBox1.Checked;	MComboBoxChange(cCmbK1DCmb);
//	cCmbK1CCmb.Enabled	:=	MCheckBox1.Checked;	MComboBoxChange(cCmbK1CCmb);
	cCmbK1DCmb.Enabled	:=	IsBusyoDenpyo();	MComboBoxChange(cCmbK1DCmb);
	cCmbK1CCmb.Enabled	:=	IsBusyoDenpyo();	MComboBoxChange(cCmbK1CCmb);
// <HIS0052> MOD end

	//	会計処理区分
	if	(m_nTaxAccDivision<>0)	then
	begin
// <HIS0052> MOD start
//		if	MCheckBox1.Checked then
		if	IsBusyoDenpyo() then			// 部署伝票として使用する場合
// <HIS0052> MOD end
		begin
			ChangeTaxEdit(Trunc(cEdtK1DNum.Value),Trunc(cEdtK1CNum.Value));
		end
		else
		begin
			ClearTaxEdit(1,3);
			fnDtlCmnEditTaxDivisionOnChange (DtlCmnEditTaxDivision);
		end;
	end;
//	SetCommonSection(0);					// <HIS0052> DEL
//	SetCommonSection(1);					// <HIS0052> DEL
end;

////////////////////////////////////////////////////////////////////////////////
//	ChangeTaxEdit
////////////////////////////////////////////////////////////////////////////////
procedure TJNTCRP020000f.ChangeTaxEdit(iDKmkCode,iCKmkCode: Integer);
var
	iRate		:	Integer;				// <HIS0052> ADD
	strDesc		:	String;
//<HIS0078 start>
//	nWork		:	Integer;
	iTypeCode	:	Integer;
//<HIS0078 end>
begin
	if	GetTaxKbn(iDKmkCode,iCKmkCode)=-1	then	exit;

	ClearTaxEdit(1,1);
//OutputDebugString(PCHAR(IntToStr(m_iTaxKbn)));
	if	m_iTaxKbn=0	then         			// 対象外
	begin
// <HIS0052> MOD start
//		ClearTaxEdit(2,2);
		ClearTaxEdit(2,1);
// <HIS0052> MOD end
		ClearTaxEdit(3,1);
		ClearTaxEdit(4,1);
	end
	else
	begin
		fnSetDtlEditTaxCodeSelectItems (m_iTaxKbn);
		ClearTaxEdit(2,3);
        // <HIS0052> ADD start				// 消費税ｺｰﾄﾞ取得
//<HIS0078 start>
//		DtlCmnEditTaxCode.Value := GetTaxCode(iDKmkCode,iCKmkCode, iRate);
		DtlCmnEditTaxCode.Value := GetTaxCode(iDKmkCode,iCKmkCode, iRate, iTypeCode);
//<HIS0078 end>
        // <HIS0052> ADD end
		if	fnCheckTaxCode (m_iTaxKbn, Trunc(DtlCmnEditTaxCode.Value), strDesc) <> CHECK_OK then
		begin
			DtlCmnEditTaxCode.Value		:= strtoint(Copy (DtlCmnEditTaxCode.SelectItems[0],1,2));
			fnCheckTaxCode (m_iTaxKbn, Trunc (DtlCmnEditTaxCode.Value), strDesc);
		end;
		DtlCmnLbelTaxCodeDesc.Caption	:= strDesc;

		if	(Trunc (DtlCmnEditTaxCode.Value) <> 0) then
		begin
// <HIS0052> MOD start
(*
//			if	m_cTaxItems.iRate=1	then
//			begin
//				nWork	:=  Trunc (DtlCmnEditTaxRate.Value);
//
//				ClearTaxEdit(3,3);
//
//				DtlCmnEditTaxRate		.Value		:= nWork;
//				DtlCmnEditTaxRate		.InputFlag	:= false;
//
//				if	((nWork >= 0) and (nWork <= 2)) then
//					DtlCmnLbelTaxRateDesc.Caption	:= Copy (DtlCmnEditTaxRate.SelectItems.Strings [nWork], 4, 14)
//				else
//					DtlCmnLbelTaxRateDesc.Caption	:= '';
//			end
//			else
//			begin
//				ClearTaxEdit(3,1);
//			end;
*)
//outputdebugstring(PCHAR('DtlCmnEditTaxRate:' + IntToStr(trunc(DtlCmnEditTaxRate.Value))));
//<HIS0078 start>
//			nWork	:= Trunc(DtlCmnEditTaxRate.Value);		// <HIS0054> ADD
//<HIS0078 end>
			ClearTaxEdit(3,3);			// 消費税率表示
//<HIS0078 start>
//			DtlCmnEditTaxRate.Value				:= nWork;   // <HIS0054> MOD
			DtlCmnEditTaxRate.Value				:= iRate;
//<HIS0078 end>
//			DtlCmnEditTaxRate.Value				:= iRate;   // <HIS0054> MOD
			DtlCmnEditTaxRate.InputFlag			:= false;
//<HIS0078 start>
//			if	((nWork >= 0) and (nWork <= 2)) then
//				DtlCmnLbelTaxRateDesc.Caption	:= Copy (DtlCmnEditTaxRate.SelectItems.Strings [nWork], 4, 14)
//<HIS0101> MOD st
//			if (iRate in [0..2]) then
//				DtlCmnLbelTaxRateDesc.Caption	:= Copy (DtlCmnEditTaxRate.SelectItems.Strings [iRate], 4, 14)
			if (m_TaxRateInfo.IsExistRateCD(iRate) = True) then
				DtlCmnLbelTaxRateDesc.Caption	:= m_TaxRateInfo.GetTaxNameByRateCD(iRate)
//<HIS0101> MOD ed
//<HIS0078 end>
			else
				DtlCmnLbelTaxRateDesc.Caption	:= '';

// <HIS0052> MOD start
//			if	m_cTaxItems.iType=1	then
                                       // 売上科目がある場合
//<HIS0105> DEL        	if IsUriageKmk(Trunc(cEdtK1DNum.Value), Trunc(cEdtK1CNum.Value)) then
// <HIS0052> MOD end
//<HIS0105> ADD St
            if (m_cTaxItems.iType = 1) and
                (IsUriageKmk(Trunc(cEdtK1DNum.Value), Trunc(cEdtK1CNum.Value))) then
//<HIS0105> ADD Ed
			begin
//<HIS0078 start>
//				nWork	:= Trunc(DtlCmnEditTypeCode.Value);
//<HIS0078 end>
				ClearTaxEdit(4,3);
//<HIS0078 start>
//				DtlCmnEditTypeCode.Value		:= nWork;
				DtlCmnEditTypeCode.Value		:= iTypeCode;
//<HIS0078 end>
				DtlCmnEditTypeCode.InputFlag	:= false;
//<HIS0078 start>
//				if	((nWork >= 0) and (nWork <= 5)) then
//					DtlCmnLbelTypeCodeDesc.Caption	:= Copy (DtlCmnEditTypeCode.SelectItems.Strings [nWork], 4, 14)
//<HIS0105> DEL				if (iTypeCode in [0..5]) then
				if (iTypeCode in [m_cTypeCode.MinCode..m_cTypeCode.MaxCode]) then  //<HIS0105> ADD
					DtlCmnLbelTypeCodeDesc.Caption	:= MjsHanCopy(DtlCmnEditTypeCode.SelectItems.Strings[iTypeCode], 4, 14)
//<HIS0078 end>
				else
					DtlCmnLbelTypeCodeDesc.Caption	:= '';
			end
			else
			begin
				ClearTaxEdit(4,1);
			end;
		end;
	end;
end;

////////////////////////////////////////////////////////////////////////////////
//	ClearTaxEdit
////////////////////////////////////////////////////////////////////////////////
procedure TJNTCRP020000f.ClearTaxEdit(iItem,iMode: Integer);
var
	bVisible	:	Boolean;
	bEnabled	:	Boolean;
	bZeroClr	:	Boolean;
	bInpFlag	:	Boolean;
	iColor		:	Integer;
begin
//<HIS0078 start>
	bVisible	:= False;	bEnabled	:= False;	bZeroClr	:= False;	bInpFlag	:= False;	iColor	:= 0;
//<HIS0078 end>
// <HIS0052> ADD start
	if IsBusyoDenpyo() then					// 部署伝票の場合
    begin
    	if (iItem = 1) and (iMode = 3) then // 消費税区分は表示しない
        begin
        	iMode := 1;
        end;
    end;
// <HIS0052> ADD end

// <HIS0064> ADD start
 	if (iItem = 1) then                     // 摘要先行型には対応していないので
    begin                                   // 消費税区分は表示しない
       	iMode := 1;
    end;
// <HIS0064> ADD end

	case	iMode	of
		//	非表示
		1:	begin
				bVisible	:=	false;
				bEnabled	:=	false;
				bZeroClr	:=	true;
				bInpFlag	:=	true;
				iColor		:=	clWindow;
			end;
		//	入力不可
		2:	begin
				bVisible	:=	false;
				bEnabled	:=	true;
				bZeroClr	:=	true;
				bInpFlag	:=	true;
				iColor		:=	TJNTCRP020000f (Self).Color;
			end;
		//	入力可
		3:	begin
				bVisible	:=	true;
				bEnabled	:=	true;
				bZeroClr	:=	false;
				bInpFlag	:=	false;
				iColor		:=	clWindow;
			end;
	end;

	case	iItem	of
		//	売上／仕入
		1:	begin
				DtlCmnLbelTaxDivisionTitle	.Visible	:=	bVisible;
				DtlCmnLbelTaxDivisionTitle	.Enabled	:=	bEnabled;
				DtlCmnEditTaxDivision		.Visible	:=	bVisible;
				DtlCmnEditTaxDivision		.Enabled	:=	bEnabled;
				if	bZeroClr	then
				DtlCmnEditTaxDivision		.Value		:=	0;
				DtlCmnEditTaxDivision		.InputFlag	:=	bInpFlag;
				DtlCmnLbelTaxDivisionDesc	.Visible	:=	bVisible;
				DtlCmnLbelTaxDivisionDesc	.Enabled	:=	bEnabled;
				DtlCmnLbelTaxDivisionDesc	.Caption	:=	'';
			end;
		//	消費税コード
		2:	begin
				DtlCmnLbelTaxCodeTitle		.Visible	:=	bVisible;
				DtlCmnLbelTaxCodeTitle		.Enabled	:=	bEnabled;
				DtlCmnEditTaxCode			.Visible	:=	bVisible;
				DtlCmnEditTaxCode			.Enabled	:=	bEnabled;
				DtlCmnEditTaxCode			.Color		:=	iColor;
				if	bZeroClr	then
				DtlCmnEditTaxCode			.Value		:=	0;
				DtlCmnEditTaxCode			.InputFlag	:=	bInpFlag;
				DtlCmnLbelTaxCodeDesc		.Visible	:=	bVisible;
				DtlCmnLbelTaxCodeDesc		.Enabled	:=	bEnabled;
				DtlCmnLbelTaxCodeDesc		.Caption	:=	'';

				if	(m_nReferMode = REFER) then	DtlCmnEditTaxCode.Enabled	:=	false;
			end;
		//	税率
		3:	begin
				DtlCmnLbelTaxRateTitle		.Visible	:=	bVisible;
				DtlCmnLbelTaxRateTitle		.Enabled	:=	bEnabled;
				DtlCmnEditTaxRate			.Visible	:=	bVisible;
				DtlCmnEditTaxRate			.Enabled	:=	bEnabled;
				if	bZeroClr	then
				DtlCmnEditTaxRate			.Value		:=	0;
				DtlCmnEditTaxRate			.InputFlag	:=	bInpFlag;
				DtlCmnLbelTaxRateDesc		.Visible	:=	bVisible;
				DtlCmnLbelTaxRateDesc		.Enabled	:=	bEnabled;
				DtlCmnLbelTaxRateDesc		.Caption	:=	'';
			end;
		//	業種
		4:	begin
				DtlCmnLbeltypeCodeTitle		.Visible	:=	bVisible;
				DtlCmnLbeltypeCodeTitle		.Enabled	:=	bEnabled;
				DtlCmnEdittypeCode			.Visible	:=	bVisible;
				DtlCmnEdittypeCode			.Enabled	:=	bEnabled;
				if	bZeroClr	then
				DtlCmnEdittypeCode			.Value		:=	0;
				DtlCmnEdittypeCode			.InputFlag	:=	bInpFlag;
				DtlCmnLbeltypeCodeDesc		.Visible	:=	bVisible;
				DtlCmnLbeltypeCodeDesc		.Enabled	:=	bEnabled;
				DtlCmnLbeltypeCodeDesc		.Caption	:=	'';
			end;
	end;
end;

////////////////////////////////////////////////////////////////////////////////
//	SetCommonSection
////////////////////////////////////////////////////////////////////////////////
// <HIS0052> DEL start
(*
procedure TJNTCRP020000f.SetCommonSection(iDbCr: Integer);
begin
	// 借方
	if	(iDbCr = 0)	then
	begin
		//	共通部門
		if	m_iBsPlKbnDeb=0	then
		begin
			if	m_stCurDtlCodeAttr[2].nClassCode=1	then	fnSetField(cEdtBUDNum,cEdtBUDFre,cLblBUDDsc,m_sBSComBmnCd,m_sBSComBmnNm,false,2);
			if	m_stCurDtlCodeAttr[3].nClassCode=1	then	fnSetField(cEdtSGDNum,cEdtSGDFre,cLblSGDDsc,m_sBSComSg1Cd,m_sBSComSg1Nm,false,3);
		end
		else
		begin
			if	m_stCurDtlCodeAttr[2].nClassCode=1	then	fnSetField(cEdtBUDNum,cEdtBUDFre,cLblBUDDsc,m_sPLComBmnCd,m_sPLComBmnNm,false,2);
			if	m_stCurDtlCodeAttr[3].nClassCode=1	then	fnSetField(cEdtSGDNum,cEdtSGDFre,cLblSGDDsc,m_sPLComSg1Cd,m_sPLComSg1Nm,false,3);
		end;
	end
	// 貸方
	else
	begin
		//	共通部門
		if	m_iBsPlKbnCre=0	then
		begin
			if	m_stCurDtlCodeAttr[10].nClassCode=1	then	fnSetField(cEdtBUCNum,cEdtBUCFre,cLblBUCDsc,m_sBSComBmnCd,m_sBSComBmnNm,false,10);
			if	m_stCurDtlCodeAttr[11].nClassCode=1	then	fnSetField(cEdtSGCNum,cEdtSGCFre,cLblSGCDsc,m_sBSComSg1Cd,m_sBSComSg1Nm,false,11);
		end
		else
		begin
			if	m_stCurDtlCodeAttr[10].nClassCode=1	then	fnSetField(cEdtBUCNum,cEdtBUCFre,cLblBUCDsc,m_sPLComBmnCd,m_sPLComBmnNm,false,10);
			if	m_stCurDtlCodeAttr[11].nClassCode=1	then	fnSetField(cEdtSGCNum,cEdtSGCFre,cLblSGCDsc,m_sPLComSg1Cd,m_sPLComSg1Nm,false,11);
		end;
	end;
end;
*)
// <HIS0052> DEL end

////////////////////////////////////////////////////////////////////////////////
//	fnSetField
////////////////////////////////////////////////////////////////////////////////
procedure TJNTCRP020000f.fnSetField(cEdtNum:TMNumEdit;cEdtTxt:TMTxtEdit;
				cLbl:TMLabel;sValue:String;sName:String;bNull:Boolean;index:Integer);
begin
	if  (m_stCurDtlCodeAttr [index].nAttribute <= 1) then
	begin
		if	bNull or (sValue='')	then
		begin
			cEdtNum	.Value		:= 0;
			cEdtNum	.InputFlag	:= true;
			cLbl	.Caption	:= '';
		end
		else
		begin
			cEdtNum	.Value		:= 1;
			cEdtNum	.Value		:= StrToInt64 (Trim (sValue));
			cEdtNum	.InputFlag	:= false;
			if	sName=''	then
			fnCheckExCodeHojyoMA (index,sValue, sName);
			cLbl	.Caption	:= sName;
		end;
	end
	else
	begin
		cEdtTxt.Text	:= sValue;
		if	sName=''	then
		fnCheckExCodeHojyoMA (index,sValue, sName);
		cLbl.Caption	:= sName;
	end;
end;

procedure TJNTCRP020000f.MLabel27Click(Sender: TObject);
begin
	if	m_bLog	then	MLabel27.caption:='摘要体系                                              ';		
end;

procedure TJNTCRP020000f.WMShowMessage(var Msg: TMessage);
begin
	MjsMessageBoxEx(Self,m_stMsgRec.sMsg,
					m_stMsgRec.sTitle,
					m_stMsgRec.icontype,
					m_stMsgRec.btntype,
					m_stMsgRec.btndef,
					m_stMsgRec.LogType);
end;
//<HIS0078 start>
(*
//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   fnGetKousyu
//*     Name            :   Y.Ichihashi　　　　　　
//*     <HIS0033>
//************************************************************************
function TJNTCRP020000f.fnGetKousyu(	nDivision : Integer ):integer;
var
	dqMasterData	:	TMQuery;
	iPartKbn		:	Integer;

	iKmkCd			:	Integer;
	sKojCd			:	String;
//<HIS0078 start>
//	exKojCd         :   Extended;
//<HIS0078 end>
begin
	iKmkCd			:=	trunc(m_cEdtSet[nDivision*8].Num.value);			//	4101;

	with	m_stCurDtlCodeAttr[nDivision*8+6],m_cEdtSet[nDivision*8+6]	do
	begin
		case	nAttribute	of
			0,1:	sKojCd	:=	Format ('%.16d', [Trunc (Num.Value)])
			else	sKojCd	:=	Fre.text;
//<HIS0078 start>
//			exKojCd := fnGetHojNCode(MASTER_CONSTRUCT,sKojCD);
			fnGetHojNCode(MASTER_CONSTRUCT,sKojCD);
//<HIS0078 end>
		end;

	end;

	Result			:=	0;
	iPartKbn		:=	0;		//	工種管理区分

	dqMasterData	:=	TMQuery.Create (Self);				        //	MQueryの構築
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);		//	DBとMQueryの接続

	with (dqMasterData) do
	begin
		if	m_iKmkCode1=-1	then
		begin
			Close ();

			SQL.Clear ();
			SQL.Add   ('Select * From MasterInfo Where MasterKbn= :MstKbn');
            ParamByName('MstKbn').AsInteger := MASTER_CONSTRUCT;

			Open ();

			if	(not EOF) then
			begin
				m_iKmkCode1	:=	GetFld('KmkNCode1').AsInteger;		//	工事未収入金
				m_iKmkCode2	:=	GetFld('KmkNCode2').AsInteger;		//	未成工事受入金
				m_iKmkCode3	:=	GetFld('KmkNCode3').AsInteger;		//	開始工事売上科目ｺｰﾄﾞ
				m_iKmkCode4	:=	GetFld('KmkNCode4').AsInteger;		//	終了工事売上科目ｺｰﾄﾞ
				m_iKmkCode5	:=	GetFld('KmkNCode5').AsInteger;		//	売上基準科目ｺｰﾄﾞ
				m_iKmkCode6	:=	GetFld('KmkNCode6').AsInteger;		//	工事通過勘定コード
				m_iKmkCode8	:=	GetFld('KmkNCode8').AsInteger;		//	開始未成工事支出金
				m_iKmkCode9	:=	GetFld('KmkNCode9').AsInteger;		//	終了未成工事支出金
			end;
		end;

		Close ();

		m_iPtnNo[nDivision]	:=	0;	//	パターンＮＯ

		SQL.Clear ();
		SQL.Add   ('Select PartKbn,PartPattern From KojiInfo Where MasterKbn=' + IntToStr(MASTER_CONSTRUCT) + ' And NCode='''+sKojCd+'''');
		Open ();

		if	(not EOF) then
		begin
			iPartKbn			:=	GetFld('PartKbn').AsInteger;	//	工種管理区分 0:なし 1:あり（全部） 2:あり（パターン）
			if	iPartKbn=2	then
			m_iPtnNo[nDivision]	:=	GetFld('PartPattern').AsInteger;	//	パターンＮＯ
		end;

		Close ();
		Free  ();
	end;

	//	工事･工種採用区分を取得
	if(	(	(	iKmkCd >=	m_iKmkCode3)	and
			(	iKmkCd <=	m_iKmkCode4)		)	or
		(		iKmkCd =	m_iKmkCode5		)	or
		(		iKmkCd =	m_iKmkCode6		)	or
		(	(	iKmkCd >=	m_iKmkCode8)	and
			(	iKmkCd <=	m_iKmkCode9)		)	)	and
		(		iPartKbn>0)	then
		Result := 1
	else if	((	iKmkCd =	m_iKmkCode1)	or					//	終了工事売上科目ｺｰﾄﾞ
			(	iKmkCd =	m_iKmkCode2)		)	and
			(	iPartKbn>0									)	then
		Result := 2;
end;
*)
//<HIS0078 end>
//**********************************************************************
//**********************************************************************
// <HIS0052> DEL start
(*
procedure	TJNTCRP020000f.fnEditInit;
begin
	cCmbK1DCmb.TabOrder:=	0;		cEdtK1DNum.TabOrder:=	1;											//	cLblK1DDsc:=
	cCmbK2DCmb.TabOrder:=	2;		cEdtK2DNum.TabOrder:=	3;											//	cLblK2DDsc:=
	cCmbBUDCmb.TabOrder:=	4;		cEdtBUDNum.TabOrder:=	5;		cEdtBUDFre.TabOrder:=	6;			//	cLblBUDDsc:=
	cCmbSGDCmb.TabOrder:=	7;		cEdtSGDNum.TabOrder:=	8;		cEdtSGDFre.TabOrder:=	9;			//	cLblSGDDsc:=
	cCmbH1DCmb.TabOrder:=	10;		cEdtH1DNum.TabOrder:=	11;		cEdtH1DFre.TabOrder:=	12;			//	cLblH1DDsc:=
	cCmbH2DCmb.TabOrder:=	13;		cEdtH2DNum.TabOrder:=	14;		cEdtH2DFre.TabOrder:=	15;			//	cLblH2DDsc:=
	cCmbKODCmb.TabOrder:=	16;		cEdtKODNum.TabOrder:=	17;		cEdtKODFre.TabOrder:=	18;			//	cLblKODDsc:=
	cCmbKSDCmb.TabOrder:=	19;		cEdtKSDNum.TabOrder:=	20;		cEdtKSDFre.TabOrder:=	21;			//	cLblKSDDsc:=

	cCmbK1CCmb.TabOrder:=	22;		cEdtK1CNum.TabOrder:=	23;											//	cLblK1CDsc:=
	cCmbK2CCmb.TabOrder:=	24;		cEdtK2CNum.TabOrder:=	25;											//	cLblK2CDsc:=
	cCmbBUCCmb.TabOrder:=	26;		cEdtBUCNum.TabOrder:=	27;		cEdtBUCFre.TabOrder:=	28;			//	cLblBUCDsc:=
	cCmbSGCCmb.TabOrder:=	29;		cEdtSGCNum.TabOrder:=	30;		cEdtSGCFre.TabOrder:=	31;			//	cLblSGCDsc:=
	cCmbH1CCmb.TabOrder:=	32;		cEdtH1CNum.TabOrder:=	33;		cEdtH1CFre.TabOrder:=	34;			//	cLblH1CDsc:=
	cCmbH2CCmb.TabOrder:=	35;		cEdtH2CNum.TabOrder:=	36;		cEdtH2CFre.TabOrder:=	37;			//	cLblH2CDsc:=
	cCmbKOCCmb.TabOrder:=	38;		cEdtKOCNum.TabOrder:=	39;		cEdtKOCFre.TabOrder:=	40;			//	cLblKOCDsc:=
	cCmbKSCCmb.TabOrder:=	41;		cEdtKSCNum.TabOrder:=	42;		cEdtKSCFre.TabOrder:=	43;			//	cLblKSCDsc:=

	m_cEdtSet[ 0].typ:=TYPE_EDIT_K1;	m_cEdtSet[ 0].Cmb:=cCmbK1DCmb;	m_cEdtSet[ 0].Num:=cEdtK1DNum;									m_cEdtSet[ 0].Dsc:=cLblK1DDsc;
	m_cEdtSet[ 1].typ:=TYPE_EDIT_K2;	m_cEdtSet[ 1].Cmb:=cCmbK2DCmb;	m_cEdtSet[ 1].Fre:=cEdtK2DNum;									m_cEdtSet[ 1].Dsc:=cLblK2DDsc;
	m_cEdtSet[ 2].typ:=TYPE_EDIT_BU;	m_cEdtSet[ 2].Cmb:=cCmbBUDCmb;	m_cEdtSet[ 2].Num:=cEdtBUDNum;	m_cEdtSet[ 2].Fre:=cEdtBUDFre;	m_cEdtSet[ 2].Dsc:=cLblBUDDsc;
	m_cEdtSet[ 3].typ:=TYPE_EDIT_SG;	m_cEdtSet[ 3].Cmb:=cCmbSGDCmb;	m_cEdtSet[ 3].Num:=cEdtSGDNum;	m_cEdtSet[ 3].Fre:=cEdtSGDFre;	m_cEdtSet[ 3].Dsc:=cLblSGDDsc;
	m_cEdtSet[ 4].typ:=TYPE_EDIT_H1;	m_cEdtSet[ 4].Cmb:=cCmbH1DCmb;	m_cEdtSet[ 4].Num:=cEdtH1DNum;	m_cEdtSet[ 4].Fre:=cEdtH1DFre;	m_cEdtSet[ 4].Dsc:=cLblH1DDsc;
	m_cEdtSet[ 5].typ:=TYPE_EDIT_H2;	m_cEdtSet[ 5].Cmb:=cCmbH2DCmb;	m_cEdtSet[ 5].Num:=cEdtH2DNum;	m_cEdtSet[ 5].Fre:=cEdtH2DFre;	m_cEdtSet[ 5].Dsc:=cLblH2DDsc;
	m_cEdtSet[ 6].typ:=TYPE_EDIT_KO;	m_cEdtSet[ 6].Cmb:=cCmbKODCmb;	m_cEdtSet[ 6].Num:=cEdtKODNum;	m_cEdtSet[ 6].Fre:=cEdtKODFre;	m_cEdtSet[ 6].Dsc:=cLblKODDsc;
	m_cEdtSet[ 7].typ:=TYPE_EDIT_KS;	m_cEdtSet[ 7].Cmb:=cCmbKSDCmb;	m_cEdtSet[ 7].Num:=cEdtKSDNum;	m_cEdtSet[ 7].Fre:=cEdtKSDFre;	m_cEdtSet[ 7].Dsc:=cLblKSDDsc;

	m_cEdtSet[ 8].typ:=TYPE_EDIT_K1;	m_cEdtSet[ 8].Cmb:=cCmbK1CCmb;	m_cEdtSet[ 8].Num:=cEdtK1CNum;									m_cEdtSet[ 8].Dsc:=cLblK1CDsc;
	m_cEdtSet[ 9].typ:=TYPE_EDIT_K2;	m_cEdtSet[ 9].Cmb:=cCmbK2CCmb;	m_cEdtSet[ 9].Fre:=cEdtK2CNum;									m_cEdtSet[ 9].Dsc:=cLblK2CDsc;
	m_cEdtSet[10].typ:=TYPE_EDIT_BU;	m_cEdtSet[10].Cmb:=cCmbBUCCmb;	m_cEdtSet[10].Num:=cEdtBUCNum;	m_cEdtSet[10].Fre:=cEdtBUCFre;	m_cEdtSet[10].Dsc:=cLblBUCDsc;
	m_cEdtSet[11].typ:=TYPE_EDIT_SG;	m_cEdtSet[11].Cmb:=cCmbSGCCmb;	m_cEdtSet[11].Num:=cEdtSGCNum;	m_cEdtSet[11].Fre:=cEdtSGCFre;	m_cEdtSet[11].Dsc:=cLblSGCDsc;
	m_cEdtSet[12].typ:=TYPE_EDIT_H1;	m_cEdtSet[12].Cmb:=cCmbH1CCmb;	m_cEdtSet[12].Num:=cEdtH1CNum;	m_cEdtSet[12].Fre:=cEdtH1CFre;	m_cEdtSet[12].Dsc:=cLblH1CDsc;
	m_cEdtSet[13].typ:=TYPE_EDIT_H2;	m_cEdtSet[13].Cmb:=cCmbH2CCmb;	m_cEdtSet[13].Num:=cEdtH2CNum;	m_cEdtSet[13].Fre:=cEdtH2CFre;	m_cEdtSet[13].Dsc:=cLblH2CDsc;
	m_cEdtSet[14].typ:=TYPE_EDIT_KO;	m_cEdtSet[14].Cmb:=cCmbKOCCmb;	m_cEdtSet[14].Num:=cEdtKOCNum;	m_cEdtSet[14].Fre:=cEdtKOCFre;	m_cEdtSet[14].Dsc:=cLblKOCDsc;
	m_cEdtSet[15].typ:=TYPE_EDIT_KS;	m_cEdtSet[15].Cmb:=cCmbKSCCmb;	m_cEdtSet[15].Num:=cEdtKSCNum;	m_cEdtSet[15].Fre:=cEdtKSCFre;	m_cEdtSet[15].Dsc:=cLblKSCDsc;
end;
*)
// <HIS0052> DEL end
//<HIS0078 start>
(*
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
function TJNTCRP020000f.fnGetDspData(nCount:Integer; sCode: String ;MaxDigitKbn:Boolean): String;
var
    lvPara: Double;
    lvStr:  String;
// <HIS0052> DEL start

//	iType,      // コード属性（1:ﾌﾘｰ、2:数値[前ゼロあり])
//	iLen        // コード桁数
//	:   Integer;

// <HIS0052> DEL end
    lvDigit : Integer;
    lvAttr  : Integer;
begin
    Result := '';

	lvDigit			:=	m_stAdoptInfo [nCount].nCodeDigit;
	lvAttr  		:=	m_stAdoptinfo [nCount].nCodeAttribute;

    if MaxDigitKbn = True then
        lvDigit := 16;

    try
        //文字属性なら
        if lvAttr = 2 then
        begin
            if Length(sCode) > lvDigit then
                Result := Copy(sCode, 1, lvDigit)
            else
                Result := sCode;

            Exit;
        end;

        //数値属性なら
        if (lvAttr = 0) or (lvAttr = 1) then
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
*)
//<HIS0078 end>
//-----------------------------------------------------------------------------
//
//     ﾌﾟﾛｼﾞｪｸﾄ・工種・セグメントMasterKbn取得
//
//-----------------------------------------------------------------------------
procedure TJNTCRP020000f.fnGetMasterKbnFX();
var
    Qe          : TMQuery;
    lvKousyuKbn : Integer;
    lvKMasteKbn : Integer;
    lvSMasteKbn : Integer;
    lvString    : String;
    lvCount     : Integer;

    lvMstKbn    : Integer;
    i           : Integer;

begin
//<HIS0078 start>
//	lvKMasteKbn := 0;
//	lvKousyuKbn := 0;
//<HIS0078 end>
    lvSMasteKbn := 0;

	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

    //////////////////////////////////////////////////
    //  工事・工種
    //////////////////////////////////////////////////
   	with  Qe do
    begin
	    Close ();
   		SQL.Clear ();
        SQL.add(' Select MasterKbn From MasterInfo '+
               ' Where (MasterKBN Between :pSMKBN and :pEMKBN)'+
               ' and (KojUseKBN <> 0 )' +
               ' Order by MasterKbn ');

        ParamByName('pSMKBN').asFloat := ucSKO_MKBN;
        ParamByName('pEMKBN').asFloat := ucEKO_MKBN;
        Open;

        if not Eof then
        begin
        // 工事採用有り
            lvKMasteKbn := Qe.GetFLD('MasterKbn').AsInteger;

        end
        else
        begin
        // 工事採用無し

        // 工事採用がなければプロジェクト採用ありのもののうち //
        // 先頭のものを工事へセット                           //
    	    Close ();
   	    	SQL.Clear ();
            SQL.add(' Select Min(MasterKbn) As PrjMstKbn From MasterInfo '+
                   ' Where (MasterKBN Between :pSMKBN and :pEMKBN)'+
                   ' and (UseKBN <> 0)');


            ParamByName('pSMKBN').asFloat := ucSKO_MKBN;
            ParamByName('pEMKBN').asFloat := ucEKO_MKBN;
            Open;

            if not Eof then
                lvKMasteKbn     := Qe.GetFLD('PrjMstKbn').AsInteger
            else
                lvkMasteKbn    := ucSKO_MKBN;    //既存ﾙｰﾁﾝで採用無しになる

        end;

    end;

    //工種MasterKbn取得
    lvKousyuKbn :=
        (lvKMasteKbn
            - (StrToInt(Copy(IntToStr(ucSKO_MKBN),1,1)) * 100)
            + (StrToInt(Copy(IntToStr(lvKMasteKbn + 100),1,1)) * 100));


    //////////////////////////////////////////////////
    //  ｾｸﾞﾒﾝﾄ
    //////////////////////////////////////////////////
   	with  Qe do
    begin
	    Close ();
   		SQL.Clear ();
        SQL.add(' Select MasterKbn From MasterInfo '+
               ' Where (MasterKBN Between :pSMKBN and :pEMKBN)'+
// <HIS0052> MOD start
//               ' and (UseKBN = 1)');
               ' and (UseKBN > 0)');
// <HIS0052> MOD end

        ParamByName('pSMKBN').asFloat := ucSSG_MKBN;
        ParamByName('pEMKBN').asFloat := ucESG_MKBN;
        Open;

        if not Eof then
            lvSMasteKbn     := Qe.GetFLD('MasterKbn').AsInteger

    end;


    //////////////////////////////////////////////////
    //  第一補助・第二補助取得
    //////////////////////////////////////////////////
   	with  Qe do
    begin
	    Close ();
   		SQL.Clear ();
        SQL.add(' Select MasterKbn From MasterInfo '+
               ' Where (MasterKBN Between 21 and 35)'+
               ' and (UseKBN = 1)'                  +
               ' Order by MasterKbn');
        Open;

        //　--参照順序--
        //  取引先      22      :MASTER_CUSTOMER
        //  社員        25      :MASTER_STAFF
        //  銀行        21      :MASTER_BANK
        //  汎用補助    31-35   :MASTER_GENERAL01   -   MASTER_GENERAL05

        lvCount     := 0;
        lvString    := '';

        while not Eof do
        begin
            //採用MASTERKBN取得
            lvString := lvString + IntToStr(GetFld('MasterKbn').AsInteger) + '|';
            next;
        end;

        //取引先ﾁｪｯｸ
        lvMstKbn := MASTER_CUSTOMER;
        if (AnsiPos(IntToStr(lvMstKbn) + '|',lvString)<>0) and (lvCount <=2) then
        begin
            lvCount := lvCount + 1;
            case lvCount of
                1:MASTER_HOJYO1 := lvMstKbn;
                2:MASTER_HOJYO2 := lvMstKbn;
            end;
        end;

        //社員ﾁｪｯｸ
        lvMstKbn := MASTER_STAFF;
        if (AnsiPos(IntToStr(lvMstKbn) + '|',lvString)<>0) and (lvCount <=2) then
        begin
            lvCount := lvCount + 1;
            case lvCount of
                1:MASTER_HOJYO1 := lvMstKbn;
                2:MASTER_HOJYO2 := lvMstKbn;
            end;
        end;

        //銀行ﾁｪｯｸ
        lvMstKbn := MASTER_BANK;
        if (AnsiPos(IntToStr(lvMstKbn) + '|',lvString)<>0) and (lvCount <=2) then
        begin
            lvCount := lvCount + 1;
            case lvCount of
                1:MASTER_HOJYO1 := lvMstKbn;
                2:MASTER_HOJYO2 := lvMstKbn;
            end;
        end;

        //汎用補助①～⑤
        for i := MASTER_GENERAL01 to MASTER_GENERAL05 do
        begin
            lvMstKbn := i;
            if (AnsiPos(IntToStr(lvMstKbn) + '|',lvString)<>0) and (lvCount <=2) then
            begin
                lvCount := lvCount + 1;
                case lvCount of
                    1:MASTER_HOJYO1 := lvMstKbn;
                    2:MASTER_HOJYO2 := lvMstKbn;
                end;
            end;
        end;
    end;

    Qe.Close;
    Qe.Free;

	MASTER_SEGMENT  		:=	lvSMasteKbn;		//	ｾｸﾞﾒﾝﾄ(可変)
    MASTER_CONSTRUCT		:=	lvKMasteKbn;		//	工事(可変)
    MASTER_CONSTKIND		:=	lvKousyuKbn;		//	工種(可変)

end;
//-----------------------------------------------------------------------------
// fnChgBtnAction() <11>
//      切出,埋込処理
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP020000f.fnChgBtnAction;
var
	wkParam : TAppParam;
//    iAction : Integer;					// <HIS0052> DEL

    lvRect: TRect;
    lvWidth, lvHeight: Integer;
begin

    if  (B_Change.Caption = '埋込(&G)') then
    begin
        // 親画面への設定
        wkParam.iAction      :=  ACTID_DOCKINGINEND;         //  格納通知
        B_Change.Caption := '切出(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end
    else
    begin
		Visible     :=	False;
        // 現在のｸﾗｲｱﾝﾄ領域を取得し幅と高さを取得
        lvRect      := Self.ClientRect;
        lvWidth     := lvRect.Right - lvRect.Left;
        lvHeight    := lvRect.Bottom - lvRect.Top;

        ClientWidth  :=  lvWidth;
        ClientHeight :=  lvHeight;
		Visible		 :=	True;

        // 親画面への設定
        wkParam.iAction      :=  ACTID_DOCKINGOUTEND;        //  取出通知
        B_Change.Caption := '埋込(&G)';                 // ﾎﾞﾀﾝｷｬﾌﾟｼｮﾝの変更
    end;

    wkParam.pRecord         :=    Pointer(m_pRec);      // 管理構造体ﾎﾟｲﾝﾀ設定
    wkParam.pActionParam    :=    nil;                        // 予備ﾎﾟｲﾝﾀ設定
    TMjsAppRecord(m_pRec^).m_pOwnerEntry(@wkParam);
end;
//-----------------------------------------------------------------------------
// fnDtlCmnPopupMenuOnPopup() <11>
//      PARAM   :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	TJNTCRP020000f.fnDtlCmnPopupMenuOnPopup (Sender: TObject);
//var
//    lvCode : Integer;						// <HIS0052> DEL


begin
// <HIS0074> ADD start
											// 追加権限なしまたは修正権限なしの場合、付箋をはがせないよう無効にする
    DtlCmnpopupMenuTagOff.Enabled   := m_cJNTArea.IsFusen();
// <HIS0074> ADD end

	DtlCmnPopupMenuTag01.Enabled	:= False;
	DtlCmnPopupMenuTag02.Enabled	:= False;
	DtlCmnPopupMenuTag03.Enabled	:= False;
	DtlCmnPopupMenuTag04.Enabled	:= False;


    if DtlCEdtExCd.AsInteger =0 then
// <HIS0070> MOD start
//        Exit;
	begin                                  	// 「はがす」以外を表示しておく
        DtlCmnPopupMenuTagOff.Visible := False;
		DtlCmnPopupMenuTag01 .Visible := True;
		DtlCmnPopupMenuTag02 .Visible := True;
		DtlCmnPopupMenuTag03 .Visible := True;
		DtlCmnPopupMenuTag04 .Visible := True;
    	Exit;
    end;
// <HIS0070> MOD end


    if DtlCmnTab.Items.Selected = 1 then	// 摘要分類
// <HIS0070> MOD start
//        Exit;
	begin                                  	// 「はがす」以外を表示しておく
        DtlCmnPopupMenuTagOff.Visible := False;
		DtlCmnPopupMenuTag01 .Visible := True;
		DtlCmnPopupMenuTag02 .Visible := True;
		DtlCmnPopupMenuTag03 .Visible := True;
		DtlCmnPopupMenuTag04 .Visible := True;
    	Exit;
    end;
// <HIS0070> MOD end


    if fnCheckMasterDataRecordValid(DtlCmnTab.Items.Selected,DtlCEdtExCd.AsInteger) then
        Exit;

	DtlCmnPopupMenuTag01.Enabled	:= m_cJNTArea.IsFusen;
	DtlCmnPopupMenuTag02.Enabled	:= m_cJNTArea.IsFusen;
	DtlCmnPopupMenuTag03.Enabled	:= m_cJNTArea.IsFusen;
	DtlCmnPopupMenuTag04.Enabled	:= m_cJNTArea.IsFusen;

	if	(m_nSelectTagKind > 0) then
	begin
		DtlCmnPopupMenuTagOff.Visible	:= true;

		case (m_nSelectTagKind) of
			1:	begin
					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag01.Bitmap;
					DtlCmnPopupMenuTag01 .Visible	:= false;
					DtlCmnPopupMenuTag02 .Visible	:= true;
					DtlCmnPopupMenuTag03 .Visible	:= true;
					DtlCmnPopupMenuTag04 .Visible	:= true;
				end;
			2:	begin
					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag03.Bitmap;
					DtlCmnPopupMenuTag01 .Visible	:= true;
					DtlCmnPopupMenuTag02 .Visible	:= TRUE;
					DtlCmnPopupMenuTag03 .Visible	:= FALSE;
					DtlCmnPopupMenuTag04 .Visible	:= true;
				end;
			3:	begin
					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag02.Bitmap;
					DtlCmnPopupMenuTag01 .Visible	:= true;
					DtlCmnPopupMenuTag02 .Visible	:= FALSE;
					DtlCmnPopupMenuTag03 .Visible	:= TRUE;
					DtlCmnPopupMenuTag04 .Visible	:= true;
				end;
			4:	begin
					DtlCmnPopupMenuTagOff.Bitmap	:= DtlCmnPopupMenuTag04.Bitmap;
					DtlCmnPopupMenuTag01 .Visible	:= true;
					DtlCmnPopupMenuTag02 .Visible	:= true;
					DtlCmnPopupMenuTag03 .Visible	:= true;
					DtlCmnPopupMenuTag04 .Visible	:= false;
				end;
		end;
	end
	else
	begin
		DtlCmnPopupMenuTagOff.Visible	:= false;

		DtlCmnPopupMenuTag01 .Visible	:= true;
		DtlCmnPopupMenuTag02 .Visible	:= true;
		DtlCmnPopupMenuTag03 .Visible	:= true;
		DtlCmnPopupMenuTag04 .Visible	:= true;
	end;
end;
////////////////////////////////////////////////////////////////////////////////
//	MComboBoxChange
//		マスタ区分コンボ（基準、置換、可変、当該）が変更された時の処理
////////////////////////////////////////////////////////////////////////////////
procedure TJNTCRP020000f.MComboBoxChange(Sender:TObject);
// <HIS0052> MOD start 関数ごと修正
begin
	evtcCmbK1CmbChange(Sender);
(*
var
	nCount	: Integer;

	procedure ChangeEnabled(index:Integer);
	begin
		with	m_cEdtSet[index]	do
		begin
			if	m_stCurDtlCodeAttr [index].nAttribute<2	then
			begin
				Num.Enabled:=Cmb.Enabled	and	(Cmb.ItemIndex=0);
				ChangeCompColor(Num);
			end
			else if	(index<>1) and (index<>9)	then
			begin
				Fre.Enabled:=Cmb.Enabled	and	(Cmb.ItemIndex=0);
				ChangeCompColor(Fre);
			end;
		end;
	end;
begin
	//	借方科目
	if	Sender=cCmbK1DCmb	then
	begin
		//	借方科目が基準
		if	(	cCmbK1DCmb.Enabled		)	and
			(	cCmbK1DCmb.ItemIndex=0	)	then
		begin
			cEdtK1DNum.Enabled	:=	true;

			for	nCount := 1 to 7 do
			begin
				with	m_cEdtSet[nCount]	do
				begin
                    if nCount <>1 then
                    begin
    					if	Cmb.ItemIndex>0	then
                            Cmb.Enabled:=true
                        else	Cmb.Enabled	:=	Num.Enabled	or	((Fre<>nil) and Fre.Enabled);
                    end;
				end;
			end;
		end
		else
		begin
			//	借方科目が置換
			if	(	cCmbK1DCmb.Enabled		)	and
				(	cCmbK1DCmb.ItemIndex=1	)	then
			begin

				for	nCount := 0 to 7 do
				begin
					m_cEdtSet[nCount].Dsc.Caption:='';

                    if nCount <>1 then
    					m_cEdtSet[nCount].Num.Enabled:=false;


					if	m_cEdtSet[nCount].Fre<>nil	then	m_cEdtSet[nCount].Fre.Enabled:=false;
				end;

				// 会計処理区分: 0=免税業者
				if	(m_nTaxAccDivision <> 0) then
				begin
					if	MCheckBox1.Checked	then
					begin
						ChangeTaxEdit(Trunc(cEdtK1DNum.Value),Trunc(cEdtK1CNum.Value));
					end;
				end;
			end
			//	部署伝票用仕訳辞書ではない
			else
			begin
				cEdtK1DNum.Enabled		:=	true;
				cCmbK1DCmb.ItemIndex	:=	0;
			end;

			for	nCount := 1 to 7 do
			begin
				m_cEdtSet[nCount].Cmb.Enabled:=false;
				m_cEdtSet[nCount].Cmb.ItemIndex:=0;
			end;
		end;

		for	nCount := 0 to 7 do
		begin
			with	m_cEdtSet[nCount]	do
			begin
                if nCount <>1 then ChangeCompColor(Num);
				if	Fre<>nil	then	ChangeCompColor(Fre);
			end;
		end;
	end;

	//	借方工事
	if	Sender=cCmbKODCmb	then
	begin
		//	借方工事が基準以外
		if	cCmbKODCmb.ItemIndex<>0	then
		begin
			with	m_cEdtSet[7]	do
			begin
				Cmb.Enabled		:=	false;
				Cmb.ItemIndex	:=	0;
				Dsc.Caption		:=	'';
				ChangeEnabled(7);
			end;
		end;
	end;

	for	nCount := 1 to 7 do
	begin
		if	Sender=m_cEdtSet[nCount].Cmb	then
		begin
			ChangeEnabled(nCount);
			if	m_cEdtSet[nCount].Cmb.ItemIndex>0	then	m_cEdtSet[nCount].Dsc.Caption:=''
		end;
	end;

	//	貸方科目
	if	Sender=cCmbK1CCmb	then
	begin
		//	貸方科目が基準
		if	(	cCmbK1CCmb.Enabled		)	and
			(	cCmbK1CCmb.ItemIndex=0	)	then
		begin
			cEdtK1CNum.Enabled	:=	true;

			for	nCount := 9 to 15 do
			begin
				with	m_cEdtSet[nCount]	do
				begin
                    if nCount <>9 then
                    begin
    					if	Cmb.ItemIndex>0	then
                            Cmb.Enabled:=true
                        else
                            Cmb.Enabled	:=	Num.Enabled	or	((Fre<>nil) and Fre.Enabled);

                    end;
				end;
			end;
		end
		else
		begin
			//	貸方科目が置換
			if	(	cCmbK1CCmb.Enabled		)	and
				(	cCmbK1CCmb.ItemIndex=1	)	then
			begin

				for	nCount := 8 to 15 do
				begin
					m_cEdtSet[nCount].Dsc.Caption:='';

                    if nCount <> 9 then
    					m_cEdtSet[nCount].Num.Enabled:=false;


    				if	m_cEdtSet[nCount].Fre<>nil	then	m_cEdtSet[nCount].Fre.Enabled:=false;
				end;

				// 会計処理区分: 0=免税業者
				if	(m_nTaxAccDivision <> 0) then
				begin
					if	MCheckBox1.Checked	then
					begin
						ChangeTaxEdit(Trunc(cEdtK1DNum.Value),Trunc(cEdtK1CNum.Value));
					end;
				end;
			end
			//	部署伝票用仕訳辞書ではない
			else
			begin
				cEdtK1CNum.Enabled		:=	true;
				cCmbK1CCmb.ItemIndex	:=	0;
			end;

			for	nCount := 9 to 15 do
			begin
				m_cEdtSet[nCount].Cmb.Enabled:=false;
				m_cEdtSet[nCount].Cmb.ItemIndex:=0;
			end;
		end;

		for	nCount := 8 to 15 do
		begin
			with	m_cEdtSet[nCount]	do
			begin
                if nCount <>9 then
    				ChangeCompColor(Num);

				if	Fre<>nil	then	ChangeCompColor(Fre);
			end;
		end;
	end;

	//	貸方工事
	if	Sender=cCmbKOCCmb	then
	begin
		//	貸方工事が基準以外
		if	cCmbKOCCmb.ItemIndex<>0	then
		begin
			with	m_cEdtSet[15]	do
			begin
				Cmb.Enabled		:=	false;
				Cmb.ItemIndex	:=	0;
				Dsc.Caption		:=	'';
				ChangeEnabled(7);
			end;
		end;
	end;

	for	nCount := 9 to 15 do
	begin
		if	Sender=m_cEdtSet[nCount].Cmb	then
		begin
			ChangeEnabled(nCount);
			if	m_cEdtSet[nCount].Cmb.ItemIndex>0	then	m_cEdtSet[nCount].Dsc.Caption:=''
		end;
	end;
*)	// <HIS0052> MOD end
end;


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   OnArrowClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fncEdtOAC (Sender: TObject);
// <HIS0052> DEL
(*
var
//	cMasWndParam: TJNTMasWndParam;
//	cMasWndIF	: TJNTMasWndIF;

    lvExpSend   :  rcJNTExpSend;
    lvExpRecv   :  rcJNTExpRecv;
    iExpRtn     :  Integer;
    CompName    :  String;

    strWhere    : String;
	nDivision	: Integer;
	nIndex		: Integer;

    cTxtEdit    : TMTxtEdit;
    cNumEdit    : TMNumEdit;

    clblTitle   : TMLabel;
    clblName    : TMLabel;

    StrKbn      : String;

    lvMdlKbn    : Integer;
    lvPtnNo     : Integer;
    lvMasterkbn : Integer;
    lvTableName : String;
*)
// <HIS0052> DEL end
begin
{
	nIndex		:=	0;	//
	case	TWinControl(Sender).TabOrder	of
		0..1:	nIndex:=0;	//	科目
		2..3:	nIndex:=1;	//	細目科目
		4..6:	nIndex:=2;	//	部門
		7..9:	nIndex:=3;	//	セグメント１
		10..12:	nIndex:=4;	//	第１補助
		13..15:	nIndex:=5;	//	第２補助
		16..18:	nIndex:=6;	//	工事
		19..21:	nIndex:=7;	//	工種

		22..23:	nIndex:=8;	//	科目
		24..25:	nIndex:=9;	//	細目科目
		26..28:	nIndex:=10;	//	部門
		29..31:	nIndex:=11;	//	セグメント１
		32..34:	nIndex:=12;	//	第１補助
		35..37:	nIndex:=13;	//	第２補助
		38..40:	nIndex:=14;	//	工事
		41..43:	nIndex:=15;	//	工種
		else	Exit;
	end;

	nDivision	:= nIndex	div	8;

    CompName    :=  TComponent(Sender).name;

    fnJNTExpMakeParam(@lvExpSend);   //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;       //MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;           //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;



    if (m_stCurDtlCodeAttr [nIndex].nMasterDivision = MASTER_CUSTOMER) or
        (m_stCurDtlCodeAttr [nIndex].nMasterDivision = MASTER_CUSTOMERPLUS01) or
        (m_stCurDtlCodeAttr [nIndex].nMasterDivision = MASTER_CUSTOMERPLUS02) then
    begin
        // 取引先
        lvMasterkbn := MASTER_CUSTOMERPLUS01;
        lvMdlKbn  := 6;
        lvPtnNo   := 1;
        lvTableName := 'MTOKUI';
        strWhere := 'RDelKbn = 0';
    end
    else
    begin
        // その他
        lvMasterkbn := m_stCurDtlCodeAttr [nIndex].nMasterDivision;
        lvMdlKbn  := 0;
        lvPtnNo   := 1;
        lvTableName := 'HojyoMA';
        strWhere := 'RDelKbn = 0 and MasterKbn = '
                    + IntToStr(m_stCurDtlCodeAttr [nIndex].nMasterDivision);
    end;

    StrKbn := Copy(CompName,5,3);

    // *********** 部門 ***********
    clblTitle   := TMLabel   (MJSFindCtrl (Self, 'cLbl' + StrKbn + 'Ttle'));   // Title
    cTxtEdit    := TMTxtEdit (MJSFindCtrl (Self, 'cEdt' + StrKbn + 'Fre'));    // TMTxt
    cNumEdit    := TMNumEdit (MJSFindCtrl (Self, 'cEdt' + StrKbn + 'Num'));    // TMNum
    clblName    := TMLabel   (MJSFindCtrl (Self, 'cLbl' + StrKbn + 'Dsc'));    // Name

    lvExpSend.MasterKbn     :=  lvMasterkbn;
    lvExpSend.ModulKbn      :=  lvMdlkbn;
    lvExpSend.PatternNo     :=  lvPtnNo;
    lvExpSend.TBarNM        :=  clblTitle.Caption +  '検索ｴｸｽﾌﾟﾛｰﾗ';
    lvExpSend.TableName     :=  lvTableName;
    lvExpSend.TrRootCaption :=  clblTitle.Caption;
    lvExpSend.SumKbn        :=  0;

    lvExpSend.WhereStr := strWhere;

   //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin
        if cNumEdit.Visible  then
            cNumEdit.Value := StrToFloat(lvExpRecv.GCode)
        else
            cTxtEdit.Text  := lvExpRecv.GCode;

        clblName.Caption := lvExpRecv.Nmk;
    end;



{
	cMasWndIF	:= TJNTMasWndIF.Create ();
	cMasWndIF.Init (Pointer (m_pRec));
	cMasWndParam	:= TJNTMasWndParam.CreateParam ();
	cMasWndParam.m_GCodeFD		:= 'GCode';												// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'Renso'; 											// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名

    //HIS0033↓
    if m_stCurDtlCodeAttr [nIndex].nMasterDivision = MASTER_CUSTOMER then
    begin
    	cMasWndParam.m_SimpleNameFD	:= 'NMK';										// 簡略名称  ﾌｨｰﾙﾄﾞ名
	    cMasWndParam.m_TableName	:= 'MTOKUI';											// ﾃｰﾌﾞﾙ名
    end
    else
    begin
    	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';										// 簡略名称  ﾌｨｰﾙﾄﾞ名
	    cMasWndParam.m_TableName	:= 'HojyoMA';											// ﾃｰﾌﾞﾙ名
    end;
    //HIS0033↑

	cMasWndParam.m_SQL_Where	:= fnMakeSQLConstructionHojyoMA (
    											m_stCurDtlCodeAttr [nIndex].nMasterDivision, nDivision);
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);									// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= m_stCurDtlCodeAttr [nIndex].nDigit;		// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= m_stCurDtlCodeAttr [nIndex].nAttribute;	// ｺｰﾄﾞ属性

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		if	(cMasWndParam.m_ExpRetCode <> '') then
		begin
			if	(m_stCurDtlCodeAttr [nIndex].nAttribute <= 1) then
			begin
				m_cEdtSet[nIndex].Num.Value		:= StrToInt64 (cMasWndParam.m_ExpRetCode);
				m_cEdtSet[nIndex].Num.InputFlag	:= false;
			end
			else
				m_cEdtSet[nIndex].Fre.Text	:= cMasWndParam.m_ExpRetCode;

			m_cEdtSet[nIndex].Dsc.Caption	:= cMasWndParam.m_ExpRetText;
		end;
	end;

	cMasWndParam.Free ();
	cMasWndIF   .Term ();
	cMasWndIF   .Free ();
}
end;
//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   CmnArrowClick
//*
//************************************************************************
procedure	TJNTCRP020000f.CmnArrowClick (Sender: TObject);
var

    lvExpSend   :  rcJNTExpSend;
    lvExpRecv   :  rcJNTExpRecv;
    iExpRtn     :  Integer;
    CompName    :  String;

    strWhere    : String;
//	nDivision	: Integer;					// <HIS0052> DEL
//	nIndex		: Integer;					// <HIS0052> DEL

    cTxtEdit    : TMTxtEdit;
    cNumEdit    : TMNumEdit;

    clblTitle   : TMLabel;
    clblName    : TMLabel;

//    StrKbn      : String;					// <HIS0052> DEL

    lvMdlKbn    : Integer;
    lvPtnNo     : Integer;
    lvMasterkbn : Integer;
    lvTableName : String;
//    nExCode     : Integer;				// <HIS0052> DEL

begin
// <HIS0052> ADD start
	cTxtEdit := nil;
    clblName := nil;
// <HIS0052> ADD end

    CompName    :=  TComponent(Sender).name;

    fnJNTExpMakeParam(@lvExpSend);   //ﾊﾟﾗﾒｰﾀ初期設定
    //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;       //MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;           //TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;

    if CompName = 'DtlCEdtExCd' then
    begin
        lvMasterkbn := 61;
        lvMdlKbn  := 0;
        lvPtnNo   := 1;
        lvTableName := 'TekiMA';
        strWhere := 'TekiMA.RDelKbn = 0 and TekiMA.MasterKbn = 61';
        strWhere := strWhere + ' and TekiMA.SumKbn = ' + IntToStr(DtlCmnTab.Items.Selected);

        clblTitle   := TMLabel   (MJSFindCtrl (Self, 'DtlCLblExCdTitle'));      // Title
        cNumEdit    := TMNumEdit (MJSFindCtrl (Self, 'DtlCEdtExCd'));           // TMNum

    end
// <HIS0052> ADD start
	{ 借方・貸方科目 }
	else if (CompName = 'cEdtK1DNum') or (CompName = 'cEdtK1CNum') then
    begin
        lvMasterkbn := MKBN_KAMOKU;  		// 科目
        lvMdlKbn  := 0;
        lvPtnNo   := 1;
        lvTableName := 'KmkMA';

        clblTitle   := LDKamoku;   			// Title
        cNumEdit    := TMNumEdit(Sender);   // ｺｰﾄﾞEdit
       	strWhere := 'KmkMA.SumKbn = 0 and KmkMA.RDelKbn = 0 and KmkMA.MasterKbn = 1 ';
        									// 入力不可区分、正残
        strWhere := strWhere + 'and ((KmkMA.InputKbn = 0) or ';
        if Sender = cEdtK1DNum then			// 借方
        begin
            strWhere := strWhere + '((KmkMA.InputKbn = 1) and (KmkMA.DCKbn = 0))) ';
	        clblName := cLblK1DDsc;         // 名称ﾗﾍﾞﾙ
        end
        else								// 貸方
        begin
            strWhere := strWhere + '((KmkMA.InputKbn = 2) and (KmkMA.DCKbn = 1))) ';
	        clblName := cLblK1CDsc;
        end;
    end
    else
    begin
    	Exit;
    end;
// <HIS0052> ADD end

// <HIS0052> DEL start
(*
    else
    begin
    	nIndex		:=	0;

    	case	TWinControl(Sender).TabOrder	of
	    	0..1:	nIndex:=0;	//	科目
		    2..3:	nIndex:=1;	//	細目科目
    		4..6:	nIndex:=2;	//	部門
	    	7..9:	nIndex:=3;	//	セグメント１
		    10..12:	nIndex:=4;	//	第１補助
    		13..15:	nIndex:=5;	//	第２補助
	    	16..18:	nIndex:=6;	//	工事
		    19..21:	nIndex:=7;	//	工種

    		22..23:	nIndex:=8;	//	科目
	    	24..25:	nIndex:=9;	//	細目科目
		    26..28:	nIndex:=10;	//	部門
    		29..31:	nIndex:=11;	//	セグメント１
	    	32..34:	nIndex:=12;	//	第１補助
		    35..37:	nIndex:=13;	//	第２補助
    		38..40:	nIndex:=14;	//	工事
	    	41..43:	nIndex:=15;	//	工種
		    else	Exit;
    	end;

    	nDivision	:= nIndex	div	8;

        if ((nIndex = 0) or (nIndex = 8)) or ((nIndex = 1) or (nIndex = 9)) then
        begin
            //科目・補助科目
          	if	(CompName = 'cEdtK2DNum') then
    	    	nExCode		:= Trunc (cEdtK1DNum.Value)
	        else if	(CompName = 'cEdtK2CNum') then
	        	nExCode		:= Trunc (cEdtK1CNum.Value);


            lvMdlKbn  := 0;
            lvPtnNo   := 1;
            lvTableName := 'KmkMA';

            if (nIndex = 0) or (nIndex = 8) then
            begin
                lvMasterkbn := MASTER_SUBJECT;
                strWhere := fnMakeSQLConstructionKmkMA (MASTER_SUBJECT, nDivision, 0)
            end
            else
            begin
                lvMasterkbn := MASTER_SUBJECTPLUS;
                strWhere := fnMakeSQLConstructionKmkMA (MASTER_SUBJECTPLUS, nDivision, nExCode);
            end;
        end
        else if (m_stCurDtlCodeAttr [nIndex].nMasterDivision = MASTER_CUSTOMER) or
            (m_stCurDtlCodeAttr [nIndex].nMasterDivision = MASTER_CUSTOMERPLUS01) or
            (m_stCurDtlCodeAttr [nIndex].nMasterDivision = MASTER_CUSTOMERPLUS02) then
        begin
            // 取引先
            lvMasterkbn := MASTER_CUSTOMERPLUS01;
            lvMdlKbn  := 6;
            lvPtnNo   := 1;
            lvTableName := 'MTOKUI';
            strWhere := 'MTOKUI.RDelKbn = 0 and MTOKUI.SumKbn = 0';
        end
        else
        begin
            // その他
            lvMasterkbn := m_stCurDtlCodeAttr [nIndex].nMasterDivision;
            lvMdlKbn  := 0;
            lvPtnNo   := 1;
            lvTableName := 'HojyoMA';
            strWhere := 'HojyoMA.RDelKbn = 0 and HojyoMA.SumKbn = 0 and HojyoMA.MasterKbn = '
                    + IntToStr(m_stCurDtlCodeAttr [nIndex].nMasterDivision);
        end;

        StrKbn := Copy(CompName,5,3);

        clblTitle   := TMLabel   (MJSFindCtrl (Self, 'cLbl' + StrKbn + 'Ttle'));   // Title
        cTxtEdit    := TMTxtEdit (MJSFindCtrl (Self, 'cEdt' + StrKbn + 'Fre'));    // TMTxt
        cNumEdit    := TMNumEdit (MJSFindCtrl (Self, 'cEdt' + StrKbn + 'Num'));    // TMNum
        clblName    := TMLabel   (MJSFindCtrl (Self, 'cLbl' + StrKbn + 'Dsc'));    // Name

    end;
*)
// <HIS0052> DEL end

    lvExpSend.MasterKbn     :=  lvMasterkbn;
    lvExpSend.ModulKbn      :=  lvMdlkbn;
    lvExpSend.PatternNo     :=  lvPtnNo;
    lvExpSend.TBarNM        :=  clblTitle.Caption +  '検索ｴｸｽﾌﾟﾛｰﾗ';
    lvExpSend.TableName     :=  lvTableName;
    lvExpSend.TrRootCaption :=  clblTitle.Caption;
    lvExpSend.WhereStr := strWhere;

    if CompName = 'DtlCEdtExCd' then
        lvExpSend.SortStr  := 'Order by TekiMA.SumKbn,TekiMA.GCode';

   //共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode))>0 then     //中身あり?
    begin
        if cNumEdit.Visible  then
            cNumEdit.Value := StrToFloat(lvExpRecv.GCode)
        else
            cTxtEdit.Text  := lvExpRecv.GCode;

        if CompName = 'DtlCEdtExCd' then
            DtlCmnEditName.Text := lvExpRecv.NM
        else
            clblName.Caption := lvExpRecv.Nmk;


    end;

    Keybd_Event(VK_RETURN, 0, 0, 0);            //Enter ｷｰのｴﾐｭﾚｲﾄ

    abort;


end;
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnDtlCmnGridColumnExCodeOnEditButtonClick (TObject)								*/
//*																											*/
//*	目的	: 摘要登録処理 科目連想ｸﾞﾘｯﾄﾞ[連想科目ｺｰﾄﾞ] OnEditButtonClick ｲﾍﾞﾝﾄ								*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnDtlCmnGridColumnExCodeOnEditButtonClick (Sender: TObject);
var
//	cMasWndParam: TJNTMasWndParam2;
//	cMasWndIF	: TJNTMasWndIF2;
//	nCount		: Integer;					// <HIS0052> DEL
//	nPosition	: Integer;					// <HIS0052> DEL
//	strDummy	: String;                   // <HIS0052> DEL
    lvExpSend   : rcJNTExpSend;             // 渡すﾊﾟﾗﾒｰﾀ
    lvExpRecv   : rcJNTExpRecv;             // 戻り
    iExpRtn     : Integer;
//    iMasterKbn  : Integer;				// <HIS0052> DEL
begin
// <HIS0039>複数選択検索EXP出力の予定
    fnJNTExpMakeParam(@lvExpSend);          // ﾊﾟﾗﾒｰﾀ初期設定

    // 送信ﾊﾟﾗﾒｰﾀ
    lvExpSend.pMjsAppRec    :=  m_pRec;     // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;   // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ModulKbn      :=  0;          // ﾓｼﾞｭｰﾙ区分
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;

    lvExpSend.MasterKbn     :=  1;          // ﾏｽﾀ区分
    lvExpSend.PatternNo     :=  1;          // ﾊﾟﾀｰﾝNO
    lvExpSend.WhereStr      := 'SumKbn = 0';
                                            // ﾀｲﾄﾙﾊﾞｰ
//    lvExpSend.TBarNM        :=  strTrRootCaption + '検索ｴｸｽﾌﾟﾛｰﾗ';
                                            // ﾃｰﾌﾞﾙ名
//    lvExpSend.TableName     :=  strTableName;
                                            // ﾙｰﾄｷｬﾌﾟｼｮﾝ
//    lvExpSend.TrRootCaption :=  strTrRootCaption;

                                            // 検索ｴｸｽﾌﾟﾛｰﾗ表示
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <> 1 then                    // ｷｬﾝｾﾙ
        Exit;

	DtlCmnMemDataControl.Open ();

    DtlCmnMemData.Edit;
                                            // 科目連想ｺｰﾄﾞ
	DtlCmnMemData.FieldByName ('nExCode'       ).AsInteger	:= StrToInt (lvExpRecv.GCode);
                                            // 科目連想名称
	DtlCmnMemData.FieldByName ('strSubjectDesc').AsString	:= lvExpRecv.Nmk;
                                            // 摘要残高区分
    DtlCmnMemData.FieldByName ('nDivisionData' ).AsInteger  :=
            fnGetControlDivision(StrToInt(lvExpRecv.GCode), Trunc (DtlCEdtExCd.Value));
	DtlCmnMemData.Post;

// <HIS0039>↑

{
	SetLength (m_arAssSubjects, 0);

	cMasWndIF	:= TJNTMasWndIF2.Create ();
	cMasWndIF.Init (Pointer (m_pRec));

	cMasWndParam	:= TJNTMasWndParam2.CreateParam ();

	cMasWndParam.m_GCodeFD		:= 'GCode';												// ｺｰﾄﾞ      ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_RenCharFD	:= 'Renso'; 											// 連想ｼﾝﾎﾞﾙ ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_SimpleNameFD	:= 'SimpleName';										// 簡略名称  ﾌｨｰﾙﾄﾞ名
	cMasWndParam.m_TableName	:= 'KmkMA';												// ﾃｰﾌﾞﾙ名
	cMasWndParam.m_SQL_Where	:= fnMakeSQLConstructionKmkMA (MASTER_SUBJECT, 0, 0);	// WHERE区
	cMasWndParam.m_pApRec		:= Pointer (m_pRec);									// ApRecのﾎﾟｲﾝﾀ
	cMasWndParam.m_iCodeLength	:= 6;													// ｺｰﾄﾞ桁数
	cMasWndParam.m_iCodeAttr	:= 0;													// ｺｰﾄﾞ属性
	cMasWndParam.m_ColorCASE	:= JNTMASWND_COLOR_KAMOK_SEIZOU_BLUE;

	if	(not DtlCmnMemData.IsEmpty ()) then
	begin
		with (DtlCmnDataSource.DataSet) do
		begin
			if	(not DtlCmnGrid.Columns [1].ReadOnly) then
			begin
				if	(not fnCheckSubjectCodeAss (Trunc (FieldByName ('nExCode').AsInteger), strDummy)) then
					DtlCmnMemData.Delete ();
			end;
		end;

		DtlCmnMemData.First ();

		nCount	:= 0;

		while (not DtlCmnMemData.Eof) do
		begin
			SetLength (m_arAssSubjects     , Length (m_arAssSubjects     ) + 1);
			SetLength (cMasWndParam.m_arDef, Length (cMasWndParam.m_arDef) + 1);

			m_arAssSubjects [Length (m_arAssSubjects) - 1].nExCode			:= DtlCmnMemData.FieldValues ['nExCode'];
			m_arAssSubjects [Length (m_arAssSubjects) - 1].nCtrlDivision	:= DtlCmnMemData.FieldValues ['nCtrlDivision'];
            // ﾃﾞﾌｫﾙﾄでﾁｪｯｸをつける項目
			cMasWndParam.m_arDef [nCount].m_ExpRetCode	:= IntToStr (DtlCmnMemData.FieldValues ['nExCode']);

			nCount	:= nCount + 1;

			DtlCmnMemData.Next ();
		end;
	end;

	if	(cMasWndIF.DoDlg (cMasWndParam) = mrOK) then
	begin
		m_fUnderConstruction2	:= true;

		DtlCmnMemData.Close ();
		DtlCmnMemData.Open  ();

		DtlCmnMemDataControl.Open ();

		for	nCount := 0 to High (cMasWndParam.m_arRet) do
		begin
			DtlCmnMemData.Append ();
			DtlCmnMemData.FieldByName ('nExCode'       ).AsInteger	:=
															 StrToInt (cMasWndParam.m_arRet [nCount].m_ExpRetCode);
			DtlCmnMemData.FieldByName ('strSubjectDesc').AsString	:= cMasWndParam.m_arRet [nCount].m_ExpRetText;

			for	nPosition := 0 to Length (m_arAssSubjects) - 1 do
			begin
				if	(DtlCmnMemData.FieldByName ('nExCode').AsInteger = m_arAssSubjects [nPosition].nExCode) then
					Break;
			end;

			if	(nPosition < Length (m_arAssSubjects)) then
				DtlCmnMemData.FieldByName ('nDivisionData').AsInteger	:= m_arAssSubjects [nPosition].nCtrlDivision
			else
				DtlCmnMemData.FieldByName ('nDivisionData').AsInteger	:= fnGetControlDivision (
							StrToInt (cMasWndParam.m_arRet [nCount].m_ExpRetCode), Trunc (DtlCEdtExCd.Value));

			DtlCmnMemData.Post ();
		end;

		m_fUnderConstruction2	:= false;
	end;

	cMasWndParam.Free ();
	cMasWndIF   .Term ();
	cMasWndIF   .Free ();
}
end;
//-----------------------------------------------------------------------------
procedure TJNTCRP020000f.B_SearchClick(Sender: TObject);
var
    lvExpSend   :   rcJNTExpSend;   // 親BPL送信ﾃﾞｰﾀｲﾝﾀｰﾌｪｽ構造体
    lvExpRecv   :   rcJNTExpRecv;   // 親BPL受信ﾃﾞｰﾀｲﾝﾀｰﾌｪｽ構造体
    iExpRtn     :   Integer;        // 戻り値

    lvMasterKbn :   Integer;
    lvTableName :   String;
    lvWhereStr  :   String;

    Qe          :   TMQuery;

begin

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam( @lvExpSend );
    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec    :=  m_pRec;                                 // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;                           // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;        //
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;        //


    lvMasterKbn := 61;
    lvTableName := 'TekiMA';
    lvWhereStr  := 'TekiMA.MASTERKBN = 61 AND TekiMA.RDelKbn = 0';

    lvExpSend.MasterKbn     :=  lvMasterKbn;                // ﾏｽﾀ区分
    lvExpSend.ModulKbn      :=  0;                          // ﾓｼﾞｭｰﾙ区分(共通=0)
    lvExpSend.PatternNo     :=  1;                          // ﾊﾟﾀｰﾝNo.
    lvExpSend.TBarNM        :=  '検索ｴｸｽﾌﾟﾛｰﾗ';             // ﾂｰﾙﾊﾞｰｷｬﾌﾟｼｮﾝ
    lvExpSend.TableName     :=  lvTableName;                // ﾃｰﾌﾞﾙ名
    lvExpSend.WhereStr      :=  lvWhereStr;

    lvExpSend.SortStr       :=  'Order By TekiMA.SumKbn,TekiMA.GCode';

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if ( iExpRtn <> 1 ) then  //ｷｬﾝｾﾙ
        Exit;

    // 中身あり
    if ( Length(Trim(lvExpRecv.GCode)) > 0 ) then
    begin
    	Qe	:= TMQuery.Create (Self);
	    m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

       	with  Qe do
        begin
	        Close ();
       		SQL.Clear ();
            SQL.add(' Select * From TekiMA '+
                   ' Where NCode = :Code ');

            SetFld('Code').AsFloat := lvExpRecv.NCode;

            Open;

    		m_SearchInfo.iTekiCD    := StrToInt(lvExpRecv.GCode);
            m_SearchInfo.iSumKbn    := GetFld('SumKbn').AsInteger;
    		m_SearchInfo.iItem      := 0;
	    	m_SearchInfo.bFstFlg    := False;

            Close;
            Free;
        end;

		CmnTreeView.SetFocus;

		fnSearch();
    end;
end;

//**********************************************************************
//*		Proccess	:	検索
//*		Name		:	H.Endo(MJS)
//*		Date		:	2004/06/28
//*		Parameter	:   Nothing
//*		Return		:	Nothing
//**********************************************************************
procedure TJNTCRP020000f.fnSearch;
begin
	if fnDownSearch() = True then
	begin
		if m_SearchInfo.bFstFlg = False then
		begin
			m_SearchInfo.iStItem := CmnComboBoxInstruction.ItemIndex;
			m_SearchInfo.bFstFlg := True;
		end;
		exit;
	end;

	while True do
	begin
		// 1件も一致しなかった時
		if (m_SearchInfo.bFstFlg = False) then
        begin
    		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,31 );
	    	MjsMessageBoxEx(Self,m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,
				m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype ,
				m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
			break;
        end;

		// 最後まで検索した時
		if (m_SearchInfo.bFstFlg = True) then
		begin
    		m_cComArea.m_MsgStd.GetMsg( m_cErrorMsgRec, 30,32 );
	    	MjsMessageBoxEx(Self,m_cErrorMsgRec.sMsg, m_cErrorMsgRec.sTitle,
				m_cErrorMsgRec.icontype , m_cErrorMsgRec.btntype ,
				m_cErrorMsgRec.btndef,m_cErrorMsgRec.LogType);
			break;
		end;
	end;
end;


//**********************************************************************
//*		Proccess	:	検索処理
//*		Name		:	H.Endo(MJS)
//*		Date		:	2004/06/28
//*		Parameter	:	Nothing
//*		Return		:	一致(True)/不一致(False)
//**********************************************************************
function TJNTCRP020000f.fnDownSearch: Boolean;
var
	wkRec	: ^TreeViewRec;
	i		: Integer;
begin
	Result := False;
	for i:=m_SearchInfo.iItem to CmnTreeView.Items.Count-1 do
    begin
        wkRec   := CmnTreeView.Items[i].Data;

		if (wkRec.nExCode   = m_SearchInfo.iTekiCD) and
           (wkRec.nDivision = m_SearchInfo.iSumKbn) then
//           (wkRec.nDivision = 0) then
		begin
			CmnTreeView.Items[i].Selected := True;
			m_SearchInfo.iItem := i+1;
			Result := True;
			break;
		end
	end;

{
	for i:=m_SearchInfo.iItem to CmnTreeView.Items.Count-1 do
    begin
        wkRec   := CmnTreeView.Items[i].Data;

		if (wkRec.nExCode   = m_SearchInfo.iTekiCD) and
           (wkRec.nDivision = m_SearchInfo.iSumKbn) then
//           (wkRec.nDivision = 1) then
		begin
			CmnTreeView.Items[i].Selected := True;
			m_SearchInfo.iItem := i+1;
			Result := True;
			break;
		end
	end;
}
end;

procedure TJNTCRP020000f.CmnTreeViewExit(Sender: TObject);
begin
   	m_SearchInfo.iTekiCD    := 0;
end;
//**********************************************************************
//*		Proccess	:	権限取得
//**********************************************************************
procedure TJNTCRP020000f.fnGetGrants();
begin

    m_cJNTArea.FxPermission;						                // 権限取得

//<HIS0042>
	CmnToolbarButtonPrint.Enabled := m_cJNTArea.IsPrint;			// 印刷権限
//	CmnToolbarButtonPrint.Enabled := False;
//<HIS0042>
    if ( m_cJNTArea.IsKessan(TRUE) = 1 ) then		                // 決算確定MSG
    begin
        m_nReferMode	:= REFER;						            // 決算確定の為参照のみ
        m_IsUpdate  := False;
    end
    else
	begin
        if m_cJNTArea.IsAppend and m_cJNTArea.IsModify then
            m_IsUpdate := True
        else
            m_IsUpdate := False;


		if ( m_IsUpdate ) then
	        m_nReferMode	:= NORMAL					// 通常処理
		else
			m_nReferMode	:= REFER;					// 更新権限無し

// <HIS0062> ADD start ｸﾞﾙｰﾌﾟ会計 翌期更新処理区分の考慮
        // 元々参照権限の場合は以下の処理は行わない。
        if ( m_nReferMode = REFER ) then
		begin
			Exit;
		end;

        // 親会社の過年度DBを選択している場合
        if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_PARENT ) then
        begin    							// 翌期更新済み
            if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
            begin                       	// 「･･･ﾏｽﾀの修正を行いますか？」
                if ( MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Oya,
                                        MSGCAP_GRP, mjQuestion, mjYesNo, mjDefNO) = mrYES ) then
                begin						// 「はい」
                    // 通常のﾏｽﾀ登録として起動する。
                    // 登録したﾏｽﾀについて_RELの作成はしない。(Triggerでﾁｪｯｸを行う)
                    m_nReferMode	:= NORMAL;  // 通常ﾓｰﾄﾞ
                end
                else						// 「いいえ」
                begin
                    // 更新ﾎﾞﾀﾝは、入力不可の状態で起動する。
                    // ﾏｽﾀをUpdata、Insertすることはできない。
                    m_cJNTArea.Invalidity;
                    m_nReferMode := REFER;	// 参照ﾓｰﾄﾞ
                    m_IsUpdate  := false;
                end;
            end;
        end
        // 子会社(ｸﾞﾙｰﾌﾟ会計採用有)
        else if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD ) then
        begin
            // 子会社が過年度DBの場合
            if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
            begin                           // 「･･･参照のみの起動となります。」
                MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_K,
                                    MSGCAP_GRP, mjInformation, mjOk, mjDefOk);
                m_cJNTArea.Invalidity;
                m_nReferMode := REFER;		// 参照ﾓｰﾄﾞ
                m_IsUpdate  := false;
            end
            // 親会社が過年度DBの場合
            else if  ( m_SyncMaster.m_PEComKbn5 = 1 ) then
            begin                           // 「･･･参照のみの起動となります。」
                MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_O,
                                    MSGCAP_GRP, mjInformation, mjOk, mjDefOk);
                m_cJNTArea.Invalidity;
                m_nReferMode := REFER;		// 参照ﾓｰﾄﾞ
                m_IsUpdate  := false;
            end;
        end;
// <HIS0062> ADD end

	end;

end;
//<PRN>********* ↓↓↓ 以下印刷処理 ↓↓↓ ******************************


//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   B_PrintClick
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCmnToolbarButtonPrintOnClick (Sender: TObject);
//<PRN>  begin
//<PRN>  PrintDlg ();
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
        // 固定摘要登録ﾘｽﾄ
    	C_TOUROKU:
          begin
            	m_nOrderDivision	:= uvHani.pvrOrder;             		// 出力順: 0=ｺｰﾄﾞ順, 1=連想順
            	m_strExCodeScopeStr	:= uvHani.pvrStCode[0];         		// 開始外部ｺｰﾄﾞ
            	m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];		    		// 終了外部ｺｰﾄﾞ
                m_iHnSitei          := uvHani.pvrRgType[0];                 // 範囲指定:0:なし,1:あり

    			fnCreatePrintMem1 ();
	    		cMemDataWork	:= DPrintdxMemData1;
            end;

        //<HIS0043>
        // 科目連想登録ﾘｽﾄ(科目ｺｰﾄﾞ順)
    	C_KMKRENSO:
            begin
            	m_nOrderDivision	:= uvHani.pvrOrder;             		// 出力順: 0=ｺｰﾄﾞ順, 1=連想順
            	m_strExCodeScopeStr	:= uvHani.pvrStCode[0];         		// 開始外部ｺｰﾄﾞ
            	m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];		    		// 終了外部ｺｰﾄﾞ
                m_iHnSitei          := uvHani.pvrRgType[0];                 // 範囲指定:0:なし,1:あり

    			fnCreatePrintMem5 ();
	    		cMemDataWork	:= DPrintdxMemData5;
            end;
        //<HIS0043>

        //<HIS0044>
        // 科目連想登録ﾘｽﾄ(摘要ｺｰﾄﾞ順)

    	C_TEKIRENSO:
            begin
            	m_nOrderDivision	:= uvHani.pvrOrder;             		// 出力順: 0=ｺｰﾄﾞ順, 1=連想順
            	m_strExCodeScopeStr	:= uvHani.pvrStCode[0];         		// 開始外部ｺｰﾄﾞ
            	m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];		    		// 終了外部ｺｰﾄﾞ
                m_iHnSitei          := uvHani.pvrRgType[0];                 // 範囲指定:0:なし,1:あり

    			fnCreatePrintMem6 ();
	    		cMemDataWork	:= DPrintdxMemData6;
            end;
        //<HIS0044>

        //<HIS0052>
        // 仕訳辞書摘要登録ﾘｽﾄ
        C_SWDICTEKI:
        	begin
            	m_nOrderDivision	:= uvHani.pvrOrder;             		// 出力順: 0=ｺｰﾄﾞ順, 1=連想順
            	m_strExCodeScopeStr	:= uvHani.pvrStCode[0];         		// 開始外部ｺｰﾄﾞ
            	m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];		    		// 終了外部ｺｰﾄﾞ
                m_iHnSitei          := uvHani.pvrRgType[0];                 // 範囲指定:0:なし,1:あり

                fnCreatePrintSwDicTeki();
                cMemDataWork := DPrintdxMemData2;
											// CSV用MemDataも渡す
				PrtParam.TargetParam := @DMemSwDicTekiCSV;
            end;
        //<HIS0052>
//{ <HIS0053> DEL
        //<HIS0046>
        // 固定摘要一覧表
    	C_ICHIRAN:
            begin
    			fnCreatePrintIchiran ();
	    		cMemDataWork	:= CmnMemDataPrintKanaOrder;
            end;
        //<HIS0046>

        //<HIS0047>
        // 固定摘要体系登録ﾘｽﾄ
        C_TAIKEI:
            begin
            	m_nOrderDivision	:= uvHani.pvrOrder;             		// 出力順: 0=ｺｰﾄﾞ順, 1=連想順
            	m_strExCodeScopeStr	:= uvHani.pvrStCode[0];         		// 開始外部ｺｰﾄﾞ
            	m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];		    		// 終了外部ｺｰﾄﾞ
                m_iHnSitei          := uvHani.pvrRgType[0];                 // 範囲指定:0:なし,1:あり

    			fnCreatePrintTaikei ();
	    		cMemDataWork	:= DPrintdxMemData4;
            end;
        //<HIS0047>

        //<HIS0048>
        // 固定摘要分類登録ﾘｽﾄ
        C_BUNRUI:
            begin
            	m_nOrderDivision	:= uvHani.pvrOrder;             		// 出力順: 0=ｺｰﾄﾞ順, 1=連想順
            	m_strExCodeScopeStr	:= uvHani.pvrStCode[0];         		// 開始外部ｺｰﾄﾞ
            	m_strExCodeScopeEnd	:= uvHani.pvrEdCode[0];		    		// 終了外部ｺｰﾄﾞ
                m_iHnSitei          := uvHani.pvrRgType[0];                 // 範囲指定:0:なし,1:あり

    			fnCreatePrintBunrui ();
	    		cMemDataWork	:= DPrintdxMemData3;
            end;
        //<HIS0048>
//} <HIS0053> DEL
    end;

    uvHani.pvrYearKbn   := m_nDateFormatDivision;                           // 和暦西暦区分

    // <PRN>
    with PrtParam do
  	begin
    	Para		:=  uvHani;
        TargetMD    :=  cMemDataWork;
       	CorpSys		:=  uvSelSys;
   	end;

    //印刷する<PRN>
    PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);
    m_cJNTArea.SetMasAppRecord;

end;
//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   PrintMem1
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCreatePrintMem1 ();
var
//	stMessageRec: TMJSMsgRec;				// <HIS0052> DEL
	DQuery   : TMQuery;

begin
	DQuery := TMQuery.Create( Self );                         //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DQuery );    //  DBとMQueryの接続

    DPrintdxMemData1.Close();
	DPrintdxMemData1.Open;

	//固定摘要登録リスト
	if m_iHnSitei = 0 then
	begin
        DQuery.Close;
		DQuery.SQL.Clear;
		DQuery.SQL.Add('select MA.Gcode,MA.Renso,MA.TekiChar, ');
		DQuery.SQL.Add('MA.ExgKbn,MA.BunCode,MA.ZanKbn,MA.UpdDateTM,F.FusenKbn, ');
		DQuery.SQL.Add('Sw.StaxKbn,Sw.StaxCode,Sw.StaxRate,Sw.TypeCode from TekiMA MA ');
        DQuery.SQL.Add('Left Outer Join MFusenInfo F On (MA.Ncode = F.NCode ');
		DQuery.SQL.Add('and MA.MasterKbn = F.MasterKbn) ');
// <HIS0052> MOD start
//		DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.Ncode = Sw.TekiNcode ');
		DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.Ncode = Sw.NCode ');
// <HIS0052> MOD end
		DQuery.SQL.Add('and MA.Masterkbn = Sw.MasterKbn) ');
		DQuery.SQL.Add('where MA.Sumkbn = 0 and MA.RDelkbn = 0 ');
		if m_nOrderDivision = 0 then
			DQuery.SQL.Add('Order By MA.Gcode')
		else
			DQuery.SQL.Add('Order By MA.Renso');
		DQuery.Open;
	end
	else if m_iHnSitei = 1 then
	begin

//<D10>Del St 下に移動
{
        if m_strExCodeScopeStr = JNTSelXRightAddch('', 16, ' ') then
            m_iExCodeStr := 0
        else
            m_iExCodeStr := StrToInt(m_strExCodeScopeStr);

        if m_strExCodeScopeEnd = JNTSelXRightAddch('', 16, #255) then
            m_iExCodeEnd := 999999
        else
            m_iExCodeEnd := StrToInt(m_strExCodeScopeEnd);
}
//<D10>Del Ed

		DQuery.Close;
		DQuery.SQL.Clear;
		DQuery.SQL.Add('select MA.Gcode,MA.Renso,MA.TekiChar, ');
		DQuery.SQL.Add('MA.ExgKbn,MA.BunCode,MA.ZanKbn,MA.UpdDateTM,F.FusenKbn, ');
		DQuery.SQL.Add('Sw.StaxKbn,Sw.StaxCode,Sw.StaxRate,Sw.TypeCode from TekiMA MA ');
        DQuery.SQL.Add('Left Outer Join MFusenInfo F On (MA.Ncode = F.NCode ');  // HIS0029
		DQuery.SQL.Add('and MA.MasterKbn = F.MasterKbn) ');
// <HIS0052> MOD start
//		DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.Ncode = Sw.TekiNcode ');
		DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.Ncode = Sw.NCode ');
// <HIS0052> MOD end
		DQuery.SQL.Add('and MA.Masterkbn = Sw.MasterKbn) ');
		DQuery.SQL.Add('where MA.Sumkbn = 0 and MA.RDelkbn = 0 ');
		DQuery.SQL.Add('and MA.Gcode >= :Sta and MA.Gcode <= :End');
//<D10>Upd St Paramに入れる値を、Char型の16桁まで０埋めされているDBの値に合わせる
//		DQuery.ParamByName('Sta').AsInteger := m_iExCodeStr;
//		DQuery.ParamByName('End').AsInteger := m_iExCodeEnd;
		if m_strExCodeScopeStr = JNTSelXRightAddch('', 16, ' ') then
            DQuery.ParamByName('Sta').AsString := '0000000000000000'
        else
            DQuery.ParamByName('Sta').AsString := m_strExCodeScopeStr; //DBの値

        if m_strExCodeScopeEnd = JNTSelXRightAddch('', 16, #255) then
            DQuery.ParamByName('End').AsString := '0000000000999999'
        else
            DQuery.ParamByName('End').AsString := m_strExCodeScopeEnd; //DBの値
//<D10>Upd Ed
		if m_nOrderDivision = 0 then
			DQuery.SQL.Add('Order By MA.Gcode')
		else
			DQuery.SQL.Add('Order By MA.Renso');
		DQuery.Open
	end;

	while (not DQuery.Eof) do
	begin
		DPrintdxMemData1.Append;
   	    DPrintdxMemData1.FieldByName('Gcode').AsInteger    := DQuery.GetFld('Gcode').AsInteger;
		DPrintdxMemData1.FieldByName('RenChar').AsString   := DQuery.GetFld('Renso').AsString;
		DPrintdxMemData1.FieldByName('TekiChar').AsString  := DQuery.GetFld('TekiChar').AsString;

   	   	case DQuery.GetFld('ZanKbn').AsInteger of
    	   	0 : DPrintdxMemData1.FieldByName('ZanKbn').AsString    := '';//'なし';
   	    	1 : DPrintdxMemData1.FieldByName('ZanKbn').AsString    := 'あり';
		end;

		if DQuery.GetFld('ExgKbn').AsInteger = 0 then
		begin
   			DPrintdxMemData1.FieldByName('ExgKbn').AsString := '';//'なし';
            DPrintdxMemData1.FieldByName('BunCode').AsString := '';
		end
		else
		begin
			case (DQuery.FieldByName ('ExgKbn').AsInteger) of
   		       	 0 : DPrintdxMemData1.FieldByName('ExgKbn').AsString := '';
				22 : DPrintdxMemData1.FieldByName('ExgKbn').AsString := '取引先';
				23 : DPrintdxMemData1.FieldByName('ExgKbn').AsString := '得意先';
				24 : DPrintdxMemData1.FieldByName('ExgKbn').AsString := '仕入先';
	        end;

			case DQuery.GetFld('BunCode').AsInteger of
				0 : DPrintdxMemData1.FieldByName('BunCode').AsString := 'その他一般';
				1 : DPrintdxMemData1.FieldByName('BunCode').AsString := '連結子会社';
				2 : DPrintdxMemData1.FieldByName('BunCode').AsString := '非連結子会社';
				3 : DPrintdxMemData1.FieldByName('BunCode').AsString := '関連会社';
			end;
		end;
   	    DPrintdxMemData1.FieldByName('UpdateTime').AsDateTime := DQuery.GetFld('UpdDateTM').AsDateTime;

   	    case DQuery.GetFld('StaxKbn').AsInteger of
			0 : DPrintdxMemData1.FieldByName('StaxKbn').AsString := '';//'なし';
			1 : DPrintdxMemData1.FieldByName('StaxKbn').AsString := '売上';
			2 : DPrintdxMemData1.FieldByName('StaxKbn').AsString := '仕入';
		end;

		if DQuery.GetFld('StaxCode').AsInteger = 0 then
		begin
   			DPrintdxMemData1.FieldByName('StaxRate').AsString  := '';
	    	DPrintdxMemData1.FieldByName('TypeCode').AsString  := '';
       	end
		else
		begin
			DPrintdxMemData1.FieldByName('StaxCode').AsInteger  := DQuery.GetFld('StaxCode').AsInteger;

            //<HIS0101> MOD st
	        //case DQuery.GetFld('StaxRate').AsInteger of
		    //    0 : DPrintdxMemData1.FieldByName('StaxRate').AsString := '';
			//	1 : DPrintdxMemData1.FieldByName('StaxRate').AsString := '３％';
			//	2 : DPrintdxMemData1.FieldByName('StaxRate').AsString := '５％';
			//end;
           	DPrintdxMemData1.FieldByName('StaxRate').AsString := GetSTaxRateName(DQuery.GetFld('StaxRate').AsInteger);
			//<HIS0101> MOD ed
//<HIS0105> MOD St
{
			case DQuery.GetFld('TypeCode').AsInteger of
   		        0 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '';
				1 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '第１';
				2 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '第２';
				3 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '第３';
				4 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '第４';
				5 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '第５';
			end;
}
            if (GetTypeCodeName(DQuery.GetFld('TypeCode').AsInteger) = '') then
            begin
                DPrintdxMemData1.FieldByName('TypeCode').AsString := '';
            end
            else
            begin
                DPrintdxMemData1.FieldByName('TypeCode').AsString :=
                    Format('第%s', [MjsHankToZen(DQuery.GetFld('TypeCode').AsString)]);
            end;
//<HIS0105> MOD Ed
		end;

		if	(DQuery.GetFLD('FusenKbn').AsInteger = 0) then								// 付箋区分
			TGraphicField (DPrintdxMemData1.FieldByName ('Fusen')).Clear
		else
			TGraphicField (DPrintdxMemData1.FieldByName ('Fusen')).AsSign (fnGetTagColorBitmap (DQuery.GetFld ('FusenKbn').AsInteger));

   		DPrintdxMemData1.Post;
		DQuery.Next;
	end;

	DQuery.Close;
	DQuery.Free;

end;

//<HIS0043>
//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   PrintMem5
//*     Name            :   Y.Aoki　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCreatePrintMem5 ();
var
    DQuery   : TMQuery;
	DMQuery  : TMQuery;
	iCount   : Integer;
begin
	DQuery := TMQuery.Create( Self );                         //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DQuery );    //  DBとMQueryの接続
    DMQuery := TMQuery.Create( Self );                        //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DMQuery );   //  DBとMQueryの接続

    DPrintdxMemData5.Close();
	DPrintdxMemData5.Open;

    if m_iHnSitei = 0 then
	begin
        DQuery.Close;
		DQuery.SQl.Clear;
		DQuery.SQL.Add('select GCode,NCode,Renso,SimpleName from KmkMA ');
		DQuery.SQL.Add('where MasterKbn = 1 and SumKbn = 0 and ');
		DQuery.SQL.Add('RDelKbn = 0 ');
        DQuery.SQL.Add('Order By GCode');

		DQuery.Open;
	end
	else if m_iHnSitei = 1 then
	begin

        if m_strExCodeScopeStr = JNTSelXRightAddch('', 16, ' ') then
            m_iExCodeStr := 0
        else
            m_iExCodeStr := StrToInt(m_strExCodeScopeStr);

        if m_strExCodeScopeEnd = JNTSelXRightAddch('', 16, #255) then
            m_iExCodeEnd := 99999999
        else
            m_iExCodeEnd := StrToInt(m_strExCodeScopeEnd);

        DQuery.Close;
		DQuery.SQl.Clear;
		DQuery.SQL.Add('select GCode,NCode,Renso,SimpleName from KmkMA ');
		DQuery.SQL.Add('where MasterKbn = 1 and SumKbn = 0 and ');
		DQuery.SQL.Add('RDelKbn = 0 ');
		DQuery.SQL.Add('and     GCode >= :Sta and GCode <= :End ');
		DQuery.ParamByName('Sta').AsInteger := m_iExCodeStr;
		DQuery.ParamByName('End').AsInteger := m_iExCodeEnd;
        DQuery.SQL.Add('Order By GCode');

        DQuery.Open;

	end;

    while (not DQuery.Eof) do
	begin

        iCount := 0;

        DPrintdxMemData5.Append;

        DPrintdxMemData5.FieldByName('KGcodeC').AsInteger 	:= DQuery.GetFld('GCode').AsInteger;
		DPrintdxMemData5.FieldByName('RenChar').AsString	:= DQuery.GetFld('Renso').AsString;
		DPrintdxMemData5.FieldByName('KTekicharN').AsString := DQuery.GetFld('SimpleName').AsString;

        DMQuery.Close;
		DMQuery.SQL.Clear;
		DMQuery.SQL.Add('select MA.GCode,MA.Renso,MA.TekiChar from TekiMA MA ');
		DMQuery.SQL.Add('Right Outer Join TekiTree Tree On (Tree.SumNCode = :iNCode ');
		DMQuery.SQL.Add('and MA.MasterKbn = Tree.MasterKbn and MA.Ncode = Tree.BasedNCode) ');
		DMQuery.SQL.Add('where MA.Sumkbn = 0 and MA.RDelKbn = 0 ');
		DMQuery.SQL.Add('Order By MA.GCode ');
		DMQuery.ParamByName('iNCode').AsFloat := DQuery.GetFld('NCode').AsFloat;
		DMQuery.Open;

        while (not DMQuery.Eof) do
		begin
			if iCount = 0 then
			begin
                DPrintdxMemData5.FieldByName('MGcodec').AsInteger 	:= DMQuery.GetFld('GCode').AsInteger;
				DPrintdxMemData5.FieldByName('TRenChar').AsString	:= DMQuery.GetFld('Renso').AsString;
				DPrintdxMemData5.FieldByName('MTekiCharN').AsString := DMQuery.GetFld('TekiChar').AsString;
				DPrintdxMemData5.Post;
				inc(iCount);
			end
			else
			begin
				DPrintdxMemData5.Append;
                DPrintdxMemData5.FieldByName('MGcodec').AsInteger 	:= DMQuery.GetFld('GCode').AsInteger;
				DPrintdxMemData5.FieldByName('TRenChar').AsString	:= DMQuery.GetFld('Renso').AsString;
				DPrintdxMemData5.FieldByName('MTekiCharN').AsString := DMQuery.GetFld('TekiChar').AsString;
				DPrintdxMemData5.Post;
			end;

        	DMQuery.Next;
		end;

        DQuery.Next;

	end;

    DQuery.Close;
    DMQuery.Close;
	DQuery.Free;
    DMQuery.Free;

end;

//<HIS0043>

//<HIS0044>
//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   PrintMem6
//*     Name            :   Y.Aoki　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.fnCreatePrintMem6 ();
var
	DQuery   : TMQuery;
    DMQuery  : TMQuery;
    iCount   : Integer;
//    iNCode   : Integer;					// <HIS0052> DEL
begin
	DQuery := TMQuery.Create( Self );                         //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DQuery );    //  DBとMQueryの接続
    DMQuery := TMQuery.Create( Self );                        //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DMQuery );   //  DBとMQueryの接続


    DPrintdxMemData6.Close();
	DPrintdxMemData6.Open;

    if m_iHnSitei = 0 then
	begin
        DQuery.Close;
	    DQuery.SQl.Clear;
	    DQuery.SQL.Add('select MA.GCode,MA.NCode,MA.Renso,MA.TekiChar, ');
	    DQuery.SQL.Add('Sw.StaxKbn,Sw.StaxCode ');
	    DQuery.SQL.Add('from TekiMA MA     ');
// <HIS0052> MOD start
//	    DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.NCode = Sw.TekiNCode ');
	    DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.NCode = Sw.NCode ');
// <HIS0052> MOD end
	    DQuery.SQL.Add('and MA.MasterKbn = Sw.Masterkbn ) ');
	    DQuery.SQL.Add('where              ');
        // HIS0049 ↓
	    //DQuery.SQL.Add('	MA.MasterKbn = 61 ');
        DQuery.SQL.Add('	MA.MasterKbn = :nMasKbn ');
        // HIS0049 ↑

	    DQuery.SQL.Add('and MA.SumKbn    = 0  ');
	    DQuery.SQL.Add('and MA.RDelKbn = 0  ');

        DQuery.ParamByName('nMasKbn').AsInteger   := MKBN_KOTEKI; // HIS0049

        if m_nOrderDivision = 0 then
			DQuery.SQL.Add('Order By MA.GCode')
		else
			DQuery.SQL.Add('Order By MA.Renso,MA.GCode');

        DQuery.Open;
	end
	else if m_iHnSitei = 1 then
	begin

        if m_strExCodeScopeStr = JNTSelXRightAddch('', 16, ' ') then
            m_iExCodeStr := 0
        else
            m_iExCodeStr := StrToInt(m_strExCodeScopeStr);

        if m_strExCodeScopeEnd = JNTSelXRightAddch('', 16, #255) then
            m_iExCodeEnd := 999999
        else
            m_iExCodeEnd := StrToInt(m_strExCodeScopeEnd);

        DQuery.Close;
	    DQuery.SQl.Clear;
	    DQuery.SQL.Add('select MA.GCode,MA.NCode,MA.Renso,MA.TekiChar, ');
	    DQuery.SQL.Add('Sw.StaxKbn,Sw.StaxCode ');
	    DQuery.SQL.Add('from TekiMA MA     ');
// <HIS0052> MOD start
//	    DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.NCode = Sw.TekiNCode ');
	    DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.NCode = Sw.NCode ');
// <HIS0052> MOD end
	    DQuery.SQL.Add('and MA.MasterKbn = Sw.Masterkbn ) ');
	    DQuery.SQL.Add('where              ');

        // HIS0049 ↓
	    //DQuery.SQL.Add('	MA.MasterKbn = 61 ');
        DQuery.SQL.Add('	MA.MasterKbn = :nMasKbn ');
        // HIS0049 ↑

	    DQuery.SQL.Add('and MA.SumKbn    = 0  ');
	    DQuery.SQL.Add('and MA.RDelKbn = 0  ');
		DQuery.SQL.Add('and     MA.Gcode >= :Sta and MA.Gcode <= :End ');

        DQuery.ParamByName('nMasKbn').AsInteger     := MKBN_KOTEKI; // HIS0049
		DQuery.ParamByName('Sta').AsInteger         := m_iExCodeStr;
		DQuery.ParamByName('End').AsInteger         := m_iExCodeEnd;

        if m_nOrderDivision = 0 then
			DQuery.SQL.Add('Order By MA.GCode')
		else
			DQuery.SQL.Add('Order By MA.Renso,MA.GCode');

        DQuery.Open;

	end;

    while (not DQuery.Eof) do
	begin
        iCount	:= 0;

		DPrintdxMemData6.Append;
		DPrintdxMemData6.FieldByName('TekiCode').AsInteger	:= DQuery.GetFld('GCode').AsInteger;
		DPrintdxMemData6.FieldByName('TRenChar').AsString	:= DQuery.GetFld('Renso').AsString;
		DPrintdxMemData6.FieldByName('TekiChar').AsString	:= DQuery.GetFld('TekiChar').AsString;

		if	(DQuery.GetFld('StaxKbn').Asinteger=1)or(DQuery.GetFld('StaxKbn').Asinteger=2)	then
		begin
			if	DQuery.GetFld('StaxCode').AsInteger=0 then
            	DPrintdxMemData6.FieldByName('TaxCode').AsString	:= '科目に従う'
			else	DPrintdxMemData6.FieldByName('TaxCode').AsString	:=IntToStr (DQuery.GetFld('StaxCode').AsInteger);
        end;

        DMQuery.Close;
		DMQuery.SQL.Clear;
		DMQuery.SQL.Add('select MA.GCode, MA.Renso, MA.SimpleName ');
		DMQuery.SQL.Add('from   KmkMA MA ');
		DMQuery.SQL.Add('Right  Outer Join TekiTree Tree on (Tree.SumNCode   = MA.NCode ');
		DMQuery.SQL.Add('and    Tree.BasedNCode = :NCode) ');
        // HIS0049 ↓
        //DMQuery.SQL.Add('where  Tree.MasterKbn = 61 ');
        DMQuery.SQL.Add('where  Tree.MasterKbn = :nMasKbn ');
        // HIS0049 ↑

		DMQuery.SQL.Add('and    Tree.TekiKbn   = 2  ');
		DMQuery.SQL.Add('and    MA.MasterKbn   = 1 ');
		DMQuery.SQL.Add('and    MA.SumKbn      = 0 ');
		DMQuery.SQL.Add('and    MA.RDelKbn   = 0 ');
		DMQuery.SQL.Add('Order By MA.GCode ');

        DMQuery.ParamByName('nMasKbn').AsInteger    := MKBN_KOTEKI; // HIS0049
		DMQuery.ParamByName('NCode').AsFloat	    := DQuery.GetFld('NCode').AsFloat;

        DMQuery.Open;

        while not DMQuery.Eof do
		begin
            if iCount = 0 then
			begin
				DPrintdxMemData6.FieldByName('KmkCode').AsInteger		:= DMQuery.GetFld('GCode').AsInteger;
				DPrintdxMemData6.FieldByName('RenChar').AsString		:= DMQuery.GetFld('Renso').AsString;
				DPrintdxMemData6.FieldByName('SimpleName').AsString		:= DMQuery.GetFld('SimpleName').AsString;
				DPrintdxMemData6.Post;

				inc(iCount);
			end
			else
			begin
				DPrintdxMemData6.Append;

				DPrintdxMemData6.FieldByName('KmkCode').AsInteger		:= DMQuery.GetFld('GCode').AsInteger;
				DPrintdxMemData6.FieldByName('RenChar').AsString		:= DMQuery.GetFld('Renso').AsString;
				DPrintdxMemData6.FieldByName('SimpleName').AsString		:= DMQuery.GetFld('SimpleName').AsString;
				DPrintdxMemData6.Post;

			end;

			DMQuery.Next;
		end;

		DQuery.Next;
	end;

    DQuery.Close;
    DMQuery.Close;
	DQuery.Free;
    DMQuery.Free;

end;
//<HIS0044>

//<HIS0046>
//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   fnCreatePrintIchiran
//*     Name            :   Y.Aoki　　　　　　
//*                         2006.01.30
//************************************************************************
procedure	TJNTCRP020000f.fnCreatePrintIchiran ();
var
	dqMasterData: TMQuery;
	nCount		: Integer;
	nCountUnit	: Integer;
	nCountTotal	: Integer;

begin
	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	CmnMemDataPrintKanaOrder.Active	:= false;
	CmnMemDataPrintKanaOrder.Active	:= true;

	nCountTotal	:= 0;

	with (dqMasterData) do
	begin
		for	nCount := 0 to C_KANASU do      // ｶﾅの1音ずつ50音順にｺｰﾄﾞと名称を取得
		begin
			nCountUnit	:= 0;

			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT GCode, TekiChar FROM TekiMA ');
			SQL.Add   ('WHERE  MasterKbn = :nMasKbn AND SumKbn = 0 AND RDelKbn = 0 AND ');
			SQL.Add   ('       Renso >= :strAssScopeStr AND Renso < :strAssScopeEnd ORDER BY GCode');

            ParamByName('nMasKbn').AsInteger        := MKBN_KOTEKI;
			ParamByName ('strAssScopeStr').AsString	:= _KanaOrderChar [nCount];
			ParamByName ('strAssScopeEnd').AsString	:= _KanaOrderChar [nCount + 1];

			Open ();

			while (not EOF) do
			begin
				if	(nCountUnit = 0) then   // 50音のﾀｲﾄﾙ表示
				begin
					CmnMemDataPrintKanaOrder.Append		 ();
					CmnMemDataPrintKanaOrder.FieldByName ('strDescription').AsString	:= '【 ' + _KanaOrderSymbol [nCount] + ' 】';
					CmnMemDataPrintKanaOrder.Post		 ();
				end;
                                            // ｺｰﾄﾞ・名称をｾｯﾄ
				CmnMemDataPrintKanaOrder.Append		 ();
				CmnMemDataPrintKanaOrder.FieldByName ('nExCode'       ).AsInteger	:= FieldByName ('GCode'   ).AsInteger;
				CmnMemDataPrintKanaOrder.FieldByName ('strDescription').AsString	:= FieldByName ('TekiChar').AsString;
				CmnMemDataPrintKanaOrder.Post		 ();

				nCountUnit	:= nCountUnit  + 1;
				nCountTotal	:= nCountTotal + 1;

				NEXT;
			end;

			if	((nCount <> C_KANASU) and (nCountUnit > 0)) then
			begin                           // ｶﾅの1音取得後、ｽﾍﾟｰｽをあける
				CmnMemDataPrintKanaOrder.Append ();
				CmnMemDataPrintKanaOrder.Post	();
			end;
		end;

		nCountUnit	:= 0;

        Close ();

        // 連想が空のものを取得
		SQL.Clear ();
		SQL.Add   ('SELECT GCode, TekiChar FROM TekiMA ');
		SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = 0 AND RDelKbn = 0 AND ');
		SQL.Add   ('       (Renso < :strAssScopeStr OR Renso >= :strAssScopeEnd) ORDER BY GCode');

		ParamByName ('strAssScopeStr').AsString	:= _KanaOrderChar [ 0];
		ParamByName ('strAssScopeEnd').AsString	:= _KanaOrderChar [C_KANASU + 1];

		Open ();

		while (not EOF) do
		begin
			if	(nCountUnit = 0) then       // 連想ありのﾃﾞｰﾀとの間を2行あける
			begin
				CmnMemDataPrintKanaOrder.Append ();
				CmnMemDataPrintKanaOrder.Post	();
				CmnMemDataPrintKanaOrder.Append ();
				CmnMemDataPrintKanaOrder.Post	();
			end;
                                            // ｺｰﾄﾞ・名称をｾｯﾄ
			CmnMemDataPrintKanaOrder.Append		 ();
			CmnMemDataPrintKanaOrder.FieldByName ('nExCode'       ).AsInteger	:= FieldByName ('GCode'   ).AsInteger;
			CmnMemDataPrintKanaOrder.FieldByName ('strDescription').AsString	:= FieldByName ('TekiChar').AsString;
			CmnMemDataPrintKanaOrder.Post		 ();

			nCountUnit	:= nCountUnit  + 1;
			nCountTotal	:= nCountTotal + 1;

			NEXT;
		end;
	end;

	if	(nCountTotal > 0) then              // 件数表示
	begin
		CmnMemDataPrintKanaOrder.Append (); // 2行あける
		CmnMemDataPrintKanaOrder.Post	();
		CmnMemDataPrintKanaOrder.Append ();
		CmnMemDataPrintKanaOrder.Post	();

		CmnMemDataPrintKanaOrder.Append ();
		CmnMemDataPrintKanaOrder.FieldByName ('strDescription').AsString	:=
																'【登録件数】' + Format (' %d 件', [nCountTotal]);
		CmnMemDataPrintKanaOrder.Post	();
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

end;
//<HIS0046>

//<HIS0047>
//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   fnCreatePrintTaikei
//*     Name            :   Y.Aoki　　　　　　
//*                         2006.01.31
//************************************************************************
procedure	TJNTCRP020000f.fnCreatePrintTaikei ();
var
    iCount:Integer;
    QryTeki,QryTeKiTree:TMQuery;
begin
    //固定摘要体系登録リスト

  	QryTeki := TMQuery.Create( Self );                         //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, QryTeki );    //  DBとMQueryの接続
    QryTeKiTree := TMQuery.Create( Self );
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, QryTeKiTree );

    DPrintdxMemData4.Close();
	DPrintdxMemData4.Open;

    if m_iHnSitei = 0 then              // 範囲指定なし
	begin
        // 親のｺｰﾄﾞ・名称を取得
        QryTeki.Close;
		QryTeki.SQl.Clear;
		QryTeki.SQL.Add('select Gcode, NCode,TekiChar ');
        QryTeki.SQL.Add(' from TekiMA ');
        QryTeki.SQL.Add(' where MasterKbn = :nMasKbn and SumKbn = 1 and RDelKbn = 0 ');
        QryTeki.SQL.Add(' Order By Gcode');

        QryTeki.ParamByName('nMasKbn').AsInteger    := MKBN_KOTEKI;

		QryTeki.Open;
	end
    else if m_iHnSitei = 1 then         // 範囲指定あり
	begin

        // 開始・終了ｺｰﾄﾞを整体
        if m_strExCodeScopeStr = JNTSelXRightAddch('', 16, ' ') then
            m_iExCodeStr := 0
        else
            m_iExCodeStr := StrToInt(m_strExCodeScopeStr);

        if m_strExCodeScopeEnd = JNTSelXRightAddch('', 16, #255) then
            m_iExCodeEnd := 999999
        else
            m_iExCodeEnd := StrToInt(m_strExCodeScopeEnd);

        // 親のｺｰﾄﾞ・名称を取得
        QryTeki.Close;
		QryTeki.SQl.Clear;
		QryTeki.SQL.Add('select Gcode, NCode, TekiChar ');
        QryTeki.SQL.Add(' from TekiMA  ');
		QryTeki.SQL.Add('where MasterKbn = :nMasKbn and SumKbn = 1 and RDelKbn = 0 ');
		QryTeki.SQL.Add('and Gcode >= :Sta and Gcode <= :End ');
        QryTeki.SQL.Add('Order By Gcode ');

        QryTeki.ParamByName('nMasKbn').AsInteger    := MKBN_KOTEKI;
        QryTeki.ParamByName('Sta').AsInteger        := m_iExCodeStr;
		QryTeki.ParamByName('End').AsInteger        := m_iExCodeEnd;

		QryTeki.Open;
    end;

    while (not QryTeki.Eof) do
	begin
		iCount := 0;

		DPrintdxMemData4.Append;
		DPrintdxMemData4.FieldByName('Gcode').AsInteger  := QryTeki.GetFld('GCode').AsInteger;
		DPrintdxMemData4.FieldByName('BunName').AsString := QryTeki.GetFld('TekiChar').AsString;

        // 子のｺｰﾄﾞ・名称を取得
   		QryTeKiTree.Close;
		QryTeKiTree.SQL.Clear;
		QryTeKiTree.SQL.Add('select Tree.BasedNCode, MA.Gcode, MA.Ncode, MA.TekiChar ');
        QryTeKiTree.SQL.Add('from TekiTree Tree ');
		QryTeKiTree.SQL.Add('Left Outer Join TekiMA MA On (Tree.SumNCode = :fNCode ');
		QryTeKiTree.SQL.Add('and MA.Masterkbn = Tree.Masterkbn and MA.Ncode = Tree.BasedNCode) ');
		QryTeKiTree.SQL.Add('where MA.Sumkbn = 0 and MA.RDelKbn = 0');

        QryTeKiTree.ParamByName('fNCode').AsFloat := QryTeki.GetFld('NCode').AsFloat;

		QryTeKiTree.Open;

		if (QryTeKiTree.GetFld('Ncode').IsNull)  then   // ﾃﾞｰﾀがないとき
		begin
			DPrintdxMemData4.Post;
            QryTeki.Next;
		end
		else                                            // ﾃﾞｰﾀがあるとき
		begin
			while (not QryTeKiTree.Eof) do
			begin
				if iCount = 0 then                      // 先頭ﾚｺｰﾄﾞのとき
				begin
					inc(iCount);
				end
				else                                    // それ以外
				begin
	        	   	DPrintdxMemData4.Append;
   		    	end;
//<HIS0099> ADD St
                DPrintdxMemData4.FieldByName('Gcode').AsInteger  := QryTeki.GetFld('GCode').AsInteger;
                DPrintdxMemData4.FieldByName('BunName').AsString := QryTeki.GetFld('TekiChar').AsString;
//<HIS0099> ADD Ed
                DPrintdxMemData4.FieldByName('GcodeT').AsInteger  := QryTeKiTree.GetFld('Gcode').AsInteger;
                DPrintdxMemData4.FieldByName('TekiChar').AsString := QryTeKiTree.GetFld('TekiChar').AsString;
				DPrintdxMemData4.Post;
                QryTeKiTree.Next;
			end;
			QryTeki.Next;
		end;
	end;

    QryTeki.Close;
    QryTeKiTree.Close;
    QryTeki.Free;
    QryTeKiTree.Free;

end;
//<HIS0047>
//<HIS0048>
//************************************************************************
//*     ProgramID       :   JNTCRP020000
//*     Component       :   fnCreatePrintBunrui
//*     Name            :   Y.Aoki　　　　　　
//*                         2006.02.01
//************************************************************************
procedure	TJNTCRP020000f.fnCreatePrintBunrui ();
var
	QryBun   : TMQuery;
begin
	//固定摘要分類リスト
    QryBun := TMQuery.Create(Self);                             //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, QryBun );      //  DBとMQueryの接続

	DPrintdxMemData3.Close();
	DPrintdxMemData3.Open;

	if m_iHnSitei = 0 then              // 範囲指定なし
	begin
        QryBun.Close;
		QryBun.SQl.Clear;
		QryBun.SQL.Add('select Gcode, Renso, TekiChar, UpdDateTM ');
		QryBun.SQL.Add('from TekiMA ');
        QryBun.SQL.Add('where MasterKbn = :nMasKbn and SumKbn = 1 and RDelKbn = 0 ');

        QryBun.ParamByName('nMasKbn').AsInteger   := MKBN_KOTEKI;

                                        // ｺｰﾄﾞ順
		if m_nOrderDivision = 0 then
			QryBun.SQL.Add('Order By Gcode')
		else                            // 連想順
            QryBun.SQL.Add('Order By Renso, GCode ');

		QryBun.Open;
	end
    else if m_iHnSitei = 1 then         // 範囲指定あり
	begin

        // 開始・終了ｺｰﾄﾞを整体
        if m_strExCodeScopeStr = JNTSelXRightAddch('', 16, ' ') then
            m_iExCodeStr := 0
        else
            m_iExCodeStr := StrToInt(m_strExCodeScopeStr);

        if m_strExCodeScopeEnd = JNTSelXRightAddch('', 16, #255) then
            m_iExCodeEnd := 999999
        else
            m_iExCodeEnd := StrToInt(m_strExCodeScopeEnd);

        QryBun.Close;
		QryBun.SQl.Clear;
		QryBun.SQL.Add('select Gcode,Renso, TekiChar, UpdDateTM ');
		QryBun.SQL.Add('from TekiMA ');
        QryBun.SQL.Add('where MasterKbn = :nMasKbn and SumKbn = 1 and RDelKbn = 0 ');
		QryBun.SQL.Add('and Gcode >= :Sta and Gcode <= :End ');

        QryBun.ParamByName('nMasKbn').AsInteger     := MKBN_KOTEKI;
        QryBun.ParamByName('Sta').AsInteger         := m_iExCodeStr;
		QryBun.ParamByName('End').AsInteger         := m_iExCodeEnd;

		if m_nOrderDivision = 0 then    // ｺｰﾄﾞ順
			QryBun.SQL.Add('Order By Gcode')
		else                            // 連想順
            QryBun.SQL.Add('Order By Renso, GCode ');

		QryBun.Open;
	end;

	while (not QryBun.Eof) do
	begin
        DPrintdxMemData3.Append;
		DPrintdxMemData3.FieldByName('Gcode').AsInteger         := QryBun.GetFld('Gcode').AsInteger;
		DPrintdxMemData3.FieldByName('TekiChar').AsString       := QryBun.GetFld('TekiChar').AsString;
       	DPrintdxMemData3.FieldByName('RenChar').AsString        := QryBun.GetFld('Renso').AsString;
		DPrintdxMemData3.FieldByName('UpDateTime').AsDateTime   := QryBun.GetFld('UpdDateTM').AsDateTime;
   	    DPrintdxMemData3.Post;
       	QryBun.Next;
	end;

    QryBun.Close;
    QryBun.Free;

end;
//<HIS0048>
//<HIS0052>
//**************************************************************************
//	Proccess	:	仕訳辞書摘要登録ﾘｽﾄMemData作成 <HIS0052>
//	Name	  	:	K.Katou
//	Date	  	:	2006/12/19
//	Parameter 	:	なし
//	Retrun	  	:	なし
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP020000f.fnCreatePrintSwDicTeki();
var
	iCnt		: Integer;
    iMasterKbn	: Integer;					// ﾏｽﾀ区分
	iDKmkCode	: Integer;					// 借方科目ｺｰﾄﾞ
    iCKmkCode	: Integer;					// 貸方科目ｺｰﾄﾞ
    strDKmkName	: String;					// 借方科目名称
    strCKmkName	: String;					// 貸方科目名称
    strCode		: String;
    strName		: String;
	strSQL		: String;
	QryDic		: TMQuery;
	aryDHojyo	: TAryDicPrint;				// 借方補助
	aryCHojyo	: TAryDicPrint;				// 貸方補助
	aryDHojyoOut: TAryDicPrint;				// 借方補助(ファイル出力用) <HIS0091>ADD
	aryCHojyoOut: TAryDicPrint;				// 貸方補助(ファイル出力用) <HIS0091>ADD

    //************************************************
	//* 配列の中身を上に詰める
    //************************************************
	procedure ReMakeAry(var aryHojyo: TAryDicPrint);
	var
		iCnt: Integer;
		iBk	: Integer;
	begin
		for iCnt := 0 to High(aryHojyo) do
		begin
        									// ｶﾗの場合
        	if (aryHojyo[iCnt].strCode = '') and
            	(aryHojyo[iCnt].strName = '') then
            begin
				for iBk := iCnt + 1 to High(aryHojyo) do
                begin    					// ｶﾗ?
		        	if (aryHojyo[iBk].strCode = '') and
	        	    	(aryHojyo[iBk].strName = '') then
                    begin
                    	Continue;
                    end
                    else					// 中身が入ってる
                    begin                   // 上に詰める
						aryHojyo[iCnt] := aryHojyo[iBk];
						aryHojyo[iBk].strCode := '';
						aryHojyo[iBk].strName := '';
						aryHojyo[iBk].iAttr := 0;
						aryHojyo[iBk].iDigit := 0;
                        break;
                    end;
                end;
            end;
		end;
	end;
begin
	QryDic := TMQuery.Create(Self);                             //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, QryDic );      //  DBとMQueryの接続

	DPrintdxMemData2.Close();				// 帳票MemData
	DPrintdxMemData2.Open();

	DMemSwDicTekiCSV.Close();				// CSVMemData
	DMemSwDicTekiCSV.Open();

	strSQL := 'SELECT MA.GCode, MA.Renso, MA.TekiChar, MA.BusDicKbn, ' +
    			'MA.ZanKbn, MA.UpdDateTM, DIC.*, FSN.FusenKbn ' +
				'FROM TekiMA MA ' +
        		'Left Outer Join MFusenInfo FSN ON (MA.NCode = FSN.NCode ' +
				'AND MA.MasterKbn = FSN.MasterKbn) ' +
				'LEFT OUTER JOIN SwDicTeki DIC ON (MA.NCode = DIC.NCode ' +
        		'AND MA.MasterKbn = DIC.MasterKbn ) ' +
				'WHERE MA.MasterKbn = :parMasterKbn ' +
// <HIS0063> MOD start
//				'AND MA.SumKbn = 0 AND MA.RDelKbn = 0 ';
// ↓↓<HIS0092>↓↓
//              'AND MA.SumKbn = 0 AND MA.RDelKbn = 0 AND BusDicKbn = 1 ';
				'AND MA.SumKbn = 0 AND MA.RDelKbn = 0 ' +
                'AND (MA.BusDicKbn = 1 OR ' +
                '    (DIC.DKmkNCode > 0 AND DIC.CKmkNCode > 0)) ';
// ↑↑<HIS0092>↑↑
// <HIS0063> MOD end

    QryDic.Close;
	QryDic.SQL.Clear;

	if m_iHnSitei = 0 then              	// 範囲指定なし
	begin
		QryDic.SQL.Add(strSQL);
        QryDic.ParamByName('parMasterKbn').AsInteger := MKBN_KOTEKI;
	end
    else if m_iHnSitei = 1 then         	// 範囲指定あり
	begin
        // 開始・終了ｺｰﾄﾞを整体
        if m_strExCodeScopeStr = JNTSelXRightAddch('', 16, ' ') then
            m_iExCodeStr := 0
        else
            m_iExCodeStr := StrToInt(m_strExCodeScopeStr);

        if m_strExCodeScopeEnd = JNTSelXRightAddch('', 16, #255) then
            m_iExCodeEnd := 999999
        else
            m_iExCodeEnd := StrToInt(m_strExCodeScopeEnd);

		strSQL := strSQL + 'AND MA.GCode >= :parSta AND GCode <= :parEnd ';
		QryDic.SQL.Add(strSQL);

        QryDic.ParamByName('parMasterKbn').AsInteger := MKBN_KOTEKI;
        QryDic.ParamByName('parSta').AsInteger := m_iExCodeStr;
		QryDic.ParamByName('parEnd').AsInteger := m_iExCodeEnd;
	end;
                                        	// ｺｰﾄﾞ順
	if m_nOrderDivision = 0 then
		QryDic.SQL.Add('ORDER BY MA.GCode')
	else                            		// 連想順
        QryDic.SQL.Add('ORDER BY MA.Renso, MA.GCode ');

	if not QryDic.Open() then
	begin
		Exit;
	end;

	while (not QryDic.Eof) do
	begin
        DPrintdxMemData2.Append;

		// 付箋区分
		if	(QryDic.FieldByName ('FusenKbn').AsInteger = 0) then
			TGraphicField (DPrintdxMemData2.FieldByName ('Fusen')).Clear
		else
			TGraphicField (DPrintdxMemData2.FieldByName ('Fusen')).Assign (fnGetTagColorBitmap (QryDic.GetFld ('FusenKbn').AsInteger));

   		// 借方　科目コード
		if	((QryDic.FieldByName ('DKmkNCode').IsNull) or (QryDic.GetFld('DKmkNCode').AsInteger = 0)) then
        begin
			DPrintdxMemData2.FieldByName ('DKmkCode').Clear ();
            DPrintdxMemData2.FieldByName ('DHojCode' ).AsString	:= '';
			DPrintdxMemData2.FieldByName ('DHojName' ).AsString	:= '';

			//	部署伝票辞書で置換の時
			if	(QryDic.FieldByName ('BusDicKbn').AsInteger = 1) and
				(QryDic.FieldByName ('DKmkKbn').AsInteger = 1)	then
			begin
				DPrintdxMemData2.FieldByName ('DKmkName').AsString := '置換科目';
			end;
		end
		else								// 科目ｺｰﾄﾞあり
		begin
			// 借方　科目コード
            DPrintdxMemData2.FieldByName ('DKmkCode').AsInteger	:= fnGetKmkGCodeInt(QryDic.GetFld('DKmkNCode').AsFloat);
			fnCheckExCodeKmkMA(MASTER_SUBJECT, 0, DPrintdxMemData2.FieldByName ('DKmkCode').AsInteger, '', strName);
			DPrintdxMemData2.FieldByName ('DKmkName').AsString	:= strName;
		end;

		// 科目ｺｰﾄﾞと名称を保存
		iDKmkCode := DPrintdxMemData2.FieldByName ('DKmkCode').AsInteger;
		strDKmkName := DPrintdxMemData2.FieldByName ('DKmkName').AsString;

   		// 貸方　科目コード
		if	((QryDic.FieldByName ('CKmkNCode').IsNull) or (QryDic.GetFld('CKmkNCode').AsInteger = 0)) then
        begin
			DPrintdxMemData2.FieldByName ('CKmkCode').Clear ();
            DPrintdxMemData2.FieldByName ('CHojCode' ).AsString	:= '';
			DPrintdxMemData2.FieldByName ('CHojName' ).AsString	:= '';

			//	部署伝票辞書で置換の時
			if	(QryDic.FieldByName ('BusDicKbn').AsInteger = 1) and
				(QryDic.FieldByName ('CKmkKbn').AsInteger = 1)	then
			begin
				DPrintdxMemData2.FieldByName ('CKmkName').AsString := '置換科目';
			end;
		end
		else								// 科目ｺｰﾄﾞあり
		begin
			// 貸方　科目コード
            DPrintdxMemData2.FieldByName ('CKmkCode').AsInteger	:= fnGetKmkGCodeInt(QryDic.GetFld('CKmkNCode').AsFloat);
			fnCheckExCodeKmkMA(MASTER_SUBJECT, 0, DPrintdxMemData2.FieldByName ('CKmkCode').AsInteger, '', strName);
			DPrintdxMemData2.FieldByName ('CKmkName').AsString	:= strName;
		end;

		// 科目ｺｰﾄﾞと名称を保存
		iCKmkCode := DPrintdxMemData2.FieldByName ('CKmkCode').AsInteger;
		strCKmkName := DPrintdxMemData2.FieldByName ('CKmkName').AsString;

		// 補助の外部ｺｰﾄﾞと名称を配列に詰めておく
		for iCnt := 0 to High(m_stAdoptInfo) do
		begin
											// ﾏｽﾀ区分
			iMasterKbn := m_stAdoptInfo[iCnt].nMasterDivision;
											// 借方
			if iDKmkCode <> 0 then			// 科目が設定されている場合
			begin
											// 外部ｺｰﾄﾞと名称取得
				GetSwDicPrnInfo(iMasterKbn, DC_KARIKATA, QryDic, strCode, strName);
				aryDHojyo[iCnt].strCode := strCode;
				aryDHojyo[iCnt].strName := strName;
				aryDHojyo[iCnt].iAttr := m_stAdoptInfo[iCnt].nCodeAttribute;
				aryDHojyo[iCnt].iDigit := m_stAdoptInfo[iCnt].nCodeDigit;
			end
            else
            begin
				aryDHojyo[iCnt].strCode := '';
				aryDHojyo[iCnt].strName := '';
				aryDHojyo[iCnt].iAttr := 0;
				aryDHojyo[iCnt].iDigit := 0;
           	end;

											// 貸方
			if iCKmkCode <> 0 then			// 科目が設定されている場合
			begin
				GetSwDicPrnInfo(iMasterKbn, DC_KASIKATA, QryDic, strCode, strName);
				aryCHojyo[iCnt].strCode := strCode;
				aryCHojyo[iCnt].strName := strName;
				aryCHojyo[iCnt].iAttr := m_stAdoptInfo[iCnt].nCodeAttribute;
				aryCHojyo[iCnt].iDigit := m_stAdoptInfo[iCnt].nCodeDigit;
			end
            else
            begin
				aryCHojyo[iCnt].strCode := '';
				aryCHojyo[iCnt].strName := '';
				aryCHojyo[iCnt].iAttr := 0;
				aryCHojyo[iCnt].iDigit := 0;
            end;
		end;

        // <HIS0091>ADD↓
        aryDHojyoOut := aryDHojyo;
        aryCHojyoOut := aryCHojyo;
        // <HIS0091>ADD↑

		// 配列の中身を上に詰める
		ReMakeAry(aryDHojyo);
		ReMakeAry(aryCHojyo);

		for iCnt := 0 to High(m_stAdoptInfo) do
		begin
        	if iCnt > 0 then				// 2行目以降
            begin							// 貸借どちらかの補助が設定されている場合
				if (aryDHojyo[iCnt - 1].strCode <> '') or (aryCHojyo[iCnt - 1].strCode <> '') then
                begin
                	DPrintdxMemData2.Append;
											// 行番号
					DPrintdxMemData2.FieldByName('iLine').AsInteger := iCnt + 1;
					DPrintdxMemData2.FieldByName('bDtlLast').AsBoolean := False;
											// 外部ｺｰﾄﾞ(Groupに使用)
					DPrintdxMemData2.FieldByName ('GCode').AsInteger := QryDic.FieldByName ('GCode').AsInteger;
                end;
            end;

//<HIS0092>	if iCnt < 4 then  				// 先頭4行
        	if iCnt < 5 then  				// 先頭5行 <HIS0092>ADD
            begin
				if DPrintdxMemData2.State <> dsInsert then
				begin
					DPrintdxMemData2.Append;
				end;
											// 外部ｺｰﾄﾞ
				DPrintdxMemData2.FieldByName ('GCode').AsInteger	:= QryDic.FieldByName ('GCode'   ).AsInteger;
											// 連想
				DPrintdxMemData2.FieldByName ('RenChar' ).AsString	:= QryDic.FieldByName ('Renso' ).AsString;
											// 摘要文字列
				DPrintdxMemData2.FieldByName ('TekiChar').AsString	:= QryDic.FieldByName ('TekiChar').AsString;
//↓↓<HIS0092>↓↓
//											// 残高管理区分
//				DPrintdxMemData2.FieldByName ('ZanKbn').AsString := GetZanKbnName(QryDic.FieldByName ('ZanKbn').AsInteger);
                // 残高管理区分
                if (QryDic.FieldByName('ZanKbn').AsInteger = 1) then
                    DPrintdxMemData2.FieldByName('ZanKbn').AsString	:= '摘要残高：管理あり'
                else
                    DPrintdxMemData2.FieldByName('ZanKbn').AsString	:= '摘要残高：管理なし';

                // 部署伝票の辞書
                if (QryDic.FieldByName('BusDicKbn').AsInteger = 1) then
                    DPrintdxMemData2.FieldByName('BusDicKbn').AsString := '部署伝票辞書：使用する'
                else
                    DPrintdxMemData2.FieldByName('BusDicKbn').AsString := '部署伝票辞書：使用しない';
//↑↑<HIS0092>↑↑
											// 更新日時
				DPrintdxMemData2.FieldByName ('UpdateTime').AsDateTime	:= QryDic.FieldByName ('UpdDateTM').AsDateTime;

				//	部署伝票辞書は消費税区分なし？
				if	(QryDic.FieldByName ('BusDicKbn').AsInteger = 0) then
											// 売上/仕入区分
				DPrintdxMemData2.FieldByName ('StaxKbn').AsString :=
							GetSTaxKbnName(QryDic.FieldByName ('StaxKbn').AsInteger);
											// 消費税ｺｰﾄﾞ
											// 科目設定に従う
				if	(QryDic.FieldByName ('STaxCode').AsInteger = 0) then
				begin
					DPrintdxMemData2.FieldByName ('STaxCode').Clear ();
					DPrintdxMemData2.FieldByName ('STaxRate').AsString	:= '';
					DPrintdxMemData2.FieldByName ('TypeCode').AsString	:= '';
		        end
				else
				begin
					DPrintdxMemData2.FieldByName ('STaxCode').AsInteger	:=
                    			QryDic.FieldByName ('STaxCode').AsInteger;
											// 消費税率
					DPrintdxMemData2.FieldByName('STaxRate').AsString :=
								GetSTaxRateName(QryDic.GetFld('STaxRate').AsInteger);
											// 業種ｺｰﾄﾞ
					DPrintdxMemData2.FieldByName ('TypeCode').AsString :=
								GetTypeCodeName(QryDic.FieldByName ('TypeCode').AsInteger);
				end;
            end;

            if iCnt > 0 then                // 2行目から補助を設定
            begin
											// 貸借どちらかの補助が設定されている場合
				if ((aryDHojyo[iCnt - 1].strCode <> '') or (aryCHojyo[iCnt - 1].strCode <> '')) then
				begin
											// 借方
					DPrintdxMemData2.FieldByName ('DHojCode').AsString := aryDHojyo[iCnt - 1].strCode;
					DPrintdxMemData2.FieldByName ('DHojName').AsString := aryDHojyo[iCnt - 1].strName;
					DPrintdxMemData2.FieldByName ('DiAttr').AsInteger := aryDHojyo[iCnt - 1].iAttr;
											// 貸方
					DPrintdxMemData2.FieldByName ('CHojCode').AsString := aryCHojyo[iCnt - 1].strCode;
					DPrintdxMemData2.FieldByName ('CHojName').AsString := aryCHojyo[iCnt - 1].strName;
					DPrintdxMemData2.FieldByName ('CiAttr').AsInteger := aryCHojyo[iCnt - 1].iAttr;
        		end;
			end;

			if DPrintdxMemData2.State = dsInsert then
			begin
											// 1ﾃﾞｰﾀ分の全行に設定する
											// 行番号
				DPrintdxMemData2.FieldByName('iLine').AsInteger := iCnt + 1;
				DPrintdxMemData2.FieldByName('bDtlLast').AsBoolean := False;

				DPrintdxMemData2.Post;
            end
            else
            begin
            	Break;
            end;
		end;
											// 明細の最後にﾏｰｸ
		DPrintdxMemData2.Edit;
		DPrintdxMemData2.FieldByName('bDtlLast').AsBoolean := True;
        DPrintdxMemData2.Post;
											// CSV用MemDataにもﾃﾞｰﾀ設定
	 //	CopyCSVSwDicTeki(QryDic, aryDHojyo, aryCHojyo);         // <HIS0091>DEL
        CopyCSVSwDicTeki(QryDic, aryDHojyoOut, aryCHojyoOut);   // <HIS0091>ADD
       	QryDic.Next;
	end;

    QryDic.Close;
    QryDic.Free;
end;
//<HIS0052>
//**************************************************************************
//	Proccess	:	仕訳辞書帳票の補助ｺｰﾄﾞ・名称取得 <HIS0052>
//	Name	  	:	K.Katou
//	Date	  	:	2006/12/19
//	Parameter 	:	iMasterKbn	ﾏｽﾀ区分
//				:	iDCKbn		借方/貸方
//				:	QryDic		仕訳辞書ｸｴﾘ
//				:	strCode		ｺｰﾄﾞ格納域
//				:	strName		名称格納域
//	Retrun	  	:	なし
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP020000f.GetSwDicPrnInfo(iMasterKbn: Integer; iDCKbn: Integer; QryDic: TMQuery;
									var strCode: String; var strName: String);
var
	iIndex		: Integer;
	iKbn		: Integer;		  			// 区分
	iKmkCode	: Integer;					// 科目外部ｺｰﾄﾞ
	exNCode		: Extended;		  			// 内部ｺｰﾄﾞ
    exKmkNCode	: Extended;					// 科目内部ｺｰﾄﾞ
begin
	strCode := '';
	strName := '';
	iIndex := GetMasterIndex(iMasterKbn);
											// 補助ﾏｽﾀの内部ｺｰﾄﾞ取得
	exNCode := GetDicNCode(iMasterKbn, iDCKbn, QryDic);
											// 区分取得
	iKbn	:= GetDicKbn(iMasterKbn, iDCKbn, QryDic);

	// 部署伝票辞書で可変の時
	if (QryDic.FieldByName ('BusDicKbn').AsInteger = 1)	and
		(iKbn = KBN_KAHEN)	then
	begin
    										// ｺｰﾄﾞにはﾏｽﾀ名称
    	strCode := m_stAdoptInfo[iIndex].strDescription;
		strName	:= PRN_TEXT_KAHEN;			// 可変ﾏｽﾀ
	end
	// 部署伝票で当該
	else if (QryDic.FieldByName ('BusDicKbn').AsInteger = 1) and
		(iKbn = KBN_TOUGAI) then
	begin
    										// ｺｰﾄﾞにはﾏｽﾀ名称
    	strCode := m_stAdoptInfo[iIndex].strDescription;
		strName := PRN_TEXT_TOUGAI;			// 当該ﾏｽﾀ
	end
	// 基準
	else
	begin
		if exNCode <> 0 then				// 何か入っている場合
		begin
			// 内部ｺｰﾄﾞから外部ｺｰﾄﾞと名称取得
            {// <HIS0090>DEL↓
											// 科目別補助
			if iMasterKbn = MKBN_SAIMOKU then
			begin
											// 借方
				if iDCKbn = DC_KARIKATA then
				begin
					exKmkNCode := QryDic.GetFld('DKmkNCode').AsFloat;
				end
				else						// 貸方
				begin
					exKmkNCode := QryDic.GetFld('CKmkNCode').AsFloat;
				end;
											// 科目外部ｺｰﾄﾞ
				iKmkCode := fnGetKmkGCodeInt(exKmkNCode);
											// 科目別補助外部ｺｰﾄﾞ
            	strCode := GetKmkHojDspCd(exKmkNCode, exNCode);
											// 名称取得
				fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS, iDCKbn,	iKmkCode, strCode, strName);
			end
			else							// その他ﾏｽﾀ
			begin
            	GetSwkDicName(iMasterKbn, exNCode, strCode, strName);
                							// 属性に従ってﾌｫｰﾏｯﾄ
        	    strCode := SetDspCodeAttr(strCode,
    	           						m_stAdoptInfo[iIndex].nCodeDigit,
                                        m_stAdoptInfo[iIndex].nCodeAttribute);
			end;
            }// <HIS0090>DEL↑
            // <HIS0090>ADD↓
            // 科目
			if iDCKbn = DC_KARIKATA then
				exKmkNCode := QryDic.GetFld('DKmkNCode').AsFloat
            else if iDCKbn = DC_KASIKATA then
				exKmkNCode := QryDic.GetFld('CKmkNCode').AsFloat
            else
                exKmkNCode := 0;

            // 外部ｺｰﾄﾞ、名称取得
          	GetSwkDicName(iMasterKbn, exKmkNCode, exNCode, strCode, strName);

            // 属性に従ってﾌｫｰﾏｯﾄ
            if iMasterKbn = MKBN_SAIMOKU then
                strCode := GetKmkHojDspCd(exKmkNCode, exNCode)
            else
        	    strCode := SetDspCodeAttr(strCode,
    	          					    m_stAdoptInfo[iIndex].nCodeDigit,
                                        m_stAdoptInfo[iIndex].nCodeAttribute);
            // <HIS0090>ADD↑
		end;
	end;

end;
// <HIS0052>
//**************************************************************************
//	Proccess	:	仕訳辞書摘要登録ﾘｽﾄのCSV用MemData作成 <HIS0052>
//	Name	  	:	K.Katou
//	Date	  	:	2006/12/21
//	Parameter 	:	QryDic		仕訳辞書ﾃﾞｰﾀ取得済みｸｴﾘ
//				:	aryDHojyo	借方補助配列
//				:	aryCHojyo	貸方補助配列
//	Retrun	  	:	なし
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP020000f.CopyCSVSwDicTeki(QryDic: TMQuery; aryDHojyo: TAryDicPrint; aryCHojyo: TAryDicPrint);
var
	iDC			: Integer;
    iCnt		: Integer;
	strName		: String;
	aryHojyo	: TAryDicPrint;

	// *********************************************************************
	// *	CSV用MemDataにｾｯﾄ
	// *********************************************************************
	procedure SetCSVData(iMasterKbn: Integer; iDCKbn: Integer;
    					aryHojyo: TAryDicPrint; strMaster: String; strCnt: String = '');
	var
		iIndex	: Integer;
		strDC	: String;
		strFld	: String;
	begin
		iIndex := GetMasterIndex(iMasterKbn);
		if iDCKbn = DC_KARIKATA then
		begin
			strDC := 'D';
			aryHojyo := aryDHojyo;
		end
		else
		begin
			strDC := 'C';
			aryHojyo := aryCHojyo;
		end;
		strFld := strDC + strMaster;
        if not QryDic.GetFld(strFld + 'Kbn' + strCnt).IsNull then
        begin
			DMemSwDicTekiCSV.FieldByName(strFld + 'Kbn' + strCnt).AsString :=
				GetKbnName(iMasterKbn, QryDic.GetFld(strFld + 'Kbn' + strCnt).AsInteger);
        end;
		DMemSwDicTekiCSV.FieldByName(strFld + 'Code' + strCnt).AsString := aryHojyo[iIndex].strCode;
		DMemSwDicTekiCSV.FieldByName(strFld + 'Name' + strCnt).AsString := aryHojyo[iIndex].strName;
	end;
begin
	DMemSwDicTekiCSV.Append;
	with QryDic do
	begin
											// 摘要ｺｰﾄﾞ
		DMemSwDicTekiCSV.FieldByName('GCode').AsInteger := GetFld('GCode').AsInteger;
											// 摘要文字列
		DMemSwDicTekiCSV.FieldByName('TekiChar').AsString := GetFld('TekiChar').AsString;
											// 連想
		DMemSwDicTekiCSV.FieldByName('RenChar').AsString := GetFld('Renso').AsString;
											// 売上/仕入区分
		if GetFld('BusDicKbn').AsInteger = 0 then
		begin
			DMemSwDicTekiCSV.FieldByName('STaxKbn').AsString := GetSTaxKbnName(GetFld('STaxKbn').AsInteger);
		end;
											// 消費税ｺｰﾄﾞ
											// 科目設定に従う
		if GetFld('STaxCode').AsInteger = 0 then
		begin
			DMemSwDicTekiCSV.FieldByName('STaxCode').Clear ();
			DMemSwDicTekiCSV.FieldByName('STaxRate').AsString	:= '';
			DMemSwDicTekiCSV.FieldByName('TypeCode').AsString	:= '';
		end
		else
		begin
			DMemSwDicTekiCSV.FieldByName ('STaxCode').AsInteger	:= GetFld('STaxCode').AsInteger;
											// 消費税率
			DMemSwDicTekiCSV.FieldByName('STaxRate').AsString := GetSTaxRateName(GetFld('STaxRate').AsInteger);
											// 業種ｺｰﾄﾞ
			DMemSwDicTekiCSV.FieldByName('TypeCode').AsString := GetTypeCodeName(GetFld('TypeCode').AsInteger);
		end;
											// 残高管理区分
		DMemSwDicTekiCSV.FieldByName('ZanKbn').AsString	:= GetZanKbnName(GetFld('ZanKbn').AsInteger);

//↓↓<HIS0092>↓↓
        // 部署伝票辞書
        if (GetFld('BusDicKbn').AsInteger = 1) then
            DMemSwDicTekiCSV.FieldByName('BusDicKbn').AsString	:= '使用する'
        else
            DMemSwDicTekiCSV.FieldByName('BusDicKbn').AsString	:= '使用しない';
//↑↑<HIS0092>↑↑

											// 更新日時
		DMemSwDicTekiCSV.FieldByName('UpdateTime').AsDateTime := GetFld('UpdDateTM').AsDateTime;

		// 借方科目
		DMemSwDicTekiCSV.FieldByName('DKmkKbn').AsString := GetKbnName(MKBN_KAMOKU, GetFld('DKmkKbn').AsInteger);
		DMemSwDicTekiCSV.FieldByName('DKmkCode').AsInteger := fnGetKmkGCodeInt(GetFld('DKmkNCode').AsFloat);
		fnCheckExCodeKmkMA(MASTER_SUBJECT, 0, DMemSwDicTekiCSV.FieldByName ('DKmkCode').AsInteger, '', strName);
		DMemSwDicTekiCSV.FieldByName('DKmkName').AsString := strName;

		// 貸方科目
		DMemSwDicTekiCSV.FieldByName('CKmkKbn').AsString := GetKbnName(MKBN_KAMOKU, GetFld('CKmkKbn').AsInteger);
		DMemSwDicTekiCSV.FieldByName('CKmkCode').AsInteger := fnGetKmkGCodeInt(GetFld('CKmkNCode').AsFloat);
		fnCheckExCodeKmkMA(MASTER_SUBJECT, 0, DMemSwDicTekiCSV.FieldByName ('CKmkCode').AsInteger, '', strName);
		DMemSwDicTekiCSV.FieldByName('CKmkName').AsString := strName;

		for iDC := DC_KARIKATA to DC_KASIKATA do	// 借方/貸方のﾙｰﾌﾟ
		begin
        	if iDC = DC_KARIKATA then
            begin
	            aryHojyo := aryDHojyo;
            end
        	else
            begin
	            aryHojyo := aryCHojyo;
            end;

			// 部門
			SetCSVData(MKBN_BUMON, iDC, aryHojyo, 'Bmn');

			// ﾌﾟﾛｼﾞｪｸﾄ1～10
			for iCnt := 1 to 10 do
			begin
				SetCSVData(MKBN_PROJECT1 + iCnt - 1, iDC, aryHojyo, 'Prj', IntToStr(iCnt));
                // <HIS0091>ADD↓
                // ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1～10
                SetCSVData(MKBN_PROSUB1 + iCnt - 1, iDC, aryHojyo, 'PjSub', IntToStr(iCnt));
                // <HIS0091>ADD↑
			end;

			{ // <HIS0091>DEL↓
            // ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1～10
			for iCnt := 1 to 10 do
			begin
				SetCSVData(MKBN_PROSUB1 + iCnt - 1, iDC, aryHojyo, 'PjSub', IntToStr(iCnt));
			end;
            } // <HIS0091>DEL↑

			// 科目別補助
			SetCSVData(MKBN_SAIMOKU, iDC, aryHojyo, 'Sub');
			// 銀行
			SetCSVData(MKBN_GINKOU, iDC, aryHojyo, 'Bank');

			// 取引先
			SetCSVData(MKBN_TORIHIKI, iDC, aryHojyo, 'Cs');

			// 社員
			SetCSVData(MKBN_SYAIN, iDC, aryHojyo, 'Emp');

			// 汎用補助1～5
			for iCnt := 1 to 5 do
			begin
				SetCSVData(MKBN_HHOJYO1 + iCnt - 1, iDC, aryHojyo, 'Mul', IntToStr(iCnt));
			end;

			// ｾｸﾞﾒﾝﾄ1～10
			for iCnt := 1 to 10 do
			begin
				SetCSVData(MKBN_SEG1 + iCnt - 1, iDC, aryHojyo, 'Seg', IntToStr(iCnt));
			end;
		end;
	end;
	DMemSwDicTekiCSV.Post;
end;
// <HIS0052>
//<CHK>
//**********************************************************************
//*		Proccess	:	削除ﾁｪｯｸ <CHK>
//*		Name		:	y.Aoki(PRIME)
//*		Date		:	2006/02/08
//*		Parameter	:	exNCode : ﾁｪｯｸ対象内部ｺｰﾄﾞ
//*                     strErr  : ｴﾗｰ時の理由格納域
//*		Return		:	削除可(TRUE)/削除不可(FALSE)
//**********************************************************************
function TJNTCRP020000f.fnDelCheck(exNCode: Extended; var strErr: String): Boolean;
var
//    CheckQry    : TMQuery;				// <HIS0052> DEL
    iRet        : Integer;
//    strMsg      : String;					// <HIS0052> DEL
begin
//↓<MLXDEP-2>本来なら資産のチェックを行うべきだが固定資産のTEKIMAのチェックがないのでこれです。
	if TMSeries.IsMjsLink3 = True then
	begin
		Result := True;
		Exit;
	end;
//↑<MLXDEP-2>

    Result := False;

    try
        SPMasTeki.Connection := m_cDBSelect;
        //SPMasTeki.SessionName  := m_cDBSelect.SessionName;

        // 【会計】MP_MAS_CHK_TEKIMA
        with SPMasTeki do
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
        strErr := '例外発生(MP_MAS_CHK_TEKIMA)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    try
        SPPayTeki.Connection := m_cDBSelect;
        //SPPayTeki.SessionName  := m_cDBSelect.SessionName;

        // 【債務】MP_PAY_CHK_TEKIMA
        with SPPayTeki do
        begin
            ParamByName('@NCode').AsFloat := exNCode;
// Delphi10 ST
            FetchOptions.Items := FetchOptions.Items - [fimeta];
// Delphi10 ED
            ExecProc;                   // ｽﾄｱﾄﾞ実行
                                            // 結果
            iRet := ParamByName('@RetCd').AsInteger;
                                          // ｴﾗｰ時の理由
            strErr := ParamByName('@errMsg').AsString;
        end;
    except
        // 例外発生
        strErr := '例外発生(MP_PAY_CHK_TEKIMA)';
        Exit;
    end;

    if iRet = 1 then                        // 削除不可
        Exit;

    Result := True;                         // 全ﾁｪｯｸで削除可能と判断

end;

//**********************************************************************
//*		Proccess	:	内部ｺｰﾄﾞ取得 <CHK>
//*		Name		:	y.Aoki(PRIME)
//*		Date		:	2006/02/09
//*		Parameter	:	iSumKbn : 合計・実在区分
//*                     iGCod   : 外部ｺｰﾄﾞ
//*		Return		:   内部ｺｰﾄﾞ(0:ﾃﾞｰﾀなし・-1:ｴﾗｰ・その他:内部ｺｰﾄﾞ)
//**********************************************************************
function TJNTCRP020000f.fnGetNCode2(iSumKbn,iGCode:Integer; var strName: String):Extended;
var
    dqMasterData : TMQuery;
    nInCodeDelete: Extended;
    strGCode     : String;
begin

    Result  :=  -1;
    nInCodeDelete := -1;  //<HIS0100> ADD

    // 外部ｺｰﾄﾞを0つき（DB用）に変更
    strGCode  :=  Format('%.16d', [iGCode]);

	dqMasterData	:= TMQuery.Create (Self);

    try
        m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

        with (dqMasterData) do
        begin
            Close ();

            SQL.Clear ();
            SQL.Add   ('SELECT NCode , TekiChar FROM TekiMA ');

            // <HIS0050> ↓
            //SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = :nSumDivision AND GCode = :nExCode AND RDelKbn = 0 ');
            SQL.Add   ('WHERE  MasterKbn = :nMasterkbn AND SumKbn = :nSumDivision AND GCode = :nExCode AND RDelKbn = 0 ');

            ParamByName ('nMasterkbn').AsInteger	:= MKBN_KOTEKI;
            // <HIS0050> ↑

            ParamByName ('nSumDivision').AsInteger	:= iSumKbn;
            ParamByName ('nExCode'     ).AsString	:= strGCode;
            Open ();

            if	(EOF) then																	// ｴﾗｰ
            begin
                dqMasterData.Close;
                dqMasterData.Free ();
                Result  := 0;
                Exit;
            end;

            nInCodeDelete   :=  FieldByName('NCode').AsFloat;
            strName         :=  FieldByName('TekiChar').AsString;
        end;
    except
            m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
            m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

            dqMasterData.Close;
            dqMasterData.Free ();
            Exit;
    end;

    dqMasterData.Close;
    dqMasterData.Free ();

    Result :=  nInCodeDelete;
end;
//<CHK>
// <HIS0052> 仕訳辞書登録対応 start
//************************************************************************
//*		Component		:	cCmbK1DCmb, cCmbK1CCmb(TMComboBox) <HIS0052>
//*							基準/置換ｺﾝﾎﾞﾎﾞｯｸｽのChangeｲﾍﾞﾝﾄ
//*		Event			:	OnChange
//*		Name			:	K.Katou(PRIME)
//************************************************************************
procedure TJNTCRP020000f.evtcCmbK1CmbChange(Sender: TObject);
var
	objEdit		: TMNumEdit;				// ｺｰﾄﾞEdit
    objLabel	: TMLabel;					// 名称ﾗﾍﾞﾙ
	objMem		: TdxMemData;				// 補助ｸﾞﾘｯﾄﾞのMemData
    objGrid		: TdxDBGrid;				// 補助ｸﾞﾘｯﾄﾞ
begin
	if Sender = cCmbK1DCmb then				// 借方
    begin
		objEdit := cEdtK1DNum;
        objLabel := cLblK1DDsc;
        objMem := DtlDSwkMem;
        objGrid := DtlDSwkGrid;
    end
    else									// 貸方
    begin
		objEdit := cEdtK1CNum;
        objLabel := cLblK1CDsc;
        objMem := DtlCSwkMem;
        objGrid := DtlCSwkGrid;
    end;

    objGrid.Enabled := False;				// ｸﾞﾘｯﾄﾞはどっちに変えられても無効
    										// 基準の場合
	if TMComboBox(Sender).ItemIndex = KBN_KIJUN then
    begin
    	if m_nReferMode <> REFER then		// 参照以外
        begin
	    	objEdit.Enabled := True; 		// ｺｰﾄﾞ入力可
        end
        else
        begin
			objEdit.Enabled := False;
        end;
        objEdit.Color := clWindow;
    end
    else									// 置換の場合
    begin
    	objEdit.Enabled := False;			// ｺｰﾄﾞ入力不可
        objEdit.ParentColor := True;
        objEdit.Value := 0;					// 中身もｸﾘｱ
        objEdit.InputFlag := True;
        objLabel.Caption := '';
		objMem.Active := False;				// 補助ｸﾞﾘｯﾄﾞもｸﾘｱ
		// 会計処理区分: 0=免税業者
		if	(m_nTaxAccDivision <> 0) then
		begin
			if	IsBusyoDenpyo()	then
			begin
				ChangeTaxEdit(Trunc(cEdtK1DNum.Value),Trunc(cEdtK1CNum.Value));
			end;
		end;
    end;

	ChangeTaxKbn();							// 消費税区分の表示切替
end;

//************************************************************************
//*		Component		:	cEdtK1DNum, cEdtK1CNum(TMNumEdit) <HIS0052>
//*							科目Edit(借/貸)のExitｲﾍﾞﾝﾄ
//*		Event			:	OnExit
//*		Name			:	K.Katou(PRIME)
//************************************************************************
procedure TJNTCRP020000f.evtcEdtKmkNumExit(Sender: TObject);
var
	iRet	: Integer;
	iDCKbn	: Integer;						// 借方/貸方
    strName	: String;						// 簡略名称
    objLabel: TMLabel;						// ﾗﾍﾞﾙ
    objGrid	: TdxDBGrid;					// 補助ﾏｽﾀGrid
begin
//<HIS0097> ADD St
    if Sender = cEdtK1DNum then				// 借方
    begin
    	iDCKbn := DC_KARIKATA;
        objLabel := cLblK1DDsc;
        objGrid := DtlDSwkGrid;
    end
    else
    begin
    	iDCKbn := DC_KASIKATA;
        objLabel := cLblK1CDsc;
        objGrid := DtlCSwkGrid;
    end;

    iRet := fnCheckExCodeKmkMA(MASTER_SUBJECT, iDCKbn, Trunc(TMNumEdit(Sender).Value), '', strName);

   	objLabel.Caption := strName;			// 科目名称表示

    if (iRet <> CHECK_OK) and (not m_fAppExit) then
    begin
        Beep ();
                                            // ﾌｫｰｶｽを戻す
        m_cACControl := TMNumEdit(Sender);
        m_cACControl.SetFocus ();
                                            // ﾏｽﾀｸﾞﾘｯﾄﾞもｸﾘｱ
        objGrid.DataSource.DataSet.Active := False;
        objGrid.DataSource.DataSet.Active := True;
        objGrid.Enabled := False;
        Abort;
    end;
//<HIS0097> ADD Ed
    if Sender = cEdtK1DNum then				// 借方
    begin
//<HIS0082 start>
		if iKmk1 = Trunc(TMNumEdit(Sender).Value) then
		begin
			ChangeTaxKbn;
			Exit;
		end;
//<HIS0082 end>
//<HIS0097> DEL St
{
    	iDCKbn := DC_KARIKATA;
        objLabel := cLblK1DDsc;
        objGrid := DtlDSwkGrid;
}
//<HIS0097> DEL Ed
    end
    else                        			// 貸方
    begin
//<HIS0082 start>
		if iKmk2 = Trunc(TMNumEdit(Sender).Value) then
		begin
			ChangeTaxKbn;
			Exit;
		end;
//<HIS0082 end>
//<HIS0097> DEL St
{
    	iDCKbn := DC_KASIKATA;
        objLabel := cLblK1CDsc;
        objGrid := DtlCSwkGrid;
}
//<HIS0097> DEL Ed
    end;

	if not m_fExCodeKMCheck[iDCKbn] then	// 変更していなかったら再読込しない
    begin
		ChangeTaxKbn();						// 消費税区分の表示切替
    	Exit;
    end;
//<HIS0097> ADD St
                                        // 科目に従って補助ﾏｽﾀ情報を作り変える
    fnSetDtlEditExCodeAttribute(Trunc(TMNumEdit(Sender).Value), iDCKbn);
    ChangeSwDic(iDCKbn);				// 画面に反映
    objGrid.FocusedColumn := SWKCLM_KBN;// <HIS0059> ADD
    if objGrid.DataSource.DataSet.RecordCount = 0 then
    begin
        objGrid.Enabled := False;
                                        // ｸﾞﾘｯﾄﾞが無効になっていたらその次へ
        if ((Sender = cEdtK1DNum) and (Screen.ActiveControl = DtlDSwkGrid)) or
            ((Sender = cEdtK1CNum) and (Screen.ActiveControl = DtlCSwkGrid)) then
        begin
//<HIS0108> MOD St
//            MjsNextCtrl(Self);
            // 借方のときにフォーカス遷移する
            // ※貸方の場合だと後続の処理で消費税関連のコンポーネントが非表示になる可能性が
            //   あるため、ここではフォーカスを当てない
            if (iDcKbn = DC_KARIKATA) then
            begin
                MjsNextCtrl(Self);
            end;
//<HIS0108> MOD Ed
        end;
    end
    else
    begin
        objGrid.Enabled := True;
                                        // ｸﾞﾘｯﾄﾞが有効になった時に移動させたい
        if (Sender = cEdtK1DNum) and
            (Screen.ActiveControl = cCmbK1CCmb) then
        begin
            if DtlDSwkGrid.CanFocus then
            begin
                DtlDSwkGrid.SetFocus;
            end;
        end
        else if (Sender = cEdtK1CNum) and
            ((Screen.ActiveControl = DtlCmnEditTaxDivision) or
            (Screen.ActiveControl = DtlCmnEditTaxCode) or
            (Screen.ActiveControl = DtlCmnEditTaxRate) or
            (Screen.ActiveControl = DtlCmnEditTypeCode) or
            (Screen.ActiveControl = DtlCmnGrid)) then
        begin
            if DtlCSwkGrid.CanFocus then
            begin
                DtlCSwkGrid.SetFocus;
            end;
        end;
    end;
//<HIS0097> ADD Ed
//<HIS0097> DEL St
{
 											// ｺｰﾄﾞ入力ﾁｪｯｸ
	iRet := fnCheckExCodeKmkMA(MASTER_SUBJECT, iDCKbn, Trunc(TMNumEdit(Sender).Value), '', strName);

   	objLabel.Caption := strName;			// 科目名称表示

	if (iRet <> CHECK_OK) and (not m_fAppExit) then
	begin
		Beep ();
											// ﾌｫｰｶｽを戻す
		m_cACControl := TMNumEdit(Sender);
		m_cACControl.SetFocus ();
                                            // ﾏｽﾀｸﾞﾘｯﾄﾞもｸﾘｱ
		objGrid.DataSource.DataSet.Active := False;
        objGrid.DataSource.DataSet.Active := True;
        objGrid.Enabled := False;
		Abort;
	end
    else
    begin
											// 科目に従って補助ﾏｽﾀ情報を作り変える
		fnSetDtlEditExCodeAttribute(Trunc(TMNumEdit(Sender).Value), iDCKbn);
        ChangeSwDic(iDCKbn);				// 画面に反映
        objGrid.FocusedColumn := SWKCLM_KBN;// <HIS0059> ADD
        if objGrid.DataSource.DataSet.RecordCount = 0 then
        begin
        	objGrid.Enabled := False;
            								// ｸﾞﾘｯﾄﾞが無効になっていたらその次へ
            if ((Sender = cEdtK1DNum) and (Screen.ActiveControl = DtlDSwkGrid)) or
            	((Sender = cEdtK1CNum) and (Screen.ActiveControl = DtlCSwkGrid)) then
            begin
            	MjsNextCtrl(Self);
            end;
        end
        else
        begin
        	objGrid.Enabled := True;
            								// ｸﾞﾘｯﾄﾞが有効になった時に移動させたい
			if (Sender = cEdtK1DNum) and
            	(Screen.ActiveControl = cCmbK1CCmb) then
            begin
            	if DtlDSwkGrid.CanFocus then
                begin
                	DtlDSwkGrid.SetFocus;
                end;
            end
            else if (Sender = cEdtK1CNum) and
            	((Screen.ActiveControl = DtlCmnEditTaxDivision) or
               	(Screen.ActiveControl = DtlCmnEditTaxCode) or
                (Screen.ActiveControl = DtlCmnEditTaxRate) or
                (Screen.ActiveControl = DtlCmnEditTypeCode) or
                (Screen.ActiveControl = DtlCmnGrid)) then
            begin
            	if DtlCSwkGrid.CanFocus then
                begin
	            	DtlCSwkGrid.SetFocus;
                end;
            end;
        end;
    end;
}
//<HIS0097> DEL Ed

	m_fExCodeKMCheck[iDCKbn] := False;

	// 会計処理区分: 0=免税業者
	if  m_nTaxAccDivision <> 0 then
	begin
		if IsBusyoDenpyo() then
		begin                     			// 消費税関係変更
			ChangeTaxEdit(Trunc(cEdtK1DNum.Value), Trunc(cEdtK1CNum.Value));
		end;
	end;

	ChangeTaxKbn();							// 消費税区分の表示切替
//<HIS0108> ADD St
    // 貸方の場合、無効になっているグリッドにフォーカスされているはずなので、
    // ここで改めてフォーカスを当てる
    if ((iDcKbn = DC_KASIKATA) and
        (objGrid.DataSource.DataSet.RecordCount = 0)) then
    begin
        CustomSetFocus([
            DtlCmnEditTaxDivision,      // 消費税率区分
            DtlCmnEditTaxCode,          // 消費税コード
            DtlCmnEditTaxRate,          // 消費税率
            DtlCmnEditTypeCode,         // 業種コード
            DtlCmnGrid]);               // 科目連想
    end;
//<HIS0108> ADD Ed
end;

//************************************************************************
//*		Component		:	DtlDSwkGrid, DtlESwkGrid(TdxDBGrid) <HIS0052>
//*							仕訳ｸﾞﾘｯﾄﾞ(借/貸)のEnterｲﾍﾞﾝﾄ
//*		Event			:	OnEnter
//*		Name			:	K.Katou(PRIME)
//************************************************************************
procedure TJNTCRP020000f.evtDtlSwkGridEnter(Sender: TObject);
var
	objMem	: TdxMemData;
    objClm	: TdxDBGridLookupColumn;
//<HIS0094>↓↓Add
    iMasterKbn	: Integer;
    iDCKbn		: Integer;
    iIndex		: Integer;
    iCmnFlg		: Integer;
//<HIS0094>↑↑
begin
//<HIS0082 start>
	if (Sender = DtlDSwkGrid) or (Sender = DtlCSwkGrid) then	fFirst	:= False;
//<HIS0082 end>
	objMem := TdxMemData(TdxDBGrid(Sender).DataSource.DataSet);

//<HIS0094>↓↓部門orｾｸﾞﾒﾝﾄが共通かを判別して補助ﾏｽﾀのｱｲﾃﾑﾘｽﾄを作成
    iMasterKbn := objMem.FieldByName('iMasterKbn').AsInteger;
	iCmnFlg := 0;

    // 部門またはｾｸﾞﾒﾝﾄの場合
    if (iMasterKbn in [MKBN_BUMON, MKBN_SEG1..MKBN_SEG10]) then
    begin
        // 貸借区分を取得
        if (Sender = DtlDSwkGrid) then
            iDCKbn := DC_KARIKATA
        else
            iDCKbn := DC_KASIKATA;

        // 配列のIndexを取得
        iIndex := GetAryIndex(iMasterKbn, iDCKbn);

    	// 共通部門または共通ｾｸﾞﾒﾝﾄの場合
        if (m_stCurDtlCodeAttr[iIndex].nUseKbn = 2) then
        	iCmnFlg := 1;
    end;

//	RemakeSwkTypeList(objMem.FieldByName('iMasterKbn').AsInteger);
	RemakeSwkTypeList(iMasterKbn, iCmnFlg);
//<HIS0094>↑↑
    										// 区分ﾘｽﾄの項目数設定
    objClm := TdxDBGridLookupColumn(TdxDBGrid(Sender).Columns[SWKCLM_KBN]);
    objClm.DropDownRows := DtlSwkKbnList.RecordCount;

	m_cACControl := Screen.ActiveControl;	// <HIS0059> ADD
end;

//************************************************************************
//*		Component		:	DtlDSwkGrid, DtlESwkGrid(TdxDBGrid) <HIS0052>
//*							仕訳ｸﾞﾘｯﾄﾞ(借/貸)のEditingｲﾍﾞﾝﾄ
//*		Event			:	OnEditing
//*		Name			:	K.Katou(PRIME)
//************************************************************************
procedure TJNTCRP020000f.evtDtlSwkGridEditing(Sender: TObject;
  Node: TdxTreeListNode; var Allow: Boolean);
var
	iDCKbn		: Integer;
    iMasterKbn	: Integer;
	iIndex		: Integer;
	vData		: Variant;
begin
    vData := 0;
                                            // ｺｰﾄﾞ
    if TdxDBGrid(Sender).FocusedColumn = SWKCLM_CODE then
    begin
	    vData	:= Node.Values[SWKCLM_KBN];	// 区分

		if varType(vData) = varInteger then
		begin
	    	if vData = KBN_KIJUN then		// 基準
    	    begin
        		Allow := True;
	        end
    	    else             				// 可変・当該
        	begin
	            Allow := False;             // 書き込み不可
                Exit;
        	end;
	    end;

        // 工種/ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞの場合は工事/ﾌﾟﾛｼﾞｪｸﾄに採用されている場合に入力可
		vData := Node.Values[SWKCLM_MASTERKBN];

		if varType(vData) = varInteger then
        begin
        	iMasterKbn := vData;
                                       		// 工種/ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ
        	if (iMasterKbn >= MKBN_PROSUB1) and
            	(iMasterKbn <= MKBN_PROSUB10) then
            begin
	        	if Sender = DtlDSwkGrid then
    	        begin
	    	    	iDCKbn := DC_KARIKATA;
	            end
    	        else
        	    begin
	        		iDCKbn := DC_KASIKATA;
	            end;
		        iIndex := GetAryIndex(iMasterKbn, iDCKbn);
            								// 工事/ﾌﾟﾛｼﾞｪｸﾄが工種/ｻﾌﾞを採用
    		    if m_stCurDtlCodeAttr[iIndex].fKousyu then
	        	begin
    	    		Allow := True;
	    	    end
    	    	else
	        	begin
    	    		Allow := False;
	    	    end;
            end;
        end;
	end;
end;

//************************************************************************
//*		Component		:	DtlDSwkGrid, DtlESwkGrid(TdxDBGrid) <HIS0052>
//*							仕訳ｸﾞﾘｯﾄﾞ(借/貸)のChangeNodeｲﾍﾞﾝﾄ
//*		Event			:	OnChangeNode
//*		Name			:	K.Katou(PRIME)
//************************************************************************
procedure TJNTCRP020000f.evtDtlSwkGridChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
var
	iMasterKbn	: Integer;
	vData		: Variant;
    Column  	: TdxDBGridColumn;
    LookupClm	: TdxDBGridLookupColumn;
//<HIS0082 start>
//	svTop		: Integer;
	svIndex		: Integer;
//<HIS0082 end>
//<HIS0094>↓↓Add
    iDCKbn		: Integer;
    iIndex		: Integer;
    iCmnFlg		: Integer;
//<HIS0094>↑↑
begin
//<HIS0082 start>
	if fSearch then	Exit;
//<HIS0082 end>
											// 現在の行のﾏｽﾀ区分取得
	iMasterKbn := TdxDBGrid(Sender).DataSource.DataSet.FieldByName('iMasterKbn').AsInteger;

//<HIS0094>↓↓部門orｾｸﾞﾒﾝﾄが共通かを判別して補助ﾏｽﾀのｱｲﾃﾑﾘｽﾄを作成
	iCmnFlg := 0;

    // 部門またはｾｸﾞﾒﾝﾄの場合
    if (iMasterKbn in [MKBN_BUMON, MKBN_SEG1..MKBN_SEG10]) then
    begin
        // 貸借区分を取得
        if (Sender = DtlDSwkGrid) then
            iDCKbn := DC_KARIKATA
        else
            iDCKbn := DC_KASIKATA;

        // 配列のIndexを取得
        iIndex := GetAryIndex(iMasterKbn, iDCKbn);

    	// 共通部門または共通ｾｸﾞﾒﾝﾄの場合
        if (m_stCurDtlCodeAttr[iIndex].nUseKbn = 2) then
        	iCmnFlg := 1;
    end;

//	RemakeSwkTypeList(iMasterKbn);              // 区分ﾘｽﾄ再作成
	RemakeSwkTypeList(iMasterKbn, iCmnFlg);     // 区分ﾘｽﾄ再作成
//<HIS0094>↑↑
    LookupClm := TdxDBGridLookupColumn(TdxDBGrid(Sender).Columns[SWKCLM_KBN]);
    LookupClm.DropDownRows := DtlSwkKbnList.RecordCount;

	{ IME変更 }
    										// 非表示の属性ｶﾗﾑから値をとりだす(Variant型)
    vData := Node.Values[SWKCLM_ATTR];
	 										// ｺｰﾄﾞｶﾗﾑ
    Column := TdxDBGridColumn(TdxDBGrid(Sender).Columns[SWKCLM_CODE]);

	if varType(vData) = varInteger then
	begin
		if vData = CODE_ATTR_FREE then		// 文字
        begin                           	// IME変更可能
            Column.ImeMode := imOpen;
		end
		else								// 数字・0つき数字
        begin                           	// IME不可
            Column.ImeMode := imDisable;
        end;
   end;
//<HIS0082 start>
	if not fFirst then
	begin
		iMasterKbn	:= Node.Values[SWKCLM_MASTERKBN];
		if iMasterKbn in [MKBN_PROJECT1..MKBN_PROJECT10] then
		begin
			s_Code		:= Node.Values[4];
			iMasterKbn1	:= iMasterKbn;
		end
		else if iMasterKbn1 <> 0 then
		begin
			if (s_Code <> oldNode.Values[4]) and (s_Code <> '') then
			begin
				fSearch									:= True;
				TdxDBGrid(Sender).BeginUpdate;
//				svTop	:= TdxDBGrid(Sender).TopIndex;
				svIndex	:= TdxDBGrid(Sender).DataSource.DataSet.RecNo;

				iMasterKbn1	:= iMasterKbn1 + 100;
				TdxDBGrid(Sender).DataSource.DataSet.First;
				while not TdxDBGrid(Sender).DataSource.DataSet.Eof do
				begin
					if iMasterKbn1 = TdxDBGrid(Sender).DataSource.DataSet.FieldByName('iMasterKbn').AsInteger then	// プロジェクトサブを探し出す
					begin
						TdxDBGrid(Sender).DataSource.DataSet.Edit;
						TdxDBGrid(Sender).DataSource.DataSet.FieldByName('strGCode').AsString		:= '';
						TdxDBGrid(Sender).DataSource.DataSet.FieldByName('strSubjectDesc').AsString	:= '';
						TdxDBGrid(Sender).DataSource.DataSet.Post;
						break;
					end;
					TdxDBGrid(Sender).DataSource.DataSet.Next;
				end;
//				TdxDBGrid(Sender).TopIndex					:= svTop;
				TdxDBGrid(Sender).DataSource.DataSet.RecNo	:= svIndex;
				TdxDBGrid(Sender).EndUpdate;
//				TdxDBGrid(Sender).DataSource.DataSet.First;
				iMasterKbn1	:= 0;
			end;
		end;
	end;
	fSearch	:= False;
//<HIS0082 end>
end;

//************************************************************************
//*		Component		:	DtlDSwkGrid, DtlESwkGrid(TdxDBGrid) <HIS0052>
//*							仕訳ｸﾞﾘｯﾄﾞ(借/貸)のChangeNodeｲﾍﾞﾝﾄ
//*		Event			:	OnCustomDrawCell
//*		Name			:	K.Katou(PRIME)
//************************************************************************
procedure TJNTCRP020000f.evtDtlSwkGridCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
	vData	: Variant;
begin
											// ｺｰﾄﾞ
	if (AColumn = DtlDSwkGridColumnCode) or
    	(AColumn = DtlCSwkGridColumnCode) then
    begin
											// 非表示の属性ｶﾗﾑから値をとりだす(Variant型)
	    vData := ANode.Values[DtlDSwkGridColumnAttr.Index];

		if varType(vData) = varInteger then
		begin
			case vData of
				CODE_ATTR_FREE:				// 文字
				begin						// 左寄せ
	                AAlignment  := taLeftJustify;
				end;
				CODE_ATTR_NUM:				// 数字
				begin						// 右寄せ
	                AAlignment  := taRightJustify;
				end;
				CODE_ATTR_0NUM:				// 0つき数字
				begin						// 右寄せ
	                AAlignment  := taRightJustify;
				end;
			end;
		end;
	end;
end;

//************************************************************************
//*		Component		:	DtlDSwkGrid, DtlESwkGrid(TdxDBGrid) <HIS0052>
//*							仕訳ｸﾞﾘｯﾄﾞ(借/貸)のKeyPressｲﾍﾞﾝﾄ
//*		Event			:	OnKeyPress
//*		Name			:	K.Katou(PRIME)
//************************************************************************
procedure TJNTCRP020000f.evtDtlSwkGridKeyPress(Sender: TObject;
  var Key: Char);
var
    iAttr	: Integer;
    iDigit	: Integer;
begin
                                            // 属性
    iAttr := TdxDBGrid(Sender).Datasource.dataSet.FieldByName('iAttr').AsInteger;
    										// 桁数
    iDigit := TdxDBGrid(Sender).Datasource.dataSet.FieldByName('iDigit').AsInteger;

	if iAttr <> CODE_ATTR_FREE then			// 文字以外
	begin
    	if TdxDBGrid( Sender ).FocusedColumn = SWKCLM_CODE then
        begin                           	// 数字、制御ｷｰ以外は入力不可
            if not CharInSet(Key,['0'..'9', '-', #8(*BS*), #27(*ESC*), #9(*TAB*)]) then
    		begin
    			SysUtils.Beep;
    			Abort;
    		end;
    	end;
	end;
        									// 入力桁数
    if not CharInSet(Key,[#8(*BS*), #27(*ESC*), #9(*TAB*)]) then
    begin
    	if TdxDBGrid(Sender).GetTextLen > iDigit then
//	    if Length(TdxDBGrid(Sender).EditingText) > iDigit then
    	begin
    		Abort;
        end;
    end;
end;

//************************************************************************
//*		Component		:	DtlDSwkGrid, DtlESwkGrid(TdxDBGrid) <HIS0052>
//*							仕訳ｸﾞﾘｯﾄﾞ(借/貸)のExitｲﾍﾞﾝﾄ
//*		Event			:	OnExit
//*		Name			:	K.Katou(PRIME)
//************************************************************************
procedure TJNTCRP020000f.evtDtlSwkGridExit(Sender: TObject);
begin
//<HIS0082 start>
	if (Sender = DtlDSwkGrid) or (Sender = DtlCSwkGrid) then	fFirst	:= True;
//<HIS0082 end>
											// 取消ﾎﾞﾀﾝ以外
	if Screen.ActiveControl <> DtlCmnButtonCancel then
    begin
    	if TdxDBGrid(Sender).DataSource.DataSet.State = dsEdit then
        begin
			TdxDBGrid(Sender).DataSource.DataSet.Post;
        end;
    end;
end;

//************************************************************************
//*		Component		:	DtlDSwkMem, DtlCSwkMem(TdxDBGrid) <HIS0052>
//*							仕訳MemData(借/貸)のBeforePostｲﾍﾞﾝﾄ
//*		Event			:	BeforePost
//*		Name			:	K.Katou(PRIME)
//************************************************************************
procedure TJNTCRP020000f.evtDtlSwkMemBeforePost(DataSet: TDataSet);
var
	iIndex		: Integer;
    iAdopt		: Integer;
	iMasterKbn	: Integer;					// ﾏｽﾀ区分
    iDCKbn		: Integer;					// 借方/貸方
    exNCode		: Extended;					// 内部ｺｰﾄﾞ
	strCode		: String;					// 外部ｺｰﾄﾞ
    strName		: String;					// 簡略名称
    objGrid		: TdxDBGrid;
//<HIS0094>↓↓Add
	strComGCd	: String;
    exComNCd	: Extended;
    strComName	: String;
//<HIS0094>↑↑
begin
    exNCode := 0;  //<HIS0103> ADD  ここで初期化しないと予期せぬところでエラーになる・・・
//<HIS0112> ADD St
                                            // ﾏｽﾀ区分
    iMasterKbn := DataSet.FieldByName('iMasterKbn').AsInteger;

    if DataSet = DtlDSwkMem then			// 借方/貸方
    begin
        iDCKbn := DC_KARIKATA;              // 借方
        objGrid := DtlDSwkGrid;
    end
    else
    begin
        iDCKbn := DC_KASIKATA;				// 貸方
        objGrid := DtlCSwkGrid;
    end;
//<HIS0112> ADD Ed
    try  //<HIS0112> ADD
                                                // 基準以外はｺｰﾄﾞﾁｪｯｸ不要
        if DataSet.FieldByName('nCtrlDivision').AsInteger > KBN_KIJUN then
        begin
            DataSet.FieldByName('strSubjectDesc').AsString := '';
            DataSet.FieldByName('strGCode').AsString := '';
            DataSet.FieldByName('exNCode').AsFloat := 0;
            DataSet.FieldByName('strGCode_Save').AsString := '';  //<HIS0089> ADD
            Exit;
        end;

    //<HIS0089> ADD St
        // 検索EXPで選択した外部コードと一致しない場合は内部コードクリア
        if DataSet.FieldByName('strGCode').AsString <> DataSet.FieldByName('strGCode_Save').AsString then
            DataSet.FieldByName('exNCode').AsFloat := 0
        else
            exNCode := DataSet.FieldByName('exNCode').AsFloat;
    //<HIS0089> ADD Ed
                                                // 入力したｺｰﾄﾞ
        strCode := DataSet.FieldByName('strGCode').AsString;
//<HIS0112> DEL St  上に移動
{
                                                // ﾏｽﾀ区分
        iMasterKbn := DataSet.FieldByName('iMasterKbn').AsInteger;

        if DataSet = DtlDSwkMem then			// 借方/貸方
        begin
            iDCKbn := DC_KARIKATA;              // 借方
            objGrid := DtlDSwkGrid;
        end
        else
        begin
            iDCKbn := DC_KASIKATA;				// 貸方
            objGrid := DtlCSwkGrid;
        end;
}
//<HIS0112> DEL Ed
    //<HIS0094>↓↓共通部門or共通ｾｸﾞﾒﾝﾄの場合、その内部ｺｰﾄﾞを取得してｺｰﾄﾞﾁｪｯｸをする
        // 部門またはｾｸﾞﾒﾝﾄの場合
        if (iMasterKbn in [MKBN_BUMON, MKBN_SEG1..MKBN_SEG10]) then
        begin
            // Indexを取得
            iIndex := GetAryIndex(iMasterKbn, iDCKbn);      // 配列のIndexを取得
            iAdopt := GetMasterIndex(iMasterKbn);			// ﾏｽﾀ基本情報のindex取得

            // 科目の採用が共通部門または共通ｾｸﾞﾒﾝﾄの場合
            if (m_stCurDtlCodeAttr[iIndex].nUseKbn = 2) then
            begin
                // 共通部門または共通ｾｸﾞﾒﾝﾄの内部ｺｰﾄﾞを取得
                GetCommonSection(iDCKbn, iAdopt, strComGCd, exComNCd, strComName);

                // 内部ｺｰﾄﾞをｾｯﾄ(CheckInputCodeﾒｿｯﾄﾞで、内部ｺｰﾄﾞも一致しないと該当なしにする)
                exNCode := exComNCd;
            end;
        end;
    //<HIS0094>↑↑
    //
//<HIS0112> ADD St
        // 「工種採用なし」はチェック対象外
        if ((iMasterKbn >= MKBN_PROSUB1) and (iMasterKbn <= MKBN_PROSUB10)) then
        begin
            iIndex := GetAryIndex(iMasterKbn, iDCKbn);  // 配列のIndexを取得
            if (not m_stCurDtlCodeAttr[iIndex].fKousyu) or
                (strCode = '') then  // 更新ボタン押下時にチェックを委ねるとし、ここでは未入力の場合もチェックしない
            begin
                Exit;
            end;
        end;
//<HIS0112> ADD Ed
                                                // ｺｰﾄﾞﾁｪｯｸ
        if not CheckInputCode(iMasterKbn, iDCKbn, strCode, exNCode, strName) then
        begin
            if objGrid.CanFocus then
            begin
                objGrid.SetFocus;
            end;
    //<HIS0082 start>
    //		SysUtils.Beep;
    //		Abort;
    //<HIS0098> ADD St
            // ここで中断しないと先へ進めてしまう・・・
            Beep();
            Abort();
    //<HIS0098> ADD Ed
            Exit;
    //<HIS0082 end>
        end;
                                                // 名称表示
        DataSet.FieldByName('strSubjectDesc').AsString := strName;
                                                // ｺｰﾄﾞも表示(0つきの場合formatされる)
        DataSet.FieldByName('strGCode').AsString := strCode;
                                                // 内部ｺｰﾄﾞｾｯﾄ
        DataSet.FieldByName('exNCode').AsFloat := exNCode;
    //<HIS0089> ADD St
                                                // ｺｰﾄﾞも表示(0つきの場合formatされる)
        DataSet.FieldByName('strGCode_Save').AsString := strCode;
    //<HIS0089> ADD Ed
    finally  //<HIS0112> ADD
                                                // 工事/ﾌﾟﾛｼﾞｪｸﾄの場合
        if iMasterKbn in [MKBN_PROJECT1..MKBN_PROJECT10] then
        begin
                                                // 工種のﾏｽﾀ区分
            iIndex := GetAryIndex(iMasterKbn + 100, iDCKbn);
            iAdopt := GetMasterIndex(iMasterKbn + 100);
                                                // MasterInfoでの採用あり
            if m_stAdoptInfo[iAdopt].nAdoption > 0 then
            begin                               // 採用によってｻﾌﾞの採用状態を変更
//<HIS0112> MOD St
//	            m_stCurDtlCodeAttr[iIndex].fKousyu := IsKousyuSaiyo(iMasterKbn, exNCode);
                // 「基準」の条件も追加
                m_stCurDtlCodeAttr[iIndex].fKousyu :=
                    IsKousyuSaiyo(iMasterKbn, exNCode) and
                    (DataSet.FieldByName('nCtrlDivision').AsInteger = KBN_KIJUN);
//<HIS0112> MOD Ed
            end;
        end;
    end;  //<HIS0112> ADD
end;

//**********************************************************************
//*		Proccess	:	仕訳情報のﾘｽﾄItem再作成 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/08
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*		        	:	iCmnFlg		共通部門／共通ｾｸﾞﾒﾝﾄ判別ﾌﾗｸﾞ [1:共通]	//<HIS0094>Add
//*		Return		:   なし
//**********************************************************************
//<HIS0094>↓↓引数追加
//procedure TJNTCRP020000f.RemakeSwkTypeList(iMasterKbn: Integer);
procedure TJNTCRP020000f.RemakeSwkTypeList(iMasterKbn: Integer; iCmnFlg: Integer = 0);
//<HIS0094>↑↑
begin

	//　仕訳情報ｸﾞﾘｯﾄﾞ[基準/可変/…]LookUpｶﾗﾑ用MemData 初期化
	DtlSwkKbnList.Active := False;
	DtlSwkKbnList.Active := True;

	DtlSwkKbnList.Append ();
	DtlSwkKbnList.FieldByName ('nDivision'	 ).AsInteger := KBN_KIJUN;
	DtlSwkKbnList.FieldByName ('strDescription').AsString := TEXT_KIJUN;
	DtlSwkKbnList.Post   ();
//<HIS0094>↓↓
	// 共通部門または共通ｾｸﾞﾒﾝﾄの場合、可変と当該は不要
    if (iCmnFlg = 1) then
        	Exit;
//<HIS0094>↑↑
	DtlSwkKbnList.Append ();
	DtlSwkKbnList.FieldByName ('nDivision'	 ).AsInteger := KBN_KAHEN;
	DtlSwkKbnList.FieldByName ('strDescription').AsString := TEXT_KAHEN;
	DtlSwkKbnList.Post   ();
	DtlSwkKbnList.Append ();
// <HIS0055> MOD start
//    if iMasterKbn <> MKBN_SAIMOKU then		// 科目別補助以外
											// 部門と社員の場合
    if iMasterKbn in [MKBN_BUMON, MKBN_SYAIN] then
// <HIS0055> MOD end
    begin                                   // 当該を追加
		DtlSwkKbnList.FieldByName ('nDivision'	 ).AsInteger := KBN_TOUGAI;
		DtlSwkKbnList.FieldByName ('strDescription').AsString := TEXT_TOUGAI;
		DtlSwkKbnList.Post   ();
    end;
end;

//**********************************************************************
//*		Proccess	:	外部ｺｰﾄﾞをDB上のｺｰﾄﾞに変換 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/11
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*					:	strCode		表示上のｺｰﾄﾞ
//*					:	iDCKbn		0: 借方 1: 貸方
//*		Return		:   String		DB上のｺｰﾄﾞ(ﾌｫｰﾏｯﾄ後)
//**********************************************************************
function TJNTCRP020000f.fnGetCode(iMasterKbn: Integer; strCode: String; iDCKbn: Integer): String;
var
    strBk   : String;
    iIndex  : Integer;
    iAryIdx	: Integer;						// 現在表示中の仕訳情報配列index
	iDigit	: Integer;
    iAttr   : Integer;
begin
	strCode := Trim(strCode);
    Result := strCode;					    // 表示通りの外部ｺｰﾄﾞ

    iIndex := GetMasterIndex(iMasterKbn);	// 配列のindex取得

    if iMasterKbn = MKBN_SAIMOKU then       // 科目別補助は科目によって属性が異なる
    begin
        iAryIdx := GetAryIndex(iMasterKbn, iDCKbn);
        									// 対象科目の属性
        iAttr := m_stCurDtlCodeAttr[iAryIdx].nAttribute;
    end
    else
    begin
    										// 属性
		iAttr := m_stAdoptinfo[iIndex].nCodeAttribute;
    end;

    if iAttr = CODE_ATTR_FREE then         	// 文字の場合そのまま返す
    begin
        Exit;
    end
    else
    begin
    	if strCode = '' then
        begin
        	Exit;
        end;
    end;
                                            // DB上の桁数
    if iMasterKbn = MKBN_KAMOKU then   		// 科目
    begin
        iDigit := DBDIGIT_KAMOKU;
    end
    else                                    // その他の桁数
    begin
        iDigit := DBDIGIT_ETC;
    end;
                                            // 付加する'0'部分
    strBk := StringOfChar('0', iDigit - Length(strCode));

    Result := strBk + strCode;           	// '00000xxx'

end;

//**********************************************************************
//*		Proccess	:	仕訳辞書ｸﾞﾘｯﾄﾞ読み直し <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/11
//*		Parameter	:	iDCKbn	借方/貸方
//*		Return		:   なし
//**********************************************************************
procedure TJNTCRP020000f.ChangeSwDic(iDCKbn: Integer);
var
	iCnt		: Integer;
	objMem		: TdxMemData;
    evtDPost	: TDataSetNotifyEvent;
    evtCPost	: TDataSetNotifyEvent;
//<HIS0094>↓↓
    iAdopt		: Integer;
    strComGCd   : String;
    exComNCd    : Extended;
    strComName  : String;
//<HIS0094>↑↑
begin
	if iDCKbn = DC_KARIKATA then
    begin
    	objMem := DtlDSwkMem;
    end
    else
    begin
    	objMem := DtlCSwkMem;
    end;

	{ 借方 }
    objMem.DisableControls;
	// ｲﾍﾞﾝﾄを外しておく
	evtDPost := DtlDSwkMem.BeforePost;
	evtCPost := DtlCSwkMem.BeforePost;
	DtlDSwkMem.BeforePost := nil;
	DtlCSwkMem.BeforePost := nil;

	objMem.Active := False;					// 初期化
    objMem.Active := True;

    for iCnt := (iDCKbn * 41) to 41 * (iDCKbn + 1) - 1 do
    begin                                   // 科目が採用する補助を表示
    	if m_stCurDtlCodeAttr[iCnt].fEnabled then
        begin
        	objMem.Append;
            								// 補助名称
            objMem.FieldByName('strMaster').AsString := m_stCurDtlCodeAttr[iCnt].strCaption;
            								// ﾏｽﾀ区分
            objMem.FieldByName('iMasterKbn').AsInteger := m_stCurDtlCodeAttr[iCnt].nMasterDivision;
            								// 属性
            objMem.FieldByName('iAttr').AsInteger := m_stCurDtlCodeAttr[iCnt].nAttribute;
            								// 桁数
            objMem.FieldByName('iDigit').AsInteger := m_stCurDtlCodeAttr[iCnt].nDigit;
            								// ▲区分
            objMem.FieldByName('nDivisionData').AsInteger := KBN_KIJUN;
            objMem.FieldByName('nCtrlDivision').AsInteger := KBN_KIJUN;
            objMem.FieldByName('strDivisionDesc').AsString := TEXT_KIJUN;
//<HIS0094>↓↓共通部門or共通ｾｸﾞﾒﾝﾄの場合、ｺｰﾄﾞと名称をｾｯﾄする
            								// ▲ｺｰﾄﾞ
//            objMem.FieldByName('strGCode').AsString := '';
            								// ▲名称
//            objMem.FieldByName('strSubjectDesc').AsString := '';

			// 部門またはｾｸﾞﾒﾝﾄで、共通部門または共通ｾｸﾞﾒﾝﾄを採用していた場合
            if (m_stCurDtlCodeAttr[iCnt].nMasterDivision in [MKBN_BUMON, MKBN_SEG1..MKBN_SEG10]) and
               (m_stCurDtlCodeAttr[iCnt].nUseKbn = 2) then
            begin
                iAdopt := GetMasterIndex(m_stCurDtlCodeAttr[iCnt].nMasterDivision);		// ﾏｽﾀ基本情報のindex取得

                // 共通部門または共通ｾｸﾞﾒﾝﾄの外部ｺｰﾄﾞと名称を取得
                GetCommonSection(iDCKbn, iAdopt, strComGCd, exComNCd, strComName);

                // 外部ｺｰﾄﾞの先頭0を除く
                strComGCd := IntToStr(StrToInt64(strComGCd));

                // 0つき数字の場合
                if m_stCurDtlCodeAttr[iCnt].nAttribute = CODE_ATTR_0NUM then
                begin
                                                        // 0埋めにして返す
                    strComGCd := Format('%.' + IntToStr(m_stCurDtlCodeAttr[iCnt].nDigit) + 'd', [StrToInt64(strComGCd)]);
                end;

                                        // ▲ｺｰﾄﾞ
                objMem.FieldByName('strGCode').AsString := strComGCd;
                                        // ▲名称
                objMem.FieldByName('strSubjectDesc').AsString := strComName;
                                        // ▲内部ｺｰﾄﾞ(初期表示させるため、Grid入力によるPostが無いとSwDicTekiに登録されないため)
                objMem.FieldByName('exNCode').AsFloat := exComNCd;
			end
            else
            begin
                                        // ▲ｺｰﾄﾞ
           		objMem.FieldByName('strGCode').AsString := '';
                                        // ▲名称
           		objMem.FieldByName('strSubjectDesc').AsString := '';
            end;
//<HIS0094>↑↑

			objMem.Post;
		end;
    end;

    objMem.First;
	// ｲﾍﾞﾝﾄを戻す
	DtlDSwkMem.BeforePost := evtDPost;
	DtlCSwkMem.BeforePost := evtCPost;

	objMem.EnableControls;
end;

//**********************************************************************
//*		Proccess	:	ﾏｽﾀ区分から選択した補助ｺｰﾄﾞ取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/11
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*					:	iDCKbn		0: 借方 1: 貸方
//*					:	exNCode		内部ｺｰﾄﾞ格納域
//*		Return		:   String		外部ｺｰﾄﾞ
//**********************************************************************
function TJNTCRP020000f.GetSwDicCode(iMasterKbn: Integer; iDCKbn: Integer; var exNCode: Extended): String;
var
	iCnt	: Integer;
begin
	Result := '';
	exNCode := 0;
	if iMasterKbn = MKBN_KAMOKU then		// 科目
	begin
		if iDCKbn = DC_KARIKATA then		// 借方
		begin
			exNCode := fnGetNCode(TBL_KAMOK, 0, m_stMasterData.nExCodeK1Deb, 0);
            if m_stMasterData.nExCodeK1Deb <> 0 then
            begin
				Result := IntToStr(m_stMasterData.nExCodeK1Deb);
            end;
		end
		else								// 貸方
		begin
			exNCode := fnGetNCode(TBL_KAMOK, 0, m_stMasterData.nExCodeK1Cre, 0);
            if m_stMasterData.nExCodeK1Cre <> 0 then
            begin
				Result := IntToStr(m_stMasterData.nExCodeK1Cre);
            end;
		end;
		Exit;
	end;
    										// その他ﾏｽﾀ
	if iDCKbn = DC_KARIKATA then    		// 借方
    begin
    	for iCnt := 0 to High(m_stMasterData.aryDHojyo) do
        begin
		    if m_stMasterData.aryDHojyo[iCnt].iMasterKbn = iMasterKbn then
    		begin
				exNCode := m_stMasterData.aryDHojyo[iCnt].exNCode;
	  			Result := m_stMasterData.aryDHojyo[iCnt].strGCode;
                break;
	    	end;
        end;
    end
    else									// 貸方
    begin
    	for iCnt := 0 to High(m_stMasterData.aryCHojyo) do
        begin
		    if m_stMasterData.aryCHojyo[iCnt].iMasterKbn = iMasterKbn then
    		begin
				exNCode := m_stMasterData.aryCHojyo[iCnt].exNCode;
	  			Result := m_stMasterData.aryCHojyo[iCnt].strGCode;
                break;
	    	end;
        end;
    end;
end;

//**********************************************************************
//*		Proccess	:	ﾏｽﾀ区分から選択した区分取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/12
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*					:	iDCKbn		0: 借方 1: 貸方
//*		Return		:   Integer		区分(0:基準 1:可変科目 2:当該科目)
//**********************************************************************
function TJNTCRP020000f.fnGetKbn(iMasterKbn: Integer; iDCKbn: Integer): Integer;
var
	iCnt	: Integer;
begin
	Result := 0;
	if iDCKbn = DC_KARIKATA then    		// 借方
    begin
    	for iCnt := 0 to High(m_stMasterData.aryDHojyo) do
        begin
		    if m_stMasterData.aryDHojyo[iCnt].iMasterKbn = iMasterKbn then
    		begin
	  			Result := m_stMasterData.aryDHojyo[iCnt].iKbn;
                break;
	    	end;
        end;
    end
    else									// 貸方
    begin
    	for iCnt := 0 to High(m_stMasterData.aryCHojyo) do
        begin
		    if m_stMasterData.aryCHojyo[iCnt].iMasterKbn = iMasterKbn then
    		begin
	  			Result := m_stMasterData.aryCHojyo[iCnt].iKbn;
                break;
	    	end;
        end;
    end;
end;

//**********************************************************************
//*		Proccess	:	ﾏｽﾀ区分から選択した区分取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/12
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*					:	iDCKbn		0: 借方 1: 貸方
//*					:	par			ﾊﾟﾗﾒｰﾀ変数
//*		Return		:   Integer		区分(0:基準 1:可変科目 2:当該科目)
//**********************************************************************
procedure TJNTCRP020000f.SetInputParam(iMasterKbn: Integer; iDCKbn: Integer; par: TFDParam);
var
	exNCode	: Extended;						// 内部ｺｰﾄﾞ
begin
											// ﾏｽﾀ区分と貸借から入力した外部・内部ｺｰﾄﾞ取得
	if GetSwDicCode(iMasterKbn, iDCKbn, exNCode) = '' then
	begin									// 未入力はNULLにする
		par.Clear;
		par.ParamType	 := ptInput;
		par.DataType  := ftInteger;
	end
	else									// 入力あり
	begin									// 内部ｺｰﾄﾞ
		par.AsFloat := exNCode;
	end;
end;

//**********************************************************************
//*		Proccess	:	部署伝票として使用するか <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/12
//*		Parameter	:	なし
//*		Return		:   Boolean	T: 部署伝票の辞書として使用 F: 部署伝票の辞書として使用しない
//**********************************************************************
function TJNTCRP020000f.IsBusyoDenpyo(): Boolean;
begin
//	Result := MCheckBox1.Checked;
	Result := DtlCmnPanelAddition2.Visible;
end;

//**********************************************************************
//*		Proccess	:	ｸｴﾘから欲しいﾏｽﾀの区分を取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/12
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*					:	iDCKbn		0: 借方 1: 貸方
//*					:	qry			仕訳辞書摘要ﾏｽﾀのｸｴﾘ
//*		Return		:  	Integer		区分(0:基準 1:可変科目 2:当該科目)
//**********************************************************************
function TJNTCRP020000f.GetDicKbn(iMasterKbn: Integer; iDCKbn: Integer; qry: TMQuery): Integer;
var
	iCnt	: Integer;
	iPos	: Integer;
	strFld	: String;
begin
	iPos :=	iDCKbn * 41;					// 借方/貸方の先頭

	strFld := '';
	case iMasterKbn of
   		MKBN_KAMOKU:         				// 科目
       	begin
       		strFld := 'KmkKbn';
        end;
        MKBN_SAIMOKU:						// 科目別補助
        begin
        	strFld := 'SubKbn';
        end;
        MKBN_BUMON:							// 部門
       	begin
        									// 共通部門の場合
//<HIS0096>↓↓科目の採用情報はnUseKbnを参照
//			if	m_stCurDtlCodeAttr[IDX_BUMON + iPos].nClassCode = 1 then
			if	m_stCurDtlCodeAttr[IDX_BUMON + iPos].nUseKbn = 2 then
//<HIS0096>↑↑
            begin
            	Result := 0;
                Exit;
            end;
        	strFld := 'BmnKbn';
        end;
        MKBN_SEG1..MKBN_SEG10:				// ｾｸﾞﾒﾝﾄ1～10
        begin
        	iCnt := iMasterKbn - MKBN_SEG1 + 1;
        									// 共通ｾｸﾞﾒﾝﾄの場合
//<HIS0096>↓↓科目の採用情報はnUseKbnを参照
//			if	m_stCurDtlCodeAttr[IDX_SEG1 + iPos + iCnt].nClassCode = 1 then
			if	m_stCurDtlCodeAttr[IDX_SEG1 + iPos + iCnt].nUseKbn = 2 then
//<HIS0096>↑↑
            begin
				Result := 0;
                Exit;
			end;
        	strFld := 'SegKbn' + IntToStr(iMasterKbn - MKBN_SEG1 + 1);
        end;
		MKBN_GINKOU:						// 銀行
        begin
        	strFld := 'BankKbn';
        end;
		MKBN_TORIHIKI:           			// 取引先
        begin
        	strFld := 'CsKbn';
        end;
		MKBN_SYAIN:							// 社員
        begin
        	strFld := 'EmpKbn';
        end;
        MKBN_HHOJYO1..MKBN_HHOJYO5:			// 汎用補助1～5
        begin
        	strFld := 'MulKbn' + IntToStr(iMasterKbn - MKBN_HHOJYO1 + 1);
        end;
        MKBN_PROJECT1..MKBN_PROJECT10:		// 工事/ﾌﾟﾛｼﾞｪｸﾄ1～10
        begin
        	strFld := 'PrjKbn' + IntToStr(iMasterKbn - MKBN_PROJECT1 + 1);
        end;
        MKBN_PROSUB1..MKBN_PROSUB10:   		// 工種/ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1～10
        begin
        	strFld := 'PjSubKbn' + IntToStr(iMasterKbn - MKBN_PROSUB1 + 1);
        end;
    end;

    if strFld = '' then
    begin
    	Result := 0;
    end
    else
    begin
    	if iDCKbn = DC_KARIKATA then		// 借方
        begin
        	strFld := 'D' + strFld;
        end
        else								// 貸方
        begin
        	strFld := 'C' + strFld;
        end;
	    Result := qry.FieldByName(strFld).AsInteger;
    end;
end;

//**********************************************************************
//*		Proccess	:	ｸｴﾘから欲しいﾏｽﾀの内部ｺｰﾄﾞを取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/12
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*					:	iDCKbn		0: 借方 1: 貸方
//*					:	qry			仕訳辞書摘要ﾏｽﾀのｸｴﾘ
//*		Return		:  	Extended	内部ｺｰﾄﾞ
//**********************************************************************
function TJNTCRP020000f.GetDicNCode(iMasterKbn: Integer; iDCKbn: Integer; qry: TMQuery): Extended;
var
	strFld	: String;
begin
	strFld := '';
	case iMasterKbn of
   		MKBN_KAMOKU:         				// 科目
       	begin
       		strFld := 'KmkNCode';
        end;
        MKBN_SAIMOKU:						// 科目別補助
        begin
        	strFld := 'SubNCode';
        end;
        MKBN_BUMON:							// 部門
       	begin
        	strFld := 'BmnNCode';
        end;
        MKBN_SEG1..MKBN_SEG10:				// ｾｸﾞﾒﾝﾄ1～10
        begin
        	strFld := 'SegNCode' + IntToStr(iMasterKbn - MKBN_SEG1 + 1);
        end;
		MKBN_GINKOU:						// 銀行
        begin
        	strFld := 'BankNCode';
        end;
		MKBN_TORIHIKI:           			// 取引先
        begin
        	strFld := 'CsNCode';
        end;
		MKBN_SYAIN:							// 社員
        begin
        	strFld := 'EmpNCode';
        end;
        MKBN_HHOJYO1..MKBN_HHOJYO5:			// 汎用補助1～5
        begin
        	strFld := 'MulNCode' + IntToStr(iMasterKbn - MKBN_HHOJYO1 + 1);
        end;
        MKBN_PROJECT1..MKBN_PROJECT10:		// 工事/ﾌﾟﾛｼﾞｪｸﾄ1～10
        begin
        	strFld := 'PrjNCode' + IntToStr(iMasterKbn - MKBN_PROJECT1 + 1);
        end;
        MKBN_PROSUB1..MKBN_PROSUB10:   		// 工種/ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1～10
        begin
        	strFld := 'PjSubNCode' + IntToStr(iMasterKbn - MKBN_PROSUB1 + 1);
        end;
    end;

    if strFld = '' then
    begin
    	Result := 0;
    end
    else
    begin
    	if iDCKbn = DC_KARIKATA then		// 借方
        begin
        	strFld := 'D' + strFld;
        end
        else								// 貸方
        begin
        	strFld := 'C' + strFld;
        end;
	    Result := qry.FieldByName(strFld).AsFloat;
    end;
end;

//**********************************************************************
//*		Proccess	:	共通部門/ｾｸﾞﾒﾝﾄｺｰﾄﾞ取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/13
//*		Parameter	:	iDCKbn		0: 借方 1: 貸方
//*					:	iIndex		配列のindex
//*					:	strCode		共通部門/ｾｸﾞﾒﾝﾄ外部ｺｰﾄﾞ格納域
//*					:	exNCode     共通部門/ｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ格納域	//<HIS0094>Add
//*					:	strName		共通部門/ｾｸﾞﾒﾝﾄ名称格納域
//*		Return		:  	なし
//**********************************************************************
//<HIS0094>↓↓引数追加
//procedure TJNTCRP020000f.GetCommonSection(iDCKbn: Integer; iIndex: integer;
//									var strCode: String; var strName: String);
procedure TJNTCRP020000f.GetCommonSection(iDCKbn: Integer; iIndex: integer;
									var strCode: String; var exNCode: Extended; var strName: String);
//<HIS0094>↑↑
begin
	strCode := '';
	strName := '';
    exNCode := 0;		//<HIS0094>Add

	// 借方
	if iDCKbn = 0 then
	begin
		//	共通部門
		if	m_iBsPlKbnDeb = 0 then
		begin
			if iIndex = IDX_BUMON then		// 部門
			begin
				strCode := m_sBSComBmnCd;
            	exNCode := m_exBSComBmnNCd;	//<HIS0094>Add
				strName := m_sBSComBmnNm;
			end
			else							// ｾｸﾞﾒﾝﾄ1～10
			begin
				strCode := m_sBSComSgCd[iIndex - IDX_SEG1];
                exNCode := m_exBSComSgNCd[iIndex - IDX_SEG1];   //<HIS0094>Add
//<HIS0095>↓↓ｺｰﾄﾞではなく、名称をｾｯﾄ
//				strCode := m_sBSComSgNm[iIndex - IDX_SEG1];
                strName := m_sBSComSgNm[iIndex - IDX_SEG1];
//<HIS0095>↑↑
			end;
		end
		else
		begin
			if iIndex = IDX_BUMON then		// 部門
			begin
				strCode := m_sPLComBmnCd;
            	exNCode := m_exPLComBmnNCd;	//<HIS0094>Add
				strName := m_sPLComBmnNm;
			end
			else							// ｾｸﾞﾒﾝﾄ1～10
			begin
				strCode := m_sPLComSgCd[iIndex - IDX_SEG1];
                exNCode := m_exPLComSgNCd[iIndex - IDX_SEG1];   //<HIS0094>Add
//<HIS0095>↓↓ｺｰﾄﾞではなく、名称をｾｯﾄ
//				strCode := m_sPLComSgNm[iIndex - IDX_SEG1];
				strName := m_sPLComSgNm[iIndex - IDX_SEG1];
//<HIS0095>↑↑
			end;
		end;
	end
	// 貸方
	else
	begin
		//	共通部門
		if m_iBsPlKbnCre = 0 then
		begin
			if iIndex = IDX_BUMON then		// 部門
			begin
				strCode := m_sBSComBmnCd;
            	exNCode := m_exBSComBmnNCd;	//<HIS0094>Add
				strName := m_sBSComBmnNm;
			end
			else							// ｾｸﾞﾒﾝﾄ1～10
			begin
				strCode := m_sBSComSgCd[iIndex - IDX_SEG1];
                exNCode := m_exBSComSgNCd[iIndex - IDX_SEG1];   //<HIS0094>Add
//<HIS0095>↓↓ｺｰﾄﾞではなく、名称をｾｯﾄ
//				strCode := m_sBSComSgNm[iIndex - IDX_SEG1];
				strName := m_sBSComSgNm[iIndex - IDX_SEG1];
//<HIS0095>↑↑
			end;
		end
		else
		begin
			if iIndex = IDX_BUMON then		// 部門
			begin
				strCode := m_sPLComBmnCd;
            	exNCode := m_exPLComBmnNCd;	//<HIS0094>Add
				strName := m_sPLComBmnNm;
			end
			else							// ｾｸﾞﾒﾝﾄ1～10
			begin
				strCode := m_sPLComSgCd[iIndex - IDX_SEG1];
                exNCode := m_exPLComSgNCd[iIndex - IDX_SEG1];   //<HIS0094>Add
//<HIS0095>↓↓ｺｰﾄﾞではなく、名称をｾｯﾄ
//				strCode := m_sPLComSgNm[iIndex - IDX_SEG1];
				strName := m_sPLComSgNm[iIndex - IDX_SEG1];
//<HIS0095>↑↑
			end;
		end;
	end;
end;

//**********************************************************************
//*		Proccess	:	ﾏｽﾀ情報配列(m_stCurDtlCodeAttr)のindex取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/13
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*					:	iDCKbn		0: 借方 1: 貸方
//*		Return		:  	Integer		配列のindex
//**********************************************************************
function TJNTCRP020000f.GetAryIndex(iMasterKbn: Integer; iDCkbn: Integer): Integer;
var
	iPos	: Integer;
const
	aryProject	: array[0..9] of Integer = (IDX_PRJ1, IDX_PRJ2, IDX_PRJ3, IDX_PRJ4, IDX_PRJ5,
    										IDX_PRJ6, IDX_PRJ7, IDX_PRJ8, IDX_PRJ9, IDX_PRJ10);
	aryPrjSub	: array[0..9] of Integer = (IDX_PRJSUB1, IDX_PRJSUB2, IDX_PRJSUB3, IDX_PRJSUB4, IDX_PRJSUB5,
    										IDX_PRJSUB6, IDX_PRJSUB7, IDX_PRJSUB8, IDX_PRJSUB9, IDX_PRJSUB10);
begin
	iPos := 0;
	// 採用情報配列のindex
	case iMasterKbn of
		MKBN_KAMOKU:                        // 科目
		begin
			iPos := IDX_KAMOKU;
		end;
		MKBN_BUMON:                         // 部門
		begin
			iPos := IDX_BUMON;
		end;
		MKBN_PROJECT1..MKBN_PROJECT10: 		// ﾌﾟﾛｼﾞｪｸﾄ1～10
		begin
        	iPos := aryProject[iMasterKbn - MKBN_PROJECT1];
		end;
		MKBN_PROSUB1..MKBN_PROSUB10: 		// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1～10
		begin
        	iPos := aryPrjSub[iMasterKbn - MKBN_PROSUB1];
		end;
		MKBN_SAIMOKU:                       // 科目別補助
		begin
			iPos := IDX_KMKHOJ;
		end;
		MKBN_GINKOU:                        // 銀行
		begin
    		iPos := IDX_BANK;
		end;
		MKBN_TORIHIKI:                      // 取引先
		begin
			iPos := IDX_TORIHIKI;
    	end;
		MKBN_SYAIN:                         // 社員
		begin
			iPos := IDX_SYAIN;
		end;
		MKBN_HHOJYO1..MKBN_HHOJYO5:         // 汎用補助1～5
		begin
			iPos := iMasterKbn - MKBN_HHOJYO1 + IDX_HANYOU1;
		end;
		MKBN_SEG1..MKBN_SEG10:				// ｾｸﾞﾒﾝﾄ1～10
		begin
			iPos := iMasterKbn - MKBN_SEG1 + IDX_SEG1;
		end;
	end;

    Result := iPos + iDCKbn * 41;
end;

//**********************************************************************
//*		Proccess	:	ﾏｽﾀ情報配列(m_stAdoptInfo)のindex取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/13
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*		Return		:  	Integer		配列のindex
//**********************************************************************
function TJNTCRP020000f.GetMasterIndex(iMasterKbn: Integer): Integer;
var
	iCnt	: Integer;
begin
	Result := 0;
	for iCnt := 0 to High(m_stAdoptInfo) do
    begin
		if m_stAdoptInfo[iCnt].nMasterDivision = iMasterKbn then
		begin
        	Result := iCnt;
            Exit;
        end;
    end;
end;

//**************************************************************************
//	Component	:	xxxxxxxxxx(TdxDBGridButtonColumn) <HIS0052>
//		    		仕訳ｺｰﾄﾞｶﾗﾑ(借・貸)
//	Event		:	OnEditButtonClick
//	Name	    :	K.Katou
//**************************************************************************
procedure TJNTCRP020000f.evtdxDBGridColumnCodeEditButtonClick(
  Sender: TObject);
var
	iBPKbn		: Integer;					// BS/PL区分 <HIS0056> ADD
	iMasterKbn	: Integer;					// ﾏｽﾀ区分
    iExpRtn     : Integer;					// Expの戻り
	exKmkNCode	: Extended;					// 科目内部ｺｰﾄﾞ
    lvExpSend   : rcJNTExpSend;             // 渡すﾊﾟﾗﾒｰﾀ
    lvExpRecv   : rcJNTExpRecv;             // 戻りﾊﾟﾗﾒｰﾀ
    objMem		: TdxMemData;
    iDCKbn		: Integer;					// 貸借区分(0:借方, 1:貸方) <HIS0094>Add
begin
	{ 検索Exp表示 }
	exKmkNCode := 0;
    if Sender = DtlDSwkGridColumnCode then
    begin
    	objMem := DtlDSwkMem;				// 借方
        iBPKbn := m_iBsPlKbnDeb;			// <HIS0056> ADD
        iDCKbn := DC_KARIKATA;				// <HIS0094>Add
    end
    else
    begin
    	objMem := DtlCSwkMem;				// 貸方
        iBPKbn := m_iBsPlKbnCre;			// <HIS0056> ADD
        iDCKbn := DC_KASIKATA;				// <HIS0094>Add
    end;
											// ﾏｽﾀ区分
	iMasterKbn := objMem.FieldByName('iMasterKbn').AsInteger;
	if iMasterKbn = MKBN_SAIMOKU then		// 科目別補助の場合
	begin
		if Sender = DtlDSwkGridColumnCode then
		begin								// 借方科目
			exKmkNCode := GetKmkNCode(Trunc(cEdtK1DNum.Value));
		end
		else
		begin								// 貸方科目
			exKmkNCode := GetKmkNCode(Trunc(cEdtK1CNum.Value));
		end;
	end;

    fnJNTExpMakeParam(@lvExpSend);          // ﾊﾟﾗﾒｰﾀ初期設定
											// 検索Expﾊﾟﾗﾒｰﾀｾｯﾄ
// <HIS0056> MOD start
//    SetExpParam(iMasterKbn, lvExpSend, exKmkNCode);
//<HIS0094>↓↓引数追加
//  SetExpParam(iMasterKbn, lvExpSend, iBPKbn, exKmkNCode);
    SetExpParam(iMasterKbn, lvExpSend, iBPKbn, exKmkNCode, iDCKbn);
//<HIS0094>↑↑
// <HIS0056> MOD end
                                            // 検索ｴｸｽﾌﾟﾛｰﾗ表示
    iExpRtn := fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <> 1 then                    // ｷｬﾝｾﾙ
	begin
        Exit;
	end;

	{ 選択した内容を表示 }
    if lvExpRecv.GCode <> '' then
    begin
		objMem.Edit;
										// ｺｰﾄﾞ
		objMem.FieldByName('strGCode').AsString := lvExpRecv.GCode;
										// 名称
		objMem.FieldByName('strSubjectDesc').AsString := lvExpRecv.Nmk;
//<HIS0089> ADD St
        // 内部コード
        objMem.FieldByName('exNCode').AsFloat := lvExpRecv.NCode;
        // 外部コード(保管用)
        objMem.FieldByName('strGCode_Save').AsString := lvExpRecv.GCode;
//<HIS0089> ADD Ed
    end;
end;

//**************************************************************************
//	Proccess	:	検索Expﾊﾟﾗﾒｰﾀｾｯﾄ <HIS0052>
//	Name	  	:	K.Katou
//	Date	  	:	2006/12/15
//	Parameter 	:	iMasterKbn	ﾏｽﾀ区分
//				:	lvExpSend	Expﾊﾟﾗﾒｰﾀ
//				:	iBPKbn		BS/PL区分 <HIS0056> ADD
//				:	exKmkNCode	科目内部ｺｰﾄﾞ(科目別補助Expに使用)
//				:	iDCKbn		貸借区分 (0:借方,1:貸方)		//<HIS0094>Add
//	Retrun	  	:	なし
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
// <HIS0056> MOD 引数追加
//procedure TJNTCRP020000f.SetExpParam(iMasterKbn: Integer; var lvExpSend: rcJNTExpSend; exKmkNCode: Extended);
//<HIS0094>↓↓引数追加
//procedure TJNTCRP020000f.SetExpParam(iMasterKbn: Integer; var lvExpSend: rcJNTExpSend; iBPKbn: Integer; exKmkNCode: Extended);
procedure TJNTCRP020000f.SetExpParam(iMasterKbn: Integer; var lvExpSend: rcJNTExpSend; iBPKbn: Integer; exKmkNCode: Extended; iDCKbn: Integer);
//<HIS0094>↑↑
var
    iIndex      : Integer;
    iModuleKbn  : Integer;
    iPattern    : Integer;
    strTableName    : String;
    strTrRootCaption    : String;
    strWhere    : String;
//<HIS0094>↓↓Add
    strGCode	: String;
    exNCode		: Extended;
    strName		: String;
    iPos		: Integer;
//<HIS0094>↑↑
begin
    iModuleKbn  := 0;      			// ﾓｼﾞｭｰﾙ区分 0:共通
    iPattern    := 1;               // ﾊﾟﾀｰﾝNO
                                    // ﾏｽﾀ基本情報のindex取得
    iIndex := GetMasterIndex(iMasterKbn);
//<HIS0094>↓↓Add
    								// 配列のIndexを取得
    iPos := GetAryIndex(iMasterKbn, iDCKbn);
//<HIS0094>↑↑
                                    // ﾏｽﾀの名称取得
    strTrRootCaption := m_stAdoptInfo[iIndex].strDescription;
                                    // ﾃｰﾌﾞﾙ名取得
    strTableName := GetTableName(iMasterKbn);
    case iMasterkbn of
      MKBN_KAMOKU:begin                     // 勘定科目
      end;
      MKBN_SAIMOKU:begin                    // 細目科目(科目別補助)
                                            // 科目内部ｺｰﾄﾞ
        lvExpSend.KmkNCode  := exKmkNCode;
        strWhere := 'MasterKbn = ' + IntToStr(MKBN_SAIMOKU) + ' ';
      end;
      MKBN_GINKOU:begin                     // 銀行
        iPattern := 1;
        strWhere := 'MasterKbn = ' + IntToStr(MKBN_GINKOU) + ' ';
      end;
      MKBN_TORIHIKI:begin                   // 取引先
        strWhere := 'TemplateKbn = 0';
      end;
      MKBN_TOKUI:begin                      // 得意先
        strWhere := 'TemplateKbn = 0 ';
      end;
      MKBN_SIIRE:begin                      // 仕入先
        strWhere := 'TemplateKbn = 0 ';
      end;
      MKBN_SYAIN:begin                      // 社員
        strTableName := '';
      end;
      MKBN_HHOJYO1..MKBN_HHOJYO5:begin      // 汎用補助1～5
      end;
      MKBN_BUMON:begin                      // 部門
// <HIS0056> ADD start
		if iBPKbn = 0 then    				// BS
        begin
        	strWhere := 'HojyoKbn2 > 0 ';
        end
        else                        	   	// PL
        begin
//        	strWhere := 'HojyoKbn2 = 0 ';	// HIS0077
			strWhere := 'HojyoKbn2 <> 2';	// HIS0077 PLの場合は、B/S以外
        end;
//<HIS0094>↓↓Add
        // 科目の採用が共通部門の場合
        if (m_stCurDtlCodeAttr[iPos].nUseKbn = 2) then
        begin
            // 共通部門の内部ｺｰﾄﾞを取得
            GetCommonSection(iDCKbn, iIndex, strGCode, exNCode, strName);

            // 共通部門の内部ｺｰﾄﾞを条件とする(部門登録があればMasterInfoには諸口がｾｯﾄされている)
            strWhere := strWhere + 'AND NCode = ' + FloatToStr(exNCode) + ' ';
        end;
//<HIS0094>↑↑
// <HIS0056> ADD end
      end;
      MKBN_SEG1..MKBN_SEG10:begin           // ｾｸﾞﾒﾝﾄ1～10
// <HIS0056> ADD start
		if iBPKbn = 0 then    				// BS
        begin
        	strWhere := 'HojyoKbn2 > 0 ';
        end
        else                        	   	// PL
        begin
//        	strWhere := 'HojyoKbn2 = 0 ';	// HIS0077
			strWhere := 'HojyoKbn2 <> 2';	// HIS0077 PLの場合は、B/S以外
        end;
//<HIS0094>↓↓Add
        // 科目の採用が共通ｾｸﾞﾒﾝﾄの場合
        if (m_stCurDtlCodeAttr[iPos].nUseKbn = 2) then
        begin
            // 共通ｾｸﾞﾒﾝﾄの内部ｺｰﾄﾞを取得
            GetCommonSection(iDCKbn, iIndex, strGCode, exNCode, strName);

            // 共通ｾｸﾞﾒﾝﾄの内部ｺｰﾄﾞを条件とする(ｾｸﾞﾒﾝﾄ登録があればMasterInfoには諸口がｾｯﾄされている)
            strWhere := strWhere + 'AND NCode = ' + FloatToStr(exNCode) + ' ';
        end;
//<HIS0094>↑↑
// <HIS0056> ADD end
      end;
      MKBN_PROJECT1..MKBN_PROJECT10:begin   // 工事/ﾌﾟﾛｼﾞｪｸﾄ1～10
      end;
      MKBN_PROSUB1..MKBN_PROSUB10:begin     // 工種/ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1～10
      end;
      else
      begin
        Exit;
      end;
    end;

    // 実在/合計区分
    if (iMasterKbn <> MKBN_SYAIN) and (iMasterKbn <> MKBN_SYOHIN) and
            (iMasterKbn <> MKBN_HINSYU) then
    begin
                                            // 合計/実在区分のあるものは全て実在
        lvExpSend.SumKbn    := 0;
    end;
//<HIS0106> DEL St
{
    // 適用期間
    if iMasterKbn in [MKBN_BUMON, MKBN_SYAIN] then
    begin                                   // 部門、社員は適用期間もﾁｪｯｸ
											// 会計期間(自)
        lvExpSend.StartDate := m_dateKStDate;
											// 会計期間(至)
        lvExpSend.EndDate := m_dateKEdDate;
    end;
}
//<HIS0106> DEL Ed

    // 共通部分
    lvExpSend.pMjsAppRec    :=  m_pRec;     // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    										// TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.pCopDB        :=  @m_cDBSelect;
    lvExpSend.ModulKbn      :=  iModuleKbn; // ﾓｼﾞｭｰﾙ区分
    lvExpSend.ColorB        :=  m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD        :=  m_cComArea.SystemArea.SysColorD;

    // 可変部分
    lvExpSend.MasterKbn     :=  iMasterKbn; // ﾏｽﾀ区分
    lvExpSend.PatternNo     :=  iPattern;   // ﾊﾟﾀｰﾝNO
                                            // ﾀｲﾄﾙﾊﾞｰ
    lvExpSend.TBarNM        :=  strTrRootCaption + '検索ｴｸｽﾌﾟﾛｰﾗ';
                                            // ﾃｰﾌﾞﾙ名
    lvExpSend.TableName     :=  strTableName;
                                            // ﾙｰﾄｷｬﾌﾟｼｮﾝ
    lvExpSend.TrRootCaption :=  strTrRootCaption;

    lvExpSend.WhereStr      :=  strWhere;   // 追加条件

end;

//**************************************************************************
//	Proccess	:	ﾏｽﾀのﾃｰﾌﾞﾙ名を取得 <HIS0052>
//	Name	  	:	K.Katou
//	Date	  	:	2006/12/15
//	Parameter 	:	iMasterKbn	ﾏｽﾀ区分
//	Retrun	  	:	String		ﾃｰﾌﾞﾙ名
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP020000f.GetTableName(iMasterKbn: Integer):String;
var
    strTable    : String;
begin
    Result := '';

    case iMasterkbn of
      MKBN_KAMOKU, MKBN_SAIMOKU:			// 勘定科目, 細目科目(科目別補助)
      begin
        strTable        := 'KmkMA';
      end;
      MKBN_GINKOU:begin                     // 銀行
        strTable        := 'HojyoMA';
      end;
      										// 取引先, 得意先, 仕入先
      MKBN_TORIHIKI, MKBN_TOKUI, MKBN_SIIRE:
      begin
        strTable        := 'MTOKUI';
      end;
      MKBN_SYAIN:begin                      // 社員
        strTable        := 'HAPSC';
      end;
      MKBN_HHOJYO1..MKBN_HHOJYO5:begin      // 汎用補助1～5
        strTable        := 'HojyoMA';
      end;
      MKBN_BUMON:begin                      // 部門
        strTable        := 'HojyoMA';
      end;
      MKBN_SEG1..MKBN_SEG10:begin           // ｾｸﾞﾒﾝﾄ1～10
        strTable        := 'HojyoMA';
      end;
      MKBN_PROJECT1..MKBN_PROJECT10:begin   // 工事/ﾌﾟﾛｼﾞｪｸﾄ1～10
        strTable        := 'HojyoMA';
      end;
      MKBN_PROSUB1..MKBN_PROSUB10:begin     // 工種/ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1～10
        strTable        := 'HojyoMA';
      end;
      else
      begin
        Exit;
      end;
    end;

    Result := strTable;
end;

//**************************************************************************
//	Proccess	:	ﾏｽﾀの抽出条件を取得 <HIS0052>
//	Name	  	:	K.Katou
//	Date	  	:	2006/12/20
//	Parameter 	:	iMasterKbn	ﾏｽﾀ区分
//				:	strJoin		Joinする場合のﾃｰﾌﾞﾙ変数
//	Retrun	  	:	String		ﾃｰﾌﾞﾙ名
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP020000f.GetWhere(iMasterKbn: Integer; strJoin: String = ''):String;
var
    strTbl      : String;
    strWhere    : String;
begin
    Result := '';
    strWhere := '';

    if strJoin = '' then
        strTbl := ''
    else
        strTbl := strJoin + '.';

    case iMasterkbn of
      // <HIS0090>ADD↓
      MKBN_SAIMOKU:begin                    // 科目別補助
      end;
      // <HIS0090>ADD↑
      MKBN_GINKOU:begin                     // 銀行
      end;
      MKBN_TORIHIKI:begin                   // 取引先
        strWhere            := strTbl + 'TemplateKbn = 0 ';
      end;
      MKBN_TOKUI:begin                      // 得意先
        strWhere            := strTbl + 'TemplateKbn = 0 and ' + strTbl + 'HojyoKbn1 = 1 ';
      end;
      MKBN_SIIRE:begin                      // 仕入先
        strWhere            := strTbl + 'TemplateKbn = 0 and ' + strTbl + 'HojyoKbn2 = 1 ';
      end;
      MKBN_SYAIN:begin                      // 社員
      end;
      MKBN_HHOJYO1..MKBN_HHOJYO5:begin      // 汎用補助1～5
      end;
      MKBN_BUMON:begin                      // 部門
//<HIS0106> DEL St
{
        strWhere        := '((' + strTbl + 'TEndDate >= :parStartDate) and (' +
                            strTbl + 'TStartDate <= :parEndDate)) ';
}
//<HIS0106> DEL Ed
      end;
      MKBN_SEG1..MKBN_SEG10:begin           // ｾｸﾞﾒﾝﾄ1～10
      end;
      MKBN_PROJECT1..MKBN_PROJECT10:begin   // 工事/ﾌﾟﾛｼﾞｪｸﾄ1～10
      end;
      MKBN_PROSUB1..MKBN_PROSUB10:begin     // 工種/ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1～10
      end;
      else
      begin
        Exit;
      end;
    end;

    if iMasterKbn <> MKBN_SYAIN then        // 削除区分
    begin
        if strWhere <> '' then
            strWhere := strWhere + ' and ';
        strWhere := strWhere + strTbl + 'RDelKbn = 0 ';
    end;
                                            // ﾏｽﾀ区分
    if not (iMasterKbn in [MKBN_TORIHIKI, MKBN_TOKUI, MKBN_SIIRE,
                            MKBN_SYAIN]) then
    begin
        if strWhere <> '' then
            strWhere := strWhere + ' and ';

        strWhere := strWhere + strTbl + 'MasterKbn = :parMasterKbn ';
    end;
                                            // 実在/合計区分
    if iMasterKbn <> MKBN_SYAIN then
    begin
        if strWhere <> '' then
            strWhere := strWhere + ' and ';
                                           	// 実在
        strWhere := strWhere + 'SumKbn = 0 ';
    end;

    Result := strWhere;

end;

//**************************************************************************
//	Proccess	:	科目内部ｺｰﾄﾞ取得 <HIS0052>
//	Name	  	:	K.Katou
//	Date	  	:	2006/12/15
//	Parameter 	:	iKmkCode	科目外部ｺｰﾄﾞ
//	Retrun	  	:	Extended	科目内部ｺｰﾄﾞ
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP020000f.GetKmkNCode(iKmkCode: Integer): Extended;
var
    Qe      : TMQuery;
	strSQL	: String;
begin

    Result := 0;

	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

   	with  Qe do
    begin
		strSQL := 'SELECT NCode from KmkMA ' +
				'WHERE MasterKbn = 1 ' +
				'AND RDelKbn = 0 ' +
				'AND SumKbn = 0 ' +
				'AND GCode = :parGCode ';

	    Close ();
   		SQL.Clear ();
    	SQL.Add(strSQL);

        ParamByName('parGCode' ).AsInteger := iKmkCode;
        Open();

        if not Eof then
		begin
            Result := FieldByName('NCode').AsFloat;
		end;
  	end;

    Qe.Close;
    Qe.Free;

end;

//**************************************************************************
//	Proccess	:	科目別補助（表示用）ｺｰﾄﾞ取得 <HIS0052>
//	Name	  	:	K.Katou
//	Date	  	:	2006/12/22
//	Parameter 	:	exKmkCode	科目内部ｺｰﾄﾞ
//				:	exNCode		科目別補助内部ｺｰﾄﾞ
//	Retrun	  	:	String		属性対応済み科目別補助ｺｰﾄﾞ
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP020000f.GetKmkHojDspCd(exKmkNCode: Extended; exNCode: Extended): String;
var
	iDigit	: Integer;
    iAttr	: Integer;
    Qe      : TMQuery;
    strCode	: String;
	strSQL	: String;
begin
	Result := '';

	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

   	with  Qe do
    begin
		strSQL := 'SELECT SubCode, CodeDigit, CodeAttr FROM KmkMA ' +
				'WHERE MasterKbn = 2 ' +
				'AND RDelKbn = 0 ' +
				'AND SumKbn = 0 ' +
				'AND NCode = :parNCode ' +
        		'AND CNCode = :parCNCode ';

	    Close ();
   		SQL.Clear ();
    	SQL.Add(strSQL);

        ParamByName('parNCode' ).AsFloat := exKmkNCode;
		ParamByName('parCNCode' ).AsFloat := exNCode;
        Open();

        if not Eof then
		begin
        	strCode := FieldByName('SubCode').AsString;
            iDigit := FieldByName('CodeDigit').AsInteger;
            iAttr := FieldByName('CodeAttr').AsInteger;
											// 属性・桁数でﾌｫｰﾏｯﾄ
            Result := SetDspCodeAttr(strCode, iDigit, iAttr);
		end;
  	end;

    Qe.Close;
    Qe.Free;
end;

//**********************************************************************
//*		Proccess	:	消費税ｺｰﾄﾞ取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/18
//*		Parameter	:	iDKmkCode 	借方科目ｺｰﾄﾞ
//*					:	iCKmkCode 	貸方科目ｺｰﾄﾞ
//*					:	iRate		消費税率格納域
//*		Return		:   Integer		消費税ｺｰﾄﾞ
//**********************************************************************
//<HIS0078 start>
//function TJNTCRP020000f.GetTaxCode(iDKmkCode: Integer; iCKmkCode: Integer; var iRate: Integer): Integer;
function TJNTCRP020000f.GetTaxCode(iDKmkCode: Integer; iCKmkCode: Integer; var iRate: Integer;var iTypeCode:Integer): Integer;
//<HIS0078 end>
var
	iDTaxKbn	: Integer;					// 消費税区分
    iCTaxKbn	: Integer;
	iDTaxCode	: Integer;					// 消費税ｺｰﾄﾞ
    iCTaxCode	: Integer;
    iDTaxRate	: Integer;  				// 消費税率
    iCTaxRate	: Integer;
    Qe      	: TMQuery;
	strSQL		: String;
//<HIS0078 start>
	iWk			: Integer;
//<HIS0078 end>
begin
    iRate := 0;
    iDTaxKbn := -1;
    iCTaxKbn := -1;
    iDTaxCode := 0;
    iCTaxCode := 0;
    iDTaxRate := 0;
    iCTaxRate := 0;

	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

   	with  Qe do
    begin
//<HIS0078 start>
		Close;
		SQL.Clear;
		SQL.Add('SELECT sdt.STaxCode,sdt.STaxRate,sdt.TypeCode FROM TekiMA As tma Left Outer Join swDicTeki As sdt '	);
		SQL.Add('on tma.NCode = sdt.NCode Where tma.MasterKbn = 61 and tma.GCode = :GCD '				);
		SQL.Add('and tma.SumKbn = 0 And tma.RDelKbn = 0 '												);
        ParamByName('GCD').AsInteger	:= trunc(DtlCEdtExCd.Value);
		open;
		if not eof then
		begin
			if not GetFld('StaxCode').IsNull then
			begin
				iDTaxCode	:= GetFld('STaxCode').AsInteger;
				iDTaxRate	:= GetFld('STaxRate').AsInteger;
				iWk			:= GetFld('TypeCode').AsInteger;
//				if iDTaxCode <> 0 then            // <HIS0079> DEL	<HIS0081>復活 <HIS0083>削除
				if (iDTaxCode <> 0) or ((IsBusyoDenpyo()) and (iDTaxCode = 0))  then        // <HIS0079> ADD	<HIS0081>削除 <HIS0083>復活
				begin
					result		:= iDTaxCode;
					iRate		:= iDTaxRate;
					iTypeCode	:= iWk;
					Qe.Close;
					Qe.Free;
					exit;
				end;
			end;
		end;
//<HIS0078 end>
		strSQL := 'SELECT GCode, TaxKbn, STaxCode, BTaxCode, STaxRate, BTaxRate ' +
                'FROM KmkMA ' +
				'WHERE MasterKbn = 1 ' +
				'AND RDelKbn = 0 ' +
				'AND SumKbn = 0 ' +
				'AND ((GCode = :parDCode) or (GCode = :parCCode)) ';

	    Close();
   		SQL.Clear();
    	SQL.Add(strSQL);

        ParamByName('parDCode').AsInteger := iDKmkCode;
        ParamByName('parCCode').AsInteger := iCKmkCode;
        Open();

        while not Eof do
		begin
        									// 借方
			if	iDKmkCode = FieldByName ('GCode').AsInteger	then
            begin
            	iDTaxKbn :=	FieldByName ('TaxKbn').AsInteger;
        									// 売上科目
				if GetFld('TaxKbn').AsInteger = TAXKBN_URIAGE then
    	        begin
            								// 売上消費税ｺｰﾄﾞ
        	    	iDTaxCode := GetFld('STaxCode').AsInteger;
                    						// 売上消費税率
        	    	iDTaxRate := GetFld('STaxRate').AsInteger;
	            end
            								// 仕入科目
    	        else if GetFld('TaxKbn').AsInteger = TAXKBN_SIIRE then
        	    begin
            								// 仕入消費税ｺｰﾄﾞ
            		iDTaxCode := GetFld('BTaxCode').AsInteger;
                    						// 仕入消費税率
            		iDTaxRate := GetFld('BTaxRate').AsInteger;
	            end;
            end;
            								// 貸方
			if iCKmkCode = FieldByName ('GCode').AsInteger	then
            begin
            	iCTaxKbn	:=	FieldByName ('TaxKbn').AsInteger;
        									// 売上科目
				if GetFld('TaxKbn').AsInteger = TAXKBN_URIAGE then
    	        begin
            								// 売上消費税ｺｰﾄﾞ
        	    	iCTaxCode := GetFld('STaxCode').AsInteger;
            								// 売上消費税率
        	    	iCTaxRate := GetFld('STaxRate').AsInteger;
	            end
            								// 仕入科目
    	        else if GetFld('TaxKbn').AsInteger = TAXKBN_SIIRE then
        	    begin
            								// 仕入消費税ｺｰﾄﾞ
            		iCTaxCode := GetFld('BTaxCode').AsInteger;
            								// 仕入消費税率
            		iCTaxRate := GetFld('BTaxRate').AsInteger;
	            end;
            end;
			Next;
		end;
  	end;

	if iDKmkCode = 0 then
    begin
    	iDTaxKbn := TAXKBN_OTHER;
    end;
	if iCKmkCode = 0 then
    begin
    	iCTaxKbn := TAXKBN_OTHER;
    end;

	if (iDTaxKbn = -1) or (iCTaxKbn = -1) then
	begin
		Result := -1;
		Exit;
	end;

    if iDTaxKbn = TAXKBN_OTHER then			// 借方が対象外
    begin
		if iCTaxKbn = TAXKBN_OTHER then		// 貸方も対象外
        begin
        	Result := -1;
        end                                 // 貸方が売上か仕入
        else
        begin
        	Result		:= iCTaxCode;		// 貸方の消費税ｺｰﾄﾞ
            iRate		:= iCTaxRate;		// 消費税率
//<HIS0078 start>
			iTypeCode	:= 0;
//<HIS0078 end>
        end;
    end
    else                       				// 借方が売上か仕入
    begin
		if iCTaxKbn = TAXKBN_OTHER then		// 貸方が対象外
        begin
			Result		:= iDTaxCode;		// 借方の消費税ｺｰﾄﾞ
			iRate		:= iDTaxRate;		// 消費税率
//<HIS0078 start>
			iTypeCode	:= 0;
//<HIS0078 end>
        end
        else             					// 貸方も売上か仕入
        begin
        	Result := -1;
        end;
    end;

    Qe.Close;
    Qe.Free;
end;

//**********************************************************************
//*		Proccess	:	仕訳辞書ｸﾞﾘｯﾄﾞのｺｰﾄﾞ入力ﾁｪｯｸ <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/18
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*					:	iDCKbn		借方/貸方
//*					:	strGCode	外部ｺｰﾄﾞ(in/out)
//*					:	exNCode		内部ｺｰﾄﾞ格納域
//*					:	strName		簡略名称格納域
//*		Return		:   Boolean		T: あり F: なし
//**********************************************************************
function TJNTCRP020000f.CheckInputCode(iMasterKbn: Integer; iDCKbn: Integer;
										var strGCode: String;
                                        var exNCode: Extended;
										var strName: String): Boolean;
var
	iIndex	: Integer;
    iRet	: Integer;
    iKmkCode: Integer;						// 科目ｺｰﾄﾞ
    iDigit	: Integer;						// 桁数
    strCode	: String;
begin
	strName := '';
    Result := True;

    if strGCode = '' then
    begin
    	Result := False;
        Exit;
    end;
											// ﾏｽﾀ区分から配列のindex取得
	iIndex := GetAryIndex(iMasterKbn, iDCKbn);

    										// 文字はそのまま
    if m_stCurDtlCodeAttr[iIndex].nAttribute = CODE_ATTR_FREE then
	begin
    	strCode := strGCode;
    end
    else									// 数字は0埋め
    begin
    	strCode := Format('%.16d', [StrToInt64(strGCode)]);
    end;

    if iMasterKbn = MKBN_SAIMOKU then		// 科目別補助
    begin
    	if iDCKbn = DC_KARIKATA then 		// 借方
        begin                               // 科目ｺｰﾄﾞ取得
        	iKmkCode := Trunc(cEdtK1DNum.Value);
        end
        else								// 貸方
        begin
        	iKmkCode := Trunc(cEdtK1CNum.Value);
        end;
    										// 科目別補助名称取得
    	iRet := fnCheckExCodeKmkMA(iMasterKbn, iDCKbn, iKmkCode, strCode, strName);
        if iRet = CHECK_OK then
        begin                               // 内部ｺｰﾄﾞ取得
        	exNCode := fnGetKmkSubNCode(iKmkCode, strCode);
        end;
    end
    else									// その他ﾏｽﾀ
    begin
//<HIS0089> MOD St
                         					// 補助名称取得
//		iRet := fnCheckExCodeHojyoMA(iIndex, strCode, strName);
//        if iRet = CHECK_OK then
		iRet := fnCheckExCodeHojyoMA(iIndex, strCode, strName, exNCode);
        if (iRet = CHECK_OK) and (exNCode = 0) then
//<HIS0089> MOD Ed
        begin                               // 内部ｺｰﾄﾞ取得
        	exNCode := fnGetHojNCode(iMasterKbn, strCode);
        end;
    end;

	if (iRet <> CHECK_OK) and (not m_fAppExit) then
	begin
		Result := False;
	end;
            								// 0つき数字の場合
	if m_stCurDtlCodeAttr[iIndex].nAttribute = CODE_ATTR_0NUM then
    begin
    	iDigit := m_stCurDtlCodeAttr[iIndex].nDigit;
    										// 0埋めにして返す
    	strGCode := Format('%.' + IntToStr(iDigit) + 'd', [StrToInt64(strGCode)]);
    end;
end;

//**********************************************************************
//*		Proccess	:	内部ｺｰﾄﾞから外部ｺｰﾄﾞ・名称取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/20
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*                 :   exKmkNCode  科目内部ｺｰﾄﾞ            <HIS0090>ADD
//*					:	exNCode		内部ｺｰﾄﾞ
//*					:	stGCode		外部ｺｰﾄﾞ格納域(in/out)
//*					:	strName		簡略名称格納域
//*		Return		:   Boolean		T: あり F: なし
//**********************************************************************
// <HIS0090>MOD↓
//procedure TJNTCRP020000f.GetSwkDicName(iMasterKbn: Integer; exNCode: Extended;
//									var strCode: String; var strName: String);
procedure TJNTCRP020000f.GetSwkDicName(iMasterKbn: Integer; exKmkNCode,exNCode: Extended;
									var strCode: String; var strName: String);
// <HIS0090>MOD↑
var
    strTable	: String;					// ﾃｰﾌﾞﾙ名
    strWhere	: String;
    strSQL		: String;
    Query		: TMQuery;
begin
	strCode := '';
	strName := '';

    strTable := GetTableName(iMasterKbn);	// ﾃｰﾌﾞﾙ名取得
    strWhere := GetWhere(iMasterKbn);		// 抽出条件取得
    case iMasterKbn of
        // <HIS0090>ADD↓
        MKBN_SAIMOKU:                       // 科目別補助
        begin
            strSQL := 'select SubCode, SimpleName from ' + strTable +
                    ' where NCode = :parKmkNCode ' +
                    ' and CNCode = :parNCode ';
        end;
        // <HIS0090>ADD↑
                                            // 取引先・得意先・仕入先
    	MKBN_TORIHIKI, MKBN_TOKUI, MKBN_SIIRE:
	    begin
        	strSQL := 'select GCode, Nmk as SimpleName from ' + strTable +
                    ' where NCode = :parNCode ';
    	end;

    	MKBN_SYAIN:							// 社員
        begin
        	strSQL := 'select HAP.GCode, MOS.SimpleName ' +
                    'from HAPSC HAP left outer join MOS_OFFICE_STAFF MOS ' +
                    'on HAP.NCode = MOS.NCode ' +
                    'where MOS.RDelKbn = 0 ' +
                    'and MOS.NCode = :parNCode ';
//<HIS0106> DEL                    'and (HAP.TEndDate >= :parStartDate and HAP.TStartDate <= :parEndDate) ';
        end;
        else								// その他ﾏｽﾀ
	    begin
	        strSQL := 'select GCode, SimpleName from ' + strTable +
                    ' where NCode = :parNCode ';
	    end;
    end;

    if strWhere <> '' then
        strSQl := strSQL + ' and ' + strWhere;

    Query := TMQuery.Create(Self);

    try
											// DBとMQueryの接続
  	    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Query );

    	Query.Close;
	    Query.SQL.Clear;

    	Query.SQL.Add(strSQL);
                                            // ﾏｽﾀ区分
        if not (iMasterKbn in [MKBN_TORIHIKI, MKBN_TOKUI, MKBN_SIIRE,
                            MKBN_SYAIN]) then
        begin
            Query.ParamByName('parMasterKbn').AsInteger := iMasterKbn;
        end;

        // <HIS0090>ADD↓
        if iMasterKbn = MKBN_SAIMOKU then
        begin
            Query.ParamByName('parKmkNCode').AsString := FloatToStr(exKmkNCode);
        end;
        // <HIS0090>ADD↑
//<HIS0106> DEL St
{
                                            // 適用期間
        if iMasterKbn in [MKBN_BUMON, MKBN_SYAIN] then
        begin
            Query.ParamByName('parStartDate').AsDateTime := m_dateKStDate;
            Query.ParamByName('parEndDate').AsDateTime := m_dateKEdDate;
        end;
}
//<HIS0106> DEL Ed
                          					// 内部ｺｰﾄﾞ
	    Query.ParamByName('parNCode').AsFloat := exNCode;


		if not Query.Open() then
    	begin
			Exit;
	    end;

   		if not Query.Eof then
	    begin
    										// 外部ｺｰﾄﾞ
    	//  strCode := Query.GetFld('GCode').AsString;  // <HIS0090>DEL
            // <HIS0090>ADD↓
            if iMasterKbn = MKBN_SAIMOKU then
                strCode := Query.GetFld('SubCode').AsString
            else
                strCode := Query.GetFld('GCode').AsString;
            // <HIS0090>ADD↑
                                            // 簡略名称
	    	strName := Query.GetFld('SimpleName').AsString;
		end
    	else								// ﾃﾞｰﾀなし
	    begin
    		Exit;
	    end;
	finally
    	Query.Free;
    end;
end;

//**********************************************************************
//*		Proccess	:	工事/ﾌﾟﾛｼﾞｪｸﾄが工種/ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞを採用しているか <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/25
//*		Parameter	:	iMasterKbn	工事ﾏｽﾀ区分
//*					:	exNCode		工事内部ｺｰﾄﾞ
//*		Return		:   Boolean		T: 採用あり F: 採用なし
//**********************************************************************
function TJNTCRP020000f.IsKousyuSaiyo(iMasterKbn: Integer; exNCode: Extended): Boolean;
var
	strSQL	: String;
	Qe		: TMQuery;
begin
	Result := False;
	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

   	with  Qe do
    begin
		strSQL := 'SELECT PartKbn ' +
                'FROM KojiInfo ' +
				'WHERE MasterKbn = :parMasterKbn ' +
				'AND NCode = :parNCode ';

	    Close();
   		SQL.Clear();
    	SQL.Add(strSQL);
                                           	// 工事/ﾌﾟﾛｼﾞｪｸﾄﾏｽﾀ区分
        ParamByName('parMasterKbn').AsInteger := iMasterKbn;
                                           	// 工事/ﾌﾟﾛｼﾞｪｸﾄ内部ｺｰﾄﾞ
        ParamByName('parNCode').AsFloat := exNCode;
        if not Open() then
        begin
		    Qe.Close;
		    Qe.Free;
        	Exit;
        end;

        if not Eof then
		begin
	       									// 採用あり?
			if GetFld('PartKbn').AsInteger > 0 then
            begin
            	Result := True;
			end;
        end;
    end;
    Qe.Close;
    Qe.Free;
end;

//**********************************************************************
//*		Proccess	:	売上科目が借方・貸方どちらかにあるか <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/27
//*		Parameter	:	iDkmkCode	借方科目ｺｰﾄﾞ
//*					:	iCkmkCode	貸方科目ｺｰﾄﾞ
//*		Return		:   Boolean		T: ある F: ない
//**********************************************************************
function TJNTCRP020000f.IsUriageKmk(iDKmkCode: Integer; iCKmkCode: Integer): Boolean;
var
	iDTaxKbn		:	Integer;
	iCTaxKbn		:	Integer;
	dqKmkMaster		:	TMQuery;
begin
	Result := False;

	if cCmbK1DCmb.ItemIndex > KBN_KIJUN then
    begin
    	iDKmkCode := 0;
    end;
	if	cCmbK1CCmb.ItemIndex > KBN_KIJUN then
    begin
    	iCKmkCode := 0;
    end;

	iDTaxKbn	:=	-1;
	iCTaxKbn	:=	-1;

	dqKmkMaster	:= TMQuery.Create (Self);

	//	DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqKmkMaster);

	with dqKmkMaster do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT GCode,TaxKbn FROM KmkMA');
		SQL.Add   ('WHERE MasterKbn = 1 AND SumKbn = 0 AND RDelKbn = 0 AND ((GCode = :nDCode) or (GCode = :nCCode))');
		ParamByName ('nDCode').AsInteger	:=	iDKmkCode;
		ParamByName ('nCCode').AsInteger	:=	iCKmkCode;

		if not Open () then
        begin
			Close ();
			Free ();
        	Exit;
        end;

		while not EOF do
		begin
			if	iDKmkCode=FieldByName ('GCode').AsInteger	then
            begin
            	iDTaxKbn := FieldByName ('TaxKbn').AsInteger;
            end
			else if	iCKmkCode=FieldByName ('GCode').AsInteger	then
            begin
            	iCTaxKbn := FieldByName ('TaxKbn').AsInteger;
            end;
			Next;
		end;

		Close ();
		Free ();
	end;
                                        	// 借方か貸方が売上科目
    if (iDTaxKbn = TAXKBN_URIAGE) or (iCTaxKbn = TAXKBN_URIAGE) then
    begin
    	Result := True;
    end;
end;

//**********************************************************************
//*		Proccess	:	区分名取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/21
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*					:	iKbn		区分
//*		Return		:   String		区分名
//**********************************************************************
function TJNTCRP020000f.GetKbnName(iMasterKbn: Integer; iKbn: Integer): String;
begin
	Result := '';
	case iMasterKbn of
		MKBN_KAMOKU:						// 科目
		begin
			if iKbn = KBN_KIJUN then
			begin
				Result := TEXT_KIJUN;		// 基準
			end
			else
			begin
				Result := TEXT_OKIKAE;		// 置換
			end;
		end;
		else								// その他補助
		begin
			if iKbn = KBN_KIJUN then
			begin
				Result := TEXT_KIJUN;		// 基準
			end
			else if iKbn = KBN_KAHEN then
			begin
				Result := TEXT_KAHEN;		// 可変
			end
			else if iKbn = KBN_TOUGAI then
			begin
				Result := TEXT_TOUGAI;		// 当該
			end;
		end;
	end;
end;

//**********************************************************************
//*		Proccess	:	残高管理区分表示名取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/21
//*		Parameter	:	iZanKbn	残高管理区分
//*		Return		:   String	残高管理区分の表示名
//**********************************************************************
function TJNTCRP020000f.GetZanKbnName(iZanKbn: Integer): String;
begin
	Result := '';
	case iZanKbn of
		0: Result := 'なし';
		1: Result := 'あり';
	end;
end;

//**********************************************************************
//*		Proccess	:	消費税区分表示名取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/21
//*		Parameter	:	iSTaxKbn	消費税区分
//*		Return		:   String		消費税区分の表示名
//**********************************************************************
function TJNTCRP020000f.GetSTaxKbnName(iSTaxKbn: Integer): String;
begin
	Result := '';
	case iSTaxKbn of
		0: Result := 'なし';
		1: Result := '売上';
		2: Result := '仕入';
	end;
end;

//**********************************************************************
//*		Proccess	:	消費税率表示名取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/21
//*		Parameter	:	iSTaxRate	消費税率区分
//*		Return		:   String		消費税率の表示名
//**********************************************************************
function TJNTCRP020000f.GetSTaxRateName(iSTaxRate: Integer): String;
begin
	Result := '';
    //<#TAX10> DEL↓標準税率を表示するため
//    case iSTaxRate of
//        0 : Result := '';
    //<#TAX10> DEL↑
        //<HIS0101> MOD st
		//1 : Result := '３％';
		//2 : Result := '５％';
//        else	<#TAX10> DEL
        	Result := m_TaxRateInfo.GetTaxNameByRateCD(iSTaxRate);
        //<HIS0101> MOD ed
//	end;	<#TAX10> DEL
end;

//**********************************************************************
//*		Proccess	:	業種表示名取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/21
//*		Parameter	:	iTypeCode	業種ｺｰﾄﾞ
//*		Return		:   String		業種の表示名
//**********************************************************************
function TJNTCRP020000f.GetTypeCodeName(iTypeCode: Integer): String;
//<HIS0105> ADD St
//var
//    i : Integer;
//<HIS0105> ADD Ed
begin
	Result := '';
//<HIS0105> MOD St
{
	case iTypeCode of
        0:	Result := '';
		1:	Result := '第1種';
		2:	Result := '第2種';
		3:	Result := '第3種';
		4:	Result := '第4種';
		5:	Result := '第5種';
	end;
}
    if ((iTypeCode > m_cTypeCode.MinCode) and (iTypeCode <= m_cTypeCode.MaxCode)) then
    begin
        Result := Format('第%d種', [iTypeCode]);
    end;
//<HIS0105> MOD Ed
end;

//**********************************************************************
//*		Proccess	:	消費税区分の表示切替 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/26
//*		Parameter	:	なし
//*		Return		:   なし
//**********************************************************************
procedure TJNTCRP020000f.ChangeTaxKbn();
begin
        									// 科目が基準で入力されていない場合
   	if ((cCmbK1DCmb.ItemIndex = KBN_KIJUN) and (cEdtK1DNum.Value = 0)) and
     	((cCmbK1CCmb.ItemIndex = KBN_KIJUN) and (cEdtK1CNum.Value = 0)) then
    begin
    	// ※部署伝票には不要
//		ClearTaxEdit(1, 3);					// 消費税区分を表示する
        									// Changeｲﾍﾞﾝﾄ呼び出し
		fnDtlCmnEditTaxDivisionOnChange(DtlCmnEditTaxDivision);
    end;
end;

//**********************************************************************
//*		Proccess	:	ﾌﾟﾛｼﾞｪｸﾄ・ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞの配列index取得 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2006/12/26
//*		Parameter	:	iMasterKbn	ﾏｽﾀ区分
//*		Return		:   Integer		配列のindex
//**********************************************************************
function TJNTCRP020000f.GetPrjAryIndex(iMasterKbn: Integer): Integer;
const
	aryProject	: array[0..9] of Integer = (IDX_PRJ1, IDX_PRJ2, IDX_PRJ3, IDX_PRJ4, IDX_PRJ5,
    										IDX_PRJ6, IDX_PRJ7, IDX_PRJ8, IDX_PRJ9, IDX_PRJ10);
	aryPrjSub	: array[0..9] of Integer = (IDX_PRJSUB1, IDX_PRJSUB2, IDX_PRJSUB3, IDX_PRJSUB4, IDX_PRJSUB5,
    										IDX_PRJSUB6, IDX_PRJSUB7, IDX_PRJSUB8, IDX_PRJSUB9, IDX_PRJSUB10);
begin
	Result := 0;
    case iMasterKbn of
    	MKBN_PROJECT1..MKBN_PROJECT10:
	    begin
    		Result := aryProject[iMasterKbn - MKBN_PROJECT1];
	    end;
        MKBN_PROSUB1..MKBN_PROSUB10:
	    begin
    		Result := aryPrjSub[iMasterKbn - MKBN_PROSUB1];
	    end;
    end;
end;

//**********************************************************************
//*		Proccess	:	補助配列の初期化 <HIS0052>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/01/26
//*		Parameter	:	aryTarget	配列
//*		Return		:   なし
//**********************************************************************
procedure TJNTCRP020000f.ClearAry(var aryTarget: array of TRecMaster);
var
	iCnt	: Integer;
begin
	for iCnt := Low(aryTarget) to High(aryTarget) do
    begin
		aryTarget[iCnt].iMasterKbn := 0;
		aryTarget[iCnt].iKbn := 0;
        aryTarget[iCnt].strGCode := '';
        aryTarget[iCnt].exNCode := 0;
    end;
end;
// <HIS0052> 仕訳辞書登録対応 end
// <SYNC> ｸﾞﾙｰﾌﾟ会計対応 start
//**********************************************************************
//*		Proccess	:	ｾｷｭﾘﾃｨ基本情報取得 <SYNC>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/03/07
//*		Parameter	:	なし
//*		Return		:   True or False
//**********************************************************************
function TJNTCRP020000f.GetSecMain(): Boolean;
var
    strSQL		: String;
    Query		: TMQuery;
begin
	Result := False;
	m_iGrpCorp := 0;						// ｸﾞﾙｰﾌﾟ管理採用有無 0:なし 1:あり
	m_iTransKbn := 0;    					// 送受信区分 0:親会社 1:子会社
    m_iSecMasterKbn := 0;					// ｸﾞﾙｰﾌﾟ管理用ｾｸﾞﾒﾝﾄﾏｽﾀ区分

    Query := TMQuery.Create(Self);

    try
    	                               		// 自分に接続
    	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Query);

    	Query.Close;
	    Query.SQL.Clear;

	  	strSQL := 'SELECT UseKbn, GrpTransKbn, SecMasterKbn ' +
				'FROM SecMain ' +
				'WHERE OpeKbn = 2 ';		// ｸﾞﾙｰﾌﾟ管理

    	Query.SQL.Add(strSQL);

		if not Query.Open() then
    	begin
			Exit;
	    end;

   		if not Query.Eof then
	    begin
											// 採用区分
			m_iGrpCorp := Query.GetFld('UseKbn').AsInteger;
    										// ｸﾞﾙｰﾌﾟ会計送受信区分
    	    m_iTransKbn := Query.GetFld('GrpTransKbn').AsInteger;
                                        	// 採用ｾｸﾞﾒﾝﾄﾏｽﾀ区分
            m_iSecMasterKbn := Query.GetFld('SecMasterKbn').AsInteger;
		end;
		Result := True;
	finally
    	Query.Free;
    end;
end;

//**********************************************************************
//*		Proccess	:	DBｴﾗｰﾒｯｾｰｼﾞ表示 <SYNC>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/03/08
//*		Parameter	:	Query	ｴﾗｰになったｸｴﾘ
//*		Return		:   なし
//**********************************************************************
procedure TJNTCRP020000f.ErrorMessageDsp(Query: TMQuery);
var
	MsgRec	: TMjsMsgRec;
begin
	TJNTMASCom(m_pRec^.m_pSystemArea^).m_MsgStd.GetMsgDB(MsgRec, Query);
	with MsgRec do
	begin
		MjsMessageBoxEx(Self, sMsg, sTitle, icontype, btntype, btndef, FALSE);
	end;
end;

//**********************************************************************
//*		Proccess	:	会社関連付処理(ﾏｽﾀ同期) <SYNC>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/03/09
//*		Parameter	:	iGCode	外部ｺｰﾄﾞ
//*					:	iSumKbn	実在/合計区分
//*		Return		:   Integer 0: 対象外 1: 正常 2:ｷｬﾝｾﾙ -9:ｴﾗｰ
//**********************************************************************
function TJNTCRP020000f.fnCorpRelation(iGCode: Integer; iSumKbn: Integer): Integer;
var
    Qe			: TMQuery;
    nPNCode  	: Extended;
    bRet     	: Boolean;
    strMsg		: String;					// <HIS0066> ADD
begin

    result := 0;

    Qe := TMQuery.Create( Self );
    // 親会社DBとMQueryの接続
    m_cDataModule.SetDBInfoToQuery ( m_SyncMaster.m_cPDBSelect, Qe );

    Qe.Close();
    Qe.SQL.Clear();
	// 親会社に同じ外部ｺｰﾄﾞ・実在/合計区分のﾚｺｰﾄﾞがあるか
    Qe.SQL.Add('select * from TekiMA '		  	);
    Qe.SQL.Add('where (MasterKbn = :pMstKbn) '	);
    Qe.SQL.Add(' and  (GCode     = :pGCode) '	);
    Qe.SQL.Add(' and  (SumKbn    = :pSumKbn) '	);
    Qe.SQL.Add(' and  (RDelKbn   = 0) '			);

    Qe.ParamByName('pMstKbn').AsInteger := MKBN_KOTEKI;
    Qe.ParamByName('pGCode' ).AsInteger  := iGCode;
	Qe.ParamByName('pSumKbn').AsInteger := iSumKbn;

    try										// <HIS0070> ADD

    if ( Qe.Open = false ) then
    begin
        // SQLｴﾗｰ
        ErrorMessageDsp(Qe);
        result := -9;
        Exit;
    end;

    // 親会社に既に該当ﾃﾞｰﾀが存在した場合
    if not Qe.Eof then
    begin
// <HIS0066> MOD start 簡略名称も表示
		strMsg := JNTSYNC_MSG_CHK_SYNC + #13#10 + #13#10 +
        			Qe.FieldByName('TekiChar').AsString;
    										// 「該当ﾏｽﾀは、自社にはありませんが、
											// 全社DBにあります。
											// 自社への関連付けを行いますか？」
(*
        if ( MjsMessageBoxEx(Self, JNTSYNC_MSG_CHK_SYNC,
                             '確認', mjQuestion, mjYESNO, mjDefNO) = mrYES ) then
*)
        if ( MjsMessageBoxEx(Self, strMsg,
                             '確認', mjQuestion, mjYESNO, mjDefNO) = mrYES ) then
// <HIS0066> MOD end
        begin
            // TekiMA_Relｷｰ情報を取得
            nPNCode  := Qe.FieldByName('NCode'    ).AsFloat;

            Qe.Close();
            Qe.SQL.Clear();
            Qe.SQL.Add('select * from TekiMA_Rel '			);
            Qe.SQL.Add('where (NCode      = :pNCode) '		);
            Qe.SQL.Add(' and (GrpSegNCode = :pGrpSegNCode) ');
            Qe.ParamByName('pNCode'      ).AsFloat   := nPNCode;
            Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

            if ( Qe.Open = false ) then
            begin
                // SQLｴﾗｰ
                ErrorMessageDsp(Qe);
                result := -9;
                Exit;
            end;

            if ( Qe.Eof ) then  // TekiMA_Relの存在ﾁｪｯｸ
                    bRet := True
            else    bRet := False;

            // 親会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
            m_cDataModule.BeginTran( m_SyncMaster.m_cPDBSelect );
            // 子会社DBに対してﾄﾗﾝｻﾞｸｼｮﾝを開始する
            m_cDataModule.BeginTran( m_cDBSelect );

            try
                // 親のTekiMA_Relの更新
                if ( bRet ) then   // 新規挿入
                begin
                    Qe.Close();
                    Qe.SQL.Clear();
                    Qe.SQL.Add('insert into TekiMA_Rel ( '			);
                    Qe.SQL.Add(' NCode, GrpSegNCode, RDelKbn_REL) '	);
                    Qe.SQL.Add('values ( '							);
                    Qe.SQL.Add(' :pNCode, :pGrpSegNCode, 0) '		);
                end
                else                // 更新
                begin
                    Qe.Close();
                    Qe.SQL.Clear();
                    Qe.SQL.Add('update TekiMA_Rel set '				 );
                    Qe.SQL.Add('    RDelKbn_REL = 0 '				 );
                    Qe.SQL.Add('   ,UpdDateTM   = CURRENT_TIMESTAMP ');
                    Qe.SQL.Add('where (Ncode       = :pNCode) '		 );
                    Qe.SQL.Add('  and (GrpSegNCode = :pGrpSegNCode) ');
                end;

                Qe.ParamByName('pNCode'      ).AsFloat   := nPNCode;
                Qe.ParamByName('pGrpSegNCode').AsFloat   := m_SyncMaster.m_nSegNCode;

                if ( Qe.ExecSQL = false ) then
                begin
                    MjsMessageBoxEx (Self,
                                     MSG_GRP_RELATION_ERR,	// 「自社への関連付けに失敗しました。」
                                     'マスタ同期', mjError, mjOk, mjDefOk);
                    Abort;
                end;

                // 同期IDﾌﾟﾛｼｰｼﾞｬｰの起動
                if ( m_SyncMaster.fnCall_SYNC(JNTSYNC_TEKIMA) = False ) then
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

            // 親会社DBに対してｺﾐｯﾄを実行する
            m_cDataModule.Commit( m_SyncMaster.m_cPDBSelect );
            // 子会社DBに対してｺﾐｯﾄを実行する
            m_cDataModule.Commit( m_cDBSelect );
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
// <HIS0070> ADD start
	finally
        Qe.Free();
    end;
// <HIS0070> ADD end
end;

//**********************************************************************
//*		Proccess	:	全ての子会社に関連付けﾚｺｰﾄﾞ作成(ﾏｽﾀ同期) <SYNC>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/03/15
//*		Parameter	:	iGCode	外部ｺｰﾄﾞ
//*					:	exNCode	内部ｺｰﾄﾞ
//*		Return		:   True or False
//**********************************************************************
function TJNTCRP020000f.fnAllCorpRelation(iGCode: Integer; exNCode: Extended): Boolean;
var
    bRet     	: Boolean;
    strSQL		: String;
    Qe			: TMQuery;
	QuerySeg	: TMQuery;
begin
    Result := False;

    Qe := TMQuery.Create(Self);
    QuerySeg := TMQuery.Create(Self);

	try
// <HIS0067> MOD start 子会社から呼ばれることもある
											// 自会社(親会社)に接続
(*  	    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qe);
  	    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, QuerySeg);
*)
											// 子会社の場合
	    if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
    	begin	   							// 親会社DBとMQueryの接続
	  	    m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, Qe);
  		    m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, QuerySeg);
    	end
	    else	   							// 親会社またはｸﾞﾙｰﾌﾟ管理の採用なし
    	begin                               // 自分に接続
	  	    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qe);
  		    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, QuerySeg);
    	end;
// <HIS0067> MOD end

		// 子会社に関連付けたｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞを取得

		strSQL := 'SELECT NCode FROM GrpSegMA ' +
				'WHERE MasterKbn = :parMasterKbn ' +
				'AND ParentKbn = 0 ' +
				'AND ForbidKbn = 0 ';

		QuerySeg.Close;
		QuerySeg.SQL.Clear;
		QuerySeg.SQL.Add(strSQL);
        QuerySeg.ParamByName('parMasterKbn').AsInteger := m_iSecMasterKbn;

		if not QuerySeg.Open() then
		begin
            ErrorMessageDsp(QuerySeg);
			Exit;
		end;

		if QuerySeg.Eof then
		begin
			Exit;
		end;

		// 各子会社にRELを作成
		while not QuerySeg.Eof do
		begin
            Qe.Close();
            Qe.SQL.Clear();
			// この子会社にはRELがある？
            Qe.SQL.Add('select * from TekiMA_Rel '			);
            Qe.SQL.Add('where (NCode      = :pNCode) '		);
            Qe.SQL.Add(' and (GrpSegNCode = :pGrpSegNCode) ');
            Qe.ParamByName('pNCode'      ).AsFloat   := exNCode;
            Qe.ParamByName('pGrpSegNCode').AsFloat   := QuerySeg.GetFld('NCode').AsFloat;

            if not Qe.Open() then
            begin
                // SQLｴﾗｰ
                ErrorMessageDsp(Qe);
                Exit;
            end;

            if ( Qe.Eof ) then  // TekiMA_Relの存在ﾁｪｯｸ
			begin
                bRet := True;
			end
            else
			begin
			    bRet := False;
			end;

            // この子会社で使えるｺｰﾄﾞか
            if not CheckMasterRange(iGCode, QuerySeg.GetFld('NCode').AsFloat) then
            begin
            	QuerySeg.Next;				// 範囲外ならRELを作らない
				Continue;
            end;

            try
                // 親のTekiMA_Relの更新
                if bRet then   				// 新規挿入
                begin
                    Qe.Close();
                    Qe.SQL.Clear();
                    Qe.SQL.Add('insert into TekiMA_Rel ( '			);
                    Qe.SQL.Add(' NCode, GrpSegNCode, RDelKbn_REL) '	);
                    Qe.SQL.Add('values ( '							);
                    Qe.SQL.Add(' :pNCode, :pGrpSegNCode, 0) '		);
                end
                else                		// 更新
                begin
                    Qe.Close();
                    Qe.SQL.Clear();
                    Qe.SQL.Add('update TekiMA_Rel set '				 );
                    Qe.SQL.Add('    RDelKbn_REL = 0 '				 );
                    Qe.SQL.Add('   ,UpdDateTM   = CURRENT_TIMESTAMP ');
                    Qe.SQL.Add('where (Ncode       = :pNCode) '		 );
                    Qe.SQL.Add('  and (GrpSegNCode = :pGrpSegNCode) ');
                end;

                Qe.ParamByName('pNCode'      ).AsFloat   := exNCode;
                Qe.ParamByName('pGrpSegNCode').AsFloat   := QuerySeg.GetFld('NCode').AsFloat;

                if not Qe.ExecSQL() then
                begin
                    MjsMessageBoxEx (Self,
                                     MSG_GRP_RELATIONALL_ERR,	// 「子会社への関連付けに失敗しました。」
                                     'マスタ同期', mjError, mjOk, mjDefOk);
					Exit;
                end;
            except
                Exit;
            end;

			QuerySeg.Next;
		end;

		Result := True;
	finally
		QuerySeg.Free;
		Qe.Free;
	end;
end;

//**********************************************************************
//*		Proccess	:	ｸﾞﾙｰﾌﾟ管理時の親会社DBﾄﾗﾝｻﾞｸｼｮﾝ処理
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/03/08
//*		Parameter	:	iTrnKind	親会社DBへの指示
//*		Return		:	なし
//*		Comment		:	ｸﾞﾙｰﾌﾟ管理を採用していない、または親会社の処理中は
//*					:	何もしない。子会社選択中のみ親会社との同期を考慮する
//*		History		:	9999/99/99	X.Xxxx
//**********************************************************************
procedure TJNTCRP020000f.ExecParentDBTran(iTrnKind: Integer);
begin
											// ｸﾞﾙｰﾌﾟ管理採用 & 子会社選択時
	if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
	begin
		if m_SyncMaster.m_cPDBSelect = nil then
		begin
			Exit;
		end;

		case iTrnKind of
			GRP_PARENTDB_BEGINTRAN:			// ﾄﾗﾝｻﾞｸｼｮﾝ開始
			begin
				m_cDataModule.BeginTran(m_SyncMaster.m_cPDBSelect);
			end;
			GRP_PARENTDB_ROLLBACK:			// ﾛｰﾙﾊﾞｯｸ
			begin
				m_cDataModule.RollBack(m_SyncMaster.m_cPDBSelect);
			end;
			GRP_PARENTDB_COMMIT:			// ｺﾐｯﾄ
			begin
				m_cDataModule.Commit(m_SyncMaster.m_cPDBSelect);
			end;
		end;
	end;
end;

//**********************************************************************
//*		Proccess	:	子会社が使えるｺｰﾄﾞか調べる <SYNC>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/03/09
//*		Parameter	:	iGCode		外部ｺｰﾄﾞ
//*					:	exSegNCode  ﾁｪｯｸ対象の会社に関連付けられたｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ
//*		Comment		:	親会社の持つﾚｺｰﾄﾞを参照する
//*		Return		:   Boolean	T: 使用可 F: 使用不可
//**********************************************************************
function TJNTCRP020000f.CheckMasterRange(iGCode: Integer; exSegNCode: Extended): Boolean;
var
    Qe				: TMQuery;
	iStart			: Integer;				// 開始ｺｰﾄﾞ
	iEnd			: Integer;				// 終了ｺｰﾄﾞ
    strSQL			: String;
begin
	Result := False;
	iStart := 0;
	iEnd := 0;

    Qe := TMQuery.Create(Self);
											// 子会社の場合
    if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
    begin									// 親会社DBとMQueryの接続
	    m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, Qe);
    end
    else									// 親会社またはｸﾞﾙｰﾌﾟ管理の採用なし
    begin                                   // 自分に接続
	    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Qe);
    end;

	strSQL := 'SELECT StartCode, EndCode ' +
			'FROM SecMasterRange ' +
			'WHERE OpeKbn = 2 ' +
			'AND MasterKbn = :parMasterKbn ' +
			'AND PlaceNCode = :parPlaceNCode ' +
			'AND RangeMasterKbn = :parRangeMasterKbn ';

    Qe.Close();
    Qe.SQL.Clear();
    Qe.SQL.Add(strSQL);
											// ｸﾞﾙｰﾌﾟ管理で使うｾｸﾞﾒﾝﾄﾏｽﾀ区分
    Qe.ParamByName('parMasterKbn').AsInteger := m_iSecMasterKbn;
											// この子会社が割り当てられたｾｸﾞﾒﾝﾄ内部ｺｰﾄﾞ
	Qe.ParamByName('parPlaceNCode').AsFloat := exSegNCode;
											// 固定摘要
    Qe.ParamByName('parRangeMasterKbn' ).AsInteger := MKBN_KOTEKI;

    if not Qe.Open() then
    begin
        ErrorMessageDsp(Qe);				// SQLｴﾗｰ
        Qe.Free();							// <HIS0070> ADD
        Exit;
    end;

    if not Qe.Eof then
    begin
		iStart := Qe.GetFld('StartCode').AsInteger;
		iEnd := Qe.GetFld('EndCode').AsInteger;
	end;

	// 開始～終了の範囲内に入っている？
	if (iStart <= iGCode) and (iGCode <= iEnd) then
	begin
		Result := True;
	end;

	Qe.Close;
	Qe.Free;
end;

//**************************************************************************
//	Proccess	:  	削除ﾁｪｯｸ(子会社に使用されていたら削除不可) <SYNC>
//	Name	  	:	K.Katou
//	Date	  	:	2007/03/12
//	Parameter 	: 	exNCode	摘要内部ｺｰﾄﾞ
//	Retrun	  	:	Boolean	T: 削除可 F: 削除不可
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP020000f.fnDelCheckChild(exNCode: Extended): Boolean;
var
	strSQL			: String;
	Query			: TMQuery;
begin
	Result := False;

	Query := TMQuery.Create(Self);
    										// 自会社(親会社)DBに接続
	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Query);

   	with  Query do
    begin
		// TekiMA_RELに関連付けﾚｺｰﾄﾞがあるか
		strSQL := 'SELECT NCode ' +
				'FROM TekiMA_REL ' +
				'WHERE NCode = :parNCode ' +
                'AND RDelKbn_REL = 0 ';

	    Close();
    	SQL.Clear();
	    SQL.Add(strSQL);
											// 摘要内部ｺｰﾄﾞ
        ParamByName('parNCode').AsFloat := exNCode;

	    if not Open() then
    	begin
	        ErrorMessageDsp(Query);			// SQLｴﾗｰ
            Query.Free();					// <HIS0070> ADD
    	    Exit;
	    end;

		if Eof then
		begin
			Result := True;					// ﾚｺｰﾄﾞがない場合は削除可
		end;
  	end;

    Query.Close;
    Query.Free;
end;

//**************************************************************************
//	Proccess	:  	更新した摘要の内部ｺｰﾄﾞを返す <SYNC>
//	Name	  	:	K.Katou
//	Date	  	:	2007/03/15
//	Parameter 	: 	exNCode	更新した摘要内部ｺｰﾄﾞ
//	Retrun	  	:	True or False
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP020000f.GetUpdNCode(var exNCode: Extended): Boolean;
var
	Query			: TMQuery;
begin
	Result := False;
    exNCode := 0;

	Query := TMQuery.Create(Self);

// <HIS0067> MOD start
    										// 自会社(親会社)DBに接続
//	m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Query);
											// 子会社の場合
    if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
    begin									// 親会社DBとMQueryの接続
	    m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, Query);
    end
    else									// 親会社またはｸﾞﾙｰﾌﾟ管理の採用なし
    begin                                   // 自分に接続
	    m_cDataModule.SetDBInfoToQuery(m_cDBSelect, Query);
    end;
// <HIS0067> MOD end

	with Query do
	begin
		Close ();
		SQL.Clear ();

        if m_InsFlg then					// Insert時
        begin
            SQL.Add('SELECT @@Identity as NCode FROM TekiMA ');
    		if not Open() then
            begin
		    	m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, Query);
    			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode(Query);
	    		Query.Close ();
		    	Query.Free  ();
    			Exit;
	    	end;
            exNCode := GetFld('NCode').AsFloat;
    		Close ();
        end
        else 								// Update時
        begin
            exNCode := fnGetNCode(m_nProcDivision, 0, m_stMasterData.nExCode);
        end;
    	Free();
    end;
    Result := True;
end;

// <SYNC> ｸﾞﾙｰﾌﾟ会計対応 end

//**************************************************************************
//	Proccess	:  	固定摘要の最大ｺｰﾄﾞ桁数取得 <HIS0058>
//	Name	  	:	K.Katou
//	Date	  	:	2007/03/09
//	Parameter 	:	なし
//	Retrun	  	:	Integer	ｺｰﾄﾞ桁数
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP020000f.GetTekiMasterInfo(): Integer;
var
    Query   : TMQuery;
	strSQL	: String;
begin
	Result := DBDIGIT_TEKIYO;  				// ﾃﾞﾌｫﾙﾄ

	Query := TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Query);

   	with  Query do
    begin									// 固定摘要の採用情報取得
		strSQL := 'SELECT CodeDigit FROM MasterInfo ' +
				'WHERE MasterKbn = 61 ';

	    Close ();
   		SQL.Clear ();
    	SQL.Add(strSQL);

        if not Open() then
        begin
        	Query.Free();					// <HIS0070> ADD
        	Exit;
        end;

        if not Eof then
		begin
        	Result := FieldByName('CodeDigit').AsInteger;
		end;
  	end;

    Query.Close;
    Query.Free;
end;

// <HIS0065> ADD start
//**************************************************************************
//	Proccess	:  	ｸﾞﾙｰﾌﾟ管理時の一括配信ﾀﾞｲｱﾛｸﾞ呼出 <HIS0065>
//	Name	  	:	K.Katou(PRIME)
//	Date	  	:	2007/05/17
//	Parameter 	:	なし
//	Retrun	  	:	なし
//  History     :   2000/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
procedure TJNTCRP020000f.CallSyncDlg();
var
	objSync	: TJNTSyncMasterIF;				// 配信ﾀﾞｲｱﾛｸﾞIF
	aryID 	: array[0..0] of Integer;
begin
	aryID[0] := JNTSYNC_TEKIMA;				// TekiMA 固定摘要

	objSync := TJNTSyncMasterIF.Create(Self, m_pRec);

	try
		objSync.ShowDlg(aryID);
	finally
		objSync.Free;
	end;

end;
// <HIS0065> ADD end

//**************************************************************************
//	Proccess	:	名称から改行コードを削除する  <DKAI>
//	Name		:	E.Nanba
//	Date		:	2008/09/01
//	Parameter	:	sData
//	Retrun		:	String
//	History		:	2001 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP020000f.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;

//************************************************************************
//*     ProgramID       :   JNTCRP020000             <FUKKYU> ADD
//*     Component       :   fnTekiTreeFukkyu
//*     Name            :   T.Ogawa(RIT)　　　　　　
//*                         2009.11.30
//************************************************************************
function TJNTCRP020000f.fnTekiTreeFukkyu (): Boolean;
var
    dqMasterTreeUpdate:TMQuery;
begin
    result := True;
    dqMasterTreeUpdate := nil;
    //摘要分類体系
    try
        dqMasterTreeUpdate := TMQuery.Create( Self );
        m_cDataModule.SetDBInfoToQuery( m_cDBSelect, dqMasterTreeUpdate );

        with (dqMasterTreeUpdate) do
        begin
            Close ();
            SQL.Clear ();
            SQL.Add   ('DELETE FROM TekiTree '); //
            SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = 1 AND ');
            SQL.Add   ('       BasedNCode IN ');
            SQL.Add   ('(Select NCode From TekiMA Where MasterKbn = 61 And SumKbn = 0 And RDelKbn = 1)');

            if	(not ExecSQL ()) then
            begin
                m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTreeUpdate);
                m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTreeUpdate);
                Result	:= false;
                Exit;
            end;
        end;
    finally
        dqMasterTreeUpdate.Close;
        dqMasterTreeUpdate.Free;
    end;
end;

//<MLXDEP>↓
//**********************************************************************
//*		Proccess	:	ツールバーの表示設定
//*		Name		:	IWATA（NTC）
//*		Date		:	2012/10/24
//*		Parameter	:
//*		Return		:
//**********************************************************************
procedure TJNTCRP020000f.ToolBarObjectMove;
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
	iLeft 	:= BSpeedButtonEnd.Left;
	TbMove(True,					BSpeedButtonEnd);			// 終了
	TbMove(True,					CmnToolbarButtonPrint);		// 印刷
	TbMove(True,					B_Change);					// 切出
	TbMove(True,					CmnToolbarButtonDelete);	// 削除
	TbMove(True,					MToolBar1);					// 付箋
end;
//<MLXDEP>↑
//<HIS0105> ADD St
//==============================================================================
// 概要：業種コード関連の設定
//==============================================================================
procedure TJNTCRP020000f.SettingTypeCode();
begin
    DtlCmnEditTypeCode.SelectItems.Clear();
    DtlCmnEditTypeCode.SelectItems.Add('0: 科目設定に従う');
    DtlCmnEditTypeCode.SelectItems.Add('1: 第１種事業');
    DtlCmnEditTypeCode.SelectItems.Add('2: 第２種事業');
    DtlCmnEditTypeCode.SelectItems.Add('3: 第３種事業');
    DtlCmnEditTypeCode.SelectItems.Add('4: 第４種事業');
    DtlCmnEditTypeCode.SelectItems.Add('5: 第５種事業');
    // 第6種は旧GaliかGNXのV1.07以降有効にする
//<HIS0109> DEL    if (TMSeries.IsGalileopt or
    if ((TMSeries.IsGalileopt and (m_iDataVer >= 45)) or
        (TMSeries.IsGalielopt2 and (m_iDataVer >= 47))) then
    begin
        DtlCmnEditTypeCode.SelectItems.Add('6: 第６種事業');
        DtlCmnEditTypeCode.MaxValue := 6;
        m_cTypeCode.MinCode := 0;
        m_cTypeCode.MaxCode := 6;
    end
    else
    begin
        DtlCmnEditTypeCode.MaxValue := 5;
        m_cTypeCode.MinCode := 0;
        m_cTypeCode.MaxCode := 5;
    end;

    DtlCmnEditTypeCode.Validate := true;
end;
//<HIS0105> ADD Ed
//<HIS0108> ADD St
//==============================================================================
// 概要：安全にフォーカスを当てる
//==============================================================================
procedure TJNTCRP020000f.CustomSetFocus(oComs : array of TWinControl; index: Integer=0);
begin
    if index >= Length(oComs) then
    begin
        Exit;
    end;

    if oComs[index].CanFocus then
    begin
        oComs[index].SetFocus();
    end
    else
    begin
        CustomSetFocus(oComs, index + 1);
    end;
end;
//<HIS0108> ADD Ed
//<HIS0110> ADD St
//==============================================================================
// 概要：売上の消費税コード配列を構築
//==============================================================================
procedure TJNTCRP020000f.CreateTaxSalesItems();

    procedure AddItem(AWord : String; ARate : Integer; AType : Integer);
    begin
        SetLength(m_TaxSalesItems, Length(m_TaxSalesItems) + 1);
        m_TaxSalesItems[Length(m_TaxSalesItems) - 1].sWord := AWord;
        m_TaxSalesItems[Length(m_TaxSalesItems) - 1].iRate := ARate;
        m_TaxSalesItems[Length(m_TaxSalesItems) - 1].iType := AType;
    end;

begin
    AddItem(' 0: 科目設定に従う', 0, 0);
    AddItem(' 0: 標準設定に従う', 0, 0);
    AddItem('10: 課税売上(内税)', 1, 1);
    AddItem('12: 課税売上控除(内税)', 1, 1);
    AddItem('13: 課税貸倒償却(内税)', 1, 0);
    AddItem('15: 課税貸倒回収(内税)', 1, 0);
    AddItem('20: 課税売上(外税)', 1, 1);
    AddItem('22: 課税売上控除(外税)', 1, 1);
    AddItem('23: 課税貸倒償却(外税)', 1, 0);
    AddItem('25: 課税貸倒回収(外税)', 1, 0);
    AddItem('30: 非課税売上', 0, 0);
    AddItem('34: 有価証券売上等(非課税)', 0, 0);
    AddItem('40: 不課税売上(精算取引)', 0, 0);
    AddItem('60: 輸出売上', 0, 0);
    AddItem('64: 非課税輸出売上', 0, 0);

    if (m_nCompDivision = 1) then   // 公益法人区分: 1=公益法人
    begin
        AddItem('80: 課税仕入対応特定収入', 0, 0);
        AddItem('81: 共通仕入対応特定収入', 0, 0);
        AddItem('84: 非課税仕入対応特定収入', 0, 0);
        AddItem('89: 使途不特定の特定収入', 0, 0);
    end;

    AddItem('99: 不明', 0, 0);
end;
//<HIS0110> ADD Ed
//<HIS0111> ADD St
//==============================================================================
// 概要：消費税関連項目の妥当性チェック
//==============================================================================
function TJNTCRP020000f.fnCheckTaxValue(pDivision, pTaxRate, pTaxCode : Integer): Integer;
begin

    result := CHECK_OK;
//<#TAX10> Mod↓ 仕入取引の消費税コード追加の制御
//	if (pDivision = 2)             and       // 仕入
//	   (pTaxCode in [15, 16, 25, 26]) and
//	   (pTaxRate = 1)                 then
//	begin
//       result := CHECK_NG;
//	end;
	if (pDivision = 2)             and       // 仕入
	   (pTaxCode in [15, 16, 25, 26, 70, 71, 74, 80, 81, 82, 84, 85, 86]) and
	   (pTaxRate = 1)                 then  //3%の時
	begin
        result := CHECK_NG;
	end
    else if (pDivision = 2)             and
	        (pTaxCode in [80, 81, 82, 84, 85, 86]) and
	        (pTaxRate = 2)                 then  //5%の時
    begin
        result := CHECK_NG;
	end
    else if (pDivision = 2)             and
	        (pTaxCode in [80, 81, 82, 84, 85, 86]) and
	        (pTaxRate = 5)                 then  //8%軽減の時
    begin
        result := CHECK_NG;
	end;
//<#TAX10> Mod↑
end;
//<HIS0111> ADD Ed
end.
//***********************************************************************************************************/
//*																											*/
//*	End Of Specifications																					*/
//*																											*/
//***********************************************************************************************************/


