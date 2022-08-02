//************************************************************************
//		System		:MJSLINK給与大将
//		Program		:人事情報登録リスト
//		ProgramID	:HAP000051PPrn
//		Name		:H.Itahana(Buntechno)
//		Create		:2005/07/22
//
//		Comment		:XXXX注意事項等XXXXXXXXXXXXX
//					:XXXXXXXXXXXXXXXXXXXXXXXXX
//		History		:2005/10/31 H.Itahana(Buntechno)
//					:・Application対応
//					:2005/12/09 T.Abe(Buntechno)
//					:・戸籍名出力ビュー対応
//					:2005/12/27 H.Itahana(Buntechno)
//					:・本日変更社員印刷対応　<2005-12-27>
//					:2006/04/03 T.ABE (BUNTECHNO)
//					:・フリーコード編集対応　<060403>
//					:2006/04/05 T.ABE (BUNTECHNO)
//					:・カナ順出力時の戸籍カナ対応 <060405>
//					:2006/08/25 H.Takaishi (BUNTECHNO)
//					:・部門権限対応			<2006-08-25>
//					:2006/09/07 H.Takaishi (BUNTECHNO)
//					:・印刷データなしの時[エラー]→[警告]
//					:2007/05/02 H.Takaishi (BUNTECHNO)
//					:・部門権限対応（未所属社員は常に出力対象）	<2007-05-02>
//					:2008/02/28 H.Takaishi (TAKUMI)
//					:・現在出向情報複数化対応					<2008-02-28>
//					:2008/06/09 H.Takaishi (TakumiCo.)
//					:・印刷履歴対応（MjsPreview経由で印刷処理実行）	<2008-06-09>
//					:2009/03/23 R.Kobayashi (TakumiCo.)
//					:・印刷暦区分をHAPM3.CalenderKbnに変更			<2009-06-09>
//					:2010/05/19 R.Kobayashi (TakumiCo.)
//					:・メールアドレス桁数変更対応					<2010-05-19>
//					:2010/05/20 R.Kobayashi (TakumiCo.)
//					:・前職２‐前職役職の出力内容を修正				<2010-05-20>
//					:2011 /  2 /  8	( Tue )
//					:	休職事由 桁数拡張対応 20 → 80 ( フォームのみ )
//					:2011 /  4 / 14	( Thu )
//					:	雇用区分 ⇔ 職種 名称フィールド 入れ替え ( フォームのみ )
//					:2011/04/15	H.Yamashiro
//					:・印字暦区分 修正							<20110415>
//					:・郵便番号 枝番「0000」 対応				<20110415_2>
//					:・社員区分「会社規定」 表示対応			<20110415_3>
//					:2011/04/18	H.Yamashiro
//					:・【基本情報】携帯電話（社内）、【現発令情報】等級号俸 追加
//					:2011/06/20	ER.Kobayashi(TakumiCo.)
//					:・兼務拡張対応								<2011-06-20>
//					:2013/07/18	E.Inukai
//					:・連絡先・保証人欄に項目を追加				<130718>
//					:2013/12/13	E.Inukai
//					:・学歴マスタ対応							<131213>
//					:2014/01/23	E.Inukai
//					:・滞留年数の求め方を統一					<140123>
//					:2014/07/22	E.Inukai
//					:・グループ入社日追加						<140722>
//					:2020/01/30	T.Nakamura(NTC)
//					:・Delphi10-コンパイル対応	<D10-C>
//					:2020/05/01	Y.Iwakawa
//					:・基準日対応								<RefDay>
//					:2020/05/19	Y.Iwakawa
//					:・基準日対応 - 速度改善					<RefDay-faster>
//************************************************************************
unit HAP000051PPrnU;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  Db, dxmdaset, ppDB, ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport,FireDAC.Comp.Client,
  MjsDBModuleU,MJSQuery,HapPrnDlgSpU,MjsPrnSupportU, ppModule,
  HapMsgu,MjsPreviewIFU,MjsPrnDlgU,MjsDateCtrl, {<D10-C>daDatMod,} MjsStrCtrl, ppParameter,
  ppDesignLayer;

const
{$I HapPrnConst.inc}

type
{$I HapPrnType.inc}
{$i ActionInterface.inc}

  THAPM3 = record									// 操作情報
	CalendarKbn		: Integer;						// 入力暦区分
	EmpAttribute	: Integer;						// 社員コード属性
	EmpDigit		: Integer;						// 社員コード桁数
	DeptAttribute	: Integer;						// 所属コード属性
	DeptDigit		: Integer;						// 所属コード桁数
  end;

  THAP000051PPrnF = class(TForm)
	ppHeaderBand1: TppHeaderBand;
	ppDetailBand1: TppDetailBand;
	ppFooterBand1: TppFooterBand;
	repJinjiList: TppReport;
	ppJinjiList: TppDBPipeline;
	dsJinjiList: TDataSource;
	ppOutputDate: TppSystemVariable;
	ppCorpCode: TppLabel;
	ppCorpName: TppLabel;
	ppPageNo: TppSystemVariable;
	ppAccOffice: TppLabel;
	ppLabel4: TppLabel;
	ppLine2: TppLine;
	mdjinjiList: TdxMemData;
	mdjinjiListEmpNo: TStringField;
	mdjinjiListDeptNo: TStringField;
	mdjinjiListDeptName: TStringField;
	mdjinjiListEmpKana: TStringField;
	mdjinjiListEmpName: TStringField;
	mdjinjiListPhone: TStringField;
	mdjinjiListYuubinNo: TStringField;
	mdjinjiListAddress1: TStringField;
	mdjinjiListAddress2: TStringField;
	mdjinjiListRestJiyuu: TStringField;
	mdjinjiListRetireJiyuu: TStringField;
	ppTName: TppLabel;
	ppTNo: TppLabel;
	ppTFurigana: TppLabel;
	ppTPhone: TppLabel;
	ppTAddress1: TppLabel;
	ppTYuubinNo: TppLabel;
	ppTAddress2: TppLabel;
	ppTRestJiyuu: TppLabel;
	ppTRetireJiyuu: TppLabel;
	ppTDeptName: TppLabel;
	ppLine1: TppLine;
	ppLine3: TppLine;
	ppLabel253: TppLabel;
	ppLabel255: TppLabel;
	ppLabel274: TppLabel;
	ppLabel270: TppLabel;
	ppLabel275: TppLabel;
	ppLabel309: TppLabel;
	ppLabel310: TppLabel;
	ppLabel312: TppLabel;
	ppLabel313: TppLabel;
	ppLabel314: TppLabel;
	ppDBText1: TppDBText;
	ppDBText2: TppDBText;
	ppDBText3: TppDBText;
	ppDBText4: TppDBText;
	ppDBText5: TppDBText;
	ppDBText6: TppDBText;
	ppDBText7: TppDBText;
	ppDBText8: TppDBText;
	ppDBText9: TppDBText;
	ppDBText10: TppDBText;
	ppDBText11: TppDBText;
	ppTSeibetsu: TppLabel;
	ppLabel116: TppLabel;
	ppTBirth: TppLabel;
	ppLabel118: TppLabel;
	ppDBText12: TppDBText;
	ppTAddFuri1: TppLabel;
	ppTAddFuri2: TppLabel;
	ppLabel121: TppLabel;
	ppLabel122: TppLabel;
	ppDBText13: TppDBText;
	ppDBText14: TppDBText;
	ppDBText15: TppDBText;
	ppDBText16: TppDBText;
	ppTKetsueki: TppLabel;
	ppLabel124: TppLabel;
	ppLNenrei: TppLabel;
	ppTNyuusya: TppLabel;
	ppLabel128: TppLabel;
	ppDBText18: TppDBText;
	ppTKoyouStart: TppLabel;
	ppLabel131: TppLabel;
	ppDBText20: TppDBText;
	ppLabel133: TppLabel;
	ppLabel11: TppLabel;
	ppTEmpRomaji: TppLabel;
	ppTJyuKbn: TppLabel;
	ppTNyuukyo: TppLabel;
	ppTPayKbn: TppLabel;
	ppTEmpKbn: TppLabel;
	ppTPost: TppLabel;
	ppLabel23: TppLabel;
	ppTZaiKbn: TppLabel;
	ppTQyoCalc: TppLabel;
	ppTShoCalc: TppLabel;
	ppTNenCalc: TppLabel;
	ppTNenKbn: TppLabel;
	ppLabel92: TppLabel;
	ppLabel93: TppLabel;
	ppLabel94: TppLabel;
	ppLabel95: TppLabel;
	ppLabel96: TppLabel;
	ppLabel100: TppLabel;
	ppLabel101: TppLabel;
	ppLabel102: TppLabel;
	ppLabel103: TppLabel;
	ppLabel104: TppLabel;
	ppLabel257: TppLabel;
	ppTKoyou: TppLabel;
	ppTJob: TppLabel;
	ppTWork: TppLabel;
	ppLabel363: TppLabel;
	ppLabel366: TppLabel;
	ppLabel367: TppLabel;
	ppTAbility: TppLabel;
	ppTRank: TppLabel;
	ppLabel373: TppLabel;
	ppLabel376: TppLabel;
	ppLabel381: TppLabel;
	ppTEmpRomaji2: TppLabel;
	ppLabel377: TppLabel;
	ppTFAX: TppLabel;
	ppTEmail: TppLabel;
	ppLabel384: TppLabel;
	ppLabel385: TppLabel;
	ppTKeitai: TppLabel;
	ppLabel387: TppLabel;
	ppLabel34: TppLabel;
	ppLFuyouCalcC: TppLabel;
	ppLabel12: TppLabel;
	ppLabel69: TppLabel;
	ppTSyoukai: TppLabel;
	ppTSyoukaiName: TppLabel;
	ppTSyoukaiZoku: TppLabel;
	ppTHomeCity: TppLabel;
	ppTNationality: TppLabel;
	ppTShumi: TppLabel;
	ppTTokugi: TppLabel;
	ppLabel78: TppLabel;
	ppTGakureki: TppLabel;
	ppTSotuTai: TppLabel;
	ppTSotugiyouNen: TppLabel;
	ppTGakubu: TppLabel;
	ppLabel276: TppLabel;
	ppLabel277: TppLabel;
	ppLabel278: TppLabel;
	ppLabel279: TppLabel;
	ppLabel280: TppLabel;
	ppLabel281: TppLabel;
	ppLabel282: TppLabel;
	ppTKumiaiS: TppLabel;
	ppLabel284: TppLabel;
	ppLabel285: TppLabel;
	ppLabel287: TppLabel;
	ppLabel440: TppLabel;
	ppLabel441: TppLabel;
	ppTKumiaiE: TppLabel;
	ppTGatukaName: TppLabel;
	ppTGatukouName: TppLabel;
	ppLabel136: TppLabel;
	ppTLanguage: TppLabel;
	ppLabel138: TppLabel;
	ppLabel139: TppLabel;
	ppTGakubuKubun: TppLabel;
	ppTKumiai: TppLabel;
	ppLabel147: TppLabel;
	ppLabel148: TppLabel;
	mdjinjiListAddress1Kana: TStringField;
	mdjinjiListAddress2Kana: TStringField;
	mdjinjiListBirth: TStringField;
	mdjinjiListSeibetsu: TStringField;
	mdjinjiListNenrei: TStringField;
	ppDBText40: TppDBText;
	mdjinjiListKoyouStart: TStringField;
	mdjinjiListKoyouEnd: TStringField;
	ppLNenreiDate: TppLabel;
	mdjinjiListNyuusha: TStringField;
	ppDBText17: TppDBText;
	ppLEmpRomaji: TppLabel;
	ppLEmpRomaji2: TppLabel;
	ppLHouse: TppLabel;
	ppLMoveinDate: TppLabel;
	ppLPhone2: TppLabel;
	ppLEMail: TppLabel;
	ppLFax: TppLabel;
	ppLZaishoku: TppLabel;
	ppLShiharai: TppLabel;
	ppLQyoKbn: TppLabel;
	ppLShoKbn: TppLabel;
	ppLNenKbn: TppLabel;
	ppLTeiNenCalc: TppLabel;
	ppLEmpKubun: TppLabel;
	ppLJobName: TppLabel;
	ppLWorkClass: TppLabel;
	ppLPostNo: TppLabel;
	ppLAbility: TppLabel;
	ppLRank: TppLabel;
	ppLSyoukai: TppLabel;
	ppLSyoukaiName: TppLabel;
	ppLSyoukaiZoku: TppLabel;
	ppLHomeCity: TppLabel;
	ppLNationality: TppLabel;
	ppLShumi: TppLabel;
	ppLShumi2: TppLabel;
	ppLTokugi: TppLabel;
	ppLTokugi2: TppLabel;
	ppLLanguage: TppLabel;
	ppLGakureki: TppLabel;
	ppLSotuTai: TppLabel;
	ppLSotugiyouNen: TppLabel;
	ppLGakubu: TppLabel;
	ppLGatukouName: TppLabel;
	ppLGakubuKubun: TppLabel;
	ppLGatukaName: TppLabel;
	ppLKumiai: TppLabel;
	ppLKumiaiDate: TppLabel;
	ppLKumiaiDate2: TppLabel;
	ppLabel370: TppLabel;
	ppLabel371: TppLabel;
	ppLabel33: TppLabel;
	ppLabel35: TppLabel;
	ppLabel36: TppLabel;
	ppLabel32: TppLabel;
	ppTKubunYobi5: TppLabel;
	ppLabel39: TppLabel;
	ppLabel40: TppLabel;
	ppLabel41: TppLabel;
	ppLabel42: TppLabel;
	ppLabel43: TppLabel;
	ppLabel44: TppLabel;
	ppLabel45: TppLabel;
	ppTBunrui1: TppLabel;
	ppTBunrui2: TppLabel;
	ppTBunrui3: TppLabel;
	ppTKubunYobi1: TppLabel;
	ppTKubunYobi2: TppLabel;
	ppTKubunYobi3: TppLabel;
	ppTKubunYobi4: TppLabel;
	ppLabel108: TppLabel;
	ppLabel109: TppLabel;
	ppLKoron02: TppLabel;
	ppLKoron04: TppLabel;
	ppLKoron05: TppLabel;
	ppLKoron06: TppLabel;
	ppLKoron07: TppLabel;
	ppLKoron08: TppLabel;
	ppLKoron03: TppLabel;
	ppLKoron01: TppLabel;
	ppTName1: TppLabel;
	ppLItemName02: TppLabel;
	ppTYuubinNo1: TppLabel;
	ppTAddress11: TppLabel;
	ppLItemName05: TppLabel;
	ppTAddress12: TppLabel;
	ppLItemName07: TppLabel;
	ppTPhone1: TppLabel;
	ppLabel56: TppLabel;
	ppLabel57: TppLabel;
	ppLabel58: TppLabel;
	ppLabel60: TppLabel;
	ppTTanshinKbn: TppLabel;
	ppTYuubinNo2: TppLabel;
	ppTAddress21: TppLabel;
	ppTAddress22: TppLabel;
	ppTPhone2: TppLabel;
	ppLabel22: TppLabel;
	ppLabel29: TppLabel;
	ppLabel30: TppLabel;
	ppLabel38: TppLabel;
	ppLabel54: TppLabel;
	ppTWork1: TppLabel;
	ppTDeptName1: TppLabel;
	ppTAbility1: TppLabel;
	ppTPost1: TppLabel;
	ppTJob1: TppLabel;
	ppLabel83: TppLabel;
	ppTFAX1: TppLabel;
	ppLabel90: TppLabel;
	ppLabel107: TppLabel;
	ppLabel110: TppLabel;
	ppLabel111: TppLabel;
	ppLabel112: TppLabel;
	ppLabel113: TppLabel;
	ppSplKen1: TppLabel;
	ppSplKen3: TppLabel;
	ppSplKen4: TppLabel;
	ppSplKen5: TppLabel;
	ppSplKen6: TppLabel;
	ppLabel134: TppLabel;
	ppLabel140: TppLabel;
	ppLabel141: TppLabel;
	ppSplKen2: TppLabel;
	ppLabel144: TppLabel;
	ppTKen1: TppLabel;
	ppTKen2: TppLabel;
	ppTKen3: TppLabel;
	ppTKen4: TppLabel;
	ppTKen5: TppLabel;
	ppTKen6: TppLabel;
	ppLabel170: TppLabel;
	ppTSCorpName: TppLabel;
	ppTSDeptName: TppLabel;
	ppTSPostName: TppLabel;
	ppLabel174: TppLabel;
	ppLabel175: TppLabel;
	ppLabel176: TppLabel;
	ppLabel177: TppLabel;
	ppLabel178: TppLabel;
	ppLabel179: TppLabel;
	ppLabel180: TppLabel;
	ppLabel181: TppLabel;
	ppLabel182: TppLabel;
	ppLabel183: TppLabel;
	ppLabel184: TppLabel;
	ppLKoron10: TppLabel;
	ppLabel185: TppLabel;
	ppLabel186: TppLabel;
	ppLKoron12: TppLabel;
	ppLKoron14: TppLabel;
	ppLKoron13: TppLabel;
	ppLKoron11: TppLabel;
	ppTName2: TppLabel;
    ppTHosNameKana1: TppLabel;
	ppTHosZoku1: TppLabel;
	ppTYuubinNo3: TppLabel;
	ppTAddress31: TppLabel;
	ppTAddress32: TppLabel;
	ppTPhone3: TppLabel;
	ppTName3: TppLabel;
	ppTHosZoku2: TppLabel;
	ppTAddress41: TppLabel;
	ppTYuubinNo4: TppLabel;
	ppTAddress42: TppLabel;
	ppTPhone4: TppLabel;
	ppLItemName15: TppLabel;
	ppLItemName16: TppLabel;
    ppTHosNameKana2: TppLabel;
	ppLabel150: TppLabel;
	ppTNyuusya1: TppLabel;
	ppLabel152: TppLabel;
	ppLabel153: TppLabel;
	ppLabel155: TppLabel;
	ppLLastCo1: TppLabel;
	ppLLastCo2: TppLabel;
	ppLLastCo3: TppLabel;
	ppLLastCo4: TppLabel;
	ppLLastJob1: TppLabel;
	ppLLastJob2: TppLabel;
	ppLLastJob3: TppLabel;
	ppLLastJob4: TppLabel;
	ppLLastDateS1: TppLabel;
	ppLLastDateS2: TppLabel;
	ppLLastDateS3: TppLabel;
	ppLLastDateS4: TppLabel;
	ppLLastDateE1: TppLabel;
	ppLLastDateE2: TppLabel;
	ppLLastDateE3: TppLabel;
	ppLLastDateE4: TppLabel;
	ppLLastRemarks1: TppLabel;
	ppLLastRemarks2: TppLabel;
	ppLLastRemarks3: TppLabel;
	ppLLastRemarks4: TppLabel;
	ppLBunrui1: TppLabel;
	ppLBunrui2: TppLabel;
	ppLBunrui3: TppLabel;
	ppLKubunYobi2: TppLabel;
	ppLKubunYobi1: TppLabel;
	ppLKubunYobi3: TppLabel;
	ppLKubunYobi4: TppLabel;
	ppLKubunYobi5: TppLabel;
	ppRemarks: TppLabel;
	ppLRemarks: TppLabel;
	ppLRenName: TppLabel;
	ppLRenZoku: TppLabel;
	ppLRenYuubinNo: TppLabel;
	ppLRenAddress1: TppLabel;
	ppLRenAddress2: TppLabel;
	ppLRenAdd1Kana: TppLabel;
	ppLRenAdd2Kana: TppLabel;
	ppLRenPhone: TppLabel;
	ppLRenFax: TppLabel;
	ppLTanKubun: TppLabel;
	ppLTanYuubinNo: TppLabel;
	ppLTanAddress1: TppLabel;
	ppLTanAddress2: TppLabel;
	ppLTanPhone: TppLabel;
	ppLHosName1: TppLabel;
	ppLHosKana1: TppLabel;
	ppLHosZoku1: TppLabel;
	ppLHosYuubinNo1: TppLabel;
	ppLHosAddress1: TppLabel;
	ppLHosAddress2: TppLabel;
	ppLHosPhone1: TppLabel;
	ppLHosName2: TppLabel;
	ppLHosKana2: TppLabel;
	ppLHosZoku2: TppLabel;
	ppLHosYuubinNo2: TppLabel;
	ppLHosAddress3: TppLabel;
	ppLHosAddress4: TppLabel;
	ppLHosPhone2: TppLabel;
	ppLODept: TppLabel;
	ppLOJob: TppLabel;
	ppLOWorkClass: TppLabel;
	ppLOPost: TppLabel;
	ppLOAbility: TppLabel;
	ppLdept1: TppLabel;
	ppLdept2: TppLabel;
	ppLdept3: TppLabel;
	ppLdept4: TppLabel;
	ppLdept5: TppLabel;
	ppLdept6: TppLabel;
	ppLLoanName: TppLabel;
	ppLLoanDept: TppLabel;
	ppLLoanPost: TppLabel;
	ppLDeptDate: TppLabel;
	ppLJobDate: TppLabel;
	ppLWorkDate: TppLabel;
	ppLPostDate: TppLabel;
	ppLAbilityDate: TppLabel;
	ppLDeptDate1: TppLabel;
	ppLLoanDate: TppLabel;
	ppLDeptDate3: TppLabel;
	ppLDeptStay: TppLabel;
	ppLDeptDate5: TppLabel;
	ppLJobStay: TppLabel;
	ppLWorkStay: TppLabel;
	ppLPostStay: TppLabel;
	ppLAbilityStay: TppLabel;
	ppLDeptStay1: TppLabel;
	ppLDeptStay3: TppLabel;
	ppLDeptStay5: TppLabel;
	ppLLoanNen: TppLabel;
	ppLDeptRemarks: TppLabel;
	ppLJobRemarks: TppLabel;
	ppLWorkRemarks: TppLabel;
	ppLPostremarks: TppLabel;
	ppLAbilityRemarks: TppLabel;
	ppLDeptremarks1: TppLabel;
	ppLDeptremarks3: TppLabel;
	ppLDeptremarks5: TppLabel;
	ppLLoanremarks: TppLabel;
	ppLabel59: TppLabel;
	ppTSaiyou: TppLabel;
	ppLabel85: TppLabel;
	ppLSaiyou: TppLabel;
	mdjinjiListKoyouNensuu: TStringField;
	ppDBText19: TppDBText;
	ppLKoyouNen: TppLabel;
	ppTShumi2: TppLabel;
	ppTTokugi2: TppLabel;
	ppTKoyouEnd: TppLabel;
	ppLabel1: TppLabel;
	ppTRemarks: TppLabel;
	mdjinjiListEmpNCd: TFloatField;
	ppLLastPost1: TppLabel;
	ppLLastPost2: TppLabel;
	ppLLastPost3: TppLabel;
	ppLLastPost4: TppLabel;
	ppLDeptDate2: TppLabel;
	ppLDeptDate4: TppLabel;
	ppLDeptDate6: TppLabel;
	ppLDeptStay2: TppLabel;
	ppLDeptStay4: TppLabel;
	ppLDeptStay6: TppLabel;
	ppLDeptremarks2: TppLabel;
	ppLDeptremarks4: TppLabel;
	ppLDeptremarks6: TppLabel;
	ppLabel2: TppLabel;
	ppLabel3: TppLabel;
	ppDBText21: TppDBText;
	ppDBText22: TppDBText;
	ppDBText23: TppDBText;
	mdjinjiListKoyouKbn: TStringField;
	ppLLoanCount: TppLabel;
	ppLabel5: TppLabel;
	ppLabel6: TppLabel;
	ppLEMail2: TppLabel;
	ppLEMail3: TppLabel;
	ppLabel8: TppLabel;
	ppLabel9: TppLabel;
	ppLEMailOver: TppLabel;
	ppLEMail2Over: TppLabel;
	ppLEMail3Over: TppLabel;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLPhone3: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLORank: TppLabel;
    ppLRankDate: TppLabel;
    ppLRankStay: TppLabel;
    ppLRankRemarks: TppLabel;
    ppLRenNameKana: TppLabel;
    ppLabel16: TppLabel;
    ppTRenNameKana: TppLabel;
    ppLabel15: TppLabel;
    ppTRenMobile: TppLabel;
    ppLRenMobile: TppLabel;
    ppLabel19: TppLabel;
    ppTRenUpdate: TppLabel;
    ppLRenUpdate: TppLabel;
    ppLabel21: TppLabel;
    ppTHosUpdate1: TppLabel;
    ppLHosUpdate1: TppLabel;
    ppLabel26: TppLabel;
    ppTHosUpdate2: TppLabel;
    ppLHosUpdate2: TppLabel;
    ppTHosMobile1: TppLabel;
    ppLabel18: TppLabel;
    ppLHosMobile1: TppLabel;
    ppTHosMobile2: TppLabel;
    ppLabel24: TppLabel;
    ppLHosMobile2: TppLabel;
    ppTGroupEnter: TppLabel;
    ppLabel20: TppLabel;
    ppLGroupEnter: TppLabel;
    ppLGroupEnterYM: TppLabel;
    ppLabel17: TppLabel;

	constructor CreateForm(	pRec,pParam:Pointer);
	procedure FormCreate(Sender:TObject);
	procedure FormDestroy(Sender: TObject);
	procedure ppDetailBand1BeforePrint(Sender: TObject);
	procedure repJinjiListBeforePrint(Sender: TObject);
  private
	{ Private 宣言 }
	pAppRec		: ^TMjsAppRecord;							// MJSAppRecordﾎﾟｲﾝﾀ
	MDBModule	: TMDataModuleF;							// DBﾓｼﾞｭｰﾙ
	ddCopDB		: TFDConnection;								// 会社DB
	dsPrn		: TDataSource;								// 印刷用ﾃﾞｰﾀｾｯﾄ
	mqMA		: TMQuery;									// 会社ｸｴﾘ
	pPrnParam	: ^THapPrnParam;							// 印刷情報
	m_HAPM3		: THAPM3;									// 操作情報

	iErrorFlag	: integer;
	rcMsg		: TMjsMsgRec;

	function fnGetName(KBNo, ItemNo: String): String;
	function fnGetItemName(iItemNo: Integer; sDefName: String): String;
	function fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
	function fnGetFormatDate(dDate: TDateTime): String;
	function fnGetSTDFormatDate(dDate: TDateTime): String;						//基準日表示用フォーマット　<RefDay>
	procedure fnSELECT_HAPSY;
	procedure fnSELECT_HAPSYJ;
	procedure fnSELECT_HAPSZ;
	procedure fnSELECT_HAPHISE;
	procedure fnSELECT_HAPCHG;
	procedure fnSELECT_HAPSEN;

//<RefDay> ↓ 基準日項目はマスタ取得後に関数で上書きする
	procedure fnHeaderSecondSELECT;												//CPU負荷軽減のため、SELCT分割　<RefDay-faster>
	procedure fnGetHAPSCF_STD;
//<RefDay> ↑

	procedure fnSetFileOut(CmnInfo:TMjsPrnSupport);
	procedure fnSetLabel();
	function fnGetFormatYuubinNo2(iNo1, iNo2: Integer): String;

	public
	{ Public 宣言 }
	procedure DoPrint;

  end;

function AppEntry(pPar:pointer): Integer;				// SystemMenu->Self
exports
  AppEntry;

implementation
uses
	HAPLibU,
	MjSDispCtrl,
	MJSCommonu;

const
	EMAIL_COUNT = 64;	//<2010-05-19>

{$R *.DFM}

{ THAP000051PPrnF }

//----------------------------------------------------------------------
//	Package Export Function
//----------------------------------------------------------------------
//**********************************************************************
//		Proccess	:
//		Name		:
//		Date		:2001/12/13
//		Parameter	:pPar	:Pointer
//		Return		:ACTID_RET_OK	:
//					:ACTID_RET_NG	:不正
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function AppEntry(pPar:pointer):integer;
var
	pForm	: ^THAP000051PPrnF;
	pRec	: ^TMjsAppRecord;
	pParam	: Pointer;
	iAction	: Integer;
begin
	Result	:= ACTID_RET_NG;
	pRec	:= Pointer( TAppParam( pPar^ ).pRecord );							//TMjsAppRecord 構造体 pointer 取得
	pParam	:= Pointer( TAppParam( pPar^ ).pActionParam);						//TMjsAppRecord 構造体 pointer 取得
	iAction := TAppParam( pPar^ ).iAction;										//Action ID 取得
	case iAction of
		ACTID_FORMCREATESTART:
		begin
			try
				New( pForm );
//				pRec^.m_pChildForm := pForm;									//2005-10-31
			except
				Exit;
			end;

			try
				pForm^ := THAP000051PPrnF.CreateForm( pRec,pParam );
				pRec^.m_pChildForm := pForm;									//2005-10-31
			except
				Dispose( pForm );
				Exit;
			end;
		end;

		ACTID_FORMCLOSESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			pForm^.Close;
			pForm^.Free;
			Dispose( pForm );
		end;

		HAP_ACTID_PRINTSTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000051PPrnF(pForm^).DoPrint;
		end;
	end;

	Result := ACTID_RET_OK;
end;

//**********************************************************************
//	Constructor
//**********************************************************************
//**********************************************************************
//		Component	:DataModule
//		Event		:constructor
//		Proccess	:ｺﾝｽﾄﾗｸﾀ
//		Name		:T.Aoki
//		Date		:01/01/30
//		Parameter	:
//		Return		:
//		History		:05/02/24(T.Aoki)
//					:日付編集の参照先をCalendarKbn(入力)->CalendarKbn(印刷)に修正
//**********************************************************************
constructor THAP000051PPrnF.CreateForm(pRec,pParam: Pointer);
var
	iCnt		: Integer;
	POwnerForm	: ^TControl;													//2005-10-31
begin
	pAppRec		:= pRec;														// MjsAppRecord
	pPrnParam	:= pParam;

//2005-10-31
	POwnerForm := pAppRec^.m_pChildForm;										// オーナーフォームを取得

	MDBModule:=TMDataModuleF(pAppRec^.m_pDBModule^);
	try
		ddCopDB:=MDBModule.CopDBOpen(0,pAppRec^.m_iCorpID);
	except
		raise Exception.Create('会社DB ｵｰﾌﾟﾝ失敗');
	end;

	try
		dsPrn:=TDataSource.Create(Self);
	except
		MDBModule.CopDBClose(ddCopDB);
		raise Exception.Create('DataSource 生成失敗');
	end;

	try
		mqMA:=TMQuery.Create(Self);
	except
		dsPrn.Free;
		MDBModule.CopDBClose(ddCopDB);
		raise Exception.Create('会社情報ｸｴﾘ 生成失敗');
	end;

	try
		MDBModule.SetDBInfoToQuery(ddCopDB,mqMA);

		with mqMA do
		begin
//コード属性・桁数
			Close;
			SQL.Clear;
			SQL.Add('SELECT CodeAttr,CodeDigit FROM MasterInfo'	);				//ｺｰﾄﾞ属性,ｺｰﾄﾞ桁数
			SQL.Add('WHERE MasterKbn=:hMAKbn'					);

			for iCnt:=0 to 1 do
			begin
				if iCnt = 0 then	SetFld('hMAKbn').AsInteger := 25			//社員
				else				SetFld('hMAKbn').AsInteger := 41;			//所属

				if not Open then Abort;
				if Eof then Abort;												//先にﾁｪｯｸするのでここでは例外抜け

				if not eof then
				begin
					if iCnt = 0 then											//社員
					begin
						m_HAPM3.EmpAttribute	:= GetFld('CodeAttr').AsInteger ;
						m_HAPM3.EmpDigit		:= GetFld('CodeDigit').AsInteger ;
					end
					else
					begin
						m_HAPM3.DeptAttribute	:= GetFld('CodeAttr').AsInteger ;
						m_HAPM3.DeptDigit		:= GetFld('CodeDigit').AsInteger ;
					end;
				end;

				Close;
			end;

//印字歴区分
			Close;
			SQL.Clear;
		//<090323>↓
		//	SQL.Add('SELECT YearKbn FROM DTMAIN');
			SQL.Add('SELECT CalendarKbn As YearKbn FROM HAPM3');
		//<090323>↑
			if not Open then Abort;
			if Eof then Abort;

			m_HAPM3.CalendarKbn		:= GetFld('YearKbn').AsInteger ;

			Close;

		end;
	except
		mqMA.Free;
		dsPrn.Free;
		MDBModule.CopDBClose(ddCopDB);
		raise Exception.Create('会社情報 取得失敗');
	end;

//2005-10-31
//	inherited Create(AppliCation);
	inherited Create(POwnerForm^);
end;

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Proccess	:
//		Name		:
//		Date		:2001/12/13
//		Parameter	:Sender	:TObject
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000051PPrnF.FormCreate(Sender: TObject);
begin
	with pPrnParam^.MPrnSpt do
	begin
		ApRB			:= repJinjiList;
		pPage			:= ppPageNo;					// 頁
		pDate			:= ppOutputDate;				// 日付
		pCorpCode		:= ppCorpCode;					// 会社ｺｰﾄﾞ
		pCorpName		:= ppCorpName;					// 会社名
		pAccountOffice	:= ppAccOffice;					// 会計事務所名
	end;
end;

//**********************************************************************
//		Component	: Form
//		Event		: Destroy
//		Proccess	: 破棄時
//		Name		:
//		Date		: 2001/04/02
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000051PPrnF.FormDestroy(Sender: TObject);
begin
	mqMA.Free;
	dsPrn.Free;
	MDBModule.CopDBClose(ddCopDB);
end;
//**********************************************************************
//		Component	: ppDetailBand1
//		Event		: BeforePrint
//		Proccess	: 詳細部印刷
//		Name		:
//		Date		: 2002/11/22
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000051PPrnF.ppDetailBand1BeforePrint(Sender: TObject);
begin
	fnSELECT_HAPSY;
	fnSELECT_HAPSYJ;
	fnSELECT_HAPSZ;
	fnSELECT_HAPHISE;
	fnSELECT_HAPCHG;
//	fnSELECT_HAPSEN;

//<RefDay> ↓
	if pPrnParam^.HapPrnSpt.iRefType > 0 then
	begin
		fnGetHAPSCF_STD();
    end;
//<RefDay> ↑

end;
//**********************************************************************
//		Component	: repJinjiList
//		Event		: BeforePrint
//		Proccess	:
//		Name		:
//		Date		: 2002/12/24
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000051PPrnF.repJinjiListBeforePrint(Sender: TObject);
begin
	// ページ指定の印刷用
	pPrnParam^.MPrnSpt.BeforePrint(Sender);
end;
//**********************************************************************
//
//**********************************************************************
//**********************************************************************
//		Proccess	:印刷
//		Name		:
//		Date		:02/11/22
//		History		:04/08/04(T.Aoki)
//					:在職/支払形態の指定に対応
//					:05/03/18(T.Aoki)
//					:社員No順/複数印刷で失敗する不具合修正
//					:05/12/09	T.Abe(BUNTECHNO)
//					:戸籍名出力ビュー対応
//**********************************************************************
procedure THAP000051PPrnF.DoPrint();
var
	DMQuery			: TMQuery;
	i				: Integer;
	sKana,
	sName			: String;
begin
	iErrorFlag:=0;

	fnSetLabel();


	//フリーコード編集<060403>
	if m_HAPM3.EmpAttribute = 2 then
		ppDBText1.Alignment	:= taLeftJustify
	else
		ppDBText1.Alignment	:= taRightJustify;

	if m_HAPM3.DeptAttribute = 2 then
		ppDBText2.Alignment	:= taLeftJustify
	else
		ppDBText2.Alignment	:= taRightJustify;


	DMQuery:=TMQuery.Create(Self);
	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);
	dsPrn.DataSet:=DMQuery;														//ﾃﾞｰﾀｾｯﾄ連結
	try
		try
			//DB情報ｾｯﾄ
			with DMQuery do
			begin
				Close;
				with SQL do
				begin
					//印刷ｶﾗﾑ
					Clear;

					Add('SELECT ');
					Add(' SC.NCode');											//社員内部ｺｰﾄﾞ
					Add(',SC.GCode');											//社員No
					Add(',SC.CorpNCode');

					Add(',(SELECT');											//所属内部No
					Add('	DeptNCode');
					Add( ' FROM');
					Add('	MV_HAP_HAPCHG');
					Add( ' WHERE');
					Add('	MasterKbn=41');
					Add('	AND');
					Add('	EmpNCode=SC.NCode');
					Add('	AND');
					Add('	AddPos=0)');
					Add(' AS');
					Add(' DeptNCd');
//<RefDay> ↓
					Add(',CHG.DeptGCode AS DeptNo'	);							//所属No
					Add(',CHG.LongName  AS DeptName');							//所属名称
					Add(',CHG.OrderNo'				);							//体系No
//<RefDay> ↑
					Add(',MS.KanaName');										//フリガナ
					Add(',MS.Name');											//氏名

					// 戸籍名対応
					Add(',MS.TrueNamekana1M');									//戸籍カナ姓
					Add(',MS.TrueNamekana2M');									//戸籍カナ名
					Add(',MS.TrueNameU');										//戸籍氏名

					Add(',MS.Birth');											//生年月日
					Add(',MS.Phone');											//電話番号

//<RefDay-faster> DEL ↓
{
					Add(',MS.Seibetsu');										//性別
					Add(',MS.Ketueki');											//血液型

                    Add(',MS.YuubinNo1');										//郵便番号
                    Add(',MS.YuubinNo2');										//郵便番号
                    Add(',MS.Address1Kana');									//住所上段カナ
                    Add(',MS.Address1');										//住所上段
                    Add(',MS.Address2Kana');									//住所下段カナ
                    Add(',MS.Address2');										//住所下段
}
//<RefDay-faster> DEL ↑

//<RefDay> ↓
					Add(',SY.Nyuusha');											//入社年月日

					//休職事由
					Add(',SAB.AbsComment');

					//退職事由
					Add(',SY.RetireJiyuu');
//<RefDay> ↑

					//在職区分をBIT展開
					Add(',CASE Zaishoku');
					Add(' WHEN 2 THEN');
					Add(IntToStr(HAP_ZAI_TAISHOKU));
					Add(' WHEN 3 THEN');
					Add(IntToStr(HAP_ZAI_KYUSHOKU));
					Add(' ELSE');
					Add(IntToStr(HAP_ZAI_ZAISHOKU));
					Add(' END');
					Add(' AS');
					Add(' ZaishokuBit');

					//支払形態区分をBIT展開
					Add(',CASE Shiharai');
					Add(' WHEN 1 THEN');
					Add(IntToStr(HAP_SHR_NENSHU));
					Add(' WHEN 3 THEN');
					Add(IntToStr(HAP_SHR_NIKKYU));
					Add(' WHEN 4 THEN');
					Add(IntToStr(HAP_SHR_JIKYUU));
					Add(' ELSE');
					Add(IntToStr(HAP_SHR_GEKKYU));
					Add(' END');
					Add(' AS');
					Add(' ShiharaiBit');

//<RefDay> ↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then
					begin
					//基準日は変数から取得

					//年齢
						Add(',SY.NenreiStd');
						Add(' AS');
						Add(' _MONTHS_AGE');

					//勤続年数
						Add(',SY.KinzokuStd');
						Add(' AS');
						Add(' _MONTHS_SERVE');
                    end
//<RefDay> ↑
					else
					begin
					//基準日
						Add(',MF_HAP_StdDate(SC.CorpNCode,SC.NCode)');
						Add(' AS');
						Add(' _BASE_DATE');

					//年齢
						Add(',MF_HAP_MonthsAge(MS.Birth,MF_HAP_CurEnd(SC.CorpNCode,SC.NCode,1))');
						Add(' AS');
						Add(' _MONTHS_AGE');

					//勤続年数
						Add(',MF_HAP_Months(SY.Nyuusha,MF_HAP_CurEnd(SC.CorpNCode,SC.NCode,0))');
						Add(' AS');
						Add(' _MONTHS_SERVE');
                    end;

					if pPrnParam^.HapPrnSpt.iRefType > 0 then
						Add(',SCSSTD.ZaishokuStd');								//<RefDay> 基準日在職区分

					//TABLE
					Add('FROM');
					Add(' HAPSC AS SC');
					Add(' INNER JOIN');

					// 戸籍名出力ビュー対応
					//Add(' MOS_OFFICE_STAFF AS MS');
					Add(' MV_HAP_CMNMOS AS MS');

					Add(' ON');
					Add(' SC.NCode=MS.NCode');
//<RefDay> ↓
				//基準日区分によってJOIN先切り替え
					//HAPSY
					Add(' INNER JOIN');
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日指定時 <RefDay>
						Add('MP_HAP_HAPSY_STD(:RefDate) AS SY')
					else
						Add('HAPSY AS SY');
					Add(' ON');
					Add(' SC.NCode     = SY.EmpNCode');
					Add(' AND');
					Add(' SC.CorpNCode = SY.CorpNCode');


					//HAPCHG
					Add(' LEFT JOIN');
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日指定時 <RefDay>
						Add('MP_HAP_HAPCHG_STD(:RefDate) AS CHG')
					else
						Add('MV_HAP_HAPCHG AS CHG');
					Add('  ON');
					Add('  SC.NCode     = CHG.EmpNCode');
					Add('  AND');
					Add('  SC.CorpNCode = CHG.CorpNCode');
					Add('  AND');
					Add('  CHG.MasterKbn= 41');
					Add('  AND');
					Add('  CHG.AddPos   = 0');

					//HAPSAB
                    Add(' LEFT JOIN');
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日指定時 <RefDay>
					begin
                        Add(' MP_HAP_HAPSAB_STD(:RefDate, 1) AS SAB');
                        Add(' ON');
                        Add(' SC.NCode     = SAB.EmpNCode');
                        Add(' AND');
                        Add(' SC.CorpNCode = SAB.CorpNCode');
                        Add(' AND');
                        Add(' SAB.CompSt=1');
                    end
					else
					begin
                        Add(' HAPSAB AS SAB');
                        Add(' ON');
                        Add(' SC.NCode     = SAB.EmpNCode');
                        Add(' AND');
                        Add(' SC.CorpNCode = SAB.CorpNCode');
                        Add(' AND');
                        Add(' SAB.CompSt=1');
                        Add(' AND');
                        Add(' SAB.CompEd=0');
                    end;

				//基準日のプロシージャJOIN
					//HAPSCS
                    if pPrnParam^.HapPrnSpt.iRefType > 0 then
                    begin
                        Add('LEFT JOIN');
                        Add(' MP_HAP_HAPSCS_STD(:RefDate) AS SCSSTD');
                        Add('  ON');
                        Add('  SC.NCode     = SCSSTD.EmpNCode');
                        Add('  AND ');
                        Add('  SC.CorpNCode = SCSSTD.CorpNCode ');
                    end;
//<RefDay> ↑
					Add('WHERE');
					Add('SC.SyokuchiKbn=0');

					Add('AND');

					//在職区分のﾌｨﾙﾀ
					Add(' (ZaishokuBit&');
					Add(IntToStr(pPrnParam^.HapPrnSpt.iZaishoku));
					Add(' >0)');
					//支払形態区分のﾌｨﾙﾀ
					Add(' AND');
					Add(' (ShiharaiBit&');
					Add(IntToStr(pPrnParam^.HapPrnSpt.iShiharai));
					Add(' >0)');

// <2006-08-25> ----- S
					// 部門権限
					// <2007-05-02>
					Add('AND (');
					Add('DeptNCd IN (SELECT BmCd FROM MV_MAS_STFBMN WHERE TantoNCD = :TantoNCD)');
					Add('OR IsNull(DeptNCd, 0) = 0)');
					SetFld('TantoNCD').AsFloat := rcCommonArea(pAppRec^.m_pCommonArea^).TantoNCD;
// <2006-08-25> ----- E

					//印刷条件
					//範囲指定
					if pPrnParam^.HapPrnSpt.iSelect=HAPPRN_SEL_HANI then
					begin
						Add('And ');
						if pPrnParam^.HapPrnSpt.iOrder = HAPPRN_ODR_TAIKEI then
						begin
							// 所属体系順
							Add('OrderNo>=');
							Add(''''+IntToStr(pPrnParam^.HapPrnSpt.OrderNo[0])+'''');
						end else
						begin
							// 社員順
							Add('GCode>=');
							Add(''''+pPrnParam^.HapPrnSpt.Code[0]+'''');
						end;

						Add('AND');
						if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI then
						begin
							// 所属体系順
							Add('OrderNo<=');
							Add(''''+IntToStr(pPrnParam^.HapPrnSpt.OrderNo[1])+'''');
						end else
						begin
							// 社員順
							Add('GCode<=');
							Add(''''+pPrnParam^.HapPrnSpt.Code[1]+'''');
						end;
					end;
					//複数指定
					if pPrnParam^.HapPrnSpt.iSelect=HAPPRN_SEL_FUKUSU then
					begin
						Add('And ');
						if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI then
							Add('DeptNCd IN (')	//所属体系
						else
							Add('SC.NCode IN (');	//社員No

						for i:=0 to Length(pPrnParam^.HapPrnSpt.Ncd)-1 do
						begin
							if i>0 then
								Add(',');
							Add(inttostr(pPrnParam^.HapPrnSpt.NCd[i]))
						end;
						Add(')')
					end;
//2005-12-27 ST
					// 本日変更社員絞込み
					if pPrnParam^.HapPrnSpt.bTodayOnly then
					begin
						Add('And DATE(SC.UpdDateTM) = :RDATE');
						SetFld('RDATE').AsDateTime := pPrnParam^.HapPrnSpt.dToday;
					end;
//2005-12-27 ED
//<RefDay> ↓
					//基準日より後の社員は出さない
					if pPrnParam^.HapPrnSpt.iRefType > 0 then
						Add('AND ((SY.Nyuusha <= :RefDate) OR (SY.Nyuusha IS NULL))');
//<Refday> ↑
					//出力順
					Add('ORDER BY');
					if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI then
						Add('OrderNo,')
					else if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_KANA then
						//戸籍名カナ対応 <060405>
						if pPrnParam^.HapPrnSpt.iNameType = 1 then
							Add('TrueNameKanaU,')
						else
							Add('KanaName,');
					Add('GCode');

//<RefDay> ↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then
						SetFld('RefDate').AsDateTime :=  pPrnParam^.HapPrnSpt.dRefDate;
//<RefDay> ↑
				end;

				Open(True);
				if Eof then
				begin
					iErrorFlag:=-1;
					Abort;
				end;

				mdjinjiList.Close;
				mdjinjiList.Open;

				while not eof do
				begin
					mdJinjiList.Append;

					// ヘッダ部をセットする
					mdJinjiList.FieldByName('EmpNCd').AsString:=GetFld('NCode').AsString;	//FloatはStringで<RefDay-faster>
					mdJinjiList.FieldByName('EmpNo').AsString :=
						HapCodeAttribute2(	GetFld('GCode').AsString,			//入力値
											m_HAPM3.EmpDigit,					//ﾏｽﾀﾚﾝｸﾞｽ
											m_HAPM3.EmpAttribute				//文字?
										);

					mdjinjiList.FieldByName('DeptNo').AsString :=
						HapCodeAttribute2(	GetFld('DeptNo').AsString,			//入力値
											m_HAPM3.DeptDigit,					//ﾏｽﾀﾚﾝｸﾞｽ
											m_HAPM3.DeptAttribute				//文字?
										);

					mdjinjiList.FieldByName('DeptName').AsString :=GetFld('DeptName').AsString;

					// 戸籍名出力対応
					if pPrnParam^.HapPrnSpt.iNameType = 1 then
					begin
						sKana	:= GetFld('TrueNamekana1M').AsString + ' ' + GetFld('TrueNamekana2M').AsString;
						sName	:= GetFld('TrueNameU').AsString;
					end
					else
					begin
						sKana	:= GetFld('KanaName').AsString;
						sName	:= GetFld('Name').AsString;
					end;
					mdjinjiList.FieldByName('EmpKana').AsString := sKana;
					mdjinjiList.FieldByName('EmpName').AsString := sName;

//<RefDay-faster> DEL ↓
{
					//性別
                    if GetFld('Seibetsu').AsInteger=1 then
                        mdJinjiList.FieldByName('Seibetsu').AsString:='男性'
                    else if GetFld('Seibetsu').AsInteger=2 then
                        mdJinjiList.FieldByName('Seibetsu').AsString:='女性';

					//血液型
					mdJinjiList.FieldByName('Ketueki').AsString := fnGetName(GetFld('Ketueki').AsString,'101200');
}
//<RefDay-faster> DEL ↑

					//基準日
//<RefDay> ↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then
                    begin
						ppLNenreiDate.Caption := fnGetSTDFormatDate(pPrnParam^.HapPrnSpt.dRefDate);
                    end
					else
					begin
						ppLNenreiDate.Caption := fnGetSTDFormatDate(GetFld('_BASE_DATE').AsDateTime);
                    end;
//<RefDay> ↑

					//生年月日
					if not GetFld('Birth').IsNull then
					begin
						mdJinjiList.FieldByName('Birth').AsString :=
							fnGetFormatDate(GetFld('Birth').AsDatetime);

						//年齢
						mdJinjiList.FieldByName('Nenrei').AsString
									:=Format('%2.2n',[	(GetFld('_MONTHS_AGE').AsInteger div 12)+
														(GetFld('_MONTHS_AGE').AsInteger mod 12)*0.01	]);
					end;

					//入社年月日
					if not GetFld('Nyuusha').IsNull then
					begin
						mdJinjiList.FieldByName('Nyuusha').AsString	:= fnGetFormatDate(GetFld('Nyuusha').AsDatetime);

						//勤続年数
						mdJinjiList.FieldByName('KoyouNensuu').AsString
									:=Format('%2.2n',[	(GetFld('_MONTHS_SERVE').AsInteger div 12)+
														(GetFld('_MONTHS_SERVE').AsInteger mod 12)*0.01	]);
					end;

 					mdJinjiList.FieldByName('Phone').AsString := GetFld('Phone').AsString;

//<RefDay-faster> DEL ↓
{
					//住所カナ
					mdJinjiList.FieldByName('Address1Kana').AsString := GetFld('Address1Kana').AsString;
					mdJinjiList.FieldByName('Address2Kana').AsString := GetFld('Address2Kana').AsString;

					mdJinjiList.FieldByName('YuubinNo').AsString :=
							fnGetFormatYuubinNo2(GetFld('YuubinNo1').AsInteger,GetFld('YuubinNo2').AsInteger);

					mdJinjiList.FieldByName('Address1').AsString := GetFld('Address1').AsString;
					mdJinjiList.FieldByName('Address2').AsString := GetFld('Address2').AsString;
}
//<RefDay-faster> DEL ↑
//<RefDay> ↓

					if pPrnParam^.HapPrnSpt.iRefType > 0 then
					begin
                        if GetFld('ZaishokuStd').AsInteger = 2 then				//基準日時点：退職
							mdJinjiList.FieldByName('RetireJiyuu').AsString := GetFld('RetireJiyuu').AsString
						else if GetFld('ZaishokuStd').AsInteger = 3 then			//基準日時点：休職
							mdJinjiList.FieldByName('RestJiyuu').AsString := GetFld('AbsComment').AsString;
                    end
//<RefDay> ↑
					else
					begin
						mdJinjiList.FieldByName('RestJiyuu').AsString := GetFld('AbsComment').AsString;
						mdJinjiList.FieldByName('RetireJiyuu').AsString := GetFld('RetireJiyuu').AsString;
                    end;

					//CPU負荷軽減 <RefDay-faster>
					fnHeaderSecondSELECT;

					//雇用情報
					fnSELECT_HAPSEN;

					mdjinjiList.Post;
					Next;
				end;
			end;
			case pPrnParam^.MPrnSpt.iCommand	of
			 PDLG_PRINT,				//印刷
			 PDLG_PREVIEW:				//ﾌﾟﾚﾋﾞｭｰ
				with pPrnParam^ do
					MPrev.Exec(MPrnSpt,MDlgF,nil);
			 PDLG_FILE:					// ファイル出力
					fnSetFileOut(pPrnParam^.MPrnSpt);
			end;

		except
			if iErrorFlag = 0 then
			begin
				GetMsg(rcMsg,1,5);
				with rcMsg do
				begin
					MjsMessageBoxEx(Self,'社員ｺﾝﾄﾛｰﾙ'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
				end;
				Abort;
			end
			else
			begin
// <2006-09-07> ----- S
//				MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjError,mjdefOK);
				MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjWarning,mjdefOK);
// <2006-09-07> ----- E
			end;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//		Proccess	: 項目名取得(mvNSPMN)
//		Name		:
//		Date		: 2002/11/22
//		Parameter	: 項目コード、区分コード
//		Return		: 項目名称
//		Hoistory	:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000051PPrnF.fnGetName(KBNo, ItemNo: String): String;
var
	DMQuery	: TMQuery;
	sFrom	: String;
begin
	result:= '';

	DMQuery := TMQuery.Create(self);

	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	iErrorFlag:=0;

	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);

	//<131213>↓
	if (ItemNo = '111710') or (ItemNo = '111800') or (ItemNo = '111910')  then
	begin
		sFrom := 'HAPMNEx';
	end
	else
	begin
		sFrom := 'HAPMN';
	end;  
	//<131213>↑

	try
		try
			with DMQuery do
			begin

				Close();
				SQL.Clear();
				SQL.Add('SELECT KubunName FROM ' + sFrom);
				SQL.Add(' WHERE ItemNo='''+ItemNo+''' and KubunNo='''+KBNo+'''');

				Open(True);
				if Eof then
				begin
					iErrorFlag:=-1;
					Abort;
				end;
				if not eof then
				begin
					result:= GetFld('KubunName').AsString;
				end;
			end;
		except
			result:= '';
			Exit;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;
//**********************************************************************
//		Proccess	: 項目名取得(NSPKM)
//		Name		:
//		Date		:
//		Parameter	: 項目コード、デフォルトの項目名
//		Return		: 項目名称
//		Hoistory	:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000051PPrnF.fnGetItemName(iItemNo: Integer; sDefName: String): String;
var
	DMQuery	: TMQuery;
begin
	Result:= sDefName;

	DMQuery := TMQuery.Create(self);

	if not Assigned(DMQuery) then
		Exit;

	iErrorFlag:=0;

	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);
	try
		try
			with DMQuery do
			begin
				Close();
				SQL.Clear();
				SQL.Add('SELECT ItemName FROM HAPKM ' );
				SQL.Add(' WHERE ItemNo = ' + IntToStr(iItemNo));

				Open(True);
				if Eof then
				begin
					iErrorFlag:=-1;
					Abort;
				end;
				if not Eof then
				begin
					if GetFld('ItemName').AsString <> '' then
						Result := GetFld('ItemName').AsString;
				end;
			end;
		except
			//
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//*	Proccess	: 日付編集
//*	Name		:
//*	Date		:
//*	Parameter	: 日付、区分（１：年　２：月　３：日）
//*	Return		: 文字列
//**********************************************************************
function THAP000051PPrnF.fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
var
 sStr:String;
begin
 case iKbn of
	1:	sStr:=Copy(' '+Formatdatetime('E',SrcDate),Length(Formatdatetime('E',SrcDate)),2);
	2:	sStr:=Copy(' '+IntToStr(MjsMonth(SrcDate)),
			Length(IntToStr(MjsMonth(SrcDate))),2);
	3:	sStr:=Copy(' '+IntToStr(MjsDay(SrcDate)),
			Length(IntToStr(MjsDay(SrcDate))),2);
 else
	sStr:='';
 end;
	Result:=sStr;
end;

//**********************************************************************
//		Proccess	:日付編集
//		Name		:
//		Date		:
//		Parameter	:日付
//		Return		:文字列
//		History		:05/02/24(T.Aoki)
//					:日付編集の参照先をRekiKbn(入力)->CalendarKbn(印刷)に修正
//					:2011/04/15 H.Yamashiro
//					:和暦編集に対応
//**********************************************************************
function THAP000051PPrnF.fnGetFormatDate(dDate : TDateTime): String;
begin
	Result := '';
	if dDate = 0 then
		Exit;

	if m_HAPM3.CalendarKbn = 1 then						//	0 → 1		<20110415>
	begin
		Result :=	Formatdatetime('gg ', dDate) +
						fnGetPrintYMD(dDate, 1) + '/' +
						fnGetPrintYMD(dDate, 2) + '/' +
						fnGetPrintYMD(dDate, 3);
	end else
	begin
		Result := FormatDateTime('YYYY/m/d', dDate);
	end;
end;


//**********************************************************************
//*	Proccess	: 郵便番号編集
//*	Name		:
//*	Date		:
//*	Parameter	: 郵便番号
//*	Return		: 郵便番号
//**********************************************************************
function THAP000051PPrnF.fnGetFormatYuubinNo2(iNo1,iNo2: Integer): String;
var
	sNo1,
	sNo2	: String;
begin
	Result := '';
	
	// ST UPD <20110415_2>
	if (iNo1 <> 0) or (iNo2 <> 0) then
	begin
		sNo1	:=	MjsEditNum(iNo1,'0000',3);
		sNo2	:=	MjsEditNum(iNo2,'0000',4);
	end
	else
		Exit;
	// ED UPD <20110415_2>
	
	Result := sNo1 + '-' + sNo2;
end;


//**********************************************************************
//		Proccess	: 基本情報
//		Name		:
//		Date		:
//		Parameter	: なし
//		Return		: なし
//		History		:2005/02/19(T.Aoki)
//					:滞留期間のEndをmpStdDate()->mpNSP_CurEnd()に変更
//**********************************************************************
procedure THAP000051PPrnF.fnSELECT_HAPSY;
var
	DMQuery	: TMQuery;
	sWork	: String;
	sShainKbn : String;					// <20110415_3>
begin
	ppLEmpRomaji.Caption	:= '';
	ppLEmpRomaji2.Caption	:= '';
	ppLHouse.Caption		:= '';
	ppLMoveinDate.Caption	:= '';
	ppLPhone2.Caption		:= '';
	ppLPhone3.Caption		:= '';		// 携帯電話（社内）<20110418>
	ppLEMail.Caption		:= '';
	ppLEMail2.Caption		:= '';		//<2010-05-19>
	ppLEMail3.Caption		:= '';		//<2010-05-19>
	ppLEMailOver.Caption	:= '';		//<2010-05-19>
	ppLEMail2Over.Caption	:= '';		//<2010-05-19>
	ppLEMail3Over.Caption	:= '';		//<2010-05-19>
	ppLFax.Caption			:= '';
	ppLZaishoku.Caption		:= '';
	ppLShiharai.Caption		:= '';
	ppLQyoKbn.Caption		:= '';
	ppLShoKbn.Caption		:= '';
	ppLNenKbn.Caption		:= '';
	ppLEmpKubun.Caption		:= '';
	ppLJobName.Caption		:= '';
	ppLWorkClass.Caption	:= '';
	ppLPostNo.Caption		:= '';
	ppLAbility.Caption		:= '';
	ppLRank.Caption			:= '';
	ppLSaiyou.Caption		:= '';
	ppLSyoukai.Caption		:= '';
	ppLSyoukaiName.Caption	:= '';
	ppLSyoukaiZoku.Caption	:= '';
	ppLGakureki.Caption		:= '';
	ppLSotutai.Caption		:= '';
	ppLSotugiyouNen.Caption := '';
	ppLGakubu.Caption		:= '';
	ppLGatukouName.Caption	:= '';
	ppLGakubuKubun.Caption	:= '';
	ppLGatukaName.Caption	:= '';
	ppLKumiai.Caption		:= '';
	ppLKumiaiDate.Caption	:= '';
	ppLKumiaiDate2.Caption	:= '';
	ppLKumiaiDate2.Caption	:= '';
	ppLKumiaiDate2.Caption	:= '';
//<2010-05-19>未使用→ｺﾒﾝﾄｱｳﾄ
//	ppLImagePath.Caption	:= '';
	ppLBunrui1.Caption		:= '';
	ppLBunrui2.Caption		:= '';
	ppLBunrui3.Caption		:= '';
	ppLKubunYobi1.Caption	:= '';
	ppLKubunYobi2.Caption	:= '';
	ppLKubunYobi3.Caption	:= '';
	ppLKubunYobi4.Caption	:= '';
	ppLKubunYobi5.Caption	:= '';

	ppLODept.Caption		:= '';
	ppLDeptDate.Caption		:= '';
	ppLDeptStay.Caption		:= '';
	ppLOJob.Caption			:= '';
	ppLJobDate.Caption		:= '';
	ppLJobStay.Caption		:= '';
	ppLOWorkClass.Caption	:= '';
	ppLWorkDate.Caption		:= '';
	ppLWorkStay.Caption		:= '';
	ppLORank.Caption		:= '';					// ADD【現発令情報】等級号俸		<20110418>
	ppLRankDate.Caption		:= '';					// ADD【現発令情報】発令日			<20110418>
	ppLRankStay.Caption		:= '';					// ADD【現発令情報】滞留年数		<20110418>
	ppLOPost.Caption		:= '';
	ppLPostDate.Caption		:= '';
	ppLPostStay.Caption		:= '';
	ppLOAbility.Caption		:= '';
	ppLAbilityDate.Caption	:= '';
	ppLAbilityStay.Caption	:= '';
	ppLGroupEnter.Caption	:= '';	//<140722>
	ppLGroupEnterYM.Caption	:= '';	//<140722>
	DMQuery:=TMQuery.Create(Self);
	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);

	try
		try
			//DB情報ｾｯﾄ
			with DMQuery do
			begin
				Close;
				with SQL do
				begin
					Clear();

					Add('SELECT ');
					Add(' MS.EmpRomaji1');									//ローマ字(姓)
					Add(',MS.EmpRomaji2');									//ローマ字(名)
					Add(',SY.House');										//住居区分
					Add(',SY.MoveinDate');									//入居年月日
					Add(',SY.Phone2');										//携帯電話番号
					Add(',SY.Phone3');										// 携帯電話（社内）		<20110418>
					Add(',SC.EMail1');										//E-Mail
					Add(',SC.EMail2');										//E-Mail(携帯)	<2010-05-19>
					Add(',SC.EMail3');										//E-Mail(社内)	<2010-05-19>
					Add(',SY.Fax');											//FAX番号
//<RefDay> ↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then
					begin
                        Add(',(SELECT ShiharaiStd FROM MP_HAP_HAPSCS_STD(:RefDate) WHERE EmpNCode = :EmpNCd AND CorpNCode = 0) AS Shiharai');	//支払形態
                        Add(',(SELECT EmpKubunStd FROM MP_HAP_HAPSCS_STD(:RefDate) WHERE EmpNCode = :EmpNCd AND CorpNCode = 0) AS EmpKubun');	//社員区分
                        Add(',(SELECT ZaishokuStd FROM MP_HAP_HAPSCS_STD(:RefDate) WHERE EmpNCode = :EmpNCd AND CorpNCode = 0) AS Zaishoku');	//在職区分
                    end
					else
					begin
                        Add(',SC.Zaishoku');									//在職区分
                        Add(',SC.Shiharai');									//支払形態
                        Add(',SY.EmpKubun');									//社員区分
                    end;
//<RefDay> ↑
					Add(',SC.QyoKbn');										//給与計算
					Add(',SC.ShoKbn');										//賞与計算
					Add(',SC.NenKbn');										//年調計算
					Add(',SY.Rank');										//等級号俸

					Add(',SY.Saiyou');										//採用区分
					Add(',SY.Syoukai');										//紹介先区分
					Add(',SY.SyoukaiName1');								//紹介者
					Add(',SY.SyoukaiName2');								//紹介者
					Add(',SY.SyoukaiZoku');									//紹介者続柄

					Add(',SY.Gakureki');									//最終学歴区分
					Add(',SY.Sotutai');										//卒退区分
					Add(',SY.SotugiyouNen');								//卒業年月日
					Add(',SY.Gakubu');										//学校区分
					Add(',SY.GatukouName');									//学校名
					Add(',SY.GakubuKubun');									//学部区分
					Add(',SY.GatukaName');									//学部名
					Add(',SY.GatukouKubun');								//学部区分<131213>
					Add(',SY.GatukaKubun');									//学部名<131213>

					Add(',SY.Kumiai');										//組合加入区分
					Add(',SY.KumiaiDate');									//加入年月日
					Add(',SY.KumiaiDate2');									//脱退年月日

					Add(',SY.Bunrui1');										//分類
					Add(',SY.Bunrui2');										//分類
					Add(',SY.Bunrui3');										//分類
					Add(',SY.KubunYobi1');									//予備区分
					Add(',SY.KubunYobi2');									//予備区分
					Add(',SY.KubunYobi3');									//予備区分
					Add(',SY.KubunYobi4');									//予備区分
					Add(',SY.KubunYobi5');									//予備区分
					Add(',SY.GroupEnter');									//グループ入社日	<140722>
//<RefDay> ↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then
                        Add(',MF_HAP_Months(SY.GroupEnter, MF_HAP_StdDateEnd(:RefDate, Null, SY.Retire)) AS GroupEnterYM')
//<RefDay> ↑
					else
						Add(',MF_HAP_Months(SY.GroupEnter, MF_HAP_CurEnd(0, :EmpNCd, 0)) AS GroupEnterYM');	//グループ勤続年数	<140722>

					//TABLE
					Add('FROM');
					Add(' HAPSC AS SC');
					Add(' INNER JOIN');
					Add(' HAPSY AS SY');
					Add(' ON');
					Add(' SC.NCode=SY.EmpNCode');
					Add(' AND');
					Add(' SC.CorpNCode=SY.CorpNCode');
					Add(' INNER JOIN');
					Add(' MOS_OFFICE_STAFF AS MS');
					Add(' ON');
					Add(' SC.NCode=MS.NCode');
					Add('WHERE');
					Add(' SC.NCode = :EmpNCd');
					Add('AND');
					Add(' SC.CorpNCode = 0');

				end;
				ParamByName('EmpNCd').AsString :=
					mdJinjiList.FieldByName('EmpNCd').AsString;					//<RefDay-faster>

				if pPrnParam^.HapPrnSpt.iRefType > 0 then
					SetFld('RefDate').AsDateTime := pPrnParam^.HapPrnSpt.dRefDate;

				Open(True);
				if(IsEmpty)then
					Abort;

				if not GetFld('MoveinDate').IsNull then
					ppLMoveinDate.Caption :=
						fnGetFormatDate(GetFld('MoveinDate').AsDatetime);

				if not GetFld('SotugiyouNen').IsNull then
					ppLSotugiyouNen.Caption	:=
						fnGetFormatDate(GetFld('SotugiyouNen').AsDatetime);

				if not GetFld('KumiaiDate').IsNull then
					ppLKumiaiDate.Caption :=
						fnGetFormatDate(GetFld('KumiaiDate').AsDatetime);

				if not GetFld('KumiaiDate2').IsNull then
					ppLKumiaiDate2.Caption :=
						fnGetFormatDate(GetFld('KumiaiDate2').AsDatetime);

				//支払形態
				if GetFld('Shiharai').AsString='1' then
					ppLShiharai.Caption:='年収者'
				else if GetFld('Shiharai').AsString='2' then
					ppLShiharai.Caption:='月給者'
				else if GetFld('Shiharai').AsString='3' then
					ppLShiharai.Caption:='日給者'
				else if GetFld('Shiharai').AsString='4' then
					ppLShiharai.Caption:='時給者';

				//社員区分&役職&分類1&分類2&分類3&休職区分&退職区分
				// ST UPD <20110415_3>
				sShainKbn := FNGetName(GetFld('EmpKubun').AsString,'110100');
				if sShainKbn = '' then
					ppLEmpKubun.Caption := '会社規定'
				else
					ppLEmpKubun.Caption := sShainKbn;
				// ED UPD <20110415_3>
				ppLHouse.Caption		:=FNGetName(GetFld('House').AsString,'112000');
				ppLEmpRomaji.Caption	:= GetFld('EmpRomaji1').AsString;
				ppLEmpRomaji2.Caption	:= GetFld('EmpRomaji2').AsString;
				ppLPhone2.Caption		:= GetFld('Phone2').AsString;
				ppLPhone3.Caption		:= GetFld('Phone3').AsString;			// 携帯電話（社内）<20110418>
			//<2010-05-19>↓
			//	ppLEMail.Caption		:= GetFld('EMail1').AsString;

				ppLEMail.Caption		:= Copy(GetFld('EMail1').AsString,0,EMAIL_COUNT);
				ppLEMail2.Caption		:= Copy(GetFld('EMail2').AsString,0,EMAIL_COUNT);
				ppLEMail3.Caption		:= Copy(GetFld('EMail3').AsString,0,EMAIL_COUNT);
			//<2010-05-19>↑
				ppLFax.Caption			:= GetFld('Fax').AsString;

				if GetFld('Rank').AsInteger > 0 then
				begin
					ppLRank.Caption := GetFld('Rank').AsString;
					ppLORank.Caption := GetFld('Rank').AsString;			// ADD 【現発令情報】等級号俸 <20110418>
				end;

				//職区分
				if GetFld('Zaishoku').AsString='1' then
					ppLZaishoku.Caption:='在職者'
				else if GetFld('Zaishoku').AsString='2' then
					ppLZaishoku.Caption:='退職者'
				else if GetFld('Zaishoku').AsString='3' then
					ppLZaishoku.Caption:='休職者' ;
				//給与計算
				if GetFld('QyoKbn').AsString='1' then
					ppLQyoKbn.Caption:='必要'
				else if GetFld('QyoKbn').AsString='2' then
					ppLQyoKbn.Caption:='不要';
				//与計算態
				if GetFld('ShoKbn').AsString='1' then
					ppLShoKbn.Caption:='必要'
				else if GetFld('ShoKbn').AsString='2' then
					ppLShoKbn.Caption:='不要';
				//年調計算
				if GetFld('NenKbn').AsString='1' then
					ppLNenKbn.Caption:='必要'
				else if GetFld('NenKbn').AsString='2' then
					ppLNenKbn.Caption:='不要';

				// 採用区分
				ppLSaiyou.Caption :=FNGetName(GetFld('Saiyou').AsString,'110900');
				// 紹介先区分
				ppLSyoukai.Caption :=FNGetName(GetFld('Syoukai').AsString,'111000');
				// 紹介者
				sWork := GetFld('SyoukaiName1').AsString;

				if sWork <> '' then
					sWork := sWork + '　';

				sWork := sWork + GetFld('SyoukaiName2').AsString;
				ppLSyoukaiName.Caption :=sWork;

				// 紹介者続柄
				ppLSyoukaiZoku.Caption :=FNGetName(GetFld('SyoukaiZoku').AsString,'111200');
				// 最終学歴区分
				ppLGakureki.Caption :=FNGetName(GetFld('Gakureki').AsString,'111300');
				// 卒退区分
				if GetFld('Sotutai').AsString='1' then
					ppLSotutai.Caption:='卒業'
				else if GetFld('Sotutai').AsString='2' then
					ppLSotutai.Caption:='中退';
				// 学校区分
				ppLGakubu.Caption	:= FNGetName(GetFld('Gakubu').AsString,'111600');
				// 学校名
				ppLGatukouName.Caption :=GetFld('GatukouName').AsString;

				//<131213>↓
				if GetFld('GatukouKubun').AsInteger <> 0 then
				begin
					ppLGatukouName.Caption := fnGetName(GetFld('GatukouKubun').AsString, '111710');
				end;
				//<131213>↑

				// 学部区分
				ppLGakubuKubun.Caption :=FNGetName(GetFld('GakubuKubun').AsString,'111800');
				// 学部名
				ppLGatukaName.Caption :=GetFld('GatukaName').AsString;

				//<131213>↓
				if GetFld('GatukaKubun').AsInteger <> 0 then
				begin
					ppLGatukaName.Caption := fnGetName(GetFld('GatukaKubun').AsString, '111910');
				end;
				//<131213>↑

				// 組合加入区分
				ppLKumiai.Caption	:= FNGetName(GetFld('Kumiai').AsString,'112200');
				// 分類
				ppLBunrui1.Caption	:= FNGetName(GetFld('Bunrui1').AsString,'110600');
				ppLBunrui2.Caption	:= FNGetName(GetFld('Bunrui2').AsString,'110700');
				ppLBunrui3.Caption	:= FNGetName(GetFld('Bunrui3').AsString,'110800');
				// 予備区分
				ppLKubunYobi1.Caption :=FNGetName(GetFld('KubunYobi1').AsString,'112700');
				ppLKubunYobi2.Caption :=FNGetName(GetFld('KubunYobi2').AsString,'112800');
				ppLKubunYobi3.Caption :=FNGetName(GetFld('KubunYobi3').AsString,'112900');
				ppLKubunYobi4.Caption :=FNGetName(GetFld('KubunYobi4').AsString,'113000');
				ppLKubunYobi5.Caption :=FNGetName(GetFld('KubunYobi5').AsString,'113100');

				if Length(GetFld('EMail1').AsString) > EMAIL_COUNT then	//<2010-05-19>
					ppLEMailOver.Caption	:= '※';
				if Length(GetFld('EMail2').AsString) > EMAIL_COUNT then	//<2010-05-19>
					ppLEMail2Over.Caption	:= '※';
				if Length(GetFld('EMail3').AsString) > EMAIL_COUNT then	//<2010-05-19>
					ppLEMail3Over.Caption	:= '※';

				//<140722>↓
				ppLGroupEnter.Caption := fnGetFormatDate(GetFld('GroupEnter').AsDateTime);

				if GetFld('GroupEnterYM').AsInteger <> 0 then
				begin
					ppLGroupEnterYM.Caption := Format('%2.2n', [(GetFld('GroupEnterYM').AsInteger div 12) +
																(GetFld('GroupEnterYM').AsInteger mod 12) * 0.01]);
				end;
				//<140722>↑
			end;

		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'基本情報'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			Abort;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//		Proccess	: 基本情報(人事)
//		Name		:
//		Date		:
//		Parameter	:
//		Return		:
//		History		:2005/02/19(T.Aoki)
//					:滞留期間のEndをmpStdDate()->mpNSP_CurEnd()に変更
//**********************************************************************
procedure THAP000051PPrnF.fnSELECT_HAPSYJ;
var
	DMQuery	: TMQuery;
	sWork	: String;
	iCnt	: Integer; // <2008-02-28>
begin
	ppLHomeCity.Caption		:= '';
	ppLNationality.Caption	:= '';
	ppLShumi.Caption		:= '';
	ppLShumi2.Caption		:= '';
	ppLTokugi.Caption		:= '';
	ppLTokugi2.Caption		:= '';
	ppLLanguage.Caption		:= '';
	ppLRemarks.Caption		:= '';

	ppLRenName.Caption		:= '';
//<130718>↓
	ppLRenNameKana.Caption	:= '';
//<130718>↑
	ppLRenZoku.Caption		:= '';
	ppLRenYuubinNo.Caption	:= '';
	ppLRenAddress1.Caption	:= '';
	ppLRenAddress2.Caption	:= '';
	ppLRenAdd1Kana.Caption	:= '';
	ppLRenAdd2Kana.Caption	:= '';
	ppLRenPhone.Caption		:= '';
	ppLRenFax.Caption		:= '';
//<130718>↓
	ppLRenMobile.Caption	:= '';
	ppLRenUpdate.Caption	:= '';
//<130718>↑
	ppLTanKubun.Caption		:= '';
	ppLTanYuubinNo.Caption	:= '';
	ppLTanAddress1.Caption	:= '';
	ppLTanAddress2.Caption	:= '';
	ppLTanPhone.Caption		:= '';
	ppLHosName1.Caption		:= '';
	ppLHosKana1.Caption		:= '';
	ppLHosZoku1.Caption		:= '';
	ppLHosYuubinNo1.Caption	:= '';
	ppLHosAddress1.Caption	:= '';
	ppLHosAddress2.Caption	:= '';
	ppLHosPhone1.Caption	:= '';
//<130718>↓                      
	ppLHosMobile1.Caption	:= '';
	ppLHosUpdate1.Caption	:= '';
//<130718>↑
	ppLHosName2.Caption		:= '';
	ppLHosKana2.Caption		:= '';
	ppLHosZoku2.Caption		:= '';
	ppLHosYuubinNo2.Caption	:= '';
	ppLHosAddress3.Caption	:= '';
	ppLHosAddress4.Caption	:= '';
	ppLHosPhone2.Caption	:= '';
//<130718>↓                        
	ppLHosMobile2.Caption	:= '';
	ppLHosUpdate2.Caption	:= '';
//<130718>↑

	ppLLoanCount.Caption	:= '';		// <2008-02-28>
	ppLLoanName.Caption		:= '';
	ppLLoanDate.Caption		:= '';
	ppLLoanNen.Caption		:= '';
	ppLLoanRemarks.Caption	:= '';
	ppLLoanDept.Caption		:= '';
	ppLLoanPost.Caption		:= '';
	ppLDeptRemarks.Caption	:= '';
	ppLJobRemarks.Caption	:= '';
	ppLWorkRemarks.Caption	:= '';
	ppLRankRemarks.Caption	:= '';		// ADD【現発令情報】 事由 <20110418>
	ppLPostRemarks.Caption	:= '';
	ppLAbilityRemarks.Caption := '';

	DMQuery:=TMQuery.Create(Self);
	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);

	try
		try
			//DB情報ｾｯﾄ
			with DMQuery do
			begin
				Close;
				with SQL do
				begin
					Clear();
					Add('SELECT');
					Add(' SYJ.*');
					Add('FROM');
					Add(' HAPSC AS SC');
					Add(' INNER JOIN');
					Add(' HAPSY AS SY');
					Add(' ON');
					Add(' SC.NCode=SY.EmpNCode');
					Add(' AND');
					Add(' SC.CorpNCode=SY.CorpNCode');
					Add(' INNER JOIN');
					Add(' HAPSYJ AS SYJ');
					Add(' ON');
					Add(' SC.NCode=SYJ.EmpNCode');
					Add(' AND');
					Add(' SC.CorpNCode=SYJ.CorpNCode');
					Add('WHERE');
					Add(' SC.NCode = :EmpNCd');
					Add('AND');
					Add(' SC.CorpNCode = 0');

				end;
				ParamByName('EmpNCd').AsString :=
					mdJinjiList.FieldByName('EmpNCd').AsString;			//<RefDay-faster>

				Open(True);
				if not Eof then
				begin
					ppLHomeCity.Caption := FNGetName(GetFld('HomeCity').AsString,'145500');
					ppLNationality.Caption := FNGetName(GetFld('Nationality').AsString,'145600');
					ppLShumi.Caption	:= GetFld('Shumi').AsString;
					ppLShumi2.Caption	:= GetFld('Shumi2').AsString;
					ppLTokugi.Caption	:= GetFld('Tokugi').AsString;
					ppLTokugi2.Caption	:= GetFld('Tokugi2').AsString;
					ppLLanguage.Caption := FNGetName(GetFld('Language').AsString,'145400');
					ppLRemarks.Caption	:= GetFld('Remarks').AsString;

					sWork := GetFld('RenName1').AsString;

					if sWork <> '' then
						sWork := sWork + '　';

					sWork := sWork + GetFld('RenName2').AsString;
					ppLRenName.Caption := sWork;
//<130718>↓
					ppLRenNameKana.Caption	:= GetFld('RenKana1').AsString
											+ ' ' + GetFld('RenKana2').AsString;
//<130718>↑
					ppLRenZoku.Caption := FNGetName(GetFld('RenZoku').AsString,'111200');
					ppLRenYuubinNo.Caption :=
							fnGetFormatYuubinNo2(GetFld('RenYuubinNo1').AsInteger,GetFld('RenYuubinNo2').AsInteger);

					ppLRenAddress1.Caption := GetFld('RenAddress1').AsString;
					ppLRenAddress2.Caption := GetFld('RenAddress2').AsString;
					ppLRenAdd1Kana.Caption := GetFld('RenAdd1Kana').AsString;
					ppLRenAdd2Kana.Caption := GetFld('RenAdd2Kana').AsString;
					ppLRenPhone.Caption	:= GetFld('RenPhone').AsString;
					ppLRenFax.Caption	:= GetFld('RenFax').AsString;
//<130718>↓
					ppLRenMobile.Caption	:= GetFld('RenMobile').AsString;
					ppLRenUpdate.Caption	:= fnGetFormatDate(GetFld('RenUpdate').AsDateTime);
//<130718>↑
					ppLTanKubun.Caption := FNGetName(GetFld('TanKubun').AsString,'147800');

					ppLTanYuubinNo.Caption :=
							fnGetFormatYuubinNo2(GetFld('TanYuubinNo1').AsInteger,GetFld('TanYuubinNo2').AsInteger);

					ppLTanAddress1.Caption	:= GetFld('TanAddress1').AsString;
					ppLTanAddress2.Caption	:= GetFld('TanAddress2').AsString;
					ppLTanPhone.Caption		:= GetFld('TanPhone').AsString;

				//保証人氏名１
					sWork := GetFld('HosName11').AsString;

					if sWork <> '' then
						sWork := sWork + '　';

					sWork := sWork + GetFld('HosName12').AsString;

					ppLHosName1.Caption := sWork;

				//保証人カナ１
					sWork := GetFld('HosKana11').AsString;

					if sWork <> '' then
						sWork := sWork + ' ';

					sWork := sWork + GetFld('HosKana12').AsString;

					ppLHosKana1.Caption := sWork;
					ppLHosZoku1.Caption := FNGetName(GetFld('HosZoku1').AsString,'111200');
					ppLHosYuubinNo1.Caption :=
							fnGetFormatYuubinNo2(GetFld('HosYuubinNo11').AsInteger,GetFld('HosYuubinNo12').AsInteger);

					ppLHosAddress1.Caption := GetFld('HosAddress1').AsString;
					ppLHosAddress2.Caption := GetFld('HosAddress2').AsString;
					ppLHosPhone1.Caption := GetFld('HosPhone1').AsString;
//<130718>↓
					ppLHosMobile1.Caption := GetFld('HosMobile1').AsString;
					ppLHosUpdate1.Caption	:= fnGetFormatDate(GetFld('HosUpdate1').AsDateTime);
//<130718>↑

				//保証人氏名２
					sWork := GetFld('HosName21').AsString;

					if sWork <> '' then
						sWork := sWork + '　';

					sWork := sWork + GetFld('HosName22').AsString;

					ppLHosName2.Caption := sWork;

				//保証人カナ１
					sWork := GetFld('HosKana21').AsString;

					if sWork <> '' then
						sWork := sWork + ' ';

					sWork := sWork + GetFld('HosKana22').AsString;

					ppLHosKana2.Caption := sWork;
					ppLHosZoku2.Caption := FNGetName(GetFld('HosZoku2').AsString,'111200');

					ppLHosYuubinNo2.Caption :=
							fnGetFormatYuubinNo2(GetFld('HosYuubinNo21').AsInteger,GetFld('HosYuubinNo22').AsInteger);

					ppLHosAddress3.Caption := GetFld('HosAddress3').AsString;
					ppLHosAddress4.Caption := GetFld('HosAddress4').AsString;
					ppLHosPhone2.Caption := GetFld('HosPhone2').AsString;
//<130718>↓
					ppLHosMobile2.Caption := GetFld('HosMobile2').AsString;
					ppLHosUpdate2.Caption	:= fnGetFormatDate(GetFld('HosUpdate2').AsDateTime);
//<130718>↑
				end;

				Close;
				SQL.Clear;
				SQL.Add('SELECT LoanCorpName,LoanDateSt,LoanComment,LoanDeptName,LoanPostName,'			);
//<RefDay> ↓
				//基準日指定時
				if pPrnParam^.HapPrnSpt.iRefType > 0 then
				begin
					SQL.Add('LoanMonthsStd As _MONTHS_LOAN'	);
					SQL.Add('FROM MP_HAP_HAPSLN_STD('
						+''''+FormatDateTime('yyyy-mm-dd', pPrnParam^.HapPrnSpt.dRefDate)+''''+',1)');
					SQL.Add('WHERE EmpNCode=:hNCode AND CorpNCode=0 AND CompSt=1 '					);
                end
				else
				begin
					SQL.Add('MF_HAP_Months(LoanDateSt,MF_HAP_CurEnd(EmpNCode,CorpNCode,0)) As _MONTHS_LOAN'	);
					SQL.Add('FROM HAPSLN WHERE EmpNCode=:hNCode AND CorpNCode=0 AND CompSt=1 AND CompEd=0'	);
                end;
//<RefDay> ↑
				SQL.Add('ORDER BY LoanDateSt DESC, LoanNCode'											);	// <2008-02-28>

				SetFld('hNCode').AsString :=
					mdJinjiList.FieldByName('EmpNCd').AsString;			//<RefDay-faster>

				if not Open then
					Abort;

				if not Eof then
				begin
					// 出向先
					ppLLoanName.Caption := GetFld('LoanCorpName').AsString;

					if(not GetFld('LoanDateSt').IsNull)then
					begin
						ppLLoanDate.Caption:=fnGetFormatDate(GetFld('LoanDateSt').AsDateTime);
						ppLLoanNen.Caption :=Format('%2.2n',[(GetFld('_MONTHS_LOAN').AsInteger div 12)+
															 (GetFld('_MONTHS_LOAN').AsInteger mod 12)*0.01	]);
					end;
					ppLloanRemarks.Caption := GetFld('LoanComment').AsString;
					ppLLoanDept.Caption := GetFld('LoanDeptName').AsString;
					ppLLoanPost.Caption := GetFld('LoanPostName').AsString;

					// <2008-02-28>
					iCnt := 0;
					while not Eof do
					begin
						Inc(iCnt);
						Next;
					end;

					if iCnt > 1 then
					begin
						ppLLoanCount.Caption := Format('現在出向中 %d件', [iCnt]);
					end;
				end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'基本情報(人事)'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			Abort;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//		Proccess	: 社員所得税情報
//		Name		:
//		Date		:
//		Parameter	: なし
//		Return		: なし
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000051PPrnF.fnSELECT_HAPSZ;
var
	DMQuery	: TMQuery;
begin
	ppLTeiNenCalc.Caption := '';

	DMQuery:=TMQuery.Create(Self);
	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);

	try
		try
			with DMQuery do
			begin
				Close;
				with SQL do
				begin
					Clear();
					Add('SELECT ');
					Add('TeiNenCalc');
					//TABLE

					Add('FROM HAPSZ');
					Add('WHERE EmpNCode = :EmpNCd');
					Add('AND');
					Add(' CorpNCode = 0');
				end;

				ParamByName('EmpNCd').AsString :=
					mdJinjiList.FieldByName('EmpNCd').AsString;				//<RefDay-faster>

				Open(True);
				if not Eof then
				begin
					if GetFld('TeiNenCalc').AsString='1' then
						ppLTeiNenCalc.Caption := '被災給与所得者'
					else if GetFld('TeiNenCalc').AsString='2' then
						ppLTeiNenCalc.Caption := '丙欄適用者';
				end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'社員所得税情報'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			Abort;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//		Proccess	: 前職（歴）情報
//		Name		:
//		Date		:
//		Parameter	: なし
//		Return		: なし
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000051PPrnF.fnSELECT_HAPHISE;
const
	DEF_DATE = '1890/12/30';
var
	DMQuery	: TMQuery;
	iNo		: Integer;
begin
	ppLLastCo1.Caption	:= '';
	ppLLastCo2.Caption	:= '';
	ppLLastCo3.Caption	:= '';
	ppLLastCo4.Caption	:= '';
	ppLLastJob1.Caption := '';
	ppLLastJob2.Caption := '';
	ppLLastJob3.Caption := '';
	ppLLastJob4.Caption := '';

	ppLLastPost1.Caption := '';
	ppLLastPost2.Caption := '';
	ppLLastPost3.Caption := '';
	ppLLastPost4.Caption := '';

	ppLLastDateS1.Caption := '';
	ppLLastDateS2.Caption := '';
	ppLLastDateS3.Caption := '';
	ppLLastDateS4.Caption := '';
	ppLLastDateE1.Caption := '';
	ppLLastDateE2.Caption := '';
	ppLLastDateE3.Caption := '';
	ppLLastDateE4.Caption := '';
	ppLLastRemarks1.Caption := '';
	ppLLastRemarks2.Caption := '';
	ppLLastRemarks3.Caption := '';
	ppLLastRemarks4.Caption := '';

	DMQuery:=TMQuery.Create(Self);
	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);

	try
		try
			with DMQuery do
			begin
				Close;
				with SQL do
				begin
					Clear;
					Add('Select LCorpName, LJobName, LPostName,');
					Add(' IsNull(LNyuusha,ConVert(DateTime,'+''''+DEF_DATE+''''+')) LastDate1,');
					Add(' IsNull(LRetire,ConVert(DateTime,'+''''+DEF_DATE+''''+')) LastDate2,');
					Add('LRemarks'				);
//<RefDay> ↓
					//基準日指定時
					if pPrnParam^.HapPrnSpt.iRefType > 0 then
					begin
						Add('FROM MP_HAP_HAPSCR_STD('
						+''''+FormatDateTime('yyyy-mm-dd', pPrnParam^.HapPrnSpt.dRefDate)+''''+',0)');
                    end
					else
					begin
						Add('FROM HAPSCR'			);
                    end;
//<RefDay> ↑
					Add('WHERE EmpNCode=:hEmpNCd');
					Add('AND CorpNCode=0'		);
					Add(' ORDER BY LastDate2 DESC ,LastDate1 DESC,CarNCode');
				end;

				ParamByName('hEmpNCd').AsString :=
					mdJinjiList.FieldByName('EmpNCd').AsString;			//<RefDay-faster>

				Open(True);
				for iNo := 1 to 4 do
				begin
					if Eof then
						break;

					case iNo of
						1:
						begin
							pplLastCo1.Caption		:= GetFld('LCorpName').AsString;
							pplLastJob1.Caption		:= GetFld('LJobName').AsString;
							pplLastPost1.Caption	:= GetFld('LPostName').AsString;

							if not (GetFld('LastDate1').IsNull)
							and(GetFld('LastDate1').AsDateTime > 0) then
								pplLastDateS1.Caption := fnGetFormatDate(GetFld('LastDate1').AsDateTime);

							if not (GetFld('LastDate2').IsNull)
							and(GetFld('LastDate2').AsDateTime > 0) then
								pplLastDateE1.Caption := fnGetFormatDate(GetFld('LastDate2').AsDateTime);

							pplLastRemarks1.Caption := GetFld('LRemarks').AsString;
						end;
						2:
						begin
							pplLastCo2.Caption		:= GetFld('LCorpName').AsString;
							pplLastJob2.Caption		:= GetFld('LJobName').AsString;
						//<2010-05-20>↓
						//	pplLastPost2.Caption	:= GetFld('LRemarks').AsString;
							pplLastPost2.Caption	:= GetFld('LPostName').AsString;
						//<2010-05-20>↑

							if not (GetFld('LastDate1').IsNull)
							and(GetFld('LastDate1').AsDateTime > 0) then
								pplLastDateS2.Caption := fnGetFormatDate(GetFld('LastDate1').AsDateTime);

							if not (GetFld('LastDate2').IsNull)
							and(GetFld('LastDate2').AsDateTime > 0) then
								pplLastDateE2.Caption := fnGetFormatDate(GetFld('LastDate2').AsDateTime);

							pplLastRemarks2.Caption := GetFld('LRemarks').AsString;
						end;
						3:
						begin
							pplLastCo3.Caption		:= GetFld('LCorpName').AsString;
							pplLastJob3.Caption		:= GetFld('LJobName').AsString;
							pplLastPost3.Caption	:= GetFld('LPostName').AsString;

							if not (GetFld('LastDate1').IsNull)
							and(GetFld('LastDate1').AsDateTime > 0) then
								pplLastDateS3.Caption := fnGetFormatDate(GetFld('LastDate1').AsDateTime);

							if not (GetFld('LastDate2').IsNull)
							and(GetFld('LastDate2').AsDateTime > 0) then
								pplLastDateE3.Caption := fnGetFormatDate(GetFld('LastDate2').AsDateTime);

							pplLastRemarks3.Caption := GetFld('LRemarks').AsString;
						end;
						4:
						begin
							pplLastCo4.Caption		:= GetFld('LCorpName').AsString;
							pplLastJob4.Caption		:= GetFld('LJobName').AsString;
							pplLastPost4.Caption	:= GetFld('LPostName').AsString;

							if not (GetFld('LastDate1').IsNull)
							and(GetFld('LastDate1').AsDateTime > 0) then
								pplLastDateS4.Caption := fnGetFormatDate(GetFld('LastDate1').AsDateTime);

							if not (GetFld('LastDate2').IsNull)
							and(GetFld('LastDate2').AsDateTime > 0) then
								pplLastDateE4.Caption := fnGetFormatDate(GetFld('LastDate2').AsDateTime);

							pplLastRemarks4.Caption := GetFld('LRemarks').AsString;
						end;
					end;
					Next;
				end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'前職（歴）情報'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			Abort;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//		Proccess	: 個人所属情報
//		Name		:
//		Date		:
//		Parameter	: なし
//		Return		: なし
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000051PPrnF.fnSELECT_HAPCHG;
var
	DMQuery			: TMQuery;
	i				: Integer;

	iKenmuCnt		: Integer;
	iPosLoop,
	iMaLoop			: Integer;

	prnField		: TppLabel;
	sTarget			: String;
	bKenFirst		: Boolean;

begin
	ppTKen1.Caption		:= '';
	ppTKen2.Caption		:= '';
	ppTKen3.Caption		:= '';
	ppTKen4.Caption		:= '';
	ppTKen5.Caption		:= '';
	ppTKen6.Caption		:= '';
	ppLDept1.Caption	:= '';
	ppLDept2.Caption	:= '';
	ppLDept3.Caption	:= '';
	ppLDept4.Caption	:= '';
	ppLDept5.Caption	:= '';
	ppLDept6.Caption	:= '';
	ppLDeptDate1.Caption := '';
	ppLDeptDate2.Caption := '';
	ppLDeptDate3.Caption := '';
	ppLDeptDate4.Caption := '';
	ppLDeptDate5.Caption := '';
	ppLDeptDate6.Caption := '';
	ppLDeptStay1.Caption := '';
	ppLDeptStay2.Caption := '';
	ppLDeptStay3.Caption := '';
	ppLDeptStay4.Caption := '';
	ppLDeptStay5.Caption := '';
	ppLDeptStay6.Caption := '';
	ppLDeptRemarks1.Caption := '';
	ppLDeptRemarks2.Caption := '';
	ppLDeptRemarks3.Caption := '';
	ppLDeptRemarks4.Caption := '';
	ppLDeptRemarks5.Caption := '';
	ppLDeptRemarks6.Caption := '';
	ppSplKen1.Visible := False;
	ppSplKen2.Visible := False;
	ppSplKen3.Visible := False;
	ppSplKen4.Visible := False;
	ppSplKen5.Visible := False;
	ppSplKen6.Visible := False;

	DMQuery:=TMQuery.Create(Self);
	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);

	try
		try
			with DMQuery do
			begin
//現在所属情報-----
				Close;
				SQL.Clear;
//<RefDay> ↓
				if pPrnParam^.HapPrnSpt.iRefType > 0 then
                begin
					SQL.Add('SELECT OrderDate,'
								+ ' Remarks,'
								+ ' LongName,'
								+ ' ChgMonthsStd AS _MONTHS_DEPT');
					SQL.Add('FROM MP_HAP_HAPCHGA_STD('
								+''''+FormatDateTime('yyyy-mm-dd', pPrnParam^.HapPrnSpt.dRefDate)+''', 1)');
					SQL.Add('WHERE '
							+'     EmpNCode=:hEmpNCd'
							+' AND CorpNCode=0'
							+' AND MasterKbn=:hMAKbn'
							+' AND AddPos=0'
							+' AND DeptNCode>0');
                end
//<RefDay> ↑
				else
				begin
					SQL.Add('SELECT CHG.OrderDate,'
								+ ' CHG.Remarks,'
								+ ' MA.LongName,'
								+ ' CHG.DeptNCode,'
								//<140123>↓
								//+ ' MF_HAP_Months(CHG.OrderDate ,MF_HAP_CurEnd(CHG.EmpNCode,CHG.CorpNCode,0)) AS _MONTHS_DEPT');
	    						+ ' CASE WHEN CHG.EndDate = ''2099-12-31'' THEN'
	    						+ ' 	MF_HAP_Months(CHG.OrderDate ,MF_HAP_CurEnd(CHG.CorpNCode,CHG.EmpNCode,0))'
	    						+ ' ELSE'
	   	 						+ ' 	MF_HAP_Months(CHG.OrderDate ,CHG.EndDate)'
	    						+ ' END AS _MONTHS_DEPT');
								//<140123>↑
					SQL.Add('FROM HAPCHG CHG'
						+ ' INNER JOIN HojyoMA MA ON CHG.DeptNCode=MA.NCode '
											+	'AND CHG.MasterKbn=MA.MasterKbn');
					SQL.Add('WHERE CHG.EmpNCode=:hEmpNCd'
							+' AND CHG.CorpNCode=0'
							+' AND CHG.MasterKbn=:hMAKbn'
							+' AND CHG.AddPos=0'
							+' AND CHG.Jinsts=1'				//@@@@@
							+' AND CHG.DeptNCode>0');
                end;

				for i:=0 to 4 do
				begin
					SetFld('hEmpNCd').AsString :=
						mdJinjiList.FieldByName('EmpNCd').AsString;			//<RefDay-faster>

					case i of
						0:	SetFld('hMAKbn').AsInteger := 41;		//所属
						1:	SetFld('hMAKbn').AsInteger := 86;		//職種
						2:	SetFld('hMAKbn').AsInteger := 87;		//役職
						3:	SetFld('hMAKbn').AsInteger := 88;		//職能
						4:	SetFld('hMAKbn').AsInteger := 89;		//職位
					end;

					if not Open then
						Abort;

					if not Eof then
					begin
					//所属
						if i=0 then
						begin
							ppLODept.Caption := GetFld('LongName').AsString;

							//発令日入力あり
							if not (GetFld('OrderDate').IsNull) then
							begin
								ppLDeptDate.Caption	:= fnGetFormatDate(GetFld('OrderDate').AsDateTime);
								ppLDeptStay.Caption	:= Format('%2.2n',[	(GetFld('_MONTHS_DEPT').AsInteger div 12)+
																		(GetFld('_MONTHS_DEPT').AsInteger mod 12)*0.01	]);
							end;

							ppLDeptRemarks.Caption := GetFld('Remarks').AsString;
						end
					//職種
						else if i=1 then
						begin
							ppLJobName.Caption	:=	GetFld('LongName').AsString;
							ppLOJob.Caption		:=	GetFld('LongName').AsString;

							//発令日入力あり
							if not (GetFld('OrderDate').IsNull) then
							begin
								ppLJobDate.Caption	:= fnGetFormatDate(GetFld('OrderDate').AsDateTime);
								ppLJobStay.Caption	:= Format('%2.2n',[	(GetFld('_MONTHS_DEPT').AsInteger div 12)+
																		(GetFld('_MONTHS_DEPT').AsInteger mod 12)*0.01	]);
							end;

							ppLJobRemarks.Caption := GetFld('Remarks').AsString;
						end
					//役職
						else if i=2 then
						begin
							ppLOPost.Caption	:=	GetFld('LongName').AsString;
							ppLPostNo.Caption	:=	GetFld('LongName').AsString;

							//発令日入力あり
							if not (GetFld('OrderDate').IsNull)then
							begin
								ppLPostDate.Caption:= fnGetFormatDate(GetFld('OrderDate').AsDateTime);
								ppLPostStay.Caption:= Format('%2.2n',[	(GetFld('_MONTHS_DEPT').AsInteger div 12)+
																		(GetFld('_MONTHS_DEPT').AsInteger mod 12)*0.01	]);
							end;

							ppLPostRemarks.Caption	:= GetFld('Remarks').AsString;
						end
					//職能
						else if i=3 then
						begin
							ppLOAbility.Caption	:=	GetFld('LongName').AsString;
							ppLAbility.Caption	:=	GetFld('LongName').AsString;

							//発令日入力あり
							if(not GetFld('OrderDate').IsNull)then
							begin
								ppLAbilityDate.Caption:= fnGetFormatDate(GetFld('OrderDate').AsDateTime);
								ppLAbilityStay.Caption:= Format('%2.2n',[(GetFld('_MONTHS_DEPT').AsInteger div 12)+
																		 (GetFld('_MONTHS_DEPT').AsInteger mod 12)*0.01	]);
							end;

							ppLAbilityRemarks.Caption	:= GetFld('Remarks').AsString;
						end
					// 職位
						else if i=4 then
						begin
							ppLOWorkClass.Caption	:=	GetFld('LongName').AsString;
							ppLWorkClass.Caption	:=	GetFld('LongName').AsString;

							//発令日入力あり
							if(not GetFld('OrderDate').IsNull)then
							begin
								ppLWorkDate.Caption:= fnGetFormatDate(GetFld('OrderDate').AsDateTime);
								ppLWorkStay.Caption:= Format('%2.2n',[	(GetFld('_MONTHS_DEPT').AsInteger div 12)+
																		(GetFld('_MONTHS_DEPT').AsInteger mod 12)*0.01	]);
							end;

							ppLWorkRemarks.Caption	:= GetFld('Remarks').AsString;
						end;
					end;
					Close;
				end;

// ST ADD 等級号俸 <20110418>
				Close;
				SQL.Clear;

				if pPrnParam^.HapPrnSpt.iRefType > 0 then
                begin
					SQL.Add('SELECT OrderDate,'
								+ ' Remarks,'
								+ ' DeptNCode,'
								+ ' ChgMonthsStd AS _MONTHS_DEPT');
					SQL.Add('FROM MP_HAP_HAPCHGA_STD('
								+''''+FormatDateTime('yyyy-mm-dd', pPrnParam^.HapPrnSpt.dRefDate)+''', 1)');
					SQL.Add('WHERE EmpNCode = :hEmpNCd'
							+' AND CorpNCode=0'
							+' AND MasterKbn= 92'
							+' AND AddPos=0'
							+' AND DeptNCode>0');
                end
				else
				begin
					SQL.Add('SELECT'
								+ ' CHG.OrderDate,'
								+ ' CHG.Remarks,'
								+ ' CHG.DeptNCode,'
								//<140123>↓
								//+ ' MF_HAP_Months(CHG.OrderDate ,MF_HAP_CurEnd(CHG.EmpNCode,CHG.CorpNCode,0)) AS _MONTHS_DEPT'
    							+ ' CASE WHEN CHG.EndDate = ''2099-12-31'' THEN'
    							+ ' 	MF_HAP_Months(CHG.OrderDate ,MF_HAP_CurEnd(CHG.CorpNCode,CHG.EmpNCode,0))'
	   							+ ' ELSE'
    							+ ' 	MF_HAP_Months(CHG.OrderDate ,CHG.EndDate)'
    							+ ' END AS _MONTHS_DEPT'
								//<140123>↑
						+ ' FROM'
								+ ' HAPCHG CHG'
						+ ' WHERE'
								+ '     CHG.EmpNCode  = :hEmpNCd'
								+ ' AND CHG.CorpNCode = 0'
								+ ' AND CHG.MasterKbn = 92'
								+ ' AND CHG.AddPos=0'
								+ ' AND CHG.Jinsts=1'
								+ ' AND CHG.DeptNCode>0');
                end;

				SetFld('hEmpNCd').AsString := mdJinjiList.FieldByName('EmpNCd').AsString;			//<RefDay-faster>

				if not Open then
					Abort;

				if pPrnParam^.HapPrnSpt.iRefType > 0 then
				begin
					if GetFld('DeptNCode').AsInteger > 0 then
					begin
						ppLRank.Caption		:= GetFld('DeptNCode').AsString;
						ppLORank.Caption	:= GetFld('DeptNCode').AsString;
					end
					else
					begin
						ppLRank.Caption		:= '';
						ppLORank.Caption	:= '';
	                end;
                end;
               

				ppLRankRemarks.Caption	:= GetFld('Remarks').AsString;
				if not GetFld('OrderDate').IsNull then
				begin
					ppLRankDate.Caption	:= fnGetFormatDate(GetFld('OrderDate').AsDateTime);
					ppLRankStay.Caption	:= Format('%2.2n',[	(GetFld('_MONTHS_DEPT').AsInteger div 12)+
														(GetFld('_MONTHS_DEPT').AsInteger mod 12)*0.01	]);
				end;
// ED ADD <20110418>

//兼務所属情報-----
				Close;
				SQL.Clear;

				if pPrnParam^.HapPrnSpt.iRefType > 0 then
                begin
					SQL.Add('SELECT OrderDate,'
								+ ' Remarks,'
								+ ' LongName,'
								+ ' DeptNCode,'
								+ ' ChgMonthsStd AS _MONTHS_DEPT');
					SQL.Add('FROM MP_HAP_HAPCHGA_STD('
								+''''+FormatDateTime('yyyy-mm-dd', pPrnParam^.HapPrnSpt.dRefDate)+''', 1)');
					SQL.Add('WHERE EmpNCode=:hEmpNCd'
							+' AND CorpNCode=0'
							+' AND MasterKbn=:hMAKbn'
							+' AND AddPos=:hAddPos'
							+' AND DeptNCode>0');
                end
				else
				begin
					SQL.Add('SELECT CHG.OrderDate,'
								+ ' CHG.Remarks,'
								+ ' MA.LongName,'
								+ ' CHG.DeptNCode,'
								+ ' MF_HAP_Months(CHG.OrderDate ,MF_HAP_CurEnd(CHG.EmpNCode,CHG.CorpNCode,0)) AS _MONTHS_DEPT');
					SQL.Add('FROM HAPCHG CHG'
						+ ' INNER JOIN HojyoMA MA ON CHG.DeptNCode=MA.NCode'
											+ ' AND CHG.MasterKbn=MA.MasterKbn');
					SQL.Add('WHERE CHG.EmpNCode=:hEmpNCd'
							+' AND CHG.CorpNCode=0'
							+' AND CHG.MasterKbn=:hMAKbn'
							+' AND CHG.AddPos=:hAddPos'
							+' AND CHG.Jinsts=1'				//@@@@@
							+' AND CHG.DeptNCode>0');
                end;

				//兼務は1～9まで存在する。
				//そのうち、AddPos順に取得して6個までを表示する。
				iKenmuCnt := 1;

				for iPosLoop:=1 to 20 {9} do		//<2011-06-20>
				begin
					if iKenmuCnt > 6 then		//6個まで
						Break;

					bKenFirst := False;

					for iMaLoop := 0 to 4 do
					begin
						if iKenmuCnt > 6 then	//6個まで
							Break;

						SetFld('hEmpNCd').AsString	:=	mdJinjiList.FieldByName('EmpNCd').AsString;			//<RefDay-faster>
						SetFld('hAddPos').AsInteger	:=	iPosLoop;

						case iMaLoop of
							0: begin SetFld('hMAKbn').AsInteger := 41; sTarget := '所属'; end;
							1: begin SetFld('hMAKbn').AsInteger := 87; sTarget := '役職'; end;
							2: begin SetFld('hMAKbn').AsInteger := 88; sTarget := '職能'; end;
							3: begin SetFld('hMAKbn').AsInteger := 86; sTarget := '職種'; end;
							4: begin SetFld('hMAKbn').AsInteger := 89; sTarget := '職位'; end;
						end;

						if not Open then
							Abort;

						if not Eof then
						begin
							//名称
							prnField := (MjsFindCtrl(self,'ppTKen'+IntToStr(iKenmuCnt)) As TppLabel);

							if bKenFirst = False then
						//<2011-06-20>↓
						//		prnField.Caption := '（兼' + IntToStr(iPosLoop) +'）' + sTarget

							begin
								prnField.Caption := '（兼' + IntToStr(iPosLoop) +'）';
								if iPosLoop < 10 then
									prnField.Caption := prnField.Caption + ' ';
								prnField.Caption := prnField.Caption + sTarget;
							end
						//<2011-06-20>↑
							else
								prnField.Caption := '　　' + '  ' +'　' + sTarget;	//<2011-06-20>半角SP追加


							//名称
							prnField := (MjsFindCtrl(self,'ppLDept'+IntToStr(iKenmuCnt)) As TppLabel);
							prnField.Caption := GetFld('LongName').AsString;

							//発令日・滞留年数
							if not (GetFld('OrderDate').IsNull) then
							begin
								prnField := (MjsFindCtrl(self,'ppLDeptDate'+IntToStr(iKenmuCnt)) As TppLabel);
								prnField.Caption := fnGetFormatDate(GetFld('OrderDate').AsDateTime);

								prnField := (MjsFindCtrl(self,'ppLDeptStay'+IntToStr(iKenmuCnt)) As TppLabel);
								prnField.Caption :=	Format('%2.2n',[	(GetFld('_MONTHS_DEPT').AsInteger div 12)+
																		(GetFld('_MONTHS_DEPT').AsInteger mod 12)*0.01	]);
							end;

							//発令事由
							prnField := (MjsFindCtrl(self,'ppLDeptRemarks'+IntToStr(iKenmuCnt)) As TppLabel);
							prnField.Caption := GetFld('Remarks').AsString;

							//「：」ラベル
							prnField := (MjsFindCtrl(self,'ppSplKen'+IntToStr(iKenmuCnt)) As TppLabel);
							prnField.Visible := True;

							Inc(iKenmuCnt);
							bKenFirst := True;
						end;

						Close;
					end;
				end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'個人所属情報'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			Abort;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//		Proccess	: 個人雇用情報
//		Name		:
//		Date		:
//		Parameter	: なし
//		Return		: なし
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000051PPrnF.fnSELECT_HAPSEN;
var
	DMQuery	: TMQuery;
	iEngNCd	: Integer;

	iType	: Integer;
begin
	DMQuery:=TMQuery.Create(Self);
	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);

	iEngNCd := -1;

	try
		try
			with DMQuery do
			begin
	//条件① CompSt=1 & CompEd=0
				Close;
				SQL.Clear;
				SQL.Add('SELECT EngNCode');
//<RefDay> ↓
				if pPrnParam^.HapPrnSpt.iRefType > 0 then
				begin
					//基準日時点で完了していない雇用契約
					SQL.Add('FROM MP_HAP_HAPSEN_STD('''+FormatDateTime('yyyy-mm-dd', pPrnParam^.HapPrnSpt.dRefDate)+''', 1)');
					SQL.Add('WHERE ');
				end
				else
				begin
					SQL.Add('FROM HAPSEN ');
					SQL.Add('WHERE CompSt=1 AND CompEd=0 AND');
				end;
//<RefDay> ↑
				SQL.Add('EmpNCode=:hEmpNCode AND CorpNCode=0'				);

				SetFld('hEmpNCode').AsString := mdJinjiList.FieldByName('EmpNCd').AsString;			//<RefDay-faster>

				if not Open then
					Abort;

				if not Eof then
					iEngNCd := GetFld('EngNCode').AsInteger
				else
				begin
	//条件② CompSt=1 & EngDateSt=最新
					Close;
					SQL.Clear;
					SQL.Add('SELECT EngNCode');
//<RefDay> ↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then
					begin
						//基準日時点で存在する雇用契約（完了含む）
						SQL.Add('FROM MP_HAP_HAPSEN_STD('''+FormatDateTime('yyyy-mm-dd', pPrnParam^.HapPrnSpt.dRefDate)+''', 0)');
					end
					else						
						SQL.Add('FROM HAPSEN ');
//<RefDay> ↑
					SQL.Add('WHERE CompSt=1');
					SQL.Add('AND EmpNCode=:hempNCode AND CorpNCode=0'	);
					SQL.Add('Order By EngDateSt DESC'					);

					SetFld('hEmpNCode').AsString := mdJinjiList.FieldByName('EmpNCd').AsString;			//<RefDay-faster>

					if not Open then
						Abort;

					if not Eof then
						iEngNCd := GetFld('EngNCode').AsInteger
					else
					begin
	//条件③ EngDateSt=最新
						SQL.Clear;
						SQL.Add('SELECT EngNCode');
//<RefDay> ↓
						if pPrnParam^.HapPrnSpt.iRefType > 0 then
						begin
						//基準日時点で存在する雇用契約（完了含む）
							SQL.Add('FROM MP_HAP_HAPSEN_STD('''+FormatDateTime('yyyy-mm-dd', pPrnParam^.HapPrnSpt.dRefDate)+''', 0)');
						end
						else
							SQL.Add('FROM HAPSEN'				);
//<RefDay> ↑
						SQL.Add('WHERE EmpNCode=:hempNCode AND CorpNCode=0'	);
						SQL.Add('Order By EngDateSt DESC'					);

						SetFld('hEmpNCode').AsString := mdJinjiList.FieldByName('EmpNCd').AsString;			//<RefDay-faster>

						if not Open then
							Abort;

						if not Eof then
							iEngNCd := GetFld('EngNCode').AsInteger

					end;
				end;

				Close;

			//該当条件データなし
				if iEngNCd = -1 then
					Exit;

				SQL.Clear;
//				SQL.Add('SELECT EngDateSt,EngDateEd,EngType FROM HAPSEN');
//				SQL.Add('WHERE EngNCode=:hEngNCd'						);
				SQL.Add(	'SELECT ' +
								'EngDateSt,' +
								'EngDateEd,' +
								'EngType ' +
							'FROM ' +
								'HAPSEN ' +
							'WHERE ' +
								'EmpNCode = :hEmpNCode ' +
								'AND ' +
								'EngNCode = :hEngNCd ' +
								'AND ' +
								'CorpNCode= 0 '	);

				SetFld('hEmpNCode').AsString := mdJinjiList.FieldByName('EmpNCd').AsString;			//<RefDay-faster>
				SetFld('hEngNCd').AsInteger := iEngNCd;

				if not Open then
					Abort;

				if Eof then
					Abort;

				//雇用区分
				iType := GetFld('EngType').AsInteger;

				//雇用期間(自)
				if not GetFld('EngDateSt').IsNull then
					mdJinjiList.FieldByName('KoyouStart').AsString := fnGetFormatDate(GetFld('EngDateSt').AsDatetime);

				//雇用期間(至)
				if not GetFld('EngDateEd').IsNull then
					mdJinjiList.FieldByName('KoyouEnd').AsString := fnGetFormatDate(GetFld('EngDateEd').AsDatetime);

				Close;
				SQL.Clear;
				SQL.Add('SELECT EngName FROM HAPEI WHERE EngType=:hEngType');

				SetFld('hEngType').AsInteger := iType;

				if not Open then
					Abort;

				if not Eof then
					mdJinjiList.FieldByName('KoyouKbn').AsString := GetFld('EngName').AsString;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'個人雇用情報'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			Abort;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//*		Proccess	:	ファイル出力に必要なTitle･Filed設定
//*		Name		:
//*		Date		:	2002/11/27
//*		Parameter	:	TMjsPrnSupport
//*		Return		:
//*		History		:
//**********************************************************************
procedure THAP000051PPrnF.fnSetFileOut(CmnInfo:TMjsPrnSupport);
var
	sTitle		: TStringList;
	sMemFld		: TStringList;
	rcMsg		: TMjsMsgRec;
	i			: Integer;
	s			: String;
begin
	sTitle	:= TStringList.Create;	// ファイル出力用リスト(タイトル)作成
	sMemFld	:= TStringList.Create;	// ファイル
	sTitle.Add(fnGetItemName(100100, '社員No'));
	sTitle.Add(fnGetItemName(105801, '所属No'));
	sTitle.Add(fnGetItemName(105802, '所属'));
	sTitle.Add(fnGetItemName(100403, 'フリガナ'));
	sTitle.Add(fnGetItemName(100203, '氏名'));
	sTitle.Add(fnGetItemName(101100, '生年月日'));
	sTitle.Add(fnGetItemName(101101, '年齢'));
	sTitle.Add(fnGetItemName(101000, '性別'));
	sTitle.Add(fnGetItemName(101200, '血液型'));
	sTitle.Add(fnGetItemName(101600, '電話番号'));
	sTitle.Add(fnGetItemName(101300, '郵便番号'));
	sTitle.Add(fnGetItemName(101501, '住所上段カナ'));
	sTitle.Add(fnGetItemName(101401, '現住所上段'));
	sTitle.Add(fnGetItemName(101502, '住所下段カナ'));
	sTitle.Add(fnGetItemName(101402, '現住所下段'));
	sTitle.Add(fnGetItemName(105200, '入社年月日'));
	sTitle.Add(fnGetItemName(105201, '勤続年数'));
	sTitle.Add(fnGetItemName(105300, '雇用(自)'));
	sTitle.Add(fnGetItemName(105301, '雇用(至)'));
	sTitle.Add(fnGetItemName(105511, '休職理由'));
	sTitle.Add(fnGetItemName(105711, '退職理由'));

	With mdJinjiList.FieldDefs do
	begin
		for i := 0 to Count-3 do
		begin
			s := mdJinjiList.FieldDefs.Items[i].Name;
			sMemFld.Add(s);
		end;
	end;
	if MjsFileOut(mdJinjiList, sMemFld, sTitle, CmnInfo, pAppRec) = -1 then

	begin
	//	ファイル出力不可
		GetMsg(rcMsg,30,2);
		with rcMsg do
			MjsMessageBoxEx(Self,sMsg,sTitle,icontype,btntype,btndef,LogType);
	end;
	sTitle.Free;
	sMemFld.Free;
end;
//**********************************************************************
//*		Proccess	: 項目名称（ラベル）の設定
//*		Name		:
//*		Date		: 2002/11/27
//*		Parameter	:
//*		Return		:
//*		History		:
//*					:	※「社員No/所属No」ラベルの合成について
//*					:
//*					:	所属Noのアイテムコードは、通常通りTagより取得する。
//*					:	社員Noのアイテムコードは、固定値でソースに記述する。
//**********************************************************************
procedure THAP000051PPrnF.fnSetLabel();
var
	sWork,
	sWork2	: String;
begin
	ppTSaiyou.Caption		:= fnGetItemName(ppTSaiyou.Tag, ppTSaiyou.Caption);
	ppTSyoukai.Caption		:= fnGetItemName(ppTSyoukai.Tag, ppTSyoukai.Caption);
	ppTSyoukaiZoku.Caption	:= fnGetItemName(ppTSyoukaiZoku.Tag, ppTSyoukaiZoku.Caption);
	ppTHomeCity.Caption		:= fnGetItemName(ppTHomeCity.Tag, ppTHomeCity.Caption);
	ppTNationality.Caption	:= fnGetItemName(ppTNationality.Tag, ppTNationality.Caption);
	ppTShumi.Caption		:= fnGetItemName(ppTShumi.Tag, ppTShumi.Caption);
	ppTShumi2.Caption		:= fnGetItemName(ppTShumi2.Tag, ppTShumi2.Caption);
	ppTTokugi.Caption		:= fnGetItemName(ppTTokugi.Tag, ppTTokugi.Caption);
	ppTTokugi2.Caption		:= fnGetItemName(ppTTokugi2.Tag, ppTTokugi2.Caption);
	ppTLanguage.Caption		:= fnGetItemName(ppTLanguage.Tag, ppTLanguage.Caption);
	ppTGakureki.Caption		:= fnGetItemName(ppTGakureki.Tag, ppTGakureki.Caption);
	ppTSotuTai.Caption		:= fnGetItemName(ppTSotuTai.Tag, ppTSotuTai.Caption);
	ppTSotugiyouNen.Caption	:= fnGetItemName(ppTSotugiyouNen.Tag, ppTSotugiyouNen.Caption);
	ppTGakubu.Caption		:= fnGetItemName(ppTGakubu.Tag, ppTGakubu.Caption);
	ppTGatukouName.Caption	:= fnGetItemName(ppTGatukouName.Tag, ppTGatukouName.Caption);
	ppTGakubuKubun.Caption	:= fnGetItemName(ppTGakubuKubun.Tag, ppTGakubuKubun.Caption);
	ppTGatukaName.Caption	:= fnGetItemName(ppTGatukaName.Tag, ppTGatukaName.Caption);
	ppTKumiai.Caption		:= fnGetItemName(ppTKumiai.Tag, ppTKumiai.Caption);
	ppTKumiaiS.Caption		:= fnGetItemName(ppTKumiaiS.Tag, ppTKumiaiS.Caption);
	ppTKumiaiE.Caption		:= fnGetItemName(ppTKumiaiE.Tag, ppTKumiaiE.Caption);
	ppTRemarks.Caption		:= fnGetItemName(ppTRemarks.Tag, ppTRemarks.Caption);
	ppTBunrui1.Caption		:= fnGetItemName(ppTBunrui1.Tag, ppTBunrui1.Caption);
	ppTBunrui2.Caption		:= fnGetItemName(ppTBunrui2.Tag, ppTBunrui2.Caption);
	ppTBunrui3.Caption		:= fnGetItemName(ppTBunrui3.Tag, ppTBunrui3.Caption);
	ppTKubunYobi1.Caption	:= fnGetItemName(ppTKubunYobi1.Tag, ppTKubunYobi1.Caption);
	ppTKubunYobi2.Caption	:= fnGetItemName(ppTKubunYobi2.Tag, ppTKubunYobi2.Caption);
	ppTKubunYobi3.Caption	:= fnGetItemName(ppTKubunYobi3.Tag, ppTKubunYobi3.Caption);
	ppTKubunYobi4.Caption	:= fnGetItemName(ppTKubunYobi4.Tag, ppTKubunYobi4.Caption);
	ppTKubunYobi5.Caption	:= fnGetItemName(ppTKubunYobi5.Tag, ppTKubunYobi5.Caption);

	sWork	:= fnGetItemName(ppTNo.Tag, ppTNo.Caption);	//所属No
	sWork2	:= fnGetItemName(100100, '社員No');			//社員No

	if AnsiCompareStr(sWork, ppTNo.Caption) <> 0 then
		ppTNo.Caption := sWork2 + '/' + sWork;

	sWork := fnGetItemName(ppTNyuusya1.Tag, ppTNyuusya1.Caption);
	if AnsiCompareStr(sWork, ppTNyuusya1.Caption) <> 0 then
		ppTNyuusya1.Caption := '(' + sWork + ')';

	ppTDeptName.Caption		:= fnGetItemName(ppTDeptName.Tag, ppTDeptName.Caption);
	ppTName.Caption			:= fnGetItemName(ppTName.Tag, ppTName.Caption);
	ppTBirth.Caption		:= fnGetItemName(ppTBirth.Tag, ppTBirth.Caption);
	ppTNyuusya.Caption		:= fnGetItemName(ppTNyuusya.Tag, ppTNyuusya.Caption);
	ppTSeibetsu.Caption		:= fnGetItemName(ppTSeibetsu.Tag, ppTSeibetsu.Caption);
	ppTKetsueki.Caption		:= fnGetItemName(ppTKetsueki.Tag, ppTKetsueki.Caption);
	ppTPhone.Caption		:= fnGetItemName(ppTPhone.Tag, ppTPhone.Caption);
	ppTPhone1.Caption		:= fnGetItemName(ppTPhone1.Tag, ppTPhone1.Caption);
	ppTPhone2.Caption		:= fnGetItemName(ppTPhone2.Tag, ppTPhone2.Caption);
	ppTPhone3.Caption		:= fnGetItemName(ppTPhone3.Tag, ppTPhone3.Caption);
	ppTPhone4.Caption		:= fnGetItemName(ppTPhone4.Tag, ppTPhone4.Caption);
	ppTYuubinNo.Caption		:= fnGetItemName(ppTYuubinNo.Tag, ppTYuubinNo.Caption);
	ppTYuubinNo1.Caption	:= fnGetItemName(ppTYuubinNo1.Tag, ppTYuubinNo1.Caption);
	ppTYuubinNo2.Caption	:= fnGetItemName(ppTYuubinNo2.Tag, ppTYuubinNo2.Caption);
	ppTYuubinNo3.Caption	:= fnGetItemName(ppTYuubinNo3.Tag, ppTYuubinNo3.Caption);
	ppTYuubinNo4.Caption	:= fnGetItemName(ppTYuubinNo4.Tag, ppTYuubinNo4.Caption);
	ppTAddress1.Caption		:= fnGetItemName(ppTAddress1.Tag, ppTAddress1.Caption);
	ppTAddress2.Caption		:= fnGetItemName(ppTAddress2.Tag, ppTAddress2.Caption);
	ppTAddress11.Caption	:= fnGetItemName(ppTAddress11.Tag, ppTAddress11.Caption);
	ppTAddress12.Caption	:= fnGetItemName(ppTAddress12.Tag, ppTAddress12.Caption);
	ppTAddress21.Caption	:= fnGetItemName(ppTAddress21.Tag, ppTAddress21.Caption);
	ppTAddress22.Caption	:= fnGetItemName(ppTAddress22.Tag, ppTAddress22.Caption);
	ppTAddress31.Caption	:= fnGetItemName(ppTAddress31.Tag, ppTAddress31.Caption);
	ppTAddress32.Caption	:= fnGetItemName(ppTAddress32.Tag, ppTAddress32.Caption);
	ppTAddress41.Caption	:= fnGetItemName(ppTAddress41.Tag, ppTAddress41.Caption);
	ppTAddress42.Caption	:= fnGetItemName(ppTAddress42.Tag, ppTAddress42.Caption);
	ppTKoyou.Caption		:= fnGetItemName(ppTKoyou.Tag, ppTKoyou.Caption);
	ppTKoyouStart.Caption	:= fnGetItemName(ppTKoyouStart.Tag, ppTKoyouStart.Caption);
	ppTKoyouEnd.Caption		:= fnGetItemName(ppTKoyouEnd.Tag, ppTKoyouEnd.Caption);
	ppTRestJiyuu.Caption	:= fnGetItemName(ppTRestJiyuu.Tag, ppTRestJiyuu.Caption);
	ppTRetireJiyuu.Caption	:= fnGetItemName(ppTRetireJiyuu.Tag, ppTRetireJiyuu.Caption);
	ppTEmpRomaji.Caption	:= fnGetItemName(ppTEmpRomaji.Tag, ppTEmpRomaji.Caption);
	ppTEmpRomaji2.Caption	:= fnGetItemName(ppTEmpRomaji2.Tag, ppTEmpRomaji2.Caption);
	ppTJyuKbn.Caption		:= fnGetItemName(ppTJyuKbn.Tag, ppTJyuKbn.Caption);
	ppTNyuukyo.Caption		:= fnGetItemName(ppTNyuukyo.Tag, ppTNyuukyo.Caption);
	ppTKeitai.Caption		:= fnGetItemName(ppTKeitai.Tag, ppTKeitai.Caption);
	ppTEMail.Caption		:= fnGetItemName(ppTEMail.Tag, ppTEMail.Caption);
	ppTFAX.Caption			:= fnGetItemName(ppTFAX.Tag, ppTFAX.Caption);
	ppTFAX1.Caption			:= fnGetItemName(ppTFAX1.Tag, ppTFAX1.Caption);
	ppTZaiKbn.Caption		:= fnGetItemName(ppTZaiKbn.Tag, ppTZaiKbn.Caption);
	ppTPayKbn.Caption		:= fnGetItemName(ppTPayKbn.Tag, ppTPayKbn.Caption);
	ppTQyoCalc.Caption		:= fnGetItemName(ppTQyoCalc.Tag, ppTQyoCalc.Caption);
	ppTShoCalc.Caption		:= fnGetItemName(ppTShoCalc.Tag, ppTShoCalc.Caption);
	ppTNenCalc.Caption		:= fnGetItemName(ppTNenCalc.Tag, ppTNenCalc.Caption);
	ppTNenKbn.Caption		:= fnGetItemName(ppTNenKbn.Tag, ppTNenKbn.Caption);
	ppTEmpKbn.Caption		:= fnGetItemName(ppTEmpKbn.Tag, ppTEmpKbn.Caption);
	ppTJob.Caption			:= fnGetItemName(ppTJob.Tag, ppTJob.Caption);
	ppTWork.Caption			:= fnGetItemName(ppTWork.Tag, ppTWork.Caption);
	ppTPost.Caption			:= fnGetItemName(ppTPost.Tag, ppTPost.Caption);
	ppTAbility.Caption		:= fnGetItemName(ppTAbility.Tag, ppTAbility.Caption);
	ppTRank.Caption			:= fnGetItemName(ppTRank.Tag, ppTRank.Caption);

	
	ppTFurigana.Caption		:= fnGetItemName(ppTFurigana.Tag, ppTFurigana.Caption);
	ppTAddFuri1.Caption		:= fnGetItemName(ppTAddFuri1.Tag, ppTAddFuri1.Caption);
	ppTAddFuri2.Caption		:= fnGetItemName(ppTAddFuri2.Tag, ppTAddFuri2.Caption);
//<130718>↓
	ppTName1.Caption		:= fnGetItemName(ppTName1.Tag, ppTName1.Caption);
	ppTName2.Caption		:= fnGetItemName(ppTName2.Tag, ppTName2.Caption);
	ppTHosNameKana1.Caption	:= fnGetItemName(ppTHosNameKana1.Tag, ppTHosNameKana1.Caption);
	ppTName3.Caption		:= fnGetItemName(ppTName3.Tag, ppTName3.Caption);
	ppTHosNameKana2.Caption	:= fnGetItemName(ppTHosNameKana2.Tag, ppTHosNameKana2.Caption);
	ppTRenNameKana.Caption	:= fnGetItemName(ppTRenNameKana.Tag, ppTRenNameKana.Caption);
	ppTRenMobile.Caption	:= fnGetItemName(ppTRenMobile.Tag, ppTRenMobile.Caption);
	ppTRenUpdate.Caption	:= fnGetItemName(ppTRenUpdate.Tag, ppTRenUpdate.Caption);
	ppTHosMobile1.Caption	:= fnGetItemName(ppTHosMobile1.Tag, ppTHosMobile1.Caption);
	ppTHosMobile2.Caption	:= fnGetItemName(ppTHosMobile2.Tag, ppTHosMobile2.Caption);
	ppTHosUpdate1.Caption	:= fnGetItemName(ppTHosUpdate1.Tag, ppTHosUpdate1.Caption);
	ppTHosUpdate2.Caption	:= fnGetItemName(ppTHosUpdate2.Tag, ppTHosUpdate2.Caption);
//<130718>↑
	ppLItemName02.Caption	:= fnGetItemName(ppLItemName02.Tag, ppLItemName02.Caption);
	ppLItemName05.Caption	:= fnGetItemName(ppLItemName05.Tag, ppLItemName05.Caption);
	ppLItemName07.Caption	:= fnGetItemName(ppLItemName07.Tag, ppLItemName07.Caption);
	ppTTanshinKbn.Caption	:= fnGetItemName(ppTTanshinKbn.Tag, ppTTanshinKbn.Caption);
	ppTHosZoku1.Caption		:= fnGetItemName(ppTHosZoku1.Tag, ppTHosZoku1.Caption);
	ppTHosZoku2.Caption		:= fnGetItemName(ppTHosZoku2.Tag, ppTHosZoku2.Caption);
	ppTSCorpName.Caption	:= fnGetItemName(ppTSCorpName.Tag, ppTSCorpName.Caption);
	ppTSDeptName.Caption	:= fnGetItemName(ppTSDeptName.Tag, ppTSDeptName.Caption);
	ppTSPostName.Caption	:= fnGetItemName(ppTSPostName.Tag, ppTSPostName.Caption);
	ppTGroupEnter.Caption	:= fnGetItemName(ppTGroupEnter.Tag, ppTGroupEnter.Caption);	//<140722>
end;


//<RefDay> ↓
//**********************************************************************
//		Proccess	:基準日 - 個人別計算区分
//		Date		:2020/05/01
//		Parameter	:
//		Return		:
//		History		:
//**********************************************************************
procedure THAP000051PPrnF.fnGetHAPSCF_STD;
var
	DMQuery	: TMQuery;
begin
	DMQuery := TMQuery.Create(Self);
	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);
	try
		try
			with DMQuery do
			begin
				Close;
				with SQL do
				begin
					Clear();
					Add(' SELECT CalcItemCode,CalcFlagLongName');
					Add(' FROM MP_HAP_HAPSCF_STD('
						+''''+FormatDateTime('yyyy-mm-dd', pPrnParam^.HapPrnSpt.dRefDate)+''')');
					Add(' WHERE EmpNCode = :EmpNCd AND CorpNCode = 0');
				end;

				ParamByName('EmpNCd').AsString :=
					mdJinjiList.FieldByName('EmpNCd').AsString;		//<RefDay-faster>

				Open(True);

				While not EOF do
				begin
                    case GetFld('CalcItemCode').AsInteger of
                        //給与計算
                        110200:
                            ppLQyoKbn.Caption := GetFld('CalcFlagLongName').AsString;
                        //賞与計算
                        110300:
                            ppLShoKbn.Caption := GetFld('CalcFlagLongName').AsString;
                        //年調計算
                        110400:
                            ppLNenKbn.Caption := GetFld('CalcFlagLongName').AsString;
                        //住居区分
                        112000:
                            ppLHouse.Caption := GetFld('CalcFlagLongName').AsString;
                        //語学
                        145400:
                            ppLLanguage.Caption := GetFld('CalcFlagLongName').AsString;
                        //出身地
                        145500:
                            ppLHomeCity.Caption := GetFld('CalcFlagLongName').AsString;
                        //国籍区分
                        145600:
                            ppLNationality.Caption := GetFld('CalcFlagLongName').AsString;
                        //分類区分1
                        110600:
                                ppLBunrui1.Caption := GetFld('CalcFlagLongName').AsString;
                        //分類区分2
                        110700:
                            ppLBunrui2.Caption := GetFld('CalcFlagLongName').AsString;
                        //分類区分3
                        110800:
                            ppLBunrui3.Caption := GetFld('CalcFlagLongName').AsString;
                        //予備区分1
                        112700:
                            ppLKubunYobi1.Caption := GetFld('CalcFlagLongName').AsString;
                        //予備区分2
                        112800:
                            ppLKubunYobi2.Caption := GetFld('CalcFlagLongName').AsString;
                        //予備区分3
                        112900:
                            ppLKubunYobi3.Caption := GetFld('CalcFlagLongName').AsString;
                        //予備区分4
                        113000:
                            ppLKubunYobi4.Caption := GetFld('CalcFlagLongName').AsString;
                        //予備区分5
                        113100:
                            ppLKubunYobi5.Caption := GetFld('CalcFlagLongName').AsString;
                    end;
					Next;
                end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self, '項目コード'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			Abort;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;


//**********************************************************************
//		Proccess	:基準日日付編集
//		Name		:
//		Date		:5/28
//		Parameter	:日付
//		Return		:文字列
//		History		:
//**********************************************************************
function THAP000051PPrnF.fnGetSTDFormatDate(dDate : TDateTime): String;
begin
	Result := '';
	if dDate = 0 then
		Exit;

	if m_HAPM3.CalendarKbn = 1 then
	begin
		Result :=	FormatDateTime('gg', dDate) +
						fnGetPrintYMD(dDate, 1) + '年' +
						fnGetPrintYMD(dDate, 2) + '月' +
						fnGetPrintYMD(dDate, 3) + '日 現在' ;
	end
	else
	begin
		Result :=	FormatDateTime('YYYY', dDate) + '年' +
						  fnGetPrintYMD(dDate, 2) + '月' +
						  fnGetPrintYMD(dDate, 3) + '日 現在' ;
	end;
end;
//<RefDay> ↑

//<RefDay-faster> ↓
//***************************************************************************
//		Proccess	:基準日 - ヘッダ項目SELECT
//		Date		:2020/05/20
//		Parameter	:
//		Return		:
//		History		:
//					:CPU負荷がかかりすぎたのでSELECT分割
//**********************************************************************
procedure THAP000051PPrnF.fnHeaderSecondSELECT;
var
	DMQuery	: TMQuery;
begin
	DMQuery := TMQuery.Create(Self);
	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);
	try
		try
			with DMQuery do
			begin
				Close;
				with SQL do
				begin
					Clear();
					Add('SELECT');
					Add(' SC.NCode');
					Add(',SC.CorpNCode');
					Add(',MS.Seibetsu');										//性別
					Add(',MS.Ketueki');											//血液型
					if pPrnParam^.HapPrnSpt.iRefType > 0 then
					begin
						Add(',GEN.CalcFlag AS SeibetsuStd');					//性別
						Add(',GEN.EmpNCode AS SeibetsuStdEmp');					//性別登録判定用社員No
						Add(',BLD.CalcFlag AS KetuekiStd');						//血液型
						Add(',BLD.EmpNCode AS KetuekiStdEmp');					//血液型登録判定用社員No
                    end;
//<RefDay> ↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then
					begin
						Add(',ADDSTD.YuubinNo1 AS YuubinNo1'	);				//郵便番号
						Add(',ADDSTD.YuubinNo2 AS YuubinNo2'	);				//郵便番号
						Add(',ADDSTD.Add1Kana  AS Address1Kana'	);				//住所上段カナ
						Add(',ADDSTD.Add1      AS Address1'		);				//住所上段
						Add(',ADDSTD.Add2Kana  AS Address2Kana'	);				//住所下段カナ
						Add(',ADDSTD.Add2      AS Address2'		);				//住所下段
                    end
//<RefDay> ↑
					else
					begin
                        Add(',MS.YuubinNo1');									//郵便番号
                        Add(',MS.YuubinNo2');									//郵便番号
                        Add(',MS.Address1Kana');								//住所上段カナ
                        Add(',MS.Address1');									//住所上段
                        Add(',MS.Address2Kana');								//住所下段カナ
                        Add(',MS.Address2');									//住所下段
                    end;

					Add('FROM');
					Add(' HAPSC SC ');

					Add('INNER JOIN');
					Add(' MV_HAP_CMNMOS AS MS');
					Add(' ON');
					Add(' MS.NCode = :EmpNCd');

					if pPrnParam^.HapPrnSpt.iRefType > 0 then
					begin
					//HAPSCF
						//性別
						Add('LEFT JOIN');
						Add(' MP_HAP_HAPSCF_STD(:RefDate,101000) AS GEN');
						Add('  ON');
						Add('  GEN.EmpNCode = :EmpNCd');
						Add('  AND');
						Add('  SC.CorpNCode = GEN.CorpNCode');
						//血液型
						Add('LEFT JOIN');
						Add(' MP_HAP_HAPSCF_STD(:RefDate,101200) AS BLD');
						Add('  ON');
						Add('  BLD.EmpNCode = :EmpNCd');
						Add('  AND');
						Add('  SC.CorpNCode = BLD.CorpNCode');


                        //ADD_HIS
                        Add('LEFT JOIN');
                        Add(' MP_HAP_HAPADD_STD(:RefDate) AS ADDSTD');
                        Add('  ON');
                        Add('  ADDSTD.EmpNCode  = :EmpNCd');
                        Add('  AND');
                        Add('  SC.CorpNCode = ADDSTD.CorpNCode');
                    end;
					Add('WHERE SC.NCode     = :EmpNCd');
					Add('AND   SC.CorpNCode = 0');
				end;

				ParamByName('EmpNCd').AsString :=
					mdJinjiList.FieldByName('EmpNCd').AsString;

				if pPrnParam^.HapPrnSpt.iRefType > 0 then
					SetFld('RefDate').AsDateTime := pPrnParam^.HapPrnSpt.dRefDate;

				Open(True);

				if not EOF then
				begin
					//性別
                    if pPrnParam^.HapPrnSpt.iRefType > 0 then
                    begin
                        //履歴登録時
                        if GetFld('SeibetsuStdEmp').AsInteger <> 0 then
                        begin
                            if GetFld('SeibetsuStd').AsInteger=1 then
                                mdJinjiList.FieldByName('Seibetsu').AsString:='男性'
                            else if GetFld('SeibetsuStd').AsInteger=2 then
                                mdJinjiList.FieldByName('Seibetsu').AsString:='女性';
                        end
                        //履歴未登録
                        else
                        begin
                            if GetFld('Seibetsu').AsInteger=1 then
                                mdJinjiList.FieldByName('Seibetsu').AsString:='男性'
                            else if GetFld('Seibetsu').AsInteger=2 then
                                mdJinjiList.FieldByName('Seibetsu').AsString:='女性';
                        end;
                    end
                    else
                    begin
                        if GetFld('Seibetsu').AsInteger=1 then
                            mdJinjiList.FieldByName('Seibetsu').AsString:='男性'
                        else if GetFld('Seibetsu').AsInteger=2 then
                            mdJinjiList.FieldByName('Seibetsu').AsString:='女性';
                    end;

                    //血液型
                    if pPrnParam^.HapPrnSpt.iRefType > 0 then
                    begin
                        if GetFld('KetuekiStdEmp').AsInteger <> 0 then
                            mdJinjiList.FieldByName('Ketueki').AsString := fnGetName(GetFld('KetuekiStd').AsString,'101200')
                        else
                            mdJinjiList.FieldByName('Ketueki').AsString := fnGetName(GetFld('Ketueki').AsString,'101200');
                    end
                    else
                    begin
                        mdJinjiList.FieldByName('Ketueki').AsString := fnGetName(GetFld('Ketueki').AsString,'101200');
                    end;

					//住所カナ
					mdJinjiList.FieldByName('Address1Kana').AsString := GetFld('Address1Kana').AsString;
					mdJinjiList.FieldByName('Address2Kana').AsString := GetFld('Address2Kana').AsString;

					mdJinjiList.FieldByName('YuubinNo').AsString :=
							fnGetFormatYuubinNo2(GetFld('YuubinNo1').AsInteger,GetFld('YuubinNo2').AsInteger);

					mdJinjiList.FieldByName('Address1').AsString := GetFld('Address1').AsString;
					mdJinjiList.FieldByName('Address2').AsString := GetFld('Address2').AsString;

                end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self, 'ヘッダー項目（２）'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);//<210122>
			end;
			Abort;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;
//<RefDay-faster> ↑

end.
