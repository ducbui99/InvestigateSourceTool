//**********************************************************************
//		System		:MJSFX
//		ID			:HAP000059PPrn
//		Comment		:社員ﾒﾓ項目印刷
//		Create By	:H.Itahana(Buntechno)
//		Create Date	:2005/07/19
//					:
//		Remake Date	:2005/10/31
//					:・Application対応
//					:2005/12/09	T.Abe(BUNTECHNO)
//					:・戸籍名出力ビュー対応
//					:2005/12/27 H.Itahana(Buntechno)
//					:・本日変更社員印刷対応　						<2005-12-27>
//					:2006/04/03	T.ABE (BUNTECHNO)
//					:・フリーコード編集対応 						<060403>
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
//					:2007/08/28 T.ABE (TAKUMI)						<070828>
//					:・両面印刷、上綴じを正しく出力する対応
//					:・行／頁は53行
//					:2008/06/09 H.Takaishi (TakumiCo.)
//					:・印刷履歴対応（MjsPreview経由で印刷処理実行）	<2008-06-09>
//					:2016/06/15 M.Tamaki
//					:・「社員コード」→「社員No」に変更				<2016-06-15>
//----------------------------------------------------------------------
//注）
//	ラインが動的に引かれているので、単位をミリから変更するとずれます。
//	各ラインのLeftは、横線および、データフィールドに依存している。
//
//		ppDBEmpName	:	氏名フィールド
//		ppDBMemoT01	:	項目名フィールド
//		ppDBMemo01	:	内容フィールド
//
//		arrHVLine	:	ppLineHV01～ppLineHV05 (ヘッダー部 縦線)
//		arrDVLine	:	ppLineDV01～ppLineDV05 (明細部 縦線)
//
//		ppLineHH01	:	ヘッダー部横線(上)
//		ppLineHH02	:	ヘッダー部横線(下)
//
//		ppLineDH01	:	明細部横線(社員コード・氏名欄の下線)
//		ppLineDH02	:	明細部横線(項目名・内容の下線)
//
//**********************************************************************
unit HAP000059PPrintU;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  Db, dxmdaset, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB,
  ppDBPipe, ppBands, MjsPrnSupportU,MjsPreviewIFU,MjsPrnDlgU,HapPrnDlgSpU,
  MjsDBModuleU,FireDAC.Comp.Client, ppPrnabl, ppCtrls, ppVar, ppStrtch, ppMemo,
  MjsQuery, ppModule,HapMsgU,HAPLibU;
const
  {$I HapPrnConst.inc}
type
  {$I HapPrnType.inc}
  {$I ActionInterface.inc}
  THAP000059PPrintF = class(TForm)
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    MdPrn: TdxMemData;
    DsPrn: TDataSource;
    pphsvDateSf: TppSystemVariable;
    ppfsvPageSf: TppSystemVariable;
    pphlCopNoSf: TppLabel;
    pphlCopNameSf: TppLabel;
    LppAccOfficeSf: TppLabel;
    ppLTitle: TppLabel;
    ppLineHH01: TppLine;
    ppDBEmpName: TppDBText;
    ppDBEmpNo: TppDBText;
    ppDBMemoT01: TppDBText;
    ppDBMemo01: TppDBText;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLineHH02: TppLine;
    ppLineDH01: TppLine;
    ppLineDH02: TppLine;
    ppLine1: TppLine;
    ppLineHV01: TppLine;
    ppLineHV02: TppLine;
    ppLineHV03: TppLine;
    ppLineHV04: TppLine;
    ppLineHV05: TppLine;
    ppLineHV06: TppLine;
    ppLineHV07: TppLine;
    ppLineDV01: TppLine;
    ppLineDV02: TppLine;
    ppLineDV03: TppLine;
    ppLineDV04: TppLine;
    ppLineDV05: TppLine;
    ppLineDV06: TppLine;
    ppLineDV07: TppLine;
    ppLineDH03: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLDeptNo: TppLabel;
    ppLDeptName: TppLabel;
	constructor CreateForm(	pRec,pParam:Pointer);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppReport1BeforePrint(Sender: TObject);
    procedure ppDetailBand1BeforeGenerate(Sender: TObject);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private 宣言 }

	//Menuﾊﾟﾗﾒｰﾀ
	pAppRec:^TMjsAppRecord;
	//DBﾓｼﾞｭｰﾙ
	dbM:TMDataModuleF;
	//会社DB
	ddCopDB:TFDConnection;
	//印刷条件ﾊﾟﾗﾒｰﾀ
	pPrnParam:^THapPrnParam;													//印刷情報
	//印刷用ｸｴﾘ
	mqPrn,mqKM:TMQuery;
	//罫線(縦線)格納
	arrHVLine,arrDVLine:array of TppLine;
	//ﾌｧｲﾙ出力
	slField,slTitle:TStringList;
	//Msg
	rcMsg:TMjsMsgRec;

	iEmpAttribute	:	Integer;
	iEmpDigit		:	Integer;
	iDeptAttribute	:	Integer;
	iDeptDigit		:	Integer;

	//印刷MAIN
	procedure DoPrint;
	//印刷用MemData初期化
	procedure fnMdPrnIni;
	//帳票形式初期化
	procedure fnStyleIni;
	function fnGetDeptName(DeptNCd: Int64): string;
  public
    { Public 宣言 }
  end;

//改行ｺｰﾄﾞ置換
function fnCRLFRep(sSrc:string;sRep:string=''):string;
//AP入口
function AppEntry(pPar:pointer):integer;		//SystemMenu->Self
exports
  AppEntry;
{
var
  NSP000090PrnF: TNSP000090PrnF;
}
implementation
uses
  MjsDispCtrl,MJSCommonU;

{$R *.DFM}

//**********************************************************************
//		AP入り口
//**********************************************************************
function AppEntry(pPar:pointer):integer;
var
	pForm:^THAP000059PPrintF;
	pRec :^TMjsAppRecord;
	pParam:pointer;
	iAction:integer;
begin
	Result	:=ACTID_RET_NG;
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
				pForm^ := THAP000059PPrintF.CreateForm( pRec,pParam );
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
			THAP000059PPrintF(pForm^).DoPrint;
		end;
	end;
	Result	:=ACTID_RET_OK;
end;

{ TNSP000090PrintF }

//**********************************************************************
//		Constructor
//**********************************************************************
constructor THAP000059PPrintF.CreateForm(pRec, pParam: Pointer);
var
	iCnt		:	Integer;
	POwnerForm	: ^TControl;													//2005-10-31
begin
	pAppRec:=pRec;

//2005-10-31
	POwnerForm := pAppRec^.m_pChildForm;										//  オーナーフォームを取得

	with pAppRec^ do
	begin
		dbM:=TMDataModuleF(m_pDBModule^);
		try
			ddCopDB:=dbM.CopDBOpen(1,m_iCorpID);
		except
			raise Exception.Create('会社DBのｵｰﾌﾟﾝに失敗しました');
		end;
	end;

	mqPrn:=TMQuery.Create(Self);
	if not Assigned(mqPrn)then
	begin
		dbM.CopDBClose(ddCopDB);
		raise Exception.Create('印刷用ｸｴﾘの初期化に失敗しました');
	end;
	try
		dbM.SetDBInfoToQuery(ddCopDB,mqPrn);
	except
		mqPrn.Free;
		dbM.CopDBClose(ddCopDB);
		raise Exception.Create('印刷用ｸｴﾘの初期化に失敗しました');
	end;

	mqKM:=TMQuery.Create(Self);
	if not Assigned(mqKM)then
	begin
		mqPrn.Free;
		dbM.CopDBClose(ddCopDB);
		raise Exception.Create('印刷用ｸｴﾘの初期化に失敗しました');
	end;

	try
		dbM.SetDBInfoToQuery(ddCopDB,mqKM);
	except
		mqKM.Free;
		mqPrn.Free;
		dbM.CopDBClose(ddCopDB);
		raise Exception.Create('印刷用ｸｴﾘの初期化に失敗しました');
	end;

	slField:=TStringList.Create;
	if not Assigned(slField) then
	begin
		mqKM.Free;
		mqPrn.Free;
		dbM.CopDBClose(ddCopDB);
		raise Exception.Create('ﾌｧｲﾙ出力の初期処理に失敗しました');
	end;

	slTitle:=TStringList.Create;
	if not Assigned(slTitle) then
	begin
		slField.Free;
		mqKM.Free;
		mqPrn.Free;
		dbM.CopDBClose(ddCopDB);
		raise Exception.Create('ﾌｧｲﾙ出力の初期処理に失敗しました');
	end;

	try
		with mqKM do
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
		end;
	except
		slTitle.Free;
		slField.Free;
		mqKM.Free;
		mqPrn.Free;
		dbM.CopDBClose(ddCopDB);

		raise Exception.Create('会社情報 取得失敗');
	end;

	pPrnParam:=pParam;

//2005-10-31
//	inherited Create(Application);
	inherited Create(POwnerForm^);              // ﾌｫｰﾑCreate
end;

//**********************************************************************
//		Component Event
//**********************************************************************
//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Process		:ﾌｫｰﾑ作成
//		Name		:T.Aoki
//		Date		:04/01/19
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000059PPrintF.FormCreate(Sender: TObject);
begin
	with pPrnParam^.MPrnSpt	 do
	begin
		//Mjs印刷ﾀﾞｲｱﾛｸﾞの指定とｺﾝﾎﾟｰﾈﾝﾄを連結
		ApRB			:=ppReport1;		//帳票
		pPage			:=ppfsvPageSf;		//頁
		pDate			:=pphsvDateSf;		//日付
		pCorpCode		:=pphlCopNoSf;		//会社ｺｰﾄﾞ
		pCorpName		:=pphlCopNameSf;	//会社名
		pAccountOffice	:=LppAccOfficeSf;	//会計事務所名
	end;

	//MemDataﾌｨｰﾙﾄﾞ初期化
	fnMdPrnIni;

	//帳票初期化
	fnStyleIni;

end;

//**********************************************************************
//		Component	:Form
//		Event		:Destroy
//		Process		:ﾌｫｰﾑ破棄
//		Name		:T.Aoki
//		Date		:04/01/19
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000059PPrintF.FormDestroy(Sender: TObject);
begin
	slTitle.Free;
	slField.Free;

	mqKM.Free;
	mqPrn.Free;
	dbM.CopDBClose(ddCopDB);
end;

//**********************************************************************
//		Proceess	:印刷MAIN
//		Name		:T.Aoki
//		Date		:04/01/19
//		Parameter	:
//		Return		:
//		History		:04/01/22(T.Aoki)
//					:・ﾒﾓ項目2以降で使用不可の項目があると
//					:  印刷に失敗する不具合修正
//					:・印刷時に頁に跨る社員が
//					:  ﾌｧｲﾙ出力時にも2重にｺｰﾄﾞ/氏名を出力される不具合
//					:04/08/03(T.Aoki)
//					:在職/支払形態の指定に対応
//					:05/12/09	T.Abe(BUNTECHNO)
//					:戸籍名出力ビュー対応
//**********************************************************************
procedure THAP000059PPrintF.DoPrint;
const
	//<070828>
	//_RECMAX_=54;
	_RECMAX_=53;
var
	i,j,iRec,iOrderNo:integer;
	sSQL,sMemo:string;
	sName	: String;
begin

	//フリーコード編集対応<060403>
	if iEmpAttribute = 2 then
		ppDBEmpNo.Alignment	:= taLeftJustify
	else
		ppDBEmpNo.Alignment	:= taRightJustify;

	if iDeptAttribute = 2 then
		ppLDeptNo.Alignment	:= taLeftJustify
	else
		ppLDeptNo.Alignment	:= taRightJustify;


//項目名(355[01-12]の取得)

	sSQL:=			 'SELECT';
	sSQL:=sSQL+#13#10' ItemNo';
	sSQL:=sSQL+#13#10',ItemName';
	sSQL:=sSQL+#13#10'FROM';
	sSQL:=sSQL+#13#10' HAPKM';
	sSQL:=sSQL+#13#10'WHERE';
	sSQL:=sSQL+#13#10' ItemUse=1';
	sSQL:=sSQL+#13#10' AND';
	sSQL:=sSQL+#13#10' ItemNo>=150001';
	sSQL:=sSQL+#13#10' AND';
	sSQL:=sSQL+#13#10' ItemNo<=150012';
	sSQL:=sSQL+#13#10'ORDER BY';
	sSQL:=sSQL+#13#10' ItemNo';
	with mqKM do
	begin
		Close;
		SQL.Clear;
		SQL.Add(sSQL);
		try
			Open(TRUE);
			if IsEmpty then
			begin
				MjsMessageBox(	Self,
								'印刷ﾃﾞｰﾀが存在しません。',
// <2006-09-07> ----- S
//								mjError,
								mjWarning,
// <2006-09-07> ----- E
								mjdefOK		);
				Exit;
			end;
		except
			raise Exception.Create('項目情報の取得に失敗しました');
		end;
	end;

//社員ﾃﾞｰﾀ取得
	sSQL:=			 'SELECT';

{
	//社員ｺｰﾄﾞ(編集)
	sSQL:=sSQL+#13#10' RIGHT(EmpNo,';
	sSQL:=sSQL+#13#10' (SELECT EmpDigit FROM NSPM3)';
	sSQL:=sSQL+#13#10' )';
	sSQL:=sSQL+#13#10' AS';
	sSQL:=sSQL+#13#10' EEmpNo';
}
	//社員ｺｰﾄﾞ
	sSQL:=sSQL+#13#10' SC.GCode';

	//氏名
	sSQL:=sSQL+#13#10',MS.Name';

	// 戸籍名出力ビュー対応
	sSQL:=sSQL+#13#10',MS.TrueNameU';

	//所属ｺｰﾄﾞ
	sSQL:=sSQL+#13#10' ,(';
	sSQL:=sSQL+#13#10' SELECT';
	sSQL:=sSQL+#13#10'	DeptNCode';
	sSQL:=sSQL+#13#10' FROM';
	sSQL:=sSQL+#13#10'	MV_HAP_HAPCHG';
	sSQL:=sSQL+#13#10' WHERE';
	sSQL:=sSQL+#13#10'	MasterKbn=41';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	AddPos=0';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	DeptNCode>0';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	SC.NCode=empNCode';
	sSQL:=sSQL+#13#10' )';
	sSQL:=sSQL+#13#10' AS';
	sSQL:=sSQL+#13#10' DeptNCd';

	//所属ｺｰﾄﾞ
//	sSQL:=sSQL+#13#10',RIGHT(';
	sSQL:=sSQL+#13#10' ,(';
	sSQL:=sSQL+#13#10' SELECT';
	sSQL:=sSQL+#13#10'	DeptGCode';
	sSQL:=sSQL+#13#10' FROM';
	sSQL:=sSQL+#13#10'	MV_HAP_HAPCHG';
	sSQL:=sSQL+#13#10' WHERE';
	sSQL:=sSQL+#13#10'	MasterKbn=41';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	AddPos=0';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	DeptNCode>0';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	SC.NCode=empNCode';
	sSQL:=sSQL+#13#10' )';
	sSQL:=sSQL+#13#10' AS';
	sSQL:=sSQL+#13#10' DeptNo';

	//簡略名
	sSQL:=sSQL+#13#10',(';
	sSQL:=sSQL+#13#10' SELECT';
	sSQL:=sSQL+#13#10'	SimpleName';
	sSQL:=sSQL+#13#10' FROM';
	sSQL:=sSQL+#13#10'	MV_HAP_HAPCHG';
	sSQL:=sSQL+#13#10' WHERE';
	sSQL:=sSQL+#13#10'	MasterKbn=41';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	AddPos=0';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	DeptNCode>0';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	SC.NCode=empNCode';
	sSQL:=sSQL+#13#10' )';
	sSQL:=sSQL+#13#10' AS';
	sSQL:=sSQL+#13#10' Ryaku';

	//体系順No
	sSQL:=sSQL+#13#10',ISNULL((';
	sSQL:=sSQL+#13#10' SELECT';
	sSQL:=sSQL+#13#10'	OrderNo';
	sSQL:=sSQL+#13#10' FROM';
	sSQL:=sSQL+#13#10'	MV_HAP_HAPCHG';
	sSQL:=sSQL+#13#10' WHERE';
	sSQL:=sSQL+#13#10'	MasterKbn=41';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	AddPos=0';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	DeptNCode>0';
	sSQL:=sSQL+#13#10'	AND';
	sSQL:=sSQL+#13#10'	SC.NCode=empNCode';
	sSQL:=sSQL+#13#10' ),0)';
	sSQL:=sSQL+#13#10' AS';
	sSQL:=sSQL+#13#10' OrderNo';

	//ﾌﾘｶﾞﾅ
	sSQL:=sSQL+#13#10',MS.KanaName';

	//ﾒﾓ内容
	for i:=1 to 12 do
		if mqKM.Locate('ItemNo',1500*100+i,[])then
			sSQL:=sSQL+#13#10+Format(',Memo%2.2u',[i]);

	//在職区分をBIT展開
	sSQL:=sSQL+#13#10',CASE Zaishoku';
	sSQL:=sSQL+#13#10' WHEN 2 THEN';
	sSQL:=sSQL+#13#10+IntToStr(HAP_ZAI_TAISHOKU);
	sSQL:=sSQL+#13#10' WHEN 3 THEN';
	sSQL:=sSQL+#13#10+IntToStr(HAP_ZAI_KYUSHOKU);
	sSQL:=sSQL+#13#10' ELSE';
	sSQL:=sSQL+#13#10+IntToStr(HAP_ZAI_ZAISHOKU);
	sSQL:=sSQL+#13#10' END';
	sSQL:=sSQL+#13#10' AS';
	sSQL:=sSQL+#13#10' ZaishokuBit';

	//支払形態区分をBIT展開
	sSQL:=sSQL+#13#10',CASE Shiharai';
	sSQL:=sSQL+#13#10' WHEN 1 THEN';
	sSQL:=sSQL+#13#10+IntToStr(HAP_SHR_NENSHU);
	sSQL:=sSQL+#13#10' WHEN 3 THEN';
	sSQL:=sSQL+#13#10+IntToStr(HAP_SHR_NIKKYU);
	sSQL:=sSQL+#13#10' WHEN 4 THEN';
	sSQL:=sSQL+#13#10+IntToStr(HAP_SHR_JIKYUU);
	sSQL:=sSQL+#13#10' ELSE';
	sSQL:=sSQL+#13#10+IntToStr(HAP_SHR_GEKKYU);
	sSQL:=sSQL+#13#10' END';
	sSQL:=sSQL+#13#10' AS';
	sSQL:=sSQL+#13#10' ShiharaiBit';

	sSQL:=sSQL+#13#10'FROM';
	sSQL:=sSQL+#13#10' HAPSC AS SC';

	sSQL:=sSQL+#13#10' INNER JOIN';
	sSQL:=sSQL+#13#10' HAPSY AS SY';
	sSQL:=sSQL+#13#10' ON';
	sSQL:=sSQL+#13#10' SC.NCode=SY.EmpNCode';
	sSQL:=sSQL+#13#10' AND';
	sSQL:=sSQL+#13#10' SC.CorpNCode=SY.CorpNCode';

	sSQL:=sSQL+#13#10' INNER JOIN';
	sSQL:=sSQL+#13#10' HAPSYJ AS SYJ';
	sSQL:=sSQL+#13#10' ON';
	sSQL:=sSQL+#13#10' SC.NCode=SYJ.EmpNCode';
	sSQL:=sSQL+#13#10' AND';
	sSQL:=sSQL+#13#10' SC.CorpNCode=SYJ.CorpNCode';

	sSQL:=sSQL+#13#10' INNER JOIN';

	// 戸籍名出力ビュー対応
	//sSQL:=sSQL+#13#10' MOS_OFFICE_STAFF AS MS';
	sSQL:=sSQL+#13#10' MV_HAP_CMNMOS AS MS';
	sSQL:=sSQL+#13#10' ON';
	sSQL:=sSQL+#13#10' SC.NCode=MS.NCode';

	sSQL:=sSQL+#13#10'WHERE';

//2005-08-30
	sSQL:=sSQL+#13#10'SC.SyokuchiKbn=0';
	sSQL:=sSQL+#13#10'AND';

// <2006-08-25> ----- S
	// 部門権限
	// <2007-05-02>
	sSQL:=sSQL+#13#10'(DeptNCd IN (SELECT BmCd FROM MV_MAS_STFBMN WHERE TantoNCD = ';
	sSQL:=sSQL+IntToStr(rcCommonArea(pAppRec^.m_pCommonArea^).TantoNCD) + ')';
	sSQL:=sSQL+#13#10' OR IsNull(DeptNCd, 0) = 0)';
	sSQL:=sSQL+#13#10'AND';
// <2006-08-25> ----- E

	with pPrnParam^.HapPrnSpt do
	begin
		//在職区分のﾌｨﾙﾀ
		sSQL:=sSQL+#13#10' (ZaishokuBit&';
		sSQL:=sSQL+IntToStr(iZaishoku);
		sSQL:=sSQL+#13#10' >0)';
		//支払形態区分のﾌｨﾙﾀ
		sSQL:=sSQL+#13#10' AND';
		sSQL:=sSQL+#13#10' (ShiharaiBit&';
		sSQL:=sSQL+IntToStr(iShiharai);
		sSQL:=sSQL+#13#10' >0)';

		//範囲
		if((iSelect)=HAPPRN_SEL_HANI)then
		begin
			sSQL:=sSQL+#13#10'AND';
			//所属体系
			if((iOrder)=HAPPRN_ODR_TAIKEI)then
			begin
				sSQL:=sSQL+#13#10'OrderNo>=';
				sSQL:=sSQL+IntToStr(OrderNo[0]);
				sSQL:=sSQL+#13#10'AND';
				sSQL:=sSQL+#13#10'OrderNo<=';
				sSQL:=sSQL+IntToStr(OrderNo[1]);
			end
			//社員ｺｰﾄﾞ
			else
			begin
				sSQL:=sSQL+#13#10'GCode>=';
				sSQL:=sSQL+AnsiQuoTedStr(Code[0],'''');
				sSQL:=sSQL+#13#10'AND';
				sSQL:=sSQL+#13#10'GCode<=';
				sSQL:=sSQL+AnsiQuoTedStr(Code[1],'''');
			end;
		end
		//複数
		else if((iSelect)=HAPPRN_SEL_FUKUSU)then
		begin
			sSQL:=sSQL+#13#10'AND';
			//所属体系
			if((iOrder)=HAPPRN_ODR_TAIKEI)then
			begin
				sSQL:=sSQL+#13#10'OrderNo IN(';
				for i:=0 to Length(OrderNo)-1 do
				begin
					if i>0 then
						sSQL:=sSQL+#13#10',';
					sSQL:=sSQL+IntToStr(OrderNo[i]);
				end;
				sSQL:=sSQL+#13#10')';
			end
			//社員ｺｰﾄﾞ
			else
			begin
				sSQL:=sSQL+#13#10'GCode IN(';
				for i:=0 to Length(Code)-1 do
				begin
					if i>0 then
						sSQL:=sSQL+#13#10',';
					sSQL:=sSQL+AnsiQuotedStr(Code[i],'''');
				end;
				sSQL:=sSQL+#13#10')';
			end;
		end;
//2005-12-27 ST
		// 本日変更社員絞込み
		if pPrnParam^.HapPrnSpt.bTodayOnly then
		begin
			sSQL:=sSQL+#13#10+'And DATE(SC.UpdDateTM) = :RDATE';
		end;
//2005-12-27 ED
	end;

	//空なら出力しない
	sSQL:=sSQL+#13#10'AND';
	sSQL:=sSQL+#13#10' (';

	j:=0;
	for i:=1 to 12 do
	begin
		if not mqKM.Locate('ItemNo',1500*100+i,[])then
			continue;

		if(j>0)then
			sSQL:=sSQL+#13#10' OR';

		sSQL:=sSQL+#13#10+Format('Memo%2.2u<>''''',[i]);
		Inc(j);
	end;

	sSQL:=sSQL+#13#10' )';

	sSQL:=sSQL+#13#10'ORDER BY';
	case(pPrnParam^.HapPrnSpt.iOrder)of
		HAPPRN_ODR_TAIKEI:
			sSQL:=sSQL+#13#10' OrderNo,';
		HAPPRN_ODR_KANA:
//<060405> ST
//			sSQL:=sSQL+#13#10' EmpKana,';
		begin
			// 戸籍名出力対応
			if pPrnParam^.HapPrnSpt.iNameType = 1 then
				sSQL:=sSQL+#13#10' TrueNameKanaU,'
			else
				sSQL:=sSQL+#13#10' KanaName,';
		end;
//<060405> ED


	end;
	sSQL:=sSQL+#13#10' SC.GCode';

	with mqPrn do
	begin
		Close;
		SQL.Clear;
		SQL.Add(sSQL);

//2005-12-27 ST
		// 本日変更社員絞込み
		if pPrnParam^.HapPrnSpt.bTodayOnly then
		begin
			SetFld('RDATE').AsDateTime := pPrnParam^.HapPrnSpt.dToday;
		end;
//2005-12-27 ED

		try
			Open(TRUE);
			if IsEmpty then
			begin
				MjsMessageBox(	Self,
								'印刷ﾃﾞｰﾀが存在しません。',
// <2006-09-07> ----- S
//								mjError,
								mjWarning,
// <2006-09-07> ----- E
								mjdefOK		);
				Exit;
			end;
		except
			raise Exception.Create('社員ﾃﾞｰﾀの取得に失敗しました');
		end;
	end;

	with MdPrn do
	begin
		Close;
		Open;

		iRec	:=0;
		iOrderNo:=0;

		if(ppReport1.Groups[0].NewPage)then
			iOrderNo:=mqPrn.GetFld('OrderNo').AsInteger;

		while not mqPrn.Eof do
		begin
			j:=0;
			for i:=1 to 12 do
			begin
				//項目名
				if not mqKM.Locate('ItemNo',1500*100+i,[])then
					Continue;

				//改行ｺｰﾄﾞ/半角SP/全角SPのみでも出力する
				//(見た目は空になるが…)
				//↑のﾃﾞｰﾀｾｯﾄ取得の判定と異なるため
				if(mqPrn.GetFld(Format('Memo%2.2u',[i])).AsString='')then
					Continue;

				Append;

				//社員先頭
				//または
				//印刷/ﾌﾟﾚﾋﾞｭｰで頁内先頭
				if(j=0)or
				  ((pPrnParam^.MPrnSpt.iCommand<>PDLG_FILE)and
				   (iRec=0))then
				begin
					//社員ｺｰﾄﾞ
					FieldByName('EmpNo').AsString	:=
								HapCodeAttribute2(mqPrn.GetFld('GCode').AsString,iEmpDigit,iEmpAttribute);

					//氏名（戸籍名出力ビュー対応）
                    if pPrnParam^.HapPrnSpt.iNameType = 1 then
                    	sName	:= mqPrn.GetFld('TrueNameU').AsString
                    else
                    	sName	:= mqPrn.GetFld('Name').AsString;
					FieldByName('EmpName').AsString	:= sName;

					//所属ｺｰﾄﾞ
					FieldByName('DeptNo').AsString	:=
								HapCodeAttribute2(mqPrn.GetFld('DeptNo').AsString,iDeptDigit,iDeptAttribute);
					//簡略名
					FieldByName('Ryaku').AsString	:=mqPrn.GetFld('Ryaku').AsString;

					//簡略名
					FieldByName('DeptNCd').AsFloat	:=mqPrn.GetFld('DeptNCd').AsFloat;
				end;

				FieldByName('MemoT01').AsString:=mqKM.GetFld('ItemName').AsString;

				//ﾒﾓ内容
				sMemo:=fnCRLFRep(mqPrn.GetFld(Format('Memo%2.2u',[i])).AsString);
				FieldByName('Memo01').AsString:=sMemo;

				//所属毎改頁あり
				if(ppReport1.Groups[0].NewPage)then
					FieldByName('OrderNo').AsInteger:=mqPrn.GetFld('OrderNo').AsInteger;

				Post;

				Inc(j);
				Inc(iRec);

				//頁内明細上限に達した
				if(iRec>=_RECMAX_)then
				begin
					//頁Brk
					Edit;
					FieldByName('BottomLine').AsInteger:=1;
					Post;
					//頁Brk制御用変数の初期化
					iRec:=0;
				end;

			end;
			//社員Brk
			Edit;
			FieldByName('BottomLine').AsInteger:=1;
			Post;

			mqPrn.Next;

			//体系順で所属が切り替わった
			if(ppReport1.Groups[0].NewPage and
			  (iOrderNo<>mqPrn.GetFld('OrderNo').AsInteger))then
			begin
				//頁Brk
				Edit;
				FieldByName('BottomLine').AsInteger:=1;
				Post;

				//頁Brk制御用変数の初期化
				iRec:=0;
				iOrderNo:=mqPrn.GetFld('OrderNo').AsInteger;
			end;
		end;
	end;


	case pPrnParam^.MPrnSpt.iCommand of
		// <2008-06-09>
		 //印刷
		PDLG_PRINT,
		//ﾌﾟﾚﾋﾞｭｰ
		PDLG_PREVIEW:
			with pPrnParam^ do
				MPrev.Exec(MPrnSpt,MDlgF,nil);
		//ﾌｧｲﾙ出力
		PDLG_FILE:
		begin
			if MjsFileOut(	MdPrn,
							slField,
							slTitle,
							pPrnParam^.MPrnSpt,
							pAppRec	) = -1 then
			begin
				//ファイル出力不可
				GetMsg(rcMsg,30,2);
				with rcMsg do
					 MjsMessageBoxEx(	Self,
										sMsg,
										sTitle,
										icontype,
										btntype,
										btndef,
										LogType		);
			end;
		end;
	end;
end;

//**********************************************************************
//		Proceess	:印刷用MemDataﾌｨｰﾙﾄﾞ作成
//		Name		:T.Aoki
//		Date		:04/01/19
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000059PPrintF.fnMdPrnIni;
var
	fFld:TField;
begin
	with MdPrn do
	begin
		Close;
		Fields.Clear;
	end;

//ｶｳﾝﾀ

	//RecId
	fFld:=TAutoIncField.Create(Self);
	with TAutoIncField(fFld)do
	begin
		FieldName:='RecId';
		DataSet	 :=MdPrn;
		Name	 :=DataSet.Name+FieldName;
	end;

//帳票/ﾌｧｲﾙ出力

	//社員No
	fFld:=TStringField.Create(Self);
	with TStringField(fFld)do
	begin
		Size	 :=10;
		FieldName:='EmpNo';
		DataSet	 :=MdPrn;
		Name	 :=DataSet.Name+FieldName;
	end;
	ppDBEmpNo.DataField:=fFld.FieldName;
	slField.Add(fFld.FieldName);
//	slTitle.Add('社員ｺｰﾄﾞ');
	slTitle.Add('社員No');														//<2016-06-15>


	//氏名
	fFld:=TStringField.Create(Self);
	with TStringField(fFld)do
	begin
		Size	 :=42;
		FieldName:='EmpName';
		DataSet	 :=MdPrn;
		Name	 :=DataSet.Name+FieldName;
	end;
	ppDBEmpName.DataField:=fFld.FieldName;
	slField.Add(fFld.FieldName);
	slTitle.Add('氏名');

	//項目名
	fFld:=TStringField.Create(Self);
	with TStringField(fFld)do
	begin
		Size	 :=16;
		FieldName:='MemoT01';
		DataSet	 :=MdPrn;
		Name	 :=DataSet.Name+FieldName;
	end;
	ppDBMemoT01.DataField:=fFld.FieldName;
	slField.Add(fFld.FieldName);
	slTitle.Add('項目名');

	//ﾒﾓ内容
	fFld:=TStringField.Create(Self);
	with TStringField(fFld)do
	begin
		Size	 :=200;
		FieldName:='Memo01';
		DataSet	 :=MdPrn;
		Name	 :=DataSet.Name+FieldName;
	end;
	ppDBMemo01.DataField:=fFld.FieldName;
	slField.Add(fFld.FieldName);
	slTitle.Add('内容');

	//所属No
	fFld:=TStringField.Create(Self);
	with TStringField(fFld)do
	begin
		Size	 :=10;
		FieldName:='DeptNo';
		DataSet	 :=MdPrn;
		Name	 :=DataSet.Name+FieldName;
	end;
{
	ppDBDeptNo.DataField:=fFld.FieldName;
	slField.Add(fFld.FieldName);
	slTitle.Add('所属ｺｰﾄﾞ');
}
	//簡略名
	fFld:=TStringField.Create(Self);
	with TStringField(fFld)do
	begin
		Size	 :=20;
		FieldName:='Ryaku';
		DataSet	 :=MdPrn;
		Name	 :=DataSet.Name+FieldName;
	end;
{
	ppDBRyaku.DataField:=fFld.FieldName;
	slField.Add(fFld.FieldName);
	slTitle.Add('簡略名');
}
	//所属内部No
	fFld:=TFloatField.Create(Self);
	with TFloatField(fFld)do
	begin
		FieldName:='DeptNCd';
		DataSet	 :=MdPrn;
		Name	 :=DataSet.Name+FieldName;
	end;



//以下は出力なし/制御用

	//下線(社員/頁Brk)
	fFld:=TSmallIntField.Create(Self);
	with TSmallIntField(fFld)do
	begin
		FieldName:='BottomLine';
		DataSet	 :=MdPrn;
		Name	 :=DataSet.Name+FieldName;
	end;

	//体系Brk
	fFld:=TIntegerField.Create(Self);
	with TIntegerField(fFld)do
	begin
		FieldName:='OrderNo';
		DataSet	 :=MdPrn;
		Name	 :=DataSet.Name+FieldName;
	end;

	with ppReport1.Groups[0],
		 pPrnParam^.HapPrnSpt do
	begin
		BreakName:=fFld.FieldName;
		NewPage	 :=(iOrder=HAPPRN_ODR_TAIKEI)and bPageBreak;
	end;

end;

//**********************************************************************
//		Component	:ppReport1
//		Event		:BeforePrint
//		Process		:印刷前
//		Name		:T.Aoki
//		Date		:04/01/19
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000059PPrintF.ppReport1BeforePrint(Sender: TObject);
begin
	with pPrnParam^ do
		MPrnSpt.BeforePrint(Sender as TppReport);
end;

//**********************************************************************
//		Process		:改行ｺｰﾄﾞを変換
//		Name		:T.Aoki
//		Date		:04/01/15
//		Parameter	:sSrc:変換前文字列
//					:sRep:変換文字
//		Return		:変換後文字列
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function fnCRLFRep(sSrc:string;sRep:string):string;
var
	i:integer;
	sl:TStringList;
	sRet:string;
begin
//改行ｺｰﾄﾞは必ず#13#10(CRLF)とする
//StringReplace()で#13#10変換するのが不安なので
//2ﾊﾞｲﾄ文字の連続が#??#13 #10#??だったら?
//				   ^^^^^^ ^^^^^^
//StringListをﾙｰﾌﾟし行取り出し

	sl:=TStringList.Create;
	try
		sl.Text:=sSrc;

		sRet:='';
		for i:=0 to sl.Count-1 do
		begin
			if(i>0)then
				sRet:=sRet+sRep;

			sRet:=sRet+sl.Strings[i];
		end;

		Result:=sRet;
	finally
		sl.Free;
	end;
end;

//**********************************************************************
//		Process		:帳票形式初期化
//		Name		:T.Aoki
//		Date		:04/01/20
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000059PPrintF.fnStyleIni;
var
	i:integer;
begin

//ﾍｯﾀﾞ部

//	SetLength(arrHVLine,7);
	SetLength(arrHVLine,5);

	arrHVLine[0]:=ppLineHV01;
	arrHVLine[1]:=ppLineHV02;
	arrHVLine[2]:=ppLineHV03;
	arrHVLine[3]:=ppLineHV04;
	arrHVLine[4]:=ppLineHV05;
//	arrHVLine[5]:=ppLineHV06;
//	arrHVLine[6]:=ppLineHV07;

	for i:=0 to Length(arrHVLine)-1 do
	begin
		with arrHVLine[i]do
		begin
			Top		:=ppLineHH01.Top;
			Height	:=ppLineHH02.Top+ppLineHH02.Height-ppLineHH01.Top;
		end;
	end;

	arrHVLine[0].Left					:=ppLineHH01.Left;
	arrHVLine[Length(arrHVLine)-1].Left	:=ppLineHH01.Left+ppLineHH01.Width;

	arrHVLine[1].Left					:=ppDBEmpName.Left	-1.5;
	arrHVLine[2].Left					:=ppDBMemoT01.Left	-1.5;
	arrHVLine[3].Left					:=ppDBMemo01.Left	-1.5;
//	arrHVLine[4].Left					:=ppDBDeptNo.Left	-1;
//	arrHVLine[5].Left					:=ppDBRyaku.Left	-1;

//明細部

	ppReport1.Detail.Height:=ppDBEmpNo.Top+ppDBEmpNo.Height+0.2;

//	SetLength(arrDVLine,7);
	SetLength(arrDVLine,5);

	arrDVLine[0]:=ppLineDV01;
	arrDVLine[1]:=ppLineDV02;
	arrDVLine[2]:=ppLineDV03;
	arrDVLine[3]:=ppLineDV04;
	arrDVLine[4]:=ppLineDV05;
//	arrDVLine[5]:=ppLineDV06;
//	arrDVLine[6]:=ppLineDV07;

	for i:=0 to Length(arrDVLine)-1 do
	begin
		with arrDVLine[i] do
		begin
			Top		:=0;
			Height	:=ppReport1.Detail.Height;
		end;
	end;

	arrDVLine[0].Left					:=ppLineHH01.Left;
	arrDVLine[Length(arrHVLine)-1].Left	:=ppLineHH01.Left+ppLineHH01.Width;

	arrDVLine[1].Left					:=ppDBEmpName.Left	-1.5;
	arrDVLine[2].Left					:=ppDBMemoT01.Left	-1.5;
	arrDVLine[3].Left					:=ppDBMemo01.Left	-1.5;
//	arrDVLine[4].Left					:=ppDBDeptNo.Left	-1;
//	arrDVLine[5].Left					:=ppDBRyaku.Left	-1;

	with ppLineDH01 do
	begin
		Left	:=ppLineHH01.Left;
		Top		:=ppReport1.Detail.Height-ppLineDH01.Height;
		Width	:=arrDVLine[2].Left-Left;
	end;

	with ppLineDH02 do
	begin
		Left	:=arrDVLine[2].Left;
		Top		:=ppReport1.Detail.Height-ppLineDH02.Height;
		Width	:=arrDVLine[4].Left-Left;
	end;
{
	with ppLineDH03 do
	begin
		Visible := False;

		Left	:=arrDVLine[4].Left;
		Top		:=ppReport1.Detail.Height-ppLineDH03.Height;
		Width	:=arrDVLine[Length(arrHVLine)-1].Left-Left;
	end;
}

	ppLineDH03.Visible	:=	False;
	ppLineHV06.Visible	:=	False;
	ppLineHV07.Visible	:=	False;
	ppLineDV06.Visible	:=	False;
	ppLineDV07.Visible	:=	False;



end;

//**********************************************************************
//		Component	:ppDetailBand1
//		Event		:BeforeGenerate
//		Process		:明細部出力前
//		Name		:T.Aoki
//		Date		:04/01/20
//		Parameter	:
//		Return		:
//		History		:04/02/03(T.Aoki)
//					:区切り線の線種を変更
//**********************************************************************
procedure THAP000059PPrintF.ppDetailBand1BeforeGenerate(Sender: TObject);
begin
	//社員Brk時社員/所属の区切り線を出力
	ppLineDH01.Visible:=mdPrn.FieldByName('BottomLine').AsInteger=1;
//	ppLineDH03.Visible:=mdPrn.FieldByName('BottomLine').AsInteger=1;

	//社員Brkは実線/中間線は密
	if(mdPrn.FieldByName('BottomLine').AsInteger=1)then
		ppLineDH02.Pen.Style:=psSolid
	else
		ppLineDH02.Pen.Style:=psDot;
end;

//**********************************************************************
//		Component	:ppHeaderBand1
//		Event		:BeforePrint
//		Proccess	:社員所属毎改頁で、帳票の所属を出力
//		Parameter	:
//		Return		:
//		History		:2001/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000059PPrintF.ppHeaderBand1BeforePrint(Sender: TObject);
begin
	ppLDeptNo.Caption :=
		HapCodeAttribute2(MdPrn.FieldByName('DeptNo').AsString,iDeptDigit,iDeptAttribute);

	ppLDeptName.Caption := fnGetDeptName(Trunc(MdPrn.FieldByName('DeptNCd').AsFloat));

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
function THAP000059PPrintF.fnGetDeptName(DeptNCd: Int64): string;
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

	dbM.SetDBInfoToQuery(ddCopDB,DMQuery);

	try
		try
			with DMQuery do
			begin
				Close();
				SQL.Clear();
				SQL.Add('SELECT SimpleName from MV_HAP_HAPCHG' );
				SQL.Add('WHERE DeptNCode = :hDeptNCd');
				SQL.Add('AND MasterKbn = 41 AND AddPos=0');

				ParamByName('hDeptNCd').AsFloat := DeptNCd;

				Open();
				if not eof then
				begin
					result:= DMQuery.GetFld('SimpleName').AsString;
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

end.
