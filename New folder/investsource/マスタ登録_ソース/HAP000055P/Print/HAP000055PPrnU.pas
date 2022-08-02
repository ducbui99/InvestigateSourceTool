//******************************************************************************
//		System		: MJSFX
//		Program		: 単身赴任者一覧表
//		ProgramID	: HAP000055PPrn
//		Name		: H.Itahana (BUNTECHNO)
//		Create		: 2005/07/19 (TUE)
//		Comment		:
//		History		: 2005/10/31 H.Itahana(Buntechno)
//					:・Application対応
//					: 2005/12/09 T.Abe(Buntechno)
//					:・戸籍名出力ビュー対応
//					: 2005/12/27 H.Itahana(Buntechno)
//					:・本日変更社員印刷対応　						<2005-12-27>
//					: 2006/04/03 T.ABE (BUNTECHNO)
//					:・フリーコード編集対応							<060403>
//					:2006/04/05 N.Nakamura (TS2)
//					:・戸籍名フリガナ順対応　						<060405>
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
//					:2021/03/17 K.Shirai (TakumiCo.)
//					:・郵便番号の枝番が“0000”の場合に出力されない件の修正	<2021-03-17>
//******************************************************************************
unit HAP000055PPrnU;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  Db, dxmdaset, ppDB, ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppComm, ppRelatv, ppProd, ppReport,FireDAC.Comp.Client,
  MjsDBModuleU,MJSQuery,HapPrnDlgSpU,MjsPrnSupportU, ppModule,
  HapMsgu,MjsPreviewIFU,MjsPrnDlgU,MjsDateCtrl,MjsStrCtrl, ppDesignLayer,
  ppParameter;

const
	{$I HapPrnConst.inc}

type
	{$I HapPrnType.inc}
	{$i ActionInterface.inc}

  THAP000055PPrnF = class(TForm)
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
	ppLine20: TppLine;
	ppLine21: TppLine;
	ppLine23: TppLine;
	ppLine24: TppLine;
	ppLine22: TppLine;
	ppLine10: TppLine;
	Label_Kbn: TppLabel;
	ppLDeptNo: TppLabel;
	ppLDeptName: TppLabel;
	ppGroup2: TppGroup;
	ppGroupHeaderBand2: TppGroupHeaderBand;
	ppGroupFooterBand2: TppGroupFooterBand;
	DMemPrintEmpNCd: TStringField;
	DMemPrintLicenseKubunName: TStringField;
	DMemPrintLicenseNo: TStringField;
	ppLabel3: TppLabel;
	ppLabel5: TppLabel;
	ppLine11: TppLine;
	ppLine12: TppLine;
	ppLine13: TppLine;
	ppLabel6: TppLabel;
	ppDBText4: TppDBText;
	ppDBText6: TppDBText;
	ppLine16: TppLine;
	ppLine17: TppLine;
	ppLine15: TppLine;
	ppDBText8: TppDBText;
	DMemPrintLicenseDate: TStringField;
	DMemPrintLicenseNameName: TStringField;
	DMemPrintLicenseName: TIntegerField;
	DMemPrintTnaPhone: TStringField;
	DMemPrintDeptName: TStringField;
    DMemPrintDeptNCd: TFloatField;

	procedure FormCreate(Sender:TObject);
	constructor CreateForm(	pRec,pParam:Pointer);
	procedure FormDestroy(Sender: TObject);
	procedure ppColumnHeaderBand1BeforePrint(Sender: TObject);
	procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);

  private
	{ Private 宣言 }
	pAppRec			: ^TMjsAppRecord;											//MJSAppRecordﾎﾟｲﾝﾀ
	MDBModule		: TMDataModuleF;											//DBﾓｼﾞｭｰﾙ
	ddCopDB			: TFDConnection;												//会社DB
	mqMA			: TMQuery;													//会社ｸｴﾘ
	pPrnParam		: ^THapPrnParam;											//印刷情報
	iEmpAttribute	: Integer ;
	iEmpDigit		: Integer ;
	iDeptAttribute	: Integer ;
	iDeptDigit		: Integer ;
	iRekiKbn		: integer;

	procedure fnSetFileOut(CmnInfo:TMjsPrnSupport);

	function fnGetDeptName(DeptNCd : int64):string;
	procedure DoPrint;

	function fnGetKMName(iItemNo: Integer): String;

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

{$R *.DFM}

{ TNSP100058PrintF }

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
	pForm	: ^THAP000055PPrnF;
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
				pForm^ := THAP000055PPrnF.CreateForm( pRec,pParam );
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
			THAP000055PPrnF(pForm^).DoPrint;
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
procedure THAP000055PPrnF.FormCreate(Sender: TObject);
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
constructor THAP000055PPrnF.CreateForm(pRec,pParam: Pointer);
var
	iCnt		:	Integer;
	POwnerForm	: ^TControl;													//2005-10-31
begin

	pAppRec	:= pRec;															//MjsAppRecord
	pPrnParam :=pParam;

//2005-10-31
	POwnerForm := pAppRec^.m_pChildForm;   										//  オーナーフォームを取得
																				//会社ＤＢオープン
	MDBModule:=TMDataModuleF(pAppRec^.m_pDBModule^);
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
			SQL.Add('SELECT CalendarKbn FROM HAPM3');

			if not Open then Abort;
			if Eof then Abort;

			iRekiKbn		:= GetFld('CalendarKbn').AsInteger ;

			Close;
		end;
	except
		mqMA.Free;
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
//		Name		: Yoshitaka Kondo(BUNTECHNO)
//		Date		: 2002/02/18
//		History		:03/11/20(T.Aoki)
//					:社員ｺｰﾄﾞ10桁不具合修正
//					:04/08/04(T.Aoki)
//					:・在職/支払形態の指定に対応
//					:・"所属なし"が名称に出力されているのを修正
//					:05/12/09	T.Abe(BUNTECHNO)
//					:・戸籍名出力ビュー対応
//**********************************************************************
procedure THAP000055PPrnF.DoPrint;
var
	mqPrn	: TMQuery;
	i		: integer;
	bData	: Boolean;
	DMQuery2: TMQuery;

	sName	: String;
begin

	//フリーコード編集対応 <060403>
	if iEmpAttribute = 2 then
		ppDBText1.Alignment	:= taLeftJustify
	else
		ppDBText1.Alignment	:= taRightJustify;

	if iDeptAttribute = 2 then
		ppLDeptNo.Alignment	:= taLeftJustify
	else
		ppLDeptNo.Alignment	:= taRightJustify;


	if (pPrnParam^.HapPrnSpt.bPageBreak)
		and ((pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_SYOZOKU)
		or (pPrnParam^.HapPrnSpt.iOrder=HAPPRN_ODR_TAIKEI)) then		//改頁[あり]
		ppReport1.Groups[0].NewPage := pPrnParam^.HapPrnSpt.bPageBreak
	else
		ppReport1.Groups[0].NewPage := False;

	bData := FALSE;
	try
		// ヘッダー名称セット
		Label_Name.Caption	:= fnGetKMName(147800);								// 単身赴任区分

		DMQuery2 := TMQuery.Create(Self);										//MQueryの構築
		if Assigned(DMQuery2) <> True then
		begin
			Exit;
		end;
		MDBModule.SetDBInfoTOQuery(ddCopDB,DMQuery2);							//DBとの接続

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

                    // 戸籍名出力ビュー対応
					Add(',MS.TrueNameU');

					Add(',SYJ.TanKubun');
					Add(',SYJ.TanYuubinNo1');
					Add(',SYJ.TanYuubinNo2');
					Add(',SYJ.TanAddress1');
					Add(',SYJ.TanAddress2');
					Add(',SYJ.TanPhone');
//					Add(',SC.DeptNCd');

					Add(',ISNULL('	);				//所属内部No
					Add(' (SELECT'	);
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

					Add(',ISNULL(');				//所属No
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

					Add(',(SELECT');				//所属名称
					Add('	Simplename');
					Add('  FROM');
					Add('	MV_HAP_HAPCHG');
					Add('  WHERE');
					Add('	MasterKbn=41');
					Add('	AND');
					Add('	AddPos=0');
					Add('	AND');
					Add('	EmpNCode=SC.NCode)');
					Add(' AS');
					Add(' Ryaku');

					Add(',ISNULL(');			//体系順
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
					Add(' HAPSC AS SC'	);
					Add(' INNER JOIN');
					Add(' HAPSYJ AS SYJ');
					Add(' ON');
					Add(' SYJ.EmpNCode=SC.NCode');
					Add(' AND');
					Add(' SYJ.CorpNCode=SC.CorpNCode');
					Add(' AND');
					Add(' SYJ.TanKubun > 0');
					Add(' INNER JOIN');

					// 戸籍名出力ビュー対応
					//Add(' MOS_OFFICE_STAFF AS MS');
					Add(' MV_HAP_CMNMOS AS MS');
					Add(' ON');
					Add(' MS.NCode=SC.NCode');

					Add('WHERE'		);
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
					Open(TRUE);
					if(IsEmpty)then
					begin
// <2006-09-07> ----- S
//						MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjError,mjdefOK);
						MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjWarning,mjdefOK);
// <2006-09-07> ----- E
						Exit;
					end;

					DMemPrint.Close;
					DMemPrint.Open;
					while not Eof do
					begin
						bData := TRUE;

						DMemPrint.Append;
						//社員ｺｰﾄﾞ
						DMemPrint.FieldByName('EmpNo').AsString :=
									HapCodeAttribute2(GetFld('GCode').AsString,iEmpDigit,iEmpAttribute);
//									Copy(GetFld('GCode').AsString,1+(10-iEmpDigit),iEmpDigit);

						DMemPrint.FieldByName('EmpNCd').AsString :=
									HapCodeAttribute(inttostr(GetFld('NCode').AsInteger),iEmpDigit,iEmpAttribute<>1);

						//社員名（戸籍名出力ビュー対応）
						if pPrnParam^.HapPrnSpt.iNameType = 1 then
							sName	:= GetFld('TrueNameU').AsString
						else
							sName	:= GetFld('Name').AsString;
						DMemPrint.FieldByName('EmpName').AsString := sName;

						// 所属名
						DMemPrint.FieldByName('DeptName').AsString := GetFld('Ryaku').AsString;

						//所属ｺｰﾄﾞ
						if (Trim(GetFld('DeptNCd').AsString) <> '0') and
							(Trim(GetFld('DeptNCd').AsString) <> '' ) then
						begin
							DMemPrint.FieldByName('DeptNCd').AsFloat := GetFld('DeptNCd').AsFloat;
							DMemPrint.FieldByName('DeptNo').AsString :=
									HapCodeAttribute2(GetFld('DeptNo').AsString,iDeptDigit,iDeptAttribute);
							//		HapCodeAttribute(GetFld('DeptNo').AsString,iDeptDigit,iDeptAttribute<>1);
						end;

						DMemPrint.FieldByName('TanKubun').AsInteger := GetFld('TanKubun').AsInteger;

						with DMQuery2 do
						begin
							Close;
							SQL.Clear;
							SQL.Add('SELECT '		);
							SQL.Add(	'KubunName'	);
							SQL.Add(' FROM '		);
							SQL.Add(	'HAPMN'		);
							SQL.Add('WHERE ItemNo = 147800'	);
							SQL.Add(	'AND KubunNo = :KubunNo');
							SetFld('KubunNo').AsInteger := mqPrn.GetFld('TanKubun').AsInteger;
							Open(True);
							if not Eof then
							begin
								DMemPrint.FieldByName('TanKubunName').AsString := GetFld('KubunName').AsString;
							end;
						end;
{
						if GetFld('TanYuubinNo').AsString <> '' then
						begin
							DMemPrint.FieldByName('TanYuubinNo').AsString
														:= copy(GetFld('TanYuubinNo').AsString,1,3) + '-'
														 + copy(GetFld('TanYuubinNo').AsString,4,4);
						end;
}
//<2021-03-17> ----- S    and→orに変更し、Nullの判定を削除
						if ((GetFld('TanYuubinNo1').AsInteger <> 0)or(GetFld('TanYuubinNo2').AsInteger <> 0)) then
//<2021-03-17> ----- E
						begin
						    DMemPrint.FieldByName('TanYuubinNo').AsString
										:=	MjsEditNum(GetFld('TanYuubinNo1').AsInteger,'0000',3)
										+	'-'
										+	MjsEditNum(GetFld('TanYuubinNo2').AsInteger,'0000',4);
						end;

						DMemPrint.FieldByName('TanAddress1'	).AsString := GetFld('TanAddress1').AsString;
						DMemPrint.FieldByName('TanAddress2'	).AsString := GetFld('TanAddress2').AsString;
						DMemPrint.FieldByName('TanPhone'	).AsString := GetFld('TanPhone').AsString;

						DMemPrint.Edit;
						DMemPrint.Post;

						next;
					end;

					if not bData then
					begin
						// 単身赴任区分なし資格・手当なし
// <2006-09-07> ----- S
//						MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjError,mjdefOK);
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

				except
					raise Exception.Create('印刷ﾃﾞｰﾀ取得失敗');
				end;
			end;
		finally
			mqPrn.Free;
			DMQuery2.Close;
			DMQuery2.Free;
		end;
	except
		raise Exception.Create('印刷用ｸｴﾘ 生成失敗');
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
procedure THAP000055PPrnF.FormDestroy(Sender: TObject);
begin
	mqMA.Free;
	MDBModule.CopDBClose(ddCopDB);
end;

procedure THAP000055PPrnF.ppColumnHeaderBand1BeforePrint(Sender: TObject);
begin
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
procedure THAP000055PPrnF.fnSetFileOut(CmnInfo:TMjsPrnSupport);
var
	sTitle		: TStringList;
	sMemFld		: TStringList;
	rcMsg		: TMjsMsgRec;
	i	:	Integer;
	s	:	String;
begin
	sTitle	:= TStringList.Create;		//ファイル出力用リスト(タイトル)作成
	sMemFld	:= TStringList.Create;		//ファイル
	sTitle.Add('社員No'	);
	sTitle.Add('氏名'	);
	sTitle.Add('所属'	);
//	sTitle.Add('区分'	);
	sTitle.Add(fnGetKMName(147800));											// 単身赴任区分
	sTitle.Add('郵便番号'	);
	sTitle.Add('住所上段');
	sTitle.Add('住所下段');
	sTitle.Add('電話番号');

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
procedure THAP000055PPrnF.ppHeaderBand1BeforePrint(Sender: TObject);
begin
	ppLDeptNo.Caption :=
		HapCodeAttribute2(DMemPrint.FieldByName('DeptNo').AsString,iDeptDigit,iDeptAttribute);
	//	HapCodeAttribute(DMemPrint.FieldByName('DeptNo').AsString,iDeptDigit,iDeptAttribute<>1);

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
function THAP000055PPrnF.fnGetDeptName(DeptNCd: Int64): string;
var
	DMQuery : TMQuery;
	rcMsg	: TMjsMsgRec;
begin
	result:= '';

	// <2007-05-07>
	if DeptNCd = 0 then
	begin
		Result := '(所属なし)';
		exit;
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
				SQL.Add('SELECT LongName,SimpleName FROM MV_HAP_HAPCHG');
				SQL.Add('WHERE DeptNCode=:hDeptNCd'			);
				SQL.Add('AND MasterKbn=41 AND AddPos=0');

				ParamByName('hDeptNCd').AsFloat := DeptNCd;

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


//***********************************************************************
//	Proccess	: 項目名称を取得
//	Name		: Y.Kondo(BUNTECHNO)
//	Date		: 2002/02/20
//	Paremeter	:
//	Return		: Name : 項目名称 ;取得失敗:NULL
//	History		: 2099/99/99 X.Xxxxx
//				: @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//***********************************************************************
function THAP000055PPrnF.fnGetKMName(iItemNo: Integer): String;
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
procedure THAP000055PPrnF.ppReport1BeforePrint(Sender: TObject);
begin
	pPrnParam^.MPrnSpt.BeforePrint(Sender);
end;

end.
