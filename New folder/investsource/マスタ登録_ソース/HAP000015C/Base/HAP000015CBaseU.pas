//******************************************************************************
//		System			:MJSFX
//		Program			:人事情報登録(教育研修)
//		ProgramID		:HAP000015CBase
//		Name			:H.Itahana(Buntechno)
//		Create			:2005/06/20
//		Comment			:
//		History			:2005/10/31 H.Itahana(Buntechno)
//						:・Application対応
//						:2006/03/29 H.Takaishi(Buntechno)
//						:・グリッド上のEnd,ESCキーで、
//						:  親フォームのボタンにフォーカス移動するように		<2006-03-29_1>
//						:2006/03/29 H.Takaishi(Buntechno)
//						:・教育・研修タブ切替時のチェックで
//						:  エラーがあってもタブが切替わっていた問題を修正	<2006-03-29_2>
//						:2006/03/29 H.Takaishi(Buntechno)
//						:・先頭行の入力中でも削除ボタンが効くように			<2006-03-29_3>
//						:2006/07/14 H.Takaishi(Buntechno)
//						:・項目見出しの統一対応								<2006-07-14>
//						:2008/02/15	T.ABE (TAKUMI)		<080215>
//						:・一行削除／挿入をF5,F6へ変更
//						:2009/12/28 Y.Kondo (TakumiCo.)		<2009-12-28>
//						:・名称の選択を検索Expに変更
//						:2010/01/19(Y.Kondo)
//						:・編集中レコードの判定追加			<2010-01-19>
//						:2011/05/23	R.Kobayashi(TakumiCo.)
//						:・受講終了予定年月日,団体コード,受講金額を追加		<2011-05-23> 
//						:2013/03/25 E.Inukai
//						:・エンターキー対応		<130325>
//						:2014/04/15 E.Inukai
//						:・フリー項目対応		<140415>
//						:2019/03/19 K.Takahashi(CyberCom)
//						:・新元号対応(Gengou)
//						:2020/01/30	T.Nakamura(NTC)
//						:・Delphi10-コンパイル対応	<D10-C>
//						:2020/04/22	Y.Iwakawa
//						:・基準日対応						<RefDay>
//						:2020/04/23	R.Masuno(CyberCom)
//						:・Delphi10移行 共通案件別対応E014	<D10-E014>
//******************************************************************************
//		注意:	全ｺﾝﾎﾟｰﾈﾝﾄのEnter/ExitｲﾍﾞﾝﾄはfnWCtlEnter/fnWCtlExitに動的に
//			:	割り当てている(その中でｺﾝﾎﾟｰﾈﾝﾄ別に分岐)
//			:	ｵﾌﾞｼﾞｪｸﾄｲﾝｽﾍﾟｸﾀ上でｲﾍﾞﾝﾄを自動生成してもそのままだと
//			:	実行時に呼び出されません!!
//******************************************************************************
unit HAP000015CBaseU;

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
	MJSBitBtn,
	MJSPanel,
	MJSLabel,
	MJSEdits,
	MjsDBModuleU,
	HapApIFU,
	FireDAC.Comp.Client,
	MJSQuery,
	Db,
	dxGrClms,
	dxDBGrid,
	dxTL,
	dxCntner,
	dxmdaset,
	MJSSpeedButton,
	HapGridProcU,
	MjsCommon2U,
	HapMNExExpIFU,
//<130325>↓
	MjsKeyDataState;
//<130325>↑

const
  {$I HapCmnDef.inc}

type
  {$I ActionInterface.inc}
// <NewEraName-P1> ADD Start
  {$I HAPEraNameCtrl_H.inc}
// <NewEraName-P1> ADD End

  TTagInfo=record
	LCnt	:	TLabel;
//	LRec	:	TLabel;
	sName	:	String;
	dxGrid	:	TdxDBGrid;
  end;

  THAP000015CBaseF = class(TForm)
	PMain: TMPanel;
	PTool: TMPanel;
	KyoMemData: TdxMemData;
	KyoDataSource: TDataSource;
	KyoMemDataKyoKbnName: TStringField;
	KyoMemDataKyoDateEnd: TDateTimeField;
	KyoMemDataKyoDateStart: TDateTimeField;
	KyoMemDataKyojikou: TStringField;
	KyoMemDataJukouCode: TIntegerField;
	KyoMemDataJukouName: TStringField;
	KyoMemDataEntNo: TIntegerField;
	KyoMemDataKyoBunya: TStringField;
    KyoMemDataEduExpDate: TDateField;
    KyoMemDataEduOrg: TIntegerField;
    KyoMemDataEduOrgName: TStringField;
    KyoMemDataEduFee: TCurrencyField;
    MPanel1: TMPanel;
    MLabel4: TMLabel;
    LKyoWarning: TMLabel;
    MLabel3: TMLabel;
    LKyoCnt: TMLabel;
    lblKbn: TMLabel;
    MPanel3: TMPanel;
    MLabel2: TMLabel;
    MPanel4: TMPanel;
    MPanel5: TMPanel;
    MPanel2: TMPanel;
    DxKyoGrid: TdxDBGrid;
    DxKyoGridColumn7: TdxDBGridButtonColumn;
    DxKyoGridColumn1: TdxDBGridColumn;
    DxKyoGridColumn8: TdxDBGridPickColumn;
    DxKyoGridColumn2: TdxDBGridColumn;
    DxKyoGridColumn3: TdxDBGridDateColumn;
    DxKyoGridColumn9: TdxDBGridDateColumn;
    DxKyoGridColumn4: TdxDBGridDateColumn;
    DxKyoGridColumn10: TdxDBGridButtonColumn;
    DxKyoGridColumn11: TdxDBGridColumn;
    DxKyoGridColumn12: TdxDBGridMaskColumn;
    DxKyoGridColumn5: TdxDBGridColumn;
    MPanel6: TMPanel;
    MPanel7: TMPanel;
    KyoMemDataExNum1: TIntegerField;
    KyoMemDataExText1: TStringField;
    KyoMemDataExDate1: TDateField;
    KyoMemDataExNum2: TIntegerField;
    KyoMemDataExText2: TStringField;
    KyoMemDataExDate2: TDateField;
    KyoMemDataExNum3: TIntegerField;
    KyoMemDataExText3: TStringField;
    KyoMemDataExDate3: TDateField;
    KyoMemDataExNum4: TIntegerField;
    KyoMemDataExText4: TStringField;
    KyoMemDataExDate4: TDateField;
    KyoMemDataExNum5: TIntegerField;
    KyoMemDataExText5: TStringField;
    KyoMemDataExDate5: TDateField;
    DxKyoGridColumn14: TdxDBGridColumn;
    DxKyoGridColumn15: TdxDBGridDateColumn;
    DxKyoGridColumn17: TdxDBGridColumn;
    DxKyoGridColumn18: TdxDBGridDateColumn;
    DxKyoGridColumn20: TdxDBGridColumn;
    DxKyoGridColumn21: TdxDBGridDateColumn;
    DxKyoGridColumn23: TdxDBGridColumn;
    DxKyoGridColumn24: TdxDBGridDateColumn;
    DxKyoGridColumn26: TdxDBGridColumn;
    DxKyoGridColumn27: TdxDBGridDateColumn;
    DxKyoGridColumn13: TdxDBGridMaskColumn;
    DxKyoGridColumn16: TdxDBGridMaskColumn;
    DxKyoGridColumn19: TdxDBGridMaskColumn;
    DxKyoGridColumn22: TdxDBGridMaskColumn;
    DxKyoGridColumn25: TdxDBGridMaskColumn;
	procedure FormCreate(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
	procedure KyoMemDataAfterScroll(DataSet: TDataSet);
	procedure KyoMemDataBeforePost(DataSet: TDataSet);
	procedure KyoMemDataAfterPost(DataSet: TDataSet);
	procedure KyoMemDataBeforeInsert(DataSet: TDataSet);
	procedure KyoMemDataAfterInsert(DataSet: TDataSet);
	procedure KyoMemDataAfterDelete(DataSet: TDataSet);
	procedure DxKyoGridBeforeChangeColumn(Sender: TObject;
	  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
	  NewColumn: Integer; var CanChange: Boolean);
	procedure DxKyoGridKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);
	procedure DxKyoGridKeyPress(Sender: TObject; var Key: Char);
	procedure DxKyoGridColumn3DateValidateInput(Sender: TObject;
	  const AText: String; var ADate: TDateTime; var AMessage: String;
	  var AError: Boolean);
	procedure DxKyoGridColumn4DateValidateInput(Sender: TObject;
	  const AText: String; var ADate: TDateTime; var AMessage: String;
	  var AError: Boolean);
	procedure DxKyoGridColumn7EditButtonClick(Sender: TObject);
	procedure KyoMemDataJukouCodeChange(Sender: TField);
    procedure DxKyoGridColumn10EditButtonClick(Sender: TObject);
    procedure KyoMemDataEduOrgChange(Sender: TField);

  private
	{ Private 宣言 }
	pAppRec			: ^TMjsAppRecord;
	pHapApParam		: ^THapApParam;												//給与親子間ﾊﾟﾗﾒｰﾀ
	MDBModule		: TMDataModuleF;
	recSystem		: rcSYSTEMAREA;												// システム・メモリ 構造体

	ddCopDB			: TFDConnection;

	GridProc		: THapGridProc;

	giParamMode		: Integer;													//パラメータ 1:教育 2:研修
	gsParamMode		: String;													//パラメータ '教育','研修'

	mqSelect,
	mqUpdate,
	mqKM			: TMQuery;

	BNotChangeCol1	: Boolean;
	BNotChangeCol2	: Boolean;

	ACCtrl			: TWinControl;

	//<080215> Insert,DeleteボタンTag格納値
	m_Tag			: Integer;

	//<140415> 表示カラム数
	m_VisibleColumnCount : Integer;

  // 暫定関数郡
	constructor	CreateForm(pRec,pActionParam:pointer);
	procedure	fnDetailSet;
	procedure	fnDetailEnable(bEnable:boolean);
	procedure	fnEditEnd;
	procedure	fnFBarClick;
	procedure	fnFormIni;
	procedure	fnWCTLExit(Sender:TObject);
	procedure	fnWCTLEnter(Sender:TObject);
	function	fnUpdate:boolean;
	procedure	fnDateFormatSet;
	function	fnMNExNameGet(CODE:Integer;
				var MNName:String;var Bunya:String;var Kubun:String;		//<2009-12-28>リストｾｯﾄから一括取得に変更
				iExItem:Integer=0):Boolean;									//<2011-05-23>引数追加
	function	fnDataCheck : Boolean;
	function	fnRowIsEmpty(gr:TDxDBGrid):boolean;
	function	fnGetItemName(ItemNo: integer): string;
	function	fnEDUUpdate: Boolean;
	function	fnDateTimeToStr(AField: TField): string;
	function	fnSDateCountGet(FDate : TField):Integer;

	//<080215>
	procedure BDeleteClick;
	procedure BInsertClick;

	//<140415>
	procedure fnGetFreeItem(giParamMode : Integer);

  public
	{ Public 宣言 }
  protected
	procedure CMChildKey(var Msg: TWMKey);message CM_ChildKey;
end;

function AppEntry(pPar:pointer):integer;
exports
  AppEntry;

//var
//  HAP000015CBaseF: THAP000015CBaseF;

implementation
uses
	MjsDispCtrl,MjsCommonU,HAPLibU,MjsDateCtrl,HAPMsgU,dxExEdtr;

const
{件数Fullまで登録したかどうかの判定}
	_MAX_=9999;

	KYOUIKU_CODE= 170700;	//教育 HAPMN.ItemNo
	KENSYU_CODE	= 171100;	//研修 HAPMN.ItemNo
	DANTAI_CODE	= 170910;	//団体 HAPMN.ItemNo <2011-05-23>

const
	KyoName	:	Array[1..2] of String = ('社内教育','社外教育');
	KenName	:	Array[1..2] of String = ('社内研修','社外研修');

	//<080215> ファンクション表示
	arrFuncClear:array[0..7]of string=(			//消去用
											'',
											'',
											'',
											'',
											'F5 一行挿入,0',
											'F6 一行削除,0',
											'',
											''
											);
	arrFunc56:array[0..7]of string=(
											'',
											'',
											'',
											'',
											'F5 一行挿入,1',
											'F6 一行削除,1',
											'',
											''
											);
{$R *.DFM}
// <NewEraName-P1> ADD Start
{$I HAPEraNameCtrl_B.inc}
// <NewEraName-P1> ADD End

//**********************************************************************
//		Exports	Function
//**********************************************************************
//**********************************************************************
//		Proccess	:BPL外部関数
//		Parameter	:
//		Return		:
//		History		:2XXX/XX/XX
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function AppEntry(pPar:pointer):integer;
var
	pForm:^THAP000015CBaseF;
	pRec : ^TMjsAppRecord;
	pActionParam:^THapApParam;
	iAction:integer;
begin
	Result		:= ACTID_RET_NG;
	pRec		:= Pointer( TAppParam( pPar^ ).pRecord );			//TMjsAppRecord 構造体 pointer 取得
	pActionParam:= Pointer( TAppParam( pPar^ ).pActionParam );		//送受信ﾊﾟﾗﾒｰﾀ
	iAction		:= TAppParam( pPar^ ).iAction;						//Action ID 取得

	case iAction of
		{ﾌｫｰﾑ作成}
		ACTID_FORMCREATESTART ,
		{ﾌｫｰﾑ作成+表示}
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
				pForm^ := THAP000015CBaseF.CreateForm( pRec,pActionParam );
//2005-10-31
				pRec^.m_pChildForm := pForm;
				if iAction = ACTID_FORMCREATESHOWSTART then
				begin
					pForm^.Show;
					THAP000015CBaseF(pForm^).PTool.Show;	//処理ﾎﾞﾀﾝ[可視]
					{処理ﾎﾞﾀﾝは親AP側をParentにしているので子APﾌｫｰﾑの表示/非表示が反映されない}
				end;
			except
				Dispose( pForm );
				pRec^.m_pChildForm := nil;
				Exit;
			end;
		end;

		{ﾌｫｰﾑ終了}
		ACTID_FORMCLOSESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			pForm^.Close;
			pForm^.Free;
			Dispose( pForm );
			pRec^.m_pChildForm := nil;
		end;

		{ﾌｫｰﾑ終了確認}
		ACTID_FORMCANCLOSESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );

			if pForm^.CloseQuery = False then
			begin
				Exit;
			end;
		end;

		{ﾌｫｰﾑ表示}
		ACTID_SHOWSTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			pForm^.Show;
			THAP000015CBaseF(pForm^).PTool.Show;			//処理ﾎﾞﾀﾝ[可視]
			{処理ﾎﾞﾀﾝは親AP側をParentにしているので子APﾌｫｰﾑの表示/非表示が反映されない}
		end;

		{ﾌｫｰﾑ非表示}
		ACTID_HIDESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );

			if pForm^.Parent <> nil then
			begin
				pForm^.Hide;
				THAP000015CBaseF(pForm^).PTool.Hide;		//処理ﾎﾞﾀﾝ[不可視]
				{処理ﾎﾞﾀﾝは親AP側をParentにしているので子APﾌｫｰﾑの表示/非表示が反映されない}
			end;
		end;

//--------------------------
//	給与拡張Action	ST
//---------------------------
		{社員内容表示}
		HAPAP_ACTID_SHOWDATA:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000015CBaseF(pForm^).fnDetailSet;
		end;

		{子AP[使用可]}
		HAPAP_ACTID_ENABLE:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000015CBaseF(pForm^).fnDetailEnable(True);
		end;

		{子AP[使用不可]}
		HAPAP_ACTID_DISABLE:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000015CBaseF(pForm^).fnDetailEnable(False);
		end;

		{ﾌｫｰｶｽ復帰-処理選択ｺﾝﾎﾞ切替}
		HAPAP_ACTID_SETFOCUS:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			with THAP000015CBaseF(pForm^) do
			begin
				if ACCtrl.Enabled then
				begin
					MjsSetFocus(THAP000015CBaseF(pForm^),ACCtrl.Name);
					HapSendToOwner(HAPAP_ACTID_ENTER_OK,pRec,pActionParam);
				end;
			end;
		end;

		{ﾌｫｰｶｽ先頭-親APﾀﾌﾞからIN}
		HAPAP_ACTID_SETFOCUS_FIRST:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			with THAP000015CBaseF(pForm^) do
			begin
				ACCtrl:=DxKyoGrid;
				if not DxKyoGrid.DataSource.DataSet.IsEmpty then
				begin
					with DxKyoGrid.DataSource.DataSet do
					begin
						DisableControls;
						try
							First;
						finally
							EnableControls;
						end;
					end;
				end;
				DxKyoGrid.FocusedColumn:=0;
				MjsSetFocus(THAP000015CBaseF(pForm^),ACCtrl.Name);
			end;
			HapSendToOwner(HAPAP_ACTID_ENTER_OK,pRec,pActionParam);
														//ﾌｫｰｶｽ取得可能を通知
		end;

		{ﾌｫｰｶｽ最終-前へ/次へ/更新/取消ﾎﾞﾀﾝからIN}
		HAPAP_ACTID_SETFOCUS_LAST:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			with THAP000015CBaseF(pForm^) do
			begin
				ACCtrl:=DxKyoGrid;
				if not DxKyoGrid.DataSource.DataSet.IsEmpty then
				begin
					with DxKyoGrid.DataSource.DataSet do
					begin
						DisableControls;
						try
							Last;
						finally
							EnableControls;
						end;
					end;
					//<140415>↓
					//DxKyoGrid.FocusedColumn:=7;
					DxKyoGrid.FocusedColumn:=m_VisibleColumnCount;
					//<140415>↑
				end
				else
					DxKyoGrid.FocusedColumn:=0;

				MjsSetFocus(THAP000015CBaseF(pForm^),ACCtrl.Name);
			end;
			HapSendToOwner(HAPAP_ACTID_ENTER_OK,pRec,pActionParam);
														//ﾌｫｰｶｽ取得可能を通知
		end;

		{子AP終了}
		HAPAP_ACTID_EXIT:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000015CBaseF(pForm^).fnEditEnd;
		end;

		{親APﾌｧﾝｸｼｮﾝﾊﾞｰｸﾘｯｸ}
		HAPAP_ACTID_FBARCLICK:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			{ﾌｧﾝｸｼｮﾝNoの取り出しと現在ｺﾝﾎﾟｰﾈﾝﾄにより判定を行う}
			THAP000015CBaseF(pForm^).fnFBarClick;
		end;

//--------------------------
//	給与拡張Action	ED
//---------------------------
	end;

	Result:=ACTID_RET_OK;
end;

//**********************************************************************
//		Constructor
//**********************************************************************
//**********************************************************************
//		Component	:Form
//		Event		:Constructor
//		Proccess	:社員教育研修Form作成
//		Parameter	:pRec	:MjsAppRecord
//		Return		:なし
//		History		:2019/03/19(K.Takahashi(CyberCom))
//					:新元号対応(Gengou)
//**********************************************************************
constructor THAP000015CBaseF.CreateForm(pRec,pActionParam:pointer);
var
	PCallForm	: ^TControl;													//2005-10-31
begin
	pAppRec		:= pRec;
	pHapApParam	:= pActionParam;

	PCallForm	:= TMjsAppRecord(pAppRec^).m_pOwnerForm;						//2005-10-31

	giParamMode := pHapApParam^.GetPara;										//切替用パラメータ取得

	if giParamMode = 0 then
		gsParamMode := '教育'
	else
		gsParamMode := '研修';

	recSystem	:= rcSYSTEMAREA(pAppRec^.m_pSystemArea^);

	MDBModule:=TMDataModuleF(pAppRec^.m_pDBModule^);

	ddCopDB:=pHapApParam^.GetCopDB;

	mqKM:=TMQuery.Create(Self);
	try
		MDBModule.SetDBInfoToQuery(ddCopDB,mqKM);
	except
		mqKM.Free;
		raise Exception.Create('項目名用ｸｴﾘ獲得に失敗しました。');
	end;

	mqUpdate:=TMQuery.Create(Self);
	try
		MDBModule.SetDBInfoToQuery(ddCopDB,mqUpdate);
	except
		mqUpdate.Free;
		mqKM.Free;
		raise Exception.Create('項目名用ｸｴﾘ獲得に失敗しました。');
	end;

	mqSelect:=TMQuery.Create(Self);
	try
		MDBModule.SetDBInfoToQuery(ddCopDB,mqSelect);
	except
		mqSelect.Free;
		mqUpdate.Free;
		mqKM.Free;
		raise Exception.Create('項目名用ｸｴﾘ獲得に失敗しました。');
	end;

	GridProc := THapGridProc.CreateObj(pAppRec);

//2005-10-31
//	inherited Create(Application);
	inherited Create(PCallForm^);

// <NewEraName-P1> ADD Start
	DxKyoGridColumn3.Gengou := GetEraName(Now(), emAlpha)[1];
	DxKyoGridColumn9.Gengou := GetEraName(Now(), emAlpha)[1];
	DxKyoGridColumn4.Gengou := GetEraName(Now(), emAlpha)[1];
	DxKyoGridColumn15.Gengou := GetEraName(Now(), emAlpha)[1];
	DxKyoGridColumn18.Gengou := GetEraName(Now(), emAlpha)[1];
	DxKyoGridColumn21.Gengou := GetEraName(Now(), emAlpha)[1];
	DxKyoGridColumn24.Gengou := GetEraName(Now(), emAlpha)[1];
	DxKyoGridColumn27.Gengou := GetEraName(Now(), emAlpha)[1];
// <NewEraName-P1> ADD End
end;

//**********************************************************************
//		Form Event Function
//**********************************************************************
//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Proccess	:教育研修ﾌｫｰﾑ 作成
//		Parameter	:
//		Return		:
//		History		:
//**********************************************************************
procedure THAP000015CBaseF.FormCreate(Sender: TObject);
begin
	fnFormIni;							//画面項目初期化

	MjsFontResize(THAP000015CBaseF(Self),pointer(pAppRec));

	MJSCommonU.MJSColorChange (		THAP000015CBaseF (Self),
									recSystem.SysColorB,
									recSystem.SysColorD,
									recSystem.SysBaseColorB,
									recSystem.SysBaseColorD,
									rcCOMMONAREA(pAppRec^.m_pCommonArea^).SysFocusColor);
	ACCtrl:=DxKyoGrid;

end;

//**********************************************************************
//		Component	:TForm
//		Event		:Destroy
//		Process		:ﾌｫｰﾑ破棄
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.FormDestroy(Sender: TObject);
begin
	GridProc.Free;

	//Taｇに格納したﾒﾓﾘ解放
	with DxKyoGrid.DataSource.DataSet do
		if Tag<>0 then
			dispose(pointer(Tag));

	mqSelect.Free;
	mqUpdate.Free;
	mqKM.Free;
end;

//**********************************************************************
//		Component Event Function
//**********************************************************************
//**********************************************************************
//		Component	:KyoMemData
//		Event		:AfterPost
//		Process		:教育ﾒﾓﾃﾞｰﾀ 行更新後
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.KyoMemDataAfterPost(DataSet: TDataSet);
begin
	//AfterInsertｲﾍﾞﾝﾄでは初期表示で件数が1件少なく表示されるためPost使用
end;

//**********************************************************************
//		Component	:KyoMemData
//		Event		:AfterDelete
//		Process		:教育ﾒﾓﾃﾞｰﾀ 行削除後
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.KyoMemDataAfterDelete(DataSet: TDataSet);
begin

	//件数表示
	with Dataset,TTagInfo(pointer(Dataset.Tag)^) do
	begin
		LCnt.Caption:=Trim(Format('%4d',[RecordCount]));

		//上限ﾒｯｾｰｼﾞ有無
		LKyoWarning.Visible:=(RecordCount>=_MAX_);
	end;

end;

//**********************************************************************
//		Component	:KyoMemData
//		Event		:AfterInsert
//		Process		:教育ﾒﾓﾃﾞｰﾀ ﾚｺｰﾄﾞ追加後
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.KyoMemDataAfterInsert(DataSet: TDataSet);
begin

	with Dataset,TTagInfo(pointer(Dataset.Tag)^) do
	begin
		//件数表示
		LCnt.Caption:=Trim(Format('%4d',[RecordCount]));

		//上限ﾒｯｾｰｼﾞ有無
		LKyoWarning.Visible:=(RecordCount>=_MAX_);
	end;

end;

//**********************************************************************
//		Component	:KyoMemData
//		Event		:BoforeInsert
//		Process		:教育ﾒﾓﾃﾞｰﾀ 行更新前
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.KyoMemDataBeforeInsert(DataSet: TDataSet);
begin
//登録件数MAX?
	with Dataset,TTagInfo(pointer(Dataset.Tag)^) do
		if RecordCount>=_MAX_ then
			Abort;		//挿入のｶﾞｰﾄﾞ
end;

//**********************************************************************
//		Component	:KyoMemData
//		Event		:AfterScroll
//		Process		:教育ﾒﾓﾃﾞｰﾀ ﾚｺｰﾄﾞ位置移動
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.KyoMemDataAfterScroll(DataSet: TDataSet);
begin
	//件数表示
	with Dataset,TTagInfo(pointer(Dataset.Tag)^) do
	begin
		LCnt.Caption:=Trim(Format('%4d',[RecordCount]));
	end;
end;

//**********************************************************************
//		Component	:DxKyoGrid
//		Event		:BeforeChangeColumn
//**********************************************************************
procedure THAP000015CBaseF.DxKyoGridBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
begin
	if BNotChangeCol1=false then
		exit;

	//入力不可項目はフォーカス色はそのまま
	case NewColumn of
		1,2,3:CanChange := False;
		else
			CanChange := True;
	end;

	if NewColumn = Column then
		exit;

//<2009-12-28> S
	if (Column = 0) and (KyoMemDataJukouName.AsString = '') then
		CanChange := False;
//<2009-12-28> E

	//団体コード <2011-05-23>
	if (Column = 7) and
	   (KyoMemDataEduOrg.AsInteger <> 0) and (KyoMemDataEduOrgName.AsString = '') then
		CanChange := False;
end;

//**********************************************************************
//		Component	:DxKyoGrid
//		Event		:KeyPress
//**********************************************************************
procedure THAP000015CBaseF.DxKyoGridKeyPress(Sender: TObject;
  var Key: Char);
begin
	//[e]が入力できてしまうため追加
	if DxKyoGrid.FocusedColumn = 10 {6} then	//<2011-05-23>6→10
		exit;

	//<140415>↓
	if DxKyoGrid.FocusedField.DataType = ftString then
		exit;
	//<140415>↑

	if not ((CharInSet(Key, ['0'..'9'])) or (Key = Chr(VK_BACK)) or (Key = '-')) then	//<D10-C>in → CharInSet
		Key := #0;
end;

//**********************************************************************
//		Component	:BInsert
//		Event		:Click
//		Process		:挿入ﾎﾞﾀﾝ ｸﾘｯｸ
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
//<080215> イベントから関数へ変更
//procedure THAP000015CBaseF.BInsertClick(Sender: TObject);
procedure THAP000015CBaseF.BInsertClick;
begin
	//<080215> DataSetナンバーの格納先変更
	{if ((Sender as TSpeedButton).Tag=0)or
	   (not(TObject((Sender as TSpeedButton).Tag) is TDataSet))then
		Exit;

	(TObject((Sender as TSpeedButton).Tag) as TDataSet).Insert;
	}
	if (m_Tag = 0) or
	   (not (TObject(m_Tag) is TDataSet)) then
		Exit;

	(TObject(m_Tag) as TDataSet).Insert;
end;

//**********************************************************************
//		Component	:BSpDelete
//		Event		:Click
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
//<080215> イベントから関数へ変更
//procedure THAP000015CBaseF.BDeleteClick(Sender: TObject);
procedure THAP000015CBaseF.BDeleteClick;
var
	rcMsg:TMjsMsgRec;
	Ret	: Word;
	ds	: TDataSet;
begin
	//<080215> DataSetナンバーの格納先変更
	{if ((Sender as TSpeedButton).Tag=0)or
	   (not(TObject((Sender as TSpeedButton).Tag) is TDataSet))then
		Exit;

	ds:=TObject((Sender as TSpeedButton).Tag) as TDataSet;
	}
	if (m_Tag = 0) or
	   (not (TObject(m_Tag) is TDataSet)) then
		Exit;

	ds	:= TObject(m_Tag) as TDataSet;

// <2006-03-29_3> ----- S
//	if ds.RecordCount=0 then
	if (ds.RecordCount=0) and (ds.State <> dsInsert) then
// <2006-03-29_3> ----- E
		Exit;

	with TTagInfo(pointer(ds.Tag)^),dxGrid do
	begin
		GridProc.RowSelectOn(dxGrid);
		try
			GetMsg(rcMsg,110,8);
			with rcMsg do
				Ret:=MjsMessageBoxEx(	Self,
										'現在行' + sMsg + #13#10 + 'よろしいですか？',
										sTitle,
										IconType,
										BtnType,
										BtnDef,
										LogType		);

			if Ret<>mrOk then
				Exit;

			ds.Delete ;

		finally
			GridProc.RowSelectOff(dxGrid);
		end;
	end;
end;

//**********************************************************************
//		Component	:DxKyoGridColumn3
//		Event		:DateValidateInput
//**********************************************************************
procedure THAP000015CBaseF.DxKyoGridColumn3DateValidateInput(
  Sender: TObject; const AText: String; var ADate: TDateTime;
  var AMessage: String; var AError: Boolean);
var
	rcMsg	:TMjsMsgRec;
begin
	if Screen.ActiveControl.Name = 'BCancel' then
		AError:=False
	else
	begin
		GetMsg(rcMsg,100,3);
		AMessage := gsParamMode + '年月日（自）'+rcMsg.sMsg;
	end;
end;

//**********************************************************************
//		Component	:DxKyoGridColumn4
//		Event		:DateValidateInput
//**********************************************************************
procedure THAP000015CBaseF.DxKyoGridColumn4DateValidateInput(
  Sender: TObject; const AText: String; var ADate: TDateTime;
  var AMessage: String; var AError: Boolean);
var
	rcMsg	:TMjsMsgRec;
begin
	if Screen.ActiveControl.Name = 'BCancel' then
		AError:=False
	else
	begin
		GetMsg(rcMsg,100,3);
		AMessage := gsParamMode + '年月日（至）'+rcMsg.sMsg;

	end;
end;

//**********************************************************************
//		Component	:KyoMemData
//		Event		:BeforePost
//**********************************************************************
procedure THAP000015CBaseF.KyoMemDataBeforePost(DataSet: TDataSet);
begin
//<2009-12-28> S
	if (KyoMemDataJukouName.AsString = '') then
	begin
		DxKyoGrid.SetFocus;
		abort;
	end;
//<2009-12-28> E

	//団体コード <2011-05-23>
	if (KyoMemDataEduOrg.AsInteger <> 0) and (KyoMemDataEduOrgName.AsString = '') then
	begin
		DxKyoGrid.SetFocus;
		abort;
	end;
end;

//**********************************************************************
//		Component	:DxKyoGrid
//		Event		:KeyDown
//		Process		:教育ｸﾞﾘｯﾄﾞ KeyDown
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.DxKyoGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	ds:TDataSet;
	gr:TDxDBGrid;
begin
	//Grid
	gr:=Sender as TdxDBGrid;
	//MemData
	ds:=(Sender as TdxDBGrid).DataSource.Dataset;

	case Key of
		VK_ESCAPE,VK_END:
		begin
			//DataSource=MemData 編集中?
			if(ds.State in[dsEdit,dsInsert])then
				Exit;	//Gridまかせ

			//Grid 編集中?
			if gr.State in[tsEditing]then
				Exit;

			//[End]ｷｰ
			if(Key=VK_END)then
			begin
				//右端以外/[Ctrl]+[End]
// <2006-03-29_1> ----- S
//				if(gr.FocusedColumn<7)or
				//<140415>↓
				//if(gr.FocusedColumn<6)or
				if(gr.FocusedColumn<m_VisibleColumnCount)or
				//<140415>↑
// <2006-03-29_1> ----- E
				  (Shift=[ssCtrl])then
					Exit;

				ds.Cancel;
			end;

			MjsSetFocus(Self,DxKyoGrid.Name);
			with DxKyoGrid.DataSource.DataSet do
			begin
				if not IsEmpty then
				begin
					DisableControls;
					try
						First;
					finally
						EnableControls;
					end;
				end;
			end;
			DxKyoGrid.FocusedColumn:=0;

// <2006-03-29_1> ----- S
//			if(Key=VK_END)then
				Key:=0;
			HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN,pAppRec,pHAPAPParam);
			exit;
// <2006-03-29_1> ----- E
		end;

		VK_TAB:
		begin
			//[Shift]+[Tab]
			if(Shift=[ssShift])then
			begin
				//先頭行/先頭ｶﾗﾑ
				if(gr.FocusedColumn=0)and
				  ((ds.IsEmpty)or(ds.RecNo=1))then
				begin
					//親へ[ﾀﾌﾞへ移動]を送信
					HapSendToOwner(	HAPAP_ACTID_SETFOCUS_TAB,
									pAppRec,
									pHapApParam	); 
					//<140415>↓
					Key:=0;
					Abort;
					//<140415>↑

					//<080215>
					//挿入/削除ﾎﾞﾀﾝを使用不可
					{BInsert.Enabled:=False;
					BDelete.Enabled:=False;
					}
				end;
			end
			else
			begin
				case(gr.FocusedColumn)of
					0:	//先頭ｶﾗﾑ
					begin
						//新規で0TAB
						if not(ds.State in [dsInsert])then
							Exit;

//<2009-12-28> S
						if gr.EditingText <> '' then
							Exit;
//<2009-12-28>E

						//空でない?
						if(not fnRowIsEmpty(gr))then
							Exit;

						ds.Cancel;
						ds.Refresh;

						with DxKyoGrid.DataSource.DataSet do
						begin
							if not IsEmpty then
								First;
						end;
						DxKyoGrid.FocusedColumn:=0;

						MjsSetFocus(Self,DxKyoGrid.Name);
					end;
					//<140415>↓
					//7:	//最終ｶﾗﾑ
					else
					//<140415>↑
					begin
						//<140415>↓
                        if gr.FocusedColumn <> m_VisibleColumnCount - 1 then
							Exit;
						//<140415>↑

						//最終以外
						with ds do
						begin
							if not((RecordCount=_MAX_)and
								   (RecordCount=RecNo))then
								Exit;
						end;

						//研修履歴を先頭にする
						with DxKyoGrid.DataSource.DataSet do
						begin
							if not IsEmpty then
							begin
								DisableControls;
								try
									First;
								finally
									EnableControls;
								end;
							end;
						end;
						//先頭ｶﾗﾑへ
						DxKyoGrid.FocusedColumn:=0;
						MjsSetFocus(Self,DxKyoGrid.Name);
					end;
				end;
			end;
		end;

		VK_RIGHT:
		begin
			//編集中/右端以外
			if(ds.State in[dsEdit])or
				//<140415>↓
			  //(gr.FocusedColumn<7)then
			  (gr.FocusedColumn<m_VisibleColumnCount)then
				//<140415>↑
				Exit;

			//最終以外
			with ds do
			begin
				if not((RecordCount=_MAX_)and
					   (RecNo=RecordCount))then
					Exit;
			end;

			//次のｸﾞﾘｯﾄﾞへ
			with DxKyoGrid.DataSource.DataSet do
			begin
				if not IsEmpty then
				begin
					DisableControls;
					try
						First;
					finally
						EnableControls;
					end;
				end;
			end;
			DxKyoGrid.FocusedColumn:=0;

			MjsSetFocus(Self,DxKyoGrid.Name);
		end;

		VK_RETURN:
		begin
			case gr.FocusedColumn of
				//教育種類
				0:
				begin
					//新規登録でない?
					if not(ds.State in [dsInsert])then
						Exit;

//<2009-12-28> S
					if gr.EditingText <> '' then
						Exit;
//<2009-12-28>E

					//空でない?
					if(not fnRowIsEmpty(gr))then
						Exit;

					ds.Cancel;
					ds.Refresh;
				end;
				//特記事項
				7:
				begin
					//最終以外
					if not(ds.RecNo>=_MAX_)then
						Exit;
				end;
				//他ｶﾗﾑ
				else
					Exit;
			end;

			//研修履歴へ移動
			with DxKyoGrid.DataSource.DataSet do
			begin
				if not IsEmpty then
				begin
					DisableControls;
					try
						First;
					finally
						EnableControls;
					end;
				end;
			end;
			DxKyoGrid.FocusedColumn:=0;
			MjsSetFocus(Self,DxKyoGrid.Name);

			//挿入ｷｬﾝｾﾙで次ｺﾝﾎﾟｰﾈﾝﾄへ抜けるため必要
			Key:=0;
			Abort;
		end;

		VK_DOWN:
		begin
			case (gr.FocusedColumn)of
				0:
				begin
					//新規で0TAB
					begin
						//最終以外
						with ds do
						begin
							if not((RecordCount=_MAX_)and
								   (RecordCount=RecNo))then
								Exit;
						end;
					end;

					with DxKyoGrid.DataSource.DataSet do
					begin
						if not IsEmpty then
						begin
							DisableControls;
							try
								First;
							finally
								EnableControls;
							end;
						end;
					end;

					DxKyoGrid.FocusedColumn:=0;
					MjsSetFocus(Self,DxKyoGrid.Name);

					//挿入ｷｬﾝｾﾙで次ｺﾝﾎﾟｰﾈﾝﾄへ抜けるため必要
					Key:=0;
					Abort;
				end;
			end;
		end;

		//<080215>
		VK_INSERT:
		begin
			Key	:= 0;
		end;

		VK_F5:	// 一行挿入
		begin
			BInsertClick;
		end;

		VK_F6:	// 一行削除
		begin
			BDeleteClick;
		end;
	end;
end;

//**********************************************************************
//		Detail Function
//**********************************************************************
//**********************************************************************
//		Event		:fnDetailSet
//		Proccess	:社員内容表示
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.fnDetailSet;
var
	iNo		: integer;
	DMQuery : TMQuery;
	rcMsg	: TMjsMsgRec;
	sMode	: String;
	sSQL	: String;
	iNameCd	: Integer;
	sName,
	sBunya,
	sKubun	: String;
begin
	if KyoMemData.State in [dsEdit,dsInsert] then	//<2011-05-23>
		KyoMemData.Cancel;

	DxKyoGrid.FocusedColumn := 0;
	LKyoCnt.Caption	:= Format('%4d',[0]);

	BNotChangeCol1:=False;
	BNotChangeCol2:=False;

	fnDateFormatSet;															//西暦和暦切替え設定

	if KyoMemData.Active = True then											//dxMemDataのオーブン
		KyoMemData.Close;

	iNo := 0;

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
				{ 教育項目 ----------------------------}
//<RefDay> ↓
				if pHapApParam.GetRefType = 1 then
                begin
					sSQL := 'SELECT'
					+#13#10+' EduType,'
					+#13#10+' EduNCode,'
					+#13#10+' SDate,'
					+#13#10+' EDate,'
					+#13#10+' SameDateOrder,'
					+#13#10+' KubunNo,'
					+#13#10+' EduRemarks'
					+#13#10+',EduExpDate'
					+#13#10+',EduOrg'
					+#13#10+',EduFee'
					+#13#10+',ExNum1'
					+#13#10+',ExText1'
					+#13#10+',ExDate1'
					+#13#10+',ExNum2'
					+#13#10+',ExText2'
					+#13#10+',ExDate2'
					+#13#10+',ExNum3'
					+#13#10+',ExText3'
					+#13#10+',ExDate3'
					+#13#10+',ExNum4'
					+#13#10+',ExText4'
					+#13#10+',ExDate4'
					+#13#10+',ExNum5'
					+#13#10+',ExText5'
					+#13#10+',ExDate5'
					+#13#10+'FROM MP_HAP_HAPEDU_STD('''+ FormatDateTime('yyyy-mm-dd', pHapApParam.GetRefDate) +''')'
					+#13#10+'WHERE EmpNCode=:hEmpNCd'
					+#13#10+' AND CorpNCode=:hCopNCd'
					+#13#10+' AND EduType=:hEduType'
					+#13#10+'ORDER BY SDate DESC,'
					+#13#10+'EDate DESC,'
					+#13#10+'SameDateOrder,EduNCode DESC';
                end
//<RefDay> ↑
				else
				begin
					sSQL := 'SELECT'
					+#13#10+' EduType,'
					+#13#10+' EduNCode,'
					+#13#10+' SDate,'
					+#13#10+' EDate,'
					+#13#10+' SameDateOrder,'
					+#13#10+' KubunNo,'
					+#13#10+' EduRemarks'
					+#13#10+',EduExpDate'	//<2011-05-23>
					+#13#10+',EduOrg'		//<2011-05-23>
					+#13#10+',EduFee'		//<2011-05-23>
					//<140415>↓
					+#13#10+',ExNum1'
					+#13#10+',ExText1'
					+#13#10+',ExDate1'
					+#13#10+',ExNum2'
					+#13#10+',ExText2'
					+#13#10+',ExDate2'
					+#13#10+',ExNum3'
					+#13#10+',ExText3'
					+#13#10+',ExDate3'
					+#13#10+',ExNum4'
					+#13#10+',ExText4'
					+#13#10+',ExDate4'
					+#13#10+',ExNum5'
					+#13#10+',ExText5'
					+#13#10+',ExDate5'
					//<140415>↑
					+#13#10+'FROM HAPEDU'
					+#13#10+'WHERE EmpNCode=:hEmpNCd'
					+#13#10+' AND CorpNCode=:hCopNCd'
					+#13#10+' AND EduType=:hEduType'
					+#13#10+'ORDER BY SDate DESC,'
					+#13#10+'EDate DESC,'
					+#13#10+'SameDateOrder,EduNCode DESC';
				end;

				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				SetFld('hEmpNCd').AsFloat	:= pHapApParam^.GetEmpNCd;
				SetFld('hCopNCd').AsFloat	:= 0;

				if giParamMode = 0 then		//教育
					SetFld('hEduType').AsInteger:= 0
				else						//研修
					SetFld('hEduType').AsInteger:= 1;

				if not Open then
					Abort;

				KyoMemData.Open;
				KyoMemData.DisableControls;
				KyoMemData.BeforePost:=nil;

				try
					KyoMemData.Close;
					KyoMemData.Open;

					while not Eof do
					begin
						KyoMemData.Append;
						inc(iNo);

					//名称コードを取得
						iNameCd := GetFld('KubunNo').AsInteger;

					//教育名称コード
						KyoMemData.FieldByName('JukouCode').Asinteger	:= iNameCd;

						fnMNExNameGet(iNameCd,sName,sBunya,sKubun);				//<2009-12-28>

					//教育名称
						KyoMemData.FieldByName('JukouName').AsString	:= sName;

					//分野
						KyoMemData.FieldByName('KyoBunya').AsString		:= sBunya;

					//教育区分コード
						KyoMemData.FieldByName('KyoKbnName').AsString	:= sKubun;

					//教育年月日（自）
						KyoMemData.FieldByName('KyoDateStart').AsString	:= GetFld('sDate').AsString;

					//教育年月日（至）
						if GetFld('EDate').AsDateTime > 0 then
							KyoMemData.FieldByName('KyoDateEnd').AsString := GetFld('EDate').AsString;

					//教育特記事項
						KyoMemData.FieldByName('Kyojikou').AsString := GetFld('EduRemarks').AsString;

					//登録Ｎｏ
						KyoMemData.FieldByName('EntNo').AsInteger := GetFld('EduNCode').AsInteger;

					//受講終了予定日<2011-05-23>
						if GetFld('EduExpDate').AsDateTime > 0 then
							KyoMemData.FieldByName('EduExpDate').AsDateTime	:= GetFld('EduExpDate').AsDateTime;

					//教育団体コード<2011-05-23>
						iNameCd	:= GetFld('EduOrg').AsInteger;
						KyoMemData.FieldByName('EduOrg').AsInteger		:= iNameCd;

					//教育団体名	<2011-05-23>
						sName	:= '';
						fnMNExNameGet(iNameCd,sName,sBunya,sKubun,DANTAI_CODE);
						KyoMemData.FieldByName('EduOrgName').AsString	:= sName;

					//受講金額		<2011-05-23>
						KyoMemData.FieldByName('EduFee').AsCurrency		:= GetFld('EduFee').AsCurrency;

						//<140415>↓
						KyoMemData.FieldByName('ExNum1').AsInteger := GetFld('ExNum1').AsInteger;
						KyoMemData.FieldByName('ExNum2').AsInteger := GetFld('ExNum2').AsInteger;
						KyoMemData.FieldByName('ExNum3').AsInteger := GetFld('ExNum3').AsInteger;
						KyoMemData.FieldByName('ExNum4').AsInteger := GetFld('ExNum4').AsInteger;
						KyoMemData.FieldByName('ExNum5').AsInteger := GetFld('ExNum5').AsInteger;

						KyoMemData.FieldByName('ExText1').AsString := GetFld('ExText1').AsString;
						KyoMemData.FieldByName('ExText2').AsString := GetFld('ExText2').AsString;
						KyoMemData.FieldByName('ExText3').AsString := GetFld('ExText3').AsString;
						KyoMemData.FieldByName('ExText4').AsString := GetFld('ExText4').AsString;
						KyoMemData.FieldByName('ExText5').AsString := GetFld('ExText5').AsString;

						if GetFld('ExDate1').AsDateTime > 0 then
							KyoMemData.FieldByName('ExDate1').AsDateTime := GetFld('ExDate1').AsDateTime;
						if GetFld('ExDate2').AsDateTime > 0 then
							KyoMemData.FieldByName('ExDate2').AsDateTime := GetFld('ExDate2').AsDateTime;
						if GetFld('ExDate3').AsDateTime > 0 then
							KyoMemData.FieldByName('ExDate3').AsDateTime := GetFld('ExDate3').AsDateTime;
						if GetFld('ExDate4').AsDateTime > 0 then
							KyoMemData.FieldByName('ExDate4').AsDateTime := GetFld('ExDate4').AsDateTime;
						if GetFld('ExDate5').AsDateTime > 0 then
							KyoMemData.FieldByName('ExDate5').AsDateTime := GetFld('ExDate5').AsDateTime;
						//<140415>↑

						Next;
					end;

					if iNo <> 0 then
						KyoMemData.First;

				//MemData-Grid間のLinkを有効化
				finally
					KyoMemData.BeforePost:=KyoMemDataBeforePost;
					KyoMemData.EnableControls;
					LKyoCnt.Caption:=Format('%4d',[KyoMemData.RecordCount]);
				end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				if giParamMode = 0 then sMode := '教育'
				else					sMode := '研修';

				MjsMessageBoxEx(Self, sMode+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
		BNotChangeCol1:=True;
		DxKyoGrid.FocusedColumn :=0;
	end;
end;

//**********************************************************************
//		Event		:fnDetailEnable
//		Proccess	:ﾌｫｰﾑ使用可/不可 切替
//		Parameter	:bEnable	:TRUE/FALSE
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.fnDetailEnable(bEnable:boolean);
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

	//<080215>
	{BInsert.Enabled:=bEnable;
	BDelete.Enabled:=bEnable;
	}
end;

//**********************************************************************
//		Event		:fnEditEnd
//		Proccess	:社員入力終了
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.fnEditEnd;
begin
	if not fnUpDate then					//更新処理
	begin
		HapSendToOwner(HAPAP_ACTID_EXIT_NG,pAppRec,pHapApParam);
		Exit;
	end;
	HapSendToOwner(HAPAP_ACTID_EXIT_OK,pAppRec,pHapApParam);
end;

//**********************************************************************
//		Event		:fnUpdate
//		Proccess	:教育研修更新
//		Parameter	:なし
//		Return		:TRUE	:更新成功
//					:FALSE	:失敗(値ﾁｪｯｸNG含む)
//		Hoistory	:
//					:
//**********************************************************************
function THAP000015CBaseF.fnUpdate:boolean;
begin
	if not fnDataCheck then
	begin
		result := FALSE;
		exit;
	end;

//教育履歴更新/研修履歴更新
	Result	:=	fnEDUUpdate;
end;

//**********************************************************************
//		Event		:fnEDUUpdate
//		Proccess	:HAPEDU更新
//		Parameter	:
//		Return		:True/False
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000015CBaseF.fnEDUUpdate:Boolean;
var
	i		: integer;
	bm		: TBookMark;
	rcMsg	: TMjsMsgRec;
	sSQL	: String;
begin
	Result:=False;

	//教育
	KyoMemData.DisableControls;
	try
		bm:=KyoMemData.GetBookMark;
		try
			with mqUpdate do
			begin
				sSQL := 'DELETE FROM HAPEDU'
				+#13#10+'WHERE EmpNCode=:hEmpNCd'
				+#13#10+'AND CorpNCode=:hCopNCd'
				+#13#10+'AND EduType=:hEduType';

				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				SetFld('hEmpNCd').AsFloat := pHapApParam^.GetEmpNCd;
				SetFld('hCopNCd').AsFloat := 0;

				if giParamMode = 0 then		//教育
					SetFld('hEduType').AsInteger:= 0
				else						//研修
					SetFld('hEduType').AsInteger:= 1;

				try
					ExecSQL(True);
				except
					GetMsg(rcMsg,1,6);

					with rcMsg do
					begin
						MjsMessageBoxEx(Self, gsParamMode+'履歴の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
					end;

					Exit;
				end;
			end;

			KyoMemData.First;

			i := 0;
			while not KyoMemData.Eof do
			begin
				Inc(i);

				with mqUpdate do
				begin
					sSQL := 'INSERT INTO HAPEDU ('
					+#13#10+	'EmpNCode,'
					+#13#10+	'CorpNCode,'
					+#13#10+	'EduType,'
					+#13#10+	'EduNCode,'
					+#13#10+	'SDate,'
					+#13#10+	'EDate,'
					+#13#10+	'SameDateOrder,'
					+#13#10+	'KubunNo,'
					+#13#10+	'EduRemarks,'
					+#13#10+	'EduExpDate,'	//<2011-05-23>
					+#13#10+	'EduOrg,'		//<2011-05-23>
					+#13#10+	'EduFee,'		//<2011-05-23>
					//<140415>↓
					+#13#10+	'ExNum1,'
					+#13#10+	'ExText1,'
					+#13#10+	'ExDate1,'
					+#13#10+	'ExNum2,'
					+#13#10+	'ExText2,'
					+#13#10+	'ExDate2,'
					+#13#10+	'ExNum3,'
					+#13#10+	'ExText3,'
					+#13#10+	'ExDate3,'
					+#13#10+	'ExNum4,'
					+#13#10+	'ExText4,'
					+#13#10+	'ExDate4,'
					+#13#10+	'ExNum5,'
					+#13#10+	'ExText5,'
					+#13#10+	'ExDate5,'
					//<140415>↑
//2005-08-18
					+#13#10+	'UpdTantoNCode'
					+#13#10+') VALUES('
					+#13#10+	':hEmpNCd,'
					+#13#10+	':hCopNCd,'
					+#13#10+	':hEduType,'
					+#13#10+	':hEduNCd,';

					if KyoMemData.FieldByName('KyoDateStart').AsString='' then
						sSQL := sSQL + 'NULL,'
					else
						sSQL := sSQL + fnDatetimetostr(KyoMemData.FieldByName('KyoDateStart'))+',';

					if KyoMemData.FieldByName('KyoDateEnd').AsString='' then
						sSQL := sSQL + 'NULL,'
					else
						sSQL := sSQL + fnDatetimetostr(KyoMemData.FieldByName('KyoDateEnd'))+',';

					sSQL := sSQL +	':hSameDTOrd,'
						+#13#10+	':hKubunNo,'
						+#13#10+	':hEduRemarks,'
						+#13#10+	':hEduExpDate,'	//<2011-05-23>
						+#13#10+	':hEduOrg,'		//<2011-05-23>
						+#13#10+	':hEduFee,'		//<2011-05-23>
						//<140415>↓
						+#13#10+	':hExNum1,'
						+#13#10+	':hExText1,'
						+#13#10+	':hExDate1,'
						+#13#10+	':hExNum2,'
						+#13#10+	':hExText2,'
						+#13#10+	':hExDate2,'
						+#13#10+	':hExNum3,'
						+#13#10+	':hExText3,'
						+#13#10+	':hExDate3,'
						+#13#10+	':hExNum4,'
						+#13#10+	':hExText4,'
						+#13#10+	':hExDate4,'
						+#13#10+	':hExNum5,'
						+#13#10+	':hExText5,'
						+#13#10+	':hExDate5,'
						//<140415>↑
						+#13#10+	':hTantoNCd'
						+#13#10+	')';

					Close;
					SQL.Clear;
					SQL.Add(sSQL);

					SetFld('hEmpNCd').AsFloat		:= pHapApParam^.GetEmpNCd;
					SetFld('hCopNCd').AsFloat		:= 0;

					if giParamMode = 0 then		//教育
						SetFld('hEduType').AsInteger:= 0
					else						//研修
						SetFld('hEduType').AsInteger:= 1;

					SetFld('hEduNCd').AsInteger		:= i;
					SetFld('hSameDTOrd').AsInteger	:= fnSDateCountGet(KyoMemData.FieldByName('KyoDateStart'));
					SetFld('hKubunNo').AsInteger	:= KyoMemData.FieldByName('JukouCode').AsInteger;
					SetFld('hEduRemarks').AsString	:= KyoMemData.FieldByName('Kyojikou').AsString;
					SetFld('hTantoNCd').AsFloat		:= rcCOMMONAREA(pAppRec^.m_pCommonArea^).TantoNCD;

					SetFld('hEduExpDate').AsDateTime	:= KyoMemData.FieldByName('EduExpDate').AsDateTime;	//<2011-05-23>
					if KyoMemData.FieldByName('EduExpDate').AsString = '' then
						SetFld('hEduExpDate').Clear;

					SetFld('hEduOrg').AsInteger		:= KyoMemData.FieldByName('EduOrg').AsInteger;			//<2011-05-23>
					SetFld('hEduFee').AsCurrency	:= KyoMemData.FieldByName('EduFee').AsCurrency;			//<2011-05-23>

					//<140415>↓
					SetFld('hExNum1').AsInteger		:= KyoMemData.FieldByName('ExNum1').AsInteger;
					SetFld('hExNum2').AsInteger		:= KyoMemData.FieldByName('ExNum2').AsInteger;
					SetFld('hExNum3').AsInteger		:= KyoMemData.FieldByName('ExNum3').AsInteger;
					SetFld('hExNum4').AsInteger		:= KyoMemData.FieldByName('ExNum4').AsInteger;
					SetFld('hExNum5').AsInteger		:= KyoMemData.FieldByName('ExNum5').AsInteger;

					SetFld('hExText1').AsString		:= KyoMemData.FieldByName('ExText1').AsString;
					SetFld('hExText2').AsString		:= KyoMemData.FieldByName('ExText2').AsString;
					SetFld('hExText3').AsString		:= KyoMemData.FieldByName('ExText3').AsString;
					SetFld('hExText4').AsString		:= KyoMemData.FieldByName('ExText4').AsString;
					SetFld('hExText5').AsString		:= KyoMemData.FieldByName('ExText5').AsString;

					SetFld('hExDate1').AsDateTime	:= KyoMemData.FieldByName('ExDate1').AsDateTime;
					if KyoMemData.FieldByName('ExDate1').AsString = '' then
						SetFld('hExDate1').Clear;

					SetFld('hExDate2').AsDateTime	:= KyoMemData.FieldByName('ExDate2').AsDateTime;
					if KyoMemData.FieldByName('ExDate2').AsString = '' then
						SetFld('hExDate2').Clear;

					SetFld('hExDate3').AsDateTime	:= KyoMemData.FieldByName('ExDate3').AsDateTime;
					if KyoMemData.FieldByName('ExDate3').AsString = '' then
						SetFld('hExDate3').Clear;

					SetFld('hExDate4').AsDateTime	:= KyoMemData.FieldByName('ExDate4').AsDateTime;
					if KyoMemData.FieldByName('ExDate4').AsString = '' then
						SetFld('hExDate4').Clear;

					SetFld('hExDate5').AsDateTime	:= KyoMemData.FieldByName('ExDate5').AsDateTime;
					if KyoMemData.FieldByName('ExDate5').AsString = '' then
						SetFld('hExDate5').Clear;
					//<140415>↑

					try
						ExecSQL(True);
					except
						GetMsg(rcMsg,1,4);

						with rcMsg do
						begin
							MjsMessageBoxEx(Self, gsParamMode+'履歴の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
						end;

						Exit;
					end;
				end;
				KyoMemData.Next;
			end;

			Result:=True;
		finally
			KyoMemData.GotoBookMark(bm);
		end;
	finally
		KyoMemData.EnableControls;
	end;
end;

//**********************************************************************
//		Event		:fnFBarClick
//		Proccess	:ファンクションクリック
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.fnFBarClick;
begin
	//<080215>
	case pHAPAPParam^.GetFuncNo of
		5:	// F5 一行挿入
		begin
			BInsertClick;
		end;

		6:	// F6 一行削除
		begin
			BDeleteClick;
		end;
	end;
end;

//**********************************************************************
//		Event		:CMChildKey
//		Proccess	:終端ｷｰ判定
//		Parameter	:
//		Return		:
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.CMChildKey(var Msg: TWMKey);
var
	sShift	: TShiftState;
	ACtl	: TWinControl;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;
                
//<130325>↓
	//sShift	:= KeyDataToShiftState(Msg.KeyData);
	sShift	:= MjsKeyDataToShiftState(Msg.KeyData);
//<130325>↑
	ACtl	:= Screen.ActiveControl;


//-----------------------------------
//	ｸﾞﾘｯﾄﾞ系無視
//-----------------------------------
	if ACtl is TDxDBGrid then
		Exit;	//->各GridのKeyDownｲﾍﾞﾝﾄで判定

	if ACtl is TListBox then
		Exit;

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
				Exit;

			VK_RETURN, VK_DOWN:
				if sShift = [] Then
				begin
					Msg.CharCode	:= VK_RETURN;
					MjsNextCtrl(Self);
					Abort;
				end;

			VK_UP:
		end;

		if ACtl is TCustomEdit then
		begin
			{NumEditはｷｬﾚｯﾄ位置判定不要}
			if(ACtl is TMDateEdit)or
			  (ACtl is TMNumEdit)then
			begin
				if(Msg.CharCode = VK_LEFT) and (sShift = []) then
				begin
					Msg.CharCode	:= 0;
					MjsPrevCtrl(Self);
					Abort;
				end;
				if(Msg.CharCode = VK_RIGHT) and (sShift = []) then
				begin
					Msg.CharCode	:= 0;
					MjsNextCtrl(Self);
					Exit;
				end;
			end;
			{NumEdit End}

			{以下ｷｬﾚｯﾄ位置判定}
			if MjsChkCurTop(ACtl) and (Msg.CharCode = VK_LEFT) and (sShift = []) then
			begin
				if ACtl <> DxKyoGrid then
					MjsPrevCtrl(Self);
				Msg.CharCode	:= 0;
				Exit;
			end;

			if MjsChkCurEnd(ACtl) and (Msg.CharCode = VK_RIGHT) and (sShift = []) then
			begin
				Msg.CharCode := 0;
				MjsNextCtrl(Self);
				Exit;
			end;

			Exit;				//入力途中は抜けない
		end;
	end;

	inherited;

end;

//----------------------------------------------------------------------
//	Detail
//----------------------------------------------------------------------
//***********************************************************************
//		Event		:fnFormIni
//		Process		:ﾌｫｰﾑ初期設定
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.fnFormIni;
var
	i:integer;
	p:^TTagInfo;
begin
	MjsCompoResize(PTool,0,pointer(pAppRec));

	//<080215>
	{MjsCompoResize(BInsert,0,pointer(pAppRec));
	MjsCompoResize(BDelete,0,pointer(pAppRec));

	BDelete.Left := BInsert.Left + BInsert.Width;
	}

	//所属No桁数
	HapChildFormPropertySet(	THAP000015CBaseF(Self),							//ﾌｫｰﾑ
								PTool,											//処理ﾎﾞﾀﾝ
								PMain,											//内容部
								pAppRec,										//親APから受け取ったMjsAppRecordﾎﾟｲﾝﾀ
								pHapApParam	);									//親APから受け取ったNspApParamﾎﾟｲﾝﾀ

	for i:=0 to ComponentCount-1 do
	begin
		//ｺﾝﾎﾟｰﾈﾝﾄ初期ｸﾘｱ
		if Components[i] is TMNumEdit then
			(Components[i] as TMNumEdit).Value:=0;
		if Components[i] is TMTxtEdit then
			(Components[i] as TMTxtEdit).Text:='';
		if Components[i] is TMDateEdit then
			(Components[i] as TMDateEdit).Value:=0;

		if (Components[i] is TMLabel)and
			(Copy((Components[i] as TMLabel).Name,1,1)='L') then
				(Components[i] as TMLabel).Caption:='';

		//ｲﾍﾞﾝﾄ割り付け
		if Components[i] is TMNumEdit then
		begin
			(Components[i] as TMNumEdit).OnEnter	:=fnWCTLEnter;
			(Components[i] as TMNumEdit).OnExit		:=fnWCTLExit;
		end;
		if Components[i] is TMTxtEdit then
		begin
			(Components[i] as TMTxtEdit).OnEnter	:=fnWCTLEnter;
			(Components[i] as TMTxtEdit).OnExit		:=fnWCTLExit;
		end;
		if Components[i] is TMDateEdit then
		begin
			(Components[i] as TMDateEdit).OnEnter	:=fnWCTLEnter;
			(Components[i] as TMDateEdit).OnExit	:=fnWCTLExit;
		end;
		if Components[i] is TMBitBtn then
		begin
			(Components[i] as TMBitBtn).OnEnter		:=fnWCTLEnter;
			(Components[i] as TMBitBtn).OnExit		:=fnWCTLExit;
		end;
		if Components[i] is TdxDBGrid then
		begin
			(Components[i] as TdxDBGrid).OnEnter	:=fnWCTLEnter;
			(Components[i] as TdxDBGrid).OnExit		:=fnWCTLExit;
		end;

		//日付
		//MemData
		if Components[i] is TDateTimeField then
			(Components[i] as TDateTimeField).DisplayFormat	:='g ee/mm/dd';		//和暦
		//DxGrid
		if Components[i] is TdxDBGridDateColumn then
			with Components[i] as TdxDBGridDateColumn do
			begin
				FormatOnEditing	:=True;
				Alignment		:=taRightJustify;
				EditAlignment	:=taRightJustify;
				DateEditFormat	:=dfEMD;
				DateOnError		:=deNull;
				imeMode			:=imDisable;
			end;
	end;

//	LKyoCnt.Color	:=	recSystem.SysColorB;
	lblKbn.Caption	:=	gsParamMode;

	with DxKyoGrid do
	begin
		if giParamMode = 0 then	//教育
		begin
			Bands[0].Caption := fnGetItemName(170701);
// <2006-07-14> ----- S
//			Bands[1].Caption := fnGetItemName(170601);
//			Bands[2].Caption := fnGetItemName(170700);
			Bands[1].Caption := fnGetItemName(170721);
			Bands[2].Caption := fnGetItemName(170731);
// <2006-07-14> ----- E
			Bands[3].Caption := fnGetItemName(170800);
			Bands[4].Caption := fnGetItemName(170901);	//<2011-05-23>
			Bands[5].Caption := fnGetItemName(170801);
			Bands[6].Caption := fnGetItemName(170911);	//<2011-05-23>
			Bands[7].Caption := fnGetItemName(170902);	//<2011-05-23>
			Bands[8].Caption := fnGetItemName(170900);
		end
		else					//研修
		begin
			Bands[0].Caption := fnGetItemName(171101);
// <2006-07-14> ----- S
//			Bands[1].Caption := fnGetItemName(171001);
//			Bands[2].Caption := fnGetItemName(171100);
			Bands[1].Caption := fnGetItemName(171121);
			Bands[2].Caption := fnGetItemName(171131);
// <2006-07-14> ----- E
			Bands[3].Caption := fnGetItemName(171200);
			Bands[4].Caption := fnGetItemName(171301);	//<2011-05-23>
			Bands[5].Caption := fnGetItemName(171201);
			Bands[6].Caption := fnGetItemName(171311);	//<2011-05-23>
			Bands[7].Caption := fnGetItemName(171302);	//<2011-05-23>
			Bands[8].Caption := fnGetItemName(171300);
		end;
	end;

	new(p);
	with p^ do
	begin
		LCnt	:=LKyoCnt;
		sName	:='教育';
		dxGrid	:=DxKyoGrid;
	end;

	if giParamMode = 0 then
		p^.sName	:='教育'
	else
		p^.sName	:='研修';

//<140415>↓
	fnGetFreeItem(giParamMode);
//<140415>↑

	DxKyoGrid.DataSource.DataSet.Tag:=LongInt(p);

	GridProc.SetProperty(DxKyoGrid);
end;

//**********************************************************************
//		Event		:fnWCTLEnter
//		Process		:ﾌｫｰｶｽ取得
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.fnWCTLEnter(Sender:TObject);
var
	sStr	: String;
	i		: Integer;
begin

	ACCtrl:=Sender as TWinControl;

	pHapApParam^.SetStatusText('');
	HapSendToOwner(HAPAP_ACTID_STATUSTEXT,pAppRec,pHapApParam);

	//<080215>
	pHapApParam^.SetFuncCaption(arrFuncClear);									// ﾌｧﾝｸｼｮﾝ消去
	HapSendToOwner(HAPAP_ACTID_FBARCAPTION,pAppRec,pHapApParam);

	sStr:=' ';
	if(Sender is TMnumEdit)then
	begin
		//ﾘｽﾄ0件も除く
		if ((Sender as TMNumEdit).SelectItems.Count>0) then
		begin
			for i:=1 to (Sender as TMNumEdit).SelectItems.Count do
			begin
				sStr:=sStr+(Sender as TMNumEdit).SelectItems[i-1];
				sStr:=sStr+' ';													//途中,最後もSP
			end;
			pHapApParam^.SetStatusText(sStr);
			HapSendToOwner(HAPAP_ACTID_STATUSTEXTEX,pAppRec,pHapApParam);
		end;
	end;

	//ｸﾞﾘｯﾄﾞ空の初回のみ編集自動ON
	//必須!!(入力開始の1文字目が入らないので)
	if(Sender is TDxDBGrid)and
	  ((Sender as TdxDBGrid).DataSource.DataSet.IsEmpty)then
		(Sender as TdxDBGrid).DataSource.DataSet.Edit;

	with DxKyoGrid.Datasource,DxKyoGrid.Datasource.DataSet do
	begin
		//教育Grid?
		if Sender=DxKyoGrid then
		begin
			LKyoCnt.Caption	:=Trim(Format('%4d',[RecordCount]));

			//<080215> DataSetナンバーの格納先変更
			{BInsert.Tag	:=LongInt(DataSet);
			BDelete.Tag	:=LongInt(DataSet);
			}
			m_Tag		:= LongInt(DataSet);
		end
		else
			LKyoCnt.Caption:=Trim(Format('%4d',[RecordCount]));
	end;

	//<080215>
	//挿入/削除ﾎﾞﾀﾝの使用可/不可切替
	{BInsert.Enabled:= (ACCtrl=DxKyoGrid);
	BDelete.Enabled:= (ACCtrl=DxKyoGrid);
	}
	if ACCtrl = DxKyoGrid then
	begin
		pHapApParam^.SetFuncCaption(arrFunc56);									// F5 F6
		HapSendToOwner(HAPAP_ACTID_FBARCAPTION,pAppRec,pHapApParam);
	end;
end;

//**********************************************************************
//		Event		:fnWCTLExit
//		Process		:ﾌｫｰｶｽ消失
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.fnWCTLExit(Sender:TObject);
begin
//
end;

//**********************************************************************
//		Event		:fnDateFormatSet
//		Process		:日付西暦和暦設定
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000015CBaseF.fnDateFormatSet;
var
	DMQuery		: TMQuery;
	iErrorFlag	: Integer;
	rcMsg		: TMjsMsgRec;
begin
	DMQuery := TMQuery.Create(self);											// MQueryの構築
	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;
	iErrorFlag:=0;

	MDBModule.SetDBInfoToQuery(ddCopDB, DMQuery);								// DBとの接続
	try
		try
			with DMQuery do
			begin
				Close;
				SQL.Clear;
				SQL.Add('SELECT YearKbn FROM DTMAIN');

				if not Open then
					Abort;

				if Eof then
					Abort;

				if FieldByName('YearKbn').AsInteger=0 then						//和暦
				begin
					DxKyoGridColumn3.DateEditFormat		:= dfEMD;
					DxKyoGridColumn4.DateEditFormat		:= dfEMD;
					DxKyoGridColumn9.DateEditFormat		:= dfEMD;			//<110523>
					KyoMemDataKyoDateStart.DisplayFormat:= 'g eee/mm/dd';
					KyoMemDataKyoDateEnd.DisplayFormat	:= 'g eee/mm/dd';
					KyoMemDataEduExpDate.DisplayFormat	:= 'g eee/mm/dd';	//<110523>

					//<140415>↓
					DxKyoGridColumn15.DateEditFormat	:= dfEMD;
					DxKyoGridColumn18.DateEditFormat	:= dfEMD;
					DxKyoGridColumn21.DateEditFormat	:= dfEMD;
					DxKyoGridColumn24.DateEditFormat	:= dfEMD;
					DxKyoGridColumn27.DateEditFormat	:= dfEMD;
					KyoMemDataExDate1.DisplayFormat		:= 'g eee/mm/dd';
					KyoMemDataExDate2.DisplayFormat		:= 'g eee/mm/dd';
					KyoMemDataExDate3.DisplayFormat		:= 'g eee/mm/dd';
					KyoMemDataExDate4.DisplayFormat		:= 'g eee/mm/dd';
					KyoMemDataExDate5.DisplayFormat		:= 'g eee/mm/dd';
					//<140415>↑
				end
				else
				begin
					DxKyoGridColumn3.DateEditFormat		:= dfYMD;
					DxKyoGridColumn4.DateEditFormat		:= dfYMD;
					DxKyoGridColumn9.DateEditFormat		:= dfYMD;			//<110523>
					KyoMemDataKyoDateStart.DisplayFormat:= 'yyyy/mm/dd';
					KyoMemDataKyoDateEnd.DisplayFormat	:= 'yyyy/mm/dd';
					KyoMemDataEduExpDate.DisplayFormat	:= 'yyyy/mm/dd';	//<110523>

					//<140415>↓                                         
					DxKyoGridColumn15.DateEditFormat	:= dfYMD;
					DxKyoGridColumn18.DateEditFormat	:= dfYMD;
					DxKyoGridColumn21.DateEditFormat	:= dfYMD;
					DxKyoGridColumn24.DateEditFormat	:= dfYMD;
					DxKyoGridColumn27.DateEditFormat	:= dfYMD;
					KyoMemDataExDate1.DisplayFormat		:= 'yyyy/mm/dd';
					KyoMemDataExDate2.DisplayFormat		:= 'yyyy/mm/dd';
					KyoMemDataExDate3.DisplayFormat		:= 'yyyy/mm/dd';
					KyoMemDataExDate4.DisplayFormat		:= 'yyyy/mm/dd';
					KyoMemDataExDate5.DisplayFormat		:= 'yyyy/mm/dd';
					//<140415>↑
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
//		Event		:fnDMemKyoNameSet
//		Process		:教育名称設定
//		Parameter	:
//		Return		:
//		History		:<2009-12-28>変更
//					:<2011-05-23>引数 iExItem 追加
//**********************************************************************
function THAP000015CBaseF.fnMNExNameGet(CODE:Integer;
							var MNNAME :String;var BUNYA :String;var KUBUN:String;
							iExItem:Integer):Boolean;
var
	DMQuery	: TMQuery;
	rcMsg	: TMjsMsgRec;
begin
	Result := FALSE;

	DMQuery := TMQuery.Create(self);											// MQueryの構築

	if Assigned(DMQuery) <> True then
	begin
		Exit;
	end;

	MDBModule.SetDBInfoToQuery(ddCopDB, DMQuery);								// DBとの接続
	try
		try
			with DMQuery do
			begin
				Close();
				SQL.Clear();
				SQL.Add('SELECT'
							+' Ex.KubunName EXNAME'
							+',Eb.FieldName EBNAME'
							+',Ex.DtKubun1');
				SQL.Add( ' FROM'
							+' HAPMNEx Ex'
						+' INNER JOIN HAPMNEb Eb'
							+ ' ON EX.ItemNo=Eb.ItemNo'
							+' AND EX.FieldCode=Eb.FieldCode');
				SQL.Add(' WHERE'
							+' Ex.ItemNo=:EXITEM'
						+ ' AND'
							+' Ex.KubunNo=:KUBUNNO');

				if iExItem > 0 then		//<2011-05-23>
					SetFld('EXITEM').AsInteger := iExItem
				else

				if giParamMode = 0 then
					SetFld('EXITEM').AsInteger := KYOUIKU_CODE
				else
					SetFld('EXITEM').AsInteger := KENSYU_CODE;


				SetFld('KUBUNNO').AsInteger := CODE;

				Open(true);

				if Eof then														//該当ﾃﾞｰﾀ0件
				begin
					Exit;
				end;

				MNNAME	:=FieldByName('EXNAME').Asstring;
				BUNYA	:=FieldByName('EBNAME').Asstring;

				if iExItem = DANTAI_CODE then		//<2011-05-23>
					KUBUN := ''
				else

				if giParamMode = 0 then
					KUBUN := KyoName[GetFld('DtKubun1').AsInteger]
				else
					KUBUN := KenName[GetFld('DtKubun1').AsInteger];

			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'区分名称情報の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;

			Exit;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
	Result	:= TRUE;
end;

//**********************************************************************
//		Event		:fnDataCheck
//		Process		:データをチェック
//		Parameter	:
//		Return		:
//		History		:2010/01/19(Y.Kondo)
//					:編集中レコードの判定追加
//**********************************************************************
function THAP000015CBaseF.fnDataCheck() : boolean;
var
	iTemp	: Integer;
	rcMsg	: TMjsMsgRec;
	sName	: String;
begin
	Result:=True;

//<2010-01-19> S
	if (KyoMemData.State in [dsInsert,dsEdit]) and
		(not ((DxKyoGrid.EditingText ='') and
		(KyoMemData.FieldByName('JukouCode').AsInteger =0))) then
	begin
	// BeforePostのabort判定を追記しないと、不正データも通ってしまう
		try
			KyoMemData.Post;
		except
			Result := FALSE;
			Exit;
		end;
	end;
//<2010-01-19> E

	KyoMemData.first;
	try
	begin
		for iTemp:= 1 to KyoMemData.RecordCount do
		begin
		//教育種別未入力
			if KyoMemData.FieldByName('JukouCode').AsInteger=0 then
			begin
				if giParamMode = 0 then
					sName := fnGetItemName(170701)
				else
					sName := fnGetItemName(171101);

				GetMsg(rcMsg,100,3);

				with rcMsg do
					MjsMessageBoxEx(	Self,
										sName + sMsg,
										sTitle,
										IconType,
										BtnType,
										BtnDef,
										LogType	);
				Result:=False;
				MjsSetFocus(Self, 'DxKyoGrid');
				DxKyoGrid.FocusedColumn :=0;
// <2006-03-29_2> ----- S
//				abort;
				exit;
// <2006-03-29_2> ----- E
			end;

			if KyoMemData.FieldByName('KyoDateStart').AsString = '' then
			begin
				if giParamMode = 0 then
					sName := fnGetItemName(170800)
				else
					sName := fnGetItemName(171200);

				GetMsg(rcMsg,100,3);

				with rcMsg do
					MjsMessageBoxEx(Self, sName+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);

				Result:=False;
				MjsSetFocus(Self, 'DxKyoGrid');
				DxKyoGrid.FocusedColumn :=4;
// <2006-03-29_2> ----- S
//				abort;
				exit;
// <2006-03-29_2> ----- E
			end;

			if	(KyoMemData.FieldByName('KyoDateEnd').AsString <> '') and
				(KyoMemData.FieldByName('KyoDateStart').AsDateTime > KyoMemData.FieldByName('KyoDateEnd').AsDateTime) then
			begin
				if giParamMode = 0 then
					sName := fnGetItemName(170801)
				else
					sName := fnGetItemName(171201);

				GetMsg(rcMsg,100,3);
				with rcMsg do
				begin
					MjsMessageBoxEx(Self, sName+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
					Result:=False;
					MjsSetFocus(Self, 'DxKyoGrid');
					DxKyoGrid.FocusedColumn :=5;
// <2006-03-29_2> ----- S
//					Abort;
					exit;
// <2006-03-29_2> ----- E
				end;
			end;

			//団体コード <2011-05-23>
			if (KyoMemData.FieldByName('EduOrg').AsInteger<>0) and
			   (KyoMemData.FieldByName('EduOrgName').AsString='') then
			begin
				sName := fnGetItemName(170911);
				GetMsg(rcMsg,100,3);

				with rcMsg do
					MjsMessageBoxEx(	Self,
										sName + sMsg,
										sTitle,
										IconType,
										BtnType,
										BtnDef,
										LogType	);
				Result:=False;
				MjsSetFocus(Self, 'DxKyoGrid');
				DxKyoGrid.FocusedColumn :=7;
				exit;
			end;

			KyoMemData.Next;
		end;
	end;
	finally
		//
	end;
end;


//**********************************************************************
//		Event		:fnRowIsEmpty
//		Process		:行が空か判定
//		Parameter	:gr:対象となるｸﾞﾘｯﾄﾞ
//		Return		:True	:空(数値0文字列'')
//					:False	:入力あり
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000015CBaseF.fnRowIsEmpty(gr:TDxDBGrid):boolean;
var
	i	: integer;
	ds	: TDataSet;
begin
	Result:=False;

	//ﾃﾞｰﾀｾｯﾄ取り出し
	ds:=gr.DataSource.Dataset;

	with gr,ds do
	begin
		for i:=0 to gr.ColumnCount-1 do
		begin
			//ReadOnlyのﾌｨｰﾙﾄﾞは無視

			//数値
			if(FieldByName(Columns[i].FieldName) is TIntegerField)and
			  (not(FieldByName(Columns[i].FieldName) as TIntegerField).ReadOnly)then
			begin
				if(FieldByName(Columns[i].FieldName).AsInteger<>0)then
					Exit;
			end;

			//金額
			if(FieldByName(Columns[i].FieldName) is TCurrencyField)and
			  (not(FieldByName(Columns[i].FieldName) as TCurrencyField).ReadOnly)then
			begin
				if(FieldByName(Columns[i].FieldName).AsCurrency<>0)then
					Exit;
			end;

			//文字
			if(FieldByName(Columns[i].FieldName) is TStringField)and
			  (not(FieldByName(Columns[i].FieldName) as TStringField).ReadOnly)then
			begin
				if(FieldByName(Columns[i].FieldName).AsString<>'')then
					Exit;
			end;

			//日付
			if(FieldByName(Columns[i].FieldName) is TDateTimeField)and
			  (not(FieldByName(Columns[i].FieldName) as TDateTimeField).ReadOnly)then
			begin
				if(FieldByName(Columns[i].FieldName).AsDateTime<>0)then
					Exit;
			end;
		end;
	end;
	Result:=True;
end;

//**********************************************************************
//		Event		:fnGetItemName
//		Process		:項目名取得
//		Parameter	:gr:対象となるｸﾞﾘｯﾄﾞ
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000015CBaseF.fnGetItemName(ItemNo:integer):string;
var
	sSQL	: string;
	rcMsg	: TMjsMsgRec;
begin
	result:='';
	sSQL:='';
	sSQL:='SELECT ItemName FROM HAPKM WHERE ItemNo='+IntToStr(ItemNo);
	with mqKM do
	begin
		Close;
		SQL.Clear;
		SQL.Add(sSQL);
		try
			Open(True);
			if IsEmpty then
				Abort;
			Result:=GetFld('ItemName').AsString;
		except
			GetMsg(rcMsg,1,5);

			with rcMsg do
			begin
				MjsMessageBoxEx(Self, '項目名の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
		end;
	end;
end;

//**********************************************************************
//		Event		:fnDateTimeToStr
//		Process		:日付文字型変換
//		Parameter	:日付ﾌｨｰﾙﾄﾞ(MemData)
//		Return		:'''yyyy/mm/dd'''	(内容あり-引用符付き)
//					:'Null'				(内容なし-引用符なし)
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000015CBaseF.fnDateTimeToStr(AField:TField):string;
begin

	Result:='NULL';
	if TDateTimeField(AField).IsNull then
		Exit;

//	FormatSettings.ShortDateFormat:='yyyy/mm/dd';	//<D10-E014> DEL
	//内容ありなら引用符囲みを返す
	Result:=AnsiQuotedStr(DatetimeToStr(TDateTimeField(AField).AsDatetime),'''');
end;


//**********************************************************************
//		Event		:fnSDateCountGet
//		Process		:同一日の数を取得
//		Parameter	:gr:対象となるｸﾞﾘｯﾄﾞ
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000015CBaseF.fnSDateCountGet(FDate : TField):Integer;
var
	sSQL	: string;
	rcMsg	: TMjsMsgRec;
begin
	sSQL :=	'SELECT Count(EduNCode) COUNT FROM HAPEDU'
	+#13#10+'WHERE EmpNCode=:hEmpNCd'
	+#13#10+'AND CorpNCode=:hCopNcd'
	+#13#10+'AND EduType=:hEduType'
	+#13#10+'AND sDate=' + fnDatetimeToStr(FDate);

	with mqKM do
	begin
		Close;
		SQL.Clear;
		SQL.Add(sSQL);

		SetFld('hEmpNCd').AsFloat		:= pHapApParam^.GetEmpNCd;
		SetFld('hCopNcd').AsFloat		:= 0;

		if giParamMode = 0 then		//教育
			SetFld('hEduType').AsInteger:= 0
		else						//研修
			SetFld('hEduType').AsInteger:= 1;

		try
			Open(True);
			Result:=GetFld('COUNT').AsInteger;
		except
			GetMsg(rcMsg,1,5);

			with rcMsg do
			begin
				MjsMessageBoxEx(Self, '区分の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			Result:=0;
			Abort;
		end;
	end;
end;

//**********************************************************************
//		Event		:DxKyoGridColumn7
//		Process		:ButtonClick
//		Parameter	:
//		Return		:
//		History		:2009/12/28(Y.Kondo)
//					:<2009-12-28>
//**********************************************************************
procedure THAP000015CBaseF.DxKyoGridColumn7EditButtonClick(
  Sender: TObject);
var
	ExpParam: THapMNExExpParam;
	ExpIF	: THapMNExExpIF;
begin
	ExpParam:= THapMNExExpParam.CreateParam;
	ExpIF	:= THapMNExExpIF.Create;

	try
		if ExpIF.Init(Self,pAppRec)=-1 then
			Abort;

		if giParamMode = 0 then
			ExpParam.SetKMCode(KYOUIKU_CODE)
		else
			ExpParam.SetKMCode(KENSYU_CODE);

		try
			try
				ExpIF.DoDlg(ExpParam);

				if ExpParam.ExpResult<>mrOK then	//ｷｬﾝｾﾙ押下
					Exit;

				KyoMemData.Edit;
				KyoMemDataJukouCode.AsInteger	:= ExpParam.ExpRetCode;			//区分No
				KyoMemDataJukouName.AsString	:= ExpParam.ExpRetText;			//区分名称
				KyoMemDataKyoBunya.AsString		:= ExpParam.ExpRetEBText;
				KyoMemDataKyoKbnName.AsString	:= ExpParam.ExpRetDtText;
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
//		Event		:KyoMemDataJukouCode
//		Process		:Change
//		Parameter	:
//		Return		:
//		History		:2009/12/28(Y.Kondo)
//					:<2009-12-28>
//**********************************************************************
procedure THAP000015CBaseF.KyoMemDataJukouCodeChange(Sender: TField);
var
	sName,
	sKubun,
	sBunya	: String;
begin
	if Sender.Value > 0 then
	begin
		fnMNExNameGet(Trunc(Sender.Value),sName,sBunya,sKubun);

		KyoMemDataJukouName.AsString	:= sName;
		KyoMemDataKyoKbnName.AsString	:= sKubun;
		KyoMemDataKyoBunya.AsString		:= sBunya;
	end
	else
	begin
		KyoMemDataJukouName.AsString	:= '';
		KyoMemDataKyoKbnName.AsString	:= '';
		KyoMemDataKyoBunya.AsString		:= '';
	end;
end;

//<2011-05-23>
//**********************************************************************
//		Event		:DxKyoGridColumn10
//		Process		:ButtonClick
//		Parameter	:
//		Return		:
//		History		:
//					:
//**********************************************************************
procedure THAP000015CBaseF.DxKyoGridColumn10EditButtonClick(
  Sender: TObject);
var
	ExpParam: THapMNExExpParam;
	ExpIF	: THapMNExExpIF;
begin
	ExpParam:= THapMNExExpParam.CreateParam;
	ExpIF	:= THapMNExExpIF.Create;

	try
		if ExpIF.Init(Self,pAppRec)=-1 then
			Abort;

		ExpParam.SetKMCode(DANTAI_CODE);
		try
			try
				ExpIF.DoDlg(ExpParam);

				if ExpParam.ExpResult<>mrOK then	//ｷｬﾝｾﾙ押下
					Exit;

				KyoMemData.Edit;
				KyoMemDataEduOrg.AsInteger		:= ExpParam.ExpRetCode;			//団体No
				KyoMemDataEduOrgName.AsString	:= ExpParam.ExpRetText;			//団体名称
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


//<2011-05-23>
//**********************************************************************
//		Event		:KyoMemDataEduOrgChange
//		Process		:Change
//		Parameter	:
//		Return		:
//		History		:
//					:
//**********************************************************************
procedure THAP000015CBaseF.KyoMemDataEduOrgChange(Sender: TField);
var
	sName,
	sKubun,
	sBunya	: String;
begin
	if Sender.Value > 0 then
	begin
		fnMNExNameGet(Trunc(Sender.Value),sName,sBunya,sKubun,DANTAI_CODE);
		KyoMemDataEduOrgName.AsString	:= sName;
	end
	else
		KyoMemDataEduOrgName.AsString	:= '';
end;

//<140415>↓
//**********************************************************************
//		Event		:fnGetFreeItem
//		Process		:フリー項目の取得及び、グリッドへの表示
//		Parameter	:giParamMode : 0 = 教育		1 = 研修
//**********************************************************************
procedure THAP000015CBaseF.fnGetFreeItem(giParamMode : Integer);
var
	qry			: TMQuery;
	rcMsg		: TMjsMsgRec;
	sWhere		: String;
	i, j, k		: Integer;
const
	ItemList : Array [0..2,0..14] Of Integer =
			(
				//教育
				 (170811, 170812, 170813
				, 170821, 170822, 170823
				, 170831, 170832, 170833
				, 170841, 170842, 170843
				, 170851, 170852, 170853)

				//研修
				,(171211, 171212, 171213
				, 171221, 171222, 171223
				, 171231, 171232, 171233
				, 171241, 171242, 171243
				, 171251, 171252, 171253)

				//Grid.BandIndex
				,(9,10,11,12,13,14,15,16,17,18,19,20,21,22,23)
			);
begin
	//初期状態として非表示にする
	for i := 0 to Length(ItemList[0]) - 1 do
	begin
		DxKyoGrid.Bands[ItemList[2][i]].Visible := False;
	end;

	sWhere := '';
	//in句生成
	for j := 0 to Length(ItemList[0]) - 1 do
	begin
		if sWhere <> '' then
		begin
			sWhere := sWhere + ', ';
		end;

		sWhere := sWhere + IntToStr(ItemList[giParamMode][j]);
	end;

	qry := TMQuery.Create(self);
	MDBModule.SetDBInfoToQuery(ddCopDB, qry);

	try
		try
			with qry do
			begin
				Close;
				SQL.Clear;
				SQL.Add(
						'SELECT'
						+ '	ItemNo,'
						+ ' ItemName '
						+ 'FROM'
						+ '	HAPKM '
						+ 'WHERE'
						+ '	ItemUse = 1 AND '
						+ '	ItemNo IN (' + sWhere + ') '
						+ 'ORDER BY'
						+ '	ItemNo'
						);

				Open(True);

				//全て未使用の場合処理を抜ける
				if Eof then
				begin
					Exit;
				end;

				//グリッドのヘッダー文字列取得及び、表示切替
				while not eof do
				begin
					for k := 0 to Length(ItemList[0]) - 1 do
					begin
						if ItemList[giParamMode][k] = GetFld('ItemNo').AsInteger then
						begin
							DxKyoGrid.Bands[ItemList[2][k]].Caption := GetFld('ItemName').AsString;
							DxKyoGrid.Bands[ItemList[2][k]].Visible := True;
							Inc(m_VisibleColumnCount);
							Break;
						end;
					end;
					Next;
				end;
				//最終カラム位置判定用 10 : デフォルト表示カラム数
				m_VisibleColumnCount := m_VisibleColumnCount + 10;
			end;
		except
			GetMsg(rcMsg, 1, 5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,
					'項目の' + sMsg, sTitle, IconType, BtnType, BtnDef, LogType);
			end;
		end;
	finally
		qry.Close;
		qry.Free;
	end;
end;  
//<140415>↑


end.
