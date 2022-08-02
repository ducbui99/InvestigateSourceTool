//******************************************************************************
//		System		: MJSFX
//		Program		: 個人別前職歴一覧表
//		ProgramID	: HAP000053PPrn
//		Name		: H.Itahana (BUNTECHNO)
//		Create		: 2005/07/21
//		Comment		:
//		History		: 2005/10/31
//					:・Application対応
//					: 2005/12/09	T.Abe(BUNTECHNO)
//					:・戸籍名出力ビュー対応
//					: 2005/12/21	H.Itahana(BUNTECHNO)
//					:・本日変更絞込み対応　<2005-12-21>
//					: 2006/04/03 T.ABE (BUNTECHNO)
//					:・フリーコード編集対応	<060401>
//					:2006/04/05 N.Nakamura (TS2)
//					:・戸籍名フリガナ順対応　<060405>
//					:2006/08/25 H.Takaishi (BUNTECHNO)
//					:・部門権限対応			<2006-08-25>
//					:2006/08/25 H.Takaishi (BUNTECHNO)
//					:・所属改頁時の所属名出力を簡易名称に修正	<2006-08-25_5>
//					:2006/09/07 H.Takaishi (BUNTECHNO)
//					:・印刷データなしの時[エラー]→[警告]	<2006-09-07>
//					:2007/05/02 H.Takaishi (BUNTECHNO)
//					:・部門権限対応（未所属社員は常に出力対象）		<2007-05-02>
//					:2007/05/07 H.Takaishi (BUNTECHNO)
//					:・所属改頁時のヘッダ部で未所属は「(所属なし)」	<2007-05-07>
//					:2008/06/09 H.Takaishi (TakumiCo.)
//					:・印刷履歴対応（MjsPreview経由で印刷処理実行）	<2008-06-09>
//******************************************************************************
unit HAP000053PPrnU;

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

  THAP000053PPrnF = class(TForm)
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
	ppLine19: TppLine;
	ppLine10: TppLine;
	Label_Kbn: TppLabel;
	DMemPrintiLine: TIntegerField;
	ppLDeptNo: TppLabel;
	ppLDeptName: TppLabel;
	ppGroup2: TppGroup;
	ppGroupHeaderBand2: TppGroupHeaderBand;
	ppGroupFooterBand2: TppGroupFooterBand;
	DMemPrintEmpNCd: TStringField;
	DMemPrintLicenseKubunName: TStringField;
	DMemPrintLicenseNo: TStringField;
	DMemPrintLicensePayName: TStringField;
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
	ppLine8: TppLine;
	ppLabel7: TppLabel;
	DMemPrintLastDate2: TStringField;
	DMemPrintDeptName: TStringField;
    DMemPrintNo: TStringField;
    LblDate: TppLabel;
    DMemPrintDeptNCd: TFloatField;

	procedure FormCreate(Sender:TObject);
	constructor CreateForm(	pRec,pParam:Pointer);
	procedure FormDestroy(Sender: TObject);
	procedure ppDetailBand1BeforePrint(Sender: TObject);
	procedure ppColumnHeaderBand1BeforePrint(Sender: TObject);
	procedure ppHeaderBand1BeforePrint(Sender: TObject);
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
	iRekiKbn	: integer;
	sPrnEmpNo	: String;
	iIndex		: Integer;
	gsDeptNo	: String;

	procedure fnSetFileOut(CmnInfo:TMjsPrnSupport);

	function fnGetData(	sEmpNo:string;
						sEmpName:String;
						iDeptNCd:Int64;
						iEmpNCd:Int64;
						iDeptNo,
						sDeptName:String):Boolean;

	function fnGetDeptName(DeptNCd : Int64):string;
	procedure DoPrint;

	function fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
	procedure	fnLabelItemSet;

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
//		Parameter	:pPar	:pointer
//		Return		:ACTID_RET_OK	:
//					:ACTID_RET_NG	:不正
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function AppEntry(pPar:pointer):integer;
var
	pForm	: ^THAP000053PPrnF;
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
				pForm^ := THAP000053PPrnF.CreateForm( pRec,pParam );
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
			THAP000053PPrnF(pForm^).DoPrint;
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
procedure THAP000053PPrnF.FormCreate(Sender: TObject);
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
constructor THAP000053PPrnF.CreateForm(pRec,pParam: Pointer);
var
	iCnt		:	Integer;
	POwnerForm	: ^TControl;													//2005-10-31
begin

	pAppRec	:= pRec;			//MjsAppRecord
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
//		History		:03/11/20(T.Aoki)
//					:社員ｺｰﾄﾞ10桁不具合修正
//					:04/08/04(T.Aoki)
//					:在職/支払形態の指定に対応
//					:05/12/09	T.Abe(BUNTECHNO)
//					:戸籍名出力ビュー対応
//**********************************************************************
procedure THAP000053PPrnF.DoPrint;
var
	mqPrn	: TMQuery;
	i		: integer;
	bData	: Boolean;
    sName	: String;
begin

	//フリーコード編集対応<060403>
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

//					Add(',SC.DeptNCd');

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

					Add(',(SELECT');				//所属名称
					Add('	Simplename');
					Add('  FROM');
					Add('	MV_HAP_HAPCHG');
					Add('  WHERE');
					Add('	MasterKbn=41');
					Add('	AND'		);
					Add('	AddPos=0'	);
					Add('	AND');
					Add('	EmpNCode=SC.NCode)');
					Add(' AS');
					Add(' Ryaku');

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

                    // 戸籍名出力ビュー対応
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
//2005-12-21 ST
 					// 本日変更社員絞込み
					if pPrnParam^.HapPrnSpt.bTodayOnly then
					begin
						Add('And DATE(SC.UpdDateTM) = :RDATE');
						SetFld('RDATE').AsDateTime := pPrnParam^.HapPrnSpt.dToday;
					end;
//2005-12-21 ED
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

					iIndex:=0;
					DMemPrint.Close;
					DMemPrint.Open;

					sPrnEmpNo:='';
                    gsDeptNo := GetFld('DeptNCd').AsString;

					while not eof do
					begin
                    	// 戸籍名出力対応
                        if pPrnParam^.HapPrnSpt.iNameType = 1 then
                        	sName	:= GetFld('TrueNameU').AsString
                        else
                        	sName	:= GetFld('Name').AsString;

						if fnGetData(	GetFld('GCode').AsString,
										sName,
										Trunc(GetFld('DeptNCd').AsFloat),
										Trunc(GetFld('NCode').AsFloat),
										GetFld('DeptNo').AsString,
										GetFld('Ryaku').AsString) then
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
// <2006-09-07> ----- S
//						MjsMessageBox(Self,'印刷ﾃﾞｰﾀが存在しません。',mjError,mjdefOK);
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
//		Parameter	:
//		Return		:
//		History		:03/11/20(T.Aoki)
//					:・社員ｺｰﾄﾞ10桁不具合修正
//					:・西暦編集をyyyy/m/d->yyyy/mm/ddに変更
//**********************************************************************
function THAP000053PPrnF.fnGetData(	sEmpNo:string;
									sEmpName: String;
									iDeptNCd: Int64;
									iEmpNCd: Int64;
									iDeptNo,
									sDeptName: string):Boolean;
const
	DEF_DATE = '1890/12/30';

	_ADFORMAT	='yyyy/mm/dd';
	_REPOLD		='/0';
	_REPNEW		='/0';
//S4/S1(Sはｽﾍﾟｰｽ)にしたければ↓
//	_REPNEW		='/ ';
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
				SQL.Add('Select '			);
				SQL.Add(	'LCorpName,'	);									// （前職）会社名称
				SQL.Add(	'LJobName,'		);									// （前職）職種
				SQL.Add(	'LPostName,'	);									// （前職）役職
//				SQL.Add(	'LNyuusha,'		);									// （前職）入社年月日
//				SQL.Add(	'LRetire,'		);									// （前職）退社年月日
				SQL.Add(' IsNull(LNyuusha,ConVert(DateTime,'+''''+DEF_DATE+''''+')) LastDate1,');
				SQL.Add(' IsNull(LRetire,ConVert(DateTime,'+''''+DEF_DATE+''''+')) LastDate2,');
				SQL.Add(	'LRemarks'		);									// （前職）備考
				SQL.Add('FROM HAPSCR'		);
				SQL.Add('WHERE EmpNCode ='+ inttostr(iEmpNCd));
				SQL.Add('AND CorpNCode=0'	);
				SQL.Add(' ORDER BY LastDate2 DESC ,LastDate1 DESC,CarNCode');
				Open(True);

				while not Eof do
				begin
					Result := TRUE;
					DMemPrint.Append;
					Inc(iIndex);
					//社員ｺｰﾄﾞ
					DMemPrint.FieldByName('EmpNo').AsString :=
								HapCodeAttribute2(sEmpNo,iEmpDigit,iEmpAttribute);
					DMemPrint.FieldByName('EmpNCd').AsString :=
								HapCodeAttribute(inttostr(iEmpNCd),iEmpDigit,iEmpAttribute<>1);
					//社員名
					DMemPrint.FieldByName('EmpName').AsString := sEmpName;

					// 所属名（簡略）
					DMemPrint.FieldByName('DeptName').AsString := sDeptName;

					//所属ｺｰﾄﾞ
					if (iDeptNCd <> 0) then
					begin
						DMemPrint.FieldByName('DeptNCd').AsFloat := iDeptNCd;
						DMemPrint.FieldByName('DeptNo').AsString :=
								HapCodeAttribute2(iDeptNo,iDeptDigit,iDeptAttribute);

					end;

					DMemPrint.FieldByName('iLine').AsInteger:=0;

					//前会社名
					DMemPrint.FieldByName('LastCo'	).AsString := DMQuery.GetFld('LCorpName').AsString;

					//前職種
					DMemPrint.FieldByName('LastJob'	).AsString := DMQuery.GetFld('LJobName').AsString;

					//前役職
					DMemPrint.FieldByName('LastPost').AsString := DMQuery.GetFld('LPostName').AsString;

					//前入社年月日
					DMemPrint.FieldByName('LastDate1').AsString := '';

					if (GetFld('LastDate1').IsNull=False)
					and(GetFld('LastDate1').AsDateTime > 0) then
					begin
						if iRekiKbn=1 then
							DMemPrint.FieldByName ('LastDate1').AsString :=
												Formatdatetime('gg ',GetFld('LastDate1').AsDatetime)+
												fnGetPrintYMD(GetFld('LastDate1').AsDatetime,1)+'/'+
												fnGetPrintYMD(GetFld('LastDate1').AsDatetime,2)+'/'+
												fnGetPrintYMD(GetFld('LastDate1').AsDatetime,3)
						else
							DMemPrint.FieldByName ('LastDate1').AsString
												:= StringReplace(
														FormatDateTime(_ADFORMAT,GetFld('LastDate1').AsDateTime),
														_REPOLD,
														_REPNEW,
														[rfReplaceAll]
													);
					end;

					//前退職年月日
					DMemPrint.FieldByName('LastDate2').AsString := '';

					if (GetFld('LastDate2').IsNull=False)
					and(GetFld('LastDate2').AsDateTime > 0) then
					begin
						if iRekiKbn=1 then
							DMemPrint.FieldByName ('LastDate2').AsString :=
												Formatdatetime('gg ',GetFld('LastDate2').AsDatetime)+
												fnGetPrintYMD(GetFld('LastDate2').AsDatetime,1)+'/'+
												fnGetPrintYMD(GetFld('LastDate2').AsDatetime,2)+'/'+
												fnGetPrintYMD(GetFld('LastDate2').AsDatetime,3)
						else
							DMemPrint.FieldByName ('LastDate2').AsString
												:= StringReplace(
														FormatDateTime(_ADFORMAT,GetFld('LastDate2').AsDateTime),
														_REPOLD,
														_REPNEW,
														[rfReplaceAll]
													);
					end;

					//備考
					DMemPrint.FieldByName('LastRemarks').AsString := DMQuery.GetFld('LRemarks').AsString;

					DMemPrint.FieldByName('No').AsInteger := iIndex; // 0Baseなので+1
					DMemPrint.Post;
					Next;		//次ﾚｺｰﾄﾞ
				end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'前職情報'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
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
procedure THAP000053PPrnF.FormDestroy(Sender: TObject);
begin
	mqMA.Free;
	MDBModule.CopDBClose(ddCopDB);
end;

//**********************************************************************
//		Process		:詳細印刷
//		Parameter	:
//		Return		:
//		History		:03/11/20(T.Aoki)
//					:社員ｺｰﾄﾞ10桁不具合修正
//**********************************************************************
procedure THAP000053PPrnF.ppDetailBand1BeforePrint(Sender: TObject);
begin

	if sPrnEmpNo=DMemPrint.FieldByName('EmpNo').AsString then
	begin
		ppDBText1.Visible:=False;
		ppDBText2.Visible:=False;
	end
	else
	begin
		ppDBText1.Visible:=True;
		ppDBText2.Visible:=True;
		sPrnEmpNo:=DMemPrint.FieldByName('EmpNo').AsString;
	end;

	if DMemPrint.FieldByName('iLine').AsInteger=1 then
	begin
		ppLine18.Visible:=True;
	end
	else
	begin
		ppLine18.Visible:=False;
	end;

	if DMemPrint.FieldByName('No').AsInteger mod 44 = 1 then
	begin
		ppDBText1.Visible:=True;
		ppDBText2.Visible:=True;
	end;

	if DMemPrint.FieldByName('No').AsInteger mod 44 = 0 then
	begin
		ppLine18.Visible:=True;
	end;
end;

procedure THAP000053PPrnF.ppColumnHeaderBand1BeforePrint(Sender: TObject);
begin
end;

//**********************************************************************
//*		Proccess	:	ファイル出力に必要なTitle･Filed設定
//*		Name		:	Yoshitaka Kondo (BUNTECHNO)
//*		Parameter	:	sTitle	:	CreateされたTStringList(ﾀｲﾄﾙ用)
//*						sMemFld	:	CreateされたTStringList(ﾌｨｰﾙﾄﾞ用)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure THAP000053PPrnF.fnSetFileOut(CmnInfo:TMjsPrnSupport);
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
	sTitle.Add('会社名'	);
	sTitle.Add('職種'	);
	sTitle.Add('役職'	);
	sTitle.Add('入社年月日');
	sTitle.Add('退社年月日');
	sTitle.Add('備考');

	With DMemPrint.FieldDefs do
	begin
		for i := 0 to Count-7 do
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
//		Parameter	:
//		Return		:
//		History		:2002/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000053PPrnF.ppHeaderBand1BeforePrint(Sender: TObject);
begin
	ppLDeptNo.Caption :=
		HapCodeAttribute2(DMemPrint.FieldByName('DeptNo').AsString,iDeptDigit,iDeptAttribute);

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
function THAP000053PPrnF.fnGetDeptName(DeptNCd: Int64): string;
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
// <2006-08-25_5> ----- S
//				SQL.Add('SELECT LongName FROM MV_HAP_HAPCHG' );
				SQL.Add('SELECT SimpleName FROM MV_HAP_HAPCHG' );
// <2006-08-25_5> ----- E
				SQL.Add('WHERE DeptNCode=:hDeptNCd');
				SQL.Add('AND MasterKbn = 41 AND AddPos=0');

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


//**********************************************************************
//* Proccess	: 日付編集
//* Name		: kos
//* Date		: 2001/06/22
//* Parameter	: SrcDate 日付
//* Return		: １：年 ２：月 ３：日
//**********************************************************************
function THAP000053PPrnF.fnGetPrintYMD(SrcDate: TDateTime;iKbn: Integer): String;
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


//******************************************************************************
//	Component		:	ppReport1
//	Event			:	BeforePrint
//	Name			:	Y.Kondo(BUNTECHNO)
//******************************************************************************
procedure THAP000053PPrnF.ppReport1BeforePrint(Sender: TObject);
begin
	pPrnParam^.MPrnSpt.BeforePrint(Sender);
end;

//**************************************************************************
//	Proccess  	:  	「XX XX年XX月XX日 現在」の印字を行う
//	Parameter  	:
//	Retrun	  	:
//	History	　	:	なし
//**************************************************************************
procedure THAP000053PPrnF.fnLabelItemSet;
begin
//
end;

end.
