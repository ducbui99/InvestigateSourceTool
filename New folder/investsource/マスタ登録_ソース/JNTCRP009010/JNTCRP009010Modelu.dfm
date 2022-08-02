object DataHelper: TDataHelper
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 452
  Width = 448
  object SPMasKmk: TFDStoredProc
    StoredProcName = 'MP_MAS_CHK_KMKMA'
    Left = 24
    Top = 16
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0
      end
      item
        Name = '@CNCode'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0
      end
      item
        Name = '@RetCd'
        DataType = ftInteger
        ParamType = ptInputOutput
        Value = 0
      end
      item
        Name = '@errMsg'
        DataType = ftString
        ParamType = ptInputOutput
        Value = ''
      end>
  end
  object SPPayKmk: TFDStoredProc
    StoredProcName = 'MP_PAY_CHK_KMKMA'
    Left = 56
    Top = 16
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0
      end
      item
        Name = '@CNCode'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0
      end
      item
        Name = '@RetCd'
        DataType = ftInteger
        ParamType = ptInputOutput
      end
      item
        Name = '@errMsg'
        DataType = ftString
        ParamType = ptInputOutput
        Value = ''
      end>
  end
  object SPCrdKmk: TFDStoredProc
    StoredProcName = 'MP_CRD_CHK_KMKMA'
    Left = 88
    Top = 16
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0
      end
      item
        Name = '@CNCode'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0
      end
      item
        Name = '@RetCd'
        DataType = ftInteger
        ParamType = ptInputOutput
        Value = 0
      end
      item
        Name = '@errMsg'
        DataType = ftString
        ParamType = ptInputOutput
        Value = ''
      end>
  end
  object SPMsHist: TFDStoredProc
    StoredProcName = 'MP_MSHIST_SETINFO'
    Left = 121
    Top = 16
    ParamData = <
      item
        Name = '@pSyoriKbn'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@pMSHistKbn'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@pTanNCode'
        DataType = ftCurrency
        ParamType = ptInput
      end
      item
        Name = '@pTanSimpleName'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = '@pSysCode'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@pOptCode'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@pPrgCode'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DMemSaimoku_Dsp: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterPost = DMemSaimoku_DspAfterPost
    Left = 40
    Top = 80
    object DMemSaimoku_DspCNCode: TFloatField
      FieldName = 'CNCode'
    end
    object DMemSaimoku_DspSubCode: TStringField
      DisplayWidth = 16
      FieldName = 'SubCode'
      Size = 16
    end
    object DMemSaimoku_DspRenso: TStringField
      DisplayWidth = 10
      FieldName = 'Renso'
      Size = 10
    end
    object DMemSaimoku_DspLongName: TStringField
      DisplayWidth = 30
      FieldName = 'LongName'
      Size = 30
    end
    object DMemSaimoku_DspSimpleName: TStringField
      DisplayWidth = 14
      FieldName = 'SimpleName'
      Size = 14
    end
    object DMemSaimoku_DspSyokuchiKbn: TIntegerField
      FieldName = 'SyokuchiKbn'
    end
    object DMemSaimoku_DspKmkNCode: TFloatField
      FieldName = 'KmkNCode'
    end
  end
  object DMemSaimoku_Prn: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 40
    Top = 176
    object DMemSaimoku_PrnKmkGCode: TIntegerField
      FieldName = 'KmkGCode'
    end
    object DMemSaimoku_PrnKmkSimpleName: TStringField
      DisplayWidth = 14
      FieldName = 'KmkSimpleName'
      Size = 14
    end
    object DMemSaimoku_PrnSubCode: TStringField
      DisplayWidth = 10
      FieldName = 'SubCode'
      Size = 10
    end
    object DMemSaimoku_PrnRenso: TStringField
      DisplayWidth = 10
      FieldName = 'Renso'
      Size = 10
    end
    object DMemSaimoku_PrnLongName: TStringField
      DisplayWidth = 30
      FieldName = 'LongName'
      Size = 30
    end
    object DMemSaimoku_PrnSimpleName: TStringField
      DisplayWidth = 14
      FieldName = 'SimpleName'
      Size = 14
    end
    object DMemSaimoku_PrnCodeAttr: TIntegerField
      FieldName = 'CodeAttr'
    end
    object DMemSaimoku_PrnSortStr: TStringField
      DisplayWidth = 27
      FieldName = 'SortStr'
      Size = 27
    end
  end
  object DMemSaimoku_Save: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 40
    Top = 128
    object DMemSaimoku_SaveCNCode: TFloatField
      FieldName = 'CNCode'
    end
    object DMemSaimoku_SaveSubCode: TStringField
      DisplayWidth = 16
      FieldName = 'SubCode'
      Size = 16
    end
    object DMemSaimoku_SaveRenso: TStringField
      DisplayWidth = 10
      FieldName = 'Renso'
      Size = 10
    end
    object DMemSaimoku_SaveLongName: TStringField
      DisplayWidth = 30
      FieldName = 'LongName'
      Size = 30
    end
    object DMemSaimoku_SaveSimpleName: TStringField
      DisplayWidth = 14
      FieldName = 'SimpleName'
      Size = 14
    end
    object DMemSaimoku_SaveSyokuchiKbn: TIntegerField
      FieldName = 'SyokuchiKbn'
    end
    object DMemSaimoku_SaveKmkNCode: TFloatField
      FieldName = 'KmkNCode'
    end
  end
  object RSaimoku: TppReport
    AutoStop = False
    DataPipeline = RPipeline_Saimoku
    OnEndPage = RSaimokuEndPage
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RReport1'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 7000
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 7000
    PrinterSetup.mmMarginTop = 7000
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 256
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
    Template.FileName = 'D:\Delphi\MADJ\ADJ0350\adj0350rb.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = OnCommonBeforePrint
    DeviceType = 'Printer'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    ShowAutoSearchDialog = True
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 41
    Top = 224
    Version = '19.04'
    mmColumnWidth = 339067
    DataPipelineName = 'RPipeline_Saimoku'
    object ppTitleBand2: TppTitleBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppLineBootom: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LineBottom'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 63500
        mmTop = 16933
        mmWidth = 208280
        BandType = 0
        LayerName = Foreground
      end
      object ppLineLeft: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LineLeft'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 63500
        mmTop = 16933
        mmWidth = 529
        BandType = 0
        LayerName = Foreground
      end
      object ppLineTop: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LineTop'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2032
        mmLeft = 63500
        mmTop = 16942
        mmWidth = 208280
        BandType = 0
        LayerName = Foreground
      end
      object ppLine15: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 121971
        mmTop = 7409
        mmWidth = 92101
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel50: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31185#30446#21029#35036#21161#30331#37682#12522#12473#12488
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 18
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = True
        mmHeight = 6350
        mmLeft = 123571
        mmTop = 4234
        mmWidth = 88900
        BandType = 0
        LayerName = Foreground
      end
      object R_SDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'SVppDate'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        VarType = vtDateTime
        DisplayFormat = 'yyyy/mm/dd hh:mm:ss'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3969
        mmLeft = 273635
        mmTop = 0
        mmWidth = 64008
        BandType = 0
        LayerName = Foreground
      end
      object R_SCorpNo: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LppCorpCode1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = 'XXXX'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 1600
        mmTop = 0
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground
      end
      object R_SCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LppCorpName1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = 'XXXXXXXXX0XXXXXXXXX0XXXXXXXXX0XXXXXXXXX0XXXXXXXXX0XXXXXXXXX0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 16002
        mmTop = 0
        mmWidth = 96012
        BandType = 0
        LayerName = Foreground
      end
      object ppLine17: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 124460
        mmTop = 16934
        mmWidth = 2116
        BandType = 0
        LayerName = Foreground
      end
      object ppLine18: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line10'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 185420
        mmTop = 16934
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground
      end
      object ppLine19: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line101'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 236220
        mmTop = 16934
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground
      end
      object ppLine31: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line31'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 86868
        mmTop = 16933
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground
      end
      object ppLine33: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line33'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 149860
        mmTop = 16934
        mmWidth = 2116
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel53: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'RLKamokuName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12467#12540#12489
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 72390
        mmTop = 17463
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel18: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'RLKamokuName2'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31185#30446#21517
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 93706
        mmTop = 17463
        mmWidth = 27781
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel51: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'RLKamokuName3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12467#12540#12489
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 134620
        mmTop = 17463
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel52: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label52'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#24335#31185#30446#21029#35036#21161#21517
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 190236
        mmTop = 17463
        mmWidth = 44186
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel55: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#21517
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 240507
        mmTop = 17463
        mmWidth = 28575
        BandType = 0
        LayerName = Foreground
      end
      object ppLineRight: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LineRight'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 269749
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36899#24819
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 157957
        mmTop = 17463
        mmWidth = 23548
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand_Saimoku: TppDetailBand
      BeforeGenerate = ppDetailBand_SaimokuBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppUnderLineS: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 63500
        mmTop = 0
        mmWidth = 208280
        BandType = 4
        LayerName = Foreground
      end
      object R_KmkCode: TppDBText
        OnPrint = R_KmkCodePrint
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KmkGCode'
        DataPipeline = RPipeline_Saimoku
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'RPipeline_Saimoku'
        mmHeight = 3175
        mmLeft = 64029
        mmTop = 445
        mmWidth = 23896
        BandType = 4
        LayerName = Foreground
      end
      object R_KmkName: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KmkSimpleName'
        DataPipeline = RPipeline_Saimoku
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'RPipeline_Saimoku'
        mmHeight = 3175
        mmLeft = 89779
        mmTop = 445
        mmWidth = 35634
        BandType = 4
        LayerName = Foreground
      end
      object ppLine22: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 86868
        mmTop = 0
        mmWidth = 2116
        BandType = 4
        LayerName = Foreground
      end
      object ppLine23: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 185420
        mmTop = 0
        mmWidth = 2116
        BandType = 4
        LayerName = Foreground
      end
      object ppLine24: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 63500
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine26: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line9'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 236220
        mmTop = 0
        mmWidth = 2116
        BandType = 4
        LayerName = Foreground
      end
      object ppLine27: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 269749
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object R_SubCode: TppDBText
        OnPrint = R_SubCodePrint
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Code1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SubCode'
        DataPipeline = RPipeline_Saimoku
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'RPipeline_Saimoku'
        mmHeight = 3175
        mmLeft = 127000
        mmTop = 445
        mmWidth = 24077
        BandType = 4
        LayerName = Foreground
      end
      object ppLine30: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line30'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 124460
        mmTop = 0
        mmWidth = 2116
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText49: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Kanryaku1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Renso'
        DataPipeline = RPipeline_Saimoku
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'RPipeline_Saimoku'
        mmHeight = 3175
        mmLeft = 152665
        mmTop = 445
        mmWidth = 34131
        BandType = 4
        LayerName = Foreground
      end
      object ppLine32: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line301'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 149860
        mmTop = 0
        mmWidth = 2116
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText50: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'DBText50'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'LongName'
        DataPipeline = RPipeline_Saimoku
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'RPipeline_Saimoku'
        mmHeight = 3175
        mmLeft = 188119
        mmTop = 445
        mmWidth = 49213
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText51: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText501'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SimpleName'
        DataPipeline = RPipeline_Saimoku
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'RPipeline_Saimoku'
        mmHeight = 3175
        mmLeft = 238919
        mmTop = 445
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground
      end
      object R_CodeAttr: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'R_CodeAttr'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CodeAttr'
        DataPipeline = RPipeline_Saimoku
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Visible = False
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'RPipeline_Saimoku'
        mmHeight = 2910
        mmLeft = 49477
        mmTop = 794
        mmWidth = 7673
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object R_SPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'SVppPage'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        VarType = vtPageNo
        DisplayFormat = '- ###'#38913' -'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 3175
        mmLeft = 164042
        mmTop = 0
        mmWidth = 11113
        BandType = 8
        LayerName = Foreground
      end
      object R_SKaikeiName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LppAccOffice'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12354#12356#12358#12360#12362#12363#12365#12367#12369#12371
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Visible = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 304801
        mmTop = 0
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppGroup3: TppGroup
      BreakType = btCustomField
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      NewFile = False
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object RPipeline_Saimoku: TppDBPipeline
    DataSource = DataSource_Saimoku_Prn
    UserName = 'RPipeline_Saimoku'
    Left = 43
    Top = 272
    object RPipeline_SaimokuppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object RPipeline_SaimokuppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'KmkGCode'
      FieldName = 'KmkGCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object RPipeline_SaimokuppField3: TppField
      FieldAlias = 'KmkSimpleName'
      FieldName = 'KmkSimpleName'
      FieldLength = 14
      DisplayWidth = 14
      Position = 2
    end
    object RPipeline_SaimokuppField4: TppField
      FieldAlias = 'SubCode'
      FieldName = 'SubCode'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object RPipeline_SaimokuppField5: TppField
      FieldAlias = 'Renso'
      FieldName = 'Renso'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object RPipeline_SaimokuppField6: TppField
      FieldAlias = 'LongName'
      FieldName = 'LongName'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object RPipeline_SaimokuppField7: TppField
      FieldAlias = 'SimpleName'
      FieldName = 'SimpleName'
      FieldLength = 14
      DisplayWidth = 14
      Position = 6
    end
    object RPipeline_SaimokuppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CodeAttr'
      FieldName = 'CodeAttr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object RPipeline_SaimokuppField9: TppField
      FieldAlias = 'SortStr'
      FieldName = 'SortStr'
      FieldLength = 27
      DisplayWidth = 27
      Position = 8
    end
  end
  object DataSource_Saimoku_Prn: TDataSource
    DataSet = DMemSaimoku_Prn
    Left = 42
    Top = 320
  end
end
