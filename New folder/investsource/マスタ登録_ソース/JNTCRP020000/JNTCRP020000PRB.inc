//<HIS0078 start>
(*
//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   PrintDlg
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.PrintDlg;
var
	cDlgPrint	: TMJSPrnDlgf;
	cDialog		: TJNTCRP020101f;
	stMessageRec: TMJSMsgRec;
	i           : Integer;
    Qry         : TMQuery;
	sTitle		:	TStringList;	//	ﾌｧｲﾙ出力のﾀｲﾄﾙ
	sMemFld		:	TStringList;	//	ﾌｧｲﾙ出力のﾌｨｰﾙﾄﾞ名
begin
	Qry := TMQuery.Create( Self );                  //  MQueryの構築
	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, Qry );    //  DBとMQueryの接続

	cDialog := TJNTCRP020101f.Create(Self);
	cDialog.MDataModule   := m_cDataModule;
	cDialog.dbCorp_Select := m_cDBSelect;
    cDialog.pComArea      := Pointer (m_pRec);
	cDialog.ShowModal ();

	//	ﾌｧｲﾙ出力のﾀｲﾄﾙ表示のCreate処理
    sTitle	:=	TStringList.Create;
	sMemFld	:=	TStringList.Create;

	cDlgPrint		:= TMJSPrnDlgf   .Create (Self);
	m_cPrnSupport	:= TMJSPrnSupport.Create ();

	gfnJNTMasSetPrnInfo ( m_cPrnSupport,Qry );

	if cDialog.ModalResult = mrCancel then
	begin
        Exit;
	end
	else if cDialog.ModalResult = mrOk then
	begin
		m_iJnSitei	:= cDialog.m_iJnSitei;
		m_iHnSitei	:= cDialog.m_iHnSitei;
        m_iKaisi	:= cDialog.m_iStart;
		m_iOwari	:= cDialog.m_iEnd;

		if cDialog.iPrint = 0 then
		begin
			m_cPrnSupport.ApRB := RReport1;
			m_cPrnSupport.strDocName       := '固定摘要登録リスト';
		    m_cPrnSupport.pPage            := SVppPage;        //  ページ
			m_cPrnSupport.pDate            := SVppDate;        //  日付
		    m_cPrnSupport.pCorpCode        := LppCorpCode;     //  会社コード
		    m_cPrnSupport.pCorpName        := LppCorpName;     //  会社名称
		    m_cPrnSupport.pAccountOffice   := LppAccOffice;    //  会計事務所名称

			m_cPrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\固定摘要登録ﾘｽﾄ.csv';
		end
    	else if cDialog.iPrint = 1 then
		begin
			m_cPrnSupport.ApRB := RReport2;
			m_cPrnSupport.strDocName       := '仕訳辞書摘要登録リスト';
		    m_cPrnSupport.pPage            := SVppPage1;        //  ページ
			m_cPrnSupport.pDate            := SVppData1;        //  日付
		    m_cPrnSupport.pCorpCode        := LCorpCode1;       //  会社コード
		    m_cPrnSupport.pCorpName        := LCorpName1;       //  会社名称
		    m_cPrnSupport.pAccountOffice   := LAccOffice1;      //  会計事務所名称

			m_cPrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\仕訳辞書摘要登録ﾘｽﾄ.csv';
		end
		else if cDialog.iPrint = 2 then
	    begin
			m_cPrnSupport.ApRB := RReport3;
            m_cPrnSupport.strDocName       := '固定摘要分類登録リスト';
		    m_cPrnSupport.pPage            := SVppPage2;        //  ページ
			m_cPrnSupport.pDate            := SVppDate2;        //  日付
		    m_cPrnSupport.pCorpCode        := LCorpCode2;       //  会社コード
		    m_cPrnSupport.pCorpName        := LCorpName2;       //  会社名称
		    m_cPrnSupport.pAccountOffice   := LAccOffice2;      //  会計事務所名称

			m_cPrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\摘要分類登録ﾘｽﾄ.csv';
		end
		else if cDialog.iPrint = 3 then
		begin
			m_cPrnSupport.ApRB := RReport4;
			m_cPrnSupport.strDocName       := '固定摘要体系登録リスト';
		    m_cPrnSupport.pPage            := SVppPage3;        //  ページ
			m_cPrnSupport.pDate            := SVppDate3;        //  日付
		    m_cPrnSupport.pCorpCode        := LCorpCode3;       //  会社コード
		    m_cPrnSupport.pCorpName        := LCorpName3;       //  会社名称
		    m_cPrnSupport.pAccountOffice   := LAccOffice3;      //  会計事務所名称

			m_cPrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\固定摘要体系登録ﾘｽﾄ.csv';
		end
		else if cDialog.iPrint = 4 then
		begin
			m_cPrnSupport.ApRB := RReport5;
			m_cPrnSupport.strDocName       := '科目連想登録リスト(科目コード順)';
		    m_cPrnSupport.pPage            := SVppPage4;        //  ページ
			m_cPrnSupport.pDate            := SVppDate4;        //  日付
		    m_cPrnSupport.pCorpCode        := LCorpCode4;       //  会社コード
		    m_cPrnSupport.pCorpName        := LCorpName4;       //  会社名称
		    m_cPrnSupport.pAccountOffice   := LAccOffice4;      //  会計事務所名称

			m_cPrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\科目連想登録ﾘｽﾄ(科目ｺｰﾄﾞ順).csv';
		end
//------------------------------------------------------------------------------HIS0018Start
		else if cDialog.iPrint = 5 then
		begin
			if m_iJnSitei = 0 then
            begin
				m_cPrnSupport.ApRB 			   := RReport6;
				m_cPrnSupport.strDocName       := '科目連想登録リスト(摘要コード順)';
			    m_cPrnSupport.pPage            := SVppPage6;        //  ページ
				m_cPrnSupport.pDate            := SVppDate6;        //  日付
			    m_cPrnSupport.pCorpCode        := LCorpCode6;       //  会社コード
			    m_cPrnSupport.pCorpName        := LCorpName6;       //  会社名称
			    m_cPrnSupport.pAccountOffice   := LAccOffice6;      //  会計事務所名称

				pTitleName.Caption			   := '科目連想登録リスト(摘要コード順)';
				pTitleName.Left				   := 4.6354;
				pTitleLine.Width			   := 4;
				pTitleLine.Left				   := 4.6354;

				m_cPrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\科目連想登録ﾘｽﾄ(摘要ｺｰﾄﾞ順).csv';
			end
			else
			begin
//------------------------------------------------------------------------------HIS0022Start
				m_cPrnSupport.ApRB 			   := RReport6;
				m_cPrnSupport.strDocName       := '科目連想登録リスト(摘要連想順)';
			    m_cPrnSupport.pPage            := SVppPage6;        //  ページ
				m_cPrnSupport.pDate            := SVppDate6;        //  日付
			    m_cPrnSupport.pCorpCode        := LCorpCode6;       //  会社コード
			    m_cPrnSupport.pCorpName        := LCorpName6;       //  会社名称
			    m_cPrnSupport.pAccountOffice   := LAccOffice6;      //  会計事務所名称

				pTitleName.Caption			   := '科目連想登録リスト(摘要連想順)';
				pTitleName.Left				   := 4.7604;
				pTitleLine.Width			   := 3.75;
				pTitleLine.Left				   := 4.7604;

				m_cPrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\科目連想登録ﾘｽﾄ(摘要連想順).csv';
//------------------------------------------------------------------------------HIS0022End
			end;
		end
//------------------------------------------------------------------------------HIS0018End

		else if	(cDialog.iPrint = 6) then
		begin
			m_cPrnSupport.ApRB				:= CmnReportKanaOrder;
			m_cPrnSupport.strDocName		:= '固定摘要一覧表';
			m_cPrnSupport.pPage				:= CmnReportKanaOrderSysVarPage;			// 頁
			m_cPrnSupport.pDate				:= CmnReportKanaOrderSysVarDate;			// 日付
			m_cPrnSupport.pCorpCode			:= CmnReportKanaOrderLabelCorpCode;			// 会社ｺｰﾄﾞ
			m_cPrnSupport.pCorpName			:= CmnReportKanaOrderLabelCorpName;			// 会社名称
			m_cPrnSupport.pAccountOffice	:= CmnReportKanaOrderDepAccOffice;			// 会計事務所名称

			m_cPrnSupport.strFileName	:= rcCOMMONAREA (m_pRec^.m_pCommonArea^).SysCliRoot + '\tmp\固定摘要一覧表.csv';
		end;

		m_cPrnSupport.pComArea 	:=	m_pRec^.m_pCommonArea;
        m_cPrnSupport.iDspFileBtn  := 1; // ファイル出力表示
        m_cPrnSupport.iSysCode    := m_pRec^.m_iSystemCode;
        m_cPrnSupport.iReportID   := CHECKLIST;
		m_cPrnSupport.MdataModule	:= m_cDataModule;
		m_cPrnSupport.iCalendarKbn	:= m_nDateFormatDivision + 1;

	    i := cDlgPrint.DoDLG (m_cPrnSupport);

    	if i > 0 then
	    begin
			if (m_cPreview.IsExistPreview )  and (m_cPrnSupport.iCommand = PDLG_PREVIEW ) then
		    begin
				m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,1);
			    MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,stMessageRec.icontype,
										stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );

				cDlgPrint.Free ();

		        exit;
		    end;

			m_iDlg := cDialog.iPrint;

			if cDialog.iPrint = 0 then       //固定摘要登録リスト
			begin
				case m_cPrnSupport.iCommand of
			    	PDLG_PRINT:       PrintMem1 (cDlgPrint);
	   				PDLG_PREVIEW:     PrintMem1 (cDlgPrint);
					PDLG_FILE:
        	        begin
						PrintMem1 (cDlgPrint);
						SetFileOutTF(KOTEITEKIYOU,sTitle,sMemFld);
						if MjsFileOut(DPrintdxMemData1, sMemFld, sTitle, m_cPrnSupport, m_pRec) = -1 then
//						if DSet2CSV(DPrintdxMemData1, PrnSupport.strFileName) = -1 then
                        begin
    						//	ファイル出力大失敗
							m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
					    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,stMessageRec.icontype,
											stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
                        end;
					end;
				end;
			end
			else if cDialog.iPrint = 1 then  //仕訳辞書摘要登録リスト
			begin
            	case m_cPrnSupport.iCommand of
				    PDLG_PRINT:       PrintMem2 (cDlgPrint);
	   				PDLG_PREVIEW:     PrintMem2 (cDlgPrint);
        	        PDLG_FILE:
        	        begin
						PrintMem2 (cDlgPrint);
						SetFileOutTF(SHIEAKE,sTitle,sMemFld);
						if MjsFileOut(DPrintdxMemData2, sMemFld, sTitle, m_cPrnSupport, m_pRec) = -1 then
//						if DSet2CSV(DPrintdxMemData2, PrnSupport.strFileName) = -1 then
                        begin
                            //	ファイル出力大失敗
							m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
					    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,stMessageRec.icontype,
											stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
						end;
					end;
				end;
			end
			else if cDialog.iPrint = 2 then  //固定摘要分類登録リスト
			begin
				case m_cPrnSupport.iCommand of
				    PDLG_PRINT:       PrintMem3 (cDlgPrint);
   					PDLG_PREVIEW:     PrintMem3 (cDlgPrint);
					PDLG_FILE:
        	        begin
						PrintMem3 (cDlgPrint);
						SetFileOutTF(TEKIYOUBUNRUI,sTitle,sMemFld);
						if MjsFileOut(DPrintdxMemData3, sMemFld, sTitle, m_cPrnSupport, m_pRec) = -1 then
//						if DSet2CSV(DPrintdxMemData3, PrnSupport.strFileName) = -1 then
                        begin
                            //	ファイル出力大失敗
							m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
					    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,stMessageRec.icontype,
											stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
                        end;
					end;
				end;
	        end
			else if cDialog.iPrint = 3 then  //固定摘要体系登録リスト
			begin
            	case m_cPrnSupport.iCommand of
				    PDLG_PRINT:       PrintMem4 (cDlgPrint);
   					PDLG_PREVIEW:     PrintMem4 (cDlgPrint);
					PDLG_FILE:
        	        begin
						PrintMem4 (cDlgPrint);
						SetFileOutTF(TEKIYOUTAIKEI,sTitle,sMemFld);
						if MjsFileOut(DPrintdxMemData4, sMemFld, sTitle, m_cPrnSupport, m_pRec) = -1 then
//						if DSet2CSV(DPrintdxMemData4, PrnSupport.strFileName) = -1 then
                        begin
                            //	ファイル出力大失敗
							m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
					    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,stMessageRec.icontype,
											stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
                        end;
					end;
				end;
	        end
            else if cDialog.iPrint = 4 then  //科目連想登録リスト(科目順)
			begin
            	case m_cPrnSupport.iCommand of
				    PDLG_PRINT:       PrintMem5 (cDlgPrint);
   					PDLG_PREVIEW:     PrintMem5 (cDlgPrint);
					PDLG_FILE:
        	        begin
						PrintMem5 (cDlgPrint);
						SetFileOutTF(KAMOKURENSOU1,sTitle,sMemFld);
						if MjsFileOut(DPrintdxMemData5, sMemFld, sTitle, m_cPrnSupport, m_pRec) = -1 then
//						if DSet2CSV(DPrintdxMemData5, PrnSupport.strFileName) = -1 then
                        begin
                            //	ファイル出力大失敗
							m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
					    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,stMessageRec.icontype,
											stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
                        end;
   					end;
				end;
	        end
//------------------------------------------------------------------------------//HIS0018Start
			else if	(cDialog.iPrint = 5) then	//科目連想登録リスト(摘要順)
			begin
				case m_cPrnSupport.iCommand of
				    PDLG_PRINT:       PrintMem6 (cDlgPrint,0);
					PDLG_PREVIEW:     PrintMem6 (cDlgPrint,0);
					PDLG_FILE:
       	    	    begin
						PrintMem6 (cDlgPrint,1);
						SetFileOutTF(KAMOKURENSOU3,sTitle,sMemFld);
						if MjsFileOut(DPrintdxMemData6, sMemFld, sTitle, m_cPrnSupport, m_pRec) = -1 then
   	                    begin
       	                    //	ファイル出力大失敗
							m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
					    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,stMessageRec.icontype,
											stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
                       	end;
   					end;
				end;
			end
//------------------------------------------------------------------------------//HIS0018End
			else if	(cDialog.iPrint = 6) then	// 固定摘要一覧表
			begin
				if	((m_cPrnSupport.iCommand = PDLG_PRINT) or (m_cPrnSupport.iCommand = PDLG_PREVIEW)) then
					fnPrintKanaOrder (cDlgPrint)
				else if	(m_cPrnSupport.iCommand = PDLG_FILE) then
				begin
					fnPrintKanaOrder (cDlgPrint);

					SetFileOutTF (KANAORDER, sTitle, sMemFld);

					if	(MjsFileOut (CmnMemDataPrintKanaOrder, sMemFld, sTitle, m_cPrnSupport, m_pRec) = -1) then
					begin
						m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10040, 3);
						MjsMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle, stMessageRec.icontype,
												stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);
					end;
				end;
			end;
    	end;
	end;

	DPrintdxMemData1.Close;
	DPrintdxMemData2.Close;
	DPrintdxMemData3.Close;
	DPrintdxMemData4.Close;
	DPrintdxMemData5.Close;
	DPrintdxMemData6.Close;

	cDialog.Free;
	Qry.Free;

	cDlgPrint.Free ();
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   FileOut
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.FileOut;
var
	stMessageRec: TMJSMsgRec;

begin
	if m_iDlg = 0 then
    begin
		if DSet2CSV(DPrintdxMemData1, m_cPrnSupport.strFileName) = -1 then
        begin
			//	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,
							stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
	else if m_iDlg = 1 then
    begin
        if DSet2CSV(DPrintdxMemData2, m_cPrnSupport.strFileName) = -1 then
        begin
			//	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,
							stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
	else if m_iDlg = 2 then
    begin
		if DSet2CSV(DPrintdxMemData3, m_cPrnSupport.strFileName) = -1 then
        begin
            //	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,
							stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
	else if m_iDlg = 3 then
    begin
		if DSet2CSV(DPrintdxMemData4, m_cPrnSupport.strFileName) = -1 then
        begin
            //	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,
							stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
	else if m_iDlg = 4 then
    begin
		if DSet2CSV(DPrintdxMemData5, m_cPrnSupport.strFileName) = -1 then
        begin
            //	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,
							stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
//------------------------------------------------------------------------------HIS0018Start
	else if m_iDlg = 5 then
    begin
		if DSet2CSV(DPrintdxMemData6, m_cPrnSupport.strFileName) = -1 then
        begin
            //	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,
							stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
//------------------------------------------------------------------------------HIS0018End
	else if	(m_iDlg = 6) then
	begin
		if	(DSet2CSV (CmnMemDataPrintKanaOrder, m_cPrnSupport.strFileName) = -1) then
		begin
			m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10040, 3);
			MJSMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle,
						stMessageRec.icontype, stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);
		end;
	end;
end;
*)
//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   BeforePrint
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure TJNTCRP020000f.BeforePrint(Sender: TObject);
begin
	m_cPrnSupport.BeforePrint(Sender);
end;
//<HIS0078 start>
(*
//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   PrintMem1
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.PrintMem1 (cDlgPrint: TMJSPrnDlgf);
var
	stMessageRec: TMJSMsgRec;
	DQuery   : TMQuery;
begin
	DQuery := TMQuery.Create( Self );              //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DQuery );    //  DBとMQueryの接続

    DPrintdxMemData1.Close();
	DPrintdxMemData1.Open;

	//固定摘要登録リスト
	if m_iHnSitei = 0 then
	begin
        DQuery.Close;
		DQuery.SQL.Clear;
		DQuery.SQL.Add('select MA.Gcode,MA.RenChar,MA.TekiChar, ');
		DQuery.SQL.Add('MA.ExgKbn,MA.BunCode,MA.ZanKbn,MA.UpdateTime,F.FusenKbn, ');
		DQuery.SQL.Add('Sw.StaxKbn,Sw.StaxCode,Sw.StaxRate,Sw.TypeCode from TekiMA MA ');
        DQuery.SQL.Add('Left Outer Join MFusenInfo F On (MA.Ncode = F.NCode ');
		DQuery.SQL.Add('and MA.MasterKbn = F.MasterKbn) ');
		DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.Gcode = Sw.Gcode ');
		DQuery.SQL.Add('and MA.Masterkbn = Sw.MasterKbn) ');
		DQuery.SQL.Add('where MA.Sumkbn = 0 and MA.RDelkbn = 0 ');
		if m_iJnSitei = 0 then
			DQuery.SQL.Add('Order By MA.Gcode')
		else
			DQuery.SQL.Add('Order By MA.Renso');
		DQuery.Open;
	end
	else if m_iHnSitei = 1 then
	begin
		DQuery.Close;
		DQuery.SQL.Clear;
		DQuery.SQL.Add('select MA.Gcode,MA.RenChar,MA.TekiChar, ');
		DQuery.SQL.Add('MA.ExgKbn,MA.BunCode,MA.ZanKbn,MA.UpdateTime,F.FusenKbn, ');
		DQuery.SQL.Add('Sw.StaxKbn,Sw.StaxCode,Sw.StaxRate,Sw.TypeCode from TekiMA MA ');
// HIS0029        DQuery.SQL.Add('Left Outer Join MFusenInfo F On (MA.Gcode = F.KmkCode ');
        DQuery.SQL.Add('Left Outer Join FX_MFusenInfo F On (MA.Gcode = F.NCode ');  // HIS0029
		DQuery.SQL.Add('and MA.MasterKbn = F.MasterKbn) ');
		DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.Gcode = Sw.Gcode ');
		DQuery.SQL.Add('and MA.Masterkbn = Sw.MasterKbn) ');
		DQuery.SQL.Add('where MA.Sumkbn = 0 and MA.Recordkbn = 0 ');
		DQuery.SQL.Add('and MA.Gcode >= :Sta and MA.Gcode <= :End');
		DQuery.ParamByName('Sta').AsInteger := m_iKaisi;
		DQuery.ParamByName('End').AsInteger := m_iOwari;
		if m_iJnSitei = 0 then
			DQuery.SQL.Add('Order By MA.Gcode')
		else
			DQuery.SQL.Add('Order By MA.RenChar');
		DQuery.Open
	end;

	while (not DQuery.Eof) do
	begin
		DPrintdxMemData1.Append;
   	    DPrintdxMemData1.FieldByName('Gcode').AsInteger    := DQuery.GetFld('Gcode').AsInteger;
		DPrintdxMemData1.FieldByName('RenChar').AsString   := DQuery.GetFld('Renso').AsString;
		DPrintdxMemData1.FieldByName('TekiChar').AsString  := DQuery.GetFld('TekiChar').AsString;

   	   	case DQuery.GetFld('ZanKbn').AsInteger of
    	   	0 : DPrintdxMemData1.FieldByName('ZanKbn').AsString    := '';//'なし';
   	    	1 : DPrintdxMemData1.FieldByName('ZanKbn').AsString    := 'あり';
		end;

		if DQuery.GetFld('ExgKbn').AsInteger = 0 then
		begin
   			DPrintdxMemData1.FieldByName('ExgKbn').AsString := '';//'なし';
            DPrintdxMemData1.FieldByName('BunCode').AsString := '';
		end
		else
		begin
			case (DQuery.FieldByName ('ExgKbn').AsInteger) of
   		       	 0 : DPrintdxMemData1.FieldByName('ExgKbn').AsString := '';
				22 : DPrintdxMemData1.FieldByName('ExgKbn').AsString := '取引先';
				23 : DPrintdxMemData1.FieldByName('ExgKbn').AsString := '得意先';
				24 : DPrintdxMemData1.FieldByName('ExgKbn').AsString := '仕入先';
	        end;

			case DQuery.GetFld('BunCode').AsInteger of
				0 : DPrintdxMemData1.FieldByName('BunCode').AsString := 'その他一般';
				1 : DPrintdxMemData1.FieldByName('BunCode').AsString := '連結子会社';
				2 : DPrintdxMemData1.FieldByName('BunCode').AsString := '非連結子会社';
				3 : DPrintdxMemData1.FieldByName('BunCode').AsString := '関連会社';
			end;
		end;
   	    DPrintdxMemData1.FieldByName('UpdateTime').AsDateTime := DQuery.GetFld('UpdateTime').AsDateTime;

   	    case DQuery.GetFld('StaxKbn').AsInteger of
			0 : DPrintdxMemData1.FieldByName('StaxKbn').AsString := '';//'なし';
			1 : DPrintdxMemData1.FieldByName('StaxKbn').AsString := '売上';
			2 : DPrintdxMemData1.FieldByName('StaxKbn').AsString := '仕入';
		end;

		if DQuery.GetFld('StaxCode').AsInteger = 0 then
//		if DQuery.GetFld('StaxKbn').AsInteger = 0 then
		begin
//	    	DPrintdxMemData1.FieldByName('StaxCode').AsInteger := 0;
   			DPrintdxMemData1.FieldByName('StaxRate').AsString  := '';
	    	DPrintdxMemData1.FieldByName('TypeCode').AsString  := '';
       	end
		else
		begin
			DPrintdxMemData1.FieldByName('StaxCode').AsInteger  := DQuery.GetFld('StaxCode').AsInteger;

	        case DQuery.GetFld('StaxRate').AsInteger of
		        0 : DPrintdxMemData1.FieldByName('StaxRate').AsString := '';
				1 : DPrintdxMemData1.FieldByName('StaxRate').AsString := '３％';
				2 : DPrintdxMemData1.FieldByName('StaxRate').AsString := '５％';
			end;

			case DQuery.GetFld('TypeCode').AsInteger of
   		        0 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '';
				1 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '第１';
				2 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '第２';
				3 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '第３';
				4 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '第４';
				5 : DPrintdxMemData1.FieldByName('TypeCode').AsString := '第５';
			end;
		end;

		if	(DQuery.GetFLD('FusenKbn').AsInteger = 0) then								// 付箋区分
			TGraphicField (DPrintdxMemData1.FieldByName ('Fusen')).Clear
		else
			TGraphicField (DPrintdxMemData1.FieldByName ('Fusen')).AsSign (fnGetTagColorBitmap (DQuery.GetFld ('FusenKbn').AsInteger));

   		DPrintdxMemData1.Post;
		DQuery.Next;
	end;

	if (m_cPrnSupport.iCommand = PDLG_PREVIEW) then
    begin
		m_cPreview. Exec(  m_cPrnSupport, cDlgPrint, FileOut)
    end
    else if (m_cPrnSupport.iCommand = PDLG_FILE) then
    begin
        if DSet2CSV(DPrintdxMemData1, m_cPrnSupport.strFileName) = -1 then
        begin
            //	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,stMessageRec.icontype,
							stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
	else
    begin
       RReport1.Print;
    end;

	DQuery.Close;
	DQuery.Free;

    DPrintDataSource1.DataSet := DPrintdxMemData1;
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   PrintMem2
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.PrintMem2 (cDlgPrint: TMJSPrnDlgf);
var
	stMessageRec	:	TMJSMsgRec;
	DQuery			:	TMQuery;
	DHQuery			:	TMQuery;

	nSubKmk			:	Integer;
	nBumon			:	Integer;
	nSegmnt			:	Integer;
	nHojo01			:	Integer;
	nHojo02			:	Integer;
	nKouji			:	Integer;
	strCode			:	String;
	strName			:	String;

	iFieldIndex		:	Integer;
	sarFieldName	:	array [0..2] of String;

	////////////////////////////////////////////////////////////
	procedure SetAttr(iDbCr,index,iCodeAttr: Integer);
	var
		tAlign:TAlignment;
	begin
		case	iCodeAttr	of
			2:		tAlign	:= taLeftJustify;
			else	tAlign	:= taRightJustify;
		end;
		case	iDbCr	of
			0:	begin
					case	index	of
						0:	ppDBText98.Alignment	:= tAlign;
						1:	ppDBText99.Alignment	:= tAlign;
						2:	ppDBText101.Alignment	:= tAlign;
					end;
				end;
			else
				begin
					case	index	of
						0:	ppDBText100.Alignment	:= tAlign;
						1:	ppDBText104.Alignment	:= tAlign;
						2:	ppDBText105.Alignment	:= tAlign;
					end;
				end;
		end;
	end;
begin
	//仕訳辞書登録リスト	MQueryの構築	DBとMQueryの接続
	DQuery		:=	TMQuery.Create( Self );	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DQuery );
	DHQuery		:=	TMQuery.Create( Self );	m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DHQuery );

    DPrintdxMemData2.Close();
	DPrintdxMemData2.Open();

	if m_iHnSitei = 0 then
	begin
		DQuery.Close;
		DQuery.SQL.Clear;
		DQuery.SQL.Add('select MA.Gcode,MA.RenChar,MA.TekiChar,MA.ExgKbn,MA.BunCode, ');

		DQuery.SQL.Add('MA.BusDicKbn,');

		DQuery.SQL.Add('MA.Zankbn,MA.UpdateTime,F.Fusenkbn,Sw.Staxkbn,Sw.StaxCode, ');

//20030520	khattori
		DQuery.SQL.Add('Sw.DKmkKbn, Sw.DSubKbn, Sw.DBmnKbn, Sw.DSeg1Kbn, Sw.DHojyo1Kbn, Sw.DHojyo2Kbn, Sw.DKojKbn, Sw.DKsyKbn, ');
		DQuery.SQL.Add('Sw.CKmkKbn, Sw.CSubKbn, Sw.CBmnKbn, Sw.CSeg1Kbn, Sw.CHojyo1Kbn, Sw.CHojyo2Kbn, Sw.CKojKbn, Sw.CKsyKbn, ');

		DQuery.SQL.Add('Sw.StaxRate,Sw.TypeCode,Sw.DKmkCode,Sw.DSubCode,Sw.DBmnCode, ');
		DQuery.SQL.Add('Sw.DSeg1Code,Sw.DHojyo1Code,Sw.DHojyo2Code,Sw.DKojCode,Sw.DKsyCode, ');
		DQuery.SQL.Add('Sw.CKmkCode,Sw.CSubCode,Sw.CBmnCode,Sw.CSeg1Code, ');
		DQuery.SQL.Add('Sw.CHojyo1Code,Sw.CHojyo2Code,Sw.CKojCode,Sw.CKsyCode from TekiMA MA ');
// HIS0029		DQuery.SQL.Add('Left Outer Join MFusenInfo F On (MA.Gcode = F.KmkCode ');
        DQuery.SQL.Add('Left Outer Join FX_MFusenInfo F On (MA.Gcode = F.NCode ');  // HIS0029
		DQuery.SQL.Add('and MA.MasterKbn = F.MasterKbn) ');
		DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.Gcode = Sw.Gcode ');
        DQuery.SQL.Add('and MA.MasterKbn = Sw.MasterKbn ) ');
		DQuery.SQL.Add('where MA.Sumkbn = 0 and MA.Recordkbn = 0 ');
        DQuery.SQL.Add('and MA.SwDicKbn = 1 ');
		if m_iJnSitei = 0 then
			DQuery.SQL.Add('Order By MA.Gcode')
        else
			DQuery.SQL.Add('Order By MA.RenChar');
		DQuery.Open;
	end
	else
	begin
    	DQuery.Close;
		DQuery.SQL.Clear;
		DQuery.SQL.Add('select MA.Gcode,MA.RenChar,MA.TekiChar,MA.Exgkbn,MA.BunCode, ');

		DQuery.SQL.Add('MA.BusDicKbn,');

		DQuery.SQL.Add('MA.Zankbn,MA.UpdateTime,F.FusenKbn,Sw.DKmkCode,Sw.DSubCode, ');

//20030520	khattori
		DQuery.SQL.Add('Sw.DKmkKbn, Sw.DSubKbn, Sw.DBmnKbn, Sw.DSeg1Kbn, Sw.DHojyo1Kbn, Sw.DHojyo2Kbn, Sw.DKojKbn, Sw.DKsyKbn, ');
		DQuery.SQL.Add('Sw.CKmkKbn, Sw.CSubKbn, Sw.CBmnKbn, Sw.CSeg1Kbn, Sw.CHojyo1Kbn, Sw.CHojyo2Kbn, Sw.CKojKbn, Sw.CKsyKbn, ');

        DQuery.SQL.Add('Sw.StaxKbn,Sw.StaxCode,Sw.StaxRate,Sw.TypeCode, ');
		DQuery.SQL.Add('Sw.DBmnCode,Sw.DSeg1Code,Sw.DHojyo1Code,Sw.DHojyo2Code, ');
		DQuery.SQL.Add('Sw.DKojCode,Sw.DKsyCode,Sw.CKmkCode,Sw.CSubCode,Sw.CBmnCode,Sw.CSeg1Code, ');
		DQuery.SQL.Add('Sw.CHojyo1Code,Sw.CHojyo2Code,Sw.CKojCode,Sw.CKsyCode from TekiMA MA ');
// HIS0029		DQuery.SQL.Add('Left Outer Join MFusenInfo F On (MA.Gcode = F.KmkCode ');
        DQuery.SQL.Add('Left Outer Join FX_MFusenInfo F On (MA.Gcode = F.NCode ');  // HIS0029
		DQuery.SQL.Add('and MA.MasterKbn = F.MasterKbn) ');
		DQuery.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.Gcode = Sw.Gcode ');
		DQuery.SQL.Add('and MA.MasterKbn = Sw.Masterkbn ) ');
		DQuery.SQL.Add('where MA.Sumkbn = 0 and MA.Recordkbn = 0 ');
		DQuery.SQL.Add('and MA.Gcode >= :Sta and MA.Gcode <= :End ');
        DQuery.SQL.Add('and MA.SwDicKbn = 1 ');
		DQuery.ParamByName('Sta').AsInteger := m_iKaisi;
		DQuery.ParamByName('End').AsInteger := m_iOwari;
		if m_iJnSitei = 0 then
			DQuery.SQL.Add('Order By MA.Gcode')
		else
			DQuery.SQL.Add('Order By MA.RenChar');
		DQuery.Open;
	end;

    while (not DQuery.Eof) do
	begin
		DPrintdxMemData2.Append ();

		if	(DQuery.FieldByName ('FusenKbn').AsInteger = 0) then						// 付箋区分
			TGraphicField (DPrintdxMemData2.FieldByName ('Fusen')).Clear
		else
			TGraphicField (DPrintdxMemData2.FieldByName ('Fusen')).AsSign (fnGetTagColorBitmap (DQuery.GetFld ('FusenKbn').AsInteger));

		DPrintdxMemData2.FieldByName ('Gcode'   ).AsInteger	:= DQuery.FieldByName ('Gcode'   ).AsInteger;
		DPrintdxMemData2.FieldByName ('RenChar' ).AsString	:= DQuery.FieldByName ('RenChar' ).AsString;
		DPrintdxMemData2.FieldByName ('TekiChar').AsString	:= DQuery.FieldByName ('TekiChar').AsString;

		case (DQuery.FieldByName ('ZanKbn').AsInteger) of
			0:	DPrintdxMemData2.FieldByName ('ZanKbn').AsString	:= 'なし';
			1:	DPrintdxMemData2.FieldByName ('ZanKbn').AsString	:= 'あり';
		end;

		DPrintdxMemData2.FieldByName ('UpdateTime').AsDateTime	:= DQuery.FieldByName ('UpdateTime').AsDateTime;

		//	部署伝票辞書は消費税区分なし？
		if	(DQuery.FieldByName ('BusDicKbn').AsInteger = 0) then

		case (DQuery.FieldByName ('StaxKbn').AsInteger) of
			0:	DPrintdxMemData2.FieldByName ('StaxKbn').AsString	:= 'なし';//'';
			1:	DPrintdxMemData2.FieldByName ('StaxKbn').AsString	:= '売上';
			2:	DPrintdxMemData2.FieldByName ('StaxKbn').AsString	:= '仕入';
		end;

		if	(DQuery.FieldByName ('STaxCode').AsInteger = 0) then
//		if	(DQuery.FieldByName ('STaxKbn').AsInteger = 0) then
		begin
			DPrintdxMemData2.FieldByName ('STaxCode').Clear ();
			DPrintdxMemData2.FieldByName ('STaxRate').AsString	:= '';
			DPrintdxMemData2.FieldByName ('TypeCode').AsString	:= '';
        end
		else
		begin
			if	(DQuery.FieldByName ('STaxCode').AsInteger <> 0) then
				DPrintdxMemData2.FieldByName ('STaxCode').AsInteger	:= DQuery.FieldByName ('STaxCode').AsInteger
			else
				DPrintdxMemData2.FieldByName ('STaxCode').Clear ();

	        case DQuery.GetFld('StaxRate').AsInteger of
 		        0 : DPrintdxMemData2.FieldByName('StaxRate').AsString := '';
				1 : DPrintdxMemData2.FieldByName('StaxRate').AsString := '３％';
				2 : DPrintdxMemData2.FieldByName('StaxRate').AsString := '５％';
			end;

			case (DQuery.FieldByName ('TypeCode').AsInteger) of
                0:	DPrintdxMemData2.FieldByName ('TypeCode').AsString	:= '';
				1:	DPrintdxMemData2.FieldByName ('TypeCode').AsString	:= '第1種';
				2:	DPrintdxMemData2.FieldByName ('TypeCode').AsString	:= '第2種';
				3:	DPrintdxMemData2.FieldByName ('TypeCode').AsString	:= '第3種';
				4:	DPrintdxMemData2.FieldByName ('TypeCode').AsString	:= '第4種';
				5:	DPrintdxMemData2.FieldByName ('TypeCode').AsString	:= '第5種';
			end;
		end;

		sarFieldName[0]	:=	'Bmn';
		sarFieldName[1]	:=	'Seg';
		sarFieldName[2]	:=	'Hojyo1';

   		//借方　科目コード
		if	((DQuery.FieldByName ('DKmkCode').IsNull) or (DQuery.GetFld('DKmkCode').AsInteger = 0)) then
        begin
			DPrintdxMemData2.FieldByName ('DKmkCode').Clear ();
			DPrintdxMemData2.FieldByName ('DSubCode').Clear ();

            DPrintdxMemData2.FieldByName ('DBmnCode'   ).AsString	:= '';
			DPrintdxMemData2.FieldByName ('DSegCode'   ).AsString	:= '';
			DPrintdxMemData2.FieldByName ('DHojyo1Code').AsString	:= '';
			DPrintdxMemData2.FieldByName ('DHojyo2Code').AsString	:= '';
			DPrintdxMemData2.FieldByName ('DKojCode'   ).AsString	:= '';
			DPrintdxMemData2.FieldByName ('DKmkName'   ).AsString	:= '';
            DPrintdxMemData2.FieldByName ('DSubName'   ).AsString	:= '';
			DPrintdxMemData2.FieldByName ('DBmnName'   ).AsString	:= '';
			DPrintdxMemData2.FieldByName ('DSegName'   ).AsString	:= '';
			DPrintdxMemData2.FieldByName ('DHojyo1Name').AsString	:= '';
			DPrintdxMemData2.FieldByName ('DHojyo2Name').AsString	:= '';
            DPrintdxMemData2.FieldByName ('DKojName'   ).AsString	:= '';

			//	部署伝票辞書で置換の時
			if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
				(DQuery.FieldByName ('DKmkKbn')		.AsInteger = 1)	then
					DPrintdxMemData2.FieldByName ('DKmkName'   ).AsString	:= '置換科目';
		end
		else
		begin
			iFieldIndex		:=	0;

			//借方　科目コード
            DPrintdxMemData2.FieldByName ('DKmkCode').AsInteger	:= DQuery.GetFld('DKmkCode').AsInteger;

			DHQuery.Close ();
			DHQuery.SQL.Clear ();
			DHQuery.SQL.Add	('select SimpleName, SubKmkUse, BmnUse, SegUse1, HojyoUse1, HojyoUse2, KoujiUse FROM KmkMA ');
//			DHQuery.SQL.Add	('select SimpleName, HojyoUse1, HojyoUse2 FROM KmkMA ');
			DHQuery.SQL.Add	('where Gcode = :nExCode AND MasterKbn = 1 AND SumKbn = 0 AND RecordKbn = 0');
			DHQuery.ParamByName('nExCode').AsInteger := DQuery.FieldByName('DKmkCode').AsInteger;
			DHQuery.Open ();

			DPrintdxMemData2.FieldByName ('DKmkName').AsString	:= DHQuery.FieldByName ('SimpleName').AsString;

			nSubKmk	:=	DHQuery.FieldByName ('SubKmkUse').AsInteger;
			nBumon	:=	DHQuery.FieldByName ('BmnUse'	).AsInteger;
			nSegmnt	:=	DHQuery.FieldByName ('SegUse1'	).AsInteger;
			nHojo01	:=	DHQuery.FieldByName ('HojyoUse1').AsInteger;
			nHojo02	:=	DHQuery.FieldByName ('HojyoUse2').AsInteger;
			nKouji	:=	DHQuery.FieldByName ('KoujiUse'	).AsInteger;

			// 借方細目コード
			if	nSubKmk	<>	0	then
			begin
				strCode		:=	'';
				strName		:=	'';

				SetAttr(0,iFieldIndex,0);

				//	部署伝票辞書で可変の時
				if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
					(DQuery.FieldByName ('DSubKbn')		.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else

				if	not	(DQuery.FieldByName ('DSubCode').IsNull) then
				begin
					DHQuery.Close ();
					DHQuery.SQL.Clear ();
					DHQuery.SQL.Add   ('SELECT SimpleName FROM KmkMA ');
					DHQuery.SQL.Add   ('WHERE  GCode = :nKmkCode AND SubCode = :nSubCode AND ');
					DHQuery.SQL.Add   ('       MasterKbn = 2 AND SumKbn = 0 AND RecordKbn = 0');

					DHQuery.ParamByName ('nKmkCode').AsInteger	:= DQuery.FieldByName ('DKmkCode').AsInteger;
					DHQuery.ParamByName ('nSubCode').AsInteger	:= DQuery.FieldByName ('DSubCode').AsInteger;

					DHQuery.Open ();

					if	not	(DHQuery.Eof) then
					begin
						strCode		:=	DQuery.FieldByName ('DSubCode').AsString;;
						strName		:=	DHQuery.FieldByName ('SimpleName').AsString;
					end;
				end;

				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

			// 借方　部門コード
			if	nBumon	<>	0	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('DBmnKbn')		.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('DBmnKbn')		.AsInteger = 2)	then
						strName	:= '当該マスタ'
				else
				begin

				fnGetMasterInfoData	(MASTER_SECTION);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('DBmnCode').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(0,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strBmnCode AND MasterKbn = 41 AND SumKbn = 0 AND RecordKbn = 0');
				DHQuery.ParamByName ('strBmnCode').AsString	:= DQuery.FieldByName ('DBmnCode').AsString;
				DHQuery.Open ();

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

			// 借方　セグメントコード
			if	nSegmnt	<>	0	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('DSeg1Kbn')	.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else
				begin

				fnGetMasterInfoData	(MASTER_SEGMENT01);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('DSeg1Code').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(0,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strSegCode AND MasterKbn = 42 AND SumKbn = 0 AND RecordKbn = 0');
				DHQuery.ParamByName ('strSegCode').AsString	:= DQuery.FieldByName ('DSeg1Code').AsString;
				DHQuery.Open ();

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

			// 借方　補助1コード
			if	(nHojo01<>0)	and	(iFieldIndex<3)	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('DHojyo1Kbn')	.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('DHojyo1Kbn')	.AsInteger = 2)	then
						strName	:= '当該マスタ'
				else
				begin

				// 得意先／仕入先
				if	((nHojo01 = MASTER_CUSTOMERPLUS01) or (nHojo01 = MASTER_CUSTOMERPLUS02))
				then	fnGetMasterInfoData	(MASTER_CUSTOMER)
				else	fnGetMasterInfoData	(nHojo01);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('DHojyo1Code').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(0,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strHojCode AND MasterKbn = :nMasterDivision AND ');
				DHQuery.SQL.Add   ('       SumKbn = 0 AND RecordKbn = 0');

				if	((nHojo01 = MASTER_CUSTOMERPLUS01) or							// 得意先
					 (nHojo01 = MASTER_CUSTOMERPLUS02)) then						// 仕入先
				begin
					if	(nHojo01 = MASTER_CUSTOMERPLUS01) then
						DHQuery.SQL.Add (' AND HojyoKbn1 = 1')
					else if	(nHojo01 = MASTER_CUSTOMERPLUS02) then
						DHQuery.SQL.Add (' AND HojyoKbn2 = 1');

					DHQuery.ParamByName ('nMasterDivision').AsInteger	:= MASTER_CUSTOMER;
				end
				else
					DHQuery.ParamByName ('nMasterDivision').AsInteger	:= nHojo01;

				DHQuery.ParamByName ('strHojCode').AsString	:= DQuery.FieldByName ('DHojyo1Code').AsString;

				DHQuery.Open ();

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

			// 借方　補助2コード
			if	(nHojo02<>0)	and	(iFieldIndex<3)	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('DHojyo2Kbn')	.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('DHojyo2Kbn')	.AsInteger = 2)	then
						strName	:= '当該マスタ'
				else
				begin

				// 得意先／仕入先
				if	((nHojo02 = MASTER_CUSTOMERPLUS01) or (nHojo02 = MASTER_CUSTOMERPLUS02))
				then	fnGetMasterInfoData	(MASTER_CUSTOMER)
				else	fnGetMasterInfoData	(nHojo02);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('DHojyo2Code').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(0,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strHojCode AND MasterKbn = :nMasterDivision AND ');
				DHQuery.SQL.Add   ('       SumKbn = 0 AND RecordKbn = 0');

				if	((nHojo02 = MASTER_CUSTOMERPLUS01) or							// 得意先
					 (nHojo02 = MASTER_CUSTOMERPLUS02)) then						// 仕入先
				begin
					if	(nHojo02 = MASTER_CUSTOMERPLUS01) then
						DHQuery.SQL.Add (' AND HojyoKbn1 = 1')
					else if	(nHojo02 = MASTER_CUSTOMERPLUS02) then
						DHQuery.SQL.Add (' AND HojyoKbn2 = 1');

					DHQuery.ParamByName ('nMasterDivision').AsInteger	:= MASTER_CUSTOMER;
				end
				else
					DHQuery.ParamByName ('nMasterDivision').AsInteger	:= nHojo02;

				DHQuery.ParamByName ('strHojCode').AsString	:= DQuery.FieldByName ('DHojyo2Code').AsString;
				DHQuery.Open ();

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

			// 借方　工事コード
			if	(nKouji<>0)	and	(iFieldIndex<3)	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('DKojKbn')		.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('DKojKbn')		.AsInteger = 2)	then
						strName	:= '当該マスタ'
				else
				begin

				fnGetMasterInfoData	(MASTER_CONSTRUCT);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('DKojCode').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(0,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strKojCode AND MasterKbn = 51 AND SumKbn = 0 AND RecordKbn = 0');
				DHQuery.ParamByName ('strKojCode').AsString	:= DQuery.FieldByName ('DKojCode').AsString;
				DHQuery.Open ();

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

			// 借方　工種コード
			if	(nKouji<>0)	and	(iFieldIndex<3)	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('DKsyKbn')		.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('DKsyKbn')		.AsInteger = 2)	then
						strName	:= '当該マスタ'
				else
				begin

				fnGetMasterInfoData	(MASTER_CONSTKIND);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('DKsyCode').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(0,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strKsyCode AND MasterKbn = 52 AND SumKbn = 0 AND RecordKbn = 0');
				DHQuery.ParamByName ('strKsyCode').AsString	:= DQuery.FieldByName ('DKsyCode').AsString;
				DHQuery.Open ();

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('D'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;
		end;

		// 貸方
		if	((DQuery.FieldByName ('CKmkCode').IsNull) or (DQuery.FieldByName ('CKmkCode').AsInteger = 0)) then
        begin
			DPrintdxMemData2.FieldByName('CKmkCode'		).Clear;
			DPrintdxMemData2.FieldByName('CSubCode'		).Clear;
			DPrintdxMemData2.FieldByName('CBmnCode'		).AsString	:=	'';
			DPrintdxMemData2.FieldByName('CSegCode'		).AsString	:=	'';
			DPrintdxMemData2.FieldByName('CHojyo1Code'	).AsString	:=	'';
			DPrintdxMemData2.FieldByName('CHojyo2Code'	).AsString	:=	'';
			DPrintdxMemData2.FieldByName('CKojCode'		).AsString	:=	'';
			DPrintdxMemData2.FieldByName('CKmkName'		).AsString	:=	'';
			DPrintdxMemData2.FieldByName('CSubName'		).AsString	:=	'';
			DPrintdxMemData2.FieldByName('CBmnName'		).AsString	:=	'';
			DPrintdxMemData2.FieldByName('CSegName'		).AsString	:=	'';
			DPrintdxMemData2.FieldByName('CHojyo1Name'	).AsString	:=	'';
			DPrintdxMemData2.FieldByName('CHojyo2Name'	).AsString	:=	'';
			DPrintdxMemData2.FieldByName('CKojName'		).AsString	:=	'';

			//	部署伝票辞書で置換の時
			if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
				(DQuery.FieldByName ('CKmkKbn')		.AsInteger = 1)	then
					DPrintdxMemData2.FieldByName ('CKmkName'   ).AsString	:= '置換科目';
		end
		else
		begin
			iFieldIndex		:=	0;

			//貸方　科目コード
            DPrintdxMemData2.FieldByName ('CKmkCode').AsInteger	:= DQuery.FieldByName ('CKmkCode').AsInteger;

            DHQuery.Close;
			DHQuery.SQL.Clear;
			DHQuery.SQL.Add	('select SimpleName, SubKmkUse, BmnUse, SegUse1, HojyoUse1, HojyoUse2, KoujiUse FROM KmkMA ');
//			DHQuery.SQL.Add	('select SimpleName, HojyoUse1, HojyoUse2 from KmkMA ');
       	    DHQuery.SQL.Add	('where Gcode = :nExCode and MasterKbn = 1 and SumKbn = 0 and RecordKbn = 0');
            DHQuery.ParamByName('nExCode').AsInteger := DQuery.FieldByName('CKmkCode').AsInteger;
            DHQuery.Open;

   	        DPrintdxMemData2.FieldByName('CKmkName').AsString     := DHQuery.GetFld('SimpleName').AsString;

			nSubKmk	:=	DHQuery.FieldByName ('SubKmkUse').AsInteger;
			nBumon	:=	DHQuery.FieldByName ('BmnUse'	).AsInteger;
			nSegmnt	:=	DHQuery.FieldByName ('SegUse1'	).AsInteger;
			nHojo01	:=	DHQuery.FieldByName ('HojyoUse1').AsInteger;
			nHojo02	:=	DHQuery.FieldByName ('HojyoUse2').AsInteger;
			nKouji	:=	DHQuery.FieldByName ('KoujiUse'	).AsInteger;

			// 貸方細目コード
			if	nSubKmk	<>	0	then
			begin
				strCode		:=	'';
				strName		:=	'';

				SetAttr(1,iFieldIndex,0);

				//	部署伝票辞書で可変の時
				if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
					(DQuery.FieldByName ('CSubKbn')		.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else

				if	not	(DQuery.FieldByName ('CSubCode').IsNull) then
				begin
					DHQuery.Close ();
					DHQuery.SQL.Clear ();
					DHQuery.SQL.Add   ('SELECT SimpleName FROM KmkMA ');
					DHQuery.SQL.Add   ('WHERE  GCode = :nKmkCode AND SubCode = :nSubCode AND ');
					DHQuery.SQL.Add   ('       MasterKbn = 2 AND SumKbn = 0 AND RecordKbn = 0');

					DHQuery.ParamByName ('nKmkCode').AsInteger	:= DQuery.FieldByName ('CKmkCode').AsInteger;
					DHQuery.ParamByName ('nSubCode').AsInteger	:= DQuery.FieldByName ('CSubCode').AsInteger;

					DHQuery.Open ();

					if	not	(DHQuery.Eof) then
					begin
						strCode		:=	DQuery.FieldByName ('CSubCode').AsString;;
						strName		:=	DHQuery.FieldByName ('SimpleName').AsString;
					end;
				end;

				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

            // 貸方　部門コード
			if	nBumon	<>	0	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('CBmnKbn')		.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('CBmnKbn')		.AsInteger = 2)	then
						strName	:= '当該マスタ'
				else
				begin

				fnGetMasterInfoData	(MASTER_SECTION);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('CBmnCode').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(1,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strBmnCode AND MasterKbn = 41 AND SumKbn = 0 AND RecordKbn = 0');
				DHQuery.ParamByName ('strBmnCode').AsString	:= DQuery.FieldByName ('CBmnCode').AsString;
   				DHQuery.Open;

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

			// 貸方　セグメントコード
			if	nSegmnt	<>	0	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('CSeg1Kbn')	.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else
				begin

				fnGetMasterInfoData	(MASTER_SEGMENT01);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('CSeg1Code').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(1,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strSegCode AND MasterKbn = 42 AND SumKbn = 0 AND RecordKbn = 0');
				DHQuery.ParamByName ('strSegCode').AsString	:= DQuery.FieldByName ('CSeg1Code').AsString;
				DHQuery.Open ();

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

			// 貸方　補助1コード
			if	(nHojo01<>0)	and	(iFieldIndex<3)	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('CHojyo1Kbn')	.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('CHojyo1Kbn')	.AsInteger = 2)	then
						strName	:= '当該マスタ'
				else
				begin

				// 得意先／仕入先
				if	((nHojo01 = MASTER_CUSTOMERPLUS01) or (nHojo01 = MASTER_CUSTOMERPLUS02))
				then	fnGetMasterInfoData	(MASTER_CUSTOMER)
				else	fnGetMasterInfoData	(nHojo01);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('CHojyo1Code').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(1,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strHojCode AND MasterKbn = :nMasterDivision AND ');
				DHQuery.SQL.Add   ('       SumKbn = 0 AND RecordKbn = 0');

				if	((nHojo01 = MASTER_CUSTOMERPLUS01) or							// 得意先
					 (nHojo01 = MASTER_CUSTOMERPLUS02)) then						// 仕入先
				begin
					if	(nHojo01 = MASTER_CUSTOMERPLUS01) then
						DHQuery.SQL.Add (' AND HojyoKbn1 = 1')
					else if	(nHojo01 = MASTER_CUSTOMERPLUS02) then
						DHQuery.SQL.Add (' AND HojyoKbn2 = 1');

					DHQuery.ParamByName ('nMasterDivision').AsInteger	:= MASTER_CUSTOMER;
				end
				else
					DHQuery.ParamByName ('nMasterDivision').AsInteger	:= nHojo01;

				DHQuery.ParamByName ('strHojCode').AsString	:= DQuery.FieldByName ('CHojyo1Code').AsString;

				DHQuery.Open ();

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

			// 貸方　補助2コード
			if	(nHojo02<>0)	and	(iFieldIndex<3)	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('CHojyo2Kbn')	.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('CHojyo2Kbn')	.AsInteger = 2)	then
						strName	:= '当該マスタ'
				else
				begin

				// 得意先／仕入先
				if	((nHojo02 = MASTER_CUSTOMERPLUS01) or (nHojo02 = MASTER_CUSTOMERPLUS02))
				then	fnGetMasterInfoData	(MASTER_CUSTOMER)
				else	fnGetMasterInfoData	(nHojo02);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('CHojyo2Code').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(1,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strHojCode AND MasterKbn = :nMasterDivision AND ');
				DHQuery.SQL.Add   ('       SumKbn = 0 AND RecordKbn = 0');

				if	((nHojo02 = MASTER_CUSTOMERPLUS01) or							// 得意先
					 (nHojo02 = MASTER_CUSTOMERPLUS02)) then						// 仕入先
				begin
					if	(nHojo02 = MASTER_CUSTOMERPLUS01) then
						DHQuery.SQL.Add (' AND HojyoKbn1 = 1')
					else if	(nHojo02 = MASTER_CUSTOMERPLUS02) then
						DHQuery.SQL.Add (' AND HojyoKbn2 = 1');

					DHQuery.ParamByName ('nMasterDivision').AsInteger	:= MASTER_CUSTOMER;
				end
				else
					DHQuery.ParamByName ('nMasterDivision').AsInteger	:= nHojo02;

				DHQuery.ParamByName ('strHojCode').AsString	:= DQuery.FieldByName ('CHojyo2Code').AsString;
				DHQuery.Open ();

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

			// 貸方　工事コード
			if	(nKouji<>0)	and	(iFieldIndex<3)	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('CKojKbn')		.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('CKojKbn')		.AsInteger = 2)	then
						strName	:= '当該マスタ'
				else
				begin

				fnGetMasterInfoData	(MASTER_CONSTRUCT);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('CKojCode').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(1,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strKojCode AND MasterKbn = 51 AND SumKbn = 0 and RecordKbn = 0');
				DHQuery.ParamByName ('strKojCode').AsString	:= DQuery.FieldByName ('CKojCode').AsString;
				DHQuery.Open ();

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;

			// 貸方　工種コード
			if	(nKouji<>0)	and	(iFieldIndex<3)	then
			begin
				strCode		:=	'';
				strName		:=	'';

				//	部署伝票辞書で可変の時
				if		(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('CKsyKbn')		.AsInteger = 1)	then
						strName	:= '可変マスタ'
				else if	(DQuery.FieldByName ('BusDicKbn')	.AsInteger = 1)	and
						(DQuery.FieldByName ('CKsyKbn')		.AsInteger = 2)	then
						strName	:= '当該マスタ'
				else
				begin

				fnGetMasterInfoData	(MASTER_CONSTKIND);
				strCode	:= SetDspCodeAttr (DQuery.FieldByName ('CKsyCode').AsString,m_stCdAtSngl.nDigit, m_stCdAtSngl.nAttribute);
				SetAttr(1,iFieldIndex,m_stCdAtSngl.nAttribute);

				DHQuery.Close ();
				DHQuery.SQL.Clear ();
				DHQuery.SQL.Add   ('SELECT SimpleName FROM HojyoMA ');
				DHQuery.SQL.Add   ('WHERE  GCode = :strKsyCode AND MasterKbn = 52 AND SumKbn = 0 AND RecordKbn = 0');
				DHQuery.ParamByName ('strKsyCode').AsString	:= DQuery.FieldByName ('CKsyCode').AsString;
				DHQuery.Open ();

				strName	:= DHQuery.FieldByName ('SimpleName').AsString;

				end;

				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Code').AsString	:=	strCode;
				DPrintdxMemData2.FieldByName ('C'+sarFieldName[iFieldIndex]+'Name').AsString	:=	strName;
				inc(iFieldIndex);
			end;
		end;

		DPrintdxMemData2.Post ();

		DQuery.Next;
	end;

	if (m_cPrnSupport.iCommand = PDLG_PREVIEW) then
    begin
       m_cPreview. Exec(  m_cPrnSupport, cDlgPrint, FileOut)
    end
    else if (m_cPrnSupport.iCommand = PDLG_FILE) then
    begin
        if DSet2CSV(DPrintdxMemData2, m_cPrnSupport.strFileName) = -1 then
        begin
            //	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,stMessageRec.icontype,
							stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
	else
    begin
       RReport2.Print;
    end;

	DQuery.Close;
	DHQuery.Close;
	DQuery.Free;
	DHQuery.Free;
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   PrintMem3
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.PrintMem3 (cDlgPrint: TMJSPrnDlgf);
var
	stMessageRec: TMJSMsgRec;
	DQuery   : TMQuery;
begin
	//固定摘要分類リスト
    DQuery := TMQuery.Create( Self );              //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DQuery );    //  DBとMQueryの接続

	DPrintdxMemData3.Close();
	DPrintdxMemData3.Open;

	if m_iHnSitei = 0 then
	begin
        DQuery.Close;
		DQuery.SQl.Clear;
		DQuery.SQL.Add('select Gcode,RenChar,TekiChar,UpdateTime ');
		DQuery.SQL.Add('from TekiMA where MasterKbn = 61 and ');
   		DQuery.SQL.Add('SumKbn = 1 and RecordKbn = 0 ');
		if m_iJnSitei = 0 then
			DQuery.SQL.Add('Order By Gcode')
		else
            DQuery.SQL.Add('Order By RenChar');
		DQuery.Open;
	end
    else if m_iHnSitei = 1 then
	begin
        DQuery.Close;
		DQuery.SQl.Clear;
		DQuery.SQL.Add('select Gcode,RenChar,TekiChar,UpdateTime ');
		DQuery.SQL.Add('from TekiMA where MasterKbn = 61 and SumKbn = 1 ');
   		DQuery.SQL.Add('and RecordKbn = 0 ');
		DQuery.SQL.Add('and Gcode >= :Sta and Gcode <= :End ');
        DQuery.ParamByName('Sta').AsInteger := m_iKaisi;
		DQuery.ParamByName('End').AsInteger := m_iOwari;

		if m_iJnSitei = 0 then
			DQuery.SQL.Add('Order By Gcode')
		else
            DQuery.SQL.Add('Order By RenChar');
		DQuery.Open;
	end;

	while (DQuery.Eof <> true) do
	begin
        DPrintdxMemData3.Append;
		DPrintdxMemData3.FieldByName('Gcode').AsInteger   := DQuery.GetFld('Gcode').AsInteger;
		DPrintdxMemData3.FieldByName('TekiChar').AsString := DQuery.GetFld('TekiChar').AsString;
       	DPrintdxMemData3.FieldByName('RenChar').AsString  := DQuery.GetFld('RenChar').AsString;
		DPrintdxMemData3.FieldByName('UpDateTime').AsDateTime := DQuery.GetFld('UpdateTime').AsDateTime;
   	    DPrintdxMemData3.Post;
       	DQuery.Next;
	end;
	if (m_cPrnSupport.iCommand = PDLG_PREVIEW) then
    begin
        m_cPreview. Exec(  m_cPrnSupport, cDlgPrint, FileOut)
    end
    else if (m_cPrnSupport.iCommand = PDLG_FILE) then
    begin
        if DSet2CSV(DPrintdxMemData3, m_cPrnSupport.strFileName) = -1 then
        begin
            //	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,
							stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
	else
    begin
       RReport3.Print;
    end;

    DQuery.Close;
	DQuery.Free;
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   PrintMem4
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.PrintMem4 (cDlgPrint: TMJSPrnDlgf);
var
	stMessageRec: TMJSMsgRec;
	DQuery   	: TMQuery;
	DSQuery  	: TMQuery;
	iGcode   	: Integer;
	iCount      : Integer;
begin
	//固定摘要体系登録リスト
  	DQuery := TMQuery.Create( Self );              //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DQuery );    //  DBとMQueryの接続
    DSQuery := TMQuery.Create( Self );
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DSQuery );

    DPrintdxMemData4.Close();
	DPrintdxMemData4.Open;

    if m_iHnSitei = 0 then
	begin
        DQuery.Close;
		DQuery.SQl.Clear;
		DQuery.SQL.Add('select Gcode,TekiChar from TekiMA where MasterKbn = 61 ');
		DQuery.SQL.Add('and SumKbn = 1 and RecordKbn = 0 Order By Gcode');
		DQuery.Open;
	end
    else if m_iHnSitei = 1 then
	begin
        DQuery.Close;
		DQuery.SQl.Clear;
		DQuery.SQL.Add('select Gcode,TekiChar from TekiMA where MasterKbn = 61 and ');
		DQuery.SQL.Add('SumKbn = 1 and RecordKbn = 0 ');
		DQuery.SQL.Add('and Gcode >= :Sta and Gcode <= :End Order By Gcode');
        DQuery.ParamByName('Sta').AsInteger := m_iKaisi;
		DQuery.ParamByName('End').AsInteger := m_iOwari;
		DQuery.Open;
    end;

    while (DQuery.Eof <> true) do
	begin
		iCount := 0;
		iGcode := DQuery.GetFld('Gcode').AsInteger;

		DPrintdxMemData4.Append;
		DPrintdxMemData4.FieldByName('Gcode').AsInteger := iGcode;
		DPrintdxMemData4.FieldByName('BunName').AsString := DQuery.GetFld('TekiChar').AsString;

   		DSQuery.Close;
		DSQuery.SQL.Clear;
		DSQuery.SQL.Add('select Tree.BasedCode,MA.Gcode,MA.TekiChar from TekiTree Tree ');
		DSQuery.SQL.Add('Left Outer Join TekiMA MA On (Tree.SumCode = :iGcode ');
		DSQuery.SQL.Add('and MA.Masterkbn = Tree.Masterkbn and MA.Gcode = Tree.BasedCode) ');
		DSQuery.SQL.Add('where MA.Sumkbn = 0 and MA.RecordKbn = 0');
        DSQuery.ParamByName('iGcode').AsInteger := iGcode;
		DSQuery.Open;

		if DSQuery.GetFld('Gcode').AsInteger = 0 then
		begin
			DPrintdxMemData4.Post;
            DQuery.Next;
		end
		else
		begin
			while (not DSQuery.Eof) do
			begin
				if iCount = 0 then
				begin
        	   		DPrintdxMemData4.FieldByName('GcodeT').AsInteger := DSQuery.GetFld('Gcode').AsInteger;
					DPrintdxMemData4.FieldByName('TekiChar').AsString := DSQuery.GetFld('TekiChar').AsString;
					DPrintdxMemData4.Post;
					inc(iCount);
       			    DSQuery.Next;
				end
				else
				begin
	        	   	DPrintdxMemData4.Append;
    	   	    	DPrintdxMemData4.FieldByName('GcodeT').AsInteger := DSQuery.GetFld('Gcode').AsInteger;
					DPrintdxMemData4.FieldByName('TekiChar').AsString := DSQuery.GetFld('TekiChar').AsString;
					DPrintdxMemData4.Post;
	    	        DSQuery.Next;
   		    	end;
			end;
			DQuery.Next;
		end;
	end;
	if (m_cPrnSupport.iCommand = PDLG_PREVIEW) then
    begin
        m_cPreview. Exec(  m_cPrnSupport, cDlgPrint, FileOut)
    end
    else if (m_cPrnSupport.iCommand = PDLG_FILE) then
    begin
        if DSet2CSV(DPrintdxMemData4, m_cPrnSupport.strFileName) = -1 then
        begin
            //	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,
							stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
	else
    begin
       RReport4.Print;
    end;
end;

//************************************************************************
//*     ProgramID       :   MAS240100
//*     Component       :   PrintMem5
//*     Name            :   Y.Ichihashi　　　　　　
//*
//************************************************************************
procedure	TJNTCRP020000f.PrintMem5 (cDlgPrint: TMJSPrnDlgf);
var
	stMessageRec: TMJSMsgRec;
	DQuery   : TMQuery;
	DMQuery  : TMQuery;
	iGcode	 : Integer;
	iCount   : Integer;
begin
	//科目連想リスト
    DQuery := TMQuery.Create( Self );              //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DQuery );    //  DBとMQueryの接続
	DMQuery := TMQuery.Create( Self );              //  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, DMQuery );

	DPrintdxMemData5.Close();
	DPrintdxMemData5.Open;

	if m_iHnSitei = 0 then
	begin
        DQuery.Close;
		DQuery.SQl.Clear;
		DQuery.SQL.Add('select Gcode,RenChar,LongName from KmkMA ');
		DQuery.SQL.Add('where MasterKbn = 1 and SumKbn = 0 and ');
		DQuery.SQL.Add('RecordKbn = 0 Order By Gcode');
		DQuery.Open;
	end
	else
	begin
        DQuery.Close;
		DQuery.SQl.Clear;
		DQuery.SQL.Add('select Gcode,RenChar,LongName from KmkMA ');
		DQuery.SQL.Add('where MasterKbn = 1 and SumKbn = 0 and Recordkbn = 0 ');
		DQuery.SQL.Add('and Gcode >= :Sta and Gcode <= :End Order By Gcode');
        DQuery.ParamByName('Sta').AsInteger := m_iKaisi;
		DQuery.ParamByName('End').AsInteger := m_iOwari;
		DQuery.Open;
	end;

   	while (DQuery.Eof <> true) do
	begin
		iCount := 0;
		iGcode := DQuery.GetFld('Gcode').AsInteger;

        DPrintdxMemData5.Append;
		DPrintdxMemData5.FieldByName('KGcodeC').AsInteger 	:= iGcode;
		DPrintdxMemData5.FieldByName('RenChar').AsString	:= DQuery.GetFld('RenChar').AsString;
		DPrintdxMemData5.FieldByName('KTekicharN').AsString := DQuery.GetFld('LongName').AsString;

        DMQuery.Close;
		DMQuery.SQL.Clear;
		DMQuery.SQL.Add('select Tree.BasedCode,MA.Gcode,MA.RenChar,MA.TekiChar from TekiTree Tree ');
		DMQuery.SQL.Add('Left Outer Join TekiMA MA On (Tree.SumCode = :iGcode ');
		DMQuery.SQL.Add('and MA.MasterKbn = Tree.MasterKbn and MA.Gcode = Tree.BasedCode) ');
		DMQuery.SQL.Add('where MA.Sumkbn = 0 and MA.Recordkbn = 0 ');
		DMQuery.SQL.Add('Order By Tree.BasedCode ');	//HIS0019
		DMQuery.ParamByName('iGcode').AsInteger := iGcode;
		DMQuery.Open;

        while (not DMQuery.Eof) do
		begin
			if iCount = 0 then
			begin
                DPrintdxMemData5.FieldByName('MGcodeC').AsInteger 	:= DMQuery.GetFld('Gcode').AsInteger;
				DPrintdxMemData5.FieldByName('TRenChar').AsString	:= DMQuery.GetFld('RenChar').AsString;
				DPrintdxMemData5.FieldByName('MTekiCharN').AsString := DMQuery.GetFld('TekiChar').AsString;
				DPrintdxMemData5.Post;
				inc(iCount);
				DMQuery.Next;
			end
			else
			begin
				DPrintdxMemData5.Append;
                DPrintdxMemData5.FieldByName('MGcodeC').AsInteger 	:= DMQuery.GetFld('Gcode').AsInteger;
				DPrintdxMemData5.FieldByName('TRenChar').AsString	:= DMQuery.GetFld('RenChar').AsString;
				DPrintdxMemData5.FieldByName('MTekiCharN').AsString := DMQuery.GetFld('TekiChar').AsString;
				DPrintdxMemData5.Post;
				DMQuery.Next;
			end;
		end;
        DQuery.Next;
	end;
	if (m_cPrnSupport.iCommand = PDLG_PREVIEW) then
    begin
        m_cPreview. Exec(  m_cPrnSupport, cDlgPrint, FileOut)
    end
    else if (m_cPrnSupport.iCommand = PDLG_FILE) then
    begin
        if DSet2CSV(DPrintdxMemData5, m_cPrnSupport.strFileName) = -1 then
        begin
            //	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,
							stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
	else
    begin
       RReport5.Print;
    end;

	DQuery.Close;
    DMQuery.Close;
	DQuery.Free;
    DMQuery.Free;
end;

//H0005 20031224 khattori syuusei 科目連想リスト・摘要順に消費税コードを追加
//******************************************************************************
//	HIS0018
//******************************************************************************
procedure TJNTCRP020000f.PrintMem6(cDlgPrint: TMJSPrnDlgf; iKbn: Integer);
var
	stMessageRec: TMJSMsgRec;
	Qe   		: TMQuery;
	Qe2  		: TMQuery;
	iCount   	: Integer;
	iCount2		: Integer;
begin
    Qe := TMQuery.Create( Self );              	//  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, Qe );  //  DBとMQueryの接続
	Qe2 := TMQuery.Create( Self );              	//  MQueryの構築
    m_cDataModule.SetDBInfoToQuery( m_cDBSelect, Qe2 );

	DPrintdxMemData6.Close;
	DPrintdxMemData6.Open;

    Qe.Close;
	Qe.SQl.Clear;
	Qe.SQL.Add('select MA.GCode,MA.RenChar,MA.TekiChar,');
	Qe.SQL.Add('Sw.StaxKbn,Sw.StaxCode ');
	Qe.SQL.Add('from TekiMA MA     ');
	Qe.SQL.Add('Left Outer Join SwDicTeki Sw On (MA.Gcode = Sw.Gcode ');
	Qe.SQL.Add('and MA.MasterKbn = Sw.Masterkbn ) ');
	Qe.SQL.Add('where              ');
	Qe.SQL.Add('	MA.MasterKbn = 61 ');
	Qe.SQL.Add('and MA.SumKbn    = 0  ');
	Qe.SQL.Add('and MA.RecordKbn = 0  ');

	if m_iHnSitei <> 0 then
	begin
		Qe.SQL.Add('and (MA.GCode Between :St and :Ed) ');
        Qe.ParamByName('St').AsInteger := m_iKaisi;
		Qe.ParamByName('Ed').AsInteger := m_iOwari;
	end;

	if m_iJnSitei = 0 then
		Qe.SQL.Add('Order By MA.Gcode     ')
	else
		Qe.SQL.Add('Order By MA.RenChar   ');

//	if m_iHnSitei = 0 then
//	begin
//      Qe.Close;
//		Qe.SQl.Clear;
//		Qe.SQL.Add('select             ');
//		Qe.SQL.Add('	GCode,         ');
//		Qe.SQL.Add('	RenChar,       ');
//		Qe.SQL.Add('	TekiChar       ');
//		Qe.SQL.Add('from TekiMA        ');
//		Qe.SQL.Add('where              ');
//		Qe.SQL.Add('	MasterKbn = 61 ');
//		Qe.SQL.Add('and SumKbn    = 0  ');
//		Qe.SQL.Add('and RecordKbn = 0  ');
//		if m_iJnSitei = 0 then
//			Qe.SQL.Add('Order By Gcode     ')
//		else
//			Qe.SQL.Add('Order By RenChar   ');
//	end
//	else
//	begin
//      Qe.Close;
//		Qe.SQl.Clear;
//		Qe.SQL.Add('select ');
//		Qe.SQL.Add('	GCode,         ');
//		Qe.SQL.Add('	RenChar,       ');
//		Qe.SQL.Add('	TekiChar       ');
//		Qe.SQL.Add('from TekiMA        ');
//		Qe.SQL.Add('where              ');
//		Qe.SQL.Add('	MasterKbn = 61 ');
//		Qe.SQL.Add('and SumKbn    = 0  ');
//		Qe.SQL.Add('and RecordKbn = 0  ');
//		Qe.SQL.Add('and (GCode Between :St and :Ed) ');
//		if m_iJnSitei = 0 then
//			Qe.SQL.Add('Order By Gcode     ')
//		else
//			Qe.SQL.Add('Order By RenChar   ');
//      Qe.ParamByName('St').AsInteger := m_iKaisi;
//		Qe.ParamByName('Ed').AsInteger := m_iOwari;
//	end;

	if Qe.Open = false then
	begin
		Qe.Close;
		Qe.Free;
		Exit;
	end;


	iCount2	:= 0;

	while not Qe.Eof do
	begin
        iCount	:= 0;

		DPrintdxMemData6.Append;
		DPrintdxMemData6.FieldByName('TekiCode').AsInteger	:= Qe.GetFld('GCode').AsInteger;
		DPrintdxMemData6.FieldByName('TRenChar').AsString	:= Qe.GetFld('RenChar').AsString;
		DPrintdxMemData6.FieldByName('TekiChar').AsString	:= Qe.GetFld('TekiChar').AsString;

		if	(Qe.GetFld('StaxKbn').Asinteger=1)or(Qe.GetFld('StaxKbn').Asinteger=2)	then
		begin
			if	Qe.GetFld('StaxCode').AsInteger=0
			then	DPrintdxMemData6.FieldByName('TaxCode').AsString	:= '科目に従う  '
			else	DPrintdxMemData6.FieldByName('TaxCode').AsString	:= Qe.GetFld('StaxCode').AsString;
		end;

		Qe2.Close;
		Qe2.SQL.Clear;
		Qe2.SQL.Add('select ');
		Qe2.SQL.Add('	MA.GCode, ');
		Qe2.SQL.Add('	MA.RenChar, ');
		Qe2.SQL.Add('	MA.SimpleName ');
		Qe2.SQL.Add('from KmkMA MA ');
		Qe2.SQL.Add('Left Outer Join ');
		Qe2.SQL.Add('TekiTree Tree on ');
		Qe2.SQL.Add('	(Tree.SumCode   = MA.GCode ');
		Qe2.SQL.Add('and Tree.BasedCode = :Gcode)  ');
		Qe2.SQL.Add('where ');
		Qe2.SQL.Add('	 Tree.MasterKbn = 61 ');
		Qe2.SQL.Add('and Tree.TekiKbn   = 2  ');
		Qe2.SQL.Add('and MA.MasterKbn   = 1 ');
		Qe2.SQL.Add('and MA.SumKbn      = 0 ');
		Qe2.SQL.Add('and MA.RecordKbn   = 0 ');
		Qe2.SQL.Add('Order By MA.GCode ');
		Qe2.ParamByName('GCode').AsInteger	:= Qe.GetFld('GCode').AsInteger;
		if Qe2.Open = false then
		begin
			Qe2.Close;
			Qe2.Free;
			Exit;
		end;

		if iKbn = 0 then
			inc(iCount2);

		while not Qe2.Eof do
		begin
            if iCount = 0 then
			begin
				DPrintdxMemData6.FieldByName('KmkCode').AsInteger		:= Qe2.GetFld('GCode').AsInteger;
				DPrintdxMemData6.FieldByName('RenChar').AsString		:= Qe2.GetFld('RenChar').AsString;
				DPrintdxMemData6.FieldByName('SimpleName').AsString		:= Qe2.GetFld('SimpleName').AsString;
				DPrintdxMemData6.Post;

				inc(iCount);
			end
			else
			begin
				DPrintdxMemData6.Append;

				if (iKbn = 0) and (iCount2 = 162) then
				begin
					DPrintdxMemData6.FieldByName('TekiCode').AsInteger	:= Qe.GetFld('GCode').AsInteger;
					DPrintdxMemData6.FieldByName('TRenChar').AsString	:= Qe.GetFld('RenChar').AsString;
					DPrintdxMemData6.FieldByName('TekiChar').AsString	:= Qe.GetFld('TekiChar').AsString;
					iCount2	:= 0;
				end;

				DPrintdxMemData6.FieldByName('KmkCode').AsInteger		:= Qe2.GetFld('GCode').AsInteger;
				DPrintdxMemData6.FieldByName('RenChar').AsString		:= Qe2.GetFld('RenChar').AsString;
				DPrintdxMemData6.FieldByName('SimpleName').AsString		:= Qe2.GetFld('SimpleName').AsString;
				DPrintdxMemData6.Post;

    			if iKbn = 0 then
					inc(iCount2);
			end;

			Qe2.Next;
		end;

		Qe.Next;
	end;

	if (m_cPrnSupport.iCommand = PDLG_PREVIEW) then
    begin
        m_cPreview. Exec(  m_cPrnSupport, cDlgPrint, FileOut)
    end
    else if (m_cPrnSupport.iCommand = PDLG_FILE) then
    begin
        if DSet2CSV(DPrintdxMemData6, m_cPrnSupport.strFileName) = -1 then
        begin
            //	ファイル出力大失敗
			m_cComArea.m_MsgStd.GetMsg( stMessageRec, 10040,3);
	    	MjsMessageBoxEx(Self, stMessageRec.sMsg, stMessageRec.sTitle,
							stMessageRec.icontype , stMessageRec.btntype , stMessageRec.btndef,stMessageRec.LogType );
        end;
    end
	else
    begin
       RReport6.Print;
    end;

	Qe.Close;
	Qe.Free;

    Qe2.Close;
	Qe2.Free;
end;

//******************************************************************************
//
//******************************************************************************
procedure	TJNTCRP020000f.fnPrintKanaOrder (cDlgPrint: TMJSPrnDlgf);
var
	dqMasterData: TMQuery;
	stMessageRec: TMJSMsgRec;
	nCount		: Integer;
	nCountUnit	: Integer;
	nCountTotal	: Integer;

begin
	dqMasterData	:= TMQuery.Create (Self);

	m_cDataModule.SetDBInfoToQuery (m_cDBSelect, dqMasterData);							// DBとMQueryの接続

	CmnMemDataPrintKanaOrder.Active	:= false;
	CmnMemDataPrintKanaOrder.Active	:= true;

	nCountTotal	:= 0;

	with (dqMasterData) do
	begin
		for	nCount := 0 to 43 do
		begin
			nCountUnit	:= 0;

			Close ();

			SQL.Clear ();
			SQL.Add   ('SELECT GCode, TekiChar FROM TekiMA ');
			SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = 0 AND RecordKbn = 0 AND ');
			SQL.Add   ('       RenChar >= :strAssScopeStr AND RenChar < :strAssScopeEnd ORDER BY GCode');

			ParamByName ('strAssScopeStr').AsString	:= _KanaOrderChar [nCount];
			ParamByName ('strAssScopeEnd').AsString	:= _KanaOrderChar [nCount + 1];

			Open ();

			while (not EOF) do
			begin
				if	(nCountUnit = 0) then
				begin
					CmnMemDataPrintKanaOrder.Append		 ();
					CmnMemDataPrintKanaOrder.FieldByName ('strDescription').AsString	:= '【 ' + _KanaOrderSymbol [nCount] + ' 】';
					CmnMemDataPrintKanaOrder.Post		 ();
				end;

				CmnMemDataPrintKanaOrder.Append		 ();
				CmnMemDataPrintKanaOrder.FieldByName ('nExCode'       ).AsInteger	:= FieldByName ('GCode'   ).AsInteger;
				CmnMemDataPrintKanaOrder.FieldByName ('strDescription').AsString	:= FieldByName ('TekiChar').AsString;
				CmnMemDataPrintKanaOrder.Post		 ();

				nCountUnit	:= nCountUnit  + 1;
				nCountTotal	:= nCountTotal + 1;

				NEXT;
			end;

			if	((nCount <> 43) and (nCountUnit > 0)) then
			begin
				CmnMemDataPrintKanaOrder.Append ();
				CmnMemDataPrintKanaOrder.Post	();
			end;
		end;

		nCountUnit	:= 0;

        Close ();

		SQL.Clear ();
		SQL.Add   ('SELECT GCode, TekiChar FROM TekiMA ');
		SQL.Add   ('WHERE  MasterKbn = 61 AND SumKbn = 0 AND RecordKbn = 0 AND ');
//20030929 khattori syuusei
		SQL.Add   ('       (RenChar < :strAssScopeStr OR RenChar >= :strAssScopeEnd) ORDER BY GCode');
//		SQL.Add   ('       RenChar < :strAssScopeStr OR RenChar > :strAssScopeEnd ORDER BY GCode');

		ParamByName ('strAssScopeStr').AsString	:= _KanaOrderChar [ 0];
		ParamByName ('strAssScopeEnd').AsString	:= _KanaOrderChar [44];

		Open ();

		while (not EOF) do
		begin
			if	(nCountUnit = 0) then
			begin
				CmnMemDataPrintKanaOrder.Append ();
				CmnMemDataPrintKanaOrder.Post	();
				CmnMemDataPrintKanaOrder.Append ();
				CmnMemDataPrintKanaOrder.Post	();
			end;

			CmnMemDataPrintKanaOrder.Append		 ();
			CmnMemDataPrintKanaOrder.FieldByName ('nExCode'       ).AsInteger	:= FieldByName ('GCode'   ).AsInteger;
			CmnMemDataPrintKanaOrder.FieldByName ('strDescription').AsString	:= FieldByName ('TekiChar').AsString;
			CmnMemDataPrintKanaOrder.Post		 ();

			nCountUnit	:= nCountUnit  + 1;
			nCountTotal	:= nCountTotal + 1;

			NEXT;
		end;
	end;

	if	(nCountTotal > 0) then
	begin
		CmnMemDataPrintKanaOrder.Append ();
		CmnMemDataPrintKanaOrder.Post	();
		CmnMemDataPrintKanaOrder.Append ();
		CmnMemDataPrintKanaOrder.Post	();

		CmnMemDataPrintKanaOrder.Append ();
		CmnMemDataPrintKanaOrder.FieldByName ('strDescription').AsString	:=
																'【登録件数】' + Format (' %d 件', [nCountTotal]);
		CmnMemDataPrintKanaOrder.Post	();
	end;

	dqMasterData.Close ();
	dqMasterData.Free  ();

	if	(m_cPrnSupport.iCommand = PDLG_PREVIEW) then
		m_cPreview.Exec (m_cPrnSupport, cDlgPrint, FileOut)
	else if	(m_cPrnSupport.iCommand = PDLG_FILE) then
	begin
		if	(DSet2CSV (CmnMemDataPrintKanaOrder, m_cPrnSupport.strFileName) = -1) then
		begin
			m_cComArea.m_MsgStd.GetMsg (stMessageRec, 10040, 3);
			MjsMessageBoxEx (Self, stMessageRec.sMsg, stMessageRec.sTitle,
						stMessageRec.icontype , stMessageRec.btntype, stMessageRec.btndef, stMessageRec.LogType);
		end;
	end
	else
		CmnReportKanaOrder.Print ();
end;
*)
//**********************************************************************
//*		Proccess	:	ラインの太さの処理
//*		Name		:	Y.Ichihashi
//*		Date		:	2000/12/29
//*		Parameter	:
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP020000f.PDetailBandMBeforeGenerate(Sender: TObject);
begin
    //固定摘要登録リスト
    if (PDetailBandM.LastRecord) or (PDetailBandM.PageOutOfSpace = true) then
	begin
        if PDetailBandM.OverFlow = false then
			PDetailBandM.OverFlow := true;

		if PFuterLine.ReprintOnOverFlow = false then
			PFuterLine.ReprintOnOverFlow := true;

		PFuterLine.Weight := 0.75;//ラインの太さを太くしている
	end
	else
	begin
		PFuterLine.Weight := 0.25;//ラインの太さを元にもどす
	end;
end;

//**********************************************************************
//*		Proccess	:	ラインの太さの処理
//*		Name		:	Y.Ichihashi
//*		Date		:	2000/12/29
//*		Parameter	:
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP020000f.PDetailBandSTBeforeGenerate(Sender: TObject);
begin
    //仕訳辞書摘要登録リスト
    if (PDetailBandST.LastRecord) or (PDetailBandST.PageOutOfSpace = true) then
	begin
		if PDetailBandST.OverFlow = false then
			PDetailBandST.OverFlow := true;

		if PLienST.ReprintOnOverFlow = false then
			PLienST.ReprintOnOverFlow := true;

		PLienST.Weight := 0.75;//ラインの太さを太くしている
    end
	else
	begin
		PLienST.Weight := 0.25;//ラインの太さを元にもどす
    end;
end;

//**********************************************************************
//*		Proccess	:	ラインの太さの処理
//*		Name		:	Y.Ichihashi
//*		Date		:	2000/12/29
//*		Parameter	:
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP020000f.PDetailBandKBBeforeGenerate(Sender: TObject);
begin
    //摘要分類登録リスト
	if (PDetailBandKB.LastRecord) or (PDetailBandKB.PageOutOfSpace = true) then
	begin
		if PDetailBandKB.OverFlow = false then
			PDetailBandKB.OverFlow := true;

		if PLine1KB.ReprintOnOverFlow = false then
			PLine1KB.ReprintOnOverFlow := true;

    	PLine1KB.Weight := 0.75;//ラインの太さを太くしている
	end
	else
	begin
        PLine1KB.Weight := 0.25;//ラインの太さを元にもどす
	end;
end;

//**********************************************************************
//*		Proccess	:	ラインの太さの処理
//*		Name		:	Y.Ichihashi
//*		Date		:	2000/12/29
//*		Parameter	:
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP020000f.PDetailBandKTBeforeGenerate(Sender: TObject);
begin
    //固定摘要体系登録リスト
	if (PDetailBandKT.LastRecord) or (PDetailBandKT.PageOutOfSpace = true) then
    begin
		if PDetailBandKT.OverFlow = false then
			PDetailBandKT.OverFlow := true;

		if PLineKT.ReprintOnOverFlow = false then
			PLineKT.ReprintOnOverFlow := true;

		PLineKT.Weight := 0.75;//ラインの太さを太くしている
	end
	else
	begin
        PLineKT.Weight := 0.25;//ラインの太さを元にもどす
	end;
end;

//**********************************************************************
//*		Proccess	:	ラインの太さの処理
//*		Name		:	Y.Ichihashi
//*		Date		:	2000/12/29
//*		Parameter	:
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP020000f.PDetailBandKRBeforeGenerate(Sender: TObject);
begin
    //科目連想登録リスト（科目コード順）
	if (PDetailBandKR.LastRecord) or (PDetailBandKR.PageOutOfSpace = true) then
	begin
		if PDetailBandKR.OverFlow = false then
			PDetailBandKR.OverFlow := true;

		if PLineKR.ReprintOnOverFlow = false then
			PLineKR.ReprintOnOverFlow := true;

		PLineKR.Weight := 0.75;//ラインの太さを太くしている
    end
	else
	begin
        PLineKR.Weight := 0.25;//ラインの太さを元にもどす
	end;
end;


//**********************************************************************
//*		Proccess	:	ラインの太さの処理
//*		Name		:	Y.Ichihashi
//*		Date		:	2002/06/27
//*		Parameter	:
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP020000f.PDetailBandBeforeGenerate(Sender: TObject);
begin
    //科目連想登録リスト（摘要コード順）
  	if (PDetailBand.LastRecord) or (PDetailBand.PageOutOfSpace = true) then
	begin
		if PDetailBand.OverFlow	= false then
			PDetailBand.OverFlow	:= true;

		if PLine.ReprintOnOverFlow = false then
			PLine.ReprintOnOverFlow	:= true;

		PLine.Weight	:= 0.75;	//ラインの太さを太くする。
	end
	else
	begin
		PLine.Weight	:= 0.25;	//ラインの太さを元に戻す。
	end;
end;

procedure TJNTCRP020000f.SDetailBandBeforeGenerate(Sender: TObject);
begin
	//科目連想登録リスト（摘要コード順）
  	if (SDetailBand.LastRecord) or (SDetailBand.PageOutOfSpace = true) then
	begin
		if SDetailBand.OverFlow	= false then
			SDetailBand.OverFlow	:= true;

		if FLine.ReprintOnOverFlow = false then
			FLine.ReprintOnOverFlow	:= true;

		FLine.Weight	:= 0.75;	//ラインの太さを太くする。
	end
	else
	begin
		FLine.Weight	:= 0.25;	//ラインの太さを元に戻す。
	end;
end;
//<HIS0078 start>
(*
//**********************************************************************
//*		Proccess	:	ファイル出力に必要なTitle･Filed設定
//*		Name		:	H.Endo
//*		Date		:	2000/1/23
//*		Parameter	:	Select	:	帳票種類
//*						sTitle	:	CreateされたTStringList(ﾀｲﾄﾙ用)
//*						sMemFld	:	CreateされたTStringList(ﾌｨｰﾙﾄﾞ用)
//*		Return		:	なし
//*		History		:
//**********************************************************************
procedure TJNTCRP020000f.SetFileOutTF(Select: Integer; var sTitle: TStringList; var sMemFld: TStringList);
begin
	case Select of
		KOTEITEKIYOU:	//	固定摘要
		begin
			sTitle.Add('コード'			 );
			sTitle.Add('摘要'			 );
			sTitle.Add('連想'			 );
			sTitle.Add('消費税区分'		 );
			sTitle.Add('消費税ｺｰﾄﾞ'		 );
			sTitle.Add('消費税率'		 );
			sTitle.Add('業種'			 );
			sTitle.Add('摘要残'			 );
			sTitle.Add('取引先区分'		 );
			sTitle.Add('取引先分類'		 );
			sTitle.Add('最終更新日'		 );

			sMemFld.Add('GCode'			 );
			sMemFld.Add('TekiChar'		 );
			sMemFld.Add('RenChar'		 );
			sMemFld.Add('StaxKbn'		 );
			sMemFld.Add('StaxCode'		 );
			sMemFld.Add('StaxRate'		 );
			sMemFld.Add('TypeCode'		 );
			sMemFld.Add('ZanKbn'		 );
			sMemFld.Add('ExgKbn'		 );
			sMemFld.Add('BunCode'		 );
			sMemFld.Add('UpdateTime'	 );
		end;
		SHIEAKE:	//	仕訳辞書摘要
		begin
			sTitle.Add('コード'			 );
			sTitle.Add('摘要'			 );
			sTitle.Add('連想'			 );
			sTitle.Add('消費税区分'		 );
			sTitle.Add('消費税ｺｰﾄﾞ'		 );
			sTitle.Add('消費税率'		 );
			sTitle.Add('業種'			 );
			sTitle.Add('摘要残'			 );
			sTitle.Add('最終更新日時'	 );
			sTitle.Add('借方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('借方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('借方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('借方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('借方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('借方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('借方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('貸方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('貸方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('貸方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('貸方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('貸方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('貸方情報'		 );
			sTitle.Add(''				 );
			sTitle.Add('貸方情報'		 );
			sTitle.Add(''				 );

			sMemFld.Add('Gcode'			 );
			sMemFld.Add('TekiChar'		 );
			sMemFld.Add('RenChar'		 );
			sMemFld.Add('StaxKbn'		 );
			sMemFld.Add('Staxcode'	 	 );
			sMemFld.Add('StaxRate'		 );
			sMemFld.Add('TypeCode'		 );
			sMemFld.Add('ZanKbn'		 );
			sMemFld.Add('UpDateTime'	 );
			sMemFld.Add('DKmkCode'		 );
			sMemFld.Add('DKmkName'		 );
			sMemFld.Add('DSubCode'		 );
			sMemFld.Add('DSubName'		 );
			sMemFld.Add('DBmnCode'		 );
			sMemFld.Add('DBmnName'		 );
			sMemFld.Add('DSegCode'		 );
			sMemFld.Add('DSegName'		 );
			sMemFld.Add('DHojyo1Code'	 );
			sMemFld.Add('DHojyo1Name'	 );
			sMemFld.Add('DHojyo2Code'	 );
			sMemFld.Add('DHojyo2Name'	 );
			sMemFld.Add('DKojCode'		 );
			sMemFld.Add('DkojName'		 );
			sMemFld.Add('CKmkCode'		 );
			sMemFld.Add('CKmkName'		 );
			sMemFld.Add('CSubCode'		 );
			sMemFld.Add('CSubName'		 );
			sMemFld.Add('CBmnCode'		 );
			sMemFld.Add('CBmnName'		 );
			sMemFld.Add('CSegCode'		 );
			sMemFld.Add('CSegName'		 );
			sMemFld.Add('CHojyo1Code'	 );
			sMemFld.Add('CHojyo1Name'	 );
			sMemFld.Add('CHojyo2Code'	 );
			sMemFld.Add('CHojyo2Name'	 );
			sMemFld.Add('CKojCode'		 );
			sMemFld.Add('CkojName'		 );
        end;
		TEKIYOUBUNRUI:		//	固定摘要分類
		begin
			sTitle.Add('コード'			 );
			sTitle.Add('摘要'			 );
			sTitle.Add('連想'			 );
			sTitle.Add('最終更新日時'	 );

			sMemFld.Add('Gcode'			 );
			sMemFld.Add('TekiChar'		 );
			sMemFld.Add('RenChar'		 );
			sMemFld.Add('UpDateTime'	 );
        end;
		TEKIYOUTAIKEI:		//	固定摘要体系
		begin
			sTitle.Add	('コード'		 );
			sTitle.Add	('分類'		     );
			sTitle.Add	('コード'		 );
			sTitle.Add	('摘要'		     );

			sMemFld.Add	('Gcode'		 );
			sMemFld.Add	('BunName'	     );
			sMemFld.Add	('GcodeT'	     );
			sMemFld.Add	('TekiChar'	     );
        end;
		KAMOKURENSOU1:		//	科目連想(科目順)
		begin
			sTitle.Add	('コード'		 );
			sTitle.Add	('科目名'		 );
			sTitle.Add	('コード'		 );
			sTitle.Add	('摘要'		     );

			sMemFld.Add('KGcodeC'	     );
			sMemFld.Add('KTekiCharN'     );
			sMemFld.Add('MGcodec'	     );
			sMemFld.Add('MTekiCharN'     );
        end;

		KAMOKURENSOU2:		//	科目連想(摘要コード順)
		begin
			sTitle.Add	('コード'		 );
			sTitle.Add	('摘要'		     );
			sTitle.Add	('コード'		 );
			sTitle.Add	('科目名'		 );

			sMemFld.Add('TGcode'	     );
			sMemFld.Add('TekiChar'       );
			sMemFld.Add('KGcode'	     );
			sMemFld.Add('SimpleName'     );
        end;

//H0005 20031224 khattori syuusei 科目連想リスト・摘要順に消費税コードを追加
		KAMOKURENSOU3:		//	科目連想(摘要連想順)
		begin
			sTitle.Add	('コード'        );
			sTitle.Add	('連想'          );
			sTitle.Add	('摘要'          );
			sTitle.Add	('消費税コード'	 );
            sTitle.Add	('コード'        );
			sTitle.Add	('連想'          );
			sTitle.Add	('科目名'        );

			sMemFld.Add	('TekiCode'      );
			sMemFld.Add	('TRenChar'      );
			sMemFld.Add	('TekiChar'      );
			sMemFld.Add	('TaxCode'       );
			sMemFld.Add	('KmkCode'       );
			sMemFld.Add	('RenChar'       );
			sMemFld.Add	('SimpleName'    );
		end;

		KANAORDER:
		begin																	// 固定摘要一覧表
			sTitle.Add  ('コード'        );
			sTitle.Add  ('摘要名称'      );

//			sMemFld.Add ('GCode'   );
//			sMemFld.Add ('TekiChar');
			sMemFld.Add ('nExCode'       );			//HIS0017
			sMemFld.Add ('strDescription');		//HIS0017
		end;
	end;
end;
*)
