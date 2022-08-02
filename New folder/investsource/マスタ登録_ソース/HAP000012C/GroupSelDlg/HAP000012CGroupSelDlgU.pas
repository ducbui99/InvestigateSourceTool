//************************************************************************
//	System		:	Galileopt人事給与
//	Program		:	グループ会社選択ダイアログ
//	ProgramID	:	HAP100000CSyokutiDlg
//	Name		:	H.Itahana(Buntechno)
//	Create		:	2005/05/06
//	History		:	2006/02/20(Mon.) Y.Kondo
//				:	アイコンの調整、会社コードゼロサプレス	<060220>
//************************************************************************

unit	HAP000012CGroupSelDlgU;

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
	VCL.StdCtrls,
	Buttons,
	VCL.ExtCtrls,
	ComCtrls,
	VCL.ImgList,
	DB,
	FireDAC.Comp.Client,
	MJSQuery,
	MJSBitBtn,
	MJSEdits,
	MJSStrCtrl,
	MJSComboBox,
	MJSStatusBar,
	MJSPanel,
	MjsCommonU,
	MjsDBModuleU,
	MjsDispCtrl,
	MjsDateCtrl,
	HapMsgU, System.ImageList;

type

	TGroupRec = record
		GroupCode	:	Int64;
		GroupName	:	String;
	end;

THAP000012CGroupSelDlgF = class(TForm)

	BasePanel: TMPanel;
	DataList: TListView;
	SmallIcons: TImageList;
	MPanel1: TMPanel;
	btnOK: TMBitBtn;
	btnCancel: TMBitBtn;

	procedure FormCreate(Sender: TObject);
	procedure btnOKClick(Sender: TObject);
	procedure btnCancelClick(Sender: TObject);
	procedure FormShow(Sender: TObject);
	procedure DialogEnter(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
	procedure DataListDblClick(Sender: TObject);


private		{ Private 宣言 }

	m_pRec			:	^TMjsAppRecord;											// APパラメータ構造体
	DBMod			:	TMDataModulef;											// DBModule
	m_pCommonArea	:	^rcCOMMONAREA;											// 共通ｴﾘｱ
	recSystem		:	rcSYSTEMAREA;											// システム・メモリ 構造体
	ACControl		:	TWinControl;

	p_recGrp		:	^TGroupRec;

	procedure fnInitDataShow;

public		{ Public 宣言 }

	COPDB,
	MJSDB		:	TFDConnection;

	constructor	fnCreateDialog(pRec : Pointer; pGrp : Pointer);


protected

	procedure	CMChildKey(var Msg : TWMKey); message CM_CHILDKEY;


end;

//var
//	HAP000012CGroupSelDlgF: THAP000012CGroupSelDlgF;

implementation

uses
	MjsKeyDataState;

{$R *.DFM}

//************************************************************************
//*	 Proccess		:	キーオペレーション
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000012CGroupSelDlgF.CMChildKey(var Msg : TWMKey);
var
	CShiftState	: TShiftState;
	iSelStart	: Integer;
	iSelLength	: Integer;
	iLength		: Integer;
begin

	if GetKeyState(VK_MENU) < 0 then
		Exit;

	CShiftState := MjsKeyDataToShiftState( Msg.KeyData );

	if ACControl is TListView then
	begin
		case Msg.CharCode of

			VK_UP,
			VK_DOWN,
			VK_LEFT,
			VK_RIGHT :
			begin
				Msg.CharCode := 0;
				abort;
			end;

		end;
	end;


	if (Msg.CharCode = VK_END) and (cShiftState = []) then
	begin
		if ACControl is TMBitBtn then				// 確認、キャンセルボタン
			Abort;
		if ACControl is TCustomEdit then
			if MjsChkCurEnd(ACControl) = False then
				exit;
		MJSSetFocus( Self, btnOK.Name );
		Abort;
	end;

// ESCボタンがクリックされたらダイアログ処理終了
	if (Msg.CharCode = VK_ESCAPE) and (cShiftState = [])	then// Esc
	begin
		btnCancelClick(Self);
		Msg.CharCode := 0;
		Abort;
	end;
	if (Msg.CharCode = VK_LEFT) then
	begin
		if ACControl is TMBitBtn then				// 確認、キャンセルボタン
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
		if ACControl is TMBitBtn then				// 確認、キャンセルボタン
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

	if	((Msg.CharCode = VK_TAB) and (cShiftState = [ssShift])) or (Msg.CharCode = VK_UP) then
	begin
		MjsPrevCtrl(self);
		Msg.CharCode := 0;
		Abort;
	end;

	if ((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
	(Msg.CharCode = VK_DOWN) or (Msg.CharCode = VK_RETURN) then
	begin
		if (ACControl is TMBitBtn) and (Msg.CharCode = VK_RETURN) then				// 確認、キャンセルボタン
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
constructor	THAP000012CGroupSelDlgF.fnCreateDialog(pRec : Pointer; pGrp : pointer);
begin
	m_pRec			:= pRec;
	p_recGrp		:= pGrp;

	DBMod			:= TMDataModulef( m_pRec^.m_pDBModule^ );	// DBModule
	m_pCommonArea	:= m_pRec^.m_pCommonArea;					// 共通エリア
	recSystem		:= rcSYSTEMAREA( m_pRec^.m_pSystemArea^ );	// システム・メモリ 構造体 保持

// システム色の設定
	MJSCommonU.MJSColorChange ( THAP000012CGroupSelDlgF(Self),
								recSystem.SysColorB,
								recSystem.SysColorD,
								recSystem.SysBaseColorB,
								recSystem.SysBaseColorD,
								m_pCommonArea^.SysFocusColor);



end;

//************************************************************************
//*	 Proccess		:	FormCreate
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000012CGroupSelDlgF.FormCreate(Sender: TObject);
begin
//
end;

//************************************************************************
//*	 Proccess		:	FormDestroy
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000012CGroupSelDlgF.FormDestroy(Sender: TObject);
begin
//
end;

//************************************************************************
//*	 Proccess		:	登録処理
//*	 Paqrameter		:	Object
//************************************************************************
procedure THAP000012CGroupSelDlgF.btnOKClick(Sender: TObject);
begin
	if DataList.ItemFocused = nil then
		Exit;

	try
//		p_recGrp.GroupCode := StrToInt(DataList.ItemFocused.Caption);
		p_recGrp.GroupCode := StrToInt64(DataList.ItemFocused.SubItems.Strings[1]);	//会社内部ｺｰﾄﾞ
		p_recGrp.GroupName := DataList.ItemFocused.SubItems.Strings[0];				//会社名
	except
		Exit;
	end;

	ModalResult	:= mrOK;
end;

//************************************************************************
//*	 Proccess		:	キャンセルボタンクリック
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000012CGroupSelDlgF.btnCancelClick(Sender: TObject);
begin
	ModalResult	:= mrCancel;
end;

//************************************************************************
//*	 Proccess		:	FormShow
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000012CGroupSelDlgF.FormShow(Sender: TObject);
begin
	fnInitDataShow;

	if DataList.Items.Count > 0 then
	begin
		DataList.SetFocus;
		DataList.Selected	:= DataList.TopItem;
		DataList.ItemFocused:= DataList.TopItem;
	end
	else
	begin
		btnOK.Enabled := False;
		btnCancel.SetFocus;
	end;
end;

//************************************************************************
//*	 Proccess		:	OnEnter
//*	 Paqrameter		:	Object
//*	 Retrun			:	Nathing
//************************************************************************
procedure THAP000012CGroupSelDlgF.DialogEnter(Sender: TObject);
begin
	AcControl := Screen.ActiveControl;
end;

//************************************************************************
//*	 Proccess		:fnInitDataShow
//*					:データ表示
//*	 Paqrameter		:
//*	 Retrun			:
//************************************************************************
procedure THAP000012CGroupSelDlgF.fnInitDataShow;
var
	qryMjsDB	:	TMQuery;
	NewItem		:	TListItem;

	iCode		:	Integer;

//<090608> 未使用なのでコメント
//	sSQL		:	String;
//	iYear		:	Integer;
//	iMonth		:	Integer;
//	iDay		:	Integer;
begin
	qryMjsDB := TMQuery.Create(Self);
	DBMOD.SetDBInfoTOQuery(MJSDB,qryMjsDB);

	try
		try
			DataList.Items.Clear;

			with qryMjsDB do
			begin
//				sSQL := 'SELECT DTName,DTCD,NCode FROM SDT_DCTL'
//				+#13#10+'WHERE SysCd=0001 AND OptCD=00'							//会社別統合ＤＢ
//				+#13#10+'Order By DTCD';

				Close;
				SQL.Clear;
//				SQL.Add(sSQL);
				SQL.Add(	'SELECT ' +
								'SDT.DTCD,' +
								'SDT.NCode,' +
								'SDT.DTCtlCD2,' +
								'SDT.DTCtlCD3,' +
								'SDT.DTCtlCD4,' +
								'SDT.DTName ' +
							'FROM ' +
								'( ' +
									'SELECT ' +
										'A.DTCD,' +
										'A.NCode,' +
										'A.DTCtlCD2,' +
										'A.DTCtlCD3,' +
										'A.DTCtlCD4,' +
										'A.DTName ' +
									'FROM ' +
										'SDT_DCTL AS A ' +
									'WHERE ' +
										'A.SysCD = 1 ' +
										'AND ' +
										'A.OptCD = 0 ' +
								') AS SDT ' +

								'INNER JOIN ' +
								'( ' +
									'SELECT ' +
										'B.DTCD,' +
										'MAX( B.DTCtlCD2 ) AS DTCtlCD2 ' +
									'FROM ' +
										'SDT_DCTL AS B ' +
									'GROUP BY ' +
										'B.DTCD ' +
								') AS SDTM ' +
								'ON ' +
									'SDTM.DTCD = SDT.DTCD ' +
									'AND ' +
									'SDTM.DTCtlCD2 = SDT.DTCtlCD2 ' +

							'ORDER BY ' +
								'SDT.DTCD' );

				if not Open then
					abort;

				while not Eof do
				begin
					iCode := GetFld('DTCD').AsInteger;

//					iYear := FieldByName( 'DTCtlCD2' ).AsInteger;
//					iMonth := FieldByName( 'DTCtlCD3' ).AsInteger;
//					iDay := FieldByName( 'DTCtlCD4' ).AsInteger;

					NewItem := DataList.Items.Add;
//<060220>			NewItem.Caption	:= MjsEditNum(iCode,'0000',8);
					NewItem.Caption	:= MjsEditNum(iCode,'Z000',8);				// <060220>
					NewItem.SubItems.Add(GetFld('DTName').AsString);
//					NewItem.SubItems.Add( IntToStr( MjsGetWarekiYear( MjsIntToDate( iYear * 10000 + iMonth * 100 + iDay , #0 ) , MdtCMP_YMD ) ) );
					NewItem.SubItems.Add(GetFld('NCode').AsString);

					Next;
				end;
			end;
		except
			btnOK.Enabled := False;
		end;
	finally
		qryMjsDB.Close;
		qryMjsDB.Free;
	end;
end;

//************************************************************************
//*	 Proccess		:DataListDblClick
//*					:リストダブルクリック
//*	 Paqrameter		:
//*	 Retrun			:
//************************************************************************
procedure THAP000012CGroupSelDlgF.DataListDblClick(Sender: TObject);
begin
	if DataList.Items.Count < 1 then
		Exit;

	if DataList.ItemFocused = nil then
		Exit;

	btnOKClick(btnOK);
end;

end.
