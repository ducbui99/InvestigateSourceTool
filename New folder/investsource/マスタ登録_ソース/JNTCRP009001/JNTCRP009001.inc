//*****************************************************
//	勘定科目登録　定義ファイル
//*****************************************************

{$IFNDEF _JNTCRP009001IF_}
{$DEFINE _JNTCRP009001IF_}


//==============================================================================
//	ﾃｰﾌﾞﾙ更新Flag 構造体												HIS0011
//==============================================================================
	//	ﾃｰﾌﾞﾙ更新Flag		
	Table = Record
		KmkMA_Kan		:	Byte;	//	勘定科目基本ﾏｽﾀ(勘定科目)
		KmkMA_Sai		:	Byte;	//	勘定科目基本ﾏｽﾀ(細目科目)
		KmkMB_Kan		:	Byte;	//	勘定科目詳細情報(勘定科目)
		KmkMB_KanDel	:	Byte;	//	勘定科目詳細情報削除(勘定科目)
		KmkMB_Sai		:	Byte;	//	勘定科目詳細情報(細目科目)
		KmkMB_SaiDel	:	Byte;	//	勘定科目詳細情報削除(細目科目)
		KmkTree_Kan		:	Byte;	//	科目加算体系ﾏｽﾀ(勘定科目)
		KmkTree_KanDel	:	Byte;	//	科目加算体系ﾏｽﾀ削除(勘定科目)
		KmkTree_Kou		:	Byte;	//	科目加算体系ﾏｽﾀ(工事合計)
		MFusenInfo_Kan	:	Byte;	//	ﾏｽﾀ付箋管理情報(勘定科目)
		MFusenInfo_KanDel:	Byte;	//	ﾏｽﾀ付箋管理情報削除(勘定科目)
		MFusenInfo_Sai	:	Byte;	//	ﾏｽﾀ付箋管理情報(細目科目)
		MFusenInfo_SaiDel:	Byte;	//	ﾏｽﾀ付箋管理情報削除(細目科目)
	end;

//==============================================================================
//	表示内容が変更されたかどうかのCheck 構造体
//==============================================================================
	//	表示内容が更新されたどうかのチェック
	KmkInfo = Record
		Code		:	String;		//	ｺｰﾄﾞ
		Ren			:	String;			//	連想
		Long		:	String;			//	正式名称
		Simple		:	String;			//	簡略名称
		Bunseki		:	Byte;			//	分析ｺｰﾄﾞ
		Seikaku		:	Byte;			//	性格ｺｰﾄﾞ
		BankCode_N	:	Integer;		//	銀行ｺｰﾄﾞ(数値)
		BankCode_InpF:	Boolean;		//	銀行InputFlag
		BankCode_T	:	String;			//	銀行ｺｰﾄﾞ(文字)
		StartDate	:	String;			//	適用開始日
		EndDate		:	String;			//	適用終了日
		SeiZan		:	Byte;			//	正残区分
		KisyuZan	:	Byte;			//	期首残区分
		DspPri		:	Byte;			//	表示/印刷区分
		HiritsuKmk	:	Byte;			//	比率科目
		KariKuri	:	Byte;			//	借方資金繰
		KashiKuri	:	Byte;			//	貸方資金繰
		Hendouhi	:	Byte;			//	変動費比率
		Kobetsu		:	Byte;			//	個別原価率
		MainasuPri	:	Byte;			//	ﾏｲﾅｽ印刷
		SagakuPri	:	Byte;			//	差額印刷
		RiekiPri	:	Byte;			//	利益印刷
		MTekiPrn	:	Byte;			//	元帳起票者印字
		MainasuName	:	String;			//	ﾏｲﾅｽ変換科目
		Sousyoku	:	Byte;			//	装飾
		Shiwake		:	Byte;			//	仕訳入力区分
		KijitsuInp	:	Byte;			//	期日入力区分
		KoteiTeki	:	Byte;			//	固定適用必須入力
		TekiBunInpF	:	Boolean;		//	摘要分類InputFlag
		TekiBunCode	:	Byte;			//	摘要分類ｺｰﾄﾞ
		ShikuriYu	:	Byte;			//	資金繰ｺｰﾄﾞ優先区分
		Rireki		:	Byte;			//	履歴管理
	end;

//==============================================================================
//	付箋Click判断 構造体
//==============================================================================
	ToolBtnRec = Record
		ClickFlag	:	Boolean;
		Tag			:	Integer;
	end;

//==============================================================================
//	出力条件 構造体	（ダイアログ ←→ 元帳クライアント）
//==============================================================================
	//	ﾀﾞｲｱﾛｸﾞで選ばれたｺﾋﾟｰ情報
	DLGCopyInfoRec = Record
		CopyCode	:	Integer;		//	ｺﾋﾟｰ元ｺｰﾄﾞ
		Choice		:	Boolean;		//	ｺﾋﾟｰ内容(全て(False)/選択(True))
		Rensou		:	Boolean;		//	連想ｼﾝﾎﾞﾙ
		LongName	:	Boolean;		//	正式名称
		SimpleName	:	Boolean;		//	簡略名称
		Bunseki		:	Boolean;		//	分析ｺｰﾄﾞ
		Seikaku		:	Boolean;		//	性格ｺｰﾄﾞ
		Seizan		:	Boolean;		//	正残区分
		Kisyu		:	Boolean;		//	期首残区分
		Kari		:	Boolean;		//	借方資金繰ｺｰﾄﾞ
		Kashi		:	Boolean;		//	貸方資金繰ｺｰﾄﾞ
		Inp			:	Boolean;		//	入力条件
		OutInfo		:	Boolean;		//	出力情報
		Hiritsu		:	Boolean;		//	比率
		Bunrui		:	Boolean;		//	分類	//<2013/10/4 Y.Kuroda ADD>
	end;

//==============================================================================
//	ｺﾋﾟｰする情報 構造体													HIS0040
//==============================================================================
	CopyInfoRec = Record
		Ren			:	String;			//	連想
		Long		:	String;			//	正式名称
		Simple		:	String;			//	簡略名称
		Bunseki		:	Integer;		//	分析ｺｰﾄﾞ
		Seikaku		:	Integer;		//	性格ｺｰﾄﾞ
		BmnUse		:	Integer;		//	部門採用区分
//		SegUse		:	Integer;		//	ｾｸﾞﾒﾝﾄ1採用区分				//<2014/02/27 T.Ooshita MOD>
		SegUse		:	array[0..9] of Integer;	//	ｾｸﾞﾒﾝﾄ1～10採用区分	//<2014/02/27 T.Ooshita MOD>
		SeiZan		:	Integer;		//	正残区分
		BPKbn		:	Integer;		//	BS/PL区分
		KisyuZan	:	Integer;		//	期首残区分
		DspPri		:	Integer;		//	表示/印刷区分
		HiritsuKmk	:	Integer;		//	比率科目
		KariKuri	:	Integer;		//	借方資金繰
		KashiKuri	:	Integer;		//	貸方資金繰
		Hendouhi	:	Integer;		//	変動費比率
		Kobetsu		:	Integer;		//	個別原価率
		MainasuPri	:	Integer;		//	ﾏｲﾅｽ印刷
		SagakuPri	:	Integer;		//	差額印刷
		RiekiPri	:	Integer;		//	利益印刷
		MTekiPrn	:	Integer;		//	元帳起票者印字
		MainasuName	:	String;			//	ﾏｲﾅｽ変換科目
		Sousyoku	:	Integer;		//	装飾
		Shiwake		:	Integer;		//	仕訳入力区分
		KijitsuInp	:	Integer;		//	期日入力区分
		KiJitsuHis	:	Integer;		//	期日必須入力区分
		KoteiTeki	:	Integer;		//	固定適用必須入力
		TekiBunCode	:	Integer;		//	摘要分類ｺｰﾄﾞ
		ShikuriYu	:	Integer;		//	資金繰ｺｰﾄﾞ優先区分
		Rireki		:	Integer;		//	履歴管理
	//--- HIS0123 St -----
		CostRate	:	Integer;		//	個別原価率
		EBook1Kbn	:	Integer;		//	第1補助電子帳簿採用区分
		EBook2Kbn	:	Integer;		//	第2補助電子帳簿採用区分
		CharCD2		:	Integer;		//	性格ｺｰﾄﾞ2
		D2KmkCD		:	Integer;		//	借方第2科目ｺｰﾄﾞ
		D3KmkCD		:	Integer;		//	借方第3科目ｺｰﾄﾞ
		C2KmkCD		:	Integer;		//	貸方第2科目ｺｰﾄﾞ
		C3KmkCD		:	Integer;		//	貸方第3科目ｺｰﾄﾞ
	//--- HIS0123 Ed -----
	//<2013/10/4 Y.Kuroda ADD↓>
		BunruiNCode1:	Extended;		//	分類1ｺｰﾄﾞ
		BunruiNCode2:	Extended;		//	分類2ｺｰﾄﾞ
		BunruiNCode3:	Extended;		//	分類3ｺｰﾄﾞ
		BunruiNCode4:	Extended;		//	分類4ｺｰﾄﾞ
		BunruiNCode5:	Extended;		//	分類5ｺｰﾄﾞ
		BunruiNCode6:	Extended;		//	分類6ｺｰﾄﾞ
		BunruiNCode7:	Extended;		//	分類7ｺｰﾄﾞ
		BunruiNCode8:	Extended;		//	分類8ｺｰﾄﾞ
		BunruiNCode9:	Extended;		//	分類9ｺｰﾄﾞ
		BunruiNCode10:	Extended;		//	分類10ｺｰﾄﾞ
	//<2013/10/4 Y.Kuroda ADD↑>
	end;

//==============================================================================
//	付箋のｺﾒﾝﾄ情報 構造体													
//==============================================================================
	FusenCmntRec = Record
		NCode		:	Extended;		//	科目内部ｺｰﾄﾞ
		SubNCode	:	Extended;		//  科目別補助内部ｺｰﾄﾞ
		Cmnt		:	String;			//	付箋ｺﾒﾝﾄ
	end;

//==============================================================================
//	付箋のｺﾒﾝﾄ情報 構造体													
//==============================================================================
	TaxInfoRec = Record
		Kbn		:	Integer;		//	消費税科目区分
		Code	:	Integer;		//	消費税ｺｰﾄﾞ
	end;

//==============================================================================
//	検索情報 構造体														HIS0122
//==============================================================================
	SearchInfoRec = Record
		aTaikei	:	array[0..3] of boolean;
		iKmkCD	:	Integer;		// 検索科目
		iSubCD	:	String;			// 検索科目別補助
		iItem	:	Integer;		// 検索するItemの位置
		iStIndex:	Integer;		// 検索開始時のComboBoxNO
		iStItem	:	Integer;		// 最初に一致したItemNo
		bFstFlg	:	Boolean;		// 初回判定ﾌﾗｸﾞ
	end;

//==============================================================================
//	科目出力順序自動登録情報 構造体
//==============================================================================
	KmkOrderRec = Record
		MasKbn		:	Byte;		//	ﾏｽﾀ区分
		NCode		:	Extended;	//	内部ｺｰﾄﾞ
		GCode		:	Integer;	//	外部ｺｰﾄﾞ
		Kbn			:	Byte;		//	実在/合計区分
		SName		:	String;		//	簡略名称
		LName		:	String;		//	正式名称
		AnalyzeCode	:	Integer;	//	分析ｺｰﾄﾞ
		Delete		:	Boolean;	//	削除された
		Check		:	Boolean;	//	自動登録対象
		AddOk		:	Boolean;	//	すでに登録済み
		BPKbn		:	Byte;		//	BS/PL区分
		BmnUse		:	Byte;		//	部門採用
		SegUse1		:	Byte;		//	セグメント採用
		SegUse2		:	Byte;		//	セグメント採用
		SegUse3		:	Byte;		//	セグメント採用
		SegUse4		:	Byte;		//	セグメント採用
		SegUse5		:	Byte;		//	セグメント採用
		SegUse6		:	Byte;		//	セグメント採用
		SegUse7		:	Byte;		//	セグメント採用
		SegUse8		:	Byte;		//	セグメント採用
		SegUse9		:	Byte;		//	セグメント採用
		SegUse10	:	Byte;		//	セグメント採用
		// 2011/06/08(WED) Y.Kuroda ADD↓
		PrjUse1		:	Byte;		//	プロジェクト採用
		PrjUse2		:	Byte;		//	プロジェクト採用
		PrjUse3		:	Byte;		//	プロジェクト採用
		PrjUse4		:	Byte;		//	プロジェクト採用
		PrjUse5		:	Byte;		//	プロジェクト採用
		PrjUse6		:	Byte;		//	プロジェクト採用
		PrjUse7		:	Byte;		//	プロジェクト採用
		PrjUse8		:	Byte;		//	プロジェクト採用
		PrjUse9		:	Byte;		//	プロジェクト採用
		PrjUse10	:	Byte;		//	プロジェクト採用
		// 2011/06/08(WED) Y.Kuroda ADD↑
	end;        

//==============================================================================
//	科目出力順序自動登録情報 挿入箇所検索構造体
//==============================================================================
	OrderInsRec = Record
		No			:	Integer;	//	優先順位
		NCode		:	Extended;	//	内部ｺｰﾄﾞ
		SumNCode	:	Extended;	//	加算先内部ｺｰﾄﾞ
		Position	:	Integer;	//	挿入位置（0：前、1：後）
	end;
type

{$ENDIF}
//	End of File
