(*H0001 20030808 khattori syuusei 残高管理区分が科目連想登録されている科目のみで更新されている*)
(*H0002 20030818 khattori syuusei 摘要分類の部署伝票辞書区分*)
//******************************************************************************
//*                             修正履歴
//******************************************************************************
//* 2006/01/13  HIS0001 K.Katou(PRIME)  ﾃﾞｰﾀ読込み時に消費税関係が正しく表示されない不具合修正
//* 2006/02/14	HIS0002 K.Katou(PRIME)	置換と基準の組合せの場合にBusDicKbnが1にならない不具合修正
//*	2007/02/16	HIS0003	K.Katou(PRIME)	科目別補助の抽出条件修正
//* 2006/12/07  HIS0052 K.Katou(PRIME)	仕訳辞書登録対応
//* 2008/03/15  HIS0076 F.Ootake(LEAD)	更新担当者内部ｺｰﾄﾞのｾｯﾄ
//* 2008/09/01  <DKAI>  E.Nanba(Lab)    名称に改行が入らないようにする
//* 2009/10/13	HIS0084	Y.Yoshizawa(MJS)GWF-0149対応（一覧画面で更新するとBusDicKbnが0で更新される件の修正）
//================================== ver4.01 ===================================
//* 2010/07/15  HIS0088 T.Ogawa(RIT)    部署伝票辞書区分(TekiMA.BusDicKbn)はチェックボックスで更新できるように修正
//* 2010/07/22  HIS0089 T.Ogawa(RIT)    仕訳情報グリッドに選択した同一コード部門が反映されない不具合対応
//******************************************************************************


//***********************************************************************************************************/
//
//	ＤＢ更新
//
//***********************************************************************************************************/
function	TJNTCRP020000f.fnUpdateDetailsScreenRecord (): Boolean;
var
	cNode	   : TTreeNode;
	cNodeParent: TTreeNode;
    stWorkRec  : ^TreeViewRec;
	nExCode	   : Integer;
//	strExCode  : String;					// <HIS0052> DEL
	fReturn	   : Boolean;

	stMessageRec	: TMJSMsgRec;

	iRecNo			: Integer;				// <HIS0052> ADD
    iIndex			: Integer;				// <HIS0052> ADD
	iMasterKbn		: Integer;				// <HIS0052> ADD
    strGCode		: String;				// <HIS0052> ADD
    iRet : Integer;  //<HIS0088> ADD

    //////////////////////////////////////////////////////////////////////////////
    //  fnGetCode
    //////////////////////////////////////////////////////////////////////////////
// <HIS0052> DEL start →関数を作り直し
(*	function	fnGetCode(index: Integer;cNum:TMNumEdit;cTxt: TMTxtEdit): String;
	var
		sCode  : String;
	begin
		if	(m_stCurDtlCodeAttr [index].nAttribute <= 1) then
		begin
			if	((not m_stCurDtlCodeAttr [index].fEnabled) or
				 (cNum.InputFlag and (cNum.Value = 0)))

				//	共通部門
				and	((not((index= 2)and(m_stCurDtlCodeAttr[ 2].nClassCode=1)))or((not((m_iBsPlKbnCre=0)and(m_sBSComBmnNm<>'')))))
				and	((not((index= 3)and(m_stCurDtlCodeAttr[ 3].nClassCode=1)))or((not((m_iBsPlKbnCre=0)and(m_sBSComSg1Nm<>'')))))
				and	((not((index= 2)and(m_stCurDtlCodeAttr[ 2].nClassCode=1)))or((not((m_iBsPlKbnCre=1)and(m_sPLComBmnNm<>'')))))
				and	((not((index= 3)and(m_stCurDtlCodeAttr[ 3].nClassCode=1)))or((not((m_iBsPlKbnCre=1)and(m_sPLComSg1Nm<>'')))))
				and	((not((index=10)and(m_stCurDtlCodeAttr[10].nClassCode=1)))or((not((m_iBsPlKbnCre=0)and(m_sBSComBmnNm<>'')))))
				and	((not((index=11)and(m_stCurDtlCodeAttr[11].nClassCode=1)))or((not((m_iBsPlKbnCre=0)and(m_sBSComSg1Nm<>'')))))
				and	((not((index=10)and(m_stCurDtlCodeAttr[10].nClassCode=1)))or((not((m_iBsPlKbnCre=1)and(m_sPLComBmnNm<>'')))))
				and	((not((index=11)and(m_stCurDtlCodeAttr[11].nClassCode=1)))or((not((m_iBsPlKbnCre=1)and(m_sPLComSg1Nm<>'')))))

			then	sCode	:= ''
//<HIS0032>			else	sCode	:= Format ('%.10d', [Trunc (cNum.Value)]);
			else	sCode	:= Format ('%.16d', [Trunc (cNum.Value)]);
		end
		else	sCode	:= cTxt.Text;

		result:=sCode;
	end;
*)
// <HIS0052> DEL end
begin
	cNode		:= CmnTreeView.Selected;
	cNodeParent	:= cNode.Parent;

	if	(cNodeParent <> nil) then
		stWorkRec	:= cNodeParent.Data
	else
		stWorkRec	:= cNode.Data;

	nExCode	:= Trunc (DtlCEdtExCd.Value);

	if	(nExCode = 0) then
	begin
		Result	:= false;
		Exit;
	end;

	if	(DtlCmnTab.Items [0].Selected) then
		m_stMasterData.nSumDivision	:= 0
	else
		m_stMasterData.nSumDivision	:= 1;


(*H0004 20031222 khattori syuusei 分類に摘要を詳細登録で追加した時、その分類の子供にならない*)
	if	m_stMasterData.nSumDivision=0	then
	begin
		if	TreeViewRec(cNode.Data^).nDivision>0	then
			stWorkRec	:= cNode.Data;
	end;



	m_stMasterData.nExCodeParent	:= stWorkRec^.nExCode;
	m_stMasterData.nExCode			:= nExCode;											// 摘要(分類)ｺｰﾄﾞ
	m_stMasterData.strAssociation	:= DtlCmnEditAssociation.Text;						// 連想
	m_stMasterData.strName			:= DtlCmnEditName.Text;								// 正式名称
	m_stMasterData.fDetails			:= true;											// 詳細更新区分: true=あり
	m_stMasterData.nDealDivision	:= Trunc (DtlCmnEditDealDivision.Value);			// 取引先区分
	m_stMasterData.nDealClass		:= Trunc (DtlCmnEditDealClass   .Value);			// 取引先分類

//	SetCommonSection(0);					// <HIS0052> DEL

	//	借方
	m_stMasterData.nExCodeK1Deb		:= Trunc (cEdtK1DNum.Value);

//<HIS0052> MOD start
(*
	if	(m_stCurDtlCodeAttr [1].fEnabled and (not cEdtK2DNum.InputFlag)) then
//<HIS0032>		m_stMasterData.nExCodeK2Deb	:= cEdtK2DNum.text
		m_stMasterData.nExCodeK2Deb	:= fnGetDspData(1,cEdtK2DNum.text,True)
	else
//<HIS0032>		m_stMasterData.nExCodeK2Deb	:= -1;
		m_stMasterData.nExCodeK2Deb	:= '';

	m_stMasterData.strExCodeBUDeb	:= fnGetCode(2,cEdtBUDNum,cEdtBUDFre);
	m_stMasterData.strExCodeSGDeb	:= fnGetCode(3,cEdtSGDNum,cEdtSGDFre);
	m_stMasterData.strExCodeH1Deb	:= fnGetCode(4,cEdtH1DNum,cEdtH1DFre);
	m_stMasterData.strExCodeH2Deb	:= fnGetCode(5,cEdtH2DNum,cEdtH2DFre);
	m_stMasterData.strExCodeKODeb	:= fnGetCode(6,cEdtKODNum,cEdtKODFre);
	m_stMasterData.strExCodeKSDeb	:= fnGetCode(7,cEdtKSDNum,cEdtKSDFre);
*)


    ClearAry(m_stMasterData.aryDHojyo);		// aryDHojyoをｸﾘｱ

	// 借方補助情報をﾒﾝﾊﾞに保存
    if DtlDSwkMem.RecordCount > 0 then
    begin
	    DtlDSwkMem.DisableControls;
    	iRecNo := DtlDSwkMem.RecNo;
    	DtlDSwkMem.First;
		while not DtlDSwkMem.Eof do
    	begin
    		iMasterKbn := DtlDSwkMem.FieldByName('iMasterKbn').AsInteger;
	        strGCode := DtlDSwkMem.FieldByName('strGCode').AsString;
            iIndex := GetMasterIndex(iMasterKbn);
        									// ﾏｽﾀ区分
    		m_stMasterData.aryDHojyo[iIndex].iMasterKbn := iMasterKbn;
        									// DB上のﾌｫｰﾏｯﾄにした外部ｺｰﾄﾞ
			m_stMasterData.aryDHojyo[iIndex].strGCode := fnGetCode(iMasterKbn, strGCode, DC_KARIKATA);
        									// 内部ｺｰﾄﾞ
	        m_stMasterData.aryDHojyo[iIndex].exNCode := DtlDSwkMem.FieldByName('exNCode').AsFloat;
        									// 区分
	        m_stMasterData.aryDHojyo[iIndex].iKbn := DtlDSwkMem.FieldByName('nCtrlDivision').AsInteger;

			DtlDSwkMem.Next;
	    end;
    	DtlDSwkMem.RecNo := iRecNo;
	    DtlDSwkMem.EnableControls;
    end;
//<HIS0052> MOD end

//	SetCommonSection(1);					// <HIS0052> DEL

	//	貸方
	m_stMasterData.nExCodeK1Cre	:= Trunc (cEdtK1CNum.Value);

//<HIS0052> MOD start
(*	if	(m_stCurDtlCodeAttr [9].fEnabled and (not cEdtK2CNum.InputFlag)) then
//<HIS0032>		m_stMasterData.nExCodeK2Cre	:= cEdtK2CNum.text
		m_stMasterData.nExCodeK2Cre	:= fnGetDspData(1,cEdtK2CNum.text,True)
	else
//<HIS0032>		m_stMasterData.nExCodeK2Cre	:= -1;
		m_stMasterData.nExCodeK2Cre	:= '';

	m_stMasterData.strExCodeBUCre	:= fnGetCode(10,cEdtBUCNum,cEdtBUCFre);
	m_stMasterData.strExCodeSGCre	:= fnGetCode(11,cEdtSGCNum,cEdtSGCFre);
	m_stMasterData.strExCodeH1Cre	:= fnGetCode(12,cEdtH1CNum,cEdtH1CFre);
	m_stMasterData.strExCodeH2Cre	:= fnGetCode(13,cEdtH2CNum,cEdtH2CFre);
	m_stMasterData.strExCodeKOCre	:= fnGetCode(14,cEdtKOCNum,cEdtKOCFre);
	m_stMasterData.strExCodeKSCre	:= fnGetCode(15,cEdtKSCNum,cEdtKSCFre);
*)
    ClearAry(m_stMasterData.aryCHojyo);		// aryCHojyoをｸﾘｱ
    
	// 貸方補助情報をﾒﾝﾊﾞに保存
    if DtlCSwkMem.RecordCount > 0 then
    begin
	    DtlCSwkMem.DisableControls;
    	iRecNo := DtlCSwkMem.RecNo;
    	DtlCSwkMem.First;
		while not DtlCSwkMem.Eof do
    	begin
    		iMasterKbn := DtlCSwkMem.FieldByName('iMasterKbn').AsInteger;
	        strGCode := DtlCSwkMem.FieldByName('strGCode').AsString;
            iIndex := GetMasterIndex(iMasterKbn);
        									// ﾏｽﾀ区分
    		m_stMasterData.aryCHojyo[iIndex].iMasterKbn := iMasterKbn;
        									// DB上のﾌｫｰﾏｯﾄにした外部ｺｰﾄﾞ
			m_stMasterData.aryCHojyo[iIndex].strGCode := fnGetCode(iMasterKbn, strGCode, DC_KASIKATA);
           									// 内部ｺｰﾄﾞ
   	     	m_stMasterData.aryCHojyo[iIndex].exNCode := DtlCSwkMem.FieldByName('exNCode').AsFloat;
	       									// 区分
	        m_stMasterData.aryCHojyo[iIndex].iKbn := DtlCSwkMem.FieldByName('nCtrlDivision').AsInteger;


			DtlCSwkMem.Next;
    	end;
	    DtlCSwkMem.RecNo := iRecNo;
	    DtlCSwkMem.EnableControls;
    end;
//<HIS0052> MOD end

	//	消費税
	m_stMasterData.nTaxDivision		:= Trunc (DtlCmnEditTaxDivision.Value);			// 消費税売上/仕入区分
	m_stMasterData.nTaxCode			:= Trunc (DtlCmnEditTaxCode    .Value);			// 消費税ｺｰﾄﾞ
	m_stMasterData.nTaxRate			:= Trunc (DtlCmnEditTaxRate    .Value);			// 消費税率
	m_stMasterData.nTypeCode		:= Trunc (DtlCmnEditTypeCode   .Value);			// 業種ｺｰﾄﾞ

	//	仕訳辞書摘要区分
// <HIS0052> MOD start
(*	if	((Trunc (cEdtK1DNum.Value) <> 0) or
		 (Trunc (cEdtK1CNum.Value) <> 0) or
		 (Trunc (DtlCmnEditTaxDivision.Value) <> 0) or
		 (MCheckBox1.Checked)) then
*)
											// 貸借科目に入力がある場合部署伝票とする
	if	(((Trunc (cEdtK1DNum.Value) <> 0) and (Trunc (cEdtK1CNum.Value) <> 0)) and
		 (IsBusyoDenpyo())) then
// <HIS0052> MOD end
//	if	((Trunc (cEdtK1DNum.Value) <> 0) or
//		 (Trunc (cEdtK1CNum.Value) <> 0) or
//		 (Trunc (DtlCmnEditTaxDivision       .Value) <> 0)) then
		m_stMasterData.nSDicDivision	:= 1										// 仕訳辞書摘要区分
	else
		m_stMasterData.nSDicDivision	:= 0;

	if	(not fnCheckMasterRecordUpdate ()) then
	begin
		beep;
		if	(m_cACControl.Name = DtlCmnEditName.Name) then
			fnOutputDescErrorMessage (m_stMasterData.nSumDivision);		//HIS0014

		if	(m_cACControl.Name = DtlCmnGrid.Name) then
			DtlCmnDataSource.DataSet.FieldByName ('nExCode').FocusControl ()
		else
			m_cACControl.SetFocus ();

		Result	:= false;
		Exit;
	end;

	//	部署伝票辞書チェック
// <HIS0052> MOD start
//	if	MCheckBox1.Checked	then
	if  IsBusyoDenpyo() then
// <HIS0052> MOD end
	begin
		if	not	fnCheckBusyoDenpyouJisyo	then
		begin
			beep;

(*H0004 20031127 khattori syuusei 可変は２つまでー＞可変は４つまで*)
			if	m_iCntKahen>4	then
//			if	m_iCntKahen>2	then
			begin
				m_cComArea.m_MsgStd.GetMsg( stMessageRec, 30,18);
				stMessageRec.sMsg	:= '可変項目は４つまでしか指定できません。';
//				stMessageRec.sMsg	:= '可変項目は２つまでしか指定できません。';

				MjsMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle,
								 stMessageRec.icontype, mjOk, stMessageRec.btndef, false);
			end;

			m_cACControl.SetFocus ();
			Result	:= false;
			exit;
		end;
	end;

//<HIS0088> ADD St
    // 新規レコード 且つ チェックボックスOFF
    // 且つ
    // 仕訳辞書としての設定が成立している場合
    if ((m_bNewRecord) and (chk_Busyo.Checked = false)) and
       ((IsBusyoDenpyo()) and
       (((cEdtK1DNum.Value <> 0) or (cCmbK1DCmb.ItemIndex = KMKKBN_OKIKAE)) and
        ((cEdtK1CNum.Value <> 0) or (cCmbK1CCmb.ItemIndex = KMKKBN_OKIKAE))))
    then
    begin
        iRet := MjsMessageBoxEx(Self, '部署伝票の辞書として使用しますか？', '固定摘要登録',
                 mjInformation,mjYesNoCancel,mjDefYes);

        if iRet = mrCancel then
        begin
           Result	:= true;
           Exit;
        end
        else                    chk_Busyo.Checked := iRet = mrYes;
    end;
//<HIS0088> ADD Ed

	//
	//	固定摘要ﾏｽﾀ更新
	//
	fReturn	:= fnUpdateMasterRecord ();

	if	(fReturn) then
	begin
		fnUpdateMasterRecordAddition ();
		fnUpdateMasterDataTagInfo    (nExCode, m_nSelectTagKind);

		fnRebuildMasterTreeRecords (nExCode);
	end;

	Result	:= true;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnUpdateMasterRecord ()															*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要ﾏｽﾀ更新						                                   		    */
//*																											*/
//*	戻り値	: Boolean, (true:正常終了, false:異常終了)							                            */
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnUpdateMasterRecord (): Boolean;
var
	fReturn: Boolean;
	exNCode: Extended;
begin
	m_cDataModule.BeginTran (m_cDBSelect);				// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	ExecParentDBTran(GRP_PARENTDB_BEGINTRAN);			// 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝ開始 <SYNC> ADD

	fReturn	:= fnUpdateMasterDataRecord ();				// 固定摘要ﾏｽﾀ更新

	if	(not fReturn) then								// ｴﾗｰ
	begin
		if m_DataKbn <> 3 then	//HIS0027
		begin
			Beep ();

			fnOutputDBErrorMessage ();

(*20030627 khattori syuusei*)
//			m_cDataModule.Rollback (m_cDBSelect);		// ﾛｰﾙﾊﾞｯｸ(破棄)
		end;
		m_cDataModule.Rollback (m_cDBSelect);			// ﾛｰﾙﾊﾞｯｸ(破棄)
		ExecParentDBTran(GRP_PARENTDB_ROLLBACK);		// 親会社DBもﾛｰﾙﾊﾞｯｸ <SYNC> ADD

		Result	:= false;
		Exit;
	end;

// <SYNC> ADD start
	if m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD then	// 子会社の場合
    begin                                               // 同期ｽﾄｱﾄﾞ呼出
	    if not m_SyncMaster.fnCall_SYNC(JNTSYNC_TEKIMA) then
    	begin
			Beep ();
			fnOutputDBErrorMessage ();
			m_cDataModule.Rollback (m_cDBSelect);  		// 子会社ﾛｰﾙﾊﾞｯｸ
			ExecParentDBTran(GRP_PARENTDB_ROLLBACK); 	// 親会社ﾛｰﾙﾊﾞｯｸ

			Result	:= false;
			Exit;
		end;
// <HIS0067> MOD start
(*    end
    													// ｸﾞﾙｰﾌﾟ管理を採用している親会社の場合
// <HIS0062> MOD start
//    else if (m_iGrpCorp = GRP_USE) and (m_iTransKbn = GRP_TRANSKBN_PARENT) then
    else if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_PARENT) and
			(m_SyncMaster.m_CEComKbn5 <> 1) then   		// and 翌期更新済みでない
// <HIS0062> MOD end
*)
    end;

														// ｸﾞﾙｰﾌﾟ管理を採用している場合
    if (m_SyncMaster.m_flgGrpCorp <> GRP_SYNC_NOTUSE) and
			(m_SyncMaster.m_CEComKbn5 <> 1) then   		// and 翌期更新済みでない

// <HIS0067> MOD end
    begin
		if not GetUpdNCode(exNCode) then				// 更新したﾚｺｰﾄﾞのNCodeを取得
        begin
			Beep ();

			fnOutputDBErrorMessage ();
			m_cDataModule.Rollback (m_cDBSelect);		// ﾛｰﾙﾊﾞｯｸ(破棄)
			ExecParentDBTran(GRP_PARENTDB_ROLLBACK); 	// 親会社ﾛｰﾙﾊﾞｯｸ <HIS0067> ADD
			Result	:= false;
			Exit;
        end;
    	// このｺｰﾄﾞを使用可能な子会社にRELを作成する
		if not fnAllCorpRelation(m_stMasterData.nExCode, exNCode) then
        begin
			Beep ();

//			fnOutputDBErrorMessage ();					// <HIS0067> DEL
			m_cDataModule.Rollback (m_cDBSelect);		// ﾛｰﾙﾊﾞｯｸ(破棄)
			ExecParentDBTran(GRP_PARENTDB_ROLLBACK); 	// 親会社ﾛｰﾙﾊﾞｯｸ <HIS0067> ADD
			Result	:= false;
			Exit;
        end;
    end;
// <SYNC> ADD end
	if	(m_stMasterData.nSumDivision <> 1) then
	begin
		fReturn	:= fnUpdateMasterTreeRecord ();			// 固定摘要分類体系ﾏｽﾀ更新

		if	(not fReturn) then							// ｴﾗｰ
		begin
			Beep ();

			fnOutputDBErrorMessage ();
			m_cDataModule.Rollback (m_cDBSelect);		// ﾛｰﾙﾊﾞｯｸ(破棄)
			ExecParentDBTran(GRP_PARENTDB_ROLLBACK);	// 親会社DBもﾛｰﾙﾊﾞｯｸ <SYNC> ADD

			Result	:= false;
			Exit;
		end;
	end;


	m_cDataModule.Commit (m_cDBSelect);					// ｺﾐｯﾄ(反映)
	ExecParentDBTran(GRP_PARENTDB_COMMIT);				// 親会社DBもｺﾐｯﾄ <SYNC> ADD

	Result	:= true;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnUpdateMasterRecordAddition ()													*/
//*																											*/
//*	目的	: 摘要登録処理 仕訳辞書摘要ﾏｽﾀ更新					                                   		    */
//*																											*/
//*	戻り値	: Boolean, (true:正常終了, false:異常終了)							                            */
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnUpdateMasterRecordAddition ();
var
	dqMasterData: TMQuery;
	fNewRecord  : Boolean;
	strSQL		: String;					// <HIS0052> ADD
    strFld		: String;                   // <HIS0052> ADD
    iCnt		: Integer;                  // <HIS0052> ADD
begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);		// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

// <HIS0052> MOD start
		//	仕訳辞書摘要区分: 0=通常摘要
(*		if	(m_stMasterData.nSDicDivision = 0) then
		begin
			SQL.Clear ();

			SQL.Add   ('DELETE FROM SwDicTeki WHERE MasterKbn = 61 AND TekiNCode = :nExCode');
*)
// <HIS0052> DEL start SwDicTekiは削除しない
(*
		// 貸借の科目が基準で未入力の場合
		if ((cCmbK1DCmb.ItemIndex = KBN_KIJUN) and (cEdtK1DNum.Value = 0)) and
        	 ((cCmbK1CCmb.ItemIndex = KBN_KIJUN) and (cEdtK1CNum.Value = 0)) then
		begin
			SQL.Clear ();
            								// 仕訳辞書摘要を削除する
			SQL.Add   ('DELETE FROM SwDicTeki WHERE MasterKbn = 61 AND NCode = :nExCode');
// <HIS0052> MOD end

			ParamByName ('nExCode').AsFloat	:=
                                    fnGetNCode(TBL_TEKI,0,m_stMasterData.nExCode);

			if	(not ExecSQL ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

				fnOutputDBErrorMessage ();

				dqMasterData.Close ();
				dqMasterData.Free  ();
				Exit;
			end;

			m_fDeleteSwDicTeki	:= true;

			dqMasterData.Close ();
			dqMasterData.Free  ();
			Exit;
		end;
*)
// <HIS0052> DEL end SwDicTekiは削除しない

		SQL.Clear ();
// <HIS0052> MOD start
//		SQL.Add   ('SELECT MasterKbn FROM SwDicTeki WHERE MasterKbn = 61 AND TekiNCode = :nExCode');
		SQL.Add   ('SELECT MasterKbn FROM SwDicTeki WHERE MasterKbn = 61 AND NCode = :nExCode');
// <HIS0052> MOD end

		ParamByName ('nExCode').AsFloat	:=
                                    fnGetNCode(TBL_TEKI,0,m_stMasterData.nExCode);
		Open ();

		if	(not EOF) then
			fNewRecord	:= false
		else
			fNewRecord	:= true;

		Close ();
	end;

// <HIS0052> ADD start
	if fNewRecord then						// 新規の場合
    begin
		// <SYNC> ADD start                 // 分類の場合も抜ける
    	if m_stMasterData.nSumDivision = 1 then
        begin
        	Exit;
        end;
		// <SYNC> ADD end
    										// 基準で科目未入力はSwDicTekiを作成しない
    	if ((cCmbK1DCmb.ItemIndex = KBN_KIJUN) and (cEdtK1DNum.Value = 0)) and
        	 ((cCmbK1CCmb.ItemIndex = KBN_KIJUN) and (cEdtK1CNum.Value = 0)) then
		begin
        	Exit;
        end;
	end;
// <HIS0052> ADD end
    with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
// <HIS0052> MOD start
		if	(fNewRecord) then				// INSERT
		begin
			strSQL := 'INSERT INTO SwDicTeki (MasterKbn, NCode, ' +
					{ 借方ｺｰﾄﾞ }
					'DKmkNCode, DSubNCode, DBmnNCode, ' +
					'DSegNCode1, DSegNCode2, DSegNCode3, DSegNCode4, DSegNCode5, ' +
					'DSegNCode6, DSegNCode7, DSegNCode8, DSegNCode9, DSegNCode10, ' +
					'DBankNCode, DCsNCode, DEmpNCode, ' +
					'DMulNCode1, DMulNCode2, DMulNCode3, DMulNCode4, DMulNCode5, ' +
					'DPrjNCode1, DPrjNCode2, DPrjNCode3, DPrjNCode4, DPrjNCode5, ' +
					'DPrjNCode6, DPrjNCode7, DPrjNCode8, DPrjNCode9, DPrjNCode10, ' +
					'DPjSubNCode1, DPjSubNCode2, DPjSubNCode3, DPjSubNCode4, DPjSubNCode5, ' +
					'DPjSubNCode6, DPjSubNCode7, DPjSubNCode8, DPjSubNCode9, DPjSubNCode10, ' +
					{ 貸方ｺｰﾄﾞ }
					'CKmkNCode, CSubNCode, CBmnNCode, ' +
					'CSegNCode1, CSegNCode2, CSegNCode3, CSegNCode4, CSegNCode5, ' +
					'CSegNCode6, CSegNCode7, CSegNCode8, CSegNCode9, CSegNCode10, ' +
					'CBankNCode, CCsNCode, CEmpNCode, ' +
					'CMulNCode1, CMulNCode2, CMulNCode3, CMulNCode4, CMulNCode5, ' +
					'CPrjNCode1, CPrjNCode2, CPrjNCode3, CPrjNCode4, CPrjNCode5, ' +
					'CPrjNCode6, CPrjNCode7, CPrjNCode8, CPrjNCode9, CPrjNCode10, ' +
					'CPjSubNCode1, CPjSubNCode2, CPjSubNCode3, CPjSubNCode4, CPjSubNCode5, ' +
					'CPjSubNCode6, CPjSubNCode7, CPjSubNCode8, CPjSubNCode9, CPjSubNCode10, ' +
					{ 借方区分 }
					'DKmkKbn, DSubKbn, DBmnKbn, ' +
					'DSegKbn1, DSegKbn2, DSegKbn3, DSegKbn4, DSegKbn5, ' +
					'DSegKbn6, DSegKbn7, DSegKbn8, DSegKbn9, DSegKbn10, ' +
					'DBankKbn, DCsKbn, DEmpKbn, ' +
					'DMulKbn1, DMulKbn2, DMulKbn3, DMulKbn4, DMulKbn5, ' +
					'DPrjKbn1, DPrjKbn2, DPrjKbn3, DPrjKbn4, DPrjKbn5, ' +
					'DPrjKbn6, DPrjKbn7, DPrjKbn8, DPrjKbn9, DPrjKbn10, ' +
					'DPjSubKbn1, DPjSubKbn2, DPjSubKbn3, DPjSubKbn4, DPjSubKbn5, ' +
					'DPjSubKbn6, DPjSubKbn7, DPjSubKbn8, DPjSubKbn9, DPjSubKbn10, ' +
					{ 貸方区分 }
					'CKmkKbn, CSubKbn, CBmnKbn, ' +
					'CSegKbn1, CSegKbn2, CSegKbn3, CSegKbn4, CSegKbn5, ' +
					'CSegKbn6, CSegKbn7, CSegKbn8, CSegKbn9, CSegKbn10, ' +
					'CBankKbn, CCsKbn, CEmpKbn, ' +
					'CMulKbn1, CMulKbn2, CMulKbn3, CMulKbn4, CMulKbn5, ' +
					'CPrjKbn1, CPrjKbn2, CPrjKbn3, CPrjKbn4, CPrjKbn5, ' +
					'CPrjKbn6, CPrjKbn7, CPrjKbn8, CPrjKbn9, CPrjKbn10, ' +
					'CPjSubKbn1, CPjSubKbn2, CPjSubKbn3, CPjSubKbn4, CPjSubKbn5, ' +
					'CPjSubKbn6, CPjSubKbn7, CPjSubKbn8, CPjSubKbn9, CPjSubKbn10, ' +
					{ 消費税 }
					'STaxKbn, STaxCode, STaxRate, TypeCode) ';

            SQL.Add(strSQL); 				// 長すぎるので一度ADD
					{ ■param■ }
            strSQL := 'VALUES (61, :parNCode, ' +
					{ 借方ｺｰﾄﾞ }
					':parDKmkNCode, :parDSubNCode, :parDBmnNCode, ' +
					':parDSegNCode1, :parDSegNCode2, :parDSegNCode3, :parDSegNCode4, :parDSegNCode5, ' +
					':parDSegNCode6, :parDSegNCode7, :parDSegNCode8, :parDSegNCode9, :parDSegNCode10, ' +
					':parDBankNCode, :parDCsNCode, :parDEmpNCode, ' +
					':parDMulNCode1, :parDMulNCode2, :parDMulNCode3, :parDMulNCode4, :parDMulNCode5, ' +
					':parDPrjNCode1, :parDPrjNCode2, :parDPrjNCode3, :parDPrjNCode4, :parDPrjNCode5, ' +
					':parDPrjNCode6, :parDPrjNCode7, :parDPrjNCode8, :parDPrjNCode9, :parDPrjNCode10, ' +
					':parDPjSubNCode1, :parDPjSubNCode2, :parDPjSubNCode3, :parDPjSubNCode4, :parDPjSubNCode5, ' +
					':parDPjSubNCode6, :parDPjSubNCode7, :parDPjSubNCode8, :parDPjSubNCode9, :parDPjSubNCode10, ' +
					{ 貸方ｺｰﾄﾞ }
					':parCKmkNCode, :parCSubNCode, :parCBmnNCode, ' +
					':parCSegNCode1, :parCSegNCode2, :parCSegNCode3, :parCSegNCode4, :parCSegNCode5, ' +
					':parCSegNCode6, :parCSegNCode7, :parCSegNCode8, :parCSegNCode9, :parCSegNCode10, ' +
					':parCBankNCode, :parCCsNCode, :parCEmpNCode, ' +
					':parCMulNCode1, :parCMulNCode2, :parCMulNCode3, :parCMulNCode4, :parCMulNCode5, ' +
					':parCPrjNCode1, :parCPrjNCode2, :parCPrjNCode3, :parCPrjNCode4, :parCPrjNCode5, ' +
					':parCPrjNCode6, :parCPrjNCode7, :parCPrjNCode8, :parCPrjNCode9, :parCPrjNCode10, ' +
					':parCPjSubNCode1, :parCPjSubNCode2, :parCPjSubNCode3, :parCPjSubNCode4, :parCPjSubNCode5, ' +
					':parCPjSubNCode6, :parCPjSubNCode7, :parCPjSubNCode8, :parCPjSubNCode9, :parCPjSubNCode10, ' +
					{ 借方区分 }
					':parDKmkKbn, :parDSubKbn, :parDBmnKbn, ' +
					':parDSegKbn1, :parDSegKbn2, :parDSegKbn3, :parDSegKbn4, :parDSegKbn5, ' +
					':parDSegKbn6, :parDSegKbn7, :parDSegKbn8, :parDSegKbn9, :parDSegKbn10, ' +
					':parDBankKbn, :parDCsKbn, :parDEmpKbn, ' +
					':parDMulKbn1, :parDMulKbn2, :parDMulKbn3, :parDMulKbn4, :parDMulKbn5, ' +
					':parDPrjKbn1, :parDPrjKbn2, :parDPrjKbn3, :parDPrjKbn4, :parDPrjKbn5, ' +
					':parDPrjKbn6, :parDPrjKbn7, :parDPrjKbn8, :parDPrjKbn9, :parDPrjKbn10, ' +
					':parDPjSubKbn1, :parDPjSubKbn2, :parDPjSubKbn3, :parDPjSubKbn4, :parDPjSubKbn5, ' +
					':parDPjSubKbn6, :parDPjSubKbn7, :parDPjSubKbn8, :parDPjSubKbn9, :parDPjSubKbn10, ' +
					{ 貸方区分 }
					':parCKmkKbn, :parCSubKbn, :parCBmnKbn, ' +
					':parCSegKbn1, :parCSegKbn2, :parCSegKbn3, :parCSegKbn4, :parCSegKbn5, ' +
					':parCSegKbn6, :parCSegKbn7, :parCSegKbn8, :parCSegKbn9, :parCSegKbn10, ' +
					':parCBankKbn, :parCCsKbn, :parCEmpKbn, ' +
					':parCMulKbn1, :parCMulKbn2, :parCMulKbn3, :parCMulKbn4, :parCMulKbn5, ' +
					':parCPrjKbn1, :parCPrjKbn2, :parCPrjKbn3, :parCPrjKbn4, :parCPrjKbn5, ' +
					':parCPrjKbn6, :parCPrjKbn7, :parCPrjKbn8, :parCPrjKbn9, :parCPrjKbn10, ' +
					':parCPjSubKbn1, :parCPjSubKbn2, :parCPjSubKbn3, :parCPjSubKbn4, :parCPjSubKbn5, ' +
					':parCPjSubKbn6, :parCPjSubKbn7, :parCPjSubKbn8, :parCPjSubKbn9, :parCPjSubKbn10, ' +
					{ 消費税 }
					':parSTaxKbn, :parSTaxCode, :parSTaxRate, :parTypeCode) ';

		end
		else								// UPDATE
		begin
			strSQL := 'UPDATE SwDicTeki SET ' +
			{ 借方ｺｰﾄﾞ }
					'DKmkNCode = :parDKmkNCode, ' +									// 勘定科目
					'DSubNCode = :parDSubNCode, ' +									// 細目科目
					'DBmnNCode = :parDBmnNCode, ';									// 部門
			for iCnt := 1 to 10 do													// ｾｸﾞﾒﾝﾄ1～10
			begin
				strFld := 'DSegNCode' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			strSQL := strSQL +
					'DBankNCode = :parDBankNCode, ' + 								// 銀行
					'DCsNCode = :parDCsNCode, ' +									// 取引先
					'DEmpNCode = :parDEmpNCode, ';									// 社員
			for iCnt := 1 to 5 do													// 汎用補助1～5
			begin
				strFld := 'DMulNCode' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
			begin
				strFld := 'DPrjNCode' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
			begin
				strFld := 'DPjSubNCode' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			{ 貸方ｺｰﾄﾞ }
			strSQL := strSQL +
					'CKmkNCode = :parCKmkNCode, ' +									// 勘定科目
					'CSubNCode = :parCSubNCode, ' +									// 細目科目
					'CBmnNCode = :parCBmnNCode, ';									// 部門
			for iCnt := 1 to 10 do													// ｾｸﾞﾒﾝﾄ1～10
			begin
				strFld := 'CSegNCode' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			strSQL := strSQL +
					'CBankNCode = :parCBankNCode, ' + 								// 銀行
					'CCsNCode = :parCCsNCode, ' +									// 取引先
					'CEmpNCode = :parCEmpNCode, ';									// 社員
			for iCnt := 1 to 5 do													// 汎用補助1～5
			begin
				strFld := 'CMulNCode' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
			begin
				strFld := 'CPrjNCode' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
			begin
				strFld := 'CPjSubNCode' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;

        SQL.Add(strSQL);					// 長すぎるので一度ADD

			{ 借方区分 }
			strSQL :=
					'DKmkKbn = :parDKmkKbn, ' +
					'DSubKbn = :parDSubkbn, ' +
					'DBmnKbn = :parDBmnKbn, ';
			for iCnt := 1 to 10 do													// ｾｸﾞﾒﾝﾄ1～10
			begin
				strFld := 'DSegKbn' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			strSQL := strSQL +
					'DBankKbn = :parDBankKbn, ' +
					'DCsKbn = :parDCsKbn, ' +
					'DEmpKbn = :parDEmpKbn, ';
			for iCnt := 1 to 5 do													// 汎用補助1～5
			begin
				strFld := 'DMulKbn' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
			begin
				strFld := 'DPrjKbn' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
			begin
				strFld := 'DPjSubKbn' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			{ 貸方区分 }
			strSQL := strSQL +
					'CKmkKbn = :parCKmkKbn, ' +
					'CSubKbn = :parCSubkbn, ' +
					'CBmnKbn = :parCBmnKbn, ';
			for iCnt := 1 to 10 do													// ｾｸﾞﾒﾝﾄ1～10
			begin
				strFld := 'CSegKbn' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			strSQL := strSQL +
					'CBankKbn = :parCBankKbn, ' +
					'CCsKbn = :parCCsKbn, ' +
					'CEmpKbn = :parCEmpKbn, ';
			for iCnt := 1 to 5 do													// 汎用補助1～5
			begin
				strFld := 'CMulKbn' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
			begin
				strFld := 'CPrjKbn' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
			begin
				strFld := 'CPjSubKbn' + IntToStr(iCnt);
				strSQL := strSQL + strFld + ' = :par' + strFld + ', ';
			end;
			{ 消費税 }
			strSQL := strSQL + 
					'STaxKbn = :parSTaxKbn, ' +
					'STaxCode = :parSTaxCode, ' +
					'STaxRate = :parSTaxRate, ' +
					'TypeCode = :parTypeCode ' +
			{ WHERE }
					'WHERE MasterKbn = 61 AND NCode = :parNCode';
		end;

		SQL.Add (strSQL);
											// 摘要
		ParamByName('parNCode').AsFloat	:= fnGetNCode(TBL_TEKI, 0, m_stMasterData.nExCode);

		{ 借方ｺｰﾄﾞ }
											// 勘定科目ｺｰﾄﾞ
		SetInputParam(MKBN_KAMOKU, DC_KARIKATA, ParamByName('parDKmkNCode'));
        									// 細目科目ｺｰﾄﾞ
		SetInputParam(MKBN_SAIMOKU, DC_KARIKATA, ParamByName('parDSubNCode'));
        									// 借方部門ｺｰﾄﾞ
		SetInputParam(MKBN_BUMON, DC_KARIKATA, ParamByName('parDBmnNCode'));

		for iCnt := 1 to 10 do				// ｾｸﾞﾒﾝﾄ1～10
		begin
			strFld := 'parDSegNCode' + IntToStr(iCnt);
			SetInputParam(MKBN_SEG1 + iCnt - 1, DC_KARIKATA, ParamByName(strFld));
		end;

        									// 銀行
		SetInputParam(MKBN_GINKOU, DC_KARIKATA, ParamByName('parDBankNCode'));
        									// 取引先
		SetInputParam(MKBN_TORIHIKI, DC_KARIKATA, ParamByName('parDCsNCode'));
        									// 社員
		SetInputParam(MKBN_SYAIN, DC_KARIKATA, ParamByName('parDEmpNCode'));
		for iCnt := 1 to 5 do
		begin
			strFld := 'parDMulNCode' + IntToStr(iCnt);
			SetInputParam(MKBN_HHOJYO1 + iCnt - 1, DC_KARIKATA, ParamByName(strFld));
		end;
		for iCnt := 1 to 10 do
		begin
			strFld := 'parDPrjNCode' + IntToStr(iCnt);
			SetInputParam(MKBN_PROJECT1 + iCnt - 1, DC_KARIKATA, ParamByName(strFld));
		end;
		for iCnt := 1 to 10 do
		begin
			strFld := 'parDPjSubNCode' + IntToStr(iCnt);
			SetInputParam(MKBN_PROSUB1 + iCnt - 1, DC_KARIKATA, ParamByName(strFld));
		end;

		{ 貸方ｺｰﾄﾞ }
											// 勘定科目ｺｰﾄﾞ
		SetInputParam(MKBN_KAMOKU, DC_KASIKATA, ParamByName('parCKmkNCode'));
        									// 細目科目ｺｰﾄﾞ
		SetInputParam(MKBN_SAIMOKU, DC_KASIKATA, ParamByName('parCSubNCode'));
        									// 貸方部門ｺｰﾄﾞ
		SetInputParam(MKBN_BUMON, DC_KASIKATA, ParamByName('parCBmnNCode'));

		for iCnt := 1 to 10 do
		begin
			strFld := 'parCSegNCode' + IntToStr(iCnt);
			SetInputParam(MKBN_SEG1 + iCnt - 1, DC_KASIKATA, ParamByName(strFld));
		end;

        									// 銀行
		SetInputParam(MKBN_GINKOU, DC_KASIKATA, ParamByName('parCBankNCode'));
        									// 取引先
		SetInputParam(MKBN_TORIHIKI, DC_KASIKATA, ParamByName('parCCsNCode'));
        									// 社員
		SetInputParam(MKBN_SYAIN, DC_KASIKATA, ParamByName('parCEmpNCode'));
		for iCnt := 1 to 5 do
		begin
			strFld := 'parCMulNCode' + IntToStr(iCnt);
			SetInputParam(MKBN_HHOJYO1 + iCnt - 1, DC_KASIKATA, ParamByName(strFld));
		end;
		for iCnt := 1 to 10 do
		begin
			strFld := 'parCPrjNCode' + IntToStr(iCnt);
			SetInputParam(MKBN_PROJECT1 + iCnt - 1, DC_KASIKATA, ParamByName(strFld));
		end;
		for iCnt := 1 to 10 do
		begin
			strFld := 'parCPjSubNCode' + IntToStr(iCnt);
			SetInputParam(MKBN_PROSUB1 + iCnt - 1, DC_KASIKATA, ParamByName(strFld));
		end;

		{ 借方区分 }
		ParamByName ('parDKmkKbn').AsInteger	:= cCmbK1DCmb.ItemIndex;
		ParamByName ('parDSubkbn').AsInteger	:= fnGetKbn(MKBN_SAIMOKU, DC_KARIKATA);
		ParamByName ('parDBmnKbn').AsInteger	:= fnGetKbn(MKBN_BUMON, DC_KARIKATA);
		for iCnt := 1 to 10 do													// ｾｸﾞﾒﾝﾄ1～10
		begin
			strFld := 'parDSegKbn' + IntToStr(iCnt);
			ParamByName(strFld).AsFloat := fnGetKbn(MKBN_SEG1 + iCnt - 1, DC_KARIKATA);
		end;
		ParamByName ('parDBankKbn').AsInteger	:= fnGetKbn(MKBN_GINKOU, DC_KARIKATA);
		ParamByName ('parDCsKbn').AsInteger		:= fnGetKbn(MKBN_TORIHIKI, DC_KARIKATA);
		ParamByName ('parDEmpKbn').AsInteger	:= fnGetKbn(MKBN_SYAIN, DC_KARIKATA);

		for iCnt := 1 to 5 do													// 汎用補助1～5
		begin
			strFld := 'parDMulKbn' + IntToStr(iCnt);
			ParamByName (strFld).AsInteger := fnGetKbn(MKBN_HHOJYO1 + iCnt - 1, DC_KARIKATA);
		end;
		for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
		begin
			strFld := 'parDPrjKbn' + IntToStr(iCnt);
			ParamByName (strFld).AsInteger := fnGetKbn(MKBN_PROJECT1 + iCnt - 1, DC_KARIKATA);
		end;
		for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
		begin
			strFld := 'parDPjSubKbn' + IntToStr(iCnt);
			ParamByName (strFld).AsInteger := fnGetKbn(MKBN_PROSUB1 + iCnt - 1, DC_KARIKATA);
		end;

		{ 貸方区分 }
		ParamByName ('parCKmkKbn').AsInteger	:= cCmbK1CCmb.ItemIndex;
		ParamByName ('parCSubkbn').AsInteger	:= fnGetKbn(MKBN_SAIMOKU, DC_KASIKATA);
		ParamByName ('parCBmnKbn').AsInteger	:= fnGetKbn(MKBN_BUMON, DC_KASIKATA);
		for iCnt := 1 to 10 do													// ｾｸﾞﾒﾝﾄ1～10
		begin
			strFld := 'parCSegKbn' + IntToStr(iCnt);
			ParamByName(strFld).AsFloat := fnGetKbn(MKBN_SEG1 + iCnt - 1, DC_KASIKATA);
		end;
		ParamByName ('parCBankKbn').AsInteger	:= fnGetKbn(MKBN_GINKOU, DC_KASIKATA);
		ParamByName ('parCCsKbn').AsInteger		:= fnGetKbn(MKBN_TORIHIKI, DC_KASIKATA);
		ParamByName ('parCEmpKbn').AsInteger	:= fnGetKbn(MKBN_SYAIN, DC_KASIKATA);

		for iCnt := 1 to 5 do													// 汎用補助1～5
		begin
			strFld := 'parCMulKbn' + IntToStr(iCnt);
			ParamByName (strFld).AsInteger := fnGetKbn(MKBN_HHOJYO1 + iCnt - 1, DC_KASIKATA);
		end;
		for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
		begin
			strFld := 'parCPrjKbn' + IntToStr(iCnt);
			ParamByName (strFld).AsInteger := fnGetKbn(MKBN_PROJECT1 + iCnt - 1, DC_KASIKATA);
		end;
		for iCnt := 1 to 10 do													// ﾌﾟﾛｼﾞｪｸﾄ1～10
		begin
			strFld := 'parCPjSubKbn' + IntToStr(iCnt);
			ParamByName (strFld).AsInteger := fnGetKbn(MKBN_PROSUB1 + iCnt - 1, DC_KASIKATA);
		end;

		{ 消費税 }
		ParamByName ('parSTaxKbn').AsInteger	:= m_stMasterData.nTaxDivision;		// 売上/仕入区分
		ParamByName ('parSTaxCode').AsInteger	:= m_stMasterData.nTaxCode;			// 消費税ｺｰﾄﾞ
		ParamByName ('parSTaxRate').AsInteger	:= m_stMasterData.nTaxRate;			// 消費税率
		ParamByName ('parTypeCode').AsInteger	:= m_stMasterData.nTypeCode;		// 業種ｺｰﾄﾞ

(*
		if	(fNewRecord) then
		begin
			SQL.Add ('INSERT INTO SwDicTeki (MasterKbn, TekiNCode, DKmkNCode, ');

			SQL.Add ('DKmkKbn, DSubKbn, DBmnKbn, DSeg1Kbn, DHojyo1Kbn, DHojyo2Kbn, DKojKbn, DKsyKbn, ');
			SQL.Add ('CKmkKbn, CSubKbn, CBmnKbn, CSeg1Kbn, CHojyo1Kbn, CHojyo2Kbn, CKojKbn, CKsyKbn, ');

			if	(m_stMasterData.nExCodeK2Deb <> '') then
				SQL.Add ('DSubNCode, ');

			SQL.Add ('DBmnNCode, DSeg1NCode, DHojyo1NCode, DHojyo2NCode, DKojNCode, DKsyNCode, CKmkNCode, ');

			if	(m_stMasterData.nExCodeK2Cre <> '') then
				SQL.Add ('CSubNCode, ');

			SQL.Add ('CBmnNCode, CSeg1NCode, CHojyo1NCode, CHojyo2NCode, CKojNCode, CKsyNCode, ');
			SQL.Add ('STaxKbn, STaxCode, STaxRate, TypeCode) ');
			SQL.Add ('VALUES (61, :nExCode, :nExCodeK1Deb, ');

			SQL.Add (':nDKmkKbn, :nDSubKbn, :nDBmnKbn, :nDSeg1Kbn, :nDHojyo1Kbn, :nDHojyo2Kbn, :nDKojKbn, :nDKsyKbn, ');
			SQL.Add (':nCKmkKbn, :nCSubKbn, :nCBmnKbn, :nCSeg1Kbn, :nCHojyo1Kbn, :nCHojyo2Kbn, :nCKojKbn, :nCKsyKbn, ');

			if	(m_stMasterData.nExCodeK2Deb <> '') then
				SQL.Add (':nExCodeK2Deb, ');

			SQL.Add (':strExCodeBUDeb, :strExCodeSGDeb, :strExCodeH1Deb, :strExCodeH2Deb, :strExCodeKODeb, :strExCodeKSDeb, :nExCodeK1Cre, ');

			if	(m_stMasterData.nExCodeK2Cre <> '') then
				SQL.Add (':nExCodeK2Cre, ');

			SQL.Add (':strExCodeBUCre, :strExCodeSGCre, :strExCodeH1Cre, :strExCodeH2Cre, :strExCodeKOCre, :strExCodeKSCre, ');
			SQL.Add (':nTaxDivision, :nTaxCode, :nTaxRate, :nTypeCode)');
		end
		else
		begin
			SQL.Add ('UPDATE SwDicTeki SET ');
			SQL.Add ('DKmkNCode    = :nExCodeK1Deb  , ');								// 仕訳情報(借): 勘定科目ｺｰﾄﾞ

			if	(m_stMasterData.nExCodeK2Deb <> '') then
				SQL.Add ('DSubNCode = :nExCodeK2Deb, ')									// 仕訳情報(借): 細目科目ｺｰﾄﾞ
			else
				SQL.Add ('DSubNCode = NULL, ');											// 仕訳情報(借): 細目科目ｺｰﾄﾞ

			SQL.Add ('DBmnNCode    = :strExCodeBUDeb, ');								// 仕訳情報(借): 部門ｺｰﾄﾞ
			SQL.Add ('DSeg1NCode   = :strExCodeSGDeb, ');								// 仕訳情報(借): ｾｸﾞﾒﾝﾄｺｰﾄﾞ
			SQL.Add ('DHojyo1NCode = :strExCodeH1Deb, ');								// 仕訳情報(借): 第1補助ｺｰﾄﾞ
			SQL.Add ('DHojyo2NCode = :strExCodeH2Deb, ');								// 仕訳情報(借): 第2補助ｺｰﾄﾞ
			SQL.Add ('DKojNCode    = :strExCodeKODeb, ');								// 仕訳情報(借): 工事ｺｰﾄﾞ
			SQL.Add ('DKsyNCode    = :strExCodeKSDeb, ');								// 仕訳情報(借): 工種ｺｰﾄﾞ
			SQL.Add ('CKmkNCode    = :nExCodeK1Cre  , ');								// 仕訳情報(貸): 勘定科目ｺｰﾄﾞ

			if	(m_stMasterData.nExCodeK2Cre <> '') then
				SQL.Add ('CSubNCode = :nExCodeK2Cre, ')									// 仕訳情報(貸): 細目科目ｺｰﾄﾞ
			else
				SQL.Add ('CSubNCode = NULL, ');											// 仕訳情報(貸): 細目科目ｺｰﾄﾞ

			SQL.Add ('CBmnNCode    = :strExCodeBUCre, ');								// 仕訳情報(貸): 部門ｺｰﾄﾞ
			SQL.Add ('CSeg1NCode   = :strExCodeSGCre, ');								// 仕訳情報(貸): ｾｸﾞﾒﾝﾄｺｰﾄﾞ
			SQL.Add ('CHojyo1NCode = :strExCodeH1Cre, ');								// 仕訳情報(貸): 第1補助ｺｰﾄﾞ
			SQL.Add ('CHojyo2NCode = :strExCodeH2Cre, ');								// 仕訳情報(貸): 第2補助ｺｰﾄﾞ
			SQL.Add ('CKojNCode    = :strExCodeKOCre, ');								// 仕訳情報(貸): 工事ｺｰﾄﾞ
			SQL.Add ('CKsyNCode    = :strExCodeKSCre, ');								// 仕訳情報(貸): 工種ｺｰﾄﾞ
			SQL.Add ('STaxKbn     = :nTaxDivision  , ');								// 消費税関係  : 売上/仕入区分
			SQL.Add ('STaxCode    = :nTaxCode      , ');								// 消費税関係  : 消費税ｺｰﾄﾞ
			SQL.Add ('STaxRate    = :nTaxRate      , ');								// 消費税関係  : 消費税率
			SQL.Add ('TypeCode    = :nTypeCode       ');								// 消費税関係  : 業種ｺｰﾄﾞ

			SQL.Add ('                             , ');
			SQL.Add ('DKmkKbn     = :nDKmkKbn      , ');
			SQL.Add ('DSubKbn     = :nDSubKbn      , ');
			SQL.Add ('DBmnKbn     = :nDBmnKbn      , ');
			SQL.Add ('DSeg1Kbn    = :nDSeg1Kbn     , ');
			SQL.Add ('DHojyo1Kbn  = :nDHojyo1Kbn   , ');
			SQL.Add ('DHojyo2Kbn  = :nDHojyo2Kbn   , ');
			SQL.Add ('DKojKbn     = :nDKojKbn      , ');
			SQL.Add ('DKsyKbn     = :nDKsyKbn      , ');
			SQL.Add ('CKmkKbn     = :nCKmkKbn      , ');
			SQL.Add ('CSubKbn     = :nCSubKbn      , ');
			SQL.Add ('CBmnKbn     = :nCBmnKbn      , ');
			SQL.Add ('CSeg1Kbn    = :nCSeg1Kbn     , ');
			SQL.Add ('CHojyo1Kbn  = :nCHojyo1Kbn   , ');
			SQL.Add ('CHojyo2Kbn  = :nCHojyo2Kbn   , ');
			SQL.Add ('CKojKbn     = :nCKojKbn      , ');
			SQL.Add ('CKsyKbn     = :nCKsyKbn        ');

			SQL.ADD ('WHERE MasterKbn = 61 AND TekiNCode = :nExCode');
		end;

		ParamByName ('nExCode'       ).AsFloat	:= fnGetNCode(TBL_TEKI,0,m_stMasterData.nExCode);

		ParamByName ('nExCodeK1Deb'  ).AsFloat	    := fnGetNCode(TBL_KAMOK,0,m_stMasterData.nExCodeK1Deb,0);                     // 仕訳情報(借): 勘定科目ｺｰﾄﾞ

		if	(m_stMasterData.nExCodeK2Deb <> '') then

            // 仕訳情報(借): 細目科目ｺｰﾄﾞ
			ParamByName ('nExCodeK2Deb').AsFloat	:= fnGetKmkSubNCode(m_stMasterData.nExCodeK1Deb,m_stMasterData.nExCodeK2Deb);

		ParamByName ('strExCodeBUDeb'	).AsFloat	:= fnGetHojNCode(MASTER_SECTION,m_stMasterData.strExCodeBUDeb);	    // 仕訳情報(借): 部門ｺｰﾄﾞ
		ParamByName ('strExCodeSGDeb'	).AsFloat	:= fnGetHojNCode(MASTER_SEGMENT,m_stMasterData.strExCodeSGDeb);	// 仕訳情報(借): ｾｸﾞﾒﾝﾄｺｰﾄﾞ
		ParamByName ('strExCodeH1Deb'	).AsFloat	:= fnGetHojNCode(MASTER_HOJYO1,m_stMasterData.strExCodeH1Deb);    // 仕訳情報(借): 第1補助ｺｰﾄﾞ
		ParamByName ('strExCodeH2Deb'	).AsFloat	:= fnGetHojNCode(MASTER_HOJYO2,m_stMasterData.strExCodeH2Deb);    // 仕訳情報(借): 第2補助ｺｰﾄﾞ
		ParamByName ('strExCodeKODeb'	).AsFloat	:= fnGetHojNCode(MASTER_CONSTRUCT,m_stMasterData.strExCodeKODeb);  	// 仕訳情報(借): 工事ｺｰﾄﾞ
		ParamByName ('strExCodeKSDeb'	).AsFloat	:= fnGetHojNCode(MASTER_CONSTKIND,m_stMasterData.strExCodeKSDeb);   // 仕訳情報(借): 工種ｺｰﾄﾞ

		ParamByName ('nExCodeK1Cre'		).AsFloat	:= fnGetNCode(TBL_KAMOK,0,m_stMasterData.nExCodeK1Cre,0);		                // 仕訳情報(貸): 勘定科目ｺｰﾄﾞ

		if	(m_stMasterData.nExCodeK2Cre <> '') then
            // 仕訳情報(貸): 細目科目ｺｰﾄﾞ
			ParamByName ('nExCodeK2Cre'	).AsFloat	:= fnGetKmkSubNCode(m_stMasterData.nExCodeK1Cre,m_stMasterData.nExCodeK2Cre);

		ParamByName ('strExCodeBUCre'	).AsFloat	:= fnGetHojNCode(MASTER_SECTION,m_stMasterData.strExCodeBUCre);	    // 仕訳情報(貸): 部門ｺｰﾄﾞ
		ParamByName ('strExCodeSGCre'	).AsFloat	:= fnGetHojNCode(MASTER_SEGMENT,m_stMasterData.strExCodeSGCre);	// 仕訳情報(貸): ｾｸﾞﾒﾝﾄｺｰﾄﾞ
		ParamByName ('strExCodeH1Cre'	).AsFloat	:= fnGetHojNCode(MASTER_HOJYO1,m_stMasterData.strExCodeH1Cre);    // 仕訳情報(貸): 第1補助ｺｰﾄﾞ
		ParamByName ('strExCodeH2Cre'	).AsFloat	:= fnGetHojNCode(MASTER_HOJYO2,m_stMasterData.strExCodeH2Cre);    // 仕訳情報(貸): 第2補助ｺｰﾄﾞ
		ParamByName ('strExCodeKOCre'	).AsFloat	:= fnGetHojNCode(MASTER_CONSTRUCT,m_stMasterData.strExCodeKOCre);  	// 仕訳情報(貸): 工事ｺｰﾄﾞ
		ParamByName ('strExCodeKSCre'	).AsFloat	:= fnGetHojNCode(MASTER_CONSTKIND,m_stMasterData.strExCodeKSCre);   // 仕訳情報(貸): 工種ｺｰﾄﾞ


		ParamByName ('nTaxDivision'		).AsInteger	:= m_stMasterData.nTaxDivision;		// 消費税関係  : 売上/仕入区分
		ParamByName ('nTaxCode'			).AsInteger	:= m_stMasterData.nTaxCode;			// 消費税関係  : 消費税ｺｰﾄﾞ
		ParamByName ('nTaxRate'			).AsInteger	:= m_stMasterData.nTaxRate;			// 消費税関係  : 消費税率
		ParamByName ('nTypeCode'		).AsInteger	:= m_stMasterData.nTypeCode;		// 消費税関係  : 業種ｺｰﾄﾞ

		ParamByName ('nDKmkKbn'			).AsInteger	:= cCmbK1DCmb.ItemIndex;
		ParamByName ('nDSubKbn'			).AsInteger	:= cCmbK2DCmb.ItemIndex;
		ParamByName ('nDBmnKbn'			).AsInteger	:= cCmbBUDCmb.ItemIndex;
		ParamByName ('nDSeg1Kbn'		).AsInteger	:= cCmbSGDCmb.ItemIndex;
		ParamByName ('nDHojyo1Kbn'		).AsInteger	:= cCmbH1DCmb.ItemIndex;
		ParamByName ('nDHojyo2Kbn'		).AsInteger	:= cCmbH2DCmb.ItemIndex;
		ParamByName ('nDKojKbn'			).AsInteger	:= cCmbKODCmb.ItemIndex;
		ParamByName ('nDKsyKbn'			).AsInteger	:= cCmbKSDCmb.ItemIndex;

		ParamByName ('nCKmkKbn'			).AsInteger	:= cCmbK1CCmb.ItemIndex;
		ParamByName ('nCSubKbn'			).AsInteger	:= cCmbK2CCmb.ItemIndex;
		ParamByName ('nCBmnKbn'			).AsInteger	:= cCmbBUCCmb.ItemIndex;
		ParamByName ('nCSeg1Kbn'		).AsInteger	:= cCmbSGCCmb.ItemIndex;
		ParamByName ('nCHojyo1Kbn'		).AsInteger	:= cCmbH1CCmb.ItemIndex;
		ParamByName ('nCHojyo2Kbn'		).AsInteger	:= cCmbH2CCmb.ItemIndex;
		ParamByName ('nCKojKbn'			).AsInteger	:= cCmbKOCCmb.ItemIndex;
		ParamByName ('nCKsyKbn'			).AsInteger	:= cCmbKSCCmb.ItemIndex;
*)
// <HIS0052> MOD end
		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			fnOutputDBErrorMessage ();
		end;
    end;

	dqMasterData.Close ();
	dqMasterData.Free  ();
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnUpdateMasterTreeRecord ()														*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要分類体系ﾏｽﾀ更新															*/
//*																											*/
//*	戻り値	: Boolean, (true:正常終了, false:異常終了)														*/
//*																											*/
//***********************************************************************************************************/
function    TJNTCRP020000f.fnUpdateMasterTreeRecord (): Boolean;
var
	dqMasterTree: TMQuery;
	fNewRecord  : Boolean;

    exSumNCode   : Extended;
    exBasedNCode : Extended;

begin

	dqMasterTree	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterTree);							// DBとMQueryの接続

	with (dqMasterTree) do
	begin
		Close ();
		SQL.Clear ();

        if m_InsFlg = True then
        begin
            SQL.Add('SELECT @@Identity as NCode FROM TekiMA ');
    		if	(not Open ()) then
            begin
		    	m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);
    			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);
	    		dqMasterTree.Close ();
		    	dqMasterTree.Free  ();
			    Result	:= false;
    			Exit;
	    	end;
            exSumNCode   := fnGetNCode(m_nProcDivision,1,m_stMasterData.nExCodeParent);
            exBasedNCode := GetFld('NCode').AsFloat;
    		Close ();
	    	SQL.Clear ();
        end
        else
        begin
            exSumNCode   := fnGetNCode(m_nProcDivision,1,m_stMasterData.nExCodeParent);
            exBasedNCode := fnGetNCode(m_nProcDivision,0,m_stMasterData.nExCode);
        end;

        SQL.Add   ('SELECT MasterKbn FROM TekiTree ');   // HIS0029
		SQL.Add   ('WHERE  MasterKbn = 61 AND ');
        SQL.Add   ('       TekiKbn = :nDivision AND SumNCode = :nDstCode AND BasedNCode = :nSrcCode');   // HIS0029

		ParamByName ('nDivision').AsInteger	:= m_nProcDivision;

		ParamByName ('nDstCode' ).AsFloat	:= exSumNCode;      //HIS0032
		ParamByName ('nSrcCode' ).AsFloat	:= exBasedNCode;    //HIS0032

		if	(not Open ()) then
        begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			dqMasterTree.Close ();
			dqMasterTree.Free  ();

			Result	:= false;
			Exit;
		end;

		if	(not EOF) then
			fNewRecord	:= false
		else
			fNewRecord	:= true;

		Close ();
	end;

	m_fUpdateRecord	:= true;

	if	(not fNewRecord) then
	begin
		dqMasterTree.Free ();

		Result	:= true;																// 以下, 未処理
		Exit;
	end;

	with (dqMasterTree) do
	begin
        Close ();

		SQL.Clear ();
        SQL.Add   ('INSERT INTO TekiTree (MasterKbn, TekiKbn, SumNCode, BasedNCode');   // HIS0029
		SQL.Add   (', UpdTantoNCode)'); // HIS0076
		SQL.Add   ('VALUES (61, :nProcDivision, :nSumCode, :nBasedCode');
		SQL.Add   (', :nUpdTantoNCode)'); // HIS0076

		ParamByName ('nProcDivision').AsInteger	 := m_nProcDivision;

		ParamByName ('nSumCode'     ).AsFloat	 := exSumNCode;
		ParamByName ('nBasedCode'   ).AsFloat	 := exBasedNCode;
		ParamByName ('nUpdTantoNCode').AsFloat	 := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0076

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterTree);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterTree);

			dqMasterTree.Close ();
			dqMasterTree.Free  ();

			Result	:= false;
			Exit;
		end;
	end;

	dqMasterTree.Close ();
	dqMasterTree.Free  ();

	Result	:= true;																	// 正常終了
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnUpdateMasterDataRecord ()														*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要ﾏｽﾀ更新																	*/
//*																											*/
//*	戻り値	: Boolean, (true:正常終了, false:異常終了)							                            */
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnUpdateMasterDataRecord (): Boolean;
var
	dqMasterData: TMQuery;
	fNewRecord  : Boolean;

	sSectionCode: String;
	stMessageRec	: TMJSMsgRec;	//HIS0027

    // --------------------------------------------------------------------------------
    //
    //  前ゼロ付加用メソッド HIS0029
    //
    // --------------------------------------------------------------------------------
    function XLeftAddCh(const Src: string; const Len: Integer; const Ch: Char) : string;
    var
        nLen: Integer;
        I: Byte;
    begin

        Result := '';
        nLen   := Len - MjsHanLength(Src);
        if nLen > 255 then nLen := 255;

        if nLen > 0 then
        begin
            for I := 0 to nLen - 1 do
                Result := Result + Ch
        end;
        Result := Result + Src;

    end;

begin
	dqMasterData	:= TMQuery.Create (Self);

// <SYNC> MOD start
//	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続
											// ｸﾞﾙｰﾌﾟ管理採用 & 子会社選択時
	if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
	begin
		m_cDataModule.SetDBInfoToQuery (m_SyncMaster.m_cPDBSelect, dqMasterData);		// 親会社DBとMQueryの接続
	end
	else
	begin
		m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);						// 自会社(子会社)DBとMQueryの接続
	end;
// <SYNC> MOD end

	with (dqMasterData) do																// ﾚｺｰﾄﾞ存在ﾁｪｯｸ
	begin
		Close ();

		SQL.Clear ();
        SQL.Add	  ('SELECT MasterKbn, SectionNCode FROM TekiMA ');	// HIS0029
        SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = :nSumDivision AND GCode = :nExCode AND RDelKbn = 0'); // HIS0029

		ParamByName ('nSumDivision').AsInteger	:= m_stMasterData.nSumDivision;
		ParamByName ('nExCode'     ).AsInteger	:= m_stMasterData.nExCode;

		if	(not Open ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			Close;
			Free;

			Result	:= false;
			Exit;
		end;

		if (not EOF) then
		begin
            m_InsFlg        := False;    // HIS0032
			fNewRecord		:= false;
            sSectionCode	:= GetFld('SectionNCode').AsString;  // HIS0029
		end
		else
		begin
            m_InsFlg        := True;
			fNewRecord		:= true;
			sSectionCode	:= '';
		end;

		Close ();

	//<DKAI> ADD start
	m_stMasterData.strAssociation	:= fnDelCRLF(m_stMasterData.strAssociation);
	m_stMasterData.strName			:= fnDelCRLF(m_stMasterData.strName);
	//<DKAI> ADD end

	m_fUpdateRecord	:= true;

	if	(fNewRecord) then																// 新規ﾚｺｰﾄﾞ (INSERT)
	begin
			Close ();

			SQL.Clear ();
            SQL.Add('INSERT INTO TekiMA ');											    // HIS0029
			SQL.Add('(MasterKbn,        ');												// ﾏｽﾀｰ区分
			SQL.Add(' SumKbn,           ');                                             // 摘要/分類区分
            SQL.Add(' ZANKBN,           ');
			SQL.Add(' RDelKbn,        ');                                               // ﾚｺｰﾄﾞ区分
            SQL.Add(' GCode,            ');                                             // 外部ｺｰﾄﾞ
            SQL.Add(' Renso,          ');                                               // 連想ｼﾝﾎﾞﾙ HIS0029
            SQL.Add(' TekiChar          ');                                             // 摘要文字列 // HIS0029

			if	(m_stMasterData.fDetails) then											// 詳細更新区分: true=あり
			begin
				SQL.Add(',              ');
				SQL.Add('ExgKbn,        ');         									// 取引先区分
				SQL.Add('BunCode        ');                                            	// 取引先分類
			end;
			SQL.add(',SwDicKbn       ');                                           	    // 仕訳辞書摘要区分
			SQL.add(',BusDicKbn       ');												// 部署伝票用仕訳辞書摘要区分

			//部署の時	2002/01/07
			if m_DataKbn = 3 then
			begin
				SQL.Add(',              ');
                SQL.Add('SectionNCode    '); // HIS0029
			end;

			SQL.add(',UpdTantoNCode     ');	// HIS0076

			SQL.Add(')                  ');
			SQL.Add('Values             ');
			SQL.Add('( 61,              ');
			SQL.Add(' :SumKbn,          ');
			SQL.Add('  0,               ');
			SQL.Add('  0,               ');
			SQL.Add(' :GCode,           ');
			SQL.Add(' :RenChar,         ');
            SQL.Add(' :TekiChar,          ');    // HIS0029

			if	(m_stMasterData.fDetails) then											// 詳細更新区分: true=あり
            begin
				SQL.Add(' :ExgKbn,      ');
				SQL.Add(' :BunCode,     ');
            end;
    		SQL.Add(' :SwDicKbn,     ');
			SQL.add(' :BusDicKbn       ');												// 部署伝票用仕訳辞書摘要区分

			//部署の時	HIS0027
			if m_DataKbn = 3 then
			begin
				SQL.Add(',              ');
				SQL.Add(' :SectionCode  ');
			end;
			SQL.add(',:UpdTantoNCode     ');	// HIS0076

			SQL.Add(')                  ');
			ParamByName('SumKbn').AsInteger			:= m_stMasterData.nSumDivision; 	// 摘要/分類区分
            ParamByName('GCode').AsString			:= XLeftAddCh(IntToStr(m_stMasterData.nExCode),16,'0');   // 外部ｺｰﾄﾞ HIS0029
			ParamByName('RenChar').AsString			:= m_stMasterData.strAssociation;  	// 連想ｼﾝﾎﾞﾙ
			ParamByName('TekiChar').AsString		:= m_stMasterData.strName;       	// 摘要文字列

			if	(m_stMasterData.fDetails) then											// 詳細更新区分: true=あり
			begin
				ParamByName('ExgKbn').AsInteger		:= m_stMasterData.nDealDivision; 	// 取引先区分
				ParamByName('BunCode').AsInteger	:= m_stMasterData.nDealClass;       // 取引先分類
    			ParamByName('SwDickbn').AsInteger	:= m_stMasterData.nSDicDivision;    // 仕訳辞書摘要区分
			end;
			ParamByName('SwDickbn').AsInteger	:= 0;    // 仕訳辞書摘要区分
// <HIS0052> MOD start
//			if	(MCheckBox1.Checked) and
// <HIS0002> MOD start
													// 貸借科目に入力あり or 貸借科目が置換
//			if (((cEdtK1DNum.Value <> 0) and (cEdtK1CNum.Value <> 0)) or
//            	(cCmbK1DCmb.ItemIndex = KMKKBN_OKIKAE) and (cCmbK1CCmb.ItemIndex = KMKKBN_OKIKAE)) and

													// 貸借科目両方が入力あり or 置換
			if (((cEdtK1DNum.Value <> 0) or (cCmbK1DCmb.ItemIndex = KMKKBN_OKIKAE)) and
				((cEdtK1CNum.Value <> 0) or (cCmbK1CCmb.ItemIndex = KMKKBN_OKIKAE))) and
// <HIS0002> MOD end
            	(IsBusyoDenpyo()) and
// <HIS0052> MOD end
				(m_stMasterData.nSumDivision=0)	 	// 摘要/分類区分 実在
//<HIS0088> MOD St
//			then	ParamByName('BusDicKbn').AsInteger		:= 1						// 部署伝票用仕訳辞書摘要区分
            then
            begin
                if (chk_Busyo.Checked) then
                    ParamByName('BusDicKbn').AsInteger		:= 1						// 部署伝票用仕訳辞書摘要区分
                else
                    ParamByName('BusDicKbn').AsInteger		:= 0;						// 部署伝票用仕訳辞書摘要区分

            end
//<HIS0088> MOD Ed
			else	ParamByName('BusDicKbn').AsInteger		:= 0;						// 部署伝票用仕訳辞書摘要区分


			//部署の時	HIS0027
            if m_DataKbn = 3 then
				ParamByName('SectionCode').AsString	:=	m_cComArea.SetCodeAttr(IntToStr(m_ComCode), 10, false, '0');
    		ParamByName ('UpdTantoNCode').AsFloat	 := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0076
			if	(not ExecSQL ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

				Close;
				Free;

				Result  := false;
				Exit;
			end;

		fnUpdateTreeViewItems (m_stMasterData.nSumDivision,
											m_stMasterData.nExCode, m_stMasterData.strName, ACCESS_TREE_ADD);
	end
	else																				// 既存ﾚｺｰﾄﾞ (UPDATE)
	begin
		//部署の時	HIS0027
		if m_DataKbn = 3 then
		begin
			if sSectionCode = '' then
			begin
				m_cComArea.m_MsgStd.GetMsg( stMessageRec, 30,18);
				stMessageRec.sMsg	:= '経理側で入力した摘要の為、部署側では修正できません。';

				MjsMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle,
								 stMessageRec.icontype, mjOk, stMessageRec.btndef, false);

				Close;
				Free;

				Result  := false;

				Exit;
			end;
		end;

	if	m_bLog	then	MLabel27.caption:=MLabel27.caption+'-u';


			Close ();

			SQL.Clear ();
            SQL.Add('UPDATE TekiMA SET        ');							// HIS0029
            SQL.Add('Renso    = :RenChar,     '); 								// 連想ｼﾝﾎﾞﾙ    // HIS0029
			SQL.Add('TekiChar = :TekiChar     ');                               // 摘要文字列

			if	(m_stMasterData.fDetails) then									// 詳細更新区分: true=あり
			begin
				SQL.Add(',                    ');
				SQL.Add('ExgKbn = :ExgKbn,    ');                  				// 取引先区分
				SQL.Add('BunCode = :BunCode,  ');                               // 取引先分類
				SQL.Add('SwDicKbn = :SwDicKbn ');                               // 仕訳辞書摘要区分
			end;

			if	(m_stMasterData.nSumDivision=0)	then 	// 摘要/分類区分

//<HIS0084> ADD start  詳細画面からの更新時の場合のみBusDicKbnを更新
            //if  DtlCmnClientPanel.Visible then
            if  m_stMasterData.fDetails then
//<HIS0084> ADD end
			    SQL.Add(',BusDicKbn = :BusDicKbn ');									// 部署伝票用仕訳辞書摘要区分

			SQL.Add(',UpdTantoNCode = :UpdTantoNCode '); // HIS0076

			SQL.Add('WHERE                    ');
			SQL.Add('	 Masterkbn = 61       ');       						// ﾏｽﾀ区分
			SQL.Add('and SumKbn = :SumKbn     ');                               // 摘要/分類区分
			SQL.Add('and GCode = :GCode       ');                               // 外部ｺｰﾄﾞ
            SQL.Add('and RDelKbn = 0          ');   // HIS0029

			ParamByName('RenChar').AsString			:= m_stMasterData.strAssociation;
			ParamByName('TekiChar').AsString		:= m_stMasterData.strName;

       		if	(m_stMasterData.fDetails) then									// 詳細更新区分: true=あり
			begin
				ParamByName('ExgKbn').AsInteger		:= m_stMasterData.nDealDivision;
				ParamByName('BunCode').AsInteger	:= m_stMasterData.nDealClass;
				ParamByName('SwDicKbn').AsInteger	:= m_stMasterData.nSDicDivision;
			end;

			if	(m_stMasterData.nSumDivision=0)	then 	// 摘要/分類区分
			begin

// <HIS0052> MOD start
//			if	MCheckBox1.Checked
// <HIS0002> MOD start
(*											// 貸借科目に入力あり or 貸借科目が置換
			if	(IsBusyoDenpyo()) and
            	(((cEdtK1DNum.Value <> 0) and (cEdtK1CNum.Value <> 0)) or
                ((cCmbK1DCmb.ItemIndex = KMKKBN_OKIKAE) and (cCmbK1CCmb.ItemIndex = KMKKBN_OKIKAE)))
*)
// <HIS0084> ADD start  詳細画面からの更新時の場合のみBusDicKbnを更新
              if m_stMasterData.fDetails then
              begin
// <HIS0084> ADD end

                // 貸借科目両方が入力あり or 置換
                if	(IsBusyoDenpyo()) and
                    (((cEdtK1DNum.Value <> 0) or (cCmbK1DCmb.ItemIndex = KMKKBN_OKIKAE)) and
                    ((cEdtK1CNum.Value <> 0) or (cCmbK1CCmb.ItemIndex = KMKKBN_OKIKAE)))
// <HIS0002> MOD end
// <HIS0052> MOD end
                then
//<HIS0088> MOD St
//                  ParamByName('BusDicKbn').AsInteger		:= 1						// 部署伝票用仕訳辞書摘要区分
                begin
                    if (chk_Busyo.Checked) then
                        ParamByName('BusDicKbn').AsInteger		:= 1						// 部署伝票用仕訳辞書摘要区分
                    else
                        ParamByName('BusDicKbn').AsInteger		:= 0;						// 部署伝票用仕訳辞書摘要区分
                end
//<HIS0088> MOD Ed
                else
                  ParamByName('BusDicKbn').AsInteger		:= 0;						// 部署伝票用仕訳辞書摘要区分

// <HIS0084> ADD start
              end;
// <HIS0084> ADD end
            end;

			ParamByName('SumKbn').AsInteger			:= m_stMasterData.nSumDivision;
			ParamByName('GCode').AsInteger			:= m_stMasterData.nExCode;
    		ParamByName ('UpdTantoNCode').AsFloat	 := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0076

			if	(not ExecSQL ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

				Close;
				Free;

				Result  := false;
				Exit;
			end;

		fnUpdateTreeViewItems (m_stMasterData.nSumDivision,
											m_stMasterData.nExCode, m_stMasterData.strName, ACCESS_TREE_UPDATE);
	end;

	Close;
	Free;

	end;

	Result	:= true;																	// 正常終了
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnUpdateMasterDataTagInfo (Integer; var Integer)									*/
//*																											*/
//*	目的	: 摘要登録処理 ﾏｽﾀ付箋管理情報更新																*/
//*																											*/
//*	戻り値	: Boolean, (true:正常, false:異常)																*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode	= 摘要ｺｰﾄﾞ																			*/
//*           nTagKind  = 付箋種類 (0:なし, 1:赤, 2:緑, 3:青, 4:橙)											*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnUpdateMasterDataTagInfo (nExCode: Integer; var nTagKind: Integer): Boolean;
var
	dqMasterData: TMQuery;

begin
	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();

        SQL.Add ('SELECT FusenKbn FROM MFusenInfo    '); // HIS0029
        SQL.Add ('WHERE  MasterKbn = 61                 '); // HIS0029
        SQL.Add ('  AND  NCode     = :nExCode           '); // HIS0029
        SQL.Add ('  AND  SubNCode   = 0                  '); // HIS0029

        ParamByName ('nExCode').AsFloat := fnGetNCode(TBL_TEKI,0,nExCode);

		Open ();

		if	(not EOF) then
		begin
			if	((nTagKind = 0) or (FieldByName ('FusenKbn').AsInteger = nTagKind)) then
			begin
				nTagKind	:= 0;

				Close ();

				SQL.Clear ();

                SQL.Add   ('DELETE FROM MFusenInfo ');                                                   // HIS0029
				SQL.Add   ('WHERE  MasterKbn = 61 AND NCode = :nExCode AND SubNCode = 0 '); // HIS0029
			end
			else
			begin
				Close ();

				SQL.Clear ();
                SQL.Add ('UPDATE MFusenInfo SET      '); // HIS0029
                SQL.Add ('  FusenKbn = :nTagDivision    '); // HIS0029
                SQL.Add ('WHERE  MasterKbn = 61         '); // HIS0029
                SQL.Add ('  AND  NCode     = :nExCode   '); // HIS0029
                SQL.Add ('  AND  SubNCode   = 0          '); // HIS0029

				ParamByName ('nTagDivision').AsInteger	:= nTagKind;

			end;

            ParamByName ('nExCode').AsFloat := fnGetNCode(TBL_TEKI,0,nExCode);

			if	(not ExecSQL ()) then
			begin
				m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
				m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

				fnOutputDBErrorMessage ();

				m_cDataModule.Rollback (m_cDBSelect);									// ﾛｰﾙﾊﾞｯｸ(破棄)
				dqMasterData .Close	   ();
				dqMasterData .Free     ();

				Result	:= false;
				Exit;
			end;

			m_cDataModule.Commit (m_cDBSelect);											// ｺﾐｯﾄ(反映)

			dqMasterData.Close ();
			dqMasterData.Free  ();

			Result	:= true;
			Exit;
		end;

		Close ();
	end;

	with (dqMasterData) do
	begin
		Close ();

//		SQL.Clear ();;
		SQL.Clear ();						// <HIS0052> MOD
        SQL.Add ('INSERT INTO MFusenInfo (MasterKbn, NCode, SubNCode,FusenKbn) ');    // HIS0029
        SQL.Add ('VALUES (61, :nExCode, 0, :nTagDivision)');                                   // HIS0029

        ParamByName ('nExCode').AsFloat := fnGetNCode(TBL_TEKI,0,nExCode);
		ParamByName ('nTagDivision').AsInteger	:= nTagKind;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);
			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)
			dqMasterData .Close    ();
			dqMasterData .Free	   ();

			Result	:= false;
			Exit;
		end;
	end;

	m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)
	dqMasterData .Close  ();
	dqMasterData .Free   ();

	Result	:= true;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnGetMasterDataTagInfo (Integer)													*/
//*																											*/
//*	目的	: 摘要登録処理 ﾏｽﾀ付箋管理情報取得																*/
//*																											*/
//*	戻り値	: Integer, (付箋№)																				*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode = 摘要ｺｰﾄﾞ   			   																*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnGetMasterDataTagInfo (nExCode: Integer): Integer;
var
	dqMasterData: TMQuery;
	nTagDivision: Integer;

begin
	dqMasterData    := TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	nTagDivision	:= 0;

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
        SQL.Add ('SELECT FusenKbn FROM MFusenInfo    '); // HIS0029
        SQL.Add ('WHERE  MasterKbn = 61                 '); // HIS0029
        SQL.Add ('  AND  NCode     = :nExCode           '); // HIS0029
        SQL.Add ('  AND  SubNCode   = 0                  '); // HIS0029

        ParamByName ('nExCode').AsFloat := fnGetNCode(TBL_TEKI,0,nExCode);

		Open ();

		if	(not EOF) then
			nTagDivision	:= FieldByName ('FusenKbn').AsInteger;
    end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	Result	:= nTagDivision;
end;




//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnRebuildMasterTreeRecords (Integer)												*/
//*																											*/
//*	目的	: 摘要登録処理 固定摘要分類体系ﾏｽﾀ再作成 (科目連想)												*/
//*																											*/
//*	戻り値	: Boolean, (true:正常終了, false:異常終了)														*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode	= 固定摘要ｺｰﾄﾞ																		*/
//*																											*/
//***********************************************************************************************************/
function	TJNTCRP020000f.fnRebuildMasterTreeRecords (nExCode: Integer): Boolean;
var
	dqMasterData : TMQuery;
	nCtrlDivision: Integer;

    exSumNCode   : Extended;
    exBasedNCode : Extended;

begin

	m_cDataModule.BeginTran (m_cDBSelect);												// ﾄﾗﾝｻﾞｸｼｮﾝの開始
	dqMasterData	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続
	nCtrlDivision	:= 0;

	with (dqMasterData) do
	begin
(*H0006 20031225 khattori syuusei 摘要残管理有無の更新は、詳細画面で摘要残管理有無を変更した時だけにする*)
//		Close ();
//
//		SQL.Clear ();
//		SQL.Add   ('SELECT SumCode FROM TekiTree ');
//		SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = 2 AND BasedCode = :nBasedCode');
//
//		ParamByName ('nBasedCode').AsInteger	:= nExCode;
//
//		Open ();
//
//		while (not EOF) do
//		begin
//			if	(not fnSetControlDivision (FieldByName ('SumCode').AsInteger, nExCode, 0)) then
//			begin
//				m_cDataModule.Rollback (m_cDBSelect);									// ﾛｰﾙﾊﾞｯｸ(破棄)
//				dqMasterData .Close	   ();
//				dqMasterData .Free	   ();
//
//				Result	:= false;
//				Exit;
//			end;
//
//			NEXT;
//		end;

		Close ();
		SQL.Clear ();
        SQL.Add   ('DELETE FROM TekiTree '); // HIS0029
        SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = 2 AND BasedNCode = :nBasedCode');   // HIS0029

        exBasedNCode := fnGetNCode(TBL_TEKI,0,nExCode);
		ParamByName ('nBasedCode').AsFloat	:= exBasedNCode;

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDBSelect);										// ﾛｰﾙﾊﾞｯｸ(破棄)
			dqMasterData .Close	   ();
			dqMasterData .Free	   ();

			Result	:= false;
			Exit;
		end;

		if	(not DtlCmnMemData.IsEmpty ()) then
		begin
			DtlCmnMemData.First ();

			while (not DtlCmnMemData.Eof) do
			begin
				Close ();

				SQL.Clear ();
                SQL.Add   ('SELECT SumNCode FROM TekiTree '); // HIS0029
				SQL.Add   ('WHERE  MasterKbn = 61 AND TekiKbn = 2 AND ');
                SQL.Add   ('       SumNCode = :nSumCode AND BasedNCode = :nBasedCode');  // HIS0029


                //HIS0032 内部ｺｰﾄﾞ取得
                exSumNCode   := fnGetNCode(TBL_KAMOK,0,DtlCmnMemData.FieldValues ['nExCode']);
                exBasedNCode := fnGetNCode(TBL_TEKI,0,nExCode);

				ParamByName ('nSumCode'  ).AsFloat	:= exSumNCode;
				ParamByName ('nBasedCode').AsFloat	:= exBasedNCode;

				Open ();

				if	(not EOF) then
				begin
					DtlCmnMemData.Next ();
					Continue;
				end;

				Close ();

				SQL.Clear ();

                SQL.Add   ('INSERT INTO TekiTree ');    // HIS0029
                SQL.Add   ('(MasterKbn, TekiKbn, SumNCode, BasedNCode, UpdTantoNCode) VALUES (61, 2, :nSumCode, :nBasedCode, :UpdTantoNCode)'); // HIS0029


				ParamByName ('nSumCode'  ).AsFloat	:= exSumNCode;
				ParamByName ('nBasedCode').AsFloat	:= exBasedNCode;
        		ParamByName ('UpdTantoNCode').AsFloat	 := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0076


				if	(not ExecSQL ()) then
				begin
					m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

					m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

					fnOutputDBErrorMessage ();

					m_cDataModule.Rollback (m_cDBSelect);								// ﾛｰﾙﾊﾞｯｸ(破棄)
					dqMasterData .Close	   ();
					dqMasterData .Free	   ();

					Result	:= false;
					Exit;
				end;

				if	((nCtrlDivision = 0) and (DtlCmnMemData.FieldValues ['nCtrlDivision'] = 1)) then
					nCtrlDivision	:= 1;

				if	(not fnSetControlDivision (DtlCmnMemData.FieldValues ['nExCode'],
											nExCode, DtlCmnMemData.FieldValues ['nCtrlDivision'])) then
				begin
					m_cDataModule.Rollback (m_cDBSelect);								// ﾛｰﾙﾊﾞｯｸ(破棄)
					dqMasterData .Close	   ();
					dqMasterData .Free	   ();

					Result	:= false;
					Exit;
				end;

				DtlCmnMemData.Next ();
			end;
		end;


(*H0001 20030808 khattori syuusei 残高管理区分が科目連想登録されている科目のみで更新されている*)
		Close ();
		SQL.Clear ();
		SQL.Add   ('SELECT count(*) as count FROM "MJSDBMASTER"."SumSM" ');
		SQL.Add   ('WHERE  NMonth = 0 AND MasterKbn = 0 AND ');
		SQL.Add   ('       HojyoKbn = 61 AND SumKbn = 1 AND TekiNCode = :nExCode');

		ParamByName ('nExCode').AsFloat	:= fnGetNCode(TBL_TEKI,0,nExCode,0);

		Open ();

//		nCtrlDivision:=0;
		if	((not EOF) and (FieldByName ('count').AsInteger > 0)) then	nCtrlDivision:=1;
(*H0001 20030808 khattori syuusei 残高管理区分が科目連想登録されている科目のみで更新されている*)


		Close ();

// <SYNC> ADD start
											// ｸﾞﾙｰﾌﾟ管理採用 & 子会社選択時
		if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
		begin
        	if nCtrlDivision <> 1 then		// 子から親会社の残区分をｸﾘｱすることはない
            begin                           // ｺﾐｯﾄ(反映)
				m_cDataModule.Commit (m_cDBSelect);
				Free();
				Result := true;				// 正常終了
            	Exit;
            end;
            								// 親会社DBのﾄﾗﾝｻﾞｸｼｮﾝ開始
			ExecParentDBTran(GRP_PARENTDB_BEGINTRAN);
            								// 親会社DBとMQueryの接続
			m_cDataModule.SetDBInfoToQuery(m_SyncMaster.m_cPDBSelect, dqMasterData);
		end;
// <SYNC> ADD end

		SQL.Clear ();

        SQL.Add   ('UPDATE "MJSDBMASTER"."TekiMA" SET ZanKbn = :nCtrlDivision ');    // HIS0029
        SQL.Add   (',UpdTantoNCode = :nUpdTantoNCode '); // HIS0076
        SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = 0 AND GCode = :nExCode AND RDelKbn = 0');  // HIS0029

		ParamByName ('nCtrlDivision').AsInteger	:= nCtrlDivision;						// 摘要残高管理区分
		ParamByName ('nExCode'      ).AsInteger	:= nExCode;
  		ParamByName ('nUpdTantoNCode').AsFloat   := rcCOMMONAREA(m_pRec^.m_pCommonArea^).TantoNCD; // HIS0076

		if	(not ExecSQL ()) then
		begin
			m_cComArea.m_MsgStd.GetMsgDB (m_cErrorMsgRec, dqMasterData);

			m_nDBErrorCode	:= m_cComArea.m_MsgStd.GetDBCode (dqMasterData);

			fnOutputDBErrorMessage ();

			m_cDataModule.Rollback (m_cDbSelect);
											// <SYNC> ADD 親会社DBもﾛｰﾙﾊﾞｯｸ
			ExecParentDBTran(GRP_PARENTDB_ROLLBACK);
			dqMasterData .Close    ();
			dqMasterData .Free     ();

			Result	:= false;
			Exit;
		end;
	end;

	ExecParentDBTran(GRP_PARENTDB_COMMIT);  // <SYNC> ADD 親会社DBもｺﾐｯﾄ
	m_cDataModule.Commit (m_cDBSelect);													// ｺﾐｯﾄ(反映)
	dqMasterData .Close  ();
	dqMasterData .Free	 ();

	Result	:= true;																	// 正常終了
end;


////////////////////////////////////////////////////////////////////////////////
//	fnUpdateTekiyouBunrui
//		分類に、部署伝票辞書が１つでも含まれていたらフラグをたてる
////////////////////////////////////////////////////////////////////////////////
procedure TJNTCRP020000f.fnUpdateTekiyouBunrui(Sender: TObject);
var
	qUpdate: TMQuery;
//<HIS0078 start>
//	bRetn:boolean;
//<HIS0078 end>
begin
// <SYNC> ADD start
											// ｸﾞﾙｰﾌﾟ管理採用 & 子会社選択時
	if (m_SyncMaster.m_flgGrpCorp = GRP_SYNC_CHILD) then
	begin
		Exit;								// BusDicKbnの更新はしない
    end;
// <SYNC> ADD end
	qUpdate	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, qUpdate	);		// DBとMQueryの接続

	with (qUpdate) do
	begin
		Close ();

		SQL.Clear ();

// <SYNC> MOD start 内部ｺｰﾄﾞ対応が不完全
(*        SQL.Add   ('update tekima set BusDicKbn=1 where sumkbn=1 and RDelKbn =0 and gcode in(');                    // HIS0029
        SQL.Add   ('SELECT sumncode FROM TekiTree tt inner join TekiMA tm on tt.BasedNCode=tm.GCode');             // HIS0029
        SQL.Add   ('where tt.tekikbn=1 and tt.sumncode>0 and tm.BusDicKbn=1 group by tt.sumncode);');// HIS0029
        SQL.Add   ('update tekima set BusDicKbn=0 where sumkbn=1 and RDelKbn=0 and gcode not in(');                // HIS0029
        SQL.Add   ('SELECT sumncode FROM TekiTree tt inner join TekiMA tm on tt.BasedNCode=tm.GCode');            // HIS0029
        SQL.Add   ('where tt.tekikbn=1 and tt.sumncode>0 and tm.BusDicKbn=1 group by tt.sumncode);');// HIS0029
*)
        SQL.Add   ('update TekiMA set BusDicKbn=1 where sumkbn=1 and RDelKbn =0 and NCode in(');
        SQL.Add   ('SELECT SumNCode FROM TekiTree tt inner join TekiMA tm on tt.BasedNCode=tm.NCode');
        SQL.Add   ('where tt.tekikbn=1 and tt.sumncode>0 and tm.BusDicKbn=1 group by SumNCode);');
        SQL.Add   ('update TekiMA set BusDicKbn=0 where sumkbn=1 and RDelKbn=0 and NCode not in(');
        SQL.Add   ('SELECT SumNCode FROM TekiTree tt inner join TekiMA tm on tt.BasedNCode=tm.NCode');
        SQL.Add   ('where tt.tekikbn=1 and tt.sumncode>0 and tm.BusDicKbn=1 group by SumNCode);');
// <SYNC> ADD end
//<HIS0078 satrt>
//		bRetn:=ExecSQL;
		ExecSQL;
//<HIS0078 end>
		Close;
		Free;
	end;
end;

////////////////////////////////////////////////////////////////////////////////
//	GetTaxKbn
////////////////////////////////////////////////////////////////////////////////
function TJNTCRP020000f.GetTaxKbn(iDKmkCode,iCKmkCode: Integer):Integer;
var
	iDTaxKbn		:	Integer;
	iCTaxKbn		:	Integer;
	dqKmkMaster		:	TMQuery;
begin
	if	cCmbK1DCmb.ItemIndex=1	then	iDKmkCode:=0;
	if	cCmbK1CCmb.ItemIndex=1	then	iCKmkCode:=0;

	iDTaxKbn	:=	-1;
	iCTaxKbn	:=	-1;

	dqKmkMaster	:= TMQuery.Create (Self);

	//	DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqKmkMaster);

	with	dqKmkMaster	do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT GCode,TaxKbn FROM KmkMA');
		SQL.Add   ('WHERE MasterKbn = 1 AND SumKbn = 0 AND RDelKbn = 0 AND ((GCode = :nDCode) or (GCode = :nCCode))');
		ParamByName ('nDCode').AsInteger	:=	iDKmkCode;
		ParamByName ('nCCode').AsInteger	:=	iCKmkCode;

		Open ();

		while	not	EOF	do
		begin
			if	iDKmkCode=FieldByName ('GCode').AsInteger	then	iDTaxKbn	:=	FieldByName ('TaxKbn').AsInteger;
			if	iCKmkCode=FieldByName ('GCode').AsInteger	then	iCTaxKbn	:=	FieldByName ('TaxKbn').AsInteger;
			next;
		end;

		Close ();
		Free ();
	end;

	if	iDKmkCode=0	then	iDTaxKbn	:=	0;
	if	iCKmkCode=0	then	iCTaxKbn	:=	0;

	if	(iDTaxKbn=-1) or	(iCTaxKbn=-1)		then
	begin
		result:=-1;
		exit;
	end;

	if		(iDTaxKbn=0)					then	m_iTaxKbn	:=	iCTaxKbn
	else if	(iDTaxKbn=1) and (iCTaxKbn<>2)	then	m_iTaxKbn	:=	1
	else if	(iDTaxKbn=2) and (iCTaxKbn<>1)	then	m_iTaxKbn	:=	2
	else											m_iTaxKbn	:=	3;

	result:=0;
end;

////////////////////////////////////////////////////////////////////////////////
//	GetHukugouCode
////////////////////////////////////////////////////////////////////////////////
procedure TJNTCRP020000f.GetHukugouCode;
var
	dqKmkMaster		:	TMQuery;
begin
	m_iSpe010301	:=	-1;
	m_iSpe010302	:=	-1;

	dqKmkMaster	:= TMQuery.Create (Self);

	//	DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqKmkMaster);

	with	dqKmkMaster	do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add('SELECT SpeCode,NCode FROM KmkInfo WHERE SpeCode > 010300 AND SpeCode < 010303');

		Open ();

		while	not	EOF	do
		begin
			case GetFld('SpeCode').AsInteger of
				010301:	m_iSpe010301	:=	GetFld('NCode').AsInteger;	// 複合科目
				010302:	m_iSpe010302	:=	GetFld('NCode').AsInteger;	// 資金複合科目
			end;
			Next;
		end;

		Close;
		Free;
	end;
end;

////////////////////////////////////////////////////////////////////////////////
//	fnGetNCode
////////////////////////////////////////////////////////////////////////////////
function TJNTCRP020000f.fnGetNCode(TblKbn,iSumKbn,iGCode:Integer;Def:Extended=-1):Extended;
var
    Qe      : TMQuery;
    StrTbl  : String;
begin

    Result := Def;

    Case TblKbn of
        1:  StrTbl := 'TekiMA'   ;
        2:  StrTbl := 'KmkMA'   ;
    end;

	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

   	with  Qe do
    begin
	    Close ();
   		SQL.Clear ();
    	SQL.Add('SELECT NCode from ' + StrTbl);
        SQL.Add(' Where GCode   = :pGCode   ');
        SQL.Add(' and   RDelKbn = 0         ');

        if TblKbn = 2 then
        begin
            SQL.Add(' and SumKbn = 0    ');
            SQL.Add(' and MasterKbn = 1 ');

            ParamByName('pGCode').AsInteger := iGCode;  // HIS0001追加
        end
        else
        begin
            SQL.Add(' and   MasterKbn = 61 ');
            SQL.Add(' and   SumKbn = :pSumKbn ');
            ParamByName('pSumKbn').AsInteger := iSumKbn;
                                                        // HIS0001追加
            ParamByName('pGCode').AsString := Format('%.16d', [iGCode]);
        end;

//        ParamByName('pGCode').AsInteger := iGCode;    // HIS0001削除


        Open;

        if not Eof then
            Result := FieldByName('NCode').AsFloat
        else
        begin
            //親無しの場合
            if (TblKbn = 1) and (iGCode = 0) then
                Result := 0;
        end;
  	end;

    Qe.Close;
    Qe.Free;

end;

////////////////////////////////////////////////////////////////////////////////
//	fnGetHojNCode
////////////////////////////////////////////////////////////////////////////////
function TJNTCRP020000f.fnGetHojNCode(iMstKbn:Integer;sGCode:String):Extended;
var
    Qe      : TMQuery;
    StrTbl  : String;
begin

    Result := 0;

    Case iMstKbn of
        MASTER_CUSTOMER:     StrTbl := 'MTokui'    ;
        else    StrTbl := 'HojyoMA'   ;
    end;


	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

   	with  Qe do
    begin
	    Close ();
   		SQL.Clear ();
// <HIS0052> MOD start
(*    	SQL.Add('SELECT NCode from ' + StrTbl    );
        SQL.Add(' Where GCode = :pGCode   ');
        SQL.Add(' and RDelKbn = 0 and SumKbn =0  ');


        if iMstKbn <>MASTER_CUSTOMER then
            SQL.Add(' and   MasterKbn = :pMstKbn  ');


        ParamByName('pGCode' ).AsString  := sGCode;

        if iMstKbn <>MASTER_CUSTOMER then
            ParamByName('pMstKbn').AsInteger := iMstKbn;
*)
		if iMstKbn = MKBN_SYAIN then  		// 社員
        begin
	        SQL.Add	  ('select MOS.NCode, MOS.SimpleName ' +
                    'from HAPSC HAP left outer join MOS_OFFICE_STAFF MOS ' +
                    'on HAP.NCode = MOS.NCode ' +
                    'where MOS.RDelKbn = 0 ' +
                    'and HAP.GCode = :strExCode ');
//<HIS0106> DEL                    'and (HAP.TEndDate >= :parStartDate and HAP.TStartDate <= :parEndDate) ');
	    	ParamByName ('strExCode'      ).AsString	:= sGCode;
//<HIS0106> DEL St
{
            								// 適用期間
			ParamByName ('parStartDate'	  ).AsDateTime := m_dateKStDate;
			ParamByName ('parEndDate'	  ).AsDateTime := m_dateKEdDate;
}
//<HIS0106> DEL Ed
        end
        else                    			// 社員以外
        begin
    		SQL.Add('SELECT NCode from ' + StrTbl    );
    	    SQL.Add(' Where GCode = :pGCode   ');
	        SQL.Add(' and RDelKbn = 0 and SumKbn =0  ');

    	    if iMstKbn <>MASTER_CUSTOMER then
	            SQL.Add(' and   MasterKbn = :pMstKbn  ');

	        SQL.Add(' Order by TStartDate DESC  ');  //<HIS0089> ADD

    	    ParamByName('pGCode' ).AsString  := sGCode;

	        if iMstKbn <>MASTER_CUSTOMER then
	            ParamByName('pMstKbn').AsInteger := iMstKbn;
        end;
// <HIS0052> MOD end
        Open;

        if not Eof then
            Result := FieldByName('NCode').AsFloat;

  	end;

    Qe.Close;
    Qe.Free;

end;

////////////////////////////////////////////////////////////////////////////////
//	fnGetHojGCode
////////////////////////////////////////////////////////////////////////////////
function TJNTCRP020000f.fnGetHojGCode(TblKbn:Integer; pNCode:Extended):String;
var
    Qe      : TMQuery;
    StrTbl  : String;
begin

    Result := '';

    Case TblKbn of
        1:  StrTbl := 'HojyoMA';
        2:  StrTbl := 'MTOKUI' ;
    end;

	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

   	with  Qe do
    begin
	    Close ();
   		SQL.Clear ();
    	SQL.Add('SELECT GCode from ' + StrTbl);
        SQL.Add(' Where NCode = :pNCode   ');

        ParamByName('pNCode' ).AsFloat  := pNCode;
        Open;

        if not Eof then
            Result := FieldByName('GCode').AsString;

  	end;

    Qe.Close;
    Qe.Free;

end;
////////////////////////////////////////////////////////////////////////////////
//	fnGetKmkSubNCode
////////////////////////////////////////////////////////////////////////////////
function TJNTCRP020000f.fnGetKmkSubNCode(iGCode:Integer; sSubCode:String):Extended;
var
    Qe      : TMQuery;
begin

    Result := 0;

	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

   	with  Qe do
    begin
	    Close ();
   		SQL.Clear ();
// <HIS0052> MOD start
//    	SQL.Add('SELECT NCode from KmkMA    ');
    	SQL.Add('SELECT CNCode from KmkMA    ');
// <HIS0052> MOD end
        SQL.Add(' Where GCode   = :pGCode   ');
        SQL.Add(' and   SubCode = :pSubCode ');
        SQL.Add(' and   SumKbn  = 0         ');
        SQL.Add(' and   RDelKbn = 0         ');

        ParamByName('pGCode'    ).AsInteger  := iGCode;
        ParamByName('pSubCode'  ).AsString   := sSubCode;

        Open;

        if not Eof then
// <HIS0052> MOD start
//            Result := FieldByName('NCode').AsFloat
            Result := FieldByName('CNCode').AsFloat
// <HIS0052> MOD end

  	end;

    Qe.Close;
    Qe.Free;

end;

////////////////////////////////////////////////////////////////////////////////
//	fnGetKmkGCodeInt
////////////////////////////////////////////////////////////////////////////////
function TJNTCRP020000f.fnGetKmkGCodeInt(pNCode:Extended):Integer;
var
    Qe      : TMQuery;
//    StrTbl  : String;						// <HIS0052> DEL
begin

    Result := 0;

	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

   	with  Qe do
    begin
	    Close ();
   		SQL.Clear ();
    	SQL.Add('SELECT GCode,SubCode from KmkMA  ');
        SQL.Add(' Where NCode = :pNCode   ');

        ParamByName('pNCode' ).AsFloat  := pNCode;
        Open;

        if not Eof then
            Result := FieldByName('GCode').AsInteger;
  	end;

    Qe.Close;
    Qe.Free;

end;
////////////////////////////////////////////////////////////////////////////////
//	fnGetKmkGCodeStr
////////////////////////////////////////////////////////////////////////////////
// <HIS0052> MOD start
//function TJNTCRP020000f.fnGetKmkGCodeStr(pNCode:Extended):String;
function TJNTCRP020000f.fnGetKmkGCodeStr(pNCode: Extended; pSubNCode:Extended):String;
// <HIS0052> MOD end
var
    Qe      : TMQuery;
//    StrTbl  : String;						// <HIS0052> DEL
begin

    Result := '';

	Qe	:= TMQuery.Create (Self);
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, Qe);

   	with  Qe do
    begin
	    Close ();
   		SQL.Clear ();
    	SQL.Add('SELECT GCode,SubCode from KmkMA  ');
        SQL.Add(' Where NCode = :pNCode ');
        SQL.Add('AND CNCode = :pCNCode ');				// <HIS0052> ADD
        SQL.Add('AND MasterKbn = 2 ');					// <HIS0003> ADD

        ParamByName('pNCode' ).AsFloat  := pNCode;
        ParamByName('pCNCode' ).AsFloat  := pSubNCode;	// <HIS0052> ADD
        Open;

        if not Eof then
            Result := FieldByName('SubCode').AsString;
  	end;

    Qe.Close;
    Qe.Free;

end;

