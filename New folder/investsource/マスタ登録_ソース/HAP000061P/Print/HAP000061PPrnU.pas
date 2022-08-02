//******************************************************************************
//		System		:MJSFX
//		Program		:個人別受講歴一覧表
//		ProgramID	:HAP000061PPrn
//		Name		:H.Itahana(Buntechno)
//		Create		:2005/07/20
//		Comment		:
//		History		:2005/10/31 H.Itahana(Buntechno)
//					:・Application対応
//					:2005/12/09 T.Abe(Buntechno)
//					:・戸籍名出力ビュー対応
//					:2005/12/27 H.Itahana(Buntechno)
//					:・本日変更社員印刷対応							<2005-12-27>
//					:2006/04/03 T.ABE (BUNTECHNO)
//					:・フリーコード編集対応							<060403>
//					:2006/04/05 N.Nakamura (TS2)
//					:・戸籍名フリガナ順対応							<060405>
//					:2006/07/14 H.Takaishi(Buntechno)
//					:・項目見出しの統一対応							<2006-07-14>
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
//					:2011/05/25 R.Kobayashi (TakumiCo.)
//					:・修了予定日,団体名,受講金額を追加				<2011-05-25>
//					:2011/07/05 H.Yamashiro
//					:・研修日（自・至）を西暦で出力した場合、ゼロ詰めで出力されるよう改良		<20110705>
//					:2011/07/12	H.Yamashiro
//					:・修了予定日を西暦で出力した場合、ゼロ詰めで出力されるよう改良				<20110712>
//					:2011/08/09	H.Yamashiro
//					:・日付フォーマット統一														<20110809>
//					:2014/04/15	E.Inukai
//					:・フリー項目対応															<140415>
//					:2020/04/24	Y.Iwakawa
//					:・基準日対応																<RefDay>
//******************************************************************************
//注意
//	DMemPrintの順番どおりにファイル出力されるため、順番を入れ替えないこと
//
//
//******************************************************************************

unit HAP000061PPrnU;

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

  THAP000061PPrnF = class(TForm)
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
	ppDBText15: TppDBText;
	DMemPrintDeptNo: TStringField;
	ppLine2: TppLine;
	ppLine1: TppLine;
	ppLine3: TppLine;
	ppLine4: TppLine;
	ppLine5: TppLine;
	ppLine6: TppLine;
	ppLine7: TppLine;
	ppLine9: TppLine;
	ppLine18: TppLine;
	ppLine20: TppLine;
	ppLine21: TppLine;
	ppLine23: TppLine;
	ppLine24: TppLine;
	ppLine22: TppLine;
	ppLine10: TppLine;
	Label_Kbn: TppLabel;
	DMemPrintiLine: TIntegerField;
	ppLDeptNo: TppLabel;
	ppLDeptName: TppLabel;
	ppGroup2: TppGroup;
	ppGroupHeaderBand2: TppGroupHeaderBand;
	ppGroupFooterBand2: TppGroupFooterBand;
	DMemPrintEmpNCd: TStringField;
	ppLabel3: TppLabel;
	ppLabel5: TppLabel;
	ppLine11: TppLine;
	ppLine13: TppLine;
	ppDBText4: TppDBText;
	ppLine16: TppLine;
	ppLine15: TppLine;
	ppDBText8: TppDBText;
    ppLabel6: TppLabel;
    ppLine12: TppLine;
    ppDBText5: TppDBText;
    ppLine14: TppLine;
    DMemPrintkubunName: TStringField;
	DMemPrintDtKubunName: TStringField;
    DMemPrintRemarks: TStringField;
    DMemPrintsDate: TStringField;
    DMemPrinteDate: TStringField;
    DMemPrintDeptNcd: TFloatField;
    DMemPrintKyoBunya: TStringField;
    ppDBText3: TppDBText;
    ppLine8: TppLine;
    ppLine17: TppLine;
    ppLabel7: TppLabel;
    DMemPrintKubunNo: TIntegerField;
    ppLine19: TppLine;
    ppLabel8: TppLabel;
    ppLine25: TppLine;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppDBText7: TppDBText;
    ppLabel10: TppLabel;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppDBText9: TppDBText;
    DMemPrintsExpDate: TStringField;
    DMemPrintOrgName: TStringField;
    DMemPrintFee: TCurrencyField;
    DMemPrintExNum1: TIntegerField;
    DMemPrintExText1: TStringField;
    DMemPrintExDate1: TStringField;
    DMemPrintExNum2: TIntegerField;
    DMemPrintExText2: TStringField;
    DMemPrintExDate2: TStringField;
    DMemPrintExNum3: TIntegerField;
    DMemPrintExText3: TStringField;
    DMemPrintExDate3: TStringField;
    DMemPrintExNum4: TIntegerField;
    DMemPrintExText4: TStringField;
    DMemPrintExDate4: TStringField;
    DMemPrintExNum5: TIntegerField;
    DMemPrintExText5: TStringField;
    DMemPrintExDate5: TStringField;
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
//	dPrnEmpNo	: Double;

	giParamMode		: Integer;													//パラメータ 0:教育 1:研修

	procedure fnSetFileOut(CmnInfo:TMjsPrnSupport);
	function fnGetDeptName(DeptNCd : Int64):string;
	procedure DoPrint;

	function fnGetKMName(iItemNo: Integer): String;
	function fnDtKubunGet(sCode : String):integer;
    function fnGetData(iEmpNCd: Int64; sEmpNo, sEmpName: String;
      iDeptNCd: Int64; sDeptNo: string): Boolean;
      
    function fnFormatDate(dt:TField):string;							// 日付フォーマット編集 ADD <20110809>
    function fnGetSTDFormatDate(dDate:TDateTime):string;						// 基準日用フォーマット編集 <RefDay>
	function fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;			// 2桁スペース付き編集 <RefDay>
	//<140415>
	procedure fnSetFreeItemTitle(giParamMode : Integer; var sTitle : TStringList);

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
	CST_TITLE_KYOUIKU	=	'個人別受講教育歴一覧表';
	CST_TITLE_KENSYUU	=	'個人別受講研修歴一覧表';

	KYOUIKU_CODE	= 170700;	//教育 HAPMN.ItemNo
	KENSYU_CODE		= 171100;	//研修 HAPMN.ItemNo

	KyoName	:	Array[1..2] of String = ('社内教育','社外教育');
	KenName	:	Array[1..2] of String = ('社内研修','社外研修');


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
	pForm	: ^THAP000061PPrnF;
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
				pForm^ := THAP000061PPrnF.CreateForm( pRec,pParam );
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
			THAP000061PPrnF(pForm^).DoPrint;
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
procedure THAP000061PPrnF.FormCreate(Sender: TObject);
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
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
constructor THAP000061PPrnF.CreateForm(pRec,pParam: Pointer);
var
	iCnt		:	Integer;
	POwnerForm	: ^TControl;													//2005-10-31
begin
	pAppRec	:= pRec;															//MjsAppRecord
	pPrnParam :=pParam;

//2005-10-31
	POwnerForm := pAppRec^.m_pChildForm;	   									//  オーナーフォームを取得

	giParamMode := pPrnParam^.HapPrnSpt.iListPara;

	MDBModule:=TMDataModuleF(pAppRec^.m_pDBModule^);
	try
		ddCopDB:=MDBModule.CopDBOpen(0,pAppRec^.m_iCorpID);						//会社ＤＢオープン
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
//		History		:2005/12/09	T.Abe(BUNTECHNO)
//					:戸籍名出力ビュー対応
//**********************************************************************
procedure THAP000061PPrnF.DoPrint;
var
	mqPrn	: TMQuery;
	i		: integer;
	bData	: Boolean;

	sDeptNCdB	: String;
	sName	: String;
begin
//<RefDay> ↓
	//基準日（日付）の印字
	if pPrnParam^.HapPrnSpt.iRefType > 0 then
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
		or (pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI)) then		//改頁[あり]
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

		if giParamMode = 0 then	//教育
		begin
			ppLabel4.Caption	:= CST_TITLE_KYOUIKU;
			Label_Name.Caption	:= fnGetKMName(170701);	//教育名
// <2006-07-14> ----- S
//			ppLabel7.Caption	:= fnGetKMName(170601);	//教育分野
//			Label_Kbn.Caption	:= fnGetKMName(170700);	//教育区分
			ppLabel7.Caption	:= fnGetKMName(170721);	//教育分野
			Label_Kbn.Caption	:= fnGetKMName(170731);	//教育区分
// <2006-07-14> ----- E
			ppLabel5.Caption	:= fnGetKMName(170800);	//教育年月日(自)
			ppLabel6.Caption	:= fnGetKMName(170801);	//教育年月日(至)
			ppLabel3.Caption	:= fnGetKMName(170900);	//特記事項

			ppLabel8.Caption	:= fnGetKMName(170901);	//修了予定日<2011-05-25>
			ppLabel9.Caption	:= fnGetKMName(170911);	//団体名	<2011-05-25>
			ppLabel10.Caption	:= fnGetKMName(170902);	//受講金額	<2011-05-25>
		end
		else					//研修
		begin
			ppLabel4.Caption	:= CST_TITLE_KENSYUU;
			Label_Name.Caption	:= fnGetKMName(171101);	//研修名
// <2006-07-14> ----- S
//			ppLabel7.Caption	:= fnGetKMName(171001);	//教育分野
//			Label_Kbn.Caption	:= fnGetKMName(171100);	//教育区分
			ppLabel7.Caption	:= fnGetKMName(171121);	//教育分野
			Label_Kbn.Caption	:= fnGetKMName(171131);	//教育区分
// <2006-07-14> ----- E
			ppLabel5.Caption	:= fnGetKMName(171200);	//研修年月日(自)
			ppLabel6.Caption	:= fnGetKMName(171201);	//研修年月日(至)
			ppLabel3.Caption	:= fnGetKMName(171300);	//特記事項

			ppLabel8.Caption	:= fnGetKMName(171301);	//修了予定日<2011-05-25>
			ppLabel9.Caption	:= fnGetKMName(171311);	//団体名	<2011-05-25>
			ppLabel10.Caption	:= fnGetKMName(171302);	//受講金額	<2011-05-25>
		end;

//		Label_Kbn.Caption	:= fnGetKMName(103300);								// 賞罰区分

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
					Add('SELECT'		);
					Add(' SC.GCode'		);
					Add(',SC.NCode'		);
					Add(',MS.Name'		);

					// 戸籍名出力対応
					Add(',MS.TrueNameU'	);

//					Add(',SC.DeptNCd'	);
//					Add(',DB.DeptNo'	);

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
					if pPrnParam^.HapPrnSpt.iRefType > 0 then	//基準日指定時
						Add('	MP_HAP_HAPCHG_STD(:RefDate)')
					else
						Add('	MV_HAP_HAPCHG');
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
//					Add(	'mvNSPDB DB');

					// 戸籍名出力ビュー対応
					//Add('INNER JOIN MOS_OFFICE_STAFF MS');
					Add('INNER JOIN MV_HAP_CMNMOS MS');
					Add('ON SC.NCode=MS.NCode'			);
//<RefDay> ↓ 基準日 - 入社年月日判定用
					if pPrnParam^.HapPrnSpt.iRefType > 0 then	//基準日指定時
					begin
                        Add('INNER JOIN HAPSY SY');
                        Add('ON  SC.NCode = SY.EmpNCode'		);
                        Add('AND SC.CorpNCode = SY.CorpNCode'	);
                    end;
//<RefDay> ↑

					Add('WHERE'		);
//					Add(' SC.DeptNCd = DB.DeptNCd');
//					Add(' AND DB.ItemNo = 30400');
//2005-08-30
					Add('SC.SyokuchiKbn=0');
					Add('AND');

					//在職区分のﾌｨﾙﾀ
//					Add(' AND');
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
								or (pPrnParam^.HapPrnSpt.iOrder=HapPRN_ODR_TAIKEI)) then
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
					//基準日以前入社絞り込み
					if pPrnParam^.HapPrnSpt.iRefType > 0 then	//基準日指定時
						Add('AND ((SY.Nyuusha <= :RefDate) OR (SY.Nyuusha IS NULL))');
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
					if pPrnParam^.HapPrnSpt.iRefType > 0 then	//基準日指定時
						SetFld('RefDate').AsDateTime := pPrnParam^.HapPrnSpt.dRefDate;
//<RefDay> ↑
				end;

				try
					Open;
					if not Eof then												//印刷ﾃﾞｰﾀ有
					begin
						iNo:=0;
						DMemPrint.Close;
						DMemPrint.Open;
//						dPrnEmpNo := GetFld('GCode').AsFloat;
						while not eof do
						begin
							if (pPrnParam^.HapPrnSpt.bPageBreak)
								and ((pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU)
								or (pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI))
								and (sDeptNCdB <> GetFld('DeptNCd').AsString) then		//改頁[あり]
								iNo := 0;

                            // 戸籍名出力対応
                            if pPrnParam^.HapPrnSpt.iNameType = 1 then
                            	sName	:= GetFld('TrueNameU').AsString
                            else
                            	sName	:= GetFld('Name').AsString;

							if fnGetData(	Trunc(GetFld('NCode').AsFloat),		//社員内部
											GetFld('GCode').AsString,			//社員外部
											sName,								//社員氏名
											Trunc(GetFld('DeptNCd').AsFloat),	//所属内部
											GetFld('DeptNo').AsString) then		//所属外部
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
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000061PPrnF.fnGetData(	iEmpNCd : Int64;				//社員内部Code
									sEmpNo : String;				//社員外部Code
									sEmpName: String;				//社員氏名
									iDeptNCd: Int64;				//所属内部Code
									sDeptNo: string):Boolean;		//所属外部Code
var
	DMQuery	: TMQuery;
	DMQuery2: TMQuery;
	rcMsg	: TMjsMsgRec;

	dEmpNCdB	: String;

	iWk		: Integer;		//<2011-05-25>
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
				SQL.Add(' IsNull(sDate,ConVert(DateTime,'+''''+DEF_DATE+''''+')) sDate,');
				SQL.Add(' IsNull(eDate,ConVert(DateTime,'+''''+DEF_DATE+''''+')) eDate');
//<RefDay> ↓
				if pPrnParam^.HapPrnSpt.iRefType > 0 then	//基準日指定時
                begin
					SQL.Add(' FROM MP_HAP_HAPEDU_STD('
								+''''+FormatDateTime('yyyy-mm-dd', pPrnParam^.HapPrnSpt.dRefDate)+''''+')' );
                end
//<RefDay> ↑
				else
				begin
					SQL.Add(' FROM HAPEdu');
                end;
				SQL.Add(' Where EmpNCode='+ IntToStr(iEmpNCd));
				SQL.Add(' AND EduType=:hEduType');

				SQL.Add(' ORDER BY SDate DESC ,EDate DESC, SameDateOrder,EduNCode DESC');

				if giParamMode = 0 then		//教育
					SetFld('hEduType').AsInteger:= 0
				else						//研修
					SetFld('hEduType').AsInteger:= 1;

				Open(True);

				while not Eof do
				begin
					Result := TRUE;
					dEmpNCdB := DMemPrint.FieldByName('EmpNCd').AsString;

					inc(iNo);
					DMemPrint.Append;

					if (dEmpNCdB <> IntToStr(iEmpNCd)) or (iNo = 1) then
					begin
						//社員ｺｰﾄﾞ
						DMemPrint.FieldByName('EmpNo').AsString :=
									HapCodeAttribute2(sEmpNo,iEmpDigit,iEmpAttribute);
						//社員名
						DMemPrint.FieldByName('EmpName').AsString := sEmpName;
					end;

					if pPrnParam^.MPrnSpt.iCommand = PDLG_FILE then				//ファイル出力
					begin
						//社員ｺｰﾄﾞ
						DMemPrint.FieldByName('EmpNo').AsString :=
									HapCodeAttribute2(sEmpNo,iEmpDigit,iEmpAttribute);
						//社員名
						DMemPrint.FieldByName('EmpName').AsString := sEmpName;
					end;

					DMemPrint.FieldByName('EmpNCd').AsString := IntToStr(iEmpNCd);

					//所属ｺｰﾄﾞ
					if (iDeptNCd <> 0) then
					begin
						DMemPrint.FieldByName('DeptNCd').AsFloat := iDeptNCd;
						DMemPrint.FieldByName('DeptNo').AsString :=
								HAPCodeAttribute2(sDeptNo,iDeptDigit,iDeptAttribute);
					end;

					if iNo = 45 then
					begin
						iNo := 0;
						DMemPrint.FieldByName('iLine').AsInteger := 1;
					end
					else
						DMemPrint.FieldByName('iLine').AsInteger := 0;

					DMemPrint.FieldByName('KubunNo').AsInteger := DMQuery.GetFld('KubunNo').AsInteger;

		//別Query　↓↓↓--------------------------

					DMQuery2.Close;
					DMQuery2.SQL.Clear;
					DMQuery2.SQL.Add('SELECT MN.KubunName');
					DMQuery2.SQL.Add(' FROM HAPMNEx As MN');
					DMQuery2.SQL.Add('INNER JOIN HAPKM As KM');
					DMQuery2.SQL.Add(' ON KM.ItemNo=MN.ItemNo');
					DMQuery2.SQL.Add('WHERE KM.ItemNo=:hItemNo');
					DMQuery2.SQL.Add(' AND MN.KubunNo=:hKubunNo');

					if giParamMode = 0 then
						DMQuery2.SetFld('hItemNo').AsInteger	:= KYOUIKU_CODE
					else
						DMQuery2.SetFld('hItemNo').AsInteger	:= KENSYU_CODE;

						DMQuery2.SetFld('hKubunNo').AsInteger := DMQuery.GetFld('KubunNo').AsInteger;

						DMQuery2.Open(True);

						if not DMQuery2.Eof then
						begin
				//教育名
							DMemPrint.FieldByName('KubunName').AsString := DMQuery2.GetFld('KubunName').AsString;
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
							DMQuery2.SetFld('hItemNo').AsInteger	:= KYOUIKU_CODE
						else
							DMQuery2.SetFld('hItemNo').AsInteger	:= KENSYU_CODE;

						DMQuery2.SetFld('hKbnNo').AsInteger	:=	DMQuery.GetFld('KubunNo').AsInteger;

						if not DMQuery2.Open then
							Abort;

						if not DMQuery2.Eof then
						begin
			//教育分野
							DMemPrint.FieldByName('KyoBunya').AsString := DMQuery2.GetFld('FieldName').AsString;
						end;

		//別Query　↑↑↑--------------------------

			//教育区分
					if giParamMode = 0 then
						DMemPrint.FieldByName('DtkubunName').AsString := KyoName[fnDtkubunGet(DMQuery.GetFld('KubunNo').AsString)]
					else
						DMemPrint.FieldByName('DtkubunName').AsString := KenName[fnDtkubunGet(DMQuery.GetFld('KubunNo').AsString)];
			//特記事項
					DMemPrint.FieldByName('Remarks').AsString := DMQuery.GetFld('EduRemarks').AsString;

			//教育年月日(自)
					if GetFld('sDate').AsDateTime > 0 then
					begin
						DMemPrint.FieldByName ('sDate').AsString := fnFormatDate(GetFld('sDate'));			// UPD <20110809>
					end;

			//教育年月日(至)
					if GetFld('eDate').AsDateTime > 0 then
					begin
						DMemPrint.FieldByName ('eDate').AsString := fnFormatDate(GetFld('eDate'));			// UPD <20110809>
					end;

			//修了予定日 <2011-05-25>
					if GetFld('EduExpDate').AsDateTime > 0 then
					begin
						DMemPrint.FieldByName ('sExpDate').AsString := fnFormatDate(GetFld('EduExpDate'));	// UPD <20110809>
					end;

			//団体名 <2011-05-25>
					iWk	:= GetFld('EduOrg').AsInteger;
					if iWk > 0 then
					begin
						DMQuery2.Close;
						DMQuery2.SQL.Clear;
						DMQuery2.SQL.Add('SELECT KubunName FROM HAPMNEx');
						DMQuery2.SQL.Add('WHERE ItemNo=170910'			);
						DMQuery2.SQL.Add('AND KubunNo=:hKbnNo'			);
						DMQuery2.SetFld('hKbnNo').AsInteger	:= iWk;
						DMQuery2.Open;
						if not DMQuery2.Eof then
							DMemPrint.FieldByName ('OrgName').AsString	:= DMQuery2.GetFld('KubunName').AsString;
					end;

			//受講金額 <2011-05-25>
						DMemPrint.FieldByName ('Fee').AsCurrency	:= GetFld('EduFee').AsCurrency;

					//<140415>↓
					DMemPrint.FieldByName ('Exnum1').AsInteger	:= GetFld('Exnum1').AsInteger;
					DMemPrint.FieldByName ('Exnum2').AsInteger	:= GetFld('Exnum2').AsInteger;
					DMemPrint.FieldByName ('Exnum3').AsInteger	:= GetFld('Exnum3').AsInteger;
					DMemPrint.FieldByName ('Exnum4').AsInteger	:= GetFld('Exnum4').AsInteger;
					DMemPrint.FieldByName ('Exnum5').AsInteger	:= GetFld('Exnum5').AsInteger;

					DMemPrint.FieldByName ('ExText1').AsString	:= GetFld('ExText1').AsString;
					DMemPrint.FieldByName ('ExText2').AsString	:= GetFld('ExText2').AsString;
					DMemPrint.FieldByName ('ExText3').AsString	:= GetFld('ExText3').AsString;
					DMemPrint.FieldByName ('ExText4').AsString	:= GetFld('ExText4').AsString;
					DMemPrint.FieldByName ('ExText5').AsString	:= GetFld('ExText5').AsString;

					if GetFld('ExDate1').AsDateTime > 0 then
					begin
						DMemPrint.FieldByName ('ExDate1').AsString := fnFormatDate(GetFld('ExDate1'));
					end;

					if GetFld('ExDate2').AsDateTime > 0 then
					begin
						DMemPrint.FieldByName ('ExDate2').AsString := fnFormatDate(GetFld('ExDate2'));
					end;

					if GetFld('ExDate3').AsDateTime > 0 then
					begin
						DMemPrint.FieldByName ('ExDate3').AsString := fnFormatDate(GetFld('ExDate3'));
					end;

					if GetFld('ExDate4').AsDateTime > 0 then
					begin
						DMemPrint.FieldByName ('ExDate4').AsString := fnFormatDate(GetFld('ExDate4'));
					end;

					if GetFld('ExDate5').AsDateTime > 0 then
					begin
						DMemPrint.FieldByName ('ExDate5').AsString := fnFormatDate(GetFld('ExDate5'));
					end;
					//<140415>↑

					Next;		//次ﾚｺｰﾄﾞ
				end;

			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'研修'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
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
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000061PPrnF.FormDestroy(Sender: TObject);
begin
	mqMA.Free;
	dsPrn.Free;
	MDBModule.CopDBClose(ddCopDB);
end;

//**********************************************************************
//		Component	:ppDetailBand1
//		Event		:BeforePrint
//		Proccess	:社員単位での下線表示
//**********************************************************************
procedure THAP000061PPrnF.ppDetailBand1BeforePrint(Sender: TObject);
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
//*		Parameter	:	sTitle	:	CreateされたTStringList(ﾀｲﾄﾙ用)
//*						sMemFld	:	CreateされたTStringList(ﾌｨｰﾙﾄﾞ用)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure THAP000061PPrnF.fnSetFileOut(CmnInfo:TMjsPrnSupport);
var
	sTitle		: TStringList;
	sMemFld		: TStringList;
	rcMsg		: TMjsMsgRec;
	i	:	Integer;
	s	:	String;
begin
	sTitle	:= TStringList.Create;		//ファイル出力用リスト(タイトル)作成
	sMemFld	:= TStringList.Create;		//ファイル

	if giParamMode = 0 then
	begin
		sTitle.Add('社員No'	);				//社員No
		sTitle.Add('氏名'	);				//氏名
		sTitle.Add(fnGetKMName(170701));	//教育名
// <2006-07-14> ----- S
//		sTitle.Add(fnGetKMName(170601));	//教育分野
//		sTitle.Add(fnGetKMName(170700));	//教育区分
		sTitle.Add(fnGetKMName(170721));	//教育分野
		sTitle.Add(fnGetKMName(170731));	//教育区分
// <2006-07-14> ----- E
		sTitle.Add(fnGetKMName(170800));	//教育年月日(自)
		sTitle.Add(fnGetKMName(170901));	//修了予定日<2011-05-25>
		sTitle.Add(fnGetKMName(170801));	//教育年月日(至)
		sTitle.Add(fnGetKMName(170911));	//団体名	<2011-05-25>
		sTitle.Add(fnGetKMName(170902));	//受講金額	<2011-05-25>
		sTitle.Add(fnGetKMName(170900));	//特記事項
	end
	else
	begin
		sTitle.Add('社員No'	);				//社員No
		sTitle.Add('氏名'	);				//氏名
		sTitle.Add(fnGetKMName(171101));	//研修名
// <2006-07-14> ----- S
//		sTitle.Add(fnGetKMName(171001));	//研修分野
//		sTitle.Add(fnGetKMName(171100));	//研修区分
		sTitle.Add(fnGetKMName(171121));	//研修分野
		sTitle.Add(fnGetKMName(171131));	//研修区分
// <2006-07-14> ----- E
		sTitle.Add(fnGetKMName(171200));	//研修年月日(自)
		sTitle.Add(fnGetKMName(171301));	//修了予定日<2011-05-25>
		sTitle.Add(fnGetKMName(171201));	//研修年月日(至)
		sTitle.Add(fnGetKMName(171311));	//団体名	<2011-05-25>
		sTitle.Add(fnGetKMName(171302));	//受講金額	<2011-05-25>
		sTitle.Add(fnGetKMName(171300));	//特記事項
	end;

	//<140415>↓
	fnSetFreeItemTitle(giParamMode, sTitle);
	//<140415>↑

	With DMemPrint.FieldDefs do
	begin
		for i := 0 to Count - 1 do
		begin
			if DMemPrint.FieldByName(DMemPrint.FieldDefs.Items[i].Name).Tag = 0 then
			begin
				s := DMemPrint.FieldDefs.Items[i].Name;
				sMemFld.Add(s);
			end;
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
//		Parameter	:
//		Return		:
//		History		:2002/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000061PPrnF.ppHeaderBand1BeforePrint(Sender: TObject);
begin
	ppLDeptNo.Caption :=
		HAPCodeAttribute2(DMemPrint.FieldByName('DeptNo').AsString,iDeptDigit,iDeptAttribute);
	//	HAPCodeAttribute(DMemPrint.FieldByName('DeptNo').AsString,iDeptDigit,iDeptAttribute<>1);

	ppLDeptName.Caption := fnGetDeptName(Trunc(DMemPrint.FieldByName('DeptNCd').AsFloat));

	ppLDeptNo.Visible := ppReport1.Groups[0].NewPage ;

	ppLDeptName.Visible := ppReport1.Groups[0].NewPage ;
end;

//**********************************************************************
//		Proccess	:fnGetDeptName
//		Parameter	:DeptNCd
//		Return		:DeptName
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000061PPrnF.fnGetDeptName(DeptNCd: Int64): string;
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
//				SQL.Add('SELECT LongName FROM MV_HAP_HAPCHG');
				SQL.Add('SELECT SimpleName FROM MV_HAP_HAPCHG');
// <2006-08-25_5> ----- E
				SQL.Add('WHERE DeptNCode=:hDeptNCd'			);
				SQL.Add('AND MasterKbn=41 AND AddPos=0'		);

				ParamByName('hDeptNCd').AsFloat := DeptNCd;

				Open();
				if not eof then
				begin
// <2006-08-25_5> ----- S
//					result:= DMQuery.GetFld('LongName').AsString;
					result:= DMQuery.GetFld('SimpleName').AsString;
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


//***********************************************************************
//	Proccess	: 項目名称を取得
//	Paremeter	:
//	Return		: Name : 項目名称 ;取得失敗:NULL
//	History		: 2099/99/99 X.Xxxxx
//				: @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//***********************************************************************
function THAP000061PPrnF.fnGetKMName(iItemNo: Integer): String;
var
	DMQuery	:TMQuery;
	rcMsg	:TMjsMsgRec;
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
procedure THAP000061PPrnF.ppReport1BeforePrint(Sender: TObject);
begin
	pPrnParam^.MPrnSpt.BeforePrint(Sender);
end;

//**********************************************************************
//		Process		:項目名取得
//		Parameter	:gr:対象となるｸﾞﾘｯﾄﾞ
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000061PPrnF.fnDtKubunGet(sCode : String):Integer;
var
	sSQL	:	string;
	mqKM	:	TMQuery;
begin
	result := 0;
	mqKM := TMQuery.Create(Self);							// MQueryの構築

	if Assigned(mqKM) <> true then
	begin
		Exit;
	end;
	MDBModule.SetDBInfoTOQuery(ddCopDB,mqKM);								//DBとの接続

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
				SetFld('hItemNo').AsInteger	:= KYOUIKU_CODE
			else
				SetFld('hItemNo').AsInteger	:= KENSYU_CODE;

			SetFld('hKbnNo').AsString	:=	sCode;

			try
				Open(True);

				if IsEmpty then
					Abort;

				Result:=GetFld('Dtkubun1').Asinteger;
			except
				raise Exception.Create('区分の取得に失敗しました。');
			end;
		end;
	finally
		mqKM.Free;
	end;
end;


// ST ADD <20110809>
//**********************************************************************
//		Process		:歴区分に従って日付を編集する。
//		Parameter	:dt: 対象日付
//		Return		:編集した日付
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000061PPrnF.fnFormatDate(dt:TField):string;
begin
	result := '';

	//NULLなら空白を返す
	if dt.IsNull = true then
		exit;

	if iRekiKbn = 1 then
	begin
		//和暦
		Result	:=		MjsGetGengou(dt.AsDateTime,MdtCMP_YMD)			// 元号を取得
					+	' '
					+	FormatDateTime('ee/mm/dd',dt.AsDateTime);		// 年月日を取得
	end
	else
		//西暦
		Result := FormatDateTime('yyyy/mm/dd', dt.AsDatetime);
end;
// ED ADD <20110809>

//<140415>↓
procedure THAP000061PPrnF.fnSetFreeItemTitle(giParamMode : Integer; var sTitle : TStringList);
var
	qry			: TMQuery;
	rcMsg		: TMjsMsgRec;
	sWhere		: String;
	i, j		: Integer;
const
	ItemList : Array [0..1,0..14] Of Integer =
			(
				//教育
				 (170811, 170812, 170813
				, 170821, 170822, 170823
				, 170831, 170832, 170833
				, 170841, 170842, 170843
				, 170851, 170852, 170853)

				//研修
				,(171211, 171212, 171213
				, 171221, 171222, 171223
				, 171231, 171232, 171233
				, 171241, 171242, 171243
				, 171251, 171252, 171253)
			);
begin
	sWhere := '';
	//in句生成
	for i := 0 to Length(ItemList[0]) - 1 do
	begin
		if sWhere <> '' then
		begin
			sWhere := sWhere + ', ';
		end;

		sWhere := sWhere + IntToStr(ItemList[giParamMode][i]);
	end;

	qry := TMQuery.Create(self);
	MDBModule.SetDBInfoToQuery(ddCopDB, qry);

	try
		try
			with qry do
			begin
				Close;
				SQL.Clear;
				SQL.Add(
						'SELECT'
						+ '	ItemNo,'
						+ ' ItemName, '
						+ ' FieldName '
						+ 'FROM'
						+ '	HAPKM '
						+ 'WHERE'
						+ '	ItemUse = 1 AND '
						+ '	ItemNo IN (' + sWhere + ') '
						+ 'ORDER BY'
						+ '	ItemNo'
						);

				Open(True);

				//全て未使用の場合処理を抜ける
				if Eof then
				begin
					Exit;
				end;

				//グリッドのヘッダー文字列取得及び、表示切替
				while not eof do
				begin
					for j := 0 to Length(ItemList[0]) - 1 do
					begin
						if ItemList[giParamMode][j] = GetFld('ItemNo').AsInteger then
						begin
							sTitle.Add(GetFld('ItemName').AsString);
							//Tag : 0 = 出力カラム、Tag : 1 = 非出力カラム
							DMemPrint.FieldByName(GetFld('FieldName').AsString).Tag := 0;
							Break;
						end;
					end;
					Next;
				end;
			end;
		except
			GetMsg(rcMsg, 1, 5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,
					'項目の' + sMsg, sTitle, IconType, BtnType, BtnDef, LogType);
			end;
		end;
	finally
		qry.Close;
		qry.Free;
	end;
end;
//<140415>↑
//<RefDay> ↓
//**********************************************************************
//		Process		:歴区分に従って日付を編集する
//		Parameter	:dDate: 基準日日付
//		Return		:編集した日付
//		History		:
//**********************************************************************
function THAP000061PPrnF.fnGetSTDFormatDate(dDate:TDateTime):String;
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


//**********************************************************************
//*	Proccess	: 日付編集
//*	Name		:
//*	Date		:
//*	Parameter	: 日付、区分（１：年　２：月　３：日）
//*	Return		: 文字列
//**********************************************************************
function THAP000061PPrnF.fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
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
//<RefDay> ↑


end.
