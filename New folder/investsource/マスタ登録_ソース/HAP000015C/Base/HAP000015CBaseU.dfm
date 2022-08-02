object HAP000015CBaseF: THAP000015CBaseF
  Left = 603
  Top = 255
  ClientHeight = 453
  ClientWidth = 965
  Color = 15921906
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TMPanel
    Left = 0
    Top = 32
    Width = 940
    Height = 410
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 0
    object MPanel3: TMPanel
      Left = 0
      Top = 389
      Width = 940
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 1
      object MLabel2: TMLabel
        Left = 0
        Top = 16
        Width = 940
        Height = 1
        Align = alBottom
        AutoSize = False
        Color = clSilver
        ParentColor = False
        FontRatio.Auto = False
      end
      object MPanel7: TMPanel
        Left = 0
        Top = 17
        Width = 940
        Height = 4
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
      end
    end
    object MPanel4: TMPanel
      Left = 0
      Top = 32
      Width = 5
      Height = 357
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 2
    end
    object MPanel2: TMPanel
      Left = 5
      Top = 32
      Width = 930
      Height = 357
      Align = alClient
      BevelInner = bvLowered
      ParentBackground = False
      ParentColor = True
      TabOrder = 4
      object DxKyoGrid: TdxDBGrid
        Left = 2
        Top = 2
        Width = 926
        Height = 353
        Bands = <
          item
            Caption = #21463#35611#25945#32946#21517
            Fixed = bfLeft
          end
          item
            Caption = #20998#39006
          end
          item
            Caption = #25945#32946#21306#20998
          end
          item
            Caption = #25945#32946#26085#65288#33258#65289
          end
          item
            Caption = #32066#20102#20104#23450#26085
          end
          item
            Caption = #25945#32946#26085#65288#33267#65289
          end
          item
            Caption = #25945#32946#22243#20307#12467#12540#12489
          end
          item
            Caption = #21463#35611#37329#38989
          end
          item
            Caption = #29305#35352#20107#38917
          end
          item
            Caption = #25968#20516#65297
          end
          item
            Caption = #25991#23383#65297
          end
          item
            Caption = #26085#20184#65297
          end
          item
            Caption = #25968#20516#65298
          end
          item
            Caption = #25991#23383#65298
          end
          item
            Caption = #26085#20184#65298
          end
          item
            Caption = #25968#20516#65299
          end
          item
            Caption = #25991#23383#65299
          end
          item
            Caption = #26085#20184#65299
          end
          item
            Caption = #25968#20516#65300
          end
          item
            Caption = #25991#23383#65300
          end
          item
            Caption = #26085#20184#65300
          end
          item
            Caption = #25968#20516#65301
          end
          item
            Caption = #25991#23383#65301
          end
          item
            Caption = #26085#20184#65301
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'RecId'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        OnKeyDown = DxKyoGridKeyDown
        OnKeyPress = DxKyoGridKeyPress
        AutoSearchColor = clAqua
        BandColor = 13680832
        DataSource = KyoDataSource
        FixedBandLineColor = clSilver
        FixedBandLineWidth = 1
        GridLineColor = clSilver
        GroupNodeTextColor = clWindowText
        HeaderColor = 13680832
        HideFocusRect = True
        HideSelectionColor = clWindow
        HideSelectionTextColor = clWindowText
        HighlightTextColor = clWindowText
        LookAndFeel = lfFlat
        Options = [egoEditing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoCaseInsensitive, egoIndicator, egoResetColumnFocus]
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
        ShowBands = True
        ShowHeader = False
        OnBeforeChangeColumn = DxKyoGridBeforeChangeColumn
        object DxKyoGridColumn7: TdxDBGridButtonColumn
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Sizing = False
          Width = 60
          BandIndex = 0
          RowIndex = 0
          ImeMode = imDisable
          MaxLength = 5
          StretchChar.Auto = False
          FieldName = 'JukouCode'
          OnEditButtonClick = DxKyoGridColumn7EditButtonClick
        end
        object DxKyoGridColumn1: TdxDBGridColumn
          DisableEditor = True
          HeaderAlignment = taCenter
          TabStop = False
          Width = 160
          BandIndex = 0
          RowIndex = 0
          ImeMode = imClose
          StretchChar.Auto = True
          FieldName = 'JukouName'
        end
        object DxKyoGridColumn8: TdxDBGridPickColumn
          DisableCustomizing = True
          DisableEditor = True
          TabStop = False
          Width = 80
          BandIndex = 1
          RowIndex = 0
          ImeMode = imClose
          StretchChar.Auto = True
          FieldName = 'KyoBunya'
          DropDownSelectEx = False
        end
        object DxKyoGridColumn2: TdxDBGridColumn
          DisableEditor = True
          TabStop = False
          Width = 80
          BandIndex = 2
          RowIndex = 0
          ImeMode = imDisable
          StretchChar.Auto = False
          FieldName = 'KyoKbnName'
        end
        object DxKyoGridColumn3: TdxDBGridDateColumn
          Alignment = taRightJustify
          Width = 80
          BandIndex = 3
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'KyoDateStart'
          DropDownSelectEx = False
          DateOnError = deNull
          Gengou = 'H'
        end
        object DxKyoGridColumn9: TdxDBGridDateColumn
          Alignment = taCenter
          Width = 80
          BandIndex = 4
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taCenter
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'EduExpDate'
          DropDownSelectEx = False
          Gengou = 'H'
        end
        object DxKyoGridColumn4: TdxDBGridDateColumn
          Alignment = taRightJustify
          Width = 80
          BandIndex = 5
          RowIndex = 0
          ImeMode = imDisable
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'KyoDateEnd'
          DropDownSelectEx = False
          DateOnError = deNull
          Gengou = 'H'
        end
        object DxKyoGridColumn10: TdxDBGridButtonColumn
          Width = 60
          BandIndex = 6
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 5
          StretchChar.Auto = False
          FieldName = 'EduOrg'
          OnEditButtonClick = DxKyoGridColumn10EditButtonClick
        end
        object DxKyoGridColumn11: TdxDBGridColumn
          DisableEditor = True
          ReadOnly = True
          TabStop = False
          Width = 160
          BandIndex = 6
          RowIndex = 0
          StretchChar.Auto = True
          FieldName = 'EduOrgName'
        end
        object DxKyoGridColumn12: TdxDBGridMaskColumn
          Alignment = taRightJustify
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          Width = 90
          BandIndex = 7
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'EduFee'
        end
        object DxKyoGridColumn5: TdxDBGridColumn
          MinWidth = 0
          Width = 240
          BandIndex = 8
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 40
          StretchChar.Auto = True
          FieldName = 'Kyojikou'
        end
        object DxKyoGridColumn13: TdxDBGridMaskColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          Width = 90
          BandIndex = 9
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'ExNum1'
        end
        object DxKyoGridColumn14: TdxDBGridColumn
          MinWidth = 0
          Width = 140
          BandIndex = 10
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 40
          StretchChar.Auto = True
          FieldName = 'ExText1'
        end
        object DxKyoGridColumn15: TdxDBGridDateColumn
          Width = 80
          BandIndex = 11
          RowIndex = 0
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'ExDate1'
          DropDownSelectEx = False
          Gengou = 'H'
        end
        object DxKyoGridColumn16: TdxDBGridMaskColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          Width = 90
          BandIndex = 12
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'ExNum2'
        end
        object DxKyoGridColumn17: TdxDBGridColumn
          MinWidth = 0
          Width = 140
          BandIndex = 13
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 40
          StretchChar.Auto = True
          FieldName = 'ExText2'
        end
        object DxKyoGridColumn18: TdxDBGridDateColumn
          Width = 80
          BandIndex = 14
          RowIndex = 0
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'ExDate2'
          DropDownSelectEx = False
          Gengou = 'H'
        end
        object DxKyoGridColumn19: TdxDBGridMaskColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          Width = 90
          BandIndex = 15
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'ExNum3'
        end
        object DxKyoGridColumn20: TdxDBGridColumn
          MinWidth = 0
          Width = 140
          BandIndex = 16
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 40
          StretchChar.Auto = True
          FieldName = 'ExText3'
        end
        object DxKyoGridColumn21: TdxDBGridDateColumn
          Width = 80
          BandIndex = 17
          RowIndex = 0
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'ExDate3'
          DropDownSelectEx = False
          Gengou = 'H'
        end
        object DxKyoGridColumn22: TdxDBGridMaskColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          Width = 90
          BandIndex = 18
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'ExNum4'
        end
        object DxKyoGridColumn23: TdxDBGridColumn
          MinWidth = 0
          Width = 140
          BandIndex = 19
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 40
          StretchChar.Auto = True
          FieldName = 'ExText4'
        end
        object DxKyoGridColumn24: TdxDBGridDateColumn
          Width = 80
          BandIndex = 20
          RowIndex = 0
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'ExDate4'
          DropDownSelectEx = False
          Gengou = 'H'
        end
        object DxKyoGridColumn25: TdxDBGridMaskColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          Width = 90
          BandIndex = 21
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'ExNum5'
        end
        object DxKyoGridColumn26: TdxDBGridColumn
          MinWidth = 0
          Width = 140
          BandIndex = 22
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 40
          StretchChar.Auto = True
          FieldName = 'ExText5'
        end
        object DxKyoGridColumn27: TdxDBGridDateColumn
          Width = 80
          BandIndex = 23
          RowIndex = 0
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'ExDate5'
          DropDownSelectEx = False
          Gengou = 'H'
        end
      end
    end
    object MPanel5: TMPanel
      Left = 935
      Top = 32
      Width = 5
      Height = 357
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 3
    end
    object MPanel1: TMPanel
      Left = 0
      Top = 0
      Width = 940
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object MLabel4: TMLabel
        Left = 0
        Top = 4
        Width = 940
        Height = 1
        Align = alTop
        AutoSize = False
        Color = clSilver
        ParentColor = False
        FontRatio.Auto = False
      end
      object LKyoWarning: TMLabel
        Left = 148
        Top = 11
        Width = 205
        Height = 19
        AutoSize = False
        Caption = #20214#25968#19978#38480#12414#12391#30331#37682#12373#12428#12390#12356#12414#12377#12290
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        FontRatio.Auto = False
      end
      object MLabel3: TMLabel
        Left = 112
        Top = 11
        Width = 21
        Height = 19
        AutoSize = False
        Caption = #20214
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        FontRatio.Auto = False
      end
      object LKyoCnt: TMLabel
        Left = 58
        Top = 11
        Width = 50
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        Caption = '9,999'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#26126#26397
        Font.Style = []
        ParentFont = False
        MBottomMargin = 1
        MRightMargin = 2
        BorderLine = tmb3DDown
        FontRatio.Auto = False
      end
      object lblKbn: TMLabel
        Left = 12
        Top = 11
        Width = 40
        Height = 19
        AutoSize = False
        Caption = #25945#32946
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        FontRatio.Auto = False
      end
      object MPanel6: TMPanel
        Left = 0
        Top = 0
        Width = 940
        Height = 4
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
      end
    end
  end
  object PTool: TMPanel
    Left = 0
    Top = 0
    Width = 205
    Height = 21
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 1
  end
  object KyoMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforeInsert = KyoMemDataBeforeInsert
    AfterInsert = KyoMemDataAfterInsert
    BeforePost = KyoMemDataBeforePost
    AfterPost = KyoMemDataAfterPost
    AfterDelete = KyoMemDataAfterDelete
    AfterScroll = KyoMemDataAfterScroll
    Left = 757
    Top = 102
    object KyoMemDataJukouCode: TIntegerField
      DisplayWidth = 5
      FieldName = 'JukouCode'
      OnChange = KyoMemDataJukouCodeChange
      DisplayFormat = '#'
    end
    object KyoMemDataJukouName: TStringField
      DisplayWidth = 40
      FieldName = 'JukouName'
      KeyFields = 'JukouCode'
      Size = 40
    end
    object KyoMemDataKyoBunya: TStringField
      FieldName = 'KyoBunya'
    end
    object KyoMemDataKyoKbnName: TStringField
      FieldName = 'KyoKbnName'
    end
    object KyoMemDataKyoDateStart: TDateTimeField
      FieldName = 'KyoDateStart'
    end
    object KyoMemDataEduExpDate: TDateField
      FieldName = 'EduExpDate'
    end
    object KyoMemDataKyoDateEnd: TDateTimeField
      FieldName = 'KyoDateEnd'
    end
    object KyoMemDataEduOrg: TIntegerField
      DisplayWidth = 5
      FieldName = 'EduOrg'
      OnChange = KyoMemDataEduOrgChange
      DisplayFormat = '#'
    end
    object KyoMemDataEduOrgName: TStringField
      FieldName = 'EduOrgName'
      Size = 40
    end
    object KyoMemDataEduFee: TCurrencyField
      DisplayWidth = 8
      FieldName = 'EduFee'
      DisplayFormat = '#,#0'
      EditFormat = '#,#0'
    end
    object KyoMemDataKyojikou: TStringField
      FieldName = 'Kyojikou'
      Size = 40
    end
    object KyoMemDataEntNo: TIntegerField
      FieldName = 'EntNo'
    end
    object KyoMemDataExNum1: TIntegerField
      FieldName = 'ExNum1'
      DisplayFormat = '#,#0'
      EditFormat = '#,#0'
    end
    object KyoMemDataExText1: TStringField
      FieldName = 'ExText1'
      Size = 40
    end
    object KyoMemDataExDate1: TDateField
      FieldName = 'ExDate1'
    end
    object KyoMemDataExNum2: TIntegerField
      FieldName = 'ExNum2'
      DisplayFormat = '#,#0'
      EditFormat = '#,#0'
    end
    object KyoMemDataExText2: TStringField
      FieldName = 'ExText2'
      Size = 40
    end
    object KyoMemDataExDate2: TDateField
      FieldName = 'ExDate2'
    end
    object KyoMemDataExNum3: TIntegerField
      FieldName = 'ExNum3'
      DisplayFormat = '#,#0'
      EditFormat = '#,#0'
    end
    object KyoMemDataExText3: TStringField
      FieldName = 'ExText3'
      Size = 40
    end
    object KyoMemDataExDate3: TDateField
      FieldName = 'ExDate3'
    end
    object KyoMemDataExNum4: TIntegerField
      FieldName = 'ExNum4'
      DisplayFormat = '#,#0'
      EditFormat = '#,#0'
    end
    object KyoMemDataExText4: TStringField
      FieldName = 'ExText4'
      Size = 40
    end
    object KyoMemDataExDate4: TDateField
      FieldName = 'ExDate4'
    end
    object KyoMemDataExNum5: TIntegerField
      FieldName = 'ExNum5'
      DisplayFormat = '#,#0'
      EditFormat = '#,#0'
    end
    object KyoMemDataExText5: TStringField
      FieldName = 'ExText5'
      Size = 40
    end
    object KyoMemDataExDate5: TDateField
      FieldName = 'ExDate5'
    end
  end
  object KyoDataSource: TDataSource
    DataSet = KyoMemData
    Left = 785
    Top = 102
  end
end
