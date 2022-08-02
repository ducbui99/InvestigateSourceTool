//************************************************************************
//	System		:	Galileopt
//	Program		:	取引先登録 - 取引先一覧
//	ProgramID	:	JNTCRP004001SameListu
//	Name		:	新保一馬
//	Create		:	2011 / 10 / 11
//	Comment		:
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//
//*************************************************************************
unit JNTCRP004001SameListu;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs,
  dxGrClms, dxDBGrid, dxTL, dxCntner, VCL.StdCtrls, Buttons, MJSBitBtn, MJSCommonu,
  VCL.ExtCtrls, MJSPanel, ComCtrls, MJSStatusBar, MJSCheckBox, MjsDBModuleu,
  JNTCommonu, JNTSelCorpSys, Db, dxmdaset,
  FireDAC.Comp.Client, MJSQuery, JNTMASComu, MjsMsgStdu, MjsDispCtrl, JNTSelGlobal, JNTCRP004001SameListParau;

const
	WM_ONPAINT = WM_APP + 1;			// OnPaint時の処理起動ﾒｯｾｰｼﾞ用

type
  {$I ActionInterface.inc}
  {$I ETYMasterSinseiExgIFI.inc}

  TJNTCRP004001SameListf = class(TForm)
    StatusBar: TMStatusBar;
    PBottom: TMPanel;
    btnUpd: TMBitBtn;
    btnCancel: TMBitBtn;
    btnIns: TMBitBtn;
    PTop: TMPanel;
    PGrid: TMPanel;
    fDspGrid: TdxDBGrid;
    cbSinUpd: TMCheckBox;
    fDspGridGCode: TdxDBGridMaskColumn;
    fDspGridNm: TdxDBGridColumn;
    fDspGridNmk: TdxDBGridColumn;
    fDspGridAds1: TdxDBGridColumn;
    fDspGridAds2: TdxDBGridColumn;
    fDspGridDHyoNm2: TdxDBGridColumn;
    dxToriList: TdxMemData;
    DS: TDataSource;
    dxToriListGCode: TStringField;
    dxToriListNm: TStringField;
    dxToriListNmk: TStringField;
    dxToriListAds1: TStringField;
    dxToriListAds2: TStringField;
    dxToriListDHyoNm2: TStringField;
    qryToriList: TMQuery;
    dxToriListNCode: TFloatField;
    dxToriListFkana: TStringField;
    dxToriListRenso: TStringField;
    dxToriListPostNo1: TIntegerField;
    dxToriListPostNo2: TIntegerField;
    dxToriListTel1: TStringField;
    dxToriListFax1: TStringField;
	procedure WMOnPaint(var Msg: TMessage); message WM_ONPAINT;
    procedure btnCancelClick(Sender: TObject);
    procedure btnUpdClick(Sender: TObject);
    procedure btnInsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private 宣言 }
    m_SameListPara	: TSameListPara;

	m_pRec			: ^TMjsAppRecord;	// BPL管理構造体ﾎﾟｲﾝﾀ
	m_DM            : TMDataModulef;	// ｼｽﾃﾑ共通DBﾓｼﾞｭｰﾙ(DBｾｯｼｮﾝ､ｸｴﾘｰ連結等の管理)
	m_DB            : TFDConnection;		// 会社ﾃﾞｰﾀﾃﾞｰｽｺﾝﾎﾟｰﾈﾝﾄ(DBへのﾛｸﾞｲﾝ､ﾄﾗﾝｻﾞｸｼｮﾝ管理)
    m_JNTCom        : TJNTCommon;       // 会社ｼｽﾃﾑ情報
	m_JNTMASCom		: TJNTMASCom;
    m_JNTSelSys     : TJNTSelCorpSys;
    m_pTkSinInfo    : ^TTokuiSinseiInfo;

    m_MsgRec		: TMjsMsgRec;

    m_Close			: Boolean;
    procedure    CMChildKey     (var Msg: TWMKey); message CM_CHILDKEY;
    function     GetGridData    (): Boolean;
  public
    { Public 宣言 }
	procedure    DoDLG          (pSameListPara: TSameListPara);
  end;

//var
//  JNTCRP004001SameListf: TJNTCRP004001SameListf;

implementation

{$R *.DFM}

//**************************************************************************
//	Proccess  :	キーイベント
//	Parameter : Msg キーメッセージ
//	Retrun	  :	なし
//**************************************************************************
procedure TJNTCRP004001SameListf.CMChildKey(var Msg: TWMKey);
var
	sShift		: TShiftState;
    lvCompoName : string;
    NowCtrl     : TWinControl;
begin

	NowCtrl			:= Screen.ActiveControl;

    // ｱｸﾃｲﾌﾞなｺﾝﾄﾛｰﾙの名称を取得する
    lvCompoName := '';
    if NowCtrl <> nil then
    begin
        lvCompoName := TComponent(NowCtrl).Name;
    end;

	// Shiftｷｰの取得
    sShift := JNTSELXKeyDataToShiftState( Msg.KeyData );

	// ボタン上でEnterは動きません。
    if NowCtrl is TMBitBtn then
    begin
        if Msg.CharCode = VK_RETURN then
        begin
        	Exit;
        end;
    end;

    // ESCは閉じる
    if (Msg.CharCode = VK_ESCAPE) or
       ((Msg.CharCode = VK_F4) and (sShift = [ssAlt])) then
    begin
        ModalResult := mrCancel;
        Abort;
    end;

    // グリッド
	if NowCtrl is TdxDBGrid then
	begin
    	// グリッド上でEnterは動かない
        if Msg.CharCode = VK_RETURN then
        begin
        	Abort;
        end;

        // 次フィールドへ
        if (Msg.CharCode = VK_TAB) and (sShift = []) then
        begin
            MjsNextCtrl(Self);
        	Abort;
        end;

        // 前フィールドへ
        if (Msg.CharCode = VK_TAB) and (sShift = [ssShift]) then
        begin
            MjsPrevCtrl(Self);
        	Abort;
        end;
	end
	// グリッド以外
    else
    begin
        // 次フィールドへ
        if (Msg.CharCode = VK_RETURN)
        or ((Msg.CharCode = VK_TAB) and (sShift = []))
        or (Msg.CharCode = VK_DOWN)
        or (Msg.CharCode = VK_RIGHT) then
        begin
            MjsNextCtrl(Self);
        	Abort;
        end;

        // 前フィールドへ
        if ((Msg.CharCode = VK_TAB) and (sShift = [ssShift]))
        or (Msg.CharCode = VK_LEFT)
        or (Msg.CharCode = VK_UP) then
        begin
            MjsPrevCtrl(Self);
        	Abort;
        end;
    end;

    inherited;
end;

//**************************************************************************
//	Proccess  :	ShowModalで表示
//	Parameter :	pSameListPara	TSameListParaクラス
//	Retrun	  :	なし
//**************************************************************************
procedure TJNTCRP004001SameListf.DoDLG(pSameListPara: TSameListPara);
begin
	m_SameListPara	:= pSameListPara;

    m_SameListPara.Result := SAMELIST_RET_CAN; //右上のxで閉じられたとき、キャンセルと同じ動きをさせたいため、初期値としてはキャンセルにしておく。

	m_pRec			:= Pointer(m_SameListPara.m_pRec);
	m_DM            := m_SameListPara.m_DM;
	m_DB            := m_SameListPara.m_DB;
    m_JNTCom        := m_SameListPara.m_JNTCom;
    m_JNTMASCom		:= m_SameListPara.m_JNTMASCom;
    m_JNTSelSys     := m_SameListPara.m_JNTSelSys;
    m_pTkSinInfo    := Pointer(m_SameListPara.m_pTkSinInfo);

   	MJSColorChange (TJNTCRP004001SameListf (Self),
                    m_JNTMASCom.SystemArea.SysColorB,
                    m_JNTMASCom.SystemArea.SysColorD,
                    m_JNTMASCom.SystemArea.SysBaseColorB,
                    m_JNTMASCom.SystemArea.SysBaseColorD,
                    rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysFocusColor);

	MJSFontResize (TJNTCRP004001SameListf (Self),Pointer (m_pRec));

  	m_DM.SetDBInfoToQuery(m_DB, qryToriList);	// DBとMQueryの接続

    m_JNTCom.inzGrid(fDspGrid);       // ｸﾞﾘｯﾄﾞのｺｰﾄﾞ属性・桁数設定

    // データ表示
    m_Close := GetGridData();

    // ShowModalダイアログとして表示
    ShowModal;
end;

//**************************************************************************
//	Proccess  :	グリッドに表示するデータを取得します。
//	Parameter :	なし
//	Retrun	  :	True 成功、False 失敗
//**************************************************************************
function TJNTCRP004001SameListf.GetGridData(): Boolean;
var
	lvHojyoKbn	: string;
    lvWhere		: string;
begin
	Result := False;

	try
    	try
        	dxToriList.Close;
            dxToriList.Open;
            dxToriList.DisableControls;

            // 登録申請の状態によって検索条件を動的に作成
            if (m_pTkSinInfo^.NmFlg = False) and (m_pTkSinInfo^.Tel1Flg = False) then
            begin
            	// 正式名、電話番号のどちらも入っていない場合は抜けます
                m_SameListPara.Result	:= SAMELIST_RET_NON;
                Exit;
            end
            else if (m_pTkSinInfo^.NmFlg = True) and (m_pTkSinInfo^.Tel1Flg = False) then
            begin
            	// 正式名が入っていて、電話番号が入っていないとき
                lvWhere := ' and Nm = :pNm ';
            end
            else if (m_pTkSinInfo^.NmFlg = False) and (m_pTkSinInfo^.Tel1Flg = True) then
            begin
            	// 正式名が入っていなく、電話番号が入っているとき
                lvWhere := ' and Tel1 = :pTel1 ';
            end
            else
            begin
            	// 正式名、電話番号の両方が入っているとき
                lvWhere := ' and (Nm = :pNm or Tel1 = :pTel1) ';
            end;

            // HojyoKbn1,2の条件を動的に作成
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

        	with qryToriList do
            begin
            	Close;
                SQL.Clear;
                SQL.Add('select '
                				+ '  GCode '
                				+ ' ,Nm '
                				+ ' ,Nmk '
                				+ ' ,Ads1 '
                				+ ' ,Ads2 '
                				+ ' ,DHyoNm2 '
                                //↓上書き基本情報項目
                				+ ' ,NCode '
                				+ ' ,Fkana '
                				+ ' ,Renso '
                				+ ' ,PostNo1 '
                				+ ' ,PostNo2 '
                				+ ' ,Tel1 '
                				+ ' ,Fax1 '
                                //↑上書き基本情報項目
								+ ' from MTOKUI where SumKbn = 0 and SyokuchiKbn = 0 and RDelKbn = 0 '
								+ lvHojyoKbn // HojyoKbnの条件を付加
                                + lvWhere + ' order by GCode');

				// 正式名 か 電話番号が一致しているものを検索します
                if (m_pTkSinInfo^.NmFlg = True) and (m_pTkSinInfo^.Tel1Flg = False) then
                begin
                    // 正式名が入っていて、電話番号が入っていないとき
	                ParamByName('pNm').AsString		:= m_pTkSinInfo^.Nm;
                end
                else if (m_pTkSinInfo^.NmFlg = False) and (m_pTkSinInfo^.Tel1Flg = True) then
                begin
                    // 正式名が入っていなく、電話番号が入っているとき
	                ParamByName('pTel1').AsString	:= m_pTkSinInfo^.Tel1;
                end
                else
                begin
                    // 正式名、電話番号の両方が入っているとき
                    ParamByName('pNm').AsString		:= m_pTkSinInfo^.Nm;
                    ParamByName('pTel1').AsString	:= m_pTkSinInfo^.Tel1;
                end;

                if not Open then
                begin
                	// エラーは抜ける
                    if m_JNTMASCom.m_MsgStd.GetMsgDB( m_MsgRec, qryToriList ) = True then
                    begin
                        MjsMessageBoxEx( Self, m_MsgRec.sMsg, m_MsgRec.sTitle, m_MsgRec.icontype, m_MsgRec.btntype, m_MsgRec.btndef, FALSE );
						m_SameListPara.Result := SAMELIST_RET_ERR;
                    	Exit;
                    end;
                end;

                while not EOF do
                begin
                	// 一致しているものがあれば、表示
                    dxToriList.Append;
                    dxToriListGCode.AsString	:= gfnJNTSELCodeEdit(m_JNTSelSys.GetTkCdZs,m_JNTSelSys.GetTkCdKs,FieldByName('GCode').AsString);	//編集
                    dxToriListNm.AsString		:= FieldByName('Nm').AsString;
                    dxToriListNmk.AsString		:= FieldByName('Nmk').AsString;
                    dxToriListAds1.AsString		:= FieldByName('Ads1').AsString;
                    dxToriListAds2.AsString		:= FieldByName('Ads2').AsString;
                    dxToriListDHyoNm2.AsString	:= FieldByName('DHyoNm2').AsString;

                    dxToriListNCode.AsFloat		:= FieldByName('NCode').AsFloat;
                    dxToriListFkana.AsString	:= FieldByName('Fkana').AsString;
                    dxToriListRenso.AsString	:= FieldByName('Renso').AsString;
                    dxToriListPostNo1.AsInteger	:= FieldByName('PostNo1').AsInteger;
                    dxToriListPostNo2.AsInteger	:= FieldByName('PostNo2').AsInteger;
                    dxToriListTel1.AsString		:= FieldByName('Tel1').AsString;
                    dxToriListFax1.AsString		:= FieldByName('Fax1').AsString;

					dxToriList.Post;
                    Next;
                end;

                if dxToriList.RecordCount <= 0 then
                begin
                	// 一致するものがないときは抜ける
                    m_SameListPara.Result	:= SAMELIST_RET_NON;
                    Exit;
                end;

                dxToriList.First;
            end;
        except

        end;

        Result := True;

    finally
        dxToriList.EnableControls;
    end;
end;

//**************************************************************************
//	Component	:	btnCancel ( TMBitBtn )
//                  キャンセルボタン
//	Event	    :	OnClick
//**************************************************************************
procedure TJNTCRP004001SameListf.btnCancelClick(Sender: TObject);
begin
	if m_SameListPara.Result <> SAMELIST_RET_ERR then
    begin
    	m_SameListPara.Result	:= SAMELIST_RET_CAN;
    end;

	ModalResult	:= mrCancel;
end;

//**************************************************************************
//	Component	:	btnUpd ( TMBitBtn )
//                  上書取込ボタン
//	Event	    :	OnClick
//**************************************************************************
procedure TJNTCRP004001SameListf.btnUpdClick(Sender: TObject);
begin
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

    m_pTkSinInfo^.NCodeFlg		:= True;	m_pTkSinInfo^.NCode 	:= StrToInt64(dxToriListNCode.AsString);

    // [申請書の基本情報を上書きする]がONの場合は、登録申請の内容を生かすので何もしない。
    if cbSinUpd.Checked then
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
//	Component	:	btnIns ( TMBitBtn )
//                  新規取込ボタン
//	Event	    :	OnClick
//**************************************************************************
procedure TJNTCRP004001SameListf.btnInsClick(Sender: TObject);
begin
	m_SameListPara.Result	:= SAMELIST_RET_INS;
	ModalResult	:= mrOK;
end;

//**************************************************************************
//	Component	:	JNTCRP004001SameListf ( TForm )
//                  フォーム
//	Event	    :	OnShow
//**************************************************************************
procedure TJNTCRP004001SameListf.FormShow(Sender: TObject);
begin
	PostMessage(Self.Handle,WM_ONPAINT,0,0);	// OnPaint Post

	fDspGrid.SetFocus;

end;

//**************************************************************************
//	Proccess  :
//	Name	  :
//	Parameter :
//	Retrun	  :
//**************************************************************************
procedure TJNTCRP004001SameListf.WMOnPaint(var Msg: TMessage);
begin
	if not m_Close then
    begin
    	ModalResult	:= mrOK;
    end;
end;


end.
