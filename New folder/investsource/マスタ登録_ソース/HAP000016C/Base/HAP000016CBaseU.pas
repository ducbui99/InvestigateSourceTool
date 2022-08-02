//******************************************************************************
//		System			:MJSFX
//		Program			:人事情報登録(褒賞・懲罰)
//		ProgramID		:HAP000016CBase
//		Name			:H.Itahana(Buntechno)
//		Create			:05/06/20
//		Comment			:
//		History			:2006/07/14 H.Takaishi(Buntechno)
//						:・項目見出しの統一対応							<2006-07-14>
//						:2008/02/15	T.ABE (TALUMI)		<080215>
//						:・一行削除／挿入をF5,F6へ変更
//						:2009/12/28 Y.Kondo (TakumiCo.)		<2009-12-28>
//						:・名称の選択を検索Expに変更
//						:2010/01/19(Y.Kondo)
//						:・編集中レコードの判定追加			<2010-01-19>    
//						:2013/03/25 E.Inukai
//						:エンターキー対応					<130325>
//						:2019/03/19(K.Takahashi(CyberCom))
//						:・新元号対応(Gengou)
//						:2020/01/29	H.Onozuka(NTC)
//						:・Delphi10-コンパイル対応	<D10-C>
//						:2020/04/23	Y.Iwakawa
//						:・基準日対応						<RefDay>
//						:2020/04/23	R.Masuno(CyberCom)
//						:・Delphi10移行 共通案件別対応E014	<D10-E014>
//******************************************************************************
//		注意:	全ｺﾝﾎﾟｰﾈﾝﾄのEnter/ExitｲﾍﾞﾝﾄはfnWCtlEnter/fnWCtlExitに動的に
//			:	割り当てている(その中でｺﾝﾎﾟｰﾈﾝﾄ別に分岐)
//			:	ｵﾌﾞｼﾞｪｸﾄｲﾝｽﾍﾟｸﾀ上でｲﾍﾞﾝﾄを自動生成してもそのままだと
//			:	実行時に呼び出されません!!
//******************************************************************************
unit HAP000016CBaseU;

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
	pdxGrid	:	TdxDBGrid;
  end;

  THAP000016CBaseF = class(TForm)
	PMain: TMPanel;
	lblKbn: TMLabel;
	MPanel2: TMPanel;
	PTool: TMPanel;
	DxGrid: TdxDBGrid;
	DxGridColumn1: TdxDBGridColumn;
	DxGridColumn6: TdxDBGridLookupColumn;
	DxGridColumn5: TdxDBGridColumn;
	DxGridColumn4: TdxDBGridDateColumn;
	MemData: TdxMemData;
	DataSource: TDataSource;
	MemDataShoBatsuKbn: TStringField;
	MemDataShoBatsu: TStringField;
	MemDataShoBatsuRemarks: TStringField;
	MemDataShoBatsuDate: TDateTimeField;
	MemDataShoBatsuCode: TIntegerField;
	MemDataEntNo: TIntegerField;
	LSyoCnt: TMLabel;
	MLabel3: TMLabel;
	LKyoWarning: TMLabel;
	MLabel4: TMLabel;
	MLabel5: TMLabel;
	DxGridColumn7: TdxDBGridPickColumn;
	MemDataShoBatsuBunya: TStringField;
	DxGridColumn9: TdxDBGridButtonColumn;

	procedure FormCreate(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
	procedure DxGridBeforeChangeColumn(Sender: TObject;
	  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
	  NewColumn: Integer; var CanChange: Boolean);
	procedure DxGridKeyPress(Sender: TObject; var Key: Char);
	procedure DxGridColumn4DateValidateInput(Sender: TObject;
	  const AText: String; var ADate: TDateTime; var AMessage: String;
	  var AError: Boolean);
	procedure DxGridColumnCloseUp(Sender: TObject; var Value: Variant;
	  var Accept: Boolean);
	procedure DxGridKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);

	procedure MemDataBeforePost(DataSet: TDataSet);
	procedure MemDataBeforeInsert(DataSet: TDataSet);
	procedure MemDataAfterScroll(DataSet: TDataSet);
	procedure MemDataAfterInsert(DataSet: TDataSet);
	procedure MemDataAfterDelete(DataSet: TDataSet);
	procedure MemDataAfterPost(DataSet: TDataSet);
	procedure DxGridColumn9EditButtonClick(Sender: TObject);
	procedure MemDataShoBatsuCodeChange(Sender: TField);

  private
	{ Private 宣言 }
	pAppRec		: ^TMjsAppRecord;

	pHapApParam	: ^THapApParam;													//給与親子間ﾊﾟﾗﾒｰﾀ

	MDBModule	: TMDataModuleF;

	ACCtrl		: TWinControl;
	recSystem	: rcSYSTEMAREA;													// システム・メモリ 構造体
	ddCopDB		: TFDConnection;
	BNotChangeCol	: Boolean;

	GridProc	: THapGridProc;

	mqCopKBN	: TMQuery;

	giParamMode	: Integer;														//パラメータ 1:褒賞 2:懲罰
	gsParamMode	: String;														//パラメータ '褒賞','懲罰'

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
				var MNName:String;var Bunya:String;var Kubun:String):Boolean;	//<2009-12-28>リストｾｯﾄから一括取得に変更
	function	fnDateCheck : Boolean;
	Function	fnKMNameGet(SCode : String) : String;
	function	fnSDateCountGet(FDate : TField):Integer;
	function	fnDateTimeToStr(AField:TField):string;
	function	fnRowIsEmpty(gr:TDxDBGrid):boolean;

	//<080215>
	procedure BInsertClick;
	procedure BDeleteClick;
  public
	{ Public 宣言 }
  protected
	procedure CMChildKey(var Msg: TWMKey);message CM_ChildKey;
end;

function AppEntry(pPar:pointer):integer;
exports
  AppEntry;

//var
//  HAP000016CBaseF: THAP000016CBaseF;

implementation
uses
	MjsDispCtrl,MjsCommonU,HAPLibU,MjsDateCtrl,HAPMsgU,dxExEdtr;

Const
	_MAX_=9999;

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

	SyoName	:	Array[1..2] of String = ('社内褒賞','社外褒賞');
	TyoName	:	Array[1..2] of String = ('社内懲罰','社外懲罰');

	SYOU_CODE	=	171500;
	BATSU_CODE	=	171900;

{$R *.DFM}
// <NewEraName-P1> ADD Start
{$I HAPEraNameCtrl_B.inc}
// <NewEraName-P1> ADD End

//**********************************************************************
//		Proccess	:BPL外部関数
//		Parameter	:
//		Return		:
//		History		:
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function AppEntry(pPar:pointer):integer;
var
	pForm		: ^THAP000016CBaseF;
	pRec		: ^TMjsAppRecord;
	pActionParam: ^THapApParam;
	iAction		: integer;
begin
	Result		:= ACTID_RET_NG;
	pRec		:= Pointer( TAppParam( pPar^ ).pRecord );						//TMjsAppRecord 構造体 pointer 取得
	pActionParam:= Pointer( TAppParam( pPar^ ).pActionParam );					//送受信ﾊﾟﾗﾒｰﾀ
	iAction		:= TAppParam( pPar^ ).iAction;									//Action ID 取得

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
				pForm^ := THAP000016CBaseF.CreateForm( pRec,pActionParam );
//2005-10-31
				pRec^.m_pChildForm := pForm;

				if iAction = ACTID_FORMCREATESHOWSTART then
				begin
					pForm^.Show;
					THAP000016CBaseF(pForm^).PTool.Show;							//処理ﾎﾞﾀﾝ[可視]
					{処理ﾎﾞﾀﾝは親AP側をParentにしているので子APﾌｫｰﾑの表示/非表示が反映されない}
				end;
			except
				Dispose( pForm );
				pRec^.m_pChildForm := nil;
				Exit;
			end;
		end;

		ACTID_FORMCLOSESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			pForm^.Close;
			pForm^.Free;
			Dispose( pForm );
			pRec^.m_pChildForm := nil;
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
			THAP000016CBaseF(pForm^).PTool.Show;									//処理ﾎﾞﾀﾝ[可視]
			{処理ﾎﾞﾀﾝは親AP側をParentにしているので子APﾌｫｰﾑの表示/非表示が反映されない}
		end;

		ACTID_HIDESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );

			if pForm^.Parent <> nil then
			begin
				pForm^.Hide;
				THAP000016CBaseF(pForm^).PTool.Hide;								//処理ﾎﾞﾀﾝ[不可視]
				{処理ﾎﾞﾀﾝは親AP側をParentにしているので子APﾌｫｰﾑの表示/非表示が反映されない}
			end;
		end;

//--------------------------
//	給与拡張Action	ST
//---------------------------
		HAPAP_ACTID_SHOWDATA:													//社員内容表示
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000016CBaseF(pForm^).fnDetailSet;
		end;

		HAPAP_ACTID_ENABLE:														//内容部[使用可]
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000016CBaseF(pForm^).fnDetailEnable(True);
		end;

		HAPAP_ACTID_DISABLE:													//内容部[使用不可]
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000016CBaseF(pForm^).fnDetailEnable(False);
		end;

		{ﾌｫｰｶｽ復帰-処理選択ｺﾝﾎﾞ切替}
		HAPAP_ACTID_SETFOCUS:
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			with THAP000016CBaseF(pForm^) do
			begin
				if ACCtrl.Enabled then
				begin
					MjsSetFocus(THAP000016CBaseF(pForm^),ACCtrl.Name);
					HapSendToOwner(HAPAP_ACTID_ENTER_OK,pRec,pActionParam);
				end;
			end;
		end;

		HAPAP_ACTID_SETFOCUS_FIRST,												//ﾌｫｰｶｽ先頭
		HAPAP_ACTID_SETFOCUS_LAST:												//ﾌｫｰｶｽ最終
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			with THAP000016CBaseF(pForm^) do
			begin
				if iAction=HAPAP_ACTID_SETFOCUS_FIRST then						//先頭
				begin
					ACCtrl:=DxGrid;
					MjsSetFocus(THAP000016CBaseF(pForm^),ACCtrl.Name);
				end;
				if iAction=HAPAP_ACTID_SETFOCUS_LAST then						//最終
				begin
					ACCtrl:=DxGrid;
					MjsSetFocus(THAP000016CBaseF(pForm^),ACCtrl.Name);
				end;
			end;
			HapSendToOwner(HAPAP_ACTID_ENTER_OK,pRec,pActionParam);
																				//ﾌｫｰｶｽ取得可能を通知
		end;

		HAPAP_ACTID_EXIT:														//終了通知
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000016CBaseF(pForm^).fnEditEnd;
		end;

		HAPAP_ACTID_FBARCLICK:													//ﾌｧﾝｸｼｮﾝﾊﾞｰｸﾘｯｸ
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			{ﾌｧﾝｸｼｮﾝNoの取り出しと現在ｺﾝﾎﾟｰﾈﾝﾄにより判定を行う}
			THAP000016CBaseF(pForm^).fnFBarClick;
		end;

//--------------------------
//	給与拡張Action	ED
//---------------------------
	end;

	Result:=ACTID_RET_OK;
end;

//**********************************************************************
//		Event		:Constructor
//		Proccess	:資格免許Form作成
//		Parameter	:pRec	:MjsAppRecord
//		Return		:なし
//		History		:2019/03/19(K.Takahashi(CyberCom))
//					:新元号対応(Gengou)
//**********************************************************************
constructor THAP000016CBaseF.CreateForm(pRec,pActionParam:pointer);
var
	PCallForm	: ^TControl;													//2005-10-31
begin
	pAppRec		:= pRec;
	pHapApParam	:= pActionParam;

	PCallForm	:= TMjsAppRecord(pAppRec^).m_pOwnerForm;						//2005-10-31

	MDBModule	:= TMDataModuleF(pAppRec^.m_pDBModule^);
	ddCopDB		:= pHapApParam^.GetCopDB;
	GridProc	:= THapGridProc.CreateObj(pAppRec);

	recSystem	:= rcSYSTEMAREA(pAppRec^.m_pSystemArea^);

	giParamMode := pHapApParam^.GetPara;										//切替用パラメータ取得

	if giParamMode = 0 then
		gsParamMode := '褒賞'
	else
		gsParamMode := '懲罰';

	mqCopKBN	:= TMQuery.Create(self);

	if Assigned(mqCopKBN) <> True then
		Abort;

	MDBModule.SetDBInfoTOQuery(ddCopDB,mqCopKBN);								//DBとの接続

//2005-10-31
//	inherited Create(Application);
	inherited Create(PCallForm^);
// <NewEraName-P1> ADD Start

	DxGridColumn4.Gengou := GetEraName(Now(), emAlpha)[1];
// <NewEraName-P1> ADD End
end;

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Proccess	:資格免許ﾌｫｰﾑ 作成
//		Parameter	:
//		Return		:
//		History		:
//**********************************************************************
procedure THAP000016CBaseF.FormCreate(Sender: TObject);
begin
	fnFormIni;																	//画面項目初期化

	MjsFontResize(THAP000016CBaseF (Self),pointer(pAppRec));

	MJSCommonU.MJSColorChange (THAP000016CBaseF (Self),
								recSystem.SysColorB,
								recSystem.SysColorD,
								recSystem.SysBaseColorB,
								recSystem.SysBaseColorD,
								rcCOMMONAREA(pAppRec^.m_pCommonArea^).SysFocusColor);

	ACCtrl:=DxGrid;
end;

//**********************************************************************
//		Event		:Destroy
//		Proccess	:フォーム破棄
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.FormDestroy(Sender: TObject);
begin
	GridProc.Free;

	//Taｇに格納したﾒﾓﾘ解放
	with DxGrid.DataSource.DataSet do
		if Tag<>0 then
			dispose(pointer(Tag));

	mqCopKBN.Close;
	mqCopKBN.Free;
end;

//**********************************************************************
//		Event		:fnDetailSet
//		Proccess	:社員内容表示
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.fnDetailSet;
var
	iNo		: integer;
	DMQuery : TMQuery;
	rcMsg	: TMjsMsgRec;
	sSQL	: String;
	iNameCd	: Integer;
	sName,
	sBunya,
	sKubun	: String;

const
	DEF_DATE = '1890/12/30';
begin
	BNotChangeCol:=False;

	LSyoCnt.Caption:=Format('%4d',[0]);

	fnDateFormatSet;															//西暦和暦切替え設定

	MemData.Close;
	MemData.Open;
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
				{ 賞罰項目 ----------------------------}
//<RefDay> ↓
				//基準日設定時
				if pHapApParam.GetRefType = 1 then
                begin
					sSQL :=	'SELECT'
					+#13#10+ 'KubunNo,'
					+#13#10+ 'OrderDate,'
					+#13#10+ 'RwdRemarks,'
					+#13#10+ 'RwdNCode'
					+#13#10+'FROM MP_HAP_HAPRWD_STD('
					+''''+FormatDateTime('yyyy-mm-dd', pHapApParam.GetRefDate)+''''+')'
					+#13#10+'WHERE EmpNCode=:hEmpNCD'
					+#13#10+ 'AND CorpNCode=:hCopNCD'
					+#13#10+ 'AND RwdKbn=:hRwdKbn'
					+#13#10+'ORDER BY OrderDate DESC,'
					+#13#10+ 'SameDateOrder,RwdNCode DESC';
                end
//<RefDay> ↑
    			else
				begin
					sSQL :=	'SELECT'
					+#13#10+ 'KubunNo,'
					+#13#10+ 'OrderDate,'
					+#13#10+ 'RwdRemarks,'
					+#13#10+ 'RwdNCode'
					+#13#10+'FROM HAPRWD'
					+#13#10+'WHERE EmpNCode=:hEmpNCD'
					+#13#10+ 'AND CorpNCode=:hCopNCD'
					+#13#10+ 'AND RwdKbn=:hRwdKbn'
					+#13#10+'ORDER BY OrderDate DESC,'
					+#13#10+ 'SameDateOrder,RwdNCode DESC';
                end;

				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				SetFld('hEmpNCD').AsFloat	:=	pHapApParam^.GetEmpNCd;
				SetFld('hCopNCD').AsFloat	:=	0;

				if giParamMode = 0 then	//褒賞
					SetFld('hRwdKbn').AsInteger	:=	0
				else					//懲罰
					SetFld('hRwdKbn').AsInteger	:=	1;

				if not Open then
					Abort;

				MemData.DisableControls;										//MemData-Grid間のLinkを無効化
				try
					while not Eof do
					begin
						MemData.Append;
						inc(iNo);

						//名称コードを取得
						iNameCd := GetFld('KubunNo').AsInteger;

						//賞罰コード
						MemData.FieldByName('ShoBatsuCode').AsInteger	:= iNameCd;

						fnMNExNameGet(iNameCd,sName,sBunya,sKubun);				//<2009-12-28>

						//賞罰名称
						MemData.FieldByName('ShoBatsu').AsString		:= sName;

						//分野
						MemData.FieldByName('ShoBatsuBunya').AsString	:= sBunya;

						//賞罰区分コード
						MemData.FieldByName('ShoBatsuKbn').AsString		:= sKubun;

						//賞罰年月日
						if GetFld('OrderDate').AsDateTime > 0 then
							MemData.FieldByName('ShoBatsuDate').AsDateTime	:= GetFld('OrderDate').AsDateTime;

						//賞罰理由
						MemData.FieldByName('ShoBatsuRemarks').AsString	:= GetFld('RwdRemarks').AsString;

						//登録Ｎｏ
						MemData.FieldByName('EntNo').AsInteger	:= GetFld('RwdNCode').AsInteger;

						MemData.Post;
						Next;
					end;

					if iNo <> 0 then
					begin
						MemData.First;
					end;
				finally
					MemData.EnableControls;										//MemData-Grid間のLinkを有効化
				end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'賞罰'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
		BNotChangeCol:=True;
		DxGrid.FocusedColumn :=0;
		LSyoCnt.Caption:=Format('%4d',[MemData.RecordCount]);
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
procedure THAP000016CBaseF.fnDetailEnable(bEnable:boolean);
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

end;

//**********************************************************************
//		Event		:fnEditEnd
//		Proccess	:社員入力終了
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.fnEditEnd;
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
//		Proccess	:更新処理実行
//		Parameter	:なし
//		Return		:TRUE	:更新成功
//					:FALSE	:失敗(値ﾁｪｯｸNG含む)
//		Hoistory	:2010/01/19 Y.Kondo
//					:BeforePostの判定を修正
//**********************************************************************
function THAP000016CBaseF.fnUpdate:boolean;
var
	rcMsg		: TMjsMsgRec;
	DMQuery		: TMQuery;
	iErrorFlag	: Integer;
	i			: Integer;
	sSQL		: String;
const
	cDateFormat	= 'yyyy/mm/dd';
begin
	Result := False;

	iErrorFlag:=0;

	if (MemData.State in [dsInsert,dsEdit]) and
	   (not (
		(DxGrid.EditingText ='') and					//<2010-01-19>
		(MemData.FieldByName('ShoBatsuCode').AsInteger =0) and
		(MemData.FieldByName('ShoBatsuKbn').AsString ='') and
		(MemData.FieldByName('ShoBatsuRemarks').AsString ='') and
		(MemData.FieldByName('ShoBatsuDate').AsString ='') ))then
	begin
	//<2010-01-19> BeforePostのabort判定を追記しないと、不正データも通ってしまう
		try
			MemData.Post
		except
			Exit;
		end
	end
	else if
	   (MemData.RecordCount <= 0) and
	   ((MemData.FieldByName('ShoBatsuCode').AsInteger =0) and
	   (MemData.FieldByName('ShoBatsuKbn').AsString ='') and
	   (MemData.FieldByName('ShoBatsuRemarks').AsString ='') and
	   (MemData.FieldByName('ShoBatsuDate').AsString ='') )then
	begin
		if MemData.State in[dsEdit,dsInsert] then
			MemData.Cancel;

		DMQuery := TMQuery.Create(self);										// MQueryの構築
		if Assigned(DMQuery) <> True then
		begin
			Exit;
		end;

		try
			MDBModule.SetDBInfoToQuery(ddCopDB, DMQuery);						// DBとの接続

			try
				with DMQuery do
				begin
					sSQL :=	'DELETE FROM HAPRWD WHERE EmpNCode=:hEmpNCD'
					+#13#10+'AND CorpNCode=:hCopNCD AND RwdKbn=:hRwdKbn';

					Close;
					SQL.Clear;
					SQL.Add(sSQL);

					SetFld('hEmpNCD').AsFloat	:=	pHapApParam^.GetEmpNCd;
					SetFld('hCopNCD').AsFloat	:=	0;

					if giParamMode = 0 then		//褒賞
						SetFld('hRwdKbn').AsInteger	:= 0
					else						//懲罰
						SetFld('hRwdKbn').AsInteger	:= 1;

					if not ExecSQL then
						Abort;
				end;
			except
				if iErrorFlag=-1 then exit;
				GetMsg(rcMsg,20,4);
				with rcMsg do
				begin
					MjsMessageBoxEx(Self,'賞罰テーブル'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
				end;
				Exit;
			end;
		finally
			DMQuery.Close;
			DMQuery.Free;
		end;
		result := TRUE;
		exit;
	end;

	if fnDateCheck = False then Exit;

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
				sSQL :=	'DELETE FROM HAPRWD WHERE EmpNCode=:hEmpNCD'
				+#13#10+'AND CorpNCode=:hCopNCD AND RwdKbn=:hRwdKbn';

				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				SetFld('hEmpNCD').AsFloat	:=	pHapApParam^.GetEmpNCd;
				SetFld('hCopNCD').AsFloat	:=	0;

				if giParamMode = 0 then		//褒賞
					SetFld('hRwdKbn').AsInteger	:= 0
				else						//懲罰
					SetFld('hRwdKbn').AsInteger	:= 1;

				if not ExecSQL then
					Abort;

				i := 0;

				MemData.First;
				while not MemData.Eof do
				begin
					Inc(i);

					sSQL :=	'INSERT INTO HAPRWD ('
					+#13#10+	'EmpNCode,'
					+#13#10+	'CorpNCode,'
					+#13#10+	'RwdKbn,'
					+#13#10+	'RwdNCode,'
					+#13#10+	'SameDateOrder,'
					+#13#10+	'KubunNo,'
					+#13#10+	'RwdRemarks,'
					+#13#10+	'UpdTantoNCode,'

					+#13#10+	'OrderDate'
					+#13#10+') VALUES ('
					+#13#10+	':hEmpNCd,'
					+#13#10+	':hCopNCd,'
					+#13#10+	':hRwdKbn,'
					+#13#10+	':hRwdNCd,'
					+#13#10+	':hSameDTOrder,'
					+#13#10+	':hKubunNo,'
					+#13#10+	':hRwdRemarks,'
					+#13#10+	':hTantoNCd,';

					if MemData.FieldByName('ShoBatsuDate').AsString = '' then
						sSQL := sSQL + 'NULL )'
					else
						sSQL := sSQL + fnDatetimetostr(MemData.FieldByName('ShoBatsuDate'))+')';

					Close;
					SQL.Clear;
					SQL.Add(sSQL);

					ParamByName('hEmpNCd').AsFloat			:= pHapApParam^.GetEmpNCd;
					ParamByName('hCopNCd').AsFloat			:= 0;

					if giParamMode = 0 then		//褒賞
						ParamByName('hRwdKbn').AsFloat	:= 0
					else						//懲罰
						ParamByName('hRwdKbn').AsFloat	:= 1;

					ParamByName('hRwdNCd').AsInteger		:= i;
					ParamByName('hSameDTOrder').AsInteger	:= fnSDateCountGet(MemData.FieldByName('ShoBatsuDate'));
					ParamByName('hKubunNo').AsInteger		:= MemData.FieldByName('ShoBatsuCode').AsInteger;
					ParamByName('hRwdRemarks').AsString		:= MemData.FieldByName('ShoBatsuRemarks').AsString;

					ParamByName('hTantoNCd').AsFloat		:= rcCOMMONAREA(pAppRec^.m_pCommonArea^).TantoNCD;

					if not ExecSQL then
						Abort;

					MemData.Next;
				end;
			end;
		except
			if iErrorFlag=-1 then exit;

			GetMsg(rcMsg,20,4);

			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'賞罰テーブル'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			Exit;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
	Result := True;

end;

//**********************************************************************
//		Event		:fnFBarClick
//		Proccess	:ファンクションクリック
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.fnFBarClick;
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
procedure THAP000016CBaseF.CMChildKey(var Msg: TWMKey);
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

	//賞罰グリッド
	if  (ACtl=DxGrid) then
	begin
		Exit;
	end;

//-----------------------------------
//	ｸﾞﾘｯﾄﾞ系無視
//-----------------------------------
	if ACtl is TDxDBGrid then
		Exit;

	if not(ACtl is TCustomEdit) then											//文字入力除く
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
				if ACtl <> DxGrid then
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

			Exit;																//入力途中は抜けない
		end;
	end;

	inherited;

end;

//----------------------------------------------------------------------
//	Detail
//----------------------------------------------------------------------
//***********************************************************************
//		Event		:fnFormIni
//		Proccess	:ﾌｫｰﾑ初期設定
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.fnFormIni;
var
	i	: integer;
	p	: ^TTagInfo;
begin
	MjsCompoResize(PTool,0,pointer(pAppRec));

	//<080215>
	{MjsCompoResize(BInsert,0,pointer(pAppRec));
	MjsCompoResize(BSpDelete,0,pointer(pAppRec));

	BSpDelete.Left	:= BInsert.Left + BInsert.Width;
	}

	HapChildFormPropertySet(	THAP000016CBaseF(Self),							//ﾌｫｰﾑ
								PTool,											//処理ﾎﾞﾀﾝ
								PMain,											//内容部
								pAppRec,										//親APから受け取ったMjsAppRecordﾎﾟｲﾝﾀ
								pHapApParam	);									//親APから受け取ったHapApParamﾎﾟｲﾝﾀ

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
		if Components[i] is TdxDBGrid then
		begin
			(Components[i] as TdxDBGrid).OnEnter:=fnWCTLEnter;
			(Components[i] as TdxDBGrid).OnExit	:=fnWCTLExit;
		end;
	end;

	// 区分名称の読み込み
	with DxGrid do
	begin
		if giParamMode = 0 then	//褒賞
		begin
			Bands[0].Caption := fnKMNameGet('171501');
// <2006-07-14> ----- S
//			Bands[1].Caption := fnKMNameGet('171401');
//			Bands[2].Caption := fnKMNameGet('171500');
			Bands[1].Caption := fnKMNameGet('171521');
			Bands[2].Caption := fnKMNameGet('171531');
// <2006-07-14> ----- E
			Bands[3].Caption := fnKMNameGet('171600');
			Bands[4].Caption := fnKMNameGet('171700');
		end
		else					//懲罰
		begin
			Bands[0].Caption := fnKMNameGet('171901');
// <2006-07-14> ----- S
//			Bands[1].Caption := fnKMNameGet('171801');
//			Bands[2].Caption := fnKMNameGet('171900');
			Bands[1].Caption := fnKMNameGet('171921');
			Bands[2].Caption := fnKMNameGet('171931');
// <2006-07-14> ----- E
			Bands[3].Caption := fnKMNameGet('172000');
			Bands[4].Caption := fnKMNameGet('172100');
		end;
	end;

	lblKbn.Caption	:=	gsParamMode;

	new(p);
	with p^ do
	begin
		LCnt	:=LSyoCnt;
		if giParamMode = 0 then	//褒賞
		begin
			sName	:='褒賞';
		end
		else
		begin
			sName	:='懲罰';
		end;
//		sName	:='賞罰';
		dxGrid	:=DxGrid;
	end;
	DxGrid.DataSource.DataSet.Tag:=LongInt(p);
	GridProc.SetProperty(DxGrid);
end;

//**********************************************************************
//		Event		:fnWCTLEnte
//		Proccess	:ﾌｫｰｶｽ取得
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.fnWCTLEnter(Sender:TObject);
var
	sStr	: String;
	i		: Integer;
begin

	ACCtrl:=Sender as TWinControl;

	//<080215>
	{if (ACCtrl=DxGrid)  then
	begin
		BSpDelete.Enabled :=True;
		BInsert.Enabled :=True;
	end;
	}

	if (ACCtrl=DxGrid)  then
	begin
		BNotChangeCol := False;
		MemData.Edit;
		BNotChangeCol := True;
	end;

	pHapApParam^.SetFuncCaption(arrFuncClear);		//ﾌｧﾝｸｼｮﾝ消去
	HapSendToOwner(HAPAP_ACTID_FBARCAPTION,pAppRec,pHapApParam);

	pHapApParam^.SetStatusText('');
	HapSendToOwner(HAPAP_ACTID_STATUSTEXT,pAppRec,pHapApParam);

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
	//グリッド制御
	if (ACCtrl=DxGrid)  then
	begin
		BNotChangeCol := False;
		BNotChangeCol := True;

		//<080215>
		pHapApParam^.SetFuncCaption(arrFunc56);									// F5 F6
		HapSendToOwner(HAPAP_ACTID_FBARCAPTION,pAppRec,pHapApParam);
	end;

	with DxGrid.Datasource,DxGrid.Datasource.DataSet do
	begin
		//教育Grid?
		if Sender=DxGrid then
			LSyoCnt.Caption	:=Trim(Format('%4d',[RecordCount]))
		else
			LSyoCnt.Caption:=Trim(Format('%4d',[RecordCount]));
	end;

end;

//**********************************************************************
//		Event		:fnWCTLExit
//		Proccess	:ﾌｫｰｶｽ消失
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.fnWCTLExit(Sender:TObject);
begin
	//<080215>
	{BSpDelete.Enabled	:=FALSE;
	BInsert.Enabled		:=FALSE;
	}
end;

//**********************************************************************
//		Event		:fnDateFormatSet
//		Proccess	:日付西暦和暦設定
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.fnDateFormatSet;
var
	iErrorFlag	: Integer;
	rcMsg		: TMjsMsgRec;
begin
	iErrorFlag:=0;

	try
		with mqCopKBN do
		begin
			Close;
			SQL.Clear;
			SQL.Add('SELECT YearKbn From DTMAIN');

			if not Open then
				Abort;

			if Eof then															//該当ﾃﾞｰﾀ0件
			begin
				iErrorFlag:=-1;
				Abort;
			end;

			if FieldByName('YearKbn').AsInteger=0 then							//和暦
			begin
				DxGridColumn4.DateEditFormat  := dfEMD;
				MemDataShoBatsuDate.DisplayFormat:='g eee/mm/dd';
			end
			else
			begin
				DxGridColumn4.DateEditFormat  := dfYMD;
				MemDataShoBatsuDate.DisplayFormat:='yyyy/mm/dd';
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
			//
		end;

		Exit;
	end;
end;

//**********************************************************************
//		Event		:fnDMemNameSet
//		Proccess	:褒賞・懲罰 名称設定
//		Parameter	:
//		Return		:
//		History		:<2009-12-28>変更
//**********************************************************************
function THAP000016CBaseF.fnMNExNameGet(CODE:Integer;
							var MNNAME :String;var BUNYA :String;var KUBUN:String):Boolean;
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

				if giParamMode = 0 then
					SetFld('EXITEM').AsInteger := SYOU_CODE
				else
					SetFld('EXITEM').AsInteger := BATSU_CODE;

				SetFld('KUBUNNO').AsInteger := CODE;

				Open(true);

				if Eof then														//該当ﾃﾞｰﾀ0件
				begin
					Exit;
				end;

				MNNAME	:=FieldByName('EXNAME').Asstring;
				BUNYA	:=FieldByName('EBNAME').Asstring;

				if giParamMode = 0 then
					KUBUN := SyoName[GetFld('DtKubun1').AsInteger]
				else
					KUBUN := TyoName[GetFld('DtKubun1').AsInteger];

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
//		Event		:BeforeChangeColumn
//		Proccess	:カラムチェンジ前イベント
//**********************************************************************
procedure THAP000016CBaseF.DxGridBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
begin
	if BNotChangeCol=false then
		exit;

	//入力不可項目はフォーカス色はそのまま
	CanChange := DxGrid.Columns[NewColumn].TabStop;

	if NewColumn = Column then
		exit;

//<2009-12-28> S
	if (Column = 0) and (MemDataShoBatsu.AsString = '') then
		CanChange := False;
//<2009-12-28> E
end;

//**********************************************************************
//		Event		:KeyPress
//		Proccess	:カラムキーイベント
//**********************************************************************
procedure THAP000016CBaseF.DxGridKeyPress(Sender: TObject; var Key: Char);
begin
	//[e]が入力できてしまうため追加
	if DxGrid.FocusedColumn = 5 then exit;
//<D10-C>  if not (Key in ['0'..'9'] or (Key = Chr(VK_BACK)) or (Key = '-')) then
	if not (CharInSet(Key , ['0'..'9']) or (Key = Chr(VK_BACK)) or (Key = '-')) then	//<D10-C>
		Key := #0;

end;

//**********************************************************************
//		Event		:BSpDeleteClick
//		Proccess	:一行削除ボタンクリック
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
//<080215> イベントから関数へ変更
//procedure THAP000016CBaseF.BSpDeleteClick(Sender: TObject);
procedure THAP000016CBaseF.BDeleteClick;
var
	rcMsg	: TMjsMsgRec;
	Ret		: Word;
begin
	if (Screen.ActiveControl.Name<>'DxGrid') then
		exit;

	if Screen.ActiveControl.Name='DxGrid' then
	begin
		if( MemData.RecordCount=0 ) and (not(MemData.State in [dsEdit,dsInsert])) then exit;

		GetMsg(rcMsg,110,8);
		with rcMsg do
		begin
			Ret:=MjsMessageBoxEx(Self,'現在行' + sMsg + #13#10 + 'よろしいですか？', sTitle,IconType,BtnType,BtnDef,LogType);
		end;
		if Ret=mrNo then
			Exit;

		if Ret=mrOk then
		begin
			MemData.Delete ;
		end;
	end;

end;

//**********************************************************************
//		Event		:DateValidateInput
//		Proccess	:日付不正処理
//**********************************************************************
procedure THAP000016CBaseF.DxGridColumn4DateValidateInput(Sender: TObject;
  const AText: String; var ADate: TDateTime; var AMessage: String;
  var AError: Boolean);
var
	rcMsg	:TMjsMsgRec;
begin
	if Screen.ActiveControl.Name  = 'BCancel' then
		AError:=False
	else
	begin
		GetMsg(rcMsg,100,3);
		AMessage := DxGrid.Bands[3].Caption+rcMsg.sMsg;
	end;
end;

//**********************************************************************
//		Event		:fnDateCheck
//		Proccess	:入力データチェック
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000016CBaseF.fnDateCheck() : boolean;
var
	iTemp	: Integer;
	rcMsg	: TMjsMsgRec;
	sWk		: String;
begin

	MemData.first;

	try
		for iTemp:= 1 to MemData.RecordCount  do
		begin
			if MemData.FieldByName('ShoBatsuCode').AsInteger =0 then
			begin
				GetMsg(rcMsg,100,1);
				sWk := DxGrid.Bands[0].Caption;
				with rcMsg do
				begin
					MjsMessageBoxEx(Self,sWk+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
					Result:=False;
					MjsSetFocus(Self, 'DxGrid');
					DxGrid.FocusedColumn :=0;
					exit;
				end;
			end;
			if MemData.FieldByName('ShoBatsuDate').AsString = '' then
			begin
				sWk := DxGrid.Bands[3].Caption;
				GetMsg(rcMsg,100,3);
				with rcMsg do
					MjsMessageBoxEx(Self,sWk+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
				Result:=False;
				MjsSetFocus(Self, 'DxGrid');
				DxGrid.FocusedColumn :=4;
				exit;
			end;
			MemData.Next;
		end;
	finally
		//
	end;
	Result:=TRUE;
end;

procedure THAP000016CBaseF.DxGridColumnCloseUp(Sender: TObject;
  var Value: Variant; var Accept: Boolean);
begin
end;

//**********************************************************************
//		Event		:DxGridKeyDown
//		Proccess	:グリッドKeyDown
//		Parameter	:TRUE : あり
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.DxGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	ds:TDataSet;
	gr:TDxDBGrid;
Const
	COL_F = 0;
	COL_E = 5;
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
				if(gr.FocusedColumn<COL_E)or
				  (Shift=[ssCtrl])then
					Exit;

				ds.Cancel;
			end;

			//親へ[下部ﾎﾞﾀﾝへ移動]を送信
			HapSendToOwner(	HAPAP_ACTID_SETFOCUS_BTN,
							pAppRec,
							pHapApParam	);

			if(Key=VK_END)then
				Key:=0;
		end;

		VK_TAB:
		begin
			//[Shift]+[Tab]
			if(Shift=[ssShift])then
			begin
				//先頭行/先頭ｶﾗﾑ
				if(gr.FocusedColumn=COL_F)and
				  ((ds.IsEmpty)or(ds.RecNo=1))then
				begin
					//親へ[ﾀﾌﾞへ移動]を送信
					HapSendToOwner(	HAPAP_ACTID_SETFOCUS_TAB,
									pAppRec,
									pHapApParam	);

				end;
			end
			else
			begin
				case(gr.FocusedColumn)of
					COL_F:	//先頭ｶﾗﾑ
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

						with gr.DataSource.DataSet do
						begin
							if not IsEmpty then
								First;
						end;
						gr.FocusedColumn:=COL_F;

						HapSendToOwner(	HAPAP_ACTID_SETFOCUS_BTN,
							pAppRec,
							pHapApParam	);
					end;
					COL_E:	//最終ｶﾗﾑ
					begin
						//最終以外
						with ds do
						begin
							if not((RecordCount=_MAX_)and
								   (RecordCount=RecNo))then
								Exit;
						end;

						//研修履歴を先頭にする
						with gr.DataSource.DataSet do
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
						gr.FocusedColumn:=COL_F;
						HapSendToOwner(	HAPAP_ACTID_SETFOCUS_BTN,
							pAppRec,
							pHapApParam	);
					end;
				end;
			end;
		end;

		VK_RIGHT:
		begin
			//編集中/右端以外
			if(ds.State in[dsEdit])or
			  (gr.FocusedColumn<COL_E)then
				Exit;

			//最終以外
			with ds do
			begin
				if not((RecordCount=_MAX_)and
					   (RecNo=RecordCount))then
					Exit;
			end;

			HapSendToOwner(	HAPAP_ACTID_SETFOCUS_BTN,
							pAppRec,
							pHapApParam	);
		end;

		VK_RETURN:
		begin
			case gr.FocusedColumn of
				//教育種類
				COL_F:
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
				COL_E:
				begin
					//最終以外
					if not(ds.RecNo>=_MAX_)then
						Exit;
				end;
				//他ｶﾗﾑ
				else
					Exit;
			end;

			HapSendToOwner(	HAPAP_ACTID_SETFOCUS_BTN,
							pAppRec,
							pHapApParam	);

			//挿入ｷｬﾝｾﾙで次ｺﾝﾎﾟｰﾈﾝﾄへ抜けるため必要
			Key:=0;
			Abort;
		end;

		VK_DOWN:
		begin
			case (gr.FocusedColumn)of
				COL_F:
				begin
					begin
						//最終以外
						with ds do
						begin
							if not((RecordCount=_MAX_)and
								   (RecordCount=RecNo))then
								Exit;
						end;
					end;

					HapSendToOwner(	HAPAP_ACTID_SETFOCUS_BTN,
							pAppRec,
							pHapApParam	);

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

//**************************************************************************
//		Event		:fnKMNameGet
//		Proccess	:カラムヘッダー 項目名取得
//		Parameter	:SCode	: String 項目コード
//		Retrun		:String : 項目名
//		History	　	:
//**************************************************************************
function THAP000016CBaseF.fnKMNameGet(SCode : String) : String;
begin
	result := '';

	try
		with mqCopKBN do
		begin
			Close;
			SQL.Clear;
			SQL.Add('SELECT ItemName From HAPKM'	);
			SQL.Add('Where ItemNo = '''+SCode+''''	);

			if not Open then
				Abort;

			if not Eof then
				Result := GetFld('ItemName').AsString;
		end;
	except
		//
	end;
end;

procedure THAP000016CBaseF.MemDataBeforePost(DataSet: TDataSet);
begin
//<2009-12-28> S
	if (MemDataShoBatsu.AsString = '') then
	begin
		DxGrid.SetFocus;
		abort;
	end;
//<2009-12-28> E
end;

//**********************************************************************
//		Event		:fnSDateCountGet
//		Process		:同一日の数を取得
//		Parameter	:gr:対象となるｸﾞﾘｯﾄﾞ
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000016CBaseF.fnSDateCountGet(FDate : TField):Integer;
var
	sSQL	: string;
	rcMsg	: TMjsMsgRec;
begin
	Result := 0;

	sSQL :=	'SELECT Count(RwdNCode) COUNT FROM HAPRWD'
	+#13#10+'WHERE EmpNCode=:hEmpNCd'
	+#13#10+'AND CorpNCode=:hCopNCd'
	+#13#10+'AND RwdKbn=:hRwdKbn'
	+#13#10+'And OrderDate ='+fnDatetimeToStr(FDate);

	try
		with mqCopKBN do
		begin
			Close;
			SQL.Clear;
			SQL.Add(sSQL);

			SetFld('hEmpNCd').AsFloat	:=	pHapApParam^.GetEmpNCd;
			SetFld('hCopNCd').AsFloat	:=	0;

			if giParamMode = 0 then
				SetFld('hRwdKbn').AsInteger := 0
			else
				SetFld('hRwdKbn').AsInteger := 1;

			if not Open then
				Abort;

			Result := GetFld('COUNT').AsInteger;
		end;
	except
		GetMsg(rcMsg,1,5);
		with rcMsg do
		begin
			MjsMessageBoxEx(Self,'区分の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
		end;

		Abort;
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
function THAP000016CBaseF.fnDateTimeToStr(AField:TField):string;
begin

	Result:='NULL';
	if TDateTimeField(AField).IsNull then
		Exit;

//	FormatSettings.ShortDateFormat:='yyyy/mm/dd';	//<D10-E014> DEL
	//内容ありなら引用符囲みを返す
	Result:=AnsiQuotedStr(DatetimeToStr(TDateTimeField(AField).AsDatetime),'''');
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
function THAP000016CBaseF.fnRowIsEmpty(gr:TDxDBGrid):boolean;
var
	i:integer;
	ds:TDataSet;
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
//		Event		:MemDataBeforeInsert
//		Process		:MemData行挿入前イベント
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.MemDataBeforeInsert(DataSet: TDataSet);
begin
//登録件数MAX?
	with Dataset,TTagInfo(pointer(Dataset.Tag)^) do
		if RecordCount>=_MAX_ then
			Abort;		//挿入のｶﾞｰﾄﾞ
end;

//**********************************************************************
//		Event		:MemDataAfterScroll
//		Process		:MemDataスクロール後イベント
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.MemDataAfterScroll(DataSet: TDataSet);
begin
	//件数表示
	with Dataset,TTagInfo(pointer(Dataset.Tag)^) do
	begin
		LCnt.Caption:=Trim(Format('%4d',[RecordCount]));
	end;
end;

//**********************************************************************
//		Event		:MemDataAfterInsert
//		Process		:MemData行挿入後イベント
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.MemDataAfterInsert(DataSet: TDataSet);
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
//		Event		:MemDataAfterDelete
//		Process		:MemData行削除後イベント
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.MemDataAfterDelete(DataSet: TDataSet);
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
//		Event		:BInsertClick
//		Process		:一行挿入ボタンクリック
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
//<080215> イベントから関数へ変更
//procedure THAP000016CBaseF.BInsertClick(Sender: TObject);
procedure THAP000016CBaseF.BInsertClick;
begin
	MemData.Insert;
end;

//**********************************************************************
//		Event		:MemDataAfterPost
//		Process		:MemDataポスト後イベント
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000016CBaseF.MemDataAfterPost(DataSet: TDataSet);
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
//		Event		:DxKyoGridColumn9
//		Process		:ButtonClick
//		Parameter	:
//		Return		:
//		History		:2009/12/28(Y.Kondo)
//					:<2009-12-28>
//**********************************************************************
procedure THAP000016CBaseF.DxGridColumn9EditButtonClick(Sender: TObject);
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
			ExpParam.SetKMCode(SYOU_CODE)
		else
			ExpParam.SetKMCode(BATSU_CODE);

		try
			try
				ExpIF.DoDlg(ExpParam);

				if ExpParam.ExpResult<>mrOK then	//ｷｬﾝｾﾙ押下
					Exit;

				MemData.Edit;
				MemDataShoBatsuCode.AsInteger	:= ExpParam.ExpRetCode;			//区分No
				MemDataShoBatsu.AsString		:= ExpParam.ExpRetText;			//区分名称
				MemDataShoBatsuBunya.AsString	:= ExpParam.ExpRetEBText;
				MemDataShoBatsuKbn.AsString		:= ExpParam.ExpRetDtText;
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
//		Event		:MemDataShoBatsuCode
//		Process		:Change
//		Parameter	:
//		Return		:
//		History		:2009/12/28(Y.Kondo)
//					:<2009-12-28>
//**********************************************************************
procedure THAP000016CBaseF.MemDataShoBatsuCodeChange(Sender: TField);
var
	sName,
	sKubun,
	sBunya	: String;
begin
	if Sender.Value > 0 then
	begin
		fnMNExNameGet(Trunc(Sender.Value),sName,sBunya,sKubun);

		MemDataShoBatsu.AsString	:= sName;
		MemDataShoBatsuKbn.AsString	:= sKubun;
		MemDataShoBatsuBunya.AsString:= sBunya;
	end
	else
	begin
		MemDataShoBatsu.AsString	:= '';
		MemDataShoBatsuKbn.AsString	:= '';
		MemDataShoBatsuBunya.AsString:='';
	end;
end;

end.
