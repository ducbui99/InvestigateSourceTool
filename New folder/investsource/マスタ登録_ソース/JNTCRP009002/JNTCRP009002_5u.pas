//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：固定変動科目登録
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：高橋 功二(LEAD)
//      作成日      ：2005.01.25
//
//=============================================================================
//  修正履歴
//  <ﾏｰｸ>   <修正者>        <修正日>        <修正内容>
//  <!!!>   高橋 功二   2005.04.08(FRI) 仕様確認後修正予定
//  <001>   高橋 功二   2005.04.08(FRI) FX-STYLE対応
//  <002>   茂木 勇次   2005.07.19(TUE) MjsMessageBox,MjsMessageBoxExの第1引数に"Self"を追加。
//  <003>   飯塚 健介   2005.08.04(THU) 決算確定・権限対応。
//  <004>   高橋 功二   2005.08.19(FRI) JNTCommon,TMjsAppRecordを親から引き継ぐように修正。
//  <KEY>   茂木 勇次   2005.09.17(SAT) VK_ESC,VK_ENDｷｰで子BPLをCLOSEする場合、現状だと正常に
//                                      終了できない(ｱﾄﾞﾚｽ違反が発生)為、一時ｺﾒﾝﾄに。
//  <PRN>   茂木 勇次   2005.09.17(SAT) 印刷機能が実装できていない為、一時印刷ﾎﾞﾀﾝを使用不可に。
//  <PRN>   茂木 勇次   2005.10.06(THU) 印刷機能の実装。
//  <ESC>   加藤(PRIME) 2005.10.20(THU) Escｷｰ動作対応
//  <005>   加藤(PRIME) 2005.11.16(WED) 履歴用ｽﾄｱﾄﾞ呼び出し
//  <006>   加藤(PRIME) 2006.01.30(MON) 印刷を有効にする
//	<007>	加藤(PRIME) 2007.04.02(MON) ﾏｽﾀ同期対応(仮)　★次回ﾘﾘｰｽ時に削除予定
//	<008>	加藤(PRIME) 2007.05.08(TUE)	ﾏｽﾀ同期対応
//	<009>	加藤(PRIME)	2007.05.15(TUE)	ﾏｽﾀ同期 配信ﾀﾞｲｱﾛｸﾞ対応
//	<010>	渡邊(LAB)   2007.07.02(MON) 決算確定の判定は権限に依存させる（子でメッセージを出さない）
//  <011>   鈴木(PRIME) 2007.08.09(THU) 配信ﾀﾞｲｱﾛｸﾞの呼び出し条件の修正
//	<012>	関(PRIME)	2008.02.19(TUE)	ﾏｽﾀ更新履歴対応
//	<013>	大竹 文顕   2008.03.14(FRI) 更新担当者内部ｺｰﾄﾞのｾｯﾄ
//  <DKAI>  難波(Lab)   2008.08.27(WED) 名称に改行が入らないようにする
//  <014>   黒田 祐生   2010.05.21(FRI) MLBplLoader対応(LoadPackageの置換)
//	<015>	黒田 祐生	2012.02.13(MON)	ShiftState対応
//=============================================================================
unit JNTCRP009002_5u;

interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, ComCtrls,
  Grids, DBGrids, VCL.StdCtrls, Buttons, VCL.ExtCtrls, VCL.ImgList, Db, FireDAC.Comp.Client, Menus, Commctrl,
  dxGrClms, dxDBGrid, dxTL, dxCntner, dxmdaset,

  MJSDBGrid, MJSComboBox, MJSFunctionBar, MJSStatusBar, MJSSpeedButton, MJSPanel,
  MJSQuery, MJSPageControl, MJSTab, MJSTreeView,

  MJSCommonu, MjsDBModuleu, MjsDispCtrl, MJSMsgStdu, MjsStrCtrl,
  JNTCommonu{<003>}, JNTMasComu,
  JNTSelCorpSys, JNTExpGlobal,{<PRN>}
  MLBplLoaderU{<014>}
  ,MJSKeyDataState, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, System.ImageList,
  FireDAC.Comp.DataSet	// <015>ADD
  ;

type
	TreeViewRec  = record
			prmNCode 	: Integer;						// 内部コード
			prmCode		: Integer;						// 外部コード
			prmName		: String;						// 簡略名称
			prmSumKbn	: Integer;						// 実在/合計区分
			prmAddKbn	: Integer;						// 加算区分
end;

type
{$include ActionInterface.inc}
{$include JNTSelPrtIF.inc}                  // <PRN>
{$include JNTCRPSyncMasterH.inc}     		// <007> ﾏｽﾀ同期共通ﾍｯﾀﾞ部
{$include JNTSyncMasterIFH.inc}   			// <009> 配信ﾀﾞｲｱﾛｸﾞ共通ﾍｯﾀﾞ部

  // <PRN>
  TPrintAppEntry = function
  (AOwner       :   TComponent;
   pRec		    :   Pointer;
   Mode		    :   Integer;
   PrtParam	    :   rcPrtParam;
   var ArHdl    :   array of Pointer): Integer;

  TJNTCRP009002_5f = class(TForm)
	PTool: TMPanel;
	BClose: TMSpeedButton;
    BPrint_: TMSpeedButton;
	BChange: TMSpeedButton;
	SStatus: TMStatusBar;
	DataSource1: TDataSource;
	MQuery1: TMQuery;
	ImageList1: TImageList;
	Database1: TFDConnection;
	MPanel1: TMPanel;
	dxMemData1: TdxMemData;
	dxMemData1GCode: TIntegerField;
	dxMemData1RenChar: TStringField;
	dxMemData1LongName: TStringField;
	dxMemData1SimpleName: TStringField;
	dxMemData1DecoKbnCode: TIntegerField;
	dxMemData1DecoKbnName: TStringField;
	Splitter1: TSplitter;
    VKasantaikei: TMTreeView;
	ListMemDeco: TdxMemData;
	ListMemDecoiCode: TIntegerField;
	ListMemDecoiName: TStringField;
	dxMemData1DummyDeco: TSmallintField;
	MPanel2: TMPanel;
	ListMemKmk: TdxMemData;
	ListMemKmkiCode: TSmallintField;
	ListMemKmkiName: TStringField;
	dxMemData1DummyKmk: TSmallintField;
	dxMemData1KmkKbnCode: TSmallintField;
	dxMemData1KmkKbnName: TStringField;
	dxMemData2: TdxMemData;
	dxMemData2GCode: TIntegerField;
	dxMemData2RenChar: TStringField;
	dxMemData2LongName: TStringField;
	dxMemData2SimpleName: TStringField;
	dxMemData2DecoKbnCode: TIntegerField;
	dxMemData2DecoKbnName: TStringField;
	dxMemData2KmkKbnCode: TIntegerField;
	dxMemData2KmkKbnName: TStringField;
	DKotei: TdxDBGrid;
	DKoteiRecId: TdxDBGridColumn;
	DKoteiGCode: TdxDBGridMaskColumn;
	DKoteiRenChar: TdxDBGridMaskColumn;
	DKoteiLongName: TdxDBGridMaskColumn;
	DKoteiSimpleName: TdxDBGridMaskColumn;
	DKoteiDummyDeco: TdxDBGridMaskColumn;
	DKoteiDecoKbnCode: TdxDBGridLookupColumn;
	DKoteiDecoKbnName: TdxDBGridMaskColumn;
	DKoteiDummyKmk: TdxDBGridMaskColumn;
	DKoteiKmkKbnCode: TdxDBGridLookupColumn;
	DKoteiKmkKbnName: TdxDBGridMaskColumn;
    SPMsHist: TFDStoredProc;
    SPMsHistParent: TFDStoredProc;

	procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
	procedure FormCreate(Sender: TObject);
	procedure EnterEvent(Sender: TObject);
	procedure FormActivate(Sender: TObject);

	procedure GetData();
	procedure DataDsp(Query : TMQuery; iFlg : Integer);
	procedure TaikeiSelectDsp(NodeDsp : TTreeNode);
	function  NodeCreate(cNode : TTreeNode; Query : TMQuery; iSun : Integer): TTreeNode;
	procedure TaikeiOyaCreate(NodeOya : TTreeNode);
	procedure TaikeiKoCreate(QueryTree : TMQuery; NodeOya : TTreeNode);
	procedure WriteSKMKMA();
	procedure BCloseClick(Sender: TObject);
	procedure BPrint_Click(Sender: TObject);
	procedure BChangeClick(Sender: TObject);
	procedure VKasantaikeiChange(Sender: TObject; Node: TTreeNode);
	procedure dxMemData1BeforePost(DataSet: TDataSet);
	procedure dxMemData1AfterPost(DataSet: TDataSet);
	procedure DataSource1StateChange(Sender: TObject);
	procedure DKoteiBeforeChangeColumn(Sender: TObject;
	  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
	  NewColumn: Integer; var CanChange: Boolean);
	procedure LookUpDataSet();
	procedure DKoteiBeforeChangeNode(Sender: TObject; Node,
	  NewNode: TdxTreeListNode; var CanChange: Boolean);
	procedure VKasantaikeiDragOver(Sender, Source: TObject; X, Y: Integer;
	  State: TDragState; var Accept: Boolean);
	procedure DKoteiMouseDown(Sender: TObject; Button: TMouseButton;
	  Shift: TShiftState; X, Y: Integer);
	procedure FormShow(Sender: TObject);
	procedure FormHide(Sender: TObject);
	procedure DKoteiExit(Sender: TObject);
	procedure FormDestroy(Sender: TObject);
	procedure ErrorMessageDsp(DmQuery: TMQuery);
	procedure DisplayControl(Select: Integer);
	procedure DKoteiKeyDown(Sender: TObject; var Key: Word;
	  Shift: TShiftState);

  private
	{ Private 宣言 }

    // ----- <BPL> -------------------------------------------------------------
    m_CmpList	            :   TList;
    BPrint 	                :   TMSpeedButton;              // 印刷
    MComboBox               :   TMComboBox;                 // 第1ｺﾝﾎﾞ
    //--------------------------------------------------------------------------

	m_pMyAppRecord          :   ^TMjsAppRecord;
    m_Base_pRec	            :   ^TMjsAppRecord;             // <004>
	dbCorp_Select           :   TFDConnection;
	m_AcControl	            :   TWinControl;
	MDataModule	            :   TMDataModulef;
	ComArea		            :   TJNTMASCom;
	MjsMsgRec	            :   TMJSMsgRec;
	m_fUpdateRecord         :   Integer;				    // Post判定ﾌﾗｸﾞ
	m_fAccessTab            :   Boolean;
	m_fEnd		            :   Integer;
	m_iGCodeSave            :   Integer;
	m_iRekiKbn	            :   Integer;
	giReferFlag	            :   Integer;				    // 参照ﾌﾗｸﾞ
    m_Zoom                  :   Integer;
    AOwner                  :   TComponent;                 // <002>
    m_cJNTArea              :   TJNTCommon;                 // <003>
    m_IsUpdate              :   Boolean;                    // <003>
    uvSelSys                :   TJNTSelCorpSys; 	        // <PRN> 会社ｼｽﾃﾑ情報
    uvHani                  :   TJNTHani;		            // <PRN> 範囲ﾀﾞｲｱﾛｸﾞ用ﾊﾟﾗﾒｰﾀ
    PrintAppEntry           :	TPrintAppEntry;             // <PRN>
    ArrHdl                  :   Array[0..100] of Pointer;	// <PRN> Lのﾌｫｰﾑﾎﾟｲﾝﾀの格納配列(Lに渡す)
    PrtParam		        :	rcPrtParam;                 // <PRN>
    DmqPrint                :   TMQuery;                    // <PRN> 印刷用ｸｴﾘｰ
    m_SyncMaster        	: 	TSyncMaster;	   			// <007> ﾏｽﾀ同期ｸﾗｽ

    procedure fnGetGrants();                                // <003>

// <008> ADD start
	procedure ExecParentDBTran(iTrnKind: Integer);
// <008> ADD end

	procedure CallSyncDlg();								// <009>
	procedure SessionPractice(iSyori: Integer);				// <012> ｾｯｼｮﾝ管理ｽﾄｱﾄﾞ呼び出し
	function  fnDelCRLF(sData: String): String;				// <DKAI> 改行削除

  public
	{ Public 宣言 }
	constructor CreateForm(pRec: Pointer);
	procedure	CMChildKey(var Msg: TWMKey); message CM_CHILDKEY;
  end;

var
  JNTCRP009002_5f: TJNTCRP009002_5f;

const
	// ｶﾗﾑﾃﾞﾌｧｲﾝ
	COL_GCODE		= 0;
	COL_REN			= 1;
	COL_L_NAME		= 2;
	COL_S_NAME		= 3;
	COL_DECO_KBN_CD	= 4;
	COL_DECO_KBN_NM	= 5;
	COL_KMK_KBN_CD	= 6;
	COL_KMK_KBN_NM	= 7;

	// ﾂﾘｰｱｲｺﾝﾃﾞﾌｧｲﾝ
	IC_GPCLOSE		= 0;
	IC_GPOPEN		= 1;
	IC_GMCLOSE		= 2;
	IC_GMOPEN		= 3;

	IC_JP			= 4;
	IC_JM			= 5;
	IC_JPCHK		= 6;
	IC_JMCHK		= 7;

	// ﾃｰﾌﾞﾙ番号
	TBL_SKMKMA		= 104;

	// 参照ﾌﾗｸﾞ時に使用
	NORMAL			=	1;		// 通常処理
	BASICONLY		=	2;		// 基本のみ設定可能(詳細ﾎﾞﾀﾝ使用不可)
	REFER			=	3;		// 参照

	sDeco	: array[0..6] of String = ('なし','【】','（）','〔〕','＜＞','(( ))','｛｝');
	sKmk	: array[0..1] of String = ('なし','あり');

// <007> ADD start
	// ﾏｽﾀ同期ｸﾗｽの採用ﾌﾗｸﾞ
	GRP_SYNC_CHILD			= 1;		// ｸﾞﾙｰﾌﾟ会計採用あり 子会社
	GRP_SYNC_PARENT			= 0;		// ｸﾞﾙｰﾌﾟ会計採用あり 親会社
	GRP_SYNC_NOTUSE			= -1;		// ｸﾞﾙｰﾌﾟ会計採用なし

// <008> ADD start
	// ｸﾞﾙｰﾌﾟ会計採用時の親会社DBへの指示
	GRP_PARENTDB_BEGINTRAN	= 0;		// ﾄﾗﾝｻﾞｸｼｮﾝ開始
	GRP_PARENTDB_ROLLBACK	= 1;		// ﾛｰﾙﾊﾞｯｸ
	GRP_PARENTDB_COMMIT		= 2;		// ｺﾐｯﾄ

// <008> ADD end

	// ﾒｯｾｰｼﾞ
	MSGCAP_GRP				= 'グループ会計';
										// ★暫定対応
	MSG_GRP_CHILD_READONLY	= 'グループ会計の子会社として採用されています。'#13#10 +
							'体系のみの修正が可能です。';
										// <008> ADD
    MSG_GRP_RELATIONALL_ERR	= '子会社への関連付けに失敗しました。';

// <007> ADD end

	// -----<012> Add-St-----
	C_ST_PROCESS	= 0;				// 設定
	C_ED_PROCESS	= 1;				// 開放
	// -----<012> Add-Ed-----

implementation

{$R *.DFM}
{$Include JNTCRPSyncMasterB.inc}   			// <007> ﾏｽﾀ同期共通実装部
{$include JNTSyncMasterIFB.inc}   			// <009> 配信ﾀﾞｲｱﾛｸﾞ共通実装部

//-----------------------------------------------------------------------------
//  CreateForm
//      ｺﾝｽﾄﾗｸﾀ
//-----------------------------------------------------------------------------
constructor TJNTCRP009002_5f.CreateForm(pRec: Pointer);
var
    DmqData : TMQuery;                      // <005>
//    sMessage: String;                       // <005> <007> DEL
begin

	m_pMyAppRecord  :=  Pointer( TAppParam( pRec^ ).pRecord );              // 構造体のSave
	MDataModule     :=  TMDataModulef(m_pMyAppRecord^.m_pDBModule^);		// DBModuleを取得
	ComArea         :=  TJNTMASCom(m_pMyAppRecord^.m_pSystemArea^);			// 会社Noを共通ﾒﾓﾘから取得

    // JNTCommonの構築
//    m_cJNTArea      := TJNTCommon.Create(Self);                           // <003><004>
//    m_cJNTArea.Init(m_pMyAppRecord);                                      // <003><004>

    // 親BPLのｵﾌﾞｼﾞｪｸﾄ取得
    m_CmpList       :=  TList(TAppParam( pRec^ ).pActionParam^);
    AOwner          :=  TForm(m_pMyAppRecord.m_pOwnerForm^);                // <002>

	// DBOpen
	dbCorp_Select := MDataModule.COPDBOpen(1, ComArea.m_iCopNo);
	if ( dbCorp_Select = nil ) then
	begin
		ComArea.m_MsgStd.GetMsg(MjsMsgRec,10000,MDataModule.GetStatus);
		MjsMessageBoxEx(AOwner, // <002>
                        MjsMsgRec.sMsg,
						MjsMsgRec.sTitle,
						MjsMsgRec.icontype,
						MjsMsgRec.btntype,
						MjsMsgRec.btndef,
						MjsMsgRec.LogType);
		raise Exception.Create('');
	end;

// <005>↓
	DmqData := TMQuery.Create( Self );		// MQueryの構築
                                            // DBとMQueryの接続
	MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqData );

	DmqData.Close;
	DmqData.SQL.Clear;
                                            // 履歴用ｽﾄｱﾄﾞ呼び出し
	DmqData.SQL.Add('CALL MP200010(0,:TANCD)');
                                            // 担当者ｺｰﾄﾞ
	DmqData.ParamByName('TANCD'  ).AsFloat := rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

	if ( DmqData.ExecSQL = FALSE ) then
	begin
// <007> MOD start
//		sMessage :=	IntToStr(ComArea.m_MsgStd.GetDBCode(DmqData));
//		showmessage('ｴﾗｰｺｰﾄﾞ ' + sMessage + '　ｽﾄｱﾄﾞﾌﾟﾛｼｰｼﾞｬでｴﾗｰになりましたが気にせず進んで下さい。');
		ErrorMessageDsp(DmqData);			// DBｴﾗｰﾒｯｾｰｼﾞ表示
// <007> MOD end
	end;

	DmqData.Close;
	DmqData.Free;

// <005>↑

// <007> ADD start
    // SyncMasterｸﾗｽの生成
    try
        m_SyncMaster := TSyncMaster.Create(Self, m_pMyAppRecord, m_cJNTArea, dbCorp_Select);
        m_SyncMaster.InitData();
	    m_SyncMaster.m_AOwner := TForm(m_pMyAppRecord^.m_pOwnerForm^);
// <008> ADD start
											// 子会社の場合
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
		begin								// 同期ｽﾄｱﾄﾞ呼出
			MDataModule.BeginTran(dbCorp_Select);
											// SKmkMA
   			if not m_SyncMaster.fnCall_SYNC(JNTSYNC_SKMKMA) then
			begin
				MDataModule.RollBack(dbCorp_Select);
                Abort;
			end;

			MDataModule.Commit(dbCorp_Select);
        end;
// <008> ADD end
    except
        raise;
    end;
// <007> ADD end

// ↓↓↓<PRN>

    // 会社別ｼｽﾃﾑ情報の初期化
    try
        uvSelSys := nil;
	    uvSelSys := TJNTSelCorpSys.Create(Self);
        if ( uvSelSys = nil ) then
            Abort;

    	if ( uvSelSys.CreateSysMsg(m_pMyAppRecord) <> 0 ) then
            Abort;
    except
		MjsMessageBox(AOwner,'ｼｽﾃﾑ情報の初期化に失敗です。', mjError, mjDefOk);
        raise;
    end;

    // 会社別ｼｽﾃﾑ情報読み込み
    try
        if ( uvSelSys.CreateSysInfo(dbCorp_Select) <> 0 ) then
            Abort;
    except
        uvSelSys.MsgDlg(1001,20);
        raise;
    end;
// ↑↑↑<PRN>

    inherited Create( AOwner );                         // <002>
// <002>	inherited Create(TForm(m_pMyAppRecord.m_pOwnerForm^));

end;

//-----------------------------------------------------------------------------
// CMChildKey()
//	< ｷｰの制御 >
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.CMChildKey(var Msg: TWMKey);
var
	sShift	:	TShiftState;
	bCtrl	:	Boolean;
//    iRet    :   Integer;
begin

    // Shiftｷｰの取得
	sShift  :=  MJSKeyDataToShiftState(Msg.KeyData);	// <015>MOD

    // TdxDBGrid時の補足
	if ( m_AcControl = DKotei ) then
	begin
		bCtrl   :=  MjsSystemKeyChk(sShift);

        // VK8ｷｰの補足
		if ( Msg.CharCode = VK_F8 ) then
		begin
			if ( DKotei.FocusedColumn = COL_S_NAME ) then
			begin
				dxMemData1.Edit;
				dxMemData1SimpleName.AsString   :=  MjsCopy(dxMemData1LongName.AsString, 14);
			end;
		end;

        // ESCｷｰの補足
		if ( Msg.CharCode = VK_ESCAPE ) then
		begin
            // ﾃﾞｰﾀ編集中
			if ( dxMemData1.State in [dsInsert,dsEdit] ) then
			begin
			end
			else
			begin
(*
				iRet := MjsMessageBoxEX(AOwner, // <002>
                                        '処理を終了します。よろしいですか？',
                                        '終了',
                                        mjQuestion,
                                        mjYesNo,
                                        mjDefYes
                                       );
				if ( iRet <> mrYes ) then
				begin
					Abort;
					Exit;
				end
				else
				begin
					Close;
					Exit;
				end;
*) //<KEY>
                // <ESC>↓
                // 第1指示ｺﾝﾎﾞへﾌｫｰｶｽを移動
     			m_ACControl :=  MComboBox;
       			m_ACControl.SetFocus;
                MComboBox.DroppedDown :=  TRUE;
           		Abort;
                // <ESC>↑
			end;
		end;

        // END + CONTROLｷｰの補足
		if ( Msg.CharCode = VK_END ) and ( bCtrl = TRUE ) then Exit;

        // HOME + CONTROLｷｰの補足
		if ( Msg.CharCode = VK_HOME ) and ( bCtrl = TRUE ) then Exit;

        // ENDｷｰの補足
		if ( Msg.CharCode = VK_END ) then
		begin
			if ( DKotei.FocusedColumn = COL_GCODE ) then
			begin
(*
				iRet := MjsMessageBoxEX(AOwner, // <002>
                                        '処理を終了します。よろしいですか？',
                                        '終了',
                                        mjQuestion,
                                        mjYesNo,
                                        mjDefYes
                                       );
				if ( iRet <> mrYes ) then
				begin
					Abort;
					Exit;
				end
				else
				begin
                    // ﾃﾞｰﾀ編集中
					if ( dxMemData1.State in [dsInsert,dsEdit] ) then
						dxMemData1.Post;
					Close;
					Exit;
				end;

*) //<KEY>                
			end;

			if ( DKotei.FocusedColumn <> COL_KMK_KBN_CD ) then
			begin
				DKotei.FocusedColumn := COL_KMK_KBN_CD;
				Abort;
				Exit;
			end
			else
				Abort;
		end;

        // HOMEｷｰの補足
		if ( Msg.CharCode = VK_HOME ) then
		begin
			if ( DKotei.FocusedColumn <> COL_GCODE ) then
			begin
				DKotei.FocusedColumn := COL_GCODE;
				Abort;
				Exit;
			end
			else
			begin
				Abort;
				Exit;
			end;
		end;

        // LEFTｷｰの補足
		if ( Msg.CharCode = VK_LEFT ) then
		begin
			if ( dxMemData1.RecNo     = 1         ) and
               ( DKotei.FocusedColumn = COL_GCODE ) then
			begin
				Beep;
				Abort;
			end;
		end;

        // Shift + TABｷｰの補足
		if ( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ) then
		begin
			if (( dxMemData1.RecNo = 0 ) and ( DKotei.FocusedColumn = COL_GCODE )) or
               (( dxMemData1.RecNo = 1 ) and ( DKotei.FocusedColumn = COL_GCODE )) then
			begin
	  			MjsDispCtrl.MjsSetFocus(Self, 'VKasantaikei');
				Abort;
			end;
		end;
		Exit;
	end;

	// TMTreeViewの補足
	if ( m_AcControl = VKasantaikei ) then
	begin
        // ENTER/TABｷｰの補足
		if ( Msg.CharCode = VK_RETURN ) or ( Msg.CharCode = VK_TAB ) then
		begin
			MjsDispCtrl.MjsSetFocus(Self, 'DKotei');
            // ｺｰﾄﾞｶﾗﾑに初期ﾌｫｰｶｽ
			DKotei.FocusedColumn := COL_GCODE;
			Abort;
			Exit;
		end;

        // Shift + TABｷｰの補足
		if ( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ) then
		begin
  			MjsDispCtrl.MjsSetFocus(Self, 'DYPL');
  			DKotei.FocusedColumn := COL_GCODE;
			Abort;
		end;
	end;

    // TABｷｰの補足
	if ( Msg.CharCode = VK_TAB ) and ( sShift = [] ) then
		SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, TRUE);

    // Shift + TABｷｰの補足
	if ( Msg.CharCode = VK_TAB ) and ( sShift = [ssShift] ) then
		SelectNext(Screen.ActiveControl, GetKeyState(VK_SHIFT) >= 0, FALSE);

	inherited;
    
end;

//-----------------------------------------------------------------------------
// FormCreate()
//	< ﾌｫｰﾑ作成 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.FormCreate(Sender: TObject);
var
    iRet            :   Integer;        // <PRN>
    lvHandle        :   THandle;        // <PRN>
    iLoop           :   Integer;        // <PRN>
begin
	// -----<012> Add-St-----
	SPMsHist.Connection	:= dbCorp_Select;
	//SPMsHist.SessionName	:= dbCorp_Select.SessionName;

										// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
		SPMsHistParent.Connection	:= m_SyncMaster.m_cPDBSelect;
		//SPMsHistParent.SessionName	:= m_SyncMaster.m_cPDBSelect.SessionName;
	end;
	// -----<012> Add-Ed-----

    // 親BPLにあるﾎﾞﾀﾝのﾎﾟｲﾝﾀを取得 ----- <BPL> --------------------------------
    BPrint 	    := TMSpeedButton( m_CmpList.Items[0]^ );     // 印刷
    MComboBox   := TMComboBox   ( m_CmpList.Items[6]^ );     // 第1ｺﾝﾎﾞ
// <ESC>↓
//    m_cJNTArea  := TJNTCommon   ( m_CmpList.Items[7]^ );     // <004>
//    m_Base_pRec := Pointer      ( m_CmpList.Items[8]^ );     // <004>
    m_cJNTArea  := TJNTCommon   ( m_CmpList.Items[8]^ );     // <004>
    m_Base_pRec := Pointer      ( m_CmpList.Items[9]^ );     // <004>
// <ESC>↑

    BPrint.OnClick      := BPrint_Click;
    //--------------------------------------------------------------------------

	m_fAccessTab    :=  FALSE;
	Parent          :=  TPanel(m_pMyAppRecord^.m_pOwnerPanel^); // 親ﾊﾟﾈﾙをParent
	Align           :=  alClient;								// 全領域を作成

    // <PRN>ArrHdlの初期化。
    for iLoop := 0 to 100 do
        ArrHdl[iLoop] := nil;

	MjsColorChange(	TJNTCRP009002_5f ( Self ),
					TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysColorB,
					TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysColorD,
					TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysBaseColorB,
					TJNTMASCom ( m_pMyAppRecord^.m_pSystemArea^ ).SystemArea.SysBaseColorD,
					rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysFocusColor	);

	m_Zoom      :=  MjsFontResize(TJNTCRP009002_5f( Self )	,Pointer(m_pMyAppRecord));

	MDataModule.SetDBInfoToQuery(dbCorp_Select, MQuery1);

	m_iRekiKbn  :=  0;

	with MQuery1 do
	begin
		Close();
		SQL.Clear();
		SQL.Add('SELECT YearKbn FROM DTMAIN');
		Open();

		if ( EOF = FALSE ) then
			m_iRekiKbn := GetFld('YearKbn').AsInteger;
	end;

	GetData();										// ﾃﾞｰﾀ表示

	m_AcControl     :=  DKotei;						// 初期ﾌｫｰｶｽ 設定
	m_fAccessTab    :=  TRUE;
	m_fEnd          :=  0;							// 終了ﾌﾗｸﾞ初期化
	m_iGCodeSave    :=  0;						   	// 外部ｺｰﾄﾞｾｰﾌﾞ変数初期化
//	giReferFlag		:=	NORMAL;						// 参照ﾌﾗｸﾞ初期化
    fnGetGrants();                                  // <003>

	DisplayControl(giReferFlag);

// ↓↓↓<PRN>

    // MQueryの構築<PRN>
    DmqPrint      :=  TMQuery.Create (self);
    // DBとMQueryの接続<PRN>
    MDataModule.SetDBInfoToQuery( dbCorp_Select, DmqPrint );

{ ﾛｰﾄﾞﾊﾟｯｹｰｼﾞ処理 <PRN>}

	try
	 // lvHandle    :=  LoadPackage(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP009002L.BPL');       //<014>DEL
        lvHandle    :=  LoadPackageHelper(rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).SysRoot + '\JNT\PRG\JNTCRP009002L.BPL'); //<014>ADD

        if ( lvHandle = 0 ) then
            Abort;
	except
	 // MjsMessageBox(Self, 'JNTCRP009002LのLoadPackageに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);        //<014>DEL
        MjsMessageBox(Self, 'JNTCRP009002LのLoadPackageHelperに失敗しました。' + #13 + '処理終了します。' , mjError, mjDefOk);  //<014>ADD
		Exit;
	end;

    // Export関数ｱﾄﾞﾚｽの取得
    PrintAppEntry := GetProcAddress(lvHandle,'PrintAppEntry');

    if ( @PrintAppEntry = nil ) then
    begin
	    MjsMessageBox(AOwner, 'PrintAppEntry関数ｱﾄﾞﾚｽの取得に失敗しました。', mjError, mjDefOk);
     // UnloadPackage( lvHandle );          // <014>DEL
        UnloadPackageHelper( lvHandle );    // <014>ADD
    end;

    { 印刷用ﾓｼﾞｭｰﾙを生成 }
    try
        with PrtParam do
		begin
            Para		    :=  uvHani;
			TargetQry	    :=  nil;
            TargetMD        :=  nil;
			CorpSys		    :=  uvSelSys;
            JNTArea         :=  m_cJNTArea;
            // *** 汎用変数 *** //
            TargetParam	    :=  nil;
	    	TargetStr	    :=  '';
    		TargetInt	    :=  0;
            // *** 汎用変数 *** //
            iAPP_HDL_REC    :=  100;
		end;

		iRet := PrintAppEntry(AOwner,m_Base_pRec,0,PrtParam,ArrHdl);
		if ( iRet = 0 ) then
			Abort;
	except
		MjsMessageBox(Self,'印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙの作成に失敗しました。'#13#10#13#10
				 + '印刷ﾃﾞｰﾀﾓｼﾞｭｰﾙは使用できません。', mjError, mjDefOk);
	end;

    gfnHaniInit2(AOwner,
                 m_Base_pRec,
                 MDataModule,
                 ComArea,
                 dbCorp_Select,
                 uvHani,
                 uvSelSys);

// ↑↑↑<PRN>

end;

//-----------------------------------------------------------------------------
// FormCloseQuery()
//	< ﾌｫｰﾑ終了前処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : CanClose  :   Boolean
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
//var
//	iRet :	Integer;
begin
{	if dxMemData1.State in [dsInsert,dsEdit] then	// ﾃﾞｰﾀ編集中？
  	begin
		iRet := MjsMessageBoxEX(AOwner, // <002>
                                '科目を編集中です。変更内容を破棄しますか？',
                                '登録',
                                mjQuestion,
                                mjYesNoCancel,
                                mjDefYes
                               );
		if iRet <> mrYes then
		begin
			SetData(BS_PAGE);
		end
		else if iRet = mrCancel then
		begin
			CanClose := FALSE;
			exit;
		end;
	end;
}

	if ( uvHani.mjspre.IsPreView = TRUE ) then
   	begin
		ComArea.m_MsgStd.GetMsg( MjsMsgRec, 10040,2);
   		MjsMessageBoxEx(AOwner, // <002>
                        MjsMsgRec.sMsg,
                        MjsMsgRec.sTitle,
                        MjsMsgRec.icontype,
                        MjsMsgRec.btntype,
                        MjsMsgRec.btndef,
                        MJsMsgRec.LogType
                       );
	   	CanClose := FALSE;
	end
	else
	begin
		m_fEnd      :=  1;
		CanClose    :=  TRUE;
	end;
end;

//-----------------------------------------------------------------------------
// FormClose()
//	< ﾌｫｰﾑ終了処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Action    :   TCloseActionｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.FormClose(Sender: TObject; var Action: TCloseAction);
var
	wkParam :	TAppParam;
begin

// <009> ADD start ﾏｽﾀ同期一括配信ﾀﾞｲｱﾛｸﾞ呼出
											// ｸﾞﾙｰﾌﾟ会計採用あり
    if m_SyncMaster.m_flgGrpCorp <> GRP_SYNC_NOTUSE then
    begin
// <011> MOD start
//		if (giReferFlag <> REFER) and (m_SyncMaster.m_CEComKbn5 = 0) then
       	if ((m_cJNTArea.IsAppend) or        // 追加権限あり
           (m_cJNTArea.IsModify) or         // 修正権限あり
           (m_cJNTArea.IsDelete)) and       // 削除権限あり
           (m_SyncMaster.m_CEComKbn5 = 0) and
           (m_SyncMaster.m_PEComKbn5 = 0) then	// 表示のみでなくて翌期更新済みでもない場合
// <011> MOD end
        begin
			CallSyncDlg();				   	// 配信ﾀﾞｲｱﾛｸﾞ呼出
        end;
    end;
// <009> ADD end

    MQuery1.Close;

    // 印刷用ｸｴﾘｰの開放<PRN>
    DmqPrint.Close();
    DmqPrint.Free();

    // 販売ｼｽﾃﾑ情報の開放   // <PRN>
    if ( uvSelSys <> nil ) then
    	uvSelSys.Free();

    m_SyncMaster.fnSyncTerm();				// <007> ADD ｽﾄｱﾄﾞ終了処理呼出

	MDataModule.COPDBClose(dbCorp_Select);

    // JNTCommonの解放 <003>
//    m_cJNTArea.Free(); <004>

// <007> ADD start
											// 自社が子会社だった場合
    if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
    begin									// 親会社DBのClose
        MDataModule.COPDBClose(m_SyncMaster.m_cPDBSelect);
    end;
// <007> ADD end

	m_pMyAppRecord^.m_iDelete := 1;
	wkParam.iAction			  := ACTID_FORMCLOSEEND;			// 呼び出し区分 設定
	wkParam.pRecord			  := Pointer(m_pMyAppRecord);		// 管理構造体ﾎﾟｲﾝﾀ設定
	wkParam.pActionParam	  := nil;							// 予備ﾎﾟｲﾝﾀ 設定

	TMjsAppRecord(m_pMyAppRecord^).m_pOwnerEntry(@wkParam);		// 親を呼び出す!!

	Action := caFree;
    
end;

//-----------------------------------------------------------------------------
// FormActivate()
//	< ﾌｫｰﾑｱｸﾃｨﾌﾞ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure	TJNTCRP009002_5f.FormActivate(Sender: TObject);
var
	AppPara : TAppParam;
begin

	AppPara.iAction         :=  ACTID_ACTIVEEND;
	AppPara.pRecord         :=  Pointer( m_pMyAppRecord );
	AppPara.pActionParam    :=  nil;

	TMjsAppRecord( m_pMyAppRecord^ ).m_pOwnerEntry( @AppPara );

end;

//-----------------------------------------------------------------------------
// FormShow()
//	< ﾌｫｰﾑ表示処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.FormShow(Sender: TObject);
begin

	JNTMASSetCaption( m_pMyAppRecord );
	MJSBtnVisible( TJNTCRP009002_5f(Self), TRUE );

	if ( uvHani.mjspre.IsPreview ) then
		    uvHani.mjspre.Show
	else    m_AcControl.SetFocus;

end;

//-----------------------------------------------------------------------------
// FormHide()
//	< ﾌｫｰﾑ非表示処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.FormHide(Sender: TObject);
begin

	MJSBtnVisible( TJNTCRP009002_5f(Self), FALSE );

	if ( uvHani.mjspre.IsPreView ) then
		uvHani.mjspre.Hide;

end;

//-----------------------------------------------------------------------------
// FormDestroy()
//	< ﾌｫｰﾑ破棄処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.FormDestroy(Sender: TObject);
begin

	// 終了処理<PRN>
	gfnHaniTerm(uvHani);

    // <007> ADD start
    if (m_SyncMaster <> nil) then
	begin
		m_SyncMaster.Free();				// ﾏｽﾀ同期ｸﾗｽ破棄
	end;
    // <007> ADD end

    // <PRN>
    with PrtParam do
	begin
        Para		:=  uvHani;
		TargetQry   :=  nil;
        TargetMD    :=  nil;
		CorpSys		:=  uvSelSys;
        JNTArea     :=  nil;
	end;

    // 開放<PRN>
    PrintAppEntry(nil,nil,3,PrtParam,ArrHdl);
    
end;

//-----------------------------------------------------------------------------
// GetData()
//	< ﾃﾞｰﾀ読込処理 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.GetData();
var
	MyTreeNode1 :   TTreeNode;
	stWorkRec1	:   ^TreeViewRec;
begin

	m_fUpdateRecord :=  0;

    // 既存のﾉｰﾄﾞを削除する
	VKasantaikei.Items.Clear;
	New (stWorkRec1);

    // 一番上の階層はSumCode=0で加算体系ﾏｽﾀに登録されている
	stWorkRec1^.prmNCode    :=  0;
	stWorkRec1^.prmCode     :=  0;
	stWorkRec1^.prmName     :=  '固定変動加算体系';
	stWorkRec1^.prmSumKbn   :=  9;
	stWorkRec1^.prmAddKbn   :=  9;

    // ﾙｰﾄﾉｰﾄﾞを追加する
	MyTreeNode1                 :=  VKasantaikei.Items.AddChildObject(nil, '固定変動加算体系', stWorkRec1);
	MyTreeNode1.ImageIndex      :=  0;
	MyTreeNode1.SelectedIndex   :=  1;

    // LookUp用ﾘｽﾄﾃﾞｰﾀｾｯﾄ
	LookUpDataSet();

    // 加算体系ﾂﾘｰﾋﾞｭｰ作成
	TaikeiOyaCreate(MyTreeNode1);

	// ｸﾞﾘｯﾄﾞ再表示
	TaikeiSelectDsp(MyTreeNode1);

	VKasantaikei.FullExpand;
	VKasantaikei.Selected   :=  VKasantaikei.Items[0];

	if ( TreeView_EnsureVisible(VKasantaikei.Handle, VKasantaikei.Selected.ItemID) ) then
		VKasantaikei.Invalidate;

	m_fUpdateRecord := 1;

end;

//-----------------------------------------------------------------------------
// DataDsp()
//	< 読込んだﾃﾞｰﾀをTdxMemdataにSET >
//      PARAM   : Query :   読込ｸｴﾘｰ
//                iFlg  :   0:画面表示  1:印刷
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.DataDsp(Query : TMQuery; iFlg : Integer);
var
	i   :   Integer;
begin

	if ( iFlg = 0 ) then
	begin
		dxMemData1.Append;

		// 外部ｺｰﾄﾞ
		dxMemData1GCode     .AsInteger  :=  Query.GetFld('Gcode')       .AsInteger;
		// 連想ｼﾝﾎﾞﾙ
		dxMemData1RenChar   .AsString   :=  Query.GetFld('Renso')       .AsString;
		// 正式名称
		dxMemData1LongName  .AsString   :=  Query.GetFld('LongName')    .AsString;
		// 簡略名称
		dxMemData1SimpleName.AsString   :=  Query.GetFld('SimpleName')  .AsString;
		// 装飾区分
		i   :=  Query.GetFld('DecoKbn').AsInteger;
		dxMemData1DummyDeco.AsInteger   :=  i;
		dxMemData1DecoKbnName.AsString  :=  sDeco[i];
		// 優先区分
		i   :=  Query.GetFld('KmkKbn').AsInteger;
		dxMemData1DummyKmk.AsInteger    :=  i;
		dxMemData1KmkKbnName.AsString   :=  sKmk[i];

		dxMemData1.Post;
	end
	else
	begin
		dxMemData2.Append;

		// 外部ｺｰﾄﾞ
		dxMemData2GCode     .AsInteger  :=  Query.GetFld('Gcode')       .AsInteger;
		// 連想ｼﾝﾎﾞﾙ
		dxMemData2RenChar   .AsString   :=  Query.GetFld('Renso')       .AsString;
		// 正式名称
		dxMemData2LongName  .AsString   :=  Query.GetFld('LongName')    .AsString;
		// 簡略名称
		dxMemData2SimpleName.AsString   :=  Query.GetFld('SimpleName')  .AsString;
		// 装飾区分
		i   :=  Query.GetFld('DecoKbn').AsInteger;
		dxMemData2DecoKbnCode.AsInteger :=  i;
		dxMemData2DecoKbnName.AsString  :=  sDeco[i];
		// 優先区分
		i   :=  Query.GetFld('KmkKbn').AsInteger;
		dxMemData2KmkKbnCode.AsInteger  :=  i;
		dxMemData2KmkKbnName.AsString   :=  sKmk[i];

		dxMemData2.Post;
	end;

end;

//-----------------------------------------------------------------------------
// NodeCreate()
//	< 親ﾉｰﾄﾞにﾉｰﾄﾞを作成 >
//      PARAM   : cNode :   親ﾉｰﾄﾞ
//                Query :   読込ｸｴﾘｰ
//                iSun  :   加算区分
//      VAR     :
//      RETURN  : 子ﾉｰﾄﾞ
//      MEMO    :
//-----------------------------------------------------------------------------
function TJNTCRP009002_5f.NodeCreate(cNode: TTreeNode; Query: TMQuery; iSun: Integer): TTreeNode;
var
	stWorkRec	:	^TreeViewRec;
	TreeNode	:	TTreeNode;
	QueryCheck	:	TMQuery;
	iFlg		:	Integer;
	stName		:	String;
begin

	New (stWorkRec);
	iFlg := 0;

	QueryCheck := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryCheck);

	try
		with QueryCheck do
		begin
            // 科目加算体系を加算先外部ｺｰﾄﾞ昇順でGET
			Close();
			SQL.Clear();
			SQL.Add('SELECT                         '
                +   '    MasterKbn                  '
                +   '   ,SumNCode                   '
                +   '   ,EntNo                      '
                +   '   ,BasedNCode                 '
                +   'FROM KmkTree                   '
			    +   'WHERE  (MasterKbn = :iMaster)  '
                +   '  AND  (SumNCode  =:iSum)      '
			    +   'ORDER BY EntNo                 ');

			SetFld('iMaster')   .AsInteger  :=  6;
			SetFld('iSum')      .AsInteger  :=  Query.GetFld('NCode').AsInteger;
			Open();

			if ( EOF = FALSE ) then
				iFlg    :=  1;
		end;
	finally
		QueryCheck.Free;
	end;

	stWorkRec^.prmNCode     :=  Query.GetFld('NCode').AsInteger;
	stWorkRec^.prmCode      :=  Query.GetFld('GCode').AsInteger;
	stWorkRec^.prmName      :=  Query.GetFld('SimpleName').AsString;
	stWorkRec^.prmSumKbn    :=  iFlg;
	stWorkRec^.prmAddKbn    :=  iSun;
	stName      :=  IntToStr(Query.GetFld('GCode').AsInteger) + ' ' + Query.GetFld('SimpleName').AsString;
	TreeNode    :=  VKasantaikei.Items.AddChildObject(cNode, stName, stWorkRec);

    // 子がいる
	if ( iFlg = 1 ) then
	begin
		if ( iSun = 0 ) then
		begin
			TreeNode.ImageIndex     :=  IC_GPCLOSE;
			TreeNode.SelectedIndex  :=  IC_GPOPEN;
		end
		else
		begin
			TreeNode.ImageIndex     :=  IC_GMCLOSE;
			TreeNode.SelectedIndex  :=  IC_GMOPEN;
		end;
	end
    // 子がいない
	else
	begin
		if ( iSun = 0 ) then
		begin
			TreeNode.ImageIndex     :=  IC_JP;
			TreeNode.SelectedIndex  :=  IC_JPCHK;
		end
		else
		begin
			TreeNode.ImageIndex     :=  IC_JM;
			TreeNode.SelectedIndex  :=  IC_JMCHK;
		end;
	end;

	Result  :=  TreeNode;

end;

//-----------------------------------------------------------------------------
// LookUpDataSet()
//	< LookUp用ﾘｽﾄにﾃﾞｰﾀ追加 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.LookUpDataSet();
var
	iLoop   :   Integer;
begin

	ListMemDeco .Close();
	ListMemDeco .Open();
	ListMemKmk  .Close();
	ListMemKmk  .Open();

	for iLoop := 0 to 6 do
	begin
		ListMemDeco.Append;
		ListMemDeco.FieldByName('iCode').AsInteger  :=  iLoop;
		ListMemDeco.FieldByName('iName').AsString   :=  sDeco[iLoop];
		ListMemDeco.Post;
	end;
	ListMemDeco.First;

	for iLoop := 0 to 1 do
	begin
		ListMemKmk.Append;
		ListMemKmk.FieldByName('iCode').AsInteger   :=  iLoop;
		ListMemKmk.FieldByName('iName').AsString    :=  sKmk[iLoop];
		ListMemKmk.Post;
	end;
	ListMemDeco.First;

end;

//-----------------------------------------------------------------------------
// EnterEvent()
//	< OnEnterの共通ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.EnterEvent(Sender: TObject);
begin

	m_AcControl := Screen.ActiveControl;

end;

//-----------------------------------------------------------------------------
// BCloseClick()
//	< 終了ﾎﾞﾀﾝ処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.BCloseClick(Sender: TObject);
begin

    // ﾃﾞｰﾀ編集中
	if ( dxMemData1.State in [dsInsert,dsEdit] ) then
		dxMemData1.Post;
	Close();

end;

//-----------------------------------------------------------------------------
// BPrint_Click()
//	< 印刷ﾎﾞﾀﾝ処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.BPrint_Click(Sender: TObject);
var
	QueryRead	:	TMQuery;
begin

    // MQueryの構築
	QueryRead := TMQuery.Create( Self );
    // DBとMQueryの接続
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryRead );

	// DataSet
	dxMemData2.Close;
	dxMemData2.Open;

	with QueryRead do
	begin
        // 固定変動科目を外部ｺｰﾄﾞ昇順でGET
		Close();
		SQL.Clear();
		SQL.Add('SELECT * FROM SKmkMA       '
		    +   'WHERE  (MasterKbn = 6)     '
            +   '  AND  (RDelKbn   = 0)     '
		    +   'ORDER BY GCode             ');
		Open();

		while EOF = FALSE do
		begin
			DataDsp(QueryRead, 1);
			Next;
		end;
	end;

    if ( dxMemData2.RecordCount <> 0 ) then
		dxMemData2.First;

    // <PRN>
    with PrtParam do
	begin
        Para		:=  uvHani;
		TargetQry	:=  DmqPrint;
        TargetMD    :=  dxMemData2;
		CorpSys		:=  uvSelSys;
        JNTArea     :=  m_cJNTArea;
        TargetInt   :=  4;
	end;

    // 印刷する<PRN>
    PrintAppEntry(nil,nil,1,PrtParam,ArrHdl);

	dxMemData2.Close();
	QueryRead.Free();

end;

//-----------------------------------------------------------------------------
// BChangeClick()
//	< 切出/埋込ﾎﾞﾀﾝ処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.BChangeClick(Sender: TObject);
var
	iAction	:	Integer;
	AppPara :   TAppParam;
begin

	Visible :=  FALSE;

	// 切出
	if ( Parent = TPanel(m_pMyAppRecord^.m_pOwnerPanel^) ) then
	begin
		Align			:=  alNone;
		Parent			:=  nil;
		BorderStyle		:=  bsSizeable;
		Position		:=  poDefaultPosOnly;
		BChange.Caption :=  '埋込(&G)';
		ClientHeight	:=  Trunc(622 * m_Zoom / 100);
		ClientWidth		:=  Trunc(945 * m_Zoom / 100);
		iAction			:=  ACTID_DOCKINGOUTEND;
	end
	// 埋込
	else
	begin
		Parent			:=  TPanel(m_pMyAppRecord^.m_pOwnerPanel^);
		Align			:=  alClient;
		BorderStyle		:=  bsNone;
		BChange.Caption :=  '切出(&G)';
		iAction			:=  ACTID_DOCKINGINEND;
	end;

	AppPara.iAction         :=  iAction;
	AppPara.pRecord         :=  Pointer( m_pMyAppRecord );
	AppPara.pActionParam    :=  nil;
	TMjsAppRecord( m_pMyAppRecord^ ).m_pOwnerEntry( @AppPara );

	Visible := TRUE;

end;

//-----------------------------------------------------------------------------
// VKasantaikeiChange()
//	< ﾉｰﾄﾞから次のﾉｰﾄﾞへ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//                Node      :   TTreeNodeｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.VKasantaikeiChange(Sender: TObject;
  Node: TTreeNode);
var
	Node1			:	TTreeNode;
	NodeOya			:	TTreeNode;
	stWorkRecSelect	:	^TreeViewRec;
	stWorkRecOya	:	^TreeViewRec;
	iGCode			:	Integer;
	iMemGCode		:	Integer;
	bFlg			:	Boolean;
begin

	m_fUpdateRecord :=  0;
	bFlg            :=  FALSE;

	Node1           :=  VKasantaikei.Selected;
	NodeOya         :=  Node1.Parent;
	stWorkRecSelect :=  Node1.Data;
	iMemGCode       :=  stWorkRecSelect^.prmCode;

	if ( dxMemData1.RecordCount <> 0 ) then
		dxMemData1.First;

	while dxMemData1.Eof = FALSE do
	begin
		if ( iMemGCode = dxMemData1GCode.AsInteger ) then
		begin
			bFlg := TRUE;
			break;
		end
		else
			dxMemData1.Next;
	end;

	if ( bFlg = FALSE ) then
	begin
		if ( dxMemData1.RecordCount <> 0 ) then
			dxMemData1.First;
	end;

	if ( stWorkRecSelect^.prmSumKbn = 9 ) or
       ( stWorkRecSelect^.prmSumKbn = 1 ) then
	begin
		iGCode := stWorkRecSelect^.prmCode;
	end
	else
	begin
		stWorkRecOya    :=  NodeOya.Data;
		iGCode          :=  stWorkRecOya^.prmCode;
	end;

	if ( m_iGCodeSave = iGCode ) then
	begin
		m_fUpdateRecord :=  1;
		Exit;
	end;

	if ( Node1 = nil ) then
	begin
		m_fUpdateRecord :=  1;
		Exit;
	end;

	TaikeiSelectDsp(Node1);

	bFlg    :=  FALSE;

	if ( dxMemData1.RecordCount <> 0 ) then
		dxMemData1.First;

	while dxMemData1.Eof = FALSE do
	begin
		if ( iMemGCode = dxMemData1GCode.AsInteger ) then
		begin
			bFlg    :=  TRUE;
			break;
		end
		else
			dxMemData1.Next;
	end;

	if ( bFlg = FALSE ) then
	begin
		if ( dxMemData1.RecordCount <> 0 ) then
			dxMemData1.First;
	end;

    // ｺｰﾄﾞのｾｰﾌﾞ
	m_iGCodeSave    :=  iGCode;
	m_fUpdateRecord :=  1;

end;

//-----------------------------------------------------------------------------
// dxMemData1BeforePost()
//	< TdxMemdata Post前ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : DataSet   :   TDataSetｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.dxMemData1BeforePost(DataSet: TDataSet);
var
	cField		:	TField;
	iCode		:	Integer;
	stWork		:	String;
begin

	if ( m_fUpdateRecord = 1 ) then
	begin
		// 外部ｺｰﾄﾞ
		iCode   :=  dxMemData1GCode.AsInteger;
		cField  :=  dxMemData1GCode;

		// 外部ｺｰﾄﾞの0は許さない
		if ( iCode = 0 ) then
		begin
			cField.FocusControl;
			Abort;
		end;

		// 装飾区分の''は許さない
		stWork := dxMemData1DecoKbnName.AsString;
		if ( dxMemData1DecoKbnName.AsString = '' ) then
		begin
			dxMemData1DummyDeco.AsInteger   :=  0;
			dxMemData1DecoKbnName.AsString  :=  sDeco[0];
		end;

		// 優先区分の''は許さない
		stWork := dxMemData1KmkKbnName.AsString;
		if ( dxMemData1KmkKbnName.AsString = '' ) then
		begin
			dxMemData1DummyKmk.AsInteger    :=  0;
			dxMemData1KmkKbnName.AsString   :=  sKmk[0];
		end;

		WriteSKMKMA();							// <008> ADD BeforePostから移動
	end;

end;

//-----------------------------------------------------------------------------
// dxMemData1AfterPost()
//	< TdxMemdata Post後ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : DataSet   :   TDataSetｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.dxMemData1AfterPost(DataSet: TDataSet);
begin

    // 固定変動科目書込
//	WriteSKMKMA();							// <008> DEL BeforePostに移動

end;

//-----------------------------------------------------------------------------
// DataSource1StateChange()
//	< 固定変動用ﾃﾞｰﾀｿｰｽStateChangeｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.DataSource1StateChange(Sender: TObject);
begin

	if ( dxMemData1.State in [dsInsert] ) then
	begin
		DKotei.Columns[COL_GCODE].ReadOnly  :=  FALSE;
		dxMemData1GCode.ReadOnly            :=  FALSE;
	end
	else
	begin
		DKotei.Columns[COL_GCODE].ReadOnly  :=  TRUE;
		dxMemData1GCode.ReadOnly            :=  TRUE;
	end;

	if ( dxMemData1.Active ) then
	begin
		if ( DKotei.DataSource.DataSet.RecordCount = 0 ) then
		begin
			DKotei.Columns [COL_GCODE].ReadOnly :=  FALSE;
			dxMemData1GCode.ReadOnly            :=  FALSE;
		end;
	end;

end;

//-----------------------------------------------------------------------------
// WriteSKMKMA()
//	< 固定変動用DB書込みｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.WriteSKMKMA();
var
	QueryWrite	    :	TMQuery;
	NodeOya		    :   TTreeNode;
	NodeKo		    :   TTreeNode;
	stWorkRecOya    :	^TreeViewRec;
	stWorkRecKo	    :	^TreeViewRec;
begin

	if ( m_fUpdateRecord = 1 ) then
	begin
        // 現在選択されている親ﾉｰﾄﾞ取得
		NodeOya         :=  VKasantaikei.Selected;
		stWorkRecOya    :=  NodeOya.Data;
		if ( stWorkRecOya.prmSumKbn = 0 ) then
			NodeOya     :=  NodeOya.Parent;

		QueryWrite  :=  TMQuery.Create (Self);

// <008> MOD start
//		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryWrite);

											//  ｸﾞﾙｰﾌﾟ会計の子会社の場合
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
		begin								//  親会社に接続
			MDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, QueryWrite);
		end
		else
		begin								//  自社に接続
			MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryWrite);
		end;
// <008> MOD end

		SessionPractice(C_ST_PROCESS);		// <012>

        // ﾄﾗﾝｻﾞｸｼｮﾝの開始
		MDataModule.BeginTran (dbCorp_Select);
		ExecParentDBTran(GRP_PARENTDB_BEGINTRAN);	//  <008> 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝ開始

		try
			with QueryWrite do
			begin
				Close();
				SQL.Clear();
				SQL.Add('UPDATE SKmkMA SET              '
				    +   '    Renso      = :sRenChar     '
                    +   '   ,LongName   = :sLongName    '
                    +   '   ,SimpleName = :sSimpleName  '
                    +   '   ,DecoKbn    = :iDecoKbn     '
                    +   '   ,KmkKbn     = :iKmkKbn      '
                    +   '   ,UpdTantoNCode = :cUpdTantoNCode ' // <013>
				    +   'WHERE  (MasterKbn = 6)         '
                    +   '  AND  (Gcode     = :iGcode)   ');

				NodeKo  :=  NodeOya.getFirstChild;

				if ( NodeKo <> nil ) then
				begin
					while NodeKo <> nil do
					begin;
						stWorkRecKo :=  NodeKo.Data;
						if ( stWorkRecKo^.prmCode = dxMemData1GCode.AsInteger ) then
						begin
							NodeKo.Text :=  IntToStr(dxMemData1GCode.AsInteger) + ' ' + dxMemData1SimpleName.AsString;
							break;
						end
						else
							NodeKo := NodeOya.GetNextChild(NodeKo);
					end;
				end;

				// 外部ｺｰﾄﾞ
				SetFld('iGcode')        .AsInteger  :=  dxMemData1GCode.AsInteger;
				// 連想ｼﾝﾎﾞﾙ
				SetFld('sRenChar')      .AsString   :=  fnDelCRLF(dxMemData1RenChar.AsString);    //<DKAI>
				// 正式名称
				SetFld('sLongName')     .AsString   :=  fnDelCRLF(dxMemData1LongName.AsString);   //<DKAI>
				// 簡略名称
				SetFld('sSimpleName')   .AsString   :=  fnDelCRLF(dxMemData1Simplename.AsString); //<DKAI>
				// 装飾区分
				SetFld('iDecoKbn')      .AsInteger  :=  dxMemData1DummyDeco.AsInteger;
				// 優先区分
				SetFld('iKmkKbn')       .AsInteger  :=  dxMemData1DummyKmk.AsInteger;
                // 更新担当者内部ｺｰﾄﾞ <013>
				SetFld('cUpdTantoNCode').AsCurrency :=  rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;

				// DB更新
				if ( ExecSQL = FALSE ) then
				begin
					ErrorMessageDsp(QueryWrite);
                    // ﾛｰﾙﾊﾞｯｸ(破棄)
					MDataModule.Rollback (dbCorp_Select);
					ExecParentDBTran(GRP_PARENTDB_ROLLBACK);//  <008> 親会社DBもﾛｰﾙﾊﾞｯｸ
					QueryWrite.Close();
// <008> MOD start
//					Exit;
					dxMemData1.Cancel;
					Abort;
// <008> MOD end
				end;

// <008> ADD start
											//  子会社の場合
				if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
				begin
					{親会社から子会社への同期取り(同期ｽﾄｱﾄﾞ呼出)}
											// SKMKMA同期
					if not m_SyncMaster.fnCall_SYNC(JNTSYNC_SKMKMA) then
					begin
	                    // ﾛｰﾙﾊﾞｯｸ(破棄)
						MDataModule.Rollback (dbCorp_Select);
						ExecParentDBTran(GRP_PARENTDB_ROLLBACK);
						QueryWrite.Close();
						dxMemData1.Cancel;
						Abort;
					end;
				end;
// <008> ADD end

                // ｺﾐｯﾄ(反映)
				MDataModule.Commit (dbCorp_Select);
				ExecParentDBTran(GRP_PARENTDB_COMMIT);	//  <008> 親会社DBもｺﾐｯﾄ
			end;
		finally
			SessionPractice(C_ED_PROCESS);	// <012>
			QueryWrite.Free();
		end;
	end;

end;

//-----------------------------------------------------------------------------
// TaikeiOyaCreate()
//	< 加算体系作成（体系読み込み）ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : NodeOya   :   TTreeNodeｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.TaikeiOyaCreate(NodeOya : TTreeNode);
var
	QueryTree	    :   TMQuery;
	stWorkRecOya    :	^TreeViewRec;
begin

	stWorkRecOya    :=  NodeOya.Data;

	QueryTree   :=  TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);

	try
		with QueryTree do
		begin
            // 科目加算体系を加算先外部ｺｰﾄﾞ昇順でGET
			Close();
			SQL.Clear();
			SQL.Add('SELECT                         '
                +   '    MasterKbn                  '
                +   '   ,SumNCode                   '
                +   '   ,EntNo                      '
                +   '   ,BasedNCode                 '
                +   '   ,AddKbn                     '
                +   'FROM KmkTree                   '
			    +   'WHERE  (MasterKbn = :iMaster)  '
                +   '  AND  (SumNCode  = :iSum)     '
			    +   'ORDER BY EntNo                 ');

			SetFld('iMaster')   .AsInteger  :=  6;
			SetFld('iSum')      .AsInteger  :=  stWorkRecOya^.prmNCode;
			Open();

			while EOF = FALSE do
			begin
				TaikeiKoCreate(QueryTree, NodeOya);
				Next;
			end;
		end;
	finally
		QueryTree.Free();
	end;

end;

//-----------------------------------------------------------------------------
// TaikeiKoCreate()
//	< 加算体系作成（管理科目マスタ読み込み）ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : QueryTree :
//                NodeOya   :   TTreeNodeｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.TaikeiKoCreate(QueryTree : TMQuery; NodeOya : TTreeNode);
var
	QueryRead	:	TMQuery;
	TreeNode	:	TTreeNode;
begin

	QueryRead := TMQuery.Create (Self);
	MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryRead);

	try
		with QueryRead do
		begin
            // 固定変動科目を外部ｺｰﾄﾞ昇順でGET
			Close();
			SQL.Clear();
			SQL.Add('SELECT                         '
                +   '    MasterKbn                  '
                +   '   ,NCode                      '
                +   '   ,GCode                      '
                +   '   ,Renso                      '
                +   '   ,LongName                   '
                +   '   ,SimpleName                 '
                +   '   ,DecoKbn                    '
                +   '   ,KmkKbn                     '
                +   'FROM SKmkMA                    '
			    +   'WHERE  (MasterKbn = 6)         '
                +   '  AND  (RDelKbn   = 0)         '
                +   '  AND  (NCode     = :iNCode)   '
			    +   'ORDER BY Gcode                 ');

			SetFld('iNCode').AsInteger  :=  QueryTree.GetFld('BasedNCode').AsInteger;
			Open();

			if ( EOF = FALSE ) then
			begin
				TreeNode    :=  NodeCreate(NodeOya, QueryRead, QueryTree.GetFld('AddKbn').AsInteger);
				TaikeiOyaCreate(TreeNode);
			end;
		end;
	finally
		QueryRead.Free();
	end;

end;

//-----------------------------------------------------------------------------
// DKoteiBeforeChangeColumn()
//	< 固定変動科目登録ｸﾞﾘｯﾄﾞｶﾗﾑ移動前ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//                Node      :   TdxTreeListNodeｵﾌﾞｼﾞｪｸﾄ
//                Column    :   Integer
//                NewNode   :   TdxTreeListNodeｵﾌﾞｼﾞｪｸﾄ
//                NewColumn :   Integer
//      VAR     : CanChange :   Boolean
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.DKoteiBeforeChangeColumn(Sender: TObject;
  Node: TdxTreeListNode; Column: Integer; NewNode: TdxTreeListNode;
  NewColumn: Integer; var CanChange: Boolean);
var
	cField		:	TField;
	iWork		:	Integer;
	stWork		:	String;
	QueryRead	:	TMQuery;
	stMessageRec: TMJSMsgRec;
begin

	case Column of
		COL_GCODE:
		begin
			cField  :=  dxMemData1GCode;
			iWork   :=  dxMemData1GCode.AsInteger;

			if ( iWork = 0 ) then
			begin
				cField.FocusControl;
				Abort;
				Exit;
			end;

			if ( DKotei.Columns [COL_GCODE].ReadOnly = FALSE ) then
			begin
				QueryRead := TMQuery.Create (Self);
				MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryRead);

				try
					with QueryRead do
					begin
                        // 固定変動科目を外部ｺｰﾄﾞ昇順でGET
						Close();
						SQL.Clear();
						SQL.Add('SELECT * FROM SKmkMA           '
						    +   'WHERE  (MasterKbn = 6)         '
                            +   '  AND  (GCode     = :iGCode)   '
						    +   'ORDER BY Gcode                 ');

						SetFld('iGCode').AsInteger  :=  iWork;
						Open();

						if ( EOF = FALSE ) then
						begin
							cField.FocusControl;
							Abort;
						end;
					end;
				finally
					QueryRead.Free();
				end;
			end;
		end;
		COL_REN:
		begin
		end;
		COL_L_NAME:
		begin
			stWork  :=  dxMemData1SimpleName.AsString;
			if ( stWork = '' ) then
			begin
				dxMemData1.Edit;
				dxMemData1SimpleName.AsString := MjsCopy(dxMemData1LongName.AsString, 14);
			end;
		end;
		COL_S_NAME:
		begin
		end;
		COL_DECO_KBN_CD:
		begin
			if ( dxMemData1DecoKbnName.AsString = '' ) then
			begin
			   	dxMemData1.Edit;
				dxMemData1DummyDeco.AsInteger   :=  0;
				dxMemData1DecoKbnName.AsString  :=  sDeco[0];
			end;
		end;
		COL_DECO_KBN_NM:
		begin
		end;
		COL_KMK_KBN_CD:
		begin
			if ( dxMemData1KmkKbnName.AsString = '' ) then
			begin
			   	dxMemData1.Edit;
				dxMemData1DummyKmk.AsInteger    :=  0;
				dxMemData1KmkKbnName.AsString   :=  sKmk[0];
			end;
		end;
		COL_KMK_KBN_NM:
		begin
		end;
	end;

	// ｽﾃｰﾀｽﾊﾞｰ消去
	SStatus.SimpleText  :=  '';

	case NewColumn of
		COL_S_NAME:
		begin
			ComArea.m_MsgStd.GetMsg( stMessageRec, 30, 19);
			SStatus.SimpleText := stMessageRec.sMsg;
 		end;
	end;
    
end;

//-----------------------------------------------------------------------------
// TaikeiSelectDsp()
//	< 指定されたﾉｰﾄﾞに関するﾃﾞｰﾀの読み込み＆表示 >
//      PARAM   : NodeDsp   :   TTreeNodeｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.TaikeiSelectDsp(NodeDsp : TTreeNode);
var
	NodeOya		    :   TTreeNode;
	stWk		    :   String;
	stWorkRecDsp    :   ^TreeViewRec;
	stWorkRecOya    :   ^TreeViewRec;
	QueryTree,
    QueryOya    	:   TMQuery;
begin

	m_fUpdateRecord :=  0;
	stWorkRecDsp    :=  NodeDsp.Data;

	if ( stWorkRecDsp^.prmSumKbn <> 0 ) then
	begin
		QueryTree   :=  TMQuery.Create (Self);
		QueryOya    :=  TMQuery.Create (Self);
		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);
		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryOya);

		try
			stWk    :=  NodeDsp.Text;

			with QueryTree do
			begin
                // 科目加算体系を加算先外部ｺｰﾄﾞ昇順でGET
				Close();
				SQL.Clear();
				SQL.Add('SELECT                         '
                    +   '    MasterKbn                  '
                    +   '   ,SumNCode                   '
                    +   '   ,EntNo                      '
                    +   '   ,BasedNCode                 '
                    +   'FROM KmkTree                   '
				    +   'WHERE  (MasterKbn = 6)         '
                    +   '  AND  (SumNCode  = :iNCode)   '
				    +   'ORDER BY EntNo                 ');

				SetFld('iNCode').AsInteger  :=  stWorkRecDsp^.prmNCode;
				Open();
			end;

			dxMemData1.Close;
			dxMemData1.Open;

			while QueryTree.EOF = FALSE do
			begin
				with QueryOya do
				begin
                    // 合計固定変動科目科目を外部ｺｰﾄﾞ昇順でGET
					Close();
					SQL.Clear();
					SQL.Add('SELECT                         '
                        +   '    MasterKbn                  '
                        +   '   ,GCode                      '
                        +   '   ,Renso                      '
                        +   '   ,LongName                   '
                        +   '   ,SimpleName                 '
                        +   '   ,DecoKbn                    '
                        +   '   ,KmkKbn                     '
                        +   'FROM SKmkMA                    '
					    +   'WHERE  (MasterKbn = 6)         '
                        +   '  AND  (NCode     = :iNCode)   '
					    +   'ORDER BY GCode                 ');

					SetFld('iNCode').AsInteger  :=  QueryTree.GetFld('BasedNCode').AsInteger;
					Open();

					if ( EOF = FALSE ) then
					begin
                        while EOF = FALSE do
						begin
							DataDsp(QueryOya, 0);
							Next;
						end;
					end;
				end;
				QueryTree.Next;
			end;

			if ( dxMemData1.RecordCount <> 0 ) then
				dxMemData1.First;
		finally
			QueryTree.Free();
			QueryOya.Free();
		end;
	end
	else
	begin
		NodeOya         :=  NodeDsp.Parent;
		stWk            :=  NodeOya.Text;
		stWorkRecOya    :=  NodeOya.Data;

		QueryTree   :=  TMQuery.Create (Self);
		QueryOya    :=  TMQuery.Create (Self);

		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryTree);
		MDataModule.SetDBInfoToQuery(dbCorp_Select, QueryOya);

		dxMemData1.Close;
		dxMemData1.Open;

		try
			with QueryTree do
			begin
                // 科目加算体系を加算先外部ｺｰﾄﾞ昇順でGET
				Close();
				SQL.Clear();
				SQL.Add('SELECT                         '
                    +   '    MasterKbn                  '
                    +   '   ,SumNCode                   '
                    +   '   ,EntNo                      '
                    +   '   ,BasedNCode                 '
                    +   'FROM KmkTree                   '
				    +   'WHERE  (MasterKbn = 6)         '
                    +   '  AND  (SumNCode  = :iNCode)   '
				    +   'ORDER BY EntNo                 ');

				SetFld('iNCode').AsInteger  :=  stWorkRecOya^.prmNCode;
				Open();
			end;

			while QueryTree.EOF = FALSE do
			begin
				with QueryOya do
				begin
                    // 合計固定変動科目科目を外部ｺｰﾄﾞ昇順でGET
					Close();
					SQL.Clear();
					SQL.Add('SELECT                         '
                        +   '    MasterKbn                  '
                        +   '   ,GCode                      '
                        +   '   ,Renso                      '
                        +   '   ,LongName                   '
                        +   '   ,SimpleName                 '
                        +   '   ,DecoKbn                    '
                        +   '   ,KmkKbn                     '
                        +   'FROM SKmkMA                    '
					    +   'WHERE  (MasterKbn = 6)         '
                        +   '  AND  (NCode     = :iNCode)   '
					    +   'ORDER BY GCode                 ');

					SetFld('iNCode').AsInteger  :=  QueryTree.GetFld('BasedNCode').AsInteger;
					Open();

					if ( EOF = FALSE ) then
					begin
                        while EOF = FALSE do
						begin
							DataDsp(QueryOya, 0);
							Next;
						end;
					end;
				end;
				QueryTree.Next;
			end;

			if ( dxMemData1.RecordCount <> 0 ) then
				dxMemData1.First;
		finally
			QueryTree.Free();
			QueryOya.Free();
		end;
	end;

	m_fUpdateRecord :=  1;

end;

//-----------------------------------------------------------------------------
// DKoteiBeforeChangeNode()
//	< 固定変動行移動ｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//                Node      :   TdxTreeListNodeｵﾌﾞｼﾞｪｸﾄ
//                NewNode   :   TdxTreeListNodeｵﾌﾞｼﾞｪｸﾄ
//      VAR     : CanChange :   Boolean
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.DKoteiBeforeChangeNode(Sender: TObject; Node,
  NewNode: TdxTreeListNode; var CanChange: Boolean);
var
	cField	:	TField;
	iCount	:	Integer;
	iNo		:	Integer;
begin

	iCount  :=  dxMemData1.RecordCount;
	iNo     :=  dxMemData1.RecNo;

	if ( iCount = iNo ) then
	begin
		cField  :=  dxMemData1GCode;
		cField.FocusControl;
	end;

end;

//-----------------------------------------------------------------------------
// VKasantaikeiDragOver()
//	< ﾂﾘｰﾄﾞﾛｯﾌﾟｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//                Source    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//                X,Y       :   Integer
//                State     :   TDragStateｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Accept    :   Boolean
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.VKasantaikeiDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
	NodeSelect		:	TTreeNode;
	stWorkRecSelect	:	^TreeViewRec;
	QueryDrag		:	TMQuery;
begin

	NodeSelect      :=  VKasantaikei.Selected;
	stWorkRecSelect :=  NodeSelect.Data;

	if ( stWorkRecSelect.prmSumKbn = 9 ) then
		Abort;

	QueryDrag := TMQuery.Create( Self );
	MDataModule.SetDBInfoToQuery( dbCorp_Select, QueryDrag );

	try
		with QueryDrag do
		begin
            // ﾃﾞｰﾀ存在確認
			Close();
			SQL.Clear();
			SQL.Add('SELECT * FROM SKmkMA           '
			    +   'WHERE  (MasterKbn = 6)         '
                +   '  AND  (GCode     = :iGCode)   '
                +   '  AND  (RDelKbn   = 0)         ');

			SetFld('iGCode').AsInteger  :=  stWorkRecSelect.prmCode;
			Open();
		end;

        // 固定体系区分が1：固定のとき
		if ( QueryDrag.GetFld('KoteiKbn').AsInteger = 1 ) then
			Abort;
	finally
		QueryDrag.Free();
	end;

end;

//-----------------------------------------------------------------------------
// DKoteiMouseDown()
//	< 固定変動科目ﾏｳｽｸﾘｯｸｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//                Button    :   TMouseButtonｵﾌﾞｼﾞｪｸﾄ
//                Shift     :   TShiftStateｵﾌﾞｼﾞｪｸﾄ
//                X,Y       :   Integer
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.DKoteiMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	iFocus	:	Integer;
	cField	:	TField;
begin

    // ﾌｫｰｶｽ位置
	iFocus  :=  DKotei.FocusedColumn;

	case iFocus of
		COL_GCODE:
		begin
		end;
		COL_REN:
		begin
		end;
		COL_L_NAME:
		begin
		end;
		COL_S_NAME:
		begin
		end;
		COL_DECO_KBN_CD:
		begin
		end;
		COL_DECO_KBN_NM:
		begin
			cField  := dxMemData1DecoKbnCode;
			cField.FocusControl;
			Abort;
			Exit;
		end;
		COL_KMK_KBN_CD:
		begin
		end;
		COL_KMK_KBN_NM:
		begin
			cField  := dxMemData1KmkKbnCode;
			cField.FocusControl;
			Abort;
			Exit;
		end;
	end;

end;

//-----------------------------------------------------------------------------
// DKoteiExit()
//	< 固定変動科目EXITｲﾍﾞﾝﾄﾊﾝﾄﾞﾗ >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.DKoteiExit(Sender: TObject);
begin

	if ( m_fEnd = 0 ) then
	begin
        // ﾃﾞｰﾀ編集中
		if ( dxMemData1.State in [dsInsert,dsEdit] ) then
		begin
			dxMemData1.Post;
		end;
	end;

end;

//-----------------------------------------------------------------------------
// ErrorMessageDsp()
//	< ｴﾗｰﾒｯｾｰｼﾞ表示処理 >
//      PARAM   : DmQuery   :   ｴﾗｰになったｸｴﾘｰ
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.ErrorMessageDsp(DmQuery: TMQuery);
begin

	case ComArea.m_MsgStd.GetDBCode(DmQuery) of
		1:
		begin
			// 最大登録件数をｵｰﾊﾞｰしました
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 0,1);
			MjsMessageBoxEx(AOwner, // <002>
                            MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		2:
		begin
			// ･･･のため削除できません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,5);
			MjsMessageBoxEx(AOwner, // <002>
                            '固定体系区分が固定' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		3:
		begin
			// ･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(AOwner, // <002>
                            '子供が存在する為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		4:
		begin
			// ･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(AOwner, // <002>
                            '仕訳が存在する為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		5:
		begin
			// ･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(AOwner, // <002>
                            '諸口、総合計を削除する時にその他のマスタが登録済みの為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		6:
		begin
			// ･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(AOwner, // <002>
                            '支払予定データが存在する為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		7:
		begin
			// ･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(AOwner, // <002>
                            '部署情報が存在する為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		8:
		begin
			// ･･･することができません
			ComArea.m_MsgStd.GetMsg( MjsMsgRec, 30,18);
			MjsMessageBoxEx(AOwner, // <002>
                            '未連結仕訳(部署or分散)が存在する為削除' + MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            MJsMsgRec.LogType
                           );
		end;
		else
		begin
			ComArea.m_MsgStd.GetMsgDB( MjsMsgRec, DmQuery );
			MjsMessageBoxEx(AOwner, // <002>
                            MjsMsgRec.sMsg,
                            MjsMsgRec.sTitle,
                            MjsMsgRec.icontype,
                            MjsMsgRec.btntype,
                            MjsMsgRec.btndef,
                            FALSE
                           );
		end;
	end;

end;

//-----------------------------------------------------------------------------
// DisplayControl()
//	< 参照・更新時のｺﾝﾎﾟｰﾈﾝﾄ制御処理 >
//      PARAM   : Select    :   REFER(参照)
//                              NORMAL(通常処理)
//                              BASICONLY(基本のみ設定可能)
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.DisplayControl(Select: Integer);
begin

	if ( Select = REFER ) then
	begin
		// 実在Grid
		DKotei.Options				:=	DKotei.Options + [egoMultiSelect] + [egoRowSelect];
		DKoteiGCode.ReadOnly		:=  TRUE;
		DKoteiRenChar.ReadOnly		:=  TRUE;
		DKoteiLongName.ReadOnly		:=  TRUE;
		DKoteiSimpleName.ReadOnly	:=  TRUE;
		DKoteiDummyDeco.ReadOnly	:=  TRUE;
		DKoteiDecoKbnCode.ReadOnly	:=  TRUE;
		DKoteiDecoKbnName.ReadOnly	:=  TRUE;
		DKoteiDummyKmk.ReadOnly		:=  TRUE;
		DKoteiKmkKbnCode.ReadOnly	:=  TRUE;
		DKoteiKmkKbnName.ReadOnly	:=  TRUE;
	end
	else
	begin
		// 実在Grid
		DKotei.Options	            :=	DKotei.Options - [egoMultiSelect] - [egoRowSelect];
		DKoteiGCode.ReadOnly		:=  FALSE;
		DKoteiRenChar.ReadOnly		:=  FALSE;
		DKoteiLongName.ReadOnly		:=  FALSE;
		DKoteiSimpleName.ReadOnly	:=  FALSE;
		DKoteiDummyDeco.ReadOnly	:=  FALSE;
		DKoteiDecoKbnCode.ReadOnly	:=  FALSE;
		DKoteiDecoKbnName.ReadOnly	:=  FALSE;
		DKoteiDummyKmk.ReadOnly		:=  FALSE;
		DKoteiKmkKbnCode.ReadOnly	:=  FALSE;
		DKoteiKmkKbnName.ReadOnly	:=  FALSE;
	end;

end;

//-----------------------------------------------------------------------------
// DKoteiKeyDown()
//	< ｸﾞﾘｯﾄﾞｷｰﾀﾞｳﾝ処理 >
//      PARAM   : Sender    :   TObjectｵﾌﾞｼﾞｪｸﾄ
//      VAR     : Key       :   Word
//                Shift     :   TShiftStateｵﾌﾞｼﾞｪｸﾄ
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.DKoteiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

	// ↑ｶｰｿﾙ or PageUp
	if ( Key = VK_UP ) or ( Key = VK_PRIOR ) then
	begin
		if ( DKotei.DataLink.Bof = TRUE ) then
		begin
			beep;
			Key := 0;
		end;
	end;

	// SHIFT + TAB,LEFT,編集中ではない
	if (( Key = VK_TAB  ) and ( Shift = [ssShift] )) or
       (( Key = VK_LEFT ) and
        ( DKotei.State <> tsEditing ))then
	begin
		if ( DKotei.FocusedColumn = 1    ) and
           ( DKotei.DataLink.Bof  = TRUE ) then
		begin
			beep;
			Key := 0;
		end;
	end;

	if ( Key = VK_INSERT ) then
		Abort;

end;

//-----------------------------------------------------------------------------
// fnGetGrants()    <003>
//	< 権限取得 >
//      PARAM   :
//      VAR     :
//      RETURN  :
//      MEMO    :
//-----------------------------------------------------------------------------
procedure TJNTCRP009002_5f.fnGetGrants();
begin

//    m_cJNTArea.FxPermission;						// 権限取得 <004>

//<010>↓
//親画面ですでに追加・変更・削除の権限をFalseにしているため、
//ここであえて処理する必要はない（後述のロジックで参照モードが確定する）
{
    if ( m_cJNTArea.IsKessan(TRUE) = 1 ) then		// 決算確定MSG
    begin
        giReferFlag	:= REFER;						// 決算確定の為参照のみ
        m_IsUpdate  := FALSE;
    end
    else
	begin
}
//<010>↑
        if ( m_cJNTArea.IsAppend ) and ( m_cJNTArea.IsModify ) then
                m_IsUpdate  :=  TRUE
        else    m_IsUpdate  :=  FALSE;

		if ( m_IsUpdate ) then
	            giReferFlag	:=  NORMAL				// 通常処理
		else    giReferFlag	:=  REFER;				// 更新権限無し

//	end;	//<010>

    BPrint.Enabled  :=  m_cJNTArea.IsPrint;
//    BPrint.Enabled  :=  FALSE;  // <PRN>→<006>

// <SYNC> ADD start ｸﾞﾙｰﾌﾟ会計 翌期更新処理区分の考慮
    // 参照権限の場合は以下の処理は行わない。
    if ( giReferFlag = REFER ) then
	begin
		Exit;
	end;

	// ADD start ★子会社の場合は権限なしと判断させて登録できなくする
// <008> DEL
													// 子会社の場合
(*	if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
		m_IsUpdate := FALSE;
        giReferFlag	:= REFER;		// 参照ﾓｰﾄﾞ
	end;
*)
	// ADD end ★
    
    // 全社の過年度DBを選択している場合
    if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_PARENT ) then
    begin
        if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
        begin
            if ( MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Oya,
                                    'グループ会計', mjQuestion, mjYesNo, mjDefNO) = mrYES ) then
            begin
                // 通常のﾏｽﾀ登録として起動する。
                // 登録したﾏｽﾀについて_RELの作成はしない。(Triggerでﾁｪｯｸを行う)
                giReferFlag	:= NORMAL;  // 通常ﾓｰﾄﾞ
            end
            else
            begin
                // 更新ﾎﾞﾀﾝは、入力不可の状態で起動する。
                // ﾏｽﾀをUpdata、Insertすることはできない。
                m_cJNTArea.Invalidity;
                giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
                m_IsUpdate  := false;
            end;
        end;
    end
    // 子会社(ｸﾞﾙｰﾌﾟ会計採用有)
    else if ( m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD ) then
    begin
        // 子会社が過年度DBの場合
        if ( m_SyncMaster.m_CEComKbn5 = 1 ) then
        begin
            MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_K,
                                'グループ会計', mjInformation, mjOk, mjDefOk);
            m_cJNTArea.Invalidity;
            giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
            m_IsUpdate  := false;
        end
        // 親会社が過年度DBの場合
        else if  ( m_SyncMaster.m_PEComKbn5 = 1 ) then
        begin
            MjsMessageBoxEx(Self, JNTSYNC_MSG_YokukiChk_Ko_O,
                                'グループ会計', mjInformation, mjOk, mjDefOk);
            m_cJNTArea.Invalidity;
            giReferFlag	:= REFER;	// 参照ﾓｰﾄﾞ
            m_IsUpdate  := false;
        end
        else
        begin
// <008> DEL
											// 「ｸﾞﾙｰﾌﾟ会計の子会社として採用されています。
										   	// 体系のみの修正が可能です。」
//			MjsMessageBoxEx(AOwner, MSG_GRP_CHILD_READONLY, MSGCAP_GRP, mjInformation, mjOk, mjDefOk);
        end;
    end;
// <SYNC> ADD end

end;

// <008> ADD start
//**********************************************************************
//*		Proccess	:	ｸﾞﾙｰﾌﾟ管理時の親会社DBﾄﾗﾝｻﾞｸｼｮﾝ処理 <008>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/05/08
//*		Parameter	:	iTrnKind	親会社DBへの指示
//*		Return		:	なし
//*		Comment		:	ｸﾞﾙｰﾌﾟ管理を採用していない、または親会社の処理中は
//*					:	何もしない。子会社選択中のみ親会社との同期を考慮する
//*		History		:	9999/99/99	X.Xxxx
//**********************************************************************
procedure TJNTCRP009002_5f.ExecParentDBTran(iTrnKind: Integer);
begin
											// ｸﾞﾙｰﾌﾟ管理採用 & 子会社選択時
	if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
	begin
		if m_SyncMaster.m_cPDBSelect = nil then
		begin
			Exit;
		end;

		case iTrnKind of
			GRP_PARENTDB_BEGINTRAN:			// ﾄﾗﾝｻﾞｸｼｮﾝ開始
			begin
				MDataModule.BeginTran(m_SyncMaster.m_cPDBSelect);
			end;
			GRP_PARENTDB_ROLLBACK:			// ﾛｰﾙﾊﾞｯｸ
			begin
				MDataModule.RollBack(m_SyncMaster.m_cPDBSelect);
			end;
			GRP_PARENTDB_COMMIT:			// ｺﾐｯﾄ
			begin
				MDataModule.Commit(m_SyncMaster.m_cPDBSelect);
			end;
		end;
	end;
end;
// <008> ADD end
// <009> ADD start
//**********************************************************************
//*		Proccess	:	ｸﾞﾙｰﾌﾟ管理時の一括配信ﾀﾞｲｱﾛｸﾞ呼出 <009>
//*		Name		:	K.Katou(PRIME)
//*		Date		:	2007/05/15
//*		Parameter	:	なし
//*		Return		:	なし
//*		History		:	9999/99/99	X.Xxxx
//**********************************************************************
procedure TJNTCRP009002_5f.CallSyncDlg();
var
	objSync	: TJNTSyncMasterIF;				// 配信ﾀﾞｲｱﾛｸﾞIF
	aryID 	: array[0..0] of Integer;
begin
	aryID[0] := JNTSYNC_SKMKMA;				// SKmkMA 管理科目

	objSync := TJNTSyncMasterIF.Create(AOwner, m_pMyAppRecord);

	try
		objSync.ShowDlg(aryID);
	finally
		objSync.Free;
	end;

end;
// <009> ADD end

//**********************************************************************
//	Proccess	:	ｾｯｼｮﾝ管理ｽﾄｱﾄﾞの実行	<012>
//	Name		:	T.Seki
//	Date		:	2008/02/19
//	Parameter	:	iSyori  0=設定 1=開放
//	Return		:	なし
//	History		:	9999/99/99  X.Xxxxxx
//					XXXXXXXX修正内容
//**********************************************************************
procedure TJNTCRP009002_5f.SessionPractice(iSyori: Integer);
begin
												// 処理区分
	SPMsHist.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
	SPMsHist.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
	SPMsHist.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
												// 担当者名称
	SPMsHist.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
	SPMsHist.ParamByName('@pSysCode').AsInteger			:= m_pMyAppRecord^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
	SPMsHist.ParamByName('@pOptCode').AsInteger			:= m_pMyAppRecord^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
	SPMsHist.ParamByName('@pPrgCode').AsInteger			:= m_pMyAppRecord^.m_iProgramCode;

// Delphi10 ST
//	SPMsHist.Prepare;							// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
    SPMsHist.FetchOptions.Items := SPMsHist.FetchOptions.Items - [fimeta];
// Delphi10 ED
	SPMsHist.ExecProc;							// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//	SPMsHist.UnPrepare;							// ﾘｿｰｽを解放する
// Delphi10 ED

												// ｸﾞﾙｰﾌﾟ会計の子会社の場合
	if	m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then
	begin
												// 処理区分
		SPMsHistParent.ParamByName('@pSyoriKbn').AsInteger		:= iSyori;
												// 履歴取得区分
		SPMsHistParent.ParamByName('@pMSHistKbn').AsInteger		:= 1;
												// 担当者内部ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pTanNCode').AsCurrency		:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoNCD;
												// 担当者名称
		SPMsHistParent.ParamByName('@pTanSimpleName').AsString	:= rcCOMMONAREA(m_pMyAppRecord^.m_pCommonArea^).TantoName;
												// ｼｽﾃﾑｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pSysCode').AsInteger		:= m_pMyAppRecord^.m_iSystemCode;
												// ｵﾌﾟｼｮﾝｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pOptCode').AsInteger		:= m_pMyAppRecord^.m_iOptionCode;
												// 処理ｺｰﾄﾞ
		SPMsHistParent.ParamByName('@pPrgCode').AsInteger		:= m_pMyAppRecord^.m_iProgramCode;

// Delphi10 ST
//		SPMsHistParent.Prepare;					// ﾊﾟﾗﾒｰﾀをﾊﾞｲﾝﾄﾞする
        SPMsHistParent.FetchOptions.Items := SPMsHistParent.FetchOptions.Items - [fimeta];
// Delphi10 ED
		SPMsHistParent.ExecProc;				// ｽﾄｱﾄﾞ実行
// Delphi10 ST
//		SPMsHistParent.UnPrepare;				// ﾘｿｰｽを解放する
// Delphi10 ED
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
function TJNTCRP009002_5f.fnDelCRLF(sData: String): String;
begin
	// 行区切り文字をCR/LFにしてカット
	Result := StringReplace(AdjustLineBreaks(sData), #13#10, '', [rfReplaceAll,rfIgnoreCase]);
end;

end.



