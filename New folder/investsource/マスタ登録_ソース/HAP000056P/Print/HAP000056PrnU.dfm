object HAP000056PPrnF: THAP000056PPrnF
  Left = 1069
  Top = 895
  Width = 194
  Height = 77
  Caption = 'HAP000056PPrnF'
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'ＭＳ Ｐゴシック'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object ppDBPipeline1: TppDBPipeline
    DataSource = DSrcPrint
    UserName = 'DBPipeline1'
    Left = 48
    Top = 8
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'EmpNo'
      FieldName = 'EmpNo'
      FieldLength = 10
      DisplayWidth = 20
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'EmpKana'
      FieldName = 'EmpKana'
      FieldLength = 42
      DisplayWidth = 42
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'EmpName'
      FieldName = 'EmpName'
      FieldLength = 42
      DisplayWidth = 42
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'LoanName'
      FieldName = 'LoanName'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'LoanDate'
      FieldName = 'LoanDate'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'LoanFreeNen'
      FieldName = 'LoanFreeNen'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'LoanRemarks'
      FieldName = 'LoanRemarks'
      FieldLength = 40
      DisplayWidth = 40
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'LoanDept'
      FieldName = 'LoanDept'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'LoanPost'
      FieldName = 'LoanPost'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'LoanNo'
      FieldName = 'LoanNo'
      FieldLength = 4
      DisplayWidth = 20
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'EmpNCd'
      FieldName = 'EmpNCd'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'DeptNo'
      FieldName = 'DeptNo'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'DeptNCd'
      FieldName = 'DeptNCd'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'DeptName'
      FieldName = 'DeptName'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'EmpBreak'
      FieldName = 'EmpBreak'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 15
    end
  end
  object DSrcPrint: TDataSource
    DataSet = DMemPrint
    Left = 76
    Top = 8
  end
  object DMemPrint: TdxMemData
    Active = True
    SortOptions = []
    Left = 104
    Top = 8
    object DMemPrintEmpNo: TStringField
      DisplayWidth = 20
      FieldName = 'EmpNo'
      Size = 10
    end
    object DMemPrintEmpKana: TStringField
      FieldName = 'EmpKana'
      Size = 42
    end
    object DMemPrintEmpName: TStringField
      DisplayWidth = 42
      FieldName = 'EmpName'
      Size = 42
    end
    object DMemPrintLoanName: TStringField
      DisplayWidth = 60
      FieldName = 'LoanName'
      Size = 60
    end
    object DMemPrintLoanDate: TStringField
      FieldName = 'LoanDate'
    end
    object DMemPrintLoanFreeNen: TStringField
      FieldName = 'LoanFreeNen'
    end
    object DMemPrintLoanRemark: TStringField
      DisplayWidth = 40
      FieldName = 'LoanRemarks'
      Size = 40
    end
    object DMemPrintLoanDept: TStringField
      DisplayWidth = 60
      FieldName = 'LoanDept'
      Size = 60
    end
    object DMemPrintLoanPost: TStringField
      DisplayWidth = 60
      FieldName = 'LoanPost'
      Size = 60
    end
    object DMemPrintLoanNo: TStringField
      DisplayWidth = 20
      FieldName = 'LoanNo'
      Size = 4
    end
    object DMemPrintEmpNCd: TStringField
      FieldName = 'EmpNCd'
    end
    object DMemPrintDeptNo: TStringField
      FieldName = 'DeptNo'
    end
    object DMemPrintDeptNCd: TStringField
      FieldName = 'DeptNCd'
    end
    object DMemPrintDeptName: TStringField
      DisplayWidth = 60
      FieldName = 'DeptName'
      Size = 60
    end
    object DMemPrintEmpBreak: TBooleanField
      FieldName = 'EmpBreak'
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.OutputPaperName = 'Letter'
    PrinterSetup.mmMarginBottom = 7000
    PrinterSetup.mmMarginLeft = 7000
    PrinterSetup.mmMarginRight = 7000
    PrinterSetup.mmMarginTop = 7000
    PrinterSetup.mmEvenMarginBottom = 0
    PrinterSetup.mmEvenMarginLeft = 0
    PrinterSetup.mmEvenMarginRight = 0
    PrinterSetup.mmEvenMarginTop = 0
    PrinterSetup.mmMarginBottomEx = 0
    PrinterSetup.mmMarginLeftEx = 0
    PrinterSetup.mmMarginRightEx = 0
    PrinterSetup.mmMarginTopEx = 0
    PrinterSetup.mmEvenMarginBottomEx = 0
    PrinterSetup.mmEvenMarginLeftEx = 0
    PrinterSetup.mmEvenMarginRightEx = 0
    PrinterSetup.mmEvenMarginTopEx = 0
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    Units = utMMThousandths
    UserName = 'Report'
    BeforePrint = ppReport1BeforePrint
    DeviceType = 'Screen'
    Left = 20
    Top = 8
    Version = '5.0'
    mmColumnWidth = 350066
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 29369
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        FontRatio.Auto = False
        UserName = 'Label4'
        Caption = '出向者一覧表'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 18
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 149225
        mmTop = 7144
        mmWidth = 38100
        BandType = 0
      end
      object pphlCopNoSf: TppLabel
        FontRatio.Auto = False
        UserName = 'hlCopNoSf'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 12965
        mmTop = 2117
        mmWidth = 28046
        BandType = 0
      end
      object pphlCopNameSf: TppLabel
        FontRatio.Auto = False
        UserName = 'hlCopNameSf'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 43127
        mmTop = 1588
        mmWidth = 85725
        BandType = 0
      end
      object pphsvDateSf: TppSystemVariable
        FontRatio.Auto = False
        UserName = 'hsvDateSf'
        Alignment = taRightJustify
        DisplayFormat = 'yyyy/mm/dd'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 321999
        mmTop = 2117
        mmWidth = 15875
        BandType = 0
      end
      object ppLine2: TppLine
        FontRatio.Auto = False
        UserName = 'Line2'
        Position = lpBottom
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 147638
        mmTop = 13758
        mmWidth = 41010
        BandType = 0
      end
      object ppLabel2: TppLabel
        Tag = 100203
        FontRatio.Auto = False
        UserName = 'Label2'
        Alignment = taCenter
        AutoSize = False
        Caption = '氏  名'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 44715
        mmTop = 23020
        mmWidth = 52578
        BandType = 0
      end
      object ppLabel1: TppLabel
        Tag = 100100
        FontRatio.Auto = False
        UserName = 'Label1'
        Alignment = taCenter
        AutoSize = False
        Caption = '社員No'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 25665
        mmTop = 23020
        mmWidth = 17198
        BandType = 0
      end
      object Label_Name: TppLabel
        Tag = 148301
        FontRatio.Auto = False
        UserName = 'Label_Name'
        Alignment = taCenter
        AutoSize = False
        Caption = '会社名'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 100277
        mmTop = 23020
        mmWidth = 67733
        BandType = 0
      end
      object ppLine1: TppLine
        FontRatio.Auto = False
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 24605
        mmTop = 19845
        mmWidth = 297921
        BandType = 0
      end
      object ppLine4: TppLine
        FontRatio.Auto = False
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 24605
        mmTop = 19844
        mmWidth = 1323
        BandType = 0
      end
      object ppLine5: TppLine
        FontRatio.Auto = False
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 43922
        mmTop = 19844
        mmWidth = 1588
        BandType = 0
      end
      object Label_Kbn: TppLabel
        Tag = 148311
        FontRatio.Auto = False
        UserName = 'Label_Kbn'
        Alignment = taCenter
        AutoSize = False
        Caption = '事由'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 253471
        mmTop = 23020
        mmWidth = 68527
        BandType = 0
      end
      object ppLabel5: TppLabel
        Tag = 148321
        FontRatio.Auto = True
        UserName = 'Label5'
        Alignment = taCenter
        AutoSize = False
        Caption = '発令日'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 20902
        mmWidth = 21696
        BandType = 0
      end
      object ppLine11: TppLine
        FontRatio.Auto = False
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 252413
        mmTop = 19844
        mmWidth = 1852
        BandType = 0
      end
      object ppLine12: TppLine
        FontRatio.Auto = False
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 169068
        mmTop = 19844
        mmWidth = 2381
        BandType = 0
      end
      object ppLine13: TppLine
        FontRatio.Auto = False
        UserName = 'Line13'
        Position = lpRight
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 320411
        mmTop = 19845
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel6: TppLabel
        Tag = 148323
        FontRatio.Auto = True
        UserName = 'Label101'
        Alignment = taCenter
        AutoSize = False
        Caption = '期間'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 25135
        mmWidth = 21696
        BandType = 0
      end
      object ppLine8: TppLine
        FontRatio.Auto = False
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 192088
        mmTop = 19844
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel7: TppLabel
        Tag = 148304
        FontRatio.Auto = False
        UserName = 'Label_Kbn1'
        Alignment = taCenter
        AutoSize = False
        Caption = '出向先肩書き'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 193940
        mmTop = 25135
        mmWidth = 56622
        BandType = 0
      end
      object ppLine14: TppLine
        FontRatio.Auto = False
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 99220
        mmTop = 19844
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel3: TppLabel
        Tag = 148303
        FontRatio.Auto = False
        UserName = 'Label3'
        Alignment = taCenter
        AutoSize = False
        Caption = '出向先部署'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 193940
        mmTop = 20902
        mmWidth = 56622
        BandType = 0
      end
      object ppLDeptNo: TppLabel
        FontRatio.Auto = False
        UserName = 'Label46'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 26988
        mmTop = 14817
        mmWidth = 19579
        BandType = 0
      end
      object ppLDeptName: TppLabel
        FontRatio.Auto = False
        UserName = 'Label47'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 50271
        mmTop = 14817
        mmWidth = 18521
        BandType = 0
      end
      object LblDate: TppLabel
        FontRatio.Auto = False
        UserName = 'LblDate'
        Alignment = taRightJustify
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 305330
        mmTop = 15346
        mmWidth = 9525
        BandType = 0
      end
      object ppLine6: TppLine
        FontRatio.Auto = False
        UserName = 'Line6'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 24606
        mmTop = 27518
        mmWidth = 297920
        BandType = 0
      end
      object ppLine3: TppLine
        FontRatio.Auto = False
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 192088
        mmTop = 24606
        mmWidth = 60325
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforeGenerate = ppDetailBand1BeforeGenerate
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 80
        UserName = 'DBText2'
        DataField = 'EmpName'
        DataPipeline = ppDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        ReprintOnSubsequent = True
        ResetGroup = ppGroup2
        SuppressRepeatedValues = True
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 44979
        mmTop = 5555
        mmWidth = 52578
        BandType = 4
      end
      object ppDBText1: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText1'
        Alignment = taRightJustify
        DataField = 'EmpNo'
        DataPipeline = ppDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        ReprintOnSubsequent = True
        SuppressRepeatedValues = True
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 25665
        mmTop = 2911
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText15: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 60
        UserName = 'DBText15'
        DataField = 'LoanPost'
        DataPipeline = ppDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 193940
        mmTop = 5555
        mmWidth = 57658
        BandType = 4
      end
      object ppLine21: TppLine
        FontRatio.Auto = False
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 169068
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine24: TppLine
        FontRatio.Auto = False
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 43922
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine22: TppLine
        FontRatio.Auto = False
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 24605
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine19: TppLine
        FontRatio.Auto = False
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 192088
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine10: TppLine
        FontRatio.Auto = False
        UserName = 'Line10'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 99220
        mmTop = 7673
        mmWidth = 223305
        BandType = 4
      end
      object ppDBText4: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText4'
        DataField = 'LoanDate'
        DataPipeline = ppDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 170127
        mmTop = 1059
        mmWidth = 21166
        BandType = 4
      end
      object ppLine16: TppLine
        FontRatio.Auto = False
        UserName = 'Line201'
        Position = lpRight
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 320411
        mmTop = 0
        mmWidth = 2381
        BandType = 4
      end
      object ppLine15: TppLine
        FontRatio.Auto = False
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 252413
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppLine25: TppLine
        FontRatio.Auto = False
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 99220
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppDBText9: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 70
        UserName = 'DBText9'
        DataField = 'LoanName'
        DataPipeline = ppDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 100277
        mmTop = 2911
        mmWidth = 67733
        BandType = 4
      end
      object ppDBText10: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText10'
        Alignment = taRightJustify
        DataField = 'LoanFreeNen'
        DataPipeline = ppDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 170127
        mmTop = 5555
        mmWidth = 21166
        BandType = 4
      end
      object ppDBText14: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 60
        UserName = 'DBText14'
        DataField = 'LoanDept'
        DataPipeline = ppDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 193940
        mmTop = 1058
        mmWidth = 57658
        BandType = 4
      end
      object ppDBText3: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText3'
        DataField = 'LoanRemarks'
        DataPipeline = ppDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 253471
        mmTop = 2911
        mmWidth = 68527
        BandType = 4
      end
      object ppDBText5: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 80
        UserName = 'DBText5'
        DataField = 'EmpKana'
        DataPipeline = ppDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        ReprintOnSubsequent = True
        ResetGroup = ppGroup2
        SuppressRepeatedValues = True
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 44979
        mmTop = 1059
        mmWidth = 52578
        BandType = 4
      end
      object ppLine7: TppLine
        FontRatio.Auto = False
        UserName = 'Line7'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 192088
        mmTop = 4763
        mmWidth = 60325
        BandType = 4
      end
      object ppLineEmpBottom: TppLine
        FontRatio.Auto = False
        UserName = 'LineEmpBottom'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 24605
        mmTop = 7673
        mmWidth = 74615
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppfsvPageSf: TppSystemVariable
        FontRatio.Auto = False
        UserName = 'Page'
        VarType = vtPageNo
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 2000
        mmWidth = 1588
        BandType = 8
      end
      object LppAccOfficeSf: TppLabel
        FontRatio.Auto = False
        UserName = 'LppAccOffice'
        Alignment = taRightJustify
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 275167
        mmTop = 2117
        mmWidth = 63765
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DeptNCd'
      DataPipeline = ppDBPipeline1
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'EmpNCd'
      DataPipeline = ppDBPipeline1
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
