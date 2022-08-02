//******************************************************************************
//  System      : FX共通マスタ
//  Program     : 取引先登録印刷用定義ファイル
//  ProgramID   : JNTCRP004001CONST.inc
//  Name        : T.Ogawa(RIT)
//  Create      : 2010/08/30
//  Comment     : 取引先登録リストの高速化対応の為作成
//  History
//     <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//------------------------------------------------------------------------------
//     <#xxx>  X.Xxxx
//************↓Ver 4.08(NX-I 5.01) リリース向け********************************
//
//	   <2284>  吉田健吾		   2012.02.14	   取引先登録にて基本情報から印刷（実在取引先登録リスト「詳細」）にてファイル
//											   出力すると入金予定日情報・支払締日情報が出力されない。修正に伴い詳細型の印刷レイアウトに項目を追加する。
//	   <MYN>   小川(NTC)	   2015.06.17(Wed) マイナンバー対応。印刷・ファイル出力の基本情報に「法人/個人区分」「法人/個人番号」追加。
//
//******************************************************************************

{$IFNDEF _JNTCRP018001CONST_}
{$DEFINE _JNTCRP018001CONST_}

//-------------------------------------------------------------------------------------------
//	ID				 				値				内容						UPDATE
// ------------------------------------------------------------------------------------------
const


//簡易型
	//データ取得クエリ
{↓<2284>詳細型の修正に伴い簡略型にもテーブルの別名を付け直します。
	KANI_SQL = 'SELECT ' +
					'GCode, ' +
					'HojyoKbn1, ' +
					'HojyoKbn2, ' +
                    'SisanHojyoKbn1, ' +
                    'SisanHojyoKbn2, ' +
                    'SisanHojyoKbn3, ' +
                    'Renso, ' +
                    'Nmk, ' +
                    'Nm, ' +
                    'NCode ' +
				'FROM ' +
					'MTokui ' +
                'WHERE  (SumKbn = 0) AND (RDelKbn = 0) ';
↑<2284>}
//↓<2284>
	KANI_SQL = 'SELECT ' +
					'tok.GCode, ' +
					'tok.HojyoKbn1, ' +
					'tok.HojyoKbn2, ' +
                    'tok.SisanHojyoKbn1, ' +
                    'tok.SisanHojyoKbn2, ' +
                    'tok.SisanHojyoKbn3, ' +
                    'tok.Renso, ' +
                    'tok.Nmk, ' +
                    'tok.Nm, ' +
                    'tok.NCode ' +
				'FROM ' +
					'MTokui tok ' +
                'WHERE  (tok.SumKbn = 0) AND (tok.RDelKbn = 0) ';
//↑<2284>
	//インデックス
	KANI_INDEX_GCODE						= 0;							// 取引先外部コード
	KANI_INDEX_HOJYOKBN1					= 1;							// 得意先採用
	KANI_INDEX_HOJYOKBN2					= 2;							// 仕入先採用
	KANI_INDEX_SISANHOJYOKBN1			    = 3;							// 資産購入先採用
	KANI_INDEX_SISANHOJYOKBN2			    = 4;							// 資産売却先採用
	KANI_INDEX_SISANHOJYOKBN3			    = 5;							// 資産リース会社採用
	KANI_INDEX_RENSO						= 6;							// 連想
	KANI_INDEX_NMK						    = 7;							// 簡略名称
	KANI_INDEX_NM						    = 8;							// 正式名称
	KANI_INDEX_NCODE						= 9;							// 内部コード

//詳細型
	//データ取得クエリ
{<2284>↓JOINの追加に伴い別名を付け直すためコメントアウト
	SHOSAI_SQL = 'SELECT ' +
					'GCode, ' +
					'HojyoKbn1, ' +
					'HojyoKbn2, ' +
                    'SisanHojyoKbn1, ' +
                    'SisanHojyoKbn2, ' +
                    'SisanHojyoKbn3, ' +
                    'Renso, ' +
                    'Nmk, ' +
                    'Nm, ' +
                    'NCode, ' +
                    'PostNo1, ' +
                    'PostNo2, ' +
                    'Ads1, ' +
                    'Ads2, ' +
                    'DHyoNm1, ' +
                    'DHyoNm2, ' +
                    'Tel1, ' +
                    'Tel2, ' +
                    'Fax1, ' +
                    'ShihonKin, ' +
                    'SyainSu, ' +
                    'Nensyo, ' +
                    'HPAddress, ' +
                    'TStartDate, ' +
                    'TEndDate, ' +
                    'RCloseDay1, ' +
                    'RCloseDay2, ' +
                    'RCloseDay3, ' +
                    'RcvDay1, ' +
                    'RcvDay2, ' +
                    'RcvDay3, ' +
                    'RcvMonth1, ' +
                    'RcvMonth2, ' +
                    'RcvMonth3, ' +
                    'RHolidayKbn1, ' +
                    'RHolidayKbn2, ' +
                    'RHolidayKbn3, ' +
                    'PCloseDay1, ' +
                    'PCloseDay2, ' +
                    'PCloseDay3, ' +
                    'PayDay1, ' +
                    'PayDay2, ' +
                    'PayDay3, ' +
                    'PayMonth1, ' +
                    'PayMonth2, ' +
                    'PayMonth3, ' +
                    'PHolidayKbn1, ' +
                    'PHolidayKbn2, ' +
                    'PHolidayKbn3, ' +
                    'UpdDateTM, ' +
                    'REndKaisu, ' +
                    'PEndKaisu ' +
                'FROM MTOKUI ' +
                'WHERE  (SumKbn = 0) AND (RDelKbn = 0) ';
↑<2284>}
//<2284>↓
	SHOSAI_SQL = 'SELECT ' +
					'tok.GCode, ' +
					'tok.HojyoKbn1, ' +
					'tok.HojyoKbn2, ' +
                    'tok.SisanHojyoKbn1, ' +
                    'tok.SisanHojyoKbn2, ' +
                    'tok.SisanHojyoKbn3, ' +
                    'tok.Renso, ' +
                    'tok.Nmk, ' +
                    'tok.Nm, ' +
                    'tok.NCode, ' +
                    'tok.PostNo1, ' +
                    'tok.PostNo2, ' +
                    'tok.Ads1, ' +
                    'tok.Ads2, ' +
                    'tok.DHyoNm1, ' +
                    'tok.DHyoNm2, ' +
                    'tok.Tel1, ' +
                    'tok.Tel2, ' +
                    'tok.Fax1, ' +
                    'tok.ShihonKin, ' +
                    'tok.SyainSu, ' +
                    'tok.Nensyo, ' +
                    'tok.HPAddress, ' +
                    'tok.TStartDate, ' +
                    'tok.TEndDate, ' +
                    'tok.RCloseDay1, ' +
                    'tok.RCloseDay2, ' +
                    'tok.RCloseDay3, ' +
                    'tok.RcvDay1, ' +
                    'tok.RcvDay2, ' +
                    'tok.RcvDay3, ' +
                    'tok.RcvMonth1, ' +
                    'tok.RcvMonth2, ' +
                    'tok.RcvMonth3, ' +
                    'tok.RHolidayKbn1, ' +
                    'tok.RHolidayKbn2, ' +
                    'tok.RHolidayKbn3, ' +
                    'tok.PCloseDay1, ' +
                    'tok.PCloseDay2, ' +
                    'tok.PCloseDay3, ' +
                    'tok.PayDay1, ' +
                    'tok.PayDay2, ' +
                    'tok.PayDay3, ' +
                    'tok.PayMonth1, ' +
                    'tok.PayMonth2, ' +
                    'tok.PayMonth3, ' +
                    'tok.PHolidayKbn1, ' +
                    'tok.PHolidayKbn2, ' +
                    'tok.PHolidayKbn3, ' +
                    'tok.UpdDateTM, ' +
                    'tok.REndKaisu, ' +
                    'tok.PEndKaisu, ' +
                    'tok.Fkana, ' +
                    'tok.Keisyokbn, ' +
					'mei.Gcode as GyoGCode, ' +
                    'mei.NMK as GyoNmk ' +
// <MYN> ins -s
                  ', tok.HoujinKbn ' +
                  ', tok.HoujinNo ' +
                  ', tok.KojinKey ' +
// <MYN> ins -e
                'FROM MTOKUI tok ' +
                'Left Outer Join Mmeisho mei on(tok.GyoNcode = mei.Ncode) ' +
                'WHERE  (tok.SumKbn = 0) AND (tok.RDelKbn = 0) ';
//<2284>↑

//詳細：取引先情報インデックス
	INDEX_GCODE						= 0;							// 取引先外部コード
	INDEX_HOJYOKBN1					= 1;							// 得意先採用
	INDEX_HOJYOKBN2					= 2;							// 仕入先採用
	INDEX_SISANHOJYOKBN1			= 3;							// 資産購入先採用
	INDEX_SISANHOJYOKBN2			= 4;							// 資産売却先採用
	INDEX_SISANHOJYOKBN3			= 5;							// 資産リース会社採用
	INDEX_RENSO						= 6;							// 連想
	INDEX_NMK						= 7;							// 簡略名称
	INDEX_NM						= 8;							// 正式名称
	INDEX_NCODE						= 9;							// 内部コード
	INDEX_POSTNO1					= 10;							// 郵便番号１
	INDEX_POSTNO2					= 11;							// 郵便番号２
	INDEX_ADS1						= 12;							// 住所上段１
	INDEX_ADS2 						= 13;							// 住所上段２
	INDEX_DHYONM1 					= 14;							// 代表者役職名
	INDEX_DHYONM2 					= 15;							// 代表者名
	INDEX_TEL1						= 16;							// 電話番号(1)
	INDEX_TEL2						= 17;							// 電話番号(2)
	INDEX_FAX1						= 18;							// FAX番号
	INDEX_SHIHONKIN					= 19;							// 資本金
	INDEX_SYAINSU					= 20;							// 社員数
	INDEX_NENSYO					= 21;							// 年商
	INDEX_HPADDRESS					= 22;							// ホームページアドレス
	INDEX_TSTARTDATE				= 23;							// 適用期間（自）
	INDEX_TENDDATE					= 24;							// 適用期間（至）
	INDEX_RCLOSEDAY1				= 25;							// 締日１
	INDEX_RCLOSEDAY2				= 26;							// 締日２
	INDEX_RCLOSEDAY3				= 27;							// 締日３
	INDEX_RCVDAY1					= 28;							// 回収日１
	INDEX_RCVDAY2					= 29;							// 回収日２
	INDEX_RCVDAY3					= 30;							// 回収日３
	INDEX_RCVMONTH1					= 31;							// サイクル１
	INDEX_RCVMONTH2					= 32;							// サイクル２
	INDEX_RCVMONTH3					= 33;							// サイクル３
	INDEX_RHOLIDAYKBN1				= 34;							// 休日区分（１）
	INDEX_RHOLIDAYKBN2				= 35;							// 休日区分（２）
	INDEX_RHOLIDAYKBN3				= 36;							// 休日区分（３）
	INDEX_PCLOSEDAY1				= 37;							// 締日１
	INDEX_PCLOSEDAY2				= 38;							// 締日２
	INDEX_PCLOSEDAY3				= 39;							// 締日３
	INDEX_PAYDAY1					= 40;							// 回収日１
	INDEX_PAYDAY2					= 41;							// 回収日２
	INDEX_PAYDAY3					= 42;							// 回収日３
	INDEX_PAYMONTH1					= 43;							// サイクル１
	INDEX_PAYMONTH2					= 44;							// サイクル２
	INDEX_PAYMONTH3					= 45; 							// サイクル３
	INDEX_PHOLIDAYKBN1				= 46;							// 休日区分（１）
	INDEX_PHOLIDAYKBN2				= 47;							// 休日区分（２）
	INDEX_PHOLIDAYKBN3				= 48;							// 休日区分（３）
	INDEX_UPDDATETM					= 49;							// 修正日付
	INDEX_RENDKAISU					= 50;							// 締日回数
	INDEX_PENDKAISU					= 51;							// 締日回数

//↓<2284>
	INDEX_FKANA						= 52;							// ﾌﾘｶﾞﾅ
	INDEX_KEISYOKBN					= 53;							// 敬称
	INDEX_GYOGCODE					= 54;							// 業種外部ｺｰﾄﾞ
	INDEX_GYONMK					= 55;							// 業種簡略名
//↑<2284>

// <MYN> ins -s
	INDEX_HOUJINKBN					= 56;							// 法人/個人区分
	INDEX_HOUJINNO					= 57;							// 法人番号
	INDEX_KOJINKEY					= 58;							// 個人番号管理キー
// <MYN> ins -e

//合計取引先
	//データ取得クエリ
	GOUKEI_SQL = 'SELECT ' +
                     'm.GCode, ' +
                     'm.HojyoKbn1, ' +
                     'm.HojyoKbn2, ' +
                     'm.SisanHojyoKbn1, ' +
                     'm.SisanHojyoKbn2, ' +
                     'm.SisanHojyoKbn3, ' +
                     'm.Renso, ' +
                     'm.Nmk, ' +
                     'm.Nm, ' +
                     'c.PostNo1, ' +
                     'c.PostNo2, ' +
                     'c.Ads1, ' +
                     'f.FusenKbn ' +
                'FROM MTOKUI m ' +
                'LEFT OUTER JOIN MTOKUI_CRD c on (c.BaseNCode = m.NCode) ' +
                'LEFT OUTER JOIN MFusenInfo f on (f.NCode     = m.NCode) ' +
                '                            AND (f.MasterKbn = 22) ' +
                'WHERE  (SumKbn <> 0) AND (RDelKbn = 0) ';

//合計取引先情報インデックス
	G_INDEX_GCODE						= 0;							// 取引先外部コード
	G_INDEX_HOJYOKBN1					= 1;							// 得意先採用
	G_INDEX_HOJYOKBN2					= 2;							// 仕入先採用
	G_INDEX_SISANHOJYOKBN1			    = 3;							// 資産購入先採用
	G_INDEX_SISANHOJYOKBN2			    = 4;							// 資産売却先採用
	G_INDEX_SISANHOJYOKBN3			    = 5;							// 資産リース会社採用
	G_INDEX_RENSO						= 6;							// 連想
	G_INDEX_NMK						    = 7;							// 簡略名称
	G_INDEX_NM						    = 8;							// 正式名称
	G_INDEX_POSTNO1				    	= 9;							// 郵便番号１
	G_INDEX_POSTNO2				    	= 10;							// 郵便番号２
	G_INDEX_ADS1						= 11;							// 住所上段１
	G_INDEX_FUSENKBN				    = 12;							// 付箋区分


//加算体系
	//データ取得クエリ

{
	KASAN_SQL = 'SELECT ' +
                    'GCode, ' +
                    'Nmk, ' +
                    'NCode, ' +
                    'Renso, ' +
                    'Nm ' +
                'FROM MTOKUI ' +
                'WHERE (SumKbn = 1) AND (RDelKbn = 0) AND (TemplateKbn = 0)      ' +
                'Order By GCode                                                  ';

}
//<KSN_PRN> 条件と順序は印刷時に付加
	KASAN_SQL = 'SELECT ' +
                    'GCode, ' +
                    'Nmk, ' +
                    'NCode, ' +
                    'Renso, ' +
                    'Nm ' +
                'FROM MTOKUI ' +
                'WHERE (SumKbn = 1) AND (RDelKbn = 0) AND (TemplateKbn = 0)      ' ;

	//データ取得クエリ
	KASAN_SQL2 = 'SELECT ' +
                     'hm.GCode, ' +
                     'hm.Nmk ' +
                 'FROM HojyoTree ht, MTOKUI hm ' +
		         'WHERE  (ht.MasterKbn   = 22) ' +
                    '   AND (hm.RDelKbn     = 0) ' +
                    '   AND (hm.TemplateKbn = 0) ' +
                    '   AND (ht.SumNCode    = :strExCodeDst) ' +
                    '   AND (hm.NCode       = ht.BasedNCode) ' +
                 'Order By ht.EntNo                                      ';

//加算体系インデックス
	KASAN_INDEX_GCODE					= 0;							// 取引先外部コード
	KASAN_INDEX_NMK						= 1;							// 簡略名称
	KASAN_INDEX_NCODE					= 2;							// 内部コード
	KASAN_INDEX_RENSO					= 3;							// 連想
	KASAN_INDEX_NM						= 4;							// 正式名称


{$ENDIF}
//	End of File
