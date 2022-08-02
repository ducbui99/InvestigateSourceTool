//************************************************************************
//	System		:	Gali/GaliNX-I/MLX給与
//  Program		:   依頼先銀行コード変更
//	ProgramID	:	JNTCRP008002_ChgDlgU
//	Name		:   新保一馬
//	Create		:   2013/08/14
//	Comment		:   XXXX注意事項等XXXXXXXXXXXXX
//				:	XXXXXXXXXXXXXXXXXXXXXXXXX
//	History		:	2016/02/25	T.Shinoda(Lab)
//  			:		<160225>共通銀行と銀行辞書が同じコードの場合、正しく名称が取得できない不具合を修正
//	            :	2019/02/14	K.Shinbo(MJS)
//  			:		<190214>排他がクリアされない不具合修正（ZCC-0050）
//************************************************************************
unit JNTCRP008002_ChgDlgU;

interface

{$I JNTSysDef.inc}

uses
	Windows,
	Messages,
	SysUtils,
	Classes,
	VCL.Graphics,
	VCL.Controls,
	VCL.Forms,
	VCL.Dialogs, MJSCommonDialogs,
	MJSEdits,
	VCL.StdCtrls,
	MJSLabel,
	VCL.ExtCtrls,
	MJSPanel,
	Buttons,
	MJSBitBtn,
	MJSTab,
	MJSSpeedButton,
	DBCtrls,
	dxTL,
	dxDBGrid,
	dxCntner,
	ComCtrls,
	MJSStatusBar,
	ppDB,
	ppDBPipe,
	ppBands,
	ppCtrls,
	ppVar,
	ppPrnabl,
	ppClass,
	ppCache,
	ppComm,
	ppRelatv,
	ppProd,
	ppReport,
	Db,
	dxmdaset,
	dxGrClms,
	MJSDispCtrl,
	MjsDBModuleU,
	MJSQuery,
	FireDAC.Comp.Client,
	Menus,
	ppTxPipe,
	ppModule,
	daDatMod,
	CMNExpFuncExU,
	MjsExceptU,
	MjsPrnSupportU,
	MjsPrnDlgU,
	MjsStrCtrl,
    MjsKeyDataState,
	MJSCommonu,
    JNTMasComu,
    JNTCommonu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
{$I ActionInterface.inc}

  TJNTCRP008002_ChgDlgF = class(TForm)
    MPanel1: TMPanel;
    MLabel2: TMLabel;
    MLabel3: TMLabel;
    MLBranch: TMLabel;
    MLabel5: TMLabel;
    LBankName: TMLabel;
    LBranchName: TMLabel;
    OKBtn: TMBitBtn;
    CancelBtn: TMBitBtn;
    MLCode: TMLabel;
    MLKana: TMLabel;
    MFurigana1: TMFurigana;
    MLabel9: TMLabel;
    MLabel10: TMLabel;
    LBankCode: TMLabel;
    LBranchCode: TMLabel;
    ECode: TMNumEdit;
    MLabel7: TMLabel;
    LEmpCount: TMLabel;
    MLabel17: TMLabel;
    PBankName: TMPanel;
    EName: TMTxtEdit;
    EKana: TMTxtEdit;
    SpMSHist: TFDStoredProc;

    procedure FormCreate(Sender: TObject);
	procedure CancelBtnClick(Sender: TObject);
	procedure OKBtnClick(Sender: TObject);
    procedure MFurigana1CompositionStr(Sender: TObject; Value: String);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure fnWCTLEnter(Sender: TObject);
    procedure fnWCTLChange(Sender: TObject);
    procedure fnWCTLExit(Sender: TObject);
    procedure EKanaKeyPress(Sender: TObject; var Key: Char);
    procedure ECodeArrowClick(Sender: TObject);

  private
	{ Private 宣言 }
	m_pRec			: ^TMjsAppRecord;
	m_Base_pRec		: ^TMjsAppRecord;
	recCommon		: rcCOMMONAREA;
    m_cComArea      : TJNTMASCom;
    m_cJNTArea      : TJNTCommon;
	DMQuery			: TMQuery;
	ACControl		: TWinControl;
	MDataModule		: TMDataModuleF;
	m_CorpDB		: TFDConnection;
    m_Owner			: TComponent;

	pmodExp			: TMjsExceptDBMF;											// 排他制御モジュール object pointer

	bFst			: Boolean;
	bBankChange		: Boolean;
	iBeforeCode		: Integer;

    exAfBankNCode	: Extended;

	m_iRatio		: Integer;

	function		fnGetBankName(sBank:String;var sBankName,sBankKana:String):Boolean;
	function		fnGetBranchName(sBank,sBranch:String;var sBranchName,sBranchKana:String):Boolean;
	procedure		fnInit;
	function		fnUpDateCheck:Boolean;
	function		fnSetExcept : Integer;										// 排他制御 設定
	procedure		fnResetExcept;												// 排他制御 解除
	procedure		fnUpDate;
    procedure		SessionPractice(iSyori : Integer);							// ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行

  public
	exBfBankNCode	: Extended;
	iBankCode		: Integer;
	iBranchCode		: Integer;
	bNewCode		: Boolean;
	bDelCode		: Boolean;

	constructor		CreateDialog(AOwner:TComponent; pRec:Pointer; CorpDB:TFDConnection; Base_pRec:Pointer; cJNTArea: TJNTCommon);
	procedure		CMChildKey(var Msg : TWMKey);message CM_CHILDKEY;

  end;

implementation

uses
	JNTCRP008002u;

{$R *.DFM}

//******************************************************************************
//	constructor	: CreateForm
//	Memo		: フォーム生成
//	Parameters	:   AOwner  : オーナーコンポーネント
//					pRec	: TMjsAppRecord 型 構造体 ポインタ
//					CorpDB  : TDatabase
//					Base_pRec : TMjsAppRecord 型 構造体 ポインタ(TJNTCommon.setxxxによるrcSYSTEMAREA切替用)
//					cJNTArea  : TJNTCommon
//	Return		:
//******************************************************************************
constructor	TJNTCRP008002_ChgDlgF.CreateDialog(AOwner:TComponent; pRec:Pointer; CorpDB:TFDConnection; Base_pRec:Pointer; cJNTArea: TJNTCommon);
begin
	bFst		:= True;

	m_Owner		:= AOwner;
	m_pRec		:= pRec;
	recCommon	:= rcCOMMONAREA(m_pRec^.m_pCommonArea^);
	m_cComArea	:= TJNTMASCom  (m_pRec^.m_pSystemArea^);
	MDataModule	:= TMDataModuleF(m_pRec^.m_pDBModule^);

    m_Base_pRec	:= Base_pRec;
    m_cJNTArea  := cJNTArea;

	m_CorpDB	:= CorpDB;

   	DMQuery		:= TMQuery.Create(Self);
	MDataModule.SetDBInfoToQuery(m_CorpDB,DMQuery);

{$IFDEF _JNT_GALILEOPT_}
	pmodExp		:= TMjsExceptDBMF(m_pRec^.m_pExpModule);
{$ENDIF}

{$IFDEF _JNT_MJSLINK_NX_I_}
	pmodExp		:= TMjsExceptDBMF(m_pRec^.m_pExpModule^);
{$ENDIF}

	Create(m_Owner);
end;

//******************************************************************************
//	Component	: JNTCRP008002_ChgDlgF
//	Event		: Create
//	Memo		: フォーム作成
//******************************************************************************
procedure TJNTCRP008002_ChgDlgF.FormCreate(Sender: TObject);
begin
	ACControl			:= ECode;

	fnInit;

	MjsColorChange(	TJNTCRP008002_ChgDlgF(Self),
					m_cComArea.SystemArea.SysColorB,
					m_cComArea.SystemArea.SysColorD,
					m_cComArea.SystemArea.SysBaseColorB,
					m_cComArea.SystemArea.SysBaseColorD,
					recCommon.SysFocusColor);

	m_iRatio := MjsFontResize(self,Pointer(m_pRec));

  	MDataModule.SetDBInfoToSProc(m_CorpDB,SpMSHist);

// 登録件数はGaliは非表示、MLXは表示
{$IFDEF _JNT_GALILEOPT_}
	MLabel7.Visible		:= False;
    LEmpCount.Visible	:= False;
    MLabel17.Visible	:= False;
{$ENDIF}

{$IFDEF _JNT_MJSLINK_NX_I_}
	MLabel7.Visible		:= True;
    LEmpCount.Visible	:= True;
    MLabel17.Visible	:= True;
{$ENDIF}

end;

//******************************************************************************
//	Component	: JNTCRP008002_ChgDlgF
//	Event		: Destroy
//	Memo		: フォーム消失
//******************************************************************************
procedure TJNTCRP008002_ChgDlgF.FormDestroy(Sender: TObject);
begin
	DMQuery.Close;
	DMQuery.Free;
end;

//******************************************************************************
//	Component	: JNTCRP008002_ChgDlgF
//	Event		: Show
//	Memo		: フォーム表示
//******************************************************************************
procedure TJNTCRP008002_ChgDlgF.FormShow(Sender: TObject);
var
	sName		:	String;
	sKana		:	String;
begin
	if bFst then
	begin
		try
			bBankChange			:= (iBranchCode = -1);
			LBankCode.Caption	:= MjsEditNum(iBankCode,'0000',4);
			fnGetBankName(LBankCode.Caption,sName,sKana);
            LBankName.Caption	:= sName;

// 銀行コード変更時
			if bBankChange then
			begin
				LBranchCode.Visible	:= False;
				LBranchName.Visible	:= False;
				MLBranch.Visible	:= False;
				ECode.Digits		:= 4;
				ECode.FormatStr		:= '0000';
				ECode.Zero			:= True;
				iBeforeCode			:= iBankCode;
			end
// 支店コード変更時
			else
			begin
				Self.Caption		:= '支店コード変更';
				LBranchCode.Caption	:= MjsEditNum(iBranchCode,'0000',3);
				fnGetBranchName(LBankCode.Caption,LBranchCode.Caption,sName,sKana);
                LBranchName.Caption	:= sName;

				// 銀行コード のラベルを上にあげる
                MLabel2.Left		:= Trunc(12 * m_iRatio / 100);
                MLabel2.Top			:= Trunc(10 * m_iRatio / 100);
                LBankCode.Top		:= Trunc(10 * m_iRatio / 100);
                LBankName.Top		:= Trunc(10 * m_iRatio / 100);

                //【変更前】ラベルを下げる
                MLabel5.Top			:= Trunc(35 * m_iRatio / 100);

				MLCode.Caption		:= '支店コード';
				MLKana.Caption		:= '支店名称カナ';
				ECode.Digits		:= 3;
				ECode.FormatStr		:= '000';
				ECode.Zero			:= True;
				iBeforeCode			:= iBranchCode;
			end;

// 登録件数はGaliは非表示、MLXは表示
{$IFDEF _JNT_MJSLINK_NX_I_}
			try
				with DMQuery do
				begin
					Close;
					SQL.Clear;

                    SQL.Add('select count(*) Cnt from '
						+	' (select distinct CorpNCode,EmpNCode from HAPSF SF '
						+	' inner join AccInfo AInf on (SF.IraiNCode = AInf.NCode) '
						+	' inner join BankInfo BInf on (AInf.BankNCode = BInf.NCode) '
						+	' where BInf.AllBkCode = :pAllBkCode ');

                    // 支店コード変更の際は、支店コードもしぼる
                    if not bBankChange then
                    begin
                    	SQL.Add(' and BInf.AllBraCode = :pAllBraCode ');
                    end;
                    SQL.Add(' and (SF.QyoFuriKbn <> 0 or SF.ShoFuriKbn <> 0)) Kensu ');


                    SetFld('pAllBkCode').AsInteger := StrToInt(LBankCode.Caption);

                    // 支店コード変更の際は、支店コードもしぼる
                    if not bBankChange then
                    begin
	                    SetFld('pAllBraCode').AsInteger := StrToInt(LBranchCode.Caption);
                    end;

					Open(True);

					LEmpCount.Caption	:= GetFld('Cnt').AsString;
				end;
			except
				MjsMessageBox(Self,'登録件数の取得に失敗しました。',mjError,mjDefOk);
			end;
{$ENDIF}
		finally
			bFst	:= False;
		end;
	end;

	MFurigana1.Control	:= nil;
	MFurigana1.Control	:= EName;
end;

//**********************************************************************
//		Component	:CancelBtn2
//		Event		:Click
//		Name		:HZM
//**********************************************************************
procedure TJNTCRP008002_ChgDlgF.CancelBtnClick(Sender: TObject);
begin
	ModalResult	:= mrCancel;
end;

//**********************************************************************
//		Component	:OKBtn2
//		Event		:Click
//		Name		:HZM
//**********************************************************************
procedure TJNTCRP008002_ChgDlgF.OKBtnClick(Sender: TObject);
begin
//ショートカットキー対応
	if ACControl is TMNumEdit then
		(ACControl as TMNumEdit).OnExit(ACControl);

	if fnUpDateCheck then
		exit;

	if MjsMessageBox(Self,'コード変更を開始してもよろしいですか？',mjQuestion,mjDefYes) <> mrYes then
		exit;

	try
		//	会社単独設定<190214>try外だったのをtry内に移動してfinallyでの排他解除が実行されるようにした
		if fnSetExcept <> 1 then													// 排他制御 設定 : 異常
			exit;

		try
			MDataModule.BeginTran(m_CorpDB);

			fnUpDate;

			if m_CorpDB.InTransaction then
				m_CorpDB.Commit;
		except
			if m_CorpDB.InTransaction then
				m_CorpDB.Rollback;

			ModalResult	:= mrCancel;
			exit;
		end;
	finally
//	会社単独解除
		fnResetExcept;															// 排他制御 解除
	end;

	ModalResult	:= mrOk;
end;

//******************************************************************************
//	Component		:	MFurigana1
//  Event			:	CompositionStr
//	Name			:	T.Shinoda
//	Date			: 	05/04/06
//******************************************************************************
procedure TJNTCRP008002_ChgDlgF.MFurigana1CompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText	: String;
begin
	if MjsHanLength( EKana.Text ) < EKana.MaxLength then
	begin
		sKanaText		:=EKana.Text + Value;
		EKana.Text		:=MjsHanCopy(sKanaText,1,EKana.MaxLength);
	end;
end;

//**********************************************************************
//		Component	:Form
//		Event		:CMChildKey
//		Name		:HZM
//**********************************************************************
procedure TJNTCRP008002_ChgDlgF.CMChildKey(var Msg: TWMKey);
var
	sShift	: TShiftState;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	sShift	:= MjsKeyDataToShiftState(Msg.KeyData);

	case Msg.CharCode of

		VK_RETURN,
		VK_DOWN	:
		begin
			if ACControl is TMBitBtn then
				exit;

			Msg.CharCode	:= 0;
			MjsNextCtrl(Self);
			abort;
		end;

		VK_RIGHT	:
		begin
			if ACControl is TMBitBtn then
				exit;

			if ACCOntrol is TMTxtEdit then
			begin
				if not MjsChkCurEnd(ACControl) then
					exit;
			end;

			MjsNextCtrl(Self);
		end;

		VK_UP	:
		begin
			MjsPrevCtrl(Self);
			Msg.CharCode	:= 0;
			abort;
		end;

		VK_LEFT	:
		begin
			if ACCOntrol is TMTxtEdit then
			begin
				if not MjsChkCurTop(ACControl) then
					exit;
			end;

			MjsPrevCtrl(Self);
			Msg.CharCode	:= 0;
			abort;
		end;

		VK_ESCAPE:
		begin
			CancelBtnClick(Nil);
		end;

		VK_END:
		begin
			if (ACControl is TMTxtEdit) then
			begin
				if not MjsChkCurEnd(ACControl) then
					exit;
			end;

			OKBtn.SetFocus;
		end;

		else	exit;
	end;

	Msg.CharCode	:= 0;;
end;

//******************************************************************************
//	Function	:	fnSetExcept
//	Memo		:	排他制御 設定
//	Parameters	:
//	Return		:	Integer	:	処理区分
//									1	:	正常
//									-1	:	異常
//******************************************************************************
function TJNTCRP008002_ChgDlgF.fnSetExcept : Integer;
var
	iStatus : Integer;
begin
	result := -1;

{$IFDEF _JNT_GALILEOPT_}
	// 債務の排他
	iStatus := pmodExp.SetExcept(   ueCop
                                    ,3110
                                    ,54
                                    ,m_pRec^.m_iCorpCode
                                    ,m_pRec^.m_iCorpSubCode
                                    ,8000
                                    ,0
                                    ,260
                                    ,0);
	// 債権の排他
    if iStatus = 0 then
    begin
        iStatus := pmodExp.SetExcept(   ueCop
                                        ,3110
                                        ,56
                                        ,m_pRec^.m_iCorpCode
                                        ,m_pRec^.m_iCorpSubCode
                                        ,8000
                                        ,0
                                        ,250
                                        ,0);
    end;
	// 給与の排他
    if iStatus = 0 then
    begin
        iStatus := pmodExp.SetExcept(   ueCop
                                        ,3210
                                        ,0
                                        ,m_pRec^.m_iCorpCode
                                        ,m_pRec^.m_iCorpSubCode
                                        ,8000
                                        ,0
                                        ,710
                                        ,0);
    end;
{$ENDIF}

{$IFDEF _JNT_MJSLINK_NX_I_}
	iStatus := pmodExp.SetExcept(   ueCop	// 会社単独
                                    ,3210
                                    ,0
                                    ,m_pRec^.m_iCorpCode
                                    ,m_pRec^.m_iCorpSubCode
                                    ,190400
                                    ,recCommon.TantoNCD);
{$ENDIF}

	if iStatus <> 0 then
	begin
		Beep;
		MjsMessageBox(Self,'他で使用中のため、処理を行うことができません。',mjError,mjDefOk);
		exit;
	end;

	result := 1;
end;

//******************************************************************************
//	Function	:	fnResetExcept
//	Memo		:	排他制御 解除
//	Parameters	:
//	Return		:
//******************************************************************************
procedure TJNTCRP008002_ChgDlgF.fnResetExcept;
begin
{$IFDEF _JNT_GALILEOPT_}
	// 債務の排他
	pmodExp.ResetExcept(   ueCop
                          ,3110
                          ,54
                          ,m_pRec^.m_iCorpCode
                          ,m_pRec^.m_iCorpSubCode
                          ,8000
                          ,0
                          ,260
                          ,0);
	// 債権の排他
    pmodExp.ResetExcept(   ueCop
                          ,3110
                          ,56
                          ,m_pRec^.m_iCorpCode
                          ,m_pRec^.m_iCorpSubCode
                          ,8000
                          ,0
                          ,250
                          ,0);
	// 給与の排他
    pmodExp.ResetExcept(   ueCop
                          ,3210
                          ,0
                          ,m_pRec^.m_iCorpCode
                          ,m_pRec^.m_iCorpSubCode
                          ,8000
                          ,0
                          ,710
                          ,0);
{$ENDIF}

{$IFDEF _JNT_MJSLINK_NX_I_}
	pmodExp.ResetExcept(   ueCop	// 会社単独
                          ,3210
                          ,0
                          ,m_pRec^.m_iCorpCode
                          ,m_pRec^.m_iCorpSubCode
                          ,190400
                          ,recCommon.TantoNCD);
{$ENDIF}
end;

//**********************************************************************
//		function	:fnGetBankName
//		Parameter	:    銀行コード
//					 var 銀行名
//					 var 銀行カナ
//		Return		:BankInfoに存在するか(True:存在、False:存在しない)
//**********************************************************************
function TJNTCRP008002_ChgDlgF.fnGetBankName(sBank:String;var sBankName,sBankKana:String):Boolean;
var
	iRtn			: Integer;
    nBankCD			: Integer;
    nOfficeCD		: Integer;
    sDicBankName 	: string;
    sDicBankKana	: string;
    sDicOfficeName	: string;
    sDicOfficeKana	: string;
begin
	result		:= False;
	sBankName	:= '';
	sBankKana	:= '';

	try
		with DMQuery do
		begin
			Close;
			SQL.Clear;
			SQL.Add('select top 1 BankName,BankKanaName from BankInfo '
            	+	' where MasterKbn = 21 '
                +	'   and AllBkCode = :pAllBkCode '
                +	'   and RDelKbn = 0 '
                +	' order by AllBraCode');

            SetFld('pAllBkCode').AsInteger	:= StrToInt(sBank);

			Open(True);

			if not Eof then
			begin
				result		:= True;
				sBankName	:= GetFld('BankName').AsString;
				sBankKana	:= GetFld('BankKanaName').AsString;
			end
            else
            begin
            	// BankInfoになければ銀行辞書を検索
				m_cJNTArea.setOthAppRecord;										//rcSYSTEMAREAに変更
                fnCMNBankInit(m_Base_pRec, P_BANKDIC_MASTERCHECK) ;				//初期化です

                try
                    try
                        //検索ｴｸｽﾌﾟﾛｰﾗを表示します
                        {内部処理
                         表示方法はツリー（コード順・五十音順）と検索パネル上から連想文字列と金融機関
                         と店舗を入力することで絞込みが可能です
                         また実行時にnOfficeCD=-1にすると金融機関のみの検索が可能です
                        }
                        nBankCD     := StrToInt(sBank);
						nOfficeCD	:= -1;
                        iRtn:=fnCMNBankShow(	nBankCD,
                                                nOfficeCD,
                                                sDicBankName,
                                                sDicOfficeName,
                                                sDicBankKana,
                                                sDicOfficeKana		);

                        //呼出失敗
                        if(iRtn=-1)then
                            Abort;

                        //選択せず終了
                        if(iRtn<>1)then
                            Exit;
                    except
                        raise Exception.Create('全銀検索Exp呼出に失敗しました');
                    end;
                finally
                    fnCMNBankFree ;							 //開放します
					m_cJNTArea.setMasAppRecord;				//TJNTMASComに戻す
                end;

                sBankName	:= sDicBankName;
                sBankKana	:= sDicBankKana;

            end;
		end;
	except
		MjsMessageBox(Self,'銀行名称の読込に失敗しました。',mjError,mjDefOk);
	end;
end;

//**********************************************************************
//		function	:fnGetBranchName
//		Parameter	:    銀行コード
//						 支店コード
//					 var 支店名
//					 var 支店カナ
//		Return		:BankInfoに存在するか(True:存在、False:存在しない)
//**********************************************************************
function TJNTCRP008002_ChgDlgF.fnGetBranchName(sBank,sBranch:String;var sBranchName,sBranchKana:String):Boolean;
var
	iRtn			: Integer;
    nBankCD			: Integer;
    nOfficeCD		: Integer;
    sDicBankName 	: string;
    sDicBankKana	: string;
    sDicOfficeName	: string;
    sDicOfficeKana	: string;
begin
	result		:= False;
	sBranchName	:= '';
	sBranchKana	:= '';

	try
		with DMQuery do
		begin
			Close;
			SQL.Clear;
			SQL.Add('select BkBraName,BraKanaName from BankInfo '
            	+	' where MasterKbn = 21 '
                +	'   and AllBkCode = :pAllBkCode and AllBraCode = :pAllBraCode '
                +	'   and RDelKbn = 0');

            SetFld('pAllBkCode').AsInteger	:= StrToInt(sBank);
            SetFld('pAllBraCode').AsInteger	:= StrToInt(sBranch);

			Open(True);

			if not Eof then
			begin
				result		:= True;
				sBranchName	:= GetFld('BkBraName').AsString;
				sBranchKana	:= GetFld('BraKanaName').AsString;
			end
            else
            begin
            	// BankInfoになければ銀行辞書を検索
				m_cJNTArea.setOthAppRecord;										//rcSYSTEMAREAに変更
                fnCMNBankInit(m_Base_pRec, P_BANKDIC_MASTERCHECK) ;				//初期化です

                try
                    try
                        //検索ｴｸｽﾌﾟﾛｰﾗを表示します
                        {内部処理
                         表示方法はツリー（コード順・五十音順）と検索パネル上から連想文字列と金融機関
                         と店舗を入力することで絞込みが可能です
                         また実行時にnOfficeCD=-1にすると金融機関のみの検索が可能です
                        }
                        nBankCD     := StrToInt(sBank);
						nOfficeCD	:= StrToInt(sBranch);
                        iRtn:=fnCMNBankShow(	nBankCD,
                                                nOfficeCD,
                                                sDicBankName,
                                                sDicOfficeName,
                                                sDicBankKana,
                                                sDicOfficeKana		);

                        //呼出失敗
                        if(iRtn=-1)then
                            Abort;

                        //選択せず終了
                        if(iRtn<>1)then
                            Exit;
                    except
                        raise Exception.Create('全銀検索Exp呼出に失敗しました');
                    end;
                finally
                    fnCMNBankFree ;							 //開放します
					m_cJNTArea.setMasAppRecord;				//TJNTMASComに戻す
                end;

                sBranchName	:= sDicOfficeName;
                sBranchKana	:= sDicOfficeKana;

            end;
		end;
	except
		MjsMessageBox(Self,'支店名称の読込に失敗しました。',mjError,mjDefOk);
	end;
end;

//**********************************************************************
//		function	:fnInit
//		Parameter	:なし
//		Memo		:初期設定
//					:イベントセット
//**********************************************************************
procedure TJNTCRP008002_ChgDlgF.fnInit;
var
	i			:	Integer;
begin
	for i:=0 to ComponentCount-1 do
	begin
		//ｺﾝﾎﾟｰﾈﾝﾄ初期ｸﾘｱ
		if (Components[i] is TMLabel)and
			(Copy((Components[i] as TMLabel).Name,1,1)='L') then
		begin
			(Components[i] as TMLabel).Caption:='';
		end;

		//ｲﾍﾞﾝﾄ割り付け
		if Components[i] is TMNumEdit then
		begin
			(Components[i] as TMNumEdit).Value		:=0;
			(Components[i] as TMNumEdit).OnChange	:=fnWCTLChange;
			(Components[i] as TMNumEdit).OnEnter	:=fnWCTLEnter;
			(Components[i] as TMNumEdit).OnExit		:=fnWCTLExit;
		end;
		if Components[i] is TMTxtEdit then
		begin
			(Components[i] as TMTxtEdit).Text		:='';
			(Components[i] as TMTxtEdit).OnEnter	:=fnWCTLEnter;
		end;
		if Components[i] is TMBitBtn then
		begin
			(Components[i] as TMBitBtn).OnEnter		:=fnWCTLEnter;
		end;
	end;
end;

//**********************************************************************
//		function	:fnWCTLEnter
//		Parameter	:TObject
//		Memo		:EnterEvent
//					:
//**********************************************************************
procedure TJNTCRP008002_ChgDlgF.fnWCTLEnter(Sender: TObject);
begin
	ACControl	:= Screen.ActiveControl;
end;

//**********************************************************************
//		function	:fnWCTLExit
//		Parameter	:TObject
//		Memo		:ExitEvent
//					:
//**********************************************************************
procedure TJNTCRP008002_ChgDlgF.fnWCTLExit(Sender: TObject);
var
	sName		:	String;
	sKana		:	String;
begin
	if Sender = ECode then
	begin
		if bBankChange then
			fnGetBankName(IntToStr((Sender as TMNumEdit).AsInteger),sName,sKana)
		else
			fnGetBranchName(LBankCode.Caption,IntToStr((Sender as TMNumEdit).AsInteger),sName,sKana);

		if EName.Text = '' then		//<160225>
			EName.Text			:= sName;
		if EKana.Text = '' then		//<160225>
			EKana.Text			:= sKana;
	end;
end;

//**********************************************************************
//		function	:fnWCTLChange
//		Parameter	:TObject
//		Memo		:ChangeEvent
//					:
//**********************************************************************
procedure TJNTCRP008002_ChgDlgF.fnWCTLChange(Sender: TObject);
var
	sName		:	String;
	sKana		:	String;
    bExistsBankInfo : Boolean;
begin
	if Sender = ECode then
	begin
		if bBankChange then
			bExistsBankInfo := fnGetBankName(IntToStr((Sender as TMNumEdit).AsInteger),sName,sKana)
		else
			bExistsBankInfo := fnGetBranchName(LBankCode.Caption,IntToStr((Sender as TMNumEdit).AsInteger),sName,sKana);


		if not bExistsBankInfo then
		begin
			PBankName.Enabled	:= True;
		end
		else
		begin
			PBankName.Enabled	:= False;
		end;
	end;
end;

//**********************************************************************
//		function	:fnUpDateCheck
//		Parameter	:なし
//		Return		:True:更新不可 False:更新可
//					:
//**********************************************************************
function TJNTCRP008002_ChgDlgF.fnUpDateCheck: Boolean;
var
	sMsg		:	String;
begin
	result		:= True;
	bNewCode	:= True;

	if bBankChange then
	begin
		sMsg		:= '銀行';
	end
	else
	begin
		sMsg		:= '支店';
	end;

//	名称入力チェック
	if PBankName.Enabled then
	begin
		if EName.Text = '' then
		begin
			Beep;
			EName.SetFocus;
			MjsMessageBox(Self,sMsg+'名称が入力されていません。',mjWarning,mjDefOk);
			exit;
		end;
	end;

//	変更後コードチェック
	if (iBeforeCode = ECode.Value) then
	begin
		Beep;
		ECode.SetFocus;
		MjsMessageBox(Self,'変更後の'+sMsg+'コードが変更前と同じです。',mjWarning,mjDefOk);
		exit;
	end;

//	統合確認<入力コードが既存の時>
	if not PBankName.Enabled then
	begin
		if bBankChange then
		begin
			try
				with DMQuery do
				begin
// 支店コードの重複チェック
// 変更前後の銀行コードでひっかけて、支店コードでグルーピングしたとき、
// 支店が２件 と 求まるということは、重複してしまうということ。
					Close;
					SQL.Clear;
					SQL.Add('select count(AllBraCode) Cnt '
						+	' from BankInfo '
						+	' where MasterKbn=21 and RDelKbn=0 '
						+	'   and (AllBkCode = ' + LBankCode.Caption + ' or AllBkCode = ' + FloatToStr( ECode.Value ) + ') '
						+	' group by AllBraCode '
						+	' having Cnt = 2 ');
					Open(True);

					if not Eof then
					begin
						MjsMessageBox(Self,'変更後の銀行コードで、支店コードが重複します。'+#13#10+
									'コード変更は行えません。',mjWarning,mjDefOk);
						exit;
					end;
				end;
			except
				MjsMessageBox(Self,'支店コード重複チェックに失敗しました。',mjError,mjDefOk);
				exit;
			end;

  			MjsMessageBox(Self,'変更後の銀行情報に統合されます。'
       			+	#13#10	+	'統合後は口座管理情報を見直してください。',mjInformation,mjDefOk);

		end
        else
        begin
			if MjsMessageBox(Self,'変更後の'+sMsg+'情報に統合されます。'+#13#10+
			'変更前の'+sMsg+'情報を削除しますか？',mjQuestion,mjDefNo) <> mrYes then
				bDelCode	:= False
			else
				bDelCode	:= True;
        end;

		bNewCode	:= False;
	end;

	result		:= False;
end;

//**********************************************************************
//		function	:fnUpDate
//		Parameter	:なし
//		Return		:なし
//					:
//**********************************************************************
procedure TJNTCRP008002_ChgDlgF.fnUpDate;
const
	C_ST_PROCESS			= 0;												// 設定
    C_ED_PROCESS            = 1;                                                // 開放
var
	sMsg		:	String;
begin
	try

        SessionPractice(C_ST_PROCESS);

        try
            with DMQuery do
            begin
// 銀行コード変更
                if bBankChange then
                begin
                    sMsg		:= '銀行';

	                Close;
	                SQL.Clear;
                    SQL.Add('update BankInfo set '
                    	+	'        AllBkCode     = :pAfAllBkCode '						// 変更後銀行コード
                    	+	'       ,BankName      = :pBankName '							// 変更後銀行名
                    	+	'       ,BankKanaName  = :pBankKanaName '						// 変更後銀行カナ
                    	+	'       ,SimpleName    = :pBankName + ''/'' + BkBraName '		// 変更後銀行名/既存支店名
						+	'       ,UpdTantoNCode = :pUpdTantoNCode '                      // 担当者内部コード
                    	+	'where MasterKbn = 21 '
                    	+	'  and AllBkCode = :pBfAllBkCode '								// 変更前銀行コード
                    	+	'  and RDelKbn   = 0 ');

                    SetFld('pAfAllBkCode').AsInteger	:= ECode.AsInteger;
                    SetFld('pBankName').AsString		:= EName.Text;
                    SetFld('pBankKanaName').AsString	:= EKana.Text;
                    SetFld('pBfAllBkCode').AsInteger	:= StrToInt(LBankCode.Caption);
                    SetFld('pUpdTantoNCode').AsCurrency	:= recCommon.TantoNCD;

                    ExecSQL(True);
                end
// 支店コード変更
                else
                begin
                    sMsg		:= '支店';

// 支店コード変更　新規コード
                    if bNewCode then
                    begin
		                Close;
		                SQL.Clear;
                        SQL.Add('update BankInfo set '
                            +	'        AllBraCode    = :pAfAllBraCode '					// 変更後支店コード
                            +	'       ,BkBraName     = :pBkBraName '						// 変更後支店名
                            +	'       ,BraKanaName   = :pBraKanaName '					// 変更後支店カナ
                            +	'       ,SimpleName    = BankName + ''/'' + :pBkBraName '	// 既存銀行名/変更後支店名
							+	'       ,UpdTantoNCode = :pUpdTantoNCode '                  // 担当者内部コード
                            +	'where MasterKbn  = 21 '
                            +	'  and AllBkCode  = :pBfAllBkCode '						// 変更前銀行コード
                            +	'  and AllBraCode = :pBfAllBraCode '					// 変更前支店コード
                            +	'  and RDelKbn    = 0 ');

                        SetFld('pAfAllBraCode').AsInteger	:= ECode.AsInteger;
                        SetFld('pBkBraName').AsString		:= EName.Text;
                        SetFld('pBraKanaName').AsString		:= EKana.Text;
                        SetFld('pBfAllBkCode').AsInteger	:= StrToInt(LBankCode.Caption);
                        SetFld('pBfAllBraCode').AsInteger	:= StrToInt(LBranchCode.Caption);
	                    SetFld('pUpdTantoNCode').AsCurrency	:= recCommon.TantoNCD;

                        ExecSQL(True);
                    end
// 支店コード変更　既存コード
                    else
                    begin
                    	// 変更前の支店を削除するとき
                    	if bDelCode then
                        begin

                            // 依頼先銀行の削除
                            Close;
                            SQL.Clear;
                            SQL.Add('update BankInfo set '
                            	+	'        RDelKbn       = 1 '
                                +	'       ,UpdTantoNCode = :pUpdTantoNCode '
                                +	' where NCode = :pNCode ');
                            SetFld('pNCode').AsString		:= FloatToStr(exBfBankNCode);
		                    SetFld('pUpdTantoNCode').AsCurrency	:= recCommon.TantoNCD;

                            ExecSQL(True);

{$IFDEF _JNT_GALILEOPT_}
                            // 手数料情報の削除
                            Close;
                            SQL.Clear;
                            SQL.Add('delete FeeInfo where BankNCode = :pBankNCode');
                            SetFld('pBankNCode').AsString	:= FloatToStr(exBfBankNCode);

                            ExecSQL(True);
{$ENDIF}
                        end;

                        // 口座情報の変更
                        // ①変更後のBankInfoの内部コードを取得
                        Close;
                        SQL.Clear;
                        SQL.Add('select NCode from BankInfo '
                            +	'where MasterKbn  = 21 '
                            +	'  and AllBkCode  = :pAllBkCode '
                            +	'  and AllBraCode = :pAllBraCode '
                            +	'  and RDelKbn    = 0');
                        SetFld('pAllBkCode').AsInteger	:= StrToInt(LBankCode.Caption);
                        SetFld('pAllBraCode').AsInteger	:= ECode.AsInteger;

                        Open(True);

                        if not EOF then
                        begin
                            exAfBankNCode := GetFld('NCode').AsFloat;
                        end;

                        // ②AccInfoをupdate
                        Close;
                        SQL.Clear;
                        SQL.Add('update AccInfo set '
                        	+	'        BankNCode     = :pAfBankNCode '
                            +	'       ,UpdTantoNCode = :pUpdTantoNCode '
                            +	' where BankNCode = :pBfBankNCode ');
                        SetFld('pAfBankNCode').AsString	:= FloatToStr(exAfBankNCode);
                        SetFld('pBfBankNCode').AsString	:= FloatToStr(exBfBankNCode);
	                    SetFld('pUpdTantoNCode').AsCurrency	:= recCommon.TantoNCD;

                        ExecSQL(True);
                    end;
                end;
            end;
        except
            MjsMessageBox(Self,sMsg+'コードの変更処理に失敗しました。',mjError,mjDefOk);
            abort;
        end;
    finally
        SessionPractice(C_ED_PROCESS);
    end;
end;

//******************************************************************************
//	Component	: EKana
//	Event		: KeyPress
//	Memo		: キーを押下時（Org.JNTCRP008002u）
//******************************************************************************
procedure TJNTCRP008002_ChgDlgF.EKanaKeyPress(Sender: TObject;
  var Key: Char);
begin
	// 有効な文字のみ、入力させる
	case (Key) of
		Char (VK_BACK),
		Char (VK_ESCAPE),
		Char (VK_RETURN),'0'..'9','A'..'Z','ｱ'..'ﾝ','ｦ',' ','ﾞ','ﾟ','｢','｣','\','/',',','.','-','(',')' :
			begin
			end;
		'ｧ':		Key	:= 'ｱ';
		'ｨ':		Key	:= 'ｲ';
		'ｩ':		Key	:= 'ｳ';
		'ｪ':		Key	:= 'ｴ';
		'ｫ':		Key	:= 'ｵ';
		'ｬ':		Key	:= 'ﾔ';
		'ｭ':		Key	:= 'ﾕ';
		'ｮ':		Key	:= 'ﾖ';
		'ｯ':		Key	:= 'ﾂ';
		'{':		Key	:= '(';
		'[':		Key	:= '(';
		'}':		Key	:= ')';
		']':		Key	:= ')';
		'ｰ':		Key	:= '-';
		'a'..'z':	Key	:= Chr (Ord (Key) - 32);
		else		Abort ();
	end;
end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行
//	Parameter	:   iSyori 0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP008002_ChgDlgF.SessionPractice(iSyori : Integer);
begin
												// 処理区分
	SpMSHist.ParamByName('@pSyoriKbn').AsInteger := iSyori;
			                   					// 履歴取得区分
	SpMSHist.ParamByName('@pMSHistKbn').AsInteger    := 1;
    											// 担当者内部ｺｰﾄﾞ
    SpMSHist.ParamByName('@pTanNCode').AsCurrency    := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD;
    											// 担当者名称
    SpMSHist.ParamByName('@pTanSimpleName').AsString := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoName;
    											// ｼｽﾃﾑｺｰﾄﾞ
    SpMSHist.ParamByName('@pSysCode').AsInteger      := m_pRec^.m_iSystemCode;
    											// ｵﾌﾟｼｮﾝｺｰﾄﾞ
    SpMSHist.ParamByName('@pOptCode').AsInteger      := m_pRec^.m_iOptionCode;
    											// 処理ｺｰﾄﾞ
    SpMSHist.ParamByName('@pPrgCode').AsInteger      := m_pRec^.m_iProgramCode;

// Delphi10 ST
//    SpMSHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SpMSHist.FetchOptions.Items := SpMSHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
    SpMSHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SpMSHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED
end;

//******************************************************************************
//	Component	: ECode
//	Event		: ArrowClick
//	Memo		: [...]を押下時
//******************************************************************************
procedure TJNTCRP008002_ChgDlgF.ECodeArrowClick(Sender: TObject);
var
	nBankCD		:  	integer;
	nOfficeCD	:  	integer;
	sBankName	:	string;
	sOfficeName	:	string;
	sBankKana	:	string;
	sOfficeKana	:	string;
	iRtn		:	integer;
begin

// 銀行コード変更時
	if bBankChange then
    begin

		m_cJNTArea.setOthAppRecord;										//rcSYSTEMAREAに変更
        fnCMNBankInit(m_Base_pRec, P_BANKDIC_BANKFIND);					//初期化です
        try
            try
                //検索ｴｸｽﾌﾟﾛｰﾗを表示します
                {内部処理
                 表示方法はツリー（コード順・五十音順）と検索パネル上から連想文字列と金融機関
                 と店舗を入力することで絞込みが可能です
                 また実行時にnOfficeCD=-1にすると金融機関のみの検索が可能です
                }
                nOfficeCD := -1;

                iRtn:=fnCMNBankShow(	nBankCD,
                                        nOfficeCD,
                                        sBankName,
                                        sOfficeName,
                                        sBankKana,
                                        sOfficeKana		);

                //呼出失敗
                if(iRtn=-1)then
                    Abort;

                //選択せず終了
                if(iRtn<>1)then
                    Exit;
            except
                raise Exception.Create('全銀検索Exp呼出に失敗しました');
            end;
        finally
            fnCMNBankFree;							//開放します
			m_cJNTArea.setMasAppRecord;				//TJNTMASComに戻す
        end;

        ECode.Value		:= nBankCD;
        EName.Text		:= sBankName;
        EKana.Text		:= sBankKana;

	end
// 支店コード変更時
    else
    begin

		m_cJNTArea.setOthAppRecord;										//rcSYSTEMAREAに変更
		fnCMNBankInit(m_Base_pRec, P_BANKDIC_TENPOFINDONLY);			//初期化です
        try
            try
                //検索ｴｸｽﾌﾟﾛｰﾗを表示します
                {内部処理
                 表示方法はツリー（コード順・五十音順）と検索パネル上から連想文字列と金融機関
                 と店舗を入力することで絞込みが可能です
                 また実行時にnOfficeCD=-1にすると金融機関のみの検索が可能です
                }
                nBankCD     := StrToInt(LBankCode.Caption);
                nOfficeCD	:= 0;

                iRtn:=fnCMNBankShow(	nBankCD,
                                        nOfficeCD,
                                        sBankName,
                                        sOfficeName,
                                        sBankKana,
                                        sOfficeKana		);
                //呼出失敗
                if(iRtn=-1)then
                    Abort;

                //選択せず終了
                if(iRtn<>1)then
                    Exit;

            except
                raise Exception.Create('全銀検索Exp呼出に失敗しました');
            end;
        finally
            fnCMNBankFree;							 //開放します
			m_cJNTArea.setMasAppRecord;				//TJNTMASComに戻す
        end;

        ECode.Value		:= nOfficeCD;
        EName.Text		:= sOfficeName;
        EKana.Text		:= sOfficeKana;

    end;

    ECode.SetFocus;
    keybd_event(VK_RETURN, 0, 0, 0); // Enterキーエミュレート
end;

end.

