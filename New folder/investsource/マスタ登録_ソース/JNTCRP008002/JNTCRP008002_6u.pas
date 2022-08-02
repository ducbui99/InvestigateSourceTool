//**********************************************************************
//		System		:MJSLINK給与大将
//		Package ID	:NSP101530
//		Unit	ID	:JNTCRP008002_6U
//		Comment		:共通支店検索Dlg
//		Create By	:T.Aoki
//		Create  Date:04/02/17
//		Reamake Date:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//					:	05/01/27 S.Shimono Buntechno
//					:	高解像度対応 <DSP>
//                  :   2012/02/07  SATOH(GSOL)
//                  :   ShiftState対応 <KDS>
//**********************************************************************
unit JNTCRP008002_6U;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, Buttons, MJSBitBtn, VCL.ExtCtrls, MJSPanel, ComCtrls, MJSStatusBar,
  MJSEdits, MJSLabel, MJSSpeedButton, VCL.ImgList,FireDAC.Comp.Client,MjsDBModuleU,
  MjsQuery,Math, dxCntner, dxTL, dxDBGrid, Db, dxmdaset,
  MJSKeyDataState,	// <KDS> ADD
  JNTMasComu;

type
{$I ActionInterface.inc}
  TTVInfo=record
	sWhere,sOrder:string;
  end;
  TLVInfo=record
	iBranchCode:integer;
	TvItem:TTreeNode;
  end;

  TJNTCRP008002_6F = class(TForm)
    MPanel1: TMPanel;
    BOk: TMBitBtn;
    BCancel: TMBitBtn;
    MPanel2: TMPanel;
    MPanel3: TMPanel;
    MLabel1: TMLabel;
    EBranchCode: TMNumEdit;
    LBankCode: TMLabel;
    LBankName: TMLabel;
    LBranchName: TMLabel;
    TView: TTreeView;
    Splitter1: TSplitter;
    BFind: TMSpeedButton;
    BTree: TMSpeedButton;
    ILTreebak: TImageList;
    PFind: TMPanel;
    EBranchName: TMTxtEdit;
    MLabel2: TMLabel;
    BFindStart: TMBitBtn;
    BTreeUp: TMSpeedButton;
    PLeft: TMPanel;
    PrgBar: TProgressBar;
    BFindUp: TMSpeedButton;
    MdBranch: TdxMemData;
    DsBranch: TDataSource;
    GrBranch: TdxDBGrid;
    StsBar: TMStatusBar;
    ILTree: TImageList;
    MLabel3: TMLabel;
	constructor CreateForm(fOwner:TForm;p:pointer;iCd:integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BFindClick(Sender: TObject);
    procedure BCancelClick(Sender: TObject);
    procedure TViewChange(Sender: TObject; Node: TTreeNode);
    procedure TViewEnter(Sender: TObject);
    procedure BFindStartClick(Sender: TObject);
    procedure BOkClick(Sender: TObject);
    procedure MdBranchAfterScroll(DataSet: TDataSet);
    procedure GrBranchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrBranchDblClick(Sender: TObject);
  private
	pAppRec:^TMjsAppRecord;
    pComArea : TJNTMASCom;
	iBankCode:integer;
	piBranchCode:^integer;
	ddCtlDB:TFDConnection;
	dbM:TMDataModuleF;
	mqSelect:TMQuery;
	bFindSw,bTreeSw:boolean;

    procedure fnTViewIni;
    procedure fnGrBranchIni;
    procedure fnGrBranchSet(sWhere,sOrder: string);overload;
	procedure fnGrBranchSet(Node:TTreeNode);overload;
    { Private 宣言 }
  public
    { Public 宣言 }
	function DoDlg(p:pointer):TModalResult;
  protected
	{ Protected 宣言 }
	procedure CMChildKey(var Key:TWMKey);message CM_ChildKey;
  end;

var
  JNTCRP008002_6F: TJNTCRP008002_6F;

implementation

uses
  MjsCommonU,MjsDispCtrl;

const
    ucBaseColorD    =   $006E533A;
    ucBaseColorB    =   $00FFD6D0;

{$R *.DFM}

////////////////////////////////////////////////////////////////////////
//		CONSTRUCTOR
////////////////////////////////////////////////////////////////////////
//**********************************************************************
//		Process		:ｺﾝｽﾄﾗｸﾀ
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:fOWner	:呼出元APﾌｫｰﾑ
//					:p		:MjsAppRecordﾎﾟｲﾝﾀ
//					:iCd	:銀行ｺｰﾄﾞ
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
constructor TJNTCRP008002_6F.CreateForm(fOwner:TForm;p: pointer;iCd:integer);
begin
	pAppRec:=p;
	iBankCode:=iCd;

	dbM:=TMDataModuleF(pAppRec^.m_pDBModule^);
	try
		ddCtlDB:=dbM.CtlDBOpen;
	except
		raise Exception.Create('MJS共通DBのｵｰﾌﾟﾝに失敗しました');
	end;

	mqSelect:=TMQuery.Create(Self);
	try
		dbM.SetDBInfoToQuery(ddCtlDB,mqSelect);
	except
		mqSelect.Free;
		raise Exception.Create('MJS共通DBのｵｰﾌﾟﾝに失敗しました');
	end;

	inherited Create(fOwner);
end;

////////////////////////////////////////////////////////////////////////
//		FORM EVENT
////////////////////////////////////////////////////////////////////////
//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Process		:ﾌｫｰﾑ作成時
//		Name		:T.Aoki
//		Date		:04/02/17
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.FormCreate(Sender: TObject);
begin

	BorderStyle		:=bsSizeable;
	Position		:=poScreenCenter;
	GrBranch.Align	:=alClient;

	fnTViewIni;
	fnGrBranchIni;

	pComArea := TJNTMASCom(pAppRec^.m_pSystemArea^);

    // システム色の設定
	MJSColorChange (Self,
                pComArea.SystemArea.SysColorB,
                pComArea.SystemArea.SysColorD,
				pComArea.SystemArea.SysBaseColorB,
                pComArea.SystemArea.SysBaseColorD,
				rcCOMMONAREA (pAppRec^.m_pCommonArea^).SysFocusColor);

	with TView do
	begin
		Parent:=PLeft;
		Align :=alClient;
		FullExpand;
	end;
	with PFind do
	begin
		Parent:=PLeft;
		Align :=alClient;
		Hide;
	end;
	with PrgBar do
	begin
		Parent	:=StsBar;
		Top		:=6;
		Left	:=6;
		Hide;
	end;

	LBankName.Caption	:='';
	LBankName.Color		:=clWindow;
	LBranchName.Caption	:='';
	LBranchName.Color	:=clWindow;
	EBranchName.Text	:='';
	EBranchCode.Value	:=0;

	//ﾂﾘｰ全件をDef選択
	Tview.Items[1].Selected:=TRUE;

	bTreeSw:=TRUE;
	bFindSw:=not bTreeSw;

	BTree.Down	:=TRUE;
	BFindUp.Down:=TRUE;

	BTreeUp.Width:=0;
	BFindUp.Width:=0;

//<DSP>
	BorderStyle	:=	bsDialog;

	MjsFontResize(TJNTCRP008002_6F(Self),pointer(pAppRec));

	BorderStyle	:=	bsSizeable;
end;

//**********************************************************************
//		Component	:Form
//		Event		:Destroy
//		Process		:ﾌｫｰﾑ破棄時
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.FormDestroy(Sender: TObject);
var
	i:integer;
begin
	for i:=0 to TView.Items.Count-1 do
	begin
		if TView.Items[i].Data<>nil then
			dispose(TView.Items[i].Data);
	end;

	mqSelect.Free;
	dbM.CtlDBClose(ddCtlDB);
end;

////////////////////////////////////////////////////////////////////////
//		COMPONENT EVENT
////////////////////////////////////////////////////////////////////////
//**********************************************************************
//		Component	:TView
//		Event		:Enter
//		Process		:ﾂﾘｰﾋﾞｭｰ ﾌｫｰｶｽ取得
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.TViewEnter(Sender: TObject);
begin
	SetImeMode((Sender as TTreeView).Handle,imDisable);
end;

//**********************************************************************
//		Component	:BFind/BTree
//		Event		:Click
//		Process		:検索/ﾂﾘｰ切替 ｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.BFindClick(Sender: TObject);
begin
	if(Sender=BTree)then
	begin
		if bTreeSw then
			Exit;
	end
	else if(Sender=BFind)then
	begin
		if bFindSw then
			Exit;
	end;
	bTreeSw:=not bTreeSw;
	bFindSw:=not bFindSw;

	if bTreeSw then
		BTree.Down:=TRUE
	else
		BTreeUp.Down:=TRUE;

	if bFindSw then
		BFind.Down:=TRUE
	else
		BFindUp.Down:=TRUE;

	TView.Visible:=bTreeSw;
	PFind.Visible:=bFindSw;
end;

//**********************************************************************
//		Component	:BOK
//		Event		:Click
//		Process		:OK 押下/ｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.BOkClick(Sender: TObject);
begin
	//支店ｺｰﾄﾞ0は該当銀行が存在するかも?
	if(LBranchName.Caption='')then
		Exit;

	piBranchCode^:=EBranchCode.AsInteger;

	ModalResult	 :=mrOK;
end;

//**********************************************************************
//		Component	:BCancel
//		Event		:Click
//		Process		:ｷｬﾝｾﾙ 押下/ｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.BCancelClick(Sender: TObject);
begin
	ModalResult:=mrCancel;
end;

//**********************************************************************
//		Component	:TView
//		Event		:Change
//		Process		:ﾂﾘｰﾋﾞｭｰ 項目選択
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.TViewChange(Sender: TObject; Node: TTreeNode);
begin
	//支店ｺｰﾄﾞ
	EBranchCode.Value	:=0;
	//支店名称
	LBranchName.Caption	:='';

	//支店のぶら下がりのないﾉｰﾄﾞ
	with Node do
	begin
		if Data=nil then
			fnGrBranchSet(Node)
		else
			//ﾘｽﾄﾋﾞｭｰ変更
			with TTVInfo(Data^)do
				fnGrBranchSet(sWhere,sOrder);
	end;
end;

//**********************************************************************
//		Component	:BFidStart
//		Event		:Click
//		Process		:検索開始ｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.BFindStartClick(Sender: TObject);
var
	sWhere,sOrder:string;
begin

	//支店ｺｰﾄﾞ
	EBranchCode.Value	:=0;
	//支店名称
	LBranchName.Caption	:='';

	sWhere:='BankCD='+IntToStr(iBankCode);
	sWhere:=sWhere+#13#10'AND';
	sWhere:=sWhere+#13#10'BankOffice Like';
	sWhere:=sWhere+AnsiQuotedStr(EBranchName.Text+'%','''');

	sOrder:='BankOffice';

	fnGrBranchSet(sWhere,sOrder);
end;

//**********************************************************************
//		Process		:MdBranch
//		Event		:AfterScroll
//		Process		:ﾂﾘｰﾋﾞｭｰ初期化
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.MdBranchAfterScroll(DataSet: TDataSet);
begin
	with(DataSet as TdxMemData)do
	begin
		//内容[階層]
		if(IsEmpty)or
		  (FieldByName('BranchCode').AsInteger<0)then
		begin
			//支店ｺｰﾄﾞ
			EBranchCode.Value	:=0;
			//支店名称
			LBranchName.Caption	:='';
		end
		//内容[支店]
		else
		begin
			//支店ｺｰﾄﾞ
			EBranchCode.Value	:=FieldByName('BranchCode').AsInteger;
			//支店名称
			LBranchName.Caption	:=FieldByName('BranchName').AsString;
		end;
	end;
end;

//**********************************************************************
//		Process		:GrBranch
//		Event		:KeyDown
//		Process		:支店名ｸﾞﾘｯﾄﾞ ｷｰ押下
//		Name		:T.Aoki
//		Date		:04/02/19
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.GrBranchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	case Key of
		VK_RETURN:
		begin
			(Sender as TdxDBGrid).OnDblClick(Sender);
		end;
		VK_ESCAPE:
		begin
			if TView.Visible then
				MjsSetFocus(Self,TView.Name)
			else if PFind.Visible then
				MjsSetFocus(Self,EBranchName.Name);
		end;
	end;
end;

//**********************************************************************
//		Process		:GrBranch
//		Event		:DblClick
//		Process		:支店名ｸﾞﾘｯﾄﾞ Wｸﾘｯｸ
//		Name		:T.Aoki
//		Date		:04/02/19
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.GrBranchDblClick(Sender: TObject);
begin
	with(Sender as TdxDBGrid).DataSource.DataSet as TdxMemData do
	begin
		if(IsEmpty)then
			Exit;

		//支店
		if(FieldByName('BranchCode').AsInteger>=0)then
		begin
			piBranchCode^:=FieldByName('BranchCode').AsInteger;
			ModalResult	 :=mrOK;
		end
		//上位階層
		else if(FieldByName('TVItemIdx').AsInteger>=0)then
			TView.Items[FieldByName('TVItemIdx').AsInteger].Selected:=TRUE;
	end;
end;

////////////////////////////////////////////////////////////////////////
//		DETAIL
////////////////////////////////////////////////////////////////////////
//**********************************************************************
//		Process		:ﾂﾘｰﾋﾞｭｰ初期化
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.fnTViewIni;
const
	sCaption:widestring='アカサタナハマヤラワ';
	sKey:string='ｱｶｻﾀﾅﾊﾏﾔﾗﾜ';
var
	i:integer;
	nRoot,nChild,nKana:TTreeNode;
	p:^TTVInfo;
begin
	with TView do
	begin
		nRoot	:=Items.AddObject(nil,'銀行名',nil);
		with nRoot do
		begin
			ImageIndex	 :=0;
			SelectedIndex:=0;
		end;

		new(p);
		with p^do
		begin
			sWhere:='BankCD='+IntToStr(iBankCode);
			sOrder:='BankOfficeCD';
		end;
		nChild	:=Items.AddChildObject(nRoot,'全件',p);
		with nChild do
		begin
			ImageIndex	 :=1;
			SelectedIndex:=ImageIndex+1;
		end;

		nChild	:=Items.AddChildObject(nRoot,'ｶﾅ名称',nil);
		with nChild do
		begin
			ImageIndex	 :=3;
			SelectedIndex:=ImageIndex+1;
		end;
		for i:=0 to Length(sCaption)-1 do
		begin
			new(p);
			with p^do
			begin
				sWhere:='BankCD='+IntToStr(iBankCode);
				sWhere:=sWhere+#13#10'AND';
				sWhere:=sWhere+#13#10'(';

				if i<Length(sCaption)-1 then
				begin
					sWhere:=sWhere+#13#10'LEFT(KanaBankOffice,1)>=';
					sWhere:=sWhere+		 AnsiQuotedStr(Copy(sKey,i+1,1),'''');
					sWhere:=sWhere+#13#10'AND';
					sWhere:=sWhere+#13#10'LEFT(KanaBankOffice,1)<';
					sWhere:=sWhere+		 AnsiQuotedStr(Copy(sKey,i+2,1),'''');
				end
				else
				begin
					sWhere:=sWhere+#13#10'LEFT(KanaBankOffice,1)=';
					sWhere:=sWhere+		 AnsiQuotedStr('ﾜ','''');
					sWhere:=sWhere+#13#10'OR';
					sWhere:=sWhere+#13#10'LEFT(KanaBankOffice,1)=';
					sWhere:=sWhere+		 AnsiQuotedStr('ｦ','''');
					sWhere:=sWhere+#13#10'OR';
					sWhere:=sWhere+#13#10'LEFT(KanaBankOffice,1)=';
					sWhere:=sWhere+		 AnsiQuotedStr('ﾝ','''');
				end;
				sWhere:=sWhere+#13#10')';

				sOrder:='KanaBankOffice,BankOfficeCD';
			end;
			nKana:=Items.AddChildObject(nChild,Copy(sCaption,1+i,1)+'行',p);
			with nKana do
			begin
				ImageIndex	 :=3;
				SelectedIndex:=ImageIndex+1;
			end;
		end;

		new(p);
		with p^ do
		begin
			sWhere:=		 'BankCD='+IntToStr(iBankCode);
			sWhere:=sWhere+#13#10'AND';
			sWhere:=sWhere+#13#10'(NOT(';

			sWhere:=sWhere+#13#10'(';
			sWhere:=sWhere+#13#10'LEFT(KanaBankOffice,1)>=';
			sWhere:=sWhere+#13#10+AnsiQuotedStr('ｱ','''');
			sWhere:=sWhere+#13#10'AND';
			sWhere:=sWhere+#13#10'LEFT(KanaBankOffice,1)<';
			sWhere:=sWhere+#13#10+AnsiQuotedStr('ﾜ','''');
			sWhere:=sWhere+#13#10')';

			sWhere:=sWhere+#13#10'OR';
			sWhere:=sWhere+#13#10'LEFT(KanaBankOffice,1)=';
			sWhere:=sWhere+		 AnsiQuotedStr('ﾜ','''');
			sWhere:=sWhere+#13#10'OR';
			sWhere:=sWhere+#13#10'LEFT(KanaBankOffice,1)=';
			sWhere:=sWhere+		 AnsiQuotedStr('ｦ','''');
			sWhere:=sWhere+#13#10'OR';
			sWhere:=sWhere+#13#10'LEFT(KanaBankOffice,1)=';
			sWhere:=sWhere+		 AnsiQuotedStr('ﾝ','''');

			sWhere:=sWhere+#13#10'))';
			sOrder:='KanaBankOffice,BankOfficeCD';
		end;

		nKana:=Items.AddChildObject(nChild,'その他',p);
		with nKana do
		begin
			ImageIndex	 :=5;
			SelectedIndex:=ImageIndex+1;
		end;
	end;
end;

//**********************************************************************
//		Process		:ﾀﾞｲｱﾛｸﾞ呼出
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP008002_6F.DoDlg(p:pointer): TModalResult;
var
	sSQL:string;
begin
	piBranchCode:=p;

	//振込先銀行登録
	sSQL:=			 'SELECT';
	//銀行ｺｰﾄﾞ
	sSQL:=sSQL+#13#10' BankCD';
	sSQL:=sSQL+#13#10' AS';
	sSQL:=sSQL+#13#10' BankCode';
	//銀行名
	sSQL:=sSQL+#13#10',BankName';
	sSQL:=sSQL+#13#10' AS';
	sSQL:=sSQL+#13#10' BankName';
	//ｶﾅ銀行名
	sSQL:=sSQL+#13#10',KanaBankName';
	sSQL:=sSQL+#13#10' AS';
	sSQL:=sSQL+#13#10' BankKana';
	sSQL:=sSQL+#13#10'FROM';
	sSQL:=sSQL+#13#10' CMN_BANK';
	sSQL:=sSQL+#13#10'WHERE';
	sSQL:=sSQL+#13#10' BankCode=';
	sSQL:=sSQL+		 IntToStr(iBankCode);

	with mqSelect do
	begin
		Close;
		SQL.Clear;
		SQL.Add(sSQL);
		Open(TRUE);
		//共通情報未登録
		if IsEmpty then
		begin
			MjsMessageBox(Self,	'共通情報に登録されていません。',
							mjError,
							mjDefOk		);
			Result:=MrCancel;
			Exit;
		end;
		LBankCode.Caption	:=Format('%4.4u',[GetFld('BankCode').AsInteger]);
		LBankName.Caption	:=GetFld('BankName').AsString;
		Self.Caption		:=GetFld('BankName').AsString+'/支店検索ｴｸｽﾌﾟﾛｰﾗ';
		TView.Items[0].Text	:=GetFld('BankName').AsString;
	end;

	Result:=ShowModal;
end;

//**********************************************************************
//		Process		:ﾘｽﾄﾋﾞｭｰ初期化
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.fnGrBranchIni;
var
	fFld:TField;
	cClm:TdxTreeListColumn;
begin

//ｸﾞﾘｯﾄﾞ初期処理
	with GrBranch do
	begin
		DestroyColumns;		//ｶﾗﾑ破棄
		Bands.Clear;		//ﾊﾞﾝﾄﾞ破棄

		Bands.Add;

		ShowBands	:=FALSE;
		ShowHeader	:=TRUE;

		ShowGrid	:=FALSE;

		HighlightTextColor:=Font.Color;
		HideSelection:=TRUE;
		HideFocusRect:=TRUE;

		Options:=Options

				+[	egoRowSelect,
					egoLoadAllRecords	]

				-[	egoColumnMoving,
					egoCanInsert,
					egoCanDelete	];

		OptionsEx:=OptionsEx

				+[
					egoAutoSort	]

				-[		];

		KeyField:='RecId';
	end;

//ﾌｨｰﾙﾄﾞ作成

	with MdBranch do
	begin
		Close;
		Fields.Clear;
	end;

	fFld:=TAutoIncField.Create(Self);
	with(fFld as TAutoIncField)do
	begin
		FieldName	:='RecId';
		DataSet		:=MdBranch;
		Name		:=DataSet.Name+FieldName;
	end;

	fFld:=TStringField.Create(Self);
	with(fFld as TStringField)do
	begin
		FieldName	:='BranchName';
		DataSet		:=MdBranch;
		Name		:=DataSet.Name+FieldName;
		//共通情報の支店名MAX
		Size		:=30;
	end;

	fFld:=TStringField.Create(Self);
	with(fFld as TStringField)do
	begin
		FieldName	:='BankBranchUni';
		DataSet		:=MdBranch;
		Name		:=DataSet.Name+FieldName;
		Size		:=4+1+3;
	end;

	fFld:=TStringField.Create(Self);
	with(fFld as TStringField)do
	begin
		FieldName	:='BranchKana';
		DataSet		:=MdBranch;
		Name		:=DataSet.Name+FieldName;
		//共通情報の支店ｶﾅMAX
		Size		:=20;
	end;

	fFld:=TSmallIntField.Create(Self);
	with(fFld as TSmallIntField)do
	begin
		FieldName	:='BranchCode';
		DataSet		:=MdBranch;
		Name		:=DataSet.Name+FieldName;
	end;

	fFld:=TSmallIntField.Create(Self);
	with(fFld as TSmallIntField)do
	begin
		FieldName	:='TVItemIdx';
		DataSet		:=MdBranch;
		Name		:=DataSet.Name+FieldName;
	end;

//ｶﾗﾑ作成
	cClm:=GrBranch.CreateColumn(TdxDBGridColumn);
	with(cClm as TdxDBGridColumn)do
	begin
		Caption		:='店舗名称';
		Width		:=GrBranch.Canvas.TextWidth(StringOfChar('N',26+1));
		FieldName	:='BranchName';
	end;

	cClm:=GrBranch.CreateColumn(TdxDBGridColumn);
	with(cClm as TdxDBGridColumn)do
	begin
		Caption		:='コード';
		Width		:=GrBranch.Canvas.TextWidth(StringOfChar('N',4+1+3+1));
		FieldName	:='BankBranchUni';
	end;

	cClm:=GrBranch.CreateColumn(TdxDBGridColumn);
	with(cClm as TdxDBGridColumn)do
	begin
		Caption		:='ｶﾅ名称';
		Width		:=GrBranch.Canvas.TextWidth(StringOfChar('N',20+1));
		FieldName	:='BranchKana';
	end;

end;

//**********************************************************************
//		Process		:ﾘｽﾄﾋﾞｭｰ項目ｾｯﾄ(支店名)
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.fnGrBranchSet(sWhere,sOrder:string);
var
	sSQL:string;
begin
	PrgBar.Min		:=0;
	PrgBar.Position	:=0;
	PrgBar.Show;
	StsBar.Panels[1].Text:='検索中';

	//MemData<->ｸﾞﾘｯﾄﾞ間連結
	with MdBranch do
	begin
		AfterScroll:=nil;
		DisableControls;
		Close;
		Open;
	end;
	//ｶﾗﾑｸﾘｯｸのｿｰﾄを解除
	with GrBranch do
		OptionsEx:=OptionsEx-[egoAutoSort];

	try
		try
			//振込先銀行登録
			sSQL:=			 'SELECT';
			//銀行ｺｰﾄﾞ
			sSQL:=sSQL+#13#10' COUNT(';
			sSQL:=sSQL+#13#10' BankCD';
			sSQL:=sSQL+#13#10' )AS';
			sSQL:=sSQL+#13#10' CNT';

			sSQL:=sSQL+#13#10'FROM';
			sSQL:=sSQL+#13#10' CMN_BANK_OFFICE';

			sSQL:=sSQL+#13#10'WHERE';
			sSQL:=sSQL+#13#10+sWhere;

			with mqSelect do
			begin
				Close;
				SQL.Clear;
				SQL.Add(sSQL);
				Open(TRUE);
				if(GetFld('CNT').AsInteger=0)then
					Exit;

				PrgBar.Max:=GetFld('CNT').AsInteger;
			end;

			//振込先銀行登録
			sSQL:=			 'SELECT';
			//銀行ｺｰﾄﾞ
			sSQL:=sSQL+#13#10' BankCD';
			sSQL:=sSQL+#13#10' AS';
			sSQL:=sSQL+#13#10' BankCode';
			//支店ｺｰﾄﾞ
			sSQL:=sSQL+#13#10',BankOfficeCD';
			sSQL:=sSQL+#13#10' AS';
			sSQL:=sSQL+#13#10' BranchCode';
			//支店名
			sSQL:=sSQL+#13#10',BankOffice';
			sSQL:=sSQL+#13#10' AS';
			sSQL:=sSQL+#13#10' BranchName';
			//ｶﾅ支店名
			sSQL:=sSQL+#13#10',KanaBankOffice';
			sSQL:=sSQL+#13#10' AS';
			sSQL:=sSQL+#13#10' BranchKana';

			sSQL:=sSQL+#13#10'FROM';
			sSQL:=sSQL+#13#10' CMN_BANK_OFFICE';

			sSQL:=sSQL+#13#10'WHERE';
			sSQL:=sSQL+#13#10+sWhere;

			sSQL:=sSQL+#13#10'ORDER BY';
			sSQL:=sSQL+#13#10+sOrder;

			with mqSelect do
			begin
				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				Open(TRUE);
				if IsEmpty then
					Exit;
			end;

			with MdBranch do
			begin
				while not mqSelect.Eof do
				begin
					Append;

					FieldByName('BranchName').AsString	 :=mqSelect.GetFld('BranchName').AsString;
					FieldByName('BankBranchUni').AsString:=Format('%4.4u-%3.3u',
															  		[	mqSelect.GetFld('BankCode').AsInteger,
															  			mqSelect.GetFld('BranchCode').AsInteger]);
					FieldByName('BranchKana').AsString	 :=mqSelect.GetFld('BranchKana').AsString;

					FieldByName('BranchCode').AsInteger	 :=mqSelect.GetFld('BranchCode').AsInteger;
					FieldByName('TVItemIdx').AsInteger	 :=-1;

					Post;

					PrgBar.Position	:=RecordCount;
					mqSelect.Next;
				end;
			end;
		except
			raise Exception.Create('支店情報の取得に失敗しました');
		end;
	finally
		//ｶﾗﾑｿｰﾄ機能を戻す
		with GrBranch do
			OptionsEx:=OptionsEx+[egoAutoSort];

		//
		with MdBranch do
		begin
			EnableControls;
			AfterScroll:=MdBranchAfterScroll;

			//ﾘｽﾄﾋﾞｭｰ中身あり
			if(not IsEmpty)then
				//先頭項目を選択状態にする
				First;
		end;

		PrgBar.Hide;
		StsBar.Panels[1].Text:='';
	end;
end;

//**********************************************************************
//		Process		:ﾘｽﾄﾋﾞｭｰ項目ｾｯﾄ(上位階層)
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.fnGrBranchSet(Node: TTreeNode);
var
	i:integer;
begin

	//MemData<->ｸﾞﾘｯﾄﾞ間連結
	with MdBranch do
	begin
		AfterScroll:=nil;
		DisableControls;
		Close;
		Open;
	end;
	//ｶﾗﾑｸﾘｯｸのｿｰﾄを解除
	with GrBranch do
		OptionsEx:=OptionsEx-[egoAutoSort];

	try
		for i:=0 to TView.Items.Count-1 do
		begin
			if TView.Items[i].Parent<>Node then
				Continue;

			with MdBranch do
			begin
				Append;

				//下位ﾉｰﾄﾞのｱｲﾃﾑ名
				FieldByName('BranchName').AsString	:=TView.Items[i].Text;
				//支店ｺｰﾄﾞ(-1)で支店名以外と判定
				FieldByName('BranchCode').AsInteger	:=-1;
				//Enter/Dblｸﾘｯｸで選択するﾉｰﾄﾞ位置
				FieldByName('TVItemIdx').AsInteger	:=i;
				//他はNullのまま

				Post;
			end;
		end;
	finally
		//ｶﾗﾑｿｰﾄ機能を戻す
		with GrBranch do
			OptionsEx:=OptionsEx+[egoAutoSort];

		//
		with MdBranch do
		begin
			EnableControls;
			AfterScroll:=MdBranchAfterScroll;

			//ﾘｽﾄﾋﾞｭｰ中身あり
			if(not IsEmpty)then
				//先頭項目を選択状態にする
				First;
		end;
	end;
end;

//**********************************************************************
//		Process		:CM_ChildKeyﾒｯｾｰｼﾞ判定
//		Name		:T.Aoki
//		Date		:04/02/18
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP008002_6F.CMChildKey(var Key: TWMKey);
var
	sShift:TShiftState;
	sSQL:string;
begin
	sShift:=MJSKeyDataToShiftState(Key.KeyData);		// <KDS> MOD
	if Key.CharCode=VK_TAB then
	begin
		if(sShift=[ssShift])then
			MjsPrevCtrl(Self)
		else
			MjsNextCtrl(Self);
		Key.CharCode:=0;
		Abort;
	end;

	if(Screen.ActiveControl is TTreeView)then
	begin
		if(Key.CharCode=VK_ESCAPE)then
		begin
			MjsSetFocus(Self,EBranchCode.Name);
			Key.CharCode:=0;
			Abort;
		end;
		Exit;
	end;

	if(Screen.ActiveControl is TdxDBGrid)then
		Exit;

	if(Screen.ActiveControl=EBranchName)then
	begin
		if Key.CharCode=VK_ESCAPE then
		begin
			ModalResult:=mrCancel;
			Key.CharCode:=0;
			Abort;
		end;
	end;

	if(Screen.ActiveControl=EBranchCode)then
	begin
		case Key.CharCode of
			//TABでは支店名取得しない(≒共通銀行Dlg)
			VK_RETURN:
			begin

				//振込先銀行登録
				sSQL:=			 'SELECT';
				//支店ｺｰﾄﾞ
				sSQL:=sSQL+#13#10' BankOfficeCD';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchCode';
				//支店名
				sSQL:=sSQL+#13#10',BankOffice';
				sSQL:=sSQL+#13#10' AS';
				sSQL:=sSQL+#13#10' BranchName';

				sSQL:=sSQL+#13#10'FROM';
				sSQL:=sSQL+#13#10' CMN_BANK_OFFICE';

				sSQL:=sSQL+#13#10'WHERE';
				sSQL:=sSQL+#13#10' BankCD	   ='+IntToStr(iBankCode);
				sSQL:=sSQL+#13#10' AND';
				sSQL:=sSQL+#13#10' BankOfficeCD='+IntToStr(EBranchCode.AsInteger);

				with mqSelect do
				begin
					Close;
					SQL.Clear;
					SQL.Add(sSQL);
					try
						Open(TRUE);
						if IsEmpty then
							Exit;

						EBranchCode.Value	:=GetFld('BranchCode').AsInteger;
						LBranchName.Caption	:=GetFld('BranchName').AsString;
					except
						raise Exception.Create('支店名の取得に失敗しました');
					end;
				end;
				//取得できたら
				//OKﾎﾞﾀﾝへ移動
				MjsSetFocus(Self,BOk.Name);
				Key.CharCode:=0;
				Abort;
			end;
			VK_ESCAPE:
			begin
				ModalResult:=mrCancel;
				Key.CharCode:=0;
				Abort;
			end;
		end;
	end;

	case Key.CharCode of
		VK_RETURN:
		begin
			if(not(Screen.ActiveControl is TBitBtn))then
			begin
				MjsNextCtrl(Self);
				Key.CharCode:=0;
				Abort;
			end;
		end;
		VK_RIGHT:
		begin
			if(Screen.ActiveControl is TMTxtEdit)and
			  (not MjsChkCurEnd(Screen.ActiveControl as TMTxtEdit))then
				Exit;

			MjsNextCtrl(Self);
			Key.CharCode:=0;
			Abort;
		end;
		VK_LEFT:
		begin
			if(Screen.ActiveControl is TMTxtEdit)and
			  (not MjsChkCurTop(Screen.ActiveControl as TMTxtEdit))then
				Exit;

			MjsPrevCtrl(Self);
			Key.CharCode:=0;
			Abort;
		end;
		VK_DOWN:
		begin
			MjsNextCtrl(Self);
			Key.CharCode:=0;
			Abort;
		end;
		VK_UP:
		begin
			MjsPrevCtrl(Self);
			Key.CharCode:=0;
			Abort;
		end;
	end;

	inherited;
end;

end.
