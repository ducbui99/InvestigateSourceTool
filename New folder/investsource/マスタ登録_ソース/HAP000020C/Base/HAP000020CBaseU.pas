//**********************************************************************
//		System		:MJSFX
//		Project ID	:HAP000013CBase
//		Project Name:連絡先/保証人
//		Create		:H.Itahana(Buntechno)
//		Create Date	:2005/06/17
//		History		:
//					: 2014/09/03 Y.Kondo
//					:	拡大率対応						<MLXDSP>
//					: 2014/11/25 K.Suzuki
//					:	郵便番号の逆引き処理がキー操作できない件の対応	<20141125>
//					: 2015/03/05 E.Inukai
//					:	テキストエディット上でのタブキーの考慮を追加	<150305>
//					: 2019/01/24 K.Takahashi(CyberCom)
//					:	新元号対応(Gengou)
//					: 2020/01/30 Y.Goto(NTC)
//					:	Delphi10-コンパイル対応	<D10-C>
//					: 2020/02/04 Y.Goto(NTC)
//					:	Delphi10-Unicode対応	<D10-U>
//					: 2020/04/21 Y.Iwakawa
//					:	基準日対応						<RefDay>
//					: 2021/03/17 K.Shirai(TakumiCo.)
//					:	「単身赴任者一覧表」と郵便番号の表示を一致させる修正	<210317>
//**********************************************************************
unit HAP000020CBaseU;

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
	Db,
	FireDAC.Comp.Client,
	VCL.ExtCtrls,
	ComCtrls,
	VCL.StdCtrls,
	MJSPanel,
	MJSStatusBar,
	MJSEdits,
	MJSLabel,
	MJSBitBtn,
	MjsStrCtrl,
	MJSSpeedButton,
	MJSCheckBox,
	MJSQuery,
	MjsDBModuleU,
	MjsDateCtrl,
	MJSComboBox,
    MJSCOMMON2U,
	dxmdaset,
	CMNExpFuncU,
	HAPApIFU,
	HAPMsgU	,
	HAPLibU,
	MjsKeyDataState,
	MLBplLoaderU;

type
{$I ActionInterface.inc}
{$I CMNSearchNATLH.inc}

  THAP000020CBaseF = class(TForm)
    PTool: TMPanel;
    PMain: TMPanel;
    MLabel9: TMLabel;
    MLabel48: TMLabel;
    MLabel17: TMLabel;
    MPanel10: TMPanel;
    MLabel31: TMLabel;
    MLabel32: TMLabel;
    MLabel33: TMLabel;
    MLabel34: TMLabel;
    MLabel35: TMLabel;
    LETansin: TMLabel;
    ETanAddress1: TMTxtEdit;
    ETanAddress2: TMTxtEdit;
    ETanTelNo: TMTxtEdit;
    ETansin: TMNumEdit;
    MLabel36: TMLabel;
    ETanYuubinA: TMTxtEdit;
    ETanYuubinB: TMTxtEdit;
    MPanel11: TMPanel;
    MLabel42: TMLabel;
    MLabel45: TMLabel;
    MLabel41: TMLabel;
    MLabel43: TMLabel;
    MLabel44: TMLabel;
    LLoanDeptName: TMLabel;
    LLoanPostName: TMLabel;
    LLoanComment: TMLabel;
    MLabel52: TMLabel;
    LLoanDate: TMLabel;
    LLoanCorpName: TMLabel;
    ELoanDateSt: TMComboBox;
	mdLoanNow: TdxMemData;
    mdLoanNowLoanDateSt: TDateTimeField;
    mdLoanNowLoanCorpName: TStringField;
    mdLoanNowLoanDeptName: TStringField;
    mdLoanNowLoanPostName: TStringField;
    mdLoanNowLoanComment: TStringField;
    btnTelSearch: TMSpeedButton;
    MLabel50: TMLabel;
    LLoanCount: TMLabel;
    MPanel1: TMPanel;
    dtGroupEnter: TMDateEdit;
    MLabel1: TMLabel;
    MLabel2: TMLabel;
    lblGroupEnter1: TMLabel;
    LGroupEnterY: TMLabel;
    lblGroupEnter2: TMLabel;
    LGroupEnterM: TMLabel;
    lblGroupEnter3: TMLabel;
    procedure FormCreate(Sender: TObject);
    procedure EYuubinAKeyPress(Sender: TObject; var Key: Char);
    procedure EYuubinAArrowClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ELoanDateStChange(Sender: TObject);
    procedure btnTelSearchClick(Sender: TObject);

  private
    { Private 宣言 }
	pAppRec		:^TMjsAppRecord;												//Menuから受け取るﾊﾟﾗﾒｰﾀのﾎﾟｲﾝﾀ
	pHApApParam	:^THapApParam;													//給与親子間ﾊﾟﾗﾒｰﾀ
	ACCtrl		:TWinControl;													//ﾌｫｰｶｽ復帰
	ddCopDB		:TFDConnection;
	MDBModule	:TMDataModuleF;
	rcMsg		:TMjsMsgRec;
	bYExpCall	:Boolean;														//[TRUE]郵便検索Exp初期処理OK

	gbNowLoan	:Boolean;                                                        //現在出向中フラグ
	giRekiKbn	:Integer;

	m_cTelIF		: TCMNSearchNATLIF;
	m_cTelInfo		: TCMNTelInfo;							// 入出力ﾊﾟﾗﾒｰﾀ
	m_cColInfo		: TCMNColInfo;							// 表示、戻り値設定
	m_cSrcInfo		: TCMNSrcInfo;							// １０４検索表示、戻り値設定
	m_iKM_ItemUse	: Integer;

	qry	: TMQuery;

	procedure	fnFormIni;
	procedure	fnWCTLEnter(Sender:TObject);
	procedure	fnWCTLExit(Sender:TObject);
	procedure	fnDetailSet;
	procedure	fnDetailEnable(bEnable:boolean);
	procedure	fnEditEnd;
	function	fnDataCheck : Boolean;
	function	fnUpdate: boolean;

  // AP独自
	function	fnSetListItem(MEdit:TMNumEdit;iItemNo:Integer):Boolean;
	procedure	fnSetProperty(iKbn: integer; eEdit: TMNumEdit);
	Function	fnFocusGET(iPara : Integer) : TWinControl;
	Function	fnNumCheck(Edit : TMNumEdit) : Boolean;
	function	fnGetList(MEdit:TMNumEdit):string;

	Function	fnTableGet(iCode : INteger; SList,FList : Pointer) : String;OverLoad;
	Function	fnTableGet(iCode : INteger; var SFName : String) : Integer;OverLoad;
	Function	fnPartsGet(iCode : INteger) : TCustomEdit;
	// 郵便番号
	procedure	fnYubinPartsGet(iItemNo : Integer;Var TxtA,TxtB,TxtC,TxtD : TMTxtEdit);
	procedure	fnGetPostNo(Txt : TMTxtEdit);
	procedure	fnFBarClick;
	function	fnChkYubinData(Sender:TMTxtEdit):Boolean;
	function	fnYubinNoCheck(var sPno: string): Integer;
	procedure	fnGetAddress(iItemNo : Integer);
	procedure	fnEnableSet(Num : TMNumEdit);

    function fnGetFormatDate(dDate: TDate): String;

	function fnGetGroupEnter(dtDate : TDateTime) : String;

	procedure fnDivisionName(sBaseName : String ; out sName1,sName2: String);		// 氏名分割
	procedure fnClearResult(pTelInfo:Pointer);										// 電話番号検索結果項目 クリア
	procedure fnRefColorChange;														// 基準日表示項目の色変更 <RefDay>

  public
    constructor CreateForm(pRec,pParam: pointer);
    { Public 宣言 }
  protected
	procedure CMChildKey(var Msg:TWMKey);message CM_ChildKey;
  end;

  function AppEntry(pPar:pointer):integer;

exports
  AppEntry;

var
  HAP000020CBaseF: THAP000020CBaseF;

implementation
uses
	MjsCommonU,
	MjsDispCtrl;

const
	ArrItem	:	Array[1..4] of Integer =

    (
		147800,		//単身赴任区分
		148001,		//（単）住所上段
		148002,		//（単）住所下段
		148100		//（単）電話番号
    );
	arrFunc01:array[0..7]of string=(
											' F1 住所→郵便番号,1',
											'',
											'',
											'',
											'',
											'',
											'',
											''
											);
	arrFuncClear:array[0..7]of string=(			//消去用
											'',
											'',
											'',
											'',
											'',
											'',
											'',
											''
											);
{$R *.DFM}
{$I CMNSearchNATLB.inc}
//**********************************************************************
//		Process		:AppEntry
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function AppEntry(pPar:pointer):integer;
var
	pForm:^THAP000020CBaseF;
	pRec :^TMjsAppRecord;
	pActionParam:^THapApParam;
	iAction:integer;
begin
	Result	:=ACTID_RET_NG;
	pRec 	:= Pointer( TAppParam( pPar^ ).pRecord );				//TMjsAppRecord 構造体 pointer 取得
	pActionParam:= Pointer( TAppParam( pPar^ ).pActionParam );		//送受信ﾊﾟﾗﾒｰﾀ
	iAction := TAppParam( pPar^ ).iAction;							//Action ID 取得

	case iAction of

		ACTID_FORMCREATESTART ,
		ACTID_FORMCREATESHOWSTART :
		begin
			try
				New( pForm );
			except
				Exit;
			end;

			try
				pForm^ := THAP000020CBaseF.CreateForm( pRec,pActionParam );

				pRec^.m_pChildForm := pForm;

				if iAction = ACTID_FORMCREATESHOWSTART then
				begin
					pForm^.Show;
					THAP000020CBaseF(pForm^).PTool.Show;			//処理ﾎﾞﾀﾝ[可視]
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
			THAP000020CBaseF(pForm^).PTool.Show;			//処理ﾎﾞﾀﾝ[可視]
		end;

		ACTID_HIDESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );

			if pForm^.Parent <> nil then
			begin
				pForm^.Hide;
				THAP000020CBaseF(pForm^).PTool.Hide;								//処理ﾎﾞﾀﾝ[不可視]
			end;
		end;

		HAPAP_ACTID_SHOWDATA:			//社員内容表示
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000020CBaseF(pForm^).fnDetailSet;
        end;

		HAPAP_ACTID_ENABLE:								//内容部[使用可]
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000020CBaseF(pForm^).fnDetailEnable(True);
		end;

		HAPAP_ACTID_DISABLE:							//内容部[使用不可]
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000020CBaseF(pForm^).fnDetailEnable(False);
		end;

		HAPAP_ACTID_SETFOCUS,							//ﾌｫｰｶｽ復帰
		HAPAP_ACTID_SETFOCUS_FIRST,						//ﾌｫｰｶｽ先頭
		HAPAP_ACTID_SETFOCUS_LAST: 						//ﾌｫｰｶｽ最終
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			with THAP000020CBaseF(pForm^) do
			begin
				if iAction = HAPAP_ACTID_SETFOCUS_FIRST then
				begin
					ACCtrl := THAP000020CBaseF(pForm^).fnFocusGet(iAction);
				end;

				if iAction = HAPAP_ACTID_SETFOCUS_LAST then
				begin
					//先頭から順に探索
					if ETansin.Enabled then
					begin
						ACCtrl := ETansin;
					end;

					if ETanTelNo.Enabled then
					begin
						ACCtrl := ETanTelNo;
					end;

					if dtGroupEnter.Enabled then
					begin
						ACCtrl := dtGroupEnter;
					end;

					if ELoanDateSt.Visible then
					begin
						ACCtrl := ELoanDateSt;
					end;
				end;

				MjsSetFocus(THAP000020CBaseF(pForm^), ACCtrl.Name);
			end;
			HapSendToOwner(HAPAP_ACTID_ENTER_OK, pRec, pActionParam);
		end;

		HAPAP_ACTID_EXIT:								//終了通知
		begin
			pForm := Pointer(pRec^.m_pChildForm);
			THAP000020CBaseF(pForm^).fnEditEnd;
		end;

		HAPAP_ACTID_FBARCLICK:							//ﾌｧﾝｸｼｮﾝﾊﾞｰｸﾘｯｸ
		begin
			pForm := Pointer(pRec^.m_pChildForm);
			{ﾌｧﾝｸｼｮﾝNoの取り出しと現在ｺﾝﾎﾟｰﾈﾝﾄにより判定を行う}
			THAP000020CBaseF(pForm^).fnFBarClick;
		end;
	end;

	Result:=ACTID_RET_OK;
end;

//**********************************************************************
//		Process		:コンストラクタ
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
constructor THAP000020CBaseF.CreateForm(pRec,pParam:pointer);
var
	pBaseAppRec	: ^TMjsAppRecord;
	PCallForm	: ^TControl;
begin
	pAppRec		:= pRec;
	pHapApParam	:= pParam;
	MDBModule	:= TMDataModuleF(pAppRec^.m_pDBModule^);
	ddCopDB		:= pHapApParam^.GetCopDB;
    PCallForm	:= TMjsAppRecord(pAppRec^).m_pOwnerForm;
	bYExpCall	:= False;
	pBaseAppRec	:= pHapApParam^.GetPointer;										// 郵便番号呼出し用に元AppRecordを取得する

	if fnCMNPostInit(pBaseAppRec) = 0 then							   			//郵便Exp初期処理
	begin
		BYExpCall:=True;														//OK
	end;

	inherited Create(PCallForm^);
end;

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Process		:ﾌｫｰﾑ作成
//		Parameter	:
//		Return		:
//		History		:
//					:
//**********************************************************************
procedure THAP000020CBaseF.FormCreate(Sender: TObject);
var
	mqMA		:	TMQuery;
begin
//2005-10-19
	mqMA:=TMQuery.Create(Self);

	try
		try
			MDBModule.SetDBInfoTOQuery(ddCopDB,mqMA);

			with mqMA do
			begin
				Close;
				SQL.Clear;
				SQL.Add('SELECT YearKbn FROM DTMAIN');

				if (not Open) or (Eof) then
					Abort;

				giRekiKbn := GetFld('YearKbn').AsInteger;

			end;

		finally
			mqMA.Close;
			mqMA.Free;
		end;
	except
		GetMsg(rcMsg,1,5);
		with rcMsg do
		begin
			MjsMessageBoxEx(nil,'会社情報の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
		end;

		abort;
	end;

	qry := TMQuery.Create(Self);
	MDBModule.SetDBInfoTOQuery(ddCopDB, qry);

	fnFormIni;			//ﾌｫｰﾑ初期処理

	MjsFontResize(THAP000020CBaseF(Self),pointer(pAppRec));
end;

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Process		:ﾌｫｰﾑ破棄
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000020CBaseF.FormDestroy(Sender: TObject);
begin
	if qry <> nil then
	begin
		qry.Close;
		qry.Free;
	end;

	if bYExpCall then															//郵便番号Exp初期処理OK
		fnCmnPostFree;															//郵便番号Exp終了処理
		
	m_cTelIF.Free;		// 電話番号検索 <20121219>
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
procedure THAP000020CBaseF.CMChildKey(var Msg:TWMKey);
var
	Active	: TWinControl;
	sShift	: TShiftState;
begin
	if GetKeyState(VK_MENU) < 0 then Exit;

	Active	:= Screen.ActiveControl;
	sShift	:= MjsKeyDataToShiftState(Msg.KeyData);
                        
	//単身赴任区分独自制御
	if Active = ETansin then
	begin
		if ETansin.Value > 0 then
		begin
			fnNumCheck(ETansin);
		end;
		fnEnableSet(ETansin);
	end;

	//郵便番号（枝番）独自制御
	if Active = ETanYuubinB then
	begin
		if (Msg.CharCode = VK_TAB) and (sShift = [ssShift]) then
		begin
			ETanYuubinB.OnExit := nil;
			MjsPrevCtrl(Self);
			ETanYuubinB.OnExit := fnWCTLExit;
			Msg.CharCode := 0;
			Abort;
		end
		else
		begin
			case Msg.CharCode of
				VK_LEFT
				, VK_UP :
				begin
					ETanYuubinB.OnExit := nil;
					MjsPrevCtrl(Self);
					ETanYuubinB.OnExit := fnWCTLExit;
					Msg.CharCode := 0;
					Abort;
				end;
			end;
		end;
	end;

	if Active is TMComboBox then
	begin
		if TMComboBox(Active).DroppedDown then
		begin
			Exit;
		end;

		if (Msg.CharCode = VK_UP)
		or (Msg.CharCode = VK_DOWN) then
		begin
			Exit;
		end;
	end;

    //<20141125>↓F1 住所→郵便番号
    if Active = EtanAddress1 then
	begin
		if Msg.CharCode = VK_F1 then
		begin
			pHapApParam.SetFuncNo(1);
			fnFBarClick;
		end;
	end;
	//<20141125>↑

	//キャレット位置判定のため共通ロジックから分離
	if Active is TMTxtEdit then
	begin   
		case Msg.CharCode of
			//<150305>↓
			VK_TAB :
			begin
				if sShift = [ssShift] then
				begin
					MjsPrevCtrl(Self);
					Msg.CharCode := 0;
					Abort;
				end
				else
				begin
					MjsNextCtrl(Self);
					Msg.CharCode := 0;
					Abort;
				end;
			end;
			//<150305>↑

			VK_LEFT :
			begin
				if MjsChkCurTop(Active)
				and (sShift = []) then
				begin
					MjsPrevCtrl(Self);
					Msg.CharCode := 0;
					Abort;
				end;
			end;      

			VK_UP :
			begin
				MjsPrevCtrl(Self);
				Msg.CharCode := 0;
				Abort;
			end;

			VK_RIGHT :
			begin
				if MjsChkCurEnd(Active)
				and (sShift = []) then
				begin
					MjsNextCtrl(Self);
					Msg.CharCode := 0;
					Abort;
				end;
			end;

			VK_DOWN :
			begin
				MjsNextCtrl(Self);
				Msg.CharCode := 0;
				Abort;
			end;

			VK_RETURN :
			begin
				MjsNextCtrl(Self);
				Msg.CharCode := 0;
				Abort;
			end;

			VK_END :
			begin
				if MjsChkCurEnd(Active)
				and (sShift = []) then
				begin
					HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN, pAppRec, pHapApParam);
					Msg.CharCode := 0;
					Abort;
				end;
			end;

			VK_ESCAPE :
			begin
				HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN, pAppRec, pHapApParam);
				Msg.CharCode := 0;
				Abort;
			end;
		end;
		Exit;
	end;

	case Msg.CharCode of
		VK_LEFT
		,VK_UP :
		begin
			MjsPrevCtrl(Self);
			Msg.CharCode := 0;
			Abort;
		end;

		VK_RIGHT
		,VK_DOWN
		,VK_RETURN :
		begin
			if ((Active = dtGroupEnter) and (not ELoanDateSt.Visible))
			or (Active = ELoanDateSt) then
			begin
				fnWCTLExit(Active);
				HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN, pAppRec, pHapApParam);
				Msg.CharCode := 0;
				Abort;
			end;

			MjsNextCtrl(Self);
			Msg.CharCode := 0;
			Abort;
		end;

		VK_TAB :
		begin
			if sShift = [ssShift] then
			begin
				if ((Active = dtGroupEnter) and (not ETansin.Enabled))
				or (Active = ETansin) then
				begin        
					fnWCTLExit(Active);
					HapSendToOwner(HAPAP_ACTID_SETFOCUS_TAB, pAppRec, pHapApParam);
					Msg.CharCode := 0;
					Abort;
				end;

				MjsPrevCtrl(Self);
				Msg.CharCode := 0;
				Abort;
			end
			else
			begin
				if ((Active = dtGroupEnter) and (not ELoanDateSt.Visible))
				or (Active = ELoanDateSt) then
				begin
					fnWCTLExit(Active);
					HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN, pAppRec, pHapApParam);
					Msg.CharCode := 0;
					Abort;
				end;

				MjsNextCtrl(Self);
				Msg.CharCode := 0;
				Abort;
			end;
		end;

		VK_ESCAPE
		,VK_END :
		begin     
			fnWCTLExit(Active);
			HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN, pAppRec, pHapApParam);
			Msg.CharCode := 0;
			Abort;
		end;
	end;
end;

//**********************************************************************
//		Process		:ﾌｫｰﾑおよびｺﾝﾎﾟｰﾈﾝﾄ初期化
//		Parameter	:
//		Return		:
//		History		:19/01/24(K.Takahashi(CyberCom))
//					:新元号対応(Gengou)
//**********************************************************************
procedure THAP000020CBaseF.fnFormIni;
var
	i:integer;

	Function	fnKMNameGet(iCode : Integer) : String;
	var
		KMQuery	:	TMQuery;
	begin
		Result := '';
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
					Close;
					SQL.Clear;
					SQL.Add('Select ItemName From HAPKM');
					SQL.Add('Where ItemNo = :ItemNo'	);
//					SQL.Add('(Select KubunNo from HAPKM Where ItemNo = :ItemNo)');

					ParamByName('ItemNo').AsInteger := iCode;

			        Open;

	                if not Eof then
						Result := GetFld('ItemName').AsString;

			    except
					Result := '';
		        end;
		    finally
		        Close;
	    	    Free;
	        end;
	    end;
	end;

	Function	getTanItemUse(iCode : Integer) : Integer;
	var
		KMQuery	:	TMQuery;
	begin
		Result := 1;
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
					Close;
					SQL.Clear;
					SQL.Add('Select ItemUse From HAPKM');
					SQL.Add('Where ItemNo = :ItemNo'	);
//					SQL.Add('(Select KubunNo from HAPKM Where ItemNo = :ItemNo)');

					ParamByName('ItemNo').AsInteger := iCode;	//単身赴任区分

			        Open;

	                if not Eof then
						Result := GetFld('ItemUse').AsInteger;

			    except
					Result := 1;
		        end;
		    finally
		        Close;
	    	    Free;
	        end;
	    end;
	end;

begin

// <MLXDSP> S
	MjsCompoResize(PTool,0,pointer(pAppRec));
	MjsCompoResize(btnTelSearch,0,pointer(pAppRec));
// <MLXDSP> E

	HapChildFormPropertySet(	THAP000020CBaseF(Self),							//ﾌｫｰﾑ
								PTool,											//処理ﾎﾞﾀﾝ
								PMain,											//内容部
								pAppRec,										//親APから受け取ったMjsAppRecordﾎﾟｲﾝﾀ
								pHapApParam	);									//親APから受け取ったHapApParamﾎﾟｲﾝﾀ

	m_iKM_ItemUse := getTanItemUse(147800);	//単身赴任区分

//設計
//
	for i:=0 to ComponentCount-1 do
	begin
		if(Components[i] is TMPanel)then
		begin
			(Components[i] as TMPanel).ParentColor:=true;
		end;
	end;


//初期設定
	Parent			:=TPanel(pAppRec^.m_pOwnerPanel^);
	BorderStyle		:=bsNone;
	Align			:=alClient;

//表示色変更

	MjsColorChange(	THAP000020CBaseF(Self),
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysColorB,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysColorD,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysBaseColorB,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysBaseColorD,
					rcCOMMONAREA(pAppRec^.m_pCommonArea^).SysFocusColor
					);

	for i:=0 to ComponentCount-1 do
	begin
		//ｺﾝﾎﾟｰﾈﾝﾄ初期ｸﾘｱ
		//NumEdit
		if Components[i] is TMNumEdit then
		begin
			if (Components[i] as TMNumEdit).SelectColCount > 0 then
			begin
				(Components[i] as TMNumEdit).SelectDisp := sdArrowClick;

                //<080213> 出向情報は表示のみ
				//2005-10-19
				{if (Components[i] as TMNumEdit) <> ELoan then
					fnSetListItem((Components[i] as TMNumEdit),(Components[i] as TMNumEdit).Tag);
                }
				fnSetListItem((Components[i] as TMNumEdit),(Components[i] as TMNumEdit).Tag);
            end;
			(Components[i] as TMNumEdit).Value:=0;
		end;

		//TxtEdit
		if Components[i] is TMTxtEdit then
		begin
			(Components[i] as TMTxtEdit).Text:='';
			if (Components[i] as TMTxtEdit).TagStr = 'Exp' then					// 郵便番号検索
			begin
				if bYExpCall then												//検索Exp呼出[可]
					(Components[i] as TMTxtEdit).ArrowDisp	:=adFocused
				else															//[不可]
					(Components[i] as TMTxtEdit).ArrowDisp	:=adNone;			//[...]表示しない
            end;
        end;

		//DateEdit
		if Components[i] is TMDateEdit then
			(Components[i] as TMDateEdit).Value:=0;

		//Label
		if (Components[i] is TMLabel) then
		begin
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
// <NewEraName-K> DEL Start
//			(Components[i] as TMDateEdit).Gengou:='H';
// <NewEraName-K> DEL End

			with(Components[i] as TMDateEdit)do
			begin
				OnEnter	:=fnWCTLEnter;
				OnExit	:=fnWCTLExit;

				//入力暦区分[西暦以外]
				if giRekiKbn = 0 then
				begin
					DateFormat:=dfEMD;
				end
				else
				begin
					//元号Def[ｸﾘｱ]
					Gengou	  :=#0;
					DateFormat:=dfYMD;
				end;

				Calendar	:=TRUE;
				ArrowDisp	:=adFocused;
			end;
		end;
		if Components[i] is TMComboBox then
		begin
			(Components[i] as TMComboBox).OnEnter	:=fnWCTLEnter;
			(Components[i] as TMComboBox).OnExit	:=fnWCTLExit;
		end;
		if Components[i] is TMBitBtn then
		begin
			(Components[i] as TMBitBtn).OnEnter	:=fnWCTLEnter;
			(Components[i] as TMBitBtn).OnExit	:=fnWCTLExit;
		end;
	end;

	
	// <20121219>
	// 電話番号検索
	m_cTelIF := TCMNSearchNATLIF.Create(pAppRec);		// ｸﾗｽ生成
	btnTelSearch.Visible := (m_cTelIF.useNAT = 0);		// DLL,辞書ﾁｪｯｸ 有(TRUE)の場合、検索ﾎﾞﾀﾝ表示
	fnClearResult(@m_cTelInfo);							// 検索結果クリア
	m_cSrcInfo.iHoKoKbn := 1;							// 104検索の法人/個人の初期値 個人を対象
	// <20121219>

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
procedure THAP000020CBaseF.fnWCTLEnter(Sender:TObject);
begin
	if (Sender as TWinControl).ControlCount > 0 then
		Exit;

	ACCtrl := Sender as TWinControl;

	if	( ACCtrl = ETanAddress1 ) then
		pHapApParam^.SetFuncCaption(arrFunc01)          //F1 住所→郵便番号
	else
		pHapApParam^.SetFuncCaption(arrFuncClear);		//ﾌｧﾝｸｼｮﾝ消去

	HapSendToOwner(HAPAP_ACTID_FBARCAPTION, pAppRec, pHapApParam);

	if	(ACCtrl = ETanYuubinA)	or
		(ACCtrl = ETanYuubinB)	or
		(ACCtrl = ETanAddress1)	or
		(ACCtrl = ETanAddress2)	or
		(ACCtrl = ETanTelNo)	then
	begin
		btnTelSearch.Enabled	:=	True;
	end
	else
	begin
		btnTelSearch.Enabled	:=	False;
	end;

	if (ACCtrl = ETanYuubinA) and (not ACCtrl.Enabled) then
	begin
		dtGroupEnter.SetFocus;
	end;
end;

//**********************************************************************
//		Component	:ALL
//		Event		:Enter
//		Proccess	:
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000020CBaseF.fnWCTLExit(Sender:TObject);
var
	dDate	:	TDateTime;
begin

	btnTelSearch.Enabled := False;

	//（連）住所1のｷｬﾚｯﾄを元に戻す
	if(Sender = ETanAddress1)and(not ETanAddress1.AutoSelect)then
		ETanAddress1.AutoSelect:=True

	//（連）住所2のｷｬﾚｯﾄを元に戻す
	else if(Sender = ETanAddress2)and(not ETanAddress2.AutoSelect)then
		ETanAddress2.AutoSelect:=True;

	if Sender is TMDateEdit then
	begin
		if not HapActiveControlOnForm(Self) then								//ﾌｫｰﾑ自体のﾌｫｰｶｽ消失によるExitｲﾍﾞﾝﾄ
			Exit;																//以下不要

		{日付チェック}
		if (Sender is TMDateEdit) and ((Sender as TMDateEdit).Value<>0) then
		begin
			dDate := (Sender as TMDateEdit).AsDateTime;
			if not MjsIntYMDChk(MjsDateToInt8(dDate)) then
			begin
				GetMsg(rcMsg,100,7);
				with rcMsg do
				begin
					MjsMessageBoxEx(Self,sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
				end;

				MjsSetFocus(Self, TMDateEdit(Sender).Name);
				Abort;
			end;
		end;

		if Sender = dtGroupEnter then
		begin
			if dtGroupEnter.Text = '' then
			begin
				Exit;
			end;
			fnGetGroupEnter(dtGroupEnter.AsDateTime);
		end;
	end
	else if Sender is TMNumEdit then
	begin
		if not HapActiveControlOnForm(Self) then								//ﾌｫｰﾑ自体のﾌｫｰｶｽ消失によるExitｲﾍﾞﾝﾄ
			exit;
		if (Sender as TMNumEdit).SelectColCount > 0 then
			fnNumCheck(Sender as TMNumEdit);									// 入力値のチェック
//単身赴任区分が未登録のときは関連項目も使用不可にする
		if Sender = ETansin then
			fnEnableSet(Sender as TMNumEdit);

		//<080213> 出向情報は表示のみ
		{if Sender = ELoan then
			fnEnableSet(Sender as TMNumEdit);
		}
	end
	else if Sender is TMTxtEdit then
	begin
		if ((Sender as TMTxtEdit).TagStr <> '' ) then
		begin
		    if fnChkYubinData(Sender as TMTxtEdit)=False then
			begin
		        Exit;
			end;
		end;
	end;
end;

//**********************************************************************
//		Proccess	:社員内容表示
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000020CBaseF.fnDetailSet;
var
	Query		:	TMQuery;
	i			:	Integer;
	sFieldName,
	sTableName	:	TStringList;
	sField,
	sWk			:	String;
	Lbl			:	TMLabel;
	TComP		:	TCusTomEdit;
	sSQL		:	String;
begin
//2005-10-19
	gbNowLoan := False;

	LLoanDate.Caption		:= '';
	LLoanCorpName.Caption	:= '';
	LLoanDeptName.Caption	:= '';
	LLoanPostName.Caption	:= '';
	LLoanComment.Caption	:= '';
	LLoanCount.Caption		:= '';	// <2008-02-28>
	ELoanDateSt.Items.Clear;		// <2008-02-28>

	Query := TMQuery.Create( Self );						// MQueryの構築
	MDBModule.SetDBInfoToQuery( ddCopDB, Query );
	sTableName := TStringList.Create;						// StringListの構築
	sFieldName := TStringList.Create;						// StringListの構築
	sTableName.Clear;
	sFieldName.Clear;
	fnRefColorChange();										// 基準日項目ラベルの色変更 <RefDay>

	try
		try
			with Query do
			begin
				Close;
				SQL.Clear();

				SQL.Add('Select HAPSC.NCode');
				for i := 1 to Length(ArrItem) do
				begin
					SQL.Add(',');
					sWk := fnTableGet(ArrItem[i],@sTableName,@sFieldName);
					if Trim(sWk) = '' then
					begin
						GetMsg(rcMsg,200,1);
						with rcMsg do
							MjsMessageBoxEx(Self,'項目名取得失敗' + IntToStr(ArrItem[i]),sTitle,IconType,BtnType,BtnDef,LogType);
						abort;
					end;
					SQL.Add(sWk);
				end;
				SQL.Add('From HAPSC');

				for i := 0 to STableName.Count - 1 do
				begin
					if STableName[i] = 'HAPSC' then
						continue;
					SQL.Add('Left Outer Join ' +  STableName[i]+' on HAPSC.NCode = '+STableName[i]+'.EmpNCode');
					SQL.Add('AND HAPSC.CorpNCode='+STableName[i]+'.CorpNCode');
				end;
				SQL.Add('Where HAPSC.NCode = :EmpNCd');
				SQL.Add('AND HAPSC.CorpNcode = :CopNCd');

				ParamByName('EmpNCd').AsCurrency := pHapApParam^.GetEmpNCd;
				ParamByName('CopNCd').AsCurrency := 0;

				if not Open then
					Abort;

				if not Eof then
				begin
					for i := 0 to Length(ArrItem) - 1 do
					begin
						TComP := fnPartsGet(ArrItem[i+1]);
						sField := TrimRight(sFieldName[i]);				// スペースを省略
						if TComP is TMNumEdit then
						begin
							if not GetFld(sField).isNull then
							begin
								(TComP as TMNumEdit).Value := GetFld(sField).AsInteger;
								sWk := fnGetList(TComP as TMNumEdit);
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
							if (TComP as TMTxtEdit).TagStr = '' then
                            begin
								if not GetFld(sField).isNull then
								begin
									(TComP as TMTxtEdit).Text := GetFld(sField).AsString;
								end
								else
								begin
									(TComP as TMTxtEdit).Text := '';
								end;
                            end;
						end;
					end;

				//郵便番号は基番・枝番別のため別読み込み
					sSQL := 'SELECT RenYuubinNo1,RenYuubinNo2,'
					+#13#10+'TanYuubinNo1,TanYuubinNo2,'
					+#13#10+'HosYuubinNo11,HosYuubinNo12,'
					+#13#10+'HosYuubinNo21,HosYuubinNo22'
					+#13#10+'FROM HAPSYJ As SYJ'
					+#13#10+'INNER JOIN HAPSC As SC'
					+#13#10+'ON SC.NCode=SYJ.EmpNCode'
					+#13#10+'AND SC.CorpNCode=SYJ.CorpNCode'
					+#13#10+'WHERE SC.NCode=:hEmpNCd'
					+#13#10+'AND SC.CorpNCode=:hCopNCd';

					Close;
					SQL.Clear;
					SQL.Add(sSQL);

					SetFld('hEmpNCd').AsFloat	:=	pHapApParam^.GetEmpNCd;
					SetFld('hCopNCd').AsFloat	:=	0;

					if not Open then
						Abort;

    				if not Eof then
					begin

//<210317>単身赴任者一覧表と郵便番号の表示方法を合わせるため変更
						if ((GetFld('TanYuubinNo1').AsInteger <> 0)or(GetFld('TanYuubinNo2').AsInteger <> 0)) then
						begin
							ETanYuubinA.Text := MjsEditNum(GetFld('TanYuubinNo1').AsInteger,'0000',3);
							ETanYuubinB.Text := MjsEditNum(GetFld('TanYuubinNo2').AsInteger,'0000',4);
                        end
						else
						begin
							ETanYuubinA.Text := '';
  							ETanYuubinB.Text := '';
                        end;
//<210317>
					end;
				end;
				// 単身赴任区分が未登録のときは関連項目も使用不可にする
				fnEnableSet(ETansin);

//<RefDay> ↓
				//基準日指定時
				if pHapApParam.GetRefType = 1 then
                begin
					//出向データ抽出
					sSQL := 'SELECT *' + #13#10 +
	                		'  FROM MP_HAP_HAPSLN_STD('''+FormatDateTime('yyyy-mm-dd', pHapApParam.GetRefDate)+''',1 )' + #13#10 +
							' WHERE CompSt=1 ' + #13#10 +
							'   AND CorpNCode=:hCopNCd AND EmpNCode=:hEmpNCd' + #13#10 +
							' ORDER BY LoanDateSt DESC, LoanNCode';
                end
//<RefDay> ↑
				else
				begin
	                //<080213> 出向データ抽出
					sSQL := 'SELECT *' + #13#10 +
	                		'  FROM HAPSLN' + #13#10 +
							' WHERE CompSt=1 AND CompEd=0' + #13#10 +
							'   AND CorpNCode=:hCopNCd AND EmpNCode=:hEmpNCd' + #13#10 +
							' ORDER BY LoanDateSt DESC, LoanNCode';
                end;
				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				SetFld('hEmpNCd').AsFloat	:=	pHapApParam^.GetEmpNCd;
				SetFld('hCopNCd').AsFloat	:=	0;

				if not Open then
					Abort;

				if Eof then	//現在休職中が存在しない
				begin
                	//<080213>
					//ELoan.Value := 0;

					ELoanDateSt.Visible := False;
					LLoanDate.Visible	:= True;

					gbNowLoan := False;
				end
				else
				begin
					// <2008-02-28>
					mdLoanNow.Close;
					mdLoanNow.Open;
					while not Eof do
					begin
						mdLoanNow.Append;
						mdLoanNowLoanDateSt.AsDateTime	:= GetFld('LoanDateSt').AsDateTime;
						mdLoanNowLoanCorpName.AsString	:= GetFld('LoanCorpName').AsString;
						mdLoanNowLoanDeptName.AsString	:= GetFld('LoanDeptName').AsString;
						mdLoanNowLoanPostName.AsString	:= GetFld('LoanPostName').AsString;
						mdLoanNowLoanComment.AsString	:= GetFld('LoanComment').AsString;
						mdLoanNow.Post;

						ELoanDateSt.Items.Add(' '+fnGetFormatDate(mdLoanNowLoanDateSt.AsDateTime));

						Next;
					end;
					ELoanDateSt.ItemIndex := 0;
					ELoanDateSt.OnChange(nil);

					if mdLoanNow.RecordCount > 1 then
					begin
						ELoanDateSt.Visible := True;
						LLoanDate.Visible	:= False;

						LLoanCount.Caption := Format('現在出向中 %d件', [mdLoanNow.RecordCount]);
					end
					else
					begin
						ELoanDateSt.Visible := False;
						LLoanDate.Visible	:= True;
					end;

					gbNowLoan := True;
				end;

				dtGroupEnter.Value := 0;
				LGroupEnterY.Caption := '0';
				LGroupEnterM.Caption := '0';

				Close;
				SQL.Clear;
				SQL.Add('SELECT'
						+ '  GroupEnter'
						+ ' FROM'
						+ '  HAPSY'
						+ ' WHERE'
						+ '  EmpNCode = :EmpNCode'
						+ '  AND CorpNCode = :CorpNCode');

				SetFld('EmpNCode').AsFloat	:=	pHapApParam^.GetEmpNCd;
				SetFld('CorpNCode').AsFloat	:=	0;

				if not Open then Abort;

				if not Eof then
				begin
					if GetFld('GroupEnter').AsDateTime <> 0 then
					begin
						dtGroupEnter.AsDateTime := GetFld('GroupEnter').AsDateTime;
						fnGetGroupEnter(dtGroupEnter.AsDateTime);
					end;
				end;
			end;

		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
				MjsMessageBoxEx(Self,'データの読み込みに失敗しました。',sTitle,IconType,BtnType,BtnDef,LogType);
			
			exit;
		end;
	finally
		sTableName.Free;
		sFieldName.Free;
		Query.Free;
	end;
end;
//**********************************************************************
//		Proccess	:ﾌｫｰﾑ使用可/不可 切替
//		Parameter	:bEnable	:TRUE/FALSE
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000020CBaseF.fnDetailEnable(bEnable:boolean);
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
		
		//btnTelSearch.Enabled	:=	bEnable;	// <20121219>
		
	end;

end;

//**********************************************************************
//		Proccess	:社員入力終了
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000020CBaseF.fnEditEnd;
begin
	if not fnUpDate then					//更新処理
	begin
		HapSendToOwner(HAPAP_ACTID_EXIT_NG, pAppRec, pHapApParam);
		Exit;
	end;
	HapSendToOwner(HAPAP_ACTID_EXIT_OK, pAppRec, pHapApParam);
end;

//**********************************************************************
//		Proccess	:社員更新
//		Parameter	:
//		Return		:TRUE	:更新成功
//					:FALSE	:失敗(値ﾁｪｯｸNG含む)
//		Hoistory	:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000020CBaseF.fnUpdate: boolean;
var
	SYJQuery	:	TMQuery;
	i			:	Integer;
	sField		:	String;
	TComP		:	TCusTomEdit;

	sSQL		:	String;

    //<080213>
	//iLoanCd		:	Integer;
const
	cDateFormat	= 'yyyy/mm/dd';
begin
	Result := False;

	if not fnDataCheck then
	begin
		Exit;
	end;

	SYJQuery := TMQuery.Create( Self );						// MQueryの構築
	MDBModule.SetDBInfoToQuery( ddCopDB, SYJQuery );

	try
		try
			SYJQuery.Close;
			SYJQuery.SQL.Clear();

			SYJQuery.SQL.Add('UPDate HAPSYJ Set');

			for i := 1 to Length(ArrItem) do
			begin
				fnTableGet(ArrItem[i],sField);
				if Trim(sField) = '' then
				begin
					GetMsg(rcMsg,200,1);
					with rcMsg do
						MjsMessageBoxEx(Self,'項目名取得失敗' + IntToStr(ArrItem[i]),sTitle,IconType,BtnType,BtnDef,LogType);
					abort;
				end;
				if Length(SYJQuery.SQL.Text) > 20 then		//<D10-C>
					SYJQuery.SQL.Add(',');
				SYJQuery.SQL.Add(SField + ' = :' + sField);
				TComP := fnPartsGet(ArrItem[i]);
				if TComP is TMNumEdit then
				begin
					if (TComP as TMNumEdit).SelectColCount > 0 then
						if not fnNumCheck(TComp as TMNumEdit) then					// 入力値のチェック
							exit;
					SYJQuery.ParamByName(SField).AsInteger := Trunc((TComP as TMNumEdit).Value);
				end
				else if TComP is TMTxtEdit then
				begin
					if (TComP as TMTxtEdit).TagStr = '' then
						SYJQuery.ParamByName(SField).AsString := (TComP as TMTxtEdit).Text;
				end;
			end;

			SYJQuery.SQL.Add('Where EmpNCode = :EmpNCd');
			SYJQuery.SQL.Add('AND CorpNCode = :CopNCd');

			SYJQuery.ParamByName('EmpNCd').AsCurrency := pHapApParam^.GetEmpNCd;
			SYJQuery.ParamByName('CopNCd').AsCurrency := 0;

			SYJQuery.ExecSQL(TRUE);

	//郵便番号は基番・枝番別のため別書き込み
			with SYJQuery do
			begin
				sSQL := 'UPDATE HAPSYJ SET'
				+#13#10+'TanYuubinNo1=:hTanNo1,'
				+#13#10+'TanYuubinNo2=:hTanNo2,'
				+#13#10+'UpdTantoNCode=:hTantoNCd'
				+#13#10+'WHERE EmpNCode=:hEmpNCd'
				+#13#10+'AND CorpNCode=:hCopNCd';

				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				SetFld('hTanNo1').AsString		:=	ETanYuubinA.Text;
				SetFld('hTanNo2').AsString		:=	ETanYuubinB.Text;
//2005-08-18
				SetFld('hTantoNCd').AsFloat		:=	rcCOMMONAREA(pAppRec^.m_pCommonArea^).TantoNCD;

				SetFld('hEmpNCd').AsFloat		:=	pHapApParam^.GetEmpNCd;
				SetFld('hCopNCd').AsFloat		:=	0;

				if ETanYuubinA.Text = '' then	SetFld('hTanNo1').Clear;
				if ETanYuubinB.Text = '' then	SetFld('hTanNo2').Clear;

				if not ExecSQL then
					Abort;

				Close;
				SQL.Clear;
				SQL.Add('UPDATE HAPSY SET'
						+ ' GroupEnter = :GroupEnter'
						+ ' WHERE'
						+ ' EmpNCode = :hEmpNCd'
						+ ' AND CorpNCode = :hCopNCd');

				SetFld('GroupEnter').AsDateTime	:=	dtGroupEnter.AsDateTime;
				SetFld('hEmpNCd').AsFloat		:=	pHapApParam^.GetEmpNCd;
				SetFld('hCopNCd').AsFloat		:=	0;

				if dtGroupEnter.Text = '' then	SetFld('GroupEnter').Clear;

				if not ExecSQL then Abort;

				//<080213> 出向情報は表示のみ
				//2005-10-19
				//出向情報更新
				{if (ELoan.Value = 0)				//出向なし
				and(gbNowLoan = True) then			//読込時存在していた
				begin
					//出向取消
					sSQL	:=	'DELETE FROM HAPSLN'
						+#13#10+'WHERE CompSt=1'			//開始済
						+#13#10+'AND CompEd=0'				//未終了
						+#13#10+'AND EmpNCode=:hEmpNCd'
						+#13#10+'AND CorpNCode=:hCopNCd';

					Close;
					SQL.Clear;
					SQL.Add(sSQL);

					SetFld('hEmpNCd').AsFloat	:=	pHapApParam^.GetEmpNCd;
					SetFld('hCopNCd').AsFloat	:=	0;

					if not ExecSQL then
						Abort;
				end
				else if((ELoan.Value = 1)			//出向あり
				and		(gbNowLoan = False)) then	//読込時存在していなかった
				begin
					//新規出向開始
					sSQL	:=	'SELECT MAX(LoanNCode) As LNCd FROM HAPSLN'
						+#13#10+'WHERE EmpNCode=:hEmpNCd'
						+#13#10+'AND CorpNCode=:hCopNCd';

					Close;
					SQL.Clear;
					SQL.Add(sSQL);

					SetFld('hEmpNCd').AsFloat	:=	pHapApParam^.GetEmpNCd;
					SetFld('hCopNCd').AsFloat	:=	0;

					if not Open then
						Abort;

					if Eof then
						Abort;

					iLoanCd := GetFld('LNCd').AsInteger;

					sSQL	:=	'INSERT INTO HAPSLN '
						+#13#10+'(CorpNCode,EmpNCode,LoanNCode,CompSt,LoanDateSt,LoanCorpName)'
						+#13#10+'VALUES'
						+#13#10+'(:hCopNCd,:hEmpNCd,:hLoanNCd,1,:hLDateSt,:hLCopName)';

					Close;
					SQL.Clear;
					SQL.Add(sSQL);

					SetFld('hEmpNCd').AsFloat		:=	pHapApParam^.GetEmpNCd;
					SetFld('hCopNCd').AsFloat		:=	0;
					SetFld('hLoanNCd').AsInteger	:=	iLoanCd+1;
					SetFld('hLDateSt').AsDateTime	:=	ELoanDateSt.AsDateTime;
                    					SetFld('hLCopName').AsString	:=	ELoanName.Text;

					if not ExecSQL then
						Abort;

				end
				else if ((ELoan.Value = 1)			//出向あり
				and		(gbNowLoan = True)) then	//読込時に存在していた
				begin
					sSQL :=	'UPDATE HAPSLN SET'
					+#13#10+' LoanDateSt=:hLDateSt'
					+#13#10+',LoanCorpName=:hLCopName';

					if ECLoanEd.Checked = True then			//終了チェックＯＮ
					begin
						sSQL := sSQL
						+#13#10+',CompEd=1'
						+#13#10+',LoanDateEd=:hLDateEd'
					end;

					sSQL :=	sSQL
					+#13#10+'WHERE EmpNCode=:hEmpNCd'
					+#13#10+'AND CorpNCode=:hCopNCd'
					+#13#10+'AND CompSt=1'
					+#13#10+'AND CompEd=0';

					Close;
					SQL.Clear;
					SQL.Add(sSQL);

					SetFld('hEmpNCd').AsFloat		:=	pHapApParam^.GetEmpNCd;
					SetFld('hCopNCd').AsFloat		:=	0;

					SetFld('hLDateSt').AsDateTime	:=	ELoanDateSt.AsDateTime;
					SetFld('hLCopName').AsString	:=	ELoanName.Text;

					if ECLoanEd.Checked = True then			//終了チェックＯＮ
						SetFld('hLDateEd').AsDateTime	:=	ELoanDateEd.AsDateTime;

					if not ExecSQL then
						Abort;
				end;
                }
    		end;
		except
			GetMsg(rcMsg,1,4);
			with rcMsg do
				MjsMessageBoxEx(Self,sMsg,sTitle,IconType,BtnType,BtnDef,LogType);
			Abort;
		end;
	finally
		SYJQuery.Free;
	end;
	Result := TRUE;
end;

//***********************************************************************
//		Proccess	:ﾘｽﾄから該当名称をセット
//		Paremeter	:
//		Return		:0:リストなし　１；リスト有り
//		History		:
//					:
//***********************************************************************
function THAP000020CBaseF.fnSetListItem(MEdit: TMNumEdit; iItemNo: Integer): Boolean;
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

	MDBModule.SetDBInfoTOQuery(ddCopDB,DMQuery);
	MEdit.SelectItems.Clear;
	try
		try
			with DMQuery do
			begin
				Close();
				SQL.Clear();
				SQL.Add( 'SELECT '		);
				SQL.Add( 'MN.KubunNo, '	);
				SQL.Add( 'MN.KubunName ');
				SQL.Add( 'From HAPMN MN,HAPKM KM'	);
				SQL.Add( 'Where KM.ItemNo=:pItemNo'	);
				SQL.Add( 'And KM.KubunNo = MN.ItemNo');
				SQL.Add( 'Order By MN.KubunNo');

				ParamByName('pItemNo').AsInteger:=iItemNo;
				Open(True);
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
procedure THAP000020CBaseF.fnSetProperty(iKbn: integer; eEdit: TMNumEdit);
var
	lLabel	:	TMLabel;
Const
	ENABLE = 0;
	NOT_ENABLE = 1;
	NO_DATA = 2;
begin
	lLabel := TMLabel(MJSFINDCtrl(Self,'L' + eEdit.Name));
	Case iKbn of
		ENABLE:	//使用可
		begin
			eEdit.Color:=clWindow;
			eEdit.ParentColor:=False;
			eEdit.Enabled:=True;
			if eEdit.TagStr ='0' then
			begin
				eEdit.Zero   :=True;
			end;
		end;
		NOT_ENABLE:	//使用不可＆データあり
		begin
			eEdit.ParentColor:=True;
			eEdit.Enabled:=True;		//←Panelを使用不可とする
			if eEdit.TagStr ='0' then
			begin
				eEdit.Zero   :=True;
			end;
		end;
		NO_DATA:	//使用不可＆データなし
		begin
			eEdit.ParentColor:=True;
			eEdit.Enabled:=False;
			eEdit.Value  :=0;
			eEdit.Zero   :=False;
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
Function THAP000020CBaseF.fnFocusGET(iPara : Integer) : TWinControl;
begin                     
	Result := nil;

	//最後から順に探索
	if ELoanDateSt.Visible then
	begin
		Result := ELoanDateSt;
	end;

	if dtGroupEnter.Enabled then
	begin
		Result := dtGroupEnter;
	end;

	if ETanTelNo.Enabled then
	begin
		Result := ETanTelNo;
	end;

	if ETansin.Enabled then
	begin
		Result := ETansin;
	end;
end;

//**************************************************************************
//	Proccess	:	数値型の入力値判定
//
//
//**************************************************************************
Function THAP000020CBaseF.fnNumCheck(Edit : TMNumEdit) : Boolean;
var
	sWk	:	String;
	Lbl	:	TMLabel;
begin
	Result := FALSE;
	sWk := fnGetList(Edit);
	Lbl := TMLabel(MJSFindCtrl(Self,'L' + Edit.Name));
	Lbl.Caption := sWk;

	if sWk <> '' then
	begin
		Result := TRUE;
	end
	else
	begin
		if Edit.Value = 0 then
			Result := TRUE;
	end;
	if not result then
		MjsSetFocus(Self, Edit.Name);							//マウスによるクリック回避
end;

//***********************************************************************
//		Proccess	:ﾘｽﾄから該当名称を取得
//		Paremeter	:
//		Return		:
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//***********************************************************************
function THAP000020CBaseF.fnGetList(MEdit:TMNumEdit):string;
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
//	Proccess  	:  	テーブルGet
//	Parameter  	:	iCode	:	コード
//	Retrun	  	:	なし
//	History	　	:
//**************************************************************************
Function THAP000020CBaseF.fnTableGet(iCode : INteger; SList,FList : Pointer) : String;
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
				Close();
				SQL.Clear();
				SQL.Add('Select FieldName,TableName From HAPKM'	);
				SQL.Add('Where ItemNo = :ItemNo'				);

				ParamByName('ItemNo').AsInteger := iCode;

				Open();

				if not Eof then
				begin
					STName := GetFld('TableName').AsString;
					SFName := GetFld('FieldName').AsString;
					Result := STName + '.' + SFName + ' as ' + SFName;

					if STList.IndexOf(STName) = -1 then
					begin
                    	STList.Add(STName);
                    end;
					if FDList.IndexOf(SFName) = -1 then
					begin
                    	FDList.Add(SFName);
                    end;

			//郵便番号の基番→枝番読込
					if iCode = 146100 then	//緊急連絡先
					begin
						STName := 'HAPSYJ';
						SFName := 'RenYuubinNo2'
					end
					else if iCode = 147900 then	//単身赴任情報
					begin
						STName := 'HAPSYJ';
						SFName := 'TanYuubinNo2'
					end
					else if iCode = 146900 then	//保証人１
					begin
						STName := 'HAPSYJ';
						SFName := 'HosYuubinNo12'
					end
					else if iCode = 147500 then	//保証人２
					begin
						STName := 'HAPSYJ';
						SFName := 'HosYuubinNo22'
					end
					else
						Exit;

					Result := Result + ',' +STName + '.' + SFName + ' as ' + SFName;

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
//	Proccess  	:  	テーブルGet
//	Parameter  	:	iCode	:	コード
//	Retrun	  	:	なし
//	History	　	:
//**************************************************************************
Function THAP000020CBaseF.fnTableGet(iCode : INteger; var SFName : String) : Integer;
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
				Close();
				SQL.Clear();
				SQL.Add('Select FieldName,TableName From HAPKM'	);
				SQL.Add('Where ItemNo = :ItemNo'				);

				ParamByName('ItemNo').AsInteger := iCode;

				Open();
				if Not Eof then
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
//	Proccess  	:  	コンポーネント取得
//	Parameter  	:	iCode	:	コード
//	Retrun	  	:	なし
//	History	　	:
//**************************************************************************
Function THAP000020CBaseF.fnPartsGet(iCode : INteger) : TCustomEdit;
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

//**************************************************************************
//	Proccess  	:  	郵便番号KeyPress
//	Parameter  	:
//	Retrun	  	:	なし
//	History	　	:
//**************************************************************************
procedure THAP000020CBaseF.EYuubinAKeyPress(Sender: TObject;
  var Key: Char);
begin
	//数値のみ
	if not (CharInSet(Key, ['0'..'9']) or (Key = Chr(VK_BACK))) then	//<D10-C>
		Key := #0;
end;

//**************************************************************************
//	Proccess  	:  	郵便番号検索
//	Parameter  	:
//	Retrun	  	:	なし
//	History	　	:
//**************************************************************************
procedure THAP000020CBaseF.EYuubinAArrowClick(Sender: TObject);
var
	sMail,sAdr1,sAdr2,s1,s2:string;
	rtn:word;
	iExpRtn:integer;
    EYuubinNoA,
    EYuubinNoB,
	EAddress1,
	EAddress2,EAdr	:	TMTxtEdit;
begin
	if not BYExpCall then
		Exit;

	fnYubinPartsGet((Sender as TMTxtEdit).Tag,
    				EYuubinNoA,
				    EYuubinNoB,
					EAddress1,
					EAddress2);

	sMail := EYuubinNoA.Text + '-' + EYuubinNoB.Text ;
	fnYubinNoCheck(sMail);

	iExpRtn:=fnCMNPostShow(sMail,sAdr1,sAdr2,0);								//郵便Exp

	if iExpRtn<>1 then															//ｷｬﾝｾﾙ
		Exit;

	EYuubinNoA.Text := Copy(sMail,1,3);
	EYuubinNoB.Text := Copy(sMail,5,4);
																				//郵便番号

	if(Length(Trim(EAddress1.Text))>0)or										//入力済
		(Length(Trim(EAddress2.Text))>0)then
	begin
		rtn:= MjsMessageBoxEx(Self,'住所を上書きしてもよろしいですか？', '確認', mjQuestion, mjYesNo, mjDefNo);
		if rtn<>mrYes then
			Exit;
	end;

	//ﾏｽﾀ長超?
	if MjsHanLength(sAdr1)>40 then	//<D10-U> Length→MjsHanLength
	begin
		if not HapSepStr(sAdr1,40,s1,s2)then
			Exit;

			sAdr1:=s1;
		sAdr2:=s2+sAdr2;
	end;
	//ﾏｽﾀ長超?
	if MjsHanLength(sAdr2)>40 then	//<D10-U> Length→MjsHanLength
	begin
		if not HapSepStr(sAdr2,40,s1,s2)then
			Exit;

		sAdr2:=s1;
	end;

	EAddress1.Text:=sAdr1;
	EAddress2.Text:=sAdr2;

	if Length(Trim(sAdr2))>0 then
		EAdr:=EAddress2
	else
		EAdr:=EAddress1;

{
	if Length(Trim(sAdr1))>0 then												//中身あり?
		EAddress1.Text:=sAdr1;
	if Length(Trim(sAdr2))>0 then												//中身なし
		EAddress2.Text:=sAdr2;
}

//住所変換直後はｷｬﾚｯﾄを住所最終へ
	EAdr.AutoSelect:=False;
	EAdr.SelStart:=Length(EAddress1.Text);

	MjsSetFocus(Self,EAdr.Name);
end;

//**********************************************************************
//		Proccess	:画面入力内容チェック
//
//
//**********************************************************************
function THAP000020CBaseF.fnChkYubinData(Sender:TMTxtEdit):Boolean;
begin
	//2001/09/17 ADD 郵便番号編集
	if Sender.Text <> '' then									// 空でない
		Sender.Text := HapEditNum(StrToInt(Sender.Text),'0000',Sender.MaxLength);

	if Sender.Tag <> 0 then										// 郵便番号枝番
	begin
		if ((Sender = ETanYuuBinB) and (ETanYuubinA.Text <> '') and (ETanYuubinB.Text <> '')) then
		begin
			fnGetAddress(Sender.Tag);
		end;
	end;

	Result:=True;
end;

//**********************************************************************
//		Proccess	:住所情報取得
//
//
//**********************************************************************
procedure THAP000020CBaseF.fnGetAddress(iItemNo : Integer);
var
	sMail,sAdr1,sAdr2,s1,s2	:string;
    EYuubinNoA,
    EYuubinNoB,
	EAddress1,
	EAddress2,EAdr	:	TMTxtEdit;
begin

	if not bYExpCall then			//初期ｴﾗｰ
		Exit;						//呼べないので何もしない

	fnYubinPartsGet(iItemNo,
    				EYuubinNoA,
				    EYuubinNoB,
					EAddress1,
					EAddress2);

	if(Length(Trim(EAddress1.Text))>0)or										//入力済
		(Length(Trim(EAddress2.Text))>0)then
		Exit;						//何もしない

	//〒検索Exp選択->郵便番号(住所)確定後は↑のｶﾞｰﾄﾞで抜ける筈
	//2重に変換はされない

	sMail := EYuubinNoA.Text + '-' + EYuubinNoB.Text ;
	fnYubinNoCheck(sMail);

	fnCMNPostGet(smail,sAdr1,sAdr2,0);

	//ﾏｽﾀ長超?
	if MjsHanLength(sAdr1)>40 then	//<D10-U> Length→MjsHanLength
	begin
		if not HapSepStr(sAdr1,40,s1,s2)then
			Exit;

		sAdr1:=s1;
		sAdr2:=s2+sAdr2;
	end;
	//ﾏｽﾀ長超?
	if MjsHanLength(sAdr2)>40 then	//<D10-U> Length→MjsHanLength
	begin
		if not HapSepStr(sAdr2,40,s1,s2)then
			Exit;

		sAdr2:=s1;
	end;

	EAddress1.Text:=sAdr1;
	EAddress2.Text:=sAdr2;

	if Length(Trim(sAdr2))>0 then
		EAdr:=EAddress2
	else
		EAdr:=EAddress1;

//住所変換直後はｷｬﾚｯﾄを住所最終へ
	EAdr.AutoSelect:=False;
	EAdr.SelStart:=Length(EAddress1.Text);
	MjsSetFocus(Self,EAdr.Name);

end;

//**********************************************************************
//		Proccess	:郵便番号用パーツ取得
//
//
//**********************************************************************
procedure THAP000020CBaseF.fnYubinPartsGet(iItemNo : Integer;Var TxtA,TxtB,TxtC,TxtD : TMTxtEdit);
begin
	case iItemNo of
		147900,													//単身赴任先 郵便番号
		148001,													// 〃　住所上段
		146002:													// 〃　住所下段
		begin
			TxtA := ETanYuubinA;
			TxtB := ETanYuubinB;
			TxtC := ETanAddress1;
			TxtD := ETanAddress2;
        end;
		else
		begin
			TxtA := nil;
			TxtB := nil;
			TxtC := nil;
			TxtD := nil;
		end;
	end;
end;

//**********************************************************************
//		Proccess	:郵便番号ﾁｪｯｸ
//		Parameter	:sPNo	:郵便番号(-付き文字列)
//		Return		:0	:空
//					:-1	:NG
//					:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000020CBaseF.fnYubinNoCheck(var sPno: string): Integer;
var
	sAll,sKiban,sEdaban:string;
	iHifenPos:integer;
begin
	if (Trim(sPNo)='') then														//空(ALL SP)
	begin
		sPNo:='';
		Result:=0;
		Exit;
	end;

	sAll:=Trim(sPNo);
	iHifenPos:=Pos('-',sAll);


	if(iHifenPos<>0)and(iHifenPos<>4)then										//"-"なしまたは不正な位置
	begin
		Result:=-1;
		Exit;
	end;


	if iHifenPos=0 then
	begin
		case Length(sAll) of
		3,5,7:
			;																	//何もしない
		else
			begin
				Result:=-1;
				Exit;
			end;
		end;
		sEdaban	:=Copy(sAll,4,4);
	end
	else
	begin
		if Pos('-',Copy(sAll,5,4))<>0 then										//"-"2重
		begin
			Result:=-1;
			Exit;
		end;
		sEdaban	:=Copy(sAll,5,4);
	end;
	case Length(sEdaban) of														//枝番桁数
		0,2,4:
			;																	//何もしない
		else																	//奇数桁NG
		begin
			Result:=-1;
			Exit;
		end;
	end;
	sKiban	:=Copy(sAll,1,3);

	//数値変換可能かでﾁｪｯｸ(NGなら-1が返る)
	if(StrToIntDef(sKiban,-1)=-1)or
		((sEdaban<>'')and(StrToIntDef(sEdaban,-1)=-1))then
	begin
		Result:=-1;																//文字不正
		Exit;
	end;

	sPNo:=sKiban;
	sPNo:=sPNo+'-'+sEdaban;

	Result:=1;
end;

//**********************************************************************
//		Proccess	:郵便番号検索
//
//
//**********************************************************************
procedure THAP000020CBaseF.fnGetPostNo(Txt : TMTxtEdit);
Var
	sMail,sAdr1,sAdr2	:string;
    EYuubinNoA,
    EYuubinNoB,
	EAddress1,
	EAddress2	:	TMTxtEdit;
begin

	fnYubinPartsGet(Txt.Tag,
    				EYuubinNoA,
				    EYuubinNoB,
					EAddress1,
					EAddress2);
	sMail:='';
	sAdr1:=EAddress1.Text;		//取得住所ｾｯﾄ
	sAdr2:=EAddress2.Text;		//取得住所ｾｯﾄ

	fnCMNPostGet(smail,sAdr1,sAdr2,0);
											//住所取得
	if Trim(sMail)<>'' then				//消去されるのはｶﾞｰﾄﾞ
	begin
		EYuubinNoA.Text := Copy(sMail,1,3);
		EYuubinNoB.Text := Copy(sMail,5,4);
	end;
end;

//**********************************************************************
//		Proccess	:Function Bar Click ファンクションクリック
//
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000020CBaseF.fnFBarClick;
begin
	case pHapApParam^.GetFuncNo of
		1:	//Ｆ１：郵便番号検索
		begin
			fnGetPostNo(ACCtrl as TMTxtEdit);
		end;
	end;
end;

//**************************************************************************
//	Proccess  	:  	パーツの使用状況を変更
//	Parameter  	:	なし
//	Retrun	  	:	なし
//	History	　	:	なし
//**************************************************************************
procedure THAP000020CBaseF.fnEnableSet(Num : TMNumEdit);
var
	bFlg	:	Boolean;
	Lbl		:	TMLabel;
	Procedure	fnPartsEnabled(Ctrl : TMNumEdit; bFlag : Boolean = TRUE); OverLOad;
	begin
		with Ctrl do
		begin
			if( bFlag ) and (SelectItems.Count > 0) then
			begin
				Enabled		:= TRUE;
				ParentColor	:= FALSE;
				Color		:= clWindow;
			end
			else
			begin
				Enabled		:= FALSE;
				ParentColor	:= TRUE;
				Value		:= 0;
			end;
   		end;
	end;

	Procedure	fnPartsEnabled(Ctrl : TMTxtEdit; bFlag : Boolean = TRUE); OverLOad;
	begin
		with Ctrl do
		begin
			if bFlag then
			begin
				Enabled		:= TRUE;
				ParentColor	:= FALSE;
				Color		:= clWindow;
			end
			else
			begin
				Enabled		:= FALSE;
				ParentColor	:= TRUE;
				Text		:= '';
			end;
   		end;
	end;

	Procedure	fnPartsEnabled(Ctrl : TMDateEdit; bFlag : Boolean = TRUE); OverLOad;
	begin
		with Ctrl do
		begin
			if bFlag then
			begin
				Enabled		:= TRUE;
				ParentColor	:= FALSE;
				Color		:= clWindow;
			end
			else
			begin
				Enabled		:= FALSE;
				ParentColor	:= TRUE;
				AsDateTime		:= 0;
			end;
   		end;
	end;

   	Procedure	fnPartsEnabled(Ctrl : TMLabel; bFlag : Boolean = TRUE); OverLOad;
	begin
		with Ctrl do
		begin
			if bFlag then
			begin
				Enabled		:= TRUE;
			end
			else
			begin
				Enabled		:= FALSE;
				Caption		:= '';
			end;
   		end;
	end;

   	Procedure	fnPartsEnabled(Ctrl : TMCheckBox; bFlag : Boolean = TRUE); OverLOad;
	begin
		with Ctrl do
		begin
			if bFlag then
			begin
				Enabled		:= TRUE;
			end
			else
			begin
				Checked		:= FALSE;
				Enabled		:= FALSE;
			end;
   		end;
	end;

begin
	Lbl := TMLabel(MJSFindCtrl(Self,'L' + Num.Name));
	if Lbl.Caption = '' then
		bFlg := FALSE
	else
		bFlg := TRUE;

	if m_iKM_ItemUse = 0 then
	begin
		bFlg := False;
		TMLabel(MJSFindCtrl(Self,'L' + Num.Name)).Caption := '';
		fnPartsEnabled(ETansin,bFlg);
	end;

	if Num = ETansin then
	begin
		fnPartsEnabled(ETanYuubinA,bFlg);
		fnPartsEnabled(ETanYuubinB,bFlg);
		fnPartsEnabled(ETanAddress1,bFlg);
		fnPartsEnabled(ETanAddress2,bFlg);
		fnPartsEnabled(ETanTelNo,bFlg);
	end;
   	//<080213> 出向情報は表示のみ
	{end
	else if Num = ELoan then
	begin
		fnPartsEnabled(ELoanName,bFlg);
		fnPartsEnabled(ELoanDateSt,bFlg);

		if bFlg = False then
		begin
			fnPartsEnabled(ECLoanEd,bFlg);
			fnPartsEnabled(ELoanDateEd,bFlg);
		end;
	end;
    }
end;

//<080213> 出向情報は表示のみ
{//**************************************************************************
//	Proccess  	:  	ECLoanEdClick
//	Parameter  	:	なし
//	Retrun	  	:	なし
//	History	　	:	なし
//**************************************************************************
procedure THAP000020CBaseF.ECLoanEdClick(Sender: TObject);
begin
	//出向終了チェックON
	if ECLoanEd.Checked = True then
	begin
		//出向日(至)入力可
		ELoanDateEd.Enabled		:= True;
		ELoanDateEd.ParentColor	:= False;
		ELoanDateEd.Color		:= clWindow;
	end
	else
	begin
		//出向日(至)入力不可
		ELoanDateEd.Value		:= 0;
		ELoanDateEd.Enabled		:= False;
		ELoanDateEd.ParentColor	:= true;
	end;
end;
}

//************************************************************************
//      Component   : ELoanDateSt
//      Event       : OnChange
//      Name        : H.Takaishi (TAKUMI)
//      Date        : 2008/02/28
//      Parameter   :
//      Return      :
//      History     : 9999/99/99    X.Name
//                      XXXXXXXXXXXXXXX
//************************************************************************
procedure THAP000020CBaseF.ELoanDateStChange(Sender: TObject);
begin
	mdLoanNow.RecNo := ELoanDateSt.ItemIndex+1;

	LLoanDate.Caption		:= fnGetFormatDate(mdLoanNowLoanDateSt.AsDateTime);
	LLoanCorpName.Caption	:= mdLoanNowLoanCorpName.AsString;
	LLoanDeptName.Caption	:= mdLoanNowLoanDeptName.AsString;
	LLoanPostName.Caption	:= mdLoanNowLoanPostName.AsString;
	LLoanComment.Caption	:= mdLoanNowLoanComment.AsString;
end;

//**********************************************************************
//      Process     : 和暦・西暦対応日付文字列取得
//      Name        : H.Takaishi (TAKUMI)
//      Date        : 2008/02/28
//      Parameter   :
//      Return      :
//      History     : 9999/99/99    X.Name
//                      XXXXXXXXXXXXXXX
//**********************************************************************
function THAP000020CBaseF.fnGetFormatDate(dDate: TDate): String;
begin
	if giRekiKbn = 0 then // 和暦
	begin
		Result := MjsGetGengou(dDate, MdtCMP_YMD) + FormatDateTime(' ee/mm/dd', dDate);
	end
	else
	begin
		Result := FormatDateTime('yyyy/mm/dd', dDate);
	end;
end;

// <20121219>
//**********************************************************************
//		Proccess	: 氏名分割
//		Name		: 
//		Date		: 
//		Parameter	: sName1: 姓 , sName2: 名
//		Return		: なし
//**********************************************************************
procedure THAP000020CBaseF.fnDivisionName(sBaseName : String ; out sName1,sName2: String);
var
	iHanPos : Integer;
	iZenPos : Integer;
	iLength : Integer;
	iSpace	: Integer;

begin
	iSpace :=	0;

	sBaseName	:=	Trim(sBaseName);	// 空白削除

	iHanPos	:=	Pos(' ',sBaseName);		// 半角スペース位置取得
	iZenPos	:=	Pos('　',sBaseName);	// 全角スペース位置取得
	iLength	:=	Length(sBaseName);		// 文字数取得
	
	// 半角スペースなし
	if	iHanPos = 0	then
	begin
		iSpace	:=	iSpace + 1;
	end;

	// 全角スペースなし
	if	iZenPos = 0	then
	begin
		iSpace	:=	iSpace + 2;
	end;

	// 半角/全角スペースなし
	if	iSpace = 3	then
	begin
		sName1	:=	sBaseName;		// 姓
		sName2	:=	'';				// 名
		Exit;
	end;
	
	// 半角優先
	if	(iHanPos > 0)		and
		((iHanPos < iZenPos)or
		(iSpace = 2))		then
	begin
		sName1	:=	copy(sBaseName,1,iHanPos);
		sName2	:=	copy(sBaseName,iHanPos + 1, (iLength - iHanPos));
		
		Exit;

	end;
	
	// 全角優先
	if	(iZenPos > 0)		and
		((iZenPos < iHanPos)or
		(iSpace = 1))		then
	begin
		sName1	:=	copy(sBaseName,1,iZenPos);
		sName2	:=	copy(sBaseName,iZenPos + 1, (iLength - iZenPos));	//<D10-U> 全角スペース 2バイト→1文字
		
	end;

end;
// <20121219>


// <20121219>
//**********************************************************************
//		Proccess	: 検索結果ｸﾘｱ
//		Name		: 
//		Date		: 
//		Parameter	: pTelInfo
//		Return		: なし
//**********************************************************************
procedure THAP000020CBaseF.fnClearResult(pTelInfo:Pointer);
begin
 	with m_cTelInfo do
 	begin
		sTelNo 		:= '';
		iHoKoKbn	:= 1;					// 法人/個人区分	tdbAttrScCorporation = 0(法人)
											//					tdbAttrScPersonal	 = 1(個人)

		sName1		:= '';					// 名称
		sName1F		:= '';					// ｶﾅ名称
		sName2 		:= '';					// 略称
		sRensou		:= '';					// 連想

		sZip1    	:= '0';					// 郵便番号（前3桁）
		sZip2		:= '0';					// 郵便番号（後4桁）
		sCode1		:= '0';					// 地域ｺｰﾄﾞ（都道府県）
		sCode2    	:= '0';					// 地域ｺｰﾄﾞ（市区町村）

		sAddress1	:= '';					// 住所上段
		sAddress2	:= '';					// 住所下段
		sAddress1F	:= '';					// ｶﾅ住所上段
		sAddress2F	:= '';					// ｶﾅ住所下段
		sGeoN		:= '';					// 
		sGeoE		:= '';					// 
		sUrl		:= '';					// 未使用

		sZip		:= '0';					// 「-」付き郵便番号
		sKen		:= '';					// 都道府県名称			例）東京都
		sCity		:= '';					// 市区町村名称			例）新宿区
		sTown		:= '';					// 町域名称				例）新宿
		sArea		:= '';					// 番地など
		sEtc		:= '';					// ビル名など
		sKenF		:= '';					// 都道府県のｶﾅ名称
		sCityF		:= '';					// 市区町村のｶﾅ名称
		sTownF		:= '';					// 町域のｶﾅ名称
		sAreaF		:= '';					// sAreaと同じ
		sEtcF		:= '';					// sEtcと同じ
	end;

end;
// <20121219>


// <20121219>
//**********************************************************************
//		Proccess	: 電話番号検索ボタン押下
//		Name		:
//		Date		:
//		Parameter	:
//		Return		:
//**********************************************************************
procedure THAP000020CBaseF.btnTelSearchClick(Sender: TObject);
var
	sName1	:	String;
	sName2	:	String;
	bNameKana		:	Boolean;
	bAddressKana	:	Boolean;
begin
	sName1	:=	'';
	sName2	:=	'';
	bNameKana		:=	False;
	bAddressKana	:=	False;
	
	// 氏名フリガナ使用可否区分
	if	ACCtrl.GetParentComponent.Tag in [3,4]	then		// 保証人1,2
	begin
		bNameKana	:=	True;
	end;
	
	// 住所フリガナ使用可否区分
	if	ACCtrl.GetParentComponent.Tag = 1	then			// 緊急連絡先
	begin
		bAddressKana	:=	True;
	end;
	
	try
		
		fnClearResult(@m_cTelInfo);		// 検索結果のクリア

		// 電話番号欄にフォーカスがあった時、入力値が優先
		
		if	ACCtrl = ETanTelNo	then
		begin
			m_cTelInfo.sTelNo := ETanTelNo.Text;		// 単身赴任情報 電話番号
		end;
		
		// 検索結果の取得項目設定
		with m_cColInfo do				// 表示 戻り値
		begin
			Name1_len		:= 40;		// 名称取込可能バイト数
			Name1F_len		:= 40;		// カナ名称取込可能バイト数
			Address1_len	:= 40;		// 住所上段取込可能バイト数
			Address1F_len	:= 40;		// カナ住所上段取込可能バイト数
			Address2_len	:= 40;		// 住所下段取込可能バイト数
			Address2F_len	:= 40;		// カナ住所下段取込可能バイト数

			HoKoKbn_on		:= FALSE;	// 法人/個人区分取込有無
			Name1_on		:= TRUE;	// 名称取込有無
			Name1F_on		:= bNameKana;	// カナ名称取込有無
			Name2_on		:= FALSE;	// 略称取込有無
			Rensou_on		:= FALSE;	// 連想取込有無
			
			Zip_on			:= True;	// 郵便番号取込有無
			Address1_on		:= True;	// 住所上段取込有無
			Address1F_on	:= bAddressKana;	// カナ住所上段取込有無
			Address2_on		:= True;	// 住所下段取込有無
			Address2F_on	:= bAddressKana;	// カナ住所下段取込有無
			
			// URLについては、ﾌｨｰﾙﾄﾞはあるが未使用（非表示）今回はﾃﾞｰﾀ更新対象外
			Url_on			:= FALSE;	// Url取込有無

			Code_on			:= FALSE;	// 地域コード取込有無
			GeoCode_on		:= FALSE;	// 緯度経度取込有無
			Ken_Del			:= FALSE;	// 住所に都道府県を含む
			SaveButton		:= TRUE;	// 条件を保存する
			Reserved1		:= '';		// 予備
			Reserved2		:= '';		// 予備
			Reserved3		:= '';		// 予備
			HoKoKbn_lmt		:= 2;		// 検索範囲（0:法人のみ 1:個人のみ 2:両方)
			HokoInit_104	:= 1;		// 104検索画面の検索範囲を指定（0:法人 1:個人）
			Caption			:= '';		// 電話番号検索画面のタイトルを変更
			Prefix			:= 'HAP';	// システムプリフィックス（APGファイル名の作成など）
		end;

		// 電話番号検索画面 起動
		if m_cTelIF.fnNatLTelShow(pAppRec, @m_cColInfo, @m_cTelInfo) = mrOk then
		begin
		// 戻り値の設定
			
			if	ACCtrl.GetParentComponent.Tag in [1,3,4]	then
			begin
				// 取込可(TRUE)の場合、検索結果を表示する。
				if m_cColInfo.Name1_on		= TRUE then
				begin
					fnDivisionName(MJSCopy(m_cTelInfo.sName1,40),sName1,sName2);
					
					case ACCtrl.GetParentComponent.Tag of
						1:		// 緊急連絡先
						begin
							//EKinName1.Text	:=	sName1;				// 氏名 姓
							//EKinName2.Text	:=	sName2;				// 氏名 名
						end;
						3:		// 保証人1
						begin
							//EHosName11.Text	:=	sName1;
							//EHosName12.Text	:=	sName2;
						end;

						else		// 保証人2
						begin
							//EHosName21.Text	:=	sName1;
							//EHosName22.Text	:=	sName2;
						end;
					end;
				end;
			end;
			
			if	ACCtrl.GetParentComponent.Tag in [3,4]	then
			begin
				if m_cColInfo.Name1F_on		= TRUE then
				begin
					fnDivisionName(MJSCopy(m_cTelInfo.sName1F,40),sName1,sName2);
					
					if	ACCtrl.GetParentComponent.Tag = 3	then
					begin
						//EHosName11Kana.Text	:=	sName1;				// カナ 姓
						//EHosName12Kana.Text	:=	sName2;				// カナ 名
					end;

					if	ACCtrl.GetParentComponent.Tag = 4	then
					begin
						//EHosName21Kana.Text	:=	sName1;
						//EHosName22Kana.Text	:=	sName2;
					end;

				end;
			end;


			if m_cColInfo.Zip_on		= TRUE then
			begin
				case ACCtrl.GetParentComponent.Tag of
					1:
					begin
						//EKinYuubinA.Text	:=m_cTelInfo.sZip1;			// 郵便番号（前3桁）
						//EKinYuubinB.Text	:=m_cTelInfo.sZip2;			// 郵便番号（後4桁）
					end;
					2:
					begin
						ETanYuubinA.Text	:=m_cTelInfo.sZip1;
						ETanYuubinB.Text	:=m_cTelInfo.sZip2;
					end;
					3:
					begin
						//EHoshoYu1A.Text		:=m_cTelInfo.sZip1;
						//EHoshoYu1B.Text		:=m_cTelInfo.sZip2;
					end;
					4:
					begin
						//EHoshoYu2A.Text		:=m_cTelInfo.sZip1;
						//EHoshoYu2B.Text		:=m_cTelInfo.sZip2;
					end;
				end;
			end;
			
			if m_cColInfo.Address1_on	= TRUE then
			begin
				case ACCtrl.GetParentComponent.Tag of
					1:
					begin
						//EKinAddress1.Text	:=MJSCopy(m_cTelInfo.sAddress1,40);				// 住所上段
					end;
					2:
					begin
						ETanAddress1.Text:=MJSCopy(m_cTelInfo.sAddress1,40);
					end;
					3:
					begin
						//EHosAddress1.Text:=MJSCopy(m_cTelInfo.sAddress1,40);
					end;
					4:
					begin
						//EHosAddress3.Text:=MJSCopy(m_cTelInfo.sAddress1,40);
					end;
				end;
				
			end;
			
			if m_cColInfo.Address2_on	= TRUE then
			begin
				case ACCtrl.GetParentComponent.Tag of
					1:
					begin
						//EKinAddress2.Text	:=MJSCopy(m_cTelInfo.sAddress2,40);				// 住所下段
					end;
					2:
					begin
						ETanAddress2.Text	:=MJSCopy(m_cTelInfo.sAddress2,40);
					end;
					3:
					begin
						//EHosAddress2.Text	:=MJSCopy(m_cTelInfo.sAddress2,40);
					end;
					4:
					begin
						//EHosAddress4.Text	:=MJSCopy(m_cTelInfo.sAddress2,40);
					end;
				end;
				
			end;
			
			if	ACCtrl.GetParentComponent.Tag = 1	then
			begin
				if m_cColInfo.Address1F_on	= TRUE then
					//EKinAddress1Kana.Text:=MJSCopy(m_cTelInfo.sAddress1F,40);			// ｶﾅ住所上段

				if m_cColInfo.Address2F_on	= TRUE then
					//EKinAddress2Kana.Text:=MJSCopy(m_cTelInfo.sAddress2F,40);			// ｶﾅ住所下段
			end;
			
			if m_cTelInfo.sTelNo <> '' then
			begin
				case ACCtrl.GetParentComponent.Tag of
					1:
					begin
						//EKinTelNo.Text	:=m_cTelInfo.sTelNo;								// 「-」付き電話番号
					end;
					2:
					begin
						ETanTelNo.Text	:=m_cTelInfo.sTelNo;
					end;
					3:
					begin
						//EHosTelNo.Text	:=m_cTelInfo.sTelNo;
					end;
					4:
					begin
						//EHosTelNo2.Text	:=m_cTelInfo.sTelNo;
					end;
				end;
				
			end;
		end;
			
	finally
		//
		
		fnClearResult(@m_cTelInfo);	// 検索結果のクリア
	end;

end;
// <20121219>

//**********************************************************************
//		Proccess	: グループ入社日からの勤続年数算出
//		Name		:
//		Date		:
//		Parameter	:
//		Return		:
//**********************************************************************
function THAP000020CBaseF.fnGetGroupEnter(dtDate: TDateTime): String;
begin
	Result := '';

	with qry do
	begin
		try
			try
				Close;
				SQL.Clear;
//<RefDay> ↓
				//基準日指定時
				if pHapApParam.GetRefType = 1 then
				begin
					SQL.Add('SELECT GroupEnterStd AS GroupEnter');
					SQL.Add('FROM MP_HAP_HAPSY_STD ('
						+''''+FormatDateTime('yyyy-mm-dd', pHapApParam.GetRefDate) +''')');
					SQL.Add('WHERE EmpNCode = :NCode');

					SetFld('NCode').AsString	:= IntToStr(pHapApParam^.GetEmpNCd);
                end
//<RefDay> ↑
				else
				begin
					SQL.Add('SELECT  MF_HAP_Months(:Birth, MF_HAP_CurEnd(0, :NCode, 0)) AS GroupEnter');

					SetFld('NCode').AsString	:= IntToStr(pHapApParam^.GetEmpNCd);
					SetFld('Birth').AsDateTime	:= dtDate;
                end;

				Open(True);

				if not Eof then
				begin
					//LGroupEnter1.Caption := 'test';
					LGroupEnterY.Caption := Format('%2d', [GetFld('GroupEnter').AsInteger div 12]);
					LGroupEnterM.Caption := Format('%2d', [GetFld('GroupEnter').AsInteger mod 12]);
				end;
				Close;
			except
				on e : Exception do
				begin
					GetMsg(rcMsg, 1, 5);
					with rcMsg do
					begin
						MjsMessageBoxEx(Self, e.Message, sTitle, IconType, BtnType, BtnDef, LogType);
						Abort;
					end;
				end;
			end;
		finally
			Close;
		end;
	end;
end;

//**********************************************************************
//		Proccess	: 入力データチェック
//		Name		:
//		Date		:
//		Parameter	:
//		Return		:
//**********************************************************************
function THAP000020CBaseF.fnDataCheck: Boolean;
begin
	Result := True;

	if (ETansin.Value <> 0) and (LETansin.Caption = '') then
	begin
		Result := False;
		MjsSetFocus(Self, ETansin.Name);
		Exit;
	end;

	if dtGroupEnter.Value <> 0 then
	begin
		if not MjsIntYMDChk(MjsDateToInt8(dtGroupEnter.AsDateTime)) then
		begin
			Result := False;
			GetMsg(rcMsg, 100, 7);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self, sMsg, sTitle, IconType, BtnType, BtnDef, LogType);
			end;
			MjsSetFocus(Self, dtGroupEnter.Name);
			Exit;
		end;
	end;
end;

//<RefDay>↓
//**********************************************************************
//		Proccess	: 基準日指定時の色を変更
//		Name		:
//		Date		:
//		Parameter	:
//		Return		:
//**********************************************************************
procedure THAP000020CBaseF.fnRefColorChange;
begin
    if pHapApParam.GetRefType = 1 then
    begin
		lblGroupEnter1.Color		:= _HAP_CHILDCL_REFCOL_ ;					//勤続
		lblGroupEnter1.Font.Color	:= clWhite;
		Mlabel45.Color				:= _HAP_CHILDCL_REFCOL_ ;					//出向日
		Mlabel45.Font.Color			:= clWhite;
		Mlabel42.Color				:= _HAP_CHILDCL_REFCOL_ ;					//出向会社名
		Mlabel42.Font.Color			:= clWhite;
		Mlabel41.Color				:= _HAP_CHILDCL_REFCOL_ ;					//出向先部署
		Mlabel41.Font.Color			:= clWhite;
		Mlabel43.Color				:= _HAP_CHILDCL_REFCOL_ ;					//出向先肩書き
		Mlabel43.Font.Color			:= clWhite;
		Mlabel44.Color				:= _HAP_CHILDCL_REFCOL_ ;					//出向理由
		Mlabel44.Font.Color			:= clWhite;
    end
	else if pHapApParam.GetRefType = 2 then
	begin
		lblGroupEnter1.Color		:= _HAP_CHILDCL_REFNOW_;
		lblGroupEnter1.Font.Color	:= clWindowText;
		Mlabel45.Color				:= _HAP_CHILDCL_REFNOW_;
		Mlabel45.Font.Color			:= clWindowText;
		Mlabel42.Color				:= _HAP_CHILDCL_REFNOW_ ;
		Mlabel42.Font.Color			:= clWindowText;
		Mlabel41.Color				:= _HAP_CHILDCL_REFNOW_ ;
		Mlabel41.Font.Color			:= clWindowText;
		Mlabel43.Color				:= _HAP_CHILDCL_REFNOW_ ;
		Mlabel43.Font.Color			:= clWindowText;
		Mlabel44.Color				:= _HAP_CHILDCL_REFNOW_ ;
		Mlabel44.Font.Color			:= clWindowText;
    end
	else
	begin
		lblGroupEnter1.ParentColor	:= True;
		lblGroupEnter1.Font.Color	:= clWindowText;
		Mlabel45.ParentColor		:= True;
		Mlabel45.Font.Color			:= clWindowText;
		Mlabel42.ParentColor		:= True;
		Mlabel42.Font.Color			:= clWindowText;
		Mlabel41.ParentColor		:= True;
		Mlabel41.Font.Color			:= clWindowText;
		Mlabel43.ParentColor		:= True;
		Mlabel43.Font.Color			:= clWindowText;
		Mlabel44.ParentColor		:= True;
		Mlabel44.Font.Color			:= clWindowText;
    end;
end;
//<RefDay>↑
end.

