object DmJNTCRP019001L: TDmJNTCRP019001L
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 325
  Width = 537
  object dsMain: TDataSource
    Left = 32
    Top = 32
  end
  object bdeplMain: TppDBPipeline
    DataSource = dsMain
    UserName = 'BDEPipeline'
    Left = 66
    Top = 32
  end
  object ppRep: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '20000'
      '150399')
    DataPipeline = bdeplMain
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #20998#39006#30331#37682#12522#12473#12488
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 257 x 364 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 257 x 364 mm'
    PrinterSetup.mmMarginBottom = 7000
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 7000
    PrinterSetup.mmMarginTop = 7000
    PrinterSetup.mmPaperHeight = 257000
    PrinterSetup.mmPaperWidth = 364000
    PrinterSetup.PaperSize = 12
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
    Template.FileName = 'C:\Msal\Source\ma\173\173.rtm'
    DuplexNewPage = True
    AllowPrintToArchive = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = ppRepBeforePrint
    DeviceType = 'Screen'
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
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 102
    Top = 32
    Version = '19.04'
    mmColumnWidth = 130399
    DataPipelineName = 'bdeplMain'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object LppCorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LppCorpCode'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = 'XXXXXXXX'
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
        mmLeft = 1588
        mmTop = 0
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object LppCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LppCorpName'
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
        mmLeft = 15875
        mmTop = 0
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground
      end
      object ppTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'ppTitle'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #215#215#215#215#215#215#215#215#215#215#30331#37682#12522#12473#12488
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
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 121709
        mmTop = 4233
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground
      end
      object ppTitleLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'ppTitleLine'
        Border.mmPadding = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 121709
        mmTop = 7408
        mmWidth = 95514
        BandType = 0
        LayerName = Foreground
      end
      object SVppDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'SVppDate'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        VarType = vtDateTime
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
        mmHeight = 3175
        mmLeft = 273635
        mmTop = 794
        mmWidth = 64008
        BandType = 0
        LayerName = Foreground
      end
      object ppType: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Type'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12304#65368#65368#20998#39006#65297#12305
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Visible = False
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4498
        mmLeft = 200290
        mmTop = 15346
        mmWidth = 38365
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4064
      mmPrintPosition = 0
      object ppLine5: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 30480
        mmTop = 0
        mmWidth = 83820
        BandType = 2
        LayerName = Foreground
      end
      object ppLine1: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 30480
        mmTop = 0
        mmWidth = 1270
        BandType = 2
        LayerName = Foreground
      end
      object ppLine2: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 57150
        mmTop = 0
        mmWidth = 1270
        BandType = 2
        LayerName = Foreground
      end
      object ppLine3: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 90170
        mmTop = 0
        mmWidth = 1270
        BandType = 2
        LayerName = Foreground
      end
      object ppLine4: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 113030
        mmTop = 0
        mmWidth = 1270
        BandType = 2
        LayerName = Foreground
      end
      object ppLine6: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line6'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1600
        mmLeft = 30480
        mmTop = 2464
        mmWidth = 83820
        BandType = 2
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12467#12540#12489
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 31750
        mmTop = 0
        mmWidth = 25400
        BandType = 2
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21517#31216
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 59690
        mmTop = 0
        mmWidth = 30480
        BandType = 2
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36899#24819
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 92710
        mmTop = 0
        mmWidth = 20320
        BandType = 2
        LayerName = Foreground
      end
      object ppMasterKbn: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'MasterKbn'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SetNm'
        DataPipeline = bdeplMain
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'bdeplMain'
        mmHeight = 4498
        mmLeft = 3440
        mmTop = 0
        mmWidth = 17198
        BandType = 2
        LayerName = Foreground
      end
    end
    object Repdt: TppDetailBand
      BeforeGenerate = RepdtBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4064
      mmPrintPosition = 0
      object ppLine7: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line7'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 30480
        mmTop = 0
        mmWidth = 1270
        BandType = 4
        LayerName = Foreground
      end
      object ppLine8: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line8'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 57150
        mmTop = 0
        mmWidth = 1270
        BandType = 4
        LayerName = Foreground
      end
      object ppLine9: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line9'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 90170
        mmTop = 0
        mmWidth = 1270
        BandType = 4
        LayerName = Foreground
      end
      object ppLine10: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line10'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 113030
        mmTop = 0
        mmWidth = 1270
        BandType = 4
        LayerName = Foreground
      end
      object ppBottomLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'BottomLine'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 30480
        mmTop = 2647
        mmWidth = 83820
        BandType = 4
        LayerName = Foreground
      end
      object ppCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'GCODE'
        DataPipeline = bdeplMain
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'bdeplMain'
        mmHeight = 3969
        mmLeft = 31750
        mmTop = 0
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground
      end
      object ppName: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Name'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'NMK'
        DataPipeline = bdeplMain
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'bdeplMain'
        mmHeight = 3969
        mmLeft = 59690
        mmTop = 0
        mmWidth = 30480
        BandType = 4
        LayerName = Foreground
      end
      object ppRenso: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RENSO'
        DataPipeline = bdeplMain
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'bdeplMain'
        mmHeight = 3969
        mmLeft = 92710
        mmTop = 0
        mmWidth = 20320
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      AlignToBottom = True
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object SVppPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'SVppPage'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        VarType = vtPageSet
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
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
        mmLeft = 163051
        mmTop = 265
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ppMasterKbn'
      BreakType = btCustomField
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      NewColumn = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
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
end
