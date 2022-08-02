//**********************************************************************
//		System		:MJSFX
//		Project ID	:HAP000013CBase
//		Project Name:連絡先/保証人
//		Create By	:H.Itahana(Buntechno)
//		Create Date	:2005/06/17
//		Remake Date	:2005/10/19	H.Itahana(Buntechno)
//					:・簡易版出向情報登録を追加
//					:2005/10/31 H.Itahana(BUntechno)
//					:・Application対応
//					:2007/04/18 H.Takaishi(Buntechno)
//					:・フォーカス移動のエラー防止			<2007-04-18>
//					:2008/02/13	T.ABE (TAKUMI)		<080213>
//					:・出向情報の表示を変更
//					:2008/02/28 H.Takaishi (TAKUMI)	<2008-02-28>
//					:・現在出向情報複数化対応
//					:2012/12/19	H.Yamashiro
//					:・【MLX】電話番号検索 追加					<20121219>
//					:・Enterキーが有効にならない問題に対応		<20121219_2>
//					:
//					:2013/07/17	E.Inukai
//					:	・単身赴任/出向を別タブに移動	<130717>
//					:	・緊急連絡先ｶﾅ・携帯番号・更新日を追加
//					:	・身元保証人１・２それぞれに更新日を追加
//					:2013/08/29	E.Inukai
//					:	・ﾌﾘｶﾞﾅ項目のクリア処理追加				<130829>
//					:	・郵便番号検索から取得した住所を分割	<130829-1>
//					: 2014/09/03 Y.Kondo
//					:	拡大率対応						<MLXDSP>
//					:2014/12/10 K.Suzuki
//					:	連絡先ｶﾅの電話番号辞書対応	<20141210>
//					:2017/08/07 Y.Arakawa(TakumiCo.)
//					:	採用管理からの連結時、郵便番号にゼロがセットさせるのを修正	<MLXPlus>
//					:2019/01/24 K.Takahashi(CyberCom)
//					:	新元号対応(Gengou)
//					:2019/04/02 R.Kobayashi(TakumiCo.)
//					:	うるう年の入力がエラーとなる現象を修正	<190402>
//					:2020/01/30 Y.Goto(NTC)
//					:	Delphi10-コンパイル対応	<D10-C>
//					:2020/02/28 Y.Goto(NTC)
//					:	Delphi10-Unicode対応	<D10-U>
//**********************************************************************
unit HAP000013CBaseU;

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
	dxmdaset,
	CMNExpFuncU,
	HAPApIFU,
	HAPMsgU	,
	HAPLibU,
	MJSCOMMON2U,
	MjsKeyDataState,		// <20121219_2>
	MLBplLoaderU;			// <20121219>

type
{$I ActionInterface.inc}
{$I CMNSearchNATLH.inc}				// <20121219>

  THAP000013CBaseF = class(TForm)
	PTool: TMPanel;
	PMain: TMPanel;
	MPanel1: TMPanel;
	MLabel1: TMLabel;
	MLabel5: TMLabel;
	MLabel7: TMLabel;
	MLabel13: TMLabel;
	MLabel8: TMLabel;
	EKinAddress2Kana: TMTxtEdit;
	EKinAddress2: TMTxtEdit;
	EKinAddress1Kana: TMTxtEdit;
	EKinAddress1: TMTxtEdit;
	MPanel2: TMPanel;
	MLabel2: TMLabel;
	MLabel4: TMLabel;
	LEKinKbn: TMLabel;
	EKinName1: TMTxtEdit;
	EKinKbn: TMNumEdit;
	MPanel6: TMPanel;
	MLabel14: TMLabel;
	EKinTelNo: TMTxtEdit;
	MLabel15: TMLabel;
	EKinFaxNo: TMTxtEdit;
	MLabel48: TMLabel;
	MLabel49: TMLabel;
	MPanel3: TMPanel;
	MLabel3: TMLabel;
	MLabel10: TMLabel;
	LEHosKbn1: TMLabel;
	EHosName11: TMTxtEdit;
	EHosKbn1: TMNumEdit;
	MPanel4: TMPanel;
	MLabel12: TMLabel;
	MLabel16: TMLabel;
	MLabel19: TMLabel;
	EHosAddress2: TMTxtEdit;
	EHosAddress1: TMTxtEdit;
	MPanel5: TMPanel;
	MLabel21: TMLabel;
	EHosTelNo: TMTxtEdit;
	MLabel22: TMLabel;
	EHosName11Kana: TMTxtEdit;
	MPanel7: TMPanel;
	MLabel20: TMLabel;
	MLabel23: TMLabel;
	LEHosKbn2: TMLabel;
	MLabel25: TMLabel;
	EHosName21: TMTxtEdit;
	EHosKbn2: TMNumEdit;
	EHosName21Kana: TMTxtEdit;
	MPanel8: TMPanel;
	MLabel26: TMLabel;
	MLabel27: TMLabel;
	MLabel28: TMLabel;
	EHosAddress4: TMTxtEdit;
	EHosAddress3: TMTxtEdit;
	MPanel9: TMPanel;
	MLabel29: TMLabel;
	EHosTelNo2: TMTxtEdit;
	MLabel18: TMLabel;
	MLabel30: TMLabel;
	MLabel17: TMLabel;
	MLabel37: TMLabel;
	MLabel38: TMLabel;
	EKinYuuBinA: TMTxtEdit;
	EKinYuuBinB: TMTxtEdit;
	MLabel39: TMLabel;
	EHoshoYu1A: TMTxtEdit;
	EHoshoYu1B: TMTxtEdit;
	MLabel40: TMLabel;
	EHoshoYu2A: TMTxtEdit;
	EHoshoYu2B: TMTxtEdit;
	MFurigana3: TMFurigana;
	MFurigana4: TMFurigana;
	MFurigana1: TMFurigana;
	MFurigana2: TMFurigana;
	EKinName2: TMTxtEdit;
	EHosName12: TMTxtEdit;
	EHosName22: TMTxtEdit;
	EHosName12Kana: TMTxtEdit;
	EHosName22Kana: TMTxtEdit;
	MFurigana5: TMFurigana;
	MFurigana6: TMFurigana;
	MLabel52: TMLabel;
	btnTelSearch: TMSpeedButton;
	MPanel12: TMPanel;
	MLabel24: TMLabel;
	MPanel13: TMPanel;
	MLabel46: TMLabel;
	MLabel6: TMLabel;
	MLabel9: TMLabel;
	EKinNameKana2: TMTxtEdit;
	EKinNameKana1: TMTxtEdit;
	MLabel31: TMLabel;
	EKinMobileNo: TMTxtEdit;
	MPanel10: TMPanel;
	MLabel32: TMLabel;
	dtKinUpdate: TMDateEdit;
	dtHos1Update: TMDateEdit;
	dtHos2Update: TMDateEdit;
	MFurigana7: TMFurigana;
	MFurigana8: TMFurigana;
	MPanel11: TMPanel;
	MLabel11: TMLabel;
	EHosMobileNo: TMTxtEdit;
	MPanel14: TMPanel;
	MLabel33: TMLabel;
	EHosMobileNo2: TMTxtEdit;
	procedure FormCreate(Sender: TObject);
	procedure EYuubinAKeyPress(Sender: TObject; var Key: Char);
	procedure EYuubinAArrowClick(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
	procedure MFuriganaCompositionStr(Sender: TObject; Value: String);
	procedure MFurigana2CompositionStr(Sender: TObject; Value: String);
	procedure MFurigana3CompositionStr(Sender: TObject; Value: String);
	procedure MFurigana4CompositionStr(Sender: TObject; Value: String);
	procedure MFurigana5CompositionStr(Sender: TObject; Value: String);
	procedure MFurigana6CompositionStr(Sender: TObject; Value: String);
	procedure MFurigana7CompositionStr(Sender: TObject; Value: String);
	procedure MFurigana8CompositionStr(Sender: TObject; Value: String);
	procedure btnTelSearchClick(Sender: TObject);
	procedure InputChange(Sender: TObject);

  private
	{ Private 宣言 }
	pAppRec		:^TMjsAppRecord;												//Menuから受け取るﾊﾟﾗﾒｰﾀのﾎﾟｲﾝﾀ
	pHApApParam	:^THapApParam;													//給与親子間ﾊﾟﾗﾒｰﾀ
	ACCtrl		:TWinControl;													//ﾌｫｰｶｽ復帰
	ddCopDB		:TFDConnection;
	MDBModule	:TMDataModuleF;
	rcMsg		:TMjsMsgRec;
	bYExpCall	:Boolean;														//[TRUE]郵便検索Exp初期処理OK

//2005-10-19
	gbNowLoan	:Boolean;														//現在出向中フラグ
	giRekiKbn	:Integer;

	// <20121219>
	m_cTelIF		: TCMNSearchNATLIF;
	m_cTelInfo		: TCMNTelInfo;							// 入出力ﾊﾟﾗﾒｰﾀ
	m_cColInfo		: TCMNColInfo;							// 表示、戻り値設定
	m_cSrcInfo		: TCMNSrcInfo;							// １０４検索表示、戻り値設定
	// <20121219>

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

	// <20121219>
	procedure fnDivisionName(sBaseName : String ; out sName1,sName2: String);		// 氏名分割
	procedure fnClearResult(pTelInfo:Pointer);										// 電話番号検索結果項目 クリア
	// <20121219>

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
  HAP000013CBaseF: THAP000013CBaseF;

implementation
uses
	MjsCommonU,
	MjsDispCtrl;

const
	ArrItem	:	Array[1..33] of Integer =

//郵便番号は基番・枝番でフィールドが別のため使用しない
	(
	145900,		// 緊急連絡先(姓)
	145901,		// 緊急連絡先(名)
	145910,		// 緊急連絡ｶﾅ(姓)
	145911,		// 緊急連絡ｶﾅ(名)
	146000,		// 緊急連絡先続柄
	146201,		// 緊急連絡先住所上段
	146501,		// 緊急連絡先住所上段かな
	146202,		// 緊急連絡先住所下段
	146502,		// 緊急連絡先住所下段かな
	146300,		// 緊急連絡先電話番号
	146400,		// 緊急連絡先FAX
	146310,		// 緊急連絡先携帯番
	145990,		// 緊急連絡先更新日
	146600,		// 身元保証人1（姓）
	146601,		// 身元保証人1（名）
	146700,		// 身元保証人1（姓）かな
	146701,		// 身元保証人1（名）かな
	146800,		// 身元保証人1続柄
	147001,		// 身元保証人1住所上段
	147002,		// 身元保証人1住所下段
	147100,		// 身元保証人1電話番号
	147110,		// 身元保証人1携帯番号
	146690,		// 身元保証人1更新日
	147200,		// 身元保証人2（姓）
	147201,		// 身元保証人2（名）
	147300,		// 身元保証人2（姓）かな
	147301,		// 身元保証人2（名）かな
	147400,		// 身元保証人2続柄
	147601,		// 身元保証人2住所上段
	147602,		// 身元保証人2住所下段
	147700,		// 身元保証人2電話番号
	147710,		// 身元保証人2携帯番号
	147290		// 身元保証人2更新日
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
{$I CMNSearchNATLB.inc}				// <20121219>

//**********************************************************************
//		AP入口
//**********************************************************************
//**********************************************************************
//		Process		:AppEntry
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function AppEntry(pPar:pointer):integer;
var
	pForm		: ^THAP000013CBaseF;
	pRec		: ^TMjsAppRecord;
	pActionParam: ^THapApParam;
	iAction		: integer;
begin
	Result		:= ACTID_RET_NG;
	pRec		:= Pointer( TAppParam( pPar^ ).pRecord );						// TMjsAppRecord 構造体 pointer 取得
	pActionParam:= Pointer( TAppParam( pPar^ ).pActionParam );					// 送受信ﾊﾟﾗﾒｰﾀ
	iAction		:= TAppParam( pPar^ ).iAction;									// Action ID 取得

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
				pForm^ := THAP000013CBaseF.CreateForm( pRec,pActionParam );

				pRec^.m_pChildForm := pForm;

				if iAction = ACTID_FORMCREATESHOWSTART then
				begin
					pForm^.Show;
					THAP000013CBaseF(pForm^).PTool.Show;	//処理ﾎﾞﾀﾝ[可視]
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
			THAP000013CBaseF(pForm^).PTool.Show;			//処理ﾎﾞﾀﾝ[可視]
		end;

		ACTID_HIDESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );

			if pForm^.Parent <> nil then
			begin
				pForm^.Hide;
				THAP000013CBaseF(pForm^).PTool.Hide;		//処理ﾎﾞﾀﾝ[不可視]
			end;
		end;

		HAPAP_ACTID_SHOWDATA:								//社員内容表示
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000013CBaseF(pForm^).fnDetailSet;
		end;

		HAPAP_ACTID_ENABLE:									//内容部[使用可]
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000013CBaseF(pForm^).fnDetailEnable(True);
		end;

		HAPAP_ACTID_DISABLE:								//内容部[使用不可]
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000013CBaseF(pForm^).fnDetailEnable(False);
		end;

		HAPAP_ACTID_SETFOCUS,			//ﾌｫｰｶｽ復帰
		HAPAP_ACTID_SETFOCUS_FIRST,		//ﾌｫｰｶｽ先頭
		HAPAP_ACTID_SETFOCUS_LAST:		//ﾌｫｰｶｽ最終
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			with THAP000013CBaseF(pForm^) do
			begin
				if iAction=HAPAP_ACTID_SETFOCUS_FIRST then	//先頭
					ACCtrl:=THAP000013CBaseF(pForm^).fnFocusGet(HAPAP_ACTID_SETFOCUS_FIRST);

				if iAction=HAPAP_ACTID_SETFOCUS_LAST then	//最終
				begin
					ACCtrl	:= dtHos2Update;
				end;

				MjsSetFocus(THAP000013CBaseF(pForm^),ACCtrl.Name);
			end;
			HapSendToOwner(HAPAP_ACTID_ENTER_OK,pRec,pActionParam);
		end;

		HAPAP_ACTID_EXIT:				//終了通知
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000013CBaseF(pForm^).fnEditEnd;
		end;

		HAPAP_ACTID_FBARCLICK:			//ﾌｧﾝｸｼｮﾝﾊﾞｰｸﾘｯｸ
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			{ﾌｧﾝｸｼｮﾝNoの取り出しと現在ｺﾝﾎﾟｰﾈﾝﾄにより判定を行う}
			THAP000013CBaseF(pForm^).fnFBarClick;
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
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
constructor THAP000013CBaseF.CreateForm(pRec,pParam:pointer);
var
	pBaseAppRec	: ^TMjsAppRecord;
	PCallForm	: ^TControl;													//2005-10-31
begin
	pAppRec		:=pRec;
	pHapApParam	:=pParam;
	MDBModule	:=TMDataModuleF(pAppRec^.m_pDBModule^);
	ddCopDB		:=pHapApParam^.GetCopDB;

	PCallForm	:= TMjsAppRecord(pAppRec^).m_pOwnerForm;						//2005-10-31

	bYExpCall:=False;

	pBaseAppRec:=pHapApParam^.GetPointer;										// 郵便番号呼出し用に元AppRecordを取得する

	if fnCMNPostInit(pBaseAppRec)=0 then										//郵便Exp初期処理
		BYExpCall:=True;														//OK

	inherited Create(PCallForm^);
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
procedure THAP000013CBaseF.FormCreate(Sender: TObject);
var
	mqMA		: TMQuery;
begin
	mqMA:=TMQuery.Create(Self);

	try
		try
			MDBModule.SetDBInfoTOQuery(ddCopDB,mqMA);

			with mqMA do
			begin
				Close;
				SQL.Clear;
				SQL.Add('SELECT YearKbn FROM DTMAIN');

				if not Open then
					Abort;

				if Eof then
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

	fnFormIni;			//ﾌｫｰﾑ初期処理

	MjsFontResize(THAP000013CBaseF(Self),pointer(pAppRec));
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
procedure THAP000013CBaseF.FormDestroy(Sender: TObject);
begin
	if bYExpCall then															//郵便番号Exp初期処理OK
		fnCmnPostFree;															//郵便番号Exp終了処理

	m_cTelIF.Free;						// 電話番号検索 <20121219>
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
procedure THAP000013CBaseF.CMChildKey(var Msg:TWMKey);
var
	ACtl:TWinControl;
	sShift:TShiftState;
	TCom	:	TWinControl;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	ACtl	:=Screen.ActiveControl;
	sShift	:= MjsKeyDataToShiftState(Msg.KeyData);		// <20121219_2>

	if(ACtl=EKinYuuBinB)or(ACtl=EHoshoYu1B)or(ACtl=EHoshoYu2B)then
	begin
		if((Msg.CharCode=VK_TAB)and(sShift=[ssShift]))then
		begin
			TMTxtEdit(ACtl).OnExit := nil;
			MjsPrevCtrl(Self);
			TMTxtEdit(ACtl).OnExit := fnWCTLExit;
			Msg.CharCode:=0;
			Abort;
		end
		else
		begin
			case (Msg.CharCode)of
				VK_UP,
				VK_LEFT:
				begin
					TMTxtEdit(ACtl).OnExit := nil;
					MjsPrevCtrl(Self);
					TMTxtEdit(ACtl).OnExit := fnWCTLExit;
					Msg.CharCode:=0;
					Abort;
				end;
			end;
		end;
	end;

	// <2008-02-28>
	if ACtl is TMComboBox then
	begin
		if TMComboBox(ACtl).DroppedDown then
		begin
			if Msg.CharCode = VK_TAB then abort;
			exit;
		end;

		if (Msg.CharCode = VK_UP) or (Msg.CharCode = VK_DOWN) then Exit;
	end;

	//TAB
	if ((Msg.CharCode = VK_Return)or((Msg.CharCode = VK_TAB)and(sShift = []))or(Msg.CharCode = VK_DOWN)) then
	begin
// 単身赴任区分が未登録のときは関連項目も使用不可にする
		if (ACtl is TMNumEdit) then
			if (ACtl as TMNumEdit).SelectColCount > 0 then
				fnNumCheck(ACtl as TMNumEdit);				// 入力値のチェック

		if ACtl = dtHos2Update then
		begin
			HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN,pAppRec,pHapApParam);		// 更新ボタンへ
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

		HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN,pAppRec,pHapApParam);			// ボタンへ

		Msg.CharCode:=0;
		Abort;
	end;

	if not(ACtl is TCustomEdit) then						//文字入力除く
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
					else
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
				TCom := fnFocusGET(HAPAP_ACTID_SETFOCUS_FIRST);					// 移動可能な最後の場所を取得
				if ACtl <> TCom then
					MjsPrevCtrl(Self);
				Msg.CharCode	:= 0;
				abort;
			end;

			if MjsChkCurEnd(ACtl) and (Msg.CharCode = VK_RIGHT) and (sShift = []) then
			begin
				//<080213> 最終カーソルでの動作
				if ACtl = dtHos2Update then
				begin
					HapSendToOwner(HAPAP_ACTID_SETFOCUS_BTN,pAppRec,pHapApParam);	// 更新ボタンへ
					Msg.CharCode:=0;
					Abort;
				end
				else
				begin
					MjsNextCtrl(Self);
					Msg.CharCode := 0;
					abort;
				end;
			end;

			{Ｆ１：住所→郵便番号}
			if (ACtl is TMTxtEdit) then
				if(	( ACCtrl = EKinAddress1 )or
					( ACCtrl = EHosAddress1 )or
					( ACCtrl = EHosAddress3 ) )
					and (Msg.CharCode=VK_F1) and (sShift=[]) then
					fnGetPostNo(ACtl as TMTxtEdit);

			Exit;						//入力途中は抜けない
		end;
	end;

	inherited;

end;

//**********************************************************************
//		Process		:ﾌｫｰﾑおよびｺﾝﾎﾟｰﾈﾝﾄ初期化
//		Parameter	:
//		Return		:
//		History		:19/01/24(K.Takahashi(CyberCom))
//					:新元号対応(Gengou)
//**********************************************************************
procedure THAP000013CBaseF.fnFormIni;
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

begin

// <MLXDSP> S
	MjsCompoResize(PTool,0,pointer(pAppRec));
	MjsCompoResize(btnTelSearch,0,pointer(pAppRec));
// <MLXDSP> E

	HapChildFormPropertySet(	THAP000013CBaseF(Self),							//ﾌｫｰﾑ
								PTool,											//処理ﾎﾞﾀﾝ
								PMain,											//内容部
								pAppRec,										//親APから受け取ったMjsAppRecordﾎﾟｲﾝﾀ
								pHapApParam	);									//親APから受け取ったHapApParamﾎﾟｲﾝﾀ


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
	Parent			:= TPanel(pAppRec^.m_pOwnerPanel^);
	BorderStyle		:= bsNone;
	Align			:= alClient;

//表示色変更

	MjsColorChange(	THAP000013CBaseF(Self),
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
//2005-10-19
// <NewEraName-K> DEL Start
//			(Components[i] as TMDateEdit).Gengou:='H';
// <NewEraName-K> DEL End
// <NewEraName-K> ADD Start
			(Components[i] as TMDateEdit).Gengou:=#0;
// <NewEraName-K> ADD End

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
		if Components[i] is TMBitBtn then
		begin
			(Components[i] as TMBitBtn).OnEnter	:=fnWCTLEnter;
			(Components[i] as TMBitBtn).OnExit	:=fnWCTLExit;
		end;
	end;

	// 電話番号検索
	m_cTelIF := TCMNSearchNATLIF.Create(pAppRec);			// ｸﾗｽ生成
	btnTelSearch.Visible := (m_cTelIF.useNAT = 0);			// DLL,辞書ﾁｪｯｸ 有(TRUE)の場合、検索ﾎﾞﾀﾝ表示
	fnClearResult(@m_cTelInfo);								// 検索結果クリア
	m_cSrcInfo.iHoKoKbn := 1;								// 104検索の法人/個人の初期値 個人を対象
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
procedure THAP000013CBaseF.fnWCTLEnter(Sender:TObject);
begin

	if (Sender as TWinControl).ControlCount>0 then
		Exit;

	ACCtrl:=Sender as TWinControl;

	if	( ACCtrl = EKinAddress1 )or
		( ACCtrl = EHosAddress1 )or
		( ACCtrl = EHosAddress3 ) then
		pHapApParam^.SetFuncCaption(arrFunc01)				//F1 住所→郵便番号
	else
		pHapApParam^.SetFuncCaption(arrFuncClear);			//ﾌｧﾝｸｼｮﾝ消去

	HapSendToOwner(HAPAP_ACTID_FBARCAPTION,pAppRec,pHapApParam);

// 振り仮名をふる
// Enterでコントロールをいれないと正しく動作しないときがある？
	if ( ACCtrl = EKinAddress1 ) then
	begin
		with MFurigana1 do
		begin
			Control := EKinAddress1;
			OnCompositionStr := MFuriganaCompositionStr;
		end;
	end
	else if( ACCtrl = EKinAddress2 ) then
	begin
		with MFurigana2 do
		begin
			Control := EKinAddress2;
			OnCompositionStr := MFurigana2CompositionStr;
		end;
	end
	else if( ACCtrl = EHosName11 ) then
	begin
		with MFurigana3 do
		begin
			Control := EHosName11;
			OnCompositionStr := MFurigana3CompositionStr;
		end;
	end
	else if( ACCtrl = EHosName21 ) then
	begin
		with MFurigana4 do
		begin
			Control := EHosName21;
			OnCompositionStr := MFurigana4CompositionStr;
		end;
	end
	else if( ACCtrl = EHosName12 ) then
	begin
		with MFurigana5 do
		begin
			Control := EHosName12;
			OnCompositionStr := MFurigana5CompositionStr;
		end;
	end
	else if( ACCtrl = EHosName22 ) then
	begin
		with MFurigana6 do
		begin
			Control := EHosName22;
			OnCompositionStr := MFurigana6CompositionStr;
		end;
	end
	else if( ACCtrl = EKinName1 ) then
	begin
		with MFurigana5 do
		begin
			Control := EKinName1;
			OnCompositionStr := MFurigana7CompositionStr;
		end;
	end
	else if( ACCtrl = EKinName2 ) then
	begin
		with MFurigana6 do
		begin
			Control := EKinName2;
			OnCompositionStr := MFurigana8CompositionStr;
		end;
	end;

	// 緊急連絡先
	if	(ACCtrl = EKinName1)	or
		(ACCtrl = EKinName2)	or
		(ACCtrl = EKinNameKana1)or
		(ACCtrl = EKinNameKana2)or
		(ACCtrl = EKinYuubinA)	or
		(ACCtrl = EKinYuubinB)	or
		(ACCtrl = EKinAddress1)	or
		(ACCtrl = EKinAddress2)	or
		(ACCtrl = EKinAddress1Kana)	or
		(ACCtrl = EKinAddress2Kana)	or
		(ACCtrl = EKinTelNo)	or
	// 身元保証人
		(ACCtrl = EHosName11)	or
		(ACCtrl = EHosName12)	or
		(ACCtrl = EHosName11Kana)	or
		(ACCtrl = EHosName12Kana)	or
		(ACCtrl = EHoshoYu1A)	or
		(ACCtrl = EHoshoYu1B)	or
		(ACCtrl = EHosAddress1)	or
		(ACCtrl = EHosAddress2)	or
		(ACCtrl = EHosTelNo)	or
	// 身元保証人 2
		(ACCtrl = EHosName21)	or
		(ACCtrl = EHosName22)	or
		(ACCtrl = EHosName21Kana)	or
		(ACCtrl = EHosName22Kana)	or
		(ACCtrl = EHoshoYu2A)	or
		(ACCtrl = EHoshoYu2B)	or
		(ACCtrl = EHosAddress3)	or
		(ACCtrl = EHosAddress4)	or
		(ACCtrl = EHosTelNo2)	then
	begin
		btnTelSearch.Enabled	:=	True;
	end
	else
	begin
		btnTelSearch.Enabled	:=	False;
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
procedure THAP000013CBaseF.fnWCTLExit(Sender:TObject);
var
	dDate	: TDateTime;
begin

//<130829-1>↓
	//（連）住所1のｷｬﾚｯﾄを元に戻す
	if(Sender = EKinAddress1)and(not EKinAddress1.AutoSelect)then
		EKinAddress1.AutoSelect:=True

	//（連）住所2のｷｬﾚｯﾄを元に戻す
	else if(Sender = EKinAddress2)and(not EKinAddress2.AutoSelect)then
		EKinAddress2.AutoSelect:=True

	//（保１）住所1のｷｬﾚｯﾄを元に戻す
	else if(Sender = EHosAddress1)and(not EHosAddress1.AutoSelect)then
		EHosAddress1.AutoSelect:=True

	//（保１）住所2のｷｬﾚｯﾄを元に戻す
	else if(Sender = EHosAddress2)and(not EHosAddress2.AutoSelect)then
		EHosAddress2.AutoSelect:=True

	//（保２）住所1のｷｬﾚｯﾄを元に戻す
	else if(Sender = EHosAddress3)and(not EHosAddress3.AutoSelect)then
		EHosAddress3.AutoSelect:=True

	//（保２）住所2のｷｬﾚｯﾄを元に戻す
	else if(Sender = EHosAddress4)and(not EHosAddress4.AutoSelect)then
		EHosAddress4.AutoSelect:=True;
//<130829-1>↑

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
				Exit;
			end;
		end;
	end
	else if Sender is TMNumEdit then
	begin
		if not HapActiveControlOnForm(Self) then								//ﾌｫｰﾑ自体のﾌｫｰｶｽ消失によるExitｲﾍﾞﾝﾄ
			exit;
		if (Sender as TMNumEdit).SelectColCount > 0 then
			fnNumCheck(Sender as TMNumEdit);									// 入力値のチェック

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
procedure THAP000013CBaseF.fnDetailSet;
var
	Query		: TMQuery;
	i			: Integer;
	sFieldName,
	sTableName	: TStringList;
	sField,
	sWk			: String;
	Lbl			: TMLabel;
	TComP		: TCusTomEdit;
	sSQL		: String;
begin
//2005-10-19
	gbNowLoan := False;


	Query := TMQuery.Create( Self );						// MQueryの構築
	MDBModule.SetDBInfoToQuery( ddCopDB, Query );
	sTableName := TStringList.Create;						// StringListの構築
	sFieldName := TStringList.Create;						// StringListの構築
	sTableName.Clear;
	sFieldName.Clear;
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
						sField := TrimRight(sFieldName[i]);	// スペースを省略
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
					SQl.Add(sSQL);

					SetFld('hEmpNCd').AsFloat	:=	pHapApParam^.GetEmpNCd;
					SetFld('hCopNCd').AsFloat	:=	0;

					if not Open then
						Abort;

					if not Eof then
					begin
					// <MLXPlus> ↓
						if (GetFld('RenYuubinNo1').AsInteger = 0) and (GetFld('RenYuubinNo2').AsInteger = 0) then
						begin
                            EKinYuuBinA.Text := '';
							EKinYuuBinB.Text := '';
						end
						else
						begin
							EKinYuuBinA.Text := MjsEditNum(GetFld('RenYuubinNo1').AsInteger,'0000',3);
							EKinYuuBinB.Text := MjsEditNum(GetFld('RenYuubinNo2').AsInteger,'0000',4);
						end;
						if (GetFld('HosYuubinNo11').AsInteger = 0) and (GetFld('HosYuubinNo12').AsInteger = 0) then
						begin
                            EHoshoYu1A.Text := '';
							EHoshoYu1B.Text := '';
						end
						else
						begin
							EHoshoYu1A.Text := MjsEditNum(GetFld('HosYuubinNo11').AsInteger,'0000',3);
							EHoshoYu1B.Text := MjsEditNum(GetFld('HosYuubinNo12').AsInteger,'0000',4);
						end;
						if (GetFld('HosYuubinNo21').AsInteger = 0) and (GetFld('HosYuubinNo22').AsInteger = 0) then
						begin
                            EHoshoYu2A.Text := '';
							EHoshoYu2B.Text := '';
						end
						else
						begin
							EHoshoYu2A.Text := MjsEditNum(GetFld('HosYuubinNo21').AsInteger,'0000',3);
							EHoshoYu2B.Text := MjsEditNum(GetFld('HosYuubinNo22').AsInteger,'0000',4);
						end;
					// <MLXPlus> ↑
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
procedure THAP000013CBaseF.fnDetailEnable(bEnable:boolean);
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

		btnTelSearch.Enabled	:=	bEnable;				// <20121219>

	end;

end;

//**********************************************************************
//		Proccess	:社員入力終了
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000013CBaseF.fnEditEnd;
begin
	if not fnUpDate then				//更新処理
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
//		Hoistory	:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000013CBaseF.fnUpdate: boolean;
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
	Result := FALSE;

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
						if not fnNumCheck(TComp as TMNumEdit) then				// 入力値のチェック
							exit;
					SYJQuery.ParamByName(SField).AsInteger := Trunc((TComP as TMNumEdit).Value);
				end
				else if TComP is TMTxtEdit then
				begin
					if (TComP as TMTxtEdit).TagStr = '' then
						SYJQuery.ParamByName(SField).AsString := (TComP as TMTxtEdit).Text;
				end
//<130717>↓
				else if TComP is TMDateEdit then
				begin
					if (TComP as TMDateEdit).Value = 0 then
					begin
						SYJQuery.ParamByName(SField).AsString := '';
						SYJQuery.ParamByName(SField).Clear();
					end
					else
					begin
				//<190402>MOD St
				//		if MjsIntYMDChk((TComP as TMDateEdit).Value) then
						if MjsIntYMDChk((TComP as TMDateEdit).AsIntYM) then
				//<190402>MOD Ed
						begin
							SYJQuery.ParamByName(SField).AsDateTime := (TComP as TMDateEdit).AsDateTime;
						end
						else
						begin
							if (TComP as TMDateEdit).CanFocus then
							begin
								(TComP as TMDateEdit).SetFocus();
								Exit;
							end;
						end;
					end;
				end;
//<130717>↑
			end;

			SYJQuery.SQL.Add('Where EmpNCode = :EmpNCd');
			SYJQuery.SQL.Add('AND CorpNCode = :CopNCd');

			SYJQuery.ParamByName('EmpNCd').AsCurrency := pHapApParam^.GetEmpNCd;
			SYJQuery.ParamByName('CopNCd').AsCurrency := 0;

			SYJQuery.ExecSQL(TRUE);

	//郵便番号は基番・枝番別のため別書き込み
			with SYJQuery do
			begin
				sSQl := 'UPDATE HAPSYJ SET'
				+#13#10+'RenYuubinNo1=:hRenNo1,'
				+#13#10+'RenYuubinNo2=:hRenNo2,'
				+#13#10+'HosYuubinNo11=:hHosNo11,'
				+#13#10+'HosYuubinNo12=:hHosNo12,'
				+#13#10+'HosYuubinNo21=:hHosNo21,'
				+#13#10+'HosYuubinNo22=:hHosNo22,'
				+#13#10+'UpdTantoNCode=:hTantoNCd'
				+#13#10+'WHERE EmpNCode=:hEmpNCd'
				+#13#10+'AND CorpNCode=:hCopNCd';

				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				SetFld('hRenNo1').AsString		:= EKinYuuBinA.Text;
				SetFld('hRenNo2').AsString		:= EKinYuuBinB.Text;
				SetFld('hHosNo11').AsString		:= EHoshoYu1A.Text;
				SetFld('hHosNo12').AsString		:= EHoshoYu1B.Text;
				SetFld('hHosNo21').AsString		:= EHoshoYu2A.Text;
				SetFld('hHosNo22').AsString		:= EHoshoYu2B.Text;
				SetFld('hTantoNCd').AsFloat		:= rcCOMMONAREA(pAppRec^.m_pCommonArea^).TantoNCD;

				SetFld('hEmpNCd').AsFloat		:=	pHapApParam^.GetEmpNCd;
				SetFld('hCopNCd').AsFloat		:=	0;

				if EKinYuuBinA.Text = '' then	SetFld('hRenNo1').Clear;
				if EKinYuuBinB.Text = '' then	SetFld('hRenNo2').Clear;
				if EHoshoYu1A.Text = '' then	SetFld('hHosNo11').Clear;
				if EHoshoYu1B.Text = '' then	SetFld('hHosNo12').Clear;
				if EHoshoYu2A.Text = '' then	SetFld('hHosNo21').Clear;
				if EHoshoYu2B.Text = '' then	SetFld('hHosNo22').Clear;

				if not ExecSQL then
					Abort;

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
function THAP000013CBaseF.fnSetListItem(MEdit: TMNumEdit; iItemNo: Integer): Boolean;
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
procedure THAP000013CBaseF.fnSetProperty(iKbn: integer; eEdit: TMNumEdit);
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
Function THAP000013CBaseF.fnFocusGET(iPara : Integer) : TWinControl;
begin
	Result := EKinName1;
end;

//**************************************************************************
//	Proccess	:	数値型の入力値判定
//
//
//**************************************************************************
Function THAP000013CBaseF.fnNumCheck(Edit : TMNumEdit) : Boolean;
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
		MjsSetFocus(Self, Edit.Name);						//マウスによるクリック回避
end;

//***********************************************************************
//		Proccess	:ﾘｽﾄから該当名称を取得
//		Paremeter	:
//		Return		:
//		History		:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//***********************************************************************
function THAP000013CBaseF.fnGetList(MEdit:TMNumEdit):string;
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
Function THAP000013CBaseF.fnTableGet(iCode : INteger; SList,FList : Pointer) : String;
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

	KMQuery := TMQuery.Create(Self);						// MQueryの構築

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
//	Proccess	:	テーブルGet
//	Parameter	:	iCode	:	コード
//	Retrun		:	なし
//	History	　	:
//**************************************************************************
Function THAP000013CBaseF.fnTableGet(iCode : INteger; var SFName : String) : Integer;
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
//	Proccess	:	コンポーネント取得
//	Parameter	:	iCode	:	コード
//	Retrun		:	なし
//	History	　	:
//**************************************************************************
Function THAP000013CBaseF.fnPartsGet(iCode : INteger) : TCustomEdit;
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
//	Proccess	:	郵便番号KeyPress
//	Parameter	:
//	Retrun		:	なし
//	History	　	:
//**************************************************************************
procedure THAP000013CBaseF.EYuubinAKeyPress(Sender: TObject;
  var Key: Char);
begin
	//数値のみ
	if not (CharInSet(Key , ['0'..'9']) or (Key = Chr(VK_BACK))) then	//<D10-C>
		Key := #0;
end;

//**************************************************************************
//	Proccess	:	郵便番号検索
//	Parameter	:
//	Retrun		:	なし
//	History	　	:
//**************************************************************************
procedure THAP000013CBaseF.EYuubinAArrowClick(Sender: TObject);
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

	EAdr:=EAddress1;
	if(Length(Trim(EAddress1.Text))>0)or										//入力済
		(Length(Trim(EAddress2.Text))>0)then
	begin
		rtn:= MjsMessageBoxEx(Self,'住所を上書きしてもよろしいですか？', '確認', mjQuestion, mjYesNo, mjDefNo);
		if rtn<>mrYes then
			Exit;
	end;

//<130829-1>↓
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

//上下段必ず上書≒MICS
//	if Length(Trim(sAdr1))>0 then
		EAddress1.Text:=sAdr1;
//	if Length(Trim(sAdr2))>0 then
		EAddress2.Text:=sAdr2;

	//下段の変換内容ありなら下段へ
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
//<130829-1>↑

//住所変換直後はｷｬﾚｯﾄを住所最終へ
	EAdr.AutoSelect:=False;
	EAdr.SelStart:=Length(EAddress1.Text);

	MjsSetFocus(Self,EAdr.Name);
	//keybd_event(VK_RETURN, 0, 0, 0);											//Enter キーのｴﾐｭﾚｲﾄ
end;

//**********************************************************************
//		Proccess	:画面入力内容チェック
//
//
//**********************************************************************
function THAP000013CBaseF.fnChkYubinData(Sender:TMTxtEdit):Boolean;
begin
	//2001/09/17 ADD 郵便番号編集
	if Sender.Text <> '' then									// 空でない
		Sender.Text := HapEditNum(StrToInt(Sender.Text),'0000',Sender.MaxLength);

	if Sender.Tag <> 0 then										// 郵便番号枝番
	begin
		if ((Sender = EKinYuuBinB) and (EKinYuubinA.Text <> '') and (EKinYuubinB.Text <> ''))
		or ((Sender = EHoshoYu1B) and (EHoshoYu1A.Text <> '') and (EHoshoYu1A.Text <> ''))
		or ((Sender = EHoshoYu2B) and (EHoshoYu2A.Text <> '') and (EHoshoYu2A.Text <> '')) then
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
procedure THAP000013CBaseF.fnGetAddress(iItemNo : Integer);
var
	sMail,sAdr1,sAdr2,
	s1,s2			: string;
	EYuubinNoA,
	EYuubinNoB,
	EAddress1,
	EAddress2,EAdr	: TMTxtEdit;
begin

	if not bYExpCall then				//初期ｴﾗｰ
		Exit;							//呼べないので何もしない

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

//<130829-1>↓
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

//上下段必ず上書≒MICS
//	if Length(Trim(sAdr1))>0 then
		EAddress1.Text:=sAdr1;
//	if Length(Trim(sAdr2))>0 then
		EAddress2.Text:=sAdr2;

	//下段の変換内容ありなら下段へ
	if Length(Trim(sAdr2))>0 then
		EAdr:=EAddress2
	else
		EAdr:=EAddress1;

{									//住所取得
	if Length(Trim(sAdr1))>0 then												//中身あり?
		EAddress1.Text:=sAdr1;
	if Length(Trim(sAdr2))>0 then												//中身なし
		EAddress2.Text:=sAdr2;
}
//<130829-1>↑

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
procedure THAP000013CBaseF.fnYubinPartsGet(iItemNo : Integer;Var TxtA,TxtB,TxtC,TxtD : TMTxtEdit);
begin
	case iItemNo of
		146100,												// 緊急連絡先 郵便番号
		146201,												// 〃　住所上段
		146202:												// 〃　住所下段
		begin
			TxtA := EKinYuuBinA;
			TxtB := EKinYuuBinB;
			TxtC := EKinAddress1;
			TxtD := EKinAddress2;
		end;
		146900,												// 身元保証人1 郵便番号
		147001,												// 〃　住所上段
		147002:												// 〃　住所下段
		begin
			TxtA := EHoshoYu1A;
			TxtB := EHoshoYu1B;
			TxtC := EHosAddress1;
			TxtD := EHosAddress2;
		end;
		147500,												// 身元保証人2 郵便番号
		147601,												// 〃　住所上段
		147602:												// 〃　住所下段
		begin
			TxtA := EHoshoYu2A;
			TxtB := EHoshoYu2B;
			TxtC := EHosAddress3;
			TxtD := EHosAddress4;
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
function THAP000013CBaseF.fnYubinNoCheck(var sPno: string): Integer;
var
	sAll,sKiban,
	sEdaban	: string;
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
procedure THAP000013CBaseF.fnGetPostNo(Txt : TMTxtEdit);
Var
	sMail,
	sAdr1,sAdr2	: string;
	EYuubinNoA,
	EYuubinNoB,
	EAddress1,
	EAddress2	: TMTxtEdit;
begin

	fnYubinPartsGet(Txt.Tag,
					EYuubinNoA,
					EYuubinNoB,
					EAddress1,
					EAddress2);
	sMail:='';
	sAdr1:=EAddress1.Text;				// 取得住所ｾｯﾄ
	sAdr2:=EAddress2.Text;				// 取得住所ｾｯﾄ

	fnCMNPostGet(smail,sAdr1,sAdr2,0);
										// 住所取得
	if Trim(sMail)<>'' then				// 消去されるのはｶﾞｰﾄﾞ
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
procedure THAP000013CBaseF.fnFBarClick;
begin
	case pHapApParam^.GetFuncNo of
		1:	//Ｆ１：郵便番号検索
		begin
			fnGetPostNo(ACCtrl as TMTxtEdit);
		end;
	end;
end;

//**********************************************************************
//		Proccess	:振り仮名1
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000013CBaseF.MFuriganaCompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText : String;
begin
	if MjsHanLength( EKinAddress1Kana.Text ) < 40 then	//<D10-U> Length→MjsHanLength
	begin
		sKanaText := EKinAddress1Kana.Text + Value;
		EKinAddress1Kana.Text := MjsHanCopy( sKanaText , 1 , 40 );	//<D10-U> Copy→MjsHanCopy
	end;
end;

//**********************************************************************
//		Proccess	:振り仮名2
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000013CBaseF.MFurigana2CompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText : String;
begin
	if MjsHanLength( EKinAddress2Kana.Text ) < 40 then	//<D10-U> Length→MjsHanLength
	begin
		sKanaText := EKinAddress2Kana.Text + Value;
		EKinAddress2Kana.Text := MjsHanCopy( sKanaText , 1 , 40 );	//<D10-U> Copy→MjsHanCopy
	end;
end;

//**********************************************************************
//		Proccess	:振り仮名3
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000013CBaseF.MFurigana3CompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText : String;
begin
	if MjsHanLength( EHosName11Kana.Text ) < 20 then	//<D10-U> Length→MjsHanLength
	begin
		sKanaText := EHosName11Kana.Text + Value;
		EHosName11Kana.Text := MjsHanCopy( sKanaText , 1 , 20 );	//<D10-U> Copy→MjsHanCopy
	end;
end;

//**********************************************************************
//		Proccess	:振り仮名4
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000013CBaseF.MFurigana4CompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText : String;
begin
	if MjsHanLength( EHosName21Kana.Text ) < 20 then	//<D10-U> Length→MjsHanLength
	begin
		sKanaText := EHosName21Kana.Text + Value;
		EHosName21Kana.Text := MjsHanCopy( sKanaText , 1 , 20 );	//<D10-U> Copy→MjsHanCopy
	end;
end;

//**********************************************************************
//		Proccess	:振り仮名5
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000013CBaseF.MFurigana5CompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText : String;
begin
	if MjsHanLength( EHosName12Kana.Text ) < 20 then	//<D10-U> Length→MjsHanLength
	begin
		sKanaText := EHosName12Kana.Text + Value;
		EHosName12Kana.Text := MjsHanCopy( sKanaText , 1 , 20 );	//<D10-U> Copy→MjsHanCopy
	end;
end;

//**********************************************************************
//		Proccess	:振り仮名6
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000013CBaseF.MFurigana6CompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText : String;
begin
	if MjsHanLength( EHosName22Kana.Text ) < 20 then	//<D10-U> Length→MjsHanLength
	begin
		sKanaText := EHosName22Kana.Text + Value;
		EHosName22Kana.Text := MjsHanCopy( sKanaText , 1 , 20 );	//<D10-U> Copy→MjsHanCopy
	end;
end;

//**********************************************************************
//		Proccess	:振り仮名7
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000013CBaseF.MFurigana7CompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText : String;
begin
	if MjsHanLength( EKinNameKana1.Text ) < 20 then	//<D10-U> Length→MjsHanLength
	begin
		sKanaText := EKinNameKana1.Text + Value;
		EKinNameKana1.Text := MjsHanCopy( sKanaText , 1 , 20 );	//<D10-U> Copy→MjsHanCopy
	end;
end;

//**********************************************************************
//		Proccess	:振り仮名8
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000013CBaseF.MFurigana8CompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText : String;
begin
	if MjsHanLength( EKinNameKana2.Text ) < 20 then	//<D10-U> Length→MjsHanLength
	begin
		sKanaText := EKinNameKana2.Text + Value;
		EKinNameKana2.Text := MjsHanCopy( sKanaText , 1 , 20 );	//<D10-U> Copy→MjsHanCopy
	end;
end;


//**************************************************************************
//	Proccess	:	パーツの使用状況を変更
//	Parameter	:	なし
//	Retrun		:	なし
//	History	　	:	なし
//**************************************************************************
procedure THAP000013CBaseF.fnEnableSet(Num : TMNumEdit);
var
	bFlg	: Boolean;
	Lbl		: TMLabel;

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
end;

//**********************************************************************
//		Process		: 和暦・西暦対応日付文字列取得
//		Name		: H.Takaishi (TAKUMI)
//		Date		: 2008/02/28
//		Parameter   :
//		Return		:
//		History		: 9999/99/99	X.Name
//					: XXXXXXXXXXXXXXX
//**********************************************************************
function THAP000013CBaseF.fnGetFormatDate(dDate: TDate): String;
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
procedure THAP000013CBaseF.fnDivisionName(sBaseName : String ; out sName1,sName2: String);
var
	iHanPos : Integer;
	iZenPos : Integer;
	iLength : Integer;
	iSpace	: Integer;

begin
	iSpace :=	0;

	sBaseName	:=	Trim(sBaseName);	// 空白削除

	iHanPos	:=	MjsHanPos(' ',sBaseName);		// 半角スペース位置取得	//<D10-U> Pos→MjsHanPos
	iZenPos	:=	MjsHanPos('　',sBaseName);	// 全角スペース位置取得	//<D10-U> Pos→MjsHanPos
	iLength	:=	MjsHanLength(sBaseName);		// 文字数取得	//<D10-U> Length→MjsHanLength

	// 半角スペースなし
	if iHanPos = 0 then
	begin
		iSpace	:=	iSpace + 1;
	end;

	// 全角スペースなし
	if iZenPos = 0 then
	begin
		iSpace	:=	iSpace + 2;
	end;

	// 半角/全角スペースなし
	if iSpace = 3 then
	begin
		sName1	:=	sBaseName;			// 姓
		sName2	:=	'';					// 名
		Exit;
	end;

	// 半角優先
	if	(iHanPos > 0)		and
		((iHanPos < iZenPos)or
		(iSpace = 2))		then
	begin
		sName1	:=	MjsHanCopy(sBaseName,1,iHanPos);	//<D10-U> Copy→MjsHanCopy
		sName2	:=	MjsHanCopy(sBaseName,iHanPos + 1, (iLength - iHanPos));	//<D10-U> Copy→MjsHanCopy

		Exit;

	end;

	// 全角優先
	if	(iZenPos > 0)		and
		((iZenPos < iHanPos)or
		(iSpace = 1))		then
	begin
		sName1	:=	MjsHanCopy(sBaseName,1,iZenPos);	//<D10-U> Copy→MjsHanCopy
		sName2	:=	MjsHanCopy(sBaseName,iZenPos + 2, (iLength - iZenPos));	//<D10-U> Copy→MjsHanCopy
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
procedure THAP000013CBaseF.fnClearResult(pTelInfo:Pointer);
begin
	with m_cTelInfo do
	begin
		sTelNo		:= '';
		iHoKoKbn	:= 1;				// 法人/個人区分	tdbAttrScCorporation = 0(法人)
										//					tdbAttrScPersonal	 = 1(個人)

		sName1		:= '';				// 名称
		sName1F		:= '';				// ｶﾅ名称
		sName2		:= '';				// 略称
		sRensou		:= '';				// 連想

		sZip1		:= '0';				// 郵便番号（前3桁）
		sZip2		:= '0';				// 郵便番号（後4桁）
		sCode1		:= '0';				// 地域ｺｰﾄﾞ（都道府県）
		sCode2		:= '0';				// 地域ｺｰﾄﾞ（市区町村）

		sAddress1	:= '';				// 住所上段
		sAddress2	:= '';				// 住所下段
		sAddress1F	:= '';				// ｶﾅ住所上段
		sAddress2F	:= '';				// ｶﾅ住所下段
		sGeoN		:= '';				// 
		sGeoE		:= '';				// 
		sUrl		:= '';				// 未使用

		sZip		:= '0';				// 「-」付き郵便番号
		sKen		:= '';				// 都道府県名称			例）東京都
		sCity		:= '';				// 市区町村名称			例）新宿区
		sTown		:= '';				// 町域名称				例）新宿
		sArea		:= '';				// 番地など
		sEtc		:= '';				// ビル名など
		sKenF		:= '';				// 都道府県のｶﾅ名称
		sCityF		:= '';				// 市区町村のｶﾅ名称
		sTownF		:= '';				// 町域のｶﾅ名称
		sAreaF		:= '';				// sAreaと同じ
		sEtcF		:= '';				// sEtcと同じ
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
procedure THAP000013CBaseF.btnTelSearchClick(Sender: TObject);
var
	sName1			: String;
	sName2			: String;
	bNameKana		: Boolean;
	bAddressKana	: Boolean;

begin
	sName1		:= '';
	sName2		:= '';
	bNameKana	:= False;
	bAddressKana:= False;

	// 氏名フリガナ使用可否区分
	//<20141210>↓
	//if ACCtrl.GetParentComponent.Tag in [3,4] then			// 保証人1,2
    if ACCtrl.GetParentComponent.Tag in [1,3,4] then
	//<20141210>↑
	begin
		bNameKana	:= True;
	end;

	// 住所フリガナ使用可否区分
	if ACCtrl.GetParentComponent.Tag = 1 then				// 緊急連絡先
	begin
		bAddressKana	:= True;
	end;

	try
		fnClearResult(@m_cTelInfo);		// 検索結果のクリア

		// 電話番号欄にフォーカスがあった時、入力値が優先
		if ACCtrl = EKinTelNo Then
		begin
			m_cTelInfo.sTelNo := EKinTelNo.Text;			// 緊急連絡先 電話番号
		end;

		if ACCtrl = EHosTelNo then
		begin
			m_cTelInfo.sTelNo := EHosTelNo.Text;			// 保証人１ 電話番号
		end;

		if ACCtrl = EHosTelNo2 then
		begin
			m_cTelInfo.sTelNo := EHosTelNo2.Text;			// 保証人２ 電話番号
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

			if ACCtrl.GetParentComponent.Tag in [1,3,4] then
			begin
				// 取込可(TRUE)の場合、検索結果を表示する。
				if m_cColInfo.Name1_on		= TRUE then
				begin
					fnDivisionName(MJSCopy(m_cTelInfo.sName1,40),sName1,sName2);

					case ACCtrl.GetParentComponent.Tag of
						1:				// 緊急連絡先
						begin
							EKinName1.Text	:= sName1;		// 氏名 姓
							EKinName2.Text	:= sName2;		// 氏名 名
						end;
						3:				// 保証人1
						begin
							EHosName11.Text	:= sName1;
							EHosName12.Text	:= sName2;
						end;

						else			// 保証人2
						begin
							EHosName21.Text	:= sName1;
							EHosName22.Text	:= sName2;
						end;
					end;
				end;
			end;

			if ACCtrl.GetParentComponent.Tag in [1,3,4] then	//<20141210>
			begin
				if m_cColInfo.Name1F_on = TRUE then
				begin
					fnDivisionName(MJSCopy(m_cTelInfo.sName1F,40),sName1,sName2);

                    case ACCtrl.GetParentComponent.Tag of	//<20141210>緊急連絡先カナ追加
						1:
						begin
							EKinNameKana1.Text := sName1;
							EKinNameKana2.Text := sName2;
						end;
						3:
						begin
							EHosName11Kana.Text	:= sName1;		// カナ 姓
							EHosName12Kana.Text	:= sName2;		// カナ 名
						end;
						4:
						begin
							EHosName21Kana.Text	:= sName1;
							EHosName22Kana.Text	:= sName2;
						end;
					end;
				end;
			end;

			if m_cColInfo.Zip_on = TRUE then
			begin
				case ACCtrl.GetParentComponent.Tag of
					1:
					begin
						EKinYuubinA.Text	:= m_cTelInfo.sZip1;				// 郵便番号（前3桁）
						EKinYuubinB.Text	:= m_cTelInfo.sZip2;				// 郵便番号（後4桁）
					end;
					3:
					begin
						EHoshoYu1A.Text		:= m_cTelInfo.sZip1;
						EHoshoYu1B.Text		:= m_cTelInfo.sZip2;
					end;
					4:
					begin
						EHoshoYu2A.Text		:= m_cTelInfo.sZip1;
						EHoshoYu2B.Text		:= m_cTelInfo.sZip2;
					end;
				end;
			end;

			if m_cColInfo.Address1_on = TRUE then
			begin
				case ACCtrl.GetParentComponent.Tag of
					1:
					begin
						EKinAddress1.Text	:= MJSCopy(m_cTelInfo.sAddress1,40);	// 住所上段
					end;
					3:
					begin
						EHosAddress1.Text	:= MJSCopy(m_cTelInfo.sAddress1,40);
					end;
					4:
					begin
						EHosAddress3.Text	:= MJSCopy(m_cTelInfo.sAddress1,40);
					end;
				end;

			end;

			if m_cColInfo.Address2_on = TRUE then
			begin
				case ACCtrl.GetParentComponent.Tag of
					1:
					begin
						EKinAddress2.Text	:= MJSCopy(m_cTelInfo.sAddress2,40);	// 住所下段
					end;
					3:
					begin
						EHosAddress2.Text	:= MJSCopy(m_cTelInfo.sAddress2,40);
					end;
					4:
					begin
						EHosAddress4.Text	:= MJSCopy(m_cTelInfo.sAddress2,40);
					end;
				end;

			end;

			if ACCtrl.GetParentComponent.Tag = 1 then
			begin
				if m_cColInfo.Address1F_on = TRUE then
					EKinAddress1Kana.Text	:= MJSCopy(m_cTelInfo.sAddress1F,40);	// ｶﾅ住所上段

				if m_cColInfo.Address2F_on = TRUE then
					EKinAddress2Kana.Text	:= MJSCopy(m_cTelInfo.sAddress2F,40);	// ｶﾅ住所下段
			end;

			if m_cTelInfo.sTelNo <> '' then
			begin
				case ACCtrl.GetParentComponent.Tag of
					1:
					begin
						EKinTelNo.Text	:= m_cTelInfo.sTelNo;					// 「-」付き電話番号
					end;
					3:
					begin
						EHosTelNo.Text	:= m_cTelInfo.sTelNo;
					end;
					4:
					begin
						EHosTelNo2.Text	:= m_cTelInfo.sTelNo;
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

//<130829>↓
//**********************************************************************
//		Proccess	: ﾌﾘｶﾞﾅが自動入力される項目がクリアされたときに
//					: ﾌﾘｶﾞﾅもクリアする
//		Name		:
//		Date		:
//		Parameter	:
//		Return		:
//**********************************************************************
procedure THAP000013CBaseF.InputChange(Sender: TObject);
begin
	if (Sender = EKinName1) then
	begin
		if EKinName1.Text = '' then
		begin
			EKinNameKana1.Text := '';
		end;
	end
	else if (Sender = EKinName2) then
	begin
		if EKinName2.Text = '' then
		begin
			EKinNameKana2.Text := '';
		end;
	end
	else if (Sender = EKinAddress1) then
	begin
		if EKinAddress1.Text = '' then
		begin
			EKinAddress1Kana.Text := '';
		end;
	end
	else if (Sender = EKinAddress2) then
	begin
		if EKinAddress2.Text = '' then
		begin
			EKinAddress2Kana.Text := '';
		end;
	end
	else if (Sender = EHosName11) then
	begin
		if EHosName11.Text = '' then
		begin
			EHosName11Kana.Text := '';
		end;
	end
	else if (Sender = EHosName12) then
	begin
		if EHosName12.Text = '' then
		begin
			EHosName12Kana.Text := '';
		end;
	end
	else if (Sender = EHosName21) then
	begin
		if EHosName21.Text = '' then
		begin
			EHosName21Kana.Text := '';
		end;
	end
	else if (Sender = EHosName22) then
	begin
		if EHosName22.Text = '' then
		begin
			EHosName22Kana.Text := '';
		end;
	end;
end;
//<130829>↑

end.

