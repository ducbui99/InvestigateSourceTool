//******************************************************************************
//*                             修正履歴
//******************************************************************************
//* 2006/01/13  HIS0001 K.Katou(PRIME)  ﾃﾞｰﾀ読込み時に消費税関係が正しく表示されない不具合修正
//*	2006/02/15	HIS0002	K.Katou(PRIME)	工種を登録すると更新後に消える不具合修正
//* 2006/12/11	HIS0052 K.Katou(PRIME)	仕訳辞書登録対応
//* 2010/04/23  HIS0086 Y.Yoshizawa(MJS)プロジェクト採用が(2任意)の場合に仕訳情報補助グリッドに登録できない件の対応
//================================== ver4.01 ===================================
//* 2010/07/22  HIS0089 T.Ogawa(RIT)    仕訳情報グリッドに選択した同一コード部門が反映されない不具合対応
//================================== ver4.02 ===================================
//* 2010/10/04	HIS0090 Y.Kuroda		仕訳辞書摘要登録ﾘｽﾄの印刷ﾌﾟﾚﾋﾞｭｰで科目別補助の名称が表示されない不具合対応
//================================== ver4.06 ===================================
//* 2011/05/17  HIS0094 S.Otahara(MSI)	科目の採用が共通部門または共通セグメントの場合、部門またはセグメントの登録ができない不具合を修正
//*				HIS0095 S.Otahara(MSI)	GetCommonSectionメソッドの使い方の間違いを修正
//*				HIS0096 S.Otahara(MSI)	貸借科目の採用の判断は「nClassCode」ではなく「nUseKbn」でするように修正。「nClassCode」は科目の属性(B/S or P/L)を持つように修正。
//================================== ver4.11/5.04 ===================================
//*				HIS0101 M.Makino(MJS)	H26消費税改正対応
//******************************************************************************

////////////////////////////////////////////////////////////////////////////////
//	辞書詳細情報の位置、キャプションの設定を行う（１回のみ）
////////////////////////////////////////////////////////////////////////////////
procedure TJNTCRP020000f.MComboBoxInit(Sender: TObject);
// <HIS0052> ADD start
begin
	ChangeSwDic(DC_KARIKATA); 				// 仕訳辞書ｸﾞﾘｯﾄﾞ読み直し 借方
	ChangeSwDic(DC_KASIKATA); 				// 仕訳辞書ｸﾞﾘｯﾄﾞ読み直し 貸方
// <HIS0052> ADD end

// <HIS0052> DEL start
(*

var
	iTopSabun	:	Integer;
	iCurTop		:	Integer;
	nCount		:	Integer;

	procedure fnSetVisTop(index	:	Integer;	cLbl	: TMLabel	);
	begin
		with	m_cEdtSet[index]	do
		begin
			Cmb.visible	:=	cLbl.visible;	Cmb.Top		:=	cLbl.Top-1;
			Num.visible	:=	cLbl.visible;	Num.Top		:=	cLbl.Top-1;
			Fre.visible	:=	cLbl.visible;	Fre.Top		:=	cLbl.Top-1;
			Dsc.visible	:=	cLbl.visible;	Dsc.Top		:=	cLbl.Top;
		end;
		with	m_cEdtSet[index+8]	do
		begin
			Cmb.visible	:=	cLbl.visible;	Cmb.Top		:=	cLbl.Top-1;
			Num.visible	:=	cLbl.visible;	Num.Top		:=	cLbl.Top-1;
			Fre.visible	:=	cLbl.visible;	Fre.Top		:=	cLbl.Top-1;
			Dsc.visible	:=	cLbl.visible;	Dsc.Top		:=	cLbl.Top;
		end;
	end;
begin
	for	nCount := 0 to 15 do
	begin
		m_cEdtSet[nCount].Cmb.ItemIndex	:=	0;
	end;

	cLblBUTtle.caption	:=	m_stAdoptInfo[10].strDescription;	//	部門
	cLblSGTtle.caption	:=	m_stAdoptInfo[11].strDescription;	//	ｾｸﾞﾒﾝﾄ①
	cLblH1Ttle.caption	:=	'第１補助';
	cLblH2Ttle.caption	:=	'第２補助';
	cLblKOTtle.caption	:=	m_stAdoptInfo[15].strDescription;	//	工事
	cLblKSTtle.caption	:=	m_stAdoptInfo[16].strDescription;	//	工種　(**)
// <HIS0052> DEL start
(*
	//	採用有りの項目の項目名のVisibleを切り替える
	cLblBUTtle.visible	:=	m_stAdoptInfo[10].nAdoption<>0;		//	部門
	cLblSGTtle.visible	:=	m_stAdoptInfo[11].nAdoption<>0;		//	ｾｸﾞﾒﾝﾄ①
	cLblKOTtle.visible	:=	m_stAdoptInfo[15].nAdoption<>0;		//	工事
	cLblKSTtle.visible	:=	m_stAdoptInfo[16].nAdoption<>0;		//	工種　(**)
// <HIS0052> DEL start
(*

	//	科目と科目別補助のTop位置の差
	iTopSabun	:=	cLblK2Ttle.Top-cLblK1Ttle.Top;
	iCurTop		:=	cLblK2Ttle.Top+iTopSabun;

	//	部門
	if	cLblBUTtle.visible	then	iCurTop	:=	iCurTop+iTopSabun;

	//	ｾｸﾞﾒﾝﾄ①
	cLblSGTtle.Top	:=	iCurTop;
	if	cLblSGTtle.visible	then	iCurTop	:=	iCurTop+iTopSabun;

	cLblH1Ttle.Top	:=	iCurTop;	iCurTop	:=	iCurTop+iTopSabun;
	cLblH2Ttle.Top	:=	iCurTop;	iCurTop	:=	iCurTop+iTopSabun;
	cLblKOTtle.Top	:=	iCurTop;	iCurTop	:=	iCurTop+iTopSabun;
	cLblKSTtle.Top	:=	iCurTop;

	if	not	cLblKOTtle.visible	then	cLblKOTtle.Top	:=	-100;
	if	not	cLblKSTtle.visible	then	cLblKSTtle.Top	:=	-100;

	fnSetVisTop(TYPE_EDIT_BU,cLblBUTtle);	//	部門
	fnSetVisTop(TYPE_EDIT_SG,cLblSGTtle);	//	ｾｸﾞﾒﾝﾄ①
	fnSetVisTop(TYPE_EDIT_H1,cLblH1Ttle);	//	第１補助
	fnSetVisTop(TYPE_EDIT_H2,cLblH2Ttle);	//	第２補助
	fnSetVisTop(TYPE_EDIT_KO,cLblKOTtle);	//	工事
	fnSetVisTop(TYPE_EDIT_KS,cLblKSTtle);	//	工種
*)
// <HIS0052> DEL end
end;

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnResetDetailScreenAddition ()													*/
//*																											*/
//*	目的	: 辞書詳細情報の初期化を行う（未入力状態にする）												*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//***********************************************************************************************************/
procedure   TJNTCRP020000f.fnResetDetailScreenAddition ();
// <HIS0052> DEL
(*
var
	nCount	: Integer;
	nPos	: Integer;
*)
begin
// <HIS0052> DEL start
(*
	for	nCount := 0 to 15 do
{<HIS0032>
	begin
		if	((nCount = 1) or (nCount = 9)) then
			m_stCurDtlCodeAttr [nCount].strCaption	:= '補助'
        else
			m_stCurDtlCodeAttr [nCount].strCaption	:= '';

		m_stCurDtlCodeAttr [nCount].nDigit		:= 6;
		m_stCurDtlCodeAttr [nCount].nAttribute	:= 0;
		m_stCurDtlCodeAttr [nCount].nClassCode	:= 0;
		m_stCurDtlCodeAttr [nCount].fEnabled	:= false;

		m_cEdtSet[nCount].Cmb.Enabled	:= false;
		m_cEdtSet[nCount].Num.Value		:= 0;
		m_cEdtSet[nCount].Num.Clear;
		if	m_cEdtSet[nCount].Fre<>nil	then
		m_cEdtSet[nCount].Fre.Text		:= '';
		m_cEdtSet[nCount].Dsc.Caption	:= '';

		if	(nCount mod 8)>0 then
		fnSetDtlEditExCodeCondition(m_cEdtSet[nCount].typ,nCount div 8,nCount);
	end;
}

	begin
		if	((nCount = 1) or (nCount = 9)) then
        begin
			m_stCurDtlCodeAttr [nCount].strCaption	:= '補助';
            m_stCurDtlCodeAttr [nCount].nDigit		:= m_stAdoptInfo [3].nCodeDigit;
       		m_stCurDtlCodeAttr [nCount].nAttribute	:= m_stAdoptInfo [3].nCodeAttribute;;
       		m_stCurDtlCodeAttr [nCount].nClassCode	:= 0;
       		m_stCurDtlCodeAttr [nCount].fEnabled	:= false;
        end
        else
        begin
       		m_stCurDtlCodeAttr [nCount].strCaption	:= '';
            m_stCurDtlCodeAttr [nCount].nDigit		:= 6;
       		m_stCurDtlCodeAttr [nCount].nAttribute	:= 0;
       		m_stCurDtlCodeAttr [nCount].nClassCode	:= 0;
       		m_stCurDtlCodeAttr [nCount].fEnabled	:= false;

       		m_cEdtSet[nCount].Cmb.Enabled	:= false;
       		m_cEdtSet[nCount].Num.Value		:= 0;
       		m_cEdtSet[nCount].Num.Clear;
        end;

		if	m_cEdtSet[nCount].Fre<>nil	then
		m_cEdtSet[nCount].Fre.Text		:= '';
		m_cEdtSet[nCount].Dsc.Caption	:= '';

		if	(nCount mod 8)>0 then
		fnSetDtlEditExCodeCondition(m_cEdtSet[nCount].typ,nCount div 8,nCount);
	end;

	MCheckBox1.Checked	:=	false;
*)
// <HIS0052> DEL end

// <HIS0052> ADD start

    cCmbK1DCmb.ItemIndex := 0;				// 区分ｺﾝﾎﾞを初期化
    cCmbK1CCmb.ItemIndex := 0;

	// 科目・ｸﾞﾘｯﾄﾞを初期化
    cEdtK1DNum.Value := 0;   				// 科目Editｸﾘｱ
// <HIS0052> MOD
//    cEdtK1DNum.Enabled := True;
    if m_nReferMode = REFER then			// 表示のみ？
    begin
		cEdtK1DNum.ReadOnly := True;
        cEdtK1DNum.Static := True;
    end
    else
    begin
		cEdtK1DNum.ReadOnly := False;
        cEdtK1DNum.Static := False;
        cEdtK1DNum.Enabled := True;
    end;
// <HIS0052> MOD
    cEdtK1DNum.Color := clWindow;
	cEdtK1DNum.Clear;

    cEdtK1CNum.Value := 0;
// <HIS0052> MOD start
//    cEdtK1CNum.Enabled := True;
    if m_nReferMode = REFER then 			// 表示のみ？
    begin
		cEdtK1CNum.ReadOnly := True;
        cEdtK1CNum.Static := True;
    end
    else
    begin
		cEdtK1CNum.ReadOnly := False;
        cEdtK1CNum.Static := False;
        cEdtK1CNum.Enabled := True;
    end;
// <HIS0052> MOD end
    cEdtK1CNum.Color := clWindow;
	cEdtK1CNum.Clear;

    cLblK1DDsc.Caption := '';				// ﾗﾍﾞﾙもｸﾘｱ
    cLblK1CDsc.Caption := '';

    DtlDSwkMem.Active := False;				// 補助ﾏｽﾀｸﾞﾘｯﾄﾞをｶﾗにする
    DtlDSwkMem.Active := True;
    DtlCSwkMem.Active := False;
    DtlCSwkMem.Active := True;

    DtlDSwkGrid.Enabled := False;			// さらに無効にする
    DtlCSwkGrid.Enabled := False;
// <HIS0052> ADD end

	//	会計処理区分: 0=免税
	if	(m_nTaxAccDivision <> 0) then
	begin
		ClearTaxEdit(1,3);
		DtlCmnLbelTaxDivisionDesc	.Caption	:= 'なし';
	end
	else
	begin
		ClearTaxEdit(1,1);
	end;

// <HIS0052> MOD start
//	ClearTaxEdit(2,2);
	ClearTaxEdit(2,1);
// <HIS0052> MOD end
	ClearTaxEdit(3,1);
	ClearTaxEdit(4,1);

	DtlCmnMemData.Close ();
	DtlCmnMemData.Open  ();
end;


////////////////////////////////////////////////////////////////////////////////
//	ChangeCompColor
////////////////////////////////////////////////////////////////////////////////
procedure TJNTCRP020000f.ChangeCompColor(Sender: TObject);
begin
	if	TControl(Sender).Enabled
	then	TEDit(Sender).Color	:= clWindow
	else
	begin
		TEDit(Sender).Clear;
		if	Sender.ClassName='TMNumEdit'	then
		begin
			TMNumEdit(Sender).Clear;
			TMNumEdit(Sender).Value:=0;
			TMNumEdit(Sender).InputFlag	:= true;
			TMNumEdit(Sender).Color	:= TJNTCRP020000f (Self).Color;
			TMNumEdit(Sender).Refresh;
		end
		else
		begin
			TMTxtEdit(Sender).Clear;
			TMTxtEdit(Sender).Color	:= TJNTCRP020000f (Self).Color;
			TMTxtEdit(Sender).Refresh;
		end;
	end;
end;


//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetDtlEditExCodeCondition (Integer; Integer; String; Integer; Integer; Boolean)	*/
//*																											*/
//*	目的	: 摘要登録処理																					*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nEditType			=																			*/
//*			  nDivision			= 借方/貸方区分 (0:借方, 1:貸方)											*/
//*			  strCaption		= ｷｬﾌﾟｼｮﾝ																	*/
//*			  nCodeDigit		= ｺｰﾄﾞ桁数 (3～10桁)														*/
//*			  nCodeAttribute	= ｺｰﾄﾞ属性 (0:数字, 1:数字(前0あり), 2:ﾌﾘｰ)									*/
//*																											*/
//***********************************************************************************************************/
(*	// <HIS0052> DEL start
procedure	TJNTCRP020000f.fnSetDtlEditExCodeCondition	(nEditType: Integer; nDivision: Integer; nPos: Integer);
var
	cECmb	: TMComboBox;
	cENum	: TMNumEdit;
	cEFre	: TMTxtEdit;
	cLDsc	: TMLabel;
	sFrmt	: String;

begin
	cECmb	:= nil;
	cENum	:= nil;
	cEFre	:= nil;
	cLDsc	:= nil;

	// 借方/貸方区分: 0=借方
	if	(nDivision = 0) then
	begin
		case (nEditType) of
			TYPE_EDIT_K2:begin	cLDsc:=cLblK2DDsc;cECmb:=cCmbK2DCmb;cEFre:=cEdtK2DNum;						end;
			TYPE_EDIT_BU:begin	cLDsc:=cLblBUDDsc;cECmb:=cCmbBUDCmb;cENum:=cEdtBUDNum;cEFre:=cEdtBUDFre;	end;
			TYPE_EDIT_SG:begin	cLDsc:=cLblSGDDsc;cECmb:=cCmbSGDCmb;cENum:=cEdtSGDNum;cEFre:=cEdtSGDFre;	end;
			TYPE_EDIT_H1:begin	cLDsc:=cLblH1DDsc;cECmb:=cCmbH1DCmb;cENum:=cEdtH1DNum;cEFre:=cEdtH1DFre;	end;
			TYPE_EDIT_H2:begin	cLDsc:=cLblH2DDsc;cECmb:=cCmbH2DCmb;cENum:=cEdtH2DNum;cEFre:=cEdtH2DFre;	end;
			TYPE_EDIT_KO:begin	cLDsc:=cLblKODDsc;cECmb:=cCmbKODCmb;cENum:=cEdtKODNum;cEFre:=cEdtKODFre;	end;
			TYPE_EDIT_KS:begin	cLDsc:=cLblKSDDsc;cECmb:=cCmbKSDCmb;cENum:=cEdtKSDNum;cEFre:=cEdtKSDFre;	end;
		end;
	end
	// 借方/貸方区分: 1=貸方
	else
	begin
		case (nEditType) of
			TYPE_EDIT_K2:begin	cLDsc:=cLblK2CDsc;cECmb:=cCmbK2CCmb;cEFre:=cEdtK2CNum;						end;
			TYPE_EDIT_BU:begin	cLDsc:=cLblBUCDsc;cECmb:=cCmbBUCCmb;cENum:=cEdtBUCNum;cEFre:=cEdtBUCFre;	end;
			TYPE_EDIT_SG:begin	cLDsc:=cLblSGCDsc;cECmb:=cCmbSGCCmb;cENum:=cEdtSGCNum;cEFre:=cEdtSGCFre;	end;
			TYPE_EDIT_H1:begin	cLDsc:=cLblH1CDsc;cECmb:=cCmbH1CCmb;cENum:=cEdtH1CNum;cEFre:=cEdtH1CFre;	end;
			TYPE_EDIT_H2:begin	cLDsc:=cLblH2CDsc;cECmb:=cCmbH2CCmb;cENum:=cEdtH2CNum;cEFre:=cEdtH2CFre;	end;
			TYPE_EDIT_KO:begin	cLDsc:=cLblKOCDsc;cECmb:=cCmbKOCCmb;cENum:=cEdtKOCNum;cEFre:=cEdtKOCFre;	end;
			TYPE_EDIT_KS:begin	cLDsc:=cLblKSCDsc;cECmb:=cCmbKSCCmb;cENum:=cEdtKSCNum;cEFre:=cEdtKSCFre;	end;
		end;
	end;

	with	m_stCurDtlCodeAttr[nPos]	do
	begin

		//	ｺｰﾄﾞ属性: 数字
		if	(nAttribute <= 1) then
		begin
            if nEditType <> TYPE_EDIT_K2 then
            begin
    			cENum.Visible	:= true;
	    		cENum.BringToFront;

		    	if	(cEFre <> nil) then
			    begin
				    cEFre.Visible	:= false;
    				cEFre.Enabled	:= false;
	    			cEFre.SendToBack;
		    	end;

			    //HIS0025
    			if	fEnabled	then
	    		begin
		    		cENum.DMaxLength		:= nDigit;

			    	// ｺｰﾄﾞ属性: 0=数字 1=数字(前ｾﾞﾛあり)
				    if	(nAttribute = 1) then	sFrmt	:= StringOfChar ('0', nDigit)	else	sFrmt	:= '';

    				cENum.FormatStr	:=	sFrmt;
	    			cENum.Digits	:=	nDigit;
		    		cENum.MaxValue	:=	StrToInt64 (StringOfChar ('9', nDigit));

//FX0001        	if	(m_nReferMode <> REFER) then
                    cENum.Enabled	:=  fEnabled;
				    cENum.Value		:=	Trunc(cENum.Value);
    			end
	    		else
		    	begin
			    	cENum.Enabled	:=	fEnabled;
    			end;

		    	if	cECmb.ItemIndex>0	then	cENum.Enabled	:=	false;

			    ChangeCompColor(cENum);

    			if	(cENum.Value=0) and (cENum.InputFlag)	then	cLDsc.Caption	:= '';
    		end;
        end
    	//	ｺｰﾄﾞ属性: ﾌﾘｰ
		else
		begin
            if cENum <> nil then        // ???
            begin
    			cENum.Visible	:=	false;
	    		cENum.Enabled	:=	false;
		    	cENum.SendToBack;
            end;

			cEFre.Visible	:=	true;
			cEFre.BringToFront;
			cEFre.MaxLength	:=	nDigit;

			if	(fEnabled) then
			begin
//FX0001    	if	(m_nReferMode <> REFER) then
                cEFre.Enabled	:= fEnabled;
				cEFre.Text	:=	cEFre.Text;
			end
			else
			begin
				cEFre.Enabled	:=	fEnabled;
			end;

			if	cECmb.ItemIndex>0	then	cEFre.Enabled	:=	false;

			ChangeCompColor(cEFre);

			if	cEFre.Text=''	then	cLDsc.Caption	:= '';
		end;

		if	MCheckBox1.Checked	then	cECmb.Enabled	:= fEnabled	else	cECmb.Enabled	:= false;
//		cLDsc.Caption	:= '';
		cLDsc.Enabled	:= fEnabled;
	end;
end;
*) // <HIS0052> DEL end

//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetDetailScreenAddition (Integer; Integer)										*/
//*																											*/
//*	目的	: 摘要登録処理 詳細情報を詳細画面にｾｯﾄ															*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode  	= 固定摘要ｺｰﾄﾞ																		*/
//*			  nAddition	= 仕訳辞書摘要区分	(0:通常摘要, 1:仕訳辞書摘要)									*/
//*																											*/
//***********************************************************************************************************/
// <HIS0052> MOD start 関数まるごと修正
procedure	TJNTCRP020000f.fnSetDetailScreenAddition (nExCode: Integer; nAddition: Integer);
var
	dqMasterData	:	TMQuery;
	cComboBox		:	TMComboBox;
	cEditNumeric	:	TMNumEdit;
	cLabel			:	TMLabel;
	nCount			:	Integer;
	nWork			:	Integer;
	strPrefix		:	String;
	sFName			:	String;
	sFVlue			:	String;
   	strDesc			:	String;
    iIndex			:	Integer;			// 配列index
    iDCkbn			:	Integer;			// 借方 or 貸方
	iKmkCode		:	Integer;			// 科目外部ｺｰﾄﾞ
	strGCode		: 	String;				// 外部ｺｰﾄﾞ
	exComNCode		:	Extended;			// 内部ｺｰﾄﾞ				//<HIS0094>Add
	iMasIndex		:	Integer;			// ﾏｽﾀ基本情報のindex	//<HIS0094>Add
	strName			:	String;				// 名称
    strSQL			:	String;
    exKmkNCode		:	Extended;			// 科目内部ｺｰﾄﾞ
    objGrid			:	TdxDBGrid;
    objMem			: 	TdxMemData;
	evtBeforePost	:	TDataSetNotifyEvent;

	procedure SetField(cEdtNum: TMNumEdit; cEdtTxt: TMTxtEdit; cLbl: TMLabel; sName: String; index: Integer);
	var
		bNull			:	Boolean;
	begin
		bNull:=false;

        if m_stCurDtlCodeAttr [index].nMasterDivision = MASTER_CUSTOMER then
    		sFVlue	:=	fnGetHojGCode(2,dqMasterData.FieldByName (strPrefix + sName).AsFloat)
        else
    		sFVlue	:=	fnGetHojGCode(1,dqMasterData.FieldByName (strPrefix + sName).AsFloat);

		if	((not m_stCurDtlCodeAttr [index].fEnabled) or
			 (sFVlue = ''))
		then	bNull:=true;

		fnSetField(cEdtNum,cEdtTxt,cLbl,sFVlue,'',bNull,index);
	end;
begin
	if	(m_pRec^.m_pChildForm = nil) then	Exit;

	dqMasterData	:= TMQuery.Create (Self);

	//	DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin
		Close ();

		//	仕訳辞書摘要区分: 0=通常摘要
		if	(nAddition = 0)	and	(not IsBusyoDenpyo()) then
		begin
			fnResetDetailScreenAddition ();

			m_iKmkGCodeDeb:=Trunc(cEdtK1DNum.Value);
			m_iKmkGCodeCre:=Trunc(cEdtK1CNum.Value);
			m_iDtlCEdtExCd:=Trunc(DtlCEdtExCd.Value);

			Exit;
		end;

		strSQL := 'SELECT * ' +
                'FROM   SwDicTeki ' +
                'WHERE MasterKbn = 61 AND NCode = :nExCode';

		SQL.Add(strSQL);
											// 固定摘要内部ｺｰﾄﾞ
		ParamByName ('nExCode').AsFloat	:= fnGetNCode(TBL_TEKI, 0,nExCode);

		Open ();

		if	(not EOF) then
		begin
											// 借方科目区分
			cCmbK1DCmb.ItemIndex	:=	FieldByName('DKmkKbn').AsInteger;
											// 貸方科目区分
			cCmbK1CCmb.ItemIndex	:=	FieldByName('CKmkKbn').AsInteger;
                                            // 区分のﾘｽﾄを作っておく
            RemakeSwkTypeList(MKBN_SAIMOKU);

			for	nCount := 0 to 1 do
			begin
				if	(nCount = 0) then													// 借方
				begin
					strPrefix		:=	'D';
					cEditNumeric	:=	cEdtK1DNum;
					cLabel			:=	cLblK1DDsc;
					cComboBox		:=	cCmbK1DCmb;
				end
				else																	// 貸方
				begin
					strPrefix		:=	'C';
					cEditNumeric	:=	cEdtK1CNum;
					cLabel			:=	cLblK1CDsc;
					cComboBox		:=	cCmbK1CCmb;
				end;

				if	cComboBox.ItemIndex = 0 then
				begin
					// 借方
					if	(nCount = 0) then
					begin
						cEdtK1DNum.Enabled	:= true;
					end
					else
					begin
						cEdtK1CNum.Enabled	:= true;
					end;
					MComboBoxChange(cComboBox);
				end;

				if	cComboBox.ItemIndex > 0 then
				begin

					// 仕訳辞書ｸﾞﾘｯﾄﾞをｸﾘｱ
					if nCount = 0 then		// 借方
                    begin
                    	DtlDSwkMem.Active := False;
                        DtlDSwkMem.Active := True;
                    end
                    else					// 貸方
                    begin
                    	DtlCSwkMem.Active := False;
                        DtlCSwkMem.Active := True;
                    end;

					MComboBoxChange(cComboBox);

					// 借方
					if	(nCount = 0) then
						m_iKmkGCodeDeb := Trunc(cEdtK1DNum.Value)
					else
						m_iKmkGCodeCre := Trunc(cEdtK1CNum.Value);

					continue;
				end;

				sFName	:=	strPrefix + 'KmkNCode';
											// 内部ｺｰﾄﾞから外部ｺｰﾄﾞ取得
				iKmkCode := fnGetKmkGCodeInt(FieldByName (sFName).AsFloat);
											// 科目が採用するﾏｽﾀを有効にする
				fnSetDtlEditExCodeAttribute (iKmkCode, nCount);
                ChangeSwDic(nCount);		// MemDataに補助の行をAppend

											// 簡略名称取得
				fnCheckExCodeKmkMA (MASTER_SUBJECT, nCount,	iKmkCode, '', strDesc);
											// 画面に表示
				cEditNumeric.Value	:= iKmkCode;
				cLabel.Caption	:= strDesc;


				if	(nCount = 0) then		// 借方
				begin
                	objGrid := DtlDSwkGrid;
					objMem := DtlDSwkMem;
					iDCKbn := DC_KARIKATA;
                    exKmkNCode := GetKmkNCode(m_iKmkGCodeDeb);
				end
				else						// 貸方
				begin
                	objGrid := DtlCSwkGrid;
					objMem := DtlCSwkMem;
					iDCKbn := DC_KASIKATA;
                    exKmkNCode := GetKmkNCode(m_iKmkGCodeCre);
				end;

                objGrid.BeginUpdate;
                evtBeforePost := objMem.BeforePost;
                objMem.BeforePost := nil;
                objMem.First;
				while not objMem.Eof do		// MemDataにｺｰﾄﾞ・名称を設定
                begin
					strGCode := '';
					strName := '';
                	objMem.Edit;
                						// ﾏｽﾀ区分に従った仕訳辞書の区分を取得
					objMem.FieldByName('nCtrlDivision').AsInteger :=
                       			GetDicKbn(objMem.FieldByName('iMasterKbn').AsInteger, iDCKbn, dqMasterData);
                    objMem.FieldByName('strDivisionDesc').AsString :=
                    			GetKbnName(objMem.FieldByName('iMasterKbn').AsInteger, objMem.FieldByName('nCtrlDivision').AsInteger);
                                		// 基準以外はｺｰﾄﾞ・名称ｸﾘｱ
					if objMem.FieldByName('nCtrlDivision').AsInteger <> KBN_KIJUN then
 	 				begin
	                    objMem.Post;
    	                objMem.Next;
                        Continue;
                    end;
										// 内部ｺｰﾄﾞを取得
					objMem.FieldByName('exNCode').AsFloat :=
								GetDicNCode(objMem.FieldByName('iMasterKbn').AsInteger, iDCKbn, dqMasterData);
										// 配列のindex取得
					iIndex := GetAryIndex(objMem.FieldByName('iMasterKbn').AsInteger, iDCKbn);
										// 外部ｺｰﾄﾞと名称
					case objMem.FieldByName('iMasterKbn').AsInteger of
						MKBN_SAIMOKU:		// 科目別補助
						begin
										// 科目別補助の外部ｺｰﾄﾞ取得
							strGCode := fnGetKmkGCodeStr(exKmkNCode, objMem.FieldByName('exNCode').AsFloat);

							if	(not FieldByName (sFName).IsNull) then
							begin
								fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS, nCount,	iKmkCode, strGCode, strName);
							end
							else
							begin
								strName := '';
							end;
						end;
						MKBN_TORIHIKI:		// 取引先
						begin
											// 外部ｺｰﾄﾞ取得
				    		strGCode := fnGetHojGCode(2, objMem.FieldByName('exNCode').AsFloat);
							fnCheckExCodeHojyoMA(iIndex, strGCode, strName);
						end;
											// 工種・ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞ1～10
						MKBN_PROSUB1, MKBN_PROSUB2, MKBN_PROSUB3, MKBN_PROSUB4, MKBN_PROSUB5,
                        MKBN_PROSUB6, MKBN_PROSUB7, MKBN_PROSUB8, MKBN_PROSUB9, MKBN_PROSUB10:
						begin
// <HIS0052> MOD start
(*
							m_stCurDtlCodeAttr[iIndex].fEnabled :=
								(fnGetMasterInfoData (objMem.FieldByName('iMasterKbn').AsInteger, iIndex) <> 0)
									and (fnGetKousyu(0) = 1);
*)
							m_stCurDtlCodeAttr[iIndex].fEnabled :=
								(fnGetMasterInfoData (objMem.FieldByName('iMasterKbn').AsInteger, iIndex) <> 0);
// <HIS0052> MOD end
// <HIS0002> ADD start
											// 外部ｺｰﾄﾞ取得
				    		strGCode := fnGetHojGCode(1, objMem.FieldByName('exNCode').AsFloat);
							fnCheckExCodeHojyoMA(iIndex, strGCode, strName);
// <HIS0002> ADD end
						end;
						MKBN_BUMON, MKBN_SEG1..MKBN_SEG10:
						begin
											// 共通部門の場合
//<HIS0096>↓↓科目の採用情報はnUseKbnを参照
//							if m_stCurDtlCodeAttr[iIndex].nClassCode = 1 then
							if m_stCurDtlCodeAttr[iIndex].nUseKbn = 2 then
//<HIS0096>↑↑
							begin
//<HIS0094>↓↓引数増加(また、第2引数に配列のIndexを使用していた不具合<HIS0095>も合わせて修正)
											// 共通部門
//								GetCommonSection(iDCKbn, iIndex, strGCode, strName);
								iMasIndex := GetMasterIndex(objMem.FieldByName('iMasterKbn').AsInteger);	//<HIS0095>Add
								GetCommonSection(iDCKbn, iMasIndex, strGCode, exComNCode, strName);
//<HIS0094>↑↑
							end
							else			// それ以外
							begin
											// 外部ｺｰﾄﾞ取得
					    		strGCode := fnGetHojGCode(1, objMem.FieldByName('exNCode').AsFloat);
//<HIS0089> DEL								fnCheckExCodeHojyoMA(iIndex, strGCode, strName);
								fnCheckExCodeHojyoMA(iIndex, strGCode, strName, objMem.FieldByName('exNCode').AsFloat);  //<HIS0089> ADD
							end;
						end;
// <HIS0068> ADD start
						MKBN_SYAIN:    		// 社員
                        begin
                        					// 外部ｺｰﾄﾞと名称取得
// <HIS0090> MOD start
//     	            	GetSwkDicName(MKBN_SYAIN, objMem.FieldByName('exNCode').AsFloat,
//                            			 strGCode, strName);
     	            	GetSwkDicName(MKBN_SYAIN, 0, objMem.FieldByName('exNCode').AsFloat,
                            			 strGCode, strName);
// <HIS0090> MOD end
                        end;
// <HIS0068> ADD end
						else
						begin
											// 外部ｺｰﾄﾞ取得
				    		strGCode := fnGetHojGCode(1, objMem.FieldByName('exNCode').AsFloat);
							fnCheckExCodeHojyoMA(iIndex, strGCode, strName);
						end;
					end;
										// 表示用外部ｺｰﾄﾞ
					objMem.FieldByName('strGCode').AsString := SetDspCodeAttr(strGCode,
                    						m_stCurDtlCodeAttr[iIndex].nDigit,
                                            m_stCurDtlCodeAttr[iIndex].nAttribute);
										// 簡略名称
					objMem.FieldByName('strSubjectDesc').AsString := strName;
                    objMem.FieldByName('strGCode_Save').AsString := objMem.FieldByName('strGCode').AsString;  //<HIS0089> ADD
                    objMem.Post;
                    objMem.Next;
				end;
                objMem.First;
                objMem.BeforePost := evtBeforePost;
                objGrid.EndUpdate;
                                            // ﾚｺｰﾄﾞがあったら
            	if objMem.RecordCount > 0 then
        	    begin                       // 補助ｸﾞﾘｯﾄﾞ入力可
	    	        objGrid.Enabled := True;
	            end
            	else
    	        begin
        	    	objGrid.Enabled := False;
	            end;
			end;

			m_iDtlCEdtExCd := Trunc(DtlCEdtExCd.Value);

			// 会計処理区分: 0=免税業者
			if	(m_nTaxAccDivision <> 0) then
			begin
				if	IsBusyoDenpyo()	then
				begin
					ClearTaxEdit(1,1);
										// 消費税区分取得
					GetTaxKbn(FieldByName('DKmkNCode').AsInteger, FieldByName('CKmkNCode').AsInteger);
				end
				else
				begin
					ClearTaxEdit(1,3);
//ここ
					m_iTaxKbn := FieldByName('STaxKbn').AsInteger;
					DtlCmnEditTaxDivision.Value := m_iTaxKbn;
					fnCheckTaxDivision (m_iTaxKbn, strDesc);
					DtlCmnLbelTaxDivisionDesc.Caption := strDesc;
					fnDtlCmnEditTaxDivisionOnChange (DtlCmnEditTaxDivision);
				end;

				if	(m_iTaxKbn = 0) then
				begin
// <HIS0052> MOD start
//					ClearTaxEdit(2,2);
					ClearTaxEdit(2,1);
// <HIS0052> MOD end
					ClearTaxEdit(3,1);
					ClearTaxEdit(4,1);
				end
				else
				begin
					fnSetDtlEditTaxCodeSelectItems (m_iTaxKbn);

					ClearTaxEdit(2,3);

					DtlCmnEditTaxCode.Value		:=	FieldByName ('STaxCode').AsInteger;
					DtlCmnEditTaxCode.InputFlag	:=	false;
//OutputDebugString(PCHAR('通った:' + IntToStr(trunc(DtlCmnEditTaxCode.Value))));
					fnCheckTaxCode (m_iTaxKbn,FieldByName ('STaxCode').AsInteger, strDesc);

					DtlCmnLbelTaxCodeDesc.Caption := strDesc;

					if	(Trunc (DtlCmnEditTaxCode.Value) <> 0) then
					begin
// <HIS0052> MOD start
//						if	m_cTaxItems.iRate =1 then
						if	IsBusyoDenpyo() then
// <HIS0052> MOD end
						begin
							nWork	:= FieldByName ('STaxRate').AsInteger;

							ClearTaxEdit(3,3);

							DtlCmnEditTaxRate.Value		:= nWork;
							DtlCmnEditTaxRate.InputFlag	:= false;

//<HIS0101> MOD st
//							if	((nWork >= 0) and (nWork <= 2)) then
//								DtlCmnLbelTaxRateDesc.Caption	:= Copy (DtlCmnEditTaxRate.SelectItems.Strings [nWork], 4, 14)
							if	(m_TaxRateInfo.IsExistRateCD(nWork) = True) then
								DtlCmnLbelTaxRateDesc.Caption	:= m_TaxRateInfo.GetTaxNameByRateCD(nWork)
//<HIS0101> MOD ed
							else
								DtlCmnLbelTaxRateDesc.Caption	:= '';
						end
						else
						begin
							ClearTaxEdit(3,1);
						end;

// <HIS0052> MOD start
//						if	m_cTaxItems.iType = 1 then
                                       // 売上科目がある場合
//<HIS0105> DEL				       	if IsUriageKmk(Trunc(cEdtK1DNum.Value), Trunc(cEdtK1CNum.Value)) then
// <HIS0052> MOD end
//<HIS0105> ADD St
                        if ((m_cTaxItems.iType = 1) and
                            (IsUriageKmk(Trunc(cEdtK1DNum.Value), Trunc(cEdtK1CNum.Value)))) then
//<HIS0105> ADD Ed
						begin
							nWork	:= FieldByName ('TypeCode').AsInteger;

							ClearTaxEdit(4,3);

							DtlCmnEditTypeCode.Value		:= nWork;
							DtlCmnEditTypeCode.InputFlag	:= false;

//<HIS0105> DEL							if	((nWork >= 0) and (nWork <= 5)) then
							if	((nWork >= m_cTypeCode.MinCode) and (nWork <= m_cTypeCode.MaxCode)) then  //<HIS0105> ADD
								DtlCmnLbelTypeCodeDesc.Caption	:= MjsHanCopy (DtlCmnEditTypeCode.SelectItems.Strings [nWork], 4, 14)
							else
								DtlCmnLbeltypeCodeDesc.Caption	:= '';
						end
						else
						begin
							ClearTaxEdit(4,1);
						end;
					end
					else
					begin
						ClearTaxEdit(3,1);
						ClearTaxEdit(4,1);
					end;
				end;
			end
			// 会計処理区分: 0=免税業者
			else
			begin
				ClearTaxEdit(1,1);
				ClearTaxEdit(2,1);
				ClearTaxEdit(3,1);
				ClearTaxEdit(4,1);
			end;
		end
		//	新規
		else
		begin
			fnResetDetailScreenAddition ();
			m_iKmkGCodeDeb := Trunc(cEdtK1DNum.Value);
			m_iKmkGCodeCre := Trunc(cEdtK1CNum.Value);
			m_iDtlCEdtExCd := Trunc(DtlCEdtExCd.Value);
		end;
		Close ();
	end;

	dqMasterData.Free ();
end;

(*
procedure	TJNTCRP020000f.fnSetDetailScreenAddition (nExCode: Integer; nAddition: Integer);
var
	dqMasterData	:	TMQuery;
	cComboBox		:	TMComboBox;
	cEditNumeric	:	TMNumEdit;
	cEditText		:	TMTxtEdit;
	cLabel			:	TMLabel;
	nCount			:	Integer;
	nWork			:	Integer;
	strPrefix		:	String;
	sFName			:	String;
	sFVlue			:	String;
	iFVlue			:	Integer;
	iFVKmk			:	Integer;
	strDesc			:	String;

	procedure SetField(cEdtNum:TMNumEdit;cEdtTxt:TMTxtEdit;cLbl:TMLabel;sName:String;index:Integer);
	var
		bNull			:	Boolean;
	begin
		bNull:=false;

//<HIS0032>		sFVlue	:=	dqMasterData.FieldByName (strPrefix + sName).AsString;
//<HIS0033>		sFVlue	:=	fnGetHojGCode(1,dqMasterData.FieldByName (strPrefix + sName).AsFloat);
        if m_stCurDtlCodeAttr [index].nMasterDivision = MASTER_CUSTOMER then
    		sFVlue	:=	fnGetHojGCode(2,dqMasterData.FieldByName (strPrefix + sName).AsFloat)
        else
    		sFVlue	:=	fnGetHojGCode(1,dqMasterData.FieldByName (strPrefix + sName).AsFloat);

		if	((not m_stCurDtlCodeAttr [index].fEnabled) or
//			 (dqMasterData.FieldByName (sFName).IsNull) or
			 (sFVlue = ''))
		then	bNull:=true;

		fnSetField(cEdtNum,cEdtTxt,cLbl,sFVlue,'',bNull,index);
	end;
begin
	if	(m_pRec^.m_pChildForm = nil) then	Exit;

	dqMasterData	:= TMQuery.Create (Self);

	//	DBとMQueryの接続
	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);

	with (dqMasterData) do
	begin

(*20030520	khattori*)
(*// <HIS0052> ADD
		Close ();

		SQL.Clear ();
// HIS0029		SQL.Add   ('SELECT BusDicKbn FROM   TekiMA WHERE  MasterKbn = 61 AND SumKbn = 0 AND RecordKbn = 0 AND GCode = :nExCode');
        SQL.Add   ('SELECT BusDicKbn FROM   TekiMA WHERE  MasterKbn = 61 AND SumKbn = 0 AND GCode = :nExCode AND RDelKbn = 0');    // HIS0029
		ParamByName ('nExCode'     ).AsInteger	:= nExCode;

		Open ();

		if	(not EOF)
		then	MCheckBox1.Checked	:=	FieldByName ('BusDicKbn').AsInteger=1
		else	MCheckBox1.Checked	:=	false;

		Close ();


		//	仕訳辞書摘要区分: 0=通常摘要
		if	(nAddition = 0)	and	(not MCheckBox1.Checked) then
		begin
			fnResetDetailScreenAddition ();

			m_iKmkGCodeDeb:=Trunc(cEdtK1DNum.Value);
			m_iKmkGCodeCre:=Trunc(cEdtK1CNum.Value);
			m_iDtlCEdtExCd:=Trunc(DtlCEdtExCd.Value);

			Exit;
		end;

		SQL.Clear ();
		SQL.Add   ('SELECT DKmkNCode, DSubNCode, DBmnNCode, DSeg1NCode, DHojyo1NCode, DHojyo2NCode, DKojNCode, DKsyNCode, ');
		SQL.Add   ('       CKmkNCode, CSubNCode, CBmnNCode, CSeg1NCode, CHojyo1NCode, CHojyo2NCode, CKojNCode, CKsyNCode, ');

(*20030520	khattori*)
(*// <HIS0052> ADD
		SQL.Add   ('DKmkKbn, DSubKbn, DBmnKbn, DSeg1Kbn, DHojyo1Kbn, DHojyo2Kbn, DKojKbn, DKsyKbn, ');
		SQL.Add   ('CKmkKbn, CSubKbn, CBmnKbn, CSeg1Kbn, CHojyo1Kbn, CHojyo2Kbn, CKojKbn, CKsyKbn, ');

		SQL.Add   ('       STaxKbn, STaxCode, STaxRate, TypeCode ');
		SQL.Add   ('FROM   SwDicTeki ');
		SQL.Add   ('WHERE  MasterKbn = 61 AND TekiNCode = :nExCode');

// HIS0001↓
//		ParamByName ('nExCode').AsFloat	:= fnGetNCode(1,nExCode,-1);
		ParamByName ('nExCode').AsFloat	:= fnGetNCode(TBL_TEKI, 0,nExCode);
// HIS0001↑

		Open ();

		if	(not EOF) then
		begin

(*20030520	khattori*)
(*// <HIS0052> ADD
			cCmbK1DCmb.ItemIndex	:=	FieldByName('DKmkKbn'		).AsInteger;

			cCmbK1CCmb.ItemIndex	:=	FieldByName('CKmkKbn'		).AsInteger;

			for	nCount := 0 to 1 do
			begin
				if	(nCount = 0) then													// 借方
				begin
					strPrefix		:=	'D';
					cEditNumeric	:=	cEdtK1DNum;
					cLabel			:=	cLblK1DDsc;
					cComboBox		:=	cCmbK1DCmb;
				end
				else																	// 貸方
				begin
					strPrefix		:=	'C';
					cEditNumeric	:=	cEdtK1CNum;
					cLabel			:=	cLblK1CDsc;
					cComboBox		:=	cCmbK1CCmb;
				end;

				cComboBox.Enabled	:=	MCheckBox1.Checked;

				if	cComboBox.ItemIndex=0	then
				begin
					// 借方
					if	(nCount = 0) then
					begin
						cEdtK1DNum.Enabled	:= true;
//						cCmbK1DCmb.Enabled	:= true;	cEdtK1DNum.Enabled	:= true;
					end
					else
					begin
						cEdtK1CNum.Enabled	:= true;
//						cCmbK1CCmb.Enabled	:= true;	cEdtK1CNum.Enabled	:= true;
					end;
					MComboBoxChange(cComboBox);
				end;

				if	cComboBox.ItemIndex>0	then
				begin
					// 借方
					if	(nCount = 0) then
					begin
						cCmbK2DCmb.Enabled	:= false;	cEdtK2DNum.Enabled	:= false;
						cCmbBUDCmb.Enabled	:= false;	cEdtBUDNum.Enabled	:= false;	cEdtBUDFre.Enabled	:= false;
						cCmbSGDCmb.Enabled	:= false;	cEdtSGDNum.Enabled	:= false;	cEdtSGDFre.Enabled	:= false;
						cCmbH1DCmb.Enabled	:= false;	cEdtH1DNum.Enabled	:= false;	cEdtH1DFre.Enabled	:= false;
						cCmbH2DCmb.Enabled	:= false;	cEdtH2DNum.Enabled	:= false;	cEdtH2DFre.Enabled	:= false;
						cCmbKODCmb.Enabled	:= false;	cEdtKODNum.Enabled	:= false;	cEdtKODFre.Enabled	:= false;
						cCmbKSDCmb.Enabled	:= false;	cEdtKSDNum.Enabled	:= false;	cEdtKSDFre.Enabled	:= false;
					end
					// 貸方
					else
					begin
						cCmbK2CCmb.Enabled	:= false;	cEdtK2CNum.Enabled	:= false;
						cCmbBUCCmb.Enabled	:= false;	cEdtBUCNum.Enabled	:= false;	cEdtBUCFre.Enabled	:= false;
						cCmbSGCCmb.Enabled	:= false;	cEdtSGCNum.Enabled	:= false;	cEdtSGCFre.Enabled	:= false;
						cCmbH1CCmb.Enabled	:= false;	cEdtH1CNum.Enabled	:= false;	cEdtH1CFre.Enabled	:= false;
						cCmbH2CCmb.Enabled	:= false;	cEdtH2CNum.Enabled	:= false;	cEdtH2CFre.Enabled	:= false;
						cCmbKOCCmb.Enabled	:= false;	cEdtKOCNum.Enabled	:= false;	cEdtKOCFre.Enabled	:= false;
						cCmbKSCCmb.Enabled	:= false;	cEdtKSCNum.Enabled	:= false;	cEdtKSCFre.Enabled	:= false;
					end;

					MComboBoxChange(cComboBox);

					// 借方
					if	(nCount = 0)
					then	m_iKmkGCodeDeb:=Trunc(cEdtK1DNum.Value)
					else	m_iKmkGCodeCre:=Trunc(cEdtK1CNum.Value);

//					m_iKmkGCodeDeb:=Trunc(cEdtK1DNum.Value);
//					m_iKmkGCodeCre:=Trunc(cEdtK1CNum.Value);
//					m_iDtlCEdtExCd:=Trunc(DtlCEdtExCd.Value);

					continue;
				end;

				sFName	:=	strPrefix + 'KmkNCode';
				iFVlue	:=	fnGetKmkGCodeInt(FieldByName (sFName).AsFloat);

				fnSetDtlEditExCodeAttribute (iFVlue, nCount);
				fnCheckExCodeKmkMA (MASTER_SUBJECT, nCount,	iFVlue, '', strDesc);

				cEditNumeric.Value	:= iFVlue;
				cLabel.Caption	:= strDesc;

(*20030520	khattori*)
(*// <HIS0052> ADD
				// 借方
				if	(nCount = 0) then
				begin
					cCmbK2DCmb.ItemIndex	:=	FieldByName('DSubKbn'		).AsInteger;
					cCmbBUDCmb.ItemIndex	:=	FieldByName('DBmnKbn'		).AsInteger;
					cCmbSGDCmb.ItemIndex	:=	FieldByName('DSeg1Kbn'		).AsInteger;
					cCmbH1DCmb.ItemIndex	:=	FieldByName('DHojyo1Kbn'	).AsInteger;
					cCmbH2DCmb.ItemIndex	:=	FieldByName('DHojyo2Kbn'	).AsInteger;
					cCmbKODCmb.ItemIndex	:=	FieldByName('DKojKbn'		).AsInteger;
					cCmbKSDCmb.ItemIndex	:=	FieldByName('DKsyKbn'		).AsInteger;

					//	共通部門
					if	m_stCurDtlCodeAttr [2].nClassCode=1	then	cCmbBUDCmb.ItemIndex	:=	0;
					if	m_stCurDtlCodeAttr [3].nClassCode=1	then	cCmbSGDCmb.ItemIndex	:=	0;


					if	cCmbK2DCmb.ItemIndex>0	then	begin	cEdtK2DNum.Enabled	:= false;									end;
					if	cCmbBUDCmb.ItemIndex>0	then	begin	cEdtBUDNum.Enabled	:= false;	cEdtBUDFre.Enabled	:= false;	end;
					if	cCmbSGDCmb.ItemIndex>0	then	begin	cEdtSGDNum.Enabled	:= false;	cEdtSGDFre.Enabled	:= false;	end;
					if	cCmbH1DCmb.ItemIndex>0	then	begin	cEdtH1DNum.Enabled	:= false;	cEdtH1DFre.Enabled	:= false;	end;
					if	cCmbH2DCmb.ItemIndex>0	then	begin	cEdtH2DNum.Enabled	:= false;	cEdtH2DFre.Enabled	:= false;	end;
					if	cCmbKODCmb.ItemIndex>0	then	begin	cEdtKODNum.Enabled	:= false;	cEdtKODFre.Enabled	:= false;	end;
					if	cCmbKSDCmb.ItemIndex>0	then	begin	cEdtKSDNum.Enabled	:= false;	cEdtKSDFre.Enabled	:= false;	end;

					ChangeCompColor(cEdtK2DNum);
					ChangeCompColor(cEdtBUDNum);	ChangeCompColor(cEdtBUDFre);
					ChangeCompColor(cEdtSGDNum);	ChangeCompColor(cEdtSGDFre);
					ChangeCompColor(cEdtH1DNum);	ChangeCompColor(cEdtH1DFre);
					ChangeCompColor(cEdtH2DNum);	ChangeCompColor(cEdtH2DFre);
					ChangeCompColor(cEdtKODNum);	ChangeCompColor(cEdtKODFre);
//					ChangeCompColor(cEdtKSDNum);	ChangeCompColor(cEdtKSDFre);
				end
				// 貸方
				else
				begin
					cCmbK2CCmb.ItemIndex	:=	FieldByName('CSubKbn'		).AsInteger;
					cCmbBUCCmb.ItemIndex	:=	FieldByName('CBmnKbn'		).AsInteger;
					cCmbSGCCmb.ItemIndex	:=	FieldByName('CSeg1Kbn'		).AsInteger;
					cCmbH1CCmb.ItemIndex	:=	FieldByName('CHojyo1Kbn'	).AsInteger;
					cCmbH2CCmb.ItemIndex	:=	FieldByName('CHojyo2Kbn'	).AsInteger;
					cCmbKOCCmb.ItemIndex	:=	FieldByName('CKojKbn'		).AsInteger;
					cCmbKSCCmb.ItemIndex	:=	FieldByName('CKsyKbn'		).AsInteger;

					//	共通部門
					if	m_stCurDtlCodeAttr [10].nClassCode=1	then	cCmbBUCCmb.ItemIndex	:=	0;
					if	m_stCurDtlCodeAttr [11].nClassCode=1	then	cCmbSGCCmb.ItemIndex	:=	0;

					if	cCmbK2CCmb.ItemIndex>0	then	begin	cEdtK2CNum.Enabled	:= false;									end;
					if	cCmbBUCCmb.ItemIndex>0	then	begin	cEdtBUCNum.Enabled	:= false;	cEdtBUCFre.Enabled	:= false;	end;
					if	cCmbSGCCmb.ItemIndex>0	then	begin	cEdtSGCNum.Enabled	:= false;	cEdtSGCFre.Enabled	:= false;	end;
					if	cCmbH1CCmb.ItemIndex>0	then	begin	cEdtH1CNum.Enabled	:= false;	cEdtH1CFre.Enabled	:= false;	end;
					if	cCmbH2CCmb.ItemIndex>0	then	begin	cEdtH2CNum.Enabled	:= false;	cEdtH2CFre.Enabled	:= false;	end;
					if	cCmbKOCCmb.ItemIndex>0	then	begin	cEdtKOCNum.Enabled	:= false;	cEdtKOCFre.Enabled	:= false;	end;
					if	cCmbKSCCmb.ItemIndex>0	then	begin	cEdtKSCNum.Enabled	:= false;	cEdtKSCFre.Enabled	:= false;	end;

					ChangeCompColor(cEdtK2CNum);
					ChangeCompColor(cEdtBUCNum);	ChangeCompColor(cEdtBUCFre);
					ChangeCompColor(cEdtSGCNum);	ChangeCompColor(cEdtSGCFre);
					ChangeCompColor(cEdtH1CNum);	ChangeCompColor(cEdtH1CFre);
					ChangeCompColor(cEdtH2CNum);	ChangeCompColor(cEdtH2CFre);
					ChangeCompColor(cEdtKOCNum);	ChangeCompColor(cEdtKOCFre);
//					ChangeCompColor(cEdtKSCNum);	ChangeCompColor(cEdtKSCFre);
				end;

				// 科目別補助
				if	(nCount = 0) then													// 借方
				begin
					cEditText   	:= cEdtK2DNum;
					cLabel			:= cLblK2DDsc;
				end
				else																	// 貸方
				begin
					cEditText   	:= cEdtK2CNum;
					cLabel			:= cLblK2CDsc;
				end;

				if	(m_stCurDtlCodeAttr [nCount * 8 + 1].fEnabled) then
				begin

					sFName	:=	strPrefix + 'SubNCode';
//<HIS0032>					iFVlue	:=	FieldByName (sFName).AsInteger;
					sFVlue	:=	fnGetKmkGCodeStr(FieldByName (sFName).AsFloat);
//<HIS0032>					iFVKmk	:=	FieldByName (strPrefix + 'KmkNCode').AsInteger;
					iFVKmk	:=	fnGetKmkGCodeInt(FieldByName (strPrefix + 'KmkNCode').AsFloat);

					cEditNumeric.Value	:= iFVlue;

					if	(not FieldByName (sFName).IsNull) then
					begin
						cEditNumeric.InputFlag	:= false;
						fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS, nCount,	iFVKmk,sFVlue, strDesc);
					end
					else
					begin
						cEditNumeric.InputFlag	:= true;
						fnCheckExCodeKmkMA (MASTER_SUBJECTPLUS, nCount,	iFVKmk, '', strDesc);
					end;

					cLabel.Caption	:= strDesc;
                    cEditText.Text  := sFVlue;
				end
				else
				begin
//<HIS0032>					cEditNumeric.Value		:= 0;
//<HIS0032>					cEditNumeric.InputFlag	:= true;
					cLabel      .Caption	:= '';
				end;

				// 借方
				if	(nCount = 0)	then
				begin
					SetField(cEdtBUDNum,cEdtBUDFre,cLblBUDDsc,'BmnNCode'	,2);	// 部門
					SetField(cEdtSGDNum,cEdtSGDFre,cLblSGDDsc,'Seg1NCode'	,3);	// ｾｸﾞﾒﾝﾄ
					SetField(cEdtH1DNum,cEdtH1DFre,cLblH1DDsc,'Hojyo1NCode'	,4);	// 補助１
					SetField(cEdtH2DNum,cEdtH2DFre,cLblH2DDsc,'Hojyo2NCode'	,5);	// 補助２
					SetField(cEdtKODNum,cEdtKODFre,cLblKODDsc,'KojNCode'	,6);	// 工事
					m_stCurDtlCodeAttr [7].fEnabled	:=
						(fnGetMasterInfoData (MASTER_CONSTKIND, 7 ) <> 0) and (fnGetKousyu(0)=1);
					SetField(cEdtKSDNum,cEdtKODFre,cLblKSDDsc,'KsyNCode'		,7);	// 工種
					fnSetDtlEditExCodeCondition(m_cEdtSet[7].Typ,0,7);
					ChangeCompColor(cEdtKSDNum);	ChangeCompColor(cEdtKSDFre);
				end
				// 貸方
				else
				begin
					SetField(cEdtBUCNum,cEdtBUCFre,cLblBUCDsc,'BmnNCode'		,10);	// 部門
					SetField(cEdtSGCNum,cEdtSGCFre,cLblSGCDsc,'Seg1NCode'	,11);	// ｾｸﾞﾒﾝﾄ
					SetField(cEdtH1CNum,cEdtH1CFre,cLblH1CDsc,'Hojyo1NCode'	,12);	// 補助１
					SetField(cEdtH2CNum,cEdtH2CFre,cLblH2CDsc,'Hojyo2NCode'	,13);	// 補助２
					SetField(cEdtKOCNum,cEdtKOCFre,cLblKOCDsc,'KojNCode'		,14);	// 工事
					m_stCurDtlCodeAttr [15].fEnabled	:=
						(fnGetMasterInfoData (MASTER_CONSTKIND, 15 ) <> 0) and (fnGetKousyu(1)=1);
					SetField(cEdtKSCNum,cEdtKSCFre,cLblKSCDsc,'KsyNCode'		,15);	// 工種
					fnSetDtlEditExCodeCondition(m_cEdtSet[15].Typ,1,15);
					ChangeCompColor(cEdtKSCNum);	ChangeCompColor(cEdtKSCFre);
				end;

				//	共通部門
				SetCommonSection(nCount);

			end;

			m_iDtlCEdtExCd:=Trunc(DtlCEdtExCd.Value);

			// 会計処理区分: 0=免税業者
			if	(m_nTaxAccDivision <> 0) then
			begin
				if	MCheckBox1.Checked	then
				begin
					ClearTaxEdit(1,1);

					GetTaxKbn(FieldByName('DKmkNCode').AsInteger,FieldByName('CKmkNCode').AsInteger);
				end
				else
				begin
					ClearTaxEdit(1,3);

					m_iTaxKbn	:= FieldByName ('STaxKbn').AsInteger;
					DtlCmnEditTaxDivision		.Value		:=	m_iTaxKbn;
					fnCheckTaxDivision (m_iTaxKbn, strDesc);
					DtlCmnLbelTaxDivisionDesc.Caption	:= strDesc;
					fnDtlCmnEditTaxDivisionOnChange (DtlCmnEditTaxDivision);
				end;

				if	(m_iTaxKbn = 0) then
				begin
					ClearTaxEdit(2,2);
					ClearTaxEdit(3,1);
					ClearTaxEdit(4,1);
				end
				else
				begin
					fnSetDtlEditTaxCodeSelectItems (m_iTaxKbn);

					ClearTaxEdit(2,3);

					DtlCmnEditTaxCode.Value		:=	FieldByName ('STaxCode').AsInteger;
					DtlCmnEditTaxCode.InputFlag	:=	false;

					fnCheckTaxCode (m_iTaxKbn,FieldByName ('STaxCode').AsInteger, strDesc);

					DtlCmnLbelTaxCodeDesc.Caption	:= strDesc;

					if	(Trunc (DtlCmnEditTaxCode.Value) <> 0) then
					begin

						if	m_cTaxItems.iRate=1	then
						begin
							nWork	:= FieldByName ('STaxRate').AsInteger;

							ClearTaxEdit(3,3);

							DtlCmnEditTaxRate.Value		:= nWork;
							DtlCmnEditTaxRate.InputFlag	:= false;

							if	((nWork >= 0) and (nWork <= 2)) then
								DtlCmnLbelTaxRateDesc.Caption	:= Copy (DtlCmnEditTaxRate.SelectItems.Strings [nWork], 4, 14)
							else
								DtlCmnLbelTaxRateDesc.Caption	:= '';
						end
						else
						begin
							ClearTaxEdit(3,1);
						end;

						if	m_cTaxItems.iType=1	then
						begin
							nWork	:= FieldByName ('TypeCode').AsInteger;

							ClearTaxEdit(4,3);

							DtlCmnEditTypeCode.Value		:= nWork;
							DtlCmnEditTypeCode.InputFlag	:= false;

							if	((nWork >= 0) and (nWork <= 5)) then
								DtlCmnLbelTypeCodeDesc.Caption	:= Copy (DtlCmnEditTypeCode.SelectItems.Strings [nWork], 4, 14)
							else
								DtlCmnLbeltypeCodeDesc.Caption	:= '';
						end
						else
						begin
							ClearTaxEdit(4,1);
						end;
					end
					else
					begin
						ClearTaxEdit(3,1);
						ClearTaxEdit(4,1);
					end;
				end;
			end
			// 会計処理区分: 0=免税業者
			else
			begin
				ClearTaxEdit(1,1);
				ClearTaxEdit(2,1);
				ClearTaxEdit(3,1);
				ClearTaxEdit(4,1);
			end;
		end
		//	新規
		else
		begin
			fnResetDetailScreenAddition ();
			m_iKmkGCodeDeb:=Trunc(cEdtK1DNum.Value);
			m_iKmkGCodeCre:=Trunc(cEdtK1CNum.Value);
			m_iDtlCEdtExCd:=Trunc(DtlCEdtExCd.Value);
		end;

		Close ();
	end;

	dqMasterData.Free ();
end;
*)
// <HIS0052> MOD end
//***********************************************************************************************************/
//*																											*/
//*	関数	: TJNTCRP020000f.fnSetDtlEditExCodeAttribute (Integer; Integer)									*/
//*																											*/
//*	目的	: 摘要登録処理																					*/
//*																											*/
//*	戻り値	: なし,																							*/
//*																											*/
//*---------------------------------------------------------------------------------------------------------*/
//*																											*/
//*	ﾊﾟﾗﾒｰﾀ	: nExCode	= 科目外部ｺｰﾄﾞ																		*/
//*			  nDivision	= 借方/貸方区分 (0:借方, 1:貸方)													*/
//*																											*/
//***********************************************************************************************************/
procedure	TJNTCRP020000f.fnSetDtlEditExCodeAttribute	(nExCode: Integer; nDivision: Integer; bCheck: Boolean);
// <HIS0052> MOD start  関数まるごと修正
(*var
	dqMasterData	:	TMQuery;
	nCount			:	Integer;
	nPos			:	Integer;
	nAdp			:	Integer;
	idummy			:	Integer;
	iBsPlKbn		:	Integer;
	iKousyu			:	Integer;
begin
	if	(nDivision = 0) then
	begin
		if	(m_iDtlCEdtExCd=Trunc (DtlCEdtExCd.Value)) and (m_iKmkGCodeDeb=nExCode)	then	exit;

		m_iKmkGCodeDeb:=nExCode;
	end
	else
	begin
		if	(m_iDtlCEdtExCd=Trunc (DtlCEdtExCd.Value)) and (m_iKmkGCodeCre=nExCode)	then	exit;

		m_iKmkGCodeCre:=nExCode;
	end;

	nPos	:=	nDivision*8;

	for	nCount := nPos+1 to nPos+7 do
	begin
		m_stCurDtlCodeAttr [nCount].strCaption	:=	'';
		m_stCurDtlCodeAttr [nCount].nDigit		:=	6;
		m_stCurDtlCodeAttr [nCount].nAttribute	:=	0;
		m_stCurDtlCodeAttr [nCount].nClassCode	:=	0;
		m_stCurDtlCodeAttr [nCount].fEnabled		:=	false;

		with	m_cEdtSet[nCount]	do
		begin
            if (nCount <> nPos+1) and (nCount <>nPos+7) then
            begin
                Num.Value:=0;
                Num.InputFlag:=true;
            end;
            if	Fre<>nil	then	Fre.Text:='';
		end;
	end;
	m_stCurDtlCodeAttr [nDivision*8+1].strCaption	:=	'補助';

	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM KmkMA ');
		SQL.Add   ('WHERE  MasterKbn = 1 AND SumKbn = 0 AND RDelKbn = 0 AND GCode = :nExCode');
  		ParamByName ('nExCode').AsInteger	:= nExCode;
		Open ();

		if	(not EOF) then
		begin
			iBsPlKbn	:=	FieldByName ('BPKbn').AsInteger;

			//	nDivision	= 借方/貸方区分 (0:借方, 1:貸方)
			if	nDivision=0
			then	m_iBsPlKbnDeb:=iBsPlKbn
			else	m_iBsPlKbnCre:=iBsPlKbn;

			//	科目別補助
			nAdp	:=	fnGetMasterInfoData (MASTER_SUBJECTPLUS, 1+nPos );

			// 細目科目採用区分: 1=あり
			if	((FieldByName ('SubKmkUse').AsInteger = 1) and (nAdp <> 0))
			then	m_stCurDtlCodeAttr [1 + nPos].fEnabled	:= true
			else	m_stCurDtlCodeAttr [1 + nPos].fEnabled	:= false;

			//	部門
			nAdp	:=	fnGetMasterInfoData (MASTER_SECTION, 2+nPos );
			with	m_stCurDtlCodeAttr [2 + nPos]	do
			begin
				nClassCode	:= 0;
				fEnabled	:= false;

				//	部門採用区分: あり and (B/S&P/L採用 or P/L科目)
				if	(FieldByName ('BmnUse').AsInteger <> 0) and
					((nAdp = 2) or (iBsPlKbn <> 0)) then
				begin
					//	共通部門
					if	(FieldByName ('BmnUse').AsInteger = 2)	then	nClassCode	:= 1
					else
					begin
						fEnabled	:= true;

						//	B/S科目
						if	iBsPlKbn = 0	then	nClassCode	:= 2
					end;
				end;
			end;

			//	セグメント
			nAdp	:=	fnGetMasterInfoData (MASTER_SEGMENT, 3+nPos );
			with	m_stCurDtlCodeAttr [3 + nPos]	do
			begin
				nClassCode	:= 0;
				fEnabled	:= false;

				//	ｾｸﾞﾒﾝﾄ1採用区分: あり and (B/S&P/L採用 or P/L科目)
				if	(FIeldByName ('SegUse1').AsInteger <> 0) and
					((nAdp = 2) or	(iBsPlKbn <> 0)) then
				begin
					//	共通部門
					if	(FieldByName ('SegUse1').AsInteger = 2)	then	nClassCode	:= 1
					else
					begin
						fEnabled	:= true;

						//	B/S科目
						if	iBsPlKbn = 0	then	nClassCode	:= 2
					end;
				end;
			end;

			//	第１補助
			nAdp	:=	fnGetMasterInfoData (MASTER_HOJYO1, 4+nPos );
			m_stCurDtlCodeAttr [4 + nPos].fEnabled	:= nAdp <> 0;

			//	第２補助
			nAdp	:=	fnGetMasterInfoData (MASTER_HOJYO2, 5+nPos );
			m_stCurDtlCodeAttr [5 + nPos].fEnabled	:= nAdp <> 0;

			if	(nDivision = 0) then
			begin
				cCmbH1DCmb.Items.Clear;
				cCmbH1DCmb.Items.Add('基準');
				cCmbH1DCmb.Items.Add('可変');
				idummy:=MASTER_HOJYO1;
				if	idummy=25	then	cCmbH1DCmb.Items.Add('当該');

				cCmbH2DCmb.Items.Clear;
				cCmbH2DCmb.Items.Add('基準');
				cCmbH2DCmb.Items.Add('可変');
				idummy:=MASTER_HOJYO2;
				if	idummy=25	then	cCmbH2DCmb.Items.Add('当該');
			end
			else
			begin
				cCmbH1CCmb.Items.Clear;
				cCmbH1CCmb.Items.Add('基準');
				cCmbH1CCmb.Items.Add('可変');
				idummy:=MASTER_HOJYO1;
				if	idummy=25	then	cCmbH1CCmb.Items.Add('当該');

				cCmbH2CCmb.Items.Clear;
				cCmbH2CCmb.Items.Add('基準');
				cCmbH2CCmb.Items.Add('可変');
				idummy:=MASTER_HOJYO2;
				if	idummy=25	then	cCmbH2CCmb.Items.Add('当該');
			end;

			m_stCurDtlCodeAttr [7 + nPos].fEnabled	:= false;

			//	工事
			nAdp	:=	fnGetMasterInfoData (MASTER_CONSTRUCT, 6+nPos );
			if	((nAdp <> 0) and (FieldByName ('PrjUse1').AsInteger = 1)) then 
			begin
				m_stCurDtlCodeAttr [6 + nPos].fEnabled	:= true;

				//	工種
				nAdp	:=	fnGetMasterInfoData (MASTER_CONSTKIND, 7+nPos );
				iKousyu	:=	fnGetKousyu(nDivision);
				m_stCurDtlCodeAttr [7 + nPos].fEnabled	:= (nAdp <> 0) and (iKousyu=1);
			end;

			for	nCount := 1 to 7 do
				m_cEdtSet[nCount+nPos].Cmb.ItemIndex:=0;
		end;
	end;

	for	nCount := 1 to 7 do
		fnSetDtlEditExCodeCondition(m_cEdtSet[nCount+nPos].Typ,nDivision,nCount+nPos);

	dqMasterData.Free ();
end;
*)
var
	dqMasterData	:	TMQuery;
	nCount			:	Integer;
	nPos			:	Integer;
	nAdp			:	Integer;
	iBsPlKbn		:	Integer;
    iCnt			:	Integer;
begin

	if	(nDivision = 0) then  				// 借方
	begin
		if	(m_iDtlCEdtExCd=Trunc (DtlCEdtExCd.Value)) and (m_iKmkGCodeDeb=nExCode)	then	exit;

		m_iKmkGCodeDeb:=nExCode;
	end
	else									// 貸方
	begin
		if	(m_iDtlCEdtExCd=Trunc (DtlCEdtExCd.Value)) and (m_iKmkGCodeCre=nExCode)	then	exit;

		m_iKmkGCodeCre:=nExCode;
	end;

	nPos :=	nDivision * 41;					// 借方/貸方の先頭

	for	nCount := nPos + 1 to nPos + 40 do
	begin
		m_stCurDtlCodeAttr [nCount].strCaption	:=	'';
		m_stCurDtlCodeAttr [nCount].nDigit		:=	6;
		m_stCurDtlCodeAttr [nCount].nAttribute	:=	0;
		m_stCurDtlCodeAttr [nCount].nClassCode	:=	0;
		m_stCurDtlCodeAttr [nCount].nUseKbn		:=	0;				// 貸借科目の採用の判断[0:採用なし, 1:採用あり, 2:採用あり(共通)] <HIS0096>
		m_stCurDtlCodeAttr [nCount].fEnabled	:=	False;
	end;

	dqMasterData := TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	with (dqMasterData) do
	begin
		Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT * FROM KmkMA ');
		SQL.Add   ('WHERE  MasterKbn = 1 AND SumKbn = 0 AND RDelKbn = 0 AND GCode = :nExCode');
        									// 外部ｺｰﾄﾞ
  		ParamByName ('nExCode').AsInteger := nExCode;
		Open ();

		if	(not EOF) then
		begin
        									// 科目のBS/PL区分
			iBsPlKbn	:=	FieldByName ('BPKbn').AsInteger;

			//	nDivision	= 借方/貸方区分 (0:借方, 1:貸方)
			if	nDivision=0
			then	m_iBsPlKbnDeb := iBsPlKbn
			else	m_iBsPlKbnCre := iBsPlKbn;

			//	科目別補助
			nAdp := fnGetMasterInfoData (MASTER_SUBJECTPLUS, IDX_KMKHOJ + nPos );
            if nAdp > 0 then
            begin           				// この科目が採用している属性・桁数にする
            	m_stCurDtlCodeAttr [IDX_KMKHOJ + nPos].nAttribute := GetFld('CodeAttr').AsInteger;
				m_stCurDtlCodeAttr [IDX_KMKHOJ + nPos].nDigit := GetFld('CodeDigit').AsInteger;
            end;

			// 細目科目採用区分: 1=あり
			if	((FieldByName ('SubKmkUse').AsInteger = 1) and (nAdp <> 0))
			then	m_stCurDtlCodeAttr [IDX_KMKHOJ + nPos].fEnabled	:= true
			else	m_stCurDtlCodeAttr [IDX_KMKHOJ + nPos].fEnabled	:= false;

			//	部門
			nAdp	:= fnGetMasterInfoData (MASTER_SECTION, IDX_BUMON + nPos );
			with m_stCurDtlCodeAttr [IDX_BUMON + nPos] do
			begin
//<HIS0096>↓↓部門採用情報、科目の属性(B/S or P/L)をｾｯﾄ
{				nClassCode	:= 0;
				fEnabled	:= false;

				//	部門採用区分: あり and (B/S&P/L採用 or P/L科目)
				if	(FieldByName ('BmnUse').AsInteger <> 0) and
					((nAdp = 2) or (iBsPlKbn <> 0)) then
				begin
					//	共通部門
					if	(FieldByName ('BmnUse').AsInteger = 2)	then
                    begin
                    	nClassCode	:= 1;
                    end
					else
					begin
						fEnabled	:= true;

						//	B/S科目
						if	iBsPlKbn = 0	then	nClassCode	:= 2
					end;
				end;
}
				nClassCode	:= 0;		// 科目の属性(0:B/S, 1:P/L)
				nUseKbn		:= 0;		// 部門採用情報(0:なし, 1:あり, 2:共通部門)
				fEnabled	:= false;	// 補助の設定可否
				
				// 科目の属性(B/S or P/L)をｾｯﾄ
				nClassCode := iBsPlKbn;
				
				// ﾏｽﾀの部門採用が「P/Lのみ採用」の場合
				if (nAdp = 1) then
				begin
					// 科目の区分が「P/L」の場合
					if (iBsPlKbn = 1) then
					begin
						// 科目の部門採用により、貸借科目の採用の判断をする
						if (FieldByName ('BmnUse').AsInteger <> 0) then
						begin
							nUseKbn := FieldByName ('BmnUse').AsInteger;
							fEnabled := true;
						end;
					end;
				end
				// ﾏｽﾀの部門採用が「B/S & P/L採用」の場合
				else if (nAdp = 2) then
				begin
					// 科目の部門採用により、貸借科目の採用の判断をする
					if (FieldByName ('BmnUse').AsInteger <> 0) then
					begin
						nUseKbn := FieldByName ('BmnUse').AsInteger;
						fEnabled := true;
					end;
				end;
//<HIS0096>↑↑
			end;

			//	セグメント1～10
            for iCnt := 0 to 9 do
            begin
				nAdp := fnGetMasterInfoData (MASTER_SEGMENT + iCnt, IDX_SEG1 + nPos + iCnt );
				with m_stCurDtlCodeAttr [IDX_SEG1 + nPos + iCnt] do
				begin
//<HIS0096>↓↓ｾｸﾞﾒﾝﾄの採用情報、科目の属性(B/S or P/L)をｾｯﾄ
{					nClassCode	:= 0;
					fEnabled	:= false;

					//	ｾｸﾞﾒﾝﾄ1～10採用区分: あり and (B/S&P/L採用 or P/L科目)
					if	(FIeldByName ('SegUse' + IntToStr(iCnt + 1)).AsInteger <> 0) and
						((nAdp = 2) or	(iBsPlKbn <> 0)) then
					begin
						//	共通部門
						if	(FieldByName ('SegUse' + IntToStr(iCnt + 1)).AsInteger = 2)	then	nClassCode	:= 1
						else
						begin
							fEnabled	:= true;

							//	B/S科目
							if	iBsPlKbn = 0	then	nClassCode	:= 2
						end;
					end;
}
					nClassCode	:= 0;		// 科目の属性(0:B/S, 1:P/L)
					nUseKbn		:= 0;		// ｾｸﾞﾒﾝﾄ採用情報(0:なし, 1:あり, 2:共通ｾｸﾞﾒﾝﾄ)
					fEnabled	:= false;	// 補助の設定可否

					// 科目の属性(B/S or P/L)をｾｯﾄ
					nClassCode := iBsPlKbn;

					// ﾏｽﾀのｾｸﾞﾒﾝﾄ採用が「P/Lのみ採用」の場合
					if (nAdp = 1) then
					begin
						// 科目の区分が「P/L」の場合
						if (iBsPlKbn = 1) then
						begin
							// 科目のｾｸﾞﾒﾝﾄ採用により、貸借科目の採用の判断をする
							if (FieldByName ('SegUse' + IntToStr(iCnt + 1)).AsInteger <> 0) then
							begin
								nUseKbn := FieldByName ('SegUse' + IntToStr(iCnt + 1)).AsInteger;
								fEnabled := true;
							end;
						end;
					end
					// ﾏｽﾀのｾｸﾞﾒﾝﾄ採用が「B/S & P/L採用」の場合
					else if (nAdp = 2) then
					begin
						// 科目の部門採用により、貸借科目の採用の判断をする
						if (FieldByName ('SegUse' + IntToStr(iCnt + 1)).AsInteger <> 0) then
						begin
							nUseKbn := FieldByName ('SegUse' + IntToStr(iCnt + 1)).AsInteger;
							fEnabled := true;
						end;
					end;
//<HIS0096>↑↑
				end;
            end;

			//	銀行
			nAdp := fnGetMasterInfoData (MKBN_GINKOU, IDX_BANK + nPos );
			if (FieldByName('BankUse').AsInteger <> 0) and
				(nAdp <> 0) then
			begin
				m_stCurDtlCodeAttr [IDX_BANK + nPos].fEnabled := true;
			end
			else
			begin
				m_stCurDtlCodeAttr [IDX_BANK + nPos].fEnabled := false;
			end;

 			//	取引先
			nAdp := fnGetMasterInfoData (MKBN_TORIHIKI, IDX_TORIHIKI + nPos );
			if (FieldByName('ToriUse').AsInteger <> 0) and
				(nAdp <> 0) then
			begin
				m_stCurDtlCodeAttr [IDX_TORIHIKI + nPos].fEnabled := true;
			end
			else
			begin
				m_stCurDtlCodeAttr [IDX_TORIHIKI + nPos].fEnabled := false;
			end;

 			//	社員
			nAdp := fnGetMasterInfoData (MKBN_SYAIN, IDX_SYAIN + nPos );
			if (FieldByName('ShainUse').AsInteger <> 0) and
				(nAdp <> 0) then
			begin
				m_stCurDtlCodeAttr [IDX_SYAIN + nPos].fEnabled := true;
			end
			else
			begin
				m_stCurDtlCodeAttr [IDX_SYAIN + nPos].fEnabled := false;
			end;

			//	汎用補助1～5
            for iCnt := 0 to 4 do
            begin
				nAdp := fnGetMasterInfoData (MKBN_HHOJYO1 + iCnt, IDX_HANYOU1 + nPos + iCnt );
				if (FieldByName('HojyoUse' + IntToStr(iCnt + 1)).AsInteger <> 0) and
					(nAdp <> 0) then
				begin
					m_stCurDtlCodeAttr [IDX_HANYOU1 + nPos + iCnt].fEnabled := true;
				end
				else
				begin
					m_stCurDtlCodeAttr [IDX_HANYOU1 + nPos + iCnt].fEnabled := false;
				end
            end;

			// ﾌﾟﾛｼﾞｪｸﾄｻﾌﾞを一度全部無効にする
			for iCnt := 0 to 9 do
			begin
				m_stCurDtlCodeAttr [GetPrjAryIndex(MKBN_PROSUB1 + iCnt) + nPos].fEnabled	:= false;
			end;

			//	プロジェクト1～10
            for iCnt := 0 to 9 do
            begin
				nAdp := fnGetMasterInfoData (MKBN_PROJECT1 + iCnt, GetPrjAryIndex(MKBN_PROJECT1 + iCnt)+ nPos);
//HIS0086↓
//プロジェクト任意入力の対応
				//if	((nAdp <> 0) and (FieldByName ('PrjUse' + IntToStr(iCnt + 1)).AsInteger = 1)) then
				if	((nAdp <> 0) and (FieldByName ('PrjUse' + IntToStr(iCnt + 1)).AsInteger >= 1)) then 
//HIS0086↑				
				begin
					m_stCurDtlCodeAttr [GetPrjAryIndex(MKBN_PROJECT1 + iCnt)+ nPos].fEnabled := true;

					//	プロジェクトサブ1～10
					nAdp	:=	fnGetMasterInfoData (MKBN_PROSUB1 + iCnt, GetPrjAryIndex(MKBN_PROSUB1 + iCnt)+ nPos);
					m_stCurDtlCodeAttr [GetPrjAryIndex(MKBN_PROSUB1 + iCnt)+ nPos].fEnabled	:= (nAdp <> 0);
				end;
            end;
		end;
	end;

	dqMasterData.Free ();
end;

// <HIS0052> MOD end

