//=============================================================================
//
//      システム名  ：Ｇａｌｉｌｅｏｐｔ
//      処理名      ：取引先
//                    債務情報(印刷処理)
//
//      制作・著作  ：（株）ミロク情報サービス
//      開発元      ：リード（株）Ｓプロジェクト
//
//      作成者      ：茂木 勇次(LEAD)
//      作成日      ：2005.08.14(SUN)
//
//=============================================================================
//
//  修正履歴
//  <ﾏｰｸ> <修正者>      <修正日>        <修正内容>
//  <001>   広田　茂雄  2005/12/12      鏡欄税印字が出力されない対応
//  <002>   青木(PRIME) 2005/12/22　　　名寄せ子のｺｰﾄﾞ・名称のｱﾗｲﾒﾝﾄ設定
//  <003>   茂木 勇次   2006/02/07(TUE) 未対応の帳票の対応。
//  <004>   川戸 仁美   2006/10/01(MON) 連動得意先対応
//  <005>   川戸 仁美   2007/05/07(MON) 帳票レイアウトの変更
//  <006>   川戸 仁美   2007/08/27(MON) 預かり源泉税・支払調書対応
//  <007>   川戸 仁美   2008/02/29(FRI) 通知書名寄せ対応
//  <008>   T.SATOH(IDC)2008/09/29(MON) 印刷履歴スプール名改良
//  <009>   T.SATOH(IDC)2009/08/27(THU) 合計取引先リストの更新日時エリアの幅変更(デザインのみ)
//  <010>   MSI 小島	2011/03/15(THU) 部門入力フィールド追加(個別対応)
//  <011>   SATOH(GSOL) 2011.05.12(THU) 支払通知書メール配信対応
//                                      併せて<010>でのファイル出力部分をロールバック
//  <012>   MSI 小島	2011/07/20(WED) <011>でのファイル出力部分をロールバック
//  <AUT>   SATOH(GSOL) 2012.08.07(TUE) JNTAuthority対応
//  <#C16>  KUMO        2014.06.30(MON) 取引先コード16桁対応（デザインのみ）
//                                      ・取引先コードに長体をかけて修正
//=============================================================================
unit JNTCRP004005Lu;
                   
interface

uses
  Windows, Messages, SysUtils, Classes, VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, MJSCommonDialogs, Db,
  FireDAC.Comp.Client, IniFiles,

  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,
  //ppDBBDE,

  MJSCommonU, MjsDBModuleu, MjsPrnDlgu, MjsPrnSupportu, MjsPreviewIFu, MJSQuery,
  MjsDispCtrl,

  JNTSelDModul, JNTSelGlobal, JNTSelGlobalConst, JNTSelCorpSys, JNTExpGlobal,
  JNTAuthorityu,   //  <AUT> ADD
  dxmdaset, JNTCommonu, ppDesignLayer, ppParameter;

type
{$include JNTSelPrtIF.inc}

  TDmJNTCRP004005L = class(TDataModule)
    ppRepShosaiJ: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine47: TppLine;
    ppLine73: TppLine;
    ppLabel70: TppLabel;
    ppLabel74: TppLabel;
    ppLabel76: TppLabel;
    CorpCode1: TppLabel;
    CorpName1: TppLabel;
    LabelTitle1: TppLabel;
    LineTitle1: TppLine;
    SVppDate1: TppSystemVariable;
    ppLine92: TppLine;
    ppLine112: TppLine;
    ppLine113: TppLine;
    ppDetailBand1: TppDetailBand;
    ppStandardUnderLine1: TppLine;
    DBTxt_S_GCode: TppDBText;
    ppDBText92: TppDBText;
    ppDBText108: TppDBText;
    ppDBText115: TppDBText;
    ppLine93: TppLine;
    ppLine97: TppLine;
    ppLine99: TppLine;
    ppFooterBand5: TppFooterBand;
    SVppPage1: TppSystemVariable;
    ppDBText1: TppDBText;
    ppRep_S_PostLine: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppDBText28: TppDBText;
    dsShosaiJ: TDataSource;
    PipelineShosaiJ: TppDBPipeline;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText46: TppDBText;
    ppLine12: TppLine;
    LabelSubTitle1: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    DBTxt_S_BmNCd: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    DBTxt_S_TnNCd: TppDBText;
    ppDBText13: TppDBText;
    ppDBText32: TppDBText;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppDBText16: TppDBText;
    ppRepNayose: TppReport;
    ppHeaderBand2: TppHeaderBand;
    CorpCode3: TppLabel;
    LabelTitle3: TppLabel;
    LineTitle3: TppLine;
    SVppDate3: TppSystemVariable;
    CorpName3: TppLabel;
    LabelSubTitle3: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppRep_N_NayoseOya: TppLabel;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine36: TppLine;
    ppRep_N_Siharaisaki: TppLabel;
    ppDetailBand3: TppDetailBand;
    DBTxt_N_OyaHojCd: TppDBText;
    DBTxt_N_OyaName: TppDBText;
    ppLine129: TppLine;
    ppLine133: TppLine;
    ppLine134: TppLine;
    DBTxt_N_SName: TppDBText;
    DBTxt_N_HojCd: TppDBText;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand2: TppFooterBand;
    SVppPage3: TppSystemVariable;
    ppPageStyle1: TppPageStyle;
    PipelineNayose: TppDBPipeline;
    dsKanryakuJ: TDataSource;
    PipelineKanryakuJ: TppDBPipeline;
    ppRepKanryakuJ: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLine30: TppLine;
    ppLine53: TppLine;
    ppRep_K_GCode: TppLabel;
    ppRep_K_Nm: TppLabel;
    ppRep_K_Nmk: TppLabel;
    ppRep_K_Renso: TppLabel;
    ppLine54: TppLine;
    ppLine55: TppLine;
    K_HeaderUnderLine: TppLine;
    K_Header_UpperLine: TppLine;
    ppLine126: TppLine;
    CorpCode0: TppLabel;
    CorpName0: TppLabel;
    LabelTitle0: TppLabel;
    LineTitle0: TppLine;
    SVppDate0: TppSystemVariable;
    LabelSubTitle0: TppLabel;
    ppDetailBand0: TppDetailBand;
    DBTxt_K_GCode: TppDBText;
    DBTxt_K_Nm: TppDBText;
    DBTxt_K_Nmk: TppDBText;
    DBTxt_K_Renso: TppDBText;
    ppLine61: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine67: TppLine;
    ppStandardUnderLine0: TppLine;
    DBImg_K_Fusen: TppDBImage;
    ppFooterBand3: TppFooterBand;
    SVppPage0: TppSystemVariable;
    dsGoukeiJ: TDataSource;
    PipelineGoukeiJ: TppDBPipeline;
    ppRepGoukeiJ: TppReport;
    dsNayose: TDataSource;
    ppLabel2: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    DBTxt_S_RendoCd: TppDBText;
    ppDBText12: TppDBText;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    ppDBText9: TppDBText;
    ppDBText18: TppDBText;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel26: TppLabel;
    ppLine9: TppLine;
    ppLabel27: TppLabel;
    ppLine10: TppLine;
    ppLabel28: TppLabel;
    ppLine5: TppLine;
    ppDBText19: TppDBText;
    ppLine6: TppLine;
    ppLine11: TppLine;
    ppStandardUnderLine3: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText63: TppDBText;
    ppLine19: TppLine;
    ppLine20: TppLine;
    GroupUnderLine3: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine13: TppLine;
    ppHeaderBand7: TppHeaderBand;
    G_HeaderUnderLine: TppLine;
    ppLine71: TppLine;
    ppLine138: TppLine;
    ppRep_G_GCode: TppLabel;
    ppRep_G_Nm: TppLabel;
    ppRep_G_Nmk: TppLabel;
    ppRep_G_Renso: TppLabel;
    CorpCode2: TppLabel;
    CorpName2: TppLabel;
    LineTitle2: TppLine;
    SVppDate2: TppSystemVariable;
    ppLine141: TppLine;
    ppLine142: TppLine;
    LabelTitle2: TppLabel;
    G_Header_UpperLine: TppLine;
    ppLine122: TppLine;
    LabelSubTitle2: TppLabel;
    ppLine18: TppLine;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel40: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppDetailBand2: TppDetailBand;
    DBTxt_G_GCode: TppDBText;
    DBTxt_G_Nm: TppDBText;
    DBTxt_G_Nmk: TppDBText;
    DBTxt_G_Renso: TppDBText;
    ppLine150: TppLine;
    ppLine153: TppLine;
    ppLine154: TppLine;
    ppLine156: TppLine;
    DBTxt_G_PostNo1: TppDBText;
    DBTxt_G_Ads1: TppDBText;
    DBTxt_G_PostNo2: TppDBText;
    ppLine161: TppLine;
    ppRep_G_PostLine: TppLabel;
    ppStandardUnderLine2: TppLine;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    DBTxt_G_BmNCd: TppDBText;
    DBTxt_G_TnNCd: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    DBTxt_G_RendoCd: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    DBTxt_G_CngCd: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppFooterBand7: TppFooterBand;
    SVppPage2: TppSystemVariable;
    DBLbl_S_GenKbn: TppLabel;
    DBLbl_S_PerKbn: TppLabel;
    DBTxt_S_GenKbn: TppDBText;
    DBTxt_S_GenKbnNM: TppDBText;
    DBTxt_S_PerKbn: TppDBText;
    DBTxt_S_PerKbnNM: TppDBText;
    DBLbl_G_GenKbn: TppLabel;
    DBLbl_G_PerKbn: TppLabel;
    DBTxt_G_GenKbn: TppDBText;
    DBTxt_G_GenKbnNM: TppDBText;
    DBTxt_G_PerKbn: TppDBText;
    DBTxt_G_PerKbnNM: TppDBText;
    DBTxt_S_BmNCode: TppDBText;
    DBTxt_S_BmNName: TppDBText;
    DBTxt_S_BmnTitle: TppDBText;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText57: TppDBText;
    ppLabel31: TppLabel;
    ppDBText60: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppLabel32: TppLabel;

	constructor     CreateModule        (AOwner:TComponent;pRec: Pointer);
    procedure       DataModuleDestroy   (Sender: TObject);
    procedure       ppRepBeforePrint    (Sender: TObject);
    procedure       fnCmnBeforeGenerate (Sender: TObject);
    procedure ppGroupHeaderBand1BeforeGenerate(Sender: TObject);                      // <003>
  private
    { Private 宣言 }
	m_pRec          :   ^TMjsAppRecord;
	m_pMDataModule  :   ^TMDataModulef;
	m_pCommonArea   :   ^rcCOMMONAREA;	    // 共通ｴﾘｱ
	MJSPrnDlgf	    :	TMJSPrnDlgf;		// 印刷ﾀﾞｲｱﾛｸﾞ
	PrnSupport      :	TMjsPrnSupport;		// 印刷設定
    mjspre		    :	TMjsPreviewIF;		// ﾌﾟﾚﾋﾞｭｰ
	uvSelSys        :   TJNTSelCorpSys;     // 会社ｼｽﾃﾑ情報
    uvHani		    :	TJNTHani;           //
    Owner           :   TComponent;
    m_cJNTArea      :   TJNTCommon;
    m_Pattern 		:	Integer;            // <005> Add
    m_FeeBmnFlg		:	Integer;			// <010> Add

	procedure   ppReport1FileOut            ();
    procedure   fnInzPrint                  ();                                 // <003>
	procedure	fnAPGChk(var m_FeeBmnFlg : Integer);							// <010>

  public
    { Public 宣言 }
    JNTAuthority  :   TJNTAuthority;        // <AUT> ADD

	procedure DoPrint       (Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata; CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
	function  fnIsPreview   (): Boolean;

  end;

// { Exports関数宣言 } <PRN>
function PrintAppEntry(	AOwner		:   TComponent;
						pRec		:   Pointer;
						Mode		:   Integer;
						PrtParam	:   rcPrtParam;
                        var ArHdl   :   Array of Pointer) : Integer;
exports
	PrintAppEntry;

var
  DmJNTCRP004005L: TDmJNTCRP004005L;

  giIndex       :   Integer;	// ﾌｫｰﾑ配列検索ｲﾝﾃﾞｯｸｽ。
  uvCSVFileName :   String;     // <003>
  uvRepTitleName:   String;     // <005> Add

implementation

uses
    JNTSelError,
    Vcl.Samples.Calendar;

{$R *.DFM}

//-----------------------------------------------------------------------------
//  PrintAppEntry<kfrm>追加<dou>内容大幅変更<dou2>内容大幅変更、ｺﾋﾟｰし直してください。
//	  ｴﾝﾄﾘｰ関数群	 <BPL>
//	  親ﾌｫｰﾑから呼ばれる関数 <PRN>
//-----------------------------------------------------------------------------
function PrintAppEntry(	AOwner		:   TComponent;   // 親ﾌｫｰﾑ
						pRec		:   Pointer;      //
						Mode		:   Integer;      //
                        PrtParam	:   rcPrtParam;
                        var ArHdl   :   Array of Pointer) : Integer;
var
    i       :   Integer;                // ArHdlの添え字。
	pFrm    :   ^TDmJNTCRP004005L;
begin

	Result  :=  ACTID_RET_OK;

    case Mode of
        // ------------------------
        //      CreateModule
        // ------------------------
		0:
		begin
			new( pFrm );
			try
                // ｺﾝｽﾄﾗｸﾀのｴﾗｰは例外で拾う
				pFrm^   :=  TDmJNTCRP004005L.CreateModule( AOwner,pRec );
                pFrm^.JNTAuthority := TJNTAuthority(ArHdl[0]^);     // <AUT> ADD
                { <dou2>ArHdlを検索して、Nilの場所にﾌｫｰﾑﾎﾟｲﾝﾀを代入。 }
				{ そのときのｲﾝﾃﾞｯｸｽを保持しておく。 }
                for i := 0 to PrtParam.iAPP_HDL_REC do
                begin
                    if ( ArHdl[i] = nil ) then
                    begin
                        ArHdl[i]    :=  pFrm;
                        giIndex     :=  i;
                        break;
                    end;
                end;
			except
				Dispose( pFrm );
				Result  :=  ACTID_RET_NG;
			end;
		end;
        // ------------------------
        //        DoPrint
        // ------------------------
		1:
		begin
    		pFrm    :=  Pointer( ArHdl[giIndex] );
			pFrm^.DoPrint( PrtParam.Para, PrtParam.TargetQry, PrtParam.TargetMD, PrtParam.CorpSys, PrtParam.JNTArea);
		end;
        2:
        begin
            pFrm    :=  Pointer( ArHdl[giIndex] );
            pFrm^.fnIsPreview;
        end;
		3:
		begin
            pFrm    :=  Pointer( ArHdl[giIndex] );
            ArHdl[giIndex] := nil;
            pFrm^.Free();
		end;
	end;

end;

//------------------------------------------------------------------------------
//	Constructor
//------------------------------------------------------------------------------
constructor TDmJNTCRP004005L.CreateModule( AOwner:TComponent;pRec:Pointer );
begin

    // ﾒﾝﾊﾞ変数にｾｯﾄ
	m_pRec		    :=  pRec;
	m_pMDataModule	:=  m_pRec^.m_pDBModule;
	m_pCommonArea	:=  m_pRec^.m_pCommonArea;
    Owner           :=  AOwner;

	inherited Create( AOwner );

end;

procedure TDmJNTCRP004005L.DataModuleDestroy(Sender: TObject);
begin
end;

//------------------------------------------------------------------------------
//  印刷処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004005L.DoPrint(Para: TJNTHani; TargetQry: TFDQuery; TargetMD: TdxMemdata;
                                   CorpSys: TJNTSelCorpSys; JNTArea: TJNTCommon);
var
	i       :   Integer;
    wRep    :   TppReport;  // <003>
begin
	uvHani      := Para;
  	MJSPrnDlgf	:= uvHani.MJSPrnDlgf;
	PrnSupport  := uvHani.PrnSupport;
    mjspre		:= uvHani.mjspre;
    uvSelSys    := CorpSys;
    m_cJNTArea  := JNTArea;
	gfnSelSetPrnInfo (PrnSupport, CorpSys);
    m_Pattern 	:= 0;       // <005> Add

    // ﾃﾞｰﾀの存在ﾁｪｯｸ
    if ( TargetMD.RecordCount = 0 ) then
    begin
		uvSelSys.MsgDlg(2010,10);
        Exit;
    end;

    // ↓↓↓<003>
    wRep := nil;
    case uvHani.pvrPattern of
        // 実在取引先債務情報登録ﾘｽﾄ(簡略型)
        0:  begin
                wRep                    :=  ppRepKanryakuJ;
                dsKanryakuJ.DataSet     :=  TargetMD;
                uvCSVFileName           :=  '実在取引先債務情報登録リスト(簡略型)';
                uvRepTitleName			:=	'実在取引先登録リスト';             // <005> Add
                m_Pattern 				:=	0;
            end;
        // 実在取引先債務情報登録ﾘｽﾄ(詳細型)
        1:  begin
                wRep                    :=  ppRepShosaiJ;
                dsShosaiJ.DataSet       :=  TargetMD;
                uvCSVFileName           :=  '実在取引先債務情報登録リスト(詳細型)';
                uvRepTitleName			:=	'実在取引先登録リスト';             // <005> Add
                m_Pattern 				:=	1;
            end;
// <005> 2007/05/07 H.Kawato Mod Start
{
        // 合計取引先債務情報登録ﾘｽﾄ
        2:  begin
                wRep                    :=  ppRepGoukeiJ;
                dsGoukeiJ.DataSet       :=  TargetMD;
                uvCSVFileName           :=  '合計取引先債務情報登録リスト';
            end;
        // 取引先債務情報 名寄せ登録ﾘｽﾄ
        3:  begin
                wRep                    :=  ppRepNayose;
                dsNayose.DataSet        :=  TargetMD;
                uvCSVFileName           :=  '取引先債務情報 名寄せ登録リスト';
            end;
}
        // 実在取引先債務情報登録ﾘｽﾄ(簡略型)
        2:  begin
                wRep                    :=  ppRepKanryakuJ;
                dsKanryakuJ.DataSet     :=  TargetMD;
                uvCSVFileName           :=  '合計取引先債務情報登録リスト(簡略型)';
                uvRepTitleName			:=	'合計取引先登録リスト';             // <005> Add
                m_Pattern 				:=	0;
            end;
        // 合計取引先債務情報登録ﾘｽﾄ
        3:  begin
                wRep                    :=  ppRepGoukeiJ;
                dsGoukeiJ.DataSet       :=  TargetMD;
                uvCSVFileName           :=  '合計取引先債務情報登録リスト(詳細型)';
                uvRepTitleName			:=	'合計取引先登録リスト';             // <005> Add
                m_Pattern 				:=	2;
            end;
        // 取引先債務情報 名寄せ登録ﾘｽﾄ
//        4:  begin
        4, 5:  begin    // <007> Mod
                wRep                    :=  ppRepNayose;
                dsNayose.DataSet        :=  TargetMD;
// <007> 2008/02/29 H.Kawato Mod
//                uvCSVFileName           :=  '取引先債務情報 名寄せ登録リスト';
                if (uvHani.pvrPattern = 4) then
                    uvCSVFileName       :=  '取引先債務情報 名寄せ登録リスト'
                else
                    uvCSVFileName       :=  '取引先債務情報 通知書名寄せ登録リスト';
// <007> 2008/02/29 H.Kawato Mod
                uvRepTitleName			:=	'取引先名寄せ情報登録リスト';       // <005> Add
                m_Pattern 				:=	3;
            end;
// <005> 2007/05/07 H.Kawato Mod End
    end;

    // 印刷初期化処理
    fnInzPrint;

    PrnSupport.ApRB				:=  wRep;
// <008> MOD-STR
//    PrnSupport.strDocName		:=  uvHani.pvrRepTitle;
    PrnSupport.strDocName		:=  uvHani.pvrRepTitle + '[' + uvHani.pvrOrderNM + ']';
// <008> MOD-END

    PrnSupport.pComArea 		:=  m_pRec^.m_pCommonArea;
    PrnSupport.MdataModule	    :=	m_pMDataModule^;            // 共通DB用ﾃﾞｰﾀﾓｼﾞｭｰﾙ
    PrnSupport.iDspWriteBtn	    :=  0;                          // 保存ﾎﾞﾀﾝ制御(0:表示する)
    //PrnSupport.iReportID		:=  uvHani.pvrGrpNO;            // 帳票ｸﾞﾙｰﾌﾟNo
    PrnSupport.iReportID		:=  10000;                      // 帳票ｸﾞﾙｰﾌﾟNo

    // ↑↑↑<003>

    // 抽出権限なし⇒ﾌｧｲﾙ出力非表示
// <AUT> MOD-STR
//  if ( m_cJNTArea.IsExtract = FALSE )  then
    if (JNTAuthority.IsExtract = FALSE)  then
// <AUT> MOD-END
	    PrnSupport.iDspFileBtn	:=  0
    // 抽出権限あり⇒ﾌｧｲﾙ出力表示
	else
   	    PrnSupport.iDspFileBtn	:=  1;

    // 印刷ﾀﾞｲｱﾛｸﾞ表示
	i := MJSPrnDlgf.DoDLG( PrnSupport );

	if ( i > 0 ) then
	begin
    	// 戻り値が「ﾌﾟﾚﾋﾞｭｰ」かつ、他のAPでﾌﾟﾚﾋﾞｭｰ起動中はｴﾗｰ
    	if (mjspre.IsExistPreview) and
           (PrnSupport.iCommand = PDLG_PREVIEW) then
        begin
			MessageBeep(MB_OK);
			MjsMessageBox(Owner,'他のプログラムでプレビューが起動中です。', mjError, mjDefOk);	//<DSP>
           Exit;
        end;

    	// 印刷orﾌﾟﾚﾋﾞｭｰ
        case PrnSupport.iCommand of
            PDLG_PRINT,
            PDLG_PREVIEW:	mjspre.Exec(PrnSupport, MJSPrnDlgf, ppReport1FileOut);
            PDLG_FILE:      ppReport1FileOut;
        end;
	end;

end;

//------------------------------------------------------------------------------
// ファイル出力処理 <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004005L.ppReport1FileOut();
var
    sTitle      : TStringList;
    sMemFld     : TStringList;
    ds          : TDataSource;
    iVerData    : Integer;  // <006> Add
begin
    sTitle  :=  TStringList.Create;
    sMemFld :=  TStringList.Create;
    ds      :=  nil;

// <005> 2007/05/07 H.Kawato Mod Start
{
    case uvHani.pvrPattern of
        // 実在取引先債務情報登録ﾘｽﾄ(簡略型)
        0:
        begin
            ds  :=  dsKanryakuJ;

            sTitle.Add('取引先ｺｰﾄﾞ'             );
        	sTitle.Add('連想'                   );
    	    sTitle.Add('簡略名称'               );
        	sTitle.Add('正式名称'               );

            sMemFld.Add('GCode'                 );
            sMemFld.Add('Renso'                 );
            sMemFld.Add('Nmk'                   );
            sMemFld.Add('Nm'                    );
        end;
        // 実在取引先債務情報登録ﾘｽﾄ(詳細型)
        1:
        begin
            ds  :=  dsShosaiJ;

            sTitle.Add('取引先ｺｰﾄﾞ'             );
            sTitle.Add('連想'                   );
            sTitle.Add('簡略名称'               );
            sTitle.Add('正式名称'               );
            sTitle.Add('郵便番号（基番）'       );
            sTitle.Add('郵便番号（枝番）'       );
            sTitle.Add('適用期間（開始）'       );
            sTitle.Add('適用期間（終了）'       );
            sTitle.Add('更新日'                 );
            sTitle.Add('住所上段'               );
            sTitle.Add('住所下段'               );
            sTitle.Add('電話番号１'             );
            sTitle.Add('送付先部署名'           );
            sTitle.Add('担当者名'               );
            sTitle.Add('敬称'                   );
            sTitle.Add('担当者ﾒｰﾙｱﾄﾞﾚｽ'         );
            sTitle.Add('部門ｺｰﾄﾞ'               );
            sTitle.Add('部門名'                 );
            sTitle.Add('担当者ｺｰﾄﾞ'             );
            sTitle.Add('担当者名'               );
            sTitle.Add('仕入通知書ﾌｫｰﾑｺｰﾄﾞ'     );
            sTitle.Add('仕入通知書ﾌｫｰﾑ名称'     );
// <001>    sTitle.Add('仕入合計欄税印字ｺｰﾄﾞ'   );
// <001>    sTitle.Add('仕入合計欄税印字名称'   );
            sTitle.Add('鏡欄税印字区分'         );	// <001>
            sTitle.Add('鏡欄税印字名称'         );  // <001>
            sTitle.Add('連動得意先ｺｰﾄﾞ'         );	// <004>
            sTitle.Add('連動得意先名称'         );  // <004>

            sMemFld.Add('GCode'                 );	// 取引先ｺｰﾄﾞ
            sMemFld.Add('Renso'                 );	// 連想
            sMemFld.Add('Nmk'                   );	// 簡略名称
            sMemFld.Add('Nm'                    );	// 正式名称
            sMemFld.Add('PostNo1'               );	// 郵便番号（基番）
            sMemFld.Add('PostNo2'               );	// 郵便番号（枝番）
            sMemFld.Add('TStartDate'            );	// 適用期間（開始）
            sMemFld.Add('TEndDate'              );	// 適用期間（終了）
            sMemFld.Add('UpdDateTm'             );	// 更新日
            sMemFld.Add('Ads1'                  );	// 住所上段
            sMemFld.Add('Ads2'                  );	// 住所下段
            sMemFld.Add('Tel1'                  );	// 電話番号１
            sMemFld.Add('SectNm'                );	// 送付先部署名
            sMemFld.Add('TanNm'                 );	// 担当者名
            sMemFld.Add('Keisyo'                );	// 敬称
            sMemFld.Add('Mail'                  );	// 担当者ﾒｰﾙｱﾄﾞﾚｽ
            sMemFld.Add('BmNCd'                 );	// 部門ｺｰﾄﾞ
            sMemFld.Add('BmNm'                  );	// 部門名
            sMemFld.Add('TnNm'                  );	// 担当者ｺｰﾄﾞ
            sMemFld.Add('TnNCd'                 );	// 担当者名
            sMemFld.Add('USDenPfm'              );	// 仕入通知書ﾌｫｰﾑｺｰﾄﾞ
            sMemFld.Add('USDenPfmNm'            );	// 仕入通知書ﾌｫｰﾑ名称
            sMemFld.Add('USGKei'                );	// 仕入合計欄税印字ｺｰﾄﾞ
            sMemFld.Add('USGKeiNm'              );  // 仕入合計欄税印字名称
            sMemFld.Add('RendoCode'             );	// 連動得意先ｺｰﾄﾞ   <004>
            sMemFld.Add('RendoNmk'              );  // 連動得意先名称   <004>
        end;
        // 合計取引先債務情報登録ﾘｽﾄ
        2:
        begin
            ds  :=  dsGoukeiJ;

            sTitle.Add('取引先ｺｰﾄﾞ'             );
        	sTitle.Add('連想'                   );
    	    sTitle.Add('簡略名称'               );
        	sTitle.Add('正式名称'               );
        	sTitle.Add('郵便番号（基番）'       );
    	    sTitle.Add('郵便番号（枝番）'       );
    	    sTitle.Add('住所'                   );

            sMemFld.Add('strExCode'             );
            sMemFld.Add('strAssociation'        );
            sMemFld.Add('strNameSimple'         );
            sMemFld.Add('strName'               );
            sMemFld.Add('nZipCodeUpper'         );
            sMemFld.Add('nZipCodeLower'         );
            sMemFld.Add('strAddress'            );
        end;
        // 取引先債務情報 名寄せ登録ﾘｽﾄ
        3:
        begin
            ds  :=  dsNayose;

            sTitle.Add('名寄せ支払先(親)ｺｰﾄﾞ'   );
        	sTitle.Add('名寄せ支払先(親)名称'   );
            sTitle.Add('支払先名称ｺｰﾄﾞ'         );
        	sTitle.Add('支払先名称略称'         );

            sMemFld.Add('OyaHojCD'              );  // 名寄せ支払先(親)ｺｰﾄﾞ
        	sMemFld.Add('OyaName'               );	// 名寄せ支払先(親)名称
            sMemFld.Add('HojCode'               );	// 支払先名称ｺｰﾄﾞ
        	sMemFld.Add('SName'                 );	// 支払先名称略称
        end;
    end;
}
    case uvHani.pvrPattern of
        // 実在取引先債務情報登録ﾘｽﾄ(簡略型)
        0, 2:
        begin
            ds  :=  dsKanryakuJ;

            sTitle.Add('取引先ｺｰﾄﾞ'             );
        	sTitle.Add('正式名称'               );
    	    sTitle.Add('簡略名称'               );
        	sTitle.Add('連想'                   );

            sMemFld.Add('GCode'                 );
            sMemFld.Add('Nm'                    );
            sMemFld.Add('Nmk'                   );
            sMemFld.Add('Renso'                 );
        end;
        // 実在取引先債務情報登録ﾘｽﾄ(詳細型)
        1, 3:
        begin
            if (uvHani.pvrPattern = 3) then         // 合計
                ds  :=  dsGoukeiJ
            else
                ds  :=  dsShosaiJ;                  // 詳細

            iVerData    := ds.DataSet.FieldByName ('VerData').AsInteger;        // <006> Add

            sTitle.Add('取引先ｺｰﾄﾞ'             );
            sTitle.Add('連想'                   );
            sTitle.Add('簡略名称'               );
            sTitle.Add('正式名称'               );
            sTitle.Add('郵便番号（基番）'       );
            sTitle.Add('郵便番号（枝番）'       );
            sTitle.Add('住所上段'               );
            sTitle.Add('住所下段'               );
//            sTitle.Add('適用期間（開始）'       );
//            sTitle.Add('適用期間（終了）'       );
            sTitle.Add('更新日時'               );
            sTitle.Add('電話番号１'             );
            sTitle.Add('送付先部署名'           );
            sTitle.Add('担当者名'               );
            sTitle.Add('敬称'                   );
            sTitle.Add('担当者ﾒｰﾙｱﾄﾞﾚｽ'         );
// <012> Mod start
// <011> DEL-STR
{           sTitle.Add('担当者ｺｰﾄﾞ'				);
            // <010> Mod start
            {
// <011> DEL-END
            sTitle.Add('部門ｺｰﾄﾞ'				);
            sTitle.Add('部門名'					);
            sTitle.Add('担当者ｺｰﾄﾞ'             );
            sTitle.Add('担当者名'               );
// <011> DEL-STR
            }
			if (uvHani.pvrPattern = 1) then         // 詳細
            begin
                if(m_FeeBmnFlg = 1) then
                begin
                    sTitle.Add('部門ｺｰﾄﾞ'			);
                    sTitle.Add('部門名'				);
                end;
            end;									// <012> Add
            // <010> Mod end
// <011> DEL-END
// <012> Mod end
            sTitle.Add('仕入通知書ﾌｫｰﾑｺｰﾄﾞ'     );
            sTitle.Add('仕入通知書ﾌｫｰﾑ名称'     );
            sTitle.Add('鏡欄税印字区分'         );	// <001>
            sTitle.Add('鏡欄税印字名称'         );  // <001>
            sTitle.Add('受取人名称'             );	// <005>
            sTitle.Add('支払通知書区分'         );	// <005>
            sTitle.Add('支払通知書区分名称'     );	// <005>
            sTitle.Add('連動得意先ｺｰﾄﾞ'         );	// <004>
            sTitle.Add('連動得意先名称'         );  // <004>

// <006> 2007/08/27 H.Kawato Add Start
            if (uvHani.pvrPattern = 1) then         // 実在
            begin
                // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
                if (iVerData > 5) then
                begin
                    sTitle.Add('支払調書採用区分'       );
                    sTitle.Add('支払調書採用区分名称'   );
                    sTitle.Add('個人／法人区分'         );
                    sTitle.Add('個人／法人区分名称'     );
                end;
            end;
// <006> 2007/08/27 H.Kawato Add End

            if (uvHani.pvrPattern = 3) then
            begin
                sTitle.Add('請求区分'               );	// <005>
                sTitle.Add('請求区分名称'           );	// <005>
                sTitle.Add('名寄せ親代替仕入先ｺｰﾄﾞ' );	// <005>
                sTitle.Add('名寄せ親代替仕入先名称' );	// <005>
            end;

// <011> ADD-STR
            sTitle.Add('支払通知書メール配信採用区分'       );
            sTitle.Add('支払通知書メール配信採用区分名称'   );
            sTitle.Add('パスワード'                         );
// <011> ADD-STR

            sMemFld.Add('GCode'                 );	// 取引先ｺｰﾄﾞ
            sMemFld.Add('Renso'                 );	// 連想
            sMemFld.Add('Nmk'                   );	// 簡略名称
            sMemFld.Add('Nm'                    );	// 正式名称
            sMemFld.Add('PostNo1'               );	// 郵便番号（基番）
            sMemFld.Add('PostNo2'               );	// 郵便番号（枝番）
            sMemFld.Add('Ads1'                  );	// 住所上段
            sMemFld.Add('Ads2'                  );	// 住所下段
//            sMemFld.Add('TStartDate'            );	// 適用期間（開始）
//            sMemFld.Add('TEndDate'              );	// 適用期間（終了）
            sMemFld.Add('UpdDateTm'             );	// 更新日
            sMemFld.Add('Tel1'                  );	// 電話番号１
            sMemFld.Add('SectNm'                );	// 送付先部署名
            sMemFld.Add('TanNm'                 );	// 担当者名
            sMemFld.Add('Keisyo'                );	// 敬称
            sMemFld.Add('Mail'                  );	// 担当者ﾒｰﾙｱﾄﾞﾚｽ
// <012> Mod start
// <011> DEL-STR
{            // <010> Mod start
            {
// <011> DEL-END
            sMemFld.Add('BmNCd'                 );	// 部門ｺｰﾄﾞ
            sMemFld.Add('BmNm'                  );	// 部門名
            sMemFld.Add('TnNm'                  );	// 担当者ｺｰﾄﾞ
            sMemFld.Add('TnNCd'                 );	// 担当者名
// <011> DEL-STR
            }
// <012> Add start
			if (uvHani.pvrPattern = 1) then         // 詳細
            begin
// <012> Add end
                if(m_FeeBmnFlg = 1) then
                begin
                    sMemFld.Add('BmNCd'			);	// 部門ｺｰﾄﾞ
                    sMemFld.Add('BmNm' 			);	// 部門名
                end;
            end;									// <012> Add
            // <010> Mod end}
// <011> DEL-END
// <012> Mod end
            sMemFld.Add('USDenPfm'              );	// 仕入通知書ﾌｫｰﾑｺｰﾄﾞ
            sMemFld.Add('USDenPfmNm'            );	// 仕入通知書ﾌｫｰﾑ名称
            sMemFld.Add('USGKei'                );	// 仕入合計欄税印字ｺｰﾄﾞ
            sMemFld.Add('USGKeiNm'              );  // 仕入合計欄税印字名称
            sMemFld.Add('UketoriName'           );  // 受取人名称         <005>
            sMemFld.Add('LetterKbn'             );  // 支払通知書区分     <005>
            sMemFld.Add('LetterKbnName'         );  // 支払通知書区分名称 <005>
            sMemFld.Add('RendoCode'             );	// 連動得意先ｺｰﾄﾞ   <004>
            sMemFld.Add('RendoNmk'              );  // 連動得意先名称   <004>

// <006> 2007/08/27 H.Kawato Add Start
            if (uvHani.pvrPattern = 1) then         // 実在
            begin
                // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
                if (iVerData > 5) then
                begin
                    sMemFld.Add('GensenKbn'         );  // 支払調書採用区分
                    sMemFld.Add('GensenKbnName'     );  // 支払調書採用区分名称
                    sMemFld.Add('PersonKbn'         );  // 個人／法人区分
                    sMemFld.Add('PersonKbnName'     );  // 個人／法人区分名称
                end;
            end;
// <006> 2007/08/27 H.Kawato Add End

            if (uvHani.pvrPattern = 3) then
            begin
                sMemFld.Add('UsKinKbn'          );	// 請求区分
                sMemFld.Add('UsKinKbnNm'        );	// 請求区分名称
                sMemFld.Add('CngGCode'          );	// 名寄せ親代替仕入先ｺｰﾄﾞ
                sMemFld.Add('CngName'           );  // 名寄せ親代替仕入先名称
            end;

// <011> ADD-STR
            sMemFld.Add('MailKbn'           );  // 支払通知書メール配信採用区分
            sMemFld.Add('MailKbnName'       );  // 支払通知書メール配信採用区分名称
            sMemFld.Add('Password'          );  // パスワード
// <011> ADD-STR
        end;
        // 取引先債務情報 名寄せ登録ﾘｽﾄ
//        4:
        4, 5:   // <007> Mod
        begin
            ds  :=  dsNayose;

            sTitle.Add('名寄せ親仕入先ｺｰﾄﾞ'   	);
            sTitle.Add('名寄せ親仕入先名称'   	);
		    sTitle.Add('請求区分'	 			);
            sTitle.Add('締め日１'         		);
            sTitle.Add('予定月１'         		);
            sTitle.Add('予定日１'         		);
            sTitle.Add('休日１'         		);
            sTitle.Add('締め日２'         		);
            sTitle.Add('予定月２'         		);
            sTitle.Add('予定日２'         		);
            sTitle.Add('休日２'         		);
            sTitle.Add('締め日３'         		);
            sTitle.Add('予定月３'         		);
            sTitle.Add('予定日３'         		);
            sTitle.Add('休日３'         		);
            sTitle.Add('代替'         			);
            sTitle.Add('子仕入先ｺｰﾄﾞ'   		);
            sTitle.Add('子仕入先名称'   		);

            sMemFld.Add('OyaHojCD'              );  // 名寄せ親仕入先ｺｰﾄﾞ
            sMemFld.Add('OyaName'               );	// 名寄せ親仕入先名称
            sMemFld.Add('SeikyuKbnNm'           );	// 請求区分
            sMemFld.Add('PCloseDay1Nm'          );	// 締め日１
            sMemFld.Add('PayMonth1Nm'           );	// 予定月１
            sMemFld.Add('PayDay1Nm'             );	// 予定日１
            sMemFld.Add('PHolidayKbn1Nm'        );	// 休日１
            sMemFld.Add('PCloseDay2Nm'          );	// 締め日２
            sMemFld.Add('PayMonth2Nm'           );	// 予定月２
            sMemFld.Add('PayDay2Nm'             );	// 予定日２
            sMemFld.Add('PHolidayKbn2Nm'        );	// 休日２
            sMemFld.Add('PCloseDay3Nm'          );	// 締め日３
            sMemFld.Add('PayMonth3Nm'           );	// 予定月３
            sMemFld.Add('PayDay3Nm'             );	// 予定日３
            sMemFld.Add('PHolidayKbn3Nm'        );	// 休日３
            sMemFld.Add('DaitaiMark'            );	// 代替
            sMemFld.Add('HojCode'               );	// 子仕入先ｺｰﾄﾞ
            sMemFld.Add('SName'                 );	// 子仕入先名称
        end;
    end;
// <005> 2007/05/07 H.Kawato Mod End

    if ( MjsFileOut(ds.DataSet, sMemFld, sTitle, PrnSupport, m_pRec ) = -1 ) then
    begin
       MessageBeep(MB_OK);
       MessageDlg('ファイル出力に失敗しました。', mtError, [mbOk], 0);
    end;

    sTitle.Free();
    sMemFld.Free();

end;

//------------------------------------------------------------------------------
// プレビューの状態を取得する
//------------------------------------------------------------------------------
function  TDmJNTCRP004005L.fnIsPreview: Boolean;
begin

	Result := mjspre.IsPreView;

end;

//------------------------------------------------------------------------------
// レポート印刷前処理
//------------------------------------------------------------------------------
procedure TDmJNTCRP004005L.ppRepBeforePrint(Sender: TObject);
begin

    // ※BeforePrintに必ず置く※
	PrnSupport.BeforePrint(Sender);

end;

//------------------------------------------------------------------------------
// ディテイルバンド印刷前処理   <003>
//------------------------------------------------------------------------------
procedure TDmJNTCRP004005L.fnCmnBeforeGenerate(Sender: TObject);
var
    DtlBand         : TppDetailBand;
    DtlBottomLine   : TppLine;
begin
// <005> 2007/05/07 H.Kawato Mod Start
//    DtlBand :=  TppDetailBand(MJSFindCtrl(Self, Format ('ppDetailBand%.d%.', [uvHani.pvrPattern])));
//    DtlBottomLine := TppLine (MJSFindCtrl(Self, Format ('ppStandardUnderLine%.d%.', [uvHani.pvrPattern])));
    DtlBand :=  TppDetailBand(MJSFindCtrl(Self, Format ('ppDetailBand%.d%.', [m_Pattern])));
    DtlBottomLine := TppLine (MJSFindCtrl(Self, Format ('ppStandardUnderLine%.d%.', [m_Pattern])));
// <005> 2007/05/07 H.Kawato Mod End

// <005> 2007/05/07 H.Kawato Mod Start
{
	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( DtlBand.LastRecord ) or ( DtlBand.PageOutOfSpace = TRUE ) Then
	begin
		if ( DtlBand.OverFlow = FALSE ) then
			DtlBand.OverFlow    :=  TRUE;

		if ( DtlBottomLine.ReprintOnOverFlow = FALSE ) then
			DtlBottomLine.ReprintOnOverFlow :=  TRUE;

        // ﾗｲﾝの太さを太くしている
        DtlBottomLine.Visible    := TRUE;
		DtlBottomLine.Weight     :=	0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを元にもどす
        DtlBottomLine.Visible    := TRUE;
		DtlBottomLine.Weight     :=	0.25;
	end;
}
//{
	// 最終ﾚｺｰﾄﾞ、頁の最下行を判定する関数の追加
	if ( DtlBand.LastRecord ) or ( DtlBand.PageOutOfSpace = TRUE ) Then
	begin
		if ( DtlBand.OverFlow = FALSE ) then
			DtlBand.OverFlow    :=  TRUE;

		if ( DtlBottomLine.ReprintOnOverFlow = FALSE ) then
			DtlBottomLine.ReprintOnOverFlow :=  TRUE;

       	if ( m_Pattern =  3 ) and ( dsNayose.DataSet.FieldByName('PageEnd').AsInteger <> 1 ) and
           ( not DtlBand.LastRecord ) Then
		begin
	        // ﾗｲﾝの太さを元にもどす
	        DtlBottomLine.Visible    := TRUE;
			DtlBottomLine.Weight    :=	0.25;
        end
        else
        begin
	        // ﾗｲﾝの太さを太くしている
	        DtlBottomLine.Visible    := TRUE;
			DtlBottomLine.Weight    :=	0.75;
        end;
	end
	else
	begin
	    if ( m_Pattern = 3 ) then
        begin
	        // ﾗｲﾝを消す
	        DtlBottomLine.Visible    := False;
			DtlBottomLine.Weight     :=	0.25;
        end
        else
        begin
	        // ﾗｲﾝの太さを元にもどす
	        DtlBottomLine.Visible    := TRUE;
			DtlBottomLine.Weight     :=	0.25;
        end;
	end;
//}
// <005> 2007/05/07 H.Kawato Mod End

    // 実在取引先債務情報登録ﾘｽﾄ(詳細型)
    if ( uvHani.pvrPattern = 1 ) then
    begin
        // 郵便番号の「－」
        if ( not dsShosaiJ.DataSet.FieldByName('PostNo1').IsNull      ) and
           ( dsShosaiJ.DataSet.FieldByName('PostNo1').AsString <> ''  ) and
           ( dsShosaiJ.DataSet.FieldByName('PostNo1').AsString <> '0' ) then
		        ppRep_S_PostLine    .Visible    :=  TRUE
        else    ppRep_S_PostLine    .Visible    :=  FALSE;
    end
    // 合計取引先債務情報登録ﾘｽﾄ
//    else if ( uvHani.pvrPattern = 2 ) then
    else if ( uvHani.pvrPattern = 3 ) then                  // <005> Mod
    begin
// <005> 2007/05/07 H.Kawato Mod Start
{
        // 郵便番号の「－」
        if ( not dsGoukeiJ.DataSet.FieldByName('nZipCodeUpper').IsNull      ) and
           ( dsGoukeiJ.DataSet.FieldByName('nZipCodeUpper').AsString <> ''  ) and
           ( dsGoukeiJ.DataSet.FieldByName('nZipCodeUpper').AsString <> '0' ) then
        begin
            ppRep_G_PostKigou    .Visible    :=  TRUE;
        end
        else
        begin
            ppRep_G_PostKigou    .Visible    :=  FALSE;
        end;
}
        // 郵便番号の「－」
        if ( not dsGoukeiJ.DataSet.FieldByName('PostNo1').IsNull      ) and
           ( dsGoukeiJ.DataSet.FieldByName('PostNo1').AsString <> ''  ) and
           ( dsGoukeiJ.DataSet.FieldByName('PostNo1').AsString <> '0' ) then
        begin
            ppRep_G_PostLine     .Visible    :=  TRUE;
        end
        else
        begin
            ppRep_G_PostLine     .Visible    :=  FALSE;
        end;
// <005> 2007/05/07 H.Kawato Mod End
    end;

end;

//------------------------------------------------------------------------------
//  印刷初期化処理  <003>
//------------------------------------------------------------------------------
procedure  TDmJNTCRP004005L.fnInzPrint();
var
    wTppLabel           :   TppLabel;
    wTppLine            :   TppLine;
    wTppSystemVariable  :   TppSystemVariable;
begin

    // 各種ｺｰﾄﾞ属性対応
    case uvHani.pvrPattern of
        // 実在取引先債務情報登録ﾘｽﾄ(簡略型)
//        0:
        0, 2:   // <005> Mod
        begin
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_K_GCode.Alignment     :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_K_GCode.Alignment     :=  taRightJustify; // 右寄せ(数値属性)
        end;
        // 実在取引先債務情報登録ﾘｽﾄ(詳細型)
        1:
        begin
// <006> 2007/08/27 H.Kawato Add Start
            // ﾊﾞｰｼﾞｮﾝ5以下は「支払情報」ﾀﾌﾞの該当ﾚｺｰﾄﾞが存在しない
            if (dsShosaiJ.DataSet.FieldByName ('VerData').AsInteger > 5) then
            begin
                // 支払調書採用区分
                DBLbl_S_GenKbn.Visible      := True;
                DBTxt_S_GenKbn.Visible      := True;
                DBTxt_S_GenKbnNM.Visible    := True;
                // 個人／法人区分
                DBLbl_S_PerKbn.Visible      := True;
                DBTxt_S_PerKbn.Visible      := True;
                DBTxt_S_PerKbnNM.Visible    := True;
            end
            else
            begin
                // 支払調書採用区分
                DBLbl_S_GenKbn.Visible      := False;
                DBTxt_S_GenKbn.Visible      := False;
                DBTxt_S_GenKbnNM.Visible    := False;
                // 個人／法人区分
                DBLbl_S_PerKbn.Visible      := False;
                DBTxt_S_PerKbn.Visible      := False;
                DBTxt_S_PerKbnNM.Visible    := False;
            end;
// <006> 2007/08/27 H.Kawato Add End
            // 取引先
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_S_GCode   .Alignment  :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_S_GCode   .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            // 部門
            if ( uvSelSys.GetBmCdZs = 2 ) then
                    DBTxt_S_BmNCd.Alignment     :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_S_BmNCd.Alignment     :=  taRightJustify; // 右寄せ(数値属性)
            // 担当者
            if ( uvSelSys.GetTnCdZs = 2 ) then
                    DBTxt_S_TnNCd.Alignment     :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_S_TnNCd.Alignment     :=  taRightJustify; // 右寄せ(数値属性)
// <004> 2006/10/01 H.Kawato Add Start
            // 連動得意先
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_S_RendoCd.Alignment   :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_S_RendoCd.Alignment   :=  taRightJustify; // 右寄せ(数値属性)

            fnAPGChk(m_FeeBmnFlg);		// <010> Add
// <004> 2006/10/01 H.Kawato Add End
        end;
        // 合計取引先債務情報登録ﾘｽﾄ
// <005> 2007/05/07 H.Kawato Mod Start
{
        2:
        begin
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_G_GCode.Alignment     :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_G_GCode.Alignment     :=  taRightJustify; // 右寄せ(数値属性)
        end;
}
        3:
        begin
// <006> 2007/08/27 H.Kawato Add Start
            // 支払調書採用区分
            DBLbl_G_GenKbn.Visible      := False;
            DBTxt_G_GenKbn.Visible      := False;
            DBTxt_G_GenKbnNM.Visible    := False;
            // 個人／法人区分
            DBLbl_G_PerKbn.Visible      := False;
            DBTxt_G_PerKbn.Visible      := False;
            DBTxt_G_PerKbnNM.Visible    := False;
// <006> 2007/08/27 H.Kawato Add End
            // 取引先
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_G_GCode   .Alignment  :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_G_GCode   .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            // 部門
            if ( uvSelSys.GetBmCdZs = 2 ) then
                    DBTxt_G_BmNCd.Alignment     :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_G_BmNCd.Alignment     :=  taRightJustify; // 右寄せ(数値属性)
            // 担当者
            if ( uvSelSys.GetTnCdZs = 2 ) then
                    DBTxt_G_TnNCd.Alignment     :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_G_TnNCd.Alignment     :=  taRightJustify; // 右寄せ(数値属性)
            // 連動得意先
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_G_RendoCd.Alignment   :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_G_RendoCd.Alignment   :=  taRightJustify; // 右寄せ(数値属性)
// <005> 2007/05/07 H.Kawato Add Start
            // 代替仕入先
            if ( uvSelSys.GetTkCdZs = 2 ) then
                    DBTxt_G_CngCd.Alignment     :=  taLeftJustify   // 左寄せ(文字属性)
            else    DBTxt_G_CngCd.Alignment     :=  taRightJustify; // 右寄せ(数値属性)
// <005> 2007/05/07 H.Kawato Add End
        end;
// <005> 2007/05/07 H.Kawato Mod End
        // 取引先債務情報 名寄せ登録ﾘｽﾄ
//        3:
//        4:      // <005> Mod
        4, 5:   // <007> Mod
        begin
        	if ( uvSelSys.GetTkCdZs = 2 ) then
            begin
            	DBTxt_N_OyaHojCd    .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
            	DBTxt_N_HojCd       .Alignment  :=  taLeftJustify;  // 左寄せ(文字属性)
        	end
            else
            begin
            	DBTxt_N_OyaHojCd    .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            	DBTxt_N_HojCd       .Alignment  :=  taRightJustify; // 右寄せ(数値属性)
            end;
// <007> 2008/02/29 H.Kawato Add Start
            if (uvHani.pvrPattern = 5) then
                LabelSubTitle3.Caption  := '【債務通知書名寄せ情報】'
            else
                LabelSubTitle3.Caption  := '【債務名寄せ情報】';
// <007> 2008/02/29 H.Kawato Add End
        end;
    end;

    //--------------------------------------------------------------------------
    //  ﾍｯﾀﾞｰ ﾌｯﾀﾞｰ印字位置調整
    //--------------------------------------------------------------------------
    // 会社ｺｰﾄﾞ
//    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpCode%.d%.', [uvHani.pvrPattern])));
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpCode%.d%.', [m_Pattern])));  // <005> Mod
    PrnSupport.pCorpCode := wTppLabel;
    with wTppLabel do
    begin
        Left            :=  0.063;
        Top             :=  0;
        Width           :=  0.504;
        Height          :=  0.125;
        Alignment       :=  taLeftJustify;
    end;

    // 会社名
//    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpName%.d%.', [uvHani.pvrPattern])));
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('CorpName%.d%.', [m_Pattern])));  // <005> Mod
    PrnSupport.pCorpName := wTppLabel;
    with wTppLabel do
    begin
        Left            :=  0.63;
        Top             :=  0;
        Width           :=  3.78;
        Height          :=  0.125;
        Alignment       :=  taLeftJustify;
    end;

    // 日付
//    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppDate%.d%.', [uvHani.pvrPattern])));
    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppDate%.d%.', [m_Pattern]))); // <005> Mod
    PrnSupport.pDate	:= wTppSystemVariable;
    with wTppSystemVariable do
    begin
        Left            :=  10.773;
        Top             :=  0;
        Width           :=  2.52;
        Height          :=  0.125;
        Alignment       :=  taRightJustify;
    end;

    // ﾀｲﾄﾙ
//    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('LabelTitle%.d%.', [uvHani.pvrPattern])));
    wTppLabel   := TppLabel (MJSFindCtrl(Self, Format ('LabelTitle%.d%.', [m_Pattern])));    // <005> Mod
    with wTppLabel do
    begin
        Left            :=  4.865;
        Top             :=  0.1667;
        Width           :=  3.5;
        Height          :=  0.25;
        Alignment       :=  taCenter;
        Distributed2    :=  True;
        FontRatio.Auto  :=  True;
        Caption         :=  uvRepTitleName; // <005> Add
    end;

    // ﾀｲﾄﾙｱﾝﾀﾞ-
//    wTppLine   := TppLine (MJSFindCtrl(Self, Format ('LineTitle%.d%.', [uvHani.pvrPattern])));
    wTppLine   := TppLine (MJSFindCtrl(Self, Format ('LineTitle%.d%.', [m_Pattern])));       // <005> Mod
    with wTppLine do
    begin
        Left            :=  4.802;
        Top             :=  0.2917;
        Width           :=  3.626;
        Height          :=  0.1667;
        Pen.Width       :=  0;
        Pen.Style       :=  psSolid;
    end;


    // 頁
//    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppPage%.d%.', [uvHani.pvrPattern])));
    wTppSystemVariable  := TppSystemVariable (MJSFindCtrl(Self, Format ('SVppPage%.d%.', [m_Pattern]))); // <005> Mod
    PrnSupport.pPage	:= wTppSystemVariable;
    with wTppSystemVariable do
    begin
        Left            :=  6.4193;
        Top             :=  0;
        Width           :=  0.5;
        Height          :=  0.125;
        Alignment       :=  taCenter;
    end;

    // ﾌｧｲﾙ名
    PrnSupport.strFileName  :=  rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysCliRoot + 'tmp\' + uvCSVFileName + '.csv';

end;

procedure TDmJNTCRP004005L.ppGroupHeaderBand1BeforeGenerate(
  Sender: TObject);
begin
	// 頁の最下行を判定する
	if ( dsNayose.DataSet.FieldByName('PageEnd').AsInteger = 2 ) Then
	begin
        // ﾗｲﾝの太さを太くしている
        GroupUnderLine3.Visible		:=	TRUE;
		GroupUnderLine3.Weight		:=	0.75;
	end
	else
	begin
        // ﾗｲﾝの太さを細くしている
        GroupUnderLine3.Visible		:=	TRUE;
		GroupUnderLine3.Weight		:=	0.25;
	end;
end;

// <010> Add start
//**********************************************************************
//*     Proccess	:fnAPGChk関数
//**********************************************************************
procedure TDmJNTCRP004005L.fnAPGChk(var m_FeeBmnFlg : Integer);
const
    PAY_FileName			= 'MAS\PRG\PayControl.APG';
var
    cPath, cFileName : String;
    oIniFile : TIniFile;
    nKBN : Integer;

begin
    m_FeeBmnFlg := 0;

    //実行ファイルのパス取得(Iniファイルも同じフォルダに必要)
    cPath := rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysRoot;
    if not IsPathDelimiter(cPath, Length(cPath)) then cPath := cPath + '\';

    cFileName := cPath + PAY_FileName;

    //個別用Iniファイルが存在しなければ、標準のモード。
    if  not FileExists(cFileName) then
        Exit
    else
    begin
        oIniFile := Nil;
        try
            oIniFile := TIniFile.Create(cFileName);

            nKBN := oIniFile.ReadInteger('Shiharai', 'PAYSWK_FEEBMN', 0);
            //INIファイルが存在してかつ区分が1の場合は、部門フィールドを有効にする
            if  nKBN > 0 then
            begin
                m_FeeBmnFlg := 1;
                DBTxt_S_BmnTitle.Visible := True;
                DBTxt_S_BmNCode.Visible := True;
                DBTxt_S_BmNName.Visible := True;
            end;
        finally
            if Assigned(oIniFile) then oIniFile.Free;
        end;
    end;
end;
// <010> Add end
end.

