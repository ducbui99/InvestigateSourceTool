//******************************************************************************
//		System		:MJSFX
//		Program		:現職滞留期間一覧表
//		ProgramID	:HAP000058PPrn
//		Name		:H.Itahana(Buntechno)
//		Create		:2005/07/26
//		Comment		:
//		History		:2005/10/05	T.Abe (BUNTECHNO)
//					:・ファイル出力対応
//					:2005/10/31 H.Itahana(Buntechno)
//					:・Application対応
//					:2005/12/27 H.Itahana(Buntechno)
//					:・本日変更社員印刷対応　						<2005-12-27>
//					:2006/02/06 T.ABE (BUNTECHNO)
//					:・戸籍名出力ビュー対応							<060206>
//					:2006/04/03 T.ABE (BUNTECHNO)
//					:・フリーコード編集対応							<060403>
//					:2006/04/05 N.Nakamura (TS2)
//					:・戸籍名フリガナ順対応　						<060405>
//					:2006/08/25 H.Takaishi (BUNTECHNO)
//					:・部門権限対応									<2006-08-25>
//					:2006/09/05 H.Takaishi (BUNTECHNO)
//					:・HAPCHGをビューに修正							<2006-09-05>
//					:2006/09/07 H.Takaishi (BUNTECHNO)
//					:・印刷データなしの時[エラー]→[警告]			<2006-09-07>
//					:2006/12/05 T.Hirasawa (TS2)
//					:・処理速度向上対応								<061205>
//					:2007/05/02 H.Takaishi (BUNTECHNO)
//					:・部門権限対応（未所属社員は常に出力対象）		<2007-05-02>
//					:2007/05/07 H.Takaishi (BUNTECHNO)
//					:・所属改頁時のヘッダ部で未所属は「(所属なし)」	<2007-05-07>
//					:2007/08/28 T.ABE (TAKUMI)
//					:・両面印刷、上綴じを正しく出力するように対応
//					:2008/06/09 H.Takaishi (TakumiCo.)
//					:・印刷履歴対応（MjsPreview経由で印刷処理実行）	<2008-06-09>
//					:2009/03/19 R.Kobayashi (TakumiCo.)
//					:・印刷暦区分をHAPM3.CalenderKbnに変更			<2009-03-19>
//					:2011/09/09 R.Kobayashi (TakumiCo.)
//					:・等級号俸の出力を追加							<2011-09-09>
//					:2011/10/14 R.Kobayashi (TakumiCo.)
//					:・日付フォーマット統一対応						<2011-10-14>
//					:・戸籍名-カナ順の印刷に失敗する現象を修正		<2011-10-14_2>
//					:2012/05/15 Y.Kondo
//					:・現職発令終了日が入っている場合はそこまでにする	<2012-05-15>
//					:2018/12/21 M.Yamada(CyberCom)
//					:・新元号対応									<NewEraName-P1>
//					:2020/01/29	H.Onozuka(NTC)
//					:・Delphi10-コンパイル対応	<D10-C>
//					:2020/04/28 K.Takahashi
//					:・基準日対応				<RefDay>
//******************************************************************************
unit HAP000058PPrnU;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  ppCache, ppDB, ppDBPipe, Db, dxmdaset, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppBands, ppCtrls, ppPrnabl, ppVar,FireDAC.Comp.Client,
  MjsDBModuleU,MJSQuery,HapPrnDlgSpU,MjsPrnSupportU, ppModule,
  HapMsgu,MjsPreviewIFU,MjsPrnDlgU,
  MjsDateCtrl, ppDesignLayer, ppParameter{, daDatMod};                          //<D10-C>

const
	{$I HapPrnConst.inc}

type
	{$I HapPrnType.inc}
	{$i ActionInterface.inc}
// <NewEraName-P1> ADD Start
	{$I HAPEraNameCtrl_H.inc}
// <NewEraName-P1> ADD End

  THAP000058PPrnF = class(TForm)
	ppReport1: TppReport;
	DataSource: TDataSource;
	ppDBPipeline: TppDBPipeline;
	ppHeaderBand1: TppHeaderBand;
	ppDetailBand1: TppDetailBand;
	ppFooterBand1: TppFooterBand;
	ppLabel4: TppLabel;
	ppLine2: TppLine;
	pphlCopNoSf: TppLabel;
	pphlCopNameSf: TppLabel;
	ppLDeptNo: TppLabel;
	ppLDeptName: TppLabel;
	ppfsvPageSf: TppSystemVariable;
	pphsvDateSf: TppSystemVariable;
	ppLabel2: TppLabel;
	ppLabel1: TppLabel;
	ppLine1: TppLine;
	ppLine3: TppLine;
	ppLine4: TppLine;
	ppLine5: TppLine;
	ppDBText2: TppDBText;
	ppDBText1: TppDBText;
	ppLine24: TppLine;
	ppLine22: TppLine;
	ppLine10: TppLine;
	DMemPrint: TdxMemData;
	DMemPrintEmpNo: TStringField;
	DMemPrintEmpName: TStringField;
	DMemPrintEmpNCd: TStringField;
	DMemPrintDeptNo: TStringField;
	DMemPrintDeptNCd: TStringField;
	DMemPrintDeptName: TStringField;
	ppLine6: TppLine;
	ppLine7: TppLine;
	ppDBText4: TppDBText;
	ppLabel3: TppLabel;
	ppLine9: TppLine;
	ppLine11: TppLine;
	ppLabel5: TppLabel;
	ppLine13: TppLine;
	ppDBText6: TppDBText;
	ppLine15: TppLine;
	ppLabel8: TppLabel;
	ppDBText11: TppDBText;
	ppLine21: TppLine;
	ppLine23: TppLine;
	ppGroup1: TppGroup;
	ppGroupHeaderBand1: TppGroupHeaderBand;
	ppGroupFooterBand1: TppGroupFooterBand;
	DMemPrintNo: TIntegerField;
	DMemPrintiLine: TStringField;
	ppLabel6: TppLabel;
	ppLine12: TppLine;
	ppLabel7: TppLabel;
	ppLine18: TppLine;
	ppDBText8: TppDBText;
	ppLine25: TppLine;
	ppDBText12: TppDBText;
	ppLine28: TppLine;
	ppDBText13: TppDBText;
	ppDBText14: TppDBText;
	ppDBText15: TppDBText;
	ppDBText16: TppDBText;
	ppDBText17: TppDBText;
	ppDBText18: TppDBText;
	ppDBText19: TppDBText;
	ppDBText20: TppDBText;
	ppDBText21: TppDBText;
	ppDBText22: TppDBText;
	DMemPrintDeptHaturei: TStringField;
	DMemPrintDeptStay: TStringField;
	DMemPrintPostNo: TStringField;
	DMemPrintPostName: TStringField;
	DMemPrintPostHaturei: TStringField;
	DMemPrintPostStay: TStringField;
	DMemPrintAbilityHaturei: TStringField;
	DMemPrintAbilityStay: TStringField;
	DMemPrintAbilityNo: TStringField;
	DMemPrintAbilityName: TStringField;
	DMemPrintJobNo: TStringField;
	DMemPrintJobName: TStringField;
	DMemPrintJobStay: TStringField;
	DMemPrintJobHaturei: TStringField;
	DMemPrintWorkNo: TStringField;
	DMemPrintWorkName: TStringField;
	DMemPrintWorkHaturei: TStringField;
	DMemPrintWorkStay: TStringField;
	LblDate: TppLabel;
	ppLine8: TppLine;
	ppLine14: TppLine;
	ppDBText3: TppDBText;
	ppDBText5: TppDBText;
	ppLabel9: TppLabel;
	DMemPrintNyusya: TStringField;
	DMemPrintBirth: TStringField;
	ppDBText7: TppDBText;
	ppDBText9: TppDBText;
	DMemPrintOld: TStringField;
	DMemPrintKinzoku: TStringField;
	ppDBText10: TppDBText;
	DMemPrintEmpKana: TStringField;
	LppAccOfficeSf: TppLabel;
	ppLine16: TppLine;
	ppLabel10: TppLabel;
	ppLine19: TppLine;
	ppDBText23: TppDBText;
	ppDBText24: TppDBText;
	ppDBText25: TppDBText;
	DMemPrintRankNo: TStringField;
	DMemPrintRankHaturei: TStringField;
	DMemPrintRankStay: TStringField;
	procedure FormCreate(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
	procedure ppHeaderBand1BeforePrint(Sender: TObject);
	procedure ppReport1BeforePrint(Sender: TObject);
	procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
	{ Private 宣言 }
	pAppRec			: ^TMjsAppRecord;												//MJSAppRecordﾎﾟｲﾝﾀ
	MDBModule		: TMDataModuleF;												//DBﾓｼﾞｭｰﾙ
	ddCopDB			: TFDConnection;													//会社DB
	mqMA			: TMQuery;														//会社ｸｴﾘ
	Query			: TMQuery;
	pPrnParam		: ^THapPrnParam;												//印刷情報
	iEmpAttribute	: Integer ;
	iEmpDigit		: Integer ;
	iDeptAttribute	: Integer ;
	iDeptDigit		: Integer ;
	iRekiKbn		: integer;
	iPrnEmpNo		: Integer;

	iIndex			: Integer;
	gsDeptNo		: String;

	gbQyoKijun		: Boolean;
	gbFirstFlg		: Boolean;

	procedure	fnSetFileOut(CmnInfo:TMjsPrnSupport);
	function	fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;

// >>> 2006/12/05 Update T.Hirasawa	<061205>
// 処理速度向上対応
	function	fnGetData(mqPrn : TMQuery)		: Boolean;
//	function	fnGetData(sEmpNo:String;sEmpName:String;iDeptNCd:String;iEmpNCd:Int64;iDeptNo,sDeptName:String):Boolean;
// <<< 2006/12/05 Update T.Hirasawa	<061205>

	procedure	fnLabelItemSet;
	Function	fnFormatDate(ddate : TDateTime) : String;

// >>> 2006/12/05 Add T.Hirasawa	<061205>
// 処理速度向上対応
	procedure	fnDropTmpTable(sTableName:String);								// ﾃﾝﾎﾟﾗﾘｰﾃｰﾌﾞﾙ破棄
// <<< 2006/12/05 Add T.Hirasawa	<061205>
	function	fnGetSTDFormatDate(dDate : TDateTime): String;					//基準日表示用フォーマット <RefDay>

  public
	{ Public 宣言 }
	constructor CreateForm(	pRec,pParam:Pointer);
	procedure	DoPrint;
  end;

//var
//  HAP000058PPrnF: THAP000058PPrnF;

	function AppEntry(pPar:pointer):integer;
exports
  AppEntry;

implementation
uses
	HAPLibU,
	MjSDispCtrl,
	MjSStrCtrl,
	MJSCommonu;

const
// >>> 2006/12/05 Add T.Hirasawa	<061205>
// 処理速度向上対応
	m_sTTableName	: array[0..1] of String = (	'#HAP000058P_1',
												'#HAP000058P_2');
// <<< 2006/12/05 Add T.Hirasawa	<061205>

{$R *.DFM}
// <NewEraName-P1> ADD Start
{$I HAPEraNameCtrl_B.inc}
// <NewEraName-P1> ADD End

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
	pForm	: ^THAP000058PPrnF;
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
				pForm^ := THAP000058PPrnF.CreateForm( pRec,pParam );
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
			THAp000058PPrnF(pForm^).DoPrint;
		end;
	end;
	Result	:=ACTID_RET_OK;
end;

//**********************************************************************
//	Event
//**********************************************************************
//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Proccess	:
//		Parameter	:Sender	:TObject
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000058PPrnF.FormCreate(Sender: TObject);
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
//		Component	: Form
//		Event		: Destroy
//		Proccess	: 破棄時
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000058PPrnF.FormDestroy(Sender: TObject);
begin
	mqMA.Free;
	Query.Free;
	MDBModule.CopDBClose(ddCopDB);
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
procedure THAP000058PPrnF.ppHeaderBand1BeforePrint(Sender: TObject);
begin
	ppLDeptNo.Caption :=
		HapCodeAttribute2(DMemPrint.FieldByName('DeptNo').AsString,iDeptDigit,iDeptAttribute);
	//	HapCodeAttribute(DMemPrint.FieldByName('DeptNo').AsString,iDeptDigit,iDeptAttribute<>1);

	ppLDeptName.Caption := DMemPrint.FieldByName('DeptName').AsString;

	// <2007-05-07>
	if ppLDeptName.Caption = '' then
	begin
		ppLDeptName.Caption := '(所属なし)';
	end;

	ppLDeptNo.Visible := ppReport1.Groups[0].NewPage ;

	ppLDeptName.Visible := ppReport1.Groups[0].NewPage ;
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
constructor THAP000058PPrnF.CreateForm(pRec,pParam: Pointer);
var
	iCnt		:	Integer;
	POwnerForm	: ^TControl;
begin
	pAppRec	:= pRec;															//MjsAppRecord
	pPrnParam :=pParam;

//2005-10-31
	POwnerForm := pAppRec^.m_pChildForm;										// オーナーフォームを取得

	gbFirstFlg := True;

	MDBModule:=TMDataModuleF(pAppRec^.m_pDBModule^);							//会社ＤＢオープン
	try
		ddCopDB:=MDBModule.CopDBOpen(0,pAppRec^.m_iCorpID);
	except
		raise Exception.Create('会社DB ｵｰﾌﾟﾝ失敗');
	end;

	try
		mqMA:=TMQuery.Create(Self);
	except
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
		//<2009-03-19>↓
		//	SQL.Add('SELECT YearKbn FROM DTMAIN');
			SQL.Add('SELECT CalendarKbn AS YearKbn FROM HAPM3');
		//<2009-03-19>↑
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
		MDBModule.CopDBClose(ddCopDB);
		raise Exception.Create('会社情報 取得失敗');
	end;

// 所属用SQL作成
	Query := TMQuery.Create(self);

	if Assigned(Query) <> True then
	begin
		Exit;
	end;

	MDBModule.SetDBInfoToQuery(ddCopDB,Query);

//2005-10-31
//	inherited Create(Application);
	inherited Create(POwnerForm^);
end;

//**********************************************************************
//	PUPLIC
//**********************************************************************
//**********************************************************************
//		Proccess	:印刷
//		History		:2006/12/05 T.Hirasawa (TS2)
//					:・処理速度向上対応	<061205>
//**********************************************************************
procedure THAP000058PPrnF.DoPrint;
var
	mqPrn	: TMQuery;
	i		: Integer;
	bData	: Boolean;
	sRefDate: String;	//<RefDay>

//	sName	: String;
begin

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

	// ﾃﾝﾎﾟﾗﾘｰﾃｰﾌﾞﾙ破棄
	fnDropTmpTable(m_sTTableName[0]);

	bData := FALSE;
	try
		mqPrn:=TMQuery.Create(Self);
		try
			//DB情報ｾｯﾄ
			MDBModule.SetDBInfoToQuery(ddCopDB,mqPrn);
			with mqPrn do
			begin
				Close;
				with SQL do
				begin
					Clear();

// >>> 2006/12/05 Update T.Hirasawa	<061205>
// 処理速度向上対応
					// テンポラリーテーブルに社員情報を収集
					Add('Select'
					+	' SC.CorpNCode'
					+	',SC.NCode'
					+	',SC.GCode'
					+	',MS.Name'
					+	',MS.TrueNameU'
					+	',IsNull(CHG.DeptNCode,'''') As DeptNCd'
					+	',IsNull(CHG.DeptGCode,'''') As DeptNo'
					+	',IsNull(CHG.SimpleName,'''') As Ryaku'
					+	',IsNull(CHG.OrderNo,0) As OrderNo'
					+	',MS.Birth'
					+	',SY.Nyuusha'
					+	',MS.KanaName'
					+	',MS.TrueNameKana1M'									// 戸籍姓(ﾌﾘｶﾞﾅ)
					+	',MS.TrueNameKana2M'									// 戸籍名(ﾌﾘｶﾞﾅ)
					+	',MS.TrueNameKanaU'										// 戸籍氏名(ﾌﾘｶﾞﾅ) <2011-10-14_2>
					+	',MF_HAP_StdDate(SC.CorpNCode,SC.NCode) As _BASE_DATE'	// 基準日
					// 退職日＆死亡日取得
					+	',If (SC.Zaishoku=2) Then'
						+	' IsNull(SY.Retire,SY.KoyouSoushitsu)'
					+	' Else'
						+	' Null'
					+	' EndIf As _RETIRE'											// 退職日
					// 在職区分をBIT展開
					+	',Case SC.Zaishoku'
						+	' When 2 Then ' + IntToStr(HAP_ZAI_TAISHOKU)
						+	' When 3 Then ' + IntToStr(HAP_ZAI_KYUSHOKU)
						+	' Else        ' + IntToStr(HAP_ZAI_ZAISHOKU)
					+	' End As ZaishokuBit'
					// 支払形態区分をBIT展開
					+	',Case SC.Shiharai'
						+	' When 1 Then ' + IntToStr(HAP_SHR_NENSHU)
						+	' When 3 Then ' + IntToStr(HAP_SHR_NIKKYU)
						+	' When 4 Then ' + IntToStr(HAP_SHR_JIKYUU)
						+	' Else        ' + IntToStr(HAP_SHR_GEKKYU)
					+	' End As ShiharaiBit'
						);
					Add('Into ' + m_sTTableName[0]);
					Add('From  HAPSC SC '
					+	'Inner Join MV_HAP_CMNMOS MS'
						+ ' On SC.NCode=MS.NCode '
					+	'Inner Join HAPSY SY'
						+ ' On SC.NCode=SY.EmpNCode '
						+' And SC.CorpNCode=SY.CorpNCode ');
//<RefDay>↓
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
						Add('Left Join MP_HAP_HAPCHG_STD(''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') CHG')
					else
						Add('Left Join MV_HAP_HAPCHG CHG');
//<RefDay>↑
					Add(' On CHG.EmpNCode=SC.NCode '
						+' And CHG.MasterKbn=41 '
						+' And CHG.AddPos=0 '
						);
					Add('Where SC.SyokuchiKbn=0 AND SC.CorpNCode=0 '
					//在職区分のﾌｨﾙﾀ
					+	' And (ZaishokuBit& ' + IntToStr(pPrnParam^.HapPrnSpt.iZaishoku) + ' >0)'
					//支払形態区分のﾌｨﾙﾀ
					+	' And (ShiharaiBit& ' + IntToStr(pPrnParam^.HapPrnSpt.iShiharai) + ' >0)'
					// 部門権限
					// <2007-05-02>
					+	' And (DeptNCd In (Select BmCd From MV_MAS_STFBMN Where TantoNCD = :TantoNCD)'
						+	' OR IsNull(DeptNCd, 0) = 0)'
						);

					SetFld('TantoNCD').AsFloat := rcCommonArea(pAppRec^.m_pCommonArea^).TantoNCD;
{
					//印刷ｶﾗﾑ
					Add('SELECT'	);
					Add(' SC.GCode');
					Add(',SC.NCode');
					Add(',MS.Name');

					// 戸籍名出力ビュー対応<060206>
					Add(',MS.TrueNameU');

//					Add(',SC.DeptNCd');

					Add(',ISNULL(');
					Add(' (SELECT');
					Add('	DeptNCode');
					Add('  FROM');
					Add('	MV_HAP_HAPCHG');
					Add('  WHERE');
					Add('	MasterKbn=41');
					Add('	AND');
					Add('	AddPos=0');
					Add('	AND');
					Add('	EmpNCode=SC.NCode)');
					Add(' ,'''')');
					Add(' AS');
					Add(' DeptNCd');

					Add(',ISNULL(');
					Add(' (SELECT');
					Add('	DeptGCode');
					Add('  FROM');
					Add('	MV_HAP_HAPCHG');
					Add('  WHERE');
					Add('	MasterKbn=41');
					Add('	AND');
					Add('	AddPos=0');
					Add('	AND');
					Add('	EmpNCode=SC.NCode)');
					Add(' ,'''')');
					Add(' AS');
					Add(' DeptNo');

					Add(',ISNULL(');
					Add(' (SELECT');
					Add('	SimpleName');
					Add('  FROM');
					Add('	MV_HAP_HAPCHG');
					Add('  WHERE');
					Add('	MasterKbn=41');
					Add('	AND');
					Add('	AddPos=0');
					Add('	AND');
					Add('	DeptNCode>0');
					Add('	AND');
					Add('	EmpNCode=SC.NCode)');
					Add(' ,'''')');
					Add(' AS');
					Add(' Ryaku');

					Add(',ISNULL(');
					Add(' (SELECT');
					Add('	OrderNo');
					Add('  FROM');
					Add('	MV_HAP_HAPCHG');
					Add('  WHERE');
					Add('	MasterKbn=41');
					Add('	AND');
					Add('	AddPos=0');
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
					Add(' HAPSC AS SC');

					// 戸籍名出力ビュー対応<060206>
					//Add('INNER JOIN MOS_OFFICE_STAFF MS');
					Add('INNER JOIN MV_HAP_CMNMOS MS');
					Add('ON SC.NCode=MS.NCode');

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
					Add('AND');
					Add('DeptNCd IN (SELECT BmCd FROM MV_MAS_STFBMN WHERE TantoNCD = :TantoNCD)');
					SetFld('TantoNCD').AsFloat := rcCommonArea(pAppRec^.m_pCommonArea^).TantoNCD;
// <2006-08-25> ----- E
}
// <<< 2006/12/05 Update T.Hirasawa	<061205>

					//印刷条件--------------
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
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
					begin
						Add('AND ((SY.Nyuusha <= ''' + datetoStr(pPrnParam^.HapPrnSpt.dRefDate) +''') or (SY.Nyuusha IS NULL))');
                    end;
//<RefDay> ↑

// >>> 2006/12/05 Update T.Hirasawa	<061205>
// 処理速度向上対応
					// ﾃﾝﾎﾟﾗﾘｰﾃｰﾌﾞﾙ生成
					ExecSQL(True);
					Close();

//<2012-05-15> 現職の発令終了日が入っている場合はそれを見るようにする。
					// 期間情報収集
					Clear();
					Add('Select'
					+	' TMP.*');

//<RefDay>↓
					if pPrnParam^.HapPrnSpt.iRefType = 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
					begin

						Add(',MF_HAP_MonthsAge('
                            +	' TMP.Birth,IsNull(TMP._RETIRE,TMP._BASE_DATE)'
                            +	' ) As _AGE'											// 年齢計算
                        +	',MF_HAP_Months('
                            +	' TMP.Nyuusha,IsNull(TMP._RETIRE,TMP._BASE_DATE-1)'
                            +	' ) As _KIZOKU'											// 勤続年数
                        // 所属
                        +	',MA1.SimpleName As SimpleName1'
                        +	',CHG1.OrderDate As OrderDate1'
                        +	',MF_HAP_Months('
                            +	' CHG1.OrderDate,IsNull(CHG1._ENDDATE,IsNull(TMP._RETIRE,TMP._BASE_DATE-1))'
                            +	' ) AS _MONTHS_DEPT1'
                        // 職種
                        +	',MA2.SimpleName As SimpleName2'
                        +	',CHG2.OrderDate As OrderDate2'
                        +	',MF_HAP_Months('
                            +	' CHG2.OrderDate,IsNull(CHG2._ENDDATE,IsNull(TMP._RETIRE,TMP._BASE_DATE-1))'
                            +	' ) AS _MONTHS_DEPT2'
                        // 役職
                        +	',MA3.SimpleName As SimpleName3'
                        +	',CHG3.OrderDate As OrderDate3'
                        +	',MF_HAP_Months('
                            +	' CHG3.OrderDate,IsNull(CHG3._ENDDATE,IsNull(TMP._RETIRE,TMP._BASE_DATE-1))'
                            +	' ) AS _MONTHS_DEPT3'
                        // 職能
                        +	',MA4.SimpleName As SimpleName4'
                        +	',CHG4.OrderDate As OrderDate4'
                        +	',MF_HAP_Months('
                            +	' CHG4.OrderDate,IsNull(CHG4._ENDDATE,IsNull(TMP._RETIRE,TMP._BASE_DATE-1))'
                            +	' ) AS _MONTHS_DEPT4'
                        // 職位
                        +	',MA5.SimpleName As SimpleName5'
                        +	',CHG5.OrderDate As OrderDate5'
                        +	',MF_HAP_Months('
                            +	' CHG5.OrderDate,IsNull(CHG5._ENDDATE,IsNull(TMP._RETIRE,TMP._BASE_DATE-1))'
                            +	' ) AS _MONTHS_DEPT5'
                        // 等級号俸 <2011-09-09>
                        +	',CHG6.DeptNCode As SimpleName6'
                        +	',CHG6.OrderDate As OrderDate6'
                        +	',MF_HAP_Months('
                            +	' CHG6.OrderDate,IsNull(CHG6._ENDDATE,IsNull(TMP._RETIRE,TMP._BASE_DATE-1))'
                            +	' ) AS _MONTHS_DEPT6'
                        );
					end
					else
					begin

						sRefDate := datetoStr(pPrnParam^.HapPrnSpt.dRefDate);

						//年齢計算
                        Add(',MF_HAP_MonthsAge('
                        +	' TMP.Birth,MF_HAP_StdDateEnd(''' + sRefDate +''', Null, TMP._RETIRE, 1)'
                        + 	' ) As _AGE'
						//勤続年数
                        +	',MF_HAP_Months('
                            +	' TMP.Nyuusha,MF_HAP_StdDateEnd(''' + sRefDate +''', Null, TMP._RETIRE)'
                            +	' ) As _KIZOKU'
                        // 所属
						+	',CHG1.SimpleName As SimpleName1'
						+	',CHG1.OrderDate  As OrderDate1'
                        +	',CHG1.ChgMonths  AS _MONTHS_DEPT1'					//MP_HAP_HAPCHG_STD内にて「-1」しているため「-1」を省略
                        // 職種
                        +	',CHG2.SimpleName As SimpleName2'
                        +	',CHG2.OrderDate  As OrderDate2'
                        +	',CHG2.ChgMonths  AS _MONTHS_DEPT2'
                        // 役職
                        +	',CHG3.SimpleName As SimpleName3'
                        +	',CHG3.OrderDate  As OrderDate3'
                        +	',CHG3.ChgMonths  AS _MONTHS_DEPT3'
                        // 職能
                        +	',CHG4.SimpleName As SimpleName4'
                        +	',CHG4.OrderDate  As OrderDate4'
                        +	',CHG4.ChgMonths  AS _MONTHS_DEPT4'
                        // 職位
                        +	',CHG5.SimpleName As SimpleName5'
                        +	',CHG5.OrderDate  As OrderDate5'
                        +	',CHG5.ChgMonths  AS _MONTHS_DEPT5'
                        // 等級号俸
                        +	',CHG6.DeptNCode As SimpleName6'
                        +	',CHG6.OrderDate As OrderDate6'
                        +	',CHG6.ChgMonths AS _MONTHS_DEPT6'
						);
					end;


					Add('From ' + m_sTTableName[0] + ' TMP ');
					// 所属
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照) <RefDay>
						Add('Left Join MP_HAP_HAPCHG_STD(''' + sRefDate +''') CHG1 ')
					else
						Add('Left Join MV_HAP_HAPCHG CHG1 ');
					Add(' On  TMP.NCode=CHG1.EmpNCode '
					+	' And CHG1.CorpNCode=0 '
					+	' And CHG1.MasterKbn=41 '
					+	' And CHG1.AddPos=0 '
					+	' And CHG1.DeptNCode>0 '
					+	'Left Join HojyoMA MA1 '
					+	' On  CHG1.DeptNCode=MA1.NCode '
					+	' And CHG1.MasterKbn=MA1.MasterKbn ');
					// 職種
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照) <RefDay>
						Add('Left Join MP_HAP_HAPCHG_STD(''' + sRefDate +''') CHG2 ')
					else
						Add('Left Join MV_HAP_HAPCHG CHG2 ');
					Add(' On  TMP.NCode=CHG2.EmpNCode '
					+	' And CHG2.CorpNCode=0 '
					+	' And CHG2.MasterKbn=86 '
					+	' And CHG2.AddPos=0 '
					+	' And CHG2.DeptNCode>0 '
					+	'Left Join HojyoMA MA2 '
					+	' On  CHG2.DeptNCode=MA2.NCode '
					+	' And CHG2.MasterKbn=MA2.MasterKbn ');
					// 役職
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照) <RefDay>
						Add('Left Join MP_HAP_HAPCHG_STD(''' + sRefDate +''') CHG3 ')
					else
						Add('Left Join MV_HAP_HAPCHG CHG3 ');
					Add(' On  TMP.NCode=CHG3.EmpNCode '
					+	' And CHG3.CorpNCode=0 '
					+	' And CHG3.MasterKbn=87 '
					+	' And CHG3.AddPos=0 '
					+	' And CHG3.DeptNCode>0 '
					+	'Left Join HojyoMA MA3 '
					+	' On  CHG3.DeptNCode=MA3.NCode '
					+	' And CHG3.MasterKbn=MA3.MasterKbn ');
					// 職能
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照) <RefDay>
						Add('Left Join MP_HAP_HAPCHG_STD(''' + sRefDate +''') CHG4 ')
					else
						Add('Left Join MV_HAP_HAPCHG CHG4 ');
					Add(' On  TMP.NCode=CHG4.EmpNCode '
					+	' And CHG4.CorpNCode=0 '
					+	' And CHG4.MasterKbn=88 '
					+	' And CHG4.AddPos=0 '
					+	' And CHG4.DeptNCode>0 '
					+	'Left Join HojyoMA MA4 '
					+	' On  CHG4.DeptNCode=MA4.NCode '
					+	' And CHG4.MasterKbn=MA4.MasterKbn ');
					// 職位
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照) <RefDay>
						Add('Left Join MP_HAP_HAPCHG_STD(''' + sRefDate +''') CHG5 ')
					else
						Add('Left Join MV_HAP_HAPCHG CHG5 ');
					Add(' On  TMP.NCode=CHG5.EmpNCode '
					+	' And CHG5.CorpNCode=0 '
					+	' And CHG5.MasterKbn=89 '
					+	' And CHG5.AddPos=0 '
					+	' And CHG5.DeptNCode>0 '
					+	'Left Join HojyoMA MA5 '
					+	' On  CHG5.DeptNCode=MA5.NCode '
					+	' And CHG5.MasterKbn=MA5.MasterKbn ');
					// 等級号俸 <2011-09-09>
					if pPrnParam^.HapPrnSpt.iRefType > 0 then					//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照) <RefDay>
						Add('Left Join MP_HAP_HAPCHG_STD(''' + sRefDate +''') CHG6 ')
					else
						Add('Left Join MV_HAP_HAPCHG CHG6 ');
					Add(' On  TMP.NCode=CHG6.EmpNCode '
					+	' And CHG6.CorpNCode=0 '
					+	' And CHG6.MasterKbn=92 '
					+	' And CHG6.AddPos=0 '
					+	' And CHG6.DeptNCode>0 '
						);


					// 出力順
					Add('Order By');
					if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU then
						Add('TMP.DeptNo,')
					else if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI then
						Add('TMP.OrderNo,')
					else if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_KANA then
					begin
						if pPrnParam^.HapPrnSpt.iNameType = 1 then
							Add('TMP.TrueNameKanaU,')
						else
							Add('TMP.KanaName,');
					end;
					Add('TMP.GCode');
				end;

//					//出力順
//					Add(	'ORDER BY');
//					if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU then
//						Add('DeptNo,')
//					else if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI then
//						Add('OrderNo,')
//					else if pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_KANA then
////<060405> ST
////						Add('EmpKana,');
//					begin
//						// 戸籍名出力対応
//						if pPrnParam^.HapPrnSpt.iNameType = 1 then
//							Add('TrueNameKanaU,')
//						else
//							Add('KanaName,');
//					end;
////<060405> ED
//					Add(	'SC.GCode');
//				end;
// <<< 2006/12/05 Update T.Hirasawa	<061205>

				try
					Open(TRUE);

					if not Eof then												//印刷ﾃﾞｰﾀ有
					begin
						DMemPrint.Close;
						DMemPrint.Open;
						iPrnEmpNo:=0;
						gsDeptNo := GetFld('DeptNCd').AsString;
						iIndex := 0;

						while not eof do
						begin
// >>> 2006/12/05 Update T.Hirasawa	<061205>
// 処理速度向上対応
							if fnGetData(mqPrn) then
								bData := True;
//							// 戸籍名出力ビュー対応<060206>
//							if pPrnParam^.HapPrnSpt.iNameType = 1 then
//								sName	:= GetFld('TrueNameU').AsString
//							else
//								sName	:= GetFld('Name').AsString;
//							if fnGetData(GetFld('GCode').AsString,
//								sName,
//								GetFld('DeptNCd').AsString,
//								Trunc(GetFld('NCode').AsFloat),
//								GetFld('DeptNo').AsString,
//								GetFld('Ryaku').AsString) then
//								bData := TRUE;
// <<< 2006/12/05 Update T.Hirasawa	<061205>
							Next;

							if (pPrnParam^.HapPrnSpt.bPageBreak)
							and ((pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU)
							or (pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI)) then//改頁[あり]
								if gsDeptNo <> GetFld('DeptNCd').AsString then
									iIndex := 0;
							gsDeptNo := GetFld('DeptNCd').AsString;
						end;

						if not bData then
						begin
							// 前職歴なし
// <2006-09-07> ----- S
//							MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjError,mjdefOK);
							MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjWarning,mjdefOK);
// <2006-09-07> ----- E
							exit;
						end
						else
							fnLabelItemSet;
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

			// ﾃﾝﾎﾟﾗﾘｰﾃｰﾌﾞﾙ破棄
			fnDropTmpTable(m_sTTableName[0]);
		end;
	except
		raise Exception.Create('印刷用ｸｴﾘ 生成失敗');
	end;

end;

//**********************************************************************
//		Proccess	: 印刷のデータを取る
//		Parameter	:
//		Return		:
//		History		: 2006/12/05 T.Hirasawa (TS2)
//					: ・処理速度向上対応
//**********************************************************************
// >>> 2006/12/05 Update T.Hirasawa	<061205>
function THAP000058PPrnF.fnGetData(mqPrn : TMQuery) : Boolean;
var
	rcMsg		: TMjsMsgRec;
	sName		: String;
	sKana		: String;
	sDeptNCd	: String;
	sDate		: String;
	sMonth		: String;
begin
	Result := False;

	try
		try
			with mqPrn do
			begin
				DMemPrint.Append;
				Inc(iIndex);

				// 基準日
				if (gbFirstFlg) then
				begin
					LblDate.Caption := '';
					if gbQyoKijun then
						LblDate.Caption := '給与年月基準'
					else
					begin
//<RefDay>↓
						if pPrnParam^.HapPrnSpt.iRefType > 0 then				//基準日タイプ　0:通常、1:基準日参照、2:基準日(マスタ参照)
						begin
							if pPrnParam^.HapPrnSpt.dRefDate <> 0 then			//基準日
							begin
								LblDate.Caption:= fnGetSTDFormatDate(pPrnParam^.HapPrnSpt.dRefDate);
							end;
						end
						else
						begin
                            if (not GetFld('_BASE_DATE').IsNull) then
                            begin
								LblDate.Caption:= fnGetSTDFormatDate(GetFld('_BASE_DATE').AsDateTime);
                            end;
						end;
//<RefDay>↑
					end;

					gbFirstFlg := False;
				end;

				// 社員ｺｰﾄﾞ
				DMemPrint.FieldByName('EmpNo').AsString :=
					HapCodeAttribute2(GetFld('GCode').AsString,iEmpDigit,iEmpAttribute);
				DMemPrint.FieldByName('EmpNCd').AsString :=
					HapCodeAttribute(IntToStr(Trunc(GetFld('NCode').AsFloat)),iEmpDigit,iEmpAttribute<>1);

				// 社員名
				if (pPrnParam^.HapPrnSpt.iNameType = 1) then
				begin
					sName	:= GetFld('TrueNameU').AsString;
					sKana	:= GetFld('TrueNameKana1M').AsString + ' '
							+  GetFld('TrueNameKana2M').AsString;
				end
				else
				begin
					sName	:= GetFld('Name').AsString;
					sKana	:= GetFld('KanaName').AsString;
				end;
				DMemPrint.FieldByName('EmpName').AsString := sName;
				DMemPrint.FieldByName('Empkana').AsString := sKana;

				// 生年月日・年齢
				if GetFld('Birth').AsDateTime > 0 then
				begin
					DMemPrint.FieldByName('Birth').AsString	:=
						fnFormatDate(GetFld('Birth').AsDateTime);
					DMemPrint.FieldByName('Old').AsString	:=
						Format('%2.2n',[GetFld('_AGE').AsInteger div 12+
										GetFld('_AGE').AsInteger mod 12*0.01]);
				end;

				// 入社年月日・勤続年数
				if GetFld('Nyuusha').AsDateTime > 0 then
				begin
					DMemPrint.FieldByName('Nyusya').AsString	:=
						fnFormatDate(GetFld('Nyuusha').AsDateTime);
					DMemPrint.FieldByName('Kinzoku').AsString	:=
						Format('%2.2n',[GetFld('_KIZOKU').AsInteger div 12+
										GetFld('_KIZOKU').AsInteger mod 12*0.01]);
				end;

				// 所属
				sDate	:= '';
				sMonth	:= '';
				if not (GetFld('OrderDate1').ISNull) then
				begin
					sDate	:= fnFormatDate(GetFld('OrderDate1').AsDateTime);
					sMonth	:= Format('%2.2n',[ GetFld('_MONTHS_DEPT1').AsInteger div 12+
												GetFld('_MONTHS_DEPT1').AsInteger mod 12*0.01]);
				end;
				sDeptNCd	:= GetFld('DeptNCd').AsString;						// 所属ｺｰﾄﾞ
				if ((Trim(sDeptNCd) <> '0') and (Trim(sDeptNCd) <> '' )) then
				begin
					DMemPrint.FieldByName('DeptNCd').AsString	:= sDeptNCd;
					DMemPrint.FieldByName('DeptName').AsString	:= GetFld('Ryaku').AsString;
					DMemPrint.FieldByName('DeptNo').AsString	:=
						HapCodeAttribute2(GetFld('DeptNo').AsString,iDeptDigit,iDeptAttribute);
					DMemPrint.FieldByName('DeptHaturei').AsString	:= sDate;
					DMemPrint.FieldByName('DeptStay').AsString		:= sMonth;
				end;

				// 職種
				sDate	:= '';
				sMonth	:= '';
				if not (GetFld('OrderDate2').ISNull) then
				begin
					sDate	:= fnFormatDate(GetFld('OrderDate2').AsDateTime);
					sMonth	:= Format('%2.2n',[ GetFld('_MONTHS_DEPT2').AsInteger div 12+
												GetFld('_MONTHS_DEPT2').AsInteger mod 12*0.01]);
				end;
				DMemPrint.FieldByName('JobName').AsString		:= GetFld('SimpleName2').AsString;
				DMemPrint.FieldByName('JobHaturei').AsString	:= sDate;
				DMemPrint.FieldByName('JobStay').AsString		:= sMonth;

				// 役職
				sDate	:= '';
				sMonth	:= '';
				if not (GetFld('OrderDate3').ISNull) then
				begin
					sDate	:= fnFormatDate(GetFld('OrderDate3').AsDateTime);
					sMonth	:= Format('%2.2n',[ GetFld('_MONTHS_DEPT3').AsInteger div 12+
												GetFld('_MONTHS_DEPT3').AsInteger mod 12*0.01]);
				end;
				DMemPrint.FieldByName('PostName').AsString		:= GetFld('SimpleName3').AsString;
				DMemPrint.FieldByName('PostHaturei').AsString	:= sDate;
				DMemPrint.FieldByName('PostStay').AsString		:= sMonth;

				// 職能
				sDate	:= '';
				sMonth	:= '';
				if not (GetFld('OrderDate4').ISNull) then
				begin
					sDate	:= fnFormatDate(GetFld('OrderDate4').AsDateTime);
					sMonth	:= Format('%2.2n',[ GetFld('_MONTHS_DEPT4').AsInteger div 12+
												GetFld('_MONTHS_DEPT4').AsInteger mod 12*0.01]);
				end;
				DMemPrint.FieldByName('AbilityName').AsString	:= GetFld('SimpleName4').AsString;
				DMemPrint.FieldByName('AbilityHaturei').AsString:= sDate;
				DMemPrint.FieldByName('AbilityStay').AsString	:= sMonth;

				// 職位
				sDate	:= '';
				sMonth	:= '';
				if not (GetFld('OrderDate5').ISNull) then
				begin
					sDate	:= fnFormatDate(GetFld('OrderDate5').AsDateTime);
					sMonth	:= Format('%2.2n',[ GetFld('_MONTHS_DEPT5').AsInteger div 12+
												GetFld('_MONTHS_DEPT5').AsInteger mod 12*0.01]);
				end;
				DMemPrint.FieldByName('WorkName').AsString		:= GetFld('SimpleName5').AsString;
				DMemPrint.FieldByName('WorkHaturei').AsString	:= sDate;
				DMemPrint.FieldByName('WorkStay').AsString		:= sMonth;

				// 等級号俸 <2011-09-09>
				sDate	:= '';
				sMonth	:= '';
				if not (GetFld('OrderDate6').ISNull) then
				begin
					sDate	:= fnFormatDate(GetFld('OrderDate6').AsDateTime);
					sMonth	:= Format('%2.2n',[ GetFld('_MONTHS_DEPT6').AsInteger div 12+
												GetFld('_MONTHS_DEPT6').AsInteger mod 12*0.01]);
				end;
				if not (GetFld('SimpleName6').IsNull) then
					DMemPrint.FieldByName('RankNo').AsString	:= Format('%3d',[GetFld('SimpleName6').AsInteger])
				else
					DMemPrint.FieldByName('RankNo').AsString	:= '';
				DMemPrint.FieldByName('RankHaturei').AsString	:= sDate;
				DMemPrint.FieldByName('RankStay').AsString		:= sMonth;

				// No
				DMemPrint.FieldByName('No').AsInteger			:= iIndex;
				DMemPrint.Post;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
				MjsMessageBoxEx(Self,'現発令情報'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			Exit;
		end;
	finally
	end;
	Result := True;
end;
{
//function THAP000058PPrnF.fnGetData(sEmpNo: String; sEmpName: String;
	  iDeptNCd: String; iEmpNCd: Int64;iDeptNo,sDeptName: string):Boolean;
var
	DMQuery	: TMQuery;
	rcMsg	: TMjsMsgRec;

	sDate	: String;
	sMonth	: String;
	i		: Integer;
	sKana	:String;
//const
//	cDateFormat	= 'gg'' ''e''年''M''月''D''日　発令';
	cDateFormat	= 'g ee/mm/dd';
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
				SQL.Add('Select '			);
				SQL.Add('MS.Birth,'			);
				SQL.Add('SY.Nyuusha,'		);
				SQL.Add('MS.KanaName,'		);

				//戸籍名出力ビュー対応<060206>
				SQL.Add('MS.TrueNameKana1M,');
				SQL.Add('MS.TrueNameKana2M,');

				//基準日
				SQL.Add('MF_HAP_StdDate(SC.CorpNCode,SC.NCode)');
				SQL.Add('AS _BASE_DATE,');

				//年齢計算
//				SQL.Add('MF_HAP_MonthsAge(MS.Birth,mpNSP_StdDate()) AS _AGE');
				SQL.Add('MF_HAP_MonthsAge(MS.Birth,MF_HAP_CurEnd(SC.CorpNCode,SC.NCode,1)) AS _AGE,');

				//勤続年数
				SQL.Add('MF_HAP_Months(SY.Nyuusha,MF_HAP_CurEnd(SC.CorpNCode,SC.NCode,0)) AS _KIZOKU');

				SQL.Add('From HAPSY SY,'	);
				SQL.Add('HAPSC SC'	);

				//戸籍名出力ビュー対応<060206>
				//SQL.Add('INNER JOIN MOS_OFFICE_STAFF MS');
				SQL.Add('INNER JOIN MV_HAP_CMNMOS MS');
				SQL.Add('ON MS.NCode=SC.NCode');

				SQL.Add('WHERE SY.EmpNCode ='+ inttostr(iEmpNCd));
				SQL.Add('and SC.NCode = SY.EmpNCode');

				Open(True);

//				while not Eof do
				if not Eof then
				begin
					//最初の社員から、表示する基準日を取得
					if gbFirstFlg = True then
					begin
						LblDate.Caption := '';

						if gbQyoKijun = True then
							LblDate.Caption := '給与年月基準'
						else
						begin
							if not GetFld('_BASE_DATE').IsNull then
							begin
								if iRekiKbn = 0 then
								begin
									LblDate.Caption:=
										Formatdatetime('gg ',GetFld('_BASE_DATE').AsDateTime)+
										fnGetPrintYMD(GetFld('_BASE_DATE').AsDateTime,1)+'年'+
										fnGetPrintYMD(GetFld('_BASE_DATE').AsDateTime,2)+'月'+
										fnGetPrintYMD(GetFld('_BASE_DATE').AsDateTime,3)+'日現在';

								end
								else
								begin
									LblDate.Caption :=
										Formatdatetime('YYYY',GetFld('_BASE_DATE').AsDateTime)+'年'+
										fnGetPrintYMD(GetFld('_BASE_DATE').AsDateTime,2)+'月'+
										fnGetPrintYMD(GetFld('_BASE_DATE').AsDateTime,3)+'日現在';
								end;
							end;
						end;

						gbFirstFlg := False;
					end;

					DMemPrint.Append;
					Inc(iIndex);
//					DMemPrint.FieldByName('iLine').AsInteger:=0;

				//社員ｺｰﾄﾞ
					DMemPrint.FieldByName('EmpNo').AsString :=
						HapCodeAttribute2(sEmpNo,iEmpDigit,iEmpAttribute);
					DMemPrint.FieldByName('EmpNCd').AsString :=
						HapCodeAttribute(inttostr(iEmpNCd),iEmpDigit,iEmpAttribute<>1);
				//社員名
					DMemPrint.FieldByName('EmpName').AsString := sEmpName;
					//戸籍名出力ビュー対応<060206>
					if pPrnParam^.HapPrnSpt.iNameType = 1 then
						sKana	:= GetFld('TrueNameKana1M').AsString + ' ' + GetFld('TrueNameKana2M').AsString
					else
						sKana	:= GetFld('KanaName').AsString;
					DMemPrint.FieldByName('Empkana').AsString := sKana;

				//生年月日・年齢
					if GetFld('Birth').AsDateTime > 0 then
					begin
						DMemPrint.FieldByName('Birth').AsString	:= fnFormatDate(GetFld('Birth').AsDateTime);
						DMemPrint.FieldByName('Old').AsString	:= Format('%2.2n',[	GetFld('_AGE').AsInteger div 12+
																					GetFld('_AGE').AsInteger mod 12*0.01]	);
					end;

				//入社年月日・勤続年数
					if GetFld('Nyuusha').AsDateTime > 0 then
					begin
						DMemPrint.FieldByName('Nyusya').AsString	:= fnFormatDate(GetFld('Nyuusha').AsDateTime);
						DMemPrint.FieldByName('Kinzoku').AsString	:= Format('%2.2n',[	GetFld('_KIZOKU').AsInteger div 12+
																						GetFld('_KIZOKU').AsInteger mod 12*0.01]	);
					end;
				end;

				Close;
				SQL.Clear;
				SQL.Add('SELECT MA.SimpleName, CHG.OrderDate,');
				SQL.Add('MF_HAP_Months(CHG.OrderDate ,MF_HAP_CurEnd(CHG.EmpNCode,CHG.CorpNCode,0)) AS _MONTHS_DEPT');
//2006-09-05 S
//				SQL.Add('FROM HAPCHG CHG INNER JOIN HojyoMA MA ON CHG.DeptNCode=MA.NCode');
				SQL.Add('FROM MV_HAP_HAPCHG CHG INNER JOIN HojyoMA MA ON CHG.DeptNCode=MA.NCode');
//2006-09-05 E
				SQL.Add('AND CHG.MasterKbn=MA.MasterKbn');
				SQL.Add('WHERE CHG.CorpNCode=0 AND CHG.EmpNCode=:hEmpNCd');
				SQL.Add('AND CHG.MasterKbn=:hMAKbn AND CHG.AddPos=0 AND CHG.DeptNCode>0');

				for i:=0 to 4 do
				begin
					SetFld('hEmpNCd').AsFloat := iEmpNCd;

					case i of
						0:	SetFld('hMAKbn').AsInteger := 41;	//所属
						1:	SetFld('hMAKbn').AsInteger := 86;	//職種
						2:	SetFld('hMAKbn').AsInteger := 87;	//役職
						3:	SetFld('hMAKbn').AsInteger := 88;	//職能
						4:	SetFld('hMAKbn').AsInteger := 89;	//職位
					end;

					if not Open then
						Abort;

					if not Eof then
					begin
						sDate	:=	'';
						sMonth	:=	'';

						if not (GetFld('OrderDate').ISNull) then
						begin
							sDate	:=	fnFormatDate(GetFld('OrderDate').AsDateTime);
							sMonth	:=	Format('%2.2n',[ GetFld('_MONTHS_DEPT').AsInteger div 12+
														 GetFld('_MONTHS_DEPT').AsInteger mod 12*0.01]	);
						end;

					//所属
						if i=0 then
						begin
							//所属ｺｰﾄﾞ
							if (Trim(iDeptNCd) <> '0') and
							   (Trim(iDeptNCd) <> '' ) then
							begin
								DMemPrint.FieldByName('DeptNCd').AsString	:= iDeptNCd;
								DMemPrint.FieldByName('DeptName').AsString	:= sDeptName;
								DMemPrint.FieldByName('DeptNo').AsString	:=
									HapCodeAttribute2(iDeptNo,iDeptDigit,iDeptAttribute);

								DMemPrint.FieldByName('DeptHaturei').AsString	:= sDate;
								DMemPrint.FieldByName('DeptStay').AsString		:= sMonth;
							end;
						end

					//職種
						else if i=1 then
						begin
							DMemPrint.FieldByName('JobName').AsString		:= GetFld('SimpleName').AsString;
							DMemPrint.FieldByName('JobHaturei').AsString	:= sDate;
							DMemPrint.FieldByName('JobStay').AsString		:= sMonth;
						end

					//役職
						else if i=2 then
						begin
							DMemPrint.FieldByName('PostName').AsString		:= GetFld('SimpleName').AsString;
							DMemPrint.FieldByName('PostHaturei').AsString	:= sDate;
							DMemPrint.FieldByName('PostStay').AsString		:= sMonth;
						end

					//職能
						else if i=3 then
						begin
							DMemPrint.FieldByName('AbilityName').AsString	:= GetFld('SimpleName').AsString;
							DMemPrint.FieldByName('AbilityHaturei').AsString:= sDate;
							DMemPrint.FieldByName('AbilityStay').AsString	:= sMonth;
						end

					//職位
						else if i=4 then
						begin
							DMemPrint.FieldByName('WorkName').AsString		:= GetFld('SimpleName').AsString;
							DMemPrint.FieldByName('WorkHaturei').AsString	:= sDate;
							DMemPrint.FieldByName('WorkStay').AsString		:= sMonth;
						end;
					end;
					Close;
				end;

				DMemPrint.FieldByName('No').AsInteger := iIndex;
				Result := TRUE;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'現発令情報'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			abort
		end;

	finally
		DMQuery.Close;
		DMQuery.Free;
	end;

end;
}
// <<< 2006/12/05 Update T.Hirasawa	<061205>

//**********************************************************************
//*		Proccess	:	ファイル出力に必要なTitle･Filed設定
//*		Parameter	:	sTitle	:	CreateされたTStringList(ﾀｲﾄﾙ用)
//*						sMemFld	:	CreateされたTStringList(ﾌｨｰﾙﾄﾞ用)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure THAP000058PPrnF.fnSetFileOut(CmnInfo:TMjsPrnSupport);
var
	sTitle	: TStringList;
	sMemFld	: TStringList;
	rcMsg	: TMjsMsgRec;
	i		: Integer;
	s		: String;
	Function fnKMNameGet(iItem : Integer) : String;
	begin
		result := '';
		try
			try
				with Query do
				begin
					Close();
					SQL.Clear();
					SQL.Add('SELECT ItemName from HAPKM' );
					SQL.Add(' WHERE ItemNo = '+IntToStr(iItem));

					Open(True);
					if not eof then
					begin
						result := GetFld('ItemName').AsString;
					end;
				end;
			except
				Exit;
			end;
		finally
			Query.Close;
		end;
	end;
begin
	sTitle	:= TStringList.Create;												//ファイル出力用リスト(タイトル)作成
	sMemFld	:= TStringList.Create;												//ファイル

	sTitle.Add('社員No'	);
	sTitle.Add('ｶﾅ'	);
	sTitle.Add('氏名'	);
	sTitle.Add('生年月日');
	sTitle.Add('年齢');
	sTitle.Add('入社年月日');
	sTitle.Add('勤続');

	sTitle.Add(fnKMNameGet(105802));
	sTitle.Add('発令日');
	sTitle.Add('滞留年数');

	sTitle.Add(fnKMNameGet(105902));
	sTitle.Add('発令日');
	sTitle.Add('滞留年数');

	sTitle.Add(fnKMNameGet(107002));
	sTitle.Add('発令日');
	sTitle.Add('滞留年数');

	sTitle.Add(fnKMNameGet(108000));	//<2011-09-09>
	sTitle.Add('発令日');
	sTitle.Add('滞留年数');

	sTitle.Add(fnKMNameGet(106002));
	sTitle.Add('発令日');
	sTitle.Add('滞留年数');

	sTitle.Add(fnKMNameGet(106102));
	sTitle.Add('発令日');
	sTitle.Add('滞留年数');

	With DMemPrint.FieldDefs do
	begin
		for i := 0 to 24 do
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
function THAP000058PPrnF.fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
var
	sStr:String;
begin
	case iKbn of
		1:	sStr:=Copy(' '+Formatdatetime('E',SrcDate),Length(Formatdatetime('E',SrcDate)),2);
		2:	sStr:=Copy(' '+IntToStr(MjsMonth(SrcDate)),Length(IntToStr(MjsMonth(SrcDate))),2);
		3:	sStr:=Copy(' '+IntToStr(MjsDay(SrcDate)),Length(IntToStr(MjsDay(SrcDate))),2);
	else
		sStr:='';
	end;
	Result:=sStr;
end;

//******************************************************************************
//	Component		:	ppReport1
//	Event			:	BeforePrint
//******************************************************************************
procedure THAP000058PPrnF.ppReport1BeforePrint(Sender: TObject);
begin
	pPrnParam^.MPrnSpt.BeforePrint(Sender);
end;

//******************************************************************************
//	Component		:	ppDetailBand1
//	Event			:	BeforePrint
//******************************************************************************
procedure THAP000058PPrnF.ppDetailBand1BeforePrint(Sender: TObject);
begin
//
end;

//**************************************************************************
//	Proccess	:	ラベルに項目名称をSetする
//	Parameter	:
//	Retrun		:
//	History	　	:	なし
//**************************************************************************
procedure THAP000058PPrnF.fnLabelItemSet;
var
	i	:	Integer;
	Function fnKMNameGet(iItem : Integer) : String;
	begin
		result := '';
		try
			try
				with Query do
				begin
					Close();
					SQL.Clear();
					SQL.Add('SELECT ItemName from HAPKM' );
					SQL.Add(' WHERE ItemNo = '+IntToStr(iItem));

					Open(True);
					if not eof then
					begin
						result := GetFld('ItemName').AsString
					end;
				end;
			except
				Exit;
			end;
		finally
			Query.Close;
		end;
	end;
//const
//	cDateFormat	= 'gg'' ''e''年''M''月''D''日　現在';
begin

	for i := 0 to ComponentCount - 1 do
	begin
		if Components[i] is TppLabel then
		begin
			if (Components[i] as TppLabel).Tag > 0 then
			begin
				(Components[i] as TppLabel).Caption := fnKMNameGet((Components[i] as TppLabel).Tag);
			end;
		end;
	end;
{
	with mqMA do
	begin
		Close();
		SQL.Clear();
		SQL.Add('Select mpNSP_StdDate() as BaseDate from NSPJINA');
		Open();
		if Not Eof then
		begin
			if GetFld('BaseDate').AsDateTime > 0 then
				LblDate.Caption :=	FormatDateTime('gg',GetFld('BaseDate').AsDateTime)+' '+
									fnGetPrintYMD(GetFld('BaseDate').AsDateTime,1)+'年'+
									fnGetPrintYMD(GetFld('BaseDate').AsDateTime,2)+'月'+
									fnGetPrintYMD(GetFld('BaseDate').AsDateTime,3)+'日　現在'
			else
				LblDate.Caption := '';
		end;
	end;
}
end;

//**************************************************************************
//	Proccess	:	ラベルに項目名称をSetする
//	Parameter	:
//	Retrun		:
//	History	　	:	なし
//**************************************************************************
Function THAP000058PPrnF.fnFormatDate(dDate : TDateTime) : String;
var
	sDate	: String;	//<2011-10-14>
begin
{
	result := '';
	result := FormatDateTime('gg',DDate)+' '+
			fnGetPrintYMD(ddate,1)+'/'+
			fnGetPrintYMD(ddate,2)+'/'+
			fnGetPrintYMD(ddate,3);
}
	Result := '';

	if dDate = 0 then
		Exit;

	if iRekiKbn = 1 {0} then	//<2009-03-19>
	begin
//<2011-10-14>↓
//		Result :=	Formatdatetime('gg ', dDate) +
//						fnGetPrintYMD(dDate, 1) + '/' +
//						fnGetPrintYMD(dDate, 2) + '/' +
//						fnGetPrintYMD(dDate, 3);

// <NewEraName-P1> DEL Start
//		sDate	:= Formatdatetime('g ee', dDate);
//		sDate	:=StringReplace(sDate,'明','M',[rfReplaceAll]);
//		sDate	:=StringReplace(sDate,'大','T',[rfReplaceAll]);
//		sDate	:=StringReplace(sDate,'昭','S',[rfReplaceAll]);
//		sDate	:=StringReplace(sDate,'平','H',[rfReplaceAll]);
// <NewEraName-P1> DEL End
// <NewEraName-P1> ADD Start
		sDate	:=GetEraName(dDate, emAlpha) +
					Formatdatetime('ee', dDate);
// <NewEraName-P1> ADD End

		Result	:= sDate+'/'+FormatDateTime('mm',dDate)+'/'+
					FormatDateTime('dd',dDate);
//<2011-10-14>↑
	end else
	begin
//<2011-10-14>↓
//		Result := FormatDateTime('YYYY/m/d', dDate);
		Result := FormatDateTime('YYYY/mm/dd', dDate);
//<2011-10-14>↑
	end;
end;

//**************************************************************************
//	Proccess	:	テンポラリーテーブル破棄
//	Parameter	:	sTableName
//	Retrun		:	-
//	History		:	Create 2006/12/05 T.Hirasawa (TS2)
//**************************************************************************
procedure	THAP000058PPrnF.fnDropTmpTable(sTableName:String);
begin
	with mqMA do
	begin
		try
			try
				Close();
				SQL.Clear();
				SQL.Add('Drop Table ' + sTableName + ';');
				ExecSQL();
			except
				Exit;
			end;
		finally
			Close();
		end;
	end;
end;

//<RefDay> ↓
//**********************************************************************
//		Proccess	:基準日日付編集
//		Name		:
//		Date		:5/28
//		Parameter	:日付
//		Return		:文字列
//		History		:
//**********************************************************************
function THAP000058PPrnF.fnGetSTDFormatDate(dDate : TDateTime): String;
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
