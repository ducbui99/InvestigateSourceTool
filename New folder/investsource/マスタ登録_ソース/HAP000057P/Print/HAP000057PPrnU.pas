//******************************************************************************
//		System		:MJSFX
//		Program		:兼務者一覧表
//		ProgramID	:HAP000057PPrn
//		Name		:H.Itahana(Buntechno)
//		Create		:2005/07/27
//		Comment		:
//		History		:2005/10/31 H.Itahana(Buntrchno)
//					:・Application対応
//					:2005/12/09 T.Abe(BUNTECHNO)
//					:・戸籍名出力ビュー対応
//					:2005/12/27 H.Itahana(Buntechno)
//					:・本日変更社員印刷対応　<2005-12-27>
//					:2005/04/03 T.ABE (BUNTECHNO)
//					:・フリーコード編集対応　<060403>
//					:2006/04/05 N.Nakamura (TS2)
//					:・戸籍名フリガナ順対応　<060405>
//******************************************************************************
unit HAP000057PPrnU;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  ppCache, ppDB, ppDBPipe, Db, dxmdaset, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppBands, ppCtrls, ppPrnabl, ppVar,FireDAC.Comp.Client,
  MjsDBModuleU,MJSQuery,HapPrnDlgSpU,MjsPrnSupportU, ppModule,
  HapMsgu,MjsPreviewIFU,MjsPrnDlgU,MjsDateCtrl, VCL.StdCtrls, MJSEdits;

const
	{$I HapPrnConst.inc}

type
	{$I HapPrnType.inc}
	{$i ActionInterface.inc}

  THAP000057PPrnF = class(TForm)
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
    ppDBText3: TppDBText;
    ppLine8: TppLine;
    ppDBText4: TppDBText;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLine13: TppLine;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine15: TppLine;
    ppLabel6: TppLabel;
    ppLine12: TppLine;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLine29: TppLine;
	ppDBText10: TppDBText;
    Label_Kbn: TppLabel;
    ppDBText8: TppDBText;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLabel8: TppLabel;
    ppDBText9: TppDBText;
    ppLine20: TppLine;
    ppDBText11: TppDBText;
    ppLine21: TppLine;
    ppLine23: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLabel9: TppLabel;
    ppDBText12: TppDBText;
    DMemPrintKenmu: TStringField;
    DMemPrintKenDeptNo: TStringField;
    DMemPrintKenDeptName: TStringField;
    DMemPrintKenPostNo: TStringField;
    DMemPrintKenPostName: TStringField;
    DMemPrintStay: TStringField;
    DMemPrintRemarks: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine27: TppLine;
    DMemPrintNo: TIntegerField;
    DMemPrintiLine: TStringField;
    DMemPrintHaturei: TStringField;
    LblDate: TppLabel;
    LppAccOfficeSf: TppLabel;
    ppLine28: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    DMemPrintPostHaturei: TStringField;
    DMemPrintPostStay: TStringField;
    DMemPrintPostRMark: TStringField;
    DMemPrintDeptNameL: TStringField;
    DMemPrintPostNo: TStringField;
    DMemPrintPostName: TStringField;
    ppLabel10: TppLabel;
    ppLine9: TppLine;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLine11: TppLine;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    { Private 宣言 }
	pAppRec		: ^TMjsAppRecord;												//MJSAppRecordﾎﾟｲﾝﾀ
	MDBModule	: TMDataModuleF;												//DBﾓｼﾞｭｰﾙ
	ddCopDB		: TFDConnection;													//会社DB
	mqMA		: TMQuery;														//会社ｸｴﾘ
	DBQuery		: TMQuery;
	pPrnParam	: ^THapPrnParam;												//印刷情報
	iEmpAttribute : Integer ;
	iEmpDigit	: Integer ;
	iDeptAttribute : Integer ;
	iDeptDigit	: Integer ;
	iRekiKbn	: integer;
	SPrnEmpNo	: String;

	iIndex		: Integer;
	gsDeptNo	: String;

	gbQyoKijun	: Boolean;
	gbFirstFlg	: Boolean;

	procedure	fnSetFileOut(CmnInfo:TMjsPrnSupport);
	function	fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
	function	fnGetData(	sEmpNo:String;
							sEmpName:String;
							iDeptNCd:String;
							iEmpNCd:Int64;
							iDeptNo,
							sDeptName,sLongName:String):Boolean;

	procedure	fnLabelItemSet;
  public
    { Public 宣言 }
	constructor CreateForm(	pRec,pParam:Pointer);
	procedure	DoPrint;
  end;

var
  HAP000057PPrnF: THAP000057PPrnF;

function AppEntry(pPar:pointer):integer;
exports
  AppEntry;

implementation
uses
	HAPLibU,
	MjSDispCtrl,
	MjSStrCtrl,
	MJSCommonu;

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
	pForm	: ^THAP000057PPrnF;
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
				pForm^ := THAP000057PPrnF.CreateForm( pRec,pParam );
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
			THAP000057PPrnF(pForm^).DoPrint;
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
//		Name		:まる
//		Date		:2002/10/22
//		Parameter	:Sender	:TObject
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000057PPrnF.FormCreate(Sender: TObject);
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
//		Name		: まる
//		Date		: 2002/10/22
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000057PPrnF.FormDestroy(Sender: TObject);
begin
	mqMA.Free;
	DBQuery.Free;
	MDBModule.CopDBClose(ddCopDB);
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
procedure THAP000057PPrnF.ppHeaderBand1BeforePrint(Sender: TObject);
begin
	ppLDeptNo.Caption :=
		HapCodeAttribute2(DMemPrint.FieldByName('DeptNo').AsString,iDeptDigit,iDeptAttribute);
	//	HapCodeAttribute(DMemPrint.FieldByName('DeptNo').AsString,iDeptDigit,iDeptAttribute<>1);

	ppLDeptName.Caption := DMemPrint.FieldByName('DeptName').AsString;

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
//		Name		:T.Aoki
//		Date		:01/01/30
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
constructor THAP000057PPrnF.CreateForm(pRec,pParam: Pointer);
var
	iCnt		:	Integer;
	POwnerForm	: ^TControl;
begin
	pAppRec	:= pRec;															//MjsAppRecord
	pPrnParam :=pParam;

//2005-10-31
	POwnerForm := pAppRec^.m_pChildForm;   										//  オーナーフォームを取得

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
			SQL.Add('SELECT YearKbn FROM DTMAIN');

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
	DBQuery := TMQuery.Create(self);

	if Assigned(DBQuery) <> True then
	begin
		Exit;
	end;

	MDBModule.SetDBInfoToQuery(ddCopDB,DBQuery);

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
//					:・在職/支払形態の指定に対応
//					:・"所属なし"が名称に出力されているのを修正
//					:05/12/09	T.Abe(BUNTECHNO)
//					:・戸籍名出力対応
//**********************************************************************
procedure THAP000057PPrnF.DoPrint;
var
	mqPrn	: TMQuery;
	i		: integer;
	bData	: Boolean;

	sName	: String;
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
	begin
		ppLDeptNo.Alignment	:= taLeftJustify;
		ppDBText3.Alignment	:= taLeftJustify;
	end
	else
	begin
		ppLDeptNo.Alignment	:= taRightJustify;
		ppDBText3.Alignment	:= taRightJustify;
	end;


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
					Clear;

					//印刷ｶﾗﾑ
					Add('SELECT');
					Add(' SC.GCode');
					Add(',SC.NCode');
					Add(',MS.Name');
//					Add(',SC.DeptNCd');

					// 戸籍名出力対応
					Add(',MS.TrueNameU');

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
					Add('	LongName');
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
					Add(' LongName');

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
					Add(' HAPSC  AS SC');
					Add(' INNER JOIN');

					// 戸籍名出力ビュー対応
					//Add('MOS_OFFICE_STAFF MS');
					Add('MV_HAP_CMNMOS MS');
					Add('ON MS.NCode=SC.NCode');

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
					//出力順
					Add('ORDER BY');
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
					Open(TRUE);
					if not Eof then												//印刷ﾃﾞｰﾀ有
					begin
						DMemPrint.Close;
						DMemPrint.Open;
						SPrnEmpNo:='';
                        gsDeptNo := GetFld('DeptNCd').AsString;
						iIndex := 0;
						while not eof do
						begin
                        	// 戸籍名出力対応
                            if pPrnParam^.HapPrnSpt.iNameType = 1 then
                            	sName	:= GetFld('TrueNameU').AsString
                            else
                            	sName	:= GetFld('Name').AsString;

							if fnGetData(GetFld('GCode').AsString,
								sName,
								GetFld('DeptNCd').AsString,
								Trunc(GetFld('NCode').AsFloat),
								GetFld('DeptNo').AsString,
								GetFld('Ryaku').AsString,
								GetFld('LongName').AsString) then
								bData := TRUE;
							next;
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
							MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjError,mjdefOK);
							exit;
						end
						else
							fnLabelItemSet;

						case pPrnParam^.MPrnSpt.iCommand	of
							PDLG_PRINT:		//印刷
								ppReport1.Print;
							PDLG_PREVIEW:	//ﾌﾟﾚﾋﾞｭｰ
								with pPrnParam^ do
									MPrev.Exec(MPrnSpt,MDlgF,nil);
							PDLG_FILE:		//ファイル出力
								fnSetFileOut(pPrnParam^.MPrnSpt);
						end;
					end
					else														//印刷ﾃﾞｰﾀ無
						MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjError,mjdefOK);
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
end;

//**********************************************************************
//		Proccess	:印刷のデータを取る
//		Name		:Yoshitaka Kondo (BUNTECHNO)
//		Date		:2002/02/20
//		Parameter	:
//		Return		:
//		History		:04/08/04(T.Aoki)
//					:役職区分=0が出力されるのを修正
//**********************************************************************
function THAP000057PPrnF.fnGetData(sEmpNo: String;
									sEmpName: String;
									iDeptNCd: String;
									iEmpNCd: Int64;
									iDeptNo,
									sDeptName,
									sLongName	: string):Boolean;
var
	DMQuery	: TMQuery;
	rcMsg	: TMjsMsgRec;

	iPosCnt	: Integer;

	bExistFlg	:	Boolean;

	sKDeptCode,
	sKDeptName,
	sKDeptOrder,
	sKDeptMonth,
	sKDeptRMark	:	String;

	sKPostCode,
	sKPostName,
	sKPostOrder,
	sKPostMonth,
	sKPostRMark	:	String;

	sNPostCode,
	sNPostName	:	String;

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
	//兼務が存在するか確認--------------------
				Close;
				SQL.Clear;
				SQL.Add('SELECT CHG.OrderDate,CHG.Remarks,MA.LongName,CHG.DeptNCode,');
				SQL.Add('MF_HAP_Months(CHG.OrderDate ,MF_HAP_CurEnd(CHG.EmpNCode,CHG.CorpNCode,0)) AS _MONTHS_DEPT');

				SQL.Add('FROM HAPCHG CHG INNER JOIN HojyoMA MA ON CHG.DeptNCode=MA.NCode');
				SQL.Add('AND CHG.MasterKbn=MA.MasterKbn');

				SQL.Add('WHERE CHG.CorpNCode=0');
				SQL.Add('AND CHG.EmpNCode=:hEmpNCd');
				SQL.Add('AND (CHG.MasterKbn=41 or CHG.MasterKbn=87)');		//所属or役職
				SQL.Add('AND (CHG.AddPos>0 and CHG.AddPos<10)');			//兼務1～9
				SQL.Add('AND CHG.DeptNCode>0');
				SQL.Add('AND JinSts=1');

				SetFld('hEmpNCd').AsFloat := iEmpNCd;

				if not Open then
					Abort;

				if Eof then	//兼務データ存在せず→印刷しない
					Exit;

	//初回のみ基準日印刷--------------------
				if gbFirstFlg = True then
				begin
					LblDate.Caption := '';

					if gbQyoKijun = True then
						LblDate.Caption := '給与年月基準'
					else
					begin
						Close;
						SQL.Clear;
						SQL.Add('SELECT');
						SQL.Add('MF_HAP_StdDate(SC.CorpNCode,SC.NCode) AS _BASE_DATE'	);
						SQL.Add('FROM HAPSC SC WHERE SC.NCode=:hNCd AND SC.CorpNCode=0'	);

						SetFld('hNCd').AsFloat := iEmpNCd;

						if not Open then
							Abort;

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

	//現在役職の取得--------------------
				Close;
				SQL.Clear;
				SQL.Add('SELECT MA.LongName,MA.GCode'								);
				SQL.Add('FROM HAPCHG CHG INNER JOIN HojyoMA MA'						);
				SQL.Add('ON CHG.DeptNCode=MA.NCode AND CHG.MasterKbn=MA.MasterKbn'	);
				SQL.Add('WHERE CHG.CorpNCode=0 AND CHG.EmpNCode=:hEmpNCd'			);
				SQL.Add('AND CHG.MasterKbn=87 AND CHG.AddPos=0'						);
				SQL.Add('AND CHG.DeptNCode>0 AND JinSts=1'							);

				SetFld('hEmpNCd').AsFloat := iEmpNCd;

				if not Open then
					Abort;

				sNPostCode := '';
				sNPostName := '';

				if not Eof then
				begin
					sNPostCode := GetFld('GCode').AsString;
					sNPostName := GetFld('LongName').AsString;
				end;

	//兼務は1～9まで存在する。--------------------
				Close;
				SQL.Clear;
				SQL.Add('SELECT CHG.OrderDate,CHG.Remarks,MA.LongName,MA.GCode,');
				SQL.Add('MF_HAP_Months(CHG.OrderDate ,MF_HAP_CurEnd(CHG.EmpNCode,CHG.CorpNCode,0)) AS _MONTHS_DEPT');

				SQL.Add('FROM HAPCHG CHG INNER JOIN HojyoMA MA ON CHG.DeptNCode=MA.NCode');
				SQL.Add('AND CHG.MasterKbn=MA.MasterKbn');

				SQL.Add('WHERE CHG.CorpNCode=0');
				SQL.Add('AND CHG.EmpNCode=:hEmpNCd');
				SQL.Add('AND CHG.MasterKbn=:hMAKbn');
				SQL.Add('AND CHG.AddPos=:hAddPos');
				SQL.Add('AND CHG.DeptNCode>0');
				SQL.Add('AND JinSts=1');

				for iPosCnt := 1 to 9 do
				begin
					bExistFlg	:=	False;
					sKDeptCode	:=	'';
					sKDeptName	:=	'';
					sKDeptOrder	:=	'';
					sKDeptMonth	:=	'';
					sKDeptRMark	:=	'';
					sKPostCode	:=	'';
					sKPostName	:=	'';
					sKPostOrder	:=	'';
					sKPostMonth	:=	'';
					sKPostRMark	:=	'';

				//所属確認
					SetFld('hEmpNCd').AsFloat	:=	iEmpNCd;
					SetFld('hAddPos').AsInteger :=	iPosCnt;
					SetFld('hMAKbn').AsInteger	:=	41;

					if not Open then
						Abort;

					if not Eof then
					begin
						bExistFlg	:=	True;
						sKDeptCode	:=	HapCodeAttribute2(GetFld('GCode').AsString, iDeptDigit, iDeptAttribute);
						sKDeptName	:=	GetFld('LongName').AsString;
						sKDeptRMark	:=	GetFld('Remarks').AsString;

						if not (GetFld('OrderDate').IsNull) then
						begin
							if iRekiKbn = 0 then
							begin
								sKDeptOrder :=	Formatdatetime('gg ',GetFld('OrderDate').AsDatetime)+
												fnGetPrintYMD(GetFld('OrderDate').AsDatetime,1)+'/'+
												fnGetPrintYMD(GetFld('OrderDate').AsDatetime,2)+'/'+
												fnGetPrintYMD(GetFld('OrderDate').AsDatetime,3);
							end
							else
							begin
								sKDeptOrder :=	FormatDateTime('YYYY/m/d',GetFld('OrderDate').AsDateTime);
							end;

							sKDeptMonth :=	Format('%2.2n',[	(GetFld('_MONTHS_DEPT').AsInteger div 12)+
																(GetFld('_MONTHS_DEPT').AsInteger mod 12)*0.01	])
																+' 年';
						end;
					end;

				//役職確認
					Close;
					SetFld('hEmpNCd').AsFloat	:=	iEmpNCd;
					SetFld('hAddPos').AsInteger :=	iPosCnt;
					SetFld('hMAKbn').AsInteger	:=	87;

					if not Open then
						Abort;

					if not Eof then
					begin
						bExistFlg	:=	True;
						sKPostCode	:=	HapCodeAttribute2(GetFld('GCode').AsString, iDeptDigit, iDeptAttribute);
						sKPostName	:=	GetFld('LongName').AsString;
						sKPostRMark	:=	GetFld('Remarks').AsString;

						if not (GetFld('OrderDate').IsNull) then
						begin
							if iRekiKbn = 0 then
							begin
								sKPostOrder :=	Formatdatetime('gg ',GetFld('OrderDate').AsDatetime)+
												fnGetPrintYMD(GetFld('OrderDate').AsDatetime,1)+'/'+
												fnGetPrintYMD(GetFld('OrderDate').AsDatetime,2)+'/'+
												fnGetPrintYMD(GetFld('OrderDate').AsDatetime,3);
							end
							else
							begin
								sKPostOrder :=	FormatDateTime('YYYY/m/d',GetFld('OrderDate').AsDateTime);
							end;

							sKPostMonth :=	Format('%2.2n',[	(GetFld('_MONTHS_DEPT').AsInteger div 12)+
																(GetFld('_MONTHS_DEPT').AsInteger mod 12)*0.01	])
																+' 年';
						end;
					end;

					Close;

                    if bExistFlg = False then	//所属・役職が存在しない。
						Continue;

					DMemPrint.Append;
					Inc(iIndex);

				//社員ｺｰﾄﾞ
					DMemPrint.FieldByName('EmpNo').AsString :=
						HapCodeAttribute2(sEmpNo,iEmpDigit,iEmpAttribute);

					DMemPrint.FieldByName('EmpNCd').AsString :=
						HapCodeAttribute(inttostr(iEmpNCd),iEmpDigit,iEmpAttribute<>1);

				//社員名
					DMemPrint.FieldByName('EmpName').AsString := sEmpName;

				//所属名
					DMemPrint.FieldByName('DeptNameL').AsString := sLongName;

				//所属ｺｰﾄﾞ
					if (Trim(iDeptNCd) <> '0') and
						(Trim(iDeptNCd) <> '' ) then
					begin
						DMemPrint.FieldByName('DeptNCd').AsString := iDeptNCd;
						DMemPrint.FieldByName('DeptNo').AsString :=
							HapCodeAttribute2(iDeptNo,iDeptDigit,iDeptAttribute);
					end;

				//役職コード
					DMemPrint.FieldByName('PostNo').AsString	:=  sNPostCode;

				//役職名
					DMemPrint.FieldByName('PostName').AsString 	:=  sNPostName;

				//兼務X
					DMemPrint.FieldByName('Kenmu').AsString := '兼務'+ IntToStr(iPosCnt);

    			//所属
					DMemPrint.FieldByName('KenDeptNo').AsString		:=sKDeptCode;
					DMemPrint.FieldByName('KenDeptName').AsString	:=sKDeptName;
					DMemPrint.FieldByName('Haturei').AsString		:=sKDeptOrder;
					DMemPrint.FieldByName('Stay').AsString			:=sKDeptMonth;
					DMemPrint.FieldByName('Remarks').AsString		:=sKDeptRMark;

    			//役職
					DMemPrint.FieldByName('KenPostNo').AsString		:=sKPostCode;
					DMemPrint.FieldByName('KenPostName').AsString	:=sKPostName;
					DMemPrint.FieldByName('PostHaturei').AsString	:=sKPostOrder;
					DMemPrint.FieldByName('PostStay').AsString		:=sKPostMonth;
					DMemPrint.FieldByName('PostRMark').AsString		:=sKPostRMark;

					DMemPrint.FieldByName('No').AsInteger := iIndex;

					DMemPrint.post;

				end;
			end;

	       	Result := TRUE;

		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'兼務者'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
		end;

	finally
		DMQuery.Close;
		DMQuery.Free;
	end;


	if Result = True then
	begin
		DMemPrint.Edit;
		DMemPrint.FieldByName('iLine').AsInteger:=1;
		DMemPrint.Post;
	end;

end;

//**********************************************************************
//*		Proccess	:	ファイル出力に必要なTitle･Filed設定
//*		Name		:	Yoshitaka Kondo (BUNTECHNO)
//*		Date		:	2002/02/20
//*		Parameter	:	sTitle	:	CreateされたTStringList(ﾀｲﾄﾙ用)
//*						sMemFld	:	CreateされたTStringList(ﾌｨｰﾙﾄﾞ用)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure THAP000057PPrnF.fnSetFileOut(CmnInfo:TMjsPrnSupport);
var
	sTitle	: TStringList;
	sMemFld	: TStringList;
	rcMsg	: TMjsMsgRec;
	i		: Integer;
	s		: String;
begin
	sTitle	:= TStringList.Create;												//ファイル出力用リスト(タイトル)作成
	sMemFld	:= TStringList.Create;												//ファイル
	sTitle.Add('社員No'	);
	sTitle.Add('氏名'	);
	sTitle.Add('所属コード');
	sTitle.Add('所属名');
	sTitle.Add('兼務所属コード');
	sTitle.Add('兼務所属名');
	sTitle.Add('兼務役職');
	sTitle.Add('兼務役職名');
	sTitle.Add('兼務'	);
	sTitle.Add('発令日'	);
	sTitle.Add('期間'	);
	sTitle.Add('事由'	);

	With DMemPrint.FieldDefs do
	begin
		for i := 0 to Count-5 do
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
//* Name		: kos
//* Date		: 2001/06/22
//* Parameter	: SrcDate 日付
//* Return		: １：年 ２：月 ３：日
//**********************************************************************
function THAP000057PPrnF.fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
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
//	Name			:	まる
//******************************************************************************
procedure THAP000057PPrnF.ppReport1BeforePrint(Sender: TObject);
begin
	pPrnParam^.MPrnSpt.BeforePrint(Sender);
end;

//******************************************************************************
//	Component		:	ppDetailBand1
//	Event			:	BeforePrint
//	Name			:	まる
//******************************************************************************
procedure THAP000057PPrnF.ppDetailBand1BeforePrint(Sender: TObject);
begin
	if sPrnEmpNo=DMemPrint.FieldByName('EmpNo').AsString then
	begin
		ppDBText1.Visible:=False;
		ppDBText2.Visible:=False;
		ppDBText9.Visible:=False;
		ppDBText11.Visible:=False;

		ppDBText13.Visible:=False;
		ppDBText14.Visible:=False;

		ppLine31.Visible:=False;
		ppLine11.Visible:=False;
	end
	else
	begin
		ppDBText1.Visible:=True;
		ppDBText2.Visible:=True;
		ppDBText9.Visible:=True;
		ppDBText11.Visible:=True;

		ppDBText13.Visible:=True;
		ppDBText14.Visible:=True;

		ppLine31.Visible:=True;
		ppLine11.Visible:=True;

		sPrnEmpNo:=DMemPrint.FieldByName('EmpNo').AsString;
	end;


	if DMemPrint.FieldByName('iLine').AsString='1' then
	begin
		ppLine27.Visible:=True;
		ppLine11.Visible:=True;
	end
	else
	begin
		ppLine27.Visible:=FALSE;
//		ppLine11.Visible:=False;
	end;

//	if DMemPrint.FieldByName('No').AsInteger mod 44 = 1 then
	if DMemPrint.FieldByName('No').AsInteger mod 21 = 1 then
	begin
		ppDBText1.Visible:=True;
		ppDBText2.Visible:=True;
		ppDBText9.Visible:=True;
		ppDBText11.Visible:=True;

		ppDBText13.Visible:=True;
		ppDBText14.Visible:=True;
		ppLine31.Visible:=True;
		ppLine11.Visible:=True;
	end;

//	if DMemPrint.FieldByName('No').AsInteger mod 44 = 0 then
	if DMemPrint.FieldByName('No').AsInteger mod 21 = 0 then
	begin
		ppLine27.Visible:=True;
		ppLine11.Visible:=True;
	end;

end;

//**************************************************************************
//	Proccess  	:  	ラベルに項目名称をSetする
//	Name	  	:  	まる
//	Date		:  	2002/10/23
//	Parameter  	:
//	Retrun	  	:
//	History	　	:	なし
//**************************************************************************
procedure THAP000057PPrnF.fnLabelItemSet;
var
	i	:	Integer;
	Function fnKMNameGet(iItem : Integer) : String;
	begin
		result := '';
		try
			try
				with mqMA do
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
			mqMA.Close;
		end;
	end;
const
	cDateFormat	= 'gg'' ''e''年''M''月''D''日　現在';
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
		SQL.Add('Select * from NSPJINA');
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

end.
