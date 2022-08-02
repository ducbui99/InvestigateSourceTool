//******************************************************************************
//		Project Name	:MJSFX
//		Project Memo	:取引先登録(支払情報項目別)－振込先銀行登録
//						 ※社員登録(振込情報)－振込先銀行登録(HAP100100CBank)を元に作成
//		Project ID		:JNTCRP004007Bank
//						:小島(MSI)
//		Create Date		:2010/07/27
//		Remake Date		:
//						:
//						:2007/02/15	Y.Naganuma (MSI)
//							<#001>	支店コードで存在するコードを入力しても支店名等を
//									表示しない不具合修正
//						:2008/02/13 T.Seki (Prime)
//							<#002>	マスタ更新履歴対応
//			            :2009/07/31	Y.Naganuma(MSI)
//							<#003>	COPDBCloseでnil判定を追加
//                      :2010/08/20 小島(MSI)
//                          <#004> 銀行情報登録対応(銀行CDにフォーカスがあるとき、
//                          ESCキー、キャンセルキー押下で画面が閉じない件を修正)
//                      :2011/06/09 小島(MSI)
//                          <#005> 既存の銀行or銀行支店の場合、入力不可となるよう修正
//                      :2013/11/06 T.SATOH(GSOL)
//                          <BDIC> 銀行辞書対応
//                      :2014/08/20 T.SATOH(GSOL)
//                          <SCA> 	同一コード別支店振込先対応
//                      :2020/11/30 R.SANO(NEOTEX)
//                          <#006> 	UNICODE対応不具合修正
//******************************************************************************

unit JNTCRP004007BankU;

interface

uses
	Windows,
	Messages,
	SysUtils,
	Classes,
	VCL.Graphics,
	VCL.Controls,
	VCL.Forms,
	VCL.Dialogs, MJSCommonDialogs,
	Buttons,
	VCL.StdCtrls,
	VCL.ExtCtrls,
	ComCtrls,
	dxmdaset,
	dxGrClms,
	dxTL,
	dxDBGrid,
	dxCntner,
	Db,
	FireDAC.Comp.Client,
	MjsDBModuleU,
	MjsDateCtrl,
	MjsDispCtrl,
	MJSEdits,
	MJSLabel,
	MJSBitBtn,
	MJSQuery,
	MJSPanel,
	MJSCommonU,
    MJSKeyDataState,		// <KDS> ADD
    Inifiles,               // <SCA> ADD
// <BDIC> ADD-STR
    CmnExpFuncExu,
    JNTCommonu,
// <BDIC> ADD-END
    JNTFuncU,       // 2006/01/16 H.Kawato Add
    MasComu,		// 2005/09/01 H.Kawato Add
	MJSMsgStdu,		// 2005/09/01 H.Kawato Add
// 2005/09/01 H.Kawato Del
//	HapApIFU,
//	HAPMsgu;
// 2005/09/01 H.Kawato Del
    FireDAC.stan.Option,
    MjsStrCtrl, FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet;

const
	MJSDB_ENCRIPTKEY = 'MJSKEY';

	// -----<#002> Add-St-----
	C_ST_PROCESS	= 0;						// 設定
	C_ED_PROCESS	= 1;						// 開放
	// -----<#002> Add-Ed-----

type
{$I ActionInterface.inc}

  TBankData = record
	sBankCode		:   String; 												//振込先銀行コード
	sBankName		:   String;													//振込先銀行名称
	sBranchCode		:   String; 												//支店コード
	sBranchName		:   String;													//支店名称
// 2005/09/01 H.Kawato Add Start
	sBankKana		:   String;													//振込先銀行カナ
	sBranchKana		:   String;													//振込先支店カナ
// 2005/09/01 H.Kawato Add End
  end;

  TJNTCRP004007BankF = class(TForm)
	MLabel1: TMLabel;
	MLabel2: TMLabel;
	MLabel3: TMLabel;
	MLabel4: TMLabel;
	MLabel5: TMLabel;
	MLabel6: TMLabel;
	EBranchCode: TMNumEdit;
	EBankCode: TMNumEdit;
	EBankName: TMTxtEdit;
	EBankKana: TMTxtEdit;
	EBranchKana: TMTxtEdit;
	EBranchName: TMTxtEdit;
	BUpdate: TMBitBtn;
	BCancel: TMBitBtn;
	MFBank: TMFurigana;
	MFBranch: TMFurigana;
    SPMsHist: TFDStoredProc;
// <BDIC> MOD-STR
//	constructor CreateForm(cForm:TComponent;p:pointer);
	constructor CreateForm(cForm:TComponent;p, p2:pointer;j:TJNTCommon);
// <BDIC> MOD-END
	procedure BUpdateClick(Sender: TObject);
	procedure BCancelClick(Sender: TObject);
	procedure FormShow(Sender: TObject);
	procedure fnWCTLEnter(Sender:TObject);
	procedure fnWCTLExit(Sender:TObject);
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
	procedure EBankCodeKeyPress(Sender: TObject; var Key: Char);
	procedure MFBankCompositionStr(Sender: TObject; Value: String);
	procedure MFBranchCompositionStr(Sender: TObject; Value: String);
	procedure FormCreate(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
    procedure fnCmnEditBankCodeOnArrowClick(Sender: TObject);
    procedure EBankCodeEnter(Sender: TObject);
    procedure EBankCodeExit(Sender: TObject);
  private
	{ Private 宣言 }
	pMjsRec			: ^TMjsAppRecord;											// AP パラメータ構造体 pointer
// <BDIC> ADD-STR
	pBaseMjsRec     : ^TMjsAppRecord;
    m_cJNTArea      : TJNTCommon;
	m_ACtl	        : TWinControl;
    m_ExpIsOn       : Boolean;
// <BDIC> ADD-END
	MDBModule		: TMDataModuleF;											// DB Module object
	dbCompany		: TFDConnection;												// データＤＢ object
	recCommon		: rcCOMMONAREA;												// 共通メモリ 構造体
// 2005/09/01 H.Kawato Del Start
//	recSystem		: rcSYSTEMAREA;
//	rcMsg			: TMjsMsgRec;												// メッセージ
// 2005/09/01 H.Kawato Del End

    m_cComArea		    : TMASCom;		// 2005/09/01 H.Kawato Add
    m_BeforeBankCode    : String;       // 2006/01/16 H.Kawato Add
    m_BeforeBrchCode	: String;		// <#005> Add

    m_bIsExistSameBra   : Boolean;      // <SCA> ADD

	FBChar			: array[0..255] of char;
	function  fnFBKanaChange(const sBase: string; var sEdit: string; bInp: Boolean): Boolean;
	procedure fnFBCharInit;

	procedure fnFormIni;
	function  fnValueCheck(Sender:TObject):boolean;
	function  fnUpdate:boolean;
	procedure fnDetailSet(sBankCode : String);									// 銀行資料読込/表示

    function  fnGetBranchName(sBankCode, sBranchCode : String): Boolean;        // 2006/01/16 H.Kawato Add  // 振込支店取得表示
    function  GetBankNCode(sBankCode: String): Double;                          // 2006/01/16 H.Kawato Add

	procedure	SessionPractice(iSyori: Integer);	// <#002> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞ呼び出し

    function GetPayCommonValue(sSection, sKey: String): String;                 // <SCA> ADD

  protected
	procedure	CMChildKey( var Msg : TWMKey ); message CM_CHILDKEY;

  public
	{ Public 宣言 }
//	function fnShowInpBank(var BankData : TBankData; bBranch : Boolean ) : Boolean;
procedure fnShowInpBank(var BankData : TBankData; bBranch : Boolean );
  end;

implementation


{$R *.DFM}
//******************************************************************************
//		Function	:fnShowInpBank
//		Memo		:振込先銀行登録ダイアログ生成
//		Parameters	:
//		Return		:
//******************************************************************************
//function TJNTCRP004006BankF.fnShowInpBank(var BankData: TBankData; bBranch: Boolean): Boolean;
procedure TJNTCRP004007BankF.fnShowInpBank(var BankData: TBankData; bBranch: Boolean);
begin
    m_ExpIsOn := False;             // <BDIC> ADD

//支店ｺｰﾄﾞから表示の場合は銀行をﾃﾞﾌｫﾙﾄ表示
	if bBranch = True then
		fnDetailSet(BankData.sBankCode);

	//Result := False;

    BankData.sBankCode :='';        // <BDIC> ADD

	if ShowModal = mrOK then
	begin
		BankData.sBankCode		:=	Trim(EBankCode.Text);
		BankData.sBankName		:=	Trim(EBankName.Text);
		BankData.sBranchCode	:=	Trim(EBranchCode.Text);
		BankData.sBranchName	:=	Trim(EBranchName.Text);
// 2005/09/01 H.Kawato Add Start
        BankData.sBankKana 		:=  Trim(EBankKana.Text);
		BankData.sBranchKana	:=	Trim(EBranchKana.Text);
// 2005/09/01 H.Kawato Add End

// <SCA> ADD-STR
        if m_bIsExistSameBra then
        begin
            // 同一コード支店追加の場合、親で支店を特定できないのでクリアする
    		BankData.sBranchCode	:=	'';
	    	BankData.sBranchName	:=	'';
		    BankData.sBranchKana	:=	'';
        end;
// <SCA> ADD-END
		//Result := True;
	end;
end;

//************************************************************************
//	function	:	CMChildkey
//	Memo		:	キー移動
//	Parameters	:	Msg		=	TWMKey object
//	Retrun		:
//************************************************************************
procedure TJNTCRP004007BankF.CMChildKey(var Msg: TWMKey);
var
	sShift	: TShiftState;
	ACtl	: TWinControl;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	sShift	:= MJSKeyDataToShiftState(Msg.KeyData);		// <KDS> MOD
	ACtl	:= Screen.ActiveControl;

	{*** ボタン ***}
	if ACtl is TMBitBtn then
	begin
		if (Msg.CharCode = VK_TAB) and (sShift = []) then
		begin
			MjsNextCtrl(Self);
			Abort;
		end;

		if (Msg.CharCode = VK_TAB) and (sShift = [ssShift]) then
		begin
			MjsPrevCtrl(Self);
			Abort;
		end;

		case Msg.CharCode of
			VK_RIGHT, VK_DOWN:
				if sShift = [] then
				begin
					MjsNextCtrl(Self);
					Abort;
				end;

			VK_LEFT, VK_UP:
				if sShift = [] then
				begin
					MjsPrevCtrl(Self);
					Abort;
				end;
		end;

		Exit;
	end;

	{*** END / ESC ***}
	// <#004> Mod start
	//if(Msg.CharCode=VK_ESCAPE)or          
	//	(Msg.CharCode=VK_END)then
    if (Msg.CharCode=VK_END)then
    // <#004> Mod end
	begin
		if(Msg.CharCode=VK_END)and
			(ACtl is TMTxtEdit) then
		begin
			if not MjsChkCurEnd(ACtl) then
			begin
				Exit;
			end;
		end;

		MjsSetFocus(Self,BUpdate.Name);
		Msg.CharCode:=0;
		Abort;
	end;

// <#005> Add start 一旦「Static = False」にする(CMChildKeyの後にfnWCTLExitが呼ばれるため)
	if ((Msg.CharCode = VK_TAB) or (Msg.CharCode = VK_RETURN) or (Msg.CharCode = VK_RIGHT) or (Msg.CharCode = VK_DOWN)) and (sShift = []) then
    begin
    	if(ACtl.Name = EBankCode.Name) then
        begin
        	if(m_BeforeBankCode <> EBankCode.Text) then
            begin
                EBankName.Static	:= False;
                EBankKana.Static	:= False;
            end;
        end
    	else if(ACtl.Name = EBranchCode.Name) then
        begin
        	if(m_BeforeBrchCode <> EBranchCode.Text) then
            begin
                EBranchName.Static		:= False;
                EBranchKana.Static		:= False;
            end;
        end;
    end;
// <#005> Add end

	{*** TAB / Enter (Grid以外)***}
	if ((Msg.CharCode = VK_TAB) or (Msg.CharCode = VK_RETURN)) and (sShift = []) then
	begin
		MjsNextCtrl(Self);
		Msg.CharCode:=0;
		Abort;
	end;

	{*** Shift & Tab (Grid以外)***}
	if (Msg.CharCode = VK_TAB) and (sShift = [ssShift]) then
	begin
		MjsPrevCtrl(Self);
		Msg.CharCode:=0;
		Abort;
	end;

	if ACtl is TWinControl then
	begin
		{*** ↑/↓ (Grid以外)***}
		case Msg.CharCode of
			VK_DOWN:
				if sShift = [] Then
				begin
					Msg.CharCode	:= VK_RETURN;
					MjsNextCtrl(Self);
					Abort;
				end;
			VK_UP:
				if sShift = [] then
				begin
					if not(ACtl = EBankCode) then
						MjsPrevCtrl(Self);
					Msg.CharCode	:= 0;
					Exit;
				end;
		end;

		{*** ← / → (Grid以外)***}
		if ACtl is TCustomEdit then
		begin
			{NumEditはｷｬﾚｯﾄ位置判定不要}
			if (ACtl is TMDateEdit) or
				(ACtl is TMNumEdit) then
			begin
				if(Msg.CharCode = VK_LEFT) and (sShift = []) then
				begin
					if not(ACtl = EBankCode) then
						MjsPrevCtrl(Self);
					Msg.CharCode	:= 0;
					Exit;
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
				Msg.CharCode	:= 0;
				MjsPrevCtrl(Self);
				Exit;
			end;
			if MjsChkCurEnd(ACtl) and (Msg.CharCode = VK_RIGHT) and (sShift = []) then
			begin
				Msg.CharCode := 0;
				MjsNextCtrl(Self);
				Exit;
			end;
		end;
	end;
end;

//**********************************************************************
//		Component	:OKボタン押下
//		Event		:Click
//		History		:2002/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004007BankF.BUpdateClick(Sender: TObject);
begin
	if fnUpdate() = False then Exit;
	Close;
	ModalResult := mrOK;
end;

//**********************************************************************
//		Component	:キャンセルボタン押下
//		Event		:Click
//		History		:2002/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004007BankF.BCancelClick(Sender: TObject);
begin
	Close;
	ModalResult := mrCancel;
end;

//**********************************************************************
//		Component	:フォーム 表示
//		Event		:Show
//		History		:2002/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004007BankF.FormShow(Sender: TObject);
begin
	MjsSetFocus(Self,EBankCode.Name);
end;

//***********************************************************************
//		Proccess	:ﾌｫｰﾑ初期設定
//		Parameter	:
//		Return		:
//		History		:2002/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004007BankF.fnFormIni;
var
	i:integer;
begin
	for i:=0 to ComponentCount-1 do
	begin
		//ｺﾝﾎﾟｰﾈﾝﾄ初期ｸﾘｱ
		if Components[i] is TMNumEdit then
			(Components[i] as TMNumEdit).Value:=0;
		if Components[i] is TMTxtEdit then
			(Components[i] as TMTxtEdit).Text:='';
		if (Components[i] is TMLabel)and
			(Copy((Components[i] as TMLabel).Name,1,1)='L') then
			(Components[i] as TMLabel).Caption:='';

		//ｲﾍﾞﾝﾄ割り付け
		if Components[i] is TMNumEdit then
		begin
// <BDIC> DEL	(Components[i] as TMNumEdit).OnEnter:=fnWCTLEnter;
// <BDIC> DEL	(Components[i] as TMNumEdit).OnExit	:=fnWCTLExit;
		end;
		if Components[i] is TMTxtEdit then
		begin
			(Components[i] as TMTxtEdit).OnEnter:=fnWCTLEnter;
			(Components[i] as TMTxtEdit).OnExit	:=fnWCTLExit;
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
	fnFBCharInit;
end;

//**********************************************************************
//		Proccess	:振込先銀行の値ﾁｪｯｸ
//		Parameter	:Sender	:ｵﾌﾞｼﾞｪｸﾄ
//					:		:nil以外	:ｺﾝﾎﾟｰﾈﾝﾄのExitｲﾍﾞﾝﾄ
//					:		nil			:書き込み前
//		Return		:TRUE	:成功
//					:FALSE	:失敗
//**********************************************************************
function TJNTCRP004007BankF.fnValueCheck(Sender: TObject): boolean;
var
	DMQuery : TMQuery;
	sEdit	: String;

	cMessageRec: TMJSMsgRec;		// 2005/09/01 H.Kawato Add

begin
	Result:=False;

	//銀行コード
	if (Sender = nil) or (Sender = EBankCode) then
	begin
		if EBankCode.Value = 0 then
		begin
// 2005/09/01 H.Kawato Mod Start 
{
			GetMsg(rcMsg,100,1);
			with rcMsg do
				MjsMessageBoxEx(Self,'銀行コード'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
}
	m_cComArea.m_MsgStd.GetMsg (cMessageRec, 20, 109);
	cMessageRec.sMsg   := m_cComArea.m_MsgStd.MsgChange (cMessageRec.sMsg, '@_@', '銀行');
	MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
							cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
// 2005/09/01 H.Kawato Mod End
			MjsSetFocus(Self,EBankCode.Name );
			Exit;
		end;
	end;

	//銀行名称
	if (Sender = nil) or (Sender = EBankName) then
	begin
		if Trim(EBankName.Text) = '' then
		begin
// 2005/09/01 H.Kawato Mod Start 
{
			GetMsg(rcMsg,100,1);
			with rcMsg do
				MjsMessageBoxEx(Self,'銀行名称'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			MjsSetFocus(Self,EBankName.Name );
}
			m_cComArea.m_MsgStd.GetMsg (cMessageRec, 20, 108);
			cMessageRec.sMsg   := m_cComArea.m_MsgStd.MsgChange (cMessageRec.sMsg, '@_@', '銀行名称');
			MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
							cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
// 2005/09/01 H.Kawato Mod End
			Exit;
		end;
	end;

	//銀行名称カナ
	if (Sender = nil) or (Sender = EBankKana) then
	begin
// 2005/09/07 H.Kawato Add Start
		if Trim(EBankKana.Text) = '' then
		begin
			m_cComArea.m_MsgStd.GetMsg (cMessageRec, 20, 108);
			cMessageRec.sMsg   := m_cComArea.m_MsgStd.MsgChange (cMessageRec.sMsg, '@_@', '銀行名称カナ');
			MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
							cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
			Exit;
		end;
// 2005/09/07 H.Kawato Add End
		{銀行名カナ}
		if fnFBKanaChange(EBankKana.Text, sEdit, False) = False then
		begin
// 2005/09/01 H.Kawato Mod Start 
{
			GetMsg(rcMsg,200,1);
			with rcMsg do
			begin
				sMsg :=	'バンキングシステムで使用できない文字が入力されています。';
				MjsMessageBoxEx(Self,sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
}
			MJSMessageBoxEx(Self,'バンキングシステムで使用できない文字が入力されています。',
            						'エラー',mjError, mjOK, mjDefOK, FALSE);
// 2005/09/01 H.Kawato Mod End
			MjsSetFocus(Self,EBankKana.Name );
			Exit;
		end;
		EBankKana.Text := sEdit;
	end;

	//支店コード
	if (Sender = nil) or (Sender = EBranchCode) then
	begin
		if Trim(EBranchCode.Text) = '' then
		begin
// 2005/09/01 H.Kawato Mod Start 
{
			GetMsg(rcMsg,100,1);
			with rcMsg do
				MjsMessageBoxEx(Self,'支店コード'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
}
	m_cComArea.m_MsgStd.GetMsg (cMessageRec, 20, 109);
	cMessageRec.sMsg   := m_cComArea.m_MsgStd.MsgChange (cMessageRec.sMsg, '@_@', '支店');
	MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
							cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
// 2005/09/01 H.Kawato Mod End
			MjsSetFocus(Self,EBranchCode.Name );
			Exit;
		end;
	end;

//銀行ｺｰﾄﾞ・支店ｺｰﾄﾞの重複チェック
	if Sender = nil then
	begin
		DMQuery := TMQuery.Create(Self);										// MQueryの構築
		if Assigned(DMQuery) <> True then
			Exit;

		try
			try
				MDBModule.SetDBInfoTOQuery(dbCompany,DMQuery);					// DBとの接続
				with DMQuery do
				begin
					Close;
					SQL.Clear;
					SQL.Add('SELECT BankNCode FROM HAPBS AS BS'	);				//振込銀行内部ｺｰﾄﾞ
					SQL.Add('INNER JOIN HAPBF AS BF'			);
					SQL.Add('ON BS.BankNCode=BF.NCode'			);
					SQL.Add('WHERE BF.BankCode=:hBankCode'		);
					SQL.Add('AND BS.BranchCode=:hBranchCode'	);

					SetFld('hBankCode').AsInteger	:= Trunc(EBankCode.Value);
					SetFld('hBranchCode').AsInteger	:= Trunc(EBranchCode.Value);

					if not Open then
						Abort;

// <SCA> ADD-STR
                    m_bIsExistSameBra := False;

                    if (GetPayCommonValue('Master', 'HAPBS_SAMECODE') = '1') then
                    begin
                        // 同一振込先支店コード可
    					if not Eof then
                        begin
                            if (MjsMessageBoxEx(Self, 'この支店コードは既に登録済みですが、同一コードで支店を追加登録しますか？',
                                               '確認', mjQuestion, mjYesNo, mjDefNO) <> mrYES ) then
                            begin
        						MjsSetFocus(Self,EBranchCode.Name );
		        				Exit;
                            end;

                            m_bIsExistSameBra := True;
                        end;
                    end
                    else
// <SCA> ADD-END
					if not Eof then
					begin
// 2005/09/01 H.awato Mod Start
{
						GetMsg(rcMsg,20,2);
						with rcMsg do
							MjsMessageBoxEx(Self, sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
}
	m_cComArea.m_MsgStd.GetMsg (cMessageRec, 30, 8);
	cMessageRec.sMsg   := m_cComArea.m_MsgStd.MsgChange (cMessageRec.sMsg, '@', 'コード');
	MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
							cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
// 2005/09/01 H.Kawato Mod End
						MjsSetFocus(Self,EBranchCode.Name );
						Exit;
					end;
				end;
			except
// 2005/09/01 H.Kawato Mod Start
{
				GetMsg(rcMsg,1,5);
				with rcMsg do
					MjsMessageBoxEx(Self,'振込先支店の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
}
				MjsMessageBoxEx(Self,'振込先支店の登録に失敗しました。', 'エラー',mjError, mjOK, mjDefOK, FALSE);
// 2005/09/01 H.Kawato Mod End
				MjsSetFocus(Self,EBankCode.Name );
				Exit;
			end;
		finally
			DMQuery.Close;
			DMQuery.Free;
		end;
	end;

	//支店名称
	if (Sender = nil) or (Sender = EBranchName) then
	begin
		if Trim(EBranchName.Text) = '' then
		begin
// 2005/09/01 H.Kawato Mod Start 
{
			GetMsg(rcMsg,100,1);
			with rcMsg do
				MjsMessageBoxEx(Self,'支店名称'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
}
	m_cComArea.m_MsgStd.GetMsg (cMessageRec, 20, 108);
	cMessageRec.sMsg   := m_cComArea.m_MsgStd.MsgChange (cMessageRec.sMsg, '@_@', '支店名称');
	MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
							cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
// 2005/09/01 H.Kawato Mod End
			MjsSetFocus(Self,EBranchName.Name );
			Exit;
		end;
	end;

//支店名の重複チェック
	if Sender = nil then
	begin
		DMQuery := TMQuery.Create(Self);										// MQueryの構築
		if Assigned(DMQuery) <> True then
			Exit;

		try
			try
				MDBModule.SetDBInfoTOQuery(dbCompany,DMQuery);					// DBとの接続
				with DMQuery do
				begin
					Close;
					SQL.Clear;
					SQL.Add('SELECT BankNCode FROM HAPBS AS BS'	);				//振込銀行内部ｺｰﾄﾞ
					SQL.Add('INNER JOIN HAPBF AS BF'			);
					SQL.Add('ON BS.BankNCode=BF.NCode'			);
					SQL.Add('WHERE BF.BankCode=:hBankCode'		);
					SQL.Add('AND BS.BranchName=:hBranchName'	);

					SetFld('hBankCode').AsInteger  := Trunc(EBankCode.Value);
					SetFld('hBranchName').AsString := Trim(EBranchName.Text);

					if not Open then
						ABort;

					if not Eof then
					begin
// 2005/09/01 H.Kawato Mod Start 
{
						GetMsg(rcMsg,200,1);
						with rcMsg do
							MjsMessageBoxEx(Self,'既に同一支店名称が入力済みです。', sTitle,IconType,BtnType,BtnDef,LogType);
}
//						MjsMessageBoxEx(Self,'既に同一支店名称が登録済みです。', 'エラー',mjError, mjOK, mjDefOK, FALSE);
						m_cComArea.m_MsgStd.GetMsg (cMessageRec, 30, 8);
						cMessageRec.sMsg   := m_cComArea.m_MsgStd.MsgChange (cMessageRec.sMsg, '@', '支店名称');
						MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
											cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
// 2005/09/01 H.Kawato Mod End
						MjsSetFocus(Self,EBranchName.Name );
						Exit;
					end;
				end;
			except
// 2005/09/01 H.Kawato Mod Start 
{
				GetMsg(rcMsg,1,5);
				with rcMsg do
					MjsMessageBoxEx(Self,'振込先支店の'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
}
				MjsMessageBoxEx(Self,'振込先支店の登録に失敗しました。', 'エラー',mjError, mjOK, mjDefOK, FALSE);
// 2005/09/01 H.Kawato Mod End
				MjsSetFocus(Self,EBranchName.Name );
				Exit;
			end;
		finally
			DMQuery.Close;
			DMQuery.Free;
		end;
	end;

	//支店名称カナ
	if (Sender = nil) or (Sender = EBranchKana) then
	begin
// 2005/09/07 H.Kawato Add Start
		if Trim(EBranchKana.Text) = '' then
		begin
			m_cComArea.m_MsgStd.GetMsg (cMessageRec, 20, 108);
			cMessageRec.sMsg   := m_cComArea.m_MsgStd.MsgChange (cMessageRec.sMsg, '@_@', '支店名称カナ');
			MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
							cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
			Exit;
		end;
// 2005/09/07 H.Kawato Add End
		{支店名称カナ}
		if fnFBKanaChange(EBranchKana.Text, sEdit, False) = False then
		begin
// 2005/09/01 H.Kawato Mod Start 
{
			GetMsg(rcMsg,200,1);
			with rcMsg do
			begin
				sMsg :=	'バンキングシステムで使用できない文字が入力されています。';
				MjsMessageBoxEx(Self,sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
}
			MjsMessageBoxEx(Self,'バンキングシステムで使用できない文字が入力されています。',
            								'エラー',mjError, mjOK, mjDefOK, FALSE);
// 2005/09/01 H.Kawato Mod End
			MjsSetFocus(Self,EBranchKana.Name );
			Exit;
		end;
		EBranchKana.Text := sEdit;
	end;

	Result := True;
end;

//**********************************************************************
//		Component	:ALL
//		Event		:Enter
//		Proccess	:ﾌｫｰｶｽ取得
//		Parameter	:
//		Return		:
//		History		:2001/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004007BankF.fnWCTLEnter(Sender: TObject);
begin
//
end;

//**********************************************************************
//		Component	:ALL
//		Event		:Exit
//		Proccess	:ﾌｫｰｶｽ消失
//		Parameter	:
//		Return		:
//		History		:2001/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004007BankF.fnWCTLExit(Sender: TObject);
var
	DMQuery		: TMQuery;
	sEdit		: String;
	cMessageRec	: TMJSMsgRec;	// 2005/09/01 H.Kawato Add
begin
// 2005/09/01 H.Kawato Del
//	if not HapActiveControlOnForm(Self) then									//ﾌｫｰﾑ自体のﾌｫｰｶｽ消失によるExitｲﾍﾞﾝﾄ
//		Exit;																	//以下不要
// 2005/09/01 H.Kawato Del

//銀行ｺｰﾄﾞExit
	if Sender = EBankCode then
	begin
		DMQuery := TMQuery.Create(Self);										// MQueryの構築

		if Assigned(DMQuery) <> True then
			Exit;

		try
			try
				MDBModule.SetDBInfoTOQuery(dbCompany,DMQuery);					// DBとの接続
				with DMQuery do
				begin
					Close;
					SQL.Clear;
					SQL.Add('SELECT BankName,BankKana FROM HAPBF'	);
					SQL.Add('WHERE BankCode=:hBankCode'				);

					SetFld('hBankCode').AsInteger	:= (Sender as TMNumEdit).AsInteger;

					if not Open then
						Abort;

					if not Eof then
					begin
// 2005/09/01 H.Kawato Mod Start if文の追加
{
						EBankName.Text := GetFld('BankName').AsString ;
						EBankKana.Text := GetFld('BankKana').AsString ;
						MjsSetFocus(Self,'EBranchCode');
}
						if EBankCode.Text <> '' then
                        begin
							EBankName.Text := GetFld('BankName').AsString ;
							EBankKana.Text := GetFld('BankKana').AsString ;

// <#005> Add start
							// コードが変更されたらクリア
                            if  m_BeforeBankCode <> EBankCode.Text  then
                            begin
                                EBranchCode.InputFlag   := True;
                                EBranchCode.Value       := 0;
                                EBranchName.Text        := '';
                                EBranchKana.Text        := '';
                                EBranchName.Static		:= False;
                                EBranchKana.Static		:= False;
                                m_BeforeBrchCode		:= EBranchCode.Text;
                            end;
                            EBankCode.InputFlag	    := FALSE;
                            m_BeforeBankCode        := EBankCode.Text;

                            EBankName.Static	:= True;
                            EBankKana.Static	:= True;
// <#005> Add end

                            if ((Screen.ActiveControl.Name = EBankName.Name) or                 // <#004> Add
                                (Screen.ActiveControl.Name = EBankKana.Name)) = True then       // <#004> Add
							MjsSetFocus(Self,'EBranchCode');
                        end;
// 2005/09/01 H.Kawato Mod End
// <#005> Add start
					end
                    else
                    begin
                        // 銀行
                        EBankName.Text			:= '';
                        EBankKana.Text			:= '';
                        EBankName.Static		:= False;
                        EBankKana.Static		:= False;
                        m_BeforeBankCode        := EBankCode.Text;
                        // 銀行支店
                        EBranchCode.InputFlag   := True;
                        EBranchCode.Value       := 0;
                        EBranchName.Text        := '';
                        EBranchKana.Text        := '';
                        EBranchName.Static		:= False;
                        EBranchKana.Static		:= False;
                        m_BeforeBrchCode		:= EBranchCode.Text;
// <#005> Add end
					end;
				end;
			except
// 2005/09/01 H.Kawato Mod Start
{
				GetMsg(rcMsg,1,5);
				with rcMsg do
				begin
					MjsMessageBoxEx(Self,'振込先銀行'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
				end;
}
				m_cComArea.m_MsgStd.GetMsg (cMessageRec, 20, 108);
				cMessageRec.sMsg	:= m_cComArea.m_MsgStd.MsgChange (cMessageRec.sMsg, '@_@', '銀行名称');
				MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
										cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
// 2005/09/01 H.Kawato Mod End
				MjsSetFocus(Self,(Sender as TMTxtEdit).Name );
				Exit;
			end;
		finally
			DMQuery.Close;
			DMQuery.Free;
		end;
	end;
//2007/02/15 <#001> Y.Naganuma Add
	if Sender = EBranchCode then
	begin
		DMQuery := TMQuery.Create(Self);										// MQueryの構築

		if Assigned(DMQuery) <> True then
			Exit;

		try
			try
				MDBModule.SetDBInfoTOQuery(dbCompany,DMQuery);					// DBとの接続
				with DMQuery do
				begin
					Close;
					SQL.Clear;
					SQL.Add('SELECT BranchName,BranchKana FROM HAPBS'	);
					SQL.Add('WHERE BankNCode=:hBankNCode'			);
					SQL.Add('AND BranchCode=:hBranchCode'			);

					SetFld('hBankNCode').AsFloat	:= GetBankNCode(IntToStr(EBankCode.AsInteger));
					SetFld('hBranchCode').AsInteger	:= (Sender as TMNumEdit).AsInteger;

					if not Open then
						Abort;

					if not Eof then
					begin
						if EBranchCode.Text <> '' then
                        begin
							EBranchName.Text := GetFld('BranchName').AsString ;
							EBranchKana.Text := GetFld('BranchKana').AsString ;
// <#005> Add start
                            EBranchName.Static	:= True;
                            EBranchKana.Static	:= True;

                            if ((Screen.ActiveControl.Name = EBranchName.Name) or
                                (Screen.ActiveControl.Name = EBranchKana.Name)) = True then
	                            MjsSetFocus(Self,'BUpdate');
// <#005> Add end
                        end;
// <#005> Add start
					end
                    else
                    begin
                        // 銀行支店
                        EBranchName.Text        := '';
                        EBranchKana.Text        := '';
                        EBranchName.Static		:= False;
                        EBranchKana.Static		:= False;
// <#005> Add end
					end;
                    m_BeforeBrchCode		:= EBranchCode.Text;		// <#005> Add
				end;
			except
				m_cComArea.m_MsgStd.GetMsg (cMessageRec, 20, 108);
				cMessageRec.sMsg	:= m_cComArea.m_MsgStd.MsgChange (cMessageRec.sMsg, '@_@', '支店名称');
				MJSMessageBoxEx (Self,cMessageRec.sMsg, cMessageRec.sTitle,
										cMessageRec.icontype, cMessageRec.btntype, cMessageRec.btndef, cMessageRec.LogType);
				MjsSetFocus(Self,(Sender as TMTxtEdit).Name );
				Exit;
			end;
		finally
			DMQuery.Close;
			DMQuery.Free;
		end;
	end;
//2007/02/15 <#001> Y.Naganuma Add
	if (Sender = EBankKana) or (Sender = EBranchKana) then
	begin
		{銀行名カナ}
		if fnFBKanaChange((Sender as TMTxtEdit).Text, sEdit, False) = False then
		begin
// 2005/09/01 H.Kawato Mod Start 
{
			GetMsg(rcMsg,200,1);
			with rcMsg do
			begin
				sMsg :=	'バンキングシステムで使用できない文字が入力されています。';
				MjsMessageBoxEx(Self,sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
}
            MjsMessageBoxEx(Self,'バンキングシステムで使用できない文字が入力されています。',
            						'エラー',mjError, mjOK, mjDefOK, FALSE);
// 2005/09/01 H.Kawato Mod End
			MjsSetFocus(Self,(Sender as TMTxtEdit).Name );
			Exit;
		end;
		(Sender as TMTxtEdit).Text := sEdit;
	end;
end;

//**********************************************************************
//		Proccess	:銀行更新
//		Parameter	:
//		Return		:TRUE	:更新成功
//					:FALSE	:失敗(値ﾁｪｯｸNG含む)
//		Hoistory	:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004007BankF.fnUpdate: boolean;
var
	DMQuery		:	TMQuery;
	bIsInsert	:	boolean;

	iBNCode		:	Int64;
begin
	Result := False;

	if not fnValueCheck(nil) then												//値のﾁｪｯｸ
		Exit;

	DMQuery := TMQuery.Create(self);											// MQueryの構築

	if Assigned(DMQuery) <> True then
	begin
		Abort;
	end;

	MDBModule.SetDBInfoToQuery(dbCompany, DMQuery);								// DBとの接続

	SessionPractice(C_ST_PROCESS);				// <#002>

	try
		try
			with DMQuery do
			begin
		//銀行名の登録確認
				Close;
				SQL.Clear;
				SQL.Add('SELECT COUNT(*) Rtn FROM HAPBF');
				SQL.Add('WHERE BankCode=:hBankCode'		);

				SetFld('hBankCode').AsInteger := Trunc(EBankCode.Value);

				if not Open then
					Abort;

				if GetFld('Rtn').AsInteger = 0 then
					bIsInsert := True											//新規銀行
				else
					bIsInsert := False;											//銀行登録済

				if bIsInsert then
				begin
			//銀行を新規に登録(内部ｺｰﾄﾞは自動)
					Close;
					SQL.Clear;
					SQL.Add('INSERT INTO HAPBF(UpdTantoNCode,BankCode,BankName,BankKana)'	);
					SQL.Add('Values(:hTantoNCd,:hBankCode,:hBankName,:hBankKana)'			);
// <#005> Del start UPDATEは行わない
{
				end
				else
				begin
			//銀行は登録済
					Close;
					SQL.Clear;
					SQL.Add('UPDATE HAPBF SET'			);
//2005-08-18
					SQL.Add('UpdTantoNCode=:hTantoNCd,'	);
					SQL.Add('BankName=:hBankName,'		);
					SQL.Add('BankKana=:hBankKana'		);
					SQL.Add('WHERE BankCode=:hBankCode'	);
}
// <#005> Del end
// <#005> Add start
					SetFld('hTantoNCd').AsFloat		:= recCommon.TantoNCD;

					SetFld('hBankCode').AsInteger	:= Trunc(EBankCode.Value);		//銀行コード
					SetFld('hBankName').AsString	:= Trim(EBankName.Text);		//銀行名称
					SetFld('hBankKana').AsString 	:= Trim(EBankKana.Text);		//銀行名称カナ

					if not ExecSQL then
						Abort;
// <#005> Add end
				end;
//2005-08-18

// <#005> Del start
{
				SetFld('hTantoNCd').AsFloat		:= recCommon.TantoNCD;

				SetFld('hBankCode').AsInteger	:= Trunc(EBankCode.Value);		//銀行コード
				SetFld('hBankName').AsString	:= Trim(EBankName.Text);		//銀行名称
				SetFld('hBankKana').AsString 	:= Trim(EBankKana.Text);		//銀行名称カナ

				if not ExecSQL then
					Abort;
}					
// <#005> Del end

		//振込銀行→内部ｺｰﾄﾞ取得
				Close;
				SQL.Clear;
				SQL.Add('SELECT NCode FROM HAPBF WHERE BankCode=:hBankCode'	);

				SetFld('hBankCode').AsInteger := Trunc(EBankCode.Value);

				if not Open then Abort;
				if Eof then Abort;

				iBNCode := Trunc(GetFld('NCode').AsFloat);

		//支店の新規登録(内部ｺｰﾄﾞは自動)
				Close;
				SQL.Clear;
				SQL.Add('INSERT INTO HAPBS');
				SQL.Add('(UpdTantoNCode,BankNCode,BranchCode,BranchName,BranchKana)'		);
				SQL.Add('Values(:hTantoNCd,:hBankNCode,:hBraCode,:hBraName,:hBraKana)'	);

				SetFld('hBankNCode').AsFloat	:=	iBNCode;					//振込銀行内部ｺｰﾄﾞ
				SetFld('hBraCode').AsInteger	:=	Trunc(EBranchCode.Value);	//振込支店ｺｰﾄﾞ
				SetFld('hBraName').AsString		:=	Trim(EBranchName.Text);		//支店名称
				SetFld('hBraKana').AsString		:=	Trim(EBranchKana.Text);		//支店名称カナ
//2005-08-18
				SetFld('hTantoNCd').AsFloat		:= recCommon.TantoNCD;

				if not ExecSQL then
					Abort;

				Result := True;

			end;
		except
// 2005/09/01 H.Kawato Mod Start 
{
			GetMsg(rcMsg,20,4);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'振込先銀行'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
}
			MjsMessageBoxEx(Self,'振込先銀行の登録に失敗しました。', 'エラー',mjError, mjOK, mjDefOK, FALSE);
// 2005/09/01 H.Kawato Mod End
			Exit;
		end;
	finally
		SessionPractice(C_ED_PROCESS);			// <#002>
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//		Proccess	:fnDetailSet
//					:支店ｺｰﾄﾞ欄からの表示の場合、銀行名をﾃﾞﾌｫﾙﾄ表示する。
//		Parameter	:
//		Hoistory	:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004007BankF.fnDetailSet(sBankCode : String);
var
	DMQuery		:TMQuery;
begin
	if Trim(sBankCode) <> '' then
		EBankCode.Value := StrToInt(sBankCode)
	else
		Exit;

    m_BeforeBankCode := sBankCode;          // 2006/01/16 H.Kawato Add

	DMQuery := TMQuery.Create(self);											// MQueryの構築

	if Assigned(DMQuery) <> True then
	begin
		Abort;
	end;

	MDBModule.SetDBInfoToQuery(dbCompany, DMQuery);								// DBとの接続

	try
		try
			with DMQuery do
			begin
				Close;
				SQL.Clear;
				SQL.Add('SELECT BankName,BankKana FROM HAPBF'	);
				SQL.Add('WHERE BankCode=:hBankCode'				);

				SetFld('hBankCode').AsString := sBankCode ;

				if not Open then
					Abort;

				if not Eof then
				begin
					EBankName.Text := GetFld('BankName').AsString ;
					EBankKana.Text := GetFld('BankKana').AsString ;
// <#005> Add start
                    EBankName.Static	:= True;
                    EBankKana.Static	:= True;
// <#005> Add end
				end;
			end;
		except
// 2005/09/01 H.Kawato Mod Start 
{
			GetMsg(rcMsg,20,4);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,'振込先銀行'+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
}
			MjsMessageBoxEx(Self,'振込先銀行の登録に失敗しました。', 'エラー',mjError, mjOK, mjDefOK, FALSE);
// 2005/09/01 H.Kawato Mod End
			Exit;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

//**********************************************************************
//*		Component	:Form
//*		Event		:Close
//*		Name		:
//**********************************************************************
procedure TJNTCRP004007BankF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Action := caFree;
end;

//**********************************************************************
//*		Component	:EBankCode
//*		Event		:KeyPress
//**********************************************************************
procedure TJNTCRP004007BankF.EBankCodeKeyPress(Sender: TObject; var Key: Char);
begin
	//'-'は入力不可
	if Key='-' then
		Abort;
end;

//**************************************************************************
//		Proccess	:FB用カナ変換表初期設定
//		Parameter   :NON
//		Retrun		:NON
//		NOTE:		:ﾌｧｰﾑﾊﾞﾝｷﾝｸﾞ使用可能文字列表よりASCIIｺｰﾄﾞ変換表を作成
//**************************************************************************
procedure TJNTCRP004007BankF.fnFBCharInit;
var
	I:	integer;
begin
	//	ASCIIｺｰﾄﾞｾｯﾄ
	for I := 0 to 255 do
		FBChar[I]	:=	char(I);
	//	制御文字はだめ
	for I := 0 to 31 do
		FBChar[I]	:=	char(0);
	//	Space はOK
	//	記号NG	!"#$%&'*+
	//	記号OK	().,/-
	for I := 33 to 39 do
		FBChar[I]	:=	char(0);
	FBChar[42]		:=	char(0);
	FBChar[43]		:=	char(0);
	//	数字OK	0123456789
	//	記号NG	:;<=>?@
	for I := 58 to 64 do
		FBChar[I]	:=	char(0);
	//	英字大文字OK
	//	括弧の変換
	FBChar[91]		:=	char(40);		//	[-> (
	FBChar[93]		:=	char(41);		//  ] -> )
	//	記号NG	^_`
	for I := 94 to 96 do
		FBChar[I]	:=	char(0);
	//	英字小文字は大文字でOK
	for I := 97 to 122 do
		FBChar[I]	:=	char(I-32);		//	a -> A
	//	括弧の変換
	FBChar[123]		:=	char(40);		//	{ -> (
	FBChar[124]		:=	char(0);		//  Error
	FBChar[125]		:=	char(41);		//  } -> )
	//
	for I := 126 to 161 do
		FBChar[I]	:=	char(0);
	//	カナ括弧OK	｢｣
	//	カナ記号NG	｡､･
	FBChar[164]		:=	char(0);
	FBChar[165]		:=	char(0);
	//	カナOK	ヲ
	//	カナ小文字を大文字へ
	for I := 167 to 171 do
		FBChar[I]	:=	char(I+10);		// ｧ -> ｱ
	FBChar[172]		:=	char(212);	  // ｬ -> ﾔ
	FBChar[173]		:=	char(213);	  // ｭ -> ﾕ
	FBChar[174]		:=	char(214);	  // ｮ -> ﾖ
	FBChar[175]		:=	char(194);	  // ｯ -> ﾂ
	FBChar[176]		:=	char(45);	   // ｰ -> -
	//	カナOK
	for I := 224 to 255 do
		FBChar[I]	:=	char(0);
end;
//**************************************************************************
//  Proccess	:   FB用カナ自動変換＆チェック処理
//  Parameter   :   sBase   変換、チェック前文字列
//				:	sEdit   変換後文字列
//				:	bInp	ｲﾝﾎﾟｰﾄ時処理
//  Retrun	  :   True	正常
//				:	False	変換不可能文字あり
//	NOTE:		:	ｲﾝﾎﾟｰﾄ時以外は変換不可文字は「！」に置き換え
//				:	ｲﾝﾎﾟｰﾄ時はSPに置き換える
//**************************************************************************
function TJNTCRP004007BankF.fnFBKanaChange(const sBase: string; var sEdit: string;
  bInp: Boolean): Boolean;
var
	sChar:		AnsiString;
	I:			integer;
	nLen:		integer;
	nChar:		integer;
	nGet:		integer;
	bErr:		Boolean;
begin
	sEdit	:=	'';
	bErr	:=	True;
	nLen	:=	Length(sBase);                                   //<#006> MjsHanLength→Length
	for I:=1 to nLen do
	begin
		sChar	:=	AnsiString(Copy(sBase,I,1));                 //<#006> MjsHanCopy→Copy
		nChar	:=	integer(sChar[1]);
		nGet	:=	integer(FBChar[nChar]);
		if nGet = 0 then
		begin
			if bInp then
				sChar	:= ' '
			else
				sChar	:= '!';
			bErr	:=	False;
		end
		else
			sChar[1]	:=	AnsiChar(nGet);
		sEdit	:=	sEdit	+ string(sChar);
	end;
	Result  :=	bErr;
end;

//**********************************************************************
//*		Component	:MFBank
//*		Event		:CompositionStr
//**********************************************************************
procedure TJNTCRP004007BankF.MFBankCompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText : String;
begin
	if MjsHanLength( EBankKana.Text ) < 15 then
	begin
		sKanaText := EBankKana.Text + Value;
		EBankKana.Text := MjsHanCopy( sKanaText , 1 , 15 );
	end;
end;

//**********************************************************************
//*		Component	:MFBranch
//*		Event		:CompositionStr
//**********************************************************************
procedure TJNTCRP004007BankF.MFBranchCompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText : String;
begin
	if MjsHanLength( EBranchKana.Text ) < 15 then
	begin
		sKanaText := EBranchKana.Text + Value;
		EBranchKana.Text := MjsHanCopy( sKanaText , 1 , 15 );
	end;
end;

//**********************************************************************
//		Component	:Form
//		Event		:Create
//		Process		:ﾌｫｰﾑ作成時
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004007BankF.FormCreate(Sender: TObject);
begin
	MjsFontResize(TJNTCRP004007BankF(Self),pointer(pMjsRec));

	recCommon := rcCOMMONAREA(pMjsRec^.m_pCommonArea^);
//	recSystem := rcSYSTEMAREA(pMjsRec^.m_pSystemArea^);		// 2005/09/01 H.kawato Del

	MjsColorChange(TJNTCRP004007BankF(Self),
		rcSYSTEMAREA (pMjsRec^.m_pSystemArea^).SysColorB,
		rcSYSTEMAREA (pMjsRec^.m_pSystemArea^).SysColorD,
		rcSYSTEMAREA (pMjsRec^.m_pSystemArea^).SysBaseColorB,
		rcSYSTEMAREA (pMjsRec^.m_pSystemArea^).SysBaseColorD,
		rcCOMMONAREA (pMjsRec^.m_pCommonArea^).SysFocusColor);

	fnFormIni;

	MFBank.Control		:=	nil;
	MFBank.Control		:=	EBankName;

	MFBranch.Control	:=	nil;
	MFBranch.Control	:=	EBranchName;

	// -----<#002> Add-St-----
	SPMsHist.Connection	:= dbCompany;
	//SPMsHist.SessionName	:= dbCompany.SessionName;
	// -----<#002> Add-Ed-----
end;

//**********************************************************************
//		Process		:ｺﾝｽﾄﾗｸﾀ
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
// <BDIC> MOD-STR
//constructor TJNTCRP004007BankF.CreateForm(cForm : TComponent; p : pointer);
constructor TJNTCRP004007BankF.CreateForm(cForm : TComponent; p, p2 : pointer; j : TJNTCommon);
// <BDIC> MOD-END
begin
	pMjsRec		:= p;

	MDBModule	:= TMDataModuleF(pMjsRec^.m_pDBModule^);

// 2005/09/01 H.Kawato Add
	m_cComArea	:= TMASCom      (pMjsRec^.m_pSystemArea^);

	dbCompany	:= nil;								//<#003> Add
	try
		dbCompany:=MDBModule.CopDBOpen(1, TMjsAppRecord(pMjsRec^).m_iCorpID);
	except
		MjsMessageBox(nil,'会社DBのOpenに失敗しました。',mjError,mjDefOK);
		Abort;
	end;

// <BDIC> ADD-STR
	pBaseMjsRec := p2;                              
    m_cJNTArea  := j;
// <BDIC> ADD-END

	inherited Create(cForm);
end;

//**********************************************************************
//		Process		:ｺﾝｽﾄﾗｸﾀ
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004007BankF.FormDestroy(Sender: TObject);
begin
	if dbCompany <> nil then						// <#003> Add
		MDBModule.CopDBClose(dbCompany);			//会社DB Close
end;

// 2006/01/16 H.Kawato Add Start
//**********************************************************************
//		Process		:振込口座の検索Exp
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004007BankF.fnCmnEditBankCodeOnArrowClick(Sender: TObject);
var
	nBankCode	    : Integer;
// <BDIC> MOD-STR
{   lvExpSend       : rcJNTExpSend;
    lvExpRecv       : rcJNTExpRecv;
    iExpRtn         : Integer;
    CompName        : String;
    sAfterBankCode  : String;
    sBranchCode     : String;}
	nBraCode	    : Integer;
    iExpRtn         : Integer;
	strAllBankName  : String;
	strBranchName   : String;
	strBankKanaName	: string;
	strBraKanaName	: string;
// <BDIC> MOD-END
begin
// <BDIC> MOD-STR
{   CompName    :=  TComponent(Sender).name;

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam(@lvExpSend);

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec := pMjsRec;                            // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB     := @dbCompany;                         // TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB     := m_cComArea.SystemArea.SysColorB;
    lvExpSend.ColorD     := m_cComArea.SystemArea.SysColorD;

    // 本店
    if (CompName = 'EBankCode') then
    begin
        lvExpSend.MasterKbn     := 9090;                        // ﾏｽﾀ区分 <104>
        lvExpSend.ModulKbn      := 0;                           // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                           // ﾊﾟﾀｰﾝNO
        lvExpSend.TBarNM        := '銀行' +  '検索ｴｸｽﾌﾟﾛｰﾗ';
        lvExpSend.TrRootCaption := '銀行';
        lvExpSend.SortStr       := 'Order by BankCode';
        lvExpSend.GroupStr      := 'HAPBF.BankCode,HAPBF.BankName,HAPBF.BankKana,HAPBF.NCode';
    end
    // 支店
    else if (CompName = 'EBranchCode') then
    begin
      	nBankCode	            :=
            Trunc (TMNumEdit (MJSFindCtrl (Self, 'EBankCode')).Value);
        lvExpSend.MasterKbn     := 9100;                        // ﾏｽﾀ区分
        lvExpSend.ModulKbn      := 0;                           // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                           // ﾊﾟﾀｰﾝNO
        lvExpSend.TBarNM        := '支店' +  '検索ｴｸｽﾌﾟﾛｰﾗ';
        lvExpSend.TrRootCaption := '支店';
        lvExpSend.WhereStr      := 'BankNCode = ' + FloatToStr(GetBankNCode(IntToStr(nBankCode)));
        lvExpSend.SortStr       := 'Order by BranchCode';
    end;

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);

    //ｷｬﾝｾﾙ
    if iExpRtn <>1 then
        Exit;

    // 中身あり?
    if Length(Trim(lvExpRecv.GCode))>0 then
    begin
        // 本店
        if (CompName = 'EBankCode') then
        begin
	        sAfterBankCode	:= lvExpRecv.GCode;

	        if  m_BeforeBankCode <> sAfterBankCode  then
            begin
		        EBranchCode.InputFlag   := True;
                EBranchCode.Value       := 0;
                EBranchName.Text        := '';
                EBranchKana.Text        := '';
// <#005> Add start
                m_BeforeBrchCode		:= EBranchCode.Text;
                EBranchName.Static		:= False;
                EBranchKana.Static		:= False;
// <#005> Add end
            end;
	    	EBankCode.Value 		:= StrToFloat(lvExpRecv.GCode);
		    EBankCode.InputFlag	    := FALSE;
            m_BeforeBankCode        := lvExpRecv.GCode;
            fnDetailSet(sAfterBankCode);

        end
        // 支店
        else if (CompName = 'EBranchCode') then
        begin
            sAfterBankCode	        := Trim(EBankCode.Text);
            sBranchCode             := lvExpRecv.GCode;
    		EBranchCode.Value 		:= StrToFloat(lvExpRecv.GCode);
	    	EBranchCode.InputFlag	:= FALSE;
            fnGetBranchName(sAfterBankCode, sBranchCode);
        end;
    end;

	TWinControl (Sender).SetFocus ();
    Keybd_Event(VK_RETURN, 0, 0, 0);                        // Enter ｷｰのｴﾐｭﾚｲﾄ
}
	m_cJNTArea.setOthAppRecord;
    // 本店
    if (TComponent(Sender).Name = 'EBankCode') then
    	fnCMNBankInit (pBaseMjsRec,P_BANKDIC_BANKTENPOFIND)
    // 支店
    else
    	fnCMNBankInit (pBaseMjsRec,P_BANKDIC_TENPOFINDONLY);

    nBankCode := Trunc(EBankCode.Value);
    nBraCode  := 0;

	iExpRtn	:= fnCMNBankShow (nBankCode, nBraCode, strAllBankName, strBranchName, strBankKanaName, strBraKanaName);

	fnCMNBankFree ();
	m_cJNTArea.setMasAppRecord;

    //ｷｬﾝｾﾙ
    if (iExpRtn <> 1) then
        Exit;

    m_ExpIsOn := True;

    // 本店
    EBankCode.Value 		:= nBankCode;
    EBankCode.InputFlag	    := False;
    EBankName.Text          := strAllBankName;
    EBankKana.Text          := strBankKanaName;

    EBranchCode.SetFocus;

    // 支店
    EBranchCode.Value 		:= nBraCode;
	EBranchCode.InputFlag	:= False;
    EBranchName.Text        := strBranchName;
    EBranchKana.Text        := strBraKanaName;

    BUpdate.SetFocus;

    m_ExpIsOn := False;
// <BDIC> MOD-END
end;

//**********************************************************************
//		Process		:振込支店名称取得関数
//		Parameter	:
//		Return		:
//		History		:99/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004007BankF.fnGetBranchName(sBankCode, sBranchCode : String): Boolean;
var
	DMQuery		:TMQuery;
begin
    Result := False;

	if Trim(sBankCode) <> '' then
		EBankCode.Value     := StrToInt(sBankCode)
	else
		Exit;

	if Trim(sBranchCode) <> '' then
		EBranchCode.Value := StrToInt(sBranchCode)
	else
		Exit;

	DMQuery := TMQuery.Create(self);											// MQueryの構築

	if Assigned(DMQuery) <> True then
	begin
		Abort;
	end;

	MDBModule.SetDBInfoToQuery(dbCompany, DMQuery);								// DBとの接続

	try
		try
			with DMQuery do
			begin
				Close;
				SQL.Clear;
				SQL.Add('SELECT BranchName,BranchKana FROM MV_MAS_HAPBS'    );
				SQL.Add('WHERE BankCode=:hBankCode'				            );
                SQL.Add('AND BranchCode=:hBranchCode'				        );

				SetFld('hBankCode').AsString    := sBankCode;
				SetFld('hBranchCode').AsString  := sBranchCode;

				if not Open then
					Abort;

				if not Eof then
				begin
					EBranchName.Text  := GetFld('BranchName').AsString ;
					EBranchKana.Text  := GetFld('BranchKana').AsString ;
// <#005> Add start
                    m_BeforeBrchCode	:= EBranchCode.Text;
                    EBranchName.Static	:= True;
                    EBranchKana.Static	:= True;
// <#005> Add end
				end;
			end;
            Result := True;
		except
			MjsMessageBoxEx(Self,'振込先銀行の登録に失敗しました。', 'エラー',mjError, mjOK, mjDefOK, FALSE);
			Exit;
		end;
	finally
		DMQuery.Close;
		DMQuery.Free;
	end;
end;

function TJNTCRP004007BankF.GetBankNCode(sBankCode: String): Double;
var
	strSQL	 : String;
	objQuery : TMQuery;
begin
	Result := 0;

	strSQL := '';
	strSQL := strSQL + 'Select ';
	strSQL := strSQL + 'NCode ';
	strSQL := strSQL + 'From ';
	strSQL := strSQL + 'HAPBF ';
	strSQL := strSQL + 'Where ';
	strSQL := strSQL + 'BankCode = :BankCode ';

	// ＱＵＥＲＹオープン
	objQuery	:= TMQuery.Create (Self);
	MDBModule.SetDBInfoToQuery (dbCompany, objQuery);		// DBとMQueryの接続


	with (objQuery) do
	begin
		// データ抽出処理
		// 支払管理基本情報(PayBaseInfo)データ取得
		SQL.Clear;
		SQL.Add (strSQL);

		ParamByName ( 'BankCode' ).AsString	:= sBankCode;

		Open ();
		if (not EOF) then
			Result := GetFld('NCode').AsFloat;
	end;

	objQuery.Free;
end;
// 2006/01/16 H.Kawato Add End

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<#22>
//	Name		:	T.Seki
//	Date		:	2008/02/13
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP004007BankF.SessionPractice(iSyori: Integer);
begin
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
	SPMsHist.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(pMjsRec^.m_pCommonArea^).TantoNCD;
												// 担当者名称
	SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(pMjsRec^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
	SPMsHist.ParamByName('@pSysCode').AsInteger			:= pMjsRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
	SPMsHist.ParamByName('@pOptCode').AsInteger			:= pMjsRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
	SPMsHist.ParamByName('@pPrgCode').AsInteger			:= pMjsRec^.m_iProgramCode;

// Delphi10 ST
//	SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
	SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED
end;

// <BDIC> ADD-STR
procedure TJNTCRP004007BankF.EBankCodeEnter(Sender: TObject);
begin
    m_ACtl := Screen.ActiveControl;
end;

procedure TJNTCRP004007BankF.EBankCodeExit(Sender: TObject);
var
	nBankCode	    : Integer;
	nBraCode	    : Integer;
    iExpRtn         : Integer;
	strAllBankName  : String;
	strBranchName   : String;
	strBankKanaName	: string;
	strBraKanaName	: string;
begin
    if (Screen.ActiveControl.Name = BCancel.Name) or (TMNumEdit(Sender).Text = '') then
        Exit;

    if m_ExpIsOn then
        Exit;

	m_cJNTArea.setOthAppRecord;
    fnCMNBankInit(pBaseMjsRec, P_BANKDIC_MASTERCHECK);

    nBankCode := Trunc(EBankCode.Value);
    // 本店
    if (m_ACtl.Name = 'EBankCode') then
        nBraCode  := -1
    // 支店
    else
// <SCA> MOD-STR
//      nBraCode  := Trunc(EBankCode.Value);
        nBraCode  := Trunc(EBranchCode.Value);
// <SCA> MOD-STR

	try
        iExpRtn := fnCMNBankShow(nBankCode,
                                 nBraCode,
                                 strAllBankName,
                                 strBranchName,
                                 strBankKanaName,
                                 strBraKanaName);

        if(iExpRtn <> 1)then
            Exit;
	finally
		fnCMNBankFree ;
		m_cJNTArea.setMasAppRecord;
	end;

    // 本店
    if (TComponent(Sender).Name = 'EBankCode') then
    begin
        EBankCode.InputFlag	    := False;
        EBankName.Text          := strAllBankName;
        EBankKana.Text          := strBankKanaName;

        EBranchCode.SetFocus;
    end
    // 支店
    else
    begin
        EBranchCode.InputFlag	:= False;
        EBranchName.Text        := strBranchName;
        EBranchKana.Text        := strBraKanaName;

        BUpdate.SetFocus;
    end;
end;
// <BDIC> ADD-END

// <SCA> ADD-STR
//*****************************************************************************
//	Process			:	債務共通INIファイルから設定値を取得する
//	Name			:	T.SATOH(GSOL)
//	Date			:	2014/08/20
//	Parameter		:	sSection 	: String
//						sKey 		: String
//	Return			:	設定値
//	History			:	YYYY/MM/DD
//*****************************************************************************
function TJNTCRP004007BankF.GetPayCommonValue(sSection, sKey: String): String;
const
    APG_FILE = 'MAS\PRG\PayControl.APG';
var
	_pRec       : ^TMjsAppRecord;
	cComArea    : rcCOMMONAREA;
	sPath       : String;
	sFile       : String;
    oIniFile    : TIniFile;
begin
    Result := '';

	_pRec := pointer(pMjsRec);
	cComArea := rcCOMMONAREA(pMjsRec^.m_pCommonArea^);

	sPath := cComArea.SysRoot;
    if not IsPathDelimiter(sPath, Length(sPath)) then sPath := sPath + '\';

    sFile := sPath + APG_FILE;

    if FileExists(sFile) then
    begin
        oIniFile := Nil;
        try
            oIniFile := TIniFile.Create(sFile);
            Result := oIniFile.ReadString(sSection, sKey, '');
        finally
            if Assigned(oIniFile) then oIniFile.Free;
        end;
    end;
end;
// <SCA> ADD-END

end.
