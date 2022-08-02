//************************************************************************
//*
//*     Systeme         :   勘定科目登録
//*     Program         :   科目出力順序自動登録ダイアログ
//*     ProgramID       :   JNTCRP009001_D5
//*     Name            :   Y.Kuroda
//*     Create          :   2011/03/08
//*     Comment         :   MJSLINK MAS130100から流用
//*     History			:	2011/03/08	Y.Kuroda
//*								HIS001 MLの不要なソースを削除。Galileoptで仕様変更した箇所は履歴を記載。
//*								HIS002 試算表(部門別)、試算表(ｾｸﾞﾒﾝﾄ)、試算表(部門別ｾｸﾞﾒﾝﾄ)対応。
//*									   (ﾌﾟﾛｼﾞｪｸﾄ試算表等の対応が必要になった場合のために工事/ﾌﾟﾛｼﾞｪｸﾄ採用を取得しておく)
//*								HIS003 追加科目に重複して表示されてしまう科目がある点を修正。
//*============================= Ver4.08/Ver5.01 修正内容 ================
//*								HIS004 ShiftState対応
//*								HIS005 補助内部コードがNULLで登録されてしまう点を修正。
//*============================= Ver5.02 修正内容 ========================
//*								HIS006 Key制御を整理。
//************************************************************************
unit JNTCRP009001_D5u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  dxCntner, dxTL, dxDBGrid, VCL.StdCtrls, Buttons, MJSBitBtn, MJSLabel,
  dxGrClms, Db, dxmdaset, FireDAC.Comp.Client, MjsCommonu, JNTMasComu, MjsDBModuleu, MJSQuery,
  MjsMsgStdu, MJSDispCtrl, VCL.ExtCtrls, MJSPanel, ComCtrls, IniFiles, MetaSpt, MjsStrCtrl,
  MJSSpeedButton, MJSMemo
  , MJSEdits
  ,MJSKeyDataState	// <HIS004>ADD
  ;

type
  {$I JNTCRP009001.inc}

// <HIS002>ADD↓
  TMasterInfo = record
	MasterKbn 	:	Integer;				// マスタ区分
   	UseKbn		:   Integer;				// 採用区分
	KojUseKbn	:	Integer;				// 工事採用区分
   	BmnSegUseKbn:	Integer;				// 拡張セグメント集計採用区分
  end;

  TROrderCtrl = record
  	EntNo		:	Integer;				// No
	RepoName	:	String;					// 帳票名称
	RepoClass	:	Integer;				// 帳票種別
	MasterClass	:	Integer;				// マスタ種別
  end;
// <HIS002>ADD↑

  TJNTCRP009001_D5f = class(TForm)
	MemData_KmkMA: TdxMemData;
	MemData_KmkOrder: TdxMemData;
	MemData_KmkMAChk: TBooleanField;
    MemData_KmkMAGCode: TIntegerField;
	MemData_KmkMAName: TStringField;
	DataSource_KmkMA: TDataSource;
	DataSource_KmkOrder: TDataSource;
	MemData_KmkOrderChk: TBooleanField;
	MemData_KmkOrderNo: TIntegerField;
	MemData_KmkOrderName: TStringField;
	MemData_KmkOrderSyubetu: TStringField;
	MPnl_Btm: TMPanel;
	B_OK: TMBitBtn;
	BCancel: TMBitBtn;
	MPnl_Main: TMPanel;
	MLabel2: TMLabel;
	DBGrid_KmkMA: TdxDBGrid;
	DBGrid_KmkMARecId: TdxDBGridColumn;
	DBGrid_KmkMAChk: TdxDBGridCheckColumn;
    DBGrid_KmkMAGCode: TdxDBGridMaskColumn;
	DBGrid_KmkMAName: TdxDBGridMaskColumn;
	MLabel3: TMLabel;
	DBGrid_KmkOrder: TdxDBGrid;
	DBGrid_KmkOrderRecId: TdxDBGridColumn;
	DBGrid_KmkOrderChk: TdxDBGridCheckColumn;
	DBGrid_KmkOrderNo: TdxDBGridMaskColumn;
	DBGrid_KmkOrderName: TdxDBGridMaskColumn;
	DBGrid_KmkOrderSyubetu: TdxDBGridMaskColumn;
	MemData_KmkOrderRepoClass: TIntegerField;
	MemData_KmkOrderEntNo: TIntegerField;
	ProgressBar: TProgressBar;
	MLabel4: TMLabel;
	MPnl_Gaide: TMPanel;
	Gaide: TMMemo;
	B_Log: TMBitBtn;
    MemData_KmkMANCode: TFloatField;
    MLabel_InsDateTitle: TMLabel;
    DBGrid_KmkMANCode: TdxDBGridMaskColumn;
    B_KmkOrder: TMBitBtn;
    MDateEdit_InsDate: TMDateEdit;
    MemData_KmkOrderMasterClass: TIntegerField;

	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;
	procedure B_OKClick(Sender: TObject);
	procedure DBGrid_KmkMAEnter(Sender: TObject);
	procedure DBGrid_KmkOrderEnter(Sender: TObject);
	procedure DBGrid_KmkMAMouseDown(Sender: TObject; Button: TMouseButton;
	  Shift: TShiftState; X, Y: Integer);
	procedure DBGrid_KmkOrderMouseDown(Sender: TObject;
	  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
	procedure B_LogClick(Sender: TObject);
    procedure BCancelClick(Sender: TObject);
    procedure B_KmkOrderClick(Sender: TObject);
    procedure MDateEdit_InsDateExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid_KmkOrderChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer);
    procedure DBGrid_KmkMAChangeColumn(Sender: TObject;
      Node: TdxTreeListNode; Column: Integer);

  private
	{ Private 宣言 }
	MDataModule		:	TMDataModulef;
	dbCorp_Select	:	TFDConnection;
	pComArea		:	^TMjsAppRecord;
	ComArea			:	TJNTMASCom;
	MjsMsgRec 		:   TMjsMsgRec;
	AOwner			:	TComponent;
	m_OrderInsRec	:	array of OrderInsRec;	// 出力順序 挿入箇所検索構造体
	m_sLogFile		:	string;
	m_iLine			:	Integer;
	m_bHeadWrite	:	Boolean;
	m_bFirst		:	Boolean;
	m_bStart		:	Boolean;
	m_iRepoClass	:	Integer;
	m_iMasterClass	:	Integer;												// マスタ種別				<HIS002>ADD
	m_iEntNo		:	Integer;
	m_iRepoType		:	Integer;
	m_iRepoKbn		:	Integer;
	m_sPtnName		:	String;
	m_sTitleName	:	String;
	m_dKmkNCode		:	Double;
	m_sKmkGCode		:	String;													// 科目外部コード 			<HIS001>ADD
	m_sKmkName		:	String;
	m_iYearKbn		:	Integer;												// 和暦/西暦区分			<HIS001>ADD
	m_KmkOrderRec	:	array of KmkOrderRec;									// 追加科目構造体（マージ）	<HIS001>ADD
	m_dtDispDate 	:	TDateTime; 												// 科目マスタ登録日			<HIS001>ADD
	m_dtToDay		:	TDateTime;												// 今日日付					<HIS001>ADD
	m_ComputerName	:	String;													// クライアントマシン名		<HIS001>ADD
	m_MasterInfoRec	:	array of TMasterInfo;									// マスタ情報配列			<HIS002>ADD
	m_ROrderCtrlRec : 	array of TROrderCtrl;									// 出力順序情報配列			<HIS002>ADD

//	procedure fnDataDsp;														// 	<HIS001>DEL
	procedure fnDataDsp(pDispKbn : Integer);									// 	<HIS001>ADD
	function  fnInsertKmkOrder_Main(var bInsertOk: Boolean; iRecNo: Integer): Boolean;
	function  fnGetKmkList(dSumNCode: Double): Boolean;
   	function  fnInsertKmkOrder(dOrderCode: Double; iPosition: Integer): Integer;
	function  fnOrderNoReset: Boolean;
	procedure fnLogFileHeaderWriteln( sText: string = '' );
	procedure fnLogFileWriteln( sText: string );
	function  fnEntryCheck: Boolean;
	function  fnGetToDay: TDateTime;											// 本日日付取得	   			<HIS001>ADD
	procedure SaveNewKmkRec;                    								// 新規追加科目保存		   	<HIS001>ADD
	procedure GetKmkSomeDay(dtDate: TDateTime);									// 日付検索科目追加			<HIS001>ADD
	procedure SetMemKmkOrder(pRepoClass: Integer);								// 出力順序MemDataセット	<HIS002>ADD
  public
	{ Public 宣言 }

//	m_KmkOrderRec	:	array of KmkOrderRec;									// 出力順序自動追加用		<HIS001>DEL
   	m_KmkRecNew		:	array of KmkOrderRec;									// 追加科目構造体（新規）	<HIS001>ADD
	m_bAnoPrgStFlg	:	Boolean;												// 科目出力順序起動ﾌﾗｸﾞ     <HIS001>ADD

	function DLG(Owner:TComponent; pMDataModule:TMDataModulef;
				 pdbCorp_Select:TFDConnection; m_pRec:pointer; pYearKbn:Integer):Integer;
  end;

var
  JNTCRP009001_D5f: TJNTCRP009001_D5f;

implementation

// <HIS002>ADD↓
const
	SISAN			=	2;		// 試算表
	SISAN_BMN		=	3;		// 試算表（部門別）
	KESSAN			=	4;		// 決算書
	SISAN_SEG		=	41;		// 試算表（セグメント別）
	SISAN_BMNSEG	=	43;		// 試算表（部門別セグメント）
// <HIS002>ADD↑

{$R *.DFM}

//**************************************************************************
//	Proccess	:	アプリケーションからのパラメータセット
//	Name		:	N.Nabe
//	Date		:	2008/11/10
//	Parameter	:	m_KmkOrder	:	出力順序自動追加用配列
//					m_pRec		:	TMjsAppRecordのﾎﾟﾝﾀ
//	Retrun	  	:	正常（１）／ｷｬﾝｾﾙ（２）
//	History	　	:
//**************************************************************************
function TJNTCRP009001_D5f.DLG(Owner:TComponent; pMDataModule:TMDataModulef;
							 pdbCorp_Select:TFDConnection; m_pRec:pointer; pYearKbn:Integer):Integer;
var
	iReturn		:	Integer;
    iMetaSpt	:	Integer;		// <HIS001>ADD
begin
    AOwner      	:= Owner;
	MDataModule 	:= pMDataModule;
	dbCorp_Select	:= pdbCorp_Select;
	pComArea 		:= m_pRec;
	ComArea	 		:= TJNTMASCom( pComArea^.m_pSystemArea^ );
	m_iYearKbn		:= pYearKbn;

	//	ｼｽﾃﾑｶﾗｰとｱｸｾﾝﾄｶﾗｰをｾｯﾄされた色に変更
	MjsColorChange(
					TJNTCRP009001_D5f ( Self ),
					ComArea.SystemArea.SysColorB,
					ComArea.SystemArea.SysColorD,
					ComArea.SystemArea.SysBaseColorB,
					ComArea.SystemArea.SysBaseColorD,
					rcCOMMONAREA(pComArea^.m_pCommonArea^).SysFocusColor
				);

	//	ﾌｫﾝﾄを、ﾕｰｻﾞｰｶｽﾀﾏｲｽﾞされたﾌｫﾝﾄに変更
	MjsFontResize(TJNTCRP009001_D5f(Self),Pointer(m_pRec));


	m_bFirst 	   := False;
	m_bStart	   := False;
	m_bAnoPrgStFlg := False;

    // マシン名称取得
   	iMetaSpt := GetClientName(m_ComputerName);
	if iMetaSpt < 0 then
		MjsMessageBoxEx(Self,'マシン名の取得に失敗しました。', MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );

	// Logファイル関係初期処理
	m_sLogFile := rcCOMMONAREA(pComArea^.m_pCommonArea^).SysCliRoot + '\Log\'+
					m_ComputerName + '_' + FormatDateTime('yyyymmdd"_"hhnnss', Now) + '_科目登録.Log';

	B_Log.Enabled := FileExists(m_sLogFile);


	// データ表示
	// <HIS001>MOD↓
//	fnDataDsp;
	fnDataDsp(0);
	// <HIS001>MOD↑

	iReturn := ShowModal;

	Result := iReturn;
end;

// <HIS001>ADD↓
//************************************************************************
//*     Component       :   FormShow
//*     Event           :
//*     Name            :   Y.Kuroda
//************************************************************************
procedure TJNTCRP009001_D5f.FormShow(Sender: TObject);
begin

	if m_iYearKbn = 0 then	// 和暦
		MDateEdit_InsDate.DateFormat := dfEMD
	else					// 西暦
		MDateEdit_InsDate.DateFormat := dfYMD;

	if Length(m_KmkOrderRec) > 0 then
		B_OK.SetFocus
	else
		B_KmkOrder.SetFocus;
end;
// <HIS001>ADD↑

//************************************************************************
//*     Component       :   FormClose
//*     Event           :
//*     Name            :   N.Nabe
//************************************************************************
procedure TJNTCRP009001_D5f.FormClose(Sender: TObject; var Action: TCloseAction);
var
	iLoop,iLoop2	:	Integer;	// <HIS001>ADD
begin
	// <HIS001>ADD↓
	for iLoop := 0 to Length(m_KmkOrderRec)-1 do
    begin
		for iLoop2 := 0 to Length(m_KmkRecNew)-1 do
		begin
			if m_KmkRecNew[iLoop2].NCode = m_KmkOrderRec[iLoop].NCode then
				m_KmkRecNew[iLoop2].AddOk := m_KmkOrderRec[iLoop].AddOk;
		end;
    end;
	// <HIS001>ADD↑
end;

//************************************************************************
//*     Component       :   CMChildKey
//*     Event           :
//*     Name            :   N.Nabe
//************************************************************************
procedure TJNTCRP009001_D5f.CMChildKey(var Msg: TWMKey);
var
	sShift              : 	TShiftState;				// <HIS004>ADD
	AcControl			:	TWinControl;				// <HIS006>ADD
begin
	sShift	:=	MJSKeyDataToShiftState(Msg.KeyData);	//	Shiftｷｰの取得 <HIS004>ADD
	AcControl := Screen.Activecontrol;					// <HIS006>ADD

	{//	<HIS006>DEL↓
	if (Screen.Activecontrol is TMBitBtn) then
	begin

		if (Msg.CharCode = VK_LEFT) or (Msg.CharCode = VK_UP)then
		begin
			MjsDispCtrl.MjsPrevCtrl(Self);
			abort;
		end;

		if (Msg.CharCode = VK_RIGHT) or (Msg.CharCode = VK_DOWN) then
		begin
			MjsDispCtrl.MjsNextCtrl(Self);
			abort;
		end;

  		if (Msg.CharCode=VK_END) then		// END処理
		begin
			B_OK.SetFocus;
			abort;
		end;

		if (Msg.CharCode=VK_ESCAPE) then	// ESC処理
		begin
			ModalResult := mrCANCEL;
		end;
	end;

	if (Screen.Activecontrol is TdxDBGrid) then
	begin
		if Msg.CharCode = VK_SPACE then
		begin
			if Screen.Activecontrol = DBGrid_KmkMA then
			begin
				MemData_KmkMA.Edit;
				if MemData_KmkMAChk.AsBoolean then
					MemData_KmkMAChk.AsBoolean := False
				else
					MemData_KmkMAChk.AsBoolean := True;
				MemData_KmkMA.Post;
			end
			else
			begin
				MemData_KmkOrder.Edit;
				if MemData_KmkOrderChk.AsBoolean then
					MemData_KmkOrderChk.AsBoolean := False
				else
					MemData_KmkOrderChk.AsBoolean := True;
				MemData_KmkOrder.Post;
			end;
			abort;
		end;

		if Msg.CharCode = VK_RETURN then
		begin
			if Screen.Activecontrol = DBGrid_KmkMA then
			begin
				if MemData_KmkMA.RecNo = MemData_KmkMA.RecordCount then
				begin
					MjsDispCtrl.MjsNextCtrl(Self);
					abort;
				end;
			end
			else
			begin
				if MemData_KmkOrder.RecNo = MemData_KmkOrder.RecordCount then
				begin
					MjsDispCtrl.MjsNextCtrl(Self);
					abort;
				end;
			end;
		end;

		if (Msg.CharCode=VK_END) then		// END処理
		begin
			B_OK.SetFocus;
			abort;
		end;

		if (Msg.CharCode=VK_ESCAPE) then	// ESC処理
		begin
			ModalResult := mrCANCEL;
		end;

		if Msg.CharCode=VK_HOME then		// HOME処理
		begin
			abort;
		end;

		if (Msg.CharCode=VK_DOWN) or (Msg.CharCode=VK_RIGHT) then
		begin
			if Screen.Activecontrol = DBGrid_KmkMA then
			begin
				if MemData_KmkMA.RecNo = MemData_KmkMA.RecordCount then
				begin
					MjsDispCtrl.MjsNextCtrl(Self);
					abort;
				end;
			end;
			if Screen.Activecontrol = DBGrid_KmkOrder then
			begin
				if MemData_KmkOrder.RecNo = MemData_KmkOrder.RecordCount then
				begin
					MjsDispCtrl.MjsNextCtrl(Self);
					abort;
				end;
			end;
		end;

		if Screen.Activecontrol = DBGrid_KmkOrder then
		begin
			if (Msg.CharCode=VK_UP) or (Msg.CharCode=VK_LEFT) then

			begin
				if MemData_KmkOrder.RecNo = 1 then
				begin
					MjsDispCtrl.MjsPrevCtrl(Self);
					abort;
				end;
			end;
		end;
	end;

    // <HIS001>ADD↓
    if Screen.Activecontrol = MDateEdit_InsDate then
	begin
		if Msg.CharCode = VK_RETURN then
            DBGrid_KmkMA.SetFocus;

  		if (Msg.CharCode=VK_END) then		// END処理
		begin
			B_OK.SetFocus;
			abort;
		end;

   		if (Msg.CharCode=VK_ESCAPE) then	// ESC処理
		begin
			ModalResult := mrCANCEL;
		end;
	end;
    // <HIS001>ADD↑
	}// <HIS006>DEL↑

	// <HIS006>ADD↓
	if (AcControl is TMBitBtn) then
	begin
		if (Msg.CharCode=VK_RETURN) then
		begin
			Exit;
		end;
	end;

	if AcControl is TdxDBGrid then
	begin
		if Msg.CharCode = VK_SPACE then
		begin
			if (not (AcControl = DBGrid_KmkMA)) or
			   (not (AcControl = DBGrid_KmkOrder)) then
				Exit;

			TdxDBGrid(AcControl).DataSource.DataSet.FieldByName('Chk').AsBoolean :=
					not TdxDBGrid(AcControl).DataSource.DataSet.FieldByName('Chk').AsBoolean;
		end;
        if (Msg.CharCode=VK_RETURN) or
           ((Msg.CharCode=VK_TAB) and (sShift=[])) or
           (Msg.CharCode=VK_RIGHT) or
           (Msg.CharCode=VK_DOWN) then
        begin
            if TdxDBGrid(AcControl).FocusedNode <> TdxDBGrid(AcControl).LastNode then
            begin
				Exit;
            end;
		end;
        if ((Msg.CharCode=VK_TAB) and (sShift=[ssShift])) or
           (Msg.CharCode=VK_UP) or
           (Msg.CharCode=VK_LEFT) then
        begin
			if TdxDBGrid(AcControl).FocusedNode <> TdxDBGrid(AcControl).TopNode then
            begin
				Exit;
            end;
        end;
	end;
    // <HIS006>ADD↑

	// <HIS004>ADD↓
	// その他 TAB,Enter,→,↓処理
	if (Msg.CharCode=VK_RETURN) or
	   ((Msg.CharCode=VK_TAB) and (sShift=[])) or
	   (Msg.CharCode=VK_RIGHT) or		// <HIS006> ShiftState削除
	   (Msg.CharCode=VK_DOWN) then		// <HIS006> ShiftState削除
	begin
		MjsNextCtrl(Self);
		Abort;
	end;

	// その他 Shift+Tab,↑,←処理
	if ((Msg.CharCode=VK_TAB) and (sShift=[ssShift])) or
	   (Msg.CharCode=VK_UP) or			// <HIS006> ShiftState削除
	   (Msg.CharCode=VK_LEFT) then		// <HIS006> ShiftState削除
	begin
		MjsPrevCtrl(Self);
		Abort;
	end;

	// <HIS006>ADD↓
    if (Msg.CharCode=VK_END) then		// END処理
    begin
		if B_OK.CanFocus then		// <HIS006>ADD
	        B_OK.SetFocus;

        abort;
    end;

    if (Msg.CharCode=VK_ESCAPE) then	// ESC処理
    begin
        ModalResult := mrCANCEL;
    end;

    if Msg.CharCode=VK_HOME then		// HOME処理
    begin
        abort;
    end;
	// <HIS006>ADD↑
	// <HIS004>ADD↑

	inherited;

end;

//************************************************************************
//*     Component       :   fnDataDsp
//*     Event           :	データ表示
//*     Name            :   N.Nabe
//*		Parameter		:	pDispKbn : Integer(0:初回表示 1:再表示)
//************************************************************************
//procedure TJNTCRP009001_D5f.fnDataDsp;						<HIS001>DEL
procedure TJNTCRP009001_D5f.fnDataDsp(pDispKbn : Integer);	// <HIS001>ADD
var
	DmqData		:	TMQuery;
	iLoop		:	Integer;
// <HIS002>DEL↓
//	iBmnUse		:	Integer;
//	iBSKbn		:	Integer;
//	iPLKbn		:	Integer;
// <HIS002>DEL↑
// <HIS002>ADD↓
	iCnt		:	Integer;
	bRC41AddFlg	:	Boolean;
	bRC43AddFlg	:	Boolean;
// <HIS002>ADD↑
begin
// <HIS002>DEL↓
//	iBSKbn := 0;
//	iPLKbn := 0;
// <HIS002>DEL↑
// <HIS002>ADD↓
	bRC41AddFlg := False;
	bRC43AddFlg	:= False;
	SetLength(m_MasterInfoRec,0);
   	SetLength(m_ROrderCtrlRec,0);
// <HIS002>ADD↑

	// <HIS001>ADD↓
	if pDispKbn = 0 then	// 初回表示時
	begin
        // 今日の日付を取得＆表示
        MDateEdit_InsDate.AsDateTime := fnGetToDay;
        m_dtDispDate := MDateEdit_InsDate.AsDateTime;
	end
	else					// 日付を指定して再表示時
	begin
        if m_dtDispDate <> MDateEdit_InsDate.AsDateTime then
        begin
            m_dtDispDate := MDateEdit_InsDate.AsDateTime;
            // 科目マスタ初期化

            MemData_KmkMA.Open;
            MemData_KmkMA.DisableControls;
			MemData_KmkMA.First;
            if MemData_KmkMA.Eof = False then
            begin
                for iLoop := DBGrid_KmkMA.Count -1 downto 0 do
                begin
                     MemData_KmkMA.Delete;
                end;
            end;
            MemData_KmkMA.EnableControls;


			// 出力順序初期化
            MemData_KmkOrder.Open;
            MemData_KmkOrder.DisableControls;
            MemData_KmkOrder.First;
            if MemData_KmkOrder.Eof = False then
			begin
                for iLoop := DBGrid_KmkOrder.Count -1 downto 0 do
                begin
                     MemData_KmkOrder.Delete;
                end;
			end;
            MemData_KmkOrder.EnableControls;

        end
		else
			Exit;
	end;

    SetLength(m_KmkOrderRec,0);

	// 新規追加科目（親から継承）をマージ
	if m_dtToDay = MDateEdit_InsDate.AsDateTime then
		SaveNewKmkRec;

	// 指定日の追加科目をマージ
    GetKmkSomeDay(m_dtDispDate);

	if Length(m_KmkOrderRec) > 0 then
	begin
	// <HIS001>ADD↑
    	// 新規追加科目表示
		MemData_KmkMA.Open;
        for iLoop := 0 to Length(m_KmkOrderRec)-1 do
        begin
            MemData_KmkMA.Append;

        	MemData_KmkMA.FieldByName('Chk'	 ).AsBoolean := True;						//	チェックあり
            MemData_KmkMA.FieldByName('GCode' ).AsFloat  := m_KmkOrderRec[iLoop].GCode;	//	外部コード
            MemData_KmkMA.FieldByName('NCode' ).AsFloat  := m_KmkOrderRec[iLoop].NCode;	//	内部コード
            MemData_KmkMA.FieldByName('Name').AsString  := m_KmkOrderRec[iLoop].SName;	//	科目簡略名称
            MemData_KmkMA.Post;

			// <HIS002>DEL↓
            {
            // BS科目が登録されているか確認
            if m_KmkOrderRec[iLoop].BPKbn = 0 then			iBSKbn := 1
            else if m_KmkOrderRec[iLoop].BPKbn = 1 then		iPLKbn := 1;
			}
			// <HIS002>DEL↑
        end;
		MemData_KmkMA.First;
		// <HIS001>ADD↓
		B_OK.Enabled := True;
	end
	else
	begin
		B_OK.Enabled := False;
	end;
	// <HIS001>ADD↑

	// 登録済み科目出力順序表示
	MemData_KmkOrder.Open;
	DmqData := TMQuery.Create( Application );					//	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqData );		//	DBとMQueryの接続

	try
		with DmqData do
		begin
		// <HIS002>DEL↓
		{
			Close;
			SQL.Clear;
			SQL.ADD('SELECT UseKbn From MasterInfo Where MasterKbn = 41');

			//	ｴﾗｰの判定
			if Open = False then
			begin
				ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmqData );
				MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
				Exit;
			end;

     		if EOF = False then			iBmnUse := GetFld('UseKbn').AsInteger
			else						iBmnUse := 0;
		}
		// <HIS002>DEL↑
		// <HIS002>ADD↓
			// マスタ採用情報取得
			Close;
			SQL.Clear;
            SQL.Add('SELECT MasterKbn,UseKbn,KojUseKbn,MstrKbn11 FROM MasterInfo');
            SQL.Add('WHERE (MasterKbn = 41)');
			SQL.Add('OR    (MasterKbn BETWEEN 101 AND 110)');
			SQL.Add('OR    (MasterKbn BETWEEN 201 AND 210)');
			SQL.Add('ORDER BY MasterKbn ');

			//	ｴﾗｰの判定
			if Open = False then
			begin
				ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmqData );
				MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
				Exit;
			end;

			iCnt := 0;
            //取得したデータを設定
            while EOF = False do
            begin
				SetLength(m_MasterInfoRec,Length(m_MasterInfoRec)+1);
                m_MasterInfoRec[iCnt].MasterKbn		:= GetFld('MasterKbn').AsInteger;
                m_MasterInfoRec[iCnt].UseKbn		:= GetFld('UseKbn').AsInteger;
                m_MasterInfoRec[iCnt].KojUseKbn		:= GetFld('KojUseKbn').AsInteger;
                m_MasterInfoRec[iCnt].BmnSegUseKbn	:= GetFld('MstrKbn11').AsInteger;
				Inc(iCnt);
                Next;
            end;
        // <HIS002>ADD↑

			Close;
			SQL.Clear;
			SQL.ADD('SELECT '						);
			SQL.ADD(	'RepoClass '				);	//	帳票種別
			SQL.ADD(	', MasterClass ' 			);	//	マスタ種別
			SQL.ADD(	', EntNo '					);	//	登録No
			SQL.ADD(	', RepoName '				);	//	出力順序名称
			SQL.ADD('FROM '							);
			SQL.ADD(	'ROrderCtrl '				);	//	帳票出力順序管理情報
			SQL.ADD('WHERE '						);

		// <HIS002>MOD↓
        {
            case iBmnUse of
                0:		SQL.ADD(	'RepoClass in (2,4) '		);	//	帳票種別
                1:
                begin
                    if (iBSKbn = 1) and (iPLKbn = 0) then	SQL.ADD(	'RepoClass in (2,4) '		)	//	帳票種別
                    else 									SQL.ADD(	'RepoClass in (2,3,4) '		);	//	帳票種別
                end;
                2:		SQL.ADD(	'RepoClass in (2,3,4) '		);	//	帳票種別
            end;
        }
			SQL.ADD('RepoClass in (2,4');	//	帳票種別
			for iLoop := 0 to Length(m_MasterInfoRec)-1 do
			begin
				if m_MasterInfoRec[iLoop].MasterKbn = 41 then
                begin
                    if m_MasterInfoRec[iLoop].UseKbn <> 0 then
					begin
                        SQL.ADD(',3');	//	試算表(部門別)
						Break;
					end;
                end;
			end;

			for iLoop := 0 to Length(m_MasterInfoRec)-1 do
			begin
				case m_MasterInfoRec[iLoop].MasterKbn of
					41:
					begin
                        if m_MasterInfoRec[iLoop].UseKbn <> 0 then
                        begin
                            SQL.ADD(',3');	//	試算表(部門別)
                            continue;
                        end;
					end;
					101..110:
					begin
						if m_MasterInfoRec[iLoop].UseKbn <> 0 then
						begin
							if bRC41AddFlg = False then
							begin
								SQL.ADD(',41');		//	試算表(セグメント別)
								bRC41AddFlg := True;
							end;

							if (m_MasterInfoRec[iLoop].BmnSegUseKbn <> 0) and (bRC43AddFlg = False) then
							begin
								SQL.ADD(',43');		//	試算表(部門別セグメント)
								bRC43AddFlg := True;
							end;
						end;
					end;
				end;
			end;
			SQL.ADD(')');
		// <HIS002>MOD↑

			SQL.ADD('Order by RepoClass, EntNo '	);

			//	ｴﾗｰの判定
			if Open = False then
			begin
				ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmqData );
				MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
				Exit;
			end;

			iCnt := 0;
                        
			while EOF = False do
			begin
			// <HIS002>MOD↓
			{
				MemData_KmkOrder.Append;
				MemData_KmkOrder.FieldByName('Chk').AsBoolean :=True;
				MemData_KmkOrder.FieldByName('No').AsInteger := GetFld('EntNo').AsInteger;		//	登録No
				MemData_KmkOrder.FieldByName('Name').AsString := GetFld('RepoName').AsString;	//	出力順序名称
				case GetFld('RepoClass').AsInteger of											//	帳票種別
					2:		MemData_KmkOrder.FieldByName('Syubetu').AsString := '試算表';
					3:		MemData_KmkOrder.FieldByName('Syubetu').AsString := '試算表（部門別）';
					4:		MemData_KmkOrder.FieldByName('Syubetu').AsString := '決算書';
					else	MemData_KmkOrder.FieldByName('Syubetu').AsString := 'その他';
				end;
				MemData_KmkOrder.FieldByName('RepoClass').AsInteger := GetFld('RepoClass').AsInteger;		//	登録No
				MemData_KmkOrder.FieldByName('EntNo').AsInteger := GetFld('EntNo').AsInteger;				//	登録No
				MemData_KmkOrder.Post;
			}
				SetLength(m_ROrderCtrlRec,Length(m_ROrderCtrlRec)+1);
				m_ROrderCtrlRec[iCnt].EntNo 		:= GetFld('EntNo').AsInteger;		// 登録No
				m_ROrderCtrlRec[iCnt].RepoName 		:= GetFld('RepoName').AsString;		// 出力順序名称
				m_ROrderCtrlRec[iCnt].RepoClass		:= GetFld('RepoClass').AsInteger;	// 帳票種別
				m_ROrderCtrlRec[iCnt].MasterClass	:= GetFld('MasterClass').AsInteger;	// マスタ種別
				Inc(iCnt);
			// <HIS002>MOD↑
				Next;
			end;

			// <HIS002>ADD↓
			// MemDataへ出力順序パターン情報をセット
			SetMemKmkOrder(SISAN);			// 試算表
			SetMemKmkOrder(SISAN_BMN);		// 試算表（部門別）
			SetMemKmkOrder(SISAN_SEG); 		// 試算表（セグメント別）
			SetMemKmkOrder(SISAN_BMNSEG); 	// 試算表（部門別セグメント）
			SetMemKmkOrder(KESSAN);  		// 決算書
			// <HIS002>ADD↑

			MemData_KmkOrder.First;
		end;
	finally
		DmqData.Close;
		DmqData.Free;
	end;
end;

// <HIS002>ADD↓
//**************************************************************************
//  Proccess    :   出力順序パターンをMemDataへセット
//  Name        :   Y.Kuroda
//  Date        :	2010/05/31
//  Parameter   :	aMasterKbn: Integer
//  Return      :   TMasterID
//**************************************************************************
procedure TJNTCRP009001_D5f.SetMemKmkOrder(pRepoClass: Integer);
var
	iLoop : Integer;
begin
    for iLoop := 0 to Length(m_ROrderCtrlRec) -1 do
    begin
        if m_ROrderCtrlRec[iLoop].RepoClass = pRepoClass then
        begin
            MemData_KmkOrder.Append;
            MemData_KmkOrder.FieldByName('Chk').AsBoolean 		:= True;
            MemData_KmkOrder.FieldByName('No').AsInteger 		:= m_ROrderCtrlRec[iLoop].EntNo;	 	//	登録No
            MemData_KmkOrder.FieldByName('Name').AsString 		:= m_ROrderCtrlRec[iLoop].RepoName;	 	//	出力順序名称
            case m_ROrderCtrlRec[iLoop].RepoClass of                                                    //	帳票種別
				2: 	MemData_KmkOrder.FieldByName('Syubetu').AsString 	:= '試算表';
				3:  MemData_KmkOrder.FieldByName('Syubetu').AsString 	:= '試算表(部門別)';
				4:  MemData_KmkOrder.FieldByName('Syubetu').AsString 	:= '決算書';
				41: MemData_KmkOrder.FieldByName('Syubetu').AsString 	:= '試算表(セグメント別)';
				43: MemData_KmkOrder.FieldByName('Syubetu').AsString 	:= '試算表(部門別セグメント)';
                else MemData_KmkOrder.FieldByName('Syubetu').AsString 	:= 'その他';
			end;                
            MemData_KmkOrder.FieldByName('RepoClass').AsInteger 	:= m_ROrderCtrlRec[iLoop].RepoClass;  	//	帳票種別
            MemData_KmkOrder.FieldByName('EntNo').AsInteger 		:= m_ROrderCtrlRec[iLoop].EntNo;   		//	登録No
            MemData_KmkOrder.FieldByName('MasterClass').AsInteger 	:= m_ROrderCtrlRec[iLoop].MasterClass;	//	マスタ種別
            MemData_KmkOrder.Post;
        end;
    end;
end;
// <HIS002>ADD↑
// <HIS001>ADD↓
//************************************************************************
//*     Proccess        :   デフォルト日付の取得(本日、西暦)
//*     Name            :   Y.Kuroda
//************************************************************************
function TJNTCRP009001_D5f.fnGetToDay: TDateTime;
var
	Query : TMQuery;
begin
	Result := StrToDate('1900/1/1');
	Query  := Nil;
	try
        Query := TMQuery.Create( Application );					//	MQueryの構築
        MDataModule.SetDBInfoToQuery( dbCorp_Select, Query );	//	DBとMQueryの接続
        with Query do
        begin
			Close;
            SQL.Clear;
            SQL.ADD('SELECT NOW(*) AS TNow');
            Open;

            //	ｴﾗｰの判定
            if Open = False then
            begin
                ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Query );
                MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
                Exit;
            end;
			m_dtToDay := StrToDate(FormatDateTime('yyyy/m/d',FieldByName('TNow').AsDateTime));
			Result := m_dtToDay;
		end;
	finally
		if Assigned(Query) then
        begin
			Query.Close;
			Query.Free;
		end;
	end;
end;

//**********************************************************************
//*		Proccess	:	新規追加科目コピー
//*		Name		:	Y.Kuroda
//*		Date		:	2011/03/14
//**********************************************************************
procedure TJNTCRP009001_D5f.SaveNewKmkRec;
var
	iLoop : Integer;
begin
	for iLoop := 0 to Length(m_KmkRecNew)-1 do
    begin
        SetLength(m_KmkOrderRec,Length(m_KmkOrderRec)+1);
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].MasKbn		:= m_KmkRecNew[iLoop].MasKbn;		//	ﾏｽﾀ区分
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].NCode 		:= m_KmkRecNew[iLoop].NCode;		//	内部ｺｰﾄﾞ
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].GCode 		:= m_KmkRecNew[iLoop].GCode;		//	外部ｺｰﾄﾞ
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].Kbn 			:= m_KmkRecNew[iLoop].Kbn;			//	実在/合計区分
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].SName 		:= m_KmkRecNew[iLoop].SName;		//	簡略名称
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].LName 		:= m_KmkRecNew[iLoop].LName;		//	正式名称
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].AnalyzeCode	:= m_KmkRecNew[iLoop].AnalyzeCode;	//	分析ｺｰﾄﾞ
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].AddOk 		:= m_KmkRecNew[iLoop].AddOk;		//	すでに登録済み
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].BPKbn 		:= m_KmkRecNew[iLoop].BPKbn;		//	BS/PL区分
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].BmnUse 		:= m_KmkRecNew[iLoop].BmnUse;		//	部門採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse1 		:= m_KmkRecNew[iLoop].SegUse1;		//	セグメント採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse2 		:= m_KmkRecNew[iLoop].SegUse2;		//	セグメント採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse3 		:= m_KmkRecNew[iLoop].SegUse3;		//	セグメント採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse4 		:= m_KmkRecNew[iLoop].SegUse4;		//	セグメント採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse5 		:= m_KmkRecNew[iLoop].SegUse5;		//	セグメント採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse6 		:= m_KmkRecNew[iLoop].SegUse6;		//	セグメント採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse7		:= m_KmkRecNew[iLoop].SegUse7;		//	セグメント採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse8 		:= m_KmkRecNew[iLoop].SegUse8;		//	セグメント採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse9 		:= m_KmkRecNew[iLoop].SegUse9;		//	セグメント採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse10 	:= m_KmkRecNew[iLoop].SegUse10;		//	セグメント採用
		// <HIS002>ADD↓
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse1 		:= m_KmkRecNew[iLoop].PrjUse1;		//	プロジェクト採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse2 		:= m_KmkRecNew[iLoop].PrjUse2;		//	プロジェクト採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse3 		:= m_KmkRecNew[iLoop].PrjUse3;		//	プロジェクト採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse4 		:= m_KmkRecNew[iLoop].PrjUse4;		//	プロジェクト採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse5 		:= m_KmkRecNew[iLoop].PrjUse5;		//	プロジェクト採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse6 		:= m_KmkRecNew[iLoop].PrjUse6;		//	プロジェクト採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse7		:= m_KmkRecNew[iLoop].PrjUse7;		//	プロジェクト採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse8 		:= m_KmkRecNew[iLoop].PrjUse8;		//	プロジェクト採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse9 		:= m_KmkRecNew[iLoop].PrjUse9;		//	プロジェクト採用
        m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse10 	:= m_KmkRecNew[iLoop].PrjUse10;		//	プロジェクト採用
		// <HIS002>ADD↑
	end;
end;

//**********************************************************************
//*		Proccess	:	指定日追加科目取得
//*		Name		:	Y.Kuroda
//*		Date		:	2011/03/14
//**********************************************************************
procedure TJNTCRP009001_D5f.GetKmkSomeDay(dtDate: TDateTime);
var
	iLoop,iLength	:	Integer;
	bAddKmkCheckFlg	:	Boolean;
	Query			:	TMQuery;
const
	MASTERKBN	= 0;
	NCODE		= 1;
	GCODE		= 2;
	SUMKBN		= 3;
	SIMPLENAME	= 4;
	LONGNAME	= 5;
	ANALYZECODE	= 6;
	BMNUSE		= 7;
    SEGUSE1		= 8;
	SEGUSE2		= 9;
	SEGUSE3		= 10;
	SEGUSE4		= 11;
	SEGUSE5		= 12;
	SEGUSE6		= 13;
	SEGUSE7		= 14;
	SEGUSE8		= 15;
	SEGUSE9		= 16;
	SEGUSE10 	= 17;
	BPKBN   	= 18;
	// <HIS002>ADD↓
	PRJUSE1		= 19;
	PRJUSE2		= 20;
	PRJUSE3		= 21;
	PRJUSE4		= 22;
	PRJUSE5		= 23;
	PRJUSE6		= 24;
	PRJUSE7		= 25;
	PRJUSE8		= 26;
	PRJUSE9		= 27;
	PRJUSE10	= 28;
	// <HIS002>ADD↑
begin
	Query	:= Nil;
	try
        Query := TMQuery.Create( Self );					        //	MQueryの構築
        MDataModule.SetDBInfoToQuery( dbCorp_Select, Query );		//	DBとMQueryの接続
        with Query do
        begin
            Close;
            SQL.Clear;

            SQL.Add('SELECT MasterKbn,NCode,GCode,SumKbn,SimpleName,LongName,AnalyzeCode');
            SQL.Add('       ,BmnUse,SegUse1,SegUse2,SegUse3,SegUse4,SegUse5,SegUse6,SegUse7,SegUse8,SegUse9,SegUse10');
            SQL.Add('       ,BPKbn');
            SQL.Add('       ,PrjUse1,PrjUse2,PrjUse3,PrjUse4,PrjUse5,PrjUse6,PrjUse7,PrjUse8,PrjUse9,PrjUse10');	// <HIS002>ADD
            SQL.Add('FROM KmkMA');
            SQL.Add('WHERE MasterKbn = 1');
            SQL.Add('AND SumKbn = 0');
            SQL.Add('AND RDelKbn = 0');
			SQL.Add('AND AnalyzeCode <> 0');
            SQL.Add('AND CONVERT(Date,InsDateTM,111) = CONVERT(Date,:pDate,111)');
            SQL.Add('ORDER BY GCode');

			ParamByName('pDate').AsDateTime := dtDate;

            //	ｴﾗｰの判定
			if Open = False then
			begin
				ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Query );
				MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
				Exit;
			end;

			iLength := Length(m_KmkOrderRec)-1;
            while ( Eof <> True ) do
            begin
                bAddKmkCheckFlg := False;
                // 今回追加分かどうかチェック
                for iLoop := 0 to iLength do
                begin
                    if m_KmkOrderRec[iLoop].GCode = Fields[GCODE].AsInteger then
                    begin
                        bAddKmkCheckFlg := True;
                        Break;
                    end;
                end;
                // 今回追加科目だったら次へ
                if bAddKmkCheckFlg = True then
				begin
					Next;
                    Continue;
				end;

                SetLength(m_KmkOrderRec,Length(m_KmkOrderRec)+1);
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].MasKbn		:= Fields[MASTERKBN].AsInteger;		//	ﾏｽﾀ区分
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].NCode 		:= Fields[NCODE].AsFloat;			//	内部ｺｰﾄﾞ
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].GCode 		:= Fields[GCODE].AsInteger;			//	外部ｺｰﾄﾞ
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].Kbn 			:= Fields[SumKbn].AsInteger;		//	実在/合計区分
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].SName 		:= Fields[SIMPLENAME].AsString;		//	簡略名称
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].LName 		:= Fields[LONGNAME].AsString;		//	正式名称
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].AnalyzeCode	:= Fields[ANALYZECODE].AsInteger;	//	分析ｺｰﾄﾞ
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].AddOk 		:= True;							//	すでに登録済み
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].BPKbn 		:= Fields[BPKBN].AsInteger;			//	BS/PL区分
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].BmnUse 		:= Fields[BMNUSE].AsInteger;		//	部門採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse1 		:= Fields[SEGUSE1].AsInteger;		//	セグメント採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse2 		:= Fields[SEGUSE2].AsInteger;		//	セグメント採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse3 		:= Fields[SEGUSE3].AsInteger;		//	セグメント採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse4 		:= Fields[SEGUSE4].AsInteger;		//	セグメント採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse5 		:= Fields[SEGUSE5].AsInteger;		//	セグメント採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse6 		:= Fields[SEGUSE6].AsInteger;		//	セグメント採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse7		:= Fields[SEGUSE7].AsInteger;		//	セグメント採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse8 		:= Fields[SEGUSE8].AsInteger;		//	セグメント採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse9 		:= Fields[SEGUSE9].AsInteger;		//	セグメント採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].SegUse10 	:= Fields[SEGUSE10].AsInteger;		//	セグメント採用
				// <HIS002>ADD↓
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse1 		:= Fields[PRJUSE1].AsInteger;		//	プロジェクト採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse2 		:= Fields[PRJUSE2].AsInteger;		//	プロジェクト採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse3 		:= Fields[PRJUSE3].AsInteger;		//	プロジェクト採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse4 		:= Fields[PRJUSE4].AsInteger;		//	プロジェクト採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse5 		:= Fields[PRJUSE5].AsInteger;		//	プロジェクト採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse6 		:= Fields[PRJUSE6].AsInteger;		//	プロジェクト採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse7		:= Fields[PRJUSE7].AsInteger;		//	プロジェクト採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse8 		:= Fields[PRJUSE8].AsInteger;		//	プロジェクト採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse9 		:= Fields[PRJUSE9].AsInteger;		//	プロジェクト採用
                m_KmkOrderRec[Length(m_KmkOrderRec)-1].PrjUse10 	:= Fields[PRJUSE10].AsInteger;		//	プロジェクト採用
				// <HIS002>ADD↑
    			Next;
	        end;
        end;
    finally
		if Assigned(Query) then
		begin
			Query.Close;
			Query.Free;
		end;
    end;
end;
// <HIS001>ADD↑

//************************************************************************
//*     Component       :   B_OKClick
//*     Event           :	OKボタンクリック
//*     Name            :   N.Nabe
//************************************************************************
procedure TJNTCRP009001_D5f.B_OKClick(Sender: TObject);
var
	Dmq_RepGrInfo		:	TMQuery;
	Dmq_KmkOrder		:	TMQuery;
	iLoop				:	Integer;
	iRepoType			:	Integer;
	bOk					:	Boolean;

	bInsertOk			:	Boolean;
//	iRet				:	Integer;	// <HIS001>DEL

	iCntKmk				:	Integer;
	iCntOrder			:	Integer;
begin
	// チェックがひとつもなければそのまま終わる。
	bOk := False;
	bInsertOk := False;
	MemData_KmkMA.First;
	while MemData_KmkMA.Eof = False do
	begin
		if bOk = False then
			bOk := MemData_KmkMAChk.AsBoolean;

		for iLoop := 0 to Length(m_KmkOrderRec)-1 do
		begin
		//	m_KmkOrderRec[iLoop].Added := False;	//<HIS001>DEL
        	if m_KmkOrderRec[iLoop].NCode = MemData_KmkMANCode.AsInteger then
			begin
			// <HIS0001>DEL↓
            // 何度かにわけて登録をしたい場合、ﾁｪｯｸﾌﾗｸﾞが戻らない為if文削除
			//	if not m_KmkOrderRec[iLoop].AddOk then
			//	begin
			// <HIS0001>DEL↑
					m_KmkOrderRec[iLoop].Check := MemData_KmkMAChk.AsBoolean;
					m_KmkOrderRec[iLoop].AddOk := MemData_KmkMAChk.AsBoolean;
					break;
			//	end;	// <HIS0001>DEL
			end;
		end;

		MemData_KmkMA.Next;
	end;

	if bOk = False then
		exit;

	m_bHeadWrite := False;

	// 科目出力順序へ登録
	Dmq_RepGrInfo := TMQuery.Create( Application );					//	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, Dmq_RepGrInfo );	//	DBとMQueryの接続
	Dmq_KmkOrder := TMQuery.Create( Application );					//	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, Dmq_KmkOrder );	//	DBとMQueryの接続

	try
		MemData_KmkOrder.First;

		ProgressBar.Visible := True;
		ProgressBar.Max := MemData_KmkOrder.RecordCount;
		ProgressBar.Position := 0;
		Application.ProcessMessages;

		while MemData_KmkOrder.EOF = False do
		begin
			ProgressBar.Position := ProgressBar.Position + 1;
			Application.ProcessMessages;

			// 追加しない出力順序
			if not MemData_KmkOrderChk.AsBoolean then
			begin
				MemData_KmkOrder.Next;
				continue;
			end;

			m_iRepoClass := MemData_KmkOrderRepoClass.AsInteger;
			m_iMasterClass := MemData_KmkOrderMasterClass.AsInteger;	// <HIS002>ADD
			m_iEntNo := MemData_KmkOrderEntNo.AsInteger;
			m_sPtnName := MemData_KmkOrderName.AsString;

			Dmq_RepGrInfo.Close;
			Dmq_RepGrInfo.SQL.Clear;
			Dmq_RepGrInfo.SQL.ADD('SELECT RepoType, RepoKbn, TitleName From RepGrInfo');
        // <HIS002>MOD↓
		//	Dmq_RepGrInfo.SQL.ADD('WHERE RepoClass =:nRepoClass and EntNo =:nEntNo Order by RepoType Desc');
			Dmq_RepGrInfo.SQL.ADD('WHERE RepoClass =:nRepoClass and MasterClass =:nMasterClass and EntNo =:nEntNo');
			Dmq_RepGrInfo.SQL.ADD('ORDER BY RepoType Desc');
		// <HIS002>MOD↑
			Dmq_RepGrInfo.SetFld('nRepoClass').AsInteger := m_iRepoClass;
			Dmq_RepGrInfo.SetFld('nMasterClass').AsInteger := m_iMasterClass;	// <HIS002>ADD
			Dmq_RepGrInfo.SetFld('nEntNo').AsInteger := m_iEntNo;

			//	ｴﾗｰの判定
			if Dmq_RepGrInfo.Open = False then
			begin
				ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Dmq_RepGrInfo );
				MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
				Exit;
			end;

			while Dmq_RepGrInfo.EOF = False do
			begin
				m_iRepoType := Dmq_RepGrInfo.GetFld('RepoType').AsInteger;
				m_sTitleName := Dmq_RepGrInfo.GetFld('TitleName').AsString;

				Dmq_KmkOrder.Close;
				Dmq_KmkOrder.SQL.Clear;
				Dmq_KmkOrder.SQL.ADD('SELECT RepoClass From KmkOrder');
			// <HIS002>MOD↓
			//	Dmq_KmkOrder.SQL.ADD('WHERE RepoClass =:nRepoClass and EntNo =:nEntNo and RepoType =:nRepoType');
				Dmq_KmkOrder.SQL.ADD('WHERE RepoClass =:nRepoClass and MasterClass =:nMasterClass and EntNo =:nEntNo and RepoType =:nRepoType');
			// <HIS002>MOD↑
				Dmq_KmkOrder.SetFld('nRepoClass').AsInteger := m_iRepoClass;
				Dmq_KmkOrder.SetFld('nMasterClass').AsInteger := m_iMasterClass;	// <HIS002>ADD
				Dmq_KmkOrder.SetFld('nEntNo').AsInteger := m_iEntNo;
				Dmq_KmkOrder.SetFld('nRepoType').AsInteger := m_iRepoType;

				//	ｴﾗｰの判定
				if Dmq_KmkOrder.Open = False then
				begin
					ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Dmq_KmkOrder );
					MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
					Exit;
				end;

				// 対象出力順序の帳票に、科目が１件も無かった場合は、その帳票への科目追加はなし。
				if Dmq_KmkOrder.Eof = True then
				begin
					Dmq_RepGrInfo.Next;
					continue;
				end;

				case m_iRepoClass of
                // <HIS002>MOD↓
				//	4:												// 決算書
					KESSAN:
				// <HIS002>MOD↑
					begin
						if m_iRepoType >= 6 then						// 利益処分、株主資本等変動計算書、個別注記表はパス
						begin
							Dmq_RepGrInfo.Next;
							continue;
						end;

						// 分析コードで追加する帳票を判断
						for iLoop := 0 to Length(m_KmkOrderRec)-1 do
						begin
							if not m_KmkOrderRec[iLoop].Check then
								continue;

                            m_dKmkNCode := m_KmkOrderRec[iLoop].NCode;
							m_sKmkGCode := IntToStr(m_KmkOrderRec[iLoop].GCode);
							m_sKmkName := m_KmkOrderRec[iLoop].SName;

							case m_iRepoType of
								1:					// 資産の部
								begin
									// 分析コード1～37
									if not ( (m_KmkOrderRec[iLoop].AnalyzeCode >= 1) and (m_KmkOrderRec[iLoop].AnalyzeCode <= 37) ) then
										continue;
								end;
								2:					// 負債・資本の部
								begin
									// 分析コード38～99
									if not ( (m_KmkOrderRec[iLoop].AnalyzeCode >= 38) and (m_KmkOrderRec[iLoop].AnalyzeCode <= 99) ) then
										continue;
								end;
								3:					// 損益計算書
								begin
									// 分析コード100～199
									if not ( (m_KmkOrderRec[iLoop].AnalyzeCode >= 100) and (m_KmkOrderRec[iLoop].AnalyzeCode <= 199) ) then
										continue;
								end;
								4:					// 販管費内訳
								begin
									// 分析コード121～134
									if not ( (m_KmkOrderRec[iLoop].AnalyzeCode >= 121) and (m_KmkOrderRec[iLoop].AnalyzeCode <= 134) ) then
										continue;
								end;
								5:					// 製造原価計算書
								begin
									// 分析コード106～120
									if not ( (m_KmkOrderRec[iLoop].AnalyzeCode >= 106) and (m_KmkOrderRec[iLoop].AnalyzeCode <= 120) ) then
										continue;
								end;
							end;

							// 追加済みの科目か確認
							if not fnEntryCheck then
								continue;

							// 加算体系を確認しながら、出力順序に追加
							if not fnInsertKmkOrder_Main(bInsertOk, iLoop) then
								exit;

						end;
					end;
					else											// 試算表＆部門別試算表
					begin
						if m_iRepoType >= 5 then
						begin
							m_iRepoKbn := Dmq_RepGrInfo.GetFld('RepoKbn').AsInteger;
							iRepoType := m_iRepoKbn div 10;
						end
						else
							iRepoType := m_iRepoType;

						// 分析コードで追加する帳票を判断
						for iLoop := 0 to Length(m_KmkOrderRec)-1 do
						begin
							if not m_KmkOrderRec[iLoop].Check then
								continue;

							// 部門別試算表なのに部門採用がない科目は追加なし
						// <HIS001>MOD↓
						//	if (m_iRepoClass = 3) and ( (m_KmkOrderRec[iLoop].BmnUse = 0) and (m_KmkOrderRec[iLoop].Seg1Use = 0) ) then
						// <HIS002>MOD↓
						//	if (m_iRepoClass = 3) and (m_KmkOrderRec[iLoop].BmnUse = 0) then
							if (m_iRepoClass = SISAN_BMN) and (m_KmkOrderRec[iLoop].BmnUse = 0) then
						// <HIS002>MOD↑
						// <HIS001>MOD↑
								continue;

							// <HIS002>ADD↓
                            // セグメント別試算表なのにセグメント採用がない科目は追加なし
							if (m_iRepoClass = SISAN_SEG) and
							   (((m_iMasterClass = 1) and (m_KmkOrderRec[iLoop].SegUse1 = 0)) or
								((m_iMasterClass = 2) and (m_KmkOrderRec[iLoop].SegUse2 = 0)) or
								((m_iMasterClass = 3) and (m_KmkOrderRec[iLoop].SegUse3 = 0)) or
								((m_iMasterClass = 4) and (m_KmkOrderRec[iLoop].SegUse4 = 0)) or
								((m_iMasterClass = 5) and (m_KmkOrderRec[iLoop].SegUse5 = 0)) or
								((m_iMasterClass = 6) and (m_KmkOrderRec[iLoop].SegUse6 = 0)) or
								((m_iMasterClass = 7) and (m_KmkOrderRec[iLoop].SegUse7 = 0)) or
								((m_iMasterClass = 8) and (m_KmkOrderRec[iLoop].SegUse8 = 0)) or
								((m_iMasterClass = 9) and (m_KmkOrderRec[iLoop].SegUse9 = 0)) or
								((m_iMasterClass = 10) and (m_KmkOrderRec[iLoop].SegUse10 = 0))) then
								continue;

                            // 部門別セグメント試算表なのに部門とセグメント採用がない科目は追加なし
							if (m_iRepoClass = SISAN_BMNSEG) and
							   ((m_KmkOrderRec[iLoop].BmnUse = 0) or
							    ((m_iMasterClass = 1) and (m_KmkOrderRec[iLoop].SegUse1 = 0)) or
								((m_iMasterClass = 2) and (m_KmkOrderRec[iLoop].SegUse2 = 0)) or
								((m_iMasterClass = 3) and (m_KmkOrderRec[iLoop].SegUse3 = 0)) or
								((m_iMasterClass = 4) and (m_KmkOrderRec[iLoop].SegUse4 = 0)) or
								((m_iMasterClass = 5) and (m_KmkOrderRec[iLoop].SegUse5 = 0)) or
								((m_iMasterClass = 6) and (m_KmkOrderRec[iLoop].SegUse6 = 0)) or
								((m_iMasterClass = 7) and (m_KmkOrderRec[iLoop].SegUse7 = 0)) or
								((m_iMasterClass = 8) and (m_KmkOrderRec[iLoop].SegUse8 = 0)) or
								((m_iMasterClass = 9) and (m_KmkOrderRec[iLoop].SegUse9 = 0)) or
								((m_iMasterClass = 10) and (m_KmkOrderRec[iLoop].SegUse10 = 0))) then
								continue;
							// <HIS002>ADD↑


							m_dKmkNCode := m_KmkOrderRec[iLoop].NCode;
							m_sKmkGCode := IntToStr(m_KmkOrderRec[iLoop].GCode);
							m_sKmkName := m_KmkOrderRec[iLoop].SName;

							case iRepoType of
								1:					// 貸借対照表
								begin
									// 分析コード1～99
									if not ( (m_KmkOrderRec[iLoop].AnalyzeCode >= 1) and (m_KmkOrderRec[iLoop].AnalyzeCode <= 99) ) then
										continue;
								end;
								2:					// 損益計算書
								begin
									// 分析コード100～199
									if not ( (m_KmkOrderRec[iLoop].AnalyzeCode >= 100) and (m_KmkOrderRec[iLoop].AnalyzeCode <= 199) ) then
										continue;
								end;
								3:					// 販管費内訳
								begin
									// 分析コード121～134
									if not ( (m_KmkOrderRec[iLoop].AnalyzeCode >= 121) and (m_KmkOrderRec[iLoop].AnalyzeCode <= 134) ) then
										continue;
								end;
								4:					// 製造原価計算書
								begin
									// 分析コード106～120
									if not ( (m_KmkOrderRec[iLoop].AnalyzeCode >= 106) and (m_KmkOrderRec[iLoop].AnalyzeCode <= 120) ) then
										continue;
								end;
							end;

							// 追加済みの科目か確認
							if not fnEntryCheck then
								continue;

							// 加算体系を確認しながら、出力順序に追加
							if not fnInsertKmkOrder_Main(bInsertOk, iLoop) then
								exit;

						end;
					end;
				end;

				Dmq_RepGrInfo.Next;
			end;

			MemData_KmkOrder.Next;
		end;
	finally
		Dmq_RepGrInfo.Close;
		Dmq_RepGrInfo.Free;
		Dmq_KmkOrder.Close;
		Dmq_KmkOrder.Free;

		ProgressBar.Position := 0;
		ProgressBar.Visible := False;
		Application.ProcessMessages;
	end;

// <HIS001>MOD↓
	if bInsertOk then
    begin
//  iRet := MjsMessageBoxEx('完了しました。自動登録処理を継続しますか？','確認',mjInformation,mjYesNo,mjDefNo);
	MjsMessageBoxEx(AOwner,'科目出力順序に登録しました。'
    						+#13#10+'科目出力順序登録で登録内容を確認してください。','自動登録',mjInformation,mjOk,mjDefOK);
// <HIS001>MOD↑
// <HIS001>DEL↓
{
	if iRet = mrYes then
	begin
}
// <HIS001>DEL↑
		// 全ての科目が全ての出力順序に追加済みの場合には「自動登録ボタン」を入力不可にする
		iCntKmk := 0;
		iCntOrder := 0;
		MemData_KmkMA.First;
		MemData_KmkOrder.First;
		while MemData_KmkMA.Eof = False do
		begin
			if MemData_KmkMAChk.AsBoolean then
				inc(iCntKmk);

			MemData_KmkMA.Next;
		end;
		while MemData_KmkOrder.Eof = False do
		begin
			if MemData_KmkOrderChk.AsBoolean then
				inc(iCntOrder);

			MemData_KmkOrder.Next;
		end;

		if (MemData_KmkMA.RecordCount = iCntKmk) and (MemData_KmkOrder.RecordCount = iCntOrder) then
	// <HIS001>MOD↓
	{
			B_OK.Enabled := False;
		MjsSetFocus(Self,'DBGrid_KmkMA');
	end
	else						Self.Close;
		exit;
	}
		begin
			B_OK.Enabled := False;
			BCancel.Caption := '終了';
		end;
	end
    else
    begin
		MjsMessageBoxEx(AOwner,'選択した科目出力順序のパターンには、'+#13#10+
						       '既に該当の科目が登録されているか、挿入場所が見つかりませんでした。','自動登録',mjInformation,mjOk,mjDefOK);
	end;
	MemData_KmkMA.First;
	MemData_KmkOrder.First;
	// <HIS001>MOD↑
end;

// <HIS001>ADD↓
//************************************************************************
//*     Component       :   MDateEdit_InsDateExit
//*     Event           :	科目マスタ登録日Exit
//*     Name            :   Y.Kuroda
//************************************************************************
procedure TJNTCRP009001_D5f.MDateEdit_InsDateExit(Sender: TObject);
var
	sDateTime : String;
begin
	sDateTime := FormatDateTime('yyyy/mm/dd',MDateEdit_InsDate.AsDateTime);
	if sDateTime = '0000/00/00' then
		MDateEdit_InsDate.AsDateTime := m_dtToDay;

	// データ再表示
	fnDataDsp(1);
end;
// <HIS0001>ADD↑

//************************************************************************
//*     Component       :   DBGrid_KmkMAEnter
//*     Event           :	科目Gridエンター
//*     Name            :   N.Nabe
//************************************************************************
procedure TJNTCRP009001_D5f.DBGrid_KmkMAEnter(Sender: TObject);
begin
	DBGrid_KmkMA.FocusedColumn := 0;
end;

//************************************************************************
//*     Component       :   DBGrid_KmkOrderEnter
//*     Event           :	出力順序Gridエンター
//*     Name            :   N.Nabe
//************************************************************************
procedure TJNTCRP009001_D5f.DBGrid_KmkOrderEnter(Sender: TObject);
begin
	DBGrid_KmkOrder.FocusedColumn := 0;
end;

//************************************************************************
//*     Component       :   DBGrid_KmkMAMouseDown
//*     Event           :	科目Gridマウスダウン
//*     Name            :   N.Nabe
//************************************************************************
procedure TJNTCRP009001_D5f.DBGrid_KmkMAMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	DBGrid_KmkMA.FocusedColumn := 0;
end;

//************************************************************************
//*     Component       :   DBGrid_KmkOrderMouseDown
//*     Event           :	出力順序Gridマウスダウン
//*     Name            :   N.Nabe
//************************************************************************
procedure TJNTCRP009001_D5f.DBGrid_KmkOrderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	DBGrid_KmkOrder.FocusedColumn := 0;
end;

//************************************************************************
//*     Component       :   DBGrid_KmkMAChangeColumn	HIS006ADD
//*     Event           :	科目Gridカラムチェンジ
//*     Name            :   Y.Kuroda
//************************************************************************
procedure TJNTCRP009001_D5f.DBGrid_KmkMAChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer);
begin
	DBGrid_KmkMA.FocusedColumn := 0;
end;

//************************************************************************
//*     Component       :   DBGrid_KmkOrderChangeColumn	HIS006ADD
//*     Event           :	出力順序Gridカラムチェンジ
//*     Name            :   Y.Kuroda
//************************************************************************
procedure TJNTCRP009001_D5f.DBGrid_KmkOrderChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer);
begin
	DBGrid_KmkOrder.FocusedColumn := 0;
end;

//************************************************************************
//*     Component       :   fnInsertKmkOrder_Main
//*     Event           :	科目出力順序追加メイン
//*     Name            :   N.Nabe
//************************************************************************
function TJNTCRP009001_D5f.fnInsertKmkOrder_Main(var bInsertOk: Boolean; iRecNo: Integer): Boolean;
var
	Dmq_KmkTree			:	TMQuery;
	iRet				:	Integer;
	iLoop				:	Integer;
	SumNCode			:	Double;
begin
	Result := False;

	Dmq_KmkTree := TMQuery.Create( Application );					//	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, Dmq_KmkTree );		//	DBとMQueryの接続

	try

		// 追加した実在科目と加算上の同一レベルの勘定科目を検索する
		Dmq_KmkTree.Close;
		Dmq_KmkTree.SQL.Clear;
        Dmq_KmkTree.SQL.ADD('SELECT SumNCode From KmkTree');
		Dmq_KmkTree.SQL.ADD('WHERE MasterKbn = 1 and BasedNCode =:nBasedNCode');
		Dmq_KmkTree.SetFld('nBasedNCode').AsFloat := m_dKmkNCode;

		//	ｴﾗｰの判定
		if Dmq_KmkTree.Open = False then
		begin
			ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Dmq_KmkTree);
			MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
			Exit;
		end;

		while Dmq_KmkTree.Eof = False do
		begin
			SetLength(m_OrderInsRec,0);

			// *** 追加先優先順位リスト作成
			SumNCode := Dmq_KmkTree.GetFld('SumNCode').AsInteger;
			if not fnGetKmkList(SumNCode) then
				exit;

			// *** 出力順序追加
			iRet := 0;
			for iLoop := 0 to Length(m_OrderInsRec)-1 do
			begin
				iRet := fnInsertKmkOrder(m_OrderInsRec[iLoop].NCode, m_OrderInsRec[iLoop].Position);
				if iRet < 0 then
					exit
				else if iRet = 1 then
					break;
			end;

			// 追加されたら、ログ表示
			if iRet = 1 then
				bInsertOk := True;

			Dmq_KmkTree.Next;
		end;
	finally
		Dmq_KmkTree.Close;
		Dmq_KmkTree.Free;
	end;

	Result := True;

end;

//************************************************************************
//*     Component       :   fnGetKmkList
//*     Event           :	追加先優先順位リスト作成
//*     Name            :   N.Nabe
//************************************************************************
function TJNTCRP009001_D5f.fnGetKmkList(dSumNCode: Double): Boolean;
var
	Dmq_KmkTree			:	TMQuery;
begin
	Result := False;

	Dmq_KmkTree := TMQuery.Create( Application );					//	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, Dmq_KmkTree );		//	DBとMQueryの接続

	try
		// 追加した科目より同一加算先の上位の加算を探す
		Dmq_KmkTree.Close;
		Dmq_KmkTree.SQL.Clear;
		Dmq_KmkTree.SQL.ADD('SELECT KT1.EntNo, KT1.BasedNCode, KM.SumKbn From KmkTree KT1');
		Dmq_KmkTree.SQL.ADD('Left Outer Join KmkMA KM On KT1.BasedNCode = KM.GCode');
		Dmq_KmkTree.SQL.ADD('WHERE KT1.MasterKbn = 1 and KT1.SumNCode =:nSumNCode and KT1.EntNo <');
       	Dmq_KmkTree.SQL.ADD('(Select KT2.EntNo From KmkTree KT2 Where KT2.MasterKbn = 1 and KT2.SumNCode =:nSumNCode and');
		Dmq_KmkTree.SQL.ADD('KT2.BasedNCode =:nBasedNCode)');
		Dmq_KmkTree.SQL.ADD('Order by KT1.EntNo Desc');

		Dmq_KmkTree.SetFld('nSumNCode').AsFloat := dSumNCode;
		Dmq_KmkTree.SetFld('nBasedNCode').AsFloat := m_dKmkNCode;

		//	ｴﾗｰの判定
		if Dmq_KmkTree.Open = False then
		begin
			ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Dmq_KmkTree );
			MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
			Exit;
		end;

		while Dmq_KmkTree.Eof = False do
		begin
			if Dmq_KmkTree.GetFld('SumKbn').AsInteger = 1 then			// 合計科目は除く
			begin
				Dmq_KmkTree.Next;
				continue;
			end;

			SetLength(m_OrderInsRec,Length(m_OrderInsRec)+1);
			m_OrderInsRec[Length(m_OrderInsRec)-1].No := Dmq_KmkTree.GetFld('EntNo').AsInteger;
			m_OrderInsRec[Length(m_OrderInsRec)-1].NCode := Dmq_KmkTree.GetFld('BasedNCode').AsInteger;
			m_OrderInsRec[Length(m_OrderInsRec)-1].SumNCode := dSumNCode;
			m_OrderInsRec[Length(m_OrderInsRec)-1].Position := 1;						// 後ろ
			Dmq_KmkTree.Next;
		end;

		// 追加した科目より同一加算先の下位の加算を探す
		Dmq_KmkTree.Close;
		Dmq_KmkTree.SQL.Clear;
		Dmq_KmkTree.SQL.ADD('SELECT KT1.EntNo, KT1.BasedNCode, KM.SumKbn From KmkTree KT1');
		Dmq_KmkTree.SQL.ADD('Left Outer Join KmkMA KM On KT1.BasedNCode = KM.GCode');
		Dmq_KmkTree.SQL.ADD('WHERE KT1.MasterKbn = 1 and KT1.SumNCode =:nSumNCode and KT1.EntNo >');
		Dmq_KmkTree.SQL.ADD('(Select KT2.EntNo From KmkTree KT2 Where KT2.MasterKbn = 1 and KT2.SumNCode =:nSumNCode and');
		Dmq_KmkTree.SQL.ADD('KT2.BasedNCode =:nBasedNCode)');
		Dmq_KmkTree.SQL.ADD('Order by KT1.EntNo');

		Dmq_KmkTree.SetFld('nSumNCode').AsFloat := dSumNCode;
		Dmq_KmkTree.SetFld('nBasedNCode').AsFloat := m_dKmkNCode;

		//	ｴﾗｰの判定
		if Dmq_KmkTree.Open = False then
		begin
			ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Dmq_KmkTree );
			MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
			Exit;
		end;

		while Dmq_KmkTree.Eof = False do
		begin
			if Dmq_KmkTree.GetFld('SumKbn').AsInteger = 1 then			// 合計科目は除く
			begin
				Dmq_KmkTree.Next;
				continue;
			end;

			SetLength(m_OrderInsRec,Length(m_OrderInsRec)+1);
			m_OrderInsRec[Length(m_OrderInsRec)-1].No := Dmq_KmkTree.GetFld('EntNo').AsInteger;
			m_OrderInsRec[Length(m_OrderInsRec)-1].NCode := Dmq_KmkTree.GetFld('BasedNCode').AsFloat;
	        m_OrderInsRec[Length(m_OrderInsRec)-1].SumNCode := dSumNCode;
			m_OrderInsRec[Length(m_OrderInsRec)-1].Position := 0;						// 前
			Dmq_KmkTree.Next;
		end;
	finally
		Dmq_KmkTree.Close;
		Dmq_KmkTree.Free;
	end;

	Result := True;

end;

//************************************************************************
//*     Component       :   fnInsertKmkOrder
//*     Event           :	科目出力順序追加
//*     Name            :   N.Nabe
//*		Return			:	-1：エラー、0：追加していない、1：追加済み
//************************************************************************
function TJNTCRP009001_D5f.fnInsertKmkOrder(dOrderCode: Double; iPosition: Integer): Integer;
var
	Dmq_Sel			:	TMQuery;
	Dmq_KmkOrder	:	TMQuery;
	iOrderNo		:	Integer;
	iOrderNo_Ins	:	Integer;
	iOrderNo_Set	:	Integer;
	iOrderNo_Chk	:	Integer;
	bOrderNoReset	:	Boolean;
	iRet			:	Integer;
	sText			:	String;
	iRepoType		:	Integer;
	sKmkName		:	String;
	sGCode			:	String;
begin
	Dmq_Sel := TMQuery.Create( Application );						//	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, Dmq_Sel );			//	DBとMQueryの接続
	Dmq_KmkOrder := TMQuery.Create( Application );					//	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, Dmq_KmkOrder );	//	DBとMQueryの接続

	try
		// 挿入場所検索
		Dmq_Sel.Close;
		Dmq_Sel.SQL.Clear;
		Dmq_Sel.SQL.ADD('SELECT KO.OrderNo, MA.GCode, MA.SimpleName From KmkOrder KO');
		Dmq_Sel.SQL.ADD('LEFT OUTER JOIN KmKMA MA ON ( KO.KmkNCode = MA.NCode AND MA.MasterKbn = 1 AND MA.SumKbn = 0 AND MA.RDelKbn = 0) ');
	// <HIS002>MOD↓
	//	Dmq_Sel.SQL.ADD('WHERE KO.RepoClass =:nRepoClass and KO.EntNo =:nEntNo and KO.RepoType =:nRepoType and KO.KmkNCode =:nKmkNCode');
		Dmq_Sel.SQL.ADD('WHERE KO.RepoClass =:nRepoClass and KO.MasterClass =:nMasterClass and KO.EntNo =:nEntNo and KO.RepoType =:nRepoType and KO.KmkNCode =:nKmkNCode');
	// <HIS002>MOD↑

		if iPosition = 0 then				// 前に挿入
			Dmq_Sel.SQL.ADD('Order by KO.OrderNo ')
		else								// 後に挿入
			Dmq_Sel.SQL.ADD('Order by KO.OrderNo DESC');

		Dmq_Sel.SetFld('nRepoClass').AsInteger := m_iRepoClass;
		Dmq_Sel.SetFld('nMasterClass').AsInteger := m_iMasterClass;		// <HIS002>ADD
		Dmq_Sel.SetFld('nEntNo').AsInteger := m_iEntNo;
		Dmq_Sel.SetFld('nRepoType').AsInteger := m_iRepoType;
		Dmq_Sel.SetFld('nKmkNCode').AsFloat := dOrderCode;

		//	ｴﾗｰの判定
		if Dmq_Sel.Open = False then
		begin
			ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Dmq_Sel );
			MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
			Result := -1;
			Exit;
		end;

		bOrderNoReset := False;
		if Dmq_Sel.Eof = False then
		begin
			iOrderNo := Dmq_Sel.GetFld('OrderNo').AsInteger;
			sKmkName := Dmq_Sel.GetFld('SimpleName').AsString;
			sGCode	 := Dmq_Sel.GetFld('GCode').AsString;
			// 挿入場所検索
			Dmq_KmkOrder.Close;
			Dmq_KmkOrder.SQL.Clear;
			Dmq_KmkOrder.SQL.ADD('SELECT OrderNo From KmkOrder');

		// <HIS002>MOD↓
		{
			if iPosition = 0 then				// 前に挿入
			begin
				Dmq_KmkOrder.SQL.ADD('WHERE RepoClass =:nRepoClass and EntNo =:nEntNo and RepoType =:nRepoType and OrderNo <:nOrderNo');
				Dmq_KmkOrder.SQL.ADD('Order by OrderNo Desc');
			end
			else												// 後に挿入
			begin
				Dmq_KmkOrder.SQL.ADD('WHERE RepoClass =:nRepoClass and EntNo =:nEntNo and RepoType =:nRepoType and OrderNo >:nOrderNo');
				Dmq_KmkOrder.SQL.ADD('Order by OrderNo');
			end;
        }
			Dmq_KmkOrder.SQL.ADD('WHERE RepoClass =:nRepoClass and MasterClass =:nMasterClass and EntNo =:nEntNo and RepoType =:nRepoType');

			if iPosition = 0 then				// 前に挿入
			begin
				Dmq_KmkOrder.SQL.ADD('and OrderNo <:nOrderNo');
       			Dmq_KmkOrder.SQL.ADD('Order by OrderNo Desc');
			end
			else							   	// 後に挿入
			begin
				Dmq_KmkOrder.SQL.ADD('and OrderNo >:nOrderNo');
				Dmq_KmkOrder.SQL.ADD('Order by OrderNo');
			end;
		// <HIS002>MOD↑

			Dmq_KmkOrder.SetFld('nRepoClass').AsInteger := m_iRepoClass;
			Dmq_KmkOrder.SetFld('nMasterClass').AsInteger := m_iMasterClass;	// <HIS002>ADD
			Dmq_KmkOrder.SetFld('nEntNo').AsInteger := m_iEntNo;
			Dmq_KmkOrder.SetFld('nRepoType').AsInteger := m_iRepoType;
			Dmq_KmkOrder.SetFld('nOrderNo').AsInteger := iOrderNo;

			//	ｴﾗｰの判定
			if Dmq_KmkOrder.Open = False then
			begin
				ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Dmq_KmkOrder );
				MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
				Result := -1;
				Exit;
			end;

			if Dmq_KmkOrder.Eof = False then
				iOrderNo_Ins := Dmq_KmkOrder.GetFld('OrderNo').AsInteger
			else
				iOrderNo_Ins := 0;

			if iOrderNo_Ins = 0 then
			begin
				if iPosition = 0 then				// 前に挿入
					iOrderNo_Set := iOrderNo div 2
				else								// 後に挿入
					iOrderNo_Set := iOrderNo + 100;
			end
			else
				iOrderNo_Set := (iOrderNo + iOrderNo_Ins) div 2;

			iOrderNo_Chk := iOrderNo;

			// 間に挿入できなくなったら、出力順NOの振り直しを行う
			if iOrderNo_Set = iOrderNo_Chk then
			begin
				if not fnOrderNoReset then
				begin
					Result := -1;
					exit;
				end;

				bOrderNoReset := True;
			end;
		end
		else
		begin
			Result := 0;
			exit;
		end;

		// 出力Noの振りなおしをしたので、再度処理のやり直し
		if bOrderNoReset = True then
		begin
			// 挿入場所検索
			Dmq_Sel.Close;
			Dmq_Sel.SQL.Clear;
			Dmq_Sel.SQL.ADD('SELECT OrderNo From KmkOrder');
		// <HIS002>MOD↓
		//	Dmq_Sel.SQL.ADD('WHERE RepoClass =:nRepoClass and EntNo =:nEntNo and RepoType =:nRepoType and MasterKbn = 1 and KmkNCode =:nKmkNCode');
			Dmq_Sel.SQL.ADD('WHERE RepoClass =:nRepoClass and MasterClass =:nMasterClass and EntNo =:nEntNo and RepoType =:nRepoType and MasterKbn = 1 and KmkNCode =:nKmkNCode');
		// <HIS002>MOD↑
			Dmq_Sel.SetFld('nRepoClass').AsInteger := m_iRepoClass;
			Dmq_Sel.SetFld('nMasterClass').AsInteger := m_iMasterClass;
			Dmq_Sel.SetFld('nEntNo').AsInteger := m_iEntNo;
			Dmq_Sel.SetFld('nRepoType').AsInteger := m_iRepoType;
			Dmq_Sel.SetFld('nKmkNCode').AsFloat := dOrderCode;

			//	ｴﾗｰの判定
			if Dmq_Sel.Open = False then
			begin
				ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Dmq_Sel );
				MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
				Result := -1;
				Exit;
			end;

			if Dmq_Sel.Eof = False then
			begin
				iOrderNo := Dmq_Sel.GetFld('OrderNo').AsInteger;
				// 挿入場所検索
				Dmq_KmkOrder.Close;
				Dmq_KmkOrder.SQL.Clear;
				Dmq_KmkOrder.SQL.ADD('SELECT OrderNo From KmkOrder');
			// <HIS002>MOD↓
			{
				if iPosition = 0 then				// 前に挿入
				begin
					Dmq_KmkOrder.SQL.ADD('WHERE RepoClass =:nRepoClass and EntNo =:nEntNo and RepoType =:nRepoType and OrderNo <:nOrderNo');
					Dmq_KmkOrder.SQL.ADD('Order by OrderNo Desc');
				end
				else												// 後に挿入
				begin
					Dmq_KmkOrder.SQL.ADD('WHERE RepoClass =:nRepoClass and EntNo =:nEntNo and RepoType =:nRepoType and OrderNo >:nOrderNo');
					Dmq_KmkOrder.SQL.ADD('Order by OrderNo');
				end;
			}
				Dmq_KmkOrder.SQL.ADD('WHERE RepoClass =:nRepoClass and MasterClass =:nMasterClass and EntNo =:nEntNo and RepoType =:nRepoType');

				if iPosition = 0 then				// 前に挿入
				begin
					Dmq_KmkOrder.SQL.ADD('and OrderNo <:nOrderNo');
					Dmq_KmkOrder.SQL.ADD('Order by OrderNo Desc');
				end
				else							   	// 後に挿入
                begin
					Dmq_KmkOrder.SQL.ADD('and OrderNo >:nOrderNo');
					Dmq_KmkOrder.SQL.ADD('Order by OrderNo');
				end;
			// <HIS002>MOD↑

				Dmq_KmkOrder.SetFld('nRepoClass').AsInteger := m_iRepoClass;
				Dmq_KmkOrder.SetFld('nMasterClass').AsInteger := m_iMasterClass;	// <HIS002>ADD
				Dmq_KmkOrder.SetFld('nEntNo').AsInteger := m_iEntNo;
				Dmq_KmkOrder.SetFld('nRepoType').AsInteger := m_iRepoType;
				Dmq_KmkOrder.SetFld('nOrderNo').AsInteger := iOrderNo;

				//	ｴﾗｰの判定
				if Dmq_KmkOrder.Open = False then
				begin
					ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Dmq_KmkOrder );
					MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
					Result := -1;
					Exit;
				end;

				if Dmq_KmkOrder.Eof = False then
					iOrderNo_Ins := Dmq_KmkOrder.GetFld('OrderNo').AsInteger
				else
					iOrderNo_Ins := 0;

				if iOrderNo_Ins = 0 then
				begin
					if iPosition = 0 then				// 前に挿入
						iOrderNo_Set := iOrderNo div 2
					else								// 後に挿入
						iOrderNo_Set := iOrderNo + 100;
				end
				else
					iOrderNo_Set := (iOrderNo + iOrderNo_Ins) div 2;
			end
			else
			begin
				Result := 0;
				exit;
			end;
		end;

		// 科目出力順序へ追加
		Dmq_KmkOrder.Close;
		Dmq_KmkOrder.SQL.Clear;
		Dmq_KmkOrder.SQL.ADD('Insert Into KmkOrder (');
		Dmq_KmkOrder.SQL.ADD('RepoClass,');
		Dmq_KmkOrder.SQL.ADD('MasterClass,');	// <HIS001>ADD
		Dmq_KmkOrder.SQL.ADD('EntNo,');
		Dmq_KmkOrder.SQL.ADD('RepoType,');
		Dmq_KmkOrder.SQL.ADD('OrderNo,');
		Dmq_KmkOrder.SQL.ADD('MasterKbn,');
		Dmq_KmkOrder.SQL.ADD('SumKbn,');
		Dmq_KmkOrder.SQL.ADD('KmkNCode,');
        Dmq_KmkOrder.SQL.ADD('HojyoNCode,');	// 補助内部コード <HIS005>ADD
		Dmq_KmkOrder.SQL.ADD('OutputKbn,');
		Dmq_KmkOrder.SQL.ADD('DivCode,');
		Dmq_KmkOrder.SQL.ADD('DecoKbn,');
		Dmq_KmkOrder.SQL.ADD('CharStyle,');
		Dmq_KmkOrder.SQL.ADD('CharPos,');
		Dmq_KmkOrder.SQL.ADD('LfMargn,');
		Dmq_KmkOrder.SQL.ADD('RiMargn,');
		Dmq_KmkOrder.SQL.ADD('CharFont,');
		Dmq_KmkOrder.SQL.ADD('LFrame,');
		Dmq_KmkOrder.SQL.ADD('LFrTitle,');
		Dmq_KmkOrder.SQL.ADD('CharKbn1,');
		Dmq_KmkOrder.SQL.ADD('CharKbn2,');
		Dmq_KmkOrder.SQL.ADD('CharKbn3,');
		Dmq_KmkOrder.SQL.ADD('NumStyle,');
		Dmq_KmkOrder.SQL.ADD('NumHatch,');
		Dmq_KmkOrder.SQL.ADD('NumFont,');
		Dmq_KmkOrder.SQL.ADD('MinusKbn,');
		Dmq_KmkOrder.SQL.ADD('MinusCol,');
		Dmq_KmkOrder.SQL.ADD('BudCalc,');
		Dmq_KmkOrder.SQL.ADD('BRatCalc,');
		Dmq_KmkOrder.SQL.ADD('BRatDecP,');
		Dmq_KmkOrder.SQL.ADD('PYearCalc,');
		Dmq_KmkOrder.SQL.ADD('PYRatCalc,');
		Dmq_KmkOrder.SQL.ADD('PYRatDecP,');
		Dmq_KmkOrder.SQL.ADD('ZeroKbn,');
		Dmq_KmkOrder.SQL.ADD('OpenKbn,');
		Dmq_KmkOrder.SQL.ADD('NumKbn1,');
		Dmq_KmkOrder.SQL.ADD('NumKbn2,');
		Dmq_KmkOrder.SQL.ADD('NumKbn3,');
		Dmq_KmkOrder.SQL.ADD('RemCmnt,');
		Dmq_KmkOrder.SQL.ADD('RemFont,');
		Dmq_KmkOrder.SQL.ADD('UnderLine,');
		Dmq_KmkOrder.SQL.ADD('UpLine,');
		Dmq_KmkOrder.SQL.ADD('Elkbn1,');
		Dmq_KmkOrder.SQL.ADD('Elkbn2,');
		Dmq_KmkOrder.SQL.ADD('Elkbn3,');
		Dmq_KmkOrder.SQL.ADD('ElCmnt1,');
		Dmq_KmkOrder.SQL.ADD('ElCmnt2,');
		Dmq_KmkOrder.SQL.ADD('ElCmnt3');
		Dmq_KmkOrder.SQL.ADD(') Values (');
		Dmq_KmkOrder.SQL.ADD(':nRepoClass,');
	// <HIS002>MOD↓
	//	Dmq_KmkOrder.SQL.ADD('0,');				// <HIS001>ADD
		Dmq_KmkOrder.SQL.ADD(':nMasterClass,');
	// <HIS002>MOD↑
		Dmq_KmkOrder.SQL.ADD(':nEntNo,');
		Dmq_KmkOrder.SQL.ADD(':nRepoType,');
		Dmq_KmkOrder.SQL.ADD(':nOrderNo,');
		Dmq_KmkOrder.SQL.ADD('1,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD(':nKmkNCode,');
		Dmq_KmkOrder.SQL.ADD('0,');				// 補助内部コード <HIS005>ADD
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD(''''',');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD(''''',');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD(''''',');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD(''''',');
		Dmq_KmkOrder.SQL.ADD(''''',');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD('0,');
		Dmq_KmkOrder.SQL.ADD(''''',');
		Dmq_KmkOrder.SQL.ADD(''''',');
		Dmq_KmkOrder.SQL.ADD('''''');
		Dmq_KmkOrder.SQL.ADD(')');

		Dmq_KmkOrder.SetFld('nRepoClass').AsInteger := m_iRepoClass;
		Dmq_KmkOrder.SetFld('nMasterClass').AsInteger := m_iMasterClass;	// <HIS002>ADD
		Dmq_KmkOrder.SetFld('nEntNo').AsInteger := m_iEntNo;
		Dmq_KmkOrder.SetFld('nRepoType').AsInteger := m_iRepoType;
		Dmq_KmkOrder.SetFld('nOrderNo').AsInteger := iOrderNo_Set;
		Dmq_KmkOrder.SetFld('nKmkNCode').AsFloat := m_dKmkNCode;

		//	ｴﾗｰの判定
		if Dmq_KmkOrder.ExecSQL = False then
		begin
			ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, Dmq_KmkOrder );
			MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
			Result := -1;
			Exit;
		end;

        // ログへ書き込み
        sText := '';
        case m_iRepoClass of
            2,3:
            begin
                if m_iRepoClass = 2 then
                    sText := ' 試算表 No:'+IntToStr(m_iEntNo)+'「'+m_sPtnName+'」'
                else
                    sText := ' 試算表（部門別）No:'+IntToStr(m_iEntNo)+'「'+m_sPtnName+'」';

                if m_iRepoType >= 5 then
                    iRepoType := m_iRepoKbn div 10
                else
                    iRepoType := m_iRepoType;

                case iRepoType of
                    1:
                    begin
                        if iPosition = 0 then				// 前に挿入
                            sText := sText+'「'+m_sTitleName+'（貸借対照表）」'+'「'+sGCode+':'+sKmkName+'」'+'の前に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                        else
                            sText := sText+'「'+m_sTitleName+'（貸借対照表）」'+'「'+sGCode+':'+sKmkName+'」'+'の後に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                    end;
                    2:
                    begin
                        if iPosition = 0 then				// 前に挿入
                            sText := sText+'「'+m_sTitleName+'（損益計算書）」'+'「'+sGCode+':'+sKmkName+'」'+'の前に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                        else
                            sText := sText+'「'+m_sTitleName+'（損益計算書）」'+'「'+sGCode+':'+sKmkName+'」'+'の後に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                    end;
                    3:
                    begin
                        if iPosition = 0 then				// 前に挿入
                            sText := sText+'「'+m_sTitleName+'（販管費内訳）」'+'「'+sGCode+':'+sKmkName+'」'+'の前に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                        else
                            sText := sText+'「'+m_sTitleName+'（販管費内訳）」'+'「'+sGCode+':'+sKmkName+'」'+'の後に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                    end;
                    4:
                    begin
                        if iPosition = 0 then				// 前に挿入
                            sText := sText+'「'+m_sTitleName+'（製造原価報告書）」'+'「'+sGCode+':'+sKmkName+'」'+'の前に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                        else
                            sText := sText+'「'+m_sTitleName+'（製造原価報告書）」'+'「'+sGCode+':'+sKmkName+'」'+'の後に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                    end;
                end;
            end;
            4:
            begin
                sText := ' 決算書 No:'+IntToStr(m_iEntNo)+' '+m_sPtnName+'  ';
                case m_iRepoType of
                    1:
                    begin
                        if iPosition = 0 then				// 前に挿入
                            sText := sText+'「'+m_sTitleName+'（資産の部）」'+'「'+sGCode+':'+sKmkName+'」'+'の前に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                        else
							sText := sText+'「'+m_sTitleName+'（資産の部）」'+'「'+sGCode+':'+sKmkName+'」'+'の後に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                    end;
                    2:
                    begin
                        if iPosition = 0 then				// 前に挿入
                            sText := sText+'「'+m_sTitleName+'（負債・純資産の部）」'+'「'+sGCode+':'+sKmkName+'」'+'の前に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                        else
                            sText := sText+'「'+m_sTitleName+'（負債・純資産の部）」'+'「'+sGCode+':'+sKmkName+'」'+'の後に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                    end;
                    3:
                    begin
                        if iPosition = 0 then				// 前に挿入
                            sText := sText+'「'+m_sTitleName+'（損益計算書）」'+'「'+sGCode+':'+sKmkName+'」'+'の前に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                        else
                            sText := sText+'「'+m_sTitleName+'（損益計算書）」'+'「'+sGCode+':'+sKmkName+'」'+'の後に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                    end;
                    4:
                    begin
                        if iPosition = 0 then				// 前に挿入
                            sText := sText+'「'+m_sTitleName+'（販管費内訳）」'+'「'+sGCode+':'+sKmkName+'」'+'の前に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                        else
                            sText := sText+'「'+m_sTitleName+'（販管費内訳）」'+'「'+sGCode+':'+sKmkName+'」'+'の後に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                    end;
                    5:
                    begin
                        if iPosition = 0 then				// 前に挿入
                            sText := sText+'「'+m_sTitleName+'（製造原価報告書）」'+'「'+sGCode+':'+sKmkName+'」'+'の前に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                        else
                            sText := sText+'「'+m_sTitleName+'（製造原価報告書）」'+'「'+sGCode+':'+sKmkName+'」'+'の後に「'+m_sKmkGCode+':'+m_sKmkName+'」を追加しました。'
                    end;
                end;
            end;
        end;

        m_iLine := m_iLine + 1;
        if m_bHeadWrite = False then
			fnLogFileHeaderWriteln();
        fnLogFileWriteln(sText);

        iRet := 1;					// 正常に追加
	finally
		Dmq_Sel.Close;
		Dmq_Sel.Free;
		Dmq_KmkOrder.Close;
		Dmq_KmkOrder.Free;
	end;

	result := iRet;
end;

//**********************************************************************
//*		Proccess	:	出力順ＮＯ再付番
//*		Name		:	N.Nabe
//*		Date		:	2008/12/02
//**********************************************************************
function TJNTCRP009001_D5f.fnOrderNoReset: Boolean;
var
	DmqSelect	:	TMQuery;
	DmqUpdate	:	TMQuery;
	iCount		:	Integer;
begin
	result := False;
	iCount	:=	1;

	DmqSelect := TMQuery.Create( Application );					//	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqSelect );	//	DBとMQueryの接続

	DmqUpdate := TMQuery.Create( Application );					//	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqUpdate );	//	DBとMQueryの接続

	try
		with DmqSelect do
		begin
			Close ();
			SQL.Clear;
			SQL.Add('select OrderNo from KmkOrder');
			SQL.Add('where');
		// <HIS002>MOD↓
		//	SQL.Add('RepoClass=:nRepoClass AND EntNo=:nEntNo AND RepoType=:nRepoType');
			SQL.Add('RepoClass=:nRepoClass AND MasterClass =:nMasterClass AND EntNo=:nEntNo AND RepoType=:nRepoType');
		// <HIS002>MOD↑
			SQL.Add('Order By OrderNo');

			SetFld('nRepoClass').AsInteger := m_iRepoClass;
			SetFld('nMasterClass').AsInteger := m_iMasterClass; 	// <HIS002>ADD
			SetFld('nEntNo').AsInteger := m_iEntNo;
			SetFld('nRepoType').AsInteger := m_iRepoType;

			if Open = False then
			begin
				ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmqSelect );
				MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
				Exit;
			end;

			while (not EOF) do
			begin
				with DmqUpdate do
				begin
					Close ();
					SQL.Clear;
					SQL.ADD('UPDATE KmkOrder SET OrderNo =:ORDER ');
					SQL.Add('where');
				// <HIS002>MOD↓
				// 	SQL.Add('RepoClass=:nRepoClass AND EntNo=:nEntNo AND RepoType=:nRepoType AND OrderNo=:nOldNo ');
					SQL.Add('RepoClass=:nRepoClass AND MasterClass =:nMasterClass AND EntNo=:nEntNo AND RepoType=:nRepoType AND OrderNo=:nOldNo ');
				// <HIS002>MOD↑
					SQL.Add('');

					SetFld('nRepoClass').AsInteger := m_iRepoClass;
					SetFld('nMasterClass').AsInteger := m_iMasterClass;		// <HIS002>ADD
					SetFld('nEntNo').AsInteger := m_iEntNo;
					SetFld('nRepoType').AsInteger := m_iRepoType;
					// 旧出力順NO
					SetFld('nOldNo').AsInteger := DmqSelect.GetFld('OrderNo').AsInteger;
					SetFld('ORDER').AsInteger	:=	iCount * -100;

					if not ExecSQL then
					begin
						ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmqUpdate );
						MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
						Exit;
					end;
				end;
				iCount	:=	iCount + 1;

				next;
			end;
		end;

		with DmqUpdate do
		begin
			Close ();
			SQL.Clear;
			SQL.ADD ('UPDATE KmkOrder SET OrderNo = OrderNo * -1 ');
			SQL.Add('where');
		// <HIS002>MOD↓
		//	SQL.Add('RepoClass=:nRepoClass AND EntNo=:nEntNo AND RepoType=:nRepoType');
			SQL.Add('RepoClass=:nRepoClass AND MasterClass =:nMasterClass AND EntNo=:nEntNo AND RepoType=:nRepoType');
		// <HIS002>MOD↑
			SetFld('nRepoClass').AsInteger := m_iRepoClass;
			SetFld('nMasterClass').AsInteger := m_iMasterClass;		// <HIS002>ADD
			SetFld('nEntNo').AsInteger := m_iEntNo;
			SetFld('nRepoType').AsInteger := m_iRepoType;

			if not ExecSQL then
			begin
				ComArea.m_MsgStd.GetMsgDB(MjsMsgRec,DmqUpdate);
				MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg,
								MjsMsgRec.sTitle,
								MjsMsgRec.icontype,
								MjsMsgRec.btntype,
								MjsMsgRec.btndef,
								MjsMsgRec.LogType);
				Exit;
			end;
		end;
	finally
		DmqSelect.Close;
		DmqSelect.Free;
		DmqUpdate.Close;
		DmqUpdate.Free;
	end;

	result := True;
end;

//**********************************************************************
//*		Proccess	:	ログファイルにヘッダを追加する
//*		Name		:	N.Nabe
//*		Date		:	2008/12/04
//**********************************************************************
procedure TJNTCRP009001_D5f.fnLogFileHeaderWriteln( sText: string = '' );
var
	strWk		:	string;
	F			:	TextFile;
	E			:	TObject;
begin
	if ( FileExists( m_sLogFile ) = False ) then
	begin
		try
			try
				AssignFile( F, m_sLogFile );
				Rewrite( F );
			except
				E := ExceptObject;
				ShowException( E, ExceptAddr );
			end ;
		finally
			CloseFile(F);
		end;

		B_Log.Enabled := true
	end;

	m_iLine := 1;
	strWk := '********************************************'+#$d#$a +
			 '  勘定科目登録 - 科目出力順序自動登録ログ   '+#$d#$a +
			 '    登録時間：' + FormatDateTime('yyyy"年"mm"月"dd"日"hh"時"nn"分"ss"秒"', Now) + #$d#$a +
			 '    会社コード：' + IntToStr(pComArea^.m_iCorpCode) + #$d#$a +
			 '    決算会社年月日：' + IntToStr(pComArea^.m_iCorpSubCode) + #$d#$a +
			 '********************************************';
	strWk := strWk + sText;
	fnLogFileWriteln( strWk );

	m_iLine := m_iLine + 6;
	m_bHeadWrite := True;

end;

//**********************************************************************
//*		Proccess	:	指定データと改行を追加する
//*		Name		:	N.Nabe
//*		Date		:	2008/12/04
//**********************************************************************
procedure TJNTCRP009001_D5f.fnLogFileWriteln( sText: string );
var
	sltText		:	TStringList;
	iCnt		:	Integer;
begin
	sltText  :=  TStringList.Create;
	//ファイルを開く
	sltText.LoadFromFile(m_sLogFile);

	iCnt := sltText.Count;
	if (iCnt = 0) or (m_bFirst = True) then
	begin
		m_bFirst := True;
		//最終行に追加
		sltText.Add(sText);
	end
	else
	begin
		if (m_bHeadWrite = False) and (m_bStart = False) then
		begin
			sltText.Insert(m_iLine-1, #$d#$a);
			m_bStart := True;
		end;

		//指定行に追加
		sltText.Insert(m_iLine-1, sText);
	end;

	//ファイルを保存
	sltText.SaveToFile(m_sLogFile);
	sltText.Free;

end;

//**********************************************************************
//*		Proccess	:	ログ表示
//*		Name		:	N.Nabe
//*		Date		:	2008/12/18
//**********************************************************************
procedure TJNTCRP009001_D5f.B_LogClick(Sender: TObject);
var
	StartInfo			:	TStartupInfo;
	ProcInfo			:	TProcessInformation;
	path				:	array[0..255] of Char;
	strParam			:	string;
begin
	// ログ表示
	FillChar( path, SizeOf(path), 0 );
	GetWindowsDirectory( path, Length(path) );
	strcat( path, '\notepad.exe' );

	FillChar( StartInfo, SizeOf(StartInfo), 0 );
	FillChar( ProcInfo, SizeOf(ProcInfo), 0 );
	StartInfo.cb := SizeOf(StartInfo);
	StartInfo.dwFlags := STARTF_USESHOWWINDOW;
	StartInfo.wShowWindow := SW_SHOWNORMAL;

	strParam := 'notepad.exe ' + m_sLogFile;
	UniqueString(strParam);
	CreateProcess( nil, PChar(strParam), Pointer(0), Pointer(0),
					FALSE, 0, Pointer(0), Pointer(0), StartInfo, ProcInfo );

end;

// <HIS001>ADD↓
//**********************************************************************
//*		Proccess	:	科目出力順序登録起動
//*		Name		:	Y.Kuroda
//*		Date		:	2011/3/15
//**********************************************************************
procedure TJNTCRP009001_D5f.B_KmkOrderClick(Sender: TObject);
begin
	m_bAnoPrgStFlg := True;
	ModalResult := mrCANCEL;
end;
// <HIS001>ADD↑

//**********************************************************************
//*		Proccess	:	登録済みかﾁｪｯｸ
//*		Name		:	N.Nabe
//*		Date		:	2009/02/24
//**********************************************************************
function TJNTCRP009001_D5f.fnEntryCheck: Boolean;
var
	DmqSelect	:	TMQuery;
begin
	result := False;

	DmqSelect := TMQuery.Create( Application );					//	MQueryの構築
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqSelect );	//	DBとMQueryの接続

	try
		with DmqSelect do
		begin
			Close ();
			SQL.Clear;
			SQL.Add('select OrderNo from KmkOrder');
			SQL.Add('where');
		// <HIS002>MOD↓
		//	SQL.Add('RepoClass=:nRepoClass AND EntNo=:nEntNo AND RepoType=:nRepoType AND MasterKbn = 1 AND KmkNCode=:nKmkNCode');
			SQL.Add('RepoClass=:nRepoClass AND MasterClass =:nMasterClass AND EntNo=:nEntNo AND RepoType=:nRepoType AND MasterKbn = 1 AND KmkNCode=:nKmkNCode');
		// <HIS002>MOD↑
			SQL.Add('Order By OrderNo');

			SetFld('nRepoClass').AsInteger := m_iRepoClass;
			SetFld('nMasterClass').AsInteger := m_iMasterClass;		// <HIS002>ADD
			SetFld('nEntNo').AsInteger := m_iEntNo;
			SetFld('nRepoType').AsInteger := m_iRepoType;
			SetFld('nKmkNCode').AsFloat := m_dKmkNCode;

			if Open = False then
			begin
				ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmqSelect );
				MjsMessageBoxEx(AOwner,MjsMsgRec.sMsg, MjsMsgRec.sTitle,MjsMsgRec.icontype , MjsMsgRec.btntype , MjsMsgRec.btndef,FALSE );
				Exit;
			end;

			result := Eof;
		end;
	finally
		DmqSelect.Close;
		DmqSelect.Free;
	end;

end;


procedure TJNTCRP009001_D5f.BCancelClick(Sender: TObject);
begin
	m_bAnoPrgStFlg := False;
	ModalResult := mrCANCEL;
end;

end.
