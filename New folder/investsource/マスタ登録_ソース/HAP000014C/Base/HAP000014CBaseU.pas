//**********************************************************************
//		System		:MJSFX
//		Project ID	:HAP000014CBase
//		Project Name:社員ﾒﾓ
//		Create By	:H.Itahana(Buntechno)
//		Create Date	:2005/06/17
//		Remake Date	:2005/10/31 H.Itahana(Buntechno)
//					:・Application対応
//					:2006/09/12 H.Takaishi(Buntechno)
//					:・メモに'"'や'`'を含むとエラーになる場合がある問題に対応	<2006-09-12>
//					:2013/03/25 E.Inukai
//					:エンターキー対応		<130325>
//**********************************************************************
unit HAP000014CBaseU;

interface

uses
  Windows,Messages,SysUtils,Classes,VCL.Graphics,VCL.Controls,VCL.Forms,VCL.Dialogs,
  Buttons,MJSSpeedButton,VCL.ExtCtrls,MJSPanel,ComCtrls,MJSStatusBar,
  MJSEdits,VCL.StdCtrls,MJSLabel,MJSBitBtn,Db,MJSQuery,FireDAC.Comp.Client,
  MjsDBModuleU,HAPMsgU,HAPLibU,CMNExpFuncU,HAPApIFU,
  MJSMemo, ExtDlgs,
//<130325>↓
  MjsKeyDataState;
//<130325>↑

type
{$I ActionInterface.inc}

  TMemoRec=record
	iItemNo	: Integer;
	Memo	: TMMemo;
	LCaption: TMLabel;
  end;

  THAP000021CBaseF = class(TForm)
    PTool: TMPanel;
    PMain: TMPanel;
    MPanel1: TMPanel;
    MMemo1: TMMemo;
    MLabel1: TMLabel;
    MPanel2: TMPanel;
    MLabel2: TMLabel;
    MMemo2: TMMemo;
    MPanel3: TMPanel;
    MLabel3: TMLabel;
    MMemo3: TMMemo;
    MPanel4: TMPanel;
    MLabel4: TMLabel;
    MMemo4: TMMemo;
    MPanel5: TMPanel;
    MLabel5: TMLabel;
    MMemo5: TMMemo;
    MPanel6: TMPanel;
    MLabel6: TMLabel;
    MMemo6: TMMemo;
    MPanel7: TMPanel;
    MLabel7: TMLabel;
    MMemo7: TMMemo;
    MPanel8: TMPanel;
    MLabel8: TMLabel;
    MMemo8: TMMemo;
    MPanel9: TMPanel;
    MLabel9: TMLabel;
    MMemo9: TMMemo;
    MPanel10: TMPanel;
    MLabel10: TMLabel;
    MMemo10: TMMemo;
    MPanel11: TMPanel;
    MLabel11: TMLabel;
    MMemo11: TMMemo;
    MPanel12: TMPanel;
    MLabel12: TMLabel;
    MMemo12: TMMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
	pAppRec		:^TMjsAppRecord;												//Menuから受け取るﾊﾟﾗﾒｰﾀのﾎﾟｲﾝﾀ
	pHapApParam	:^THapApParam;													//給与親子間ﾊﾟﾗﾒｰﾀ
	ACCtrl		:TWinControl;													//ﾌｫｰｶｽ復帰
	ddCopDB		:TFDConnection;
	MDBModule	:TMDataModuleF;
	rcMsg		:TMjsMsgRec;

	arrMemo	:array of TMemoRec;
	TopMemo,
	BtmMemo:TMMemo;

	procedure	fnFormIni;
	procedure	fnWCTLEnter(Sender:TObject);
	procedure	fnWCTLExit(Sender:TObject);
	procedure	fnDetailSet;
	procedure	fnDetailEnable(bEnable:boolean);
	procedure	fnEditEnd;
	function	fnUpdate: boolean;

  // AP独自
	procedure	fnFBarClick;
    { Private 宣言 }
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
  HAP000021CBaseF: THAP000021CBaseF;

implementation
uses
	MjsCommonU,
	MjsDispCtrl;

const
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
	pForm:^THAP000021CBaseF;
	pRec :^TMjsAppRecord;
	pActionParam:^THapApParam;
	iAction:integer;
begin
	Result	:=ACTID_RET_NG;
	pRec 	:= Pointer( TAppParam( pPar^ ).pRecord );							//TMjsAppRecord 構造体 pointer 取得
	pActionParam:= Pointer( TAppParam( pPar^ ).pActionParam );					//送受信ﾊﾟﾗﾒｰﾀ
	iAction := TAppParam( pPar^ ).iAction;										//Action ID 取得

	case iAction of

		ACTID_FORMCREATESTART ,
		ACTID_FORMCREATESHOWSTART :
		begin
			try
				New( pForm );
//				pRec^.m_pChildForm := pForm;									//2005-10-31
			except
				Exit;
			end;

			try
				pForm^ := THAP000021CBaseF.CreateForm( pRec,pActionParam );

				pRec^.m_pChildForm := pForm;									//2005-10-31

				if iAction = ACTID_FORMCREATESHOWSTART then
				begin
					pForm^.Show;
					THAP000021CBaseF(pForm^).PTool.Show;						//処理ﾎﾞﾀﾝ[可視]
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
			THAP000021CBaseF(pForm^).PTool.Show;								//処理ﾎﾞﾀﾝ[可視]
		end;

		ACTID_HIDESTART:
		begin
			pForm := Pointer( pRec^.m_pChildForm );

			if pForm^.Parent <> nil then
			begin
				pForm^.Hide;
				THAP000021CBaseF(pForm^).PTool.Hide;							//処理ﾎﾞﾀﾝ[不可視]
			end;
		end;

		HAPAP_ACTID_SHOWDATA:		//社員内容表示
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000021CBaseF(pForm^).fnDetailSet;
        end;

		HAPAP_ACTID_ENABLE:														//内容部[使用可]
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000021CBaseF(pForm^).fnDetailEnable(True);
		end;

		HAPAP_ACTID_DISABLE:													//内容部[使用不可]
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000021CBaseF(pForm^).fnDetailEnable(False);
		end;

		HAPAP_ACTID_SETFOCUS,			//ﾌｫｰｶｽ復帰
		HAPAP_ACTID_SETFOCUS_FIRST,		//ﾌｫｰｶｽ先頭
		HAPAP_ACTID_SETFOCUS_LAST: 		//ﾌｫｰｶｽ最終
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			with THAP000021CBaseF(pForm^) do
			begin
				if iAction=HAPAP_ACTID_SETFOCUS_FIRST then	//先頭
					ACCtrl:=TopMemo;
				if iAction=HAPAP_ACTID_SETFOCUS_LAST then	//最終
					ACCtrl:=BtmMemo;
				MjsSetFocus(THAP000021CBaseF(pForm^),ACCtrl.Name);
			end;
			HapSendToOwner(HAPAP_ACTID_ENTER_OK,pRec,pActionParam);
		end;

		HAPAP_ACTID_EXIT:								//終了通知
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			THAP000021CBaseF(pForm^).fnEditEnd;
		end;

		HAPAP_ACTID_FBARCLICK:			//ﾌｧﾝｸｼｮﾝﾊﾞｰｸﾘｯｸ
		begin
			pForm := Pointer( pRec^.m_pChildForm );
			{ﾌｧﾝｸｼｮﾝNoの取り出しと現在ｺﾝﾎﾟｰﾈﾝﾄにより判定を行う}
			THAP000021CBaseF(pForm^).fnFBarClick;
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
constructor THAP000021CBaseF.CreateForm(pRec,pParam:pointer);
var
	PCallForm	: ^TControl;													//2005-10-31
begin
	pAppRec		:=pRec;
	pHapApParam	:=pParam;

    PCallForm	:= TMjsAppRecord(pAppRec^).m_pOwnerForm;						//2005-10-31

	MDBModule	:=TMDataModuleF(pAppRec^.m_pDBModule^);
	ddCopDB		:=pHapApParam^.GetCopDB;

//2005-10-31
//	inherited Create(Application);
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
procedure THAP000021CBaseF.FormCreate(Sender: TObject);
begin
	fnFormIni;			//ﾌｫｰﾑ初期処理

	MjsFontResize(THAP000021CBaseF(Self),pointer(pAppRec));

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
procedure THAP000021CBaseF.FormDestroy(Sender: TObject);
begin
//
end;


//**********************************************************************
//		DETAIL	FUNCTION
//**********************************************************************
//**********************************************************************
//		Process		:CMChildKeyﾒｯｾｰｼﾞ取得
//		Parameter	:
//		Return		:
//		History		:
//					:
//**********************************************************************
procedure THAP000021CBaseF.CMChildKey(var Msg:TWMKey);
var
	ACtl:TWinControl;
	sShift:TShiftState;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	ACtl	:=Screen.ActiveControl;
//<130325>↓
	//sShift	:= KeyDataToShiftState(Msg.KeyData);
	sShift	:= MjsKeyDataToShiftState(Msg.KeyData);
//<130325>↑

	if(ACtl is TMMemo)then
	begin
		case(Msg.CharCode)of
			VK_UP:
			begin
				//ｺﾝﾎﾟｰﾈﾝﾄ内先頭にｷｬﾚｯﾄ以外は
				//ｺﾝﾎﾟｰﾈﾝﾄ内移動
				if(not MjsChkCurTop(ACtl))then
					Exit;
			end;
			VK_DOWN:
			begin
				//ｺﾝﾎﾟｰﾈﾝﾄ内最終にｷｬﾚｯﾄ以外は
				//ｺﾝﾎﾟｰﾈﾝﾄ内移動
				if(not MjsChkCurEnd(ACtl))then
					Exit;
			end;
			VK_RETURN:
			begin
				if(sShift=[ssCtrl])then
					Exit;
			end;
		end;
	end;


	//TAB
	if ((Msg.CharCode = VK_Return)or((Msg.CharCode = VK_TAB)and(sShift = []))or(Msg.CharCode = VK_DOWN)) then
	begin
		if ACtl = BtmMemo then					// 最後なら
		begin
			HapSendToOwner(	HAPAP_ACTID_SETFOCUS_BTN,
							pAppRec,
							pHapApParam	);		// 更新ボタンへ
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
		  ((ACtl is TMTxtEdit)or
		   (ACtl is TMMemo)) then
		begin
			if not MjsChkCurEnd(ACtl) then
				Exit;
		end;

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
					if ACtl =TopMemo then
					begin
						HapSendToOwner(HAPAP_ACTID_SETFOCUS_TAB,pAppRec,pHapApParam);
                        														// タブへ
						Msg.CharCode	:= 0;
						Abort;
                    end
				//2005-10-24
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

			Exit;				//入力途中は抜けない
		end;
	end;




		begin
			{NumEditはｷｬﾚｯﾄ位置判定不要}
			if(ACtl is TMMemo)then
			begin
				if(Msg.CharCode = VK_LEFT) and (sShift = []) then
				begin
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

			Exit;				//入力途中は抜けない
		end;


	inherited;

end;

//**********************************************************************
//		Process		:ﾌｫｰﾑおよびｺﾝﾎﾟｰﾈﾝﾄ初期化
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000021CBaseF.fnFormIni;
var
	i,j:integer;
	mqSelect:TMQuery;
	sSQL:string;
begin
	HapChildFormPropertySet(	THAP000021CBaseF(Self),							//ﾌｫｰﾑ
								PTool,											//処理ﾎﾞﾀﾝ
								PMain,											//内容部
								pAppRec,										//親APから受け取ったMjsAppRecordﾎﾟｲﾝﾀ
								pHapApParam	);									//親APから受け取ったHapApParamﾎﾟｲﾝﾀ

//初期設定
	Parent			:=TPanel(pAppRec^.m_pOwnerPanel^);
	BorderStyle		:=bsNone;
	Align			:=alClient;

//表示色変更

	MjsColorChange(	THAP000021CBaseF(Self),
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysColorB,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysColorD,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysBaseColorB,
					rcSYSTEMAREA(pAppRec^.m_pSystemArea^).SysBaseColorD,
					rcCOMMONAREA(pAppRec^.m_pCommonArea^).SysFocusColor
					);

	for i:=0 to ComponentCount-1 do
	begin
		//ｲﾍﾞﾝﾄ割り付け
		if Components[i] is TMBitBtn then
		begin
			(Components[i] as TMBitBtn).OnEnter	:=fnWCTLEnter;
			(Components[i] as TMBitBtn).OnExit	:=fnWCTLExit;
		end;
		if Components[i] is TMMemo then
		begin
			with(Components[i] as TMMemo)do
			begin
				Text	:='';
				OnEnter	:=fnWCTLEnter;
				OnExit	:=fnWCTLExit;
			end;
		end;

		if(Components[i] is TPanel)and
		  (Components[i]<>PTool)then
			with Components[i]as TPanel do
				ParentColor:=TRUE;
	end;


	SetLength(arrMemo,12);
	with arrMemo[0] do
	begin
		Memo	:=MMemo1;
		LCaption:=MLabel1;
	end;
	with arrMemo[1] do
	begin
		Memo	:=MMemo2;
		LCaption:=MLabel2;
	end;
	with arrMemo[2] do
	begin
		Memo	:=MMemo3;
		LCaption:=MLabel3;
	end;
	with arrMemo[3] do
	begin
		Memo	:=MMemo4;
		LCaption:=MLabel4;
	end;
	with arrMemo[4] do
	begin
		Memo	:=MMemo5;
		LCaption:=MLabel5;
	end;
	with arrMemo[5] do
	begin
		Memo	:=MMemo6;
		LCaption:=MLabel6;
	end;
	with arrMemo[6] do
	begin
		Memo	:=MMemo7;
		LCaption:=MLabel7;
	end;
	with arrMemo[7] do
	begin
		Memo	:=MMemo8;
		LCaption:=MLabel8;
	end;
	with arrMemo[8] do
	begin
		Memo	:=MMemo9;
		LCaption:=MLabel9;
	end;
	with arrMemo[9] do
	begin
		Memo	:=MMemo10;
		LCaption:=MLabel10;
	end;
	with arrMemo[10] do
	begin
		Memo	:=MMemo11;
		LCaption:=MLabel11;
	end;
	with arrMemo[11] do
	begin
		Memo	:=MMemo12;
		LCaption:=MLabel12;
	end;

	for i:=0 to Length(arrMemo)-1 do
		with arrMemo[i] do
			iItemNo:=1500*100+(i+1);


	sSQL:=			 'SELECT';
	sSQL:=sSQL+#13#10' ItemNo';
	sSQL:=sSQL+#13#10',ItemName';
	sSQL:=sSQL+#13#10',ItemUse';
	sSQL:=sSQL+#13#10'FROM';
	sSQL:=sSQL+#13#10' HAPKM';
	sSQL:=sSQL+#13#10'WHERE';
	sSQL:=sSQL+#13#10' ItemNo>=150001';
	sSQL:=sSQL+#13#10' AND';
	sSQL:=sSQL+#13#10' ItemNo<=150012';
	sSQL:=sSQL+#13#10'ORDER BY';
	sSQL:=sSQL+#13#10' ItemNo';

	mqSelect:=TMQuery.Create(Self);
	try
		try
			MDBModule.SetDBInfoToQuery(ddCopDB,mqSelect);
			with mqSelect do
			begin
				Close;
				SQL.Clear;
				SQL.Add(sSQL);
				Open(TRUE);
				if IsEmpty then
					Abort;
			end;
		except
			raise Exception.Create('項目名の取得に失敗しました');
		end;

		j:=0;
		for i:=0 to Length(arrMemo)-1 do
		begin
			with arrMemo[i] do
			begin
				with Memo do
				begin
					Text	 	:='';
					MaxLength	:=200;
					ImeMode		:=imHira;
					ScrollBars	:=ssVertical;

					//[Ctrl]+[Enter]で改行
					WantReturns	:=FALSE;

					Parent.Enabled	:=(mqSelect.Locate('ItemNo',iItemNo,[]))and
									  (mqSelect.GetFld('ItemUse').AsInteger=1);

					ParentColor	:=not Parent.Enabled;
					if not ParentColor then
						Color:=clWindow;
				end;
				if(Memo.Parent.Enabled)then
				begin
					if j=0 then
						TopMemo:=Memo;
					BtmMemo:=Memo;
					Inc(j);
				end;

				LCaption.Caption:=mqSelect.GetFld('ItemName').AsString;
			end;
		end;
	finally
		mqSelect.Free;
	end;

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
procedure THAP000021CBaseF.fnWCTLEnter(Sender:TObject);
begin

	if (Sender as TWinControl).ControlCount>0 then
		Exit;

	ACCtrl:=Sender as TWinControl;

	pHapApParam^.SetFuncCaption(arrFuncClear);		//ﾌｧﾝｸｼｮﾝ消去

	HapSendToOwner(HAPAP_ACTID_FBARCAPTION,pAppRec,pHapApParam);

end;

//**********************************************************************
//		Component	:ALL
//		Event		:Enter
//		Proccess	:ﾌｫｰｶｽ消失
//		Name		:T.Aoki
//		Date		:2002/ 02 / 06
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000021CBaseF.fnWCTLExit(Sender:TObject);
begin
//
end;

//**********************************************************************
//		Proccess	:社員内容表示
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000021CBaseF.fnDetailSet;
var
	mqSelect:TMQuery;
	sSQL:string;
	i:Integer;
begin
	mqSelect:= TMQuery.Create( Self );						// MQueryの構築
	try
		MDBModule.SetDBInfoToQuery(ddCopDB,mqSelect);
		try
			sSQL:=			 'SELECT';

			for i:=1 to Length(arrMemo) do
			begin
				if i>1 then
					sSQL:=sSQL+',';
				sSQL:=sSQL+#13#10+Format('Memo%2.2u',[i]);
			end;

			sSQL:=sSQL+#13#10+'FROM';
			sSQL:=sSQL+#13#10+' HAPSYJ';
			sSQL:=sSQL+#13#10+'WHERE';
			sSQL:=sSQL+#13#10+' EmpNCode=';
			sSQL:=sSQL+IntToStr(pHapApParam^.GetEmpNCd);
			sSQL:=sSQL+#13#10+'AND CorpNCode=';
			sSQL:=sSQL+'0';

			with mqSelect do
			begin
				Close;
				SQL.Clear;
				SQL.Add(sSQL);

				if not Open then
					Abort;

				if IsEmpty then
					Exit;

				for i:=1 to Length(arrMemo) do
					with arrMemo[i-1].Memo do
					begin
						SelStart:=0;
						Text	:=GetFld(Format('Memo%2.2u',[i])).AsString;
					end;
			end;
		except
			GetMsg(rcMsg,1,5);
			with rcMsg do
				MjsMessageBoxEx(Self,'データの読み込みに失敗しました。',sTitle,IconType,BtnType,BtnDef,LogType);
		end;
	finally
		mqSelect.Free;
	end;
end;
//**********************************************************************
//		Proccess	:ﾌｫｰﾑ使用可/不可 切替
//		Parameter	:bEnable	:TRUE/FALSE
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000021CBaseF.fnDetailEnable(bEnable:boolean);
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
//		Proccess	:社員入力終了
//		Name		:T.Aoki
//		Date		:2002/ 02 / 06
//		Parameter	:
//		Return		:
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000021CBaseF.fnEditEnd;
begin
	if not fnUpDate then					//更新処理
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
function THAP000021CBaseF.fnUpdate: boolean;
var
	mqUpdate:TMQuery;
	sSQL:string;
	i,j:integer;
begin
	result := FALSE;
	mqUpdate:=TMQuery.Create( Self );						// MQueryの構築
	try
		MDBModule.SetDBInfoToQuery( ddCopDB,mqUpdate);
		try
			sSQL:=			 'UPDATE';
			sSQL:=sSQL+#13#10+' HAPSYJ AS SYJ';
			sSQL:=sSQL+#13#10+'SET';

			j:=0;
			for i:=1 to Length(arrMemo) do
			begin
				if(not arrMemo[i-1].Memo.Parent.Enabled)then
					continue;

				if j>0 then
					sSQL:=sSQL+#13#10',';

				sSQL:=sSQL+#13#10+Format('SYJ.Memo%2.2u=',[i]);
// <2006-09-12> ----- S
//				sSQL:=sSQL+AnsiQuotedStr(arrMemo[i-1].Memo.Text,'''');
				sSQL:=sSQL+Format(':Memo%2.2u',[i]);
// <2006-09-12> ----- E
				Inc(j);
			end;
//2005-08-18
			sSQL:=sSQL+#13#10+',UpdTantoNCode=:hTantoNCd';
			sSQL:=sSQL+#13#10+'WHERE';
			sSQL:=sSQL+#13#10+' SYJ.EmpNCode=';
			sSQL:=sSQL+IntToStr(pHapApParam^.GetEmpNCd);
			sSQL:=sSQL+#13#10+'AND SYJ.CorpNCode=';
			sSQL:=sSQL+'0';

			with mqUpdate do
			begin
				Close;
				SQL.Clear;
				SQL.Add(sSQL);
// <2006-09-12> ----- S
				for i:=1 to Length(arrMemo) do
				begin
					if(not arrMemo[i-1].Memo.Parent.Enabled)then
						continue;

					SetFld(Format('Memo%2.2u',[i])).AsString := arrMemo[i-1].Memo.Text;
				end;
// <2006-09-12> ----- E

//2005-08-18
				SetFld('hTantoNCd').AsFloat	:=	rcCOMMONAREA(pAppRec^.m_pCommonArea^).TantoNCD;

				if not ExecSQL then
					Abort;

			end;
			Result:= TRUE;
		except
			GetMsg(rcMsg,1,4);
			with rcMsg do
				MjsMessageBoxEx(Self,
								sMsg,sTitle,
								IconType,
								BtnType,
								BtnDef,
								LogType	);
			Abort;
		end;
	finally
		mqUpdate.Free;
	end;

end;

//**********************************************************************
//		Proccess	:Function Bar Click ファンクションクリック
//		History		:2000/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure THAP000021CBaseF.fnFBarClick;
begin
//
end;


end.

