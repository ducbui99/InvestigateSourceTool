//************************************************************************
//	System		:	Galileopt
//	Program		:	取引先登録 - 取引先任意選択
//	ProgramID	:	JNTCRP004001NotSameu
//	Name		:   吉田健吾
//	Create		:	2011 / 10 / 11
//	Comment		:
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//
//	<001>	吉田健吾	2012.03.13		検索Expに取引先が表示できるが取引先を確定できない。
//										属性によるｺｰﾄﾞ編集がフリーの時のみ抜けていた。
//
//*************************************************************************
unit JNTCRP004001NotSameu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  VCL.StdCtrls, MJSLabel, Buttons, MJSBitBtn, MJSCheckBox, MJSComboBox,
  MJSEdits, Db, FireDAC.Comp.Client, MJSQuery, MjsDBModuleu, JNTCommonu, JNTMASComu, JNTSelCorpSys, MjsMsgStdu,
  MJSCommonu,JNTExpGlobal,JNTFuncU,MjsDispCtrl,MjsStrCtrl,JNTCRP004001SameListParau,JNTSelGlobal;

type
  {$I ActionInterface.inc}
  {$I ETYMasterSinseiExgIFI.inc}

  TJNTCRP004001NotSamef = class(TForm)
    BBtn_Sinki		: TMBitBtn;
    BBtn_Uwagaki	: TMBitBtn;
    BBtn_Cancel		: TMBitBtn;
    MLabel1			: TMLabel;
    LLbl_Seishiki	: TMLabel;
    MLabel3			: TMLabel;
    MLabel4			: TMLabel;
    MLabel5			: TMLabel;
    MLabel6			: TMLabel;
    MLabel7			: TMLabel;
    MLabel8			: TMLabel;
    MLabel9			: TMLabel;
    MLabel10		: TMLabel;
    MLabel11		: TMLabel;
    MLabel12		: TMLabel;
    MLabel13		: TMLabel;
    MLabel14		: TMLabel;
    LLbl_Keisyou	: TMLabel;
    LLbl_Trcode		: TMLabel;
    BChk_Uwagaki	: TMCheckBox;
    LLbl_Hurigana	: TMLabel;
    LLbl_Kanryaku	: TMLabel;
    LLbl_Rensou		: TMLabel;
    LLbl_Post1		: TMLabel;
    LLbl_Post2		: TMLabel;
    LLbl_Zyusyo1	: TMLabel;
    LLbl_Zyusyo2	: TMLabel;
    LLbl_Tel1		: TMLabel;
    LLbl_Tel2		: TMLabel;
    LLbl_Fax		: TMLabel;
    LLbl_Daihyou	: TMLabel;
    MLabel28		: TMLabel;
    MQuery1			: TMQuery;
    ETxt_Trcode		: TMTxtEdit;
    MLabel29		: TMLabel;
    procedure ETxt_TrcodeExit(Sender: TObject);
    procedure BBtn_SinkiClick(Sender: TObject);
    procedure BBtn_UwagakiClick(Sender: TObject);
    procedure BBtn_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ETxt_TrcodeArrowClick(Sender: TObject);


  private
    { Private 宣言 }
    m_SameListPara	: TSameListPara;

	m_pRec			: ^TMjsAppRecord;		// BPL管理構造体ﾎﾟｲﾝﾀ
	m_DM            : TMDataModulef;		// ｼｽﾃﾑ共通DBﾓｼﾞｭｰﾙ(DBｾｯｼｮﾝ､ｸｴﾘｰ連結等の管理)
	m_DB            : TFDConnection;			// 会社ﾃﾞｰﾀﾃﾞｰｽｺﾝﾎﾟｰﾈﾝﾄ(DBへのﾛｸﾞｲﾝ､ﾄﾗﾝｻﾞｸｼｮﾝ管理)
    m_JNTCom        : TJNTCommon;       	// 会社ｼｽﾃﾑ情報
	m_JNTMASCom		: TJNTMASCom;
    m_JNTSelSys     : TJNTSelCorpSys;
    m_pTkSinInfo    : ^TTokuiSinseiInfo;
	uvExpOpenSW		:	Boolean;			// ｴｸｽﾌﾟﾛｰﾗ起動ｽｲｯﾁ(TRUE:OPEN FALSE:CLOSE)
	uvSNcode		:	Int64;

    m_MsgRec		: TMjsMsgRec;
	procedure	CMChildKey (var Msg: TWMKey); message CM_CHILDKEY;
	procedure	fntrdata;
	procedure	fncodekakutei;
	procedure	fntrdataCrear;
	function	fncheck	:Boolean;
  public
    { Public 宣言 }
	procedure    DoDLG          (pSameListPara: TSameListPara);

  end;

implementation

{$R *.DFM}

//-----------------------------------------------------------------------------
// CMChildKey()
//      PARAM   : Msg	: TWMKey
//      RETURN  :
//      MEMO    : OnKeyDown
//-----------------------------------------------------------------------------
procedure TJNTCRP004001NotSamef.CMChildKey(var Msg: TWMKey);
var
	sShift		:	TShiftState;
	twAcCtrl	:	TWinControl;
begin
	sShift      	:=  KeyDataToShiftState(Msg.KeyData);		//Shiftｷｰの取得
	twAcCtrl    	:=  Screen.ActiveControl;					//フォーカスの取得

	// Esc処理
	if Msg.CharCode	=	vk_escape then
	begin
        Close;
        Abort;
	end;

   	if (twAcCtrl is TMTxtEdit) then
	begin
		// ｷｬﾚｯﾄが入力ﾌｨｰﾙﾄﾞの途中にある場合、LEFT, RIGHTｷｰでのﾌｫｰｶｽ移動は禁止する
        // LEFT
		if Msg.CharCode	=	VK_LEFT then
		begin
			if not MjsChkCurTop(twAcCtrl) then
			begin
				msg.CharCode	:=	0;
				MjsPrevCtrl(Self);
			    Abort;
			end;

		end;


        // RIGHT
		if Msg.CharCode	=	VK_RIGHT then
		begin
			if not MjsChkCurEnd(twAcCtrl) then
			begin
				msg.CharCode	:=	0;
				MjsNextCtrl(Self);
			    Abort;
			end;
		end;


		//上ボタン押されてもフォーカスを変えない
		if Msg.CharCode	=	VK_UP then
		begin
			ETxt_Trcode.SetFocus;
        	Abort;
		end;

        // DOWN
		if Msg.CharCode	=	VK_DOWN then
		begin
			if not MjsChkCurEnd(twAcCtrl) then
			begin
				msg.CharCode	:=	0;
				MjsNextCtrl(Self);
			    Abort;
			end;
		end;


		// フォーカスがTextEditにありかつEnterを押下した時
		if Msg.CharCode	=	VK_RETURN	then
		begin
			if	ETxt_Trcode.Text=''	then
			//テキストボックスが空欄の時は新規取込ボタンへ移動（仕様です）。
			begin
				BBtn_Sinki.SetFocus;
        		Abort;
			end
			else
			begin
                if fncheck	=	true	then
                begin
					BChk_Uwagaki.Enabled := true;
                    BChk_Uwagaki.SetFocus;
		        	Abort;
                end
                else
                begin
					ETxt_Trcode.SelectAll;
                    ETxt_Trcode.SetFocus;

		        	Abort;
                end;
			end;
		end;
	end;

   	if (twAcCtrl is TMCheckBox) then
	begin
		if (Msg.CharCode = VK_RETURN)	then
		begin
            MjsNextCtrl(Self);
        	Abort;
		end;
	end;

	Inherited;

end;


//-----------------------------------------------------------------------------
//	fntrdata
//
//	PARAM	:
//	RETURN	:
//	MEMO	:MTxtEdit1に入力された外部コードによりラベルに取引先の情報を表示させる
//-----------------------------------------------------------------------------
procedure TJNTCRP004001NotSamef.fntrdata;
var
	lvIPostno1		:	Integer;
	lvIpostno2		:	Integer;
	lvHojyoKbn		:	string;
	lvSGcode		:	string;

begin
    if ( m_JNTSelSys.GetTkCdZs <> 2 ) then
    begin
        lvSGcode	:=	Format ('%.16d', [StrToInt64 (Trim (ETxt_Trcode.Text))])
//↓<001>    end;
	end
	else
	begin
		lvSGcode	:=	Trim (ETxt_Trcode.Text)
	end;
//↑<001>


    if (m_pTkSinInfo^.SyncKbn	=	SWKFORM_TOKUI) then
    begin
        // 得意先登録申請なら得意先採用がOFFで仕入先採用がONのもの
        lvHojyoKbn := ' and HojyoKbn1 = 0 and HojyoKbn2 = 1 ';
    end
    else if (m_pTkSinInfo^.SyncKbn	=	SWKFORM_SIIRE) then
    begin
        // 仕入先登録申請なら得意先採用がONで仕入先採用がOFFのもの
        lvHojyoKbn := ' and HojyoKbn1 = 1 and HojyoKbn2 = 0 ';
    end;
	with MQuery1 do
	begin
		close;
		SQL.Clear;
		SQL.Add('select '
				+ ' Ncode '
				+ ' ,NM '
				+ ' ,keisyokbn '
				+ ' ,fkana,nmk '
				+ ' ,renso '
				+ ' ,postno1 '
				+ ' ,postno2 '
				+ ' ,ads1 '
				+ ' ,ads2 '
				+ ' ,tel1 '
				+ ' ,tel2 '
				+ ' ,fax1 '
				+ ' ,dhyonm2 '
				+ ' from Mtokui '
				+ ' where SumKbn = 0 and SyokuchiKbn = 0 and RDelkbn = 0 '
				+ lvHojyoKbn  // HojyoKbnの条件を付加
				+ ' and Gcode = :pGcode ');

		ParamByName('pGcode').AsString := lvSGcode;

        if not Open then
        begin
            // エラーは抜ける
            if m_JNTMASCom.m_MsgStd.GetMsgDB( m_MsgRec, MQuery1 ) = True then
            begin
                MjsMessageBoxEx( Self, m_MsgRec.sMsg, m_MsgRec.sTitle, m_MsgRec.icontype, m_MsgRec.btntype, m_MsgRec.btndef, FALSE );
                Exit;
            end;
        end;

		if Eof = false then
		begin
            uvSNcode				:=	Getfld('Ncode').AsInteger;			//内部ｺｰﾄﾞを取得
			LLbl_Seishiki.Caption	:=	Getfld('NM').AsString;				//正式名称表示
			LLbl_Keisyou.Caption	:=	Getfld('keisyokbn').AsString;		//敬称の表示
			LLbl_Hurigana.Caption	:=	Getfld('fkana').AsString;			//フリガナ表示
			LLbl_Kanryaku.Caption	:=	Getfld('nmk').AsString;				//簡略名称表示
			LLbl_Rensou.Caption		:=	Getfld('renso').AsString;			//連想表示

			lvIPostno1				:=	Getfld('postno1').AsInteger;		//前ゼロを付けるため一度変数へｾｯﾄ
			lvIPostno2				:=	Getfld('postno2').AsInteger;		//前ゼロを付けるため一度変数へｾｯﾄ

			//郵便番号の基番に000を表示させないため
			if	MjsEditNum(lvIPostno1,'0000',3)	=	'000'	then
            begin
				LLbl_Post1.Caption	:= '';
			end
			else
			begin
			LLbl_Post1.Caption		:=	MjsEditNum(lvIPostno1,'0000',3);	//郵便番号、基番表示
			end;

			//郵便番号の枝番に0000を表示させないため
			if	MjsEditNum(lvIPostno1,'0000',3)	=	'000'	then
			begin
				if	MjsEditNum(lvIPostno2,'0000',4)	=	'0000'	then
	            begin
				LLbl_Post2.Caption	:= '';
				end;
			end
			else
			begin
				LLbl_Post2.Caption		:=	MjsEditNum(lvIPostno2,'0000',4);	//郵便番号、枝番表示
			end;

			LLbl_Zyusyo1.Caption	:=	Getfld('ads1').AsString;			//住所上段表示
			LLbl_Zyusyo2.Caption	:=	Getfld('ads2').AsString;			//住所下段表示
			LLbl_Tel1.Caption		:=	Getfld('tel1').AsString;			//電話番号１表示
			LLbl_Tel2.Caption		:=	Getfld('tel2').AsString;			//電話番号２表示
			LLbl_Fax.Caption		:=	Getfld('fax1').AsString;			//ＦＡＸ番号表示
            LLbl_Daihyou.Caption	:=	Getfld('dhyonm2').AsString;			//代表者名表示
		end;
	end;
end;

//-----------------------------------------------------------------------------
//	fncheck
//
//	PARAM	:
//	RETURN	:Boolean(true:存在 False:存在しない)
//	MEMO	:MTxtEdit1に入力された外部コードが存在するかのﾁｪｯｸ
//-----------------------------------------------------------------------------
function TJNTCRP004001NotSamef.fncheck : boolean;
var
	lvHojyoKbn		:	string;
	lvSGcode		:	string;
begin
	result	:=	false;

    if ( m_JNTSelSys.GetTkCdZs <> 2 ) then
    begin
        lvSGcode	:=	Format ('%.16d', [StrToInt64 (Trim (ETxt_Trcode.Text))])
//↓<001>    end;
	end
	else
	begin
		lvSGcode	:=	Trim (ETxt_Trcode.Text)
	end;
//↑<001>

    if (m_pTkSinInfo^.SyncKbn	=	SWKFORM_TOKUI) then
    begin
        // 得意先登録申請なら得意先採用がOFFで仕入先採用がONのもの
        lvHojyoKbn := ' and HojyoKbn1 = 0 and HojyoKbn2 = 1 ';
    end
    else if (m_pTkSinInfo^.SyncKbn	=	SWKFORM_SIIRE) then
    begin
        // 仕入先登録申請なら得意先採用がONで仕入先採用がOFFのもの
        lvHojyoKbn := ' and HojyoKbn1 = 1 and HojyoKbn2 = 0 ';
    end;

	with MQuery1 do
	begin
 		close;
		SQL.Clear;
		SQL.Add(' select 1 where exists (select * '
				+ ' from MTOKUI '
				+ ' where SumKbn = 0 and SyokuchiKbn = 0 and RDelkbn = 0 '
				+ lvHojyoKbn  // HojyoKbnの条件を付加
				+ ' and Gcode = :pGcode ) ');
        ParamByName('pGcode').AsString := lvSGcode;
        if not Open then
        begin
            // エラーは抜ける
            if m_JNTMASCom.m_MsgStd.GetMsgDB( m_MsgRec, MQuery1 ) = True then
            begin
                MjsMessageBoxEx( Self, m_MsgRec.sMsg, m_MsgRec.sTitle, m_MsgRec.icontype, m_MsgRec.btntype, m_MsgRec.btndef, FALSE );
                Exit;
            end;
        end;


        if Eof	=	false	then
		begin
			result	:=	true;
		end
		else
		//
		begin
			fntrdataCrear;
			BChk_Uwagaki.Enabled	:=	False;
			BBtn_Uwagaki.Enabled	:=	False;
			result	:=	False;
		end;
	end;
end;





//-----------------------------------------------------------------------------
//	fncodekakutei
//
//	PARAM	:
//	RETURN	:
//	MEMO	:取引先ｺｰﾄﾞ入力後のフォーカスの移動、データ表示の制御
//-----------------------------------------------------------------------------
procedure TJNTCRP004001NotSamef.fncodekakutei;
begin
	if	ETxt_Trcode.Text=''	then
	//取引先の詳細情報削除、上書取込ボタン・チェックボックス使えなくする
	begin
		fntrdataCrear;
		BBtn_Uwagaki.Enabled	:=	false;
		BChk_Uwagaki.Enabled	:=	false;
	end
	else
	begin
        if fncheck = true	then
        //存在するﾏｽﾀが選択された場合はデータを表示。
        //上書取込ボタン、チェックボックスを使えるようにする
        begin
            fntrdata;
            BBtn_Uwagaki.Enabled 	:=	true;
            BChk_Uwagaki.Enabled	:=	true;
        end;
	end;
end;

//-----------------------------------------------------------------------------
//	ETxt_TrcodeExit
//
//	PARAM	:
//	RETURN	:
//	MEMO	:ｺｰﾄﾞ確定処理を行う
//-----------------------------------------------------------------------------
procedure TJNTCRP004001NotSamef.ETxt_TrcodeExit(Sender: TObject);
begin
	fncodekakutei;
end;

//-----------------------------------------------------------------------------
//	fntrdataCrear
//
//	PARAM	:
//	RETURN	:
//	MEMO	:ラベルに表示された取引先のデータを空にする
//-----------------------------------------------------------------------------
procedure TJNTCRP004001NotSamef.fntrdataCrear;
begin
    uvSNcode					:=	0;
	LLbl_Seishiki.Caption		:=	'';		//正式名称表示
	LLbl_Keisyou.Caption		:=	'';		//敬称の表示
	LLbl_Hurigana.Caption		:=	'';		//フリガナ表示
	LLbl_Kanryaku.Caption		:=	'';		//簡略名称表示
	LLbl_Rensou.Caption			:=	'';		//連想表示
	LLbl_Post1.Caption			:=	'';		//郵便番号、基番表示
	LLbl_Post2.Caption			:=	'';		//郵便番号、枝番表示
	LLbl_Zyusyo1.Caption		:=	'';		//住所上段表示
	LLbl_Zyusyo2.Caption		:=	'';		//住所下段表示
	LLbl_Tel1.Caption			:=	'';		//電話番号１表示
	LLbl_Tel2.Caption			:=	'';		//電話番号２表示
	LLbl_Fax.Caption			:=	'';		//ＦＡＸ番号表示
	LLbl_Daihyou.Caption		:=	'';		//代表者名表示
end;

//**************************************************************************
//	Proccess  :	ShowModalで表示
//	Parameter :	pSameListPara	TSameListParaクラス
//	Retrun	  :	なし
//**************************************************************************
procedure TJNTCRP004001NotSamef.DoDLG(pSameListPara: TSameListPara);
begin
	m_SameListPara	:= pSameListPara;

    m_SameListPara.Result := SAMELIST_RET_CAN; //右上のxで閉じられたとき、キャンセルと同じ動きをさせたいため、初期値としてはキャンセルにしておく。

	m_pRec			:=	Pointer(m_SameListPara.m_pRec);
	m_DM            :=	m_SameListPara.m_DM;
	m_DB            :=	m_SameListPara.m_DB;
    m_JNTCom        :=	m_SameListPara.m_JNTCom;
    m_JNTMASCom		:=	m_SameListPara.m_JNTMASCom;
    m_JNTSelSys     :=	m_SameListPara.m_JNTSelSys;
    m_pTkSinInfo    := Pointer(m_SameListPara.m_pTkSinInfo);

   	MJSColorChange (TJNTCRP004001NotSamef (Self),
                    m_JNTMASCom.SystemArea.SysColorB,
                    m_JNTMASCom.SystemArea.SysColorD,
                    m_JNTMASCom.SystemArea.SysBaseColorB,
                    m_JNTMASCom.SystemArea.SysBaseColorD,
                    rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	MJSFontResize (TJNTCRP004001NotSamef (Self),Pointer (m_pRec));

  	m_DM.SetDBInfoToQuery(m_DB, MQuery1);	// DBとMQueryの接続

    m_JNTCom.inzForm(Self);

    // ShowModalダイアログとして表示
    ShowModal;
end;

//**************************************************************************
//	Component	:	MBitBtn1 ( TMBitBtn )
//                  新規取込ボタン
//	Event	    :	OnClick
//**************************************************************************
procedure TJNTCRP004001NotSamef.BBtn_SinkiClick(Sender: TObject);
begin
	m_SameListPara.Result	:= SAMELIST_RET_INS;
	ModalResult	:= mrOK;
end;

//**************************************************************************
//	Component	:	BBtn_Uwagaki ( TMBitBtn )
//                  上書取込ボタン
//	Event	    :	OnClick
//**************************************************************************
procedure TJNTCRP004001NotSamef.BBtn_UwagakiClick(Sender: TObject);
var
	post1	:	integer;
	post2	:	integer;
begin
	//上書きデータの取込準備
	post1	:=	JNTSELXStrToInt(LLbl_Post1.Caption);
	post2	:=	JNTSELXStrToInt(LLbl_Post2.Caption);

	//上書きデータの取込
    if (m_pTkSinInfo^.SyncKbn = SWKFORM_TOKUI) then
    begin
        // 得意先登録申請なら得意先変更申請とします。
        m_pTkSinInfo^.SyncKbn := SWKFORM_TOKUI_HENKO;
    end
    else if (m_pTkSinInfo^.SyncKbn = SWKFORM_SIIRE) then
    begin
        // 仕入先登録申請なら仕入先変更申請とします。
        m_pTkSinInfo^.SyncKbn := SWKFORM_SIIRE_HENKO;
    end;

    m_pTkSinInfo^.NCodeFlg		:= True;	m_pTkSinInfo^.NCode 	:= uvSNcode;

    // [申請書の基本情報を上書きする]がONの場合は、登録申請の内容を生かすので何もしない。
    if BChk_Uwagaki.Checked then
    begin
		//
    end
    // [申請書の基本情報を上書きする]がOFFの場合は、マスタデータを生かすので、申請書情報の所定の項目を空にする。
    else
    begin
        m_pTkSinInfo^.NmFlg			:= False;	m_pTkSinInfo^.Nm		:= '';
        m_pTkSinInfo^.NmkFlg		:= False;	m_pTkSinInfo^.Nmk		:= '';
        m_pTkSinInfo^.FkanaFlg		:= False;	m_pTkSinInfo^.Fkana		:= '';
		m_pTkSinInfo^.RensoFlg		:= False;	m_pTkSinInfo^.Renso		:= '';
        m_pTkSinInfo^.PostNo1Flg	:= False;	m_pTkSinInfo^.PostNo1	:= 0;
        m_pTkSinInfo^.PostNo2Flg	:= False;	m_pTkSinInfo^.PostNo2	:= 0;
        m_pTkSinInfo^.Ads1Flg		:= False;	m_pTkSinInfo^.Ads1		:= '';
        m_pTkSinInfo^.Ads2Flg		:= False;	m_pTkSinInfo^.Ads2		:= '';
        m_pTkSinInfo^.Tel1Flg		:= False;	m_pTkSinInfo^.Tel1		:= '';
        m_pTkSinInfo^.Fax1Flg		:= False;	m_pTkSinInfo^.Fax1		:= '';
    end;

	m_SameListPara.Result	:= SAMELIST_RET_UPD;
	ModalResult	:= mrOK;
end;

//**************************************************************************
//	Component	:	MBitBtn3 ( TMBitBtn )
//                  キャンセルボタン
//	Event	    :	OnClick
//**************************************************************************
procedure TJNTCRP004001NotSamef.BBtn_CancelClick(Sender: TObject);
begin
	if m_SameListPara.Result <> SAMELIST_RET_ERR then
    begin
    	m_SameListPara.Result	:= SAMELIST_RET_CAN;
    end;

	ModalResult	:= mrCancel;
end;

//**************************************************************************
//	Component	:	TJNTCRP004001NotSamef ( TForm )
//                  フォーム
//	Event	    :	OnShow
//**************************************************************************
procedure TJNTCRP004001NotSamef.FormShow(Sender: TObject);
begin
	ETxt_Trcode.SetFocus;
end;


//**************************************************************************
//	Component	:	TJNTCRP004001NotSamef ( TForm )
//                  フォーム
//	Event	    :	OnCreate
//**************************************************************************
procedure TJNTCRP004001NotSamef.FormCreate(Sender: TObject);
begin
    // 共通ｴｸｽﾌﾟﾛｰﾗの初期化
    uvExpOpenSW := FALSE;
    if fnJNTExpInit(Self,m_pRec) = 0 then
        uvExpOpenSW := TRUE
    else
		MjsMessageBox(Self,'ｴｸｽﾌﾟﾛｰﾗの初期化に失敗しました。'#13#10#13#10
					+ 'ｴｸｽﾌﾟﾛｰﾗは使用できません。', mjError, mjDefOk);
	//変数の初期化
    uvSNcode	:=	0;
end;


//**************************************************************************
//	Component	:	TJNTCRP004001NotSamef ( TForm )
//                  フォーム
//	Event	    :	Close
//**************************************************************************
procedure TJNTCRP004001NotSamef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    // 共通ｴｸｽﾌﾟﾛｰﾗの開放
    if ( uvExpOpenSW = TRUE ) then
        fnJNTExpFree;

end;

//**********************************************************************
//*		Proccess	:	検索EXP ArrowClick共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ
//*		Date		:	2005/7/11
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//*									XXXXXXXXXXXXXXXXXX
//**********************************************************************
procedure TJNTCRP004001NotSamef.ETxt_TrcodeArrowClick(Sender: TObject);
var
    lvExpSend   : rcJNTExpSend;
    lvExpRecv   : rcJNTExpRecv;
    iExpRtn     : Integer;
    CompName    : String;
	lvHojyoKbn	: String;
begin

    if (m_pTkSinInfo^.SyncKbn = SWKFORM_TOKUI) then
    begin
        // 得意先登録申請なら得意先採用がOFFで仕入先採用がONのもの
        lvHojyoKbn := ' and HojyoKbn1 = 0 and HojyoKbn2 = 1 ';
    end
    else if (m_pTkSinInfo^.SyncKbn = SWKFORM_SIIRE) then
    begin
        // 仕入先登録申請なら得意先採用がONで仕入先採用がOFFのもの
        lvHojyoKbn := ' and HojyoKbn1 = 1 and HojyoKbn2 = 0 ';
    end;

    CompName := TComponent(Sender).Name;

    // ﾊﾟﾗﾒｰﾀ初期設定
    fnJNTExpMakeParam(@lvExpSend);

    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    lvExpSend.pMjsAppRec := m_pRec;                         // MJS共通 Bpl管理構造ﾎﾟｲﾝﾀ
    lvExpSend.pCopDB     := @m_DB;                   		// TDatabaseﾎﾟｲﾝﾀ
    lvExpSend.ColorB     := m_JNTMASCom.SystemArea.SysColorB;
    lvExpSend.ColorD     := m_JNTMASCom.SystemArea.SysColorD;

    // 得意先
    if (Sender = ETxt_Trcode) then
    begin
        lvExpSend.MasterKbn     := 22;                      // ﾏｽﾀ区分  23から22へ
        lvExpSend.ModulKbn      := 0;                       // ﾓｼﾞｭｰﾙ区分
        lvExpSend.PatternNo     := 1;                       // ﾊﾟﾀｰﾝNO


        lvExpSend.WhereStr  	:= 'SumKbn = 0 and SyokuchiKbn = 0 and RDelkbn = 0'
                                 + lvHojyoKbn;
    end;
    // 共通ｴｸｽﾌﾟﾛｰﾗのﾃﾞｰﾀｾｯﾄ
    iExpRtn := fnJNTExpShow(@lvExpSend, @lvExpRecv);
    if iExpRtn <>1 then
        Exit;

    // 中身あり?
    if Length(Trim(lvExpRecv.GCode))>0 then
    begin
        if Sender is TMTxtEdit then
           TMTxtEdit(MJSFindCtrl(Self, CompName)).Text  := lvExpRecv.GCode;


        if Sender = ETxt_Trcode then
            ETxt_Trcode.InputFlag := FALSE;

        // Enter ｷｰのｴﾐｭﾚｲﾄ
        keybd_event(VK_RETURN, 0, 0, 0);
		Abort;
    end;
end;




end.
