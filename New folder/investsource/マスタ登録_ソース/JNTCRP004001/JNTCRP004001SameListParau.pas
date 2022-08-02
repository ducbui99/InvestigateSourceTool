//************************************************************************
//	System		:	Galileopt
//	Program		:	取引先登録 - 登録申請上書き対応用パラメータクラス
//	ProgramID	:	JNTCRP004001SameListParau
//	Name		:	新保一馬
//	Create		:	2011 / 10 / 28
//	Comment		:
//
//  修正履歴
//  <ﾏｰｸ>   <修正者>    <修正日>        <修正内容>
//
//*************************************************************************
unit JNTCRP004001SameListParau;

interface

uses
  Windows, VCL.Controls, FireDAC.Comp.Client, MjsDBModuleu, JNTCommonu, JNTMASComu, JNTSelCorpSys;

type
  {$I ActionInterface.inc}
  {$I ETYMasterSinseiExgIFI.inc}

  enmSameListResult = ( SAMELIST_RET_INS, //ﾀﾞｲｱﾛｸﾞの戻り値
                        SAMELIST_RET_UPD,
                        SAMELIST_RET_CAN,
                        SAMELIST_RET_ERR,
                        SAMELIST_RET_NON
                         );

  TSameListPara = class
  private
    { Private 宣言 }
  public
    { Public 宣言 }
	//*** 親Formからのﾊﾟﾗﾒｰﾀ部 ***
	m_pRec			: ^TMjsAppRecord;	// BPL管理構造体ﾎﾟｲﾝﾀ
	m_DM            : TMDataModulef;	// ｼｽﾃﾑ共通DBﾓｼﾞｭｰﾙ(DBｾｯｼｮﾝ､ｸｴﾘｰ連結等の管理)
	m_DB            : TFDConnection;		// 会社ﾃﾞｰﾀﾃﾞｰｽｺﾝﾎﾟｰﾈﾝﾄ(DBへのﾛｸﾞｲﾝ､ﾄﾗﾝｻﾞｸｼｮﾝ管理)
    m_JNTCom        : TJNTCommon;       // 会社ｼｽﾃﾑ情報
	m_JNTMASCom		: TJNTMASCom;
    m_JNTSelSys     : TJNTSelCorpSys;
    m_pTkSinInfo    : ^TTokuiSinseiInfo;

    Result    		: enmSameListResult;// ﾀﾞｲｱﾛｸﾞの戻り値
  end;

const
    // 申請書の仕訳入力形式
    SWKFORM_TOKUI         = 9;                  // 得意先登録申請書
    SWKFORM_SIIRE         = 10;                 // 仕入先登録申請書
    SWKFORM_TOKUI_HENKO   = 61;                 // 得意先変更申請書
    SWKFORM_SIIRE_HENKO   = 62;                 // 仕入先変更申請書

implementation

end.
 
