//************************************************************************
//	System		:	MJSLINK給与大将
//  Program		:   振込先銀行名印刷
//	ProgramID	:   JNTCRP008003Print
//	Name		:   HZM
//	Create		:   2000/12/06
//	Comment		:   XXXX注意事項等XXXXXXXXXXXXX
//				:	XXXXXXXXXXXXXXXXXXXXXXXXX
//	History		:   update 2000/12/20 QiuRong(上海未来)
//				:			2008/05/22	S.Saito
//				:				<002>	JSOX印刷履歴対応
//				:
//************************************************************************
unit JNTCRP008003PrintU;

interface

uses
	Windows,
	Messages,
	SysUtils,
	Classes,
	VCL.Graphics,
	VCL.Controls,
	VCL.Forms,
	VCL.Dialogs, MJSCommonDialogs,
	ppDB,
	ppDBPipe,
	ppBands,
	ppCtrls,
	ppVar,
	ppPrnabl,
	ppClass,
	ppCache,
	ppComm,
	ppRelatv,
	ppProd,
	ppReport,
	ppModule,
	daDatMod,
	Db,
	dxmdaset,
	MjsDBModuleu,
	MjsPrnDlgu,
	FireDAC.Comp.Client,
	MJSQuery,
	MjsDispCtrl ,
	MjsPrnSupportu,
    MjsPreviewIFu,
    MJSCommonu;
{
	MJSCommonu,
	NSPMsgu;                                                              //20010115 naka
}

type
  TJNTCRP008003PrintF = class(TForm)
	DDataPrint: TDataSource;
	DMDdxMemDataPrint: TdxMemData;
	DMDdxMemDataPrintBankCode: TStringField;
	DMDdxMemDataPrintBankName: TStringField;
	DMDdxMemDataPrintBankKana: TStringField;
	DMDdxMemDataPrintBranchCode: TStringField;
	DMDdxMemDataPrintBranchName: TStringField;
	DMDdxMemDataPrintBranchKana: TStringField;
	RReport: TppReport;
	ppHeaderBand1: TppHeaderBand;
	ppLabel1: TppLabel;
	ppLine2: TppLine;
	ppLabel3: TppLabel;
	ppLine1: TppLine;
	ppLabel4: TppLabel;
	ppLabel5: TppLabel;
	ppLabel7: TppLabel;
	ppLabel8: TppLabel;
	ppLabel9: TppLabel;
	SVppDate: TppSystemVariable;
	LppCorpCode: TppLabel;
	LppCorpName: TppLabel;
	ppDetailBand1: TppDetailBand;
	ppDBText1: TppDBText;
	ppDBText2: TppDBText;
	ppDBText3: TppDBText;
	ppDBText5: TppDBText;
	ppDBText6: TppDBText;
	ppDBText7: TppDBText;
	ppFooterBand1: TppFooterBand;
	SVppPage: TppSystemVariable;
	PPrintDBPipeLine: TppDBPipeline;
	PPrintDBPipeLineppField1: TppField;
	PPrintDBPipeLineppField2: TppField;
	PPrintDBPipeLineppField3: TppField;
	PPrintDBPipeLineppField4: TppField;
	PPrintDBPipeLineppField5: TppField;
	PPrintDBPipeLineppField6: TppField;
	PPrintDBPipeLineppField7: TppField;
    ppJimushoName: TppLabel;
	procedure fnPrint(pRec : Pointer);
	procedure FormCreate(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
    procedure RReportBeforePrint(Sender: TObject);
//    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);           //20010115 naka
//    procedure FormClose(Sender: TObject; var Action: TCloseAction);             //20010115 naka


  private
	{ Private 宣言 }
	m_pRec			: ^TMjsAppRecord;
    PrnS			: TMjsPrnSupport;
	procedure 		fnNSPSetPrnInfo( _PrnSupport : TMjsPrnSupport );			// 印刷情報Set
	procedure		fnPrintDataSet;
	procedure 		fnSetFileOut();
  public
	{ Public 宣言 }
	DBMod			: TMDataModulef;
	DBCRP			: TFDConnection;												// 給与DB
	DBCTL			: TFDConnection;												// 給与DB
	iCopNo			: Integer;													// 会社コード
	sCopName		: String;													// 会社名称
	giKeta			: INteger;
    mjspreview      : TMjsPreviewIF;                                            //20010120 KOS

  end;

implementation

{<001>
uses
	NSPLibU;
}

{$R *.DFM}

//************************************************************************
//*	 Proccess		:   CONSTRUCTOR関数
//*	 Name			:
//*	 Date			:   2000/12/20
//*	 Paqrameter		:   Nathing
//*	 Retrun			:   Nathing
//*	 History		:   2001/07/31 KOS
//*							CSVファイル出力
//************************************************************************
procedure TJNTCRP008003PrintF.fnPrint(pRec: Pointer);
var
	MJSPrnDlgf	:	TMJSPrnDlgf;
	iRet		:	Integer;
	gsText		: string;
begin
	m_pRec := pRec;
	MJSPrnDlgf := TMJSPrnDlgf.Create( Self );									// MJS印刷ﾀﾞｲｱﾛｸﾞ
	fnNSPSetPrnInfo( PrnS );													// 印刷情報Set
	PrnS.ApRB				:= RReport;
	PrnS.pComArea			:= m_pRec^.m_pCommonArea;
	PrnS.strDocName		:= '振込先銀行名印刷リスト';
	PrnS.pPage			:= SVppPage;											//  ページ
	PrnS.pDate			:= SVppDate;											//  日付
	PrnS.pCorpCode		:= LppCorpCode;											//  会社コード
	PrnS.pCorpName		:= LppCorpName;											//  会社名称

	PrnS.iReportID		:=	990100;
	PrnS.MDataModule	:=	DBMod;
	PrnS.iSysCode		:=	m_pRec^.m_iSystemCode;
	PrnS.pAccountOffice	:=	ppJimushoName;										//　会計事務所名

	PrnS.strFileName	:=	rcCOMMONAREA ( m_pRec^.m_pCommonArea^ ).SysCliRoot +
		'\tmp\振込先銀行名印刷リスト.csv';
	PrnS.iDspFileBtn	:=	1; 													// ファイル出力表示
//<002> start
	PrnS.pApRec			:= m_pRec;
//<002> end
	iRet := MJSPrnDlgf.DoDLG( PrnS );											// ダイアログ呼び出し
	if iRet > 0 then
	begin
	    m_pRec := pRec;                                                         //20010115 naka
        mjspreview.Init(m_pRec);                                                //20010115 naka

		/////// 2001/01/29 KOS.hori 他APのプレビューチェック
		if (MjsPreview.IsExistPreview) and (PrnS.iCommand = PDLG_PREVIEW)
			and (PrnS.iCommand <> PDLG_FILE)	then
		begin
			gsText	:= '他の処理でプレビューが起動しています。'+#13#10;
            gsText	:= gsText + '他のプレビューを終了してください。';
			MjsMessageBoxEX(Self,gsText, 'エラー', mjError, mjOK, mjDefOK);
			MjsPrnDlgf.Free;
        	exit;
		end;
		/////// 2001/01/29 END
    	if (PrnS.iCommand = PDLG_PRINT) or (PrnS.iCommand =PDLG_PREVIEW) then	//	印刷 or ﾌﾟﾚﾋﾞｭｰ
        begin
			fnPrintDataSet;
			//RReport.Print;
			mjspreview.Exec(PrnS,MJSPrnDlgF);                                   //20010115 naka
		end
		else if (PrnS.iCommand = PDLG_FILE)	then
		begin
			fnPrintDataSet;
			fnSetFileOut();
		end;
	end;
	MjsPrnDlgf.Free
end;

//***********************************************************
//*  Proccess:印刷データセット
//*  Name    :HZM
//*  Data    :
//*  Parameter:
//*  Return   :
//*  History  : QiuRong(上海未来) UPDATE
//*             2000/12/20 関数名変更
//***********************************************************
procedure TJNTCRP008003PrintF.fnPrintDataSet;
var
	DMQuery		:	TMQuery;
	sBankCode:	String;
	iErrorFlag : Integer;
begin
	DMQuery := TMQuery.Create( Self );			  								//  MQueryの構築

	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	iErrorFlag:=0;

	DBMod.SetDBInfoToQuery( DBCRP, DMQuery );									//  DBとMQueryの接続

	try
		try
			with DMQuery do
			begin
				Close();
				SQL.Clear();
				Sql.Add ('select NSPBF.BankCode,NSPBF.BankName,NSPBF.BankKana,');
				Sql.Add ('NSPBS.BranchCode,NSPBS.BranchName,NSPBS.BranchKana');
				Sql.Add (' from NSPBF LEFT OUTER JOIN NSPBS on NSPBF.BankCode=NSPBS.BankCode');
				Sql.Add (' order by NSPBF.BankCode,NSPBS.BranchCode');
				Open();
				if Eof then
				begin
					iErrorFlag:=-1;
					Abort;
				end;
				DMDdxMemDataPrint.Close ;
				DMDdxMemDataPrint.Open ;
				if not eof then
				begin
//<001>					sBankCode:=NspCodeAttribute(GetFld('BankCode').Asstring,giKeta,FALSE);
					while eof<>true DO
					begin
						DMDdxMemDataPrint.Append;
						if DMDdxMemDataPrint.RecordCount=0 then
						begin
//<001>							DMDdxMemDataPrint.FieldByName('BankCode').Asstring:=NspCodeAttribute(GetFld('BankCode').Asstring,giKeta,FALSE);
							DMDdxMemDataPrint.FieldByName('BankName').AsString  := GetFld('BankName').AsString;
							DMDdxMemDataPrint.FieldByName('BankKana').AsString := GetFld('BankKana').AsString;
						end
						else
						begin
//<001>							if sBankCode<>NspCodeAttribute(GetFld('BankCode').Asstring,giKeta,FALSE) then
							begin
//<001>								sBankCode:=NspCodeAttribute(GetFld('BankCode').Asstring,giKeta,FALSE);
//<001>								DMDdxMemDataPrint.FieldByName('BankCode').Asstring:=NspCodeAttribute(GetFld('BankCode').Asstring,giKeta,FALSE);
								DMDdxMemDataPrint.FieldByName('BankName').AsString  := GetFld('BankName').AsString;
								DMDdxMemDataPrint.FieldByName('BankKana').AsString := GetFld('BankKana').AsString;
							end;
						end;
//						DMDdxMemDataPrint.FieldByName('BranchCode').Asstring:=NspCodeAttribute(GetFld('BranchCode').Asstring,giKeta,FALSE);
//<001>						DMDdxMemDataPrint.FieldByName('BranchCode').Asstring:=NspCodeAttribute(GetFld('BranchCode').Asstring,giKeta-1,FALSE);      //市区町村コードは3桁
						DMDdxMemDataPrint.FieldByName('BranchName').AsString  := GetFld('BranchName').AsString;
						DMDdxMemDataPrint.FieldByName('BranchKana').AsString := GetFld('BranchKana').AsString;
						DMDdxMemDataPrint.Post;  								//  ﾚｺｰﾄﾞをDBに書き込んでいる
						Next;
					end;
				end;
			end;
		except
			if iErrorFlag=0 then
			begin
			end
			else if iErrorFlag=-1 then
			begin
			end;

			Exit;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**************************************************************************
//	Proccess  	:  	MjsPenSupportに年末調整共通パラメータをセット
//	Name	  	:
//	Date		:  	2000/12/20
//	Parameter  	:  	_PrnSupport
//	Retrun	  	:  	TRUE
//	History	　	:
//**************************************************************************
procedure TJNTCRP008003PrintF.fnNSPSetPrnInfo(_PrnSupport: TMjsPrnSupport);
Var
	MAQuery	:	TMQuery;
	DTQuery	:	TMQuery;
	iErrorFlag : Integer;
begin

	MAQuery := TMQuery.Create( Self );
	if Assigned(MAQuery) <> True then
	begin
		Exit;
	end;
	DBMod.SetDBInfoToQuery( DBCRP, MAQuery );

	DTQuery := TMQuery.Create( Self );
	if Assigned(DTQuery) <> True then
	begin
		Exit;
	end;
	DBMod.SetDBInfoToQuery( DBCTL, DTQuery );

	iErrorFlag:=0;
	try
		try
			with MAQuery do
			begin
				Close();
				SQL.Clear();
				SQL.Add('Select CopNoOut, CopNameOut, CalendarKbn, PageOut, DateOut From NSPM3');
				Open;
				if Eof then
				begin
					iErrorFlag:=-1;
					Abort;
				end;
				if not eof then
				begin
					_PrnSupport.iCalendarKbn := GetFld('CalendarKbn').Asinteger;
					_PrnSupport.iDate		:= GetFld('Dateout').Asinteger;		// 日付出力
					_PrnSupport.iPage		:= GetFld('PageOut').Asinteger;		// ページ出力
				end;
				_PrnSupport.strCorpCode := inttostr(iCopNo);	//NSPCodeAttribute(inttostr(iCopNo),giKeta,FALSE);
				_PrnSupport.strBranchCode := '';
				_PrnSupport.strBranchName := '';
		//		_PrnSupport.strOfficeName := Commem.gcmADJMEM.AccName;
																				// 会計事務所名称

				_PrnSupport.lstCorpCode.Clear();;
				_PrnSupport.lstCorpCode.Add('出力しない');
				_PrnSupport.lstCorpCode.Add('会社コード');

				// 会社コードリストの印刷DLGの戻り値（MJSPrnDlg仕様書の戻り値参照）
				_PrnSupport.iarCorpCodeValue.Clear();
				_PrnSupport.iarCorpCodeValue.Add(0);
				_PrnSupport.iarCorpCodeValue.Add(1);

				if GetFld('CopNoOut').Asinteger = 0 then
					_PrnSupport.iKaishaCode := 0
				else
					_PrnSupport.iKaishaCode := 1;

				_PrnSupport.lstCorpName.Clear();
				_PrnSupport.lstCorpName.Add('出力しない');
				_PrnSupport.lstCorpName.Add('会社名');

				// 会社名リストの印刷DLGの戻り値（MJSPrnDlg仕様書の戻り値参照）
				_PrnSupport.iarCorpNameValue.Clear();
				_PrnSupport.iarCorpNameValue.Add(0);
				_PrnSupport.iarCorpNameValue.Add(3);

				if GetFld('CopNameOut').Asinteger = 0 then
					_PrnSupport.iKaishaCode := 0
				else
					_PrnSupport.iKaishaName := 1;
                //会計事務所名追加 2001/06/08 KOS
				Close();
				SQL.Clear();
				SQL.Add('Select AccName From NSPMA');							//会計事務所名称
				Open(true);
				if Eof then
				begin
					iErrorFlag:=-2;
					Abort;
				end;
				_PrnSupport.strOfficeName := GetFld('AccName').AsString;

			end;
		except
			if iErrorFlag=0 then
			begin
				MJSMessageBox(Self,'NSPM3 Open Error.',mjError,mjDefOk);
				Abort;
			end
			else if iErrorFlag=-1 then
			begin
			end;

//			Exit;
		end;
	finally
		MAQuery.Close;
		MAQuery.Free;
	end;

// 共通DBから会社名称を取得
	iErrorFlag:=0;
	try
		try
			with DTQuery do
			begin
				Close();
				SQL.Clear();
				SQL.Add('Select DTName From SDT_DCTL');
				SQL.ADD('Where SysCD = :SysCD and DTCD = :DTCode');
				ParamByName('DTCode').AsInteger := iCopNo;
				ParamByName('SysCD').AsInteger := m_pRec^.m_iSystemCode;
				Open();
				if Eof then
				begin
					iErrorFlag:=-1;
					Abort;
				end;
				if not eof then
				begin
					_PrnSupport.strCorpName := GetFld('DTName').AsString;
//					_PrnSupport.strCorpCode := NSPCodeAttribute(IntToStr(iCopNo),8,FALSE);
				end;
			end;
		except
			if iErrorFlag=0 then
			begin
				MjsMessageBox(Self,'SDT_DCTL Open Error.', mjError, mjDefOk);
				Abort;
			end
			else if iErrorFlag=-1 then
			begin
			end;

			Exit;
		end;
	finally
		DTQuery.Close;
		DTQuery.Free;
	end;
end;

//************************************************************************
//	Component       :   Form
//  Event           :   Create
//	Name            :   Qiurong(上海未来)
//************************************************************************
procedure TJNTCRP008003PrintF.FormCreate(Sender: TObject);
begin
	PrnS := TMJSPrnSupport.Create;												// 印刷構造体 生成
	mjspreview:=TMJSPreviewIF.Create;                                           //20010115 naka
end;

//************************************************************************
//	Component       :   Form
//  Event           :   Destroy
//	Name            :   Qiurong(上海未来)
//************************************************************************
procedure TJNTCRP008003PrintF.FormDestroy(Sender: TObject);
begin
	mjspreview.Term();                                                          // 20010120 KOS ADD
	mjspreview.Free();                                                          // 20010120 KOS ADD
	PrnS.Free;																	// 印刷構造体 解放
end;

//**********************************************************************
//		Component	:Form
//		Event		:Close
//		Name		:仲西（KOS）20010115
//**********************************************************************
{procedure TJNTCRP008003PrintF.FormClose(Sender: TObject; var Action: TCloseAction);

begin
	mjspreview.Term();                                                          // 20010115 naka
	mjspreview.Free();                                                          // 20010115 naka
end;
}
//**********************************************************************
//		Component	:Form
//		Event		:CloseQuery
//		Name		:仲西（KOS）20010115
//**********************************************************************
{procedure TJNTCRP008003PrintF.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	if mjspreview.IsPreView then
    	begin
	//		ComArea.m_MsgStd.GetMsg( MjsMsgRec, 10040,2);
	// 		MjsMessageBoxEx(MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,MJsMsgRec.LogType );    	CanClose := FALSE
			CanClose := False;
	end
    else
    begin
    	CanClose := TRUE;
    end;

end;
}
//**********************************************************************
//*		Proccess	:	ファイル出力に必要なTitle･Filed設定
//*		Name		:	KOS
//*		Date		:	2001/7/31
//*		Parameter	:	sTitle	:	CreateされたTStringList(ﾀｲﾄﾙ用)
//*						sMemFld	:	CreateされたTStringList(ﾌｨｰﾙﾄﾞ用)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP008003PrintF.fnSetFileOut();
var
	sTitle		: TStringList;
	sMemFld		: TStringList;
//<001>	rcMsg		: TMjsMsgRec;
	i	:	Integer;
    s	:	String;
begin
	sTitle   := TStringList.Create;		//ファイル出力用リスト(タイトル)作成
	sMemFld	:= TStringList.Create;		//ファイル
	sTitle.Add('銀行No');
    sTitle.Add('銀行名称');
	sTitle.Add('銀行名称ｶﾅ');
    sTitle.Add('支店No');
	sTitle.Add('支店名称');
	sTitle.Add('支店名称ｶﾅ');
	With DMDdxMemDataPrint.FieldDefs do
    begin
		for i := 0 to Count-1 do
    	begin
			s := DMDdxMemDataPrint.FieldDefs.Items[i].Name;
			sMemFld.Add(s);
	    end;
    end;
	if MjsFileOut(DMDdxMemDataPrint, sMemFld, sTitle, PrnS,m_pRec) = -1 then
	begin
	//	ファイル出力失敗
//<001>		GetMsg(rcMsg,30,2);
//<001>		with rcMsg do
//<001>             MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
	end;
	sTitle.Free;
	sMemFld.Free;
end;

//******************************************************************************
//	Component		:	ppReport1
//	Event			:	BeforePrint
//	Name			:	M.Ono(KOS)
//******************************************************************************
procedure TJNTCRP008003PrintF.RReportBeforePrint(Sender: TObject);
begin
	PrnS.BeforePrint(Sender);
end;

end.
