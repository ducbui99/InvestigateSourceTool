object JNTCRP008003PrintF: TJNTCRP008003PrintF
  Left = 231
  Top = 130
  Width = 182
  Height = 105
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
  object DDataPrint: TDataSource
    DataSet = DMDdxMemDataPrint
    Left = 77
    Top = 17
  end
  object DMDdxMemDataPrint: TdxMemData
    Active = True
    SortOptions = []
    SortedField = 'BankCode'
    Left = 47
    Top = 17
    object DMDdxMemDataPrintBankCode: TStringField
      FieldName = 'BankCode'
      Size = 4
    end
    object DMDdxMemDataPrintBankName: TStringField
      FieldName = 'BankName'
    end
    object DMDdxMemDataPrintBankKana: TStringField
      FieldName = 'BankKana'
      Size = 15
    end
    object DMDdxMemDataPrintBranchCode: TStringField
      DisplayWidth = 4
      FieldName = 'BranchCode'
      Size = 4
    end
    object DMDdxMemDataPrintBranchName: TStringField
      FieldName = 'BranchName'
    end
    object DMDdxMemDataPrintBranchKana: TStringField
      FieldName = 'BranchKana'
      Size = 15
    end
  end
  object RReport: TppReport
    AutoStop = False
    DataPipeline = PPrintDBPipeLine
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 364 x 257 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 7000
    PrinterSetup.mmMarginLeft = 20000
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
    UserName = 'Report'
    BeforePrint = RReportBeforePrint
    DeviceType = 'Screen'
    Left = 17
    Top = 18
    Version = '5.0'
    mmColumnWidth = 337067
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        FontRatio.Auto = False
        UserName = 'Label1'
        Alignment = taCenter
        Caption = '振込先銀行名登録リスト'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = 'ＭＳ 明朝'
        Font.Size = 18
        Font.Style = []
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 127529
        mmTop = 7144
        mmWidth = 69850
        BandType = 0
      end
      object ppLine2: TppLine
        FontRatio.Auto = False
        UserName = 'Line2'
        Position = lpBottom
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 127529
        mmTop = 13758
        mmWidth = 69850
        BandType = 0
      end
      object ppLabel3: TppLabel
        FontRatio.Auto = False
        UserName = 'Label3'
        Alignment = taCenter
        AutoSize = False
        Caption = '銀行No'
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
        mmLeft = 55563
        mmTop = 18785
        mmWidth = 12965
        BandType = 0
      end
      object ppLine1: TppLine
        FontRatio.Auto = False
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 54504
        mmTop = 22754
        mmWidth = 201877
        BandType = 0
      end
      object ppLabel4: TppLabel
        FontRatio.Auto = False
        UserName = 'Label4'
        Alignment = taCenter
        AutoSize = False
        Caption = '銀行名称'
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
        mmLeft = 70644
        mmTop = 18785
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel5: TppLabel
        FontRatio.Auto = False
        UserName = 'Label5'
        Alignment = taCenter
        AutoSize = False
        Caption = '銀行名称ｶﾅ'
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
        mmLeft = 114829
        mmTop = 18785
        mmWidth = 31750
        BandType = 0
      end
      object ppLabel7: TppLabel
        FontRatio.Auto = False
        UserName = 'Label7'
        Alignment = taCenter
        AutoSize = False
        Caption = '支店No'
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
        mmLeft = 150548
        mmTop = 18785
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel8: TppLabel
        FontRatio.Auto = False
        UserName = 'Label8'
        Alignment = taCenter
        AutoSize = False
        Caption = '支店名称'
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
        mmLeft = 165354
        mmTop = 18785
        mmWidth = 41054
        BandType = 0
      end
      object ppLabel9: TppLabel
        FontRatio.Auto = False
        UserName = 'Label9'
        Alignment = taCenter
        AutoSize = False
        Caption = '支店名称ｶﾅ'
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
        mmLeft = 210080
        mmTop = 18785
        mmWidth = 36248
        BandType = 0
      end
      object SVppDate: TppSystemVariable
        FontRatio.Auto = False
        UserName = 'SVppDate'
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
        mmLeft = 314061
        mmTop = 2117
        mmWidth = 15875
        BandType = 0
      end
      object LppCorpCode: TppLabel
        FontRatio.Auto = False
        UserName = 'LppCorpCode'
        Caption = 'LppCorpCode'
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
        mmLeft = 2646
        mmTop = 2117
        mmWidth = 17463
        BandType = 0
      end
      object LppCorpName: TppLabel
        FontRatio.Auto = False
        UserName = 'LppCorpName'
        Caption = 'LppCorpName'
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
        mmLeft = 24342
        mmTop = 2117
        mmWidth = 17463
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText1'
        DataField = 'BankCode'
        DataPipeline = PPrintDBPipeLine
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
        mmHeight = 3440
        mmLeft = 55563
        mmTop = 528
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText2: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText290101234567890'
        DataField = 'BankName'
        DataPipeline = PPrintDBPipeLine
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
        mmHeight = 3440
        mmLeft = 70644
        mmTop = 528
        mmWidth = 42333
        BandType = 4
      end
      object ppDBText3: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText21230123456789'
        DataField = 'BankKana'
        DataPipeline = PPrintDBPipeLine
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
        mmHeight = 3440
        mmLeft = 114829
        mmTop = 528
        mmWidth = 31750
        BandType = 4
      end
      object ppDBText5: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText2'
        DataField = 'BranchCode'
        DataPipeline = PPrintDBPipeLine
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
        mmHeight = 3440
        mmLeft = 150548
        mmTop = 528
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText6: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText31230123456789'
        DataField = 'BranchName'
        DataPipeline = PPrintDBPipeLine
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
        mmHeight = 3440
        mmLeft = 165365
        mmTop = 528
        mmWidth = 41540
        BandType = 4
      end
      object ppDBText7: TppDBText
        FontRatio.Auto = False
        UserName = 'DBText312301234'
        DataField = 'BranchKana'
        DataPipeline = PPrintDBPipeLine
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
        mmHeight = 3440
        mmLeft = 210080
        mmTop = 528
        mmWidth = 36248
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object SVppPage: TppSystemVariable
        FontRatio.Auto = False
        UserName = 'SVppPage'
        Alignment = taCenter
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
        mmLeft = 162719
        mmTop = 1323
        mmWidth = 1588
        BandType = 8
      end
      object ppJimushoName: TppLabel
        FontRatio.Auto = False
        UserName = 'JimushoName'
        Alignment = taRightJustify
        Caption = 'JimushoName'
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
        mmLeft = 312738
        mmTop = 1058
        mmWidth = 17463
        BandType = 8
      end
    end
  end
  object PPrintDBPipeLine: TppDBPipeline
    DataSource = DDataPrint
    UserName = 'PPrintDBPipeLine'
    Left = 107
    Top = 18
    object PPrintDBPipeLineppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object PPrintDBPipeLineppField2: TppField
      FieldAlias = 'BankCode'
      FieldName = 'BankCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 1
    end
    object PPrintDBPipeLineppField3: TppField
      FieldAlias = 'BankName'
      FieldName = 'BankName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object PPrintDBPipeLineppField4: TppField
      FieldAlias = 'BankKana'
      FieldName = 'BankKana'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object PPrintDBPipeLineppField5: TppField
      FieldAlias = 'BranchCode'
      FieldName = 'BranchCode'
      FieldLength = 4
      DisplayWidth = 4
      Position = 4
    end
    object PPrintDBPipeLineppField6: TppField
      FieldAlias = 'BranchName'
      FieldName = 'BranchName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object PPrintDBPipeLineppField7: TppField
      FieldAlias = 'BranchKana'
      FieldName = 'BranchKana'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
  end
end
