//******************************************************************************
//	System		: Galileopt
//	Program		: 取引先登録　グループ別セキュリティ（印刷選択ダイアログ）
//	ProgramID	: JNTCRP004010PrnDlg
//	Name		: E.Nanba(Lab)
//	Create		: 2007/02/27
//	Comment		:
//	History		:	2007 / 02 / 27	E.Nanba(Lab)
//					MAS170904PrnDlgを基に新規作成
//-------------- Galieopt v3.01対応 --------------------------------------------
//  2009/01/15  <#3> E.Nanba(Lab)・プロジェクト登録からの呼び出しに対応
//-------------- Galieopt v3.02対応 --------------------------------------------
//  2009/04/24  <#4> E.Nanba(Lab)・ﾌﾘｰｺｰﾄﾞ記号を入力できない件を修正
//******************************************************************************
unit JNTCRP004010PrnDlgu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  VCL.StdCtrls, MJSEdits, MJSLabel, Buttons, MJSBitBtn, MJSGroupBox, VCL.ExtCtrls,
  MJSPanel, MJSComboBox, MjsDBModuleu,
  Db, FireDAC.Comp.Client, MJSQuery, MJSDispCtrl, MJSRadioButton,  MJSMsgStdu,
  MJSCommonu, dxmdaset,
  JNTMasComu,
  JNTFuncU
  ;


type
  {$i MASWND_ColorDef.inc}
//{$i MasWndParam_StfBmnH.inc}

	TDlgParam = Record
		DM				:	TMDataModulef;
		pComArea		:	^TMjsAppRecord;
		dbCorp			:	TFDConnection;

		iSecMastarKbn	:   Integer;	//部署マスタ区分
		iSecCodeAttr	:   Integer;	//部署コード属性
		iSecCodeDigit	:   Integer;	//部署コード桁数
		sSecMasterName	:	String;		//部署マスタ名称

		iMastarKbn		:	Integer;	//マスタ区分
		iCodeAttr		:	Integer;	//コード属性
		iCodeDigit		:	Integer;	//コード桁数
		sMasterName		:	String;		//マスタ名称

		iRetBunrui		:	Integer;	//選択マスタ区分
		sRetStCode		:	String;		//開始コード    (戻り値)
		sRetEdCode		:	String;		//終了コード    (戻り値)
	end;

  //検索エクスプローラ情報
  TWndInfo = Record
	MastarKbn   : Integer;
	TableName   : String;
	GCode       : String;
	NCode       : String;
    SimpleName  : String;
    Renso       : String;
	Where       : String;
  end;

  TJNTCRP004010PrnDlgf = class(TForm)
	P_Panel			:	TMPanel;
	P_Panel2		:	TMPanel;
    GrpHani			: 	TMGroupBox;
	LStart			:	TMLabel;
	LEnd			:	TMLabel;
	LStartDsp		:	TMLabel;
	LEndDsp			:	TMLabel;
	LKara			:	TMLabel;
	LMade			:	TMLabel;
	BOK				:	TMBitBtn;
	BCancel			:	TMBitBtn;
    EStart: TMTxtEdit;
    EEnd: TMTxtEdit;
    GrpBunrui: TMGroupBox;
    PcmbBunrui: TMComboBox;
    EStartNum: TMNumEdit;
    EEndNum: TMNumEdit;

	procedure CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;
	procedure FormDestroy(Sender: TObject);
	procedure FormKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);

	procedure PcmbBunruiChange(Sender: TObject);
	procedure onArrowClick(Sender: TObject);
	procedure EStartExit(Sender: TObject);
	procedure EEndExit(Sender: TObject);

	procedure BOKClick(Sender: TObject);
	procedure ChangeEvent(Sender: TObject);

  private
	{ Private 宣言 }
//	iZoom			: Integer;		// 拡大率

	m_iCodeAttr		: Integer;		// コード属性
	m_iCodeDigit	: Integer;		// コード桁数
	m_pDlgParam		: ^TDlgParam;
	m_pComArea		: ^TMjsAppRecord;
	m_MasComArea	: TJNTMASCom;

	m_WndInfo		: array[0..1] of TWndInfo;
	m_bExpOpenSW	: Boolean;		// ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(True:OPEN False:CLOSE)

	//関数
	function  GetName(Kbn: Integer; var GCode: String; var SimpName: String): Boolean;
	function  GetSelectedMasterKbn():Integer;

	procedure FormDsp();
    procedure CreateWndInfo;
    function  GetWndInfo(_iKbn:Integer):TWndInfo;

  public
	{ Public 宣言 }
	procedure Init(param:pointer);

  end;

	function fnCodeCompare(CodeAttr:Integer;StCode,EdCode:String):Boolean;
	function XStrToInt64(Val:String):Int64;

const
	{$include MASDef.inc}	//<#3>ADD

	//表示区分
	InfoKbn_ALL     = 0;  	//全件
	InfoKbn_DISP    = 1;   	//表示項目のみ
	InfoKbn_NODISP  = 2;   	//非表示項目のみ

implementation
//{$i MasWndParam_StfBmnB.inc}


{$R *.DFM}


//**************************************************************************
//	Proccess  	:  	コード比較
//	Name	  	:  	Y.Kubo
//	Date		:  	2007 / 01 / 18
//	Parameter  	:   CodeAttr:コード属性、StCode：開始コード EdCode終了コード
//	Retrun		:   開始コード <= 終了コード → True
//				    開始コード >  終了コード → False
//**************************************************************************
function fnCodeCompare(CodeAttr:Integer; StCode,EdCode:String):Boolean;
begin
    result := False;
	if (CodeAttr = 2) then
	begin
		if (StCode <= EdCode) then result := True;
	end
	else begin
		if (XStrToInt64(StCode) <= XStrToInt64(EdCode)) then result := True;
   	end;
end;

//**************************************************************************
//	Proccess  	:  	文字String→数値(Int64)変換
//	Name	  	:  	Y.Kubo
//	Date		:  	2007 / 01 / 18
//	Parameter  	:   Val:変換対象文字列
//	Retrun		:   変換後数値
//**************************************************************************
function XStrToInt64(Val:String):Int64;
begin
    try
        result := StrToInt64(Val);
    except
        result := 0;
    end;
end;


//**************************************************************************
//	Proccess  	:  	アプリケーションからのパラメータセット
//	Name	  	:  	Y.Kubo
//	Date		:  	2006 / 10 / 10
//	Parameter  	:	param: 印刷パラメータ
//	Retrun		:
//	History		:
//	Comment		:	引数に該当が無い場合は-1を返値とする
//**************************************************************************
procedure TJNTCRP004010PrnDlgf.Init(param: pointer);
begin

	m_pDlgParam := param;
	m_pComArea  :=	pointer(m_pDlgParam^.pComArea);

	m_MasComArea    :=  TJNTMASCom(m_pComArea^.m_pSystemArea^);		// ｼｽﾃﾑﾒﾓﾘ 取得

	MjsColorChange(				                                // ｼｽﾃﾑｶﾗｰ,ｱｸｾﾝﾄｶﾗｰの指定
					TJNTCRP004010PrnDlgf(Self),
					m_MasComArea.SystemArea.SysColorB,
					m_MasComArea.SystemArea.SysColorD,
					m_MasComArea.SystemArea.SysBaseColorB,
					m_MasComArea.SystemArea.SysBaseColorD,
					rcCOMMONAREA(m_pComArea^.m_pCommonArea^).SysFocusColor
				  );

//↓2004/12/22 T.Shimada 拡大率を保存。
//	MjsFontResize(TMAS250100PrnDlgf(Self)	,Pointer(pComArea));
	MjsFontResize( TJNTCRP004010PrnDlgf(Self), Pointer(m_pComArea) );
//↑

	EStartNum.Width := EStart.Width;
	EEndNum  .Width := EEnd  .Width;

	CreateWndInfo();

	FormDsp();
end;

//************************************************************************
//	Component	:	CMChildKey
//
//	Name		:	Y.Kanai
//	Create		:	2006 / 10 / 13
//	Comment		:	XXXXXXXXXXXXXXXXXXXXXX
//	History		:	XXXX/XX/XX  XX修正者XX
//					XXXXXXXXXX更新内容XXXXXXXXXX
//************************************************************************
procedure TJNTCRP004010PrnDlgf.CMChildKey(var Msg: TWMKey);
var
  	sShift	: TShiftState;
begin
	sShift := KeyDataToShiftState(Msg.KeyData);				// Shiftｷｰの取得

	// Bitボタン ?
	if (Screen.Activecontrol is TMBitBtn) then
	begin
		// Left? Up?
		if (Msg.CharCode = VK_LEFT) or (Msg.CharCode = VK_UP)then
		begin
			MjsDispCtrl.MjsPrevCtrl(Self);
			abort;
			Exit;
		end;

		// Right? Down?
		if (Msg.CharCode = VK_RIGHT) or (Msg.CharCode = VK_DOWN) then
		begin
			MjsDispCtrl.MjsNextCtrl(Self);
			abort;
			Exit;
		end;
	end;
{
	// 共通
	if ((Msg.CharCode = VK_RETURN)) or											// Enter Tab Down Right
	   ((Msg.CharCode = VK_TAB) and (sShift = [])) or
	   ((Msg.CharCode = VK_DOWN)) or
	   ((Msg.CharCode = VK_RIGHT)) then
	begin
		MjsDispCtrl.MjsNextCtrl(Self);
		abort;
	end;

	if ((Msg.CharCode = VK_TAB) and (sShift = [ssShift])) or					// Shift+Tab Up Left
	   ((Msg.CharCode = VK_UP)) or
	   ((Msg.CharCode = VK_LEFT)) then
	begin
		MjsDispCtrl.MjsPrevCtrl(Self);
		abort;
	end;
}
	// End?
	if Msg.CharCode = VK_END then
	begin
		BOK.SetFocus;
		exit;
	end;

	inherited;
end;

//************************************************************************
//	Component	:
//					検索エクスプローラを呼び出す(共通)
//	Event		:	OnArrowClick
//	Name		:	E.Nanba(Lab)
//	Create		:	2007 / 02 / 27
//	Comment		:	XXXXXXXXXXXXXXXXXXXXXX
//	History		:	XXXX/XX/XX  XX修正者XX
//					XXXXXXXXXX更新内容XXXXXXXXXX
//************************************************************************
procedure TJNTCRP004010PrnDlgf.onArrowClick(Sender: TObject);
var
    lvExpSend       : rcJNTExpSend;
    lvExpRecv       : rcJNTExpRecv;
	iExpRtn,iMasterKbn		: Integer;
	strWherePhase	: String;
begin
	iMasterKbn := GetSelectedMasterKbn();	// 選択中のマスタ区分

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam(@lvExpSend);

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec :=  m_pComArea;					// MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB     :=  @m_pDlgParam^.dbCorp;			// TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB     :=  m_MasComArea.SystemArea.SysColorB;
    lvExpSend.ColorD     :=  m_MasComArea.SystemArea.SysColorD;

	//<#3> MOD St
	{
	if iMasterKbn = m_pDlgParam.iMastarKbn then
	begin
		// 取引先
        strWherePhase := ' MTOKUI.RDelKbn = 0 and MTOKUI.TemplateKbn = 0';		// SumKbnはパラメータで指定
	end
	else if iMasterKbn = m_pDlgParam.iSecMastarKbn then
	begin
		// 部署（セグメント）
        strWherePhase := ' HojyoMA.RDelKbn = 0 and HojyoMA.Syokuchikbn = 0';	// SumKbnはパラメータで指定
	end
	else Exit;
	}

	// SumKbnはパラメータで指定
	case iMasterKbn of
		MST_CUSTOMER:				// 取引先
			strWherePhase := ' MTOKUI.RDelKbn = 0 and MTOKUI.TemplateKbn = 0';

		MST_SEGMENT..MST_SEGMENT+9:	// 部署（セグメント）
			strWherePhase := ' HojyoMA.RDelKbn = 0 and HojyoMA.Syokuchikbn = 0';

		MST_KOJI..MST_KOJI+9:		// プロジェクト（工事）
			strWherePhase := ' HojyoMA.RDelKbn = 0';
	end;
	//<#3> MOD Ed

	lvExpSend.MasterKbn  	:=  iMasterKbn;
    lvExpSend.ModulKbn      := 0;				// ﾓｼﾞｭｰﾙ区分
    lvExpSend.PatternNo     := 1;				// ﾏｽﾀ区分
    lvExpSend.SumKbn        := 0;				// 実在/合計区分
    lvExpSend.KmkNCode      := -1;              // 科目内部ｺｰﾄﾞ
    lvExpSend.WhereStr      := strWherePhase;   // Where句

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn :=  fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <> 1 then  //ｷｬﾝｾﾙ
        Exit;

    if Length(Trim(lvExpRecv.GCode)) > 0 then	// 中身あり?
		TCustomEdit(Sender).Text := lvExpRecv.GCode
	else
		TCustomEdit(Sender).Text := '';

	TCustomEdit(Sender).Tag := 9;

	if (Sender = EStart) or (Sender = EStartNum) then
		LStartDsp.Caption :=lvExpRecv.Nmk		// 開始
	else
		LEndDsp.Caption := lvExpRecv.Nmk;		// 終了

	Keybd_Event(VK_RETURN, 0, 0, 0);			// Enter ｷｰのｴﾐｭﾚｲﾄ

	abort;
end;

//************************************************************************
//	Component	:	TJNTCRP004010PrnDlgf (TJNTCRP004010PrnDlgf)
//					ダイアログの破棄時
//	Event		:	OnDestroy
//	Name		:	E.Nanba(Lab)
//	Create		:	2007 / 02 / 27
//	Comment		:	XXXXXXXXXXXXXXXXXXXXXX
//	History		:	XXXX/XX/XX  XX修正者XX
//					XXXXXXXXXX更新内容XXXXXXXXXX
//************************************************************************
procedure TJNTCRP004010PrnDlgf.FormDestroy(Sender: TObject);
begin
    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if m_bExpOpenSW = TRUE then
        fnJNTExpFree;
end;

//************************************************************************
//	Component	:	TJNTCRP004010PrnDlgf (TJNTCRP004010PrnDlgf)
//					キーが押された時
//	Event		:	OnKeyDown
//	Name		:	Y.Kubo
//	Create		:	2006 / 10 / 13
//	Comment		:	XXXXXXXXXXXXXXXXXXXXXX
//	History		:	XXXX/XX/XX  XX修正者XX
//					XXXXXXXXXX更新内容XXXXXXXXXX
//************************************************************************
procedure TJNTCRP004010PrnDlgf.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	sPartsName	: String;
	bFlag		: Boolean;
begin
	bFlag := False;

	// ENTERｷｰが押された時
	if (Key = VK_RETURN) then
	begin
		sPartsName := Screen.ActiveControl.Name;
		if (sPartsName <> 'BOK') and (sPartsName <> 'BCancel')then
		begin
			MjsDispCtrl.MjsNextCtrl(Self);
            exit;
		end;
	end;

	// ESCAPEｷｰが押された時
	if (Key = VK_ESCAPE) then
	begin
		ModalResult := mrCancel;
	end;

	if Sender is TMTxtEdit then
	begin
		// Altが押されている時
		if (ssAlt in Shift) then
			EXIT;

		// 左・上を押された時
		if (Key = VK_Left) or (Key = VK_UP) then
			MjsDispCtrl.MjsPrevCtrl(Self);					// 前のｶﾗﾑに移動

		// 右・下を押された時
		if ((Key = VK_Right) or (Key = VK_DOWN)) and (bFlag = False) then
			MjsDispCtrl.MjsNextCtrl(Self);					// 次のｶﾗﾑに移動
	end;
end;

//************************************************************************
//	Component	:	EStartExit (TxtEdit)
//
//	Event		:	OnExit
//	Name		:	Y.Kubo
//	Create		:	2006 / 10 / 13
//	Comment		:	XXXXXXXXXXXXXXXXXXXXXX
//	History		:	XXXX/XX/XX  XX修正者XX
//					XXXXXXXXXX更新内容XXXXXXXXXX
//************************************************************************
procedure TJNTCRP004010PrnDlgf.EStartExit(Sender: TObject);
var
	sText	: String;
	sName	: String;
begin
	sName := '';
	sText := TCustomEdit(Sender).Text;

	if sText <> '' then
	begin
        // 名称取得
		if (GetName(0, sText, sName)) then
        begin
			LStartDsp.Caption := sName;
        end
		else begin
			beep;
            TCustomEdit(Sender).SetFocus;
		end;
	end
	else
	begin
		// 最小値の取得
		if (GetName(1, sText, sName)) then
		begin
			TCustomEdit(Sender).Text := sText;
			LStartDsp.Caption := sName;
		end;
	end;

	if Sender is TMNumEdit then
	begin
		TMNumEdit(Sender).InputFlag := (LStartDsp.Caption='');
	end;
end;

//************************************************************************
//	Component	:	EEnd (TxtEdit)
//
//	Event		:	OnExit
//	Name		:	Y.Kubo
//	Create		:	2006 / 10 / 13
//	Comment		:	XXXXXXXXXXXXXXXXXXXXXX
//	History		:	XXXX/XX/XX  XX修正者XX
//					XXXXXXXXXX更新内容XXXXXXXXXX
//************************************************************************
procedure TJNTCRP004010PrnDlgf.EEndExit(Sender: TObject);
var
	sText	: String;
	sName	: String;
	StEdit  : TCustomEdit;
begin
	sName := '';
	sText := TCustomEdit(Sender).Text;	// EEnd→TCustomEdit(Sender)

	if (Sender = EEnd) then
		StEdit := EStart
	else
		StEdit := EStartNum;


	// 範囲終了に入力されていない ?
	if sText <> '' then
	begin
		// 範囲開始に入力されていない ?
		if StEdit.Text <> '' then
		begin
			// 開始より終了の方が大きい ?
			if fnCodeCompare(m_iCodeAttr,StEdit.Text,sText) then
			begin
                // 名称取得
				if (GetName(0, sText, sName)) then
                begin
					LEndDsp.Caption := sName;
                end
				else begin
					beep;
					TCustomEdit(Sender).SetFocus;
				end;
			end
			else begin
				beep;
				TCustomEdit(Sender).SetFocus;
			end;
		end
		else begin
			// 名称取得
			if (GetName(0, sText, sName)) then
			begin
				LEndDsp.Caption := sName;
			end
			else begin
				beep;
				TCustomEdit(Sender).SetFocus;
			end;
		end;
	end
	else
	begin
		// 最大値の取得
		if (GetName(2, sText, sName)) then
		begin
			TCustomEdit(Sender).Text := sText;
			LEndDsp.Caption := sName;
		end;
	end;

	if Sender is TMNumEdit then
	begin
		TMNumEdit(Sender).InputFlag := (LEndDsp.Caption='');
	end;

end;


//**********************************************************************
//	Proccess	:	名称取得
//	Name		:	Y.Kubo
//	Create		:	2006 / 10 / 13
//	Parameter   :	Kbn			:	0:名称取得　1:コードの最小を持ってくる　2:コードの最大を持ってくる
//				:	GCode		:	入力 または 検索された外部コード
//				:	SimpName	:	名称
//	Return		:	ﾚｺｰﾄﾞがあるかないか(TRUE/FALSE)
//	History		:	9999/99/99	X.Xxxx
//					XXXXXXXXXXXXXXXXXX
//**********************************************************************
function TJNTCRP004010PrnDlgf.GetName(Kbn: Integer; var GCode: String; var SimpName: String): Boolean;
var
	DmqData	: TMQuery;
	bRecord	: Boolean;		// ﾚｺｰﾄﾞあり/なし
	vWndInfo : TWndInfo;
	sSelect  : String;
	sGCode  : String;
begin
	// 初期化
	bRecord := False;

	DmqData := TMQuery.Create(Self);						// MQueryの構築
	try
        m_pDlgParam^.DM.SetDBInfoToQuery(m_pDlgParam^.dbCorp, DmqData);	// DBとMQueryの接続

        vWndInfo := GetWndInfo(GetSelectedMasterKbn);

        sSelect := 'Select Top 1 '
                + vWndInfo.GCode     + ' GCode,'
                + vWndInfo.SimpleName+ ' SimpleName '
                + ' from ' + vWndInfo.TableName
                + ' Where '+ vWndInfo.Where;

        // 属性=ﾌﾘｰ ?
        if m_iCodeAttr = 2 then
        begin
            sGCode	:= GCODE;
        end
        else begin
            // 属性=ﾌﾘｰ以外
            //前0有16桁に編集して返す
			sGCode	:= StringOfChar('0', 16 - Length(GCODE)) + GCODE;
        end;

        with DmqData do
        begin
            // ｸｴﾘの初期化
            Close;
            SQL.Clear;

            SQL.Add(sSelect);			//先頭の1件だけ

            case Kbn of
            //0:	SQL.ADD(' and '+vWndInfo.GCode+'='+AnsiQuotedStr(sGCODE,''''));	//条件指定
			0:begin
				SQL.ADD(' and '+vWndInfo.GCode+'=:pCode');
				ParamByName('pCode').AsString := sGCODE;		//条件指定 <#4>
			end;
            1:  SQL.ADD('Order by '+ vWndInfo.GCode);			//最小コード1件
            2:  SQL.ADD('Order by '+ vWndInfo.GCode+' DESC');	//最大コード1件
            end;

            Open;

            if not(EOF) then
            begin
                bRecord  := True;
                GCode    := GetFLD('GCode').AsString;
                SimpName := GetFLD('SimpleName').AsString;
            end;
        end;
	finally
        DmqData.Close;
        DmqData.Free;

	    Result := bRecord;
	end;
end;

//************************************************************************
//	Component	:	FormCreate
//
//	Name		:	Y.Kubo
//	Create		:	2006 / 10 / 13
//	Comment		:	XXXXXXXXXXXXXXXXXXXXXX
//	History		:	XXXX/XX/XX  XX修正者XX
//					XXXXXXXXXX更新内容XXXXXXXXXX
//************************************************************************
procedure TJNTCRP004010PrnDlgf.FormDsp();
begin
	EStart.Text	:= '';
	EEnd.Text	:= '';
	LStartDsp.Caption	:= '';
	LEndDsp.Caption		:= '';

	//分類コンボの作成
	PcmbBunrui.Items.Clear;
	PcmbBunrui.Items.Add(m_pDlgParam.sMasterName + '別,' + IntToStr(m_pDlgParam.iMastarKbn));
	PcmbBunrui.Items.Add(m_pDlgParam.sSecMasterName + '別,' + IntToStr(m_pDlgParam.iSecMastarKbn));

	PcmbBunrui.ItemIndex := 0;
	PcmbBunruiChange(PcmbBunrui);

	//複数存在した場合に有効
	PcmbBunrui.Enabled := (PcmbBunrui.Items.Count > 1);

end;



//************************************************************************
//	Component	:	BOK				ＯＫボタンをクリック
//
//	Event		:	OnClick
//	Name		:	Y.Kubo
//	Create		:	2006 / 10 / 13
//	Comment		:	XXXXXXXXXXXXXXXXXXXXXX
//	History		:	XXXX/XX/XX  XX修正者XX
//					XXXXXXXXXX更新内容XXXXXXXXXX
//************************************************************************
procedure TJNTCRP004010PrnDlgf.BOKClick(Sender: TObject);
var
	sText	:	String;
	sName	:	String;
	StEdit,EdEdit:TCustomEdit;
begin

	if (m_iCodeAttr = 2) then
	begin
		StEdit := EStart;
		EdEdit := EEnd;
    end
	else begin
		StEdit := EStartNum;
		EdEdit := EEndNum;
	end;

    //未選択なら最小のコードを取得
    if StEdit.Text = '' then
    begin
        if GetName(1, sText, sName) then
        begin
            StEdit   .Text    := sText;
            LStartDsp.Caption := sName;

   			if (m_iCodeAttr <> 2) then
			begin
				TMNumEdit(StEdit).InputFlag := (LStartDsp.Caption='');
			end;
        end;
    end;

    //未選択なら最大のコードを取得
    if EdEdit.Text = '' then
    begin
        if GetName(2, sText, sName) then
        begin
            EdEdit .Text    := sText;
            LEndDsp.Caption := sName;

        	if (m_iCodeAttr <> 2) then
			begin
				TMNumEdit(EdEdit).InputFlag := (LEndDsp.Caption='');
			end;

        end;
    end;

    // 属性=ﾌﾘｰ ?
    if m_iCodeAttr = 2 then
    begin
        m_pDlgParam^.sRetStCode	:= EStart.Text;
        m_pDlgParam^.sRetEdCode	:= EEnd.Text;
    end
    else begin
		// 属性=ﾌﾘｰ以外
        //前0有16桁に編集して返す
        m_pDlgParam^.sRetStCode	:= StringOfChar('0', 16 - Length(EStartNum.Text)) + EStartNum.Text;
        m_pDlgParam^.sRetEdCode	:= StringOfChar('0', 16 - Length(EEndNum.Text)) + EEndNum.Text;
	end;

    //マスタ区分
    m_pDlgParam^.iRetBunrui		:= GetSelectedMasterKbn;
end;



//************************************************************************
//	Component	:	コード入力欄 (TMNumEdit, TMTxtEdit)
//
//	Event		:	OnChange
//	Name		:	Y.Kubo
//	Create		:	2006 / 10 / 13
//	Comment		:	XXXXXXXXXXXXXXXXXXXXXX
//	History		:	XXXX/XX/XX  XX修正者XX
//					XXXXXXXXXX更新内容XXXXXXXXXX
//************************************************************************
procedure TJNTCRP004010PrnDlgf.ChangeEvent(Sender: TObject);
begin
	// 項目別
	if Sender Is TCustomEdit then TCustomEdit(Sender).Tag := 0;
end;


//**************************************************************************
//	Proccess	: 選択されているマスタのマスタ区分を取得する
//	Name		: Y.Kubo
//	Date		: 2006 / 10 / 04
//  Parameter	:
//	Retrun		: -1:全件表示 0:BS科目 1:PL科目
//	History		:
//**************************************************************************
function TJNTCRP004010PrnDlgf.GetSelectedMasterKbn():Integer;
begin
	result := StrToInt(PcmbBunrui.ColumnText(PcmbBunrui.ItemIndex,1));
end;


//**************************************************************************
//	Proccess	: 検索エクスプローラ情報テーブルを作成
//	Name		: Y.Kubo
//	Date		: 2006 / 10 / 20
//  Parameter	:
//	Retrun		:
//	History		:
//**************************************************************************
procedure TJNTCRP004010PrnDlgf.CreateWndInfo;
var
	ix : Integer;
begin
    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    m_bExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_pComArea) = 0 then
        m_bExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);


	for ix := Low(m_WndInfo) to High(m_WndInfo) do
	begin
		with m_WndInfo[ix] do
		begin
            GCode      := 'GCode';
            NCode      := 'NCode';
            Renso      := 'Renso';

            case ix of
                0:
                begin
					//<#3> MOD St
					{
                    MastarKbn  := m_pDlgParam.iMastarKbn;
                    TableName  := 'MTOKUI';
                    SimpleName := 'Nmk';
                    Where      := 'TemplateKbn=0 and RDelKbn=0 and SumKbn=0';
					}

                    MastarKbn  := m_pDlgParam.iMastarKbn;

					case m_pDlgParam.iMastarKbn of
						MST_CUSTOMER				// 取引先
						:begin
							TableName  := 'MTOKUI';
							SimpleName := 'Nmk';
							Where      := 'TemplateKbn=0 and RDelKbn=0 and SumKbn=0';
						end;

						MST_KOJI..MST_KOJI+9		// プロジェクト
						:begin
							TableName  := 'HojyoMA';
							SimpleName := 'SimpleName';
							Where      := 'MasterKbn='+IntToStr(MastarKbn)
										+ ' and RDelKbn=0 and SumKbn=0';
						end;
					end;
					//<#3> MOD Ed
                end;

                1:
                begin
                    MastarKbn  := m_pDlgParam.iSecMastarKbn;
                    TableName  := 'HojyoMA';
		            SimpleName := 'SimpleName';
					Where      := 'MasterKbn='+IntToStr(MastarKbn)
							  	+ ' and RDelKbn=0 and SumKbn=0'
								+ ' and SyokuchiKbn = 0';	// 諸口除く
                end;
            end;  //case文のend
        end;
	end;
end;

//**************************************************************************
//	Proccess	: 検索エクスプローラテーブルから1レコードを抽出
//	Name		: Y.Kubo
//	Date		: 2006 / 10 / 20
//  Parameter	:
//	Retrun		:
//	History		:
//**************************************************************************
function  TJNTCRP004010PrnDlgf.GetWndInfo(_iKbn:Integer):TWndInfo;
var
	ix : Integer;
begin
	//初期化
	result.MastarKbn  := 0;
	result.TableName  :='';
	result.GCode      :='';
	result.NCode      :='';
	result.SimpleName :='';
	result.Renso      :='';
	result.Where      :='';

	//抽出処理
	for ix := Low(m_WndInfo) to High(m_WndInfo) do
	begin
	   if (m_WndInfo[ix].MastarKbn = _iKbn) then
	   begin
			result := m_WndInfo[ix];
            break;
	   end;
	end;
end;

//**************************************************************************
//	Proccess	: 分類コンボが変更されたら、範囲コードをクリアする
//	Name		: Y.Kubo
//	Date		: 2006 / 10 / 20
//  Parameter	:
//	Retrun		:
//	History		:
//**************************************************************************
procedure TJNTCRP004010PrnDlgf.PcmbBunruiChange(Sender: TObject);
begin
	EStart.Text  := '';
	EEnd  .Text  := '';

	EStartNum.Value := 0;
	EEndNum  .Value := 0;

    LStartDsp.Caption:= '';
    LEndDsp  .Caption:= '';

	if PcmbBunrui.ItemIndex = 0 then
	begin
		m_iCodeAttr  := m_pDlgParam^.iCodeAttr;
		m_iCodeDigit := m_pDlgParam^.iCodeDigit;
	end
	else begin
		m_iCodeAttr  := m_pDlgParam^.iSecCodeAttr;
		m_iCodeDigit := m_pDlgParam^.iSecCodeDigit;
	end;

	//範囲選択
    case m_iCodeAttr of
	0: EStart.InputAttr := iaZeroSup;
	1: EStart.InputAttr := iaZeroPad;
//	2: EStart.InputAttr := iaFree;
	2: EStart.InputAttr := iaNone;	//<#4> MOD
	end;
	EStart.MaxLength := m_iCodeDigit;

	//終了側にも反映
	EEnd.InputAttr := EStart.InputAttr;
	EEnd.MaxLength := EStart.MaxLength;

	EStartNum.Digits := m_iCodeDigit;
	EEndNum  .Digits := m_iCodeDigit;

	EStart.Visible   := (m_iCodeAttr=2);
	EEnd.Visible     := EStart.Visible;

    EStartNum.Visible := not EStart.Visible;
    EEndNum.Visible   := EStartNum.Visible;


	if m_iCodeAttr = 1 then
    begin
        EStartNum.FormatStr := StringOfChar('0',m_iCodeDigit);
        EEndNum.FormatStr := StringOfChar('0',m_iCodeDigit);
    end
    else begin
        EStartNum.FormatStr := '';
        EEndNum.FormatStr := '';
    end;

	//表示させない
	EStartNum.InputFlag := True;
	EEndNum.InputFlag   := True;
end;

end.


