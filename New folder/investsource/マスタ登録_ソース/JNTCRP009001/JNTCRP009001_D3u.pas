//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：科目 勘定科目（諸口登録ダイアログ）
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：茂木 勇次(LEAD)
//      作成日      ：2005.03.26(SAT)
//
//=============================================================================
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//  <001>   茂木 勇次(LEAD) 2005.07.19(TUE) MjsMessageBox,MjsMessageBoxExの第1引数に"Self"を追加。
//  <001>   大竹 文顕(LEAD) 2008.03.14(FRI) 更新担当者内部ｺｰﾄﾞのｾｯﾄ
//  <DKAI>  難波(LAB)       2008.08.27(WED) 名称に改行が入らないようにする
//	<002>	黒田 祐生		2012.02.13(MON)	ShiftState対応
//
//=============================================================================
unit JNTCRP009001_D3u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs,
  Buttons, VCL.StdCtrls, VCL.ExtCtrls, FireDAC.Comp.Client,

  JNTMasComu, MJSCommonu, MJSMsgStdu, MJSBitBtn,  MJSEdits,  MJSPanel, MJSDBModuleu,
  MJSQuery, MJSDispCtrl, MjsDateCtrl, MJSLabel
  ,MJSKeyDataState, MJSStrctrl	// <002>ADD
  ;

type
  TSyokuchiRetValue = record
    rcState     :   Integer;
    rcExCode    :   String;
    rcRenso     :   String;
    rcLName     :   String;
    rcSName     :   String;
  end;

type
  TJNTCRP009001_D3f = class(TForm)
    DialogEditExCodeNumeric: TMNumEdit;
    DialogEditAssociation: TMTxtEdit;
    DialogEditName: TMTxtEdit;
    DialogEditNameSimple: TMTxtEdit;
    DialogButtonRegistration: TMBitBtn;
    BCancel: TMBitBtn;
    DialogEditExCodeFree: TMTxtEdit;
    DialogPanelErrorMessage: TMPanel;
    MLabel1: TMLabel;
    MLabel2: TMLabel;
    MLabel3: TMLabel;
    MLabel4: TMLabel;

    procedure       fnJNTCRP009001_D3fOnCreate          (Sender: TObject);
	procedure       fnDialogCommonFunctionOnKeyDown01   (Sender: TObject; var Key: Word; Shift: TShiftState);
	procedure       fnDialogCommonFunctionOnKeyDown02   (Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure       fnDialogButtonRegistrationOnClick   (Sender: TObject);
    procedure       FormClose                           (Sender: TObject; var Action: TCloseAction);

  private
    { Private 宣言 }
	m_pRec				    :   ^TMjsAppRecord;
	m_cDataModule		    :   TMDataModulef;
	m_cDBSelect			    :   TFDConnection;
	m_nCodeDigit		    :   Integer;
	m_nCodeAttribute	    :   Integer;
	m_strValidCharacters    :   String;
    m_nExCode               :   Integer;
    m_nExNCode              :   Extended;
    m_RetValue              :   ^TSyokuchiRetValue;
    AOwner                  :   TComponent; // <001>

	function        fnDelCRLF(sData: String): String;	// 改行削除 <DKAI>

  public
    { Public 宣言 }
	constructor	    fnCreateDialog	                    (pRec: Pointer; pRetValue : Pointer; Owner: TComponent; cDBSelect: TFDConnection; nCodeDigit: Integer;
                                                         nCodeAttribute: Integer; nCode: Integer; nNCode: Extended; strValidCharacters: String); // <001>
    procedure	    CMChildKey						    (var Msg: TWMKey); message CM_CHILDKEY;
	function	    fnCheckExCodeValue				    (strExCode: String): Boolean;
	function	    fnCheckMasterDataRecordValid	    (strExCode: String): Boolean;
	function	    fnRegistrationGeneralRecord		    (strExCode: String): Boolean;
	function	    fnCheckValidExCodeCharacter		    (strExCode: String): Boolean;
	procedure	    fnSetErrorMessage				    ();
    function        GetNewCNCode                        (): Integer;

  end;

var
  JNTCRP009001_D3F: TJNTCRP009001_D3F;

implementation

{$R *.DFM}
{$include JNTMASERRORCODECHECK.inc}
{$include JNTConst.inc}

//-----------------------------------------------------------------------------
// fnCreateDialog()
//      PARAM   : pRec
//              : AOwner
//              : cDBSelect
//              : nCodeDigit
//              : nCodeAttribute
//              : strValidCharacters
//      RETURN  :
//      MEMO    : 科目ﾌｫｰﾑから呼ばれる関数
//-----------------------------------------------------------------------------
constructor	TJNTCRP009001_D3f.fnCreateDialog (pRec: Pointer; pRetValue : Pointer; Owner: TComponent; cDBSelect: TFDConnection; nCodeDigit: Integer;
                                              nCodeAttribute: Integer; nCode: Integer; nNCode: Extended; strValidCharacters: String); // <001>
begin

	m_pRec					:=  pRec;
	m_cDataModule			:=  TMDataModulef (m_pRec^.m_pDBModule^);
	m_cDBSelect				:=  cDBSelect;
	m_nCodeDigit			:=  nCodeDigit;
	m_nCodeAttribute		:=  nCodeAttribute;
    m_nExCode               :=  nCode;
    m_nExNCode              :=  nNCode;
	m_strValidCharacters    :=  strValidCharacters;

    m_RetValue              :=  pRetValue;
    m_RetValue.rcState      :=  -1;

    AOwner                  :=  Owner;  // <001>
	inherited	Create (Owner);

end;

//-----------------------------------------------------------------------------
// CMChildKey()
//	< ｷｰ制御 >
//      PARAM   : Msg
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	    TJNTCRP009001_D3f.CMChildKey (var Msg: TWMKey);
var
	cShiftState :   TShiftState;
begin

    // ESCｷｰの補足
	if ( Msg.CharCode = VK_ESCAPE ) then
		ModalResult	:= mrCancel;

    // Shiftｷｰの取得
	cShiftState	:= MJSKeyDataToShiftState (Msg.KeyData);	// <002>MOD

    // OKﾎﾞﾀﾝ
	if	( Screen.ActiveControl.Name = DialogButtonRegistration.Name ) then
	begin
        // LEFT/UPｷｰの補足
		if	((( Msg.CharCode = VK_LEFT ) and ( cShiftState = [] ))  or
			 (( Msg.CharCode = VK_UP   ) and ( cShiftState = [] ))) then
		begin
            // 次へ
			MJSDispCtrl.MJSPrevCtrl (Self);
			Abort ();
		end;
	end;

    // ｷｬﾝｾﾙﾎﾞﾀﾝ
	if	( Screen.ActiveControl.Name = BCancel.Name ) then
	begin
        // RIGHT/DOWNｷｰの補足
		if	((( Msg.CharCode = VK_RIGHT ) and ( cShiftState = [] ))  or
			 (( Msg.CharCode = VK_DOWN  ) and ( cShiftState = [] ))) then
		begin
            // 先頭ﾌｨｰﾙﾄﾞへ
			if	( m_nCodeAttribute <= 1 ) then
				DialogEditExCodeNumeric.SetFocus ()
			else
				DialogEditExCodeFree   .SetFocus ();

			Abort ();
		end;
	end;

	inherited;

end;

//-----------------------------------------------------------------------------
// fnJNTCRP009001_D3fOnCreate()
//	< ﾌｫｰﾑ作成 >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	    TJNTCRP009001_D3f.fnJNTCRP009001_D3fOnCreate (Sender: TObject);
var
	strFormat   :   String;
begin

	MJSColorChange (TJNTCRP009001_D3F(Self), 0, 0, 0, 0, rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

    MjsFontResize( TJNTCRP009001_D3F(Self), Pointer(m_pRec) );

    // -----------------------------
    //  ｺｰﾄﾞ属性 : 数値
    // -----------------------------
	if	( m_nCodeAttribute <= 1 ) then
	begin
		DialogEditExCodeFree   .Visible	:= FALSE;
		DialogEditExCodeNumeric.Visible	:= TRUE;

		if	( m_nCodeAttribute = 1 ) then
			    strFormat	:= StringOfChar ('0', m_nCodeDigit)
		else    strFormat	:= '';

		DialogEditExCodeNumeric.FormatStr	:= strFormat;
		DialogEditExCodeNumeric.Value		:= 0;
		DialogEditExCodeNumeric.Digits		:= m_nCodeDigit;
		DialogEditExCodeNumeric.MaxValue	:= StrToInt64 (StringOfChar ('9', m_nCodeDigit));
	end
    // -----------------------------
    //  ｺｰﾄﾞ属性 : ﾌﾘｰ
    // -----------------------------
	else
	begin
		DialogEditExCodeNumeric.Visible		:= FALSE;
		DialogEditExCodeFree   .Visible		:= TRUE;
		DialogEditExCodeFree   .Text		:= '';
		DialogEditExCodeFree   .MaxLength	:= m_nCodeDigit
	end;

    DialogEditAssociation.Text	:= '';
	DialogEditName       .Text	:= '諸口';
	DialogEditNameSimple .Text	:= '諸口';

end;

//-----------------------------------------------------------------------------
// FormClose()
//	< ﾌｫｰﾑｸﾛｰｽﾞ >
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Action
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009001_D3f.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

end;

//-----------------------------------------------------------------------------
// fnDialogCommonFunctionOnKeyDown01()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key, Shift
//      RETURN  :
//      MEMO    : 諸口ｺｰﾄﾞ OnKeyDown ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	    TJNTCRP009001_D3f.fnDialogCommonFunctionOnKeyDown01 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

    // RETUENｷｰの補足
	if  ( Key = VK_RETURN ) then
		MjsDispCtrl.MjsNextCtrl (Self)

    // ESC/ENDｷｰの補足
	else if	(( Key = VK_ESCAPE ) or ( Key = VK_END )) then
	begin
        // ｷｬﾝｾﾙ
		ModalResult	:= mrCancel;
		Exit;
	end

    // LEFT/UPｷｰの補足
	else if	(( Key = VK_LEFT ) or ( Key = VK_UP )) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	( MJSChkCurTop (Sender as TComponent) ) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end

    // RIGHT/DOWNｷｰの補足
	else if	(( Key = VK_RIGHT ) or ( Key = VK_DOWN )) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	( MJSChkCurEnd (Sender as TComponent) ) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end;

end;

//-----------------------------------------------------------------------------
// fnDialogCommonFunctionOnKeyDown02()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key, Shift
//      RETURN  :
//      MEMO    : 共通 OnKeyDown ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	    TJNTCRP009001_D3f.fnDialogCommonFunctionOnKeyDown02 (Sender: TObject; var Key: Word; Shift: TShiftState);
begin

    // RETURNｷｰの補足
	if	( Key = VK_RETURN ) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	(( TMTxtEdit (Sender).Name   = DialogEditName.Name )  and
				 ( DialogEditNameSimple.Text = ''                  )) then
				DialogEditNameSimple.Text	:= MJSKabuCut (DialogEditName.Text, 14);
		end;

		MjsDispCtrl.MjsNextCtrl (Self);
	end

    // ESC/ENDｷｰの補足
	else if	(( Key = VK_ESCAPE ) or ( Key = VK_END )) then
	begin
		ModalResult	:= mrCancel;
		Exit;
	end

    // LEFT/UPｷｰの補足
	else if	(( Key = VK_LEFT ) or ( Key = VK_UP )) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	( MJSChkCurTop (Sender as TComponent) ) then
				MJSDispCtrl.MjsPrevCtrl (Self);
		end
		else
			MJSDispCtrl.MjsPrevCtrl (Self);
	end

    // RIGHT/DOWNｷｰの補足
	else if	(( Key = VK_RIGHT ) or ( Key = VK_DOWN )) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	( MJSChkCurEnd (Sender as TComponent) ) then
				MJSDispCtrl.MjsNextCtrl (Self);
		end
		else
			MJSDispCtrl.MjsNextCtrl (Self);
	end
	else if	( Key = VK_F8 ) then
	begin
		if	( Sender is TMTxtEdit ) then
		begin
			if	(( TMTxtEdit (Sender).Name =  DialogEditNameSimple.Name )  and
				 ( DialogEditName.Text     <> ''                        )) then
				DialogEditNameSimple.Text	:= MJSKabuCut (DialogEditName.Text, 14);
		end;
	end;

end;

//-----------------------------------------------------------------------------
// fnDialogButtonRegistrationOnClick()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : OKﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
procedure	    TJNTCRP009001_D3f.fnDialogButtonRegistrationOnClick (Sender: TObject);
var
	strExCode   :   String;
    fReturn     :   Boolean;
begin

    // -------------------------------
    //  属性 : 数字
    // -------------------------------
    if	( m_nCodeAttribute = 0 ) then
		strExCode	:= IntToStr(Trunc(DialogEditExCodeNumeric.Value))
    // -------------------------------
    //  属性 : 数字(前ｾﾞﾛ有)
    // -------------------------------
    else if ( m_nCodeAttribute = 1 ) then
        strExCode	:= Format ('%.' +IntToStr(m_nCodeDigit) + 'd', [Trunc (DialogEditExCodeNumeric.Value)])

    // -------------------------------
    //  属性 : ﾌﾘｰ
    // -------------------------------
	else
		strExCode	:= DialogEditExCodeFree.Text;


    // -------------------------------
    //  外部ｺｰﾄﾞ入力ﾁｪｯｸ
    // -------------------------------
	if	( not fnCheckExCodeValue (strExCode) ) then
	begin
		if	(m_nCodeAttribute <= 1) then
			DialogEditExCodeNumeric.SetFocus ()
		else
			DialogEditExCodeFree   .SetFocus ();

		Exit;
	end;


    m_RetValue.rcState  :=  0;
    m_RetValue.rcExCode :=  strExCode;
    m_RetValue.rcRenso  :=  DialogEditAssociation.Text;
    m_RetValue.rcLName  :=  DialogEditName.Text;
    m_RetValue.rcSName  :=  DialogEditNameSimple.Text;

    // 諸口の更新
//	fReturn	:= fnRegistrationGeneralRecord (strExCode);
{
    // ｴﾗｰ
	if	( not fReturn ) then
	begin
        // ﾛｰﾙﾊﾞｯｸ(破棄)
		m_cDataModule.Rollback (m_cDBSelect);
		Exit;
	end;

    // ｺﾐｯﾄ(反映)
	m_cDataModule.Commit (m_cDBSelect);
}
	ModalResult	:= mrOK;

end;

//-----------------------------------------------------------------------------
// fnRegistrationGeneralRecord()
//      PARAM   : Sender: TObjectｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    : Cancelﾎﾞﾀﾝ OnClick ｲﾍﾞﾝﾄ
//-----------------------------------------------------------------------------
function	TJNTCRP009001_D3f.fnRegistrationGeneralRecord (strExCode: String): Boolean;
var
	dqMasterData    :   TMQuery;
    nWorkCNCode     :   Extended;
begin

    // MQueryの構築
	dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin
        // 諸口が存在するかﾁｪｯｸ
		Close();
		SQL.Clear();
        SQL.Add('SELECT RDelKbn                         '
            +   'FROM KmkMA                             '
            +   'WHERE  MasterKbn   = :nMasterDivision  '
            +   '  AND  SumKbn      = 0                 '
            +   '  AND  Syokuchikbn = 1                 '
            +   '  AND  RDelKbn     = 1                 '
            +   '  AND  GCODE       = :nGCode           ');

		ParamByName('nMasterDivision')  .AsInteger	:= MKBN_SAIMOKU;
        ParamByName('nGCode')           .AsInteger  := m_nExCode;

		Open ();

// ----------------------------------------------------------------------------
//  勘定科目基本マスタの更新
//
// ----------------------------------------------------------------------------
        // 諸口ﾚｺｰﾄﾞが存在する場合(諸口再利用)
		if	(not EOF) then
		begin
			Close ();
			SQL.Clear;
            SQL.Add ('UPDATE KmkMA SET                      '
                +   '    RDelKbn    =   0                   '
                +   '   ,Renso      =   :nRenso             '
                +   '   ,LongName   =   :nLName             '
                +   '   ,SimpleName =   :nSName             '
                +   '   ,BankNCode  =   NULL                '
                +   '   ,TStartDate =   :nSDate             '
                +   '   ,TEndDate   =   :nEDate             '
                +   '   ,DebitCash  =   NULL                '
                +   '   ,CreditCash =   NULL                '
                +   '   ,DPointNum  =   0                   '
                +   '   ,SubCode    =   :nSCode             '
                +   '   ,NCode      =   :nNCode             '
                +   '   ,CodeAttr   =   :Attr               '
                +   '   ,CodeDigit  =   :Digit              '
                +   '   ,UpdTantoNCode  = :nUpdTantoNCode   ' // <002>
                +   'WHERE MasterKbn   = :nMasterDivision   '
                +   '  AND SumKbn      = 0                  '
                +   '  AND SyokuchiKbn = 1                  '
                +   '  AND GCode       = :nGCode            ');

            ParamByName('nMasterDivision')  .AsInteger  :=  MKBN_SAIMOKU;
            ParamByName('nNCode')           .AsFloat	:=	m_nExNCode;
            ParamByName('nGCode')           .AsInteger	:=	m_nExCode;
            ParamByName('nRenso')           .AsString 	:=	fnDelCRLF(DialogEditAssociation.Text);	//<DKAI>
            ParamByName('nLName')           .AsString	:=	fnDelCRLF(DialogEditName       .Text);	//<DKAI>
            ParamByName('nSName')           .AsString	:=	fnDelCRLF(DialogEditNameSimple .Text);	//<DKAI>
            ParamByName('nSDate')           .AsDateTime :=  MjsIntToDate(DEFDATE_START, #0);
            ParamByName('nEDate')           .AsDateTime :=  MjsIntToDate(DEFDATE_END, #0);
            ParamByName('nSCode')           .AsString	:=	strExCode;
            ParamByName('nAttr')            .AsInteger  :=  m_nCodeAttribute;
            ParamByName('nDigit')           .AsInteger  :=  m_nCodeDigit;
            ParamByName('nUpdTantoNCode')   .AsCurrency :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <002>

            //	ｴﾗｰの判定
			if ( ExecSQL = False ) then
			begin
                dqMasterData.Free ();
				Result  :=	False;
				Exit;
			end;
		end
        // 補助マスタに諸口レコードが存在しない場合
		else
		begin

            // 細目内部ｺｰﾄﾞの取得
            nWorkCNCode :=  GetNewCNCode;

			Close();
			SQL.Clear();
			SQL.Add('INSERT INTO KmkMA (    '
                +   '    MasterKbn          '
                +   '   ,SumKbn             '
                +   '   ,RDelKbn            '
                +   '   ,NCode              '
                +   '   ,CNCode             '
                +   '   ,GCode              '
                +   '   ,SubCode            '
                +   '   ,Renso              '
                +   '   ,LongName           '
                +   '   ,SimpleName         '
                +   '   ,BankNCode          '
                +   '   ,TStartDate         '
                +   '   ,TEndDate           '
                +   '   ,DebitCash          '
                +   '   ,CreditCash         '
                +   '   ,DPointNum          '
                +   '   ,SyokuchiKbn        '
                +   '   ,UpdTantoNCode      ' // <002>
                +   ') VALUES (             '
                +   '    :nMasterDivision   '
                +   '   ,0                  '
                +   '   ,0                  '
                +   '   ,:nNCode            '
                +   '   ,:nCNCode           '
                +   '   ,:nGCode            '
                +   '   ,:nSCode            '
                +   '   ,:nRenso            '
                +   '   ,:nLName            '
                +   '   ,:nSName            '
                +   '   ,NULL               '
                +   '   ,:nSDate            '
                +   '   ,:nEDate            '
                +   '   ,NULL               '
                +   '   ,NULL               '
                +   '   ,0                  '
                +   '   ,1                  '
                +   '   ,:nUpdTantoNCode)   '); // <002>

            ParamByName('nMasterDivision')  .AsInteger  :=  MKBN_SAIMOKU;
            ParamByName('nNCode')           .AsFloat	:=	m_nExNCode;
            ParamByName('nCNCode')          .AsFloat    :=  nWorkCNCode;
            ParamByName('nGCode')           .AsInteger	:=	m_nExCode;
            ParamByName('nRenso')           .AsString 	:=	fnDelCRLF(DialogEditAssociation.Text);	//<DKAI>
            ParamByName('nLName')           .AsString	:=	fnDelCRLF(DialogEditName       .Text);	//<DKAI>
            ParamByName('nSName')           .AsString	:=	fnDelCRLF(DialogEditNameSimple .Text);	//<DKAI>
            ParamByName('nSDate')           .AsDateTime :=  MjsIntToDate(DEFDATE_START, #0);
            ParamByName('nEDate')           .AsDateTime :=  MjsIntToDate(DEFDATE_END, #0);
            ParamByName('nSCode')           .AsString	:=	strExCode;
            ParamByName('nUpdTantoNCode')   .AsCurrency :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <002>

            //	ｴﾗｰの判定
			if ( ExecSQL = False ) then
			begin
                dqMasterData.Free ();
				Result  :=	False;
				Exit;
			end;

// ----------------------------------------------------------------------------
//  勘定科目基本マスタの更新
//  (細目に対する科目の科目別補助採用区分をONにする
// ----------------------------------------------------------------------------
            Close();
            SQL.Clear();
            SQL.Add('UPDATE KMKMA SET                   '
                +   '    SubKmkUse = 1                  '
                +   '   ,UpdTantoNCode = :nUpdTantoNCode ' // <002>
                +   'WHERE MasterKbn = nMasterDivision  '
                +   '  AND RDelKbn   = 0                '
                +   '  AND SumKbn    = 0                '
                +   '  AND NCode     = :nNCode          '
                +   '  AND CNCode    = 0                ');

            ParamByName('nMasterDivision')  .AsInteger  :=  MKBN_SAIMOKU;
            ParamByName('nNCode')           .AsFloat	:=	m_nExNCode;
            ParamByName('nUpdTantoNCode')   .AsCurrency :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <002>

            //	ｴﾗｰの判定
			if ( ExecSQL = False ) then
			begin
                dqMasterData.Free ();
				Result  :=	False;
				Exit;
			end;

// ----------------------------------------------------------------------------
//  勘定科目詳細情報の更新
//
// ----------------------------------------------------------------------------
            Close();
            SQL.Clear();
            SQL.Add('INSERT INTO KMKMB (    '
                +   '    KMKNCode           '
                +   '   ,SubNCode           '
                +   '   ,MasterKbn          '
                +   '   ,SumKbn             '
                +   '   ,UpdTantoNCode      ' // <002>
                +   ') VALUES (             '
                +   '    :nNCode            '
                +   '   ,:nCNCode           '
                +   '   ,2                  '
                +   '   ,0                  '
                +   '   ,:nUpdTantoNCode)   '); // <002>

            ParamByName('nNCode')   .AsFloat    :=	m_nExNCode;
            ParamByName('nCNCode')  .AsFloat    :=  nWorkCNCode;
            ParamByName('nUpdTantoNCode')   .AsCurrency :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // <002>

            //	ｴﾗｰの判定
			if ( ExecSQL = False ) then
			begin
                dqMasterData.Free ();
				Result  :=	False;
				Exit;
			end;

		end;
	end;

	dqMasterData.Free ();

    // 正常終了
	Result	:= TRUE;

end;

//-----------------------------------------------------------------------------
// fnCheckExCodeValue()
//      PARAM   : strExCode: 外部ｺｰﾄﾞ
//      RETURN  : Boolean  : (True : 正常終了 False : 異常終了)
//      MEMO    : 補助外部ｺｰﾄﾞ入力ﾁｪｯｸ
//-----------------------------------------------------------------------------
function    TJNTCRP009001_D3f.fnCheckExCodeValue (strExCode: String): Boolean;
begin

	if	( not fnCheckValidExCodeCharacter (strExCode) ) then
	begin
		fnSetErrorMessage ();
		Result	:= FALSE;
		Exit;
	end;

	if	( not fnCheckMasterDataRecordValid (strExCode) ) then
	begin
		fnSetErrorMessage ();
		Result	:= FALSE;
		Exit;
	end;

	Result	:= TRUE;

end;

//-----------------------------------------------------------------------------
// fnCheckValidExCodeCharacter()
//      PARAM   : strExCode: 外部ｺｰﾄﾞ
//      RETURN  : Boolean  : (True : 正常終了 False : 異常終了)
//      MEMO    : 補助外部ｺｰﾄﾞ入力ﾁｪｯｸ
//-----------------------------------------------------------------------------
function	TJNTCRP009001_D3f.fnCheckValidExCodeCharacter (strExCode: String): Boolean;
var
	cErrorMsgRec    :   TMJSMsgRec;

begin
	if	( Trim (strExCode) = '' ) then
	begin
		Beep ();
		Result	:= FALSE;
		Exit;
	end;

    // 属性: 数字
	if	( m_nCodeAttribute <= 1 ) then
	begin
		Result	:= TRUE;
		Exit;
	end;

	if	( not JNTMASERRORCODECHECK (strExCode, m_strValidCharacters) ) then
	begin
		Beep ();

		TJNTMASCom (m_pRec^.m_pSystemArea^).m_MsgStd.GetMsg (cErrorMsgRec, 30, 21);

		MJSMessageBoxEx (Owner,    // <001>
                         cErrorMsgRec.sMsg,
                         m_pRec^.m_ProgramName,
                         cErrorMsgRec.icontype,
                         cErrorMsgRec.btntype,
                         cErrorMsgRec.btndef,
                         cErrorMsgRec.LogType
                        );

		Result	:= FALSE;
		Exit;
	end;

	Result  := TRUE;

end;

//-----------------------------------------------------------------------------
// fnCheckMasterDataRecordValid()
//      PARAM   : strExCode: 外部ｺｰﾄﾞ
//      RETURN  : Boolean  : (True : 正常終了 False : 異常終了)
//      MEMO    : 有効ﾚｺｰﾄﾞ･ﾁｪｯｸ
//-----------------------------------------------------------------------------
function    TJNTCRP009001_D3f.fnCheckMasterDataRecordValid (strExCode: String): Boolean;
var
	dqMasterData: TMQuery;
	fReturn		: Boolean;
begin

	fReturn	:= False;
    // MQueryの構築
	dqMasterData	:= TMQuery.Create (Self);
    // DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

    with (dqMasterData) do
    begin
		Close();
		SQL.Clear();


        SQL.Add('SELECT * FROM KmkMA                '
            +   'WHERE MasterKbn = :nMasterDivision '
            +   '  AND RDelKbn   = 0                '
            +   '  AND GCode     = :strExCode       '
            +   '  AND SubCode   = :strExSubCode    ');

		ParamByName('nMasterDivision')  .AsInteger  :=  MKBN_SAIMOKU;
		ParamByName('strExCode')        .AsInteger	:=  m_nExCode;
        ParamByName('strExSubCode')     .AsString   :=  strExCode;


		Open ();

		if  (EOF) then
			fReturn	:= True;

		Close ();
    end;

	result	:= fReturn;
end;

//-----------------------------------------------------------------------------
// fnSetErrorMessage()
//      PARAM   :
//      RETURN  :
//      MEMO    : 諸口登録ﾀﾞｲｱﾛｸﾞ ｴﾗｰﾒｯｾｰｼﾞ ｾｯﾄ処理
//-----------------------------------------------------------------------------
procedure	TJNTCRP009001_D3f.fnSetErrorMessage ();
begin

	Beep ();
	DialogPanelErrorMessage.Caption		:= ' コードを正しく入力してください。';

    // ----------------------------
    //  属性 : 数字
    // ----------------------------
	if	(m_nCodeAttribute <= 1) then
		DialogEditExCodeNumeric.SetFocus ()
    // ----------------------------
    //  属性 : ﾌﾘｰ
    // ----------------------------
	else
		DialogEditExCodeFree   .SetFocus ();

end;

//-----------------------------------------------------------------------------
// GetNewCNCode()
//      PARAM   :
//      RETURN  : Integer 細目内部ｺｰﾄﾞ
//      MEMO    : 細目内部ｺｰﾄﾞの取得
//-----------------------------------------------------------------------------
function TJNTCRP009001_D3f.GetNewCNCode():Integer;
var
	QueryWk : TMQuery;
begin
    Result := -1;
    										//MQueryの構築
	QueryWk := TMQuery.Create( Self );
	try
											//DBとMQueryの接続
    	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, QueryWk );

	    QueryWk.Close;
    	QueryWk.SQL.Clear;
	    QueryWk.SQL.ADD('Select MAX(CNCode) as MaxCNcode From KMKMA');

        try
       	    QueryWk.Open;
        except
			Exit;
        end;

    	if QueryWk.Eof <> True then
	    begin
                                            // 内部ｺｰﾄﾞの最大+1
    		Result := QueryWk.GetFld('MaxCNcode').AsInteger + 1;
        end
        else
        begin
            Result := 1;                    // 1ｵﾘｼﾞﾝ
	    end;
    finally
	    QueryWk.Free;
    end;
end;

//**************************************************************************
//	Proccess	:	名称から改行コードを削除する  <DKAI>
//	Name		:	E.Nanba
//	Date		:	2008 / 08 / 27
//	Parameter	:	sData
//	Retrun		:	String
//	History		:	2001 / 99 / 99	X.Xxxxxx
//					XXXXXXXX修正内容
//**************************************************************************
function TJNTCRP009001_D3f.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;

end.


