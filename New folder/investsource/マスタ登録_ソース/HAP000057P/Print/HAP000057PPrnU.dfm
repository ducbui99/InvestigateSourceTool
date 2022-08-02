object HAP000057PPrnF: THAP000057PPrnF
  Left = 112
  Top = 831
  Width = 164
  Height = 93
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
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline
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
    PrinterSetup.mmEvenMarginBottom = 6350
    PrinterSetup.mmEvenMarginLeft = 6350
    PrinterSetup.mmEvenMarginRight = 6350
    PrinterSetup.mmEvenMarginTop = 6350
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
    UserName = 'Report'
    BeforePrint = ppReport1BeforePrint
    DeviceType = 'Screen'
    Left = 16
    Top = 8
    Version = '5.0'
    mmColumnWidth = 351367
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 29368
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        FontRatio.Auto = False
        UserName = 'Label4'
        Caption = '兼務者一覧表'
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
        mmLeft = 151607
        mmTop = 7144
        mmWidth = 38100
        BandType = 0
      end
      object ppLine2: TppLine
        FontRatio.Auto = False
        UserName = 'Line2'
        Position = lpBottom
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 150019
        mmTop = 13758
        mmWidth = 41010
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
        mmTop = 2117
        mmWidth = 85725
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
        mmLeft = 5556
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
        mmLeft = 28840
        mmTop = 14817
        mmWidth = 18521
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
        mmLeft = 330201
        mmTop = 2117
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel2: TppLabel
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
        mmLeft = 24872
        mmTop = 23020
        mmWidth = 52578
        BandType = 0
      end
      object ppLabel1: TppLabel
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
        mmLeft = 3969
        mmTop = 23020
        mmWidth = 19578
        BandType = 0
      end
      object ppLine1: TppLine
        FontRatio.Auto = False
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 3175
        mmTop = 19844
        mmWidth = 343694
        BandType = 0
      end
      object ppLine3: TppLine
        FontRatio.Auto = False
        UserName = 'Line3'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 529
        mmLeft = 3175
        mmTop = 28839
        mmWidth = 343694
        BandType = 0
      end
      object ppLine4: TppLine
        FontRatio.Auto = False
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 3175
        mmTop = 19845
        mmWidth = 1323
        BandType = 0
      end
      object ppLine5: TppLine
        FontRatio.Auto = False
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 24077
        mmTop = 19845
        mmWidth = 1588
        BandType = 0
      end
      object ppLine6: TppLine
        FontRatio.Auto = False
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 80698
        mmTop = 19845
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel3: TppLabel
        Tag = 105802
        FontRatio.Auto = False
        UserName = 'Label3'
        Alignment = taCenter
        AutoSize = False
        Caption = '所　属'
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
        mmLeft = 176741
        mmTop = 20902
        mmWidth = 76465
        BandType = 0
      end
      object ppLabel5: TppLabel
        Tag = 105902
        FontRatio.Auto = False
        UserName = 'Label5'
        Alignment = taCenter
        AutoSize = False
        Caption = '役　職'
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
        mmLeft = 176741
        mmTop = 25400
        mmWidth = 76465
        BandType = 0
      end
      object ppLine13: TppLine
        FontRatio.Auto = False
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 254265
        mmTop = 19845
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel6: TppLabel
        FontRatio.Auto = False
        UserName = 'Label6'
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
        mmLeft = 255324
        mmTop = 23020
        mmWidth = 21166
        BandType = 0
      end
      object ppLine12: TppLine
        FontRatio.Auto = False
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 277018
        mmTop = 19845
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel7: TppLabel
        FontRatio.Auto = False
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
        mmLeft = 278077
        mmTop = 23020
        mmWidth = 14816
        BandType = 0
      end
      object Label_Kbn: TppLabel
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
        mmLeft = 295011
        mmTop = 23020
        mmWidth = 50800
        BandType = 0
      end
      object ppLine17: TppLine
        FontRatio.Auto = False
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 346605
        mmTop = 19845
        mmWidth = 1588
        BandType = 0
      end
      object ppLine18: TppLine
        FontRatio.Auto = False
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 293952
        mmTop = 19845
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel8: TppLabel
        Tag = 105802
        FontRatio.Auto = False
        UserName = 'Label8'
        Alignment = taCenter
        AutoSize = False
        Caption = '所　属'
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
        mmLeft = 82021
        mmTop = 20902
        mmWidth = 76464
        BandType = 0
      end
      object ppLine21: TppLine
        FontRatio.Auto = False
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 159543
        mmTop = 19844
        mmWidth = 1588
        BandType = 0
      end
      object ppLine25: TppLine
        FontRatio.Auto = False
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 175685
        mmTop = 19844
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel9: TppLabel
        FontRatio.Auto = False
        UserName = 'Label9'
        Alignment = taCenter
        AutoSize = False
        Caption = '兼　務'
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
        mmLeft = 160602
        mmTop = 23020
        mmWidth = 14552
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
        mmLeft = 336022
        mmTop = 15346
        mmWidth = 9525
        BandType = 0
      end
      object ppLine28: TppLine
        FontRatio.Auto = False
        UserName = 'Line28'
        Pen.Width = 0
        Weight = 0.25
        mmHeight = 1852
        mmLeft = 80698
        mmTop = 24608
        mmWidth = 78844
        BandType = 0
      end
      object ppLine30: TppLine
        FontRatio.Auto = False
        UserName = 'Line30'
        Pen.Width = 0
        Weight = 0.25
        mmHeight = 1852
        mmLeft = 175685
        mmTop = 24608
        mmWidth = 78580
        BandType = 0
      end
      object ppLabel10: TppLabel
        Tag = 105902
        FontRatio.Auto = False
        UserName = 'Label10'
        Alignment = taCenter
        AutoSize = False
        Caption = '役　職'
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
        mmLeft = 82021
        mmTop = 25400
        mmWidth = 76464
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 80
        UserName = 'DBText2'
        DataField = 'EmpName'
        DataPipeline = ppDBPipeline
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
        mmLeft = 24872
        mmTop = 3175
        mmWidth = 52578
        BandType = 4
      end
      object ppDBText1: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText1'
        Alignment = taRightJustify
        DataField = 'EmpNo'
        DataPipeline = ppDBPipeline
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
        mmLeft = 3969
        mmTop = 3175
        mmWidth = 17198
        BandType = 4
      end
      object ppLine24: TppLine
        FontRatio.Auto = False
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 24077
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
        mmLeft = 3175
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine10: TppLine
        FontRatio.Auto = False
        UserName = 'Line10'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 159543
        mmTop = 7673
        mmWidth = 187061
        BandType = 4
      end
      object ppLine7: TppLine
        FontRatio.Auto = False
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 80698
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText3: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText3'
        Alignment = taRightJustify
        DataField = 'KenDeptNo'
        DataPipeline = ppDBPipeline
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
        mmLeft = 176741
        mmTop = 528
        mmWidth = 17198
        BandType = 4
      end
      object ppLine8: TppLine
        FontRatio.Auto = False
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 194735
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText4: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 60
        UserName = 'DBText4'
        DataField = 'KenDeptName'
        DataPipeline = ppDBPipeline
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
        mmLeft = 195791
        mmTop = 528
        mmWidth = 57678
        BandType = 4
      end
      object ppDBText5: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText5'
        Alignment = taRightJustify
        DataField = 'KenPostNo'
        DataPipeline = ppDBPipeline
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
        mmLeft = 176742
        mmTop = 5555
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 60
        UserName = 'DBText6'
        DataField = 'KenPostName'
        DataPipeline = ppDBPipeline
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
        mmLeft = 195792
        mmTop = 5555
        mmWidth = 57679
        BandType = 4
      end
      object ppLine15: TppLine
        FontRatio.Auto = False
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 254265
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText7: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText7'
        DataField = 'Haturei'
        DataPipeline = ppDBPipeline
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
        mmLeft = 255324
        mmTop = 528
        mmWidth = 21166
        BandType = 4
      end
      object ppLine29: TppLine
        FontRatio.Auto = False
        UserName = 'Line29'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 277018
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppDBText10: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText10'
        Alignment = taRightJustify
        DataField = 'Stay'
        DataPipeline = ppDBPipeline
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
        mmLeft = 278077
        mmTop = 528
        mmWidth = 14816
        BandType = 4
      end
      object ppDBText8: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 80
        UserName = 'DBText8'
        DataField = 'Remarks'
        DataPipeline = ppDBPipeline
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
        mmLeft = 295011
        mmTop = 528
        mmWidth = 50800
        BandType = 4
      end
      object ppLine16: TppLine
        FontRatio.Auto = False
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 346605
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine19: TppLine
        FontRatio.Auto = False
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 293952
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText9: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText9'
        Alignment = taRightJustify
        DataField = 'DeptNo'
        DataPipeline = ppDBPipeline
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
        mmLeft = 81755
        mmTop = 528
        mmWidth = 17198
        BandType = 4
      end
      object ppLine20: TppLine
        FontRatio.Auto = False
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 100013
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText11: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 60
        UserName = 'DBText11'
        DataField = 'DeptNameL'
        DataPipeline = ppDBPipeline
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
        mmLeft = 101072
        mmTop = 528
        mmWidth = 57658
        BandType = 4
      end
      object ppLine23: TppLine
        FontRatio.Auto = False
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 159543
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine26: TppLine
        FontRatio.Auto = False
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9525
        mmLeft = 175685
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText12: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText12'
        Alignment = taCenter
        DataField = 'Kenmu'
        DataPipeline = ppDBPipeline
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
        mmLeft = 160602
        mmTop = 3175
        mmWidth = 14552
        BandType = 4
      end
      object ppLine27: TppLine
        FontRatio.Auto = False
        UserName = 'Line101'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 3175
        mmTop = 7673
        mmWidth = 77523
        BandType = 4
      end
      object ppLine31: TppLine
        FontRatio.Auto = False
        UserName = 'Line102'
        Pen.Width = 0
        Weight = 0.25
        mmHeight = 1852
        mmLeft = 80698
        mmTop = 4763
        mmWidth = 78844
        BandType = 4
      end
      object ppLine9: TppLine
        FontRatio.Auto = False
        UserName = 'Line9'
        Pen.Width = 0
        Weight = 0.25
        mmHeight = 1852
        mmLeft = 175685
        mmTop = 4763
        mmWidth = 170919
        BandType = 4
      end
      object ppDBText13: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText13'
        Alignment = taRightJustify
        DataField = 'PostNo'
        DataPipeline = ppDBPipeline
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
        mmLeft = 81755
        mmTop = 5556
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText14: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 60
        UserName = 'DBText14'
        DataField = 'PostName'
        DataPipeline = ppDBPipeline
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
        mmLeft = 101072
        mmTop = 5555
        mmWidth = 57658
        BandType = 4
      end
      object ppLine11: TppLine
        FontRatio.Auto = False
        UserName = 'Line11'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 80698
        mmTop = 7673
        mmWidth = 78844
        BandType = 4
      end
      object ppDBText15: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 80
        UserName = 'DBText15'
        DataField = 'PostRMark'
        DataPipeline = ppDBPipeline
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
        mmLeft = 295011
        mmTop = 5555
        mmWidth = 50800
        BandType = 4
      end
      object ppDBText16: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText16'
        DataField = 'PostHaturei'
        DataPipeline = ppDBPipeline
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
        mmLeft = 255324
        mmTop = 5555
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText17: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText101'
        Alignment = taRightJustify
        DataField = 'PostStay'
        DataPipeline = ppDBPipeline
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
        mmLeft = 278077
        mmTop = 5555
        mmWidth = 14817
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
        mmLeft = 174096
        mmTop = 2117
        mmWidth = 1588
        BandType = 8
      end
      object LppAccOfficeSf: TppLabel
        FontRatio.Auto = False
        UserName = 'Label7'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ Ｐゴシック'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 320146
        mmTop = 2117
        mmWidth = 9525
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DeptNCd'
      DataPipeline = ppDBPipeline
      NewPage = True
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
  object DataSource: TDataSource
    DataSet = DMemPrint
    Left = 72
    Top = 8
  end
  object ppDBPipeline: TppDBPipeline
    DataSource = DataSource
    UserName = 'DBPipeline'
    Left = 44
    Top = 8
    object ppDBPipelineppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDBPipelineppField2: TppField
      FieldAlias = 'EmpNo'
      FieldName = 'EmpNo'
      FieldLength = 10
      DisplayWidth = 20
      Position = 1
    end
    object ppDBPipelineppField3: TppField
      FieldAlias = 'EmpName'
      FieldName = 'EmpName'
      FieldLength = 42
      DisplayWidth = 42
      Position = 2
    end
    object ppDBPipelineppField4: TppField
      FieldAlias = 'DeptNo'
      FieldName = 'DeptNo'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object ppDBPipelineppField5: TppField
      FieldAlias = 'DeptName'
      FieldName = 'DeptName'
      FieldLength = 30
      DisplayWidth = 30
      Position = 4
    end
    object ppDBPipelineppField6: TppField
      FieldAlias = 'DeptNameL'
      FieldName = 'DeptNameL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppDBPipelineppField7: TppField
      FieldAlias = 'PostNo'
      FieldName = 'PostNo'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipelineppField8: TppField
      FieldAlias = 'PostName'
      FieldName = 'PostName'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppDBPipelineppField9: TppField
      FieldAlias = 'Kenmu'
      FieldName = 'Kenmu'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object ppDBPipelineppField10: TppField
      FieldAlias = 'KenDeptNo'
      FieldName = 'KenDeptNo'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object ppDBPipelineppField11: TppField
      FieldAlias = 'KenDeptName'
      FieldName = 'KenDeptName'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object ppDBPipelineppField12: TppField
      FieldAlias = 'KenPostNo'
      FieldName = 'KenPostNo'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppDBPipelineppField13: TppField
      FieldAlias = 'KenPostName'
      FieldName = 'KenPostName'
      FieldLength = 60
      DisplayWidth = 60
      Position = 12
    end
    object ppDBPipelineppField14: TppField
      FieldAlias = 'Haturei'
      FieldName = 'Haturei'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object ppDBPipelineppField15: TppField
      FieldAlias = 'PostHaturei'
      FieldName = 'PostHaturei'
      FieldLength = 20
      DisplayWidth = 20
      Position = 14
    end
    object ppDBPipelineppField16: TppField
      FieldAlias = 'Stay'
      FieldName = 'Stay'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object ppDBPipelineppField17: TppField
      FieldAlias = 'PostStay'
      FieldName = 'PostStay'
      FieldLength = 203
      DisplayWidth = 203
      Position = 16
    end
    object ppDBPipelineppField18: TppField
      FieldAlias = 'Remarks'
      FieldName = 'Remarks'
      FieldLength = 40
      DisplayWidth = 40
      Position = 17
    end
    object ppDBPipelineppField19: TppField
      FieldAlias = 'PostRMark'
      FieldName = 'PostRMark'
      FieldLength = 40
      DisplayWidth = 40
      Position = 18
    end
    object ppDBPipelineppField20: TppField
      FieldAlias = 'EmpNCd'
      FieldName = 'EmpNCd'
      FieldLength = 20
      DisplayWidth = 20
      Position = 19
    end
    object ppDBPipelineppField21: TppField
      FieldAlias = 'DeptNCd'
      FieldName = 'DeptNCd'
      FieldLength = 20
      DisplayWidth = 20
      Position = 20
    end
    object ppDBPipelineppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'No'
      FieldName = 'No'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 21
    end
    object ppDBPipelineppField23: TppField
      FieldAlias = 'iLine'
      FieldName = 'iLine'
      FieldLength = 20
      DisplayWidth = 20
      Position = 22
    end
  end
  object DMemPrint: TdxMemData
    Active = True
    SortOptions = []
    Left = 100
    Top = 8
    object DMemPrintEmpNo: TStringField
      DisplayWidth = 20
      FieldName = 'EmpNo'
      Size = 10
    end
    object DMemPrintEmpName: TStringField
      DisplayWidth = 42
      FieldName = 'EmpName'
      Size = 42
    end
    object DMemPrintDeptNo: TStringField
      FieldName = 'DeptNo'
    end
    object DMemPrintDeptName: TStringField
      DisplayWidth = 30
      FieldName = 'DeptName'
      Size = 30
    end
    object DMemPrintDeptNameL: TStringField
      FieldName = 'DeptNameL'
      Size = 60
    end
    object DMemPrintPostNo: TStringField
      FieldName = 'PostNo'
      Size = 10
    end
    object DMemPrintPostName: TStringField
      FieldName = 'PostName'
      Size = 60
    end
    object DMemPrintKenmu: TStringField
      FieldName = 'Kenmu'
    end
    object DMemPrintKenDeptNo: TStringField
      FieldName = 'KenDeptNo'
    end
    object DMemPrintKenDeptName: TStringField
      DisplayWidth = 60
      FieldName = 'KenDeptName'
      Size = 60
    end
    object DMemPrintKenPostNo: TStringField
      FieldName = 'KenPostNo'
    end
    object DMemPrintKenPostName: TStringField
      DisplayWidth = 60
      FieldName = 'KenPostName'
      Size = 60
    end
    object DMemPrintHaturei: TStringField
      FieldName = 'Haturei'
    end
    object DMemPrintPostHaturei: TStringField
      FieldName = 'PostHaturei'
    end
    object DMemPrintStay: TStringField
      FieldName = 'Stay'
    end
    object DMemPrintPostStay: TStringField
      FieldName = 'PostStay'
      Size = 203
    end
    object DMemPrintRemarks: TStringField
      DisplayWidth = 40
      FieldName = 'Remarks'
      Size = 40
    end
    object DMemPrintPostRMark: TStringField
      FieldName = 'PostRMark'
      Size = 40
    end
    object DMemPrintEmpNCd: TStringField
      FieldName = 'EmpNCd'
    end
    object DMemPrintDeptNCd: TStringField
      FieldName = 'DeptNCd'
    end
    object DMemPrintNo: TIntegerField
      FieldName = 'No'
    end
    object DMemPrintiLine: TStringField
      FieldName = 'iLine'
    end
  end
end
