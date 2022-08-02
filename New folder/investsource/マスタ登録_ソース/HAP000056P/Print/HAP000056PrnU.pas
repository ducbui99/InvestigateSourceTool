//******************************************************************************
//		System		:MJSLINK給与大将
//		Program		:出向者一覧表
//		ProgramID	:HAP000056PPrn
//		Name		:H.Itahana(Buntechno)
//		Create		:2005/07/26
//		Comment		:
//		History		:2005/10/31
//					:・Application対応
//					:2005/12/09	T.Abe(BUNTECHNO)
//					:・戸籍名出力ビュー対応
//					:2005/12/27 H.Itahana(Buntechno)
//					:・本日変更社員印刷対応　						<2005-12-27>
//					:2006/04/03 T.ABE (BUNTECHNO)
//					:・フリーコード編集対応　						<060403>
//					:2006/04/05 N.Nakamura (TS2)
//					:・戸籍名フリガナ順対応　						<060405>
//					:2006/08/25 H.Takaishi (BUNTECHNO)
//					:・部門権限対応									<2006-08-25>
//					:2006/09/07 H.Takaishi (BUNTECHNO)
//					:・印刷データなしの時[エラー]→[警告]			<2006-09-07>
//					:2007/05/02 H.Takaishi (BUNTECHNO)
//					:・部門権限対応（未所属社員は常に出力対象）		<2007-05-02>
//					:2007/05/07 H.Takaishi (BUNTECHNO)
//					:・所属改頁時のヘッダ部で未所属は「(所属なし)」	<2007-05-07>
//					:2008/02/13 T.ABE (TAKUMI)						<080213>
//					:・出向先出力情報を追加(部署/役職/事由)
//					:・暦区分はCalendarKbnを参照
//					:2008/02/28 H.Takaishi (TAKUMI)					<2008-02-28>
//					:・現在出向情報複数化対応
//					:2008/06/09 H.Takaishi (TakumiCo.)
//					:・印刷履歴対応（MjsPreview経由で印刷処理実行）	<2008-06-09>
//					:2010/03/18 H.Takaishi (TakumiCo.)
//					:・印刷時ページ指定を有効にする					<2010-03-18>
//					:2011/02/07 H.Yamashiro
//					:・ChildFormをCreateForm後に移動				<20110207>
//******************************************************************************
unit HAP000056PrnU;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  Db, dxmdaset, ppDB, ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport,FireDAC.Comp.Client,
  MjsDBModuleU,MJSQuery,HapPrnDlgSpU,MjsPrnSupportU, ppModule,
  HapMsgu,MjsPreviewIFU,MjsPrnDlgU,MjsDateCtrl;

const
	{$I HapPrnConst.inc}

type
	{$I HapPrnType.inc}
	{$i ActionInterface.inc}

  THAP000056PPrnF = class(TForm)
	ppDBPipeline1: TppDBPipeline;
	DSrcPrint: TDataSource;
	DMemPrint: TdxMemData;
	ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel4: TppLabel;
    pphlCopNoSf: TppLabel;
    pphlCopNameSf: TppLabel;
    pphsvDateSf: TppSystemVariable;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLabel1: TppLabel;
    Label_Name: TppLabel;
    ppLine1: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    Label_Kbn: TppLabel;
    ppLabel5: TppLabel;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel6: TppLabel;
    ppLine8: TppLine;
    ppLabel7: TppLabel;
    ppLine14: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppDBText14: TppDBText;
	ppDBText15: TppDBText;
	ppLine21: TppLine;
    ppLine24: TppLine;
    ppLine22: TppLine;
    ppLine19: TppLine;
    ppLine10: TppLine;
    ppDBText4: TppDBText;
    ppLine16: TppLine;
    ppLine15: TppLine;
    ppLine25: TppLine;
    ppFooterBand1: TppFooterBand;
    ppfsvPageSf: TppSystemVariable;
    LppAccOfficeSf: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    DMemPrintEmpNo: TStringField;
    DMemPrintEmpName: TStringField;
    DMemPrintLoanName: TStringField;
    DMemPrintLoanDept: TStringField;
    DMemPrintLoanPost: TStringField;
    DMemPrintLoanDate: TStringField;
    DMemPrintLoanFreeNen: TStringField;
    DMemPrintLoanNo: TStringField;
    DMemPrintEmpNCd: TStringField;
    DMemPrintDeptNo: TStringField;
    DMemPrintDeptNCd: TStringField;
    DMemPrintDeptName: TStringField;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    DMemPrintLoanRemark: TStringField;
    ppLDeptNo: TppLabel;
    ppLDeptName: TppLabel;
    LblDate: TppLabel;
    DMemPrintEmpKana: TStringField;
    ppDBText5: TppDBText;
    ppLine6: TppLine;
    ppLine3: TppLine;
    ppLine7: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    DMemPrintEmpBreak: TBooleanField;
    ppLineEmpBottom: TppLine;

	procedure FormCreate(Sender:TObject);
	constructor CreateForm(	pRec,pParam:Pointer);
	procedure FormDestroy(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforeGenerate(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);

  private
	{ Private 宣言 }
	pAppRec		: ^TMjsAppRecord;												//MJSAppRecordﾎﾟｲﾝﾀ
	MDBModule	: TMDataModuleF;												//DBﾓｼﾞｭｰﾙ
	ddCopDB		: TFDConnection;													//会社DB
	mqMA		: TMQuery;														//会社ｸｴﾘ
	pPrnParam	: ^THapPrnParam;												//印刷情報
	iEmpAttribute : Integer ;
	iEmpDigit	: Integer ;
	iDeptAttribute : Integer ;
	iDeptDigit	: Integer ;

    //<080213>
	//iRekiKbn	: integer;
    m_CalendarKbn	: Integer;

	gbQyoKijun	: Boolean;
	gbFirstFlg	: Boolean;

	procedure fnSetFileOut(CmnInfo:TMjsPrnSupport);

	function fnGetData(	sEmpNo:String;
						sEmpName:String;
						sKanaName:String;
						iDeptNCd:String;
						iEmpNCd:Int64;
						iDeptNo,
						sDeptName:String):Boolean;

	procedure DoPrint;

	function fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
	procedure	fnLabelItemSet;

	function fnIsPageBottom(ppDetail : TppDetailBand) : Boolean;				// ページ下端判定
	function fnIsEndRecord(DataSet : TDataSet) : Boolean;						// 最終レコード判定
  public
	{ Public 宣言 }
  end;

function AppEntry(pPar:pointer):integer;
exports
  AppEntry;

implementation
uses
	HAPLibU,
	MjSDispCtrl,
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
	pForm	: ^THAP000056PPrnF;
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
			except
				Exit;
			end;

			try
				pForm^ := THAP000056PPrnF.CreateForm( pRec,pParam );
				pRec^.m_pChildForm := pForm;							// <20110207>
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
			THAP000056PPrnF(pForm^).DoPrint;
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
procedure THAP000056PPrnF.FormCreate(Sender: TObject);
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
//		Name		:T.Aoki
//		Date		:01/01/30
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
constructor THAP000056PPrnF.CreateForm(pRec,pParam: Pointer);
var
	iCnt	:	Integer;
begin
	pAppRec	:= pRec;															//MjsAppRecord
	pPrnParam :=pParam;

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

            //<080213>
			//SQL.Add('SELECT YearKbn FROM DTMAIN');
			SQL.Add('SELECT CalendarKbn FROM HAPM3');

			if not Open then Abort;
			if Eof then Abort;

            //<080213>
			//iRekiKbn := GetFld('YearKbn').AsInteger ;
			m_CalendarKbn := GetFld('CalendarKbn').AsInteger ;

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

	//OwnerはMjsAppRecordに格納されているAPﾌｫｰﾑ
	inherited Create(Application);												//BPL化によりOwner変更
end;
//**********************************************************************
//	PUPLIC
//**********************************************************************
//**********************************************************************
//		Proccess	:印刷
//		Name		:Yoshitaka Kondo(BUNTECHNO)
//		Date		:2002/02/18
//		History		:2004/08/04(T.Aoki)
//					:在職/支払形態の指定に対応
//					:2005/12/09	T.Abe(BUNTECHNO)
//					:戸籍名出力ビュー対応
//**********************************************************************
procedure THAP000056PPrnF.DoPrint;
var
	mqPrn	: TMQuery;
	i		: integer;
	bData	: Boolean;

    sKana,
    sName	: String;
begin

	if (pPrnParam^.HapPrnSpt.bPageBreak)
		and ((pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU)
		or (pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI)) then				//改頁[あり]
		ppReport1.Groups[0].NewPage := pPrnParam^.HapPrnSpt.bPageBreak
	else
		ppReport1.Groups[0].NewPage := False;


	//フリーコード編集 <060403>
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
					Add(',MS.KanaName');

                    // 戸籍名出力ビュー対応
					Add(',MS.TrueNamekana1M');
					Add(',MS.TrueNamekana2M');
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
					Add('FROM'			);
					Add(	'HAPSC SC'	);

                    // 戸籍名出力ビュー対応
					//Add('INNER JOIN MOS_OFFICE_STAFF AS MS');
					Add('INNER JOIN MV_HAP_CMNMOS AS MS');
					Add('ON MS.NCode=SC.NCode'				);

					Add('WHERE'		);

					Add('SC.SyokuchiKbn=0');
					Add('AND');

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
					Open;
					if not Eof then												//印刷ﾃﾞｰﾀ有
					begin
						DMemPrint.Close;
						DMemPrint.Open;
						while not eof do
						begin
                        	// 戸籍名出力ビュー対応
                            if pPrnParam^.HapPrnSpt.iNameType = 1 then
                            begin
                            	sKana   := GetFld('TrueNamekana1M').AsString + ' ' + GetFld('TrueNamekana2M').AsString;
                                sName	:= GetFld('TrueNameU').AsString;
                            end
                            else
                            begin
                            	sKana	:= GetFld('KanaName').AsString;
                                sName   := GetFld('Name').AsString;
                            end;

							if fnGetData(GetFld('GCode').AsString,
								sName,
								sKana,
								GetFld('DeptNCd').AsString,
								Trunc(GetFld('NCode').AsFloat),
								GetFld('DeptNo').AsString,
								GetFld('Ryaku').AsString) then
								bData := TRUE;
							next;
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
		end;
	except
		raise Exception.Create('印刷用ｸｴﾘ 生成失敗');
	end;
end;


//**********************************************************************
//		Proccess	: 印刷のデータを取る
//		Name		: Yoshitaka Kondo (BUNTECHNO)
//		Date		: 2002/02/20
//		Parameter	:
//		Return		:
//		History		: 99/99/99(X.Name)
//					: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000056PPrnF.fnGetData(sEmpNo: String; sEmpName: String; sKanaName : String;
	  iDeptNCd: String; iEmpNCd: Int64; iDeptNo,sDeptName: string):Boolean;
var
	DMQuery	: TMQuery;
	rcMsg	: TMjsMsgRec;

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
                SQL.Add('Select'			);
				SQL.Add('MF_HAP_StdDate(SC.CorpNCode,SC.NCode) AS _BASE_DATE,'	);
                SQL.Add('SLN.LoanCorpName,'	);									//出向会社名
                SQL.Add('SLN.LoanDateSt,'  	);									//出向開始年月日

				SQL.Add('MF_HAP_Months(SLN.LoanDateSt,MF_HAP_CurEnd(SC.CorpNCode,SC.NCode,0))');
				SQL.Add('AS _MONTHS_LOAN,');									//出向期間

                SQL.Add('SLN.LoanDeptName,'	);									//出向部署
                SQL.Add('SLN.LoanPostName,'	);									//出向肩書き
				SQL.Add('SLN.LoanComment'  	);									//出向事由
				SQL.Add('From HAPSC SC'	   	);
				SQL.Add('INNER JOIN HAPSLN SLN'			);
				SQL.Add('ON SC.NCode=SLN.EmpNCode'		);
				SQL.Add('AND SC.CorpNCode=SLN.CorpNCode');

                SQL.Add('WHERE SC.NCode ='+ inttostr(iEmpNCd));
                SQL.Add('AND SC.CorpNCode=0'			);
                SQL.Add('AND SLN.CompSt=1'				);		//開始完了区分：完了
                SQL.Add('AND SLN.CompEd=0'				);		//終了完了区分：予定
				SQL.Add('ORDER BY SLN.LoanDateSt DESC, SLN.LoanNCode');	// <2008-02-28>

				Open(True);

				if Eof then exit;

				while not Eof do
				begin
	//初回のみ基準日印刷--------------------
					if gbFirstFlg = True then
					begin
						LblDate.Caption := '';

						if gbQyoKijun = True then
							LblDate.Caption := '給与年月基準'
						else
						begin
							if not GetFld('_BASE_DATE').IsNull then
							begin
                            	//<080213>
								//if iRekiKbn = 0 then
								if m_CalendarKbn = 1 then
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

	//データ印刷--------------------
					DMemPrint.Append;

					//フリーコード編集<060403>
					//社員ｺｰﾄﾞ
					DMemPrint.FieldByName('EmpNo').AsString :=
								HapCodeAttribute2(sEmpNo,iEmpDigit,iEmpAttribute);
					DMemPrint.FieldByName('EmpNCd').AsString := inttostr(iEmpNCd);

					//社員名
					DMemPrint.FieldByName('EmpName').AsString := sEmpName;
					DMemPrint.FieldByName('EmpKana').AsString := sKanaName;

					// 所属名（簡略）
					DMemPrint.FieldByName('DeptName').AsString := sDeptName;

					//所属ｺｰﾄﾞ
					if (Trim(iDeptNCd) <> '0') and
						(Trim(iDeptNCd) <> '' ) then
					begin
						DMemPrint.FieldByName('DeptNCd').AsString := iDeptNCd;
						DMemPrint.FieldByName('DeptNo').AsString :=
								HapCodeAttribute2(iDeptNo,iDeptDigit,iDeptAttribute);

					end;

					DMemPrint.FieldByName('LoanName').AsString := DMQuery.GetFld('LoanCorpName').AsString;
					DMemPrint.FieldByName('LoanDept').AsString := DMQuery.GetFld('LoanDeptName'	).AsString;
					DMemPrint.FieldByName('LoanPost').AsString := DMQuery.GetFld('LoanPostName'	).AsString;

					DMemPrint.FieldByName('LoanDate').AsString :='';
					if GetFld('LoanDateSt').IsNull=False then
					begin
                    	//<080213>
						//if iRekiKbn=0 then
						if m_CalendarKbn = 1 then
							DMemPrint.FieldByName ('LoanDate').AsString :=
												Formatdatetime('gg',GetFld('LoanDateSt').AsDatetime)+' '+
												fnGetPrintYMD(GetFld('LoanDateSt').AsDatetime,1)+'/'+
												fnGetPrintYMD(GetFld('LoanDateSt').AsDatetime,2)+'/'+
												fnGetPrintYMD(GetFld('LoanDateSt').AsDatetime,3)
						else
							DMemPrint.FieldByName ('LoanDate').AsString
												:= FormatDateTime('YYYY/m/d',GetFld('LoanDateSt').AsDateTime);

						DMemPrint.FieldByName('LoanFreeNen').AsString :=
									Format('%2.2n',[	(GetFld('_MONTHS_LOAN').AsInteger div 12)+
														(GetFld('_MONTHS_LOAN').AsInteger mod 12)*0.01])
														+' 年';
					end;

					DMemPrint.FieldByName('LoanRemarks').AsString := GetFld('LoanComment').AsString;

					Result := TRUE;

					Next;		//次ﾚｺｰﾄﾞ
				end;

				DMemPrintEmpBreak.AsBoolean := True;
				DMemPrint.Post;
			end;

		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'出向先'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
		end;

	finally
		DMQuery.Close;
		DMQuery.Free;
	end;

	if Result = True then
	begin
		DMemPrint.Edit;
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
procedure THAP000056PPrnF.FormDestroy(Sender: TObject);
begin
	mqMA.Free;
	MDBModule.CopDBClose(ddCopDB);
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
procedure THAP000056PPrnF.fnSetFileOut(CmnInfo:TMjsPrnSupport);
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
	sTitle.Add('氏名ｶﾅ'	);
	sTitle.Add('氏名'	);
	sTitle.Add('会社名');
	sTitle.Add('発令日'	);
	sTitle.Add('期間'	);

{<2005-10-20>
	sTitle.Add('事由'	);
	sTitle.Add('出向先部署'	);
	sTitle.Add('出向先肩書き'	);
}
	With DMemPrint.FieldDefs do
	begin
//<2005-10-20>
//		for i := 0 to Count-5 do
		for i := 0 to Count-8 do
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
function THAP000056PPrnF.fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
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
procedure THAP000056PPrnF.ppHeaderBand1BeforePrint(Sender: TObject);
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

//**************************************************************************
//	Proccess  	:  	ラベルに項目名称をSetする
//	Name	  	:  	まる
//	Date		:  	2002/10/23
//	Parameter  	:
//	Retrun	  	:
//	History	　	:	なし
//**************************************************************************
procedure THAP000056PPrnF.fnLabelItemSet;
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

// <2008-02-28>
//************************************************************************
//      Component   : ppDetailBand1
//      Event       : BeforeGenerate
//      Name        : H.Takaishi (TAKUMI)
//      Date        : 2008/02/28
//      Parameter   :
//      Return      :
//      History     : 9999/99/99    X.Name
//                      XXXXXXXXXXXXXXX
//************************************************************************
procedure THAP000056PPrnF.ppDetailBand1BeforeGenerate(Sender: TObject);
begin
	if DMemPrintEmpBreak.AsBoolean or
		fnIsPageBottom(Sender as TppDetailBand) or
		fnIsEndRecord(DMemPrint) then
	begin
		ppLineEmpBottom.Visible := True;
	end
	else
	begin
		ppLineEmpBottom.Visible := False;
	end;
end;

// <2008-02-28>
//**********************************************************************
//      Process     : 最終レコード判定
//      Name        : H.Takaishi (TAKUMI)
//      Date        : 2008/02/28
//      Parameter   :
//      Return      : True	: 最終レコード
//      History     : 9999/99/99    X.Name
//                      XXXXXXXXXXXXXXX
//**********************************************************************
function THAP000056PPrnF.fnIsEndRecord(DataSet: TDataSet): Boolean;
begin
	Result := (DataSet.RecNo = DataSet.RecordCount);
end;

// <2008-02-28>
//**********************************************************************
//      Process     : ページ下端判定
//      Name        : H.Takaishi (TAKUMI)
//      Date        : 2008/02/28
//      Parameter   :
//      Return      : True	: ページ下端
//		Comment		: 必ずDetailBandのBeforeGenerateで使用すること
//      History     : 9999/99/99    X.Name
//                      XXXXXXXXXXXXXXX
//**********************************************************************
function THAP000056PPrnF.fnIsPageBottom(ppDetail: TppDetailBand): Boolean;
begin
	with ppDetail do
	begin
		Result := (PageBottom > (CurrentPosition + Height)) and
				  (PageBottom < (CurrentPosition + Height*2))
	end;
end;

// <2010-03-18>
//************************************************************************
//      Component   : ppReport1
//      Event       : BeforePrint
//      Name        : H.Takaishi (TakumiCo.)
//      Date        : 2010/03/18
//      Parameter   :
//      Return      :
//      History     : 9999/99/99    X.Name
//                      XXXXXXXXXXXXXXX
//************************************************************************
procedure THAP000056PPrnF.ppReport1BeforePrint(Sender: TObject);
begin
	pPrnParam^.MPrnSpt.BeforePrint(Sender);
end;

end.
