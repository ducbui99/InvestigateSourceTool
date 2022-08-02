//******************************************************************************
//		System		:MJSFX
//		Program		:在職者一覧表
//		ProgramID	:HAP000052PPrn
//		Name		:H.Itahana(Buntechno)
//		Create		:2005/07/25 (Mon)
//		Comment		:
//		History		:2005/10/31 H.Itahana(Buntechno)
//					:・Application対応
//					:2005/12/09 T.Abe(Buntechno)
//					:・戸籍名出力ビュー対応
//					:2005/12/27 H.Itahana(Buntechno)
//					:・本日変更社員印刷対応　<2005-12-27>
//					:2006/04/03 T.ABE (BUNTECHNO)
//					:・フリーコード編集対応　<060403>
//					:2006/04/05 N.Nakamura (TS2)
//					:・戸籍名フリガナ順対応　<060405>
//					:2006/08/25 H.Takaishi (BUNTECHNO)
//					:・部門権限対応			<2006-08-25>
//					:2006/08/25 H.Takaishi (BUNTECHNO)
//					:・所属複数絞込み時の不具合修正	<2006-08-25_2>
//					:2006/08/25 H.Takaishi (BUNTECHNO)
//					:・現在所属の取得が正しくなかった問題を修正	<2006-08-25_4>
//					:2006/09/07 H.Takaishi (BUNTECHNO)
//					:・印刷データなしの時[エラー]→[警告]	<2006-09-07>
//					:2007/05/02 H.Takaishi (BUNTECHNO)
//					:・部門権限対応（未所属社員は常に出力対象）	<2007-05-02>
//					:2008/06/09 H.Takaishi (TakumiCo.)
//					:・印刷履歴対応（MjsPreview経由で印刷処理実行）	<2008-06-09>
//					:2009/03/23 R.Kobayashi (TakumiCo.)
//					:・印刷暦区分をHAPM3.CalenderKbnに変更）		<2009-03-23>
//					:2011/02/03 H.Yamashiro
//					:・ファイル出力時、'職能等級'ヘッダーの名称を'等級号俸'に変更		<20110203>
//					:2012/03/16	H.Yamashiro
//					:・ 社員区分が「0：会社規定」の場合、出力されない不具合を修正		<20120316>
//					:2016/06/16	M.Tamaki
//					:・ フリガナが30文字しか出力されない不具合を修正					<20160616>
//					:2020/05/07	K.Takahashi
//					:・ 基準日対応														<RefDay>
//					:2020/05/26	Y.Iwakawa
//					:・ 基準日対応 - 帳票速度改善・未使用変数の削除						<RefDay-faster>

//******************************************************************************
unit HAP000052PPrnU;


interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  Db, dxmdaset, ppDB, ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport,FireDAC.Comp.Client,
  MjsDBModuleU,MJSQuery,HapPrnDlgSpU,MjsPrnSupportU, ppModule,
  HapMsgu,MjsPreviewIFU,MjsPrnDlgU,MjsDateCtrl, ppDesignLayer, ppParameter;

const
	{$I HapPrnConst.inc}

type
	{$I HapPrnType.inc}
	{$i ActionInterface.inc}

{
	TNSPDB = record										// 所属名
		DeptNCd		: Integer;							// 所属内部コード
		ItemNo		: Integer;							// 項目コード
		DeptName	: String;							// 所属名
	end;
}
	TNSPMN = record										// 区分名称
		KubunNo		: Integer;							// 区分コード
		ItemNo		: Integer;							// 項目コード
		KubunName	: String;							// 区分名称
	end;

  THAP000052PPrnF = class(TForm)
	ppReport1: TppReport;
	ppHeaderBand1: TppHeaderBand;
	pphlCopNoSf: TppLabel;
	pphlCopNameSf: TppLabel;
	pphsvDateSf: TppSystemVariable;
	ppDetailBand1: TppDetailBand;
	ppDBText1: TppDBText;
	ppFooterBand1: TppFooterBand;
	ppfsvPageSf: TppSystemVariable;
	ppDBPipeline1: TppDBPipeline;
	DSrcPrint: TDataSource;
	DMemPrint: TdxMemData;
	ppLabel1: TppLabel;
	ppLabel2: TppLabel;
	ppLabel4: TppLabel;
	ppDBText2: TppDBText;
	DMemPrintEmpNo: TStringField;
	DMemPrintEmpName: TStringField;
	LppAccOfficeSf: TppLabel;
	Label_Name: TppLabel;
	ppDBText13: TppDBText;
	ppDBText14: TppDBText;
	ppLine2: TppLine;
	ppLine1: TppLine;
	ppLine3: TppLine;
	ppLine4: TppLine;
	ppLine5: TppLine;
	ppLine6: TppLine;
	ppLine7: TppLine;
	ppLine9: TppLine;
	ppLine20: TppLine;
	ppLine21: TppLine;
	ppLine23: TppLine;
	ppLine22: TppLine;
	ppLine19: TppLine;
	ppLine10: TppLine;
	Label_Kbn: TppLabel;
	ppGroup2: TppGroup;
	ppGroupHeaderBand2: TppGroupHeaderBand;
	ppGroupFooterBand2: TppGroupFooterBand;
	ppLabel3: TppLabel;
	ppLabel5: TppLabel;
	ppLine11: TppLine;
	ppLine12: TppLine;
	ppLabel6: TppLabel;
	ppDBText4: TppDBText;
	ppDBText5: TppDBText;
	ppDBText6: TppDBText;
	ppLine16: TppLine;
	ppLine17: TppLine;
	ppLine15: TppLine;
	ppLine14: TppLine;
	ppDBText8: TppDBText;
	ppLabel7: TppLabel;
	ppLabel8: TppLabel;
	ppLabel9: TppLabel;
	ppLabel10: TppLabel;
	ppLabel11: TppLabel;
	ppLine25: TppLine;
	ppLabel12: TppLabel;
	ppLabel13: TppLabel;
	ppLine26: TppLine;
	ppLine18: TppLine;
	ppLine27: TppLine;
	ppDBText3: TppDBText;
	ppDBText7: TppDBText;
	ppDBText9: TppDBText;
	ppDBText10: TppDBText;
	ppDBText11: TppDBText;
	ppDBText12: TppDBText;
	ppDBText15: TppDBText;
	ppDBText16: TppDBText;
	ppDBText17: TppDBText;
	ppLabel14: TppLabel;
	ppLabel15: TppLabel;
	DMemPrintEmpKana: TStringField;
	DMemPrintDeptName: TStringField;
	DMemPrintPostName: TStringField;
	DMemPrintEmpKubunName: TStringField;
	DMemPrintSeibetsu: TStringField;
	DMemPrintNenrei: TStringField;
	DMemPrintNyuusha: TStringField;
	DMemPrintKinzokuNen: TStringField;
	DMemPrintAbility: TStringField;
	DMemPrintRank: TStringField;
	DMemPrintJobName: TStringField;
	DMemPrintWorkClassName: TStringField;
	DMemPrintSaiyouName: TStringField;
	DMemPrintGatukouName: TStringField;
	ppLNenreiDate: TppLabel;
	DMemPrintBirth: TStringField;

	procedure FormCreate(Sender:TObject);
	constructor CreateForm(	pRec,pParam:Pointer);
	procedure FormDestroy(Sender: TObject);
	procedure ppReport1BeforePrint(Sender: TObject);

  private
	{ Private 宣言 }
	pAppRec		: ^TMjsAppRecord;												//MJSAppRecordﾎﾟｲﾝﾀ
	MDBModule	: TMDataModuleF;												//DBﾓｼﾞｭｰﾙ
	ddCopDB		: TFDConnection;													//会社DB
	dsPrn		: TDataSource;													//印刷用ﾃﾞｰﾀｾｯﾄ
	mqMA		: TMQuery;														//会社ｸｴﾘ
	pPrnParam	: ^THapPrnParam;												//印刷情報
	iEmpAttribute : Integer ;
	iEmpDigit	: Integer ;
	iDeptAttribute : Integer ;
	iDeptDigit	: Integer ;
	iRekiKbn	: integer;
//	iNo			: integer;														//<RefDay-faster> DEL

	gbQyoKijun	: Boolean;
//	gbFirstFlg	: Boolean;														//<RefDay-faster> DEL

	m_HAPMN		: array of TNSPMN;

	procedure fnSetFileOut(CmnInfo:TMjsPrnSupport);

//<RefDay-faster> DEL  ↓
{
	function fnGetData(	sEmpNo	: String;
						iEmpNCd	: Int64;
						sEmpKana: String;
						sEmpName: String;
						iDeptNCd: Int64;
						iDeptNo	: string) : Boolean;
}
//<RefDay-faster> DEL ↑
	function fnGetMNName(iKubunNo : Integer;iItemNo: Integer):String;
	procedure DoPrint;
	function fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
	function fnGetHAPMNExName(KubunNo : Integer; KM_ItemNo : Integer) : String;

	procedure fnSetMNName();
	function fnGetSTDFormatDate(dDate : TDateTime): String;						//基準日表示用フォーマット <RefDay>

  public
	{ Public 宣言 }
  end;

function AppEntry(pPar:pointer):integer;										//SystemMenu->Self
exports
  AppEntry;

implementation
uses
	HAPLibU,
	MjSDispCtrl,
	MJSCommonu;

{$R *.DFM}

{ TNSP100058PrintF }

//----------------------------------------------------------------------
//	Package Export Function
//----------------------------------------------------------------------
//**********************************************************************
//		Proccess	:
//		Parameter	:pPar	:pointer
//		Return		:ACTID_RET_OK	:
//					:ACTID_RET_NG	:不正
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function AppEntry(pPar:pointer):integer;
var
	pForm	: ^THAP000052PPrnF;
	pRec	: ^TMjsAppRecord;
	pParam	: pointer;
	iAction	: integer;
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
				pForm^ := THAP000052PPrnF.CreateForm( pRec,pParam );
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
			THAP000052PPrnF(pForm^).DoPrint;
		end;
	end;
	Result	:=ACTID_RET_OK;
end;

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Proccess	:
//		Parameter	:Sender	:TObject
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000052PPrnF.FormCreate(Sender: TObject);
begin
	with pPrnParam^.MPrnSpt do
	begin
		//Mjs印刷ﾀﾞｲｱﾛｸﾞの指定とｺﾝﾎﾟｰﾈﾝﾄを連結
		ApRB			:= ppReport1;											//帳票
		pPage			:= ppfsvPageSf;											//頁
		pDate			:= pphsvDateSf;											//日付
		pCorpCode		:= pphlCopNoSf;											//会社ｺｰﾄﾞ
		pCorpName		:= pphlCopNameSf;										//会社名
		pAccountOffice	:= LppAccOfficeSf;										//会計事務所名
	end;
end;

//**********************************************************************
//	Constructor
//**********************************************************************
//**********************************************************************
//		Component	:DataModule
//		Event		:constructor
//		Proccess	:ｺﾝｽﾄﾗｸﾀ
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
constructor THAP000052PPrnF.CreateForm(pRec,pParam: Pointer);
var
	iCnt		:	Integer;
	POwnerForm	: ^TControl;													//2005-10-31
begin

	pAppRec	:= pRec;			//MjsAppRecord
	pPrnParam :=pParam;

	//2005-10-31
	POwnerForm := pAppRec^.m_pChildForm;  										//  オーナーフォームを取得
																				//会社ＤＢオープン
	//gbFirstFlg := True;														//<RefDay-faster> DEL

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
				if Eof then Abort;	   											//先にﾁｪｯｸするのでここでは例外抜け

				if not eof then
				begin
					if iCnt = 0 then											//社員
					begin
						iEmpAttribute	:= GetFld('CodeAttr').AsInteger ;
						iEmpDigit		:= GetFld('CodeDigit').AsInteger ;
					end
					else
					begin
						iDeptAttribute	:= GetFld('CodeAttr').AsInteger ;
						iDeptDigit		:= GetFld('CodeDigit').AsInteger ;
					end;
				end;

				Close;
			end;

//印字歴区分
			Close;
			SQL.Clear;
		//<2009-03-23>↓
		//	SQL.Add('SELECT YearKbn FROM DTMAIN');
			SQL.Add('SELECT CalendarKbn As YearKbn FROM HAPM3');
		//<2009-03-23>↑
			if not Open then Abort;
			if Eof then Abort;

			iRekiKbn := GetFld('YearKbn').AsInteger ;

//給与年月基準か判定
    		Close;
			SQL.Clear;
			SQL.Add('SELECT StdDateDef,StdDateSup FROM HAPJINA');

			if not Open then Abort;

			gbQyoKijun := False;

			if not Eof then
			begin
				if (GetFld('StdDateDef').AsInteger = 3)
				and(GetFld('StdDateSup').AsInteger = 1) then	//給与年月基準
					gbQyoKijun := True;
			end;
		end;
	except
		mqMA.Free;
		dsPrn.Free;
		MDBModule.CopDBClose(ddCopDB);
		raise Exception.Create('会社情報 取得失敗');
	end;

	// テーブルデータの取得
	fnSetMNName();

//2005-10-31
//	inherited Create(Application);
	inherited Create(POwnerForm^);
end;
//**********************************************************************
//		Component	: ppReport1
//		Event		: BeforePrint
//		Proccess	:
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000052PPrnF.ppReport1BeforePrint(Sender: TObject);
begin
	// ページ指定印刷用処理
	pPrnParam^.MPrnSpt.BeforePrint(Sender);
end;

//**********************************************************************
//	PUPLIC
//**********************************************************************
//**********************************************************************
//		Proccess	:印刷
//		History		:2005/12/06	T.Abe(BUNTECHNO)
//					:戸籍名出力ビュー対応
//**********************************************************************
procedure THAP000052PPrnF.DoPrint;
var
	mqPrn	: TMQuery;
	i		: integer;
//	bData	: Boolean;
//	sDeptNCdB	: String;	//<RefDay-faster> DEL
//	sKana,					//<RefDay-faster> DEL
//	sName		: String;	//<RefDay-faster> DEL
begin

	//フリーコード編集対応<060403>
	if iEmpAttribute = 2 then
		ppDBText1.Alignment	:= taLeftJustify
	else
		ppDBText1.Alignment	:= taRightJustify;


	if (pPrnParam^.HapPrnSpt.bPageBreak)
		and ((pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU)
		or (pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI)) then				//改頁[あり]
		ppReport1.Groups[0].NewPage := pPrnParam^.HapPrnSpt.bPageBreak
	else
		ppReport1.Groups[0].NewPage := False;

//	bData := FALSE;																//<RefDay-faster> DEL
	try
		mqPrn:=TMQuery.Create(Self);
		try
			//DB情報ｾｯﾄ
			MDBModule.SetDBInfoToQuery(ddCopDB,mqPrn);
			dsPrn.DataSet:=mqPrn;												//ﾃﾞｰﾀｾｯﾄ連結
			with mqPrn do
			begin
				Close;
				with SQL do
				begin
					Clear;

					//印刷ｶﾗﾑ
					Add('SELECT'	);
					Add('SC.GCode,'	);
					Add('SC.NCode,');
					Add('MS.KanaName,');
//<20160616>↓
					Add('MS.EmpKana1,');
					Add('MS.EmpKana2,');
//<20160616>↑
					Add('MS.Name,');

					// 戸籍名出力ビュー対応
					Add('MS.TrueNamekana1M,');                                  //戸籍カナ
					Add('MS.TrueNamekana2M,');
					Add('MS.TrueNameU,');                                       //戸籍氏名

//					Add('SC.DeptNCd,');
//					Add('DB.DeptNo');

					Add('ISNULL('		);			//所属内部No
					Add(' (SELECT'		);
					Add('   DeptNCode'	);
					Add('  FROM'		);
					Add('   MV_HAP_HAPCHG'	);
					Add('  WHERE'		);
					Add('   MasterKbn=41'	);
					Add('   AND'		);
					Add('   AddPos=0'	);
					Add('   AND'		);
					Add('   EmpNCode=SC.NCode)'	);
					Add(' ,'''')');
					Add(' AS');
					Add(' DeptNCd');

					Add(',ISNULL(');				//所属No
					Add(' (SELECT');
					Add('   DeptGCode');
					Add('  FROM');
					Add('   MV_HAP_HAPCHG');
					Add('  WHERE');
					Add('   MasterKbn=41');
					Add('   AND'		);
					Add('   AddPos=0'	);
					Add('   AND');
					Add('   EmpNCode=SC.NCode)');
					Add(' ,'''')');
					Add(' AS');
					Add(' DeptNo');

					Add(',ISNULL(');				//体系順
					Add(' (SELECT');
					Add('   OrderNo');
					Add('  FROM');
//<RefDay>↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then						//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
						Add('   MP_HAP_HAPCHG_STD(''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''')')
					else
						Add('   MV_HAP_HAPCHG');
//<RefDay>↑
					Add('  WHERE');
					Add('   MasterKbn=41');
					Add('   AND'		);
					Add('   AddPos=0'	);
					Add('   AND');
					Add('   EmpNCode=SC.NCode)');
					Add(' ,0)');
					Add(' AS');
					Add(' OrderNo');

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

//<RefDay-faster> ADD ↓ fnGetDataより移植
                    Add(',MS.Seibetsu'	);										//性別
                    Add(',MS.Birth'		);										//生年月日
                    Add(',SY.Nyuusha'	);										//入社年月日
                    Add(',SY.Saiyou'	);										//採用区分
                    Add(',SY.GatukouKubun');									//最終学校区分	<131213>
                    Add(',SY.GatukouName');										//最終学校名

					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
					begin
						//性別(基準日参照)
                        Add(',(SELECT SCFSTD.CalcFlagLongName');
                        Add('  FROM MP_HAP_HAPSCF_STD(');
                        Add('''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''',101000) SCFSTD');
                        Add('  WHERE SC.NCode     = SCFSTD.EmpNCode');
						Add('   AND  SC.CorpNCode = SCFSTD.CorpNCode  )');
                        Add(' AS _SEIBETU_SCF');
						//性別(基準日参照)_社員存在確認用
                        Add(',(SELECT SCFSTD.EmpNCode');
                        Add('  FROM MP_HAP_HAPSCF_STD(');
                        Add('''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''',101000) SCFSTD');
                        Add('  WHERE SC.NCode      = SCFSTD.EmpNCode');
						Add('   AND  SC.CorpNCode  = SCFSTD.CorpNCode )');
                        Add(' AS _SEIBETU_SCF_EmpNCode');

						//社員区分(基準日参照)
                        Add(',(SELECT SCSSTD.EmpKubunStdN');
                        Add('  FROM MP_HAP_HAPSCS_STD(');
                        Add('''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') SCSSTD');
                        Add('  WHERE SC.NCode     = SCSSTD.EmpNCode');
                        Add('   AND  SC.CorpNCode = SCSSTD.CorpNCode )');
                        Add(' AS _EMPKUBUN_SCS');

						//年齢(基準日参照)
                        Add(',(SELECT SYSTD.NenreiStd');
                        Add('  FROM MP_HAP_HAPSY_STD(');
                        Add('''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') SYSTD');
                        Add('  WHERE SC.NCode     = SYSTD.EmpNCode');
                        Add('   AND  SC.CorpNCode = SYSTD.CorpNCode )');
                        Add(' AS _MONTHS_AGE_REFDATE');

						//勤続年数(基準日参照)
                        Add(',(SELECT SYSTD.KinzokuStd');
                        Add('  FROM MP_HAP_HAPSY_STD(');
                        Add('''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') SYSTD');
                        Add('  WHERE SC.NCode     = SYSTD.EmpNCode ');
                        Add('   AND  SC.CorpNCode = SYSTD.CorpNCode)');
                        Add(' AS _MONTHS_SERVE_REFDATE');

						//等級号俸
						Add(',(SELECT CHGA.DeptNCode');
						Add('  FROM MP_HAP_HAPCHG_STD(''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') CHGA ');
						Add('  WHERE SC.NCode     = CHGA.EmpNCode ');
						Add('   AND  SC.CorpNCode = CHGA.CorpNCode');
						Add('   AND CHGA.MasterKbn=92 AND CHGA.AddPos=0 AND CHGA.DeptNCode>0)');
						Add(' AS _RANK_CHGA');
                    end
					else
					begin
                        Add(',SY.EmpKubun'	);										//社員区分
                        Add(',MF_HAP_StdDate(SC.CorpNCode,SC.NCode) AS _BASE_DATE');							//基準日
                        Add(',MF_HAP_MonthsAge(MS.Birth,MF_HAP_CurEnd(SC.CorpNCode,SC.NCode,1)) AS _MONTHS_AGE');										//年齢
                        Add(',MF_HAP_Months(SY.Nyuusha,MF_HAP_CurEnd(SC.CorpNCode,SC.NCode,0)) AS _MONTHS_SERVE');									//勤続年数
						Add(',SY.Rank'	);											//等級
                    end;

					//所属(基準日参照)
					Add(',(SELECT CHG.LongName');
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
						Add('FROM MP_HAP_HAPCHG_STD(''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') CHG ')
					else
						Add('FROM MV_HAP_HAPCHG CHG');
					Add('  WHERE SC.NCode     = CHG.EmpNCode');
					Add('   AND  SC.CorpNCode = CHG.CorpNCode');
					Add('   AND CHG.MasterKbn=41 AND CHG.AddPos=0 AND CHG.DeptNCode>0)');
					Add(' AS _DEPT_NAME_');

					//職種(基準日参照)
					Add(',(SELECT CHG.LongName');
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
						Add('FROM MP_HAP_HAPCHG_STD(''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') CHG ')
					else
						Add('FROM MV_HAP_HAPCHG CHG');
					Add('  WHERE SC.NCode     = CHG.EmpNCode');
					Add('   AND  SC.CorpNCode = CHG.CorpNCode');
					Add('   AND CHG.MasterKbn=86 AND CHG.AddPos=0 AND CHG.DeptNCode>0)');
					Add(' AS _JOB_NAME_');

					//役職(基準日参照)
					Add(',(SELECT CHG.LongName');
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
						Add('FROM MP_HAP_HAPCHG_STD(''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') CHG ')
					else
						Add('FROM MV_HAP_HAPCHG CHG');
					Add('  WHERE SC.NCode     = CHG.EmpNCode');
					Add('   AND  SC.CorpNCode = CHG.CorpNCode');
					Add('   AND CHG.MasterKbn=87 AND CHG.AddPos=0 AND CHG.DeptNCode>0)');
					Add(' AS _POST_NAME_');

					//職能(基準日参照)
					Add(',(SELECT CHG.LongName');
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
						Add('FROM MP_HAP_HAPCHG_STD(''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') CHG ')
					else
						Add('FROM MV_HAP_HAPCHG CHG');
					Add('  WHERE SC.NCode     = CHG.EmpNCode');
					Add('   AND  SC.CorpNCode = CHG.CorpNCode');
					Add('   AND CHG.MasterKbn=88 AND CHG.AddPos=0 AND CHG.DeptNCode>0)');
					Add(' AS _ABILITY_');

					//職位(基準日参照)
					Add(',(SELECT CHG.LongName');
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
						Add('FROM MP_HAP_HAPCHG_STD(''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') CHG ')
					else
						Add('FROM MV_HAP_HAPCHG CHG');
					Add('  WHERE SC.NCode     = CHG.EmpNCode');
					Add('   AND  SC.CorpNCode = CHG.CorpNCode');
					Add('   AND CHG.MasterKbn=89 AND CHG.AddPos=0 AND CHG.DeptNCode>0)');
					Add('AS _WORK_CLASS_NAME_');
//<RefDay-faster> ADD ↑

					//TABLE
					Add('FROM'		);
					Add('HAPSC SC');
//					Add('mvNSPDB DB');

					// 戸籍名出力ビュー対応
					//Add('INNER JOIN MOS_OFFICE_STAFF MS');
					Add('INNER JOIN MV_HAP_CMNMOS MS');
					Add('ON MS.NCode=SC.NCode'			);
//<RefDay-faster> ADD ↓
					Add('INNER JOIN HAPSY SY');
					Add('ON  SC.NCode     = SY.EmpNCode'			);
					Add('AND SC.CorpNCode = SY.CorpNCode'			);
//<RefDay-faster> ADD ↑
					Add('WHERE '	);
//2005-08-30
					Add('SC.SyokuchiKbn=0');

//					Add('SC.DeptNCd = DB.DeptNCd');

//					Add('AND SC.Zaishoku <> 2');

//					Add('AND DB.ItemNo = 30400');

					//在職区分のﾌｨﾙﾀ
					Add(' AND');
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
						Add('AND');
						if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU then
							Add('DeptNo>=')
						else if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI then
							Add('OrderNo>=')
						else
							Add('SC.GCode>=');
						if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI then
							Add(inttostr(pPrnParam^.HapPrnSpt.OrderNo[0]))
						else
							Add(''''+pPrnParam^.HapPrnSpt.Code[0]+'''');
						Add('AND');
						if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU then
							Add('DeptNo<=')
						else if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI then
							Add('OrderNo<=')
						else
							Add('SC.GCode<=');
						if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI then
							Add(inttostr(pPrnParam^.HapPrnSpt.OrderNo[1]))
						else
							Add(''''+pPrnParam^.HapPrnSpt.Code[1]+'''');
					end;
					//複数指定
					if pPrnParam^.HapPrnSpt.iSelect=HAPPRN_SEL_FUKUSU then
					begin
						Add('AND');
						//所属
							if ((pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU)
								or (pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI)) then
// <2006-08-25_2> ----- S
//							Add('SC.DeptNCd IN (')
							Add('DeptNCd IN (')
// <2006-08-25_2> ----- E
						//社員No
						else
							Add('SC.NCode IN (');
						for i:=0 to Length(pPrnParam^.HapPrnSpt.NCD)-1 do
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
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
						Add('AND ((SY.Nyuusha <= ''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') OR (SY.Nyuusha IS NULL))');
//<RefDay> ↑
					//出力順
					Add(	'ORDER BY');
					if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU then
						Add('DeptNo,')
					else if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI then
						Add('OrderNo,')
					else if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_KANA then
//<060405> ST
//						Add('KanaName,');
					begin
						// 戸籍名出力対応
						if pPrnParam^.HapPrnSpt.iNameType = 1 then
							Add('TrueNameKanaU,')
						else
							Add('KanaName,');
					end;
//<060405> ED

					Add(	'SC.GCode');
				end;


				try
					Open(True);
					if not Eof then												//印刷ﾃﾞｰﾀ有
					begin
//						iNo:=0;													//<RefDay-faster> DEL
						DMemPrint.Close;
						DMemPrint.Open;
//						dPrnEmpNo := GetFld('GCode').AsFloat;

//<RefDay-faster> ADD ↓ fnGetDataから移植
						ppLNenreiDate.Caption := '';

						if gbQyoKijun = True then
							ppLNenreiDate.Caption := '給与年月基準'
						else
						begin
							if pPrnParam^.HapPrnSpt.iRefType > 0 then			//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
							begin
								if pPrnParam^.HapPrnSpt.dRefDate <> 0 then
								begin
									ppLNenreiDate.Caption:= fnGetSTDFormatDate(pPrnParam^.HapPrnSpt.dRefDate);
								end;
							end
							else
							begin
								if not GetFld('_BASE_DATE').IsNull then
								begin
									ppLNenreiDate.Caption:= fnGetSTDFormatDate(GetFld('_BASE_DATE').AsDateTime);
								end;
							end;
						end;
//<RefDay-faster> ADD ↑

						while not eof do
						begin
//<RefDay-faster> DEL ↓
{							if (pPrnParam^.HapPrnSpt.bPageBreak)
								and ((pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU)
								or (pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI)) then//改頁[あり]

							iNo := 0;
							// 戸籍名出力対応
							if pPrnParam^.HapPrnSpt.iNameType = 1 then
							begin
								sKana	:= GetFld('TrueNamekana1M').AsString + ' ' + GetFld('TrueNamekana2M').AsString;
								sName	:= GetFld('TrueNameU').AsString;
							end
							else
							begin
//<20160616>↓
//								sKana	:= GetFld('KanaName').AsString;
								sKana	:= GetFld('Empkana1').AsString + ' ' + GetFld('Empkana2').AsString;
//<20160616>↑
								sName	:= GetFld('Name').AsString;
							end;


							if fnGetData(	GetFld('GCode').AsString,
											Trunc(GetFld('NCode').AsFloat),
											sKana,
											sName,
											Trunc(GetFld('DeptNCd').AsFloat),
											GetFld('DeptNo').AsString) then
								bData := TRUE;

							sDeptNCdB := GetFld('DeptNCd').AsString;
}
//<RefDay-faster> DEL ↑
//<RefDay-faster> ADD ↓ fnGetDataから移植

                            DMemPrint.Append;

                            //社員ｺｰﾄﾞ
                            DMemPrint.FieldByName('EmpNo').AsString :=
                                        HapCodeAttribute2(GetFld('GCode').AsString,iEmpDigit,iEmpAttribute);
							//社員名
							if pPrnParam^.HapPrnSpt.iNameType = 1 then	// 戸籍名出力対応
							begin
								DMemPrint.FieldByName('EmpKana').AsString 	:= GetFld('TrueNamekana1M').AsString + ' ' + GetFld('TrueNamekana2M').AsString;
								DMemPrint.FieldByName('EmpName').AsString	:= GetFld('TrueNameU').AsString;
							end
							else
							begin
								DMemPrint.FieldByName('EmpKana').AsString 	:= GetFld('Empkana1').AsString + ' ' + GetFld('Empkana2').AsString;
								DMemPrint.FieldByName('EmpName').AsString	:= GetFld('Name').AsString;
							end;

                            DMemPrint.FieldByName('DeptName').AsString := '';

                            //性別
                            if GetFld('Seibetsu').AsInteger = 2 then
                                DMemPrint.FieldByName('Seibetsu').AsString:= '女性'
                            else
                                DMemPrint.FieldByName('Seibetsu').AsString:= '男性';
//<RefDay>↓
                            if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
                            begin
                                if GetFld('_SEIBETU_SCF_EmpNCode').AsInteger <> 0 then
                                    DMemPrint.FieldByName('Seibetsu').AsString := GetFld('_SEIBETU_SCF').AsString;
                            end;
//<RefDay>↑

							//社員区分
                            if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
                            begin
								DMemPrint.FieldByName('EmpKubunName').AsString:= GetFld('_EMPKUBUN_SCS').AsString;
                            end
							else
							begin
								DMemPrint.FieldByName('EmpKubunName').AsString:= fnGetMNName(GetFld('EmpKubun').AsInteger,110100);
                            end;

                            //生年月日
                            if GetFld('Birth').IsNull = True then
                            begin
                                DMemPrint.FieldByName('Birth').AsString	:='';
                                DMemPrint.FieldByName('Nenrei').AsString:='';
                            end
                            else
                            begin
                                if iRekiKbn = 1 then
                                begin
                                    DMemPrint.FieldByName('Birth').AsString:=
                                                Formatdatetime('gg ',GetFld('Birth').AsDatetime)+
                                                fnGetPrintYMD(GetFld('Birth').AsDatetime,1)+'/'+
                                                fnGetPrintYMD(GetFld('Birth').AsDatetime,2)+'/'+
                                                fnGetPrintYMD(GetFld('Birth').AsDatetime,3);
                                end
                                else
                                begin
                                    DMemPrint.FieldByName('Birth').AsString
                                                := FormatDateTime('YYYY/m/d',GetFld('Birth').AsDateTime);
                                end;

                            //年齢
                                if pPrnParam^.HapPrnSpt.iRefType > 0 then
                                begin
                                    DMemPrint.FieldByName('Nenrei').AsString
                                        :=Format('%2.2n',[	(GetFld('_MONTHS_AGE_REFDATE').AsInteger div 12)+
                                                            (GetFld('_MONTHS_AGE_REFDATE').AsInteger mod 12)*0.01	]);
                                end
								else
								begin
	                                DMemPrint.FieldByName('Nenrei').AsString
										:=Format('%2.2n',[	(GetFld('_MONTHS_AGE').AsInteger div 12)+
															(GetFld('_MONTHS_AGE').AsInteger mod 12)*0.01	]);
                                end;
                            end;


                            //入社年月日
                            if GetFld('Nyuusha').IsNull = True then
                            begin
                                DMemPrint.FieldByName('Nyuusha').AsString	:='';
                                DMemPrint.FieldByName('KinzokuNen').AsString:='';
                            end
                            else
                            begin
                                if iRekiKbn = 1 then
                                begin
                                    DMemPrint.FieldByName('Nyuusha').AsString:=
                                                Formatdatetime('gg ',GetFld('Nyuusha').AsDatetime)+
                                                fnGetPrintYMD(GetFld('Nyuusha').AsDatetime,1)+'/'+
                                                fnGetPrintYMD(GetFld('Nyuusha').AsDatetime,2)+'/'+
                                                fnGetPrintYMD(GetFld('Nyuusha').AsDatetime,3);
                                end
                                else
                                begin
                                    DMemPrint.FieldByName('Nyuusha').AsString
                                                := FormatDateTime('YYYY/m/d',GetFld('Nyuusha').AsDateTime);
                                end;

                            //勤続年数
//<RefDay>↓
                                if pPrnParam^.HapPrnSpt.iRefType > 0 then
                                begin
                                    DMemPrint.FieldByName('KinzokuNen').AsString
                                                :=Format('%2.2n',[	(GetFld('_MONTHS_SERVE_REFDATE').AsInteger div 12)+
                                                                    (GetFld('_MONTHS_SERVE_REFDATE').AsInteger mod 12)*0.01	]);
                                end
								else
								begin
                                    DMemPrint.FieldByName('KinzokuNen').AsString
                                                :=Format('%2.2n',[	(GetFld('_MONTHS_SERVE').AsInteger div 12)+
                                                                    (GetFld('_MONTHS_SERVE').AsInteger mod 12)*0.01	]);
                                end;
//<RefDay>↑
                            end;

                            //等級
//<RefDay>↓
                            if pPrnParam^.HapPrnSpt.iRefType > 0 then
                            begin
								if GetFld('_RANK_CHGA').AsInteger > 0 then
	                                DMemPrint.FieldByName('Rank').AsString	:= GetFld('_RANK_CHGA').AsString;	//等級(基準日参照)
                            end
                            else
                            begin
								if GetFld('Rank').AsInteger > 0 then
									DMemPrint.FieldByName('Rank').AsString:= GetFld('Rank').AsString;
                            end;
//<RefDay>↑
                            //採用区分
                            DMemPrint.FieldByName('SaiyouName').AsString:= fnGetMNName(GetFld('Saiyou').AsInteger,110900);

                            //出身校
                            DMemPrint.FieldByName('GatukouName').AsString:= GetFld('GatukouName').AsString;

                            //<131213>↓
                            if GetFld('GatukouKubun').AsInteger > 0 then
                            begin
                                DMemPrint.FieldByName('GatukouName').AsString := fnGetHAPMNExName(GetFld('GatukouKubun').AsInteger, 111710);
                            end;

							DMemPrint.FieldByName('DeptName').AsString		:= GetFld('_DEPT_NAME_').AsString;
							DMemPrint.FieldByName('JobName').AsString		:= GetFld('_JOB_NAME_').AsString;
							DMemPrint.FieldByName('PostName').AsString		:= GetFld('_POST_NAME_').AsString;
							DMemPrint.FieldByName('Ability').AsString		:= GetFld('_ABILITY_').AsString;
							DMemPrint.FieldByName('WorkClassName').AsString	:= GetFld('_WORK_CLASS_NAME_').AsString;

		    				DMemPrint.Post;

//							gbFirstFlg := False;								//<RefDay-faster> DEL
//<RefDay-faster> ADD ↑
							next;
						end;

//<RefDay-faster> DEL ↓　通らないので削除
{
						bData := True;

						if not bData then
						begin
							// 資格・手当なし
// <2006-09-07> ----- S
//							MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjError,mjdefOK);
							MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjWarning,mjdefOK);
// <2006-09-07> ----- E
							exit;
						end;
}
//<RefDay-faster> DEL ↑
						case pPrnParam^.MPrnSpt.iCommand	of
							// <2008-06-09>
							PDLG_PRINT,		//印刷
							PDLG_PREVIEW:	//ﾌﾟﾚﾋﾞｭｰ
								with pPrnParam^ do
									MPrev.Exec(MPrnSpt,MDlgF,nil);
							PDLG_FILE:		//ファイル出力
								fnSetFileOut(pPrnParam^.MPrnSpt);
						end;
					end
					else														//印刷ﾃﾞｰﾀ無
// <2006-09-07> ----- S
//						MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjError,mjdefOK);
						MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjWarning,mjdefOK);
// <2006-09-07> ----- E
				except
					raise Exception.Create('印刷ﾃﾞｰﾀ取得失敗');
				end;
			end;
		finally
			mqPrn.Free;
		end;
	except
		raise Exception.Create('印刷用ｸｴﾘ 生成失敗');
	end;
	//iNo:=0;																	//<RefDay-faster> DEL
end;
//<RefDay-faster> DEL↓
{
//**********************************************************************
//		Proccess	: 印刷のデータを取る
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000052PPrnF.fnGetData(	sEmpNo	: String;
									iEmpNCd	: Int64;
									sEmpKana: String;
									sEmpName: String;
									iDeptNCd: Int64;
									iDeptNo	: string) : Boolean;

var
	DMQuery	: TMQuery;
	rcMsg	: TMjsMsgRec;

	i		: Integer;
	sName	: String;

begin
	Result := False;

	DMQuery := TMQuery.Create(Self);											//MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;
	MDBModule.SetDBInfoTOQuery(ddCopDB,DMQuery);								//DBとの接続
	try
		try
			with DMQuery do
			begin
				Close;
				SQL.Clear;
				SQL.Add('Select ');

				SQL.Add('MS.Seibetsu,'	);										//性別
				SQL.Add('SY.EmpKubun,'	);										//社員区分
				SQL.Add('MS.Birth,'		);										//生年月日
				SQL.Add('MF_HAP_StdDate(SC.CorpNCode,SC.NCode)');
				SQL.Add('AS _BASE_DATE,');										//基準日
				SQL.Add('MF_HAP_MonthsAge(MS.Birth,MF_HAP_CurEnd(SC.CorpNCode,SC.NCode,1))');
				SQL.Add('AS _MONTHS_AGE,');										//年齢
				SQL.Add('SY.Nyuusha,'	);										//入社年月日
				SQL.Add('MF_HAP_Months(SY.Nyuusha,MF_HAP_CurEnd(SC.CorpNCode,SC.NCode,0))');
				SQL.Add('AS _MONTHS_SERVE,');									//勤続年数
//<RefDay>↓
				if pPrnParam^.HapPrnSpt.iRefType > 0 then						//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
				begin
					SQL.Add('(SELECT SCSSTD.EmpKubunStd');
					SQL.Add('FROM MP_HAP_HAPSCS_STD(');
					SQL.Add('''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') SCSSTD');
					SQL.Add('WHERE SCSSTD.EmpNCode =' + inttostr(iEmpNCd) +' AND');
					SQL.Add('SCSSTD.CorpNCode = 0) AS _EMPKUBUN_SCS,');			//社員区分(基準日参照)

		           	SQL.Add('(SELECT SCFSTD.CalcFlag');
					SQL.Add('FROM MP_HAP_HAPSCF_STD(');
					SQL.Add('''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''',101000) SCFSTD');
					SQL.Add('WHERE SCFSTD.CorpNCode = 0 ');
					SQL.Add(' AND SCFSTD.EmpNCode =' + inttostr(iEmpNCd) +')');
					SQL.Add('AS _SEIBETU_SCF,');								//性別(基準日参照)

		           	SQL.Add('(SELECT SCFSTD.EmpNCode');
					SQL.Add('FROM MP_HAP_HAPSCF_STD(');
					SQL.Add('''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''',101000) SCFSTD');
					SQL.Add('WHERE SCFSTD.CorpNCode = 0 ');
					SQL.Add(' AND SCFSTD.EmpNCode =' + inttostr(iEmpNCd) +')');
					SQL.Add('AS _SEIBETU_SCF_EmpNCode,');						//性別(基準日参照)_社員存在確認用

		           	SQL.Add('(SELECT SYSTD.NenreiStd');
					SQL.Add('FROM MP_HAP_HAPSY_STD(');
					SQL.Add('''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') SYSTD');
					SQL.Add('WHERE SYSTD.CorpNCode = 0 ');
					SQL.Add(' AND SYSTD.EmpNCode =' + inttostr(iEmpNCd) +')');
					SQL.Add('AS _MONTHS_AGE_REFDATE,');							//年齢(基準日参照)


		           	SQL.Add('(SELECT SYSTD.KinzokuStd');
					SQL.Add('FROM MP_HAP_HAPSY_STD(');
					SQL.Add('''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') SYSTD');
					SQL.Add('WHERE SYSTD.CorpNCode = 0 ');
					SQL.Add(' AND SYSTD.EmpNCode =' + inttostr(iEmpNCd) +')');
					SQL.Add('AS _MONTHS_SERVE_REFDATE,');						//勤続年数(基準日参照)

					SQL.Add('(SELECT CHGA.DeptNCode');
					SQL.Add('FROM MP_HAP_HAPCHGA_STD(''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''',1) CHGA ');
					SQL.Add('WHERE CHGA.CorpNCode=0 AND CHGA.EmpNCode=' + inttostr(iEmpNCd));
					SQL.Add('AND CHGA.MasterKbn= 92 AND CHGA.AddPos=0 AND CHGA.DeptNCode>0 )');
					SQL.Add('AS _RANK_CHGA,');									//等級(基準日参照) MasterKbn = 92 固定で参照
				end;

//<RefDay>↑
				SQL.Add('SY.Rank,'	);											//等級
				SQL.Add('SY.Saiyou,'	);										//採用区分
				SQL.Add('SY.GatukouKubun,');										//最終学校区分	<131213>
				SQL.Add('SY.GatukouName');										//最終学校名
				SQL.Add('FROM HAPSC SC'	);
				SQL.Add('INNER JOIN MOS_OFFICE_STAFF MS ON MS.NCode=SC.NCode');
				SQL.Add('INNER JOIN HAPSY SY ON SY.EmpNCode=SC.NCode');
				SQL.Add('AND SY.CorpNCode=SC.CorpNCode');
				SQL.Add('WHERE SC.NCode ='+ inttostr(iEmpNCd));

				Open(True);
				if not Eof then
				begin
					//最初の社員から、表示する基準日を取得
					if gbFirstFlg = True then
					begin
						ppLNenreiDate.Caption := '';

						if gbQyoKijun = True then
							ppLNenreiDate.Caption := '給与年月基準'
						else
						begin
//<RefDay>↓
							if pPrnParam^.HapPrnSpt.iRefType = 0 then			//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
							begin
        						if not GetFld('_BASE_DATE').IsNull then
								begin
									if iRekiKbn = 1 then	//<2009-03-23>
									begin
										ppLNenreiDate.Caption:=
												Formatdatetime('gg ',GetFld('_BASE_DATE').AsDateTime)+
												fnGetPrintYMD(GetFld('_BASE_DATE').AsDateTime,1)+'年'+
												fnGetPrintYMD(GetFld('_BASE_DATE').AsDateTime,2)+'月'+
												fnGetPrintYMD(GetFld('_BASE_DATE').AsDateTime,3)+'日現在';
   									end
									else
									begin
										ppLNenreiDate.Caption :=
												Formatdatetime('YYYY',GetFld('_BASE_DATE').AsDateTime)+'年'+
												fnGetPrintYMD(GetFld('_BASE_DATE').AsDateTime,2)+'月'+
												fnGetPrintYMD(GetFld('_BASE_DATE').AsDateTime,3)+'日現在';
									end;
								end;
							end
							else
							begin
        						if pPrnParam^.HapPrnSpt.dRefDate <> 0 then
								begin
									if iRekiKbn = 1 then						//和暦
									begin
										ppLNenreiDate.Caption:=
												Formatdatetime('gg ',pPrnParam^.HapPrnSpt.dRefDate)+
												fnGetPrintYMD(pPrnParam^.HapPrnSpt.dRefDate,1)+'年'+
												fnGetPrintYMD(pPrnParam^.HapPrnSpt.dRefDate,2)+'月'+
												fnGetPrintYMD(pPrnParam^.HapPrnSpt.dRefDate,3)+'日現在';
   									end
									else										//西暦
									begin
										ppLNenreiDate.Caption :=
												Formatdatetime('YYYY',pPrnParam^.HapPrnSpt.dRefDate)+'年'+
												fnGetPrintYMD(pPrnParam^.HapPrnSpt.dRefDate,2)+'月'+
												fnGetPrintYMD(pPrnParam^.HapPrnSpt.dRefDate,3)+'日現在';
									end;
								end;
//<RefDay>↑
							end
						end;

						gbFirstFlg := False;
					end;

					inc(iNo);
					DMemPrint.Append;

					//社員ｺｰﾄﾞ
					DMemPrint.FieldByName('EmpNo').AsString :=
								HapCodeAttribute2(sEmpNo,iEmpDigit,iEmpAttribute);
					//社員名
					DMemPrint.FieldByName('EmpKana').AsString := sEmpKana;
					DMemPrint.FieldByName('EmpName').AsString := sEmpName;
					DMemPrint.FieldByName('DeptName').AsString := '';

					//性別

					if GetFld('Seibetsu').AsInteger = 2 then
						DMemPrint.FieldByName('Seibetsu').AsString:= '女性'
					else
						DMemPrint.FieldByName('Seibetsu').AsString:= '男性';
//<RefDay>↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
					begin
						if GetFld('_SEIBETU_SCF_EmpNCode').AsInteger <> 0 then
						begin
                            if GetFld('_SEIBETU_SCF').AsInteger = 2 then
                            begin
                                DMemPrint.FieldByName('Seibetsu').AsString:= '女性'
                            end
                            else
                            begin
                                DMemPrint.FieldByName('Seibetsu').AsString:= '男性'
                            end;
						end;
					end;
//<RefDay>↑
					//社員区分
					DMemPrint.FieldByName('EmpKubunName').AsString:= fnGetMNName(GetFld('EmpKubun').AsInteger,110100);

//<RefDay>↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
					begin
						if not GetFld('_EMPKUBUN_SCS').ISNULL then
							DMemPrint.FieldByName('EmpKubunName').AsString:= fnGetMNName(GetFld('_EMPKUBUN_SCS').AsInteger,110100);
					end;
//<RefDay>↑
					//生年月日
					if GetFld('Birth').IsNull = True then
					begin
						DMemPrint.FieldByName('Birth').AsString	:='';
						DMemPrint.FieldByName('Nenrei').AsString:='';
					end
					else
					begin
						if iRekiKbn = 1  then	//<2009-03-23>
						begin
							DMemPrint.FieldByName('Birth').AsString:=
										Formatdatetime('gg ',GetFld('Birth').AsDatetime)+
										fnGetPrintYMD(GetFld('Birth').AsDatetime,1)+'/'+
										fnGetPrintYMD(GetFld('Birth').AsDatetime,2)+'/'+
										fnGetPrintYMD(GetFld('Birth').AsDatetime,3);
						end
						else
						begin
							DMemPrint.FieldByName('Birth').AsString
										:= FormatDateTime('YYYY/m/d',GetFld('Birth').AsDateTime);
						end;

					//年齢
						DMemPrint.FieldByName('Nenrei').AsString
								:=Format('%2.2n',[	(GetFld('_MONTHS_AGE').AsInteger div 12)+
													(GetFld('_MONTHS_AGE').AsInteger mod 12)*0.01	]);

//<RefDay>↓
						if pPrnParam^.HapPrnSpt.iRefType > 0 then
						begin
							DMemPrint.FieldByName('Nenrei').AsString
								:=Format('%2.2n',[	(GetFld('_MONTHS_AGE_REFDATE').AsInteger div 12)+
													(GetFld('_MONTHS_AGE_REFDATE').AsInteger mod 12)*0.01	]);
						end;
//<RefDay>↑
					end;

					//入社年月日
					if GetFld('Nyuusha').IsNull = True then
					begin
						DMemPrint.FieldByName('Nyuusha').AsString	:='';
						DMemPrint.FieldByName('KinzokuNen').AsString:='';
					end
					else
					begin
						if iRekiKbn = 1  then	//<2009-03-23>
						begin
							DMemPrint.FieldByName('Nyuusha').AsString:=
										Formatdatetime('gg ',GetFld('Nyuusha').AsDatetime)+
										fnGetPrintYMD(GetFld('Nyuusha').AsDatetime,1)+'/'+
										fnGetPrintYMD(GetFld('Nyuusha').AsDatetime,2)+'/'+
										fnGetPrintYMD(GetFld('Nyuusha').AsDatetime,3);
						end
						else
						begin
							DMemPrint.FieldByName('Nyuusha').AsString
										:= FormatDateTime('YYYY/m/d',GetFld('Nyuusha').AsDateTime);
						end;

					//勤続年数
						DMemPrint.FieldByName('KinzokuNen').AsString
									:=Format('%2.2n',[	(GetFld('_MONTHS_SERVE').AsInteger div 12)+
														(GetFld('_MONTHS_SERVE').AsInteger mod 12)*0.01	]);
//<RefDay>↓
						if pPrnParam^.HapPrnSpt.iRefType > 0 then
						begin
							DMemPrint.FieldByName('KinzokuNen').AsString
										:=Format('%2.2n',[	(GetFld('_MONTHS_SERVE_REFDATE').AsInteger div 12)+
															(GetFld('_MONTHS_SERVE_REFDATE').AsInteger mod 12)*0.01	]);
						end;
//<RefDay>↑
					end;

					//等級
//<RefDay>↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then
					begin
						DMemPrint.FieldByName('Rank').AsString	:= GetFld('_RANK_CHGA').AsString;	//等級(基準日参照)
					end
					else
					begin
						if GetFld('Rank').AsInteger > 0 then
							DMemPrint.FieldByName('Rank').AsString:= GetFld('Rank').AsString;
					end;
//<RefDay>↑
					//採用区分
					DMemPrint.FieldByName('SaiyouName').AsString:= fnGetMNName(GetFld('Saiyou').AsInteger,110900);

					//出身校
					DMemPrint.FieldByName('GatukouName').AsString:= GetFld('GatukouName').AsString;

					//<131213>↓
					if GetFld('GatukouKubun').AsInteger > 0 then
					begin
						DMemPrint.FieldByName('GatukouName').AsString := fnGetHAPMNExName(GetFld('GatukouKubun').AsInteger, 111710);
					end;
					//<131213>↑

					Close;
					SQL.Clear;
					SQL.Add('SELECT MA.LongName');
//<RefDay>↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
					begin

						SQL.Add(',(SELECT CHGA.LongName');
						SQL.Add('FROM MP_HAP_HAPCHGA_STD(''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''',1) CHGA ');
						SQL.Add('WHERE CHGA.CorpNCode=0 AND CHGA.EmpNCode=:hEmpNCd');
						SQL.Add('AND CHGA.MasterKbn=:hMAKbn AND CHGA.AddPos=0 AND CHGA.DeptNCode>0)');
						SQL.Add('AS _LONGNAME_CHGA');							//所属,職種,役職,職能,職位(基準日参照)
					end;
//<RefDay>↑
					SQL.Add('FROM HAPCHG CHG INNER JOIN HojyoMA MA ON CHG.DeptNCode=MA.NCode');
					SQL.Add('AND CHG.MasterKbn=MA.MasterKbn');
					SQL.Add('WHERE CHG.CorpNCode=0 AND CHG.EmpNCode=:hEmpNCd');
					SQL.Add('AND CHG.MasterKbn=:hMAKbn AND CHG.AddPos=0 AND CHG.DeptNCode>0');
// <2006-08-25_4> ----- S
					SQL.Add('AND CHG.JinSts=1');
// <2006-08-25_4> ----- E

					for i:=0 to 4 do
					begin
						SetFld('hEmpNCd').AsFloat := iEmpNCd;

						case i of
							0:	SetFld('hMAKbn').AsInteger := 41;		//所属
							1:	SetFld('hMAKbn').AsInteger := 86;		//職種
							2:	SetFld('hMAKbn').AsInteger := 87;		//役職
							3:	SetFld('hMAKbn').AsInteger := 88;		//職能
							4:	SetFld('hMAKbn').AsInteger := 89;		//職位
						end;

						if not Open then
							Abort;

						sName := '';

						if not Eof then
						begin
							sName := GetFld('LongName').AsString;
						end;

//<RefDay>↓
						if pPrnParam^.HapPrnSpt.iRefType > 0 then				//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
						begin
							if not Eof then
							begin
								sName := GetFld('_LONGNAME_CHGA').AsString;		//所属,職種,役職,職能,職位(基準日参照)
							end;
						end;

//<RefDay>↑
						Close;

						case i of
							0:	DMemPrint.FieldByName('DeptName').AsString		:= sName;	//所属
							1:	DMemPrint.FieldByName('JobName').AsString		:= sName;	//職種
							2:	DMemPrint.FieldByName('PostName').AsString		:= sName;	//役職
							3:	DMemPrint.FieldByName('Ability').AsString		:= sName;	//職能
							4:	DMemPrint.FieldByName('WorkClassName').AsString := sName;	//職位
						end;
					end;

    				DMemPrint.Post;

					if iNo = 45 then
					begin
						iNo := 0;
					end;

//					Next;		//次ﾚｺｰﾄﾞ
				end;

				Result := TRUE;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'在職者'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
		end;

	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;
}
//<RefDay-faster> DEL ↑
//**********************************************************************
//	EVENT
//**********************************************************************
//**********************************************************************
//		Component	: Form
//		Event		: Destroy
//		Proccess	: 破棄時
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000052PPrnF.FormDestroy(Sender: TObject);
begin
	mqMA.Free;
	dsPrn.Free;
	MDBModule.CopDBClose(ddCopDB);

//	m_NSPDB := nil;
	m_HAPMN := nil;
end;

//**********************************************************************
//*		Proccess	:	ファイル出力に必要なTitle･Filed設定
//*		Parameter	:	sTitle	:	CreateされたTStringList(ﾀｲﾄﾙ用)
//*						sMemFld	:	CreateされたTStringList(ﾌｨｰﾙﾄﾞ用)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure THAP000052PPrnF.fnSetFileOut(CmnInfo:TMjsPrnSupport);
var
	sTitle		: TStringList;
	sMemFld		: TStringList;
	rcMsg		: TMjsMsgRec;
	i	:	Integer;
	s	:	String;
begin
	sTitle	:= TStringList.Create;		//ファイル出力用リスト(タイトル)作成
	sMemFld	:= TStringList.Create;		//ファイル
	sTitle.Add('社員No');
	sTitle.Add('氏名かな');
	sTitle.Add('氏名');
	sTitle.Add('所属');
	sTitle.Add('役職');
	sTitle.Add('性別');
	sTitle.Add('社員区分');
	sTitle.Add('生年月日');
	sTitle.Add('年齢');
	sTitle.Add('入社年月日');
	sTitle.Add('勤続年数');
	sTitle.Add('職能資格');
	sTitle.Add('等級号俸');				// 職能等級 → 等級号俸	<20110203>
	sTitle.Add('職種');
	sTitle.Add('職位');
	sTitle.Add('採用形態');
	sTitle.Add('出身校');

	With DMemPrint.FieldDefs do
	begin
		for i := 0 to Count-1 do
		begin
			s := DMemPrint.FieldDefs.Items[i].Name;
			sMemFld.Add(s);
		end;
	end;
	if MjsFileOut(DMemPrint, sMemFld, sTitle, pPrnParam^.MPrnSpt,pAppRec) = -1 then
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
//* Proccess	: 日付編集
//* Parameter	: SrcDate 日付
//* Return		: １：年 ２：月 ３：日
//**********************************************************************
function THAP000052PPrnF.fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
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
//		Proccess	: fnSetMNName
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000052PPrnF.fnSetMNName();
var
	DMQuery : TMQuery;
	rcMsg	: TMjsMsgRec;
	i		: Integer;
begin
	DMQuery := TMQuery.Create(self);
	if not Assigned(DMQuery)then
		Exit;

	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);

	try
		try
			with DMQuery do
			begin
				Close();
				SQL.Clear();
				SQL.Add(' SELECT * FROM HAPMN ');

				Open(True);
				if not Eof then
				begin
					SetLength(m_HAPMN, RecordCount);
					for i := 0 to RecordCount - 1 do
					begin
						m_HAPMN[i].KubunNo		:= GetFld('KubunNo').AsInteger;
						m_HAPMN[i].ItemNo		:= GetFld('ItemNo').AsInteger;
						m_HAPMN[i].KubunName	:= GetFld('KubunName').AsString;

						Next;
					end;
				end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(nil,'項目名'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			Abort;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//		Proccess	: fnGetMNName
//		Parameter	: 区分コード
//					項目コード
//		Return		: 区分名称
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000052PPrnF.fnGetMNName(iKubunNo, iItemNo: Integer): String;
var
	i	: Integer;
begin
	// ST UPD <20120316>
	// 社員区分の場合、初期値に'会社規定'を設定
	if	iItemNo = 110100	then
		Result	:=	'会社規定'
	else
		Result	:=	'';
	// ED UPD <20120316>
	
	if m_HAPMN = nil then
		exit;
	
	for i := 0 to Length(m_HAPMN) - 1 do
	begin
		if 	(m_HAPMN[i].KubunNo = iKubunNo) and
			(m_HAPMN[i].ItemNo	= iItemNo) then
		begin
			Result := m_HAPMN[i].KubunName;
			break;
		end;
	end;
end;

//<131213>↓
//************************************************************************
//*	Proccess		:	fnGetHAPMNExName
//*					:	学校・学科名取得
//*	Retrun			:
//*	History			:
//************************************************************************
function THAP000052PPrnF.fnGetHAPMNExName(KubunNo : Integer; KM_ItemNo : Integer) : String;
var
	qry		: TMQuery;
	rcMsg	: TMjsMsgRec;
begin
	Result	:= '';
	qry		:= TMQuery.Create(Self);											// MQueryの構築

	if Assigned(qry) <> True then
	begin
		Exit;
	end;

	MDBModule.SetDBInfoToQuery(ddCopDB, qry);									// DBとの接続
	try
		try
			with qry do
			begin
				Close();
				SQL.Clear();
				SQL.Add('SELECT'
						+	' Ex.KubunName '
						+ ' FROM'
						+	' HAPMNEx Ex'
						+ ' WHERE'
						+	' Ex.KubunNo = :KubunNo'
						+ ' AND'
						+	' Ex.ItemNo = :ItemNo');

				SetFld('KubunNo').AsInteger := KubunNo;
				SetFld('ItemNo').AsInteger := KM_ItemNo;

				Open(True);

				if Eof then														//該当ﾃﾞｰﾀ0件
				begin
					Exit;
				end;

				Result	:= FieldByName('KubunName').AsString;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'区分名称情報の' + sMsg, sTitle, IconType, BtnType, BtnDef, LogType);
			end;

			Exit;
		end;
	finally
		qry.Close;
		qry.Free;
	end;
end;
//<131213>↑
//<RefDay> ↓
//**********************************************************************
//		Proccess	:基準日日付編集
//		Name		:
//		Date		:5/28
//		Parameter	:日付
//		Return		:文字列
//		History		:
//**********************************************************************
function THAP000052PPrnF.fnGetSTDFormatDate(dDate : TDateTime): String;
begin
	Result := '';
	if dDate = 0 then
		Exit;

	if iRekiKbn = 1 then
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

end.
