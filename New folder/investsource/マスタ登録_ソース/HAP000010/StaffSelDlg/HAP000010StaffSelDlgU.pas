//************************************************************************
//	System		:	MJSFX
//	Program		:	新規社員登録ダイアログ
//	ProgramID	:	HAP000010StaffSelDlg
//	Name		:	T.Shinoda(Lab)
//	Create		:	2008/02/26
//	Memo		:	・担当者取り込みダイアログをベースに
//				:	　新規社員登録ダイアログの作成
//				:
//	History		:	2007/03/23 S.Hirota(PRIME)	<マスタ同期>
//				:	2007/05/10 S.Suzuki(PRIME)	SecHojyoDispInfoのﾒﾝﾃﾅﾝｽ
//				:	2008/02/15 T.Shinoda(Lab)
//				:	・ﾏｽﾀ更新履歴対応											<2008-02-15>
//				:	2008/04/03 T.Shinoda(Lab)
//				:	・簡略名称と連想の未入力時のメッセージ不具合を修正			<080403>
//				:	2008/06/20 T.Shinoda(Lab)
//				:	・MJSCOMMON.DB ﾏｽﾀ更新履歴対応								<080811>
//				:	2009/08/11 T.Shinoda(Lab)
//				:	・ガードされた担当者が選択状態のままになる不具合を修正		<090811>
//				:	2010/01/06 T.Shinoda(Lab)
//				:	・対応担当者個人情報項目セキュリティ強化対応				<100106>
//				:	2010/01/21 T.Shinoda(Lab)
//				:	・セキュリティ強化対応 生年月日入力欄非表示対応				<100121>
//				:	2010/01/21 H.Takaishi(TakumiCo.)
//				:	・担当者検索で登録済み社員を選択した場合の制御を修正		<2010-01-21>
//				:	2010/12/02 Y.Kondo(TakumiCo.)
//				:	・登録時の担当者一致を氏名完全一致に変更					<2010-12-01>
//				:	・氏名欄空で簡略名称・連想もクリアするように対応			<2010-12-02>
//				:	2011/04/22 Y.Kondo(TakumiCo.)
//				:	・社員コード自動採番対応									<2011-04-22>
//				:	2012/08/20	Y.Kondo
//				:	担当者管理変更対応
//				:	マスタ同期に関する箇所を削除
//				:	2019/03/19	K.Takahashi(CyberCom)
//				:	新元号対応(Gengou)
//				:	2020/04/14 R.Masuno(CyberCom)
//				:	Delphi10移行 Unicode対応									<D10-U>
//				:	ストアドプロシージャ対応									<D10-Stored>
//************************************************************************
unit HAP000010StaffSelDlgU;

interface

uses
	Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls,
	VCL.Forms, VCL.Dialogs, Buttons, DB, FireDAC.Comp.Client,
	VCL.StdCtrls, VCL.ExtCtrls, ComCtrls, VCL.ImgList,
	dxCntner, dxTL, dxDBGrid, dxGrClms, dxmdaset,
	MJSBitBtn, MJSEdits, MJSPanel, MjsDBModuleu, MJSQuery, MJSCommonU,
	MJSDispCtrl, MjsDateCtrl, MjsMsgStdu, MjsKeyDataState,
	MJSStatusBar, MJSDBNavigator, MJSSpeedButton, MJSLabel,
	HapLibU, HapMsgU, HapSYLockU,
	MjsStrCtrl,	//<D10-U>
	HapStaffExpU, FireDAC.Stan.Param, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.ImageList, FireDAC.Comp.DataSet;

const
	YEAR_KBN_WAREKI		= 0;
	YEAR_KBN_SEIREKI	= 1;

type
// <NewEraName-P1> ADD Start
{$I HAPEraNameCtrl_H.inc}
// <NewEraName-P1> ADD End
  THAP000010StaffSelDlgF = class(TForm)
	StsBar: TMStatusBar;
	pnlTop: TMPanel;
	LTNewNo: TMLabel;
	MFurigana1: TMFurigana;
	mqGrd: TMQuery;
	dsGrd: TDataSource;
	mqGrdNCode: TBCDField;				//<D10-U> TCurrencyField → TBCDField (.dfmも同様)
	mqGrdLogInID: TStringField;
	mqGrdSimpleName: TStringField;
	mqGrdKanaName: TStringField;
	mqGrdBirth: TDateField;
	mqGrdLoginID_UP: TStringField;
	mqGrdFixFlag: TSmallintField;
	mqGrdEmpName1: TStringField;
	mqGrdEmpName2: TStringField;
	mqGrdEmpKana1: TStringField;
	mqGrdEmpKana2: TStringField;
	mqGrdDispBirth: TDateField;
	pnlBottom: TMPanel;
	btnOK: TMBitBtn;
	btnCancel: TMBitBtn;
	LTGrdMOS: TMLabel;
	pnlGrid: TMPanel;
	grdMOSInfo: TdxDBGrid;
	grdMOSInfoColumn1: TdxDBGridColumn;
	grdMOSInfoColumn2: TdxDBGridColumn;
	grdMOSInfoColumn3: TdxDBGridColumn;
	grdMOSInfoColumn5: TdxDBGridDateColumn;
	LNewNo: TMLabel;
	btnMOS: TMBitBtn;
	pnlDetail: TMPanel;
	MLabel11: TMLabel;
	MLabel10: TMLabel;
	LTEmpName: TMLabel;
	LTEmpKana: TMLabel;
	LTBirth: TMLabel;
	lblGuide: TMLabel;
	LTSimpleName: TMLabel;
	LTRenso: TMLabel;
	EEmpName1: TMTxtEdit;
	EEmpName2: TMTxtEdit;
	EEmpKana1: TMTxtEdit;
	EEmpKana2: TMTxtEdit;
	ESimpleName: TMTxtEdit;
	ERenso: TMTxtEdit;
	EBirth: TMDateEdit;
	mqGrdRenso: TStringField;
	btnMosID: TMBitBtn;
	mqGrdGCode: TStringField;
	mqChk: TMQuery;
	LEmpName1: TMLabel;
	LEmpName2: TMLabel;
	LEmpKana1: TMLabel;
	LEmpKana2: TMLabel;
	LSimpleName: TMLabel;
	LRenso: TMLabel;
	LBirth: TMLabel;
	ImageList: TImageList;
	memTanto: TdxMemData;
	memTantoNCode: TFloatField;
	memTantoGCode: TStringField;
	memTantoLoginID: TStringField;
	memTantoSimpleName: TStringField;
	memTantoRenso: TStringField;
	memTantoKanaName: TStringField;
	memTantoBirth: TDateField;
	memTantoLoginID_UP: TStringField;
	memTantoFixFlag: TSmallintField;
	memTantoEmpName1: TStringField;
	memTantoEmpName2: TStringField;
	memTantoEmpKana1: TStringField;
	memTantoEmpKana2: TStringField;
	memTantoDispBirth: TDateField;
	memTantoExistKbn: TSmallintField;
	memTantoExistCmn: TStringField;
	memTantoExistCorp: TStringField;
	grdMOSInfoColumn6: TdxDBGridColumn;
	grdMOSInfoColumn7: TdxDBGridColumn;
	EExist: TMNumEdit;
	btnMosCorp: TMBitBtn;
	memTantoTantoNCD: TFloatField;
	mqGrdCMNTantoNCD: TBCDField;				//<D10-U> TFloatField → TBCDField (.dfmも同様)
	procedure FormCreate(Sender: TObject);
	procedure btnOKClick(Sender: TObject);
	procedure btnCancelClick(Sender: TObject);
	procedure FormShow(Sender: TObject);
	procedure DialogEnter(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
	procedure MFurigana1CompositionStr(Sender: TObject; Value: String);
	procedure EFldChange(Sender: TObject);
	procedure btnMOSClick(Sender: TObject);
	procedure btnMosIDClick(Sender: TObject);
	procedure DialogExit(Sender: TObject);
	procedure mqGrdAfterScroll(DataSet: TDataSet);
	procedure memTantoAfterScroll(DataSet: TDataSet);
  private
	{ Private 宣言 }
	m_pRec			: ^TMjsAppRecord;						// APパラメータ構造体
	DBMod			: TMDataModulef;						// DBModule
	recCommon		: ^rcCOMMONAREA;						// 共通ｴﾘｱ
	recSystem		: rcSYSTEMAREA;							// システム・メモリ 構造体
	ACControl		: TWinControl;
	ddCopDB,
	ddMJsDB			: TFDConnection;

	m_iMode			: ShortInt;								// 0:新規 1:削除復旧
//<100106>↓
	m_iPrivateFlg	: ShortInt;								// 0:表示する 1:表示しない
//<100106>↑
	m_iDigit,
	m_iAttr			: Integer;

	m_bGridFlg		: Boolean;								// ｸﾞﾘｯﾄﾞ制御フラグ

	m_iNCmn			: Int64;								// 担当者内部コード(MJSCOMMON)
	m_iNCorp		: Int64;								// 担当者内部コード(COPDB)
	m_sGCode		: String;

	m_bUseExp		: Boolean;								// 検索Exp使用フラグ
	m_bSelectMOS	: Boolean;

	m_SPCopHist		: TFDStoredProc;							// ｾｯｼｮﾝ管理ｽﾄｱﾄﾞ
	m_SPMjsHist		: TFDStoredProc;							// <080811>

	m_aMakeCode		: array[0..3]of Integer;				//<2011-04-22>

	m_UpdCmnTantoNCD: Int64;								// 共通DB担当者内部コード

	procedure fnFormIni();
	procedure fnSetColorComponent();
	procedure fnMOSQueryOpen();
	procedure fnRestoreQueryOpen();
	procedure fnCmnMOSQueryGet(bSelect : Boolean = True);
	function fnValueCheck(Sender:TObject):boolean;
	function fnDataUpDate: Boolean;
	function fnMakeMapping(iNCode,iNCmn : Int64; qhCorp : TMQuery) : Boolean;
	function fnWriteData_SC(iNCode : Int64; qhCorp: TMQuery): Boolean;
	function fnWriteData_SC2(iNCode : Int64; qhCorp: TMQuery): Boolean;

	function fnMakeInsert_MOS(qMake: TMQuery): int64;
	function fnCopyInsert_MOS(iNCode:Int64; qMake,qBase: TMQuery; MODE: ShortInt): int64;

	function fnDataRestore: Boolean;
	function fnRestore_MOS(iNCode : Int64; qDB: TMQuery; MODE: ShortInt): Boolean;
	function fnRestore_COPY(iNCode, iNCMN : Int64; qhCorp,qhMjs: TMQuery): Boolean;

	function fnMOSDataChk(var iNCode: Int64; qhMjs: TMQuery): Boolean;

	function fnSCCodeChk(iNCode : Int64; qhCorp: TMQuery): Boolean;
	function fnMakeSimpleName(sName1, sName2: String; iLen: Integer=0): String;	// 簡略名称合成
	procedure SessionPractice(iSyori: Integer);									// ｾｯｼｮﾝ管理ｽﾄｱﾄﾞのﾊﾟﾗﾒｰﾀ追加

	function fnUpDateMakeCode(iNCode,iNCmn: Int64; qhCorp, qhMjs: TMQuery; iItem, iKbn: Integer): Boolean;	//<2011-04-22>

	function fnGetMapping(iPat: ShortInt;iNCode : Int64): Int64;

	function fnGetUpdCmnTantoName(iNCode:Int64):String;

  public
	{ Public 宣言 }
	m_iYearKbn		: Integer;

	constructor	CreateDialog(	PForm : TComponent;
								pRec : Pointer;
								sGCode : String;
								iMode : ShortInt;
								aCodeInfo:array of Integer);					//<2011-04-22>引数追加
	function	fnRetCmnNCode : Int64;
	function	fnRetNCode : Int64;
	function	fnRetGCode : String;
	function	fnRetNotMosSc : Boolean;

  protected
	procedure	CMChildKey(var Msg : TWMKey); message CM_CHILDKEY;
  end;

//var
//	HAP000010StaffSelDlgF: THAP000010StaffSelDlgF;

implementation

const
	STBMSG = '[F4]または、[Alt]+[↓]ｷｰで検索エクスプローラーを呼出します。';//<210202>Upd 長音対応
	CAPFRM0 = '新規社員登録';
	CAPFRM1 = '削除担当者復旧';

	CAPLBL0 = '担当者情報';
	CAPLBL1 = '削除担当者情報';

	// J-SOX履歴対応
	C_ST_PROCESS	= 0;				// 設定
	C_ED_PROCESS	= 1;				// 開放

{$R *.DFM}
// <NewEraName-P1> ADD Start
{$I HAPEraNameCtrl_B.inc}
// <NewEraName-P1> ADD End

//************************************************************************
//*	Proccess		:	キーオペレーション
//*	Parameter		:	Object
//*	Retrun			:	Nathing
//************************************************************************
procedure THAP000010StaffSelDlgF.CMChildKey(var Msg : TWMKey);
var
	CShiftState	: TShiftState;
	iSelStart	: Integer;
	iSelLength	: Integer;
	iLength		: Integer;
begin
	if GetKeyState(VK_MENU) < 0 then
		Exit;

	CShiftState := MjsKeyDataToShiftState( Msg.KeyData );
	ACControl := Screen.ActiveControl;

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
	if (Msg.CharCode = VK_ESCAPE) and (cShiftState = []) then					// Esc
	begin
		btnCancelClick(Self);
		Msg.CharCode := 0;
		Abort;
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
		if (ACControl is TdxDBGrid) and (Msg.CharCode = VK_UP) then				// グリッド
			Exit;

		MjsPrevCtrl(self);
		Msg.CharCode := 0;
		Abort;
	end;

	if	((Msg.CharCode = VK_TAB) and (cShiftState = [])) or
		(Msg.CharCode = VK_DOWN) or (Msg.CharCode = VK_RETURN) then
	begin
		if (ACControl is TdxDBGrid) and (Msg.CharCode = VK_DOWN) then			// グリッド
			Exit;

		if (ACControl is TMBitBtn) and (Msg.CharCode = VK_RETURN) then			// 確認、キャンセルボタン
			Exit;

		MjsNextCtrl(self);
		Msg.CharCode := 0;
		Abort;
	end;
end;

//************************************************************************
//*	Proccess		:	CONSTRUCTOR関数
//*	Parameter		:	親Form
//*					:	コード入力Flag
//*					:	コード
//					: 自動採番コード内訳	aCodeInfo	<2011-04-22>追加
//					:	0/項目No1 1/設定区分1	2/項目No2 3/設定区分2
//*	Retrun			:	Nathing
//*	History			:	2019/03/19	K.Takahashi(CyberCom)
//*						新元号対応(Gengou)
//************************************************************************
constructor	THAP000010StaffSelDlgF.CreateDialog(PForm : TComponent;
												pRec : Pointer;
												sGCode : String;
												iMode : ShortInt;
												aCodeInfo: array of Integer);
begin
	m_pRec			:= pRec;
	DBMod			:= TMDataModulef( m_pRec^.m_pDBModule^ );					// DBModule
	recCommon		:= m_pRec^.m_pCommonArea;									// 共通エリア
	recSystem		:= rcSYSTEMAREA( m_pRec^.m_pSystemArea^ );					// システム・メモリ 構造体 保持
	m_SPCopHist		:= nil;
	m_SPMjsHist		:= nil;														// <080811>

	m_iNCmn			:= -1;
	m_iNCorp		:= -1;
	m_bSelectMOS	:= False;
	m_sGCode		:= sGCode;

	m_iMode			:= iMode;
	m_bGridFlg		:= False;

//<2011-04-22> S
	m_aMakeCode[0]	:= aCodeInfo[0];
	m_aMakeCode[1]	:= aCodeInfo[1];
	m_aMakeCode[2]	:= aCodeInfo[2];
	m_aMakeCode[3]	:= aCodeInfo[3];
//<2011-04-22> E

	inherited Create(pForm);
// <NewEraName-P1> ADD Start

	grdMOSInfoColumn5.Gengou := GetEraName(Now(), emAlpha)[1];
// <NewEraName-P1> ADD End
end;

//□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
//□							イベント
//□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
//************************************************************************
//*	Proccess		:	FormCreate
//*	Parameter		:	Object
//*	Retrun			:	Nathing
//************************************************************************
procedure THAP000010StaffSelDlgF.FormCreate(Sender: TObject);
begin
	fnFormIni();
end;

//************************************************************************
//*	Proccess		:	FormDestroy
//*	Parameter		:	Object
//*	Retrun			:	Nathing
//************************************************************************
procedure THAP000010StaffSelDlgF.FormDestroy(Sender: TObject);
begin
	if Assigned(m_SPCopHist) then
		m_SPCopHist.Free();
//<080811>↓
	if Assigned(m_SPMjsHist) then
		m_SPMjsHist.Free();
//<080811>↑

	if ddCopDB<>nil then
	begin
		DBMod.CopDBClose(ddCopDB);
		ddCopDB:=nil;
	end;

	if ddMjsDB<>nil then
	begin
		DBMod.CTLDBClose(ddMjsDB);
		ddMjsDB:=nil;
	end;
end;

//************************************************************************
//*	Proccess		:	FormShow
//*	Parameter		:	Object
//*	Retrun			:	Nathing
//************************************************************************
procedure THAP000010StaffSelDlgF.FormShow(Sender: TObject);
begin
	// 0:新規 1:削除復旧
	if m_iMode = 0 then
	begin
		EEmpName1.SetFocus;
	end
	else
	begin
		m_bGridFlg	:= True;
//		with mqGrd do
		with memTanto do
		begin
			if Active = True then
			begin
				First;
			end;
		end;
		grdMOSInfo.SetFocus;
	end;
end;

//************************************************************************
//*	Proccess		:	登録処理
//*	Parameter		:	Object
//************************************************************************
procedure THAP000010StaffSelDlgF.btnOKClick(Sender: TObject);
var
	iRet	: Integer;
begin
	if not fnValueCheck(nil) then												//値のﾁｪｯｸ
		Exit;

	// 0:新規 1:削除復旧
	if m_iMode = 0 then
	begin
		// 担当者選択なし
		if m_bSelectMOS = False then
		begin
//			if not mqGrd.eof then
			if not memTanto.eof then
			begin
//<2010-12-01> S
				try
//					mqGrd.DisableConstraints;
//					mqGrd.First;
					memTanto.DisableControls;
					memTanto.First;
					while not memTanto.Eof do
					begin
//						if (mqGrdEmpName1.AsString = EEmpName1.Text)
//						and(mqGrdEmpName2.AsString = EEmpName2.Text) then
						if (memTantoEmpName1.AsString = EEmpName1.Text)
						and(memTantoEmpName2.AsString = EEmpName2.Text) then
						begin
//<2010-12-01> E
							iRet := MjsMessageBox(	Self,
													'既に同一名称(' + LTEmpName.Caption + ')の担当者が存在します。'
													+#10#13+#10#13+'登録すると担当者が重複しますがよろしいですか？',
													mjQuestion,
													mjdefNo		);
							if iRet <> mrYES then
							begin
								Exit;
							end;

//<2010-12-01> S
							break;
						end;
//						mqGrd.Next;
						memTanto.Next;
					end;
				finally
//					mqGrd.First;
//					mqGrd.EnableConstraints;
					memTanto.First;
					memTanto.EnableControls;
				end;
//<2010-12-01> E
			end
			else
			begin
				iRet := MjsMessageBox(	Self,
										EEmpName1.Text + '　' + EEmpName2.Text + 'さんを担当者に追加します。'
										+#10#13+#10#13+'よろしいですか？',
										mjQuestion,
										mjdefYes	);
				if iRet <> mrYES then
				begin
					Exit;
				end;
			end;
		end;
		if fnDataUpDate <> True then
			Exit;
	end
	else
	begin
		iRet := MjsMessageBox(	Self,
								'担当者の名称にアスタリスク(*)を付加して復旧します。'
								+#10#13+#10#13+'よろしいですか？',
								mjQuestion,
								mjdefNo		);
		if iRet <> mrYES then
		begin
			Exit;
		end;

		if fnDataRestore <> True then
			Exit;
	end;

	ModalResult	:= mrOK;
end;

//************************************************************************
//*	Proccess		:	キャンセルボタンクリック
//*	Parameter		:	Object
//*	Retrun			:	Nathing
//************************************************************************
procedure THAP000010StaffSelDlgF.btnCancelClick(Sender: TObject);
begin
	ModalResult	:= mrCancel;
end;

//************************************************************************
//*	Proccess		:	OnEnter
//*	Parameter		:	Object
//*	Retrun			:	Nathing
//************************************************************************
procedure THAP000010StaffSelDlgF.DialogEnter(Sender: TObject);
begin
	AcControl := Screen.ActiveControl;

	// ﾌﾘｶﾞﾅｺﾝﾄﾛｰﾙの割り当て
	if (ACControl = EEmpName1)
	or (ACControl = EEmpName2) then
	begin
		MFurigana1.Control:=nil;
		MFurigana1.Control:=ACControl;
	end;
end;

//************************************************************************
//*	Proccess		:	OnExit
//*	Parameter		:	Object
//*	Retrun			:	Nathing
//************************************************************************
procedure THAP000010StaffSelDlgF.DialogExit(Sender: TObject);
var
	rcMsg	: HAPMSGu.TMjsMsgRec;
	dDate	: TDateTime;
	sName	: String;
begin
	{デフォルトセット}
	if (Sender = EEmpName2) then
	begin
		if ESimpleName.Text = '' then
		begin
			ESimpleName.Text := fnMakeSimpleName(	EEmpName1.Text,
													EEmpName2.Text,
													ESimpleName.MaxLength);
		end;
	end;

	if (Sender = EEmpKana1) then
	begin
		if ERenso.Text = '' then
		begin
			sName := Trim(EEmpKana1.Text);

			if MjsHanLength(sName) <= 10 then	//<D10-U> Length → MjsHanLength
			begin
				ERenso.Text := sName;
			end;
		end;
	end;

	{日付チェック}
	if (Sender is TMDateEdit) and ((Sender as TMDateEdit).Value<>0) then
	begin
		dDate := (Sender as TMDateEdit).AsDateTime;
		if not MjsIntYMDChk(MjsDateToInt8(dDate)) then
		begin
			HAPMSGu.GetMsg(rcMsg,100,7);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			MjsSetFocus(Self, TMDateEdit(Sender).Name);
			Exit;
		end;
	end;
end;

//******************************************************************************
//	Component		:	MFurigana1
//	Event			:	CompositionStr
//******************************************************************************
procedure THAP000010StaffSelDlgF.MFurigana1CompositionStr(Sender: TObject;
  Value: String);
var
	sKanaText	: String;
	KanaCtl		: TMTxtEdit;
begin

	if(Sender as TMFurigana).Control=EEmpName1 then
		KanaCtl:=EEmpKana1
	else if(Sender as TMFurigana).Control=EEmpName2 then
		KanaCtl:=EEmpKana2
	else
		Exit;

	if MjsHanLength( KanaCtl.Text ) < KanaCtl.MaxLength then		//<D10-U> Length → MjsHanLength
	begin
		sKanaText	:=KanaCtl.Text + Value;
		KanaCtl.Text:=MjsHanCopy(sKanaText,1,KanaCtl.MaxLength);	//<D10-U> Copy → MjsHanCopy
	end;
end;

//******************************************************************************
//	Component		:	入力欄
//	Event			:	OnChange
//******************************************************************************
procedure THAP000010StaffSelDlgF.EFldChange(Sender: TObject);
begin
	// 0:新規 1:削除復旧
	if m_iMode = 0 then
	begin
		if (Sender = EEmpName1)								//氏名
		or (Sender = ESimpleName)							//簡略名称
		or (Sender = ERenso) then							//連想
		begin
			if EEmpName1.Text='' then
			begin
				EEmpKana1.Text:='';

//<2010-12-02> S
				if EEmpName2.Text='' then
				begin
					ESimpleName.Text:='';
					ERenso.Text:='';
				end;
//<2010-12-02> E
			end;
		end;

		if (Sender = EEmpName2) then						//氏名
		begin
			if EEmpName2.Text='' then
			begin
				EEmpKana2.Text:='';

//<2010-12-02> S
				if EEmpName1.Text='' then
				begin
					ESimpleName.Text:='';
					ERenso.Text:='';
				end;
//<2010-12-02> E
			end;
		end;

		if (Sender = EEmpName1)
		or (Sender = EEmpName2) then						//氏名
		begin
			// 担当者選択状態じゃない時
			if m_bSelectMOS = False then
				fnMOSQueryOpen();
		end;
	end;
end;

//******************************************************************************
//	Component		:	btnMOS
//	Event			:	OnClick
//******************************************************************************
procedure THAP000010StaffSelDlgF.btnMOSClick(Sender: TObject);
begin
	// 0:新規 1:削除復旧
	if m_iMode = 0 then
	begin
		if m_bSelectMOS = False then
			fnCmnMOSQueryGet()
		else
			fnCmnMOSQueryGet(False);

		fnMOSQueryOpen();
		pnlDetail.Enabled	:= not m_bSelectMOS;
		fnSetColorComponent();
	end;
end;

//******************************************************************************
//	Component		: spdMosID
//					: 担当者検索ボタン
//	Event			: OnClick
//******************************************************************************
procedure THAP000010StaffSelDlgF.btnMosIDClick(Sender: TObject);
var
	HapSTAFFExp : THapSTAFFExpF;
	iRet		: Integer;
	iBefNCmn,
	iBefNCop	: Int64;
	iBefSelect	: Boolean;

	iPat		: ShortInt;
begin
	iPat := TWinControl(Sender).Tag;	// 0：共通；1：会社
	HapSTAFFExp := THapSTAFFExpF.CreateForm(m_pRec,Self,iPat);

	try
		iRet := HapSTAFFExp.ShowModal;

		if iRet = mrOK then
		begin
			with HapSTAFFExp.fnRetTantoInfo^ do
			begin
				iBefNCmn	:= m_iNCmn;
				iBefNCop	:= m_iNCorp;
				iBefSelect	:= m_bSelectMOS;

				if iPat = 1 then
				begin
					m_iNCorp:= NCode;						// 担当者検索からの戻り値(COPDB)
					m_iNCmn	:= fnGetMapping(iPat,m_iNCorp);
				end
				else
				begin
					m_iNCmn	:= NCode;						// 担当者検索からの戻り値(MJSCOMMON)
					m_iNCorp:= fnGetMapping(iPat,m_iNCmn);
				end;

				m_bSelectMOS	:= True;

				fnMOSQueryOpen();
				fnCmnMOSQueryGet();

				if (m_iNCmn < 1) and (m_iNCorp < 1) then
				begin
					m_iNCmn		:= iBefNCmn;
					m_iNCorp	:= iBefNCop;
					m_bSelectMOS:= iBefSelect;
					fnMOSQueryOpen();
				end;

				pnlDetail.Enabled	:= not m_bSelectMOS;
				fnSetColorComponent();
			end;
			m_bUseExp	:= True;
		end;
	finally
		HapSTAFFExp.Free;
	end;
end;

//******************************************************************************
//	Component		:	mqGrd
//	Event			:	OnAfterScroll
//******************************************************************************
procedure THAP000010StaffSelDlgF.mqGrdAfterScroll(DataSet: TDataSet);
begin
	// 0:新規 1:削除復旧
//	if (m_iMode = 1) and (m_bGridFlg = True) then
//	begin
//		fnCmnMOSQueryGet();
//	end;
end;

//□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
//□							ファンクション
//□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□
//***********************************************************************
//		Proccess	:ﾌｫｰﾑ初期設定
//		Parameter	:
//		Return		:
//**********************************************************************
procedure THAP000010StaffSelDlgF.fnFormIni();
var
	i		: integer;
	qCorp	: TMQuery;
	qMjs	: TMQuery;					//<100106>
begin

	StsBar.SimpleText	:= '';

	// 0:新規 1:削除復旧
	if m_iMode = 0 then
	begin
		Self.Caption		:= CAPFRM0;
		LTGrdMOS.Caption	:= CAPLBL0;
	end
	else
	begin
		Self.Caption		:= CAPFRM1;
		LTGrdMOS.Caption	:= CAPLBL1;
	end;

// システム色の設定
	MJSCommonU.MJSColorChange ( THAP000010StaffSelDlgF(Self),
								recSystem.SysColorB,
								recSystem.SysColorD,
								recSystem.SysBaseColorB,
								recSystem.SysBaseColorD,
								recCommon^.SysFocusColor);

	ddCopDB	:= DBMod.CopDBOpen(1,m_pRec^.m_iCorpID);
	ddMjsDB	:= DBMod.CtlDBOpen(1);

	//ｸﾞﾘｯﾄﾞ用接続
	// 0:新規 1:削除復旧
	if m_iMode = 0 then
	begin
		DBMod.SetDBInfoToQuery(ddMjsDB,mqGrd);
	end
	else
	begin
		DBMod.SetDBInfoToQuery(ddCopDB,mqGrd);
	end;
	DBMod.SetDBInfoToQuery(ddCopDB,mqChk);

	// 0:新規 1:削除復旧
	if m_iMode = 0 then
	begin
		btnMosID.Visible	:= True;
		btnMOS.Visible		:= True;
		lblGuide.Visible	:= True;
		pnlDetail.Enabled	:= True;

		grdMOSInfo.Bands[0].Visible := TRUE;
		grdMOSInfo.Bands[1].Visible := TRUE;
	end
	else
	begin
		btnMosID.Visible	:= False;
		btnMosCorp.Visible	:= FALSE;
		btnMOS.Visible		:= False;
		lblGuide.Visible	:= False;
		pnlDetail.Enabled	:= False;

		grdMOSInfo.Bands[0].Visible := FALSE;
		grdMOSInfo.Bands[1].Visible := FALSE;
	end;

	fnSetColorComponent();

	memTanto.Close;
	memTanto.Open;

	qCorp:=TMQuery.Create(Self);
	try

		DBMod.SetDBInfoToQuery(ddCopDB,qCorp);

		with qCorp do
		begin
			try
				Close;
				SQL.Clear;
				SQL.Add('SELECT CodeDigit,CodeAttr FROM MasterInfo WHERE MasterKbn = 25');

				Open;
				if Eof then
					Abort;

				m_iDigit	:= GetFld('CodeDigit').AsInteger;
				m_iAttr		:= GetFld('CodeAttr').AsInteger;

				Close;
				SQL.Clear;
				SQL.Add('SELECT YearKbn FROM DTMAIN');

				Open(True);

				m_iYearKbn := GetFld('YearKbn').AsInteger;

				Close;
			except
				raise Exception.Create('会社情報 取得失敗');
			end;

			//社員外部コード属性
			if (m_iAttr = 0) or (m_iAttr = 1) then
			begin
				LNewNo.Alignment := taRightJustify;
			end
			else
			begin
				LNewNo.Alignment := taLeftJustify;
			end;
			LNewNo.Caption := HapCodeAttribute2(m_sGCode,m_iDigit,m_iAttr);

			// 和暦西暦区分
			if m_iYearKbn = YEAR_KBN_WAREKI then
			begin
				EBirth.DateFormat				:= dfEMD;
				memTantoDispBirth.DisplayFormat	:='g eee/mm/dd';
			end
			else
			begin
				EBirth.Gengou					:= #0;
				EBirth.DateFormat				:= dfYMD;
				memTantoDispBirth.DisplayFormat	:= 'yyyy/mm/dd';
			end;

			try
				Close;
				SQL.Clear;
				SQL.Add('SELECT ItemNo,ItemName FROM HAPKM WHERE Sort = 2 AND Sort2 = 0');
				Open(True);

				for i:=0 to Self.ComponentCount-1 do
				begin
					//ｺﾝﾎﾟｰﾈﾝﾄ初期ｸﾘｱ
					if Self.Components[i] is TMNumEdit then
						(Self.Components[i] as TMNumEdit).Value:=0;
					if Self.Components[i] is TMTxtEdit then
						(Self.Components[i] as TMTxtEdit).Text:='';
					if Self.Components[i] is TMDateEdit then
						(Self.Components[i] as TMDateEdit).Value:=0;

					if(Self.Components[i] is TMLabel)and
					  ((Self.Components[i] as TMLabel).Tag > 0)and
					  (qCorp.Locate('ItemNo',(Self.Components[i] as TMLabel).Tag,[]))then
						(Self.Components[i] as TMLabel).Caption:=qCorp.GetFld('ItemName').AsString;
				end;
			except
				raise Exception.Create('会社情報 取得失敗');
			end;
		end;
	finally
		qCorp.Close;
		qCorp.Free;
	end;

//<100106>↓
	qMjs	:=TMQuery.Create(Self);
	try
		DBMod.SetDBInfoToQuery(ddMjsDB,qMjs);

		with qMjs do
		begin
			try
				Close;
				SQL.Clear;
				SQL.Add('SELECT PrivateFlg FROM SYS_MAIN');

				Open;
				if Eof then
					Abort;

				m_iPrivateFlg	:= GetFld('PrivateFlg').AsInteger;
			except
				raise Exception.Create('会社情報 取得失敗');
			end;

		end;
	finally
		qMjs.Close;
		qMjs.Free;
	end;

	// 0:表示する 1:表示しない
	if m_iPrivateFlg = 1 then
	begin
//<100121>↓
		LTBirth.Visible		:= False;
		LBirth.Visible		:= False;
		EBirth.Visible		:= False;
//<100121>↑
		pnlBottom.Visible	:= False;
		btnMosID.Visible	:= False;
		btnMOS.Visible		:= False;
		Self.Height			:= Self.Height - pnlBottom.Height;
	end;
//<100106>↑

	lblGuide.Caption	:= LTEmpName.Caption + 'による担当者の検索結果';

	// J-SOX マスタ履歴対応
	m_SPCopHist := TFDStoredProc.Create(nil);
	with m_SPCopHist do
	begin
		Connection		:= ddCopDB;

		StoredProcName	:= 'MP_MSHIST_SETINFO';
		ParamBindMode	:= pbByName;

		Params.Clear();
//<D10-Stored> S
		MJSPrepareStoredProc(m_SPCopHist);
{
		Params.CreateParam(ftInteger,	'@pSyoriKbn',		ptInput);
		Params.CreateParam(ftInteger,	'@pMSHistKbn',		ptInput);
		Params.CreateParam(ftCurrency,	'@pTanNCode',		ptInput);
		Params.CreateParam(ftString,	'@pTanSimpleName',	ptInput);
		Params.CreateParam(ftInteger,	'@pSysCode',		ptInput);
		Params.CreateParam(ftInteger,	'@pOptCode',		ptInput);
		Params.CreateParam(ftInteger,	'@pPrgCode',		ptInput);
}
//<D10-Stored> E
	end;
//<080811>↓
	m_SPMjsHist := TFDStoredProc.Create(nil);
	with m_SPMjsHist do
	begin
		Connection		:= ddMjsDB;

		StoredProcName	:= 'MP_MSHIST_SETINFO';
		ParamBindMode	:= pbByName;

		Params.Clear();
//<D10-Stored> S
		MJSPrepareStoredProc(m_SPMjsHist);
{
		Params.CreateParam(ftInteger,	'@pSyoriKbn',		ptInput);
		Params.CreateParam(ftInteger,	'@pMSHistKbn',		ptInput);
		Params.CreateParam(ftCurrency,	'@pTanNCode',		ptInput);
		Params.CreateParam(ftString,	'@pTanSimpleName',	ptInput);
		Params.CreateParam(ftInteger,	'@pSysCode',		ptInput);
		Params.CreateParam(ftInteger,	'@pOptCode',		ptInput);
		Params.CreateParam(ftInteger,	'@pPrgCode',		ptInput);
}
//<D10-Stored> E
	end;
//<080811>↑

	if m_iMode = 0 then
		fnMOSQueryOpen()
	else
		fnRestoreQueryOpen();

	m_UpdCmnTantoNCD	:= -1;
	m_UpdCmnTantoNCD	:= fnGetMapping(1,recCommon.TantoNCD);

end;

//************************************************************************
//*	Proccess		:	入力欄色変更処理
//*	Parameter		:
//*	Retrun			:
//************************************************************************
procedure THAP000010StaffSelDlgF.fnSetColorComponent();
begin
	if pnlDetail.Enabled = True then
	begin
		// 入力欄の表示
		EEmpName1.Visible	:= True;
		EEmpName2.Visible	:= True;
		EEmpKana1.Visible	:= True;
		EEmpKana2.Visible	:= True;
		ESimpleName.Visible	:= True;
		ERenso.Visible		:= True;
		EBirth.Visible		:= True;
	end
	else
	begin
		// 内容をラベルに反映
		LEmpName1.Caption	:= EEmpName1.Text;
		LEmpName2.Caption	:= EEmpName2.Text;
		LEmpKana1.Caption	:= EEmpKana1.Text;
		LEmpKana2.Caption	:= EEmpKana2.Text;
		LSimpleName.Caption	:= ESimpleName.Text;
		LRenso.Caption		:= ERenso.Text;
		LBirth.Caption		:= EBirth.Text;

		// 入力欄の非表示(入力欄の下にあるラベルが表示される)
		EEmpName1.Visible	:= False;
		EEmpName2.Visible	:= False;
		EEmpKana1.Visible	:= False;
		EEmpKana2.Visible	:= False;
		ESimpleName.Visible	:= False;
		ERenso.Visible		:= False;
		EBirth.Visible		:= False;
	end;
end;

//************************************************************************
//*	Proccess		:	担当者情報取得
//*	Parameter		:
//************************************************************************
procedure THAP000010StaffSelDlgF.fnMOSQueryOpen();
var
	bHit	: Boolean;
begin
	with mqGrd do
	begin
		Close;
		SQL.Clear;
		SQL.Add('SELECT'
			+	' MOS.NCode AS NCode'
			+	','''' AS GCode'
			+	',MOS.LogInID AS LogInID'
			+	',MOS.SimpleName AS SimpleName'
			+	',MOS.KanaName AS KanaName'
			+	',MOS.Renso AS Renso'
			+	',MOS.Birth AS Birth'
			+	',UPPER(MOS.LoginID) AS LoginID_UP'
			+	',ISNULL(MOS.FixFlg,0) AS FixFlag'
			+	',MOS.Birth AS DispBirth'
			+	',MOS.EmpName1 AS EmpName1'
			+	',MOS.EmpName2 AS EmpName2'
			+	',MOS.EmpKana1 AS EmpKana1'
			+	',MOS.EmpKana2 AS EmpKana2'
			+	',0.0 AS CMNTantoNCD'
			+	' FROM MOS_OFFICE_STAFF AS MOS');

		SQL.Add('WHERE MOS.SyokuchiKbn = 0'
				+' AND FixFlag = 0'
				+' AND MOS.RDelKbn = 0'
				+' AND MOS.TEndDate >= :hDate');

		SetFld('hDate').AsDateTime	:= Now;

		// 担当者を指定
		if m_bSelectMOS = True then
		begin
			SQL.Add( ' AND MOS.NCode = :NCode');
			SetFld('NCode').AsString	:= IntToStr(m_iNCmn);
		end
		else
		begin
			// 氏名から担当者を検索
			if (Length(Trim(EEmpName1.Text)) > 0)
			or (Length(Trim(EEmpName2.Text)) > 0) then
			begin
				if (Length(Trim(EEmpName1.Text)) > 0) then
				begin
					SQL.Add( ' AND MOS.EmpName1 LIKE :EmpName1');
					SetFld('EmpName1').AsString	:= EEmpName1.Text + '%';
				end;

				if (Length(Trim(EEmpName2.Text)) > 0) then
				begin
					SQL.Add( ' AND MOS.EmpName2 LIKE :EmpName2');
					SetFld('EmpName2').AsString	:= EEmpName2.Text + '%';
				end;
			end
			else
			begin
				//未入力時は表示させたくない
				SQL.Add( ' AND MOS.NCode = -1');
			end;
		end;

		try
			Open(True);
		except
			raise Exception.Create('（共通）担当者情報の取得に失敗しました。');
		end;

		memTanto.DisableControls;

		try
			memTanto.Close;
			memTanto.Open;
			while not EOF do
			begin
				memTanto.Append;
				memTantoNCode.AsFloat		:= GetFld('NCode'	).AsFloat;		// 共通
				memTantoGCode.AsString		:= GetFld('GCode'	).AsString;
				memTantoLoginID.AsString	:= GetFld('LoginID' ).AsString;
				memTantoSimpleName.AsString := GetFld('SimpleName').AsString;
				memTantoKanaName.AsString	:= GetFld('KanaName').AsString;
				memTantoRenso.AsString		:= GetFld('Renso'	).AsString;
				memTantoBirth.AsDateTime	:= GetFld('Birth'	).AsDateTime;
				memTantoLoginID_UP.AsString := GetFld('LoginID_UP').AsString;
				memTantoFixFlag.AsInteger	:= GetFld('FixFlag' ).AsInteger;

				if not GetFld('DispBirth').IsNULL then
					memTantoDispBirth.AsDateTime:= GetFld('DispBirth').AsDateTime;

				memTantoEmpName1.AsString	:= GetFld('EmpName1').AsString;
				memTantoEmpName2.AsString	:= GetFld('EmpName2').AsString;
				memTantoEmpKana1.AsString	:= GetFld('EmpKana1').AsString;
				memTantoEmpKana2.AsString	:= GetFld('EmpKana2').AsString;
				memTantoExistKbn.AsInteger	:= 1;
				memTantoExistCmn.AsString	:= '○';

				Next;
			end;

			if memTanto.State in[dsInsert,dsEdit] then
			begin
				memTanto.Post;
				memTanto.First;
			end;
		finally
			memTanto.EnableControls;
		end;
	end;

	with mqChk do
	begin
		Close;
		SQL.Clear;
		SQL.Add('SELECT'
			+	' MOS.NCode AS NCode'
			+	','''' AS GCode'
			+	',MOS.LogInID AS LogInID'
			+	',MOS.SimpleName AS SimpleName'
			+	',MOS.KanaName AS KanaName'
			+	',MOS.Renso AS Renso'
			+	',MOS.Birth AS Birth'
			+	',UPPER(MOS.LoginID) AS LoginID_UP'
			+	',ISNULL(MOS.FixFlg,0) AS FixFlag'
			+	',MOS.Birth AS DispBirth'
			+	',MOS.EmpName1 AS EmpName1'
			+	',MOS.EmpName2 AS EmpName2'
			+	',MOS.EmpKana1 AS EmpKana1'
			+	',MOS.EmpKana2 AS EmpKana2'
			+	',MAP.CmnTantoNCd AS MAPNCd'
			+	' FROM MOS_OFFICE_STAFF AS MOS'
			+	' LEFT JOIN MOS_OFFICE_STAFF_MAPPING AS MAP'
			+	' ON MOS.NCode = MAP.TantoNCd');

		SQL.Add('WHERE MOS.SyokuchiKbn = 0'
				+' AND FixFlag = 0'
				+' AND MOS.RDelKbn = 0'
				+' AND MOS.TEndDate >= :hDate');

		SetFld('hDate').AsDateTime	:= Now;

		// 担当者を指定
		if m_bSelectMOS = True then
		begin
			SQL.Add( ' AND MOS.NCode = :NCode');
			SetFld('NCode').AsString	:= IntToStr(m_iNCorp);
		end
		else
		begin
			// 氏名から担当者を検索
			if (Length(Trim(EEmpName1.Text)) > 0)
			or (Length(Trim(EEmpName2.Text)) > 0) then
			begin
				if (Length(Trim(EEmpName1.Text)) > 0) then
				begin
					SQL.Add( ' AND MOS.EmpName1 LIKE :EmpName1');
					SetFld('EmpName1').AsString	:= EEmpName1.Text + '%';
				end;

				if (Length(Trim(EEmpName2.Text)) > 0) then
				begin
					SQL.Add( ' AND MOS.EmpName2 LIKE :EmpName2');
					SetFld('EmpName2').AsString	:= EEmpName2.Text + '%';
				end;
			end
			else
			begin
				//未入力時は表示させたくない
				SQL.Add( ' AND MOS.NCode = -1');
			end;
		end;

		try
			Open(True);
		except
			raise Exception.Create('（会社）担当者情報の取得に失敗しました。');
		end;

		memTanto.DisableControls;

		try
			while not EOF do
			begin
				bHit := FALSE;
				memTanto.First;
				while not memTanto.EOF do
				begin
					if (memTantoExistKbn.AsInteger = 1)		// 共通あり
					and(memTantoNCode.AsFloat = GetFld('MAPNCd').AsFloat) then	// 一致
					begin
						memTanto.Edit;
						memTantoExistKbn.AsInteger	:= 3;
						memTantoExistCorp.AsString	:= '○';
						memTantoTantoNCD.AsFloat	:= GetFld('NCode').AsFloat;	// （会社）担当者内部コード
						memTanto.Post;

						bHit := TRUE;
						break;
					end;
					memTanto.Next;
				end;

				if bHit then
				begin
					Next;
					Continue;
				end;

				memTanto.Append;
				memTantoNCode.AsFloat		:= 0;
				memTantoGCode.AsString		:= GetFld('GCode'	).AsString;
				memTantoLoginID.AsString	:= GetFld('LoginID' ).AsString;
				memTantoSimpleName.AsString := GetFld('SimpleName').AsString;
				memTantoKanaName.AsString	:= GetFld('KanaName').AsString;
				memTantoRenso.AsString		:= GetFld('Renso'	).AsString;
				memTantoBirth.AsDateTime	:= GetFld('Birth'	).AsDateTime;
				memTantoLoginID_UP.AsString := GetFld('LoginID_UP').AsString;
				memTantoFixFlag.AsInteger	:= GetFld('FixFlag' ).AsInteger;

				if not GetFld('DispBirth').IsNULL then
					memTantoDispBirth.AsDateTime:= GetFld('DispBirth').AsDateTime;

				memTantoEmpName1.AsString	:= GetFld('EmpName1').AsString;
				memTantoEmpName2.AsString	:= GetFld('EmpName2').AsString;
				memTantoEmpKana1.AsString	:= GetFld('EmpKana1').AsString;
				memTantoEmpKana2.AsString	:= GetFld('EmpKana2').AsString;
				memTantoExistKbn.AsInteger	:= 2;
				memTantoExistCorp.AsString	:= '○';
				memTantoTantoNCD.AsFloat	:= GetFld('NCode'	).AsFloat;

				Next;
			end;

			if memTanto.State in[dsInsert,dsEdit] then
			begin
				memTanto.Post;
				memTanto.First;
			end;
		finally
			memTanto.EnableControls;
		end;
	end;

end;

//************************************************************************
//*	Proccess		:	復旧用担当者情報取得
//*	Parameter		:
//*	 Memo			:	※担当者復旧用
//************************************************************************
procedure THAP000010StaffSelDlgF.fnRestoreQueryOpen();
begin
	with mqGrd do	//※ここでは会社DBを参照しています。
	begin
		Close;
		SQL.Clear;
		SQL.Add('SELECT'
				+	' MOS.NCode AS NCode'
				+	',SC.GCode AS GCode'
				+	',MOS.LogInID AS LogInID'
				+	',MOS.SimpleName AS SimpleName'
				+	',MOS.KanaName AS KanaName'
				+	',MOS.Renso AS Renso'
				+	',MOS.Birth AS Birth'
				+	',UPPER(MOS.LoginID) AS LoginID_UP'
				+	',ISNULL(MOS.FixFlg,0) AS FixFlag'
				+	',MOS.Birth AS DispBirth'
				+	',MOS.EmpName1 AS EmpName1'
				+	',MOS.EmpName2 AS EmpName2'
				+	',MOS.EmpKana1 AS EmpKana1'
				+	',MOS.EmpKana2 AS EmpKana2'
				+	',MAP.CMNTantoNCD AS CMNTantoNCD'
				+' FROM MOS_OFFICE_STAFF AS MOS'
				+' INNER JOIN HAPSC AS SC ON MOS.NCode = SC.NCode'
				+ ' LEFT JOIN MOS_OFFICE_STAFF_MAPPING MAP ON MAP.TantoNCD = SC.NCode'
				+' WHERE MOS.SyokuchiKbn = 0 '
				+	'AND MOS.RDelKbn = 1'	);

		try
			Open(True);
		except
			raise Exception.Create('社員情報取得に失敗しました。');
		end;

		memTanto.DisableControls;

		try
			memTanto.Close;
			memTanto.Open;
			while not EOF do
			begin
				memTanto.Append;
				memTantoNCode.AsFloat		:= GetFld('CMNTantoNCD').AsFloat;		// 共通担当者
				memTantoTantoNCD.AsFloat	:= GetFld('NCode'	).AsFloat;			// 会社担当者
				memTantoGCode.AsString		:= GetFld('GCode'	).AsString;
				memTantoLoginID.AsString	:= GetFld('LoginID' ).AsString;
				memTantoSimpleName.AsString := GetFld('SimpleName').AsString;
				memTantoKanaName.AsString	:= GetFld('KanaName').AsString;
				memTantoRenso.AsString		:= GetFld('Renso'	).AsString;
				memTantoBirth.AsDateTime	:= GetFld('Birth'	).AsDateTime;
				memTantoLoginID_UP.AsString := GetFld('LoginID_UP').AsString;
				memTantoFixFlag.AsInteger	:= GetFld('FixFlag' ).AsInteger;

				if not GetFld('DispBirth').IsNULL then
					memTantoDispBirth.AsDateTime:= GetFld('DispBirth').AsDateTime;

				memTantoEmpName1.AsString	:= GetFld('EmpName1').AsString;
				memTantoEmpName2.AsString	:= GetFld('EmpName2').AsString;
				memTantoEmpKana1.AsString	:= GetFld('EmpKana1').AsString;
				memTantoEmpKana2.AsString	:= GetFld('EmpKana2').AsString;

				Next;
			end;

			if memTanto.State in[dsInsert,dsEdit] then
			begin
				memTanto.Post;
				memTanto.First;
			end;

		finally
			memTanto.EnableControls;
		end;

		First;		// 存在チェックの為先頭に戻しておく
	end;
end;

//**********************************************************************
//		Process		:
//		Name		:
//		Date		:
//		Parameter	:
//		Return		:
//**********************************************************************
procedure THAP000010StaffSelDlgF.fnCmnMOSQueryGet(bSelect : Boolean);
begin
//	with mqGrd do
	with memTanto do
	begin
		if Active = True then
		begin
			if (EOF = True)
			or (bSelect = False) then
			begin
				m_bSelectMOS	:= False;
				btnMOS.Caption	:= '担当者選択(&S)';
				ImageList.GetBitmap(0,btnMOS.Glyph);
			end
			else
			begin
//				m_iNCode	:= GetFld('NCode').AsInteger;						//MJSCOMMON
				m_iNCmn		:= Trunc(memTantoNCode.AsFloat);					//MJSCOMMON
				m_iNCorp	:= Trunc(memTantoTantoNCD.AsFloat);					// 会社DB
				// 0:新規 1:削除復旧
				if m_iMode = 0 then
				begin
					if fnSCCodeChk(m_iNCorp,mqChk) <> True then					//既に登録されている社員をチェック
					begin
						m_iNCmn	:= -1;						// <090811>
						m_iNCorp:= -1;
						Exit;
					end;
				end;

				m_bSelectMOS		:= True;

				// 0:新規
				if m_iMode = 0 then
				begin
//					EEmpName1.Text		:= GetFld('EmpName1').AsString;
//					EEmpName2.Text		:= GetFld('EmpName2').AsString;
//					EEmpKana1.Text		:= GetFld('EmpKana1').AsString;
//					EEmpKana2.Text		:= GetFld('EmpKana2').AsString;
//					EBirth.AsDateTime	:= GetFld('Birth').AsDateTime;
//					ESimpleName.Text	:= GetFld('SimpleName').AsString;
//					ERenso.Text			:= GetFld('Renso').AsString;
					EEmpName1.Text		:= memTantoEmpName1.AsString;
					EEmpName2.Text		:= memTantoEmpName2.AsString;
					EEmpKana1.Text		:= memTantoEmpKana1.AsString;
					EEmpKana2.Text		:= memTantoEmpKana2.AsString;
					EBirth.AsDateTime	:= memTantoBirth.AsDateTime;
					ESimpleName.Text	:= memTantoSimpleName.AsString;
					ERenso.Text			:= memTantoRenso.AsString;
					EExist.Value		:= memTantoExistKbn.AsInteger;
				end
				// 1:削除復旧
				else
				begin
					m_sGCode			:= memTantoGCode.AsString;
					LNewNo.Caption		:= HapCodeAttribute2(m_sGCode,m_iDigit,m_iAttr);
					EEmpName1.Text		:= '*' + memTantoEmpName1.AsString;
					EEmpName2.Text		:= memTantoEmpName2.AsString;
					EEmpKana1.Text		:= '*' + memTantoEmpKana1.AsString;
					EEmpKana2.Text		:= memTantoEmpKana2.AsString;
					EBirth.AsDateTime	:= memTantoBirth.AsDateTime;
					ESimpleName.Text	:= '*' + memTantoSimpleName.AsString;
					ERenso.Text			:= '*' + memTantoRenso.AsString;

					// 内容をラベルに反映
					LEmpName1.Caption	:= EEmpName1.Text;
					LEmpName2.Caption	:= EEmpName2.Text;
					LEmpKana1.Caption	:= EEmpKana1.Text;
					LEmpKana2.Caption	:= EEmpKana2.Text;
					LSimpleName.Caption	:= ESimpleName.Text;
					LRenso.Caption		:= ERenso.Text;
					LBirth.Caption		:= EBirth.Text;
				end;

				btnMOS.Caption	:= '担当者選択解除(&S)';
				ImageList.GetBitmap(1,btnMOS.Glyph);
			end;
		end;
	end;
end;

//************************************************************************
//*	Proccess		:	fnDataUpDate　OKボタン終了処理
//*	Parameter		:
//*	Retrun			:
//************************************************************************
function THAP000010StaffSelDlgF.fnDataUpDate : Boolean;
var
	qCorpDB		: TMQuery;
	qMjsDB		: TMQuery;
	qMosDB		: TMQuery;				// <マスタ同期>
	iNCmn,
	iNCode		: Int64;
	bErr		: Boolean;
begin
	Result	:= False;
	bErr	:= False;

	qCorpDB	:= TMQuery.Create(Self);
	qMjsDB	:= TMQuery.Create(Self);
	qMosDB	:= TMQuery.Create(Self);	// <マスタ同期>

	try
		DBMOD.SetDBInfoTOQuery(ddCOPDB,qMosDB);				// <マスタ同期> MOS用は常に自社に接続
		DBMOD.SetDBInfoTOQuery(ddCOPDB,qCorpDB);
		DBMOD.SetDBInfoTOQuery(ddMjsDB,qMjsDB);

		iNCode	:= m_iNCorp;
		iNCmn	:= m_iNCmn;

		if m_bSelectMOS = True then
		begin
			if (EExist.AsInteger = 1) or (EExist.AsInteger = 3) then
			begin
				if fnMOSDataChk(iNCmn,qMjsDB) <> True then	// MJSCMN:MOS_STAFF に本当に存在するか。存在すれば、内部ｺｰﾄﾞ⇒iNCmn格納
					Exit;
			end;

			if (EExist.AsInteger = 2) or (EExist.AsInteger = 3) then
			begin
				if fnMOSDataChk(iNCode,qCorpDB) <> True then// CMPDT:MOS_STAFF に本当に存在するか。存在すれば、内部ｺｰﾄﾞ⇒iNCode格納
					Exit;
			end;
		end;

		// 同時に社員登録されている場合、同一担当者を選択しないガード
		if fnSCCodeChk(iNCode,qCorpDB) <> True then			// CMPDT:入力された外部コードが重複しないか？内部コードが重複しないか？
			Exit;

		SessionPractice(C_ST_PROCESS);						//<2008-02-15>
		if m_bSelectMOS = False then
		begin
			DBMOD.BeginTran(ddMjsDB);
		end;
		DBMOD.BeginTran(ddCOPDB);

		try
			with qCorpDB do
			begin
				Close;
				SQL.Clear;
				SQL.Add('CALL MP200010(0,:hTANCD)');

//<D10-Stored> S
				//SetFld('hTANCD').AsFloat := recCommon.TantoNCD;
				SetFld('hTANCD').AsInteger := recCommon.TantoNCD;
//<D10-Stored> E

				ExecSQL;
			end;

			// 担当者選択なしの時
			if not m_bSelectMOS then
			begin
				//MJSCOMMON:MOS_STAFFにデータ書き込み（新規：Insert）
				iNCmn := fnMakeInsert_MOS(qMjsDB);								// 戻り値（iNCmn）新規内部ナンバー（MJSCOMMON)
				if iNCmn < 0 then		// 失敗
				begin
					bErr	:= True;
					Exit;
				end;
			end
			else
			begin
				// 共通に担当者がない場合追加（会社のみ担当者を選択した場合））
				if iNCmn < 1 then
				begin
					//MJSCOMMON:MOS_STAFFにデータ書き込み（会社担当者より：Insert）
					iNCmn := fnCopyInsert_MOS(iNCode,qMjsDB,qCorpDB,1);			// 戻り値（iNCmn）新規内部ナンバー（MJSCOMMON)
					if iNCmn < 0 then		// 失敗
					begin
						bErr	:= True;
						Exit;
					end;
				end;
			end;

			// 会社の担当者がいない場合（共通のみ担当者を選択した場合））
			if iNCode < 1 then
			begin
				//CMPDT:MOS_STAFFにデータ書き込み（共通担当者より：Insert）
				iNCode := fnCopyInsert_MOS(iNCmn,qCorpDB,qMjsDB,0);
				if iNCode < 0 then
				begin
					bErr	:= True;
					Exit;
				end;
			end;

			// マッピングの作成
			if fnMakeMapping(iNCode,iNCmn,qCorpDB) <> True then
			begin
				bErr	:= True;
				Exit;
			end;

			//HAPSCにデータ書き込み
			if fnWriteData_SC(iNCode,qCorpDB) <> True then
			begin
				bErr	:= True;
				Exit;
			end;

			//HAPSCにデータ書き込み(履歴用)
			if fnWriteData_SC2(iNCode,qCorpDB) <> True then
			begin
				bErr	:= True;
				Exit;
			end;

//<2011-04-22> S
		//コード採番設定区分更新
			if not fnUpDateMakeCode(iNCode,iNCmn, qCorpDB, qMjsDB,m_aMakeCode[0],m_aMakeCode[1]) then
			begin
				bErr	:= True;
				Exit;
			end;

			if not fnUpDateMakeCode(iNCode,iNCmn, qCorpDB, qMjsDB,m_aMakeCode[2],m_aMakeCode[3]) then
			begin
				bErr	:= True;
				Exit;
			end;
//<2011-04-22> E

		finally
			if bErr = True then
			begin
				if m_bSelectMOS = False then
					DBMOD.RollBack(ddMjsDB);
				DBMOD.RollBack(ddCOPDB);
			end
			else
			begin
				if m_bSelectMOS = False then
					DBMOD.Commit(ddMjsDB);
				DBMOD.Commit(ddCOPDB);
			end;

			SessionPractice(C_ED_PROCESS);					//<2008-02-15>
		end;

		m_iNCorp:= iNCode;
		m_iNCmn := iNCmn;

	finally
		qCorpDB.Close;
		qCorpDB.Free;

		qMjsDB.Close;
		qMjsDB.Free;

		//	<マスタ同期>---Start---
		qMosDB.Close;
		qMosDB.Free;
		//	<マスタ同期>--- End ---
	end;

	Result := True;
end;

//**********************************************************************
//		Proccess	:更新前の値ﾁｪｯｸ
//		Name		:T.Aoki
//		Date		:2000/12/11
//		Parameter	:Sender	:ｵﾌﾞｼﾞｪｸﾄ
//					:		:nil以外	:ｺﾝﾎﾟｰﾈﾝﾄのExitｲﾍﾞﾝﾄ
//					:		nil			:書き込み前
//		Return		:TRUE	:更新成功
//					:FALSE	:失敗(値ﾁｪｯｸNG含む)
//		Hoistory	:200x/99/99(X.Name)
//					:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//**********************************************************************
function THAP000010StaffSelDlgF.fnValueCheck(Sender:TObject):boolean;
var
	rcMsg	: HAPMSGu.TMjsMsgRec;
begin
	Result	:= False;

	// 担当者が選択されている時
	if (m_bSelectMOS = True)
	or (m_iMode = 1) then
	begin
		Result	:= True;
		Exit;
	end;

	{必須入力チェック}
	if (Sender = nil) or (Sender = EEmpName1) then			//氏名
	begin
		if EEmpName1.Text='' then
		begin
			HAPMSGu.GetMsg(rcMsg,100,1);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,LTEmpName.Caption+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			MjsSetFocus(Self, EEmpName1.Name);
			Exit;
		end;
	end;

	if (Sender = nil) or (Sender = EEmpName2) then			//氏名
	begin
		if EEmpName2.Text='' then
		begin
			HAPMSGu.GetMsg(rcMsg,100,1);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,LTEmpName.Caption+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			MjsSetFocus(Self, EEmpName2.Name);
			Exit;
		end;
	end;


	if (Sender = nil) or (Sender = EEmpKana1) then								//フリガナ
	begin
		if EEmpKana1.Text='' then
		begin
			HAPMSGu.GetMsg(rcMsg,100,1);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,LTEmpKana.Caption+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			MjsSetFocus(Self, EEmpKana1.Name);
			Exit;
		end;
	end;

	if (Sender = nil) or (Sender = EEmpKana2) then								//フリガナ
	begin
		if EEmpKana2.Text='' then
		begin
			HAPMSGu.GetMsg(rcMsg,100,1);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,LTEmpKana.Caption+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);
			end;
			MjsSetFocus(Self, EEmpKana2.Name);
			Exit;
		end;
	end;

	if (Sender = nil) or (Sender = ESimpleName) then							//簡略名称
	begin
		if ESimpleName.Text='' then
		begin
			HAPMSGu.GetMsg(rcMsg,100,1);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,LTSimpleName.Caption+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);	//<080403>
			end;
			MjsSetFocus(Self, ESimpleName.Name);
			Exit;
		end;
	end;

	if (Sender = nil) or (Sender = ERenso) then									//連想
	begin
		if ERenso.Text='' then
		begin
			HAPMSGu.GetMsg(rcMsg,100,1);
			with rcMsg do
			begin
				MjsMessageBoxEx(Self,LTRenso.Caption+sMsg, sTitle,IconType,BtnType,BtnDef,LogType);	//<080403>
			end;
			MjsSetFocus(Self, ERenso.Name);
			Exit;
		end;
	end;

	Result:=True;
end;

//************************************************************************
//*	Proccess		:	fnMakeMaping　データ書込
//*	Parameter		:
//*	Retrun			:
//************************************************************************
function THAP000010StaffSelDlgF.fnMakeMapping(iNCode,iNCmn : Int64; qhCorp : TMQuery) : Boolean;
begin
	Result := False;

	with qhCorp do
	begin
		Close;
		SQL.Clear;
		SQL.Add('SELECT * FROM MOS_OFFICE_STAFF_MAPPING'
			+	' WHERE TantoNCD = :hNCode');

		SetFld('hNCode').AsString	:= IntToStr(iNCode);

		if not Open then
		begin
			Exit;
		end;

		// マッピングされていない場合マッピングを行う
		if EOF then
		begin
			Close;
			SQL.Clear;
			SQL.Add('INSERT INTO MOS_OFFICE_STAFF_MAPPING'
				+	'('
				+	' TantoNCD'
				+	',CMNTantoNCD'
				+	') VALUES ('
				+	' :hNCode'
				+	',:hCMNCd'
				+	')');

			SetFld('hNCode').AsString	:= IntToStr(iNCode);
			SetFld('hCMNCd').AsString	:= IntToStr(iNCmn);

			if not ExecSQL then
				Exit;
		end;
	end;

	Result := True;
end;

//************************************************************************
//*	Proccess		:	fnWriteData_SC　データ書込
//*	Parameter		:
//*	Retrun			:
//************************************************************************
function THAP000010StaffSelDlgF.fnWriteData_SC(iNCode : Int64; qhCorp : TMQuery) : Boolean;
begin
	Result := False;

	if (iNCode < 1) then
		Exit;

	with qhCorp do
	begin
		Close;
		SQL.Clear;
		SQL.Add('INSERT INTO HAPSC'
			+	'('
			+	' CorpNCode'
			+	',NCode'
			+	',GCode'
			+	',TStartDate'
			+	',TEndDate'
			+	',UpdDateTM'
			+	',InsDateTM'
			+	',UpdTantoNCode'
			+	') VALUES ('
			+	' :hCorpNCode'
			+	',:hNCode'
			+	',:hGCode'
			+	',:hTStartDate'
			+	',:hTEndDate'
			+	',:hUpdDateTM'
			+	',:hInsDateTM'
			+	',:hUpdTantoNCd'
			+	')');

		SetFld('hCorpNCode').AsFloat		:= 0;
		SetFld('hNCode').AsFloat			:= iNCode;
		SetFld('hGCode').AsString			:= m_sGCode;
		SetFld('hTStartDate').AsDateTime	:= MjsIntToDate(19000101, #0);
		SetFld('hTEndDate').AsDateTime		:= MjsIntToDate(20991231, #0);
		SetFld('hUpdDateTM').AsDateTime		:= Now;
		SetFld('hInsDateTM').AsDateTime		:= Now;
		SetFld('hUpdTantoNCd').AsFloat		:= recCommon.TantoNCD;

		if not ExecSQL then
		begin
			Exit;
		end;
	end;

	Result := True;
end;

//************************************************************************
//*	Proccess		:	fnWriteData_SC2　データ書込
//*	Parameter		:
//*	Retrun			:
//************************************************************************
function THAP000010StaffSelDlgF.fnWriteData_SC2(iNCode : Int64; qhCorp : TMQuery) : Boolean;
begin
	Result := False;

	if (iNCode < 1) then
		Exit;

	// J-SOX履歴対応(HAPSCで名称を取得する為)
	with qhCorp do
	begin
		Close;
		SQL.Clear;
		SQL.Add('UPDATE HAPSC SET '
			+	' GCode = GCode'
			+	' WHERE NCode=:hNCode');

		SetFld('hNCode').AsFloat	:= iNCode;

		if not ExecSQL then
		begin
			Exit;
		end;
	end;

	Result := True;
end;

//************************************************************************
//*	Proccess		:	fnMakeInsert_MOS
//					:	MOS_OFFICE_STAFF レコード新規作成
//*	Parameter		:
//*	Retrun			: 追加担当者内部コード	（-1：処理失敗）
//************************************************************************
function THAP000010StaffSelDlgF.fnMakeInsert_MOS(qMake : TMQuery) : int64;
begin
	Result	:= -1;

	with qMake do
	begin
		Close;
		SQL.Clear;
		SQL.Add('INSERT INTO MOS_OFFICE_STAFF'
			+	' ('
			+	' LoginID'
			+	',EmpName1'
			+	',EmpName2'
			+	',Name'
			+	',EmpKana1'
			+	',EmpKana2'
			+	',KanaName'
			+	',SimpleName'
			+	',Renso'
			+	',Birth'
			+	',TStartDate'
			+	',TEndDate'
			+	',FixFlg'
			+	',LogInPermKbn'
			+	',UpdTantoNCode'
			+	') VALUES ('
			+	' :hLogID'
			+	',:hEmpName1'
			+	',:hEmpName2'
			+	',:hName'
			+	',:hEmpKana1'
			+	',:hEmpKana2'
			+	',:hKanaName'
			+	',:hSimpleName'
			+	',:hRenso'
			+	',:hBirth'
			+	',:hStDate'
			+	',:hEdDate'
			+	',0'
			+	',0'
			+	',:hUpdTantoNCode'
			+	')');

		SetFld('hLogID').AsString		:= '';

		SetFld('hEmpName1').AsString	:= EEmpName1.Text;
		SetFld('hEmpName2').AsString	:= EEmpName2.Text;
		SetFld('hName'	).AsString		:= EEmpName1.Text + '　' + EEmpName2.Text;
		SetFld('hEmpKana1').AsString	:= EEmpKana1.Text;
		SetFld('hEmpKana2').AsString	:= EEmpKana2.Text;
		SetFld('hKanaName').AsString	:= EEmpKana1.Text + ' ' + EEmpKana2.Text;
		SetFld('hSimpleName').AsString	:= ESimpleName.Text;
		SetFld('hRenso'	).AsString		:= ERenso.Text;

		if EBirth.Value = 0 then
		begin
			SetFld('hBirth').AsDateTime		:= 0;
			SetFld('hBirth').Clear;
		end
		else
			SetFld('hBirth').AsDateTime		:= EBirth.AsDateTime;

		SetFld('hStDate').AsDateTime	:= MjsIntToDate(19000101 ,#0);
		SetFld('hEdDate').AsDateTime	:= MjsIntToDate(20991231 ,#0);

		SetFld('hUpdTantoNCode').AsFloat:= m_UpdCmnTantoNCD;

		if not ExecSQL then
			Exit;

		Close;
		SQL.Clear;
		SQL.Add('SELECT MAX(NCode) AS HNCd FROM MOS_OFFICE_STAFF');

		if not Open then
			Exit;

		Result		:= Trunc(GetFld('HNCd').AsCurrency);
	end;
end;

//************************************************************************
//*	Proccess		: fnCopyInsert_MOS　データ書込
//*	Parameter		: MODE 0:共通→会社 / 1:会社→共通
//*	Retrun			:
//************************************************************************
function THAP000010StaffSelDlgF.fnCopyInsert_Mos(iNCode:Int64;qMake,qBase : TMQuery; MODE: ShortInt) : Int64;
var
	sSQL	: String;
begin
	Result	:= -1;

	with qMake do
	begin
		//----------------------------------------
		//コピー元データ取得
		qBase.Close;
		qBase.SQL.Clear;
		qBase.SQL.Add('SELECT'
					+	' *'
					+	' FROM MOS_OFFICE_STAFF'
					+	' WHERE NCode = :hNCode');

		qBase.SetFld('hNCode').AsFloat := iNCode;

		if not qBase.Open then
			Exit;

		if qBase.Eof then
			Exit;

		//----------------------------------------
		//取得したデータ書き込み
		sSQL := 'INSERT INTO MOS_OFFICE_STAFF'
			+	'(LoginID,PSWord,PSWordKbn,PSWUpDate,Syokuchikbn,EmpName1,EmpName2,Name,'
			+	'SimpleName,Renso,EmpKana1,EmpKana2,KanaName,EmpRomaji1,EmpRomaji2,OldName1,OldName2,'
			+	'OldNameKana1,OldNameKana2,KaimeiDate,TrueName1,TrueName2,TrueNameKana1,TrueNameKana2,'
			+	'TrueRomaji1,TrueRomaji2,Seibetsu,Birth,GrpNyuusha,Ketueki,YuubinNo1,YuubinNo2,'
			+	'Address1,Address2,Address1Kana,Address2Kana,Phone,ICKey,FixFlg,LoginPermKbn,'
			+	'PStartDate,PEndDate,TStartDate,TEndDate,RDelKbn,UpdTantoNCode)'
			+	'VALUES'
			+	'(:hLoginID,:hPSWord,:hPSWordKbn,:hPSWUpDate,:hSyokuchikbn,:hEmpName1,:hEmpName2,:hName,'
			+	':hSimpleName,:hRenso,:hEmpKana1,:hEmpKana2,:hKanaName,:hEmpRomaji1,:hEmpRomaji2,:hOldName1,:hOldName2,'
			+	':hOldKana1,:hOldKana2,:hKaimeiDate,:hTrueName1,:hTrueName2,:hTrueKana1,:hTrueKana2,'
			+	':hTrueRomaji1,:hTrueRomaji2,:hSeibetsu,:hBirth,:hGrpNyuusha,:hKetueki,:hYuubinNo1,:hYuubinNo2,'
			+	':hAddress1,:hAddress2,:hAddress1Kana,:hAddress2Kana,:hPhone,:hICKey,:hFixFlg,:hLoginPermKbn,'
			+	':hPStartDate,:hPEndDate,:hTStartDate,:hTEndDate,:hRDelKbn,:hUpdTantoNCode)';

		Close;
		SQL.Clear;
		SQL.Add(sSQL);

		SetFld('hLoginID'	).AsString		:= qBase.GetFld('LoginID'	).AsString;
		SetFld('hPSWord'	).AsString		:= qBase.GetFld('PSWord'	).AsString;
		SetFld('hPSWordKbn'	).AsInteger		:= qBase.GetFld('PSWordKbn'	).AsInteger;

		SetFld('hPSWUpDate'	).AsDateTime	:= qBase.GetFld('PSWUpDate'	).AsDateTime;
		if qBase.GetFld('PSWUpDate').IsNull then
			SetFld('hPSWUpDate').Clear;

		SetFld('hSyokuchikbn').AsInteger	:= qBase.GetFld('Syokuchikbn').AsInteger;
		SetFld('hEmpName1'	).AsString		:= qBase.GetFld('EmpName1'	).AsString;
		SetFld('hEmpName2'	).AsString		:= qBase.GetFld('EmpName2'	).AsString;
		SetFld('hName'		).AsString		:= qBase.GetFld('Name'		).AsString;
		SetFld('hSimpleName').AsString		:= qBase.GetFld('SimpleName').AsString;
		SetFld('hRenso'		).AsString		:= qBase.GetFld('Renso'		).AsString;
		SetFld('hEmpKana1'	).AsString		:= qBase.GetFld('EmpKana1'	).AsString;
		SetFld('hEmpKana2'	).AsString		:= qBase.GetFld('EmpKana2'	).AsString;
		SetFld('hKanaName'	).AsString		:= qBase.GetFld('KanaName'	).AsString;
		SetFld('hEmpRomaji1').AsString		:= qBase.GetFld('EmpRomaji1').AsString;
		SetFld('hEmpRomaji2').AsString		:= qBase.GetFld('EmpRomaji2').AsString;
		SetFld('hOldName1'	).AsString		:= qBase.GetFld('OldName1'	).AsString;
		SetFld('hOldName2'	).AsString		:= qBase.GetFld('OldName2'	).AsString;
		SetFld('hOldKana1'	).AsString		:= qBase.GetFld('OldNameKana1').AsString;
		SetFld('hOldKana2'	).AsString		:= qBase.GetFld('OldNameKana2').AsString;

		SetFld('hKaimeiDate').AsDateTime	:= qBase.GetFld('KaimeiDate').AsDateTime;
		if qBase.GetFld('KaimeiDate').IsNull then
			SetFld('hKaimeiDate').Clear;

		SetFld('hTrueName1'	).AsString		:= qBase.GetFld('TrueName1'	).AsString;
		SetFld('hTrueName2'	).AsString		:= qBase.GetFld('TrueName2'	).AsString;
		SetFld('hTrueKana1'	).AsString		:= qBase.GetFld('TrueNameKana1').AsString;
		SetFld('hTrueKana2'	).AsString		:= qBase.GetFld('TrueNameKana2').AsString;
		SetFld('hTrueRomaji1').AsString		:= qBase.GetFld('TrueRomaji1').AsString;
		SetFld('hTrueRomaji2').AsString		:= qBase.GetFld('TrueRomaji2').AsString;
		SetFld('hSeibetsu'	).AsInteger		:= qBase.GetFld('Seibetsu'	).AsInteger;

		SetFld('hBirth'		).AsDateTime	:= qBase.GetFld('Birth'		).AsDateTime;
		if qBase.GetFld('Birth').IsNull then
			SetFld('hBirth').Clear;

		SetFld('hGrpNyuusha').AsDateTime	:= qBase.GetFld('GrpNyuusha').AsDateTime;
		if qBase.GetFld('GrpNyuusha').IsNull then
			SetFld('hGrpNyuusha').Clear;

		SetFld('hKetueki'	).AsInteger		:= qBase.GetFld('Ketueki'	).AsInteger;

		SetFld('hYuubinNo1'	).AsInteger		:= qBase.GetFld('YuubinNo1'	).AsInteger;
		if qBase.GetFld('YuubinNo1').IsNull then
			SetFld('hYuubinNo1').Clear;

		SetFld('hYuubinNo2'	).AsInteger		:= qBase.GetFld('YuubinNo2'	).AsInteger;
		if qBase.GetFld('YuubinNo2').IsNull then
			SetFld('hYuubinNo2').Clear;

		SetFld('hAddress1'	).AsString		:= qBase.GetFld('Address1'	).AsString;
		SetFld('hAddress2'	).AsString		:= qBase.GetFld('Address2'	).AsString;
		SetFld('hAddress1Kana').AsString	:= qBase.GetFld('Address1Kana').AsString;
		SetFld('hAddress2Kana').AsString	:= qBase.GetFld('Address2Kana').AsString;
		SetFld('hPhone'		).AsString		:= qBase.GetFld('Phone'		).AsString;
		SetFld('hICKey'		).AsString		:= qBase.GetFld('ICKey'		).AsString;
		SetFld('hFixFlg'	).AsInteger		:= qBase.GetFld('FixFlg'	).AsInteger;
		SetFld('hLoginPermKbn').AsInteger	:= qBase.GetFld('LoginPermKbn').AsInteger;

		SetFld('hPStartDate').AsDateTime	:= qBase.GetFld('PStartDate').AsDateTime;
		if qBase.GetFld('PStartDate').IsNull then
			SetFld('hPStartDate').Clear;

		SetFld('hPEndDate'	).AsDateTime	:= qBase.GetFld('PEndDate'	).AsDateTime;
		if qBase.GetFld('PEndDate').IsNull then
			SetFld('hPEndDate').Clear;

		SetFld('hTStartDate').AsDateTime	:= qBase.GetFld('TStartDate').AsDateTime;
		if qBase.GetFld('TStartDate').IsNull then
			SetFld('hTStartDate').Clear;

		SetFld('hTEndDate'	).AsDateTime	:= qBase.GetFld('TEndDate'	).AsDateTime;
		if qBase.GetFld('TEndDate').IsNull then
			SetFld('hTEndDate').Clear;

		SetFld('hRDelKbn'	).AsInteger		:= qBase.GetFld('RDelKbn'	).AsInteger;

		if MODE = 1 then
			SetFld('hUpdTantoNCode').AsFloat	:= m_UpdCmnTantoNCD
		else
			SetFld('hUpdTantoNCode').AsFloat	:= recCommon.TantoNCD;

		if not ExecSQL then
		begin
			Exit;
		end;

		Close;
		SQL.Clear;
		SQL.Add('SELECT MAX(NCode) AS HNCd FROM MOS_OFFICE_STAFF');

		if not Open then
			Exit;

		Result		:= Trunc(GetFld('HNCd').AsCurrency);
	end;
end;

//************************************************************************
//*	Proccess		:	fnDataRestore　OKボタン終了処理
//*	Parameter		:
//*	Retrun			:
//************************************************************************
function THAP000010StaffSelDlgF.fnDataRestore : Boolean;
var
	qCorpDB	: TMQuery;
	qMjsDB	: TMQuery;

	iNCmn,
	iNCorp	: Int64;
	bErr	: Boolean;
begin

	Result	:= False;
	bErr	:= False;

	qCorpDB := TMQuery.Create(Self);
	qMjsDB	:= TMQuery.Create(Self);
	try
		DBMOD.SetDBInfoTOQuery(ddCOPDB,qCorpDB);
		DBMOD.SetDBInfoTOQuery(ddMjsDB,qMjsDB);

		iNCmn	:= m_iNCmn;
		iNCorp	:= m_iNCorp;

		SessionPractice(C_ST_PROCESS);
		DBMOD.BeginTran(ddMjsDB);
		DBMOD.BeginTran(ddCOPDB);

		try
			if (m_iNCmn < 1) then		// 共通担当者なし
			begin
				//CMPDT:MOS_STAFFの復旧
				if fnRestore_MOS(iNCorp,qCorpDB,1) <> True then
				begin
					bErr	:= True;
					Exit;
				end;
			end
			else
			begin
				//MJSCOMMON:MOS_STAFFの復旧
				if fnRestore_MOS(iNCmn,qMjsDB,0) <> True then
				begin
					bErr	:= True;
					Exit;
				end;

				//CMPDT:MOS_STAFFの復旧
				if fnRestore_COPY(iNCorp,iNCmn,qCorpDB,qMjsDB) <> True then
				begin
					bErr	:= True;
					Exit;
				end;
			end;
		finally
			if bErr = True then
			begin
				DBMOD.RollBack(ddMjsDB);
				DBMOD.RollBack(ddCOPDB);
			end
			else
			begin
				DBMOD.Commit(ddMjsDB);
				DBMOD.Commit(ddCOPDB);
			end;
			SessionPractice(C_ED_PROCESS);
		end;
	finally
		qCorpDB.Close;
		qCorpDB.Free;

		qMjsDB.Close;
		qMjsDB.Free;
	end;

	Result := True;
end;

//************************************************************************
//*	Proccess		:	fnRestore_MOS　データ書込
//*	Parameter		:
//*	Retrun			:
//************************************************************************
function THAP000010StaffSelDlgF.fnRestore_MOS(iNCode : Int64; qDB : TMQuery; MODE: ShortInt) : Boolean;
begin
	Result	:= False;

	with qDB do
	begin
		Close;
		SQL.Clear;
		SQL.Add('UPDATE MOS_OFFICE_STAFF SET'
			+	' EmpName1=:hEmpName1'
			+	',Name=:hName'
			+	',EmpKana1=:hEmpKana1'
			+	',KanaName=:hKanaName'
			+	',SimpleName=:hSimpleName'
			+	',Renso=:hRenso'
			+	',RDelKbn=0'
			+	',UpdTantoNCode=:hUpdTantoNCode'
			+	' WHERE NCode=:hNCode');

		SetFld('hNCode').AsFloat		:= iNCode;

		SetFld('hEmpName1').AsString	:= EEmpName1.Text;
		SetFld('hName'	).AsString		:= EEmpName1.Text + '　' + EEmpName2.Text;
		SetFld('hEmpKana1').AsString	:= EEmpKana1.Text;
		SetFld('hKanaName').AsString	:= EEmpKana1.Text + ' ' + EEmpKana2.Text;
		SetFld('hSimpleName').AsString	:= ESimpleName.Text;
		SetFld('hRenso'	).AsString		:= ERenso.Text;

		if MODE = 1 then
			SetFld('hUpdTantoNCode').AsFloat	:= recCommon.TantoNCD
		else
			SetFld('hUpdTantoNCode').AsFloat	:= m_UpdCmnTantoNCD;

		if not ExecSQL then
			Exit;
	end;

	Result := True;
end;

//************************************************************************
//*	Proccess		:	fnRestore_COPY　データ書込 MJSCOMMON → CMPDT
//*	Parameter		:
//*	Retrun			:
//************************************************************************
function THAP000010StaffSelDlgF.fnRestore_Copy(iNCode,iNCmn : Int64; qhCorp,qhMjs : TMQuery) : Boolean;
var
	sSQL	: String;
begin
	Result	:= False;

	if (iNCode < 1) then
		Exit;

	with qhCorp do
	begin
		//----------------------------------------
		//MJSCOMMON.DBより、コピー元データ取得
		qhMjs.Close;
		qhMjs.SQL.Clear;
		qhMjs.SQL.Add('SELECT'
					+	' *'
					+	' FROM MOS_OFFICE_STAFF'
					+	' WHERE NCode = :hNCode');

		qhMjs.SetFld('hNCode').AsFloat := iNCmn;

		if not qhMjs.Open then
			Exit;

		if qhMjs.Eof then
			Exit;

		//----------------------------------------
		//取得したデータ書き込み
		sSQL := 'UPDATE MOS_OFFICE_STAFF SET'
			+	' LoginID=:hLoginID'
			+	',PSWord=:hPSWord'
			+	',PSWordKbn=:hPSWordKbn'
			+	',PSWUpDate=:hPSWUpDate'
			+	',Syokuchikbn=:hSyokuchikbn'
			+	',EmpName1=:hEmpName1'
			+	',EmpName2=:hEmpName2'
			+	',Name=:hName'
			+	',SimpleName=:hSimpleName'
			+	',Renso=:hRenso'
			+	',EmpKana1=:hEmpKana1'
			+	',EmpKana2=:hEmpKana2'
			+	',KanaName=:hKanaName'
			+	',EmpRomaji1=:hEmpRomaji1'
			+	',EmpRomaji2=:hEmpRomaji2'
			+	',OldName1=:hOldName1'
			+	',OldName2=:hOldName2'
			+	',OldNameKana1=:hOldKana1'
			+	',OldNameKana2=:hOldKana2'
			+	',KaimeiDate=:hKaimeiDate'
			+	',TrueName1=:hTrueName1'
			+	',TrueName2=:hTrueName2'
			+	',TrueNameKana1=:hTrueKana1'
			+	',TrueNameKana2=:hTrueKana2'
			+	',TrueRomaji1=:hTrueRomaji1'
			+	',TrueRomaji2=:hTrueRomaji2'
			+	',Seibetsu=:hSeibetsu'
			+	',Birth=:hBirth'
			+	',GrpNyuusha=:hGrpNyuusha'
			+	',Ketueki=:hKetueki'
			+	',YuubinNo1=:hYuubinNo1'
			+	',YuubinNo2=:hYuubinNo2'
			+	',Address1=:hAddress1'
			+	',Address2=:hAddress2'
			+	',Address1Kana=:hAddress1Kana'
			+	',Address2Kana=:hAddress2Kana'
			+	',Phone=:hPhone'
			+	',ICKey=:hICKey'
			+	',FixFlg=:hFixFlg'
			+	',LoginPermKbn=:hLoginPermKbn'
			+	',PStartDate=:hPStartDate'
			+	',PEndDate=:hPEndDate'
			+	',TStartDate=:hTStartDate'
			+	',TEndDate=:hTEndDate'
			+	',RDelKbn=:hRDelKbn'
			+	',UpdTantoNCode=:hUpdTantoNCode'
			+	' WHERE NCode=:hNCode';

		Close;
		SQL.Clear;
		SQL.Add(sSQL);

		SetFld('hNCode'		).AsString		:= IntToStr(iNCode);
		SetFld('hLoginID'	).AsString		:= qhMjs.GetFld('LoginID'	).AsString;
		SetFld('hPSWord'	).AsString		:= qhMjs.GetFld('PSWord'	).AsString;
		SetFld('hPSWordKbn'	).AsInteger		:= qhMjs.GetFld('PSWordKbn'	).AsInteger;

		SetFld('hPSWUpDate'	).AsDateTime	:= qhMjs.GetFld('PSWUpDate'	).AsDateTime;
		if qhMjs.GetFld('PSWUpDate').IsNull then
			SetFld('hPSWUpDate').Clear;

		SetFld('hSyokuchikbn').AsInteger	:= qhMjs.GetFld('Syokuchikbn').AsInteger;
		SetFld('hEmpName1'	).AsString		:= qhMjs.GetFld('EmpName1'	).AsString;
		SetFld('hEmpName2'	).AsString		:= qhMjs.GetFld('EmpName2'	).AsString;
		SetFld('hName'		).AsString		:= qhMjs.GetFld('Name'		).AsString;
		SetFld('hSimpleName').AsString		:= qhMjs.GetFld('SimpleName').AsString;
		SetFld('hRenso'		).AsString		:= qhMjs.GetFld('Renso'		).AsString;
		SetFld('hEmpKana1'	).AsString		:= qhMjs.GetFld('EmpKana1'	).AsString;
		SetFld('hEmpKana2'	).AsString		:= qhMjs.GetFld('EmpKana2'	).AsString;
		SetFld('hKanaName'	).AsString		:= qhMjs.GetFld('KanaName'	).AsString;
		SetFld('hEmpRomaji1').AsString		:= qhMjs.GetFld('EmpRomaji1').AsString;
		SetFld('hEmpRomaji2').AsString		:= qhMjs.GetFld('EmpRomaji2').AsString;
		SetFld('hOldName1'	).AsString		:= qhMjs.GetFld('OldName1'	).AsString;
		SetFld('hOldName2'	).AsString		:= qhMjs.GetFld('OldName2'	).AsString;
		SetFld('hOldKana1'	).AsString		:= qhMjs.GetFld('OldNameKana1').AsString;
		SetFld('hOldKana2'	).AsString		:= qhMjs.GetFld('OldNameKana2').AsString;

		SetFld('hKaimeiDate').AsDateTime	:= qhMjs.GetFld('KaimeiDate').AsDateTime;
		if qhMjs.GetFld('KaimeiDate').IsNull then
			SetFld('hKaimeiDate').Clear;

		SetFld('hTrueName1'	).AsString		:= qhMjs.GetFld('TrueName1'	).AsString;
		SetFld('hTrueName2'	).AsString		:= qhMjs.GetFld('TrueName2'	).AsString;
		SetFld('hTrueKana1'	).AsString		:= qhMjs.GetFld('TrueNameKana1').AsString;
		SetFld('hTrueKana2'	).AsString		:= qhMjs.GetFld('TrueNameKana2').AsString;
		SetFld('hTrueRomaji1').AsString		:= qhMjs.GetFld('TrueRomaji1').AsString;
		SetFld('hTrueRomaji2').AsString		:= qhMjs.GetFld('TrueRomaji2').AsString;
		SetFld('hSeibetsu'	).AsInteger		:= qhMjs.GetFld('Seibetsu'	).AsInteger;

		SetFld('hBirth').AsDateTime			:= qhMjs.GetFld('Birth'		).AsDateTime;
		if qhMjs.GetFld('Birth').IsNull then
			SetFld('hBirth').Clear;

		SetFld('hGrpNyuusha').AsDateTime	:= qhMjs.GetFld('GrpNyuusha').AsDateTime;
		if qhMjs.GetFld('GrpNyuusha').IsNull then
			SetFld('hGrpNyuusha').Clear;

		SetFld('hKetueki').AsInteger		:= qhMjs.GetFld('Ketueki'	).AsInteger;

		SetFld('hYuubinNo1').AsInteger		:= qhMjs.GetFld('YuubinNo1'	).AsInteger;
		if qhMjs.GetFld('YuubinNo1').IsNull then
			SetFld('hYuubinNo1').Clear;

		SetFld('hYuubinNo2').AsInteger		:= qhMjs.GetFld('YuubinNo2'	).AsInteger;
		if qhMjs.GetFld('YuubinNo2').IsNull then
			SetFld('hYuubinNo2').Clear;

		SetFld('hAddress1'	).AsString		:= qhMjs.GetFld('Address1'	).AsString;
		SetFld('hAddress2'	).AsString		:= qhMjs.GetFld('Address2'	).AsString;
		SetFld('hAddress1Kana').AsString	:= qhMjs.GetFld('Address1Kana').AsString;
		SetFld('hAddress2Kana').AsString	:= qhMjs.GetFld('Address2Kana').AsString;
		SetFld('hPhone'		).AsString		:= qhMjs.GetFld('Phone'		).AsString;
		SetFld('hICKey'		).AsString		:= qhMjs.GetFld('ICKey'		).AsString;
		SetFld('hFixFlg'	).AsInteger		:= qhMjs.GetFld('FixFlg'	).AsInteger;
		SetFld('hLoginPermKbn').AsInteger	:= qhMjs.GetFld('LoginPermKbn').AsInteger;

		SetFld('hPStartDate').AsDateTime	:= qhMjs.GetFld('PStartDate').AsDateTime;
		if qhMjs.GetFld('PStartDate').IsNull then
			SetFld('hPStartDate').Clear;

		SetFld('hPEndDate').AsDateTime		:= qhMjs.GetFld('PEndDate'	).AsDateTime;
		if qhMjs.GetFld('PEndDate').IsNull then
			SetFld('hPEndDate').Clear;

		SetFld('hTStartDate').AsDateTime	:= qhMjs.GetFld('TStartDate').AsDateTime;
		if qhMjs.GetFld('TStartDate').IsNull then
			SetFld('hTStartDate').Clear;

		SetFld('hTEndDate').AsDateTime		:= qhMjs.GetFld('TEndDate'	).AsDateTime;
		if qhMjs.GetFld('TEndDate').IsNull then
			SetFld('hTEndDate').Clear;

		SetFld('hRDelKbn'	).AsInteger		:= qhMjs.GetFld('RDelKbn'	).AsInteger;
		SetFld('hUpdTantoNCode').AsFloat	:= recCommon.TantoNCD;

		if not ExecSQL then
		begin
			Exit;
		end;
	end;

	Result := True;
end;

//************************************************************************
//*	Proccess		:	実在チェック
//*	Parameter		:	iNCode	:	担当者内部ｺｰﾄﾞ
//*					:	qhMjs	:	検索DBｸｴﾘ
//*	Retrun			:	True/False	取得成否
//************************************************************************
function THAP000010StaffSelDlgF.fnMOSDataChk(var iNCode : Int64; qhMjs : TMQuery) : Boolean;
begin
	Result := False;

	with qhMjs do
	begin
		Close;
		SQL.Clear;
		SQL.Add('SELECT'
			+	' NCode'
			+	',ISNULL(FixFlg,0) AS FixFlag'
			+	' FROM MOS_OFFICE_STAFF'
			+	' WHERE SyokuchiKbn = 0'										//諸口は除外
				+ ' AND FixFlag = 0'
				+ ' AND RDelKbn = 0'
				+ ' AND TEndDate >= :hDate'
				+ ' AND NCode = :NCode');

		SetFld('hDate').AsDateTime		:= Now;
		SetFld('NCode').AsFloat			:= iNCode;

		if not Open then
			Exit;

		if Eof then
		begin
			MjsMessageBoxEx(Self,'担当者が存在しません。','エラー',MjWarning,MjOK,MjDefOK);
			Exit;
		end;

		if GetFld('NCode').AsFloat < 1 then
		begin
			MjsMessageBoxEx(Self,'担当者が存在しません。','エラー',MjWarning,MjOK,MjDefOK);
			Exit;
		end;

		iNCode := Trunc(GetFld('NCode').AsFloat);
	end;

	Result := True;
end;

//************************************************************************
//*	Proccess		: fnSCCodeChk　HAPSCコードチェック
//*	Parameter		: iNCode (CMP担当者内部コード）
//*	Retrun			:
//************************************************************************
function THAP000010StaffSelDlgF.fnSCCodeChk(iNCode : Int64; qhCorp : TMQuery) : Boolean;
begin
	Result := False;

	with qhCorp do
	begin
		//外部ｺｰﾄﾞの重複チェック
		Close;
		SQL.Clear;
		SQL.Add('SELECT'
			+	' Count(*) As Cnt'
			+	' FROM HAPSC'
			+	' WHERE GCode = :hGCode');

		SetFld('hGCode').AsString := m_sGCode;

		if not Open then
		begin
			Exit;
		end;

		if GetFld('Cnt').AsInteger > 0 then
		begin
			MjsMessageBoxEx(Self,'社員コードが重複しています。','エラー',MjWarning,MjOK,MjDefOK);
			Exit;
		end;

		if (iNCode > 0) then
		begin
			//内部ｺｰﾄﾞの重複チェック
			Close;
			SQL.Clear;
			SQL.Add('SELECT'
				+	' Count(SC.NCode) As Cnt'
				+	' FROM HAPSC SC'
				+	' WHERE SC.NCode = :hNCode');

			SetFld('hNCode').AsFloat := iNCode;

			if not Open then
			begin
				Exit;
			end;

			if GetFld('Cnt').AsInteger > 0 then
			begin
				MjsMessageBoxEx(Self,'既に社員として登録されている担当者です。','登録済担当者',MjWarning,MjOK,MjDefOK);
				Exit;
			end;
		end;
	end;

	Result := True;
end;


//**********************************************************************
//		Process		: 簡略名称合成
//		Name		: H.Takaishi (BUNTECHNO)
//		Date		: 2007/04/09
//		Parameter	:
//		Return		:
//		History		: 9999/99/99	X.Name
//						XXXXXXXXXXXXXXX
//**********************************************************************
function THAP000010StaffSelDlgF.fnMakeSimpleName(sName1, sName2: String; iLen: Integer): String;
begin
	sName1 := Trim(sName1);
	sName2 := Trim(sName2);

	//氏名を合成(+全角SP)
	if sName1 = '' then
	begin
		Result := sName2;
	end
	else
	begin
		Result := sName1 + '　' + sName2;
	end;

	if iLen <= 0 then exit;	// 文字数制限無し

	if MjsHanLength(Result) > iLen then			//<D10-U> Length → MjsHanLength
	begin
		//全角SPはずしてみる
		Result := sName1 + sName2;

		if MjsHanLength(Result) > iLen then		//<D10-U> Length → MjsHanLength
		begin
			//<D10-U> >>>>
			{
			if ByteType(Result, iLen) = mbLeadByte then
			begin
				Result := Copy(Result, 1, iLen - 1);
			end
			else
			begin
				Result := Copy(Result, 1, iLen);
			end;
			}
			//<D10-U> <<<<
			Result := MjsHanCopy(Result, 1, iLen);	//<D10-U> Copy → MjsHanCopy
		end;
	end;
end;

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行
//	Name		:	T.Shinoda(Lab)
//	Date		:	2008/02/15	<2008-02-15>
//	Parameter	:	iSyori	0=設定 1=開放
//	History		:	9999/99/99	X.Xxxxxx
//**********************************************************************
procedure THAP000010StaffSelDlgF.SessionPractice(iSyori: Integer);
begin
	with m_SPCopHist do
	begin
												// 処理区分
		ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		ParamByName('@pMSHistKbn').AsInteger	:= 1;
												// 担当者内部ｺｰﾄﾞ
		ParamByName('@pTanNCode').AsCurrency	:= recCommon.TantoNCD;
												// 担当者名称
		ParamByName('@pTanSimpleName').AsString	:= recCommon.TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
		ParamByName('@pSysCode').AsInteger		:= m_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
		ParamByName('@pOptCode').AsInteger		:= m_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
		ParamByName('@pPrgCode').AsInteger		:= m_pRec^.m_iProgramCode;

		//Prepare();							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする		//<D10-Stored> DEL
		ExecProc();								// ｽﾄｱﾄﾞ実行
		//UnPrepare();							// ﾘｿｰｽを解放する			//<D10-Stored> DEL
	end;
//<080811>↓
	with m_SPMjsHist do
	begin
												// 処理区分
		ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		ParamByName('@pMSHistKbn').AsInteger	:= 1;
												// 担当者内部ｺｰﾄﾞ
		ParamByName('@pTanNCode').AsCurrency	:= m_UpdCmnTantoNCD;
												// 担当者名称
		ParamByName('@pTanSimpleName').AsString	:= fnGetUpdCmnTantoName(m_UpdCmnTantoNCD);
												// ｼｽﾃﾑｺｰﾄﾞ
		ParamByName('@pSysCode').AsInteger		:= m_pRec^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
		ParamByName('@pOptCode').AsInteger		:= m_pRec^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
		ParamByName('@pPrgCode').AsInteger		:= m_pRec^.m_iProgramCode;

		//Prepare();							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする		//<D10-Stored> DEL
		ExecProc();								// ｽﾄｱﾄﾞ実行
		//UnPrepare();							// ﾘｿｰｽを解放する			//<D10-Stored> DEL
	end;
//<080811>↑
end;

//**********************************************************************
//		Event		:fnRetCmnNCode
//		Process		:担当者内部コード戻し
//		Parameter	:
//		Return		:
//**********************************************************************
function THAP000010StaffSelDlgF.fnRetCmnNCode : Int64;
begin
	Result := m_iNCmn;
end;

//**********************************************************************
//		Event		:fnRetNCode
//		Process		:社員内部コード戻し
//		Parameter	:
//		Return		:
//**********************************************************************
function THAP000010StaffSelDlgF.fnRetNCode : Int64;
begin
	Result := m_iNCorp;
end;

//**********************************************************************
//		Event		:fnRetGCode
//		Process		:社員外部コード戻し
//		Parameter	:
//		Return		:
//**********************************************************************
function THAP000010StaffSelDlgF.fnRetGCode : String;
begin
	Result := m_sGCode;
end;

//**********************************************************************
//		Event		: fnRetNotMosSc
//		Process		: 担当者削除済み社員存在確認（担当者復旧用）
//		Parameter	:
//		Return		:
//**********************************************************************
function THAP000010StaffSelDlgF.fnRetNotMosSc : Boolean;
begin
	if mqGrd.eof then
		Result := False
	else
		Result := True;
end;

//**********************************************************************
//		Event		: fnUpDateMakeCode
//		Process		: 自動採番コード設定値保存
//		Parameter	: iNCode:社員内部コード
//					: iNCmn:共通担当者内部コード
//					: qhCorp:会社DB更新用クエリ
//					: qryMjsDB:共通DB更新用クエリ
//					: iItem:	更新項目コード
//					: iKbn:	更新区分コード
//		Return		: TRUE/FALSE
//		Date		: 2011/04/22	<2011-04-22>
//**********************************************************************
function THAP000010StaffSelDlgF.fnUpDateMakeCode(iNCode,iNCmn: Int64; qhCorp, qhMjs: TMQuery; iItem, iKbn: Integer): Boolean;
var
	sTBL,sFLD	: String;
begin
	Result := FALSE;

	if iItem > 0 then
	begin
		sTBL	:= '';
		sFLD	:= '';

		with qhCorp do
		begin
			try
				Close;
				SQL.Clear;
				SQL.Add('SELECT TableName,FieldName FROM HAPKM WHERE ItemNo=:hItem');
				SetFld('hItem').AsInteger	:= iItem;
				Open(TRUE);

				sTbl:= GetFld('TableName').AsString;
				sFld:= GetFld('FieldName').AsString;

				Close;
				SQL.Clear;
				SQL.Add('UPDATE '+sTbl+' SET '+sFld+'=:hKbn WHERE ');

				if sTbl = 'MOS_OFFICE_STAFF' then
					SQL.Add('NCode = :hNCd')
				else if sTbl = 'HAPSC' then
					SQL.Add('CorpNCode = 0 AND NCode = :hNCd')
				else
					SQL.Add('EmpNCode = :hNCd');

				SetFld('hKbn').AsInteger	:= iKbn;
				SetFld('hNCd').AsString		:= IntToStr(iNCode);
				ExecSQL(TRUE);
			except
				Exit;
			end;
		end;

		if sTbl = 'MOS_OFFICE_STAFF' then
		begin
			with qhMjs do
			begin
				try
					Close;
					SQL.Clear;
					SQL.Add('UPDATE '+sTbl+' SET '+sFld+'=:hKbn WHERE NCode = :hNCd');
					SetFld('hKbn').AsInteger	:= iKbn;
					SetFld('hNCd').AsString		:= IntToStr(iNCmn);
					ExecSQL(TRUE);
				except
					Exit;
				end;
			end;

			with qhCorp do
			begin
				try
					Close;
					SQL.Clear;
					SQL.Add('UPDATE '+sTbl+' SET '+sFld+'=:hKbn WHERE NCode = :hNCd');
					SetFld('hKbn').AsInteger	:= iKbn;
					SetFld('hNCd').AsString		:= IntToStr(iNCode);
					ExecSQL(TRUE);
				except
					Exit;
				end;
			end;
		end;
	end;

	Result := TRUE;
end;


procedure THAP000010StaffSelDlgF.memTantoAfterScroll(DataSet: TDataSet);
begin
	// 0:新規 1:削除復旧
	if (m_iMode = 1) and (m_bGridFlg = True) then
	begin
		fnCmnMOSQueryGet();
	end;

end;

//************************************************************************
//*	Function		:	fnGetMapping　担当者マッピング情報取得
//*	Parameter		:	iPat : 0 共通→会社 / 1 会社→共通
//*	Retrun			:
//************************************************************************
function THAP000010StaffSelDlgF.fnGetMapping(iPat:ShortInt;iNCode:Int64):Int64;
var
	qCorpDB	: TMQuery;

begin
	qCorpDB := TMQuery.Create(Self);
	try
		DBMOD.SetDBInfoTOQuery(ddCOPDB,qCorpDB);

		with qCorpDB do
		begin
			Close;
			SQL.Clear;
			SQL.Add('SELECT TantoNCD, CMNTantoNCD FROM MOS_OFFICE_STAFF_MAPPING');

			if iPat = 1 then
				SQL.Add('WHERE TantoNCD = '+IntToStr(iNCode))
			else
				SQL.Add('WHERE CmnTantoNCD = '+IntToStr(iNCode));

			Open(TRUE);

			if not EOF then
			begin
				if iPat = 1 then
					Result	:= Trunc(GetFld('CmnTantoNCD').AsFloat)
				else
					Result	:= Trunc(GetFld('TantoNCD').AsFloat);
			end
			else
			begin
				Result := 0;
			end;
		end;

	finally
		qCorpDB.Close;
		qCorpDB.Free;
	end;
end;

//************************************************************************
//*	Function		:	fnGetUpdCmnTantoName　担当者名取得
//*	Parameter		:	iNCode: 共通更新担当者内部コード
//*	Retrun			:
//************************************************************************
function THAP000010StaffSelDlgF.fnGetUpdCmnTantoName(iNCode:Int64):String;
var
	qMjsDB	: TMQuery;

begin
	Result	:= '';

	qMjsDB := TMQuery.Create(Self);
	try
		DBMOD.SetDBInfoTOQuery(ddMJsDB,qMjsDB);

		with qMjsDB do
		begin
			Close;
			SQL.Clear;
			SQL.Add('SELECT Name FROM MOS_OFFICE_STAFF');
			SQL.Add('WHERE NCode = '+IntToStr(iNCode));

			Open(TRUE);

			if not EOF then
				Result	:= GetFld('Name').AsString;
		end;

	finally
		qMjsDB.Close;
		qMjsDB.Free;
	end;
end;

end.
