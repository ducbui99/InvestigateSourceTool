//**********************************************************************
//				:	MJSFX
//	Comment		:	担当者検索Exp
//	Form Name	:	HAPSTAFFExpF
//	Create By	:	H.Itahana(Buntechno)
//	Create Date	:	05/09/16
//	History		:	2007/07/11 H.Takaishi(TAKUMI)
//				:	・担当者IDが未登録でも選択可に					<2007-07-11>
//				:	2012/08/20	Y.Kondo
//				:	担当者管理変更対応
//**********************************************************************
unit HAPSTAFFExpU;

interface

uses
	Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls,
	VCL.Forms, VCL.Dialogs, Menus, Math,
	VCL.ExtCtrls, VCL.StdCtrls, ComCtrls, FireDAC.Comp.Client, VCL.ImgList, ToolWin, Buttons,
	MJSEdits, MJSLabel, MjsDateCtrl, MjsKeyDataState, MJSSpeedButton,
	MJSStatusBar, MJSBitBtn, MJSPanel,
	MJSQuery, MjsDBModuleU, MjsCommon2U, MJSTreeView;

type
{$I ActionInterface.inc}
  TDSSortOrder = (dssort_asc, dssort_desc);

  // <2007-07-11>
  TTantoInfo = record
	NCode	: Int64;
	LoginID : String;
	Name	: String;
	Birth	: TDate;
  end;
  PTantoInfo = ^TTantoInfo;

  THapSTAFFExpF = class(TForm)
	MPanel2: TMPanel;
	BOk: TMBitBtn;
	BCancel: TMBitBtn;
	Splitter: TSplitter;
	PTool: TMPanel;
	BFind: TMSpeedButton;
	BKana: TMSpeedButton;
	BFindUp: TMSpeedButton;
	BKanaUp: TMSpeedButton;
	MPanel1: TMPanel;
	LName: TMLabel;
	LView: TListView;
	SmallIcons: TImageList;
	TreeIcons: TImageList;
	PTree: TMPanel;
	PFind: TMPanel;
	MLabel2: TMLabel;
	ERenso: TMTxtEdit;
	BFindStart: TMBitBtn;
	TView: TMTreeView;
	StatusBar: TMStatusBar;
	MLabel1: TMLabel;
	ECode_ID: TMTxtEdit;
	procedure FormDestroy(Sender: TObject);
	procedure FormCreate(Sender: TObject);
	procedure BCancelClick(Sender: TObject);
	procedure BOkClick(Sender: TObject);
	procedure LViewDblClick(Sender: TObject);
	procedure LViewKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure fnToolBtnClick(Sender: TObject);
	procedure BFindStartClick(Sender: TObject);
	procedure TViewChange(Sender: TObject; Node: TTreeNode);
	procedure LViewSelectItem(Sender: TObject; Item: TListItem;
	  Selected: Boolean);
	procedure LViewColumnClick(Sender: TObject;Column: TListColumn);
	procedure LViewCompare(Sender: TObject; Item1, Item2: TListItem;
				  Data: Integer; var Compare: Integer);
	procedure FormShow(Sender: TObject);
	procedure TViewEnter(Sender: TObject);
	procedure LViewEnter(Sender: TObject);
	procedure LViewDeletion(Sender: TObject; Item: TListItem);
  private
	{ Private 宣言 }
	pAppRec		:^TMjsAppRecord;
	MDBModule	: TMDataModuleF;
	ddMjsDB		: TFDConnection;
	mqMjs		: TMQuery;

	BFindFlg,
	BKanaFlg	: Boolean;

	m_nSortOrder: TDSSortOrder;		//ｶﾗﾑｸﾘｯｸ時のｿｰﾄ

	m_TantoInfo : TTantoInfo;					// <2007-07-11>
	m_iYearKbn	: ShortInt;						// <2007-07-11>

	m_iDispMode : ShortInt;

	procedure fnFormIni;
	procedure fnLViewSet(sCondition:string='';sOrder:string='');
	function fnSTAFFQueryOpen(ACondition:string='';AOrder:string=''):Boolean;
	procedure fnSelectFromLView(Sender:TObject;bDClick:Boolean);
	procedure fnTViewIni;
	procedure fnLviewColumnSet(wColumnType: Word);
	function fnGetFormatDate(d: TDate): String;	// <2007-07-11>

  public
	{ Public 宣言 }
	constructor CreateForm(pRec: pointer; pForm : TComponent; iDispMode: Shortint);
	function fnRetTantoInfo: PTantoInfo;		// <2007-07-11>

  protected
	procedure CMChildKey(var Msg:TWMKey);message CM_ChildKey;
  end;

function fnGetColumnWidth(	fOwner:TComponent;
							dbM:TMDataModuleF;
							ddCopDB:TFDConnection;
							sTableName,
							sFieldName:string;
							iFixWidth:integer		):integer;

//var
//  HapSTAFFExpF: THapSTAFFExpF;

implementation
uses
	HAP000010StaffSelDlgU,			// <2007-07-11>
	HapMsgU,MjsDispCtrl,MjsCommonU;

const
	arrItemCaption:array[0..3]of string=('ﾛｸﾞｲﾝID','簡略名称','連想','生年月日');	// <2007-07-11>
	arrItemWidth:array[0..3]of integer=(120,100,100,85);							// <2007-07-11>

	arrTView:array[0..10]of string=(
								'ア行',
								'カ行',
								'サ行',
								'タ行',
								'ナ行',
								'ハ行',
								'マ行',
								'ヤ行',
								'ラ行',
								'ワ行',
								'その他'
								);

	arrKeyKana:array[0..10]of string=(
								'ｱ',
								'ｶ',
								'ｻ',
								'ﾀ',
								'ﾅ',
								'ﾊ',
								'ﾏ',
								'ﾔ',
								'ﾗ',
								'ﾜ',
								''
								);

	_HEIGHT_=480;
	_WIDTH_	=600;

	// <2007-07-11>
	COLUMN_COUNT	= 4;

{$R *.DFM}

{ THapSTAFFExpF }
//**********************************************************************
//		Component	:Form
//		Event		:Construct
//		Proccess	:ﾌｫｰﾑｺﾝｽﾄﾗｸﾀ
//		Parameter	:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
constructor THapSTAFFExpF.CreateForm(pRec: pointer; pForm : TComponent; iDispMode:ShortInt);
var
	rcMsg	: TMjsMsgRec;
begin

	pAppRec		:= pRec;
	MDBModule	:= TMDataModuleF(pAppRec^.m_pDBModule^);

	m_iDispMode := iDispMode;

	try
		if m_iDispMode = 1 then
			ddMjsDB:=MDBModule.CopDBOpen(0,pAppRec^.m_iCorpID)
		else
			ddMjsDB:=MDBModule.CtlDBOpen;
	except
		GetMsg(rcMsg,1,1);
		with rcMsg do
			MjsMessageBoxEx(self,sMsg,sTitle,IconType,BtnType,BtnDef,LogType);
		raise Exception.Create('DBｵｰﾌﾟﾝ失敗');
	end;

	try
		mqMjs:=TMQuery.Create(Self);
	except
		if m_iDispMode = 1 then
			MDBModule.CopDBClose(ddMjsDB)
		else
			MDBModule.CTLDBClose(ddMjsDB);

		raise Exception.Create('ｸｴﾘ生成失敗');
	end;
	MDBModule.SetDBinfoToQuery(ddMjsDB,mqMjs);

	m_iYearKbn := THAP000010StaffSelDlgF(pForm).m_iYearKbn;

	inherited Create(pForm);
end;

//**********************************************************************
//		Component	:Form
//		Event		:Destroy
//		Proccess	:ﾌｫｰﾑ破棄
//		Parameter	:
//		History		:
//					:
//**********************************************************************
procedure THapSTAFFExpF.FormCreate(Sender: TObject);
begin
	fnFormIni;
	fnTViewIni;

//解像度対応
	BorderStyle	:= bsDialog;
	MjsFontResize(THapSTAFFExpF(Self), Pointer(pAppRec));	// ﾌｫﾝﾄ･ｻｲｽﾞの変更
	BorderStyle	:= bsSizeable;

	BFindFlg	:= False;
	BKanaFlg	:= False;

	ECode_ID.Text	:='';
	LName.Caption	:='';

	m_nSortOrder := dssort_asc;		//ﾘｽﾄﾀｲﾄﾙ部ｿｰﾄ順
end;

//**********************************************************************
//		Component	:Form
//		Event		:Destroy
//		Proccess	:ﾌｫｰﾑ破棄
//		Parameter	:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.FormDestroy(Sender: TObject);
begin
	mqMjs.Free;

	if m_iDispMode = 1 then
		MDBModule.CopDBClose(ddMjsDB)
	else
		MDBModule.CTLDBClose(ddMjsDB);
end;

//**********************************************************************
//		Proccess	:ﾌｫｰﾑ初期設定
//		Parameter	:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.fnFormIni;
var
	i:integer;
begin

	//表示色/ﾌｫｰｶｽ色
	MjsColorChange(	THapSTAFFExpF(Self),	//m_pChildFormはｴﾗｰ(FormCreateｲﾍﾞﾝﾄ終了でｾｯﾄ)
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysColorB,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysColorD,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysBaseColorB,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysBaseColorD,
					rcCOMMONAREA(pAppRec^.m_pCommonArea^).SysFocusColor
					);

	//ID欄ｸﾘｱ
	LName.Caption		:= '';
	//ID欄桁数
	ECode_ID.MaxLength	:= 20;

	//ﾂｰﾙﾎﾞﾀﾝ
	BFind.GroupIndex	:= 1;
	BFindUp.GroupIndex	:= 1;
	BKana.GroupIndex	:= 2;
	BKanaUp.GroupIndex	:= 2;

	BFindUp.Width	:= 0;
	BKanaUp.Width	:= 0;

	BFindUp.Down	:= True;
	BKanaUp.Down	:= True;

	//ﾂﾘｰ/検索
	//ﾂﾘｰ/検索
	PTree.Align		:= alLeft;
	PFind.Align		:= alClient;
	TView.Align		:= alClient;
	Splitter.Left	:= PTree.Left+PTree.Width;
	Splitter.Width	:= 4;	//0だと機能しない
	PFind.Hide;
	TView.Hide;

	//ﾘｽﾄﾋﾞｭｰ
	LView.Align		:= alClient;
	LView.ViewStyle	:= vsReport;
	LView.RowSelect	:= True;

	//ﾌｫｰﾑ
	Caption:='担当者 検索エクスプローラー';//<210202>Upd 長音対応
	ClientHeight:= _HEIGHT_;
	ClientWidth	:= _WIDTH_;
	BorderStyle	:= bsSizeable;
	Position	:= poScreenCenter;

	for i:=0 to ComponentCount-1 do
	begin
		if Components[i] is TMNumEdit then
			(Components[i] as TMNumEdit).Value:=0;
		if Components[i] is TMTxtEdit then
			(Components[i] as TMTxtEdit).Text:='';
		if(Components[i] is TLabel)and(Copy((Components[i] as TLabel).Name,1,1)='L') then
			(Components[i] as TLabel).Caption:='';
	end;

	MPanel1.Visible	:= True;
	arrItemWidth[0]	:= fnGetColumnWidth(	THapSTAFFExpF(Self),
											MDBModule,
											ddMjsDB,
											'MOS_OFFICE_STAFF',
											'LoginID',
											arrItemWidth[0]);
end;

//**********************************************************************
//		Proccess	:ﾘｽﾄﾋﾞｭｰ初期表示
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.fnLViewSet(sCondition,sOrder:string);
var
	i		: integer;
	pInfo	: PTantoInfo;	// <2007-07-11>
begin

	try
		with Lview do
		begin
			i:=0;
			//ﾃﾞｰﾀｾｯﾄOpen
			if not fnSTAFFQueryOpen(sCondition,sOrder) then
				Exit;

			with mqMjs do
			begin
				while not Eof do
				begin
					Items.Add;
					//コード
					Items[i].Caption:=GetFld('LoginID').AsString;
					//簡略
					Items[i].SubItems.Add(GetFld('SimpleName').AsString);
					//検索名
					Items[i].SubItems.Add(GetFld('Renso').AsString);
					// <2007-07-11>
					//生年月日
					Items[i].SubItems.Add(fnGetFormatDate(GetFld('Birth').AsDateTime));
					//担当者内部コード
					New(pInfo);
					try
						pInfo.NCode		:= Trunc(GetFld('NCode').AsFloat);
						pInfo.LoginID	:= GetFld('LoginID').AsString;
						pInfo.Name		:= GetFld('SimpleName').AsString;
						pInfo.Birth		:= GetFld('Birth').AsDateTime;
					except
						Dispose(pInfo);
						raise;
					end;
					Items[i].Data := pInfo;

					Items[i].ImageIndex:=4;
					Inc(i);
					Next;
				end;
			end;

		end;

	finally
	end;
end;

//**********************************************************************
//		Proccess	:ｸｴﾘ ｵｰﾌﾟﾝ
//		Parameter	:sCondition	:検索条件
//					:sOrder		:並び順
//		Return		:
//		History		:
//					:
//**********************************************************************
function THapSTAFFExpF.fnSTAFFQueryOpen(ACondition,AOrder:string):Boolean;
var
	sSQL	: Ansistring;
begin
	Result:=False;

	with mqMjs do
	begin

		sSQL:=	'SELECT'
		+#13#10+' LoginID'
		+#13#10+',SimpleName'
		+#13#10+',Renso'
		+#13#10+',NCode'							// <2007-07-11>
		+#13#10+',Birth'							// <2007-07-11>
		+#13#10+',ISNULL(FixFlg,0) AS FixFlag'
		+#13#10+'FROM MOS_OFFICE_STAFF'
// <2007-07-11>
//		+#13#10+'WHERE LoginID <> :hID1'
//		+#13#10+'AND LoginID <> :hID2'
//		+#13#10+'AND SyokuchiKbn=0'
		+#13#10+'WHERE SyokuchiKbn=0'
		+#13#10+'AND FixFlag=0'
		+#13#10+'AND RDelKbn=0'
		+#13#10+'AND TEndDate >= :hDate';


		Close;
		SQL.Clear;
		SQL.Add(sSQL);

		if(Length(Trim(ACondition))<>0)then
		begin
			SQL.Add('AND');
			SQL.Add(ACondition);
		end;

		SQL.Add('ORDER BY NCode');

// <2007-07-11>
//		SetFld('hID1').AsString		:= '';
//		SetFld('hID2').AsString		:= ' ';
		SetFld('hDate').AsDateTime	:= Now;

		try
			Open(True);

			if Eof then
				Exit;
		except
			raise Exception.Create('担当者 取得失敗');
		end;
	end;

	Result:=True;
end;

//**********************************************************************
//		Component	:BOk
//		Event		:Click
//		Proccess	:OKﾎﾞﾀﾝ押下
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.BOkClick(Sender: TObject);
var
	sCondition	: string;
begin
	if ECode_ID.Text = '' then
	begin
		// <2007-07-11>
		if (m_TantoInfo.NCode > 0) and (m_TantoInfo.LoginID = '') then
		begin
			ModalResult := mrOk;
		end;

		Exit;
	end;

	sCondition:='LoginID='+ ''''+ ECode_ID.Text+'''';

	if not fnSTAFFQueryOpen(sCondition) then
		Exit;

	// <2007-07-11>
	with m_TantoInfo do
	begin
		NCode	:= Trunc(mqMjs.GetFld('NCode').AsFloat);
		LoginID	:= mqMjs.GetFld('LoginID').AsString;
		Name	:= mqMjs.GetFld('SimpleName').AsString;
		Birth	:= mqMjs.GetFld('Birth').AsDateTime;
	end;

	ModalResult := mrOK;
end;

//**********************************************************************
//		Component	:BCancel
//		Event		:Click
//		Proccess	:ｷｬﾝｾﾙﾎﾞﾀﾝ押下
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.BCancelClick(Sender: TObject);
begin
	ModalResult := mrCancel;
end;

//**********************************************************************
//		Component	:LView
//		Event		:WClick
//		Proccess	:ﾘｽﾄﾋﾞｭｰ ｸﾘｯｸ
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.LViewDblClick(Sender: TObject);
begin
	fnSelectFromLView(Sender,True);
end;

//**********************************************************************
//		Proccess	:ﾘｽﾄﾋﾞｭｰから社員選択
//		Parameter	:
//		Return		:
//		History		:
//					:
//**********************************************************************
procedure THapSTAFFExpF.fnSelectFromLView(Sender:TObject;bDClick:Boolean);
var
	i	: integer;
begin

	with TListView(Sender) do
	begin
		if Selected=nil then
			Exit;

		if Columns.Count<COLUMN_COUNT then	//表示状態でない	// <2007-07-11>
		begin
			for i:=0 to TView.Items.Count-1 do
			begin
				if TView.Items[i].Text=Selected.Caption then
					break;
			end;
			if i<TView.Items.Count then
				TView.items[i].Selected:=True;

			if Items.Count>0 then	//項目
			begin
				Items[0].Selected	:=True;
				Items[0].Focused	:=True;
			end
			else
				MjsSetFocus(Self,TView.Name);

			Exit;
		end;

		m_TantoInfo := TTantoInfo(Selected.Data^);
		ModalResult	:= mrOK;
	end;
end;

//**********************************************************************
//		Component	:Form
//		Event		:KeyMessage
//		Proccess	:ｷｰﾒｯｾｰｼﾞ判定
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.CMChildKey(var Msg: TWMKey);
var
	sShift	: TShiftState;
	ACtl	: TWinControl;
	pKey	:^Word;
	sCondition:string;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	sShift	:= MjsKeyDataToShiftState(Msg.KeyData);
	ACtl	:= Screen.ActiveControl;

	pKey:=@Msg.CharCode;

	//[ESCAPE]
	if pKey^=VK_ESCAPE then
		ModalResult := mrCancel;

	//[Shift]+[TAB]
	if (pKey^=VK_TAB)and(sShift=[ssSHift]) then
	begin
		MjsPrevCtrl(Self);
		pKey^:=0;
		Abort;
	end;

	//No
	if ACtl=ECode_ID then
	begin
		case pKey^ of
			VK_RETURN:
			begin
				sCondition:=''''+ ECode_ID.Text+'''';

				if(ECode_ID.Text='')then	//"0"[TAB]/[Enter]
				begin
					LName.Caption:='';
					MjsNextCtrl(Self);

					// <2007-07-11>
					with m_TantoInfo do
					begin
						NCode	:= 0;
						LoginID	:= '';
						Name	:= '';
						Birth	:= 0;
					end;
				end
				else if fnSTAFFQueryOpen('LogInID='+sCondition) then
				begin
					LName.Caption:=mqMjs.GetFld('SimpleName').AsString;

					// <2007-07-11>
					with m_TantoInfo do
					begin
						NCode	:= Trunc(mqMjs.GetFld('NCode').AsFloat);
						LoginID	:= mqMjs.GetFld('LoginID').AsString;
						Name	:= mqMjs.GetFld('SimpleName').AsString;
						Birth	:= mqMjs.GetFld('Birth').AsDateTime;
					end;

					ModalResult := mrOK;
				end
				else
				begin
					LName.Caption:='';

					// <2007-07-11>
					with m_TantoInfo do
					begin
						NCode	:= 0;
						LoginID	:= '';
						Name	:= '';
						Birth	:= 0;
					end;
				end;
				pKey^:=0;
				Abort;
			end;
		end;
	end;

	//複数行ｺﾝﾎﾟｰﾈﾝﾄ
	if ACtl is TListView then
		Exit;
	if ACtl is TMTreeView then
		Exit;

	//ﾃｷｽﾄ/日付
	if (ACtl is TCustomEdit)and(not(ACtl is TMNumEdit)) then
	begin
		if not(MjsChkCurTop(ACtl)) and (pKey^=VK_LEFT) then
			Exit;
		if not(MjsChkCurEnd(ACtl)) and (pKey^=VK_RIGHT) then
			Exit;
	end;

	//終端ｷｰ判定
	case pKey^ of
		VK_UP,
		VK_LEFT:
		begin
			MjsPrevCtrl(Self);
			pKey^:=0;
			Abort;
		end;
		VK_RETURN,
		VK_DOWN,
		VK_RIGHT:
		begin
			if(pKey^=VK_RETURN)and(ACtl is TMbitBtn)then
				Exit;
			MjsNextCtrl(Self);
			pKey^:=0;
			Abort;
		end;
	end;

	inherited;
end;

//**********************************************************************
//		Component	:LView
//		Event		:KeyDown
//		Proccess	:ﾘｽﾄﾋﾞｭｰ ｷｰDown
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.LViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	case Key of
		VK_RETURN:		//確定
			fnSelectFromLView(Sender,False);

		VK_BACK:
		begin
			if not((Sender=LView)and TView.Visible And (TView.Selected.Parent<>nil)) then
				Exit;

			TView.Selected.Parent.Selected:=True;
		end;
	end;
end;

//**********************************************************************
//		Component	:BFind/BKana/BSystem
//		Event		:Click
//		Proccess	:処理ﾎﾞﾀﾝｸﾘｯｸ
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.fnToolBtnClick(Sender:TObject);
begin
	if Sender=BFind then
	begin
		if BFindFlg then
			Exit;

		BFindFlg	:= BFindFlg xor True;
		BKanaFlg	:= False;
	end;
	if Sender=BKana then
	begin
		if BKanaFlg then
			Exit;

		BFindFlg	:= False;
		BKanaFlg	:= BKanaFlg xor True;
	end;

	//ﾎﾞﾀﾝ押下状態
	if BFindFlg then
		BFind.Down	:= True
	else
		BFindUp.Down:= True;
	if BKanaFlg then
		BKana.Down	:= True
	else
		BKanaUp.Down:= True;

	PFind.Visible	:= BFindFlg;
	TView.Visible	:= BKanaFlg;


	if BFindFlg then			//検索
	begin
		ECode_ID.Text	:= '';
		LName.Caption	:= '';

		with LView do
		begin
			Columns.Clear;
			Items.Clear;
			fnLViewColumnSet(0);
		end;

		BOk.Enabled	:= False;

		ERenso.Text := '';

		MjsSetFocus(Self,ERenso.Name);
	end
	else if BKanaFlg then		//ｶﾅﾂﾘｰ
	begin
		//Changeｲﾍﾞﾝﾄを発生させる為にﾂﾘｰﾉｰﾄﾞのﾙｰﾄを一旦選択
		//ただし,ﾘｽﾄﾋﾞｭｰの内容も合わせて変更されるのでｲﾍﾞﾝﾄとの関連を切断
		TView.OnChange:=nil;

		TView.Items[0].Selected	:=True;
		TView.Items[0].Focused	:=True;

		//元に戻す
		TView.OnChange:=TViewChange;

		//ﾃﾞﾌｫﾙﾄ[全件]
		TView.Items[1].Selected	:=True;
		TView.Items[1].Focused	:=True;

		MjsSetFocus(Self,TView.Name);
		TView.FullExpand;
	end;

end;

//**********************************************************************
//		Component	:BFindStart
//		Event		:Click
//		Proccess	:検索開始ﾎﾞﾀﾝ押下
//		Parameter	:
//		Return		:
//		History		:
//					:
//**********************************************************************
procedure THapSTAFFExpF.BFindStartClick(Sender: TObject);
var
	sCondition	: string;
begin
	//ﾘｽﾄﾋﾞｭｰ描画停止
	SendMessage(LView.Handle, WM_SETREDRAW, 0, 0);
	try
		LView.Items.Clear;

		ECode_ID.Text	:='';
		LName.Caption	:='';

		sCondition:='';
		sCondition:=AnsiQuotedStr(ERenso.Text+'%','''');
		sCondition:='Renso Like'+sCondition;

		fnLViewSet(sCondition,'Renso');

		BOk.Enabled	:=(LView.Items.Count>0);

		with LView do
		begin
			if Items.Count=0 then
			begin
				MjsSetFocus(Self,ERenso.Name);
				Exit;
			end;

			Items[0].Selected	:=True;
			Items[0].Focused	:=True;
		end;

		MjsSetFocus(Self,LView.Name);

	finally
		//ﾘｽﾄﾋﾞｭｰ描画再開
		SendMessage(LView.Handle, WM_SETREDRAW, 1, 0);
	end;
end;

//**********************************************************************
//		Component	:TView
//		Proccess	:ｶﾅﾂﾘｰ作成
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.fnTViewIni;
var
	i		: integer;
	PNode,
	CNode	: TTreeNode;
begin

	with TView do
	begin
		OnChange:=nil;		//Changeｲﾍﾞﾝﾄ関数割当をoff

		for i:=0 to Items.Count do	//<-設計時分もｸﾘｱ
			Items[i].Delete;

		PNode:=Items.Add(nil,'担当者');			//第一階層
		PNode.ImageIndex	:=0;
		PNode.SelectedIndex	:=0;

		//全件
		CNode:=Items.AddChild(PNode,'全件');	//第二階層
		CNode.ImageIndex	:=5;
		CNode.SelectedIndex	:=6;

		//ﾌﾘｶﾞﾅ
		PNode:=Items.AddChild(PNode,'フリガナ');//第二階層
		PNode.ImageIndex	:=1;
		PNode.SelectedIndex	:=2;
		//第三階層
		for i:=0 to Length(arrTView)-1 do
		begin
			CNode:=Items.AddChild(PNode,arrTView[i]);

			//ｱ～ﾜ
			if i<>Length(arrTView)-1 then
			begin
				CNode.ImageIndex	:=1;
				CNode.SelectedIndex	:=2;
			end
			//その他
			else
			begin
				CNode.ImageIndex	:=3;
				CNode.SelectedIndex	:=4;
			end;
		end;
		OnChange:=TViewChange;	//Changeｲﾍﾞﾝﾄ関数割当
	end;
end;

//**********************************************************************
//		Component	:TView
//		Event		:Change
//		Proccess	:ｶﾅﾂﾘｰ状態変更
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.TViewChange(Sender: TObject; Node: TTreeNode);
var
	i		: integer;
	sCondition:string;
begin

	ECode_ID.Text	:='';
	LName.Caption	:='';

	// <2007-07-11>
	with m_TantoInfo do
	begin
		NCode	:= 0;
		LoginID	:= '';
		Name	:= '';
		Birth	:= 0;
	end;

//初期処理 無視(例外発生)
//動的ﾂﾘｰ作成でもChangeｲﾍﾞﾝﾄ発生

	//ﾘｽﾄﾋﾞｭｰ描画停止
	SendMessage(LView.Handle, WM_SETREDRAW, 0, 0);
	try

		with LView do
		begin
			Columns.Clear;
			Items.Clear;
		end;

		with TView.Selected do
		begin
			case Level of					//階層別
				0,1:
				begin
					if Text='全件' then
					begin
						fnLViewColumnSet(0);
						fnLViewSet;

						Exit;
					end;

					fnLViewColumnSet(1);
					for i:=0 to Node.Count-1 do
					begin
						Lview.Items.Add;
						with Lview.Items.Item[i] do
						begin
							Caption	:=Node.item[i].Text;
							if Level=0 then	//最上位
							begin
								if i=0 then	//ALL
									ImageIndex:=3
								else
									ImageIndex:=0
							end
							else			//フリガナ
							begin
								if i=Node.Count-1 then	//その他
									ImageIndex:=1
								else		//ｱ-ﾜ
									ImageIndex:=0;
							end;
						end;
					end;
					Lview.Items[0].Selected	:=True;
					Lview.Items[0].Focused	:=True;
				end;
				2:
				begin
					fnLViewColumnSet(0);
					sCondition:='';
					case Index of
						Length(arrTView)-2:		//ﾜ行(ﾜ+ｦ+ﾝ)
						begin
							sCondition:='(Renso LIKE '+''''+'ﾜ%'+''')';
							sCondition:=sCondition+' OR ';
							sCondition:=sCondition+'(Renso LIKE '+''''+'ｦ%'+''')';
							sCondition:=sCondition+' OR ';
							sCondition:=sCondition+'(Renso LIKE '+''''+'ﾝ%'+''')';
							fnLViewSet(sCondition,'Renso');
						end;
						Length(arrTView)-1:		//その他
						begin
							sCondition:='NOT(';

							sCondition:=sCondition+'(Renso>='+''''+'ｱ'+'''';
							sCondition:=sCondition+' AND ';
							sCondition:=sCondition+'Renso<'+''''+'ﾜ'+''')';

							sCondition:=sCondition+' OR ';
							sCondition:=sCondition+'(Renso LIKE '+''''+'ﾜ%'+''')';

							sCondition:=sCondition+' OR ';
							sCondition:=sCondition+'(Renso LIKE '+''''+'ｦ%'+''')';

							sCondition:=sCondition+' OR ';
							sCondition:=sCondition+'(Renso LIKE '+''''+'ﾝ%'+''')';

							sCondition:=sCondition+')';
							fnLViewSet(sCondition,'Renso');
						end;
						else						//ｱ-ﾗ
						begin
							sCondition:='(Renso>=';
							sCondition:=sCondition+''''+arrKeyKana[Index]+'''';
							sCondition:=sCondition+')AND(Renso<';
							sCondition:=sCondition+''''+arrKeyKana[Index+1]+''')';
							fnLViewSet(sCondition,'Renso');
						end;
					end;
				end;
			end;
		end;

	finally

		with LView do
		begin
			if Items.Count>0 then
			begin
				Items[0].Selected	:=True;
				Items[0].Focused	:=True;
			end;

			BOk.Enabled		:=	(Items.Count>0)and
								(Columns.Count>=COLUMN_COUNT);	// <2007-07-11>
		end;

		//描画再開
		SendMessage(LView.Handle, WM_SETREDRAW, 1, 0);
		LView.Refresh;
	end;
end;

//**********************************************************************
//		Component	:LView
//		Evwnt		:SelectItem
//		Proccess	:ﾘｽﾄﾋﾞｭｰ ｱｲﾃﾑ選択
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.LViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
	with LView do
	begin
		if Columns.Count<COLUMN_COUNT then	//ID以外			// <2007-07-11>
			Exit;

		//ID欄へ
		ECode_ID.Text	:=Item.Caption;
		LName.Caption	:=Item.SubItems[0];

		// <2007-07-11>
		if Item.Data <> nil then
		begin
			m_TantoInfo	:=TTantoInfo(Item.Data^);
		end;
	end;
end;

//**********************************************************************
//		Component	:LView
//		Event		:ColumnClick
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.LViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
	{ クリックされたカラムのデータに従って、ソートする }
	TListView(Sender).CustomSort(nil , Column.Index+1);

	{ ソート順序を逆にする }
	if m_nSortOrder = dssort_asc then
		m_nSortOrder := dssort_desc
	else
		m_nSortOrder := dssort_asc
end;

//**********************************************************************
//		Component	:LView
//		Event		:Compare
//		Proccess	:ﾘｽﾄﾋﾞｭｰ 比較ｶﾗﾑClick
//		Parameter	:
//		Return		:
//		History		:200X/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.LViewCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
	value1,
	value2	: String;

begin
	{ リスト項目データの比較を行う }
	if Data = 0 then
		Exit;

	if Data = 1 then
	begin
		value1 := Item1.Caption;
		value2 := Item2.Caption
	end
	else
	begin
		value1 := Item1.SubItems[Data-2];
		value2 := Item2.SubItems[Data-2]
	end;

	if value1 = value2 then
		Compare := 0
	else
	begin
		if value1 > value2 then
			Compare := 1
		else
			Compare := -1;

		{ 降順なら結果を反転する }
		if m_nSortOrder = dssort_desc then
			Compare := Compare * -1
	end
end;

//**********************************************************************
//		Component	:Form
//		Event		:Show
//		Proccess	:ﾌｫｰﾑ表示
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.FormShow(Sender: TObject);
begin
	BKana.Click;						//ﾂﾘｰ表示
	TView.Items[1].Selected:=True;		//全件選択

	if MPanel1.Visible then
	begin
//		ECode_ID.Text	:='';
//		LName.Caption	:='';
		MjsSetFocus(Self,ECode_ID.Name);		//ｺｰﾄﾞ入力欄へ
	end
	else
		MjsSetFocus(Self,TView.Name);		//ﾂﾘｰへ
end;

//**********************************************************************
//		Component	:TView
//		Event		:Enter
//		Process		:ﾂﾘｰﾌｫｰｶｽ取得
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.TViewEnter(Sender: TObject);
begin
	//IME使用不可
	SetImeMode((Sender as TMTreeView).Handle,imDisable);
end;

//**********************************************************************
//		Component	:LView
//		Event		:Enter
//		Process		:ﾘｽﾄﾋﾞｭｰﾌｫｰｶｽ取得
//		Parameter	:
//		Return		:
//		History		:
//					:
//**********************************************************************
procedure THapSTAFFExpF.LViewEnter(Sender: TObject);
begin
	//IME使用不可
	SetImeMode((Sender as TListView).Handle,imDisable);

	//初回用
	with (Sender as TListView) do
	begin
		if Selected=nil then
			Exit;

		if Columns.Count<COLUMN_COUNT then			// <2007-07-11>
			Exit;

		//ID欄へ
		ECode_ID.Text := Selected.Caption;
		LName.Caption := Selected.SubItems[0];

		// <2007-07-11>
		if Selected.Data <> nil then
		begin
			m_TantoInfo	:=TTantoInfo(Selected.Data^);
		end;
	end;
end;

//**********************************************************************
//		Process		:ｶﾗﾑ幅取得
//		Parameter	:fOwner		:Ownerﾌｫｰﾑ
//					:dbM		:DBﾓｼﾞｭｰﾙ
//					:ddCopDB	:会社DB
//					:iFixWidth	:固定長
//		Return		:ｶﾗﾑ幅
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function fnGetColumnWidth(	fOwner:TComponent;
							dbM:TMDataModuleF;
							ddCopDB:TFDConnection;
							sTableName,
							sFieldName:string;
							iFixWidth:integer		):integer;
var
	mqWk	: TMQuery;
	iVarWitdh:integer;
	sSQL	: string;
begin

//SELECT文形成
	sSQL:='SELECT MAX(BYTE_LENGTH(';
	sSQL:=sSQL+sFieldName+')) MAX_LEN FROM';
	sSQL:=sSQL+#13#10+sTableName;

	Result	:=iFixWidth;
	mqWk	:=TMQuery.Create(fOwner);
	try
		dbM.SetDBInfoToQuery(ddCopDB,mqWk);
		with mqWk do
		begin
			try
				Close;
				SQL.Clear;
				SQL.Add(sSQL);
				Open(True);
				//最大ﾊﾞｲﾄ数取得
				iVarWitdh	:=GetFld('MAX_LEN').AsInteger*8+5;
				Result		:=MAX(iVarWitdh,iFixWidth);
			except
				raise Exception.Create('担当者IDの最大長取得に失敗しました。');
			end;
		end;
	finally
		mqWk.Free;
	end;
end;

//**********************************************************************
//		Process		:ﾘｽﾄﾋﾞｭｰｶﾗﾑｾｯﾄ
//		Parameter	:wColumnType	:0:市区町村
//					:				:1:ﾂﾘｰ上位
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THapSTAFFExpF.fnLViewColumnSet(wColumnType:Word);
var
	i	: integer;
begin
	with LView do
	begin
		case wColumnType of
			0:
			begin
				for i:=0 to Length(arrItemCaption)-1 do
				begin
					Columns.Add;
					with Columns[i] do
					begin
						Caption	:=arrItemCaption[i];
						Width	:=arrItemWidth[i]
					end;
				end;
			end;
			1:
			begin
				Columns.Add;
				Column[0].Caption	:='検索項目';
				Column[0].Width		:=100;
			end;
		end;
	end;
end;



// <2007-07-11>
//**********************************************************************
//		Process		: 担当者情報取得
//		Name		: H.Takaishi (BUNTECHNO)
//		Date		: 2007/07/11
//		Parameter	:
//		Return		:
//		History		: 9999/99/99	X.Name
//					  XXXXXXXXXXXXXXX
//**********************************************************************
function THapSTAFFExpF.fnRetTantoInfo: PTantoInfo;
begin
	Result := @m_TantoInfo;
end;

// <2007-07-11>
//**********************************************************************
//		Process		: 和暦・西暦対応日付文字列取得
//		Name		: H.Takaishi (BUNTECHNO)
//		Date		: 2007/07/11
//		Parameter	:
//		Return		:
//		History		: 9999/99/99	X.Name
//					  XXXXXXXXXXXXXXX
//**********************************************************************
function THapSTAFFExpF.fnGetFormatDate(d: TDate): String;
var
	c	: Char;
begin
	if d > 0 then
	begin
		if m_iYearKbn = YEAR_KBN_WAREKI then
		begin
			c := MjsGetGengou(d, MdtCMP_YMD);
			Result := c + FormatDateTime(' ee/mm/dd', d);
		end
		else
		begin
			Result := FormatDateTime('yyyy/mm/dd', d);
		end;
	end
	else
	begin
		Result := '';
	end;
end;

// <2007-07-11>
//************************************************************************
//		Component	: LView
//		Event		: OnDeletion
//		Name		: H.Takaishi (BUNTECHNO)
//		Date		: 2007/07/11
//		Parameter	:
//		Return		:
//		History		: 9999/99/99	X.Name
//					  XXXXXXXXXXXXXXX
//************************************************************************
procedure THapSTAFFExpF.LViewDeletion(Sender: TObject; Item: TListItem);
var
	pInfo: PTantoInfo;
begin
	pInfo := Item.Data;
	if pInfo <> nil then
	begin
		Dispose(pInfo);
		Item.Data := nil;
	end;
end;

end.
