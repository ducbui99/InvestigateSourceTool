object HAP000059PPrintF: THAP000059PPrintF
  Left = 36
  Top = 874
  Width = 153
  Height = 75
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'ＭＳ Ｐゴシック'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ppDBPipeline1: TppDBPipeline
    DataSource = DsPrn
    UserName = 'DBPipeline1'
    Left = 72
    Top = 6
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
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
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
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
    Units = utMillimeters
    UserName = 'Report'
    BeforePrint = ppReport1BeforePrint
    DeviceType = 'Screen'
    Left = 104
    Top = 6
    Version = '5.0'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 20904
      mmPrintPosition = 0
      object ppLineHH02: TppLine
        FontRatio.Auto = False
        UserName = 'LineHH02'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 17027
        mmTop = 18570
        mmWidth = 315000
        BandType = 0
      end
      object ppLineHH01: TppLine
        FontRatio.Auto = False
        UserName = 'LineHH01'
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 17027
        mmTop = 16769
        mmWidth = 315000
        BandType = 0
      end
      object pphsvDateSf: TppSystemVariable
        FontRatio.Auto = False
        UserName = 'hsvDateSf'
        Alignment = taRightJustify
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
        mmLeft = 313003
        mmTop = 1588
        mmWidth = 31485
        BandType = 0
      end
      object pphlCopNoSf: TppLabel
        FontRatio.Auto = False
        UserName = 'hlCopNoSf'
        Caption = 'hlCopNoSf'
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
        mmLeft = 4763
        mmTop = 4233
        mmWidth = 14288
        BandType = 0
      end
      object pphlCopNameSf: TppLabel
        FontRatio.Auto = False
        UserName = 'hlCopNameSf'
        Caption = 'hlCopNameSf'
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
        mmLeft = 20638
        mmTop = 4233
        mmWidth = 17463
        BandType = 0
      end
      object ppLTitle: TppLabel
        FontRatio.Auto = False
        UserName = 'LTitle'
        Caption = '社員メモ項目確認表'
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
        mmLeft = 150019
        mmTop = 7145
        mmWidth = 57150
        BandType = 0
      end
      object ppLabel2: TppLabel
        FontRatio.Auto = False
        UserName = 'Label2'
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
        mmLeft = 21431
        mmTop = 17198
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel5: TppLabel
        FontRatio.Auto = False
        UserName = 'Label5'
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
        mmLeft = 57679
        mmTop = 17198
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel6: TppLabel
        FontRatio.Auto = False
        UserName = 'Label6'
        Caption = '項目名'
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
        mmLeft = 99484
        mmTop = 17198
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel7: TppLabel
        FontRatio.Auto = False
        UserName = 'Label7'
        Caption = '内  容'
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
        mmLeft = 220398
        mmTop = 17198
        mmWidth = 9525
        BandType = 0
      end
      object ppLine1: TppLine
        FontRatio.Auto = False
        UserName = 'Line1'
        Position = lpBottom
        Style = lsDouble
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 149000
        mmTop = 10371
        mmWidth = 60000
        BandType = 0
      end
      object ppLineHV01: TppLine
        FontRatio.Auto = False
        UserName = 'LineHV01'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 75671
        mmTop = 6879
        mmWidth = 4233
        BandType = 0
      end
      object ppLineHV02: TppLine
        FontRatio.Auto = False
        UserName = 'LineHV02'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 81492
        mmTop = 6879
        mmWidth = 4233
        BandType = 0
      end
      object ppLineHV03: TppLine
        FontRatio.Auto = False
        UserName = 'LineHV03'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 87842
        mmTop = 7408
        mmWidth = 4233
        BandType = 0
      end
      object ppLineHV04: TppLine
        FontRatio.Auto = False
        UserName = 'LineHV04'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 94721
        mmTop = 7938
        mmWidth = 4233
        BandType = 0
      end
      object ppLineHV05: TppLine
        FontRatio.Auto = False
        UserName = 'LineHV05'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 102129
        mmTop = 7673
        mmWidth = 4233
        BandType = 0
      end
      object ppLineHV06: TppLine
        FontRatio.Auto = False
        UserName = 'LineHV06'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 105834
        mmTop = 7938
        mmWidth = 4233
        BandType = 0
      end
      object ppLineHV07: TppLine
        FontRatio.Auto = False
        UserName = 'LineHV07'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 121179
        mmTop = 6350
        mmWidth = 4233
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
        mmLeft = 16669
        mmTop = 12435
        mmWidth = 19315
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
        mmLeft = 37042
        mmTop = 12435
        mmWidth = 11377
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforeGenerate = ppDetailBand1BeforeGenerate
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBEmpName: TppDBText
        FontRatio.Auto = True
        FontRatio.Minimum = 80
        UserName = 'DBEmpName'
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
        mmLeft = 36513
        mmTop = 600
        mmWidth = 53181
        BandType = 4
      end
      object ppDBEmpNo: TppDBText
        FontRatio.Auto = False
        UserName = 'DBEmpNo'
        Alignment = taRightJustify
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
        mmLeft = 18000
        mmTop = 600
        mmWidth = 16404
        BandType = 4
      end
      object ppDBMemoT01: TppDBText
        FontRatio.Auto = False
        UserName = 'DBMemoT01'
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
        mmLeft = 91546
        mmTop = 600
        mmWidth = 26458
        BandType = 4
      end
      object ppDBMemo01: TppDBText
        FontRatio.Auto = True
        UserName = 'DBMemo01'
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
        mmLeft = 120386
        mmTop = 600
        mmWidth = 209000
        BandType = 4
      end
      object ppLineDH01: TppLine
        FontRatio.Auto = False
        UserName = 'LineDH01'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 4233
        mmTop = 5556
        mmWidth = 53975
        BandType = 4
      end
      object ppLineDH02: TppLine
        FontRatio.Auto = False
        UserName = 'LineDH02'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 59796
        mmTop = 5556
        mmWidth = 260086
        BandType = 4
      end
      object ppLineDV01: TppLine
        FontRatio.Auto = False
        UserName = 'LineDV01'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 42333
        mmTop = 8202
        mmWidth = 4233
        BandType = 4
      end
      object ppLineDV02: TppLine
        FontRatio.Auto = False
        UserName = 'LineDV02'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 46567
        mmTop = 7673
        mmWidth = 4233
        BandType = 4
      end
      object ppLineDV03: TppLine
        FontRatio.Auto = False
        UserName = 'LineDV03'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 52652
        mmTop = 8467
        mmWidth = 4233
        BandType = 4
      end
      object ppLineDV04: TppLine
        FontRatio.Auto = False
        UserName = 'LineDV04'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 57679
        mmTop = 8467
        mmWidth = 4233
        BandType = 4
      end
      object ppLineDV05: TppLine
        FontRatio.Auto = False
        UserName = 'LineDV05'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 62177
        mmTop = 8467
        mmWidth = 4233
        BandType = 4
      end
      object ppLineDV06: TppLine
        FontRatio.Auto = False
        UserName = 'LineDV06'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 67204
        mmTop = 8467
        mmWidth = 4233
        BandType = 4
      end
      object ppLineDV07: TppLine
        FontRatio.Auto = False
        UserName = 'LineDV07'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 73554
        mmTop = 7938
        mmWidth = 4233
        BandType = 4
      end
      object ppLineDH03: TppLine
        FontRatio.Auto = False
        UserName = 'LineDH03'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 109009
        mmTop = 8996
        mmWidth = 53975
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppfsvPageSf: TppSystemVariable
        FontRatio.Auto = False
        UserName = 'fsvPageSf'
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
        mmLeft = 170000
        mmTop = 2000
        mmWidth = 1588
        BandType = 8
      end
      object LppAccOfficeSf: TppLabel
        FontRatio.Auto = False
        UserName = 'LppAccOfficeSf'
        Alignment = taRightJustify
        Caption = 'LppAccOfficeSf'
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
        mmLeft = 322263
        mmTop = 3440
        mmWidth = 22225
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'RecId'
      DataPipeline = ppDBPipeline1
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
  object MdPrn: TdxMemData
    Active = True
    SortOptions = []
    Left = 4
    Top = 8
  end
  object DsPrn: TDataSource
    DataSet = MdPrn
    Left = 36
    Top = 6
  end
end
