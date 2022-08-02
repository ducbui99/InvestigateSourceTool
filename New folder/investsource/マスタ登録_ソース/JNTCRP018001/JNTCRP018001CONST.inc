//******************************************************************************
//  System      : FX共通マスタ
//  Program     : 工事登録印刷用定義ファイル
//  ProgramID   : JNTCRP018001CONST.inc
//  Name        : T.Miyagi(RIT)
//  Create      : 2010/04/08
//  Comment     : 工事登録リスト[詳細型]の高速化対応の為作成
//  History
//     <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//------------------------------------------------------------------------------
//     <#001>  T.Ogawa(RIT)    2010/05/21(FRI) 詳細リストのマスタ名称は正式名称にする対応
//     <#002>  K.Katou(PRIME)  2011/06/15(WED) 加算登録リスト追加
//******************************************************************************

{$IFNDEF _JNTCRP018001CONST_}
{$DEFINE _JNTCRP018001CONST_}

//-------------------------------------------------------------------------------------------
//	ID				 				値				内容						UPDATE
// ------------------------------------------------------------------------------------------
const


//簡易型
	//データ取得クエリ
	KANI_SQL = 'SELECT ' +
					'MA.GCode,' + 											// 0:外部ｺｰﾄﾞ
					'MA.Renso,' + 											// 1:連想ｼﾝﾎﾞﾙ
					'MA.LongName,' + 										// 2:正式名称
					'MA.SimpleName,' +										// 3:簡略名称
					'MA.NCode,' + 											// 4:内部ｺｰﾄﾞ
					'MF.FusenKbn,' +										// 5:付箋区分
					'MF.FusenCmnt ' + 										// 6:付箋コメント
				'FROM ' + 
					'HojyoMA MA ' +
					'left outer join MFusenInfo MF on MF.MasterKbn = :pMKBN and MA.NCode = MF.NCode ' +
				'WHERE ' +
					'MA.RDelKbn = 0 AND ' +  
					'MA.MasterKbn = :pMKBN AND ' + 
					'MA.SumKbn = :pSumKbn ';
	//インデックス
	KANI_INDEX_GCODE				= 0;							// 工事外部コード
	KANI_INDEX_RENSO				= 1;							// 連想
	KANI_INDEX_LONGNAME				= 2;							// 正式名称
	KANI_INDEX_SIMPLENAME			= 3;							// 簡略名称
	KANI_INDEX_NCODE				= 4;							// 工事内部ｺｰﾄﾞ
	KANI_INDEX_FUSENKBN				= 5;							// 付箋区分
	KANI_INDEX_FUSENCMNT			= 6;							// 付箋コメント
	
//詳細型
	//詳細型：工事情報データ取得クエリ
    SHOSAI_SQL = 'SELECT ' +
					'MA.GCode,' + 								        // 0:工事外部コード
					'MA.NCode,' +								        // 1:工事内部コード
					'MA.Renso,' + 								        // 2:連想
					'MA.LongName,' + 							        // 3:正式名称
					'MA.SimpleName,' + 							        // 4:簡略名称
					'MA.UpdDateTM,' + 							        // 5:修正日時
					'MA.BunCode,' + 							        // 6:入力区分
					'MA.FinishDate,' + 							        // 7:工事完成年月日
					'MA.MoveKbn,' +  							        // 8:翌期移送区分
					'MA.RootKbn, ' +  							        // 9:名寄区分
					'MF.FusenKbn,' +					                // 10:付箋区分
					'MF.FusenCmnt,' + 							        // 11:付箋コメント
					'KI.ZipCode1,' +  							        // 12:郵便番号(基番)
					'KI.ZipCode2,' +  							        // 13:郵便番号(枝番)
					'KI.Address1,' +  							        // 14:住所１
					'KI.Address2,' + 							        // 15:住所２
					'KI.TelNo,' + 								        // 16:電話番号
					'KI.PersonNCode,' +                                 // 17:担当者内部コード
					'HA.Gcode as PersonGCode,' +		                // 18:担当者外部コード
//<#001> MOD St
//					'MOS.SimpleName as PersonName,' +			        // 19:担当者名称
					'MOS.Name as PersonName,' +			                // 19:担当者名称
					'KI.CostomerNCode,' +                               // 20:取引先内部コード
					'MT.GCode as CostomerGCode,' +	                    // 21:取引先外部コード
//					'MT.Nmk as CostomerCodeName,' +    			        // 22:取引先名称
					'MT.Nm as CostomerCodeName,' +    			        // 22:取引先名称
					'KI.BmnNCode,' +                           			// 23:部門内部コード
					'BMA.GCode as BmnGCode,' +		                    // 24:部門外部コード
//					'BMA.SimpleName as BmnName,' +   			        // 25:部門簡略名称
					'BMA.LongName as BmnName,' +   			            // 25:部門正式名称

					'KI.SalesBase,' + 							        // 26:計上基準
					'KI.HaifuKbn,' + 							        // 27:配賦区分
					'KI.ScheDateST,' + 							        // 28:実績工期開始
					'KI.ScheDateEN,' + 							        // 29:実績工期開始
					'KI.YoteiDateST,' + 						        // 30予定工期開始
					'KI.YoteiDateEN,' + 						        // 31:予定工期終了
					'KI.Remarks,' + 							        // 32:備考
					'KI.Gaiyou,' + 								        // 33:概要
					'KI.FAXNo,' + 								        // 34:FAX番号
					'KI.UkeoiKbn,' + 							        // 35:請負区分
					'KI.SesNCode,' +                          	        // 36:施主内部コード
					'MS.GCode as SesGCode,' +				            // 37施主外部コード
//					'MS.Nmk as SesName,' +						        // 38:施主簡略名称
					'MS.Nm as SesName,' +						        // 38:施主正式名称
					'KI.SeiBmnNCode,' +                                 // 39:施工部門内部コード
					'BMASK.GCode as SeiBmnGCode,' +                     // 40:施工部門外部コード
//					'BMASK.SimpleName as SeiBmnName,' +			        // 41:施工部門簡略名称
					'BMASK.LongName as SeiBmnName,' +			        // 41:施工部門正式名称
					'isnull(KI.SeiTanNCode,0) as SeiTanNCode,' +        // 42:施工担当内部コード
					'HASK.Gcode as SeiTanGCode,' +	                    // 43:施工担当者外部コード
//					'MOSSK.SimpleName as SeiTanName,' + 		        // 44:施工担当者名称
					'MOSSK.Name as SeiTanName,' + 		                // 44:施工担当者名称
					'KI.DetailKbn1,' +	                                // 45:完成振替パターン
					'KI.DetailKbn2,' +	                                // 46:完成売上高相手勘定区分
					'KM.GCode as SalesKmkCd,' +		                    // 47:売上計上科目コード
//					'KM.SimpleName as SalesKmkCdName,' + 		        // 48:売上計上科目名称
					'KM.LongName as SalesKmkCdName,' + 		            // 48:売上計上科目名称
					'KI.PartKbn,' +                 		            // 49工種管理区分
					'KP.PtnNo,' + 		    				            // 50:工種パターンNO
					'KI.Seg1NCode,' + 	 		                        // 51:セグ1内部コード
					'Seg1.GCode as Seg1GCode,' + 			            // 52:セグ1外部コード
//					'Seg1.SimpleName as Seg1Nm,' + 				        // 53:セグ1名称
					'Seg1.LongName as Seg1Nm,' + 				        // 53:セグ1名称
					'KI.Seg2NCode,' +                        			// 54:セグ2内部コード
					'Seg2.GCode as Seg2GCode,' +				        // 55:セグ2外部コード
//					'Seg2.SimpleName as Seg2Nm,' + 				        // 56:セグ2名称
					'Seg2.LongName as Seg2Nm,' + 				        // 56:セグ2名称
					'KI.Seg3NCode,' +  			                        // 57:セグ3内部コード
					'Seg3.GCode as Seg3GCode,' +				        // 58:セグ3外部コード
//					'Seg3.SimpleName as Seg3Nm,' + 				        // 59:セグ3名称
					'Seg3.LongName as Seg3Nm,' + 				        // 59:セグ3名称
					'KI.Seg4NCode,' +    		                        // 60:セグ4内部コード
					'Seg4.GCode as Seg4GCode,' +				        // 61:セグ4外部コード
//					'Seg4.SimpleName as Seg4Nm,' + 				        // 62:セグ4名称
					'Seg4.LongName as Seg4Nm,' + 				        // 62:セグ4名称
					'KI.Seg5NCode,' +                   			    // 63:セグ5内部コード
					'Seg5.GCode as Seg5GCode,' +				        // 64:セグ5外部コード
//					'Seg5.SimpleName as Seg5Nm,' + 				        // 65セグ5名称
					'Seg5.LongName as Seg5Nm,' + 				        // 65セグ5名称
					'KI.Seg6NCode,' +			                        // 66:セグ6内部コード
					'Seg6.GCode as Seg6GCode,' +				        // 67:セグ6外部コード
//					'Seg6.SimpleName as Seg6Nm,' + 				        // 68:セグ6名称
					'Seg6.LongName as Seg6Nm,' + 				        // 68:セグ6名称
					'KI.Seg7NCode,' +			                        // 69:セグ7内部コード
					'Seg7.GCode as Seg7GCode,' + 				        // 70:セグ7外部コード
//					'Seg7.SimpleName as Seg7Nm,' + 				        // 71:セグ7名称
					'Seg7.LongName as Seg7Nm,' + 				        // 71:セグ7名称
					'KI.Seg8NCode,' +	                                // 72:セグ8内部コード
					'Seg8.GCode as Seg8GCode,' + 				        // 73:セグ8外部コード
//					'Seg8.SimpleName as Seg8Nm,' + 				        // 74:セグ8名称
					'Seg8.LongName as Seg8Nm,' + 				        // 74:セグ8名称
					'KI.Seg9NCode,' +  	                                // 75:セグ9内部コード
					'Seg9.GCode as Seg9GCode,' + 				        // 76:セグ9外部コード
//					'Seg9.SimpleName as Seg9Nm,' + 				        // 77:セグ9名称
					'Seg9.LongName as Seg9Nm,' + 				        // 77:セグ9名称
					'KI.Seg10NCode,' +	                                // 78:セグ10内部コード
					'Seg10.GCode as Seg10GCode,' + 				        // 79:セグ10外部コード
//					'Seg10.SimpleName as Seg10Nm,' + 			        // 80:セグ10名称
					'Seg10.LongName as Seg10Nm,' + 			            // 80:セグ10名称
					'KI.Prj1NCode,' +	                                // 81:プロ1内部コード
					'Prj1.GCode as Prj1GCode,' + 				        // 82:プロ1外部コード
//					'Prj1.SimpleName as Prj1Nm,' + 				        // 83:プロ1名称
					'Prj1.LongName as Prj1Nm,' + 				        // 83:プロ1名称
					'KI.Prj2NCode,' +                                   // 84:プロ2内部コード
					'Prj2.GCode as Prj2GCode,' + 				        // 85プロ2外部コード
//					'Prj2.SimpleName as Prj2Nm,' + 				        // 86:プロ2名称
					'Prj2.LongName as Prj2Nm,' + 				        // 86:プロ2名称
					'KI.Prj3NCode,' +	                                // 87:プロ3内部コード
					'Prj3.GCode as Prj3GCode,' + 				        // 88:プロ3外部コード
//					'Prj3.SimpleName as Prj3Nm,' + 				        // 89:プロ3名称
					'Prj3.LongName as Prj3Nm,' + 				        // 89:プロ3名称
					'KI.Prj4NCode,' +	                                // 90:プロ4内部コード
					'Prj4.GCode as Prj4GCode,' + 				        // 91:プロ4外部コード
//					'Prj4.SimpleName as Prj4Nm,' + 				        // 92:プロ4名称
					'Prj4.LongName as Prj4Nm,' + 				        // 92:プロ4名称
					'KI.Prj5NCode,' +	                                // 93:プロ5内部コード
					'Prj5.GCode as Prj5GCode,' + 				        // 94:プロ5外部コード
//					'Prj5.SimpleName as Prj5Nm,' + 				        // 95:プロ5名称
					'Prj5.LongName as Prj5Nm,' + 				        // 95:プロ5名称
					'KI.Prj6NCode,' +	                                // 96:プロ6内部コード
					'Prj6.GCode as Prj6GCode,' + 				        // 97:プロ6外部コード
//					'Prj6.SimpleName as Prj6Nm,' + 				        // 98:プロ6名称
					'Prj6.LongName as Prj6Nm,' + 				        // 98:プロ6名称
					'KI.Prj7NCode,' +	                                // 99:プロ7内部コード
					'Prj7.GCode as Prj7GCode,' + 				        // 100:プロ7外部コード
//					'Prj7.SimpleName as Prj7Nm,' + 				        // 101:プロ7名称
					'Prj7.LongName as Prj7Nm,' + 				        // 101:プロ7名称
					'KI.Prj8NCode,' +	                                // 102:プロ8内部コード
					'Prj8.GCode as Prj8GCode,' + 				        // 103:プロ8外部コード
//					'Prj8.SimpleName as Prj8Nm,' + 				        // 104:プロ8名称
					'Prj8.LongName as Prj8Nm,' + 				        // 104:プロ8名称
					'KI.Prj9NCode,' +	                                // 105:プロ9内部コード
					'Prj9.GCode as Prj9GCode,' + 				        // 106:プロ9外部コード
//					'Prj9.SimpleName as Prj9Nm,' + 				        // 107:プロ9名称
					'Prj9.LongName as Prj9Nm,' + 				        // 107:プロ9名称
					'KI.Prj10NCode,' +	                                // 108:プロ10内部コード
					'Prj10.GCode as Prj10GCode,' + 				        // 109:プロ10外部コード
//					'Prj10.SimpleName as Prj10Nm,' + 			        // 110:プロ10名称
					'Prj10.LongName as Prj10Nm,' + 			            // 110:プロ10名称
					'KI.Hoj1NCode,' +	                                // 111:汎用1内部部コード
					'Han1.GCode as Han1GCode,' + 				        // 112:汎用1外部コード
//					'Han1.SimpleName as Han1Nm,' + 				        // 113:汎用1名称
					'Han1.LongName as Han1Nm,' + 				        // 113:汎用1名称
					'KI.Hoj2NCode,' +	                                // 114:汎用2内部部コード
					'Han2.GCode as Han2GCode,' + 				        // 115:汎用2外部コード
//					'Han2.SimpleName as Han2Nm,' + 				        // 116:汎用2名称
					'Han2.LongName as Han2Nm,' + 				        // 116:汎用2名称
					'KI.Hoj3NCode,' +	                                // 117:汎用3内部部コード
					'Han3.GCode as Han3GCode,' + 				        // 118:汎用3外部コード
//					'Han3.SimpleName as Han3Nm,' + 				        // 119:汎用3名称
					'Han3.LongName as Han3Nm,' + 				        // 119:汎用3名称
					'KI.Hoj4NCode,' + 	                                // 120:汎用4内部部コード
					'Han4.GCode as Han4GCode,' + 				        // 121:汎用4外部コード
//					'Han4.SimpleName as Han4Nm,' + 				        // 122:汎用4名称
					'Han4.LongName as Han4Nm,' + 				        // 122:汎用4名称
					'KI.Hoj5NCode,' +	                                // 123:汎用5内部部コード
					'Han5.GCode as Han5GCode,' + 				        // 124:汎用5外部コード
//					'Han5.SimpleName as Han5Nm,' + 				        // 125:汎用5名称
					'Han5.LongName as Han5Nm,' + 				        // 125:汎用5名称
					'KP.PtnName, ' + 							        // 126:工種パターン名
					'KI.CostomerName ' +                                // 127:取引先名称(入力)
					',KI.PartPattern ' +                                // 128:税抜／税込  <TAX> ADD
//<#001> MOD Ed
				' FROM ' +
					'HojyoMA MA ' +
					//工事情報
					'left outer join KojiInfo KI on MA.MasterKbn = KI.MasterKbn and MA.NCode = KI.NCode ' +
					//完成振替部門
					'left outer join HojyoMA BMA on BMA.MasterKbn = 41 and KI.BmnNCode = BMA.NCode and BMA.SumKbn = 0 and BMA.RDelKbn = 0 ' +
					// 施主
					'left outer join MSOFU MS on KI.SesNCode = MS.NCode and MS.RDelKbn = 0 and MS.NouKbn = 4 ' +
					// 施工部門
					'left outer join HojyoMA BMASK on BMASK.MasterKbn = 41 and KI.SeiBmnNCode = BMASK.NCode and BMASK.SumKbn = 0 and BMASK.RDelKbn = 0 ' +
					//担当者外部コード
					'left outer join HAPSC HA on KI.PersonNCode = HA.NCode ' +
					//担当者名称
					'left outer join MOS_OFFICE_STAFF MOS on KI.PersonNCode = MOS.NCode and MOS.RDelKbn = 0 ' +
					//施工担当者外部コード
					'left outer join HAPSC HASK on KI.SeiTanNCode = HASK.NCode ' +
					//施工担当者名称
					'left outer join MOS_OFFICE_STAFF MOSSK on KI.SeiTanNCode = MOSSK.NCode and MOSSK.RDelKbn = 0 ' +
					//受注先
					'left outer join MTOKUI MT on KI.CostomerNCode = MT.NCode and MT.HojyoKbn1 = 1 and MT.SumKbn = 0 and MT.RDelKbn = 0 ' +
					//付箋
					'left outer join MFusenInfo MF on MF.MasterKbn = :pMastKbn and MA.NCode = MF.NCode ' +
					//工種パターン
					'left outer join KousyuPtnMA KP on KI.PtnNCode = KP.NCode ' +
					//売上計上科目名称
					'left outer join KmkMA KM on  KI.SalesKmkCd = KM.NCode and KM.MasterKbn = 1 and KM.SumKbn = 0 AND KM.RDelKbn = 0 ' +
					// セグメント１～１０
					'left outer join HojyoMA Seg1 on Seg1.MasterKbn = 101 and KI.Seg1NCode = Seg1.NCode and Seg1.SumKbn = 0 and Seg1.RDelKbn = 0 ' +
					'left outer join HojyoMA Seg2 on Seg2.MasterKbn = 102 and KI.Seg2NCode = Seg2.NCode and Seg2.SumKbn = 0 and Seg2.RDelKbn = 0 ' +
					'left outer join HojyoMA Seg3 on Seg3.MasterKbn = 103 and KI.Seg3NCode = Seg3.NCode and Seg3.SumKbn = 0 and Seg3.RDelKbn = 0 ' +
					'left outer join HojyoMA Seg4 on Seg4.MasterKbn = 104 and KI.Seg4NCode = Seg4.NCode and Seg4.SumKbn = 0 and Seg4.RDelKbn = 0 ' +
					'left outer join HojyoMA Seg5 on Seg5.MasterKbn = 105 and KI.Seg5NCode = Seg5.NCode and Seg5.SumKbn = 0 and Seg5.RDelKbn = 0 ' +
					'left outer join HojyoMA Seg6 on Seg6.MasterKbn = 106 and KI.Seg6NCode = Seg6.NCode and Seg6.SumKbn = 0 and Seg6.RDelKbn = 0 ' +
					'left outer join HojyoMA Seg7 on Seg7.MasterKbn = 107 and KI.Seg7NCode = Seg7.NCode and Seg7.SumKbn = 0 and Seg7.RDelKbn = 0 ' +
					'left outer join HojyoMA Seg8 on Seg8.MasterKbn = 108 and KI.Seg8NCode = Seg8.NCode and Seg8.SumKbn = 0 and Seg8.RDelKbn = 0 ' +
					'left outer join HojyoMA Seg9 on Seg9.MasterKbn = 109 and KI.Seg9NCode = Seg9.NCode and Seg9.SumKbn = 0 and Seg9.RDelKbn = 0 ' +
					'left outer join HojyoMA Seg10 on Seg10.MasterKbn = 110 and KI.Seg10NCode = Seg10.NCode and Seg10.SumKbn = 0 and Seg10.RDelKbn = 0 ' +
					// プロジェクト
					'left outer join HojyoMA Prj1 on Prj1.MasterKbn = 201 and KI.Prj1NCode = Prj1.NCode and Prj1.SumKbn = 0 and Prj1.RDelKbn = 0 ' +
					'left outer join HojyoMA Prj2 on Prj2.MasterKbn = 202 and KI.Prj2NCode = Prj2.NCode and Prj2.SumKbn = 0 and Prj2.RDelKbn = 0 ' +
					'left outer join HojyoMA Prj3 on Prj3.MasterKbn = 203 and KI.Prj3NCode = Prj3.NCode and Prj3.SumKbn = 0 and Prj3.RDelKbn = 0 ' +
					'left outer join HojyoMA Prj4 on Prj4.MasterKbn = 204 and KI.Prj4NCode = Prj4.NCode and Prj4.SumKbn = 0 and Prj4.RDelKbn = 0 ' +
					'left outer join HojyoMA Prj5 on Prj5.MasterKbn = 205 and KI.Prj5NCode = Prj5.NCode and Prj5.SumKbn = 0 and Prj5.RDelKbn = 0 ' +
					'left outer join HojyoMA Prj6 on Prj6.MasterKbn = 206 and KI.Prj6NCode = Prj6.NCode and Prj6.SumKbn = 0 and Prj6.RDelKbn = 0 ' +
					'left outer join HojyoMA Prj7 on Prj7.MasterKbn = 207 and KI.Prj7NCode = Prj7.NCode and Prj7.SumKbn = 0 and Prj7.RDelKbn = 0 ' +
					'left outer join HojyoMA Prj8 on Prj8.MasterKbn = 208 and KI.Prj8NCode = Prj8.NCode and Prj8.SumKbn = 0 and Prj8.RDelKbn = 0 ' +
					'left outer join HojyoMA Prj9 on Prj9.MasterKbn = 209 and KI.Prj9NCode = Prj9.NCode and Prj9.SumKbn = 0 and Prj9.RDelKbn = 0 ' +
					'left outer join HojyoMA Prj10 on Prj10.MasterKbn = 210 and KI.Prj10NCode = Prj10.NCode and Prj10.SumKbn = 0 and Prj10.RDelKbn = 0 ' +
					// 汎用補助
					'left outer join HojyoMA Han1 on Han1.MasterKbn = 31 and KI.Hoj1NCode = Han1.NCode and Han1.SumKbn = 0 and Han1.RDelKbn = 0 ' +
					'left outer join HojyoMA Han2 on Han2.MasterKbn = 32 and KI.Hoj2NCode = Han2.NCode and Han2.SumKbn = 0 and Han2.RDelKbn = 0 ' +
					'left outer join HojyoMA Han3 on Han3.MasterKbn = 33 and KI.Hoj3NCode = Han3.NCode and Han3.SumKbn = 0 and Han3.RDelKbn = 0 ' +
					'left outer join HojyoMA Han4 on Han4.MasterKbn = 34 and KI.Hoj4NCode = Han4.NCode and Han4.SumKbn = 0 and Han4.RDelKbn = 0 ' +
					'left outer join HojyoMA Han5 on Han5.MasterKbn = 35 and KI.Hoj5NCode = Han5.NCode and Han5.SumKbn = 0 and Han5.RDelKbn = 0 ' +
				' WHERE ' +
					'MA.RDelKbn = 0 AND  ' +
					'MA.MasterKbn = :pMastKbn AND ' +
					'MA.SumKbn = :pSumKbn ';

	//詳細：工事情報インデックス
	INDEX_GCODE						= 0;							// 工事外部コード
	INDEX_NCODE						= 1;							// 工事内部コード
	INDEX_RENSO						= 2;							// 連想
	INDEX_LONGNAME					= 3;							// 正式名称
	INDEX_SIMPLENAME				= 4;							// 簡略名称
	INDEX_UPDATETM					= 5;							// 修正日時
	INDEX_BUNCODE					= 6;							// 入力区分
	INDEX_FINISHDATE				= 7;							// 工事完成年月日
	INDEX_MOVEKBN					= 8;							// 翌期移送区分
	INDEX_ROOTKBN					= 9;							// 名寄区分
	INDEX_FUSENKBN					= 10;							// 付箋区分
	INDEX_FUSENCMNT					= 11;							// 付箋コメント
	INDEX_ZIPCODE1 					= 12;							// 郵便番号(基番)
	INDEX_ZIPCODE2 					= 13;							// 郵便番号(枝番)
	INDEX_ADDRESS1 					= 14;							// 住所１
	INDEX_ADDRESS2					= 15;							// 住所２
	INDEX_TELNO						= 16;							// 電話番号
	INDEX_PERSONNCODE				= 17;							// 担当者内部コード
	INDEX_PERSONGCODE				= 18;							// 担当者外部コード
	INDEX_PERSONNAME				= 19;							// 担当者名称
	INDEX_COSTOMERNCODE				= 20;							// 取引先内部コード
	INDEX_COSTOMERGCODE				= 21;							// 取引先外部コード
	INDEX_COSTOMERCODENAME			= 22;							// 取引先名称
	INDEX_BMNNCODE					= 23;							// 部門内部コード
	INDEX_BMNGCODE					= 24;							// 部門外部コード
	INDEX_BMNNAME					= 25;							// 部門簡略名称
	INDEX_SALESBASE					= 26;							// 計上基準
	INDEX_HAIFUKBN					= 27;							// 配賦区分
	INDEX_SCHEDATEST				= 28;							// 実績工期開始
	INDEX_SCHEDATEEN				= 29;							// 実績工期開始
	INDEX_YOTEIDATEST				= 30;							// 予定工期開始
	INDEX_YOTEIDATEEN				= 31;							// 予定工期終了
	INDEX_REMARKS					= 32;							// 備考
	INDEX_GAIYOU					= 33;							// 概要
	INDEX_FAXNO						= 34;							// FAX番号
	INDEX_UKEOIKBN					= 35;							// 請負区分
	INDEX_SESNCODE					= 36;							// 施主内部コード
	INDEX_SESGCODE					= 37;							// 施主外部コード
	INDEX_SESNAME					= 38;							// 施主簡略名称
	INDEX_SEIBMNNCODE				= 39;							// 施工部門内部コード
	INDEX_SEIBMNGCODE				= 40;							// 施工部門外部コード
	INDEX_SEIBMNNAME				= 41;							// 施工部門簡略名称
	INDEX_SEITANNCODE				= 42;							// 施工担当内部コード
	INDEX_SEITANGCODE				= 43;							// 施工担当者外部コード
	INDEX_SEITANNAME				= 44; 							// 施工担当者名称
	INDEX_DETAILKBN1				= 45;							// 完成振替パターン
	INDEX_DETAILKBN2				= 46;							// 完成売上高相手勘定区分
	INDEX_SALESKMKCD				= 47;							// 売上計上科目コード
	INDEX_SALESKMKCDNAME			= 48;							// 売上計上科目名称
	INDEX_PARTKBN					= 49;							// 工種管理区分
	INDEX_PTNNO						= 50;							// 工種パターンNO
	INDEX_SEG1NCODE					= 51;							// セグ1内部コード
	INDEX_SEG1GCODE					= 52;							// セグ1外部コード
	INDEX_SEG1NM					= 53;							// セグ1名称
	INDEX_SEG2NCODE					= 54;							// セグ2内部コード
	INDEX_SEG2GCODE					= 55;							// セグ2外部コード
	INDEX_SEG2NM					= 56;							// セグ2名称
	INDEX_SEG3NCODE					= 57;							// セグ3内部コード
	INDEX_SEG3GCODE					= 58;							// セグ3外部コード
	INDEX_SEG3NM					= 59;							// セグ3名称
	INDEX_SEG4NCODE					= 60;							// セグ4内部コード
	INDEX_SEG4GCODE					= 61;							// セグ4外部コード
	INDEX_SEG4NM					= 62;							// セグ4名称
	INDEX_SEG5NCODE					= 63;							// セグ5内部コード
	INDEX_SEG5GCODE					= 64;							// セグ5外部コード
	INDEX_SEG5NM					= 65;							// セグ5名称
	INDEX_SEG6NCODE					= 66;							// セグ6内部コード
	INDEX_SEG6GCODE					= 67;							// セグ6外部コード
	INDEX_SEG6NM					= 68; 							// セグ6名称
	INDEX_SEG7NCODE					= 69;							// セグ7内部コード
	INDEX_SEG7GCODE					= 70;							// セグ7外部コード
	INDEX_SEG7NM					= 71;							// セグ7名称
	INDEX_SEG8NCODE					= 72;							// セグ8内部コード
	INDEX_SEG8GCODE					= 73;							// セグ8外部コード
	INDEX_SEG8NM					= 74;							// セグ8名称
	INDEX_SEG9NCODE					= 75;							// セグ9内部コード
	INDEX_SEG9GCODE					= 76;							// セグ9外部コード
	INDEX_SEG9NM					= 77;							// セグ9名称
	INDEX_SEG10NCODE				= 78;							// セグ10内部コード
	INDEX_SEG10CODE					= 79;							// セグ10外部コード
	INDEX_SEG10NM					= 80;							// セグ10名称
	INDEX_PRJ1NCODE					= 81;							// プロ1内部コード
	INDEX_PRJ1GCODE					= 82;							// プロ1外部コード
	INDEX_PRJ1NM					= 83;							// プロ1名称
	INDEX_PRJ2NCODE					= 84;							// プロ2内部コード
	INDEX_PRJ2GCODE					= 85;							// プロ2外部コード
	INDEX_PRJ2NM					= 86;							// プロ2名称
	INDEX_PRJ3NCODE					= 87;							// プロ3内部コード
	INDEX_PRJ3GCODE					= 88;							// プロ3外部コード
	INDEX_PRJ3NM					= 89;							// プロ3名称
	INDEX_PRJ4NCODE					= 90;							// プロ4内部コード
	INDEX_PRJ4GCODE					= 91;							// プロ4外部コード
	INDEX_PRJ4NM					= 92;							// プロ4名称
	INDEX_PRJ5NCODE					= 93;							// プロ5内部コード
	INDEX_PRJ5GCODE					= 94;							// プロ5外部コード
	INDEX_PRJ5NM					= 95;							// プロ5名称
	INDEX_PRJ6NCODE					= 96;							// プロ6内部コード
	INDEX_PRJ6GCODE					= 97;							// プロ6外部コード
	INDEX_PRJ6NM					= 98;							// プロ6名称
	INDEX_PRJ7NCODE					= 99;							// プロ7内部コード
	INDEX_PRJ7GCODE					= 100;							// プロ7外部コード
	INDEX_PRJ7NM					= 101;							// プロ7名称
	INDEX_PRJ8NCODE					= 102;							// プロ8内部コード
	INDEX_PRJ8GCODE					= 103;							// プロ8外部コード
	INDEX_PRJ8NM					= 104;							// プロ8名称
	INDEX_PRJ9NCODE					= 105;							// プロ9内部コード
	INDEX_PRJ9GCODE					= 106;							// プロ9外部コード
	INDEX_PRJ9NM					= 107;							// プロ9名称
	INDEX_PRJ10NCODE				= 108;							// プロ10内部コード
	INDEX_PRJ10GCODE				= 109;							// プロ10外部コード
	INDEX_PRJ10NM					= 110;							// プロ10名称
	INDEX_HAN1NCODE					= 111;							// 汎用1内部部コード
	INDEX_HAN1GCODE					= 112;							// 汎用1外部コード
	INDEX_HAN1NM					= 113;							// 汎用1名称
	INDEX_HAN2NCODE					= 114;							// 汎用2内部部コード
	INDEX_HAN2GCODE					= 115;							// 汎用2外部コード
	INDEX_HAN2NM					= 116;							// 汎用2名称
	INDEX_HAN3NCODE					= 117;							// 汎用3内部部コード
	INDEX_HAN3GCODE					= 118;							// 汎用3外部コード
	INDEX_HAN3NM					= 119;							// 汎用3名称
	INDEX_HAN4NCODE					= 120;							// 汎用4内部部コード
	INDEX_HAN4GCODE					= 121;							// 汎用4外部コード
	INDEX_HAN4NM					= 122;							// 汎用4名称
	INDEX_HAN5NCODE					= 123;							// 汎用5内部部コード
	INDEX_HAN5GCODE					= 124;							// 汎用5外部コード
	INDEX_HAN5NM					= 125;							// 汎用5名称
	INDEX_PTNNAME 					= 126;							// 工種パターン名
	INDEX_COSTOMERNAME 				= 127;							// 取引先名称(入力)
	INDEX_PARTPATTERN 				= 128;							// 税込／税抜  <TAX> ADD  	

	//詳細型：契約情報データ取得クエリ
    SHOSAI_K_SQL = 'SELECT ' +
					'KI.MasterKbn,' +            						//0:マスタ区分
					'KI.InfoKbn,' +              						//1:情報区分
					'KI.NCode,' +                						//2:工事内部コード
					'KI.KsyNCode,' +             						//3:工種内部コード
					'KI.ContDate,' +             						//4:契約年月日
					'KI.ContNo,' +               						//5:契約NO
					'KI.ContMoney,' +            						//6:契約金額
					'KI.sales_tax,' +            						//7:消費税額
					'KI.tax_rate,' +             						//8:消費税率
					'KI.KojiInfo2NCode,' +     							//9:契約情報内部コード
					'KI.DspOrder,' +             						//10:表示順序
					'KI.CsNCode,' +										//11:取引先内部コード
					'KI.TanNCode,' +									//12:担当者内部コード
					'KI.OrgNo,' +										//13:原票NO
					'KI.InpType, ' +									//14:仕訳入力形式
					'MT.GCode,' +										//15:取引先外部コード
//<#001> MOD St
//					'MT.Nmk ' +											//16:取引先名称
					'MT.Nm ' +											//16:取引先名称
//<#001> MOD Ed
				'FROM ' +
					'KojiInfo2 KI ' +
					'left outer join MTOKUI MT on KI.CsNCode = MT.NCode and MT.HojyoKbn1 = 1 and MT.SumKbn = 0 and MT.RDelKbn = 0 ' +
				'WHERE ' +
					'KI.NCode = :Code ';
//<TAX> MOD St
    SHOSAI_K_SQL_ORDERBY =
        'Order by KI.ContDate ASC, KI.ContNo ASC,' +
        'KI.ContMoney ASC, KI.tax_rate ASC, KI.sales_tax ASC,KI.InfoKbn ASC';
{
				'Order by KI.ContDate ASC, KI.ContNo ASC,' +
					'KI.ContMoney ASC, KI.tax_rate ASC, KI.sales_tax ASC,KI.InfoKbn ASC';
}
//<TAX> MOD Ed

 	//詳細：契約情報インデックス
 	K_INDEX_MASTERKBN				= 0;								// マスタ区分
 	K_INDEX_INFOKBN					= 1;								// 情報区分
 	K_INDEX_NCODE					= 2;								// 工事内部コード
 	K_INDEX_KSYNCODE				= 3;								// 工種内部コード
	K_INDEX_CONTDATE				= 4;								// 契約年月日
 	K_INDEX_CONTNO					= 5;								// 契約NO
 	K_INDEX_CONTMONEY				= 6;								// 契約金額
 	K_INDEX_SALES_TAX				= 7;								// 消費税額
 	K_INDEX_TAX_RATE				= 8;								// 消費税率
 	K_INDEX_KOJIINFO2NCODE			= 9;								// 契約情報内部コード
 	K_INDEX_DSPORDER				= 10;								// 表示順序
 	K_INDEX_CSNCODE					= 11;								// 取引先内部コード
 	K_INDEX_TANNCODE				= 12;								// 担当者内部コード
 	K_INDEX_ORGNO					= 13;								// 原票NO
 	K_INDEX_INPTYPE					= 14;								// 仕訳入力形式
 	K_INDEX_COSTOMERGCODE			= 15;								// 取引先外部コード
	K_INDEX_COSTOMERNMK				= 16;								// 取引先名称


	// 契約・入金情報、契約・入金情報詳細
	KEIYAKU_SQL  = 'SELECT ' +
						'MA.GCode,' + 									//0:工事外部コード
						'MA.LongName,' + 								//1:正式名称
						'MA.SimpleName,' +								//2:簡略名称
						'MA.NCode,' +									//3:内部コード
						'KI.ContDate,' +								//4:契約年月日
						'KI.ContNo,' +									//5:契約NO
						'KI.ContMoney,' +								//6:契約金額
						'KI.sales_tax,' +								//7:消費税額
						'KI.tax_rate,' +								//8:消費税率
						'KI.DspOrder,' +								//9:表示順序
						'KI.CsNCode,' +									//10:取引先内部コード
						'MT.GCode,' +									//11:取引先外部コード
//<#001> MOD St
//						'MT.Nmk ' +										//12:取引先名称
						'MT.Nm ' +										//12:取引先名称
//<#001> MOD Ed
//<TAX> ADD St
                        ',Info.PartPattern ' +                          //13:税込／税抜
                        ',Info.YoteiDateEN ' +                          //14:予定工期終了日
//<TAX> ADD Ed
					'FROM ' + 
						' KojiInfo2 KI ' + 
						'left outer join Hojyoma MA on KI.MasterKbn = MA.MasterKbn and KI.NCode = MA.NCode and MA.SumKbn = :parSUM and MA.RDelKbn = 0 ' +
						'left outer join MTOKUI MT on KI.CsNCode = MT.NCode and MT.HojyoKbn1 = 1 and MT.SumKbn = 0 and MT.RDelKbn = 0 ' +
//<TAX> ADD St
						'left outer join KojiInfo Info on KI.MasterKbn = Info.MasterKbn and KI.NCode = Info.NCode  ' +
//<TAX> ADD Ed
					'WHERE ' + 
						'KI.MasterKbn = :parMasterKbn and ' +
						'KI.InfoKbn = :parInfoKbn and ' +
						'MA.SumKbn = :parSUM ';

 	// 契約・入金情報、契約・入金情報詳細インデックス
 	KN_INDEX_GCODE					= 0;								// 工事外部コード
 	KN_INDEX_LONGNAME				= 1;								// 正式名称
 	KN_INDEX_SIMPLENAME				= 2;								// 簡略名称
 	KN_INDEX_NCODE					= 3;								// 内部コード
 	KN_INDEX_CONTDATE				= 4;								// 契約年月日
 	KN_INDEX_CONTNO					= 5;								// 契約NO
 	KN_INDEX_CONTMONEY				= 6;								// 契約金額
 	KN_INDEX_SALES_TAX				= 7;								// 消費税額
 	KN_INDEX_TAX_RATE				= 8;								// 消費税率
 	KN_INDEX_DSPORDER				= 9;								// 表示順序
 	KN_INDEX_CSNCODE				= 10;								// 取引先内部コード
 	KN_INDEX_COSTOMERGCODE			= 11;								// 取引先外部コード
 	KN_INDEX_COSTOMERNMK			= 12;								// 取引先名称
//<TAX> ADD St
 	KN_INDEX_PARTPATTERN			= 13;								// 税込／税抜
 	KN_INDEX_YOTEIDATEEN			= 14;								// 予定工期終了日   
//<TAX> ADD Ed
// <#002> ADD start
// 加算登録リスト
	//データ取得クエリ
	KASAN_SQL = 'SELECT ' +
					'dstMA.GCode, ' +										// 0:加算先外部ｺｰﾄﾞ
					'dstMA.SimpleName, ' +									// 1:加算先簡略名称
					'srcMA.GCode, ' +										// 2:加算元外部ｺｰﾄﾞ
					'srcMA.SimpleName ' +									// 3:加算元簡略名称
				'FROM ' + 
					'HojyoMA dstMA ' +
					'LEFT OUTER JOIN HojyoTree ' +
					'ON dstMA.MasterKbn = HojyoTree.MasterKbn ' +
					'AND dstMA.NCode = HojyoTree.SumNCode ' +
					'LEFT OUTER JOIN HojyoMA srcMA ' +
					'ON HojyoTree.MasterKbn = srcMA.MasterKbn ' +
					'AND HojyoTree.BasedNCode = srcMA.NCode ' +
					'AND srcMA.RDelKbn = 0 ' +
				'WHERE ' +
					'dstMA.MasterKbn = :pMKBN and ' +
					'dstMA.SumKbn = 1 and ' +
					'dstMA.RDelKbn = 0 ' +
				'ORDER BY dstMA.GCode, HojyoTree.EntNo ';

	//インデックス
	KASAN_INDEX_GCODE_DST			= 0;							// 加算先外部コード
	KASAN_INDEX_SIMPLENAME_DST		= 1;							// 加算先簡略名称
	KASAN_INDEX_GCODE_SRC			= 2;							// 加算元外部コード
	KASAN_INDEX_SIMPLENAME_SRC		= 3;							// 加算元簡略名称
// <#002> ADD end

{$ENDIF}
//	End of File
