//**********************************************************************
//		System		:MJSFX
//		Project ID	:HAP000012CBase
//		Project Name:社員情報　入社情報
//		Create By	:H.Itahana(Buntechno)
//		Create Date	:05/06/16
//		Remake Date	:05/11/31 H.Itahana (Buntechno)
//					:・Application対応
//					:07/04/18 H.Takaishi (Buntechno)
//					:・Shift+Tab の動作不具合修正			<2007-04-18>
//					:07/05/09 H.Takaishi (Buntechno)
//					:・前職歴グリッドの制御修正				<2007-05-09>
//					:・学校名／学科名の入力文字数拡張対応
//					:07/10/17 H.Takaishi (TAKUMI)
//					:・前職歴入社年月日重複チェック追加		<2007-10-17>
//					:08/02/14 T.ABE (TAKUMI)				<080214>
//					:・一行削除ボタンをF6へ変更
//					:08/07/25 M.Ono							<080725>
//					:・学歴変更ダイアログ追加
//					:09/06/08 Y.Kondo(TakumiCo.)			<090608>
//					:・前職歴保存方法変更
//					:09/09/08 H.Takaishi(TakumiCo.)			<2009-09-08>
//					:・[F1 学歴情報変更]が使用不可でも[F1]キーが効いていた
//					:・[F6 一行削除]がF7の位置に表示されることがあった
//					:09/10/13 Y.Kondo(TakumiCo.)			<091013>
//					:・前職歴変更担当者フィールド追加対応
//					:2010/01/28 Y.Kondo						<2010-01-28>
//						学歴データのInsertDateとUpDateDateの識別
//					:2010/10/05 Y.Kondo						<2010-10-05>
//						学歴情報がある場合にラベルを表示する
//					:2013/03/09 R.Kobayashi(TAKUMI)
//						MJX対応(グループ会社選択)			<2013-03-09>
//					:2013/12/13 E.Inukai
//						前職履歴から重複チェックロジックを削除
//					:2013/12/13 E.Inukai
//						学歴マスタ対応						<131213>
//					:2019/02/25	N.Honda(CyberCom)
//						新元号対応（指示書）				<NewEraName-K>
//					:2019/03/19 K.Takahashi(CyberCom)
//						新元号対応(Gengou)
//					:2019/04/02 R.Kobayashi(TakumiCo.)
//						うるう年が入力エラーとなる現象を修正<2019-04-02>
//					:2020/02/19	T.Nakamura(NTC)
//					:・Delphi10-コンパイル対応	<D10-C>
//					:2020/04/20	Y.Iwakawa
//					:	基準日対応							<RefDay>
//**********************************************************************
unit HAP000012CBaseU;

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
	VCL.ExtCtrls,
	VCL.StdCtrls,
	ComCtrls,
	MJSPanel,
	MJSSpeedButton,
	MJSStatusBar,
	MJSEdits,
	MJSQuery,
	MJSLabel,
	MJSBitBtn,
	MjsDBModuleU,
	dxCntner,
	dxTL,
	dxDBGrid,
	dxGrClms,
	dxmdaset,
	dxExEdtr,
	Db,
	FireDAC.Comp.Client,
	HAPMsgU	,
	HapApIFU,
	MjsCommon2U,
	SeriesCheckU,	//<2013-03-09>
	HapMNExExpIFU;	//<131213>

type
{$I ActionInterface.inc}
// <NewEraName-K> ADD Start
{$I HAPEraNameCtrl_H.inc}
// <NewEraName-K> ADD End

	TGroupRec = record
		GroupCode	:	Int64;
		GroupName	:	String;
	end;

  THAP000012CBaseF = class(TForm)
	PTool: TMPanel;
	PMain: TMPanel;
	MLabel31: TMLabel;
	MLabel32: TMLabel;
	MPanel10: TMPanel;
	MLabel33: TMLabel;
	EGakureki: TMNumEdit;
	LEGakureki: TMLabel;
	EGakubu: TMNumEdit;
	MLabel35: TMLabel;
	LEGakubu: TMLabel;
	MLabel37: TMLabel;
	EGakkouName: TMTxtEdit;
	MLabel38: TMLabel;
	ESotutai: TMNumEdit;
	LESotutai: TMLabel;
	ESotugyou: TMDateEdit;
	MLabel40: TMLabel;
	MLabel41: TMLabel;
	EGakkaName: TMTxtEdit;
	MLabel42: TMLabel;
	EGakkou: TMNumEdit;
	LEGakkou: TMLabel;
	MPanel2: TMPanel;
	MLabel9: TMLabel;
	EHobby1: TMTxtEdit;
	EHobby2: TMTxtEdit;
	MPanel4: TMPanel;
	ETokugi1: TMTxtEdit;
	ETokugi2: TMTxtEdit;
	MPanel5: TMPanel;
	MLabel16: TMLabel;
	ELanguage: TMNumEdit;
	LELanguage: TMLabel;
	MLabel11: TMLabel;
	MPanel1: TMPanel;
    MLabel3: TMLabel;
	EHomeCity: TMNumEdit;
	LEHomeCity: TMLabel;
    MLabel5: TMLabel;
	ENational: TMNumEdit;
	LENational: TMLabel;
	MLabel20: TMLabel;
	MLabel21: TMLabel;
	MPanel3: TMPanel;
	MLabel24: TMLabel;
	LEBunrui1: TMLabel;
	MLabel28: TMLabel;
	LEBunrui2: TMLabel;
	MLabel45: TMLabel;
	LEBunrui3: TMLabel;
	EBunrui1: TMNumEdit;
	EBunrui2: TMNumEdit;
	EBunrui3: TMNumEdit;
	MPanel6: TMPanel;
	ETokki: TMTxtEdit;
	MLabel26: TMLabel;
	MLabel27: TMLabel;
	MLabel30: TMLabel;
	MLabel44: TMLabel;
	MPanel8: TMPanel;
	MLabel47: TMLabel;
	LESaiyo: TMLabel;
	MLabel49: TMLabel;
	LESyokai: TMLabel;
	MLabel51: TMLabel;
	MLabel52: TMLabel;
	LEZokugara: TMLabel;
	ESaiyo: TMNumEdit;
	ESyokai: TMNumEdit;
	ESyokaiName1: TMTxtEdit;
	EZokugara: TMNumEdit;
	MLabel1: TMLabel;
	MLabel2: TMLabel;
	MPanel7: TMPanel;
	MLabel4: TMLabel;
	LEKanyuKbn: TMLabel;
	MLabel10: TMLabel;
	EKanyuKbn: TMNumEdit;
	EDattaiDate: TMDateEdit;
	MLabel7: TMLabel;
	EkanyuDate: TMDateEdit;
	MLabel6: TMLabel;
	MPanel9: TMPanel;
	DxZenGrid: TdxDBGrid;
	DxZenGridColumn1: TdxDBGridColumn;
	DxZenGridColumn2: TdxDBGridColumn;
	DxZenGridColumn6: TdxDBGridColumn;
	DxZenGridColumn5: TdxDBGridColumn;
	MemData: TdxMemData;
	DataSource: TDataSource;
	MemDataCopName: TStringField;
	MemDataSyokusyu: TStringField;
	MemDataPostName: TStringField;
	MemDataNyuSya: TDateTimeField;
	MemDataRetire: TDateTimeField;
	MemDataBikou: TStringField;
	DxZenGridColumn7: TdxDBGridDateColumn;
	DxZenGridColumn8: TdxDBGridDateColumn;
	MLabel8: TMLabel;
	LEKbnStoc1: TMLabel;
	MLabel13: TMLabel;
	LEKbnStoc2: TMLabel;
	MLabel15: TMLabel;
	LEKbnStoc3: TMLabel;
	EKbnStoc1: TMNumEdit;
	EKbnStoc2: TMNumEdit;
	EKbnStoc3: TMNumEdit;
	MLabel18: TMLabel;
	LEKbnStoc4: TMLabel;
	MLabel22: TMLabel;
	LEKbnStoc5: TMLabel;
	EKbnStoc4: TMNumEdit;
	EKbnStoc5: TMNumEdit;
	MLabel12: TMLabel;
	MLabel14: TMLabel;
	MLabel17: TMLabel;
	ESyokaiName2: TMTxtEdit;
	MLabel19: TMLabel;
	BspGCorp: TMSpeedButton;
	MemDataGroupCode: TFloatField;
	GakurekiMem: TdxMemData;
	GakurekiMemEmpNCode: TCurrencyField;
	GakurekiMemGNo: TIntegerField;
	GakurekiMemGName: TStringField;
	GakurekiMemGkey: TIntegerField;
	GakurekiMemEE: TIntegerField;
	GakurekiMemYYYY: TIntegerField;
	GakurekiMemMM: TIntegerField;
	GakurekiMemGakureki: TStringField;
	GengoMem: TdxMemData;
	Obj210004DSeibetsuMemDivision: TIntegerField;
	Obj210004DSeibetsuMemDescription: TStringField;
	MemDataCarNCode: TIntegerField;
	DelSCRMem: TdxMemData;
	DelSCRMemSCRNCode: TIntegerField;
	GakurekiMemOrderNo: TIntegerField;
	GakurekiMemNCode: TIntegerField;
	GAKUHIS: TMLabel;
    EGakkouNo: TMNumEdit;
    EGakkaNo: TMNumEdit;
	procedure FormCreate(Sender: TObject);
	procedure DxZenGridEnter(Sender: TObject);
	procedure DxZenGridExit(Sender: TObject);
	procedure DxZenGridKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure BspGCorpClick(Sender: TObject);
	procedure DxZenGridCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
	  ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
	  ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
	  var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
	  var ADone: Boolean);
	procedure DxZenGridChangeColumn(Sender: TObject; Node: TdxTreeListNode;
	  Column: Integer);
	procedure DxZenGridChangeNode(Sender: TObject; OldNode,
	  Node: TdxTreeListNode);
	procedure MemDataAfterCancel(DataSet: TDataSet);
	procedure FormDestroy(Sender: TObject);
    procedure ArrowClick(Sender: TObject);
    procedure Change(Sender: TObject);
  private
	{ Private 宣言 }
	pAppRec		:	^TMjsAppRecord;												//Menuから受け取るﾊﾟﾗﾒｰﾀのﾎﾟｲﾝﾀ
	pHapApParam	:	^THapApParam;												//給与親子間ﾊﾟﾗﾒｰﾀ
	ACCtrl		:	TWinControl;												//ﾌｫｰｶｽ復帰
	ddCopDB		:	TFDConnection;
	ddMjsDB		:	TFDConnection;
	MDBModule	:	TMDataModuleF;
	rcMsg		:	TMjsMsgRec;
	iRekiKbn	:	integer;
	m_Series	:	TMSeries;	//<2013-03-09>

	procedure	fnFormIni;
	procedure	fnWCTLEnter(Sender:TObject);
	procedure	fnWCTLExit(Sender:TObject);
	procedure	fnDetailSet;
	procedure	fnDetailEnable(bEnable:boolean);
	procedure	fnEditEnd;
	function	fnUpdate: boolean;

  // AP独自
	function	fnSetListItem(MEdit:TMNumEdit;iItemNo:Integer):Boolean;
	procedure	fnSetProperty(iKbn: integer; eEdit: TMNumEdit);
	Function	fnFocusGET(iPara : Integer) : TWinControl;
	Function	fnDateCheck(DateEdit : TMDateEdit) : Boolean;
	Function	fnNumCheck(Edit : TMNumEdit) : Boolean;
	function	fnGetList(MEdit:TMNumEdit):string;

	Function	fnTableGet(iCode : INteger; SList,FList : Pointer) : String;OverLoad;
	Function	fnTableGet(iCode : INteger; var SFName : String) : Integer;OverLoad;
	Function	fnPartsGet(iCode : INteger) : TCustomEdit;
	procedure	fnDateFormatSet;
	function	fnGetCorpName(iCopCD: Int64): String;

	//<080214>
	procedure	BSpDeleteClick;
	procedure	fnFBarClick;

	// <080725>
	procedure	BGakurekiClick;													// F1押下
	function	fnFormatDateGEE(var iG, iEE: Integer; iY: Integer): Boolean;	// 和暦年取得
	procedure	fnInitDataShow;													// 学歴情報取得
	function	fnGakurekiUpdate: Boolean;										// 更新処理
	function	fnGetHAPMNExName(KubunNo : Integer; KM_ItemNo : Integer) : String;	//<131213>
//<RefDay> ↓
	procedure	fnRefColorChange;													//基準日取得・ラベル色変更
	function	fnRefItemGet(iCode : Integer) : Boolean;						//基準日項目の取得、Edit代入
//<RefDay> ↑

  public

	constructor CreateForm(pRec,pParam: pointer);
	{ Public 宣言 }


  protected
	procedure CMChildKey(var Msg:TWMKey);message CM_ChildKey;
  end;

  function AppEntry(pPar:pointer):integer;


exports
  AppEntry;

//var
//	HAP000012CBaseF: THAP000012CBaseF;

implementation
uses
	MjsCommonU,
	MjsDateCtrl,
	MjsDispCtrl,
	MjsKeyDataState,
	HAP000012CGakurekiDlgU,														// <080725> 学歴変更ダイアログ
	HAP000012CGroupSelDlgU;

const

{$I HapCmnDef.inc}

	ENABLE = 0;
	NOT_ENABLE = 1;
	NO_DATA = 2;

	ArrItem	:	Array[0..32] of Integer =
	(
	110900,		// 採用区分
	111000,		// 紹介先区分
	111101,		// 紹介者(姓)
	111102,		// 紹介者(名)
	111200,		// 続柄
	145500,		// 出身地
	145600,		// 国籍
	145000,		// 趣味
	145100,		// 特技
	145200,		// 趣味2
	145300,		// 特技2
	145400,		// 語学

	111300,		// 最終学歴
	111500,		// 卒退区分
	111400,		// 卒業年月日
	111600,		// 学校区分
	111710,		// 最終学校	<131213>
	111700,		// 最終学校名
	111800,		// 学部区分
	111910,		// 学科 <131213>
	111900,		// 学科名

	112200,		// 組合加入区分
	112300,		// 加入年月日
	112301,		// 脱退年月日

	110600,		// 分類1
	110700,		// 分類2
	110800,		// 分類3
	112700,		// 予備1
	112800,		// 予備2
	112900,		// 予備3
	113000,		// 予備4
	113100,		// 予備5
	145700		// 特記事項
	);

	//<080214> ファンクション表示
	arrFuncClear:array[0..7]of string=(			//消去用
											'F1 学歴情報変更,0',				// <080725>
											'',
											'',
											'',
											'',
											'F6 一行削除,0',
											'',
											''
											);


	arrFunc06:array[0..7]of string=(
											'F1 学歴情報変更,0',				// <080725>
											'',
											'',
											'',
											'',
											'F6 一行削除,1',
											'',
											''
											);

	// <080725>
	arrFunc01:array[0..7]of string=(
											'F1 学歴情報変更,1',
											'',
											'',
											'',
											'',
											'F6 一行削除,0',	// <2009-09-08>
											'',
											''
											);
{$R *.DFM}
// <NewEraName-K> ADD Start
{$I HAPEraNameCtrl_B.inc}
// <NewEraName-K> ADD End

//**********************************************************************
//		AP入口
//**********************************************************************
//**********************************************************************
//		Process		:AppEntry
//		Name		:X.Name
//		Date		:2002/ 02 / 06
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function AppEntry(pPar:pointer):integer;
var
	pForm	: ^THAP000012CBaseF;
	pRec	: ^TMjsAppRecord;
	pActionParam:^THapApParam;
	iAction	: integer;
begin
	Result	:= ACTID_RET_NG;
	pRec	:= Pointer( TAppParam( pPar^ ).pRecord );							//TMjsAppRecord 構造体 pointer 取得
	pActionParam:= Pointer( TAppParam( pPar^ ).pActionParam );					//送受信ﾊﾟﾗﾒｰﾀ
	iAction := TAppParam( pPar^ ).iAction;										//Action ID 取得

	case iAction of

		ACTID_FORMCREATESTART ,
		ACTID_FORMCREATESHOWSTART :
		begin
			try
				New( pForm );
//2005-10-31
//				pRec^.m_pChildForm := pForm;
			except
				Exit;
			end;

			try
				pForm^ := THAP000012CBaseF.CreateForm( pRec,pActionParam );
//2005-10-31
				pRec^.m_pChildForm := pForm;

				if iAction = ACTID_FORMCREATESHOWSTART then
				begin
					pForm^.Show;
					THAP000012CBaseF(pForm^).PTool.Show;						//処理ﾎﾞﾀﾝ[可視]
//					PostMessage(pForm^.Handle,WM_SETFOCUS,0,0);
				end;
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

		ACTID_FORMCANCLOSESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );

			if pForm^.CloseQuery = False then
			begin
				Exit;
			end;
		end;

		ACTID_SHOWSTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			pForm^.Show;
			THAP000012CBaseF(pForm^).PTool.Show;								//処理ﾎﾞﾀﾝ[可視]
		end;

		ACTID_HIDESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );

			if pForm^.Parent <> nil then
			begin
				pForm^.Hide;
				THAP000012CBaseF(pForm^).PTool.Hide;							//処理ﾎﾞﾀﾝ[不可視]
			end;
		end;

		HAPAP_ACTID_SHOWDATA:		//社員内容表示
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000012CBaseF(pForm^).fnDetailSet;
		end;

		HAPAP_ACTID_ENABLE:														//内容部[使用可]
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000012CBaseF(pForm^).fnDetailEnable(True);
		end;

		HAPAP_ACTID_DISABLE:													//内容部[使用不可]
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000012CBaseF(pForm^).fnDetailEnable(False);
		end;

		HAPAP_ACTID_SETFOCUS,		//ﾌｫｰｶｽ復帰
		HAPAP_ACTID_SETFOCUS_FIRST,	//ﾌｫｰｶｽ先頭
		HAPAP_ACTID_SETFOCUS_LAST:	//ﾌｫｰｶｽ最終
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			with THAP000012CBaseF(pForm^) do
			begin
				if iAction=HAPAP_ACTID_SETFOCUS_FIRST then	//先頭
					ACCtrl:=THAP000012CBaseF(pForm^).fnFocusGet(HAPAP_ACTID_SETFOCUS_FIRST);

				if iAction=HAPAP_ACTID_SETFOCUS_LAST then	//最終
					ACCtrl:=dxZenGrid;

				MjsSetFocus(THAP000012CBaseF(pForm^),ACCtrl.Name);
			end;
			HapSendToOwner(HAPAP_ACTID_ENTER_OK,pRec,pActionParam);
		end;

		HAPAP_ACTID_EXIT:			//終了通知
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000012CBaseF(pForm^).fnEditEnd;
		end;

		HAPAP_ACTID_FBARCLICK:		//ﾌｧﾝｸｼｮﾝﾊﾞｰｸﾘｯｸ
		begin
			//<080214>
			pForm := Pointer( pRec^.m_pChildForm );
			{ﾌｧﾝｸｼｮﾝNoの取り出しと現在ｺﾝﾎﾟｰﾈﾝﾄにより判定を行う}
			THAP000012CBaseF(pForm^).fnFBarClick;
		end;
	end;

	Result:=ACTID_RET_OK;
end;

//**********************************************************************
//		ｺﾝｽﾄﾗｸﾀ
//**********************************************************************
//**********************************************************************
//		Process		:ｺﾝｽﾄﾗｸﾀ
//		Parameter	:
//		Return		:
//		History		:19/03/19(K.Takahashi(CyberCom))
//					:新元号対応(Gengou)
//**********************************************************************
constructor THAP000012CBaseF.CreateForm(pRec,pParam:pointer);
var
	PCallForm	: ^TControl;													//2005-10-31
begin
	pAppRec		:= pRec;
	pHapApParam	:= pParam;
	MDBModule	:= TMDataModuleF(pAppRec^.m_pDBModule^);
	ddCopDB		:= pHapApParam^.GetCopDB;
	ddMjsDB		:= pHapApParam^.GetMjsDB;

//<2013-03-09>St
	m_Series	:= TMSeries.Create;

	if	Assigned(m_Series) <> True	then
	begin
		GetMsg(rcMsg,200,1);
		with rcMsg do
		begin
			MjsMessageBoxEx(Self,'シリーズ判定の生成に失敗しました。'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
		end;

		Exit;
	end;
//<2013-03-09>Ed

	PCallForm	:= TMjsAppRecord(pAppRec^).m_pOwnerForm;						//2005-10-31

//2005-10-31
//	inherited Create(Application);
	inherited Create(PCallForm^);
// <NewEraName-P1> ADD Start

	DxZenGridColumn7.Gengou := GetEraName(Now(), emAlpha)[1];
	DxZenGridColumn8.Gengou := GetEraName(Now(), emAlpha)[1];
// <NewEraName-P1> ADD End
end;

//**********************************************************************
//		COMPONENT	EVNET	FUNCTION
//**********************************************************************
//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Process		:ﾌｫｰﾑ作成
//		Parameter	:
//		Return		:
//		History		:
//					:
//**********************************************************************
procedure THAP000012CBaseF.FormCreate(Sender: TObject);
begin
	fnFormIni;			//ﾌｫｰﾑ初期処理
	MjsFontResize(THAP000012CBaseF(Self),pointer(pAppRec));
end;

//**********************************************************************
//		DETAIL	FUNCTION
//**********************************************************************
//**********************************************************************
//		Process		:CMChildKeyﾒｯｾｰｼﾞ取得
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.CMChildKey(var Msg:TWMKey);
var
	ACtl	: TWinControl;
	sShift	: TShiftState;
	TCom	: TWinControl;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	ACtl	:= Screen.ActiveControl;
	sShift	:= MjsKeyDataToShiftState(Msg.KeyData);

	//前職歴グリッド
	if (ACtl=DxZenGrid) then
	begin
		if (DxZenGrid.EditingText <> '') and
			(Msg.CharCode in [VK_LEFT, VK_RIGHT]) then
		begin
			Exit;
		end;

		if (( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ))
			or ( Msg.CharCode = VK_UP ) or ( Msg.CharCode = VK_LEFT )then
		begin
			if (( MemData.RecNo=1) or ( MemData.Recno = 0))
			and (DxZenGrid.FocusedColumn = 0) then
			begin
				//<080214>
				//BSpDelete.Enabled	:= False;

				BspGCorp.Enabled	:= False;
				MJSSetFocus(Self,ETokki.Name);
				Msg.CharCode := 0;
				Abort;
			end;
		end;

		if ( Msg.CharCode = VK_TAB ) and (sShift = []) then
		begin
			if ((MemData.Recno=MemData.RecordCount ) or ( MemData.Recno = 0))
			and (DxZenGrid.FocusedColumn = 5) then
			begin
				//<080214>
				//BSpDelete.Enabled	:= False;

				BspGCorp.Enabled	:= False;

				HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN,pAppRec,pHapApParam);
				Msg.CharCode := 0;
				Abort;
			end;
		end;

		//ESCキーは親に移動。ENDキーは最上部ならば親に移動　
		if (Msg.CharCode = VK_END) or (Msg.CharCode = VK_ESCAPE) then
		begin
			// <2007-05-09>
			if Msg.CharCode = VK_END then
			begin
				if (DxZenGrid.EditingText <> '') or
					(DxZenGrid.FocusedColumn <> 5) then
				begin
					exit;
				end;

				if (DxZenGrid.FocusedColumn = 5) and
					(MemData.RecNo <> MemData.RecordCount) then
				begin
					MemData.Last;
					exit;
				end;
			end;

			if MemData.State in [dsEdit,dsInsert] then
			begin
				if Msg.CharCode = VK_ESCAPE then
				begin
					MemData.Cancel;
				end;
				exit;
			end;

			//<080214>
			//BSpDelete.Enabled	:= False;

			BspGCorp.Enabled	:= False;

			HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN,pAppRec,pHapApParam);
			Msg.CharCode:=0;
			Abort;
		end;

		//会社名でDELキー・BSキー押下の場合、ｸﾞﾙｰﾌﾟ会社であっても削除される。
		if (Msg.CharCode = VK_DELETE) or (Msg.CharCode = VK_BACK) then
		begin
			if (DxZenGrid.FocusedColumn = 0)
			and(DxZenGrid.Columns[0].ReadOnly = True) then
			begin
				MemData.Edit;
				MemData.FieldByName('GroupCode').AsFloat := 0;					//ｸﾞﾙｰﾌﾟ会社ｺｰﾄﾞ削除
				MemData.FieldByName('CopName').AsString	:=	'';					//会社名削除
				DxZenGrid.Columns[0].ReadOnly := False;
			end;
		end;

		Exit;
	end;

	//TAB
	if ((Msg.CharCode = VK_Return)or((Msg.CharCode = VK_TAB)and(sShift = []))or(Msg.CharCode = VK_DOWN)) then
	begin
		if ACtl = ETokki then													// 最後なら
		begin
			MJSSetFocus(Self,DxZenGrid.name);
			Msg.CharCode:=0;
			Abort;
		end;

		Msg.CharCode:=0;
		MjsNextCtrl(Self);
		Abort;
	end;

	//END/ESC
	if(Msg.CharCode=VK_ESCAPE)or
		(Msg.CharCode=VK_END)then
	begin
		if(Msg.CharCode=VK_END)and
			(ACtl is TMTxtEdit) then
		begin
			if not MjsChkCurEnd(ACtl) then
				Exit;
		end;

		//<131213>↓
        if (ACtl = EGakkouNo) or (ACtl = EGakkaNo) then
		begin
			if not fnNumCheck(TMNumEdit(ACtl)) then
			begin
				Exit;
			end;
		end;
		//<131213>↑

		HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN,pAppRec,pHapApParam);			// ボタンへ

		Msg.CharCode:=0;
		Abort;
	end;

	if not(ACtl is TCustomEdit) then				//文字入力除く
	begin
		case Msg.CharCode of
			VK_RETURN, VK_RIGHT, VK_DOWN:
			begin
				//更新/取消押下
				if (ACtl is TMBitBtn) and (Msg.CharCode = VK_RETURN ) then
					Exit;

				if sShift = [] then
				begin
					Msg.CharCode:=0;
					MjsNextCtrl(Self);
					Abort
				end;
			end;

			VK_LEFT, VK_UP:
			begin
				if sShift = [] then
				begin
					Msg.CharCode:=0;
					MjsPrevCtrl(Self);
					Abort;
				end;
			end;

			VK_ESCAPE, VK_END:
			begin
				Exit;
			end;
		end;
	end;

	if ACtl is TWinControl then
	begin
		case Msg.CharCode of
			VK_TAB:
				if sShift = [ssShift] then
				begin
					TCom := fnFocusGET(HAPAP_ACTID_SETFOCUS_FIRST);				// 移動可能な先頭を取得
					if ACtl = TCom then
					begin
						HapSendToOwner(HAPAP_ACTID_SETFOCUS_TAB,pAppRec,pHapApParam);
																				// タブへ
						Msg.CharCode	:= 0;
						Abort;
					end
					else	// <2007-04-18>
					begin
						MjsPrevCtrl(Self);
						Msg.CharCode	:= 0;
						Abort;
					end;
				end
				else
					Exit;

			VK_RETURN, VK_DOWN:
				if sShift = [] Then
				begin
					Msg.CharCode	:= VK_RETURN;
					MjsNextCtrl(Self);
					Abort;
				end;
			VK_UP:
			begin
				TCom := fnFocusGET(HAPAP_ACTID_SETFOCUS_FIRST);					// 移動可能な先頭を取得
				if ACtl <> TCom then
					MjsPrevCtrl(Self);
				Msg.CharCode	:= 0;
				Abort;
			end;
			// <080725>>>
			VK_F1:
			begin
				BGakurekiClick;
			end;
			// <<<080725>
		end;

		if ACtl is TCustomEdit then
		begin
			{NumEditはｷｬﾚｯﾄ位置判定不要}
			if(ACtl is TMDateEdit)or
			  (ACtl is TMNumEdit)then
			begin
				if(Msg.CharCode = VK_LEFT) and (sShift = []) then
				begin
					TCom := fnFocusGET(HAPAP_ACTID_SETFOCUS_FIRST);				// 移動可能な先頭を取得
					if ACtl <> TCom then
						MjsPrevCtrl(Self);
					Msg.CharCode	:= 0;
					Abort;
				end;
				if(Msg.CharCode = VK_RIGHT) and (sShift = []) then
				begin
					MjsNextCtrl(Self);
					Msg.CharCode	:= 0;
					abort;
				end;
			end;
			{NumEdit End}

			{以下ｷｬﾚｯﾄ位置判定}
			if MjsChkCurTop(ACtl) and (Msg.CharCode = VK_LEFT) and (sShift = []) then
			begin
				TCom := fnFocusGET(HAPAP_ACTID_SETFOCUS_FIRST);					// 移動可能な先頭を取得
				if ACtl <> TCom then
					MjsPrevCtrl(Self);
				Msg.CharCode	:= 0;
				abort;
			end;

			if MjsChkCurEnd(ACtl) and (Msg.CharCode = VK_RIGHT) and (sShift = []) then
			begin
				MjsNextCtrl(Self);
				Msg.CharCode := 0;
				abort;
			end;

			Exit;																//入力途中は抜けない
		end;
	end;

	inherited;

end;

//**********************************************************************
//		Process		:ﾌｫｰﾑおよびｺﾝﾎﾟｰﾈﾝﾄ初期化
//		Parameter	:
//		Return		:
//		History		:
//					:
//					:
//**********************************************************************
procedure THAP000012CBaseF.fnFormIni;
var
	i:integer;

	Function	fnKMNameGet(iCode : Integer) : String;
	var
		KMQuery	:	TMQuery;
	begin
		result := '';
		KMQuery := TMQuery.Create(self);					// MQueryの構築

		if Assigned(KMQuery) <> true then
		begin
			Exit;
		end;

		with KMQuery do
		begin
			try
				try
					MDBModule.SetDBInfoToQuery(ddCopDB, KMQuery);
															// DBとの接続
					Close();
					SQL.Clear();
					SQL.Add('Select');
					SQL.Add('ItemName');
					SQL.Add('From HAPKM');
					SQL.Add('Where');
					SQL.Add('ItemNo = :ItemNo');
					ParamByName('ItemNo').AsInteger := iCode;

					Open();

					if not Eof then
						Result := GetFld('ItemName').AsString;

				except
					result := '';
				end;
			finally
				Close;
				Free;
			end;
		end;
	end;

begin

	fnDateFormatSet;															//西暦和暦切替え設定

	MjsCompoResize(PTool,0,pointer(pAppRec));

	//<080214>
	//MjsCompoResize(BSpDelete,0,pointer(pAppRec));

	MjsCompoResize(BspGCorp,0,pointer(pAppRec));

	HapChildFormPropertySet(	THAP000012CBaseF(Self),							//ﾌｫｰﾑ
								PTool,											//処理ﾎﾞﾀﾝ
								PMain,											//内容部
								pAppRec,										//親APから受け取ったMjsAppRecordﾎﾟｲﾝﾀ
								pHapApParam	);									//親APから受け取ったHapApParamﾎﾟｲﾝﾀ


//設計
	for i:=0 to ComponentCount-1 do
	begin
		if(Components[i] is TMPanel)then
		begin
			(Components[i] as TMPanel).ParentColor := True;
		end;

		if(Components[i]is TMNumEdit)then
			with(Components[i]as TMNumEdit)do
			begin
				Negative:=FALSE;
				ImeMode	:=imDisable;
			end;

		if(Components[i]is TMDateEdit)then
			with(Components[i]as TMDateEdit)do
			begin
				if(iRekiKbn=1)then
					DateFormat:=MJSEdits.dfYMD
				else
					DateFormat:=MJSEdits.dfEMD;
				ImeMode	:=imDisable;
			end;
	end;


//初期設定

	Parent			:=TPanel(pAppRec^.m_pOwnerPanel^);
	BorderStyle		:=bsNone;
	Align			:=alClient;

//表示色変更

	MjsColorChange(	THAP000012CBaseF(Self),
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysColorB,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysColorD,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysBaseColorB,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysBaseColorD,
					rcCOMMONAREA(pAppRec^.m_pCommonArea^).SysFocusColor
					);


	for i:=0 to ComponentCount-1 do
	begin
		//ｺﾝﾎﾟｰﾈﾝﾄ初期ｸﾘｱ
		if Components[i] is TMNumEdit then
		begin
			if (Components[i] as TMNumEdit).SelectColCount > 0 then				// リストを使用（未使用は0にした）
			begin
				(Components[i] as TMNumEdit).SelectDisp := sdArrowClick;		// リスト表示形式
				fnSetListItem((Components[i] as TMNumEdit),(Components[i] as TMNumEdit).Tag);
																				// リストに項目をSet
			end;
			(Components[i] as TMNumEdit).Value:=0;
		end;
		if Components[i] is TMTxtEdit then
			(Components[i] as TMTxtEdit).Text:='';

		if Components[i] is TMDateEdit then
			(Components[i] as TMDateEdit).Value:=0;

		if (Components[i] is TMLabel) then
		begin
			// ラベルの名称を動的に変更
			if (Components[i] as TMLabel).tag > 0 then
			begin
				(Components[i] as TMLabel).Caption := fnKMNameGet((Components[i] as TMLabel).Tag);
			end;

			if (Components[i] is TMLabel)and
				(Copy((Components[i] as TMLabel).Name,1,1)='L') then
					(Components[i] as TMLabel).Caption:='';
		end;
		//ｲﾍﾞﾝﾄ割り付け
		if Components[i] is TMNumEdit then
		begin
			(Components[i] as TMNumEdit).OnEnter:=fnWCTLEnter;
			(Components[i] as TMNumEdit).OnExit	:=fnWCTLExit;
		end;
		if Components[i] is TMTxtEdit then
		begin
			(Components[i] as TMTxtEdit).OnEnter:=fnWCTLEnter;
			(Components[i] as TMTxtEdit).OnExit	:=fnWCTLExit;
		end;
		if Components[i] is TMDateEdit then
		begin
			(Components[i] as TMDateEdit).OnEnter	:=fnWCTLEnter;
			(Components[i] as TMDateEdit).OnExit	:=fnWCTLExit;
		end;
		if Components[i] is TMBitBtn then
		begin
			(Components[i] as TMBitBtn).OnEnter	:=fnWCTLEnter;
			(Components[i] as TMBitBtn).OnExit	:=fnWCTLExit;
		end;
	end;

	// Galileoptシリーズのみ表示 <2013-03-09>
	BspGCorp.Visible	:= not m_Series.IsMjsLink3;

end;

//**********************************************************************
//		Component	:ALL
//		Event		:Enter
//		Proccess	:ﾌｫｰｶｽ取得
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.fnWCTLEnter(Sender:TObject);
begin

	if (Sender as TWinControl).ControlCount>0 then
		Exit;

	ACCtrl:=Sender as TWinControl;

	pHapApParam^.SetFuncCaption(arrFuncClear);									// ﾌｧﾝｸｼｮﾝ消去
	HapSendToOwner(HAPAP_ACTID_FBARCAPTION,pAppRec,pHapApParam);

	{学歴情報項目にフォーカスがある時はF1使用可}
	// <080725>>>
	if (Sender = EGakureki) or (Sender = ESotutai) or (Sender = ESotugyou) or
		(Sender = EGakkou) or (Sender = EGakkouName) or (Sender = EGakubu) or
		(Sender = EGakkaName) or (ACCtrl = EGakkouNo) or (ACCtrl = EGakkaNo) then	//<131213>
	begin
		pHapApParam^.SetFuncCaption(arrFunc01);									// F1
		HapSendToOwner(HAPAP_ACTID_FBARCAPTION,pAppRec,pHapApParam);
	end;
	// <<<080725>

	//<080214>
	//BSpDelete.Enabled	:= FALSE;

	BspGCorp.Enabled	:= FALSE;
end;

//**********************************************************************
//		Component	:ALL
//		Event		:Enter
//		Proccess	:ﾌｫｰｶｽ消失
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.fnWCTLExit(Sender:TObject);
begin

	if Sender is TMDateEdit then
	begin
		if not HapActiveControlOnForm(Self) then								//ﾌｫｰﾑ自体のﾌｫｰｶｽ消失によるExitｲﾍﾞﾝﾄ
			Exit;																//以下不要

		fnDateCheck(Sender as TMDateEdit);										// 日付の入力値をSet
	end
	else if Sender is TMNumEdit then
	begin
		if not HapActiveControlOnForm(Self) then								//ﾌｫｰﾑ自体のﾌｫｰｶｽ消失によるExitｲﾍﾞﾝﾄ
			exit;
		if (Sender as TMNumEdit).SelectColCount > 0 then
			fnNumCheck(Sender as TMNumEdit);									// 入力値のチェック
	end;

end;

//**********************************************************************
//		Proccess	:社員内容表示
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.fnDetailSet;
var
	Query		:	TMQuery;
	i			:	Integer;
	sFieldName,
	sTableName	:	TStringList;

	sField,
	sWk,
	sCopName	:	String;

	Lbl			:	TMLabel;
	TComP		:	TCusTomEdit;
	iNo			:	Integer;
	iCopCd		:	Int64;

const
	DEF_DATE = '1890/12/30';
begin

	Query := TMQuery.Create( Self );											// MQueryの構築
	MDBModule.SetDBInfoToQuery( ddCopDB, Query );
	sTableName := TStringList.Create;											// StringListの構築
	sFieldName := TStringList.Create;											// StringListの構築
	sTableName.Clear;
	sFieldName.Clear;
	try
		try
			with Query do
			begin
				Close;
				SQL.Clear();

				SQL.Add('Select HAPSC.NCode');
			// 項目をSet
				for i := 0 to Length(ArrItem)-1 do
					begin
					SQL.Add(',');
						sWk := fnTableGet(ArrItem[i],@sTableName,@sFieldName);		// テーブル名とフィールド名を取得
					if Trim(sWk) = '' then										// 項目名称失敗
					begin
						GetMsg(rcMsg,200,1);
						with rcMsg do
							MjsMessageBoxEx(Self,'項目名取得失敗' + IntToStr(ArrItem[i]),sTitle,IconType,BtnType,BtnDef,LogType);
						abort;
					end;
					SQL.Add(sWk);
				end;
				SQL.Add('From HAPSC');
			// データのないものがあるのでJoin
				for i := 0 to STableName.Count - 1 do
				begin
					if STableName[i] = 'HAPSC' then
						continue;

					SQL.Add('Left Outer Join ' + STableName[i]+' on HAPSC.NCode = '+STableName[i]+'.EmpNCode');
					SQL.Add('AND HAPSC.CorpNCode = '+STableName[i]+'.CorpNCode')
				end;
				SQL.Add('Where HAPSC.NCode = :EmpNCd');
				SQL.Add('AND HAPSC.CorpNCode = :CopNCd');

				ParamByName('EmpNCd').AsCurrency := pHapApParam^.GetEmpNCd;
				ParamByName('CopNCd').AsCurrency := 0;

				Open(TRUE);
			// データSet
				if not Eof then
				begin
					for i := 0 to Length(ArrItem) - 1 do
					begin
						TComP := fnPartsGet(ArrItem[i]);						// 項目に該当するコンポーネント取得
						sField := TrimRight(sFieldName[i]);						// スペースを省略
						if TComP is TMNumEdit then
						begin
							if not GetFld(sField).isNull then
							begin
								(TComP as TMNumEdit).Value := GetFld(sField).AsInteger;

								//<131213>↓
								if (TComP as TMNumEdit = EGakkouNo) or (TComP as TMNumEdit = EGakubu) or (TComP as TMNumEdit = EGakkaNo) then
								begin
									sWk := fnGetHAPMNExName((TComP as TMNumEdit).AsInteger, (TComP as TMNumEdit).Tag);
								end
								else
								begin
									sWk := fnGetList(TComP as TMNumEdit);			// リストから項目取得
								end;
								//<131213>↑

								Lbl := TMLabel(MJSFindCtrl(Self,'L' + TComP.Name));
								Lbl.Caption := sWk;
							end
							else
							begin
								(TComP as TMNumEdit).Value := 0;
								Lbl := TMLabel(MJSFindCtrl(Self,'L' + TComP.Name));
								Lbl.Caption := '';
							end;
						end
						else if TComP is TMDateEdit then
						begin
							if not GetFld(sField).isNull then
							begin
								(TComP as TMDateEdit).AsDateTime := GetFld(sField).AsDateTime;
							end
							else
							begin
								(TComP as TMDateEdit).AsDateTime := 0;
							end;
						end
						else if TComP is TMTxtEdit then
						begin
							if not GetFld(sField).isNull then
							begin
								(TComP as TMTxtEdit).Text := GetFld(sField).AsString;
							end
							else
							begin
								(TComP as TMTxtEdit).Text := '';
							end;
						end
					end;
				end;

				//<131213>↓
				if GetFld('GatukouKubun').AsInteger <> 0 then
				begin
					EGakkouName.Text := fnGetHAPMNExName(GetFld('GatukouKubun').AsInteger, 111710);
				end;

				if GetFld('GatukaKubun').AsInteger <> 0 then
				begin
					EGakkaName.Text := fnGetHAPMNExName(GetFld('GatukaKubun').AsInteger, 111910);
				end;
				//<131213>↑

			// 前職読みこみ
//<091013> S
//履歴削除保管Mem初期化
				DelSCRMem.Close;
				DelSCRMem.Open;
//<091013> E

				MemData.Close;
				MemData.Open;
				Close;
				SQL.Clear;
				SQL.Add(' Select '
						+'CarNCode,'	);										//前職歴内部コード<091013>
				SQL.Add(' LCorpName,'	);										//会社名
				SQL.Add(' LCorpNCode,'	);										//ｸﾞﾙｰﾌﾟ会社ｺｰﾄﾞ
				SQL.Add(' LJobName,'	);										//職種
				SQL.Add(' LPostName,'	);										//役職
				SQL.Add(' IsNull(LNyuusha,ConVert(DateTime,'+''''+DEF_DATE+''''+')) LastDate1,');
																				//入社
				SQL.Add(' IsNull(LRetire,ConVert(DateTime,'+''''+DEF_DATE+''''+')) LastDate2,');
																				//退社
				SQL.Add(' LRemarks ');

				//<RefDay> ↓
				if pHapApParam.GetRefType = 1 then //基準日指定時
                begin
					SQL.Add(' From MP_HAP_HAPSCR_STD('''+FormatDateTime('yyyy-mm-dd',pHapApParam.GetRefDate) +''', 0)');
                end
				//<RefDay> ↑
				else
				begin
					SQL.Add(' From HAPSCR');
                end;
				SQL.Add(' Where EmpNCode='+ IntToStr(pHapApParam^.GetEmpNCd));
				SQL.Add(' AND CorpNCode=0');
				SQL.Add(' ORDER BY LastDate2 DESC ,LastDate1 DESC,CarNCode');
				Open;
				//MemData更新中
				//MemData-Grid間のLinkを無効化
				iNo := 0;
				MemData.DisableControls;
				try
					while not Eof do
					begin
						MemData.Append;
						inc(iNo);

						//ｸﾞﾙｰﾌﾟ会社ｺｰﾄﾞ
						iCopCd := Trunc(GetFld('LCorpNCode').AsFloat);
						MemData.FieldByName('GroupCode').AsFloat :=iCopCd;

						//会社名
						if iCopCd <> 0 then
						begin
							sCopName := fnGetCorpName(iCopCd);
							MemData.FieldByName('CopName').AsString :=sCopName;
						end
						else
							MemData.FieldByName('CopName').AsString :=GetFld('LCorpName').AsString;

						//職種ｺｰﾄﾞ
						MemData.FieldByName('SyokuSyu').AsString :=GetFld('LJobName').AsString;
						//役職
						MemData.FieldByName('PostName').AsString := GetFld('LPostName').AsString;
						//入社年月日
						if GetFld('LastDate1').AsDateTime > 0 then
							MemData.FieldByName('Nyusya').AsDateTime := GetFld('LastDate1').AsDateTime;
						//退社年月日
						if GetFld('LastDate2').AsDateTime > 0 then
							MemData.FieldByName('Retire').AsDateTime := GetFld('LastDate2').AsDateTime;
						//備考
						MemData.FieldByName('Bikou').AsString := GetFld('LRemarks').AsString;

						//前職歴内部コード<091013> 内部コードありの時はUPDATEにする
						MemData.FieldByName('CarNCode').AsInteger	:= GetFld('CarNCode').AsInteger;

						MemData.Post;
						Next;		//次ﾚｺｰﾄﾞ
					end;

					if iNo <> 0 then
					begin
						MemData.First;
					end;
				//MemData-Grid間のLinkを有効化
				finally
					MemData.EnableControls;
				end;
			end;

			fnInitDataShow;														// <080725> 学歴情報取得

			fnRefColorChange();													// <RefDay> 基準日情報取得

		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
				MjsMessageBoxEx(Self,'データの読み込みに失敗しました。',sTitle,IconType,BtnType,BtnDef,LogType);
			Abort;
		end;
	finally
		sTableName.Free;
		sFieldName.Free;
		Query.Free;
	end;
end;


//**********************************************************************
//		Proccess	:fnGetCorpName
//					:ｸﾞﾙｰﾌﾟ会社名の取得
//		Parameter	:iCopCD : 会社内部ｺｰﾄﾞ
//		Return		:String : 会社名
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000012CBaseF.fnGetCorpName(iCopCD : Int64) : String;
var
	mqMjsDB : TMQuery;

//<090608> 未使用なのでコメント
//	sSQL	: String;

begin
	Result := '';

	mqMjsDB := TMQuery.Create( Self );
	MDBModule.SetDBInfoToQuery( ddMjsDB, mqMjsDB );

	try
		try
			with mqMjsDB do
			begin
//				sSQL := 'SELECT DTName FROM SDT_DCTL'
//				+#13#10+'WHERE NCode=:hNCode'
//				+#13#10+'AND SysCD=0001 AND OptCD=00';							//会社別統合ＤＢ

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
										'AND ' +
										'A.NCode = ' + IntToStr( iCopCD ) + ' ' +
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

//				SetFld('hNCode').AsFloat	:= iCopCD;

				if not Open then
					Abort;

				if not Eof then
				begin
					Result := GetFld('DTName').AsString;
				end;
			end;
		except
			//
		end;
	finally
		mqMjsDB.Close;
		mqMjsDB.Free;
	end;
end;

//**********************************************************************
//		Proccess	:ﾌｫｰﾑ使用可/不可 切替
//		Parameter	:bEnable	:TRUE/FALSE
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.fnDetailEnable(bEnable:boolean);
var
	i:Integer;
begin
//内容部(ここではPClient)は使用不可にする
//ﾌｫｰﾑ自体は使用不可にしない(処理ﾎﾞﾀﾝのOwnerがﾌｫｰﾑなので操作できなくなってしまう)
	with PMain do
	begin
		if Enabled=bEnable then													//2重要求
			Exit;																//不要

		Enabled:=bEnable;														//内容部 使用可/不可切替

		for i:=0 to ControlCount-1 do
		begin
			//更新/取消ﾎﾞﾀﾝは表示も使用不可状態にする
			if (Controls[i] is TMBitBtn) then
				(Controls[i] as TMBitBtn).Enabled:=bEnable;
		end;
	end;

	// <2007-05-09>
	if not bEnable then
	begin
		BspGCorp.Enabled := False;
	end;
end;

//**********************************************************************
//		Proccess	:社員入力終了
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.fnEditEnd;
begin
	//<131213>↓
	if (not fnNumCheck(EGakkouNo)) or (not fnNumCheck(EGakkaNo)) then
	begin
		HapSendToOwner(HAPAP_ACTID_EXIT_NG,pAppRec,pHapApParam);
		Exit;
	end;        
	//<131213>↑

	if not fnUpdate then					//更新処理
	begin
		HapSendToOwner(HAPAP_ACTID_EXIT_NG,pAppRec,pHapApParam);
		Exit;
	end;
	HapSendToOwner(HAPAP_ACTID_EXIT_OK,pAppRec,pHapApParam);
end;

//**********************************************************************
//		Proccess	:社員更新
//		Parameter	:
//		Return		:TRUE	:更新成功
//					:FALSE	:失敗(値ﾁｪｯｸNG含む)
//		Hoistory	:2009/10/13(Y.Kondo) <091013>
//					:更新担当者フィールド追加対応
//**********************************************************************
function THAP000012CBaseF.fnUpdate: boolean;
var
	HISEQuery,
	SYQuery,
	SYJQuery,
	SCQuery		: TMQuery;
	i,
//	iEntNo,								//<091013> del
	iWk			: Integer;
	sField,
	sSql,
//	sNyuSya,
//	sRetire,
	sWk			: String;
	TComP		: TCusTomEdit;
	iSCRMax		: Integer;				//<091013>
const
	cDateFormat	= 'yyyy/mm/dd';
	TBL_SC	= 0;
	TBL_SY	= 1;
	TBL_SYJ	= 2;
begin
	result := FALSE;

	if (MemData.State in [dsInsert,dsEdit]) and
	  (not ((MemData.FieldByName('CopName').AsString ='') and
		(MemData.FieldByName('Syokusyu').AsString ='') and
		(MemData.FieldByName('PostName').AsString ='') and
		(MemData.FieldByName('NyuSya').AsString = '') and
		(MemData.FieldByName('Retire').AsString = '' )and
		(MemData.FieldByName('Bikou').AsString = '' ))) then
		MemData.Post;

	SCQuery := TMQuery.Create( Self );											// MQueryの構築
	MDBModule.SetDBInfoToQuery( ddCopDB, SCQuery );
	SYQuery := TMQuery.Create( Self );											// MQueryの構築
	MDBModule.SetDBInfoToQuery( ddCopDB, SYQuery );
	SYJQuery := TMQuery.Create( Self );											// MQueryの構築
	MDBModule.SetDBInfoToQuery( ddCopDB, SYJQuery );
	HISEQuery := TMQuery.Create( Self );										// MQueryの構築
	MDBModule.SetDBInfoToQuery( ddCopDB, HISEQuery );

	try
		try
			SCQuery.Close;
			SCQuery.SQL.Clear();
			SYQuery.Close;
			SYQuery.SQL.Clear();
			SYJQuery.Close;
			SYJQuery.SQL.Clear();

			SYQuery.SQL.Add('UPDate HAPSY Set');
			SYJQuery.SQL.Add('UPDate HAPSYJ Set');

			for i := 0 to Length(ArrItem)-1 do
			begin
			// 日付型は先付け
				if (ArrItem[i] = 111400)
				or (ArrItem[i] = 112300)
				or (ArrItem[i] = 112301) then
				begin
					TComP := fnPartsGet(ArrItem[i]);
					fnTableGet(ArrItem[i],sField);

					if not fnDateCheck(TComp as TMDateEdit) then// 日付の入力値をSet
						exit;

					if (TComp as TMDateEdit).AsDateTime > 0 then
						sWk	:= '''' + FormatDateTime(cDateFormat, (TComp as TMDateEdit).AsDateTime) + ''''
					else
						sWk := 'null';

					SYQuery.SQL.Add(',' + sField + ' = ' + sWk);
					continue;
				end;
			// 数値型、文字型のUPDate
				iWk := fnTableGet(ArrItem[i],sField);
				if Trim(sField) = '' then
				begin
					GetMsg(rcMsg,200,1);
					with rcMsg do
						MjsMessageBoxEx(Self,'項目名取得失敗' + IntToStr(ArrItem[i]),sTitle,IconType,BtnType,BtnDef,LogType);
					abort;
				end;
				Case iWk of
					TBL_SC:
					begin
						if Length(SCQuery.SQL.Text) > 20 then	//<D10-C>
							SCQuery.SQL.Add(',');
						SCQuery.SQL.Add(SField + ' = :' + sField);
					end;
					TBL_SY:
					begin
						if Length(SYQuery.SQL.Text) > 20 then	//<D10-C>
							SYQuery.SQL.Add(',');
						SYQuery.SQL.Add(SField + ' = :' + sField);
					end;
					TBL_SYJ:
					begin
						if Length(SYJQuery.SQL.Text) > 20 then	//<D10-C>
							SYJQuery.SQL.Add(',');
						SYJQuery.SQL.Add(SField + ' = :' + sField);
					end;
				end;
				TComP := fnPartsGet(ArrItem[i]);
				if TComP is TMNumEdit then
				begin
					if (TComP as TMNumEdit).SelectColCount > 0 then
						if not fnNumCheck(TComp as TMNumEdit) then					// 入力値のチェック
							exit;
					Case iWk of
						TBL_SC:
							SCQuery.ParamByName(SField).AsInteger := Trunc((TComP as TMNumEdit).Value);
						TBL_SY:
							SYQuery.ParamByName(SField).AsInteger := Trunc((TComP as TMNumEdit).Value);
						TBL_SYJ:
							SYJQuery.ParamByName(SField).AsInteger := Trunc((TComP as TMNumEdit).Value);
					end;
				end
				else if TComP is TMTxtEdit then
				begin
					Case iWk of
						TBL_SC:
							SCQuery.ParamByName(SField).AsString := (TComP as TMTxtEdit).Text;
						TBL_SY:
							SYQuery.ParamByName(SField).AsString := (TComP as TMTxtEdit).Text;
						TBL_SYJ:
							SYJQuery.ParamByName(SField).AsString := (TComP as TMTxtEdit).Text;
					end;
				end;
			end;

			SYQuery.SQL.Add(',UpdTantoNCode=:hTantoNCd');
			SYJQuery.SQL.Add(',UpdTantoNCode=:hTantoNCd');

			SYQuery.SQL.Add('Where EmpNCode = :EmpNCd');
			SYQuery.SQL.Add('AND CorpNCode = :CopNCd');
			SYJQuery.SQL.Add('Where EmpNCode = :EmpNCd');
			SYJQuery.SQL.Add('AND CorpNCode = :CopNCd');

			SYQuery.ParamByName('EmpNCd').AsCurrency := pHapApParam^.GetEmpNCd;
			SYQuery.ParamByName('CopNCd').AsCurrency := 0;

			SYJQuery.ParamByName('EmpNCd').AsCurrency := pHapApParam^.GetEmpNCd;
			SYJQuery.ParamByName('CopNCd').AsCurrency := 0;

			SYQuery.ParamByName('hTantoNCd').AsFloat	:=	rcCOMMONAREA(pAppRec^.m_pCommonArea^).TantoNCD;
			SYJQuery.ParamByName('hTantoNCd').AsFloat	:=	rcCOMMONAREA(pAppRec^.m_pCommonArea^).TantoNCD;

			//<131213>↓
			if SYQuery.ParamByName('GatukouKubun').AsInteger <> 0 then
			begin
				SYQuery.ParamByName('GatukouName').AsString := '';
			end;

			if SYQuery.ParamByName('GatukaKubun').AsInteger <> 0 then
			begin
				SYQuery.ParamByName('GatukaName').AsString := '';
			end;        
			//<131213>↑

			SYQuery.ExecSQL(TRUE);
			SYJQuery.ExecSQL(TRUE);
		// 前職
			MemData.First;
//<091013>	iEntNo := 0;
			with HISEQuery do
			begin
				SQL.Clear();
				SQL.Add(' DELETE FROM HAPSCR');
				SQL.Add(' Where EmpNCode = :EmpNCd');
				SQL.Add(' AND CorpNCode = :CopNCd');

//<091013> S
				SQL.Add(' AND CarNCode = :CarNCd');
				DelSCRMem.First;
				while not DelSCRMem.Eof do
				begin
					Close;
					ParamByName('CarNCd').AsInteger	:= DelSCRMemSCRNCode.AsInteger;
					DelSCRMem.Next;
//<091013> E

					ParamByName('EmpNCd').AsCurrency := pHapApParam^.GetEmpNCd;
					ParamByName('CopNCd').AsCurrency := 0;

					EXECSQL(true);
				end;

//<091013> S
				Close;
				SQL.Clear;
				SQL.Add('SELECT MAX(CarNCode) as CNT FROM HAPSCR WHERE CorpNCode = 0 and EmpNCode = :EmpNCd');
				SetFld('EmpNCd').AsString	:= IntToStr(pHapApParam^.GetEmpNCd);
				Open(TRUE);

				iSCRMax	:= GetFld('CNT').AsInteger;
//<091013> E

				while not MemData.Eof do
				begin
//<091013>			Inc(iEntNo);
					SQL.Clear();

//<090608> シングルクォートがエラーになるのでパラメータに置き換え
//					if MemData.FieldByName('NyuSya').AsString ='' then
//						sNyuSya := 'null'
//					else
//						sNyuSya := '''' + FormatDateTime(cDateFormat, MemData.FieldByName('NyuSya').AsDatetime) + '''';

//					if MemData.FieldByName('Retire').AsString ='' then
//						sRetire := 'null'
//					else
//						sRetire := '''' + FormatDateTime(cDateFormat, MemData.FieldByName('Retire').AsDatetime) + '''';

//<091013> S
					if MemData.FieldByName('CarNCode').AsInteger > 0 then
					begin
						sSql := 'UPDATE HAPSCR SET '
								+ 'LCorpNCode=:hGroupCode,'
								+ 'LCorpName=:hCopName,'						//会社名
								+ 'LJobName=:hSyokusyu,'						//職種名
								+ 'LPostName=:hPostname,'						//役職名
								+ 'LNyuusha=:hNyuusha,'							//入社年月日
								+ 'LRetire=:hRetire,'							//退職年月日
								+ 'LRemarks=:hBikou,'							//備考
								+ 'UpdTantoNCode=:hTantoNCD ';					//更新担当者

						sSql := sSql + 'WHERE CorpNCode=0 and EmpNCode=:hEmpNCode and CarNCode=:hCarNCode';

						SQL.Add(sSql);

						ParamByName('hCarNCode'	).AsInteger	:= MemDataCarNCode.AsInteger;	//前職内部ｺｰﾄﾞ
					end
					else
					begin
//<091013> E
						sSql := 'INSERT INTO HAPSCR ' ;
						sSql := sSql + '(EmpNCode,CorpNCode,CarNCode,LCorpNcode,LCorpName,LJobName,LPostName,LNyuusha,LRetire,LRemarks,UpdTantoNCode)';
//<090608> シングルクォートがエラーになるのでパラメータに置き換え
//						sSql := sSql + ' Values( ' + IntToStr(pHapApParam^.GetEmpNCd);				//社員内部ｺｰﾄﾞ
//						sSql := sSql +	' , ' + '0';												//会社内部ｺｰﾄﾞ
//						sSql := sSql +	' , ' + IntToStr(iEntNo);									//前職内部ｺｰﾄﾞ
//						sSql := sSql +	' , ''' + MemData.FieldByName('GroupCode').Asstring + '''';	//会社内部ｺｰﾄﾞ(ｸﾞﾙｰﾌﾟ)
//						sSql := sSql +	' , ''' + MemData.FieldByName('CopName').Asstring + '''';	//会社名
//						sSql := sSql +	' , ''' + MemData.FieldByName('Syokusyu').Asstring + '''';	//職種名
//						sSql := sSql +	' , ''' + MemData.FieldByName('Postname').Asstring + '''';	//役職名
//						sSql := sSql +	' , ' + sNyuSya ;											//入社年月日
//						sSql := sSql +	' , ' + sRetire ;											//退職年月日
//						sSql := sSql +	' , ''' + MemData.FieldByName('Bikou').Asstring + '''' + ')';//備考
						sSql := sSql + ' Values(';
						sSql := sSql + ' :hEmpNCode';		//社員内部ｺｰﾄﾞ
						sSql := sSql + ',0';				//会社内部ｺｰﾄﾞ
						sSql := sSql + ',:hCarNCode';		//前職内部ｺｰﾄﾞ
						sSql := sSql + ',:hGroupCode';		//会社内部ｺｰﾄﾞ(ｸﾞﾙｰﾌﾟ)
						sSql := sSql + ',:hCopName';		//会社名
						sSql := sSql + ',:hSyokusyu';		//職種名
						sSql := sSql + ',:hPostname';		//役職名
						sSql := sSql + ',:hNyuusha';		//入社年月日
						sSql := sSql + ',:hRetire';			//退職年月日
						sSql := sSql + ',:hBikou';			//備考
						sSql := sSql + ',:hTantoNCD)';		//更新担当者<091013>

						SQL.Add(sSql);

						ParamByName('hCarNCode'	).AsInteger	:= iSCRMax+1;		//前職内部ｺｰﾄﾞ
						Inc(iSCRMax);
					end;


					ParamByName('hEmpNCode'	).AsFloat	:= pHapApParam^.GetEmpNCd;	//社員内部ｺｰﾄﾞ
//					ParamByName('hCarNCode'	).AsInteger	:= iEntNo;					//前職内部ｺｰﾄﾞ
					ParamByName('hGroupCode').AsFloat	:= MemData.FieldByName('GroupCode').AsFloat;	//会社内部ｺｰﾄﾞ(ｸﾞﾙｰﾌﾟ)
					ParamByName('hCopName'	).AsString	:= MemData.FieldByName('CopName' ).AsString;	//会社名
					ParamByName('hSyokusyu'	).AsString	:= MemData.FieldByName('Syokusyu').AsString;	//職種名
					ParamByName('hPostname'	).AsString	:= MemData.FieldByName('Postname').AsString;	//役職名

					if MemData.FieldByName('NyuSya').AsString ='' then
					begin
						ParamByName('hNyuusha').AsDateTime := 0;
						ParamByName('hNyuusha').Clear;
					end
					else
						ParamByName('hNyuusha').AsDateTime	:= MemData.FieldByName('NyuSya').AsDatetime;	//入社年月日

					if MemData.FieldByName('Retire').AsString ='' then
					begin
						ParamByName('hRetire').AsDateTime := 0;
						ParamByName('hRetire').Clear;
					end
					else
						ParamByName('hRetire').AsDateTime	:= MemData.FieldByName('Retire').AsDatetime;	//退職年月日

					ParamByName('hBikou'	).AsString	:= MemData.FieldByName('Bikou').AsString;	//備考

					ParamByName('hTantoNCD').AsFloat	:= rcCOMMONAREA(pAppRec^.m_pCommonArea^).TantoNCD;	//<091013>担当者内部コード

					EXECSQL(true);
					MemData.Next;
				end;
			end;

			// <080725>>>
			// 学歴情報更新
			if not fnGakurekiUpdate then
			begin
				Result	:= False;
				Exit;
			end;
			// <<<080725>
		except
			GetMsg(rcMsg,1,4);
			with rcMsg do
				MjsMessageBoxEx(Self,sMsg,sTitle,IconType,BtnType,BtnDef,LogType);
			Abort;
		end;
	finally
		HISEQuery.Free;
		SCQuery.Free;
		SYQuery.Free;
		SYJQuery.Free;
	end;

	result := TRUE;
end;

//***********************************************************************
//		Proccess	:ﾘｽﾄから該当名称をセット
//		Paremeter	:
//		Return		:0:リストなし　１；リスト有り
//		History		:
//					:
//***********************************************************************
function THAP000012CBaseF.fnSetListItem(MEdit: TMNumEdit; iItemNo: Integer): Boolean;
var
	DMQuery	:TMQuery;
	sItems	:string;

begin
	Result	:= False;
	DMQuery := TMQuery.Create(self);
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	//<131213>↓
	if MEdit = EGakubu then
	begin
		fnSetProperty(0, MEdit);
		Exit;
	end;
	//<131213>↑

	MDBModule.SetDBInfoTOQuery(ddCopDB,DMQuery);
	MEdit.SelectItems.Clear;
	try
		try
			with DMQuery do
			begin
				Close();
				SQL.Clear();
				SQL.Add( 'SELECT '			);
				SQL.Add( 'KubunNo, '		);
				SQL.Add( 'KubunName '		);
				SQL.Add( 'From HAPMN'		);
				SQL.Add( 'Where ItemNo='	);
				SQL.Add( '(Select ItemNo from HAPKM Where ItemNo = ' );
				SQL.Add( '(Select KubunNo from HAPKM Where ItemNo = :ItemNo and ItemUse = 1)' );
				SQL.Add( 'and ItemUse = 1) ');
				SQL.Add( 'Order By KubunNo'	);

				ParamByName('ItemNo').AsInteger:=iItemNo;

				if not Open then
					Abort;

				if Eof then
				begin
					fnSetProperty(2,MEdit);
					exit;
				end;

				while not eof do
				begin
					sItems	:= GetFld('KubunNo').AsString + ':' + GetFld('KubunName').AsString;
					MEdit.SelectItems.Append(sItems);
					Next;
				end;
				fnSetProperty(0,MEdit);

				MEdit.MaxValue := GetFld('KubunNo').AsInteger ;
				Result	:= True;
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

//**********************************************************************
//		Proccess	:画面表示時、入力可不可設定
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.fnSetProperty(iKbn: integer; eEdit: TMNumEdit);
var
	lLabel	:	TMLabel; 
	qry		:	TMQuery;
	rcMsg	:	TMjsMsgRec;
begin
	//<131213>↓
	if (eEdit = EGakkouNo) or (eEdit = EGakubu) or (eEdit = EGakkaNo) then
	begin
		qry		:= TMQuery.Create(Self);											// MQueryの構築

		if Assigned(qry) <> True then
		begin
			Exit;
		end;

		MDBModule.SetDBInfoToQuery(ddCopDB, qry);									// DBとの接続

		try
			try
				with qry do
				begin
					Close();
					SQL.Clear();
					SQL.Add('SELECT'
							+	' Ex.KubunName '
							+ ' FROM'
							+	' HAPMNEx Ex'
							+ ' WHERE'
							+	' Ex.ItemNo = :ItemNo');

					SetFld('ItemNo').AsInteger := eEdit.Tag;

					Open(True);

					if Eof then														//該当ﾃﾞｰﾀ0件
					begin
						eEdit.ParentColor	:= True;
						eEdit.Enabled		:= False;
						eEdit.Value			:= 0;
						eEdit.Zero			:= False;
					end;
				end;
			except
				GetMsg(rcMsg, 1, 5);
				with rcMsg do
				begin
					MjsMessageBoxEx(Self,'区分名称情報の' + sMsg, sTitle, IconType, BtnType, BtnDef, LogType);
				end;

				Exit;
			end;
		finally
			qry.Close;
			qry.Free;
		end;

		Exit;
	end;        
	//<131213>↑

	lLabel := TMLabel(MJSFINDCtrl(Self,'L' + eEdit.Name));
	Case iKbn of
		ENABLE:			//使用可
		begin
			eEdit.Color			:= clWindow;
			eEdit.ParentColor	:= False;
			eEdit.Enabled		:= True;

			if eEdit.TagStr ='0' then
			begin
				eEdit.Zero	:=True;
			end;
		end;
		NOT_ENABLE:		//使用不可＆データあり
		begin
			eEdit.ParentColor	:= True;
			eEdit.Enabled		:= True;										//Panelを使用不可とする

			if eEdit.TagStr ='0' then
			begin
				eEdit.Zero	:=True;
			end;
		end;
		NO_DATA:		//使用不可＆データなし
		begin
			eEdit.ParentColor	:= True;
			eEdit.Enabled		:= False;
			eEdit.Value			:= 0;
			eEdit.Zero			:= False;

			if lLabel<>nil then
				lLabel.Caption :='';
		end;
	end;
end;

//***********************************************************************
//		Proccess	:在職区分に応じてパーツの使用状態を変更
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
Function THAP000012CBaseF.fnFocusGET(iPara : Integer) : TWinControl;
begin
	if ESaiyo.Enabled then
	begin
		result := ESaiyo;
		exit;
	end;

	if ESyokai.Enabled then
	begin
		result := ESyokai;
		exit;
	end;

	Result := ESyokaiName1;
end;

//**************************************************************************
//		Proccess	:	日付型の入力値判定
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**************************************************************************
Function THAP000012CBaseF.fnDateCheck(DateEdit : TMDateEdit) : Boolean;
begin
	result := FALSE;

//<2019-04-02>MOD St
//	if not MJSIntYMDChk(DateEdit.Value) then
	if not MJSIntYMDChk(DateEdit.AsIntYM) then
//<2019-04-02>MOD Ed
	begin
		if DateEdit.Text <> '' then
		begin
			GetMsg(rcMsg,100,7);
			with rcMsg do
				MjsMessageBoxEx(Self,sMsg,sTitle,IconType,BtnType,BtnDef,LogType);

			MjsSetFocus(Self, DateEdit.Name);									//マウスによるクリック回避

			Exit;
		end;
	end;
	result := TRUE;
end;

//**************************************************************************
//		Proccess	:	数値型の入力値判定
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**************************************************************************
Function THAP000012CBaseF.fnNumCheck(Edit : TMNumEdit) : Boolean;
var
	sWk	:	String;
	Lbl	:	TMLabel;
begin
	result := FALSE;

	//<131213>↓
	if (Edit = EGakkouNo) or (Edit = EGakubu) or (Edit = EGakkaNo) then
	begin
		if Edit.Value > 0 then
		begin
			if Edit = EGakkouNo then
			begin
				EGakkouName.Text	:= fnGetHAPMNExName(Edit.AsInteger, 111710);
				if EGakkouName.Text = '' then
				begin
					Result := False;
				end
				else
				begin
					Result := True;
				end;
			end
			else if Edit = EGakubu then
			begin
				LEGakubu.Caption	:= fnGetHAPMNExName(Edit.AsInteger, 111800);
				if (LEGakubu.Caption = '') and (Edit.AsInteger <> 0) then
				begin
					Result := False;
				end
				else
				begin
					Result := True;
				end;
			end
			else if Edit = EGakkaNo then
			begin
				EGakkaName.Text		:= fnGetHAPMNExName(Edit.AsInteger, 111910);
				if (EGakkaName.Text = '') and (Edit.AsInteger <> 0) then
				begin
					Result := False;
				end
				else
				begin
					Result := True;
				end;
			end;
		end
		else
		begin
			if Edit = EGakubu then
			begin
				LEGakubu.Caption	:= '';
			end;
			Result := True;
		end;
	end
	else
	begin
		sWk := fnGetList(Edit);
		Lbl := TMLabel(MJSFindCtrl(Self,'L' + Edit.Name));
		Lbl.Caption := sWk;

		if sWk <> '' then
		begin
			result := TRUE;
		end
		else
		begin
			if Edit.Value = 0 then
				result := TRUE;
			if not Edit.Enabled then
				result := TRUE;
		end;
	end;
	//<131213>↑

	if not result then
		MjsSetFocus(Self, Edit.Name);											//マウスによるクリック回避
end;

//***********************************************************************
//		Proccess	:ﾘｽﾄから該当名称を取得
//		Paremeter	:
//		Return		:
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//***********************************************************************
function THAP000012CBaseF.fnGetList(MEdit:TMNumEdit):string;
var
	i:integer;
begin
	Result:='';

	if trim(MEdit.text)='' then
	begin
		exit;
	end;

	if MEdit.Selectitems.Count=0 then
		exit;

	for i:=0 to MEdit.Selectitems.Count-1 do
	begin
		if MEdit.Value=StrToInt(Copy(MEdit.SelectItems[i],1,Pos(':',MEdit.SelectItems[i])-1)) then
			break;
	end;

	if i=MEdit.Selectitems.Count then
		Exit;

	Result:=Copy(	MEdit.SelectItems[i],
					Pos(':',MEdit.SelectItems[i])+1,
					Length(MEdit.SelectItems[i])-Pos(':',MEdit.SelectItems[i]));
end;

//**************************************************************************
//	Proccess	:	テーブルGet
//	Parameter	:	iCode	:	コード
//	Retrun		:	なし
//	History	　	:
//**************************************************************************
Function THAP000012CBaseF.fnTableGet(iCode : INteger; SList,FList : Pointer) : String;
var
	KMQuery	:	TMQuery;
	STName	:	String;
	SFName	:	String;
	STList	:	TStringList;
	FDList	:	TStringList;
begin
	result := '';
	STList := TStringList(SList^);
	FDList := TStringList(FList^);
	KMQuery := TMQuery.Create(Self);											// MQueryの構築

	if Assigned(KMQuery) <> true then
	begin
		Exit;
	end;

	with KMQuery do
	begin
		try
			try
				MDBModule.SetDBInfoToQuery(ddCopDB, KMQuery);
				Close;
				SQL.Clear;
				SQL.Add('SELECT FieldName,TableName'	);
				SQL.Add('FROM HAPKM'					);
				SQL.Add('WHERE ItemNo = :ItemNo'		);

				ParamByName('ItemNo').AsInteger := iCode;

				if not Open then
					Abort;

				if not Eof then
				begin
					STName := GetFld('TableName').AsString;
					SFName := GetFld('FieldName').AsString;
					result := STName + '.' + SFName + ' as ' + SFName;

					if STList.IndexOf(STName) = -1 then
					begin
						STList.Add(STName);
					end;
					if FDList.IndexOf(SFName) = -1 then
					begin
						FDList.Add(SFName);
					end;
				end;
			except
				result := '';
			end;
		finally
			Close;
			Free;
		end;
	end;
end;

//**************************************************************************
//	Proccess	:	テーブルGet
//	Parameter	:	iCode	:	コード
//	Retrun		:	なし
//	History	　	:
//**************************************************************************
Function THAP000012CBaseF.fnTableGet(iCode : INteger; var SFName : String) : Integer;
var
	KMQuery	:	TMQuery;
	STName	:	String;
Const
	TBL_SC	= 0;
	TBL_SY	= 1;
	TBL_SYJ	= 2;
begin
	result := 0;
	KMQuery := TMQuery.Create(Self);					// MQueryの構築

	if Assigned(KMQuery) <> true then
	begin
		Exit;
	end;

	with KMQuery do
	begin
		try
			try
				MDBModule.SetDBInfoToQuery(ddCopDB, KMQuery);
				Close;
				SQL.Clear;
				SQL.Add('SELECT FieldName,TableName'	);
				SQL.Add('FROM HAPKM'					);
				SQL.Add('WHERE ItemNo = :ItemNo'		);

				ParamByName('ItemNo').AsInteger := iCode;

				if not Open then
					Abort;

				if not Eof then
				begin
					STName := Trim(GetFld('TableName').AsString);
					SFName := Trim(GetFld('FieldName').AsString);

					if Trim(STName) = 'HAPSC' then
						result := TBL_SC
					else if Trim(STName) = 'HAPSY' then
						result := TBL_SY
					else if Trim(STName) = 'HAPSYJ' then
						result := TBL_SYJ;
				end;
			except
			end;
		finally
			Close;
			Free;
		end;
	end;
end;

//**************************************************************************
//	Proccess	:	コンポーネント取得
//	Parameter	:	iCode	:	コード
//	Retrun		:	なし
//	History	　	:
//**************************************************************************
Function THAP000012CBaseF.fnPartsGet(iCode : INteger) : TCustomEdit;
var
	i	:	Integer;
begin
	result := nil;
	for i:=0 to ComponentCount-1 do
	begin
		if(Components[i] is TCustomEdit)then
		begin
			if (Components[i] as TCustomEdit).Tag = iCode then
			begin
				result := (Components[i] as TCustomEdit);
				exit;
			end;
		end;
	end;
end;

// グリッド系処理追加
//**********************************************************************
//		Proccess	:日付西暦和暦設定
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.fnDateFormatSet;
var
	DMQuery	:	TMQuery;
	iErrorFlag	:Integer;
	rcMsg	:TMjsMsgRec;
begin
	DMQuery := TMQuery.Create(self);											// MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;
	iErrorFlag:=0;

	try
		try
			MDBModule.SetDBInfoToQuery(ddCopDB, DMQuery);						// DBとの接続
			with DMQuery do
			begin
				Close;
				SQL.Clear;
				SQL.Add( 'SELECT YearKbn FROM DTMAIN');							//0:和暦 1:西暦

				if not Open then
					Abort;

				if Eof then														//該当ﾃﾞｰﾀ0件
				begin
					iErrorFlag:=-1;
					Abort;
				end;
				iRekiKbn:=FieldByName('YearKbn').AsInteger;

				if FieldByName('YearKbn').AsInteger=0 then						//和暦
				begin
					DxZenGridColumn7.DateEditFormat	:= dfEMD;
					MemDataNyusya.DisplayFormat:='g eee/mm/dd';
					DxZenGridColumn8.DateEditFormat	:= dfEMD;
					MemDataRetire.DisplayFormat:='g eee/mm/dd';
				end
				else
				begin
					DxZenGridColumn7.DateEditFormat	:= dfYMD;
					MemDataNyusya.DisplayFormat:='yyyy/mm/dd';
					DxZenGridColumn8.DateEditFormat	:= dfYMD;
					MemDataRetire.DisplayFormat:='yyyy/mm/dd';
				end
			end;
		except
			if iErrorFlag=0 then												// 純粋な例外エラー
			begin
				GetMsg(rcMsg,1,5);
				with rcMsg do
				begin
					MjsMessageBoxEx(Self,'会社情報一覧区分の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
				end;
			end
			else if iErrorFlag=-1 then											// 読み込み件数なし
			begin
			end;
			Exit;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;

end;

//**********************************************************************
//		Component	:Grid
//		Event		:Enter
//		Proccess	:フォーカス取得
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.DxZenGridEnter(Sender: TObject);
begin
	ACCtrl:=Sender as TWinControl;

	if MemData.IsEmpty then
		MemData.Edit;															//編集状態にする

	//<080214>
	//BSpDelete.Enabled	:= TRUE;
	pHapApParam^.SetFuncCaption(arrFunc06);		// F6
	HapSendToOwner(HAPAP_ACTID_FBARCAPTION,pAppRec,pHapApParam);

	BspGCorp.Enabled	:= TRUE;
end;

//**********************************************************************
//		Component	:Grid
//		Event		:EXit
//		Proccess	:フォーカス消失
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.DxZenGridExit(Sender: TObject);
begin
	//<080214>
	//BSpDelete.enabled	:= FALSE;

	BspGCorp.Enabled	:= FALSE;
end;

//**********************************************************************
//		Component	:DeleteBtn
//		Event		:Click
//		Proccess	:１行削除ボタンクリック
//		Parameter	:
//		Return		:
//		History		:2009/10/13(Y.Kondo)
//					:削除される前職歴を保存する <091013>
//**********************************************************************
//<080214> イベントから関数へ変更
//procedure THAP000012CBaseF.BSpDeleteClick(Sender: TObject);
procedure THAP000012CBaseF.BSpDeleteClick;
var
	Ret		: Word;
begin
	if not (Screen.ActiveControl = DxZenGrid) then exit;

	if Screen.ActiveControl = DxZenGrid then
	begin
		if MemData.RecordCount=0 then exit;
		GetMsg(rcMsg,110,8);
		with rcMsg do
		begin
			Ret:=MjsMessageBoxEx(Self,'現在行'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
		end;
		if Ret=mrNo then
			Exit;

		if Ret=mrOk then
		begin
//<091013> S
//削除される前職歴を保管
			if MemData.FieldByName('CarNCode').AsInteger > 0 then
			begin
				DelSCRMem.Append;
				DelSCRMemSCRNCode.AsInteger	:= MemData.FieldByName('CarNCode').AsInteger;
				DelSCRMem.Post;
			end;
//<091013> E
			MemData.Delete ;
		end;
	end;

end;

//**********************************************************************
//		Component	:Grid
//		Event		:BspGCorpClick
//		Proccess	:ｸﾞﾙｰﾌﾟ会社選択ボタンクリック
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.BspGCorpClick(Sender: TObject);
var
	GrpDlg		:	THAP000012CGroupSelDlgF;
	iRet		:	TModalResult;
	iErr		:	Integer;
	recGroup	:	TGroupRec;

begin
	iErr := 0;

	GrpDlg	:= THAP000012CGroupSelDlgF.Create( Self );
	MjsFontResize(GrpDlg, pointer(pAppRec));

	try
		try
			GrpDlg.fnCreateDialog (pAppRec,@recGroup);

			GrpDlg.COPDB	:= pHapApParam^.GetCopDB;
			GrpDlg.MJSDB	:= pHapApParam^.GetMjsDB;

			iRet := GrpDlg.ShowModal;

			if iRet <> mrOK then
			begin
				Exit;
			end;

			iErr := 1;

			MemData.Edit;
			MemData.FieldByName('GroupCode').AsFloat	:=	recGroup.GroupCode;
			MemData.FieldByName('CopName').AsString		:=	recGroup.GroupName;
//			MemData.Post;

		except
			if iErr = 0 then	//ダイアログ呼出失敗
			begin
				GetMsg(rcMsg,10,2);
				with rcMsg do
					MjsMessageBoxEx(Self,sMsg,sTitle,IconType,BtnType,BtnDef,LogType);
			end;
		end;
	finally
		GrpDlg.Free;
	end;
end;

//**********************************************************************
//		Component	:Grid
//		Event		:KeyDown
//		Proccess	:
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.DxZenGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	//<080214> F6 キー処理
	{if Key = VK_INSERT then
	begin
		Key := 0;
	end;
	}
	case Key of
		VK_INSERT:
		begin
			Key	:= 0;
		end;

		VK_F6:
		begin
			BSpDeleteClick;
		end;
	end;
end;

//************************************************************************
//* Component		:	GridDrawCell
//* Proccess		:	グリッド描画
//*
//************************************************************************
procedure THAP000012CBaseF.DxZenGridCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
	if Trunc(MemData.FieldByName('GroupCode').AsFloat) <> 0 then				// ｸﾞﾙｰﾌﾟ会社選択された
	begin
		if( AColumn.Index = 0 ) then											// 会社名
			AFont.Color := HAP_FONT_COLOR_BLUE;									// 色をブルーにする
	end
	else
	begin
		if( AColumn.Index = 0 ) then											// 会社名
			AFont.Color := clWindowText											// 色を通常にする
	end;
end;

//************************************************************************
//* Component		:	DxZenGridChangeColumn
//* Proccess		:	カラム移動
//*
//************************************************************************
procedure THAP000012CBaseF.DxZenGridChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer);
begin
//会社名欄
	if Column = 0 then
	begin
		BspGCorp.Enabled := True;

	//ｸﾞﾙｰﾌﾟ会社からの選択の場合は編集不可とする。
		if Trunc(MemData.FieldByName('GroupCode').AsFloat) <> 0 then			// ｸﾞﾙｰﾌﾟ会社選択された
			DxZenGrid.Columns[0].ReadOnly := True								// 変更不可
		else
			DxZenGrid.Columns[0].ReadOnly := False;								// 変更可能
	end
	else
	begin
		BspGCorp.Enabled := False;
	end;
end;

//************************************************************************
//* Component		:	DxZenGridChangeColumn
//* Proccess		:	ノード変更
//*
//************************************************************************
procedure THAP000012CBaseF.DxZenGridChangeNode(Sender: TObject; OldNode,
  Node: TdxTreeListNode);
begin
	if DxZenGrid.FocusedColumn = 0 then
	begin
		BspGCorp.Enabled := True;

	//ｸﾞﾙｰﾌﾟ会社からの選択の場合は編集不可とする。
		if Trunc(MemData.FieldByName('GroupCode').AsFloat) <> 0 then			// ｸﾞﾙｰﾌﾟ会社選択された
			DxZenGrid.Columns[0].ReadOnly := True								// 変更不可
		else
			DxZenGrid.Columns[0].ReadOnly := False;								// 変更可能
	end
end;

//************************************************************************
//* Component		:	MemDataAfterCancel
//* Proccess		:	変更をキャンセル
//*
//************************************************************************
procedure THAP000012CBaseF.MemDataAfterCancel(DataSet: TDataSet);
begin
	if DxZenGrid.FocusedColumn = 0 then
	begin
	//ｸﾞﾙｰﾌﾟ会社からの選択の場合は編集不可とする。
		if Trunc(MemData.FieldByName('GroupCode').AsFloat) <> 0 then			// ｸﾞﾙｰﾌﾟ会社選択された
			DxZenGrid.Columns[0].ReadOnly := True								// 変更不可
		else
			DxZenGrid.Columns[0].ReadOnly := False;								// 変更可能
	end;
end;

//**********************************************************************
//		Proccess	:Function Bar Click ファンクションクリック
//		Date		:2008/02/14		<080214>
//		History		:
//					:
//**********************************************************************
procedure THAP000012CBaseF.fnFBarClick;
begin
	case pHAPAPParam^.GetFuncNo of
		// <080725>>>
		1:	// F1 学歴情報変更
			BGakurekiClick;
		// <<<080725>

		6:	// F6 一行削除
		begin
			BSpDeleteClick;
		end;
	end;
end;



// <080725> 学歴変更ダイアログ　対応
//************************************************************************
//*		Proccess		:fnInitDataShow
//*						:データ表示
//*		Paqrameter		:
//*		Retrun			:
//************************************************************************
procedure THAP000012CBaseF.fnInitDataShow;
var
	qryMjsDB	:	TMQuery;
	sSQL		:	String;
	iG			:	Integer;
	iEE			:	Integer;
begin
	{SQL作成}
	sSQL :=	'SELECT * FROM HAPGAKU '
			+ 'WHERE EmpNCode = :EmpNCode '
			+ 'AND CorpNCode=0 '
			+ 'ORDER BY OrderNo';

	{DB接続}
	qryMjsDB := TMQuery.Create(Self);
	MDBModule.SetDBInfoTOQuery(ddCopDB,qryMjsDB);

	{データ取得}
	try
		try
			with qryMjsDB do
			begin
				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				ParamByName('EmpNCode').AsString := IntToStr(pHapApParam^.GetEmpNCd);

				Open(TRUE);

				GakurekiMem.Close;
				GakurekiMem.Open;

				{データ設定}
				GAKUHIS.Visible	:= FALSE;					//<2010-10-05>
				if not Eof then
				begin
					while not Eof do
					begin
						GakurekiMem.Append();

						GakurekiMem.FieldByName('EmpNCode'	).AsCurrency
											:= FieldByName('EmpNCode').AsCurrency;	// 社員内部No
						GakurekiMem.FieldByName('YYYY'	).AsInteger
											:= FieldByName('Year').AsInteger;		// 年
						GakurekiMem.FieldByName('MM'	).AsInteger
											:= FieldByName('Month'	).AsInteger;	// 月
						GakurekiMem.FieldByName('Gakureki').AsString
											:= FieldByName('Gakureki').AsString;	// 学歴


						if fnFormatDateGEE( iG, iEE,
											FieldByName('Year').AsInteger) then
						begin
							GakurekiMem.FieldByName('GKey').AsInteger	:= iG;		// 和暦元号区分
							GakurekiMem.FieldByName('EE'	).AsInteger	:= iEE;		// 和暦年
						end;

						GakurekiMem.FieldByName('NCode').AsInteger	:= GetFld('NCode').AsInteger;

						GakurekiMem.Post();

						Next();
					end;

					GakurekiMem.First;
					GAKUHIS.Visible := TRUE;				//<2010-10-05>
				end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
				MjsMessageBoxEx(Self,'データの読み込みに失敗しました。',sTitle,IconType,BtnType,BtnDef,LogType);
			Abort;
		end;
	finally
		qryMjsDB.Close;
		qryMjsDB.Free;
	end;
end;

// <080725> 学歴変更ダイアログ表示
//**********************************************************************
//		Component	:F1
//		Event		:Click
//		Proccess	:学歴情報変更クリック
//		Parameter	:
//		Return		:
//		History		:2008/07/25(M.Ono)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000012CBaseF.BGakurekiClick;
var
	GakuDlg		:	THAP000012CGakurekiDlgF;
	Query		:	TMQuery;
	iRet		:	TModalResult;
	iErr		:	Integer;
begin
	// <2009-09-08> 学歴情報にフォーカスが無ければ抜ける
	if not ((ACCtrl = EGakureki) or (ACCtrl = ESotutai) or (ACCtrl = ESotugyou) or
			(ACCtrl = EGakkou) or (ACCtrl = EGakkouName) or (ACCtrl = EGakubu) or
			(ACCtrl = EGakkaName) or (ACCtrl = EGakkouNo) or (ACCtrl = EGakkaNo))  then	//<1131213>
	begin
		exit;
	end;

	iErr := 0;

	GakuDlg	:= THAP000012CGakurekiDlgF.Create( Self );
	MjsFontResize(GakuDlg, pointer(pAppRec));

	Query := TMQuery.Create( Self );
	MDBModule.SetDBInfoToQuery( ddCopDB, Query );

	try
		try
			GakuDlg.COPDB		:= pHapApParam^.GetCopDB;
			GakuDlg.giEmpNCd	:= pHapApParam^.GetEmpNCd;
			GakuDlg.gdiRekiKbn	:= iRekiKbn;
			GakuDlg.gdxMemRef	:= @GakurekiMem;

			GakuDlg.fnCreateGakurekiDlg (pAppRec);
			iRet := GakuDlg.ShowModal;

			if iRet <> mrOK then
			begin
				Exit;
			end;

			iErr := 1;
		except
			if iErr = 0 then	//ダイアログ呼出失敗
			begin
				GetMsg(rcMsg,10,2);
				with rcMsg do
					MjsMessageBoxEx(Self,sMsg,sTitle,IconType,BtnType,BtnDef,LogType);
			end;
		end;
	finally
		GakuDlg.Free;
		Query.Close;
		Query.Free;
	end;

//<2010-10-05> S
	if GakurekiMem.RecordCount > 0 then
		GAKUHIS.Visible := TRUE
	else
		GAKUHIS.Visible := FALSE;
//<2010-10-05> E
end;

//************************************************************************
//*		Proccess		:	西暦年・月から和暦を取得
//*		Name			:	M Ono
//*		Date			:	08/07/25
//*		Parameter		:	iG	元号（1：'S'／2：'H'）
//*							iEE	和暦年
//*							iY	西暦年
//*		Retrun			:	True：有効／False：無効
//*		History			:
//*
//************************************************************************
function THAP000012CBaseF.fnFormatDateGEE(var iG, iEE: Integer; iY: Integer): Boolean;
begin
	// <NewEraName-K> DEL Start
	//if iY < 1989 then							// 1989年は全て平成とする
	//begin
	//	{昭和}
	//	iG := C_GKBN_S;
	//	iEE	:= iY - 1925;
	//end
	//else
	//begin
	//	{平成}
	//	iG := C_GKBN_H;
	//	iEE	:= iY - 1988;	Instruction01
	//end;
    //
	//if iEE < 1 then
	//begin
	//	Result := False;
	//end
	//else
	//begin
	//	Result := True;
	//end;
	// <NewEraName-K> DEL Start
	// <NewEraName-K> ADD Start
	// 既存の処理に合わせる
	if iY < 1989 then							// 1989年は全て平成とする
	begin
		{昭和}
		iG := 1;
		iEE	:= iY - 1925;
		
		if iEE < 1 then
		begin
			Result := False;
			Exit;
		end;
	end;
    
	// 和暦年を取得する
	iEE	:= GetWareki(iY).iWareki;
	
	// 元号番号を取得する
	// 既存の処理に合わせるためDateToEraNumで取得した元号番号から減算(-2)する
	iG	:= DateToEraNum(EncodeDate(iY, 12, 31), epMSNet) - 2;
	
	// 大正以前の場合はFalseを返す。
	Result := iG >= 1;
	// <NewEraName-K> ADD Start
end;


//************************************************************************
//*	Proccess		:	fnGakurekiUpdate
//*					:	学歴情報更新
//*	Retrun			:
//*	History			:	2010/01/13 Y.Kondo <2010-01-13>
//						InsertDateとUpDateDateの識別
//************************************************************************
function THAP000012CBaseF.fnGakurekiUpdate : Boolean;
var
	qryCopDB,
	qDel		: TMQuery;
	i,
	iNewNCode	: Integer;
	bHit		: Boolean;
begin
	Result := False;

	try
		qryCopDB := TMQuery.Create( Self );										// MQueryの構築
		MDBModule.SetDBInfoToQuery( ddCopDB, qryCopDB );

		qDel	:= TMQuery.Create( Self );										// MQueryの構築
		MDBModule.SetDBInfoToQuery( ddCopDB, qDel );
		try
			GakurekiMem.DisableControls;

			// 既存の学歴情報削除
			with qryCopDB do
			begin

//①DBにあって、Memにないレコードを削除
				Close;
				SQL.Clear;
				SQL.Add('SELECT * FROM HAPGAKU');
				SQL.Add('WHERE CorpNCode=:hCorpNCd AND EmpNCode=:hEmpNCd');
				SQL.Add('Order by OrderNo');

				SetFld('hEmpNCd').AsFloat	:=	pHapApParam^.GetEmpNCd;
				SetFld('hCorpNCd').AsFloat	:=	0;

				Open(TRUE);

				while not EOF do
				begin
					bHit := False;
					GakurekiMem.First;
					while not GakurekiMem.EOF do
					begin
						if GakurekiMem.FieldByName('NCode').AsInteger = GetFld('NCode').AsInteger then
						begin
							bHit := True;
							Break;
						end;
						GakurekiMem.Next;
					end;

					if not bHit then
					begin
						qDel.Close;
						qDel.SQL.Clear;
						qDel.SQL.Add('DELETE FROM HAPGAKU');
						qDel.SQL.Add('WHERE CorpNCode=:hCorpNCd AND EmpNCode=:hEmpNCd AND NCode=:hNCD');

						qDel.SetFld('hCorpNCd').AsFloat	:= 0;
						qDel.SetFld('hEmpNCd').AsFloat	:= pHapApParam^.GetEmpNCd;
						qDel.SetFld('hNCD').AsInteger	:= GetFld('NCode').AsInteger;

						if not qDel.ExecSQL then
							Abort;
					end;

					Next;
				end;
			end;

			// 学歴書き込み
			if GakurekiMem.RecordCount < 1 then
			begin
				Result := True;
				Exit;
			end;

//②新しく追加されたレコードはINSERT、それ以外はUPDATE
			i := 0;
			GakurekiMem.First;
			while not GakurekiMem.Eof do
			begin
				inc(i);

				with qryCopDB do
				begin
					Close;
					SQL.Clear;
					SQL.Add('SELECT * FROM HAPGAKU');
					SQL.Add('WHERE CorpNCode=:hCorpNCd AND EmpNCode=:hEmpNCd AND NCode=:hNCode');

					SetFld('hCorpNCd').AsFloat	:= 0;
					SetFld('hEmpNCd').AsFloat	:= pHapApParam^.GetEmpNCd;
					SetFld('hNCode').AsInteger	:= GakurekiMemNCode.AsInteger;

					Open(TRUE);

					if EOF then
					begin
						Close;
						SQL.Clear;
						SQL.Add('SELECT MAX(NCode) MND FROM HAPGAKU');
						SQL.Add('WHERE CorpNCode=:hCorpNCd AND EmpNCode=:hEmpNCd');

						SetFld('hCorpNCd').AsFloat	:= 0;
						SetFld('hEmpNCd').AsFloat	:= pHapApParam^.GetEmpNCd;

						Open(TRUE);

						if EOF then
							iNewNCode := 1
						else
							iNewNCode := GetFld('MND').AsInteger + 1;

						Close;
						SQL.Clear;

						SQL.Add('INSERT INTO HAPGAKU');
						SQL.Add('(UpdTantoNCode'	);
						SQL.Add(',EmpNCode'			);
						SQL.Add(',CorpNCode'		);
						SQL.Add(',OrderNo'			);
						SQL.Add(',Year'				);
						SQL.Add(',Month'			);
						SQL.Add(',Gakureki'			);
						SQL.Add(',NCode)'			);
						SQL.Add('VALUES'			);
						SQL.Add('(:hTantoNCd'		);
						SQL.Add(',:hEmpNCd'			);
						SQL.Add(',:hCopNCd'			);
						SQL.Add(',:hOrderNo'		);
						SQL.Add(',:hYear'			);
						SQL.Add(',:hMonth'			);
						SQL.Add(',:hGakureki'		);
						SQL.Add(',:hNCode)'			);

						SetFld('hNCode').AsInteger	:= iNewNCode;
					end
					else
					begin
						Close;
						SQL.Clear;

						SQL.Add('UPDATE HAPGAKU SET'
								+	' OrderNo=:hOrderNo'
								+	',UpdTantoNCode=:hTantoNCd'
								+	',Year=:hYear'
								+	',Month=:hMonth'
								+	',Gakureki=:hGakureki'		);
						SQL.Add('WHERE CorpNCode=:hCopNCd'
								+' AND EmpNCode=:hEmpNCd'
								+' AND NCode=:hNCode'			);

						SetFld('hNCode').AsInteger	:= GakurekiMemNCode.AsInteger;
					end;

					SetFld('hTantoNCd').AsFloat	:= rcCOMMONAREA(pAppRec^.m_pCommonArea^).TantoNCD;
					SetFld('hEmpNCd').AsFloat	:= pHapApParam^.GetEmpNCd;
					SetFld('hCopNCd').AsFloat	:= 0;
					SetFld('hOrderNo').AsInteger:= i;
					SetFld('hYear').AsInteger	:= GakurekiMemYYYY.AsInteger;
					SetFld('hMonth').AsInteger	:= GakurekiMemMM.AsInteger;
					SetFld('hGakureki').AsString:= GakurekiMemGakureki.AsString;

					if not ExecSQL then
						Abort;

				end;
				GakurekiMem.Next;
			end;

			Result := True;
		finally
			qDel.Close;
			qDel.Free;
			qryCopDB.Close;
			qryCopDB.Free;
		end;
	except
		MjsMessageBox(Self,'学歴の更新に失敗しました。',MjError,MjdefOK);
	end;
end;

//**********************************************************************
//		Component	: Form
//		Event		: OnDestroy
//		Process		: ﾌｫｰﾑ解放
//		Parameter	:
//**********************************************************************
procedure THAP000012CBaseF.FormDestroy(Sender: TObject);
begin
	if m_Series <> nil then
		m_Series.Free;

end;

//<131213>↓
//**********************************************************************
//		Component	: EGakkouNo, EGakkaNo
//		Event		: OnArrowClick
//		Process		: 検索Exp呼び出し
//		Parameter	:
//**********************************************************************
procedure THAP000012CBaseF.ArrowClick(Sender: TObject);
var
	ExpParam	: THapMNExExpParam;
	ExpIF		: THapMNExExpIF;
begin
	ExpParam	:= THapMNExExpParam.CreateParam;
	ExpIF		:= THapMNExExpIF.Create;

	try
		if ExpIF.Init(Self, pAppRec) = -1 then
		begin
			Abort;
		end;

		ExpParam.SetKMCode(TMNumEdit(Sender).Tag);

		try
			try
				ExpIF.DoDlg(ExpParam);

				if ExpParam.ExpResult <> mrOK then	//ｷｬﾝｾﾙ押下
				begin
					Exit;
				end;

				TMNumEdit(Sender).Value := ExpParam.ExpRetCode;

				if TMNumEdit(Sender) = EGakkouNo then
				begin
					EGakkouNo.Value		:= ExpParam.ExpRetCode;
					EGakkouName.Text	:= ExpParam.ExpRetText;
				end
				else if TMNumEdit(Sender) = EGakubu then
				begin
					EGakubu.Value		:= ExpParam.ExpRetCode;
					LEGakubu.Caption	:= ExpParam.ExpRetText;
				end
				else if TMNumEdit(Sender) = EGakkaNo then
				begin
					EGakkaNo.Value		:= ExpParam.ExpRetCode;
					EGakkaName.Text		:= ExpParam.ExpRetText;
				end;

				MjsNextCtrl(Self);

			finally
				ExpIF.Term;
			end;
		except
			raise Exception.Create('区分名称(拡張)検索エクスプローラーの呼出に失敗しました。');//<210122>
		end;
	finally
		ExpIF.Free;
		ExpParam.Free;
	end;
end;

//**********************************************************************
//		Component	: EGakkouNo, EGakkaNo
//		Event		: OnChange
//		Process		: 入力制御
//		Parameter	:
//**********************************************************************
procedure THAP000012CBaseF.Change(Sender: TObject);
var
	bFlg	:	Boolean;
begin

	if TMNumEdit(Sender).Value > 0 then
	begin
		bFlg	:= True;
	end
	else
	begin
		bFlg	:= False;
	end;

	if TMNumEdit(Sender) = EGakkouNo then
	begin
		with EGakkouName do
		begin
			Static		:= bFlg;
			ReadOnly 	:= bFlg;
			ParentColor	:= bFlg; 

			if not bFlg then
			begin
				Color	:= clWindow;
			end;

			TabStop		:= not bFlg;
		end;
	end
	else if TMNumEdit(Sender) = EGakkaNo then
	begin
		with EGakkaName do
		begin
			Static		:= bFlg;
			ReadOnly	:= bFlg;
			ParentColor	:= bFlg;

			if not bFlg then
			begin
				Color	:= clWindow;
			end;

			TabStop		:= not bFlg;
		end;
	end;
end;
                             
//************************************************************************
//*	Proccess		:	fnGetHAPMNExName
//*					:	学校・学科名取得
//*	Retrun			:
//*	History			:
//************************************************************************
function THAP000012CBaseF.fnGetHAPMNExName(KubunNo : Integer; KM_ItemNo : Integer) : String;
var
	qry		: TMQuery;
	rcMsg	: TMjsMsgRec;
begin
	Result	:= '';
	qry		:= TMQuery.Create(Self);											// MQueryの構築

	if Assigned(qry) <> True then
	begin
		Exit;
	end;

	MDBModule.SetDBInfoToQuery(ddCopDB, qry);									// DBとの接続
	try
		try
			with qry do
			begin
				Close();
				SQL.Clear();
				SQL.Add('SELECT'
						+	' Ex.KubunName '
						+ ' FROM'
						+	' HAPMNEx Ex'
						+ ' WHERE'
						+	' Ex.KubunNo = :KubunNo'
						+ ' AND'
						+	' Ex.ItemNo = :ItemNo');

				SetFld('KubunNo').AsInteger := KubunNo;
				SetFld('ItemNo').AsInteger := KM_ItemNo;

				Open(True);

				if Eof then														//該当ﾃﾞｰﾀ0件
				begin
					Exit;
				end;

				Result	:= FieldByName('KubunName').AsString;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'区分名称情報の' + sMsg, sTitle, IconType, BtnType, BtnDef, LogType);
			end;

			Exit;
		end;
	finally
		qry.Close;
		qry.Free;
	end;
end;
//<131213>↑

//<RefDay> ↓
//************************************************************************
//*	Proccess		:	fnRefColorChange
//*					:	基準日項目の色変更
//*	Return			:
//*	History			:
//************************************************************************
procedure THAP000012CBaseF.fnRefColorChange;
const
	arrSCFItemLblStr : array [0..10] of String =
	('MLabel3'		//出身地
	,'MLabel5'		//国籍
	,'MLabel16'		//語学
	,'MLabel24'		//分類区分1
	,'MLabel28'		//分類区分2
	,'MLabel45'		//分類区分3
	,'MLabel8'		//予備区分1
	,'MLabel13'		//予備区分2
	,'MLabel15'		//予備区分3
	,'MLabel18'		//予備区分4
	,'MLabel22'		//予備区分5
	);


var
	i	: Integer;
	Lbl	: TMLabel;
begin
	//必ず色を制御するラベル
	if pHapApParam.GetRefType = 1 then
    begin
		MLabel6.Color		:= _HAP_CHILDCL_REFCOL_;							//前職
		MLabel6.Font.Color	:= clWhite;
    end
	else if pHapApParam.GetRefType = 2 then
	begin
		MLabel6.Color		:= _HAP_CHILDCL_REFNOW_;
		MLabel6.Font.Color	:= clWindowText;
	end
	else
	begin
		MLabel6.ParentColor		:= True;
		MLabel6.Font.Color		:= clWindowText;
	end;

	//HAPSCF項目
    for I := 0 to Length(arrSCFItemLblStr)-1 do
    begin
        Lbl := TMLabel(MjsFindCtrl(Self,arrSCFItemLblStr[i]));

		Lbl.ParentColor	:= True;
		Lbl.Font.Color	:= clWindowText;

		if pHapApParam.GetRefType > 0 then										//基準日指定時
		begin
			if fnRefItemGet(Lbl.Tag) = True then								//基準日でSCF取得成功
			begin
				if pHapApParam.GetRefType = 1 then								//基準日指定時
				begin
   		             Lbl.Color		:= _HAP_CHILDCL_REFCOL_;
   		             Lbl.Font.Color	:= clWhite;
				end
				else if pHapApParam.GetRefType = 2 then							//マスタ参照時
				begin
   		             Lbl.Color		:= _HAP_CHILDCL_REFNOW_;
   	    	         Lbl.Font.Color	:= clWindowText;
				end;
			end;
		end;
    end;
end;
//************************************************************************
//*	Proccess		:	fnRefItemGet
//*					:	基準日時点での項目の取得
//*	Return			:   Boolean
//*					:
//*	History			:
//************************************************************************
Function THAP000012CBaseF.fnRefItemGet(iCode : Integer) : Boolean;
var
	KMQuery	:	TMQuery;
	TComp	:	TCustomEdit;
    Lbl		:	TMLabel;
begin
	Result	:= False;
	KMQuery := TMQuery.Create(Self);											// MQueryの構築

	if Assigned(KMQuery) <> true then
	begin
		Exit;
	end;

	with KMQuery do
	begin
		try
			try
				MDBModule.SetDBInfoToQuery(ddCopDB, KMQuery);
				Close;
				SQL.Clear;
				SQL.Add(' SELECT CalcFlag, CalcFlagLongName'	);
				SQL.Add(' FROM MP_HAP_HAPSCF_STD('
						+''''+ FormatDateTime('yyyy-mm-dd',pHapApParam.GetRefDate) +''''		//第1パラメータ（日付）
						+','+IntToStr(iCode)+')'		);                      //第2パラメータ（項目コード）
    			SQL.Add(' WHERE EmpNCode = :EmpNCd AND CorpNCode = 0');

				ParamByName('EmpNCd').AsString := IntToStr(pHapApParam^.GetEmpNCd);

				if not Open then
					Abort;

				if not EOF then
				begin
					Result := True;
					if pHapApParam.GetRefType = 1 then
					begin
						//項目の値
						TComP := fnPartsGet(iCode);
						(TComP as TMNumEdit).Value := GetFld('CalcFlag').AsInteger;
						//項目右側ラベル文字
                        Lbl := TMLabel(MJSFindCtrl(Self,'L' + TComP.Name));
                        Lbl.Caption := GetFld('CalcFlagLongName').AsString;
                    end;
				end
				else
				begin
					Result := False;
                end;

			except
				GetMsg(rcMsg,200,1);
				with rcMsg do
					MjsMessageBoxEx(Self,'履歴項目取得失敗' +sMsg,sTitle,IconType,BtnType,BtnDef,LogType);
				abort;
			end;
		finally
			Close;
			Free;
		end;
	end;
end;
//<RefDay> ↑

end.
