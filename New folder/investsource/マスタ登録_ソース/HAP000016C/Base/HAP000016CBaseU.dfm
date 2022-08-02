object HAP000016CBaseF: THAP000016CBaseF
  Left = 444
  Top = 58
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
    Left = 1
    Top = 28
    Width = 940
    Height = 410
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 0
    object lblKbn: TMLabel
      Left = 12
      Top = 11
      Width = 40
      Height = 19
      AutoSize = False
      Caption = #36062#32624
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      FontRatio.Auto = False
    end
    object LSyoCnt: TMLabel
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
    object MLabel4: TMLabel
      Left = 5
      Top = 4
      Width = 930
      Height = 1
      AutoSize = False
      Color = clSilver
      ParentColor = False
      FontRatio.Auto = False
    end
    object MLabel5: TMLabel
      Left = 5
      Top = 400
      Width = 930
      Height = 1
      AutoSize = False
      Color = clSilver
      ParentColor = False
      FontRatio.Auto = False
    end
    object MPanel2: TMPanel
      Left = 5
      Top = 32
      Width = 933
      Height = 362
      BevelInner = bvLowered
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object DxGrid: TdxDBGrid
        Left = 2
        Top = 2
        Width = 929
        Height = 358
        Bands = <
          item
            Caption = #36062#32624
          end
          item
            Caption = #20998#39006
          end
          item
            Caption = #36062#32624#21306#20998
            Width = 80
          end
          item
            Caption = #36062#32624#24180#26376#26085
          end
          item
            Caption = #36062#32624#29702#30001
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'RecId'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        OnKeyDown = DxGridKeyDown
        OnKeyPress = DxGridKeyPress
        AutoSearchColor = clAqua
        BandColor = 13680832
        DataSource = DataSource
        FixedBandLineColor = clSilver
        GridLineColor = clSilver
        GroupNodeTextColor = clWindowText
        HeaderColor = 13680832
        HideFocusRect = True
        HideSelectionColor = clWindow
        HideSelectionTextColor = clWindowText
        HighlightTextColor = clWindowText
        LookAndFeel = lfFlat
        Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoCaseInsensitive, egoIndicator, egoResetColumnFocus]
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
        ScrollBars = ssVertical
        ShowBands = True
        ShowHeader = False
        OnBeforeChangeColumn = DxGridBeforeChangeColumn
        object DxGridColumn9: TdxDBGridButtonColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          Sizing = False
          Width = 60
          BandIndex = 0
          RowIndex = 0
          ImeMode = imDisable
          MaxLength = 5
          StretchChar.Auto = False
          FieldName = 'ShoBatsuCode'
          OnEditButtonClick = DxGridColumn9EditButtonClick
        end
        object DxGridColumn1: TdxDBGridColumn
          DisableEditor = True
          HeaderAlignment = taCenter
          TabStop = False
          Width = 265
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = True
          FieldName = 'ShoBatsu'
        end
        object DxGridColumn7: TdxDBGridPickColumn
          DisableCustomizing = True
          DisableEditor = True
          TabStop = False
          Width = 130
          BandIndex = 1
          RowIndex = 0
          ImeMode = imClose
          StretchChar.Auto = True
          FieldName = 'ShoBatsuBunya'
          DropDownSelectEx = False
        end
        object DxGridColumn6: TdxDBGridLookupColumn
          TabStop = False
          Width = 80
          BandIndex = 2
          RowIndex = 0
          ImeMode = imDisable
          MaxLength = 2
          StretchChar.Auto = True
          FieldName = 'ShoBatsuKbn'
          DropDownSelectEx = False
          ListFieldName = 'COde;Name'
          ListWidth = 180
          OnCloseUp = DxGridColumnCloseUp
        end
        object DxGridColumn4: TdxDBGridDateColumn
          Alignment = taRightJustify
          Width = 90
          BandIndex = 3
          RowIndex = 0
          ImeMode = imDisable
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'ShoBatsuDate'
          DropDownSelectEx = False
          DateOnError = deNull
          OnDateValidateInput = DxGridColumn4DateValidateInput
          Gengou = 'H'
        end
        object DxGridColumn5: TdxDBGridColumn
          MinWidth = 40
          Width = 274
          BandIndex = 4
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 40
          StretchChar.Auto = True
          FieldName = 'ShoBatsuRemarks'
        end
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
  object MemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforeInsert = MemDataBeforeInsert
    AfterInsert = MemDataAfterInsert
    BeforePost = MemDataBeforePost
    AfterPost = MemDataAfterPost
    AfterDelete = MemDataAfterDelete
    AfterScroll = MemDataAfterScroll
    Left = 797
    Top = 100
    object MemDataShoBatsuCode: TIntegerField
      FieldName = 'ShoBatsuCode'
      OnChange = MemDataShoBatsuCodeChange
      DisplayFormat = '#'
    end
    object MemDataShoBatsu: TStringField
      DisplayWidth = 40
      FieldName = 'ShoBatsu'
      KeyFields = 'ShoBatsuCode'
      Size = 40
    end
    object MemDataShoBatsuBunya: TStringField
      FieldName = 'ShoBatsuBunya'
      Size = 40
    end
    object MemDataShoBatsuKbn: TStringField
      DisplayLabel = 'ShoBatsuKbnName'
      FieldName = 'ShoBatsuKbn'
    end
    object MemDataShoBatsuDate: TDateTimeField
      FieldName = 'ShoBatsuDate'
    end
    object MemDataShoBatsuRemarks: TStringField
      FieldName = 'ShoBatsuRemarks'
      Size = 40
    end
    object MemDataEntNo: TIntegerField
      FieldName = 'EntNo'
    end
  end
  object DataSource: TDataSource
    DataSet = MemData
    Left = 797
    Top = 72
  end
end
