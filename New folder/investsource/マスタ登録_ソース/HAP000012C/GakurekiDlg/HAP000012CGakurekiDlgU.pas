//************************************************************************
//	System		:	Galileopt人事給与
//	Program		:	学歴情報変更ダイアログ
//	ProgramID	:	HAP000012CGakurekiDlg
//	Name		:	M.Ono
//	Create		:	2008/07/25
//	History		:	:2010/01/28 Y.Kondo						<2010-01-28>
//						学歴データのInsertDateとUpDateDateの識別
//	History		:	2013/12/25 E.Inukai						<131225>
//						Insertキーでの行挿入を不可とする
//				:	2019/02/25	N.Honda(CyberCom)
//						新元号対応（指示書）				<NewEraName-K>
//				:	2019/04/03	N.Honda(CyberCom)
//						レビュー指摘対応					<NewEraName-K2>
//************************************************************************
unit HAP000012CGakurekiDlgU;

interface

uses
	Windows,
	Messages,
	SysUtils,
	Classes,
	VCL.Graphics,
	VCL.Controls,
	VCL.Forms,
	VCL.Dialogs,
	Buttons,
	MJSSpeedButton,
	VCL.ExtCtrls,
	VCL.StdCtrls,
	DB,
	FireDAC.Comp.Client,
	MjsDBModuleu,
	MJSQuery,
	MJSCommonU,
	HapMsgU,
	ComCtrls,
	MJSBitBtn,
	MJSPanel,
	dxDBGrid,
	dxTL,
	dxGrClms,
	dxCntner,
	HapApIFU,
	MjsDispCtrl,
	// <NewEraName-K2> ADD Start
	MjsDateCtrl,
	// <NewEraName-K2> ADD End
	dxmdaset;

const
	// <NewEraName-K> DEL Start
	//{和暦元号区分}
	//C_GKBN_S			= 1;					// 昭和
	//C_GKBN_H			= 2;					// 平成		Instruction18
	// <NewEraName-K> DEL End

	{最大登録件数}
	C_GAKUREKI_MAX		= 10;					// 学歴

	{和暦元号区分}
	WA_OK				= 0;					// OK
	WA_GE_ERR			= 1;					// 元号のみ未入力
	WA_EE_ERR			= 2;					// 年が０以下
	WA_SH_ERR			= 3;					// 昭和65年以上

	{カラムデファイン}
	COL_0				= 0;
	COL_1				= 1;
	COL_2				= 2;
	COL_3				= 3;
	COL_4				= 4;
type
{$I ActionInterface.inc}
// <NewEraName-K> ADD Start
{$I HAPEraNameCtrl_H.inc}
// <NewEraName-K> ADD End

	TGroupRec = record
		GroupCode	:	Int64;
		GroupName	:	String;
	end;

  THAP000012CGakurekiDlgF = class(TForm)
	MPanel1: TMPanel;
	btnOK: TMBitBtn;
	btnCancel: TMBitBtn;
	btnDelete: TMSpeedButton;
	btnInsert: TMSpeedButton;
	Obj252200PGridBase: TMPanel;
	GakurekiGrid: TdxDBGrid;
	GakurekiGridColumn1: TdxDBGridLookupColumn;
	GakurekiGridColumn2: TdxDBGridColumn;
	GakurekiGridColumn3: TdxDBGridColumn;
	GakurekiGridColumn4: TdxDBGridColumn;
	GakurekiGridColumn5: TdxDBGridColumn;
	GakurekiMem: TdxMemData;
	GakurekiMemEmpNCode: TCurrencyField;
	GakurekiMemGNo: TIntegerField;
	GakurekiMemGName: TStringField;
	GakurekiMemGkey: TIntegerField;
	GakurekiMemEE: TIntegerField;
	GakurekiMemYYYY: TIntegerField;
	GakurekiMemMM: TIntegerField;
	GakurekiMemGakureki: TStringField;
	GakurekiDS: TDataSource;
	GengoMem: TdxMemData;
	Obj210004DSeibetsuMemDivision: TIntegerField;
	Obj210004DSeibetsuMemDescription: TStringField;
	GakurekiMemOrderNo: TIntegerField;
	GakurekiMemNCode: TIntegerField;

	procedure	FormCreate(Sender: TObject);
	procedure	FormShow(Sender: TObject);
	procedure	FormDestroy(Sender: TObject);
	procedure	btnCancelClick(Sender: TObject);
	procedure	btnOKClick(Sender: TObject);
	procedure	btnDeleteClick(Sender: TObject);
	procedure	btnInsertClick(Sender: TObject);
	procedure	GakurekiMemBeforeInsert(DataSet: TDataSet);
	procedure	evtDtlMemBeforePost(DataSet: TDataSet);
	procedure GakurekiGridChangeNode(Sender: TObject; OldNode,
	  Node: TdxTreeListNode);
	procedure GakurekiGridEnter(Sender: TObject);
	procedure GakurekiGridExit(Sender: TObject);
	procedure GakurekiGridChangeNodeEx(Sender: TObject);
	procedure GakurekiGridBeforeChangeColumn(Sender: TObject;
	  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
	  NewColumn: Integer; var CanChange: Boolean);
	procedure GakurekiMemAfterCancel(DataSet: TDataSet);
	procedure GakurekiMemBeforeCancel(DataSet: TDataSet);
	procedure GakurekiMemAfterInsert(DataSet: TDataSet);

  private
	{ Private 宣言 }
	m_pRec			: ^TMjsAppRecord;											// APパラメータ構造体
	DBMod			: TMDataModulef;											// DBModule
	rcMsg			: TMjsMsgRec;
	qryCopDB		: TMQuery;
	m_pCommonArea	: ^rcCOMMONAREA;											// 共通ｴﾘｱ
	recSystem		: rcSYSTEMAREA;												// システム・メモリ 構造体
	ACControl		: TWinControl;
	m_cCancel		: TWinControl;												// MemDataキャンセル前のコントロール
	iRecCnt			: Integer;													// 学歴有無 0:なし 1:あり
	gbRead			: Boolean;
	m_nDateFormatRireki	: Integer;												// 履歴書項目用和暦/西暦区分

	{削除レコードの内部コード}
	m_AryDelGaku	: Array of Currency;										// 学歴レコード

	procedure	InitializeForm();
	procedure	SetGridGengou(memdata: TdxMemData);
	procedure	fnInitDataShow;
	procedure	DtlGuridChangeNodeAndEx(dxDBGrid: TdxDBGrid; iMax : Integer);
	procedure	ChkInsAndDel(dxDBGrid: TdxDBGrid; iMax: Integer);
	procedure	InsertDtl();													// 一行挿入
	procedure	DeleteDtl();													// 一行削除
	function	fnGakurekiUpdate: Boolean;										// 更新処理
	// <NewEraName-K2> DEL Start
	//function	fnChkGridWareki(var iY, iG, iE: Integer; bNullE: Boolean): Integer;
	// <NewEraName-K2> DEL End
	// <NewEraName-K2> ADD Start
	function	fnChkGridWareki(var iY, iG, iE, iM: Integer; bNullE: Boolean): Integer;
	// <NewEraName-K2> ADD End
	function	fnChkGridSeireki(iY: Integer): Boolean;
	function	fnChkGridMonth(fieldM: TField): Boolean;
	function	fnGetGridFirstColumnNo(): Integer;

  public
	{ Public 宣言 }
	COPDB,
	MJSDB		: TFDConnection;

	gdxMemRef	: ^TdxMemData;													// 受け渡し用ﾃﾞｰﾀｾｯﾄ
	giEmpNCd	: Int64;														// 社員内部No
	gdiRekiKbn	: Integer;														// 歴区分
	giRecNo		: Integer;
	constructor	fnCreateGakurekiDlg(pRec : Pointer);

  protected
	procedure	CMChildKey(var Msg : TWMKey); message CM_CHILDKEY;

  end;

//var
//  HAP000012CGakurekiDlgF: THAP000012CGakurekiDlgF;

implementation

uses
	MjsKeyDataState;

{$R *.DFM}
// <NewEraName-K> ADD Start
{$I HAPEraNameCtrl_B.inc}
// <NewEraName-K> ADD End

//************************************************************************
//*	 Proccess		:	キーオペレーション
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000012CGakurekiDlgF.CMChildKey(var Msg : TWMKey);
var
	CShiftState	: TShiftState;
	iSelStart	: Integer;
	iSelLength	: Integer;
	iLength		: Integer;
	NowCtrl		: TWinControl;

begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	CShiftState := MjsKeyDataToShiftState( Msg.KeyData );
	NowCtrl		:= Screen.ActiveControl;										// 現在のコントロールを取得

	//<131225>↓
	if (Msg.CharCode = VK_INSERT) then
	begin
		if NowCtrl is TdxDBGrid then
		begin
			Abort;
		end;
	end;
	//<131225>↑

	if (Msg.CharCode = VK_END) and (cShiftState = []) then
	begin
		if ACControl is TMBitBtn then						// 確認、キャンセルボタン
			Abort;

		if ACControl is TCustomEdit then
			if MjsChkCurEnd(ACControl) = False then
				exit;

		MJSSetFocus( Self, btnOK.Name );
		Abort;
	end;

// ESCボタンがクリックされたらダイアログ処理終了
	if (Msg.CharCode = VK_ESCAPE) and (cShiftState = []) then// Esc
	begin
		if NowCtrl is TdxDBGrid then
		begin
			if ( TdxDBGrid(NowCtrl).State = tsEditing ) then					// ﾃﾞｰﾀ編集中？
				Exit;
		end;

		btnCancelClick(Self);
		Msg.CharCode := 0;
		Abort;
	end;

	if NowCtrl is TdxDBGrid then
	begin
		Exit;
	end;

	if (Msg.CharCode = VK_LEFT) then
	begin
		if ACControl is TMBitBtn then						// 確認、キャンセルボタン
		begin
			MjsPrevCtrl(self);
			Msg.CharCode := 0;
			Abort;
		end
		else if ACControl is TCustomEdit then
		begin
			iSelStart	:= TCustomEdit(ACControl).SelStart;
			iSelLength	:= TCustomEdit(ACControl).SelLength;
			if iSelStart+iSelLength=0 then
			begin
				MjsPrevCtrl(self);
				Msg.CharCode := 0;
				Abort;
			end;
		end
		else
		begin
			MjsPrevCtrl(self);
			Msg.CharCode := 0;
			Abort;
		end;
	end;

	if (Msg.CharCode = VK_RIGHT) then
	begin
		if ACControl is TMBitBtn then						// 確認、キャンセルボタン
		begin
			MjsNextCtrl(self);
			Msg.CharCode := 0;
			Abort;
		end
		else if ACControl is TCustomEdit then
		begin
			iSelStart	:= TCustomEdit(ACControl).SelStart;
			iLength		:= Length(TCustomEdit(ACControl).Text);
			if iSelStart = iLength then
			begin
				MjsNextCtrl(self);
				Msg.CharCode := 0;
				Abort;
			end;
		end
		else
		begin
			MjsNextCtrl(self);
			Msg.CharCode := 0;
			Abort;
		end;
	end;

	if ((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) or (Msg.CharCode = VK_UP) then
	begin
		MjsPrevCtrl(self);
		Msg.CharCode := 0;
		Abort;
	end;

	if ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
	(Msg.CharCode = VK_DOWN) or (Msg.CharCode = VK_RETURN) then
	begin
		if (NowCtrl is TMBitBtn) and (Msg.CharCode = VK_RETURN) then			// 確認、キャンセルボタン
			Exit;

		MjsNextCtrl(self);
		Msg.CharCode := 0;
		Abort;
	end;
end;

//************************************************************************
//*	 Proccess		:	CONSTRUCTOR関数
//*	 Paqrameter		:	親Form
//*					:	コード入力Flag
//*					:	コード
//*	 Retrun			:	Nathing
//************************************************************************
constructor	THAP000012CGakurekiDlgF.fnCreateGakurekiDlg(pRec : Pointer);
begin
	m_pRec			:= pRec;

	DBMod			:= TMDataModulef( m_pRec^.m_pDBModule^ );					// DBModule
	m_pCommonArea	:= m_pRec^.m_pCommonArea;									// 共通エリア
	recSystem		:= rcSYSTEMAREA( m_pRec^.m_pSystemArea^ );					// システム・メモリ 構造体 保持

// システム色の設定
	MJSCommonU.MJSColorChange  (THAP000012CGakurekiDlgF(Self),
								recSystem.SysColorB,
								recSystem.SysColorD,
								recSystem.SysBaseColorB,
								recSystem.SysBaseColorD,
								m_pCommonArea^.SysFocusColor);

//クエリ作成
	qryCopDB := TMQuery.Create(Self);
	DBMOD.SetDBInfoTOQuery(COPDB,qryCopDB);

	ACControl := GakurekiGrid;

end;

//************************************************************************
//*	 Proccess		:	FormCreate
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000012CGakurekiDlgF.FormCreate(Sender: TObject);
begin
	{画面設定処理}
	InitializeForm();
end;


//************************************************************************
//*		Proccess		:	画面初期設定処理
//*		Name			:	Shigeo Hirota
//*		Date			:	06/08/11
//*		Parameter		:	なし
//*		Retrun			:	なし
//*		History			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.InitializeForm();
begin
	{グリッド設定}
	if gdiRekiKbn = 0 then				// 和暦
	begin
		// 学歴
		GakurekiGrid.Bands[0].Visible	:= True;
		GakurekiGrid.Bands[1].Visible	:= False;
	end
	else								// 西暦
	begin
		// 学歴
		GakurekiGrid.Bands[1].Visible	:= True;
		GakurekiGrid.Bands[0].Visible	:= False;
	end;

	// 元号
	SetGridGengou(GengoMem);

	m_nDateFormatRireki := gdiRekiKbn;

end;

//************************************************************************
//*		Proccess		:	グリッドに元号を設定
//*		Name			:
//*		Date			:
//*		Parameter		:	memdata
//*		Retrun			:	なし
//*		History			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.SetGridGengou(memdata: TdxMemData);
// <NewEraName-K> ADD Start
var
	iIndex	: Integer;
// <NewEraName-K> ADD End
begin
	with memdata do
	begin
		Active	:= False;
		Active	:= True;

		// <NewEraName-K> DEL Start
		//Append();
		//FieldByName('nNo'		).AsInteger	:= C_GKBN_S;
		//FieldByName('strNm'		).AsString	:= 'S';
		//Post();
        //
		//Append();
		//FieldByName('nNo'		).AsInteger	:= C_GKBN_H;
		//FieldByName('strNm'		).AsString	:= 'H';		Instruction23
		//Post();
		// <NewEraName-K> DEL End
		// <NewEraName-K> ADD Start
		// 昭和開始のためインデックスは2から開始する
		for iIndex := 2 to High(arrGenAlpha) do
		begin
			Append();
			// 既存処理に合わせるためiIndexを減算(-1)する
			FieldByName('nNo'		).AsInteger	:= iIndex - 1;
			// 和暦アルファベットを設定する
			FieldByName('strNm'		).AsString	:= arrGenAlpha[iIndex];
			Post();
		end;
		// <NewEraName-K> ADD End
	end;
end;


//************************************************************************
//*	 Proccess		:	FormShow
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000012CGakurekiDlgF.FormShow(Sender: TObject);
begin
	fnInitDataShow;

	GakurekiGrid.FocusedColumn := COL_0;		// 先頭カラム
	ACControl.setFocus;

	if iRecCnt = 0 then							// 学歴データなし
	begin
		btnInsert.Enabled	:= False;
		btnDelete.Enabled	:= False;
	end;

end;


//************************************************************************
//*	 Proccess		:	FormDestroy
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000012CGakurekiDlgF.FormDestroy(Sender: TObject);
begin
//クエリ開放
	qryCopDB.Close;
	qryCopDB.Free;
end;

//************************************************************************
//*	 Proccess		:fnInitDataShow
//*					:データ表示
//*	 Paqrameter		:
//*	 Retrun			:
//************************************************************************
procedure THAP000012CGakurekiDlgF.fnInitDataShow;
var
	iCnt		: Integer;
	sFld		: String;
begin
	iRecCnt	:= 0;

	try
		try
			With qryCopDB do
			begin
				gbRead := True;

				// 受け渡し用ﾃﾞｰﾀｾｯﾄからﾃﾞｰﾀをｺﾋﾟｰ
				gdxmemRef^.SortedField	:= '';
				gdxmemRef^.	SortOptions	:= [];

				gdxMemRef^.First;
				GakurekiMem.Close;
				GakurekiMem.Open;
				while not(gdxMemRef^.Eof) do
				begin
					GakurekiMem.Append;

					for iCnt:=0 to gdxMemRef^.FieldCount-1 do
					begin
						sFld	:= gdxMemRef^.Fields[iCnt].FieldName;
						if (sFld<>'RecId')  then
							GakurekiMem.FieldByName(sFld).Value	:= gdxMemRef^.FieldByName(sFld).Value;
					end;

					GakurekiMem.Post;

					gdxMemRef^.Next;
				end;

				if GakurekiMem.RecordCount > 0 then
				begin
					GakurekiMem.First;
					iRecCnt	:= 1;
				end;
			end;
		except
			MjsMessageBox(Self,'学歴の取得に失敗しました。',MjError,MjdefOK);
		end;
	finally
		gbRead := False;
	end;
end;

//************************************************************************
//*		Component		:	Grid (TdxDBGrid)
//*							グリッド
//*		Event			:	Enter
//*		Name			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.GakurekiGridEnter(Sender: TObject);
var
	iMaxCnt	: Integer;
begin
	ACControl := Sender as TWinControl;

//	TdxDBGrid(Sender).DataSource.DataSet.First();
//	TdxDBGrid(Sender).FocusedColumn := fnGetGridFirstColumnNo();

	iMaxCnt	:= C_GAKUREKI_MAX;								// 最大行

	// 一行挿入・一行削除の有効／無効の設定
	ChkInsAndDel(TdxDBGrid(Sender), iMaxCnt);

	// レコード件数が０の場合
	if TdxDBGrid(Sender).DataSource.DataSet.RecordCount = 0 then
	begin
		// MemDataを編集モードにするために一行挿入する
		TdxDBGrid(Sender).DataSource.DataSet.Append();
		// ChangeNodeExイベントを起こさせるため、RecIdを設定する
		TdxDBGrid(Sender).DataSource.DataSet.FieldByName('RecId').AsInteger := 1;
	end;
end;

//************************************************************************
//*		Component		:	Grid (TdxDBGrid)
//*							グリッド
//*		Event			:	Exit
//*		Name			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.GakurekiGridExit(Sender: TObject);
begin
	// 一行挿入・一行削除無効
	btnDelete.Enabled	:= False;
	btnInsert.Enabled	:= False;

	if Screen.ActiveControl = btnCancel then
		Exit;

	if TdxDBGrid(Sender).DataSource.DataSet.State in [dsEdit, dsInsert] then
		TdxDBGrid(Sender).DataSource.DataSet.Post;
end;


//************************************************************************
//*	 Proccess		:	キャンセルボタンクリック
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//	************************************************************************
procedure THAP000012CGakurekiDlgF.btnCancelClick(Sender: TObject);
begin
	ModalResult	:= mrCancel;
end;


//************************************************************************
//*	 Proccess		:	btnDeleteClick
//*					:	削除ボタンクリック
//*	 Retrun			:
//************************************************************************
procedure THAP000012CGakurekiDlgF.btnDeleteClick(Sender: TObject);
begin
	DeleteDtl();
end;

//************************************************************************
//*	 Proccess		:	btnInsertClick
//*					:	挿入ボタンクリック
//*	 Retrun			:
//************************************************************************
procedure THAP000012CGakurekiDlgF.btnInsertClick(Sender: TObject);
begin
	InsertDtl();
end;


//************************************************************************
//*	 Proccess		:	ＯＫボタンクリック
//*	 Paqrameter		:	Object
//************************************************************************
procedure THAP000012CGakurekiDlgF.btnOKClick(Sender: TObject);
begin
	try
		if fnGakurekiUpdate <> True then Abort;				//更新実行
	except
		Exit;
	end;

	ModalResult	:= mrOK;
end;


//************************************************************************
//*		Component		:	GakurekiMem (TdxMemData)
//*							学歴MemData
//*		Event			:	BeforeInsert
//*		Name			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.GakurekiMemBeforeInsert(DataSet: TDataSet);
begin
	if (DataSet.RecordCount = C_GAKUREKI_MAX) then
	begin
												// MAX行ある場合は行挿入不可
		GakurekiGrid.Options := GakurekiGrid.Options - [egoCanInsert];
		Abort;
	end
	else
	begin
												// MAX行ない場合は行挿入可能
		GakurekiGrid.Options := GakurekiGrid.Options + [egoCanInsert];
	end;
end;

//************************************************************************
//*		Component		:	GakurekiMem (TdxMemData)
//*							学歴用MemData
//*		Event			:	BeforePost
//*		Name			:
//*
//************************************************************************
// ●●●DBから読み出したデータを設定中は呼ばれない●●●
procedure THAP000012CGakurekiDlgF.evtDtlMemBeforePost(DataSet: TDataSet);
var
	iY			: Integer;
	iG			: Integer;
	iE			: Integer;
	iRet		: Integer;
	// <NewEraName-K2> ADD Start
	iM			: Integer;
	// <NewEraName-K2> ADD End
begin
	with DataSet do
	begin
		// 和暦
		if m_nDateFormatRireki = 0 then
		begin
			// チェック＆西暦取得
			iG := FieldByName('GKey').AsInteger;
			iE := FieldByName('EE'  ).AsInteger;
			// <NewEraName-K2> DEL Start
			//iRet := fnChkGridWareki(iY, iG, iE, FieldByName('GKey').IsNull);
			// <NewEraName-K2> DEL End
			// <NewEraName-K2> ADD Start
			iM := FieldByName('MM').AsInteger;
			iRet := fnChkGridWareki(iY, iG, iE, iM, FieldByName('GKey').IsNull);
			// <NewEraName-K2> ADD End

			// NG
			if iRet<> WA_OK then
			begin
				FieldByName('YYYY').AsInteger := 0;
				// 和暦再入力
				if iRet= WA_GE_ERR then			// 元号のみ未入力
				begin
					FieldByName('GName'  ).FocusControl();
					// 「XXを入力してください。」
					GetMsg(rcMsg,100,1);
					with rcMsg do
						MjsMessageBoxEx(Self,'元号を'+sMsg,sTitle,IconType,BtnType,BtnDef,LogType);

					Abort;

				end
				else							// 年異常
				begin
					FieldByName('EE'  ).FocusControl();
					// 「XXの入力が正しくありません。」
					GetMsg(rcMsg,100,3);
					with rcMsg do
						MjsMessageBoxEx(Self,'年'+sMsg,sTitle,IconType,BtnType,BtnDef,LogType);

					FieldByName('EE'  ).Clear();
				end;
				Abort;							// 終了
			end;
			if iE <> 0 then
			begin
				FieldByName('YYYY').AsInteger := iY;
				FieldByName('GKey').AsInteger := iG;
				FieldByName('EE'  ).AsInteger := iE;
			end;
		end
		// 西暦
		else
		begin
			// チェック
			if not fnChkGridSeireki(FieldByName('YYYY').AsInteger) then
			begin
				// 和暦再入力
				FieldByName('YYYY'  ).FocusControl();
				// 「XXの入力が正しくありません。」
					GetMsg(rcMsg,100,3);
					with rcMsg do
						MjsMessageBoxEx(Self,'年'+sMsg,sTitle,IconType,BtnType,BtnDef,LogType);
				FieldByName('YYYY'  ).Clear();
				Abort;							// 終了
			end;
		end;

		// 月チェック
		if not fnChkGridMonth(FieldByName('MM')) then
		begin
			// 月再入力
			FieldByName('MM'  ).FocusControl();
			// 「XXの入力が正しくありません。」
					GetMsg(rcMsg,100,3);
					with rcMsg do
						MjsMessageBoxEx(Self,'月'+sMsg,sTitle,IconType,BtnType,BtnDef,LogType);
			FieldByName('MM'  ).Clear();
			Abort;								// 終了
		end;

		{全未入力}
		// 年月未入力
		if ((gdiRekiKbn = 0)								// 和暦
		and (FieldByName('EE'  ).AsInteger = 0)
		and (FieldByName('MM'  ).AsInteger = 0))
		or  ((gdiRekiKbn = 1)								// 西暦
		and (FieldByName('YYYY').AsInteger = 0)
		and (FieldByName('MM'  ).AsInteger = 0))then
		begin
			// 学歴も未入力
			if FieldByName('Gakureki'  ).AsString = '' then
			begin
				// 内部コードなし ＆ 新規 ＝未登録
				if  (FieldByName('EmpNCode'  ).AsCurrency = 0)
				and (DataSet.State in [dsInsert]) then
				begin
					Cancel();				// 取消
				end
				// 内部コードあり || 編集 ＝登録済み
				else
				begin
					DeleteDtl();			// 削除
				end;
				Abort;						// POST不要
			end;
		end;
	end;
end;


//************************************************************************
//*		Proccess		:	和暦の入力チェック・西暦の計算
//*		Name			:	Shigeo Hirota
//*		Date			:	06/08/11
//*		Parameter		:	iM		西暦年
//*							iG		元号区分
//*							iE		和暦年
//*							iM		月
//*							bNullE	T:和暦年NULL／F：NOT NULL
//*		Retrun			:	WA_OK		(0)：OK
//*							WA_GE_ERR	(1)：元号のみ未入力
//*							WA_EE_ERR	(2)：年が０以下
//*							WA_SH_ERR	(3)：昭和65年以上
//*		History			:
//*
//************************************************************************
// <NewEraName-K2> DEL Start
//function THAP000012CGakurekiDlgF.fnChkGridWareki(var iY, iG, iE: Integer; bNullE: Boolean): Integer;
// <NewEraName-K2> DEL End
// <NewEraName-K2> ADD Start
function THAP000012CGakurekiDlgF.fnChkGridWareki(var iY, iG, iE, iM: Integer; bNullE: Boolean): Integer;
// <NewEraName-K2> ADD End
// <NewEraName-K> ADD Start
var
	iLastYearJ		: Integer;
	iGengouIndex	: Integer;
//	iWkYear			: Integer;

// <NewEraName-K> ADD End
begin
	Result := WA_OK;							// 正常
	iY := 0;									// 一度西暦をクリア

	// 年未入力の場合
	if bNullE then
	begin
		Exit;									// 正常終了
	end
	// 元号未入力の場合
	else if iG = 0 then
	begin
		Result := WA_GE_ERR;					// 異常
		Exit;									// 終了
	end;

	if iE < 1 then								// ０年以下
	begin
		Result := WA_EE_ERR;					// 異常
		Exit;									// 終了
	end;

	// <NewEraName-K> DEL Start
	//// 昭和の場合
	//if iG = C_GKBN_S then
	//begin
	//	// 昭和65年以上
	//	if iE > 64 then
	//	begin
	//		Result := WA_SH_ERR;				// 異常
	//		Exit;								// 終了
	//	end;
    //
	//	iY := iE + 1925;						// 西暦に変換
    //
	//	// 昭和64年
	//	if iE = 64 then
	//	begin
	//		// 平成元年にする
	//		iG := C_GKBN_H;
	//		iE := 1;
	//	end;
	//end
	//// 平成の場合
	//else
	//begin
	//	iY := iE + 1988;						// 西暦に変換	Instruction02
	//end;
	// <NewEraName-K> DEL End
	// <NewEraName-K> ADD Start
	// <NewEraName-K2> DEL Start
	//// iG(1：昭和、2：平成、...)とiE(和暦年)から西暦年を取得する	
	//// ただし、和暦の最終年を超える元号と和暦年の組み合わせの場合はエラーとする	
	//if iG < High(arrGenOffset) - 1 then	
	//begin
	//	// 元号のインデックスを設定
	//	iGengouIndex := iG + 1;
	//	
	//	// 和暦の最終年を取得(昭和なら64)	
	//	iLastYearJ := Trunc(arrGenOffset[iGengouIndex + 1] / 10000) - Trunc(arrGenOffset[iGengouIndex] / 10000) + 1;	
	//	
	//	if iE > iLastYearJ then	
	//	begin	
	//		Result := WA_SH_ERR;				// 異常	
	//		Exit;								// 終了	
	//	end
	//	else if iE = iLastYearJ then
	//	begin
	//		iWkYear := WarekiToSeirekiYear(iE, arrGenAlpha[iG + 1]);
	//		
	//		// 和暦年の最終年でかつその年に2つの元号があるなら次の元号の元年を指すようにiGとiEを上書きする
	//		// 最終年だった時点で上書きする方法では元号の切替えが1/1に行われるケースに対応できないためこのように行う
	//		if GetEraName(EncodeDate(iWkYear, 1, 1), emAlpha) <> GetEraName(EncodeDate(iWkYear, 12, 31), emAlpha) then
	//		begin
	//			// 改元日が1/1であっても12/31であっても最終年は翌元号にする
	//			iG := iG + 1;
	//			iE := 1;
	//		end;
	//	end;
	//end;
	// <NewEraName-K2> DEL End

	// 西暦年を取得
	iY := WarekiToSeirekiYear(iE, arrGenAlpha[iG + 1]);
	
	// <NewEraName-K2> ADD Start
	// 西暦年月の末日の元号番号を取得する
	// iG(1：昭和、2：平成、...)に合わせるため減算(-2)する
	if ( iY > 0 ) and ( iM > 0) then
	begin
		iG := DateToEraNum(MjsIntYMEndDayGet(iY * 100 + iM, 0), epMSNet) - 2;
		iE := GetWareki(iY, iM).iWareki;
	end;
	// <NewEraName-K2> ADD End
	// <NewEraName-K> ADD End
end;
//************************************************************************
//*		Proccess		:	西暦年の入力チェック
//*		Name			:	Shigeo Hirota
//*		Date			:	06/08/11
//*		Parameter		:	iY		年
//*		Retrun			:	T：OK／F：NG
//*		History			:
//*
//************************************************************************
function THAP000012CGakurekiDlgF.fnChkGridSeireki(iY: Integer): Boolean;
begin
	Result := True;

	if iY < 0 then
	begin
		Result := False;						// 異常
	end;
end;

//************************************************************************
//*		Proccess		:	月の入力チェック
//*		Name			:	Shigeo Hirota
//*		Date			:	06/08/11
//*		Parameter		:	fieldM		月フィールド
//*		Retrun			:	T：OK／F：NG
//*		History			:
//*
//************************************************************************
function THAP000012CGakurekiDlgF.fnChkGridMonth(fieldM: TField): Boolean;
begin
	Result := True;

	if (not fieldM.IsNull)
	and ((fieldM.AsInteger < 0) or (12 < fieldM.AsInteger)) then
	begin
		Result := False;						// 異常
	end;
end;

//************************************************************************
//*		Proccess		:	一行削除
//*		Name			:	Shigeo Hirota
//*		Date			:	06/09/25
//*		Parameter		:	なし
//*		Retrun			:	なし
//*		History			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.DeleteDtl();
var
	curNCode	: Currency;
begin
	if not (Screen.ActiveControl is TdxDBGrid) then
	begin
		Exit;
	end;

	GetMsg(rcMsg,110,3);

	with rcMsg do
	begin
		// XXレコードを削除してもよろしいですか？
		if MjsMessageBoxEx(Self,'選択した'+sMsg, sTitle,IconType,BtnType,mjdefno,LogType) <> mrYes then
		begin
			Exit;
		end;
	end;


	{内部コード取得}
	curNCode := GakurekiGrid.DataSource.DataSet.FieldByName('EmpNCode').AsCurrency;

	{DBに登録済みのレコードの場合}
	if curNCode <> 0 then
	begin
		{DBから削除は更新時に行う}
		SetLength(m_AryDelGaku, Length(m_AryDelGaku) + 1);
		m_AryDelGaku[Length(m_AryDelGaku) - 1] := curNCode;
	end;

	// MemDataからは削除
	GakurekiGrid.DataSource.DataSet.Delete();

	// レコードが０になったら
	if GakurekiGrid.DataSource.DataSet.RecordCount = 0 then
	begin
		// MemDataを編集モードにするために一行挿入する
		GakurekiGrid.DataSource.DataSet.Append();

		{ボタン無効}
		btnDelete.Enabled	:= False;
		btnInsert.Enabled	:= False;
	end;
end;

//************************************************************************
//*		Proccess		:	一行挿入
//*		Name			:
//*		Date			:
//*		Parameter		:	なし
//*		Retrun			:	なし
//*		History			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.InsertDtl();
begin
	if not (Screen.ActiveControl is TdxDBGrid) then
	begin
		Exit;
	end;

	with(GakurekiGrid) do
	begin
		DataSource.DataSet.Insert();
		FocusedColumn := fnGetGridFirstColumnNo();

		{ボタン無効}
		btnDelete.Enabled	:= False;
		btnInsert.Enabled	:= False;
	end;
end;

//************************************************************************
//*		Component		:	GakurekiGurid (TdxDBGrid)
//*							グリッド
//*		Event			:	BeforeChangeColumn
//*		Name			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.GakurekiGridBeforeChangeColumn(
  Sender: TObject; Node: TdxTreeListNode; Column: Integer;
  NewNode: TdxTreeListNode; NewColumn: Integer; var CanChange: Boolean);
var
	iY		: Integer;
	iG		: Integer;
	iE		: Integer;
	iRet	: Integer;
begin
	with TdxDBGrid(Sender).DataSource.DataSet do
	begin
		// 編集・挿入モードでない場合
		if not (State in [dsEdit, dsInsert]) then
		begin
			Exit;								// 終了
		end;


		// <NewEraName-K2> DEL Start
		//// 移動前が和暦元号か和暦年
		//if (m_nDateFormatRireki = 0)
		//and ((Column = COL_0) or (Column = COL_1)) then
		//begin
		//	// 移動後も和暦元号か和暦年
		//	if (NewColumn = COL_0)
		//	or (NewColumn = COL_1) then
		//	begin
		//		// 和暦年から出た時でよい
		//		Exit;							// 終了
		//	end;
        //
		//	// チェック＆西暦取得
		//	iG := FieldByName('GKey').AsInteger;
		//	iE := FieldByName('EE'  ).AsInteger;
		//	iRet := fnChkGridWareki(iY, iG, iE, FieldByName('EE').IsNull);
		//	// チェックNG
		//	if iRet <> WA_OK then
		//	begin
		//		FieldByName('YYYY').AsInteger := 0;
		//		CanChange := False;				// 異常
		//		Abort;							// 終了
		//	end;
		//	if iE <> 0 then
		//	begin
		//		FieldByName('YYYY').AsInteger := iY;
		//		FieldByName('GKey').AsInteger := iG;
		//		FieldByName('EE'  ).AsInteger := iE;
		//	end;
		//end;
		// <NewEraName-K2> DEL End

		// 移動前が西暦年
		if (m_nDateFormatRireki = 1)
		and (Column =  COL_0) then
		begin
			// チェック
			if not fnChkGridSeireki(FieldByName('YYYY').AsInteger) then
			begin
				CanChange := False;				// 異常
				Abort;							// 終了
			end;
		end;

		// 移動前が月
		if ((m_nDateFormatRireki = 0 ) and (Column =  COL_2))
		or ((m_nDateFormatRireki = 1) and (Column = COL_1)) then
		begin
			// チェック
			if not fnChkGridMonth(FieldByName('MM')) then
			begin
				CanChange := False;				// 異常
				Abort;							// 終了
			end;
		end;
	end;

end;

//************************************************************************
//*		Component		:	(TdxMemData)
//*							グリッド用MemData
//*		Event			:	BeforeCancel
//*		Name			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.GakurekiMemBeforeCancel(
  DataSet: TDataSet);
begin
	// フォーカスコントロールを取得
	m_cCancel := Screen.ActiveControl;
end;

//************************************************************************
//*		Component		:	(TdxMemData)
//*							グリッド用MemData
//*		Event			:	AfterCancel
//*		Name			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.GakurekiMemAfterCancel(
  DataSet: TDataSet);
begin
	{キャンセル前とフォーカスコントロールが違う場合}
	// MemDataが未入力で更新ボタンを押した場合、キャンセル前はボタンエリアに
	// フォーカスがあるが、MemDataキャンセル後はグリッドにフォーカスがある。
	if m_cCancel <> Screen.ActiveControl then
	begin
		// レコードなしの時にキャンセルても、編集状態のままなので回避
		if GakurekiMem.RecordCount = 0 then
		begin
			GakurekiMem.Close;
			GakurekiMem.Open;
		end;
		// 左クリックのメッセージを投げる
		PostMessage(m_cCancel.Handle, WM_LBUTTONDOWN, 0, 0);
	end;

end;


//************************************************************************
//*		Component		:	GakurekiGurid (TdxDBGrid)
//*							学歴グリッド
//*		Event			:	ChangeNodeEx
//*		Name			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.GakurekiGridChangeNode(Sender: TObject;
  OldNode, Node: TdxTreeListNode);
begin
	DtlGuridChangeNodeAndEx(TdxDBGrid(Sender), C_GAKUREKI_MAX);
end;

//************************************************************************
//*		Component		:	GakurekiGurid (TdxDBGrid)
//*							学歴グリッド
//*		Event			:	ChangeNodeEx
//*		Name			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.GakurekiGridChangeNodeEx(
  Sender: TObject);
begin
	DtlGuridChangeNodeAndEx(TdxDBGrid(Sender), C_GAKUREKI_MAX);
end;

//************************************************************************
//*		Proccess		:	グリッドのChangeNode＋ChangeNodeEx
//*		Name			:
//*		Date			:
//*		Parameter		:	dxDBGrid
//*							iMax		最大行数
//*		Retrun			:	なし
//*		History			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.DtlGuridChangeNodeAndEx(dxDBGrid: TdxDBGrid; iMax : Integer);
begin
	// 新規行の場合
	if dxDBGrid.DataSource.DataSet.State in [dsInsert] then
	begin
		// 先頭カラムへ
		dxDBGrid.FocusedColumn := fnGetGridFirstColumnNo();
	end;

	// 一行挿入・一行削除の有効／無効設定
	ChkInsAndDel(dxDBGrid, iMax);
end;

//************************************************************************
//*		Proccess		:	一行挿入・一行削除ボタンの有効／無効切り替え
//*		Name			:
//*		Date			:
//*		Parameter		:	dxDBGrid	フォーカスグリッド
//*							iMax		最大登録件数
//*		Retrun			:	なし
//*		History			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.ChkInsAndDel(dxDBGrid: TdxDBGrid; iMax: Integer);
begin
	// 新規レコード挿入中
	if dxDBGrid.DataSource.DataSet.State in [dsInsert] then
	begin
		btnDelete.Enabled	:= False;			// 一行削除無効
		btnInsert.Enabled	:= False;			// 一行挿入無効
		Exit;
	end;

	// 登録件数が０でない場合
	if dxDBGrid.DataSource.DataSet.RecordCount > 0 then
	begin
		btnDelete.Enabled	:= True;			// 一行削除有効

		// 最大登録件数でない場合
		if dxDBGrid.DataSource.DataSet.RecordCount < iMax then
		begin
			btnInsert.Enabled	:= True;		// 一行挿入有効
		end
		// 最大登録件数
		else
		begin
			btnInsert.Enabled	:= False;		// 一行挿入無効
		end;
	end
	// 登録件数が０
	else
	begin
		btnDelete.Enabled	:= False;			// 一行削除無効
	end;
end;


//************************************************************************
//*		Proccess		:	グリッドの入力可能な先頭のカラムを取得
//*		Name			:
//*		Date			:
//*		Parameter		:	なし
//*		Retrun			:	カラムNo
//*		History			:
//*
//************************************************************************
function THAP000012CGakurekiDlgF.fnGetGridFirstColumnNo(): Integer;
begin
	Result	:= 0;

	if not (Screen.ActiveControl is TdxDBGrid) then
	begin
		Exit;
	end;

	with GakurekiGrid do
	begin
		// 行選択になっている場合
		if Options <> Options - [egoRowSelect] then
		begin
			Result := FocusedColumn;			// 今のカラム
		end
		// 行選択になっていない場合
		else
		begin
		// 先頭のカラム
			Result := COL_0;
		end;
	end;
end;

//************************************************************************
//*	 Proccess		:	fnGakurekiUpdate
//*					:	データ更新
//*	 Retrun			:
//************************************************************************
function THAP000012CGakurekiDlgF.fnGakurekiUpdate : Boolean;
var
	iCnt	: Integer;
	sFld	: String;
begin
	Result	:= False;
	if GakurekiGrid.DataSource.DataSet.State in [dsEdit, dsInsert] then
		GakurekiGrid.DataSource.DataSet.Post;

	try
		try
			GakurekiMem.DisableControls;

			// ﾃﾞｰﾀを受け渡し用ﾃﾞｰﾀｾｯﾄを洗替
			if (gdxMemRef^.RecordCount > 0) then
			begin
				gdxMemREf^.First;
				while not(gdxMemRef^.Eof) do
				begin
					gdxMemRef^.Delete;
				end;
			end;

			if (GakurekiMem.RecordCount > 0) then
			begin
				GakurekiMem.First;
				while not(GakurekiMem.Eof) do				// 学歴の追加
				begin
					gdxMemRef^.Append;

					for iCnt:=0 to GakurekiMem.FieldCount-1 do
					begin
						sFld	:= GakurekiMem.Fields[iCnt].FieldName;
						if (sFld <> 'RecId') then
							gdxMemRef^.FieldByName(sFld).Value	:= GakurekiMem.FieldByName(sFld).Value;
					end;

					gdxMemRef^.Post;

					GakurekiMem.Next;
				end;
			end;

			Result := True;

		finally
			GakurekiMem.First;
			GakurekiMem.EnableControls;
		end;
	except
		MjsMessageBox(Self,'学歴変更の更新に失敗しました。',MjError,MjdefOK);
	end;
end;


//************************************************************************
//*		Component		:	(TdxMemData)
//*							グリッド用MemData
//*		Event			:	OnAfterInsert
//*		Name			:
//*
//************************************************************************
procedure THAP000012CGakurekiDlgF.GakurekiMemAfterInsert(
  DataSet: TDataSet);
begin
	GakurekiMemNCode.AsInteger := -1;
end;

end.
