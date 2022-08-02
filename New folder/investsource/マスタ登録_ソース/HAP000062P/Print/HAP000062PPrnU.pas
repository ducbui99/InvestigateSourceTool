//******************************************************************************
//		System		:MJSLINK給与太郎
//		Program		:個人別賞罰歴一覧表
//		ProgramID	:HAP000062PPrn
//		Name		:H.Itahana(Buntechno)
//		Create		:2005/07/20 H.Itahana
//		Comment		:
//		History		:2005/10/31
//					:・Application対応
//					:2005/12/12
//					:・戸籍名出力ビュー対応
//					:2005/12/27 H.Itahana(Buntechno)
//					:・本日変更社員印刷対応							<2005-12-27>
//					:2006/04/03 T.ABE (BUNTECHNO)
//					:・フリーコード編集対応							<060403>
//					:2006/04/05 N.Nakamura (TS2)
//					:・戸籍名フリガナ順対応							<060405>
//					:2006/07/14 H.Takaishi(Buntechno)
//					:・項目見出しの統一対応							<2006-07-14>
//					:2006/08/04 H.Takaishi(Buntechno)
//					:・項目見出しの統一対応(CSV出力)				<2006-08-04>
//					:2006/08/25 H.Takaishi (BUNTECHNO)
//					:・部門権限対応									<2006-08-25>
//					:2006/08/25 H.Takaishi (BUNTECHNO)
//					:・所属改頁時の所属名出力を簡易名称に修正		<2006-08-25_5>
//					:2006/09/07 H.Takaishi (BUNTECHNO)
//					:・印刷データなしの時[エラー]→[警告]			<2006-09-07>
//					:2007/05/02 H.Takaishi (BUNTECHNO)
//					:・部門権限対応（未所属社員は常に出力対象）		<2007-05-02>
//					:2007/05/07 H.Takaishi (BUNTECHNO)
//					:・所属改頁時のヘッダ部で未所属は「(所属なし)」	<2007-05-07>
//					:2008/06/09 H.Takaishi (TakumiCo.)
//					:・印刷履歴対応（MjsPreview経由で印刷処理実行）	<2008-06-09>
//					:	2011/06/15 Y.Kondo							<2011-06-15>
//					:	チェックリスト内の日付を標準化
//					:	懲罰区分名の表示不具合修正ついでの速度改善
//					:2020/04/24 Y.Iwakawa
//					:・基準日対応									<RefDay>
//******************************************************************************
//
//注意
//	DMemPrintの順番どおりにファイル出力されるため、順番を入れ替えないこと
//
//
//******************************************************************************

unit HAP000062PPrnU;

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

  THAP000062PPrnF = class(TForm)
	ppReport1: TppReport;
	ppDBPipeline1: TppDBPipeline;
	DSrcPrint: TDataSource;
	DMemPrint: TdxMemData;
	DMemPrintEmpNo: TStringField;
	DMemPrintEmpName: TStringField;
	DMemPrintDeptNo: TStringField;
	DMemPrintiLine: TIntegerField;
	DMemPrintEmpNCd: TStringField;
	DMemPrintSanctionsKubun: TIntegerField;
	DMemPrintSanctionsKubunName: TStringField;
	DMemPrintSanctionsRemarks: TStringField;
	DMemPrintSanctionsDate: TStringField;
	DMemPrintSanctionsNameName: TStringField;
	ppHeaderBand1: TppHeaderBand;
	Label_Title: TppLabel;
	pphlCopNoSf: TppLabel;
	pphlCopNameSf: TppLabel;
	pphsvDateSf: TppSystemVariable;
	ppLine2: TppLine;
	ppLDeptNo: TppLabel;
	ppLDeptName: TppLabel;
	ppLabel2: TppLabel;
	ppLabel1: TppLabel;
	Label_Name: TppLabel;
	ppLine1: TppLine;
	ppLine3: TppLine;
	ppLine4: TppLine;
	ppLine5: TppLine;
	ppLine6: TppLine;
	ppLine7: TppLine;
	ppLine9: TppLine;
	Label_Bunya: TppLabel;
	ppLabel3: TppLabel;
	ppLine11: TppLine;
	ppLabel6: TppLabel;
	ppLine12: TppLine;
	ppDetailBand1: TppDetailBand;
	ppDBText2: TppDBText;
	ppDBText1: TppDBText;
	ppDBText13: TppDBText;
	ppDBText15: TppDBText;
	ppLine18: TppLine;
	ppLine20: TppLine;
	ppLine21: TppLine;
	ppLine23: TppLine;
	ppLine24: TppLine;
	ppLine22: TppLine;
	ppLine10: TppLine;
	ppLine15: TppLine;
	ppDBText8: TppDBText;
	ppLine8: TppLine;
	ppDBText5: TppDBText;
	ppLine14: TppLine;
	ppFooterBand1: TppFooterBand;
	ppfsvPageSf: TppSystemVariable;
	LppAccOfficeSf: TppLabel;
	ppGroup2: TppGroup;
	ppGroupHeaderBand2: TppGroupHeaderBand;
	ppGroupFooterBand2: TppGroupFooterBand;
	ppDBText3: TppDBText;
	DMemPrintDeptNCd: TFloatField;
	DMemPrintBunya: TStringField;
	ppLine13: TppLine;
	Label_Kbn: TppLabel;
    ppLRefDate: TppLabel;

	procedure FormCreate(Sender:TObject);
	constructor CreateForm(	pRec,pParam:Pointer);
	procedure FormDestroy(Sender: TObject);
	procedure ppDetailBand1BeforePrint(Sender: TObject);
	procedure ppHeaderBand1BeforePrint(Sender: TObject);
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
	iNo			: integer;

	giParamMode	: Integer;														//パラメータ 0:褒賞 1:懲罰

	procedure fnSetFileOut(CmnInfo:TMjsPrnSupport);
	function fnGetDeptName(DeptNCd : Int64):string;
	procedure DoPrint;

	function fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;			//基準日日付表示のため復活 <RefDay>
	function fnGetKMName(iItemNo: Integer): String;
//	function fnDtKubunGet(sCode : String):string;
	function fnGetData(iEmpNCd: Int64; sEmpNo, sEmpName: String;
	  iDeptNCd: int64; sDeptNo: string): Boolean;
	function fnGetSTDFormatDate(dDate:TDateTime):String;                              //日付フォーマット用 <RefDay>

  public
	{ Public 宣言 }
  end;

function AppEntry(pPar:pointer):integer;		//SystemMenu->Self
exports
  AppEntry;

implementation
uses
	HAPLibU,
	MjSDispCtrl,
	MJSCommonu;
const
//	SyoName	: Array[1..2] of String = ('社内褒賞','社外褒賞');
//	TyoName	: Array[1..2] of String = ('社内懲罰','社外懲罰');

	SYOU_CODE	= 171500;
	BATSU_CODE	= 171900;

	CST_TITLE_HOUSYOU	= '個人別褒賞歴一覧表';
	CST_TITLE_TYOUBATSU	= '個人別懲罰歴一覧表';



{$R *.DFM}

//----------------------------------------------------------------------
//	Package Export Function
//----------------------------------------------------------------------
//**********************************************************************
//		Proccess	:
//		Name		:
//		Date		:2001/12/13
//		Parameter	:pPar	:pointer
//		Return		:ACTID_RET_OK	:
//					:ACTID_RET_NG	:不正
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function AppEntry(pPar:pointer):integer;
var
	pForm	: ^THAP000062PPrnF;
	pRec	: ^TMjsAppRecord;
	pParam	: pointer;
	iAction	: integer;
begin
	Result	:= ACTID_RET_NG;
	pRec	:= Pointer( TAppParam( pPar^ ).pRecord );		//TMjsAppRecord 構造体 pointer 取得
	pParam	:= Pointer( TAppParam( pPar^ ).pActionParam);	//TMjsAppRecord 構造体 pointer 取得
	iAction := TAppParam( pPar^ ).iAction;					//Action ID 取得
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
				pForm^ := THAP000062PPrnF.CreateForm( pRec,pParam );
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
			THAP000062PPrnF(pForm^).DoPrint;
		end;
	end;
	Result	:=ACTID_RET_OK;
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
procedure THAP000062PPrnF.FormCreate(Sender: TObject);
begin
	with pPrnParam^.MPrnSpt do
	begin
		//Mjs印刷ﾀﾞｲｱﾛｸﾞの指定とｺﾝﾎﾟｰﾈﾝﾄを連結
		ApRB			:= ppReport1;		//帳票
		pPage			:= ppfsvPageSf;		//頁
		pDate			:= pphsvDateSf;		//日付
		pCorpCode		:= pphlCopNoSf;		//会社ｺｰﾄﾞ
		pCorpName		:= pphlCopNameSf;	//会社名
		pAccountOffice	:= LppAccOfficeSf;	//会計事務所名
	end;
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
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
constructor THAP000062PPrnF.CreateForm(pRec,pParam: Pointer);
var
	iCnt		: Integer;
	POwnerForm	: ^TControl;													//2005-10-31
begin

	pAppRec	:= pRec;			//MjsAppRecord
	pPrnParam :=pParam;

//2005-10-31
	POwnerForm := pAppRec^.m_pChildForm;										// オーナーフォームを取得

	giParamMode := pPrnParam.HapPrnSpt.iListPara;
																				//会社ＤＢオープン
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
			SQL.Add('SELECT CalendarKbn FROM HAPM3');

			if not Open then Abort;
			if Eof then Abort;

			iRekiKbn		:= GetFld('CalendarKbn').AsInteger ;

			Close;
		end;
	except
		mqMA.Free;
		dsPrn.Free;
		MDBModule.CopDBClose(ddCopDB);
		raise Exception.Create('会社情報 取得失敗');
	end;

//2005-10-31
//	inherited Create(Application);
	inherited Create(POwnerForm^);
end;
//**********************************************************************
//	PUPLIC
//**********************************************************************
//**********************************************************************
//		Proccess	:印刷
//		Name		:Yoshitaka Kondo(BUNTECHNO)
//		Date		:2002/02/18
//		History		:04/08/04(T.Aoki)
//					:在職/支払形態の指定に対応
//					:05/12/12	T.Abe(BUNTECHNO)
//					:戸籍名出力ビュー対応
//**********************************************************************
procedure THAP000062PPrnF.DoPrint;
var
	mqPrn	: TMQuery;
	i		: integer;
	bData	: Boolean;

	sDeptNCdB	: String;
	sName	: String;
begin
//<RefDay> ↓
	//基準日（日付）の印字
	if pPrnParam.HapPrnSpt.iRefType > 0 then
	begin
		ppLRefDate.Caption := fnGetSTDFormatDate(pPrnParam^.HapPrnSpt.dRefDate);
	end
	else
	begin
		ppLRefDate.Caption := fnGetSTDFormatDate(Now());
	end;
//<RefDay> ↑

	if (pPrnParam^.HapPrnSpt.bPageBreak)
		and ((pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU)
		or (pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI)) then				//改頁[あり]
		ppReport1.Groups[0].NewPage := pPrnParam^.HapPrnSpt.bPageBreak
	else
		ppReport1.Groups[0].NewPage := False;


	//フリーコード編集対応 <060403>
	if iEmpAttribute = 2 then
		ppDBText1.Alignment	:= taLeftJustify
	else
		ppDBText1.Alignment	:= taRightJustify;

	if iDeptAttribute = 2 then
		ppLDeptNo.Alignment	:= taLeftJustify
	else
		ppLDeptNo.Alignment	:= taRightJustify;


	bData := FALSE;
	try
		// ヘッダー名称セット
		if giParamMode = 0 then	//褒賞
		begin
			Label_Title.Caption	:= CST_TITLE_HOUSYOU;
			Label_Name.Caption	:= fnGetKMName(171501);							// 褒賞名
			ppLabel6.Caption	:= fnGetKMName(171600);							// 褒賞年月日
			ppLabel3.Caption	:= fnGetKMName(171700);							// 褒賞理由
// <2006-07-14> ----- S
//			Label_Kbn.Caption	:= fnGetKMName(171500);							// 褒賞区分
//			Label_Bunya.Caption	:= fnGetKMName(171400);							// 褒賞分野
			Label_Kbn.Caption	:= fnGetKMName(171531);							// 褒賞区分
			Label_Bunya.Caption	:= fnGetKMName(171521);							// 褒賞分野
// <2006-07-14> ----- E
		end
		else					//懲罰
		begin
			Label_Title.Caption	:= CST_TITLE_TYOUBATSU;
			Label_Name.Caption	:= fnGetKMName(171901);							// 懲罰名
			ppLabel6.Caption	:= fnGetKMName(172000);							// 懲罰年月日
			ppLabel3.Caption	:= fnGetKMName(172100);							// 懲罰理由
// <2006-07-14> ----- S
//			Label_Kbn.Caption	:= fnGetKMName(171900);							// 懲罰区分
//			Label_Bunya.Caption	:= fnGetKMName(171800);							// 懲罰分野
			Label_Kbn.Caption	:= fnGetKMName(171931);							// 懲罰区分
			Label_Bunya.Caption	:= fnGetKMName(171921);							// 懲罰分野
// <2006-07-14> ----- E
		end;

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
					Add('SELECT');
					Add(' SC.GCode');
					Add(',SC.NCode');
					Add(',MS.Name');

					// 戸籍名出力ビュー対応
					Add(',MS.TrueNameU');

					Add(',ISNULL('		);			//所属内部No
					Add(' (SELECT'		);
					Add('	DeptNCode'	);
					Add('  FROM'		);
					Add('	MV_HAP_HAPCHG'	);
					Add('  WHERE'		);
					Add('	MasterKbn=41'	);
					Add('	AND'		);
					Add('	AddPos=0'	);
					Add('	AND'		);
					Add('	EmpNCode=SC.NCode)'	);
					Add(' ,'''')');
					Add(' AS');
					Add(' DeptNCd');

					Add(',ISNULL(');				//所属No
					Add(' (SELECT');
					Add('	DeptGCode');
					Add('  FROM');
					Add('	MV_HAP_HAPCHG');
					Add('  WHERE');
					Add('	MasterKbn=41');
					Add('	AND'		);
					Add('	AddPos=0'	);
					Add('	AND');
					Add('	EmpNCode=SC.NCode)');
					Add(' ,'''')');
					Add(' AS');
					Add(' DeptNo');

					Add(',ISNULL(');				//体系順
					Add(' (SELECT');
					Add('	OrderNo');
					Add('  FROM');
//<RefDay> ↓
					if pPrnParam.HapPrnSpt.iRefType > 0 then
						Add('MP_HAP_HAPCHG_STD(:RefDate)')
//<RefDay> ↑
					else
						Add('MV_HAP_HAPCHG');
					Add('  WHERE');
					Add('	MasterKbn=41');
					Add('	AND'		);
					Add('	AddPos=0'	);
					Add('	AND');
					Add('	EmpNCode=SC.NCode)');
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

					//TABLE
					Add('FROM');
					Add(	'HAPSC SC');

					// 戸籍名出力ビュー対応
					Add('INNER JOIN MV_HAP_CMNMOS MS');

					Add('ON SC.NCode=MS.NCode'			);
//<RefDay> ↓ 基準日 - 入社年月日判定用
					if pPrnParam.HapPrnSpt.iRefType > 0 then
					begin
                        Add('INNER JOIN HAPSY SY');
                        Add('ON  SC.NCode     = SY.EmpNCode');
                        Add('AND SC.CorpNCode = SY.CorpNCode');
                    end;
//<RefDay> ↑
					Add('WHERE');
//2005-08-30
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
							Add('DeptNCd IN (')
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
					if pPrnParam.HapPrnSpt.iRefType > 0 then
						Add(' AND ((SY.Nyuusha <= :RefDate) OR (SY.Nyuusha IS NULL))');
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
//<RefDay> ↓
					if pPrnParam.HapPrnSpt.iRefType > 0 then
						SetFld('RefDate').AsDateTime := pPrnParam.HapPrnSpt.dRefDate;
//<RefDay> ↑
				end;

				try
					Open;
					if not Eof then												//印刷ﾃﾞｰﾀ有
					begin
						iNo:=0;
						DMemPrint.Close;
						DMemPrint.Open;

						while not eof do
						begin
							if (pPrnParam^.HapPrnSpt.bPageBreak)
								and ((pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU)
								or (pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI))
								and (sDeptNCdB <> GetFld('DeptNCd').AsString) then	//改頁[あり]
								iNo := 0;

							// 戸籍名出力対応
							if pPrnParam^.HapPrnSpt.iNameType = 1 then
								sName	:= GetFld('TrueNameU').AsString
							else
								sName	:= GetFld('Name').AsString;

							if fnGetData(	Trunc(GetFld('NCode').AsFloat),
											GetFld('GCode').AsString,
											sName,
											Trunc(GetFld('DeptNCd').AsFloat),
											GetFld('DeptNo').AsString) then
								bData := TRUE;
							sDeptNCdB := GetFld('DeptNCd').AsString;
							next;
						end;

						if not bData then
						begin
							// 賞罰
// <2006-09-07> ----- S
//							MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjError,mjdefOK);
							MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjWarning,mjdefOK);
// <2006-09-07> ----- E
							exit;
						end;

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
	iNo:=0;
end;


//**********************************************************************
//		Proccess	: 印刷のデータを取る
//		Name		: Yoshitaka Kondo (BUNTECHNO)
//		Date		: 2002/02/06
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000062PPrnF.fnGetData(	iEmpNCd: Int64;								//社員内部
									sEmpNo: String;								//社員外部
									sEmpName: String;							//社員氏名
									iDeptNCd: int64;							//所属内部
									sDeptNo: string):Boolean;					//所属外部
var
	DMQuery	: TMQuery;
	DMQuery2: TMQuery;
	rcMsg	: TMjsMsgRec;

	sEmpNCdB: String;

const
	DEF_DATE = '1890/12/30';

begin
	Result := False;

	DMQuery := TMQuery.Create(Self);											//MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;
	MDBModule.SetDBInfoTOQuery(ddCopDB,DMQuery);								//DBとの接続

	DMQuery2 := TMQuery.Create(Self);											//MQueryの構築
	if Assigned(DMQuery2) <> True then
	begin
		DMQuery.Free;
		Exit;
	end;
	MDBModule.SetDBInfoTOQuery(ddCopDB,DMQuery2);								//DBとの接続
	try
		try
			with DMQuery do
			begin
				Close;
				SQL.Clear;
				SQL.Add(' Select *,');
				SQL.Add(' IsNull(OrderDate,ConVert(DateTime,'+''''+DEF_DATE+''''+')) OrderDate');
//<RefDay> ↓
				//基準日指定時
				if pPrnParam.HapPrnSpt.iRefType > 0 then
                begin
					SQL.Add(' FROM MP_HAP_HAPRWD_STD('
									+''''+FormatDateTime('yyyy-mm-dd', pPrnParam.HapPrnSpt.dRefDate)+''''+')');
                end
//<RefDay> ↑
                else
				begin
					SQL.Add(' FROM HAPRwd');
                end;
				SQL.Add(' Where EmpNCode='+ inttostr(iEmpNCd));
				SQL.Add(' AND RwdKbn=:hRwdKbn');
				SQL.Add(' ORDER BY OrderDate DESC ,SameDateOrder,RwdNCode DESC');

				if giParamMode = 0 then		//褒賞
					SetFld('hRwdKbn').AsInteger := 0
				else						//懲罰
					SetFld('hRwdKbn').AsInteger := 1;

				Open(True);

				while not Eof do
				begin
					Result := TRUE;
					sEmpNCdB := DMemPrint.FieldByName('EmpNCd').AsString;

					inc(iNo);
					DMemPrint.Append;

					if (sEmpNCdB <> IntToStr(iEmpNCd))
					or ((iNo = 1) and (pPrnParam^.MPrnSpt.iCommand <> PDLG_FILE)) then	//ファイル出力以外
					begin
						//社員ｺｰﾄﾞ
						DMemPrint.FieldByName('EmpNo').AsString :=
									HapCodeAttribute2(sEmpNo,iEmpDigit,iEmpAttribute);
						//社員名
						DMemPrint.FieldByName('EmpName').AsString := sEmpName;
					end;
					DMemPrint.FieldByName('EmpNCd').AsString := inttostr(iEmpNCd);

					//所属ｺｰﾄﾞ
					if (iDeptNCd <> 0) then
					begin
						DMemPrint.FieldByName('DeptNCd').AsFloat := iDeptNCd;
						DMemPrint.FieldByName('DeptNo').AsString :=
								HapCodeAttribute2(sDeptNo,iDeptDigit,iDeptAttribute);
					end;

					if iNo = 45 then
					begin
						iNo := 0;
						DMemPrint.FieldByName('iLine').AsInteger := 1;
					end
					else
						DMemPrint.FieldByName('iLine').AsInteger := 0;


		//別Query　↓↓↓--------------------------
//<2011-06-15> S
{					DMQuery2.Close;
					DMQuery2.SQL.Clear;
					DMQuery2.SQL.Add('SELECT MN.KubunName'		);
					DMQuery2.SQL.Add('FROM HAPMNEx As MN'		);
					DMQuery2.SQL.Add('INNER JOIN HAPKM As KM'	);
					DMQuery2.SQL.Add('ON KM.ItemNo=MN.ItemNo'	);
					DMQuery2.SQL.Add('WHERE KM.ItemNo=:hItemNo'	);
					DMQuery2.SQL.Add('AND MN.KubunNo=:hKubunNo'	);

					if giParamMode = 0 then
						DMQuery2.SetFld('hItemNo').AsInteger	:= SYOU_CODE
					else
						DMQuery2.SetFld('hItemNo').AsInteger	:= BATSU_CODE;

					DMQuery2.SetFld('hKubunNo').AsInteger := DMQuery.GetFld('KubunNo').AsInteger;

					DMQuery2.Open(True);

					if not DMQuery2.Eof then
					begin
				//褒賞名
						DMemPrint.FieldByName('SanctionsNameName').AsString := DMQuery2.GetFld('KubunName').AsString;
					end;

					DMQuery2.Close;
					DMQuery2.SQL.Clear;
					DMQuery2.SQL.Add('SELECT EB.FieldName FROM HAPMNEb AS EB');
					DMQuery2.SQL.Add('INNER JOIN HAPMNEx AS EX'				);
					DMQuery2.SQL.Add('ON EX.FieldCode=EB.FieldCode'			);
					DMQuery2.SQL.Add('AND EX.ItemNo=EB.ItemNo'				);
					DMQuery2.SQL.Add('WHERE Ex.ItemNo=:hItemNo'				);
					DMQuery2.SQL.Add('AND Ex.KubunNo=:hKbnNo'				);

					if giParamMode = 0 then
						DMQuery2.SetFld('hItemNo').AsInteger	:= SYOU_CODE
					else
						DMQuery2.SetFld('hItemNo').AsInteger	:= BATSU_CODE;

					DMQuery2.SetFld('hKbnNo').AsInteger	:=	DMQuery.GetFld('KubunNo').AsInteger;

					if not DMQuery2.Open then
						Abort;

					if not DMQuery2.Eof then
					begin
				//褒賞分野
						DMemPrint.FieldByName('Bunya').AsString := DMQuery2.GetFld('FieldName').AsString;
					end;
		//別Query　↑↑↑--------------------------


				//褒賞区分
					DMemPrint.FieldByName('SanctionsKubun').AsString		:= fnDtkubunGet(DMQuery.GetFld('KubunNo').AsString);
					DMemPrint.FieldByName('SanctionsKubunName').AsString	:= SyoName[DMemPrint.FieldByName('SanctionsKubun').AsInteger];

				//特記事項
					DMemPrint.FieldByName('SanctionsRemarks').AsString := DMQuery.GetFld('RwdRemarks').AsString;

				//褒賞日
					DMemPrint.FieldByName('SanctionsDate').AsString := '';

					if GetFld('OrderDate').AsDateTime > 0 then
					begin
						if iRekiKbn=1 then
							DMemPrint.FieldByName ('SanctionsDate').AsString :=
												Formatdatetime('gg ',GetFld('OrderDate').AsDatetime)+
												fnGetPrintYMD(GetFld('OrderDate').AsDatetime,1)+'/'+
												fnGetPrintYMD(GetFld('OrderDate').AsDatetime,2)+'/'+
												fnGetPrintYMD(GetFld('OrderDate').AsDatetime,3)
						else
							DMemPrint.FieldByName ('SanctionsDate').AsString
												:= FormatDateTime('YYYY/m/d',GetFld('OrderDate').AsDateTime);
					end;
}
					DMQuery2.Close;
					DMQuery2.SQL.Clear;
					DMQuery2.SQL.Add('SELECT *'		);
					DMQuery2.SQL.Add('FROM MV_HAP_HAPMNEx'	);
					DMQuery2.SQL.Add('WHERE ItemNo=:hItemNo'
									+ ' AND KubunNo=:hKbnNo');

					if giParamMode = 0 then
						DMQuery2.SetFld('hItemNo').AsInteger	:= SYOU_CODE
					else
						DMQuery2.SetFld('hItemNo').AsInteger	:= BATSU_CODE;

					DMQuery2.SetFld('hKbnNo').AsInteger	:= GetFld('KubunNo').AsInteger;

					if not DMQuery2.Open then
						Abort;

					if not DMQuery2.Eof then
					begin
						//褒賞名
						DMemPrint.FieldByName('SanctionsNameName').AsString := DMQuery2.GetFld('KubunName').AsString;
						//褒賞分野
						DMemPrint.FieldByName('Bunya').AsString := DMQuery2.GetFld('FieldName').AsString;
					end;

		//別Query　↑↑↑--------------------------


				//褒賞区分
					DMemPrint.FieldByName('SanctionsKubun').AsString		:= DMQuery2.GetFld('DtKubun1').AsString;
					DMemPrint.FieldByName('SanctionsKubunName').AsString	:= DMQuery2.GetFld('DtKubun1N').AsString;

				//特記事項
					DMemPrint.FieldByName('SanctionsRemarks').AsString	:= GetFld('RwdRemarks').AsString;

				//褒賞日
					DMemPrint.FieldByName('SanctionsDate').AsString		:= '';

					if GetFld('OrderDate').AsDateTime > 0 then
					begin
						if iRekiKbn=1 then
							DMemPrint.FieldByName ('SanctionsDate').AsString
												:= MjsGetGengou(GetFld('OrderDate').AsDatetime,MdtCMP_YMD)
												+	Formatdatetime(' ee/mm/dd',GetFld('OrderDate').AsDatetime)
						else
							DMemPrint.FieldByName ('SanctionsDate').AsString
												:= FormatDateTime('YYYY/mm/dd',GetFld('OrderDate').AsDateTime);
					end;
//<2011-06-15> E

					Next;		//次ﾚｺｰﾄﾞ
				end;

			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'賞罰'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
		end;

	finally
		DMQuery.Close;
		DMQuery.Free;
		DMQuery2.Close;
		DMQuery2.Free;
	end;

	if Result = True then
	begin
		DMemPrint.Edit;
		DMemPrint.FieldByName('iLine').AsInteger:=1;
		DMemPrint.Post;
	end;
end;

//**********************************************************************
//	EVENT
//**********************************************************************
//**********************************************************************
//		Component	: Form
//		Event		: Destroy
//		Proccess	: 破棄時
//		Name		: QiuRong
//		Date		: 2001/04/02
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000062PPrnF.FormDestroy(Sender: TObject);
begin
	mqMA.Free;
	dsPrn.Free;
	MDBModule.CopDBClose(ddCopDB);
end;

//**********************************************************************
//		Component	:ppDetailBand1
//		Event		:BeforePrint
//		Proccess	:社員単位での下線表示
//		Name		:Yoshitaka Kondo
//		Date		:2002/03/28
//**********************************************************************
procedure THAP000062PPrnF.ppDetailBand1BeforePrint(Sender: TObject);
begin
	if DMemPrint.FieldByName('iLine').AsInteger=1 then
	begin
		ppLine18.Visible:=True;
	end
	else
	begin
		ppLine18.Visible:=False;
	end;
end;

//**********************************************************************
//*		Proccess	:	ファイル出力に必要なTitle･Filed設定
//*		Name		:	Yoshitaka Kondo (BUNTECHNO)
//*		Date		:	2002/02/18
//*		Parameter	:	sTitle	:	CreateされたTStringList(ﾀｲﾄﾙ用)
//*						sMemFld	:	CreateされたTStringList(ﾌｨｰﾙﾄﾞ用)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure THAP000062PPrnF.fnSetFileOut(CmnInfo:TMjsPrnSupport);
var
	sTitle	: TStringList;
	sMemFld	: TStringList;
	rcMsg	: TMjsMsgRec;
	i		: Integer;
	s		: String;
begin
	sTitle	:= TStringList.Create;		//ファイル出力用リスト(タイトル)作成
	sMemFld	:= TStringList.Create;		//ファイル

	sTitle.Add('社員No'	);
	sTitle.Add('氏名'	);

	if giParamMode = 0 then				//褒賞
	begin
		sTitle.Add(fnGetKMName(171501));					//賞罰名
// <2006-08-04> ----- S
//		sTitle.Add(fnGetKMName(171400));					//賞罰分野
//		sTitle.Add(fnGetKMName(171500));					//賞罰区分
		sTitle.Add(fnGetKMName(171521));					//賞罰分野
		sTitle.Add(fnGetKMName(171531));					//賞罰区分
// <2006-08-04> ----- E
		sTitle.Add(fnGetKMName(171600));					//賞罰年月日
		sTitle.Add(fnGetKMName(171700));					//賞罰理由
	end
	else								//懲罰
	begin
		sTitle.Add(fnGetKMName(171901));					//賞罰名
// <2006-08-04> ----- S
//		sTitle.Add(fnGetKMName(171800));					//賞罰分野
//		sTitle.Add(fnGetKMName(171900));					//賞罰区分
		sTitle.Add(fnGetKMName(171921));					//賞罰分野
		sTitle.Add(fnGetKMName(171931));					//賞罰区分
// <2006-08-04> ----- S
		sTitle.Add(fnGetKMName(172000));					//賞罰年月日
		sTitle.Add(fnGetKMName(172100));					//賞罰理由
	end;

	With DMemPrint.FieldDefs do
	begin
		for i := 0 to Count-6 do
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
//		Component	:ppHeaderBand1
//		Event		:BeforePrint
//		Proccess	:社員所属毎改頁で、帳票の所属を出力
//		Name		:上海未来
//		Date		:2001/08/10
//		Parameter	:
//		Return		:
//		History		:2002/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000062PPrnF.ppHeaderBand1BeforePrint(Sender: TObject);
begin
	ppLDeptNo.Caption :=
		HapCodeAttribute2(DMemPrint.FieldByName('DeptNo').AsString,iDeptDigit,iDeptAttribute);

	ppLDeptName.Caption := fnGetDeptName(Trunc(DMemPrint.FieldByName('DeptNCd').AsFloat));

	ppLDeptNo.Visible := ppReport1.Groups[0].NewPage ;

	ppLDeptName.Visible := ppReport1.Groups[0].NewPage ;
end;

//**********************************************************************
//		Proccess	:fnGetDeptName
//		Name		:上海未来
//		Date		:2001/08/10
//		Parameter	:DeptNCd
//		Return		:DeptName
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000062PPrnF.fnGetDeptName(DeptNCd: Int64): string;
var
	DMQuery : TMQuery;
	rcMsg	: TMjsMsgRec;
begin
	result:= '';

	if DeptNCd = 0 then
	begin
		// <2007-05-07>
		result:= '(所属なし)';
		Exit;
	end;

	DMQuery := TMQuery.Create(self);

	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	MDBModule.SetDBInfoToQuery(ddCopDB,DMQuery);

	try
		try
			with DMQuery do
			begin
				Close();
				SQL.Clear();
// <2006-08-25_5> ----- S
//				SQL.Add('SELECT LongName FROM MV_HAP_HAPCHG'	);
				SQL.Add('SELECT SimpleName FROM MV_HAP_HAPCHG'	);
// <2006-08-25_5> ----- E
				SQL.Add('WHERE DeptNCode = :hDeptNCd'			);
				SQL.Add('AND MasterKbn=41 AND AddPos=0'			);

//				ParamByName('hDeptNCd').AsFloat := DeptNCd;
				ParamByName('hDeptNCd').AsString	:= IntToStr(DeptNCd);

				Open();
				if not eof then
				begin
// <2006-08-25_5> ----- S
//					Result:= DMQuery.GetFld('LongName').AsString;
					Result:= DMQuery.GetFld('SimpleName').AsString;
// <2006-08-25_5> ----- E
				end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'所属名'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			Abort;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;


//**********************************************************************
//* Proccess	: 日付編集
//* Name		: kos
//* Date		: 2001/06/22
//* Parameter	: SrcDate 日付
//* Return		: １：年 ２：月 ３：日
//**********************************************************************
function THAP000062PPrnF.fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
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


//***********************************************************************
//	Proccess	: 項目名称を取得
//	Name		: Y.Kondo(BUNTECHNO)
//	Date		: 2002/02/20
//	Paremeter	:
//	Return		: Name : 項目名称 ;取得失敗:NULL
//	History		: 2099/99/99 X.Xxxxx
//				: @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//***********************************************************************
function THAP000062PPrnF.fnGetKMName(iItemNo: Integer): String;
var
	DMQuery	: TMQuery;
	rcMsg	: TMjsMsgRec;
begin
	Result	:= '';

	DMQuery := TMQuery.Create(self);
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;
	MDBModule.SetDBInfoTOQuery(ddCopDB,DMQuery);

	try
		try
			with DMQuery do
			begin
				Close();
				SQL.Clear();

				SQL.Add('SELECT'	);
				SQL.Add(	'ItemName');
				SQL.Add('FROM'		);
				SQL.Add(	'HAPKM'	);
				SQL.Add('WHERE'		);
				SQL.Add(	'ItemNo = :ItemNo');

				SetFld('ItemNo').AsInteger := iItemNo;

				Open;
				if not Eof then
					Result := GetFld('ItemName').AsString;
			end;

		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'区分名称の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
				abort;
			end;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;


//******************************************************************************
//	Component		:	ppReport1
//	Event			:	BeforePrint
//	Name			:	Y.Kondo(BUNTECHNO)
//******************************************************************************
procedure THAP000062PPrnF.ppReport1BeforePrint(Sender: TObject);
begin
	pPrnParam^.MPrnSpt.BeforePrint(Sender);
end;

//**********************************************************************
//		Process		:項目名取得
//		Name		:T.Aoki
//		Date		:02/02/06
//		Parameter	:gr:対象となるｸﾞﾘｯﾄﾞ
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
{function THAP000062PPrnF.fnDtKubunGet(sCode : String):string;
var
	sSQL	: string;
	mqKM	: TMQuery;
begin
	result := '';
	mqKM := TMQuery.Create(Self);							// MQueryの構築

	if Assigned(mqKM) <> true then
	begin
		Exit;
	end;
	MDBModule.SetDBInfoTOQuery(ddCopDB,mqKM);				//DBとの接続

	try
		sSQL := 'SELECT Dtkubun1 FROM HAPMNEx'
		+#13#10+'WHERE ItemNo=:hItemNo'
		+#13#10+'AND KubunNo=:hKbnNo';

		with mqKM do
		begin
			Close;
			SQL.Clear;
			SQL.Add(sSQL);

			if giParamMode = 0 then
				SetFld('hItemNo').AsInteger	:= SYOU_CODE
			else
				SetFld('hItemNo').AsInteger	:= BATSU_CODE;

			SetFld('hKbnNo').AsString	:= sCode;

			try
				Open(True);

				if IsEmpty then
					Abort;

				Result:=GetFld('Dtkubun1').AsString;
			except
				raise Exception.Create('区分の取得に失敗しました。');
			end;
		end;
	finally
		mqKM.Free;
	end;
end;
}

//<RefDay> ↓
//**********************************************************************
//		Process		:歴区分に従って日付を編集する
//		Parameter	:dDate: 基準日日付
//		Return		:編集した日付
//		History		:
//**********************************************************************
function THAP000062PPrnF.fnGetSTDFormatDate(dDate:TDateTime):String;
begin
	Result := '';

	if dDate = 0 then
		Exit;

	if iRekiKbn = 1 then
	begin
		//和暦
		Result	:= FormatDateTime('gg', dDate) +
						fnGetPrintYMD(dDate, 1) + '年' +
						fnGetPrintYMD(dDate, 2) + '月' +
						fnGetPrintYMD(dDate, 3) + '日 現在';
	end
	else
	begin
		//西暦
		Result	:= FormatDateTime('yyyy', dDate)+ '年' +
						fnGetPrintYMD(dDate, 2) + '月' +
						fnGetPrintYMD(dDate, 3) + '日 現在';
    end;
end;
//<RefDay> ↑
end.
