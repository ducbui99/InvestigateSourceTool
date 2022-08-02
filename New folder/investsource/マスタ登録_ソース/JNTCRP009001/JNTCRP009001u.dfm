object JNTCRP009001f: TJNTCRP009001f
  Left = 38
  Top = 233
  BorderStyle = bsNone
  Caption = #21208#23450#31185#30446#30331#37682#20966#29702
  ClientHeight = 600
  ClientWidth = 963
  Color = 15921906
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 209
    Top = 50
    Width = 2
    Height = 532
  end
  object P_Grid: TMPanel
    Left = 211
    Top = 50
    Width = 752
    Height = 532
    Align = alClient
    BevelOuter = bvNone
    Caption = 'P_Grid'
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentBackground = False
    ParentColor = True
    ParentFont = False
    TabOrder = 2
    OnEnter = OnEnter
    object PZitsu: TMPanel
      Left = 0
      Top = 44
      Width = 752
      Height = 488
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PZitsu'
      Color = 14608367
      ParentBackground = False
      TabOrder = 1
      Visible = False
      OnEnter = OnEnter
      object DZitsuGrid: TdxDBGrid
        Left = 0
        Top = 0
        Width = 752
        Height = 488
        Bands = <
          item
            MinWidth = 20
          end
          item
            Caption = #12467#12540#12489
          end
          item
            Caption = #36899#24819
          end
          item
            Caption = #27491#24335#21517#31216
            Width = 167
          end
          item
            Caption = #31777#30053#21517#31216
          end
          item
            Caption = #24615#26684
          end
          item
            Caption = #20998#26512
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'Code'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnEnter = DZitsuGridEnter
        OnExit = DZitsuGridExit
        OnKeyDown = DZitsuGridKeyDown
        OnKeyPress = DZitsuGridKeyPress
        OnMouseMove = DZitsuGridMouseMove
        BandColor = 7230266
        BandFont.Charset = SHIFTJIS_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -13
        BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BandFont.Style = []
        DataSource = DSourceZitsu
        HeaderColor = 7230266
        HeaderFont.Charset = SHIFTJIS_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        HeaderFont.Style = []
        HideFocusRect = True
        HideSelectionColor = clWindow
        HideSelectionTextColor = clBtnText
        HighlightColor = clWhite
        HighlightTextColor = clBlack
        LookAndFeel = lfFlat
        Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
        PreviewFont.Charset = SHIFTJIS_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -13
        PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        PreviewFont.Style = []
        ShowBands = True
        ShowHeader = False
        OnChangeColumn = DGridChangeColumn
        OnChangeNodeEx = DZitsuGridChangeNodeEx
        OnBeforeChangeColumn = DZitsuGridBeforeChangeColumn
        OnBeforeChangeNode = DZitsuGridBeforeChangeNode
        object DZitsuGridFusen: TdxDBGridGraphicColumn
          Alignment = taCenter
          Caption = #12288
          HeaderAlignment = taRightJustify
          MinWidth = 16
          TabStop = False
          Width = 16
          BandIndex = 0
          RowIndex = 0
          EditAlignment = taRightJustify
          StretchChar.Auto = False
          FieldName = 'Fusen'
          PopupToolBar.Buttons = []
          PopupToolBar.ShowCaptions = False
          PopupToolBar.Visible = False
          PopupToolbarPosStored = False
          Stretch = False
        end
        object DZitsuGridCode: TdxDBGridMaskColumn
          Caption = #12467#12540#12489
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          HeaderAlignment = taCenter
          Width = 61
          BandIndex = 1
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'Code'
        end
        object DZitsuGridRen: TdxDBGridMaskColumn
          Caption = #36899#24819
          HeaderAlignment = taCenter
          Width = 80
          BandIndex = 2
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 10
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'Ren'
        end
        object DZitsuGridLongName: TdxDBGridMaskColumn
          Caption = #27491#24335#21517#31216
          HeaderAlignment = taCenter
          Width = 167
          BandIndex = 3
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 24
          StretchChar.Auto = False
          FieldName = 'LongName'
        end
        object DZitsuGridSName: TdxDBGridMaskColumn
          Caption = #31777#30053#21517#31216
          HeaderAlignment = taCenter
          Width = 117
          BandIndex = 4
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 14
          StretchChar.Auto = False
          FieldName = 'SName'
        end
        object DZitsuGridSeikakuNO: TdxDBGridLookupColumn
          Alignment = taRightJustify
          Width = 20
          BandIndex = 5
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          StretchChar.Auto = False
          FieldName = 'SeikakuNO'
          DropDownSelectEx = False
          DropDownRows = 18
          ListFieldName = 'S_CODE;S_NAME'
          ListWidth = 150
        end
        object DZitsuGridSeikaku: TdxDBGridMaskColumn
          Caption = #24615#26684
          HeaderAlignment = taCenter
          ReadOnly = True
          TabStop = False
          Width = 109
          BandIndex = 5
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'Seikaku'
        end
        object DZitsuGridBunsekiNO: TdxDBGridButtonColumn
          MinWidth = 26
          Width = 26
          BandIndex = 6
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'BunsekiNO'
          OnEditButtonClick = DZitsuGridBunsekiNOEditButtonClick
        end
        object DZitsuGridBunseki: TdxDBGridMaskColumn
          Caption = #20998#26512
          HeaderAlignment = taCenter
          ReadOnly = True
          TabStop = False
          Width = 100
          BandIndex = 6
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'Bunseki'
        end
        object DZitsuGridFusenInfo: TdxDBGridMaskColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'FusenInfo'
        end
        object DZitsuGridRecId: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'RecId'
        end
        object DZitsuGridNCode: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'NCode'
        end
      end
    end
    object PGoukei: TMPanel
      Left = 0
      Top = 44
      Width = 752
      Height = 488
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PGoukei'
      Color = 14608367
      ParentBackground = False
      TabOrder = 0
      Visible = False
      OnEnter = OnEnter
      object DGoukeiGrid: TdxDBGrid
        Left = 0
        Top = 0
        Width = 752
        Height = 488
        Bands = <
          item
            MinWidth = 20
            Width = 32
          end
          item
            Caption = #12467#12540#12489
          end
          item
            Caption = #36899#24819
          end
          item
            Caption = #27491#24335#21517#31216
          end
          item
            Caption = #31777#30053#21517#31216
          end
          item
            Caption = #35013#39166
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'GCode'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = DGoukeiGridEnter
        OnExit = DGoukeiGridExit
        OnKeyDown = DGoukeiGridKeyDown
        OnKeyPress = DGoukeiGridKeyPress
        OnMouseMove = DGoukeiGridMouseMove
        BandColor = 7230266
        BandFont.Charset = SHIFTJIS_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -13
        BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BandFont.Style = []
        DataSource = DSourceGou
        HeaderColor = 7230266
        HeaderFont.Charset = SHIFTJIS_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        HeaderFont.Style = []
        HideFocusRect = True
        HideSelectionColor = clWindow
        HideSelectionTextColor = clBtnText
        HighlightColor = clWhite
        HighlightTextColor = clBlack
        LookAndFeel = lfFlat
        Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoBandMoving, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
        PreviewFont.Charset = SHIFTJIS_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -13
        PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        PreviewFont.Style = []
        ShowBands = True
        ShowHeader = False
        OnChangeColumn = DGridChangeColumn
        OnChangeNodeEx = DGoukeiGridChangeNodeEx
        OnBeforeChangeColumn = DGoukeiGridBeforeChangeColumn
        OnBeforeChangeNode = DGoukeiGridBeforeChangeNode
        object DGoukeiGridGFusen: TdxDBGridGraphicColumn
          Caption = #12288
          MinWidth = 16
          TabStop = False
          Width = 20
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'GFusen'
          PopupToolBar.Buttons = []
          PopupToolBar.ShowCaptions = False
          PopupToolBar.Visible = False
          PopupToolbarPosStored = False
          Stretch = False
        end
        object DGoukeiGridGCode: TdxDBGridMaskColumn
          Caption = #12467#12540#12489
          HeaderAlignment = taCenter
          Width = 61
          BandIndex = 1
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'GCode'
        end
        object DGoukeiGridGRen: TdxDBGridMaskColumn
          Caption = #36899#24819
          HeaderAlignment = taCenter
          Width = 80
          BandIndex = 2
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 10
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'GRen'
        end
        object DGoukeiGridGLongName: TdxDBGridMaskColumn
          Caption = #27491#24335#21517#31216
          HeaderAlignment = taCenter
          Width = 197
          BandIndex = 3
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 24
          StretchChar.Auto = False
          FieldName = 'GLongName'
        end
        object DGoukeiGridGSName: TdxDBGridMaskColumn
          Caption = #31777#30053#21517#31216
          HeaderAlignment = taCenter
          Width = 117
          BandIndex = 4
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 14
          StretchChar.Auto = False
          FieldName = 'GSName'
        end
        object DGoukeiGridSousyokuNo: TdxDBGridLookupColumn
          Width = 20
          BandIndex = 5
          RowIndex = 0
          ImeMode = imDisable
          StretchChar.Auto = False
          FieldName = 'SousyokuCode'
          DropDownSelectEx = False
          ListFieldName = 'SousyokuNo;Sousyoku'
          ListWidth = 70
        end
        object DGoukeiGridSousyoku: TdxDBGridMaskColumn
          Alignment = taLeftJustify
          HeaderAlignment = taCenter
          ReadOnly = True
          TabStop = False
          Width = 35
          BandIndex = 5
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'Sousyoku'
        end
        object DGoukeiGridNCode: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'NCode'
        end
      end
    end
    object MTab_N: TMTab
      Left = 0
      Top = 0
      Width = 752
      Height = 44
      Items = <
        item
          Caption = #23455#22312#31185#30446
          Color = 16766672
          SyncControl = PZitsu
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end
        item
          Caption = #31185#30446#21029#35036#21161
          Color = 16766672
          SyncControl = PSaimoku
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end
        item
          Caption = #21512#35336#31185#30446
          Color = 16766672
          SyncControl = PGoukei
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end>
      Align = alTop
      TabOrder = 3
      OnChange = MTab_NChange
      ItemWidth = 0
      ItemHeight = 0
      ItemMargin = 6
      Style = tsCrystal
      BorderHeight = 19
      BorderFont.Charset = SHIFTJIS_CHARSET
      BorderFont.Color = clWindowText
      BorderFont.Height = -12
      BorderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
      BorderFont.Style = []
      OnEnter = MTab_NEnter
      OnKeyDown = MTab_NKeyDown
      BorderCaptionAlign = taLeftJustify
      DropShadow = False
    end
    object PSaimoku: TMPanel
      Left = 0
      Top = 44
      Width = 752
      Height = 488
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PSaimoku'
      Color = 14608367
      ParentBackground = False
      TabOrder = 2
      Visible = False
      OnEnter = OnEnter
      object DSaimokuGrid: TdxDBGrid
        Left = 0
        Top = 0
        Width = 752
        Height = 488
        Bands = <
          item
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'SCode'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = DSaimokuGridEnter
        OnExit = DSaimokuGridExit
        OnKeyDown = DSaimokuGridKeyDown
        OnKeyPress = DSaimokuGridKeyPress
        OnMouseMove = DSaimokuGridMouseMove
        BandColor = 7230266
        BandFont.Charset = SHIFTJIS_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -13
        BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BandFont.Style = []
        DataSource = DSourceSai
        HeaderColor = 7230266
        HeaderFont.Charset = SHIFTJIS_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        HeaderFont.Style = []
        HideFocusRect = True
        HideSelectionColor = clWindow
        HideSelectionTextColor = clBtnText
        HighlightColor = clWhite
        HighlightTextColor = clBlack
        LookAndFeel = lfFlat
        Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoBandMoving, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
        PreviewFont.Charset = SHIFTJIS_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -13
        PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        PreviewFont.Style = []
        OnChangeColumn = DGridChangeColumn
        OnChangeNodeEx = DSaimokuGridChangeNodeEx
        OnBeforeChangeColumn = DSaimokuGridBeforeChangeColumn
        OnBeforeChangeNode = DSaimokuGridBeforeChangeNode
        object DSaimokuGridSFusen: TdxDBGridGraphicColumn
          Caption = #12288
          MinWidth = 16
          TabStop = False
          Width = 20
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'SFusen'
          PopupToolBar.Buttons = []
          PopupToolBar.ShowCaptions = False
          PopupToolBar.Visible = False
          PopupToolbarPosStored = False
          Stretch = False
        end
        object DSaimokuGridSCode: TdxDBGridMaskColumn
          Caption = #12467#12540#12489
          HeaderAlignment = taCenter
          Width = 105
          BandIndex = 0
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'SCode'
        end
        object DSaimokuGridSRen: TdxDBGridMaskColumn
          Caption = #36899#24819
          HeaderAlignment = taCenter
          Width = 80
          BandIndex = 0
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 10
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'SRen'
        end
        object DSaimokuGridSLongName: TdxDBGridMaskColumn
          Caption = #27491#24335#21517#31216
          HeaderAlignment = taCenter
          Width = 245
          BandIndex = 0
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 30
          StretchChar.Auto = False
          FieldName = 'SLongName'
        end
        object DSaimokuGridSSName: TdxDBGridMaskColumn
          Caption = #31777#30053#21517#31216
          HeaderAlignment = taCenter
          Width = 117
          BandIndex = 0
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 14
          StretchChar.Auto = False
          FieldName = 'SSName'
        end
        object DSaimokuGridNCode: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'NCode'
        end
        object DSaimokuGridCNCode: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'CNCode'
        end
      end
    end
  end
  object P_Syousai: TMPanel
    Left = 211
    Top = 50
    Width = 752
    Height = 532
    Align = alClient
    BevelOuter = bvNone
    Caption = 'P_Syousai'
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentBackground = False
    ParentColor = True
    ParentFont = False
    TabOrder = 5
    OnEnter = OnEnter
    object ScrollBox: TScrollBox
      Left = 0
      Top = 0
      Width = 752
      Height = 532
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
      object MTab_Select: TMTab
        Left = 0
        Top = 0
        Width = 752
        Height = 44
        Items = <
          item
            Caption = #23455#22312#31185#30446
            Color = 16766672
            Alignment = taCenter
            ImageIndex = -1
            ParentBorderCaption = True
          end
          item
            Caption = #31185#30446#21029#35036#21161
            Color = 16766672
            Alignment = taCenter
            ImageIndex = -1
            ParentBorderCaption = True
          end
          item
            Caption = #21512#35336#31185#30446
            Color = 16766672
            Alignment = taCenter
            ImageIndex = -1
            ParentBorderCaption = True
          end>
        Align = alTop
        TabOrder = 0
        OnChange = MTab_SelectChange
        ItemWidth = 0
        ItemHeight = 0
        ItemMargin = 6
        Style = tsCrystal
        BorderHeight = 19
        BorderFont.Charset = SHIFTJIS_CHARSET
        BorderFont.Color = clWindowText
        BorderFont.Height = -12
        BorderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BorderFont.Style = []
        OnEnter = OnEnter
        BorderCaptionAlign = taLeftJustify
        DropShadow = False
      end
      object P_SyouCli: TMPanel
        Left = 0
        Top = 119
        Width = 752
        Height = 413
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 2
        OnEnter = OnEnter
        object P_Saiyo: TMPanel
          Left = 0
          Top = 37
          Width = 752
          Height = 327
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 2
          Visible = False
          object LSaiyou: TMLabel
            Left = 15
            Top = 10
            Width = 60
            Height = 13
            AutoSize = False
            Caption = #25505#29992#21306#20998
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object LBumon: TMLabel
            Left = 30
            Top = 32
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #37096#38272
            Enabled = False
            FontRatio.Auto = False
          end
          object LBmnUse: TMLabel
            Left = 150
            Top = 30
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LGinko: TMLabel
            Left = 30
            Top = 54
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #37504#34892
            Enabled = False
            FontRatio.Auto = False
          end
          object LShain: TMLabel
            Left = 30
            Top = 98
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #31038#21729
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel10: TMLabel
            Left = 30
            Top = 164
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #27726#29992#35036#21161#65299
            Enabled = False
            FontRatio.Auto = False
          end
          object LTorihikisaki: TMLabel
            Left = 30
            Top = 76
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #21462#24341#20808
            Enabled = False
            FontRatio.Auto = False
          end
          object LHojyo1: TMLabel
            Left = 30
            Top = 120
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #27726#29992#35036#21161#65297
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel13: TMLabel
            Left = 30
            Top = 142
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #27726#29992#35036#21161#65298
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel15: TMLabel
            Left = 30
            Top = 186
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #27726#29992#35036#21161#65300
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel16: TMLabel
            Left = 30
            Top = 208
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #27726#29992#35036#21161#65301
            Enabled = False
            FontRatio.Auto = False
          end
          object LBankUse: TMLabel
            Left = 150
            Top = 52
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LToriUse: TMLabel
            Left = 150
            Top = 74
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LShainUse: TMLabel
            Left = 150
            Top = 96
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LHojyoUse1: TMLabel
            Left = 150
            Top = 118
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LHojyoUse2: TMLabel
            Left = 150
            Top = 140
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LHojyoUse3: TMLabel
            Left = 150
            Top = 162
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LHojyoUse4: TMLabel
            Left = 150
            Top = 184
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LHojyoUse5: TMLabel
            Left = 150
            Top = 206
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel17: TMLabel
            Left = 260
            Top = 32
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488#65297
            Enabled = False
            FontRatio.Auto = False
          end
          object LSegUse1: TMLabel
            Left = 380
            Top = 30
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel27: TMLabel
            Left = 260
            Top = 54
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488#65298
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel28: TMLabel
            Left = 260
            Top = 98
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488#65300
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel29: TMLabel
            Left = 260
            Top = 164
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488#65303
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel30: TMLabel
            Left = 260
            Top = 76
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488#65299
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel31: TMLabel
            Left = 260
            Top = 120
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488#65301
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel32: TMLabel
            Left = 260
            Top = 142
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488#65302
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel36: TMLabel
            Left = 260
            Top = 186
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488#65304
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel37: TMLabel
            Left = 260
            Top = 208
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488#65305
            Enabled = False
            FontRatio.Auto = False
          end
          object LSegUse2: TMLabel
            Left = 380
            Top = 52
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LSegUse3: TMLabel
            Left = 380
            Top = 74
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LSegUse4: TMLabel
            Left = 380
            Top = 96
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LSegUse5: TMLabel
            Left = 380
            Top = 118
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LSegUse6: TMLabel
            Left = 380
            Top = 140
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LSegUse7: TMLabel
            Left = 380
            Top = 162
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LSegUse8: TMLabel
            Left = 380
            Top = 184
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LSegUse9: TMLabel
            Left = 380
            Top = 206
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel48: TMLabel
            Left = 260
            Top = 230
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488#65297#65296
            Enabled = False
            FontRatio.Auto = False
          end
          object LSegUse10: TMLabel
            Left = 380
            Top = 228
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel50: TMLabel
            Left = 490
            Top = 32
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #65420#65439#65435#65404#65438#65386#65400#65412#65297
            Enabled = False
            FontRatio.Auto = False
          end
          object LPrjUse1: TMLabel
            Left = 610
            Top = 30
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel52: TMLabel
            Left = 490
            Top = 54
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #65420#65439#65435#65404#65438#65386#65400#65412#65298
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel53: TMLabel
            Left = 490
            Top = 98
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #65420#65439#65435#65404#65438#65386#65400#65412#65300
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel54: TMLabel
            Left = 490
            Top = 164
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #65420#65439#65435#65404#65438#65386#65400#65412#65303
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel55: TMLabel
            Left = 490
            Top = 76
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #65420#65439#65435#65404#65438#65386#65400#65412#65299
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel56: TMLabel
            Left = 490
            Top = 120
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #65420#65439#65435#65404#65438#65386#65400#65412#65301
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel57: TMLabel
            Left = 490
            Top = 142
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #65420#65439#65435#65404#65438#65386#65400#65412#65302
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel58: TMLabel
            Left = 490
            Top = 186
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #65420#65439#65435#65404#65438#65386#65400#65412#65304
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel59: TMLabel
            Left = 490
            Top = 208
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #65420#65439#65435#65404#65438#65386#65400#65412#65305
            Enabled = False
            FontRatio.Auto = False
          end
          object LPrjUse2: TMLabel
            Left = 610
            Top = 52
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LPrjUse3: TMLabel
            Left = 610
            Top = 74
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LPrjUse4: TMLabel
            Left = 610
            Top = 96
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LPrjUse5: TMLabel
            Left = 610
            Top = 118
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LPrjUse6: TMLabel
            Left = 610
            Top = 140
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LPrjUse7: TMLabel
            Left = 610
            Top = 162
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LPrjUse8: TMLabel
            Left = 610
            Top = 184
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object LPrjUse9: TMLabel
            Left = 610
            Top = 206
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel68: TMLabel
            Left = 490
            Top = 230
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #65420#65439#65435#65404#65438#65386#65400#65412#65297#65296
            Enabled = False
            FontRatio.Auto = False
          end
          object LPrjUse10: TMLabel
            Left = 610
            Top = 228
            Width = 75
            Height = 19
            AutoSize = False
            Enabled = False
            FontRatio.Auto = False
          end
          object MLabel11: TMLabel
            Left = 10
            Top = 5
            Width = 700
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel12: TMLabel
            Left = 10
            Top = 265
            Width = 700
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object EBmnUse: TMNumEdit
            Left = 110
            Top = 30
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426
              '2: '#20849#36890#37096#38272)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 0
            Negative = False
            Validate = False
            Zero = True
          end
          object EBankUse: TMNumEdit
            Left = 110
            Top = 52
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 1
            Negative = False
            Validate = False
            Zero = True
          end
          object EToriUse: TMNumEdit
            Left = 110
            Top = 74
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '22: '#21462#24341#20808
              '23: '#24471#24847#20808
              '24: '#20181#20837#20808)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 2
            Negative = False
            Validate = False
            Zero = True
          end
          object EShainUse: TMNumEdit
            Left = 110
            Top = 96
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 3
            Negative = False
            Validate = False
            Zero = True
          end
          object EHojyoUse1: TMNumEdit
            Left = 110
            Top = 118
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 4
            Negative = False
            Validate = False
            Zero = True
          end
          object EHojyoUse2: TMNumEdit
            Left = 110
            Top = 140
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 5
            Negative = False
            Validate = False
            Zero = True
          end
          object EHojyoUse3: TMNumEdit
            Left = 110
            Top = 162
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 6
            Negative = False
            Validate = False
            Zero = True
          end
          object EHojyoUse4: TMNumEdit
            Left = 110
            Top = 184
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 7
            Negative = False
            Validate = False
            Zero = True
          end
          object EHojyoUse5: TMNumEdit
            Left = 110
            Top = 206
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 8
            Negative = False
            Validate = False
            Zero = True
          end
          object ESegUse1: TMNumEdit
            Left = 340
            Top = 30
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426
              '2: '#20849#36890#65406#65400#65438#65426#65437#65412)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 9
            Negative = False
            Validate = False
            Zero = True
          end
          object ESegUse2: TMNumEdit
            Left = 340
            Top = 52
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426
              '2: '#20849#36890#65406#65400#65438#65426#65437#65412)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 10
            Negative = False
            Validate = False
            Zero = True
          end
          object ESegUse3: TMNumEdit
            Left = 340
            Top = 74
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426
              '2: '#20849#36890#65406#65400#65438#65426#65437#65412)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 11
            Negative = False
            Validate = False
            Zero = True
          end
          object ESegUse4: TMNumEdit
            Left = 340
            Top = 96
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426
              '2: '#20849#36890#65406#65400#65438#65426#65437#65412)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 12
            Negative = False
            Validate = False
            Zero = True
          end
          object ESegUse5: TMNumEdit
            Left = 340
            Top = 118
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426
              '2: '#20849#36890#65406#65400#65438#65426#65437#65412)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 13
            Negative = False
            Validate = False
            Zero = True
          end
          object ESegUse6: TMNumEdit
            Left = 340
            Top = 140
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426
              '2: '#20849#36890#65406#65400#65438#65426#65437#65412)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 14
            Negative = False
            Validate = False
            Zero = True
          end
          object ESegUse7: TMNumEdit
            Left = 340
            Top = 162
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426
              '2: '#20849#36890#65406#65400#65438#65426#65437#65412)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 15
            Negative = False
            Validate = False
            Zero = True
          end
          object ESegUse8: TMNumEdit
            Left = 340
            Top = 184
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426
              '2: '#20849#36890#65406#65400#65438#65426#65437#65412)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 16
            Negative = False
            Validate = False
            Zero = True
          end
          object ESegUse9: TMNumEdit
            Left = 340
            Top = 206
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426
              '2: '#20849#36890#65406#65400#65438#65426#65437#65412)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 17
            Negative = False
            Validate = False
            Zero = True
          end
          object ESegUse10: TMNumEdit
            Left = 340
            Top = 228
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426
              '2: '#20849#36890#65406#65400#65438#65426#65437#65412)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 18
            Negative = False
            Validate = False
            Zero = True
          end
          object EPrjUse1: TMNumEdit
            Left = 570
            Top = 30
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 19
            Negative = False
            Validate = False
            Zero = True
          end
          object EPrjUse2: TMNumEdit
            Left = 570
            Top = 52
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 20
            Negative = False
            Validate = False
            Zero = True
          end
          object EPrjUse3: TMNumEdit
            Left = 570
            Top = 74
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 21
            Negative = False
            Validate = False
            Zero = True
          end
          object EPrjUse4: TMNumEdit
            Left = 570
            Top = 96
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 22
            Negative = False
            Validate = False
            Zero = True
          end
          object EPrjUse5: TMNumEdit
            Left = 570
            Top = 118
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 23
            Negative = False
            Validate = False
            Zero = True
          end
          object EPrjUse6: TMNumEdit
            Left = 570
            Top = 140
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 24
            Negative = False
            Validate = False
            Zero = True
          end
          object EPrjUse7: TMNumEdit
            Left = 570
            Top = 162
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 25
            Negative = False
            Validate = False
            Zero = True
          end
          object EPrjUse8: TMNumEdit
            Left = 570
            Top = 184
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 26
            Negative = False
            Validate = False
            Zero = True
          end
          object EPrjUse9: TMNumEdit
            Left = 570
            Top = 206
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 27
            Negative = False
            Validate = False
            Zero = True
          end
          object EPrjUse10: TMNumEdit
            Left = 570
            Top = 228
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            SelectMaxRowCount = 6
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 28
            Negative = False
            Validate = False
            Zero = True
          end
        end
        object P_Syukei: TMPanel
          Left = 0
          Top = 37
          Width = 752
          Height = 327
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 1
          Visible = False
          OnEnter = OnEnter
          object MLabel8: TMLabel
            Left = 10
            Top = 5
            Width = 350
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object LSeizan: TMLabel
            Left = 30
            Top = 32
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #27491#27531
            FontRatio.Auto = False
          end
          object LBsPl: TMLabel
            Left = 30
            Top = 54
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #65314#65331#65295#65328#65324
            FontRatio.Auto = False
          end
          object LKisyuzan: TMLabel
            Left = 30
            Top = 76
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #26399#39318#27531
            FontRatio.Auto = False
          end
          object LDspPri: TMLabel
            Left = 30
            Top = 297
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #34920#31034#65295#21360#21047
            Visible = False
            FontRatio.Auto = False
          end
          object LHiritsu: TMLabel
            Left = 30
            Top = 98
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #27604#29575#31185#30446
            FontRatio.Auto = False
          end
          object LKariShiki: TMLabel
            Left = 30
            Top = 120
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #20511#26041#36039#37329#32368
            FontRatio.Auto = False
          end
          object LKashiShiki: TMLabel
            Left = 30
            Top = 142
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #36024#26041#36039#37329#32368
            FontRatio.Auto = False
          end
          object LHendou: TMLabel
            Left = 30
            Top = 164
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #22793#21205#36027#27604#29575
            FontRatio.Auto = False
          end
          object MLabel33: TMLabel
            Left = 15
            Top = 10
            Width = 60
            Height = 13
            AutoSize = False
            Caption = #38598#35336#24773#22577
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel34: TMLabel
            Left = 390
            Top = 5
            Width = 310
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object LMaina: TMLabel
            Left = 420
            Top = 32
            Width = 115
            Height = 13
            AutoSize = False
            Caption = #12510#12452#12490#12473#21360#21047
            FontRatio.Auto = False
          end
          object LSagaPri: TMLabel
            Left = 420
            Top = 52
            Width = 115
            Height = 13
            AutoSize = False
            Caption = #24046#38989#21360#21047
            FontRatio.Auto = False
          end
          object LRiekiPri: TMLabel
            Left = 420
            Top = 76
            Width = 115
            Height = 13
            AutoSize = False
            Caption = #21033#30410#21360#21047
            FontRatio.Auto = False
          end
          object LAve: TMLabel
            Left = 420
            Top = 186
            Width = 115
            Height = 13
            AutoSize = False
            Caption = #24179#22343#20516#25505#29992
            Visible = False
            FontRatio.Auto = False
          end
          object LRuikei: TMLabel
            Left = 420
            Top = 208
            Width = 115
            Height = 13
            AutoSize = False
            Caption = #32047#35336#38598#35336
            Visible = False
            FontRatio.Auto = False
          end
          object LMainaHen: TMLabel
            Left = 420
            Top = 120
            Width = 115
            Height = 13
            AutoSize = False
            Caption = #12510#12452#12490#12473#22793#25563#31185#30446#21517
            FontRatio.Auto = False
          end
          object LSousyoku: TMLabel
            Left = 420
            Top = 142
            Width = 115
            Height = 13
            AutoSize = False
            Caption = #35013#39166
            FontRatio.Auto = False
          end
          object MLabel35: TMLabel
            Left = 395
            Top = 10
            Width = 60
            Height = 13
            AutoSize = False
            Caption = #20986#21147#24773#22577
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object LSeiZanName: TMLabel
            Left = 155
            Top = 30
            Width = 40
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LBPName: TMLabel
            Left = 155
            Top = 52
            Width = 79
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LKisyuName: TMLabel
            Left = 155
            Top = 74
            Width = 40
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LDPName: TMLabel
            Left = 132
            Top = 297
            Width = 142
            Height = 13
            AutoSize = False
            Caption = #8660'FX '#12391#12399#20351#29992#12375#12414#12379#12435#12290
            Visible = False
            FontRatio.Auto = False
          end
          object LHiritsuName: TMLabel
            Left = 155
            Top = 96
            Width = 75
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LKariName: TMLabel
            Left = 155
            Top = 118
            Width = 110
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LKashiName: TMLabel
            Left = 155
            Top = 140
            Width = 110
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LMainasuName: TMLabel
            Left = 595
            Top = 30
            Width = 40
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LSagakuName: TMLabel
            Left = 595
            Top = 52
            Width = 40
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LRiekiName: TMLabel
            Left = 595
            Top = 74
            Width = 40
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LAveName: TMLabel
            Left = 595
            Top = 184
            Width = 40
            Height = 19
            AutoSize = False
            Visible = False
            FontRatio.Auto = False
          end
          object LRuiSyuName: TMLabel
            Left = 595
            Top = 206
            Width = 40
            Height = 19
            AutoSize = False
            Visible = False
            FontRatio.Auto = False
          end
          object LSousyokuName: TMLabel
            Left = 595
            Top = 140
            Width = 75
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LKobePA: TMLabel
            Left = 170
            Top = 162
            Width = 15
            Height = 19
            AutoSize = False
            Caption = #65285
            FontRatio.Auto = False
          end
          object LGoukeiDsp: TMLabel
            Left = 420
            Top = 230
            Width = 115
            Height = 13
            AutoSize = False
            Caption = #21512#35336#34920#31034
            Visible = False
            FontRatio.Auto = False
          end
          object LGoukeiDspName: TMLabel
            Left = 595
            Top = 228
            Width = 40
            Height = 19
            AutoSize = False
            Visible = False
            FontRatio.Auto = False
          end
          object LKihyousya: TMLabel
            Left = 420
            Top = 98
            Width = 115
            Height = 13
            AutoSize = False
            Caption = #20803#24115#36215#31080#32773#21360#23383
            FontRatio.Auto = False
          end
          object LKihyousyaName: TMLabel
            Left = 595
            Top = 96
            Width = 72
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LBank: TMLabel
            Left = 30
            Top = 186
            Width = 75
            Height = 13
            AutoSize = False
            Caption = #37504#34892#12467#12540#12489
            FontRatio.Auto = False
          end
          object LBankName: TMLabel
            Left = 210
            Top = 184
            Width = 110
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LAddUnit: TMLabel
            Left = 420
            Top = 164
            Width = 115
            Height = 13
            AutoSize = False
            Caption = #38598#35336#21336#20301#21306#20998
            Visible = False
            FontRatio.Auto = False
          end
          object LAddUnitName: TMLabel
            Left = 595
            Top = 162
            Width = 75
            Height = 19
            AutoSize = False
            Visible = False
            FontRatio.Auto = False
          end
          object MLabel7: TMLabel
            Left = 20
            Top = 270
            Width = 350
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel9: TMLabel
            Left = 389
            Top = 270
            Width = 310
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object LSyousu: TMLabel
            Left = 420
            Top = 252
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #23567#25968#28857#26689#25968
            Visible = False
            FontRatio.Auto = False
          end
          object LSyousuKeta: TMLabel
            Left = 564
            Top = 250
            Width = 13
            Height = 19
            AutoSize = False
            Caption = #26689
            Visible = False
            FontRatio.Auto = False
          end
          object EBankCodeT: TMTxtEdit
            Left = 110
            Top = 184
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Enabled = False
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            TabOrder = 8
            Text = ''
            OnEnter = OnEnter
            OnExit = EBankCodeTExit
            ValidChars = ''
          end
          object EHendouhi: TMNumEdit
            Left = 110
            Top = 162
            Width = 48
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 6
            OnEnter = OnEnter
            OnExit = EHendouhiExit
            Negative = False
            Decimals = 2
            Digits = 5
            Validate = False
          end
          object EMainaName: TMTxtEdit
            Left = 540
            Top = 118
            Width = 162
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            MaxLength = 24
            FontRatio.Auto = False
            TabOrder = 13
            Text = ''
            OnEnter = OnEnter
            ValidChars = ''
          end
          object ESeiZanCode: TMNumEdit
            Left = 110
            Top = 30
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#20511#26041
              '1: '#36024#26041)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 0
            OnEnter = OnEnter
            OnExit = ESeiZanCodeExit
            Negative = False
            Validate = False
          end
          object EBPCode: TMNumEdit
            Left = 110
            Top = 52
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#65314#65295#65331
              '1: '#65328#65295#65324)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 1
            OnEnter = OnEnter
            OnExit = EBPCodeExit
            Negative = False
            Validate = False
          end
          object EKisyuCode: TMNumEdit
            Left = 110
            Top = 74
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 2
            OnEnter = OnEnter
            OnExit = EKisyuCodeExit
            Negative = False
            Validate = False
          end
          object EDPCode: TMNumEdit
            Left = 110
            Top = 295
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#21487
              '1: '#19981#21487)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 20
            Visible = False
            OnEnter = OnEnter
            OnExit = EDPCodeExit
            Negative = False
            Validate = False
          end
          object EHiritsuCode: TMNumEdit
            Left = 110
            Top = 96
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#36890#24120#31185#30446
              '1: '#27604#29575#31185#30446)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 3
            OnEnter = OnEnter
            OnExit = EHiritsuCodeExit
            Negative = False
            Validate = False
          end
          object EKariCode: TMNumEdit
            Left = 110
            Top = 118
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 4
            OnEnter = OnEnter
            OnExit = EKariCodeExit
            Negative = False
            Validate = False
          end
          object EKashiCode: TMNumEdit
            Left = 110
            Top = 140
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 5
            OnEnter = OnEnter
            OnExit = EKashiCodeExit
            Negative = False
            Validate = False
          end
          object EMainasuCode: TMNumEdit
            Left = 540
            Top = 30
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 9
            OnEnter = OnEnter
            OnExit = EMainasuCodeExit
            Negative = False
            Validate = False
          end
          object ESagakuCode: TMNumEdit
            Left = 540
            Top = 52
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 10
            OnEnter = OnEnter
            OnExit = ESagakuCodeExit
            Negative = False
            Validate = False
          end
          object ERiekiCode: TMNumEdit
            Left = 540
            Top = 74
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 11
            OnEnter = OnEnter
            OnExit = ERiekiCodeExit
            Negative = False
            Validate = False
          end
          object EAveCode: TMNumEdit
            Left = 540
            Top = 184
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 16
            Visible = False
            OnEnter = OnEnter
            OnExit = EAveCodeExit
            Negative = False
            Validate = False
          end
          object ERuiSyuCode: TMNumEdit
            Left = 540
            Top = 206
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12354#12426
              '1: '#12394#12375)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 17
            Visible = False
            OnEnter = OnEnter
            OnExit = ERuiSyuCodeExit
            Negative = False
            Validate = False
          end
          object ESousyokuCode: TMNumEdit
            Left = 540
            Top = 140
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375' '
              '1: '#12304' '#12305' '
              '2: '#65288' '#65289
              '3: '#12308' '#12309
              '4: '#65308#65310
              '5: (( ))'
              '6: '#65371' '#65373)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 14
            OnEnter = OnEnter
            OnExit = ESousyokuCodeExit
            Negative = False
            Validate = False
          end
          object EGoukeiDsp: TMNumEdit
            Left = 540
            Top = 228
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#12354#12426)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 18
            Visible = False
            OnEnter = OnEnter
            OnExit = EGoukeiDspExit
            Negative = False
            Validate = False
          end
          object EKihyousya: TMNumEdit
            Left = 540
            Top = 96
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#21360#23383#12394#12375
              '1: '#21360#23383#12354#12426)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 12
            OnEnter = OnEnter
            OnExit = EKihyousyaExit
            Negative = False
            Validate = False
          end
          object EAddUnit: TMNumEdit
            Left = 540
            Top = 162
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#25351#23450#21336#20301
              '1: '#38598#35336#23550#35937#22806)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 15
            Visible = False
            OnEnter = OnEnter
            OnExit = EAddUnitExit
            Negative = False
            Validate = False
          end
          object EBankCodeN: TMNumEdit
            Left = 110
            Top = 184
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 7
            OnExit = EBankCodeNExit
            Negative = False
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object ESyousuten: TMNumEdit
            Left = 540
            Top = 250
            Width = 20
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 19
            Visible = False
            OnEnter = OnEnter
            OnExit = ESyousutenExit
            Negative = False
            MaxValue = 9.000000000000000000
            Digits = 2
            Validate = True
          end
        end
        object P_Shiwake: TMPanel
          Left = 0
          Top = 37
          Width = 752
          Height = 327
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 3
          Visible = False
          OnEnter = OnEnter
          object MLabel40: TMLabel
            Left = 10
            Top = 5
            Width = 685
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel46: TMLabel
            Left = 15
            Top = 10
            Width = 60
            Height = 13
            AutoSize = False
            Caption = #20837#21147#26465#20214
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object LShiwa: TMLabel
            Left = 30
            Top = 32
            Width = 37
            Height = 13
            AutoSize = False
            Caption = #20181#35379
            FontRatio.Auto = False
          end
          object LKijitsu: TMLabel
            Left = 30
            Top = 54
            Width = 37
            Height = 13
            AutoSize = False
            Caption = #26399#26085
            FontRatio.Auto = False
          end
          object LTegataNo: TMLabel
            Left = 270
            Top = 98
            Width = 57
            Height = 13
            AutoSize = False
            Caption = #25163#24418#30058#21495
            Visible = False
            FontRatio.Auto = False
          end
          object LKoteiTeki: TMLabel
            Left = 270
            Top = 32
            Width = 67
            Height = 13
            AutoSize = False
            Caption = #22266#23450#25688#35201
            FontRatio.Auto = False
          end
          object LTekiBunrui: TMLabel
            Left = 270
            Top = 54
            Width = 67
            Height = 13
            AutoSize = False
            Caption = #25688#35201#20998#39006
            FontRatio.Auto = False
          end
          object LShikikuriYu: TMLabel
            Left = 270
            Top = 74
            Width = 103
            Height = 19
            AutoSize = False
            Caption = #36039#37329#32368#12467#12540#12489#20778#20808
            FontRatio.Auto = False
          end
          object LTekiyoubunrui: TMLabel
            Left = 440
            Top = 52
            Width = 250
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LShiwakeName: TMLabel
            Left = 145
            Top = 30
            Width = 110
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LKijitsuName: TMLabel
            Left = 145
            Top = 52
            Width = 110
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LTegataNoName: TMLabel
            Left = 440
            Top = 96
            Width = 110
            Height = 19
            AutoSize = False
            Visible = False
            FontRatio.Auto = False
          end
          object LTekiName: TMLabel
            Left = 440
            Top = 30
            Width = 110
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LShikuriName: TMLabel
            Left = 440
            Top = 74
            Width = 110
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object LStartDate: TMLabel
            Left = 30
            Top = 76
            Width = 69
            Height = 13
            AutoSize = False
            Caption = #36969#29992#38283#22987#26085
            FontRatio.Auto = False
          end
          object LEndDate: TMLabel
            Left = 30
            Top = 98
            Width = 69
            Height = 13
            AutoSize = False
            Caption = #36969#29992#32066#20102#26085
            FontRatio.Auto = False
          end
          object MLabel18: TMLabel
            Left = 10
            Top = 125
            Width = 685
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object EShiwakeCode: TMNumEdit
            Left = 110
            Top = 30
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#36024#20511#20837#21147
              '1: '#27491#27531#20596#12398#12415
              '2: '#36000#27531#20596#12398#12415
              '9: '#20837#21147#19981#21487)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 0
            OnEnter = OnEnter
            OnExit = EShiwakeCodeExit
            Negative = False
            Validate = False
          end
          object ETekiyouBunrui: TMNumEdit
            Left = 375
            Top = 52
            Width = 48
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 5
            OnEnter = OnEnter
            OnExit = ETekiyouBunruiExit
            Negative = False
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object EKijitsuCode: TMNumEdit
            Left = 110
            Top = 52
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#20837#21147#12394#12375
              '1: '#27491#27531#20596'('#20219#24847')'
              '2: '#27491#27531#20596'('#24517#38920')'
              '3: '#36024#20511#20837#21147'('#20219#24847')'
              '4: '#36024#20511#20837#21147'('#24517#38920')'
              '5: '#36000#27531#20596'('#20219#24847')'
              '6: '#36000#27531#20596'('#24517#38920')')
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 1
            OnEnter = OnEnter
            OnExit = EKijitsuCodeExit
            Negative = False
            Validate = False
          end
          object ETegataNoCode: TMNumEdit
            Left = 375
            Top = 96
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#20837#21147#12394#12375
              '1: '#27491#27531#20596'('#20219#24847')'
              '2: '#27491#27531#20596'('#24517#38920')'
              '3: '#36024#20511#20837#21147'('#20219#24847')'
              '4: '#36024#20511#20837#21147'('#24517#38920')'
              '5: '#36000#27531#20596'('#20219#24847')'
              '6: '#36000#27531#20596'('#24517#38920')')
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 7
            Visible = False
            OnEnter = OnEnter
            OnExit = ETegataNoCodeExit
            Negative = False
            Validate = False
          end
          object ETekiCode: TMNumEdit
            Left = 375
            Top = 30
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#20219#24847
              '1: '#22266#23450#25688#35201#24517#38920
              '2: '#25688#35201#27531#24517#38920)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 4
            OnEnter = OnEnter
            OnExit = ETekiCodeExit
            Negative = False
            Validate = False
          end
          object EShikuriCode: TMNumEdit
            Left = 375
            Top = 74
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#31185#30446#20778#20808
              '1: '#35036#21161#20778#20808)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 6
            OnEnter = OnEnter
            OnExit = EShikuriCodeExit
            Negative = False
            Validate = False
          end
          object Panel_Number: TMPanel
            Left = 0
            Top = 130
            Width = 753
            Height = 130
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 8
            object MLabel4: TMLabel
              Left = 15
              Top = 0
              Width = 40
              Height = 13
              AutoSize = False
              Caption = #30058#21495#65297
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object LNumber1: TMLabel
              Left = 185
              Top = 22
              Width = 125
              Height = 13
              AutoSize = False
              FontRatio.Auto = False
            end
            object LDspKbnNumber1: TMLabel
              Left = 30
              Top = 66
              Width = 90
              Height = 13
              AutoSize = False
              Caption = #30058#21495#65297#34920#31034#21306#20998
              FontRatio.Auto = False
            end
            object LDspNumber1: TMLabel
              Left = 185
              Top = 66
              Width = 75
              Height = 13
              AutoSize = False
              FontRatio.Auto = False
            end
            object LTitleNumber2: TMLabel
              Left = 350
              Top = 0
              Width = 40
              Height = 13
              AutoSize = False
              Caption = #30058#21495#65298
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object LNumber2: TMLabel
              Left = 520
              Top = 22
              Width = 125
              Height = 13
              AutoSize = False
              FontRatio.Auto = False
            end
            object LDspNumber2: TMLabel
              Left = 520
              Top = 66
              Width = 75
              Height = 13
              AutoSize = False
              FontRatio.Auto = False
            end
            object LDspKbnNumber2: TMLabel
              Left = 365
              Top = 66
              Width = 90
              Height = 13
              AutoSize = False
              Caption = #30058#21495#65298#34920#31034#21306#20998
              FontRatio.Auto = False
            end
            object MLabel14: TMLabel
              Left = 30
              Top = 98
              Width = 90
              Height = 13
              AutoSize = False
              Caption = #30058#21495#38598#35336#21306#20998
              FontRatio.Auto = False
            end
            object LTotalKbnName: TMLabel
              Left = 185
              Top = 98
              Width = 125
              Height = 13
              AutoSize = False
              FontRatio.Auto = False
            end
            object LNameNumber1: TMLabel
              Left = 30
              Top = 44
              Width = 90
              Height = 13
              AutoSize = False
              Caption = #30058#21495#65297#21517#31216
              FontRatio.Auto = False
            end
            object LInputNumber1: TMLabel
              Left = 30
              Top = 22
              Width = 90
              Height = 13
              AutoSize = False
              Caption = #30058#21495#65297#20837#21147#21306#20998
              FontRatio.Auto = False
            end
            object LNameNumber2: TMLabel
              Left = 365
              Top = 44
              Width = 90
              Height = 13
              AutoSize = False
              Caption = #30058#21495#65298#21517#31216
              FontRatio.Auto = False
            end
            object LInputNumber2: TMLabel
              Left = 365
              Top = 22
              Width = 90
              Height = 13
              AutoSize = False
              Caption = #30058#21495#65298#20837#21147#21306#20998
              FontRatio.Auto = False
            end
            object MLabel19: TMLabel
              Left = 10
              Top = 125
              Width = 685
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object ComboNumber1: TMComboBox
              Left = 145
              Top = 42
              Width = 120
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 200
                  Color = clWindow
                  Font.Charset = SHIFTJIS_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end>
              TabOrder = 1
              OnEnter = OnEnter
            end
            object ENumber1: TMNumEdit
              Left = 145
              Top = 20
              Width = 20
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#20837#21147#12394#12375
                '1: '#27491#27531#20596'('#20219#24847')'
                '2: '#27491#27531#20596'('#24517#38920')'
                '3: '#36024#20511#20837#21147'('#20219#24847')'
                '4: '#36024#20511#20837#21147'('#24517#38920')'
                '5: '#36000#27531#20596'('#20219#24847')'
                '6: '#36000#27531#20596'('#24517#38920')')
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              OnChange = CmnNumberChange
              OnEnter = OnEnter
              OnExit = CmnENumberExit
              Negative = False
              Validate = False
            end
            object EDspNumber1: TMNumEdit
              Left = 145
              Top = 64
              Width = 20
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#12394#12375
                '1: '#20253#31080#65326#65359)
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 2
              OnEnter = OnEnter
              OnExit = CmnENumberExit
              Negative = False
              Validate = False
            end
            object ComboNumber2: TMComboBox
              Left = 480
              Top = 42
              Width = 120
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 200
                  Color = clWindow
                  Font.Charset = SHIFTJIS_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -13
                  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                  Font.Style = []
                  ParentColor = False
                  ParentFont = False
                end>
              TabOrder = 4
              OnEnter = OnEnter
            end
            object ENumber2: TMNumEdit
              Left = 480
              Top = 20
              Width = 20
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#20837#21147#12394#12375
                '1: '#27491#27531#20596'('#20219#24847')'
                '2: '#27491#27531#20596'('#24517#38920')'
                '3: '#36024#20511#20837#21147'('#20219#24847')'
                '4: '#36024#20511#20837#21147'('#24517#38920')'
                '5: '#36000#27531#20596'('#20219#24847')'
                '6: '#36000#27531#20596'('#24517#38920')')
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 3
              OnChange = CmnNumberChange
              OnEnter = OnEnter
              OnExit = CmnENumberExit
              Negative = False
              Validate = False
            end
            object EDspNumber2: TMNumEdit
              Left = 480
              Top = 64
              Width = 20
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#12394#12375
                '1: '#20253#31080#65326#65359)
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 5
              OnEnter = OnEnter
              OnExit = CmnENumberExit
              Negative = False
              Validate = False
            end
            object ETotalKbn: TMNumEdit
              Left = 145
              Top = 96
              Width = 20
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#30058#21495#12398#12415#12391#38598#35336
                '1: '#30058#21495#21029#32048#30446#21029#12395#38598#35336)
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 6
              OnEnter = OnEnter
              OnExit = CmnENumberExit
              Negative = False
              Validate = False
            end
          end
          object Panel_Denshi: TMPanel
            Left = 0
            Top = 265
            Width = 741
            Height = 60
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 9
            object MLabel3: TMLabel
              Left = 15
              Top = 0
              Width = 60
              Height = 13
              AutoSize = False
              Caption = #38651#23376#24115#31807
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object LDen_Rireki: TMLabel
              Left = 30
              Top = 22
              Width = 57
              Height = 13
              AutoSize = False
              Caption = #23653#27508#31649#29702
              FontRatio.Auto = False
            end
            object LRirekiKbnName: TMLabel
              Left = 145
              Top = 20
              Width = 215
              Height = 19
              AutoSize = False
              FontRatio.Auto = False
            end
            object MLabel2: TMLabel
              Left = 10
              Top = 50
              Width = 685
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object ERirekiKbnCode: TMNumEdit
              Left = 110
              Top = 20
              Width = 20
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#20462#27491#23653#27508#31649#29702#21306#20998#12395#24467#12358
                '1: '#28961#26465#20214#12395#23653#27508#12434#21462#12427)
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              OnEnter = OnEnter
              OnExit = ERirekiKbnCodeExit
              Negative = False
              Validate = False
            end
          end
          object EStartDate: TMDateEdit
            Left = 110
            Top = 74
            Width = 79
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atOmission
            F4Arrow = True
            AutoSize = False
            ImeMode = imClose
            TabOrder = 2
            OnEnter = OnEnter
            OnExit = EStartDateExit
            Calendar = True
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
          object EEndDate: TMDateEdit
            Left = 110
            Top = 96
            Width = 79
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atOmission
            F4Arrow = True
            AutoSize = False
            ImeMode = imClose
            TabOrder = 3
            OnEnter = OnEnter
            OnExit = EEndDateExit
            Calendar = True
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
        end
        object P_Bunrui: TMPanel
          Left = 0
          Top = 37
          Width = 752
          Height = 327
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 4
          Visible = False
          OnEnter = OnEnter
          object MLabel5: TMLabel
            Left = 10
            Top = 5
            Width = 380
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object LBun01: TMLabel
            Left = 30
            Top = 30
            Width = 95
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object MLabel21: TMLabel
            Left = 15
            Top = 10
            Width = 60
            Height = 13
            AutoSize = False
            Caption = #20998#39006#24773#22577
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel43: TMLabel
            Left = 190
            Top = 39
            Width = 32
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object L2Bun01: TMLabel
            Left = 240
            Top = 30
            Width = 120
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object LBun02: TMLabel
            Left = 30
            Top = 52
            Width = 95
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object L2Bun02: TMLabel
            Left = 240
            Top = 52
            Width = 120
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object LBun03: TMLabel
            Left = 30
            Top = 74
            Width = 95
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object L2Bun03: TMLabel
            Left = 240
            Top = 74
            Width = 120
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object LBun04: TMLabel
            Left = 30
            Top = 96
            Width = 95
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object L2Bun04: TMLabel
            Left = 240
            Top = 96
            Width = 120
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object LBun05: TMLabel
            Left = 30
            Top = 118
            Width = 95
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object L2Bun05: TMLabel
            Left = 240
            Top = 118
            Width = 120
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object LBun06: TMLabel
            Left = 30
            Top = 140
            Width = 95
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object MLabel23: TMLabel
            Left = 190
            Top = 155
            Width = 32
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object L2Bun06: TMLabel
            Left = 240
            Top = 140
            Width = 120
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object LBun07: TMLabel
            Left = 30
            Top = 162
            Width = 95
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object L2Bun07: TMLabel
            Left = 240
            Top = 162
            Width = 120
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object LBun08: TMLabel
            Left = 30
            Top = 184
            Width = 95
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object L2Bun08: TMLabel
            Left = 240
            Top = 184
            Width = 120
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object LBun09: TMLabel
            Left = 30
            Top = 206
            Width = 95
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object L2Bun09: TMLabel
            Left = 240
            Top = 206
            Width = 120
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object LBun10: TMLabel
            Left = 30
            Top = 228
            Width = 95
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object L2Bun10: TMLabel
            Left = 240
            Top = 228
            Width = 120
            Height = 19
            AutoSize = False
            FontRatio.Auto = True
          end
          object MLabel6: TMLabel
            Left = 10
            Top = 265
            Width = 380
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object EBun01: TMTxtEdit
            Left = 140
            Top = 30
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 0
            Text = ''
            OnExit = EBunExit
            ValidChars = ''
          end
          object EBun02: TMTxtEdit
            Left = 140
            Top = 52
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 1
            Text = ''
            OnExit = EBunExit
            ValidChars = ''
          end
          object EBun03: TMTxtEdit
            Left = 140
            Top = 74
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 2
            Text = ''
            OnExit = EBunExit
            ValidChars = ''
          end
          object EBun04: TMTxtEdit
            Left = 140
            Top = 96
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 3
            Text = ''
            OnExit = EBunExit
            ValidChars = ''
          end
          object EBun05: TMTxtEdit
            Left = 140
            Top = 118
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 4
            Text = ''
            OnExit = EBunExit
            ValidChars = ''
          end
          object EBun06: TMTxtEdit
            Left = 140
            Top = 140
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 5
            Text = ''
            OnExit = EBunExit
            ValidChars = ''
          end
          object EBun07: TMTxtEdit
            Left = 140
            Top = 162
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 6
            Text = ''
            OnExit = EBunExit
            ValidChars = ''
          end
          object EBun08: TMTxtEdit
            Left = 140
            Top = 184
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 7
            Text = ''
            OnExit = EBunExit
            ValidChars = ''
          end
          object EBun09: TMTxtEdit
            Left = 140
            Top = 206
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 8
            Text = ''
            OnExit = EBunExit
            ValidChars = ''
          end
          object EBun10: TMTxtEdit
            Left = 140
            Top = 228
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCodeOnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 9
            Text = ''
            OnExit = EBunExit
            ValidChars = ''
          end
        end
        object MTab_SyousaiInfo: TMTab
          Left = 0
          Top = 0
          Width = 752
          Height = 37
          Items = <
            item
              Caption = #38598#35336#24773#22577
              Color = 16766672
              SyncControl = P_Syukei
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #25505#29992#24773#22577
              Color = 16766672
              SyncControl = P_Saiyo
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = False
            end
            item
              Caption = #20181#35379#20837#21147#12539#12458#12503#12471#12519#12531
              Color = 16766672
              SyncControl = P_Shiwake
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #20998#12288#12288#39006
              Color = 16766672
              SyncControl = P_Bunrui
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end>
          Align = alTop
          TabOrder = 0
          ItemWidth = 0
          ItemHeight = 0
          ItemMargin = 6
          Style = tsCrystal
          BorderHeight = 10
          BorderFont.Charset = SHIFTJIS_CHARSET
          BorderFont.Color = clWindowText
          BorderFont.Height = -12
          BorderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
          BorderFont.Style = []
          OnEnter = OnEnter
          BorderCaptionAlign = taLeftJustify
          DropShadow = False
        end
        object P_OP_Bottom: TMPanel
          Left = 0
          Top = 364
          Width = 752
          Height = 49
          Align = alBottom
          BevelOuter = bvNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clMenuText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentBackground = False
          ParentColor = True
          ParentFont = False
          TabOrder = 5
          OnEnter = OnEnter
          object B_SUpDate: TMBitBtn
            Left = 563
            Top = 7
            Width = 80
            Height = 25
            Caption = #26356#26032'(&U)'
            Glyph.Data = {
              CE070000424DCE07000000000000360000002800000024000000120000000100
              1800000000009807000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000006666666666666666666666666666666666666666666666
              66666666666666666666666666666666666666666666666666000000000000C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666DCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
              DCDD666666000000000000C0C0C0F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
              F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1C0C0C00000000000
              00666666DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDE
              DFDEDEDFDEDEDFDEDEDFDEDFDFDF666666000000000000C0C0C0F2F2F2F2F2F2
              F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
              F2F2F2F2C0C0C0000000000000666666E1E1E0E1E1E0E1E1E0E1E1E0844C2783
              4B27834B27834B27834B27834C26E1E1E0E1E1E0E1E1E0E1E0E1666666000000
              000000C0C0C0F3F3F3F3F3F3F3F3F3F3F3F3B5B5B5B4B4B4B4B4B4B4B4B4B4B4
              B4B4B4B4F3F3F3F3F3F3F3F3F3F2F2F2C0C0C0000000000000666666E3E3E3E3
              E3E3E3E3E3784524784524794524794524784524784624784524784524E3E3E3
              E3E3E3E3E3E3666666000000000000C0C0C0F3F3F3F3F3F3F3F3F3B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2F3F3F3F3F3F3F3F3F3C0C0C000
              0000000000666666E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6
              E5E6E66D3F206D3F20E5E6E6E5E6E6E6E6E6666666000000000000C0C0C0F5F5
              F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5F5B0B0B0B0B0B0F5
              F5F5F5F5F5F5F5F5C0C0C0000000000000666666E8E8E9E8E8E9E8E8E9854C27
              854D27E8E8E9E8E8E9E8E8E9E8E8E961381D62381DE8E8E9E8E8E9E9E8E86666
              66000000000000C0C0C0F6F6F6F6F6F6F6F6F6B5B5B5B5B5B5F6F6F6F6F6F6F6
              F6F6F6F6F6ADADADADADADF6F6F6F6F6F6F6F6F6C0C0C0000000000000666666
              EBEBEBEBEBEB7C47247B47257C47257C4724EBEBEB56321A56311956321A5632
              1956321956311AEBEBEB666666000000000000C0C0C0F7F7F7F7F7F7B3B3B3B3
              B3B3B3B3B3B3B3B3F7F7F7AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAF7F7F7
              C0C0C0000000000000666666EDEDED7242217241217141217142227241217242
              21EDEDED4E2D174E2D174E2D174E2D17EDEDEDEEEDEE666666000000000000C0
              C0C0F8F8F8B1B1B1B0B0B0B0B0B0B1B1B1B0B0B0B1B1B1F8F8F8A8A8A8A8A8A8
              A8A8A8A8A8A8F8F8F8F8F8F8C0C0C0000000000000666666F0F0F0F0F0F0F0F0
              F0693C1F693C1FF0F0F0F0F0F0F0F0F0F0F0F04E2D174E2D17F0F0F0F0F0F0F0
              F0F0666666000000000000C0C0C0F9F9F9F9F9F9F9F9F9AEAEAEAEAEAEF9F9F9
              F9F9F9F9F9F9F9F9F9A8A8A8A8A8A8F9F9F9F9F9F9F9F9F9C0C0C00000000000
              00666666F3F3F3F3F3F3F3F3F35E361C5E361BF3F3F3F3F3F3F3F3F3F3F3F3F3
              F3F3F3F3F3F3F3F3F3F3F3F3F3F3666666000000000000C0C0C0FAFAFAFAFAFA
              FAFAFAACACACACACACFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA
              FAFAFAFAC0C0C0000000000000666666F6F6F6F6F6F6F6F6F655301955301955
              3019553119553119553119553119553119F6F6F6F6F6F6F6F6F6666666000000
              000000C0C0C0FBFBFBFBFBFBFBFBFBA9A9A9A9A9A9A9A9A9AAAAAAAAAAAAAAAA
              AAAAAAAAAAAAAAFBFBFBFBFBFBFBFBFBC0C0C0000000000000666666F9F8F8F9
              F8F8F9F8F8F9F8F84E2D174E2D174E2D174E2D174E2D174E2D17F9F8F8F9F8F8
              F9F8F8F9F9F8666666000000000000C0C0C0FCFCFCFCFCFCFCFCFCFCFCFCA8A8
              A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8FCFCFCFCFCFCFCFCFCFDFDFDC0C0C000
              0000000000666666FCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFB
              FCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFBFBFB666666000000000000C0C0C0FEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFDFDFDC0C0C0000000000000666666FEFEFEFEFEFEFEFEFEFEFEFE
              FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE6666
              66000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000000000666666
              6666666666666666666666666666666666666666666666666666666666666666
              66666666666666666666666666000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C00000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000}
            NumGlyphs = 2
            TabOrder = 0
            OnClick = B_SUpDateClick
            OnEnter = OnEnter
          end
          object B_SCancel: TMBitBtn
            Left = 645
            Top = 7
            Width = 80
            Height = 25
            Caption = #21462#28040'(&C)'
            Glyph.Data = {
              CE070000424DCE07000000000000360000002800000024000000120000000100
              1800000000009807000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000006666666666666666666666666666666666666666666666
              66666666666666666666666666666666666666666666666666000000000000C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666DCDCDCDCDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDDDDCDDDCDCDCDCDCDCDCDCDCDCDC
              DCDD666666000000000000C0C0C0F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
              F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1C0C0C00000000000
              00666666DEDFDEDFDEDFDEDEDEDFDFDEDEDEDFDEDFDEDEDEDFDEDEDFDEDFDEDE
              DEDFDFDEDEDEDFDEDFDFDEDFDFDF666666000000000000C0C0C0F2F2F2F1F1F1
              F1F1F1F2F2F2F1F1F1F2F2F2F1F1F1F1F1F1F2F2F2F1F1F1F1F1F1F2F2F2F2F2
              F2F2F2F2C0C0C0000000000000666666E1E1E0E1E0E18B50298B5029E0E1E1E0
              E1E0E0E1E1E1E0E1E1E1E0E0E1E08B50298B5029E1E0E1E1E0E1666666000000
              000000C0C0C0F3F3F3F2F2F2B7B7B7B7B7B7F3F3F3F3F3F3F3F3F3F2F2F2F3F3
              F3F3F3F3B7B7B7B7B7B7F2F2F2F2F2F2C0C0C0000000000000666666E3E3E3E3
              E3E38B50298B50298B5029E3E3E3E3E3E3E3E3E3E4E3E38B50298B50298B5029
              E3E3E4E3E3E3666666000000000000C0C0C0F3F3F3F3F3F3B7B7B7B7B7B7B7B7
              B7F3F3F3F3F3F3F3F3F3F3F3F3B7B7B7B7B7B7B7B7B7F3F3F3F3F3F3C0C0C000
              0000000000666666E5E6E6E6E6E5E5E6E6844D27844C27854C28E6E6E6E6E6E6
              854D27844C27844C27E6E6E6E6E6E6E6E6E6666666000000000000C0C0C0F5F5
              F5F5F5F5F5F5F5B5B5B5B5B5B5B5B5B5F5F5F5F5F5F5B5B5B5B5B5B5B5B5B5F5
              F5F5F5F5F5F5F5F5C0C0C0000000000000666666E8E8E9E8E9E8E8E8E9E9E8E9
              7B48257B4824E8E9E8E9E9E87C47247C4724E8E8E8E8E8E9E8E8E9E9E8E86666
              66000000000000C0C0C0F6F6F6F6F6F6F6F6F6F6F6F6B3B3B3B3B3B3F6F6F6F6
              F6F6B3B3B3B3B3B3F6F6F6F6F6F6F6F6F6F6F6F6C0C0C0000000000000666666
              EBEBEBEAEBEBEBEBEBEBEBEBEBEBEB724122714121724122714122EBEBEBEBEB
              EBEBEBEBEBEBEAEBEBEB666666000000000000C0C0C0F7F7F7F7F7F7F7F7F7F7
              F7F7F7F7F7B0B0B0B0B0B0B0B0B0B0B0B0F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
              C0C0C0000000000000666666EDEDEDEEEDEEEDEDEDEEEDEDEEEDEE683C1E683C
              1F693C1F683C1FEEEDEDEDEDEDEDEDEDEDEDEDEEEDEE666666000000000000C0
              C0C0F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8AEAEAEAEAEAEAEAEAEAEAEAEF8F8F8
              F8F8F8F8F8F8F8F8F8F8F8F8C0C0C0000000000000666666F0F0F0F0F1F0F1F0
              F1F0F0F15F371C5E361BF0F0F0F0F1F05E361C5E371CF1F0F1F1F0F0F0F0F1F0
              F0F0666666000000000000C0C0C0F9F9F9F9F9F9F9F9F9F9F9F9ACACACACACAC
              F9F9F9F9F9F9ACACACACACACF9F9F9F9F9F9F9F9F9F9F9F9C0C0C00000000000
              00666666F3F3F3F4F3F3F3F3F3543019543119543019F3F4F3F3F3F355311955
              3119553019F3F3F4F3F3F3F3F3F3666666000000000000C0C0C0FAFAFAFAFAFA
              FAFAFAA9A9A9AAAAAAA9A9A9FAFAFAFAFAFAAAAAAAAAAAAAA9A9A9FAFAFAFAFA
              FAFAFAFAC0C0C0000000000000666666F6F6F6F6F6F64E2D174E2D174E2D17F6
              F6F6F6F6F6F6F6F6F6F6F64E2D174E2D174E2D17F6F6F6F6F6F6666666000000
              000000C0C0C0FBFBFBFBFBFBA8A8A8A8A8A8A8A8A8FBFBFBFBFBFBFBFBFBFBFB
              FBA8A8A8A8A8A8A8A8A8FBFBFBFBFBFBC0C0C0000000000000666666F9F8F8F9
              F8F94E2D174E2D17F9F8F9F9F9F8F9F9F9F9F9F8F9F9F9F9F9F94E2D174E2D17
              F9F8F9F9F9F8666666000000000000C0C0C0FCFCFCFCFCFCA8A8A8A8A8A8FCFC
              FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA8A8A8A8A8A8FCFCFCFDFDFDC0C0C000
              0000000000666666FCFCFBFBFCFCFBFBFCFCFBFCFBFBFBFBFBFCFCFBFCFCFBFB
              FBFBFBFCFCFBFCFBFBFBFCFCFBFBFBFBFBFB666666000000000000C0C0C0FEFE
              FEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFDFDFDFE
              FEFEFDFDFDFDFDFDC0C0C0000000000000666666FEFEFEFDFEFEFDFEFEFDFEFD
              FEFEFDFDFEFEFEFDFDFDFEFEFEFDFDFEFEFDFEFEFDFDFDFEFDFDFEFEFEFE6666
              66000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF
              FFFFFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFC0C0C0000000000000666666
              6666666666666666666666666666666666666666666666666666666666666666
              66666666666666666666666666000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C00000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000000000000000000}
            NumGlyphs = 2
            TabOrder = 1
            OnClick = B_SCancelClick
            OnEnter = OnEnter
          end
        end
      end
      object P_SyouTop: TMPanel
        Left = 0
        Top = 44
        Width = 752
        Height = 75
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentBackground = False
        ParentColor = True
        ParentFont = False
        PopupMenu = PopupFusen
        TabOrder = 1
        OnEnter = OnEnter
        object LCode: TMLabel
          Left = 30
          Top = 2
          Width = 58
          Height = 13
          AutoSize = False
          Caption = #12467#12540#12489
          FontRatio.Auto = False
        end
        object LLName: TMLabel
          Left = 30
          Top = 24
          Width = 52
          Height = 13
          AutoSize = False
          Caption = #27491#24335#21517#31216
          FontRatio.Auto = False
        end
        object LSName: TMLabel
          Left = 30
          Top = 46
          Width = 52
          Height = 13
          AutoSize = False
          Caption = #31777#30053#21517#31216
          FontRatio.Auto = False
        end
        object LRen: TMLabel
          Left = 195
          Top = 2
          Width = 26
          Height = 13
          AutoSize = False
          Caption = #36899#24819
          FontRatio.Auto = False
        end
        object LBunseki: TMLabel
          Left = 319
          Top = 2
          Width = 60
          Height = 13
          AutoSize = False
          Caption = #20998#26512#12467#12540#12489
          FontRatio.Auto = False
        end
        object LYoubun: TMLabel
          Left = 340
          Top = 46
          Width = 83
          Height = 13
          AutoSize = False
          Caption = #35201#32004#20998#26512#12467#12540#12489
          Visible = False
          FontRatio.Auto = False
        end
        object LSeikaku: TMLabel
          Left = 319
          Top = 24
          Width = 60
          Height = 13
          AutoSize = False
          Caption = #24615#26684#12467#12540#12489
          FontRatio.Auto = False
        end
        object LBunName: TMLabel
          Left = 426
          Top = 0
          Width = 110
          Height = 19
          AutoSize = False
          FontRatio.Auto = False
        end
        object LYoBunName: TMLabel
          Left = 587
          Top = 108
          Width = 104
          Height = 19
          AutoSize = False
          Color = clSilver
          ParentColor = False
          Visible = False
          FontRatio.Auto = False
        end
        object LSeikakuName: TMLabel
          Left = 426
          Top = 22
          Width = 110
          Height = 19
          AutoSize = False
          FontRatio.Auto = False
        end
        object LYouyaku: TMLabel
          Left = 548
          Top = 2
          Width = 60
          Height = 13
          AutoSize = False
          Caption = #35201#32004#12467#12540#12489
          FontRatio.Auto = False
        end
        object LYouName: TMLabel
          Left = 646
          Top = 0
          Width = 110
          Height = 19
          AutoSize = False
          FontRatio.Auto = False
        end
        object LKotei: TMLabel
          Left = 548
          Top = 24
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #22266#23450#36027
          FontRatio.Auto = False
        end
        object LKoteiName: TMLabel
          Left = 646
          Top = 22
          Width = 110
          Height = 19
          AutoSize = False
          FontRatio.Auto = False
        end
        object LHendo: TMLabel
          Left = 548
          Top = 46
          Width = 57
          Height = 13
          AutoSize = False
          Caption = #22793#21205#36027
          FontRatio.Auto = False
        end
        object LHendoName: TMLabel
          Left = 646
          Top = 44
          Width = 110
          Height = 19
          AutoSize = False
          FontRatio.Auto = False
        end
        object DtlCmnImgFusen: TImage
          Left = 6
          Top = 2
          Width = 16
          Height = 16
          AutoSize = True
          Transparent = True
        end
        object ERen: TMTxtEdit
          Left = 227
          Top = 0
          Width = 86
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          Hankaku = True
          ImeMode = imSKata
          MaxLength = 10
          FontRatio.Auto = False
          TabOrder = 1
          Text = ''
          OnEnter = OnEnter
          OnExit = ESNameExit
          ValidChars = ''
        end
        object ELName: TMTxtEdit
          Left = 89
          Top = 22
          Width = 198
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          ImeMode = imHira
          MaxLength = 30
          FontRatio.Auto = False
          TabOrder = 2
          Text = ''
          OnEnter = ELNameEnter
          OnExit = ELNameExit
          ValidChars = ''
        end
        object ESName: TMTxtEdit
          Left = 89
          Top = 44
          Width = 118
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          ImeMode = imHira
          MaxLength = 14
          FontRatio.Auto = False
          TabOrder = 3
          Text = ''
          OnEnter = ESNameEnter
          OnExit = ESNameExit
          ValidChars = ''
        end
        object EBunCode: TMNumEdit
          Left = 382
          Top = 0
          Width = 27
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = fnCodeOnArrowClick
          ArrowType = atOmission
          F4Arrow = True
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          ImeMode = imClose
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 4
          OnChange = EBunCodeChange
          OnEnter = EBunCodeEnter
          OnExit = EBunCodeExit
          Negative = False
          Validate = False
        end
        object ESeikakuCode: TMNumEdit
          Left = 382
          Top = 22
          Width = 20
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          SelectItems.Strings = (
            '0: '#36890#24120#31185#30446#22411
            '1: '#25903#25173#20661#21209#22411
            '2: '#25903#25173#25163#24418#22411
            '3: '#24403#24231#23567#20999#25163#22411
            '4: '#25903#25173#20808#26085#20184#23567#20999#25163
            '5: '#22770#25499#37329#22411
            '6: '#21463#21462#25163#24418#22411
            '7: '#21106#24341#25163#24418#22411
            '8: '#21463#21462#20808#26085#20184#23567#20999#25163
            '9: '#26399#26085#20184#20661#27177#22411
            '10: '#26399#26085#20184#20661#21209#22411
            '11: '#26399#26085#20184#20661#27177#22411#65298
            '12: '#26399#26085#20184#20661#21209#22411#65298
            '13: '#30058#21495#20184#20661#27177#22411
            '14: '#30058#21495#20184#20661#21209#22411
            '15: '#30058#21495#20184#20661#27177#22411#65298
            '16: '#30058#21495#20184#20661#21209#22411#65298
            '17: '#26399#26085#25351#23450#25391#36796)
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          ImeMode = imClose
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 5
          OnEnter = ESeikakuCodeEnter
          OnExit = ESeikakuCodeExit
          Negative = False
          Validate = False
        end
        object EYouCode: TMNumEdit
          Left = 611
          Top = 0
          Width = 20
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          OnArrowClick = fnCodeOnArrowClick
          ArrowType = atOmission
          F4Arrow = True
          AutoSize = False
          Enabled = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          ImeMode = imClose
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 6
          OnEnter = EBunCodeEnter
          OnExit = EBunCodeExit
          Negative = False
          Validate = False
        end
        object EKotei: TMNumEdit
          Left = 611
          Top = 22
          Width = 20
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          OnArrowClick = fnCodeOnArrowClick
          ArrowType = atOmission
          F4Arrow = True
          AutoSize = False
          Enabled = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          ImeMode = imClose
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 7
          OnEnter = EBunCodeEnter
          OnExit = EBunCodeExit
          Negative = False
          Validate = False
        end
        object EHendo: TMNumEdit
          Left = 611
          Top = 44
          Width = 20
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          OnArrowClick = fnCodeOnArrowClick
          ArrowType = atOmission
          F4Arrow = True
          AutoSize = False
          Enabled = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          ImeMode = imClose
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 8
          OnEnter = EBunCodeEnter
          OnExit = EBunCodeExit
          Negative = False
          Validate = False
        end
        object ECode: TMTxtEdit
          Left = 89
          Top = 0
          Width = 99
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          ImeMode = imDisable
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 0
          Text = ''
          OnEnter = OnEnter
          OnExit = ECodeExit
          ValidChars = ''
        end
      end
    end
  end
  object StatusBar: TMStatusBar
    Left = 0
    Top = 582
    Width = 963
    Height = 18
    Color = 15921906
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object TreeView: TMTreeView
    Left = 0
    Top = 50
    Width = 209
    Height = 532
    Align = alLeft
    DragMode = dmAutomatic
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    HotTrack = True
    Images = ImageList
    Indent = 19
    ParentFont = False
    PopupMenu = PopupMenu
    ReadOnly = True
    RightClickSelect = True
    ShowLines = False
    TabOrder = 1
    OnChange = TreeViewChange
    OnDragDrop = TreeViewDragDrop
    OnDragOver = TreeViewDragOver
    OnEnter = OnEnter
    OnExit = TreeViewExit
    OnExpanded = TreeViewExpanded
    OnKeyDown = TreeViewKeyDown
  end
  object P_Top: TMPanel
    Left = 0
    Top = 25
    Width = 963
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 0
    Visible = False
    OnEnter = OnEnter
    object MLabel1: TMLabel
      Left = 4
      Top = 2
      Width = 57
      Height = 19
      AutoSize = False
      Caption = #31185#30446#20998#39006
      FontRatio.Auto = False
    end
    object MComboBox_: TMComboBox
      Left = 60
      Top = 2
      Width = 149
      Height = 19
      CanEdit = False
      Columns = <
        item
          Width = 200
          Color = clWindow
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end>
      FocusedColor = clAqua
      TabOrder = 0
    end
  end
  object P_Title: TMPanel
    Left = 0
    Top = 0
    Width = 963
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #65325#65331' '#12468#12471#12483#12463
    Font.Style = []
    ParentBackground = False
    ParentColor = True
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnEnter = OnEnter
    DesignSize = (
      963
      25)
    object B_End: TMSpeedButton
      Left = 2
      Top = 2
      Width = 70
      Height = 21
      Caption = #32066#20102'(&X)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000006666666666666666666666666666666666666666666666
        66666666666666666666666666666666666666666666666666000000000000C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666DCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDDDDCDDDCDCDCDCDCDCDCDCDCDCDC
        DCDD666666000000000000C0C0C0F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1C0C0C00000000000
        00666666DEDFDEDFDEDFDEDEDEDFDFDEDEDEDFDEDFDEDEDEDFDEDEDFDEDFDEDE
        DEDFDFDEDEDEDFDEDFDFDEDFDFDF666666000000000000C0C0C0F2F2F2F1F1F1
        F1F1F1F2F2F2F1F1F1F2F2F2F1F1F1F1F1F1F2F2F2F1F1F1F1F1F1F2F2F2F2F2
        F2F2F2F2C0C0C0000000000000666666E1E1E0E1E0E18B50298B5029E0E1E1E0
        E1E0E0E1E1E1E0E1E1E1E0E0E1E08B50298B5029E1E0E1E1E0E1666666000000
        000000C0C0C0F3F3F3F2F2F2B7B7B7B7B7B7F3F3F3F3F3F3F3F3F3F2F2F2F3F3
        F3F3F3F3B7B7B7B7B7B7F2F2F2F2F2F2C0C0C0000000000000666666E3E3E3E3
        E3E38B50298B50298B5029E3E3E3E3E3E3E3E3E3E4E3E38B50298B50298B5029
        E3E3E4E3E3E3666666000000000000C0C0C0F3F3F3F3F3F3B7B7B7B7B7B7B7B7
        B7F3F3F3F3F3F3F3F3F3F3F3F3B7B7B7B7B7B7B7B7B7F3F3F3F3F3F3C0C0C000
        0000000000666666E5E6E6E6E6E5E5E6E6844D27844C27854C28E6E6E6E6E6E6
        854D27844C27844C27E6E6E6E6E6E6E6E6E6666666000000000000C0C0C0F5F5
        F5F5F5F5F5F5F5B5B5B5B5B5B5B5B5B5F5F5F5F5F5F5B5B5B5B5B5B5B5B5B5F5
        F5F5F5F5F5F5F5F5C0C0C0000000000000666666E8E8E9E8E9E8E8E8E9E9E8E9
        7B48257B4824E8E9E8E9E9E87C47247C4724E8E8E8E8E8E9E8E8E9E9E8E86666
        66000000000000C0C0C0F6F6F6F6F6F6F6F6F6F6F6F6B3B3B3B3B3B3F6F6F6F6
        F6F6B3B3B3B3B3B3F6F6F6F6F6F6F6F6F6F6F6F6C0C0C0000000000000666666
        EBEBEBEAEBEBEBEBEBEBEBEBEBEBEB724122714121724122714122EBEBEBEBEB
        EBEBEBEBEBEBEAEBEBEB666666000000000000C0C0C0F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7B0B0B0B0B0B0B0B0B0B0B0B0F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        C0C0C0000000000000666666EDEDEDEEEDEEEDEDEDEEEDEDEEEDEE683C1E683C
        1F693C1F683C1FEEEDEDEDEDEDEDEDEDEDEDEDEEEDEE666666000000000000C0
        C0C0F8F8F8F8F8F8F8F8F8F8F8F8F8F8F8AEAEAEAEAEAEAEAEAEAEAEAEF8F8F8
        F8F8F8F8F8F8F8F8F8F8F8F8C0C0C0000000000000666666F0F0F0F0F1F0F1F0
        F1F0F0F15F371C5E361BF0F0F0F0F1F05E361C5E371CF1F0F1F1F0F0F0F0F1F0
        F0F0666666000000000000C0C0C0F9F9F9F9F9F9F9F9F9F9F9F9ACACACACACAC
        F9F9F9F9F9F9ACACACACACACF9F9F9F9F9F9F9F9F9F9F9F9C0C0C00000000000
        00666666F3F3F3F4F3F3F3F3F3543019543119543019F3F4F3F3F3F355311955
        3119553019F3F3F4F3F3F3F3F3F3666666000000000000C0C0C0FAFAFAFAFAFA
        FAFAFAA9A9A9AAAAAAA9A9A9FAFAFAFAFAFAAAAAAAAAAAAAA9A9A9FAFAFAFAFA
        FAFAFAFAC0C0C0000000000000666666F6F6F6F6F6F64E2D174E2D174E2D17F6
        F6F6F6F6F6F6F6F6F6F6F64E2D174E2D174E2D17F6F6F6F6F6F6666666000000
        000000C0C0C0FBFBFBFBFBFBA8A8A8A8A8A8A8A8A8FBFBFBFBFBFBFBFBFBFBFB
        FBA8A8A8A8A8A8A8A8A8FBFBFBFBFBFBC0C0C0000000000000666666F9F8F8F9
        F8F94E2D174E2D17F9F8F9F9F9F8F9F9F9F9F9F8F9F9F9F9F9F94E2D174E2D17
        F9F8F9F9F9F8666666000000000000C0C0C0FCFCFCFCFCFCA8A8A8A8A8A8FCFC
        FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA8A8A8A8A8A8FCFCFCFDFDFDC0C0C000
        0000000000666666FCFCFBFBFCFCFBFBFCFCFBFCFBFBFBFBFBFCFCFBFCFCFBFB
        FBFBFBFCFCFBFCFBFBFBFCFCFBFBFBFBFBFB666666000000000000C0C0C0FEFE
        FEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFDFDFDFE
        FEFEFDFDFDFDFDFDC0C0C0000000000000666666FEFEFEFDFEFEFDFEFEFDFEFD
        FEFEFDFDFEFEFEFDFDFDFEFEFEFDFDFEFEFDFEFEFDFDFDFEFDFDFEFEFEFE6666
        66000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF
        FFFFFEFEFEFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFC0C0C0000000000000666666
        6666666666666666666666666666666666666666666666666666666666666666
        66666666666666666666666666000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C00000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000}
      NumGlyphs = 2
      ParentFont = False
      OnClick = B_EndClick
    end
    object B_Print_: TMSpeedButton
      Left = 72
      Top = 2
      Width = 70
      Height = 21
      Caption = #21360#21047'(&P)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000006666666666666666666666666666666666666666666666
        66666666666666666666666666666666666666666666666666000000000000C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666DCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDC666666000000000000C0C0C0F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1C0C0C00000000000
        00666666DEDFDEDEDFDE8B50298B50298B50298B50298B50298B50298B50298B
        50298B50298B5029DEDFDEDEDFDE666666000000000000C0C0C0F2F2F2F2F2F2
        B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7F2F2
        F2F2F2F2C0C0C0000000000000666666E1E1E0E1E1E08B5029FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B5029E1E1E0E1E1E0666666000000
        000000C0C0C0F3F3F3F3F3F3B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFB7B7B7F3F3F3F3F3F3C0C0C0000000000000666666E3E3E3E3
        E3E3874E27FFFFFF874E28874E28874D28874E28874E27874E28FFFFFF874D28
        E3E3E3E3E3E3666666000000000000C0C0C0F3F3F3F3F3F3B5B5B5FFFFFFB6B6
        B6B6B6B6B5B5B5B6B6B6B5B5B5B6B6B6FFFFFFB5B5B5F3F3F3F3F3F3C0C0C000
        0000000000666666E5E6E6E5E6E6814B26FFFFFFFFFFFFFFFFFF814A26814B26
        FFFFFFFFFFFFFFFFFF814A26E5E6E6E5E6E6666666000000000000C0C0C0F5F5
        F5F5F5F5B4B4B4FFFFFFFFFFFFFFFFFFB4B4B4B4B4B4FFFFFFFFFFFFFFFFFFB4
        B4B4F5F5F5F5F5F5C0C0C0000000000000666666E8E8E9E8E8E9E8E8E97A4624
        F2F2F27A47247A47247A46247B4624F2F2F27B4724E8E8E9E8E8E9E8E8E96666
        66000000000000C0C0C0F6F6F6F6F6F6F6F6F6B2B2B2FAFAFAB3B3B3B3B3B3B2
        B2B2B2B2B2FAFAFAB3B3B3F6F6F6F6F6F6F6F6F6C0C0C0000000000000666666
        EBEBEB744222744322744222E0E0E0E0E0E0E0E0DFE0E0E0E0E0E0DFDFDF7342
        22744322744222EBEBEB666666000000000000C0C0C0F7F7F7B1B1B1B1B1B1B1
        B1B1F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2B1B1B1B1B1B1B1B1B1F7F7F7
        C0C0C0000000000000666666EDEDED6D3F21EDEDED6D3F21CCCCCCCCCCCCCCCC
        CCCCCCCCCCCCCCCCCCCC6D3F21EDEDED6E3F20EDEDED666666000000000000C0
        C0C0F8F8F8B0B0B0F8F8F8B0B0B0EAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEAEA
        B0B0B0F8F8F8B0B0B0F8F8F8C0C0C0000000000000666666F0F0F0663B1FF0F0
        F0673B1E663B1E673B1E663B1E673B1E673B1F663B1F663B1EF0F0F0673B1FF0
        F0F0666666000000000000C0C0C0F9F9F9AEAEAEF9F9F9AEAEAEAEAEAEAEAEAE
        AEAEAEAEAEAEAEAEAEAEAEAEAEAEAEF9F9F9AEAEAEF9F9F9C0C0C00000000000
        00666666F3F3F35F371CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF5F371CF3F3F3666666000000000000C0C0C0FAFAFAACACAC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACAC
        ACFAFAFAC0C0C0000000000000666666F6F6F658331AFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF2B00D6FFFFFF29A40029A400FFFFFF58331AF6F6F6666666000000
        000000C0C0C0FBFBFBABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBEFFFF
        FFCDCDCDCDCDCDFFFFFFABABABFBFBFBC0C0C0000000000000666666F9F8F853
        2F19FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        522F18F9F8F8666666000000000000C0C0C0FCFCFCA9A9A9FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9FCFCFCC0C0C000
        0000000000666666FCFCFB4E2D174E2D174E2D174E2D174E2D174E2D174E2D17
        4E2D174E2D174E2D174E2D174E2D17FCFCFB666666000000000000C0C0C0FEFE
        FEA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8FEFEFEC0C0C0000000000000666666FEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE6666
        66000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000000000666666
        6666666666666666666666666666666666666666666666666666666666666666
        66666666666666666666666666000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C00000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000}
      NumGlyphs = 2
      ParentFont = False
      OnClick = B_PrintClick
    end
    object B_Change: TMSpeedButton
      Left = 142
      Top = 2
      Width = 70
      Height = 21
      Caption = #20999#20986'(&G)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000006666666666666666666666666666666666666666666666
        66666666666666666666666666666666666666666666666666000000000000C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666DCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDDDDCDDDCDCDCDCDCDCDCDCDCDCDC
        DCDD666666000000000000C0C0C0F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1C0C0C00000000000
        00666666DEDFDE8B50298B50298B50298B50298B50298B50298B5029DEDFDEDE
        DEDFDFDEDEDEDFDEDFDFDEDFDFDF666666000000000000C0C0C0F2F2F2B7B7B7
        B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7F2F2F2F1F1F1F1F1F1F2F2F2F2F2
        F2F2F2F2C0C0C0000000000000666666E1E1E0874E27FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF874E28E1E1E0E0E1E0E1E1E1E0E1E0E1E0E1E1E0E1666666000000
        000000C0C0C0F3F3F3B5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6F3F3
        F3F3F3F3F3F3F3F3F3F3F2F2F2F2F2F2C0C0C0000000000000666666E3E3E381
        4A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF824B26824B26814B26814B26824B26
        814B26E3E3E3666666000000000000C0C0C0F3F3F3B4B4B4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFB4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4F3F3F3C0C0C000
        0000000000666666E5E6E67A4724FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A4724
        FFFFFFFFFFFFFFFFFFFFFFFF7B4724E6E6E6666666000000000000C0C0C0F5F5
        F5B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3FFFFFFFFFFFFFFFFFFFF
        FFFFB3B3B3F5F5F5C0C0C0000000000000666666E8E8E9744322FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF734322FFFFFFFFFFFFFFFFFFFFFFFF744322E9E8E86666
        66000000000000C0C0C0F6F6F6B1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1
        B1B1FFFFFFFFFFFFFFFFFFFFFFFFB1B1B1F6F6F6C0C0C0000000000000666666
        EBEBEB6D3F216E3F206D3F206D3E206D3F206D3F216D3F20FFFFFFFFFFFFFFFF
        FFFFFFFF6D3F20EBEBEB666666000000000000C0C0C0F7F7F7B0B0B0B0B0B0B0
        B0B0AFAFAFB0B0B0B0B0B0B0B0B0FFFFFFFFFFFFFFFFFFFFFFFFB0B0B0F7F7F7
        C0C0C0000000000000666666EDEDEDEDEDEDEEEDEE673B1EFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF673B1EEEEDEE666666000000000000C0
        C0C0F8F8F8F8F8F8F8F8F8AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFAEAEAEF8F8F8C0C0C0000000000000666666F0F0F0F3F3F3F4F3
        F35F371CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F371CF0
        F0F0666666000000000000C0C0C0F9F9F9FAFAFAFAFAFAACACACFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACACF9F9F9C0C0C00000000000
        00666666F3F3F3F3F3F3F4F3F358331AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF58331AF3F3F3666666000000000000C0C0C0FAFAFAFAFAFA
        FAFAFAABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABAB
        ABFAFAFAC0C0C0000000000000666666F6F6F6F6F6F6F6F6F6522F18522F1952
        2F18522F18522F18522F18522F18522F19532F18523019F6F6F6666666000000
        000000C0C0C0FBFBFBFBFBFBFBFBFBA9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
        A9A9A9A9A9A9A9A9A9A9A9A9A9FBFBFBC0C0C0000000000000666666F9F8F8F9
        F8F8F9F8F94E2D17F0C47AF0C47AF0C47AF0C47AF0C47AF0C47AF0C47AF0C47A
        4E2D17F9F9F8666666000000000000C0C0C0FCFCFCFCFCFCFCFCFCA8A8A8E2E2
        E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2E2A8A8A8FDFDFDC0C0C000
        0000000000666666FCFCFBFCFCFBFBFBFC4E2D174E2D174E2D174E2D174E2D17
        4E2D174E2D174E2D174E2D174E2D17FBFBFB666666000000000000C0C0C0FEFE
        FEFEFEFEFDFDFDA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8FDFDFDC0C0C0000000000000666666FEFEFEFEFEFEFDFEFEFCFBFC
        FBFBFBFBFBFCFCFBFCFCFBFBFBFBFBFCFCFBFCFBFBFBFCFCFBFBFBFEFEFE6666
        66000000000000C0C0C0FFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFEFEFEFDFDFDFEFEFEFDFDFDFFFFFFC0C0C0000000000000666666
        6666666666666666666666666666666666666666666666666666666666666666
        66666666666666666666666666000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C00000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000}
      NumGlyphs = 2
      ParentFont = False
      OnClick = B_ChangeClick
    end
    object B_Syousai_: TMSpeedButton
      Left = 212
      Top = 2
      Width = 70
      Height = 21
      Caption = #35443#32048'(&T)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000006666666666666666666666666666666666666666666666
        66666666666666666666666666666666666666666666666666000000000000C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666DCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC3F70983F
        7098666666000000000000C0C0C0F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1C7C7C7C7C7C7C0C0C00000000000
        00666666DEDFDEDFDEDFDEDFDEDFDEDFDEDFDEDFDEDFDEDFDEDEDFDEDEDFDE59
        59595959595959593F70983F7098666666000000000000C0C0C0F2F2F2F1F1F1
        F2F2F2F1F1F1F2F2F2F1F1F1F2F2F2F2F2F2F2F2F2BBBBBBBBBBBBBBBBBBC7C7
        C7C7C7C7C0C0C0000000000000666666E1E1E0E1E0E18B50298B50298B50298B
        5029E1E1E0E1E1E0595959595959F0DCB0595959595959E1E0E1666666000000
        000000C0C0C0F3F3F3F2F2F2B7B7B7B7B7B7B7B7B7B7B7B7F3F3F3F3F3F3BBBB
        BBBBBBBBEDEDEDBBBBBBBBBBBBF2F2F2C0C0C0000000000000666666E3E3E3E3
        E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3595959F0DCB0F0DCB0F0DCB0
        595959E3E3E3666666000000000000C0C0C0F3F3F3F3F3F3F3F3F3F3F3F3F3F3
        F3F3F3F3F3F3F3F3F3F3BBBBBBEDEDEDEDEDEDEDEDEDBBBBBBF3F3F3C0C0C000
        0000000000666666E5E6E6E6E6E58B50298B50298B50298B50298B5029E6E6E5
        595959595959F0DCB0595959595959E6E6E6666666000000000000C0C0C0F5F5
        F5F5F5F5B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7F5F5F5BBBBBBBBBBBBEDEDEDBB
        BBBBBBBBBBF5F5F5C0C0C0000000000000666666E8E8E9E8E9E8854D28FFFFFF
        FFFFFF864D28FFFFFF864D27E8E8E9595959595959595959E8E8E9E9E8E86666
        66000000000000C0C0C0F6F6F6F6F6F6B5B5B5FFFFFFFFFFFFB5B5B5FFFFFFB5
        B5B5F6F6F6BBBBBBBBBBBBBBBBBBF6F6F6F6F6F6C0C0C0000000000000666666
        EBEBEBEAEBEB7E48257E48257E49257E49257E48257E48257E4925EBEBEBEBEB
        EBEBEBEBEBEBEBEBEBEB666666000000000000C0C0C0F7F7F7F7F7F7B3B3B3B3
        B3B3B4B4B4B4B4B4B3B3B3B3B3B3B4B4B4F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        C0C0C0000000000000666666EDEDEDEEEDEE764423FFFFFFFFFFFF764422FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF764423EDEDEDEEEDEE666666000000000000C0
        C0C0F8F8F8F8F8F8B2B2B2FFFFFFFFFFFFB2B2B2FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFB2B2B2F8F8F8F8F8F8C0C0C0000000000000666666F0F0F0F0F1F06D3F
        206E3F216D3F206D3F206D3F206D3F206D3F206D3F206D3F216D3F20F0F0F1F0
        F0F0666666000000000000C0C0C0F9F9F9F9F9F9B0B0B0B0B0B0B0B0B0B0B0B0
        B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0F9F9F9F9F9F9C0C0C00000000000
        00666666F3F3F3F4F3F3653A1DFFFFFFFFFFFF653A1EFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF643A1EF3F3F3F3F3F3666666000000000000C0C0C0FAFAFAFAFAFA
        ADADADFFFFFFFFFFFFADADADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADADFAFA
        FAFAFAFAC0C0C0000000000000666666F6F6F6F6F6F65C351B5B351B5C351B5C
        351B5C351B5B351B5C351B5C341B5C351B5C351BF6F6F6F6F6F6666666000000
        000000C0C0C0FBFBFBFBFBFBABABABABABABABABABABABABABABABABABABABAB
        ABABABABABABABABABABFBFBFBFBFBFBC0C0C0000000000000666666F9F8F8F9
        F8F9533019FFFFFFFFFFFF533018FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF543019
        F9F8F9F9F9F8666666000000000000C0C0C0FCFCFCFCFCFCA9A9A9FFFFFFFFFF
        FFA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9FCFCFCFDFDFDC0C0C000
        0000000000666666FCFCFBFBFCFC4E2D174E2D174E2D174E2D174E2D174E2D17
        4E2D174E2D174E2D174E2D17FBFBFBFBFBFB666666000000000000C0C0C0FEFE
        FEFEFEFEA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8FDFDFDFDFDFDC0C0C0000000000000666666FEFEFEFDFEFEFEFEFEFDFEFE
        FEFEFEFDFEFEFEFEFEFDFEFEFEFEFEFDFEFEFEFEFEFDFEFEFDFDFEFEFEFE6666
        66000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFC0C0C0000000000000666666
        6666666666666666666666666666666666666666666666666666666666666666
        66666666666666666666666666000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C00000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000}
      NumGlyphs = 2
      ParentFont = False
    end
    object B_Delete_: TMSpeedButton
      Left = 282
      Top = 2
      Width = 70
      Height = 21
      Caption = #21066#38500'(&D)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000006666666666666666666666666666666666666666666666
        66666666666666666666666666666666666666666666666666000000000000C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666DCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDD666666000000000000C0C0C0DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDC0C0C00000000000
        00666666DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDE
        DFDEDEDFDEDEDFDEDEDFDEDFDFDF666666000000000000C0C0C0DEDFDEDEDFDE
        DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDF
        DEDFDFDFC0C0C0000000000000666666E1E1E08B50298B50298B50298B50298B
        50298B5029E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E0E1666666000000
        000000C0C0C0E1E1E0B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7E1E1E0E1E1
        E0E1E1E0E1E1E0E1E1E0E1E1E0E1E0E1C0C0C0000000000000666666E3E3E34E
        2D174E2D174E2D174E2D174E2D174E2D17E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
        E3E3E3E3E3E3666666000000000000C0C0C0E3E3E3A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8A8A8E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3C0C0C000
        0000000000666666E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6
        E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E6E6E6666666000000000000C0C0C0E5E6
        E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5
        E6E6E5E6E6E6E6E6C0C0C0000000000000666666E8E8E9E8E8E9E8E8E9E8E8E9
        E8E8E9E8E8E9E8E8E9E8E8E92600BD2600BDE8E8E92600BD2600BDE9E8E86666
        66000000000000C0C0C0E8E8E9E8E8E9E8E8E9E8E8E9E8E8E9E8E8E9E8E8E9E8
        E8E9B6B6B6B6B6B6E8E8E9B6B6B6B6B6B6E9E8E8C0C0C0000000000000666666
        EBEBEB0D76E60D76E60D76E60D76E60D76E60D76E6EBEBEBEBEBEB2300AC2300
        AC2200ACEBEBEBEBEBEB666666000000000000C0C0C0EBEBEBD2D2D2D2D2D2D2
        D2D2D2D2D2D2D2D2D2D2D2EBEBEBEBEBEBB6B6B6B6B6B6B6B6B6EBEBEBEBEBEB
        C0C0C0000000000000666666EDEDED154CDE154CDE154CDE154CDE154CDE154C
        DEEDEDEDEDEDED1C008D1C008D1C008DEDEDEDEEEDEE666666000000000000C0
        C0C0EDEDEDC8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8EDEDEDEDEDEDB0B0B0
        B0B0B0B0B0B0EDEDEDEEEDEEC0C0C0000000000000666666F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F01C008D1C008DF0F0F01C008D1C008DF0
        F0F0666666000000000000C0C0C0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0B0B0B0B0B0B0F0F0F0B0B0B0B0B0B0F0F0F0C0C0C00000000000
        00666666F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
        F3F3F3F3F3F3F3F3F3F3F3F3F3F3666666000000000000C0C0C0F3F3F3F3F3F3
        F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
        F3F3F3F3C0C0C0000000000000666666F6F6F68B50298B50298B50298B50298B
        50298B5029F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6666666000000
        000000C0C0C0F6F6F6B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7F6F6F6F6F6
        F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6C0C0C0000000000000666666F9F8F84E
        2D174E2D174E2D174E2D174E2D174E2D17F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8
        F9F8F8F9F9F8666666000000000000C0C0C0F9F8F8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8A8A8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F9F8C0C0C000
        0000000000666666FCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFB
        FCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFBFBFB666666000000000000C0C0C0FCFC
        FBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFC
        FCFBFCFCFBFBFBFBC0C0C0000000000000666666FEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE6666
        66000000000000C0C0C0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC0C0C0000000000000666666
        6666666666666666666666666666666666666666666666666666666666666666
        66666666666666666666666666000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C00000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000}
      NumGlyphs = 2
      ParentFont = False
      OnClick = B_Delete_Click
    end
    object B_KmkCopy_: TMSpeedButton
      Left = 352
      Top = 2
      Width = 95
      Height = 21
      Caption = #31185#30446#65402#65419#65439#65392'(&R)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000006666666666666666666666666666666666666666666666
        66666666666666666666666666666666666666666666666666000000000000C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666DCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDD666666000000000000C0C0C0DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDC0C0C00000000000
        00666666DEDFDEDEDFDEDEDFDEDEDFDE874D28874D28874E28874E28874D2887
        4E28874D28874E28874E28DFDFDF666666000000000000C0C0C0DEDFDEDEDFDE
        DEDFDEDEDFDEB7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
        B7DFDFDFC0C0C0000000000000666666E1E1E0E1E1E0E1E1E0E1E1E0824A26FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF814A26E1E0E1666666000000
        000000C0C0C0E1E1E0E1E1E0E1E1E0E1E1E0B7B7B7FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFB7B7B7E1E0E1C0C0C0000000000000666666E3E3E387
        4D28874D28874E287B4724FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        7A4625E3E3E3666666000000000000C0C0C0E3E3E3B7B7B7B7B7B7B7B7B7B3B3
        B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3E3E3E3C0C0C000
        0000000000666666E5E6E6824A26D9D9D9D9D9D9744222FFFFFF744322734322
        744223744222744322FFFFFF744322E6E6E6666666000000000000C0C0C0E5E6
        E6B7B7B7D9D9D9D9D9D9B3B3B3FFFFFFB3B3B3B3B3B3B3B3B3B3B3B3B3B3B3FF
        FFFFB3B3B3E6E6E6C0C0C0000000000000666666E8E8E97B4724D9D9D9D9D9D9
        6D3F20FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D3F20E9E8E86666
        66000000000000C0C0C0E8E8E9B3B3B3D9D9D9D9D9D9B0B0B0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B0E9E8E8C0C0C0000000000000666666
        EBEBEB744222D9D9D9744322673C1EFFFFFF673B1E663B1E673B1E663B1F673B
        1EFFFFFF673B1EEBEBEB666666000000000000C0C0C0EBEBEBB3B3B3D9D9D9B3
        B3B3B0B0B0FFFFFFB0B0B0B0B0B0B0B0B0B0B0B0B0B0B0FFFFFFB0B0B0EBEBEB
        C0C0C0000000000000666666EDEDED6D3F20D9D9D9D9D9D95F371CFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F371CEEEDEE666666000000000000C0
        C0C0EDEDEDB0B0B0D9D9D9D9D9D9ABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFABABABEEEDEEC0C0C0000000000000666666F0F0F0673C1ED9D9
        D9673B1E58331AFFFFFF58331A58331AFFFFFF58331AFFFFFFFFFFFF58331AF0
        F0F0666666000000000000C0C0C0F0F0F0B0B0B0D9D9D9B0B0B0ABABABFFFFFF
        ABABABABABABFFFFFFABABABFFFFFFFFFFFFABABABF0F0F0C0C0C00000000000
        00666666F3F3F35F371CD9D9D9D9D9D9522F18FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF523019F3F3F3666666000000000000C0C0C0F3F3F3ABABAB
        D9D9D9D9D9D9A8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8
        A8F3F3F3C0C0C0000000000000666666F6F6F658331AD9D9D958331A4E2D174E
        2D174E2D174E2D174E2D174E2D174E2D174E2D174E2D17F6F6F6666666000000
        000000C0C0C0F6F6F6ABABABD9D9D9ABABABA8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8A8A8F6F6F6C0C0C0000000000000666666F9F8F852
        2F18D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9523019F9F8F8F9F8F8
        F9F8F8F9F9F8666666000000000000C0C0C0F9F8F8A8A8A8D9D9D9D9D9D9D9D9
        D9D9D9D9D9D9D9D9D9D9D9D9D9A8A8A8F9F8F8F9F8F8F9F8F8F9F9F8C0C0C000
        0000000000666666FCFCFB4E2D174E2D174E2D174E2D174E2D174E2D174E2D17
        4E2D174E2D17FCFCFBFCFCFBFCFCFBFBFBFB666666000000000000C0C0C0FCFC
        FBA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8FCFCFBFC
        FCFBFCFCFBFBFBFBC0C0C0000000000000666666FEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE6666
        66000000000000C0C0C0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC0C0C0000000000000666666
        6666666666666666666666666666666666666666666666666666666666666666
        66666666666666666666666666000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C00000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000}
      NumGlyphs = 2
      ParentFont = False
      OnClick = B_KmkCopy_Click
    end
    object B_Search_: TMSpeedButton
      Left = 447
      Top = 2
      Width = 70
      Height = 21
      Caption = #26908#32034'(&Q)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000006666666666666666666666666666666666666666666666
        66666666666666666666666666666666666666666666666666000000000000C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666DCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDC666666000000000000C0C0C0F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1C0C0C00000000000
        00666666DEDFDE8B5029DEDFDE8B5029DEDFDEDEDFDEDEDFDEDEDFDE8B5029DE
        DFDE8B5029DEDFDE8B5029DEDFDE666666000000000000C0C0C0F2F2F2B7B7B7
        F2F2F2B7B7B7F2F2F2F2F2F2F2F2F2F2F2F2B7B7B7F2F2F2B7B7B7F2F2F2B7B7
        B7F2F2F2C0C0C0000000000000666666E1E1E0884E28874E28874E28E1E1E087
        4E28874D28E1E1E0874E28884E28884E28884E27874E28E1E1E0666666000000
        000000C0C0C0F3F3F3B6B6B6B6B6B6B6B6B6F3F3F3B6B6B6B5B5B5F3F3F3B6B6
        B6B6B6B6B6B6B6B6B6B6B6B6B6F3F3F3C0C0C0000000000000666666E3E3E3E3
        E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
        E3E3E3E3E3E3666666000000000000C0C0C0F3F3F3F3F3F3F3F3F3F3F3F3F3F3
        F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3C0C0C000
        0000000000666666E5E6E6E5E6E6E5E6E6E5E6E6E5E6E67D48257C47257C4724
        7C47257D47247D48257C48257C4724E5E6E6666666000000000000C0C0C0F5F5
        F5F5F5F5F5F5F5F5F5F5F5F5F5B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3
        B3B3B3B3B3F5F5F5C0C0C0000000000000666666E8E8E9E8E8E9E8E8E9E8E8E9
        E8E8E9764423FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF764423E8E8E96666
        66000000000000C0C0C0F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6B2B2B2FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2F6F6F6C0C0C0000000000000666666
        EBEBEB704021704021704121EBEBEB704121FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF704021EBEBEB666666000000000000C0C0C0F7F7F7B0B0B0B0B0B0B0
        B0B0F7F7F7B0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B0F7F7F7
        C0C0C0000000000000666666EDEDED6A3D1F6B3D206A3D1FEDEDED6A3D1F6A3E
        206B3D1F6A3D1F6A3D1F6A3D206A3D1F6A3E20EDEDED666666000000000000C0
        C0C0F8F8F8AFAFAFAFAFAFAFAFAFF8F8F8AFAFAFAFAFAFAFAFAFAFAFAFAFAFAF
        AFAFAFAFAFAFAFAFAFF8F8F8C0C0C0000000000000666666F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0666666000000000000C0C0C0F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9C0C0C00000000000
        00666666F3F3F3F3F3F3F3F3F3F3F3F3F3F3F35D361C5E361C5E361B5D361B5D
        361C5E361B5E361C5D351CF3F3F3666666000000000000C0C0C0FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAACACACACACACACACACACACACACACACACACACACACACABAB
        ABFAFAFAC0C0C0000000000000666666F6F6F6F6F6F6F6F6F6F6F6F6F6F6F658
        321AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57321AF6F6F6666666000000
        000000C0C0C0FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBAAAAAAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFAAAAAAFBFBFBC0C0C0000000000000666666F9F8F852
        2F19522F18513019F9F8F8523018FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        522F19F9F8F8666666000000000000C0C0C0FCFCFCA9A9A9A9A9A9A9A9A9FCFC
        FCA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9FCFCFCC0C0C000
        0000000000666666FCFCFB4E2D174E2D174E2D17FCFCFB4E2D174E2D174E2D17
        4E2D174E2D174E2D174E2D174E2D17FCFCFB666666000000000000C0C0C0FEFE
        FEA8A8A8A8A8A8A8A8A8FEFEFEA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8FEFEFEC0C0C0000000000000666666FEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE6666
        66000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000000000666666
        6666666666666666666666666666666666666666666666666666666666666666
        66666666666666666666666666000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C00000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000}
      NumGlyphs = 2
      ParentFont = False
      OnClick = B_Search_Click
    end
    object Image_Fusen_Red: TImage
      Left = 690
      Top = 0
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        0000100000000100180000000000000300000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF333333333333333333333333333333333333333333333333333333
        333333333333333333FFFFFFFFFFFFFFFFFFFFFFFF3333333620993520993521
        99333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333CCCCCC333333FFFFFFFF
        FFFFFFFFFF3333335A4BB65A4BB6594CB6333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFF333333CCCCCCCCCCCC333333FFFFFFFFFFFF3333337167C87168C87167
        C8333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333333333333333333333FF
        FFFFFFFFFF3333338681DB8781DA8781DA333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF3333339B99EA9A99EA9A98
        EA333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333FF
        FFFFFFFFFF333333A8A9F5A8A9F5A8A9F5333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF3333333333333333333333
        33333333333333333333333333333333333333333333333333333333333333FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Visible = False
    end
    object Image_Fusen_Blue: TImage
      Left = 706
      Top = 0
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        0000100000000100180000000000000300000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF333333333333333333333333333333333333333333333333333333
        333333333333333333FFFFFFFFFFFFFFFFFFFFFFFF333333C38F4BC38E4BC38E
        4B333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333CCCCCC333333FFFFFFFF
        FFFFFFFFFF333333CFA469CFA469D0A469333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFF333333CCCCCCCCCCCC333333FFFFFFFFFFFF333333D7B27ED6B27ED7B2
        7E333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333333333333333333333FF
        FFFFFFFFFF333333DEBE90DDBE90DDBE90333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF333333E4CAA1E4CAA1E4CA
        A1333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333FF
        FFFFFFFFFF333333E8D2ACE8D2ACE8D2AC333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF3333333333333333333333
        33333333333333333333333333333333333333333333333333333333333333FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Visible = False
    end
    object Image_Fusen_Green: TImage
      Left = 722
      Top = 0
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        0000100000000100180000000000000300000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF333333333333333333333333333333333333333333333333333333
        333333333333333333FFFFFFFFFFFFFFFFFFFFFFFF333333456E1C466E1C466E
        1C333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333CCCCCC333333FFFFFFFF
        FFFFFFFFFF333333638B41638B41638B42333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFF333333CCCCCCCCCCCC333333FFFFFFFFFFFF333333769D59769E59769E
        5A333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333333333333333333333FF
        FFFFFFFFFF33333387B07087AF7087AF70333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF33333397BF8497BF8497BF
        84333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333FF
        FFFFFFFFFF333333A2CA92A2CA92A2CA92333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF3333333333333333333333
        33333333333333333333333333333333333333333333333333333333333333FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Visible = False
    end
    object Image_Fusen_Orange: TImage
      Left = 738
      Top = 0
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        0000100000000100180000000000000300000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF333333333333333333333333333333333333333333333333333333
        333333333333333333FFFFFFFFFFFFFFFFFFFFFFFF333333338EFE328EFD328E
        FD333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333CCCCCC333333FFFFFFFF
        FFFFFFFFFF3333335FA9FB5EA9FB5EA9FB333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFF333333CCCCCCCCCCCC333333FFFFFFFFFFFF3333337ABAF97ABAF97ABA
        FA333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333333333333333333333FF
        FFFFFFFFFF33333395CAF895CBF895CAF8333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF333333A8D6F7A8D6F7A8D6
        F7333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333FF
        FFFFFFFFFF333333A8D6F7A8D6F7A8D6F7333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF3333333333333333333333
        33333333333333333333333333333333333333333333333333333333333333FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Visible = False
    end
    object Image_Fusen_Glay: TImage
      Left = 754
      Top = 0
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        0000100000000100180000000000000300000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF333333333333333333333333333333333333333333333333333333
        333333333333333333FFFFFFFFFFFFFFFFFFFFFFFF3333338585858585858585
        85333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333CCCCCC333333FFFFFFFF
        FFFFFFFFFF333333A9A9A9AAA9A9A9A9AA333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFF333333CCCCCCCCCCCC333333FFFFFFFFFFFF333333C0C0C0C0C0C0C0C0
        C0333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333333333333333333333FF
        FFFFFFFFFF333333D7D6D6D6D7D6D7D7D7333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF333333E6E6E6E6E6E6E6E6
        E6333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333FF
        FFFFFFFFFF333333E6E6E6E6E6E6E6E6E6333333F0FBFFF0FBFFF0FBFFF0FBFF
        F0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF3333333333333333333333
        33333333333333333333333333333333333333333333333333333333333333FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Visible = False
    end
    object Image_Book: TImage
      Left = 788
      Top = 1
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D61703E020000424D3E0200000000000036000000280000000D00
        00000D000000010018000000000008020000C40E0000C40E0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FF
        FFFF000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFF000000808080C0C0C0FFFFFF000000000000FFFFFF00FFFFFFFFFFFF
        000000FFFFFFFFFFFFC0C0C0000000000000808080C0C0C0FFFFFFC0C0C00000
        0000FFFFFF000000FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000000000
        808080FFFFFF80808000000000FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF00000000000080808000000000FFFFFFC0C0C0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000C0C0C0
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFF00FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00FFFFFFFFFFFF000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00}
    end
    object Image_M_Book: TImage
      Left = 804
      Top = 0
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D61703E020000424D3E0200000000000036000000280000000D00
        00000D000000010018000000000008020000C40E0000C40E0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FF
        FFFF000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFF000000808080C0C0C0FFFFFF000000000000FFFFFF00FFFFFFFFFFFF
        000000FFFFFFFFFFFFC0C0C0000000000000808080C0C0C0FFFFFFC0C0C00000
        0000FFFFFF000000FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000000000
        808080FFFFFF80808000000000FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF00000000000080808000000000FFFFFFC0C0C0FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000C0C0C0
        FFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF0000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFF00FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00FFFFFFFFFFFF000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00}
    end
    object Image_M_Paper: TImage
      Left = 819
      Top = 0
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D61703E020000424D3E0200000000000036000000280000000D00
        00000D000000010018000000000008020000C40E0000C40E0000000000000000
        0000FFFFFFFFFFFF000000000000000000000000000000000000000000000000
        000000FFFFFFFFFFFF00FFFFFF7B7B7BC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7B
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFF
        FF00FFFFFF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFF0000
        00000000000000000000000000FFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7B
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFF
        FF00FFFFFF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFFFF00FFFFFF848484
        848484848484848484848484848484848484848484848484848484FFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00}
    end
    object Image_P_Book: TImage
      Left = 835
      Top = 0
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D61703E020000424D3E0200000000000036000000280000000D00
        00000D000000010018000000000008020000C40E0000C40E0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FF
        FFFF000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFF000000808080C0C0C0FFFFFF000000000000FFFFFF00FFFFFFFFFFFF
        000000FFFFFFFFFFFFC0C0C0000000000000808080C0C0C0FFFFFFC0C0C00000
        0000FFFFFF000000FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000000000
        808080FFFFFF80808000000000FFFFFFFFFFFFC0C0C0FFFFFFFFFFFF000000FF
        FFFFFFFFFFFFFFFF00000000000080808000000000FFFFFFC0C0C0FFFFFFFFFF
        FFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000C0C0C0
        FFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF0000
        0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFF00FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00FFFFFFFFFFFF000000000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00}
    end
    object Image_P_Paper: TImage
      Left = 850
      Top = 0
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D61703E020000424D3E0200000000000036000000280000000D00
        00000D000000010018000000000008020000C40E0000C40E0000000000000000
        0000FFFFFFFFFFFF000000000000000000000000000000000000000000000000
        000000FFFFFFFFFFFF00FFFFFF7B7B7BC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7B
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFF
        FF00FFFFFF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
        C0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFFFFFFFFFFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFF0000
        00000000000000000000000000FFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7B
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFC0C0C0000000FFFF
        FF00FFFFFF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
        C0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFFFF00FFFFFF848484
        848484848484848484848484848484848484848484848484848484FFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00}
    end
    object Image_Paper: TImage
      Left = 866
      Top = 0
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D61703E020000424D3E0200000000000036000000280000000D00
        00000D000000010018000000000008020000C40E0000C40E0000000000000000
        0000FFFFFFFFFFFF000000000000000000000000000000000000000000000000
        000000FFFFFFFFFFFF00FFFFFF7B7B7BC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7B
        FFFFFF808080808080808080808080808080808080FFFFFFC0C0C0000000FFFF
        FF00FFFFFF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFF80808080808080808080808080
        8080808080FFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7B
        FFFFFF808080808080808080808080808080808080FFFFFFC0C0C0000000FFFF
        FF00FFFFFF7B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFF80808080808080808080808080
        8080808080FFFFFFC0C0C0000000FFFFFF00FFFFFF7B7B7BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000FFFFFF00FFFFFF848484
        848484848484848484848484848484848484848484848484848484FFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00}
    end
    object B_Order_: TMSpeedButton
      Left = 561
      Top = 2
      Width = 120
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Caption = #20986#21147#38918#24207#30331#37682'(&O)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      Glyph.Data = {
        CE070000424DCE07000000000000360000002800000024000000120000000100
        1800000000009807000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000006666666666666666666666666666666666666666666666
        66666666666666666666666666666666666666666666666666000000000000C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666DCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDD666666000000000000C0C0C0F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1C0C0C00000000000
        00666666DEDFDE874D28874D28874E28874E28874D28874E28FFFFFFFFFFFF55
        8E12DEDFDEDEDFDEDEDFDEDFDFDF666666000000000000C0C0C0F2F2F2B5B5B5
        B5B5B5B6B6B6B6B6B6B5B5B5B6B6B6FFFFFFFFFFFFCFCFCFF2F2F2F2F2F2F2F2
        F2F2F2F2C0C0C0000000000000666666E1E1E0824A26FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF4E840D4D840E4E850EE1E1E0E1E1E0E1E0E1666666000000
        000000C0C0C0F3F3F3B4B4B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCB
        CBCBCBCBCBCBCBF3F3F3F3F3F3F2F2F2C0C0C0000000000000666666E3E3E37B
        4724FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF457908457908FFFFFF457908457908
        FFFFFFE3E3E3666666000000000000C0C0C0F3F3F3B3B3B3FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFC8C8C8C8C8C8FFFFFFC8C8C8C8C8C8FFFFFFF3F3F3C0C0C000
        0000000000666666E5E6E6744222FFFFFF744322734322744223FFFFFF3E6F03
        FFFFFFFFFFFFFFFFFF3E6F033E6F03E6E6E6666666000000000000C0C0C0F5F5
        F5B1B1B1FFFFFFB1B1B1B1B1B1B1B1B1FFFFFFC8C8C8FFFFFFFFFFFFFFFFFFC8
        C8C8C8C8C8F5F5F5C0C0C0000000000000666666E8E8E96D3F20FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D3F20D9D9D9FFFFFF3E6F03E9E8E86666
        66000000000000C0C0C0F6F6F6B0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFB0B0B0EFEFEFFFFFFFC8C8C8F6F6F6C0C0C0000000000000666666
        EBEBEB673C1EFFFFFF673B1E663B1E673B1E663B1F673B1EFFFFFF673B1E7443
        22D9D9D9FFFFFFEBEBEB666666000000000000C0C0C0F7F7F7AEAEAEFFFFFFAE
        AEAEAEAEAEAEAEAEAEAEAEAEAEAEFFFFFFAEAEAEB1B1B1EFEFEFFFFFFFF7F7F7
        C0C0C0000000000000666666EDEDED5F371CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF5F371CD9D9D9D9D9D96D3F20EEEDEE666666000000000000C0
        C0C0F8F8F8ACACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACAC
        EFEFEFEFEFEFB0B0B0F8F8F8C0C0C0000000000000666666F0F0F058331AFFFF
        FF58331A58331AFFFFFF58331AFFFFFFFFFFFF58331A673B1ED9D9D9673B1EF0
        F0F0666666000000000000C0C0C0F9F9F9ABABABFFFFFFABABABABABABFFFFFF
        ABABABFFFFFFFFFFFFABABABAEAEAEEFEFEFAEAEAEF9F9F9C0C0C00000000000
        00666666F3F3F3522F18FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52
        3019D9D9D9D9D9D95F371CF3F3F3666666000000000000C0C0C0FAFAFAA9A9A9
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9EFEFEFEFEFEFACAC
        ACFAFAFAC0C0C0000000000000666666F6F6F64E2D174E2D174E2D174E2D174E
        2D174E2D174E2D174E2D174E2D17D9D9D9D9D9D958331AF6F6F6666666000000
        000000C0C0C0FBFBFBA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8EFEFEFEFEFEFABABABFBFBFBC0C0C0000000000000666666F9F8F8F9
        F8F8F9F8F8F9F8F8522F18D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9D9
        523019F9F9F8666666000000000000C0C0C0FCFCFCFCFCFCFCFCFCFCFCFCA9A9
        A9EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFA9A9A9FDFDFDC0C0C000
        0000000000666666FCFCFBFCFCFBFCFCFBFCFCFB4E2D174E2D174E2D174E2D17
        4E2D174E2D174E2D174E2D174E2D17FBFBFB666666000000000000C0C0C0FEFE
        FEFEFEFEFEFEFEFEFEFEA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8FDFDFDC0C0C0000000000000666666FEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE6666
        66000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000000000666666
        6666666666666666666666666666666666666666666666666666666666666666
        66666666666666666666666666000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C00000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000}
      NumGlyphs = 2
      ParentFont = False
      OnClick = B_Order_Click
    end
    object ToolBar: TMToolBar
      Left = 517
      Top = 1
      Width = 44
      Height = 22
      Align = alNone
      Caption = 'ToolBar'
      DisabledImages = imgFusenD
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = FusenImageList
      TabOrder = 0
      Transparent = True
      SysBaseColorB = 10841658
      SysBaseColorD = 6956042
      object ToolButton_: TToolButton
        Left = 0
        Top = 0
        Caption = 'FusenClick'
        DropdownMenu = TBPopup
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = ToolButton_Click
      end
    end
  end
  object MemZitsu: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = MemZitsuBeforePost
    Left = 1
    Top = 51
    object MemZitsuFusen: TGraphicField
      Alignment = taRightJustify
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object MemZitsuCode: TIntegerField
      FieldName = 'Code'
    end
    object MemZitsuRen: TStringField
      DisplayWidth = 10
      FieldName = 'Ren'
      Size = 10
    end
    object MemZitsuLongName: TStringField
      DisplayWidth = 24
      FieldName = 'LongName'
      Size = 24
    end
    object MemZitsuSName: TStringField
      FieldName = 'SName'
      Size = 14
    end
    object MemZitsuSeikakuData: TSmallintField
      FieldName = 'SeikakuData'
    end
    object MemZitsuSeikakuNO: TIntegerField
      DisplayWidth = 2
      FieldKind = fkLookup
      FieldName = 'SeikakuNO'
      LookupDataSet = MemSeikaku
      LookupKeyFields = 'S_Code'
      LookupResultField = 'S_Code'
      KeyFields = 'SeikakuData'
      DisplayFormat = '#0'
      Lookup = True
    end
    object MemZitsuSeikaku: TStringField
      FieldKind = fkLookup
      FieldName = 'Seikaku'
      LookupDataSet = MemSeikaku
      LookupKeyFields = 'S_Code'
      LookupResultField = 'S_Name'
      KeyFields = 'SeikakuData'
      Lookup = True
    end
    object MemZitsuBunsekiNO: TIntegerField
      FieldName = 'BunsekiNO'
    end
    object MemZitsuBunseki: TStringField
      FieldName = 'Bunseki'
    end
    object MemZitsuFusenInfo: TIntegerField
      FieldName = 'FusenInfo'
    end
    object MemZitsuNCode: TFloatField
      FieldName = 'NCode'
    end
    object MemZitsuCNCode: TFloatField
      FieldName = 'CNCode'
    end
  end
  object DSourceZitsu: TDataSource
    DataSet = MemZitsu
    OnStateChange = DSourceZitsuStateChange
    Left = 29
    Top = 51
  end
  object MemSai: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = MemSaiBeforePost
    AfterPost = MemSaiAfterPost
    Left = 1
    Top = 96
    object MemSaiSCode: TStringField
      FieldName = 'SCode'
      Size = 16
    end
    object MemSaiSRen: TStringField
      DisplayWidth = 10
      FieldName = 'SRen'
      Size = 10
    end
    object MemSaiSLongName: TStringField
      DisplayWidth = 30
      FieldName = 'SLongName'
      Size = 30
    end
    object MemSaiSSName: TStringField
      DisplayWidth = 14
      FieldName = 'SSName'
      Size = 14
    end
    object MemSaiSFusen: TGraphicField
      FieldName = 'SFusen'
      BlobType = ftGraphic
    end
    object MemSaiSFusenInfo: TIntegerField
      FieldName = 'SFusenInfo'
    end
    object MemSaiNCode: TFloatField
      FieldName = 'NCode'
    end
    object MemSaiCNCode: TFloatField
      FieldName = 'CNCode'
    end
  end
  object DSourceSai: TDataSource
    DataSet = MemSai
    OnStateChange = DSourceSaiStateChange
    Left = 29
    Top = 92
  end
  object MemGou: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = MemGouBeforePost
    Left = 1
    Top = 133
    object MemGouGFusen: TGraphicField
      FieldName = 'GFusen'
      BlobType = ftGraphic
    end
    object MemGouGCode: TIntegerField
      FieldName = 'GCode'
    end
    object MemGouGRen: TStringField
      DisplayWidth = 10
      FieldName = 'GRen'
      Size = 10
    end
    object MemGouGLongName: TStringField
      DisplayWidth = 24
      FieldName = 'GLongName'
      Size = 24
    end
    object MemGouGSName: TStringField
      DisplayWidth = 14
      FieldName = 'GSName'
      Size = 14
    end
    object MemGouGFusenInfo: TIntegerField
      FieldName = 'GFusenInfo'
    end
    object MemGouSousyokuData: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'SousyokuData'
    end
    object MemGouSousyokuCode: TIntegerField
      FieldKind = fkLookup
      FieldName = 'SousyokuCode'
      LookupDataSet = MemSousyoku
      LookupKeyFields = 'SousyokuNo'
      LookupResultField = 'SousyokuNo'
      KeyFields = 'SousyokuData'
      DisplayFormat = '#0'
      Lookup = True
    end
    object MemGouSousyoku: TStringField
      FieldKind = fkLookup
      FieldName = 'Sousyoku'
      LookupDataSet = MemSousyoku
      LookupKeyFields = 'SousyokuNo'
      LookupResultField = 'Sousyoku'
      KeyFields = 'SousyokuData'
      Lookup = True
    end
    object MemGouNCode: TFloatField
      FieldName = 'NCode'
    end
    object MemGouCNCode: TFloatField
      FieldName = 'CNCode'
    end
  end
  object DSourceGou: TDataSource
    DataSet = MemGou
    OnStateChange = DSourceGouStateChange
    Left = 29
    Top = 133
  end
  object ImageList: TImageList
    Left = 152
    Top = 51
    Bitmap = {
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59C
      D600636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59C
      D600636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59C
      D600636363004242420000000000000000000000000000000000636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000636363006363
      630063636300A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59C
      D600636363004242420000000000000000000000000000000000000000006363
      6300000000006363630063636300000000000000000000000000636363000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300ADA5DE006363630063636300ADA5DE00ADA5DE00ADA5DE0063636300ADA5
      DE00636363004242420000000000000000000000000000000000000000006363
      6300000000000000000063636300000000000000000063636300636363000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300ADA5DE00ADA5DE006363630000000000000000006363630063636300ADA5
      DE00636363004242420000000000000000000000000000000000000000006363
      63000000000000000000000000008C5229008C52290000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300B5ADDE00B5ADDE00B5ADDE008C5229008C522900B5ADDE00B5ADDE00B5AD
      DE00636363004242420000000000000000000000000000000000636363006363
      63006363630000000000000000008C5229008C52290000000000000000000000
      0000636363004242420000000000000000000000000000000000636363006363
      630063636300B5ADDE00000000008C5229008C52290000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      63000000000063636300000000008C5229008C5229008C5229008C5229000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300B5B5E70063636300B5B5E7008C5229008C5229008C5229008C522900B5B5
      E700636363004242420000000000000000000000000000000000000000006363
      63000000000000000000636363008C5229008C5229008C5229008C5229000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300B5B5E700B5B5E700636363008C5229008C5229008C5229008C5229000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000008C522900F7C67B00F7C67B008C52
      2900000000004242420000000000000000000000000000000000000000006363
      6300BDB5E700BDB5E700BDB5E700BDB5E7008C522900F7C67B00F7C67B008C52
      2900BDB5E7004242420000000000000000000000000000000000636363006363
      6300636363000000000000000000000000008C522900F7C67B00F7C67B008C52
      2900000000004242420000000000000000000000000000000000636363006363
      630063636300BDB5E700BDB5E700000000008C522900F7C67B00F7C67B008C52
      2900000000004242420000000000000000000000000000000000000000006363
      6300000000000000000063636300000000008C522900F7C67B00F7C67B00F7C6
      7B008C5229000000000000000000000000000000000000000000000000006363
      6300C6BDEF00C6BDEF0063636300C6BDEF008C522900F7C67B00F7C67B00F7C6
      7B008C5229000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000636363008C522900F7C67B00F7C67B00F7C6
      7B008C5229000000000000000000000000000000000000000000000000006363
      6300C6BDEF00C6BDEF00C6BDEF00636363008C522900F7C67B00F7C67B00F7C6
      7B008C5229000000000000000000000000000000000000000000000000006363
      630000000000000000000000000000000000000000008C522900F7C67B00F7C6
      7B00F7C67B008C52290000000000000000000000000000000000000000006363
      6300C6C6EF00C6C6EF00C6C6EF00C6C6EF00C6C6EF008C522900F7C67B00F7C6
      7B00F7C67B008C52290000000000000000000000000000000000636363006363
      630063636300000000000000000000000000000000008C522900F7C67B00F7C6
      7B00F7C67B008C52290000000000000000000000000000000000636363006363
      630063636300C6C6EF00C6C6EF00C6C6EF00000000008C522900F7C67B00F7C6
      7B00F7C67B008C52290000000000000000000000000000000000000000006363
      63000000000063636300636363006363630063636300000000008C522900F7C6
      7B00F7C67B00F7C67B008C522900000000000000000000000000000000006363
      6300CECEF70063636300636363006363630063636300CECEF7008C522900F7C6
      7B00F7C67B00F7C67B008C522900000000000000000000000000000000006363
      63000000000000000000636363006363630063636300000000008C522900F7C6
      7B00F7C67B00F7C67B008C522900000000000000000000000000000000006363
      6300CECEF700CECEF700636363006363630063636300000000008C522900F7C6
      7B00F7C67B00F7C67B008C522900000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000008C52
      2900F7C67B008C52290000000000000000000000000000000000000000006363
      6300D6D6F700D6D6F700D6D6F700D6D6F700D6D6F700D6D6F700D6D6F7008C52
      2900F7C67B008C52290000000000000000000000000000000000636363006363
      6300636363000000000000000000000000000000000000000000000000008C52
      2900F7C67B008C52290000000000000000000000000000000000636363006363
      630063636300D6D6F700D6D6F700D6D6F700D6D6F700D6D6F700000000008C52
      2900F7C67B008C52290000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      00008C5229000000000000000000000000000000000000000000000000006363
      6300D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6
      FF008C5229000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      00008C5229000000000000000000000000000000000000000000000000006363
      6300D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF000000
      00008C5229000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300000000000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300000000000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300000000000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000000000000000000042424200424242004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000424242004242
      4200424242004242420063636300636363006363630042424200424242004242
      4200424242004242420042424200000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      630063636300424242000000000000000000000000000000000063636300C6C6
      F70063636300C6C6F700C6C6F700C6C6F700C6C6F700C6C6F700C6C6F700C6C6
      F700636363004242420000000000000000000000000063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630042424200000000000000000000000000000000006363
      6300A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59C
      D600636363004242420000000000000000000000000000000000000000006363
      6300A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59C
      D60063636300424242000000000000000000000000000000000063636300BDBD
      EF0063636300BDBDEF00BDBDEF00BDBDEF00BDBDEF00BDBDEF00BDBDEF00BDBD
      EF00636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59C
      D600636363004242420000000000000000000000000000000000636363006363
      630063636300A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59C
      D60063636300424242000000000000000000000000000000000063636300B5B5
      E70063636300B5B5E700B5ADE700B5B5E700B5B5E700B5ADE700B5B5E700B5B5
      E700636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000000000000000006363
      6300ADA5DE0063636300636363006363630063636300ADA5DE0063636300ADA5
      DE00636363004242420000000000000000000000000000000000000000006363
      6300ADA5DE00ADA5DE00636363006363630063636300ADA5DE0063636300ADA5
      DE0063636300424242000000000000000000000000000000000063636300ADA5
      DE0063636300ADA5DE00ADA5DE00ADA5DE00ADA5DE00ADA5DE00ADA5DE00ADA5
      DE00636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300B5ADDE00B5ADDE00B5ADDE00B5ADDE00B5ADDE00B5ADDE00B5ADDE00B5AD
      DE00636363004242420000000000000000000000000000000000636363006363
      630063636300B5ADDE00B5ADDE00B5ADDE00B5ADDE00B5ADDE00B5ADDE00B5AD
      DE0063636300424242000000000000000000000000000000000063636300A59C
      D60063636300A59CD600A59CD600A59CD600A59CD600A59CD600A59CD600A59C
      D600636363004242420000000000000000000000000063636300000000000000
      0000424242004242420000000000636363000000000042424200000000004242
      4200000000006363630042424200000000000000000000000000000000006363
      6300B5B5E700636363006363630063636300636363006363630063636300B5B5
      E700636363004242420000000000000000000000000000000000000000006363
      6300B5B5E700B5B5E7006363630063636300636363006363630063636300B5B5
      E700636363004242420000000000000000000000000000000000636363009C94
      CE0063636300948CCE00948CCE00948CCE00948CCE00948CCE009C8CCE00948C
      CE00636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300BDB5E700BDB5E700BDB5E700BDB5E700BDB5E700BDB5E700BDB5E700BDB5
      E700636363004242420000000000000000000000000000000000636363006363
      630063636300BDB5E700BDB5E700BDB5E700BDB5E700BDB5E700BDB5E700BDB5
      E700636363004242420000000000000000000000000000000000636363008C84
      C600636363008C84C60063636300636363006363630063636300636363008C84
      C600636363004242420000000000000000000000000063636300000000004242
      4200000000004242420000000000636363000000000042424200424242000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300C6BDEF00C6BDEF006363630063636300C6BDEF006363630063636300C6BD
      EF00636363004242420000000000000000000000000000000000000000006363
      6300C6BDEF00C6BDEF00C6BDEF0063636300C6BDEF006363630063636300C6BD
      EF0063636300424242000000000000000000000000000000000063636300847B
      BD0063636300847BBD004242420042424200424242004242420042424200847B
      BD00636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300C6C6EF00C6C6EF00C6C6EF00C6C6EF00C6C6EF00C6C6EF00C6C6EF00C6C6
      EF00636363004242420000000000000000000000000000000000636363006363
      630063636300C6C6EF00C6C6EF00C6C6EF00C6C6EF00C6C6EF00C6C6EF00C6C6
      EF00636363004242420000000000000000000000000000000000636363008473
      BD00636363008473BD008473BD008473BD008473BD008473BD008473BD008473
      BD00636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000000000000000006363
      6300CECEF700636363006363630063636300636363006363630063636300CECE
      F700636363004242420000000000000000000000000000000000000000006363
      6300CECEF700CECEF7006363630063636300636363006363630063636300CECE
      F700636363004242420000000000000000000000000000000000636363000000
      0000636363000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000063636300636363006363630000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300D6D6F700D6D6F700D6D6F700D6D6F700D6D6F700D6D6F700D6D6F700D6D6
      F700636363004242420000000000000000000000000000000000636363006363
      630063636300D6D6F700D6D6F700D6D6F700D6D6F700D6D6F700D6D6F700D6D6
      F700636363004242420000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000000000000000000006363
      6300D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6
      FF00636363004242420000000000000000000000000000000000000000006363
      6300D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6FF00D6D6
      FF00636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000000000000000000042424200424242004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000424242004242
      4200424242004242420063636300636363006363630042424200424242004242
      4200424242004242420042424200000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      630063636300424242000000000000000000000000000000000063636300EFDE
      C60063636300EFDEC600EFDECE00EFDECE00EFDEC600EFE7CE00EFDECE00EFDE
      CE00636363004242420000000000000000000000000063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      000063636300424242000000000000000000000000000000000063636300EFDE
      C60063636300EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDE
      C600636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      000063636300424242000000000000000000000000000000000063636300E7D6
      BD0063636300E7D6BD00E7D6BD00E7D6BD00E7D6BD00E7D6BD00E7D6BD00E7D6
      BD00636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000000000000000006363
      6300000000006363630063636300636363006363630000000000636363000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000063636300636363006363630000000000636363000000
      000063636300424242000000000000000000000000000000000063636300E7CE
      B50063636300E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500E7CE
      B500636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      000063636300424242000000000000000000000000000000000063636300DECE
      AD0063636300DECEAD00DECEAD00DECEAD00DECEAD00DECEAD00DECEAD00DECE
      AD00636363004242420000000000000000000000000063636300000000000000
      0000424242004242420000000000636363000000000042424200000000004242
      4200000000006363630042424200000000000000000000000000000000006363
      6300000000006363630063636300636363006363630063636300636363000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000063636300636363006363630063636300636363000000
      000063636300424242000000000000000000000000000000000063636300DEC6
      A50063636300DEC6A500DEC6A500DEC6A500DEC6A500DEC6A500DEC6A500DEC6
      A500636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      000063636300424242000000000000000000000000000000000063636300D6BD
      9C0063636300D6BD9C006363630063636300636363006363630063636300D6BD
      9C00636363004242420000000000000000000000000063636300000000004242
      4200000000004242420000000000636363000000000042424200424242000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000063636300636363000000000063636300636363000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000636363000000000063636300636363000000
      000063636300424242000000000000000000000000000000000063636300D6B5
      940063636300D6BD94004242420042424200424242004242420042424200D6B5
      9400636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      000063636300424242000000000000000000000000000000000063636300D6B5
      8C0063636300D6B58C00D6B58C00D6B58C00D6B58C00D6B58C00D6B58C00D6B5
      8C00636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000000000000000006363
      6300000000006363630063636300636363006363630063636300636363000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000063636300636363006363630063636300636363000000
      0000636363004242420000000000000000000000000000000000636363000000
      0000636363000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000063636300636363006363630000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFF003F003F003F003
      E003E003E003E003EFF3E003EFF3E003EFF3E003C7F3C003E9D3E003ED93E183
      EE73E003C673C273EA13E003EC13E013EF0BE003C70BC10BED07E007EE07E007
      EF83E003C783C083E841E001EC41E041EFE3E003C7E3C023EFF7E007EFF7E017
      E00FE00FE00FE00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE003FC7FF003F003
      C003C001E003E003C0038001E003E003C003BEF9E003C003C003A289E003E003
      C003BEF9E003C003C003B2A9E003E003C003BEF9E003C003C003AA99E003E003
      C003BEF9E003C003C003A289E003E003D7F3BC79E003C003C0078383E003E003
      FFFFFFFFE007E007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE003FC7FF003F003
      C003C001E003E003C0038001EFF3EFF3C003BEF9EFF3C7F3C003A289E853EC53
      C003BEF9EFF3C7F3C003B2A9E813EC13C003BEF9EFF3C7F3C003AA99EC93EE93
      C003BEF9EFF3C7F3C003A289E813EC13D7F3BC79EFF3C7F3C0078383EFF3EFF3
      FFFFFFFFE007E007FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object MemSeikaku: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 180
    Top = 135
    object MemSeikakuS_Code: TIntegerField
      DisplayWidth = 2
      FieldName = 'S_Code'
    end
    object MemSeikakuS_Name: TStringField
      DisplayWidth = 50
      FieldName = 'S_Name'
    end
  end
  object MemSousyoku: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 152
    Top = 135
    object MemSousyokuSousyokuNo: TIntegerField
      DisplayWidth = 2
      FieldName = 'SousyokuNo'
    end
    object MemSousyokuSousyoku: TStringField
      DisplayWidth = 12
      FieldName = 'Sousyoku'
    end
  end
  object FusenImageList: TImageList
    Left = 151
    Top = 93
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100848484008484
      84008484840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      310031313100000000000000000000000000000000003131310031219C003121
      9C0031219C0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100C68C4A00C68C
      4A00C68C4A0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100426B1800426B
      1800426B180031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100318CFF00318C
      FF00318CFF0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE0031313100000000000000000000000000313131005A4AB5005A4A
      B5005A4AB50031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100CEA56B00CEA5
      6B00D6A56B0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100638C4200638C
      4200638C420031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE00313131000000000000000000313131005AADFF005AAD
      FF005AADFF0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE00313131000000000000000000313131007363CE00736B
      CE007363CE0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100D6B57B00D6B5
      7B00D6B57B0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100739C5A00739C
      5A00739C5A0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      31003131310031313100313131000000000000000000313131007BBDFF007BBD
      FF007BBDFF0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      31003131310031313100313131000000000000000000313131008484DE008484
      DE008484DE0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100DEBD9400DEBD
      9400DEBD940031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003131310000000000000000003131310084B5730084AD
      730084AD730031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003131310000000000000000003131310094CEFF0094CE
      FF0094CEFF0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00313131000000000000000000313131009C9CEF009C9C
      EF009C9CEF0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7CEA500E7CE
      A500E7CEA50031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003131310000000000000000003131310094BD840094BD
      840094BD840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100ADD6F700ADD6
      F700ADD6F70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100ADADF700ADAD
      F700ADADF70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100EFD6AD00EFD6
      AD00EFD6AD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100A5CE9400A5CE
      9400A5CE940031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100ADD6F700ADD6
      F700ADD6F70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000080070000000000008003000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      80010000000000008001000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80078007800780078003800380038003
      8001800180018001800180018001800180018001800180018001800180018001
      80018001800180018001800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object TBPopup: TPopupMenu
    Images = FusenImageList
    Left = 179
    Top = 93
    object FAka_ToolBtn: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333362099352099352199333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        5A4BB65A4BB6594CB6333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E63333337167C87168C87167C8333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        8681DB8781DA8781DA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E63333339B99EA9A99EA9A98EA333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        A8A9F5A8A9F5A8A9F5333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #36196'(&R)'
      GroupIndex = 1
      ImageIndex = 0
      OnClick = F_ToolBtnClick
    end
    object FAo_ToolBtn: TMenuItem
      Tag = 1
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333C38F4BC38E4BC38E4B333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        CFA469CFA469D0A469333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E6333333D7B27ED6B27ED7B27E333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        DEBE90DDBE90DDBE90333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E6333333E4CAA1E4CAA1E4CAA1333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        E8D2ACE8D2ACE8D2AC333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #38738'(&B)'
      GroupIndex = 1
      ImageIndex = 1
      OnClick = F_ToolBtnClick
    end
    object FMido_ToolBtn: TMenuItem
      Tag = 2
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333456E1C466E1C466E1C333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        638B41638B41638B42333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E6333333769D59769E59769E5A333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        87B07087AF7087AF70333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333397BF8497BF8497BF84333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        A2CA92A2CA92A2CA92333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #32209'(&G)'
      GroupIndex = 1
      ImageIndex = 2
      OnClick = F_ToolBtnClick
    end
    object FOre_ToolBtn: TMenuItem
      Tag = 3
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333338EFE328EFD328EFD333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        5FA9FB5EA9FB5EA9FB333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E63333337ABAF97ABAF97ABAFA333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        95CAF895CBF895CAF8333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E6333333A8D6F7A8D6F7A8D6F7333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        A8D6F7A8D6F7A8D6F7333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #27225'(&O)'
      GroupIndex = 1
      ImageIndex = 3
      OnClick = F_ToolBtnClick
    end
  end
  object PopupFusen: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupFusenPopup
    Left = 96
    Top = 51
    object PM_Del: TMenuItem
      Bitmap.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0DCC000F0CA
        A600AA3F2A00FF3F2A00005F2A00555F2A00AA5F2A00FF5F2A00007F2A00557F
        2A00AA7F2A00FF7F2A00009F2A00559F2A00AA9F2A00FF9F2A0000BF2A0055BF
        2A00AABF2A00FFBF2A0000DF2A0055DF2A00AADF2A00FFDF2A0000FF2A0055FF
        2A00AAFF2A00FFFF2A000000550055005500AA005500FF005500001F5500551F
        5500AA1F5500FF1F5500003F5500553F5500AA3F5500FF3F5500005F5500555F
        5500AA5F5500FF5F5500007F5500557F5500AA7F5500FF7F5500009F5500559F
        5500AA9F5500FF9F550000BF550055BF5500AABF5500FFBF550000DF550055DF
        5500AADF5500FFDF550000FF550055FF5500AAFF5500FFFF550000007F005500
        7F00AA007F00FF007F00001F7F00551F7F00AA1F7F00FF1F7F00003F7F00553F
        7F00AA3F7F00FF3F7F00005F7F00555F7F00AA5F7F00FF5F7F00007F7F00557F
        7F00AA7F7F00FF7F7F00009F7F00559F7F00AA9F7F00FF9F7F0000BF7F0055BF
        7F00AABF7F00FFBF7F0000DF7F0055DF7F00AADF7F00FFDF7F0000FF7F0055FF
        7F00AAFF7F00FFFF7F000000AA005500AA00AA00AA00FF00AA00001FAA00551F
        AA00AA1FAA00FF1FAA00003FAA00553FAA00AA3FAA00FF3FAA00005FAA00555F
        AA00AA5FAA00FF5FAA00007FAA00557FAA00AA7FAA00FF7FAA00009FAA00559F
        AA00AA9FAA00FF9FAA0000BFAA0055BFAA00AABFAA00FFBFAA0000DFAA0055DF
        AA00AADFAA00FFDFAA0000FFAA0055FFAA00AAFFAA00FFFFAA000000D4005500
        D400AA00D400FF00D400001FD400551FD400AA1FD400FF1FD400003FD400553F
        D400AA3FD400FF3FD400005FD400555FD400AA5FD400FF5FD400007FD400557F
        D400AA7FD400FF7FD400009FD400559FD400AA9FD400FF9FD40000BFD40055BF
        D400AABFD400FFBFD40000DFD40055DFD400AADFD400FFDFD40000FFD40055FF
        D400AAFFD400FFFFD4005500FF00AA00FF00001FFF00551FFF00AA1FFF00FF1F
        FF00003FFF00553FFF00AA3FFF00FF3FFF00005FFF00555FFF00AA5FFF00FF5F
        FF00007FFF00557FFF00AA7FFF00FF7FFF00009FFF00559FFF00AA9FFF00FF9F
        FF0000BFFF0055BFFF00AABFFF00FFBFFF0000DFFF0055DFFF00AADFFF00FFDF
        FF0055FFFF00AAFFFF00FFCCCC00FFCCFF00FFFF3300FFFF6600FFFF9900FFFF
        CC00007F0000557F0000AA7F0000FF7F0000009F0000559F0000AA9F0000FF9F
        000000BF000055BF0000AABF0000FFBF000000DF000055DF0000AADF0000FFDF
        000055FF0000AAFF000000002A0055002A00AA002A00FF002A00001F2A00551F
        2A00AA1F2A00FF1F2A00003F2A00553F2A00F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF070707070707FFFFFFFFFFFFFFFF0700
        000000000007FFFFFFFFFFFFFFFFF6F6F6F6F6F60007FFFFFFFFFFFFFFFFF6F6
        F6F6F6F60007FFFFFFFFFFFFFFFFF6F6F6F6F6F60007FFFFFFFFFFFFFFFFF6F6
        F6F6F6F60007FFFFFFFFFFFFFFFFF6F6F6F6F6F60007FFFFFFFFFFFFFFFFF6F6
        F6F6F6F60007FFFFFFFFFFFFFFFFF6F6F6F6F6F60007FFFFFFFFFFFFFFFFF6F6
        F6F6F6F60007FFFFFFFFFFFFFFFFCACACACACACA0007FFFFFFFFFFFFFFFFCACA
        CACACACA0007FFFFFFFFFFFFFFFFCACACACACACA0007FFFFFFFFFFFFFFFFCACA
        CACACACA07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = #12399#12364#12377'(&D)'
      Visible = False
      OnClick = PM_Click
    end
    object PM_Revise: TMenuItem
      Caption = #20633#32771#20462#27491
      Visible = False
      OnClick = PM_ReviseClick
    end
    object N1: TMenuItem
      Caption = '-'
      Visible = False
    end
    object PM_FRE: TMenuItem
      Tag = 1
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333362099352099352199333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        5A4BB65A4BB6594CB6333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E63333337167C87168C87167C8333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        8681DB8781DA8781DA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E63333339B99EA9A99EA9A98EA333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        A8A9F5A8A9F5A8A9F5333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #36196'(&R)'
      object Grid_FAka_BN: TMenuItem
        Tag = 1
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = PM_Click
      end
      object Grid_FAka_BA: TMenuItem
        Tag = 1
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = Grid_F_BAClick
      end
    end
    object PM_FBU: TMenuItem
      Tag = 3
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333C38F4BC38E4BC38E4B333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        CFA469CFA469D0A469333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E6333333D7B27ED6B27ED7B27E333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        DEBE90DDBE90DDBE90333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E6333333E4CAA1E4CAA1E4CAA1333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        E8D2ACE8D2ACE8D2AC333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #38738'(&B)'
      object Grid_FAo_BN: TMenuItem
        Tag = 3
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = PM_Click
      end
      object Grid_FAo_BA: TMenuItem
        Tag = 3
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = Grid_F_BAClick
      end
    end
    object PM_FGR: TMenuItem
      Tag = 2
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333456E1C466E1C466E1C333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        638B41638B41638B42333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E6333333769D59769E59769E5A333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        87B07087AF7087AF70333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333397BF8497BF8497BF84333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        A2CA92A2CA92A2CA92333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #32209'(&G)'
      object Grid_FMido_BN: TMenuItem
        Tag = 2
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = PM_Click
      end
      object Grid_FMido_BA: TMenuItem
        Tag = 2
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = Grid_F_BAClick
      end
    end
    object PM_FOR: TMenuItem
      Tag = 4
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333338EFE328EFD328EFD333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        5FA9FB5EA9FB5EA9FB333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E63333337ABAF97ABAF97ABAFA333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        95CAF895CBF895CAF8333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E6333333A8D6F7A8D6F7A8D6F7333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        A8D6F7A8D6F7A8D6F7333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #27225'(&O)'
      object Grid_FOre_BN: TMenuItem
        Tag = 4
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = PM_Click
      end
      object Grid_FOre_BA: TMenuItem
        Tag = 4
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = Grid_F_BAClick
      end
    end
  end
  object PopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnChange = PopupMenuChange
    OnPopup = PopupMenuPopup
    Left = 124
    Top = 51
    object MI_Kasan: TMenuItem
      Caption = #21152#31639
      OnClick = MI_KasanClick
    end
    object MI_Gensan: TMenuItem
      Caption = #28187#31639
      OnClick = MI_GensanClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object MI_Syousai: TMenuItem
      Caption = #35443#32048
      OnClick = MI_SyousaiClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object MI_Copy: TMenuItem
      Caption = #20182#12398#21152#31639#20808#12408#12398#12467#12500#12540
      OnClick = MI_CopyClick
    end
    object MI_Paste: TMenuItem
      Caption = #20182#12398#21152#31639#20808#12363#12425#12398#36028#12426#20184#12369
      Enabled = False
      OnClick = MI_PasteClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object MI_TaikeiDel: TMenuItem
      Caption = #21152#31639#12375#12394#12356
      Enabled = False
      OnClick = MI_TaikeiDelClick
    end
    object MI_Delete: TMenuItem
      Caption = #21066#38500
      OnClick = MI_DeleteClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object TM_F_Delete: TMenuItem
      Caption = #12399#12364#12377'(&D)'
      Visible = False
      OnClick = PM_F_Click
    end
    object TM_F_Revise: TMenuItem
      Caption = #20633#32771#20462#27491
      Visible = False
      OnClick = TM_F_ReviseClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object TM_F_Aka: TMenuItem
      Tag = 1
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333362099352099352199333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        5A4BB65A4BB6594CB6333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E63333337167C87168C87167C8333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        8681DB8781DA8781DA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E63333339B99EA9A99EA9A98EA333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        A8A9F5A8A9F5A8A9F5333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #36196'(&R)'
      ImageIndex = 1
      object FAka_BN: TMenuItem
        Tag = 1
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = PM_F_Click
      end
      object FAka_BA: TMenuItem
        Tag = 1
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = F_BAClick
      end
    end
    object TM_F_Ao: TMenuItem
      Tag = 3
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333C38F4BC38E4BC38E4B333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        CFA469CFA469D0A469333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E6333333D7B27ED6B27ED7B27E333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        DEBE90DDBE90DDBE90333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E6333333E4CAA1E4CAA1E4CAA1333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        E8D2ACE8D2ACE8D2AC333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #38738'(&B)'
      object FAo_BN: TMenuItem
        Tag = 3
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = PM_F_Click
      end
      object FAo_BA: TMenuItem
        Tag = 3
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = F_BAClick
      end
    end
    object TM_F_Mido: TMenuItem
      Tag = 2
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333456E1C466E1C466E1C333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        638B41638B41638B42333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E6333333769D59769E59769E5A333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        87B07087AF7087AF70333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333397BF8497BF8497BF84333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        A2CA92A2CA92A2CA92333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #32209'(&G)'
      object FMido_BN: TMenuItem
        Tag = 2
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = PM_F_Click
      end
      object FMido_BA: TMenuItem
        Tag = 2
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = F_BAClick
      end
    end
    object TM_F_Ore: TMenuItem
      Tag = 4
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6333333
        3333333333333333333333333333333333333333333333333333333333333333
        33E6E6E6E6E6E6E6E6E6E6E6E6333333338EFE328EFD328EFD333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6E6E6E6E6E6333333
        5FA9FB5EA9FB5EA9FB333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCC
        CCCCCCCC333333E6E6E6E6E6E63333337ABAF97ABAF97ABAFA333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6E6E6E6E6E6333333
        95CAF895CBF895CAF8333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E6333333A8D6F7A8D6F7A8D6F7333333FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333
        A8D6F7A8D6F7A8D6F7333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF333333E6E6E6E6E6E633333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
        E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6}
      Caption = #27225'(&O)'
      object FOre_BN: TMenuItem
        Tag = 4
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = PM_F_Click
      end
      object FOre_BA: TMenuItem
        Tag = 4
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = F_BAClick
      end
    end
  end
  object ActionList: TActionList
    Left = 180
    Top = 51
    object FusenClick: TAction
      Category = #20184#31627#12508#12479#12531
      ImageIndex = 0
      OnExecute = ToolButton_Click
    end
    object SyousaiClick: TAction
      Category = #35443#32048#12508#12479#12531
      Caption = #35443#32048'(&T)'
      OnExecute = B_SyousaiClick
    end
    object DeleteClick: TAction
      Category = #21066#38500#12508#12479#12531
      Caption = #21066#38500'(&D)'
      OnExecute = B_Delete_Click
    end
    object KmkCopyClick: TAction
      Category = #12467#12500#12540#12508#12479#12531
      Caption = #31185#30446#65402#65419#65439#65392'(&R)'
      OnExecute = B_KmkCopy_Click
    end
    object SearchClick: TAction
      Category = #26908#32034#12508#12479#12531
      Caption = #26908#32034'(&Q)'
      OnExecute = B_Search_Click
    end
    object PrintClick: TAction
      Category = #21360#21047#12508#12479#12531
      Caption = #21360#21047'(&P)'
      OnExecute = B_PrintClick
    end
  end
  object imgFusenD: TImageList
    Left = 123
    Top = 93
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100848484008484
      84008484840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131000000000000000000000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131000000000000000000000000000000000031313100848484008484
      84008484840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100848484008484
      84008484840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100848484008484
      84008484840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100848484008484
      84008484840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100000000000000000031313100313131003131
      3100313131003131310031313100313131003131310031313100313131003131
      3100313131003131310031313100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000080070000000000008003000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      80010000000000008001000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80078007800780078003800380038003
      8001800180018001800180018001800180018001800180018001800180018001
      80018001800180018001800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object MemPrint: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 85
    Top = 176
    object MemPrintFusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object MemPrintCode: TIntegerField
      FieldName = 'Code'
    end
    object MemPrintSeishikiName: TStringField
      DisplayWidth = 24
      FieldName = 'SeishikiName'
      Size = 24
    end
    object MemPrintKanryakuName: TStringField
      DisplayWidth = 14
      FieldName = 'KanryakuName'
      Size = 14
    end
    object MemPrintRensou: TStringField
      DisplayWidth = 10
      FieldName = 'Rensou'
      Size = 10
    end
    object MemPrintMainaKamoku: TStringField
      FieldName = 'MainaKamoku'
      Size = 24
    end
    object MemPrintBunseki: TIntegerField
      FieldName = 'Bunseki'
    end
    object MemPrintYouYakuCode: TSmallintField
      FieldName = 'YouYakuCode'
    end
    object MemPrintSeikaku: TIntegerField
      FieldName = 'Seikaku'
    end
    object MemPrintKisyuName: TStringField
      FieldName = 'KisyuName'
    end
    object MemPrintSeizanName: TStringField
      FieldName = 'SeizanName'
    end
    object MemPrintBsPlName: TStringField
      FieldName = 'BsPlName'
    end
    object MemPrintKariKuri: TSmallintField
      FieldName = 'KariKuri'
    end
    object MemPrintKashiKuri: TSmallintField
      FieldName = 'KashiKuri'
    end
    object MemPrintSousyokuName: TStringField
      FieldName = 'SousyokuName'
    end
    object MemPrintDspPriName: TStringField
      FieldName = 'DspPriName'
    end
    object MemPrintSaimoku: TSmallintField
      FieldName = 'Saimoku'
    end
    object MemPrintHojo1: TSmallintField
      FieldName = 'Hojo1'
    end
    object MemPrintHojo2: TSmallintField
      FieldName = 'Hojo2'
    end
    object MemPrintBumon: TSmallintField
      FieldName = 'Bumon'
    end
    object MemPrintSeg: TSmallintField
      FieldName = 'Seg'
    end
    object MemPrintHiritsuName: TStringField
      FieldName = 'HiritsuName'
    end
    object MemPrintHendouhi: TFloatField
      DisplayWidth = 6
      FieldName = 'Hendouhi'
      Precision = 2
    end
    object MemPrintKobetsu: TFloatField
      DisplayWidth = 6
      FieldName = 'Kobetsu'
      Precision = 2
    end
    object MemPrintSagakuName: TStringField
      FieldName = 'SagakuName'
    end
    object MemPrintRiekiName: TStringField
      FieldName = 'RiekiName'
    end
    object MemPrintMainasuPriName: TStringField
      FieldName = 'MainasuPriName'
      Size = 24
    end
    object MemPrintKihyouPri: TStringField
      FieldName = 'KihyouPri'
    end
    object MemPrintAveName: TStringField
      FieldName = 'AveName'
    end
    object MemPrintRuikeiName: TStringField
      FieldName = 'RuikeiName'
    end
    object MemPrintShiwakeName: TStringField
      FieldName = 'ShiwakeName'
    end
    object MemPrintKijitsuName: TStringField
      FieldName = 'KijitsuName'
    end
    object MemPrintKijitsuHisu: TStringField
      FieldName = 'KijitsuHisu'
    end
    object MemPrintTegataNoName: TStringField
      FieldName = 'TegataNoName'
    end
    object MemPrintTegataHisu: TStringField
      FieldName = 'TegataHisu'
    end
    object MemPrintKoteiTekiName: TStringField
      FieldName = 'KoteiTekiName'
    end
    object MemPrintTekiyouBun: TIntegerField
      FieldName = 'TekiyouBun'
    end
    object MemPrintSyousu: TSmallintField
      FieldName = 'Syousu'
    end
    object MemPrintShikuriYuName: TStringField
      FieldName = 'ShikuriYuName'
    end
    object MemPrintRirekiName: TStringField
      FieldName = 'RirekiName'
    end
    object MemPrintDenHojo1Name: TStringField
      FieldName = 'DenHojo1Name'
    end
    object MemPrintDenHojo2Name: TStringField
      FieldName = 'DenHojo2Name'
    end
    object MemPrintStartDate: TDateField
      FieldName = 'StartDate'
    end
    object MemPrintEndDate: TDateField
      FieldName = 'EndDate'
    end
    object MemPrintLastUpDate: TDateTimeField
      FieldName = 'LastUpDate'
    end
    object MemPrintYouyaku: TSmallintField
      FieldName = 'Youyaku'
    end
    object MemPrintKotei: TSmallintField
      FieldName = 'Kotei'
    end
    object MemPrintHendo: TSmallintField
      FieldName = 'Hendo'
    end
    object MemPrintAddUnit: TStringField
      FieldName = 'AddUnit'
    end
    object MemPrintBun1Nm: TStringField
      FieldName = 'Bun1Nm'
      Size = 14
    end
    object MemPrintBun2Nm: TStringField
      FieldName = 'Bun2Nm'
      Size = 14
    end
    object MemPrintBun3Nm: TStringField
      FieldName = 'Bun3Nm'
      Size = 14
    end
    object MemPrintBun4Nm: TStringField
      FieldName = 'Bun4Nm'
      Size = 14
    end
    object MemPrintBun5Nm: TStringField
      FieldName = 'Bun5Nm'
      Size = 14
    end
  end
  object MemPrint_Saimoku: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 85
    Top = 218
    object MemPrint_SaimokuS_Fusen: TGraphicField
      FieldName = 'S_Fusen'
      BlobType = ftGraphic
    end
    object MemPrint_SaimokuS_KCode: TIntegerField
      FieldName = 'S_KCode'
    end
    object MemPrint_SaimokuS_KName: TStringField
      DisplayWidth = 24
      FieldName = 'S_KName'
      Size = 24
    end
    object MemPrint_SaimokuS_SCode: TStringField
      DisplayWidth = 10
      FieldName = 'S_SCode'
      Size = 10
    end
    object MemPrint_SaimokuS_SeisikiName: TStringField
      DisplayWidth = 30
      FieldName = 'S_SeisikiName'
      Size = 30
    end
    object MemPrint_SaimokuS_KanryakuName: TStringField
      DisplayWidth = 14
      FieldName = 'S_KanryakuName'
      Size = 14
    end
    object MemPrint_SaimokuS_Renso: TStringField
      DisplayWidth = 10
      FieldName = 'S_Renso'
      Size = 10
    end
    object MemPrint_SaimokuS_KarikuriNo: TIntegerField
      FieldName = 'S_KarikuriNo'
    end
    object MemPrint_SaimokuS_KarikuriName: TStringField
      FieldName = 'S_KarikuriName'
    end
    object MemPrint_SaimokuS_KashikuriNo: TSmallintField
      FieldName = 'S_KashikuriNo'
    end
    object MemPrint_SaimokuS_KashikuriName: TStringField
      FieldName = 'S_KashikuriName'
    end
    object MemPrint_SaimokuS_SousyokuName: TStringField
      FieldName = 'S_SousyokuName'
    end
    object MemPrint_SaimokuS_Syousu: TSmallintField
      FieldName = 'S_Syousu'
    end
    object MemPrint_SaimokuS_StartDate: TDateField
      FieldName = 'S_StartDate'
    end
    object MemPrint_SaimokuS_EndDate: TDateField
      FieldName = 'S_EndDate'
    end
    object MemPrint_SaimokuS_LastUpDate: TDateTimeField
      FieldName = 'S_LastUpDate'
    end
    object MemPrint_SaimokuS_CodeDigit: TIntegerField
      FieldName = 'S_CodeDigit'
    end
    object MemPrint_SaimokuS_CodeAttr: TIntegerField
      FieldName = 'S_CodeAttr'
    end
  end
  object MemPrint_Goukei: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 85
    Top = 259
    object MemPrint_GoukeiG_Fusen: TGraphicField
      FieldName = 'G_Fusen'
      BlobType = ftGraphic
    end
    object MemPrint_GoukeiG_Code: TIntegerField
      FieldName = 'G_Code'
    end
    object MemPrint_GoukeiG_SeishikiName: TStringField
      DisplayWidth = 24
      FieldName = 'G_SeishikiName'
      Size = 24
    end
    object MemPrint_GoukeiG_KanryakuName: TStringField
      DisplayWidth = 14
      FieldName = 'G_KanryakuName'
      Size = 14
    end
    object MemPrint_GoukeiG_Rensou: TStringField
      DisplayWidth = 10
      FieldName = 'G_Rensou'
      Size = 10
    end
    object MemPrint_GoukeiG_SeizanName: TStringField
      FieldName = 'G_SeizanName'
    end
    object MemPrint_GoukeiG_BPName: TStringField
      FieldName = 'G_BPName'
    end
    object MemPrint_GoukeiG_SousyokuName: TStringField
      FieldName = 'G_SousyokuName'
    end
    object MemPrint_GoukeiG_DsPriName: TStringField
      FieldName = 'G_DsPriName'
    end
    object MemPrint_GoukeiG_SagakuPriName: TStringField
      FieldName = 'G_SagakuPriName'
    end
    object MemPrint_GoukeiG_RiekiPriName: TStringField
      FieldName = 'G_RiekiPriName'
    end
    object MemPrint_GoukeiG_MainaPriName: TStringField
      FieldName = 'G_MainaPriName'
    end
    object MemPrint_GoukeiG_AveName: TStringField
      FieldName = 'G_AveName'
    end
    object MemPrint_GoukeiG_RuikeiName: TStringField
      FieldName = 'G_RuikeiName'
    end
    object MemPrint_GoukeiG_GoukeiDsp: TStringField
      FieldName = 'G_GoukeiDsp'
    end
    object MemPrint_GoukeiG_MainaKmk: TStringField
      FieldName = 'G_MainaKmk'
      Size = 24
    end
    object MemPrint_GoukeiG_LastUpDate: TDateTimeField
      FieldName = 'G_LastUpDate'
    end
  end
  object MemPrint_TaikeiList: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 85
    Top = 300
    object MemPrint_TaikeiListT_KMCode: TIntegerField
      FieldName = 'T_KMCode'
    end
    object MemPrint_TaikeiListT_KMKanryaku: TStringField
      DisplayWidth = 14
      FieldName = 'T_KMKanryaku'
      Size = 14
    end
    object MemPrint_TaikeiListT_Add01: TStringField
      FieldName = 'T_Add01'
    end
    object MemPrint_TaikeiListT_KSCode01: TIntegerField
      FieldName = 'T_KSCode01'
    end
    object MemPrint_TaikeiListT_KSName01: TStringField
      FieldName = 'T_KSName01'
    end
    object MemPrint_TaikeiListT_Add02: TStringField
      FieldName = 'T_Add02'
    end
    object MemPrint_TaikeiListT_KSCode02: TIntegerField
      FieldName = 'T_KSCode02'
    end
    object MemPrint_TaikeiListT_KSName02: TStringField
      FieldName = 'T_KSName02'
    end
    object MemPrint_TaikeiListT_Add03: TStringField
      FieldName = 'T_Add03'
    end
    object MemPrint_TaikeiListT_KSCode03: TIntegerField
      FieldName = 'T_KSCode03'
    end
    object MemPrint_TaikeiListT_KSName03: TStringField
      FieldName = 'T_KSName03'
    end
  end
  object MemPrint_JitsuKan: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 85
    Top = 341
    object MemPrint_JitsuKanJ_Code: TIntegerField
      FieldName = 'J_Code'
    end
    object MemPrint_JitsuKanJ_LongName: TStringField
      DisplayWidth = 24
      FieldName = 'J_LongName'
      Size = 24
    end
    object MemPrint_JitsuKanJ_SimpleName: TStringField
      DisplayWidth = 14
      FieldName = 'J_SimpleName'
      Size = 14
    end
    object MemPrint_JitsuKanJ_Renso: TStringField
      DisplayWidth = 10
      FieldName = 'J_Renso'
      Size = 10
    end
    object MemPrint_JitsuKanJ_BunsekiCode: TIntegerField
      FieldName = 'J_BunsekiCode'
    end
    object MemPrint_JitsuKanJ_BunsekiName: TStringField
      FieldName = 'J_BunsekiName'
    end
    object MemPrint_JitsuKanJ_SeikakuCode: TIntegerField
      FieldName = 'J_SeikakuCode'
    end
    object MemPrint_JitsuKanJ_SeikakuName: TStringField
      FieldName = 'J_SeikakuName'
    end
    object MemPrint_JitsuKanJ_Seizan: TStringField
      FieldName = 'J_Seizan'
    end
    object MemPrint_JitsuKanJ_BPKbn: TStringField
      FieldName = 'J_BPKbn'
    end
    object MemPrint_JitsuKanJ_Kisyuzan: TStringField
      FieldName = 'J_Kisyuzan'
    end
    object MemPrint_JitsuKanJ_KariKuriCode: TIntegerField
      FieldName = 'J_KariKuriCode'
    end
    object MemPrint_JitsuKanJ_KariKuriName: TStringField
      FieldName = 'J_KariKuriName'
    end
    object MemPrint_JitsuKanJ_KashiKuriCode: TIntegerField
      FieldName = 'J_KashiKuriCode'
    end
    object MemPrint_JitsuKanJ_KashiKuriName: TStringField
      FieldName = 'J_KashiKuriName'
    end
    object MemPrint_JitsuKanJ_Sousyoku: TStringField
      FieldName = 'J_Sousyoku'
    end
    object MemPrint_JitsuKanJ_Fusen: TGraphicField
      FieldName = 'J_Fusen'
      BlobType = ftGraphic
    end
  end
  object MemPrint_Hendo: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 85
    Top = 467
    object IntegerField1: TIntegerField
      FieldName = 'H_KMCode'
    end
    object StringField1: TStringField
      DisplayWidth = 14
      FieldName = 'H_KMKanryaku'
      Size = 14
    end
    object IntegerField2: TIntegerField
      FieldName = 'H_HendoCode'
    end
    object StringField3: TStringField
      FieldName = 'H_HendoName'
    end
    object IntegerField3: TIntegerField
      FieldName = 'H_KoteiCode'
    end
    object StringField5: TStringField
      FieldName = 'H_KoteiName'
    end
    object MemPrint_HendoH_HendoRate: TFloatField
      FieldName = 'H_HendoRate'
    end
  end
  object MemPrint_Ichiran: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 85
    Top = 425
    object MemPrint_IchiranIchi_KmkCode: TIntegerField
      FieldName = 'Ichi_KmkCode'
    end
    object MemPrint_IchiranIchi_KmkName: TStringField
      DisplayWidth = 14
      FieldName = 'Ichi_KmkName'
    end
  end
  object MemPrint_Taikei: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 85
    Top = 382
    object MemPrint_TaikeiCode: TIntegerField
      FieldName = 'Code'
    end
    object MemPrint_TaikeiSimpleName: TStringField
      FieldName = 'SimpleName'
    end
    object MemPrint_TaikeiCode01: TIntegerField
      FieldName = 'Code01'
    end
    object MemPrint_TaikeiAddKbn01: TStringField
      FieldName = 'AddKbn01'
    end
    object MemPrint_TaikeiName01: TStringField
      FieldName = 'Name01'
    end
    object MemPrint_TaikeiMaxEnt01: TStringField
      FieldName = 'MaxEnt01'
    end
    object MemPrint_TaikeiAddKbn02: TStringField
      FieldName = 'AddKbn02'
    end
    object MemPrint_TaikeiCode02: TIntegerField
      FieldName = 'Code02'
    end
    object MemPrint_TaikeiName02: TStringField
      FieldName = 'Name02'
    end
    object MemPrint_TaikeiMaxEnt02: TStringField
      FieldName = 'MaxEnt02'
    end
    object MemPrint_TaikeiAddKbn03: TStringField
      FieldName = 'AddKbn03'
    end
    object MemPrint_TaikeiCode03: TIntegerField
      FieldName = 'Code03'
    end
    object MemPrint_TaikeiName03: TStringField
      FieldName = 'Name03'
    end
    object MemPrint_TaikeiMaxEnt03: TStringField
      FieldName = 'MaxEnt03'
    end
    object MemPrint_TaikeiAddKbn04: TStringField
      FieldName = 'AddKbn04'
    end
    object MemPrint_TaikeiCode04: TIntegerField
      FieldName = 'Code04'
    end
    object MemPrint_TaikeiName04: TStringField
      FieldName = 'Name04'
    end
    object MemPrint_TaikeiMaxEnt04: TStringField
      FieldName = 'MaxEnt04'
    end
    object MemPrint_TaikeiAddKbn05: TStringField
      FieldName = 'AddKbn05'
    end
    object MemPrint_TaikeiCode05: TIntegerField
      FieldName = 'Code05'
    end
    object MemPrint_TaikeiName05: TStringField
      FieldName = 'Name05'
    end
    object MemPrint_TaikeiMaxEnt05: TStringField
      FieldName = 'MaxEnt05'
    end
    object MemPrint_TaikeiAddKbn06: TStringField
      FieldName = 'AddKbn06'
    end
    object MemPrint_TaikeiCode06: TIntegerField
      FieldName = 'Code06'
    end
    object MemPrint_TaikeiName06: TStringField
      FieldName = 'Name06'
    end
    object MemPrint_TaikeiMaxEnt06: TStringField
      FieldName = 'MaxEnt06'
    end
    object MemPrint_TaikeiAddKbn07: TStringField
      FieldName = 'AddKbn07'
    end
    object MemPrint_TaikeiCode07: TIntegerField
      FieldName = 'Code07'
    end
    object MemPrint_TaikeiName07: TStringField
      FieldName = 'Name07'
    end
    object MemPrint_TaikeiMaxEnt07: TStringField
      FieldName = 'MaxEnt07'
    end
    object MemPrint_TaikeiAddKbn08: TStringField
      FieldName = 'AddKbn08'
    end
    object MemPrint_TaikeiCode08: TIntegerField
      FieldName = 'Code08'
    end
    object MemPrint_TaikeiName08: TStringField
      FieldName = 'Name08'
    end
    object MemPrint_TaikeiMaxEnt08: TStringField
      FieldName = 'MaxEnt08'
    end
    object MemPrint_TaikeiAddKbn09: TStringField
      FieldName = 'AddKbn09'
    end
    object MemPrint_TaikeiName09: TStringField
      FieldName = 'Name09'
    end
    object MemPrint_TaikeiCode09: TIntegerField
      FieldName = 'Code09'
    end
    object MemPrint_TaikeiMaxEnt09: TStringField
      FieldName = 'MaxEnt09'
    end
    object MemPrint_TaikeiBitmapTop: TGraphicField
      FieldName = 'BitmapTop'
      BlobType = ftGraphic
    end
    object MemPrint_TaikeiBitmap01: TGraphicField
      FieldName = 'Bitmap01'
      BlobType = ftGraphic
    end
    object MemPrint_TaikeiBitmap02: TGraphicField
      FieldName = 'Bitmap02'
      BlobType = ftGraphic
    end
    object MemPrint_TaikeiBitmap03: TGraphicField
      FieldName = 'Bitmap03'
      BlobType = ftGraphic
    end
    object MemPrint_TaikeiBitmap04: TGraphicField
      FieldName = 'Bitmap04'
      BlobType = ftGraphic
    end
    object MemPrint_TaikeiBitmap05: TGraphicField
      FieldName = 'Bitmap05'
      BlobType = ftGraphic
    end
    object MemPrint_TaikeiBitmap06: TGraphicField
      FieldName = 'Bitmap06'
      BlobType = ftGraphic
    end
    object MemPrint_TaikeiBitmap07: TGraphicField
      FieldName = 'Bitmap07'
      BlobType = ftGraphic
    end
    object MemPrint_TaikeiBitmap08: TGraphicField
      FieldName = 'Bitmap08'
      BlobType = ftGraphic
    end
    object MemPrint_TaikeiBitmap09: TGraphicField
      FieldName = 'Bitmap09'
      BlobType = ftGraphic
    end
    object MemPrint_TaikeiSumKbn09: TIntegerField
      FieldName = 'SumKbn09'
    end
  end
  object RList: TppReport
    AutoStop = False
    DataPipeline = RPipeline
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
    Template.FileName = 'D:\Delphi\MADJ\ADJ0350\adj0350rb.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = BeforePrint
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
    Left = 1
    Top = 176
    Version = '19.04'
    mmColumnWidth = 339067
    DataPipelineName = 'RPipeline'
    object ppTitleBand1: TppTitleBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 29639
      mmPrintPosition = 0
      object ppLineJS_Top: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LineJS_Top'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2032
        mmLeft = 21590
        mmTop = 16937
        mmWidth = 296063
        BandType = 0
        LayerName = Foreground
      end
      object ppLineJS_Bottom: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LineJS_Bottom'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 21590
        mmTop = 25405
        mmWidth = 296063
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
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
      object ppLabel1: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #23455#22312#31185#30446#30331#37682#12522#12473#12488
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
        mmLeft = 123561
        mmTop = 4233
        mmWidth = 88900
        BandType = 0
        LayerName = Foreground
      end
      object SVppDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'SVppDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        VarType = vtDateTime
        DisplayFormat = 'yyyy/mm/dd hh:mm'
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
        mmTop = 0
        mmWidth = 64008
        BandType = 0
        LayerName = Foreground
      end
      object LppCorpCode: TppLabel
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
      object LppCorpName: TppLabel
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
      object RLKamokuName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'RLKamokuName'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmLeft = 22403
        mmTop = 21702
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'RLKamokuName1'
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
        mmLeft = 60808
        mmTop = 21702
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground
      end
      object ppLine4: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 33985
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine5: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 75591
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine10: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line10'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 83592
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine11: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line101'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 179604
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#24335#31185#30446#21517
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
        mmLeft = 36805
        mmTop = 17465
        mmWidth = 40005
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel33: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label33'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#31185#30446#21517
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
        mmLeft = 36805
        mmTop = 21702
        mmWidth = 22403
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel68: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label68'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12510#12452#12490#12473#22793#25563#31185#30446#21517
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
        mmLeft = 36805
        mmTop = 25936
        mmWidth = 40005
        BandType = 0
        LayerName = Foreground
      end
      object pL_Bunseki: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pL_Bunseki'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#26512
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
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
        mmLeft = 78317
        mmTop = 17465
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground
      end
      object pL_YouBunseki: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pL_Bunseki1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #35201#32004
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
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
        mmLeft = 78317
        mmTop = 21702
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #24615#26684
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
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
        mmLeft = 78317
        mmTop = 25936
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label14'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'B/P'
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
        mmLeft = 86519
        mmTop = 25936
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label15'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26399#39318
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
        mmLeft = 86519
        mmTop = 17465
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label13'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#27531
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
        mmLeft = 86411
        mmTop = 21702
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground
      end
      object ppLine115: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line115'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 91593
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel19: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label102'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20511#26041#36039#37329
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
        mmLeft = 94456
        mmTop = 17465
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label20'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36024#26041#36039#37329
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
        mmLeft = 94456
        mmTop = 21702
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLine120: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line120'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 165202
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine121: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line121'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 144399
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine122: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line122'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 129997
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine123: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line123'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 115596
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine124: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line124'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 105994
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel34: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label34'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #35013#39166
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
        mmLeft = 108744
        mmTop = 17465
        mmWidth = 7938
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label17'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27604#29575#31185#30446
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
        mmLeft = 118534
        mmTop = 17465
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel21: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label21'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #22793#21205#27604#29575
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
        mmLeft = 118534
        mmTop = 21702
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLine125: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line125'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 194006
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine127: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line127'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 218009
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine128: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line128'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 242012
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine129: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line129'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 259614
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine130: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line130'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 280417
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel26: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label26'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #24046#38989#21360#21047
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
        mmLeft = 132821
        mmTop = 17465
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel27: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label27'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21033#30410#21360#21047
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
        mmLeft = 132821
        mmTop = 21702
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel30: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label30'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #65423#65394#65413#65405#21360#21047
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
        mmLeft = 132821
        mmTop = 25936
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20803#24115#36215#31080#21360#23383
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
        mmLeft = 147109
        mmTop = 17465
        mmWidth = 19315
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel35: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label35'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20181#35379#20837#21147
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
        mmLeft = 168011
        mmTop = 17465
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel36: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label36'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26399#26085#20837#21147
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
        mmLeft = 168011
        mmTop = 25936
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel38: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label38'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #22266#23450#25688#35201
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
        mmLeft = 182298
        mmTop = 17465
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel39: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'Label39'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#39006'1'
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
        mmLeft = 196850
        mmTop = 17465
        mmWidth = 22490
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel40: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label40'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36039#37329#32368#20778#20808
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
        mmLeft = 244831
        mmTop = 17465
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel47: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label401'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #23653#27508#31649#29702
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
        mmLeft = 262467
        mmTop = 17465
        mmWidth = 19202
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel25: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label25'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26368#32066#26356#26032#26085#26178
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
        mmLeft = 283236
        mmTop = 17465
        mmWidth = 33604
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label10'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36969#29992#38283#22987
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 283369
        mmTop = 25400
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label101'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36969#29992#32066#20102
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 301096
        mmTop = 25400
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground
      end
      object ppLineJS_Left: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LineJS_Left'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 21590
        mmTop = 16937
        mmWidth = 7144
        BandType = 0
        LayerName = Foreground
      end
      object ppLineJS_Right: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LineJS_Right'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 315621
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label201'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #35201#32004#31185#30446
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
        mmLeft = 94456
        mmTop = 25936
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #22266#23450
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
        mmLeft = 108744
        mmTop = 21702
        mmWidth = 7938
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel23: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label23'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #22793#21205
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
        mmLeft = 108744
        mmTop = 25936
        mmWidth = 7938
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel37: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label37'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #38598#35336#21336#20301#21306#20998
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
        mmLeft = 147219
        mmTop = 21702
        mmWidth = 19202
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel59: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'Label59'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#39006'1'
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
        mmLeft = 196825
        mmTop = 21702
        mmWidth = 22490
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel63: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'Label63'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#39006'1'
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
        mmLeft = 196825
        mmTop = 25936
        mmWidth = 22490
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel64: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'Label64'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#39006'1'
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
        mmLeft = 220828
        mmTop = 17465
        mmWidth = 22490
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel72: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'Label72'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#39006'1'
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
        mmLeft = 220828
        mmTop = 21702
        mmWidth = 22490
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12304#35443#32048#22411#12305
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
        mmLeft = 218811
        mmTop = 4233
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand_JitsuS: TppDetailBand
      BeforeGenerate = ppDetailBand_JitsuSBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 12703
      mmPrintPosition = 0
      object ppUnderLineJS: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'UnderLineJS'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 21590
        mmTop = 8468
        mmWidth = 296063
        BandType = 4
        LayerName = Foreground
      end
      object pDT_Code: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Code'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 22403
        mmTop = 4764
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object pDT_Seishiki: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Seishiki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SeishikiName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 36805
        mmTop = 531
        mmWidth = 40005
        BandType = 4
        LayerName = Foreground
      end
      object pDT_Kanryaku: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KanryakuName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 36805
        mmTop = 4764
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground
      end
      object pDT_Renso: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Rensou'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 60808
        mmTop = 4764
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground
      end
      object pDT_Bunseki: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Bunseki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Bunseki'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 78410
        mmTop = 531
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground
      end
      object pDT_Seikaku: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Seikaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Seikaku'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 78410
        mmTop = 8999
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground
      end
      object pDT_BunsekiName: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_BunsekiName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'YouYakuCode'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 78410
        mmTop = 4764
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground
      end
      object pDT_StartDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_StartDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'StartDate'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 282840
        mmTop = 9260
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground
      end
      object pDT_EndDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_EndDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'EndDate'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 300567
        mmTop = 9260
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground
      end
      object ppLine1: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 33985
        mmTop = 0
        mmWidth = 2032
        BandType = 4
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
        mmHeight = 12703
        mmLeft = 75591
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object pDT_BsPlName: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Hojo1Name1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'BsPlName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 86411
        mmTop = 8999
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground
      end
      object pDT_KisyuName: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Hojo2Name1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KisyuName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 86411
        mmTop = 531
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground
      end
      object pDT_HiritsuName: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_SegName1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'HiritsuName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 118415
        mmTop = 531
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object pDT_SeizanName: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_SaimokuName1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SeizanName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 86411
        mmTop = 4764
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground
      end
      object ppLine6: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 21590
        mmTop = 0
        mmWidth = 3969
        BandType = 4
        LayerName = Foreground
      end
      object ppLine8: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line8'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 315621
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object pDT_KariKuri: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_KariKuri'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KariKuri'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 94412
        mmTop = 531
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object pDT_KashiKuri: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_KashiKuri'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KashiKuri'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 94412
        mmTop = 4764
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object pDT_Hendouhi: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Hendouhi'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Hendouhi'
        DataPipeline = RPipeline
        DisplayFormat = '0.00'
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 118415
        mmTop = 4764
        mmWidth = 12802
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
        mmHeight = 12703
        mmLeft = 83592
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'MainasuPriName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 132817
        mmTop = 8999
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText9'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RiekiName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 132817
        mmTop = 4764
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText13'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'MainaKamoku'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 36805
        mmTop = 8999
        mmWidth = 40005
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText17: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText17'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SousyokuName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 108814
        mmTop = 531
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppLine12: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line12'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 165202
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText8'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SagakuName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 132817
        mmTop = 531
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText21: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Hiritsu2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Bun1Nm'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 196825
        mmTop = 531
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText25: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText25'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ShikuriYuName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 244831
        mmTop = 531
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText27: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText27'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KoteiTekiName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 182423
        mmTop = 531
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText29: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText29'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KijitsuName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 168021
        mmTop = 8999
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText30: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText30'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ShiwakeName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 168021
        mmTop = 531
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText37: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText37'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RirekiName'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 262433
        mmTop = 531
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground
      end
      object RImageZitsuSFusen: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'RImageJitsuFusen1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Fusen'
        DataPipeline = RPipeline
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline'
        mmHeight = 3969
        mmLeft = 16002
        mmTop = 4764
        mmWidth = 4801
        BandType = 4
        LayerName = Foreground
      end
      object ppLine114: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line114'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 91593
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine116: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line116'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 144399
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine117: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line117'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 129997
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine118: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line118'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 105994
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine119: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line119'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 115596
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine131: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line131'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 179604
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine133: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line133'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 218009
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine134: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line134'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 242012
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine135: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line135'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 259614
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine136: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line136'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 280417
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine137: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line137'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12703
        mmLeft = 194006
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText302'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KihyouPri'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 147219
        mmTop = 531
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground
      end
      object R_JS_LastUpDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_EndDate1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'LastUpDate'
        DataPipeline = RPipeline
        DisplayFormat = #39'yyyy/mm/dd'#39', '#39'hh:nn:ss'#39
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 283236
        mmTop = 531
        mmWidth = 28804
        BandType = 4
        LayerName = Foreground
      end
      object pDT_Youyaku: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_KashiKuri1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Youyaku'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 94412
        mmTop = 8999
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object pDT_Kotei: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Kotei'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Kotei'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 108814
        mmTop = 4764
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object pDT_Hendo: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Kotei1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Hendo'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 108814
        mmTop = 8999
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText19: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText19'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'AddUnit'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 147219
        mmTop = 4764
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText28: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText28'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Bun2Nm'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 196825
        mmTop = 4764
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText31: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText31'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Bun3Nm'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 196825
        mmTop = 8999
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText32: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText32'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Bun4Nm'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 220828
        mmTop = 531
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText34: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText34'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Bun5Nm'
        DataPipeline = RPipeline
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
        DataPipelineName = 'RPipeline'
        mmHeight = 3175
        mmLeft = 220828
        mmTop = 4764
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object SVppPage: TppSystemVariable
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
        mmLeft = 163777
        mmTop = 0
        mmWidth = 11113
        BandType = 8
        LayerName = Foreground
      end
      object LppAccOffice: TppLabel
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
    object ppGroup1: TppGroup
      BreakName = 'LKensu'
      BreakType = btCustomField
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
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
        mmHeight = 3175
        mmPrintPosition = 0
        object LKensu: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'LKensu'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = '9,999 '#20214
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Name = #65325#65331' '#26126#26397
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taRightJustified
          Transparent = True
          Distributed = False
          Layout = tlTop
          Distributed2 = False
          mmHeight = 3175
          mmLeft = 29014
          mmTop = 0
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object LGouLeft: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'LGouLeft'
          HyperlinkEnabled = False
          Border.mmPadding = 0
          Caption = #8251#8251
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
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
          mmLeft = 22403
          mmTop = 0
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object LGouRight: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'LGouRight'
          HyperlinkEnabled = False
          Border.mmPadding = 0
          Caption = #8251#8251
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
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
          mmLeft = 44628
          mmTop = 0
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
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
  object RPipeline: TppDBPipeline
    DataSource = DDataSource
    UserName = 'RPipeline'
    Left = 29
    Top = 176
    object RPipelineppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object RPipelineppField2: TppField
      FieldAlias = 'Fusen'
      FieldName = 'Fusen'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
    object RPipelineppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'Code'
      FieldName = 'Code'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object RPipelineppField4: TppField
      FieldAlias = 'SeishikiName'
      FieldName = 'SeishikiName'
      FieldLength = 24
      DisplayWidth = 24
      Position = 3
    end
    object RPipelineppField5: TppField
      FieldAlias = 'KanryakuName'
      FieldName = 'KanryakuName'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object RPipelineppField6: TppField
      FieldAlias = 'Rensou'
      FieldName = 'Rensou'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object RPipelineppField7: TppField
      FieldAlias = 'MainaKamoku'
      FieldName = 'MainaKamoku'
      FieldLength = 24
      DisplayWidth = 24
      Position = 6
    end
    object RPipelineppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'Bunseki'
      FieldName = 'Bunseki'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object RPipelineppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'YouYakuCode'
      FieldName = 'YouYakuCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object RPipelineppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'Seikaku'
      FieldName = 'Seikaku'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object RPipelineppField11: TppField
      FieldAlias = 'KisyuName'
      FieldName = 'KisyuName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object RPipelineppField12: TppField
      FieldAlias = 'SeizanName'
      FieldName = 'SeizanName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object RPipelineppField13: TppField
      FieldAlias = 'BsPlName'
      FieldName = 'BsPlName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object RPipelineppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'KariKuri'
      FieldName = 'KariKuri'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object RPipelineppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'KashiKuri'
      FieldName = 'KashiKuri'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object RPipelineppField16: TppField
      FieldAlias = 'SousyokuName'
      FieldName = 'SousyokuName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object RPipelineppField17: TppField
      FieldAlias = 'DspPriName'
      FieldName = 'DspPriName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 16
    end
    object RPipelineppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'Saimoku'
      FieldName = 'Saimoku'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object RPipelineppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'Hojo1'
      FieldName = 'Hojo1'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object RPipelineppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'Hojo2'
      FieldName = 'Hojo2'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 19
    end
    object RPipelineppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'Bumon'
      FieldName = 'Bumon'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 20
    end
    object RPipelineppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'Seg'
      FieldName = 'Seg'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 21
    end
    object RPipelineppField23: TppField
      FieldAlias = 'HiritsuName'
      FieldName = 'HiritsuName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 22
    end
    object RPipelineppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'Hendouhi'
      FieldName = 'Hendouhi'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 6
      Position = 23
    end
    object RPipelineppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'Kobetsu'
      FieldName = 'Kobetsu'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 6
      Position = 24
    end
    object RPipelineppField26: TppField
      FieldAlias = 'SagakuName'
      FieldName = 'SagakuName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 25
    end
    object RPipelineppField27: TppField
      FieldAlias = 'RiekiName'
      FieldName = 'RiekiName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 26
    end
    object RPipelineppField28: TppField
      FieldAlias = 'MainasuPriName'
      FieldName = 'MainasuPriName'
      FieldLength = 24
      DisplayWidth = 24
      Position = 27
    end
    object RPipelineppField29: TppField
      FieldAlias = 'KihyouPri'
      FieldName = 'KihyouPri'
      FieldLength = 20
      DisplayWidth = 20
      Position = 28
    end
    object RPipelineppField30: TppField
      FieldAlias = 'AveName'
      FieldName = 'AveName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 29
    end
    object RPipelineppField31: TppField
      FieldAlias = 'RuikeiName'
      FieldName = 'RuikeiName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 30
    end
    object RPipelineppField32: TppField
      FieldAlias = 'ShiwakeName'
      FieldName = 'ShiwakeName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 31
    end
    object RPipelineppField33: TppField
      FieldAlias = 'KijitsuName'
      FieldName = 'KijitsuName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 32
    end
    object RPipelineppField34: TppField
      FieldAlias = 'KijitsuHisu'
      FieldName = 'KijitsuHisu'
      FieldLength = 20
      DisplayWidth = 20
      Position = 33
    end
    object RPipelineppField35: TppField
      FieldAlias = 'TegataNoName'
      FieldName = 'TegataNoName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 34
    end
    object RPipelineppField36: TppField
      FieldAlias = 'TegataHisu'
      FieldName = 'TegataHisu'
      FieldLength = 20
      DisplayWidth = 20
      Position = 35
    end
    object RPipelineppField37: TppField
      FieldAlias = 'KoteiTekiName'
      FieldName = 'KoteiTekiName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 36
    end
    object RPipelineppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'TekiyouBun'
      FieldName = 'TekiyouBun'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 37
    end
    object RPipelineppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'Syousu'
      FieldName = 'Syousu'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 38
    end
    object RPipelineppField40: TppField
      FieldAlias = 'ShikuriYuName'
      FieldName = 'ShikuriYuName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 39
    end
    object RPipelineppField41: TppField
      FieldAlias = 'RirekiName'
      FieldName = 'RirekiName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 40
    end
    object RPipelineppField42: TppField
      FieldAlias = 'DenHojo1Name'
      FieldName = 'DenHojo1Name'
      FieldLength = 20
      DisplayWidth = 20
      Position = 41
    end
    object RPipelineppField43: TppField
      FieldAlias = 'DenHojo2Name'
      FieldName = 'DenHojo2Name'
      FieldLength = 20
      DisplayWidth = 20
      Position = 42
    end
    object RPipelineppField44: TppField
      FieldAlias = 'StartDate'
      FieldName = 'StartDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 43
    end
    object RPipelineppField45: TppField
      FieldAlias = 'EndDate'
      FieldName = 'EndDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 44
    end
    object RPipelineppField46: TppField
      FieldAlias = 'LastUpDate'
      FieldName = 'LastUpDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 45
    end
    object RPipelineppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'Youyaku'
      FieldName = 'Youyaku'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 46
    end
    object RPipelineppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'Kotei'
      FieldName = 'Kotei'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 47
    end
    object RPipelineppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'Hendo'
      FieldName = 'Hendo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 48
    end
    object RPipelineppField50: TppField
      FieldAlias = 'AddUnit'
      FieldName = 'AddUnit'
      FieldLength = 20
      DisplayWidth = 20
      Position = 49
    end
    object RPipelineppField51: TppField
      FieldAlias = 'Bun1Nm'
      FieldName = 'Bun1Nm'
      FieldLength = 14
      DisplayWidth = 14
      Position = 50
    end
    object RPipelineppField52: TppField
      FieldAlias = 'Bun2Nm'
      FieldName = 'Bun2Nm'
      FieldLength = 14
      DisplayWidth = 14
      Position = 51
    end
    object RPipelineppField53: TppField
      FieldAlias = 'Bun3Nm'
      FieldName = 'Bun3Nm'
      FieldLength = 14
      DisplayWidth = 14
      Position = 52
    end
    object RPipelineppField54: TppField
      FieldAlias = 'Bun4Nm'
      FieldName = 'Bun4Nm'
      FieldLength = 14
      DisplayWidth = 14
      Position = 53
    end
    object RPipelineppField55: TppField
      FieldAlias = 'Bun5Nm'
      FieldName = 'Bun5Nm'
      FieldLength = 14
      DisplayWidth = 14
      Position = 54
    end
  end
  object DDataSource: TDataSource
    DataSet = MemPrint
    Left = 57
    Top = 176
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
    Template.FileName = 'D:\Delphi\MADJ\ADJ0350\adj0350rb.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = BeforePrint
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
    Left = 1
    Top = 218
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
        DesignLayer = ppDesignLayer2
        UserName = 'LineBottom'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 26391
        mmTop = 16942
        mmWidth = 267259
        BandType = 0
        LayerName = Foreground1
      end
      object ppLineLeft: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'LineLeft'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 26391
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLineTop: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'LineTop'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2032
        mmLeft = 26391
        mmTop = 16942
        mmWidth = 267259
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine15: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object ppLabel50: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object R_SDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object R_SCorpNo: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object R_SCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object ppLine16: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 38786
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine17: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 77191
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine18: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line10'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 141199
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine19: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line101'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 158801
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine20: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line14'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 187605
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine31: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line31'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 62789
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine33: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line33'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 117196
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine34: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line34'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 216408
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine36: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 226010
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel53: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        mmLeft = 27203
        mmTop = 17466
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel18: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        mmLeft = 41605
        mmTop = 17466
        mmWidth = 22403
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel51: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        mmLeft = 65608
        mmTop = 17466
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel52: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        mmLeft = 80010
        mmTop = 17466
        mmWidth = 38405
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel55: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        mmLeft = 120015
        mmTop = 17466
        mmWidth = 22403
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel54: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'RLKamokuName1'
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
        mmLeft = 144018
        mmTop = 17466
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel75: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label102'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20511#26041#36039#37329#32368#12467#12540#12489
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
        mmLeft = 161621
        mmTop = 17466
        mmWidth = 25603
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel76: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label20'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36024#26041#36039#37329#32368#12467#12540#12489
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
        mmLeft = 190424
        mmTop = 17466
        mmWidth = 25603
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel90: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label34'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #35013#39166
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
        mmLeft = 219228
        mmTop = 17466
        mmWidth = 8001
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel97: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label41'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #36969#29992#38283#22987#26085
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmLeft = 228829
        mmTop = 17466
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine141: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line1401'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 261214
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine142: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line1402'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 243612
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel69: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label10'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #36969#29992#32066#20102#26085
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmLeft = 246431
        mmTop = 17466
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel70: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label101'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26368#32066#26356#26032#26085#26178
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
        mmLeft = 264034
        mmTop = 17466
        mmWidth = 28804
        BandType = 0
        LayerName = Foreground1
      end
      object ppLineRight: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'LineRight'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 291618
        mmTop = 16942
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand_Saimoku: TppDetailBand
      BeforeGenerate = ppDetailBand_SaimokuBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4234
      mmPrintPosition = 0
      object ppUnderLineS: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 26391
        mmTop = 0
        mmWidth = 267259
        BandType = 4
        LayerName = Foreground1
      end
      object R_KmkCode: TppDBText
        OnPrint = R_KmkCodePrint
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_KCode'
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
        mmLeft = 27203
        mmTop = 445
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground1
      end
      object R_KmkName: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_KName'
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
        mmLeft = 41605
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine22: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 38786
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine23: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 117196
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine24: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 26391
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine25: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line8'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 291618
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine26: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line9'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 141199
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine27: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line12'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 158801
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine28: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line13'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 187605
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine29: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line29'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 226010
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText48: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_Code1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_SCode'
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
        mmLeft = 65608
        mmTop = 445
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine30: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line30'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 62789
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText49: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_Kanryaku1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_Renso'
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
        mmLeft = 144018
        mmTop = 445
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine32: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line301'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 77191
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText50: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer2
        UserName = 'DBText50'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_SeisikiName'
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
        mmLeft = 80010
        mmTop = 445
        mmWidth = 38405
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText51: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText501'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_KanryakuName'
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
        mmLeft = 120015
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground1
      end
      object R_S_StartDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_StartDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_StartDate'
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
        mmLeft = 228829
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground1
      end
      object R_S_EndDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_EndDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_EndDate'
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
        mmLeft = 246431
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText79: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_KariKuri'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_KarikuriNo'
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
        mmLeft = 161621
        mmTop = 445
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText84: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_KariKuriName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_KarikuriName'
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
        mmLeft = 166421
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText83: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_KashiKuriName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_KashikuriName'
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
        mmLeft = 195225
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText80: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_KashiKuri'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_KashikuriNo'
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
        mmLeft = 190424
        mmTop = 445
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText98: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText17'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_SousyokuName'
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
        mmLeft = 219228
        mmTop = 445
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine35: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 216408
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBImage1: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBImage1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'S_Fusen'
        DataPipeline = RPipeline_Saimoku
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'RPipeline_Saimoku'
        mmHeight = 3969
        mmLeft = 20803
        mmTop = 132
        mmWidth = 4801
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine143: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line143'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 243612
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine144: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line144'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 261214
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground1
      end
      object R_S_LastUpDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_EndDate2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'S_LastUpDate'
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
        mmLeft = 264034
        mmTop = 529
        mmWidth = 28804
        BandType = 4
        LayerName = Foreground1
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
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object R_SKaikeiName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
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
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object RPipeline_Saimoku: TppDBPipeline
    DataSource = DataSource_Saimoku
    UserName = 'RPipeline_Saimoku'
    Left = 29
    Top = 218
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
      FieldAlias = 'S_Fusen'
      FieldName = 'S_Fusen'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
    object RPipeline_SaimokuppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'S_KCode'
      FieldName = 'S_KCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object RPipeline_SaimokuppField4: TppField
      FieldAlias = 'S_KName'
      FieldName = 'S_KName'
      FieldLength = 24
      DisplayWidth = 24
      Position = 3
    end
    object RPipeline_SaimokuppField5: TppField
      FieldAlias = 'S_SCode'
      FieldName = 'S_SCode'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object RPipeline_SaimokuppField6: TppField
      FieldAlias = 'S_SeisikiName'
      FieldName = 'S_SeisikiName'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object RPipeline_SaimokuppField7: TppField
      FieldAlias = 'S_KanryakuName'
      FieldName = 'S_KanryakuName'
      FieldLength = 14
      DisplayWidth = 14
      Position = 6
    end
    object RPipeline_SaimokuppField8: TppField
      FieldAlias = 'S_Renso'
      FieldName = 'S_Renso'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object RPipeline_SaimokuppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'S_KarikuriNo'
      FieldName = 'S_KarikuriNo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object RPipeline_SaimokuppField10: TppField
      FieldAlias = 'S_KarikuriName'
      FieldName = 'S_KarikuriName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object RPipeline_SaimokuppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'S_KashikuriNo'
      FieldName = 'S_KashikuriNo'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object RPipeline_SaimokuppField12: TppField
      FieldAlias = 'S_KashikuriName'
      FieldName = 'S_KashikuriName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object RPipeline_SaimokuppField13: TppField
      FieldAlias = 'S_SousyokuName'
      FieldName = 'S_SousyokuName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object RPipeline_SaimokuppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'S_Syousu'
      FieldName = 'S_Syousu'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object RPipeline_SaimokuppField15: TppField
      FieldAlias = 'S_StartDate'
      FieldName = 'S_StartDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 14
    end
    object RPipeline_SaimokuppField16: TppField
      FieldAlias = 'S_EndDate'
      FieldName = 'S_EndDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 15
    end
    object RPipeline_SaimokuppField17: TppField
      FieldAlias = 'S_LastUpDate'
      FieldName = 'S_LastUpDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 16
    end
    object RPipeline_SaimokuppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'S_CodeDigit'
      FieldName = 'S_CodeDigit'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object RPipeline_SaimokuppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'S_CodeAttr'
      FieldName = 'S_CodeAttr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
  end
  object DataSource_Saimoku: TDataSource
    DataSet = MemPrint_Saimoku
    Left = 57
    Top = 218
  end
  object RGoukei: TppReport
    AutoStop = False
    DataPipeline = RPipeline_Goukei
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
    Template.FileName = 'D:\Delphi\MADJ\ADJ0350\adj0350rb.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = BeforePrint
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
    Left = 1
    Top = 259
    Version = '19.04'
    mmColumnWidth = 271463
    DataPipelineName = 'RPipeline_Goukei'
    object ppTitleBand3: TppTitleBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 21171
      mmPrintPosition = 0
      object ppLine43: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line16'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2032
        mmLeft = 35992
        mmTop = 16937
        mmWidth = 260859
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine21: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line15'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 35992
        mmTop = 16937
        mmWidth = 260859
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel108: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label31'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12510#12452#12490#12473#22793#25563#31185#30446#21517
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
        mmLeft = 227229
        mmTop = 17466
        mmWidth = 38405
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine37: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        LayerName = Foreground2
      end
      object ppLabel62: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer3
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21512#35336#31185#30446#30331#37682#12522#12473#12488
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
        mmLeft = 123561
        mmTop = 4234
        mmWidth = 88900
        BandType = 0
        LayerName = Foreground2
      end
      object R_GDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'SVppDate'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        VarType = vtDateTime
        DisplayFormat = 'yyyy/mm/dd hh:mm'
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
        LayerName = Foreground2
      end
      object R_GCorpNo: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        LayerName = Foreground2
      end
      object R_GCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        LayerName = Foreground2
      end
      object ppLine38: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 88392
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine39: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 112395
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine40: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line10'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 144399
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine41: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line101'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 165202
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine42: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line14'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 195606
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine52: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line52'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 48387
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine54: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line102'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 129997
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine56: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line56'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 155601
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine57: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line57'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 181204
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine138: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line138'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 224409
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine139: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line139'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 264415
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine148: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line148'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 210008
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine150: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line150'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 294818
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel65: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'RLKamokuName'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmLeft = 36805
        mmTop = 17466
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel66: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'RLKamokuName1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#24335#31185#30446#21517
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
        mmLeft = 51207
        mmTop = 17466
        mmWidth = 38405
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel67: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label12'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#31185#30446#21517
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
        mmLeft = 91212
        mmTop = 17466
        mmWidth = 22403
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel73: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pL_Renso'
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
        mmLeft = 115215
        mmTop = 17466
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel94: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label13'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#27531#21306#20998
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
        mmLeft = 132817
        mmTop = 17466
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel95: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label14'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'BP'#21306#20998
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmLeft = 147219
        mmTop = 17466
        mmWidth = 9601
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel110: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label34'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #35013#39166
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
        mmLeft = 158420
        mmTop = 17466
        mmWidth = 8001
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel88: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label16'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #34920#31034'/'#21360#21047
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmLeft = 168021
        mmTop = 17466
        mmWidth = 14402
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel103: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label26'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #24046#38989#21360#21047
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmLeft = 184023
        mmTop = 17466
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel104: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label27'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21033#30410#21360#21047
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
        mmLeft = 198425
        mmTop = 17466
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel107: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label30'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #65423#65394#65413#65405#21360#21047
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmLeft = 212827
        mmTop = 17466
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel32: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label32'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26368#32066#26356#26032#26085#26178
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
        mmLeft = 267234
        mmTop = 17466
        mmWidth = 28804
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine7: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line11'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 35992
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
    end
    object ppDetailBand_Gou: TppDetailBand
      BeforeGenerate = ppDetailBand_GouBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4234
      mmPrintPosition = 0
      object ppUnderLineG: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line7'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 35992
        mmTop = 0
        mmWidth = 260859
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText33: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_Code'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 36805
        mmTop = 530
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText41: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Seishiki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_SeishikiName'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 51207
        mmTop = 530
        mmWidth = 38405
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText46: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_KanryakuName'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 91212
        mmTop = 530
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText47: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_Rensou'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 115215
        mmTop = 530
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine44: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 88392
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine45: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 112395
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText78: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Hojo1Name1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_BPName'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 147219
        mmTop = 530
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText82: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_BumonName1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_DsPriName'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 168021
        mmTop = 530
        mmWidth = 14402
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText86: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_SaimokuName1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_SeizanName'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 132817
        mmTop = 530
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine46: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 35992
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine48: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line9'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 155601
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText102: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText7'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_MainaPriName'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 212827
        mmTop = 530
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText103: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText9'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_RiekiPriName'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 198425
        mmTop = 530
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText107: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer3
        UserName = 'DBText13'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_MainaKmk'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 227229
        mmTop = 530
        mmWidth = 38405
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText111: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText17'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_SousyokuName'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 158420
        mmTop = 530
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine49: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line12'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 165202
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText112: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText8'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_SagakuPriName'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 184023
        mmTop = 530
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine50: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line13'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 195606
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine51: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line51'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 48387
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine53: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line53'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 129997
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine55: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line55'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 144399
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine58: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line58'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 181204
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine153: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line153'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 224409
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine154: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line154'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 264415
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine157: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line157'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 210008
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine158: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line158'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 294818
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBImage2: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBImage2'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'G_Fusen'
        DataPipeline = RPipeline_Goukei
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3969
        mmLeft = 30404
        mmTop = 0
        mmWidth = 4801
        BandType = 4
        LayerName = Foreground2
      end
      object R_G_LastUpDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'R_G_LastUpDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'G_LastUpDate'
        DataPipeline = RPipeline_Goukei
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
        DataPipelineName = 'RPipeline_Goukei'
        mmHeight = 3175
        mmLeft = 267234
        mmTop = 530
        mmWidth = 28804
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppFooterBand3: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object R_GPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        mmLeft = 163777
        mmTop = 0
        mmWidth = 11113
        BandType = 8
        LayerName = Foreground2
      end
      object R_GKaikeiName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 304801
        mmTop = 0
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground2
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'RL_Kensu'
      BreakType = btCustomField
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
        object RL_Kensu: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'LKensu'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = '9,999 '#20214
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Name = #65325#65331' '#26126#26397
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taRightJustified
          Transparent = True
          Distributed = False
          Layout = tlTop
          Distributed2 = False
          mmHeight = 3175
          mmLeft = 43353
          mmTop = 0
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel127: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'LGouLeft'
          HyperlinkEnabled = False
          Border.mmPadding = 0
          Caption = #8251#8251
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
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
          mmLeft = 36805
          mmTop = 0
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel128: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'LGouRight'
          HyperlinkEnabled = False
          Border.mmPadding = 0
          Caption = #8251#8251
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
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
          mmLeft = 59030
          mmTop = 0
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
      end
    end
    object ppDesignLayers3: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'Foreground2'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object RPipeline_Goukei: TppDBPipeline
    DataSource = DataSource_Goukei
    UserName = 'RPipeline_Goukei'
    Left = 29
    Top = 259
    object RPipeline_GoukeippField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object RPipeline_GoukeippField2: TppField
      FieldAlias = 'G_Fusen'
      FieldName = 'G_Fusen'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
    object RPipeline_GoukeippField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'G_Code'
      FieldName = 'G_Code'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object RPipeline_GoukeippField4: TppField
      FieldAlias = 'G_SeishikiName'
      FieldName = 'G_SeishikiName'
      FieldLength = 24
      DisplayWidth = 24
      Position = 3
    end
    object RPipeline_GoukeippField5: TppField
      FieldAlias = 'G_KanryakuName'
      FieldName = 'G_KanryakuName'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object RPipeline_GoukeippField6: TppField
      FieldAlias = 'G_Rensou'
      FieldName = 'G_Rensou'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object RPipeline_GoukeippField7: TppField
      FieldAlias = 'G_SeizanName'
      FieldName = 'G_SeizanName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object RPipeline_GoukeippField8: TppField
      FieldAlias = 'G_BPName'
      FieldName = 'G_BPName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object RPipeline_GoukeippField9: TppField
      FieldAlias = 'G_SousyokuName'
      FieldName = 'G_SousyokuName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object RPipeline_GoukeippField10: TppField
      FieldAlias = 'G_DsPriName'
      FieldName = 'G_DsPriName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object RPipeline_GoukeippField11: TppField
      FieldAlias = 'G_SagakuPriName'
      FieldName = 'G_SagakuPriName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object RPipeline_GoukeippField12: TppField
      FieldAlias = 'G_RiekiPriName'
      FieldName = 'G_RiekiPriName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object RPipeline_GoukeippField13: TppField
      FieldAlias = 'G_MainaPriName'
      FieldName = 'G_MainaPriName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object RPipeline_GoukeippField14: TppField
      FieldAlias = 'G_AveName'
      FieldName = 'G_AveName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object RPipeline_GoukeippField15: TppField
      FieldAlias = 'G_RuikeiName'
      FieldName = 'G_RuikeiName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 14
    end
    object RPipeline_GoukeippField16: TppField
      FieldAlias = 'G_GoukeiDsp'
      FieldName = 'G_GoukeiDsp'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object RPipeline_GoukeippField17: TppField
      FieldAlias = 'G_MainaKmk'
      FieldName = 'G_MainaKmk'
      FieldLength = 24
      DisplayWidth = 24
      Position = 16
    end
    object RPipeline_GoukeippField18: TppField
      FieldAlias = 'G_LastUpDate'
      FieldName = 'G_LastUpDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 17
    end
  end
  object DataSource_Goukei: TDataSource
    DataSet = MemPrint_Goukei
    Left = 57
    Top = 259
  end
  object RTaikeiList: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '0'
      '169538'
      '0'
      '0')
    DataPipeline = RPipeline_TaikeiList
    OnEndColumn = RTaikeiListEndColumn
    OnEndPage = RTaikeiListEndPage
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
    Template.FileName = 'D:\Delphi\MADJ\ADJ0350\adj0350rb.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = BeforePrint
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
    Left = 1
    Top = 300
    Version = '19.04'
    mmColumnWidth = 169533
    DataPipelineName = 'RPipeline_TaikeiList'
    object ppTitleBand4: TppTitleBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 16937
      mmPrintPosition = 0
      object ppLine59: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        LayerName = Foreground3
      end
      object pL_Title: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer4
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #23455#22312#31185#30446#21152#31639#12522#12473#12488
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
        LayerName = Foreground3
      end
      object R_TLDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'SVppDate'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        VarType = vtDateTime
        DisplayFormat = 'yyyy/mm/dd hh:mm'
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
        LayerName = Foreground3
      end
      object R_TLCorpNo: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        LayerName = Foreground3
      end
      object R_TLCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        LayerName = Foreground3
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLineT_Bottom: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'LineT_Bottom'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 787
        mmTop = 0
        mmWidth = 168047
        BandType = 2
        LayerName = Foreground3
      end
      object ppLineT_Top: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'LineT_Top'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2032
        mmLeft = 787
        mmTop = 0
        mmWidth = 168047
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine62: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'LineT_Right1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 123597
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine70: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 37186
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel71: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'RLKamokuName'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmLeft = 1600
        mmTop = 445
        mmWidth = 12802
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine65: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line52'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 13183
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel102: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label2'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21152#31639#20803#31185#30446
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
        mmLeft = 16002
        mmTop = 445
        mmWidth = 22403
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel85: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label29'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21152#31639#20808#31185#30446
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
        mmLeft = 40005
        mmTop = 445
        mmWidth = 41605
        BandType = 2
        LayerName = Foreground3
      end
      object ppLineT_Left: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'LineT_Left'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 787
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground3
      end
      object ppLineT_Right: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'LineT_Right'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 166802
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel28: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label28'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21152#31639#20808#31185#30446
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
        mmLeft = 83211
        mmTop = 529
        mmWidth = 41605
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel31: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21152#31639#20808#31185#30446
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
        mmLeft = 126416
        mmTop = 529
        mmWidth = 41605
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine75: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line75'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 80391
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground3
      end
    end
    object ppDetailBand_Taikei: TppDetailBand
      BeforeGenerate = ppDetailBand_TaikeiBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4234
      mmPrintPosition = 0
      object ppUnderLineT: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 787
        mmTop = 0
        mmWidth = 168047
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine72: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 787
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBTextCode: TppDBText
        OnPrint = ppDBTextCodePrint
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'T_KMCode'
        DataPipeline = RPipeline_TaikeiList
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
        DataPipelineName = 'RPipeline_TaikeiList'
        mmHeight = 3175
        mmLeft = 1600
        mmTop = 445
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine77: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line51'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 13183
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBTextKanryaku: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'T_KMKanryaku'
        DataPipeline = RPipeline_TaikeiList
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
        DataPipelineName = 'RPipeline_TaikeiList'
        mmHeight = 3175
        mmLeft = 16002
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine71: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 37186
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText56: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText56'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'T_Add01'
        DataPipeline = RPipeline_TaikeiList
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
        DataPipelineName = 'RPipeline_TaikeiList'
        mmHeight = 3175
        mmLeft = 40005
        mmTop = 445
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine84: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line84'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Visible = False
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 41986
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText62: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'pDT_BumonName1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'T_KSCode01'
        DataPipeline = RPipeline_TaikeiList
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
        DataPipelineName = 'RPipeline_TaikeiList'
        mmHeight = 3175
        mmLeft = 44806
        mmTop = 445
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine60: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Visible = False
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 55880
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText85: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText101'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'T_KSName01'
        DataPipeline = RPipeline_TaikeiList
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
        DataPipelineName = 'RPipeline_TaikeiList'
        mmHeight = 3175
        mmLeft = 59208
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine79: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line55'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 166802
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine64: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line64'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 80391
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'T_KSCode02'
        DataPipeline = RPipeline_TaikeiList
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
        DataPipelineName = 'RPipeline_TaikeiList'
        mmHeight = 3175
        mmLeft = 88011
        mmTop = 445
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine66: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line66'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Visible = False
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 99594
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText3: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'T_KSName02'
        DataPipeline = RPipeline_TaikeiList
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
        DataPipelineName = 'RPipeline_TaikeiList'
        mmHeight = 3175
        mmLeft = 102413
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine67: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line67'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Visible = False
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 128397
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText4: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'T_KSCode03'
        DataPipeline = RPipeline_TaikeiList
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
        DataPipelineName = 'RPipeline_TaikeiList'
        mmHeight = 3175
        mmLeft = 131217
        mmTop = 445
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine68: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line68'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Visible = False
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 142799
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText5: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'T_KSName03'
        DataPipeline = RPipeline_TaikeiList
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
        DataPipelineName = 'RPipeline_TaikeiList'
        mmHeight = 3175
        mmLeft = 145618
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine74: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line74'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 123597
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine76: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line76'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Visible = False
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 85192
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText6: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText6'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'T_Add02'
        DataPipeline = RPipeline_TaikeiList
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
        DataPipelineName = 'RPipeline_TaikeiList'
        mmHeight = 3175
        mmLeft = 83211
        mmTop = 445
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText10: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText10'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'T_Add03'
        DataPipeline = RPipeline_TaikeiList
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
        DataPipelineName = 'RPipeline_TaikeiList'
        mmHeight = 3175
        mmLeft = 126416
        mmTop = 445
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground3
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
    object ppFooterBand4: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object R_TLPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        mmLeft = 164307
        mmTop = 0
        mmWidth = 11113
        BandType = 8
        LayerName = Foreground3
      end
      object R_TLKaikeiName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        LayerName = Foreground3
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'RL_Kensu'
      BreakType = btCustomField
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      NewFile = False
      object ppGroupHeaderBand4: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers4: TppDesignLayers
      object ppDesignLayer4: TppDesignLayer
        UserName = 'Foreground3'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
  object RPipeline_TaikeiList: TppDBPipeline
    DataSource = DataSource_TaikeiList
    UserName = 'RPipeline_JitsuKan1'
    Left = 29
    Top = 300
    object RPipeline_TaikeiListppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object RPipeline_TaikeiListppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'T_KMCode'
      FieldName = 'T_KMCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object RPipeline_TaikeiListppField3: TppField
      FieldAlias = 'T_KMKanryaku'
      FieldName = 'T_KMKanryaku'
      FieldLength = 14
      DisplayWidth = 14
      Position = 2
    end
    object RPipeline_TaikeiListppField4: TppField
      FieldAlias = 'T_Add01'
      FieldName = 'T_Add01'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object RPipeline_TaikeiListppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'T_KSCode01'
      FieldName = 'T_KSCode01'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object RPipeline_TaikeiListppField6: TppField
      FieldAlias = 'T_KSName01'
      FieldName = 'T_KSName01'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object RPipeline_TaikeiListppField7: TppField
      FieldAlias = 'T_Add02'
      FieldName = 'T_Add02'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object RPipeline_TaikeiListppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'T_KSCode02'
      FieldName = 'T_KSCode02'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object RPipeline_TaikeiListppField9: TppField
      FieldAlias = 'T_KSName02'
      FieldName = 'T_KSName02'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object RPipeline_TaikeiListppField10: TppField
      FieldAlias = 'T_Add03'
      FieldName = 'T_Add03'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object RPipeline_TaikeiListppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'T_KSCode03'
      FieldName = 'T_KSCode03'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object RPipeline_TaikeiListppField12: TppField
      FieldAlias = 'T_KSName03'
      FieldName = 'T_KSName03'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
  end
  object DataSource_TaikeiList: TDataSource
    DataSet = MemPrint_TaikeiList
    Left = 57
    Top = 300
  end
  object RJitsuzai_K: TppReport
    AutoStop = False
    DataPipeline = RPipeline_JitsuKan
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
    Template.FileName = 'D:\Delphi\MADJ\ADJ0350\adj0350rb.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = BeforePrint
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
    Left = 1
    Top = 341
    Version = '19.04'
    mmColumnWidth = 339067
    DataPipelineName = 'RPipeline_JitsuKan'
    object ppTitleBand5: TppTitleBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand5: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppLine88: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        LayerName = Foreground4
      end
      object ppLabel7: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer5
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #23455#22312#31185#30446#30331#37682#12522#12473#12488
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
        LayerName = Foreground4
      end
      object RSV_JitsuK_Date: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'SVppDate'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        VarType = vtDateTime
        DisplayFormat = 'yyyy/mm/dd hh:mm'
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
        LayerName = Foreground4
      end
      object RL_Jitsu_CorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'LppCorpCode1'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmLeft = 1588
        mmTop = 0
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground4
      end
      object RL_JitsuK_CorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        LayerName = Foreground4
      end
      object ppLabel58: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'RLKamokuName'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmLeft = 33604
        mmTop = 17466
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel60: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'RLKamokuName1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#24335#31185#30446#21517
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
        mmLeft = 48006
        mmTop = 17466
        mmWidth = 38405
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine89: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 45187
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine90: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 85192
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine91: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line10'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 109195
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine92: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line101'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 158801
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine93: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line14'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 275616
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel61: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label61'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#31185#30446#21517
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
        mmLeft = 88011
        mmTop = 17466
        mmWidth = 22403
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel86: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pL_Renso'
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
        mmLeft = 112014
        mmTop = 17466
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel87: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pL_Bunseki'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#26512#12467#12540#12489
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
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
        mmLeft = 129616
        mmTop = 17466
        mmWidth = 30404
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel91: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label2'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #24615#26684#12467#12540#12489
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
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
        mmLeft = 161621
        mmTop = 17466
        mmWidth = 28804
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine102: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 190805
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine103: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line103'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 198806
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel119: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label13'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#27531
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmLeft = 193625
        mmTop = 17466
        mmWidth = 6401
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine104: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line104'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 206807
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel120: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label14'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65314#65328
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmLeft = 201626
        mmTop = 17466
        mmWidth = 6401
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine105: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line105'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 126797
        mmTop = 16937
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel114: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label15'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #26399#39318#27531
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmLeft = 209627
        mmTop = 17466
        mmWidth = 9601
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine106: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line106'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 218009
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel117: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label102'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20511#26041#36039#37329#32368#12467#12540#12489
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
        mmLeft = 220828
        mmTop = 17466
        mmWidth = 25603
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine107: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line107'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 246812
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel118: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label20'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36024#26041#36039#37329#32368#12467#12540#12489
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
        mmLeft = 249632
        mmTop = 17466
        mmWidth = 25603
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel133: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label34'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #35013#39166
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
        mmLeft = 278435
        mmTop = 17466
        mmWidth = 8001
        BandType = 0
        LayerName = Foreground4
      end
      object ppLineJK_Top: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'LineJK_Top'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2540
        mmLeft = 32791
        mmTop = 16937
        mmWidth = 254458
        BandType = 0
        LayerName = Foreground4
      end
      object ppLineJK_Left: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'LineJK_Left'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 32791
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLineJK_Right: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'LineJK_Right'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 285217
        mmTop = 16934
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLineJK_Bottom: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'LineJK_Bottom'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 32791
        mmTop = 16942
        mmWidth = 254458
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel41: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12304#31777#30053#22411#12305
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
        mmLeft = 218811
        mmTop = 4233
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground4
      end
    end
    object ppDetailBand_JitsuK: TppDetailBand
      BeforeGenerate = ppDetailBand_JitsuKBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4234
      mmPrintPosition = 0
      object ppUnderLineJK: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 32791
        mmTop = 0
        mmWidth = 254458
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText14: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_Code'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 33604
        mmTop = 445
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText16: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_Seishiki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_LongName'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 48006
        mmTop = 445
        mmWidth = 38405
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText52: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_SimpleName'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 88011
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText53: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_Renso'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 112014
        mmTop = 445
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText54: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_Bunseki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_BunsekiCode'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 129616
        mmTop = 445
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText55: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_Seikaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_SeikakuCode'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 161621
        mmTop = 445
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText57: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_BunsekiName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_BunsekiName'
        DataPipeline = RPipeline_JitsuKan
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 137617
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText61: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_SeikakuName'
        DataPipeline = RPipeline_JitsuKan
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 166421
        mmTop = 445
        mmWidth = 25603
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine95: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 85192
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine96: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 109195
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText110: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_Hojo1Name1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_BPKbn'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 201626
        mmTop = 445
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText117: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_Hojo2Name1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_Kisyuzan'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 209627
        mmTop = 445
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText124: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_SaimokuName1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_Seizan'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 193625
        mmTop = 445
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine97: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 32791
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine98: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line8'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 285217
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText125: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_KariKuri'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_KariKuriCode'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 220828
        mmTop = 445
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText126: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_KashiKuri'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_KashiKuriCode'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 249632
        mmTop = 445
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText129: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_KashiKuriName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_KashiKuriName'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 254432
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText130: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'pDT_KariKuriName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_KariKuriName'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 225629
        mmTop = 445
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine99: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line9'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 158801
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText142: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText17'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'J_Sousyoku'
        DataPipeline = RPipeline_JitsuKan
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
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3175
        mmLeft = 278435
        mmTop = 445
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine100: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line12'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 190805
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine101: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line13'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 198806
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine108: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line108'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 45187
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine109: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line109'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 126797
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine110: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line110'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 275616
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine111: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line111'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 246812
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine112: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line112'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 218009
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine113: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line113'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 206807
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object RImageJitsuFusen: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'RImageJitsuFusen'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'J_Fusen'
        DataPipeline = RPipeline_JitsuKan
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline_JitsuKan'
        mmHeight = 3969
        mmLeft = 27203
        mmTop = 132
        mmWidth = 4801
        BandType = 4
        LayerName = Foreground4
      end
    end
    object ppFooterBand5: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RSV_JitsuK_Page: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        LayerName = Foreground4
      end
      object RL_JitsuK_Kaikei: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        LayerName = Foreground4
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'LKensu'
      BreakType = btCustomField
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      NewFile = False
      object ppGroupHeaderBand5: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 3440
        mmPrintPosition = 0
        object LJitsu_Kensu: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer5
          UserName = 'LKensu'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = '9,999 '#20214
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Name = #65325#65331' '#26126#26397
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taRightJustified
          Transparent = True
          Distributed = False
          Layout = tlTop
          Distributed2 = False
          mmHeight = 3175
          mmLeft = 40218
          mmTop = 0
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppLabel150: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer5
          UserName = 'LGouLeft'
          HyperlinkEnabled = False
          Border.mmPadding = 0
          Caption = #8251#8251
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
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
          mmLeft = 33604
          mmTop = 0
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppLabel151: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer5
          UserName = 'LGouRight'
          HyperlinkEnabled = False
          Border.mmPadding = 0
          Caption = #8251#8251
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
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
          mmLeft = 55829
          mmTop = 0
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
      end
    end
    object ppDesignLayers5: TppDesignLayers
      object ppDesignLayer5: TppDesignLayer
        UserName = 'Foreground4'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList5: TppParameterList
    end
  end
  object RPipeline_JitsuKan: TppDBPipeline
    DataSource = DataSource_JitsuKan
    UserName = 'RPipeline_JitsuKan'
    Left = 29
    Top = 341
    object RPipeline_JitsuKanppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object RPipeline_JitsuKanppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'J_Code'
      FieldName = 'J_Code'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object RPipeline_JitsuKanppField3: TppField
      FieldAlias = 'J_LongName'
      FieldName = 'J_LongName'
      FieldLength = 24
      DisplayWidth = 24
      Position = 2
    end
    object RPipeline_JitsuKanppField4: TppField
      FieldAlias = 'J_SimpleName'
      FieldName = 'J_SimpleName'
      FieldLength = 14
      DisplayWidth = 14
      Position = 3
    end
    object RPipeline_JitsuKanppField5: TppField
      FieldAlias = 'J_Renso'
      FieldName = 'J_Renso'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object RPipeline_JitsuKanppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'J_BunsekiCode'
      FieldName = 'J_BunsekiCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object RPipeline_JitsuKanppField7: TppField
      FieldAlias = 'J_BunsekiName'
      FieldName = 'J_BunsekiName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object RPipeline_JitsuKanppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'J_SeikakuCode'
      FieldName = 'J_SeikakuCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object RPipeline_JitsuKanppField9: TppField
      FieldAlias = 'J_SeikakuName'
      FieldName = 'J_SeikakuName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object RPipeline_JitsuKanppField10: TppField
      FieldAlias = 'J_Seizan'
      FieldName = 'J_Seizan'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object RPipeline_JitsuKanppField11: TppField
      FieldAlias = 'J_BPKbn'
      FieldName = 'J_BPKbn'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object RPipeline_JitsuKanppField12: TppField
      FieldAlias = 'J_Kisyuzan'
      FieldName = 'J_Kisyuzan'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object RPipeline_JitsuKanppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'J_KariKuriCode'
      FieldName = 'J_KariKuriCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
    object RPipeline_JitsuKanppField14: TppField
      FieldAlias = 'J_KariKuriName'
      FieldName = 'J_KariKuriName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object RPipeline_JitsuKanppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'J_KashiKuriCode'
      FieldName = 'J_KashiKuriCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object RPipeline_JitsuKanppField16: TppField
      FieldAlias = 'J_KashiKuriName'
      FieldName = 'J_KashiKuriName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object RPipeline_JitsuKanppField17: TppField
      FieldAlias = 'J_Sousyoku'
      FieldName = 'J_Sousyoku'
      FieldLength = 20
      DisplayWidth = 20
      Position = 16
    end
    object RPipeline_JitsuKanppField18: TppField
      FieldAlias = 'J_Fusen'
      FieldName = 'J_Fusen'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 17
      Searchable = False
      Sortable = False
    end
  end
  object DataSource_JitsuKan: TDataSource
    DataSet = MemPrint_JitsuKan
    Left = 57
    Top = 341
  end
  object RTaikei: TppReport
    AutoStop = False
    DataPipeline = RPipeline_Taikei
    OnEndPage = RTaikeiEndPage
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
    Template.FileName = 
      'D:\MJS FX-STYLE SOURCE\SOURCE\000_RTM\'#31185#30446#12304#31185#30446#20307#31995#30331#37682#12522#12473#12488#12305'(JNTCRP009001' +
      ').rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = BeforePrint
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
    Left = 1
    Top = 386
    Version = '19.04'
    mmColumnWidth = 339067
    DataPipelineName = 'RPipeline_Taikei'
    object ppTitleBand6: TppTitleBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand6: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 20109
      mmPrintPosition = 0
      object ppLine47: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        LayerName = Foreground5
      end
      object ppLabel24: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31185#30446#20307#31995#30331#37682#12522#12473#12488
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
        LayerName = Foreground5
      end
      object R_TDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'SVppDate'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        VarType = vtDateTime
        DisplayFormat = 'yyyy/mm/dd hh:mm'
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
        LayerName = Foreground5
      end
      object R_TCorpNo: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        LayerName = Foreground5
      end
      object R_TCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        LayerName = Foreground5
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforeGenerate = ppDetailBand_TaikeiBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLineBottom: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Visible = False
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 8202
        mmTop = 0
        mmWidth = 319312
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine85: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Visible = False
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 8128
        mmTop = 0
        mmWidth = 3969
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Code: TppDBText
        OnPrint = ppDBText_TR_CodePrint
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Code'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 12428
        mmTop = 445
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_SName: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SimpleName'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 19629
        mmTop = 445
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_AddKbn01: TppDBText
        OnPrint = ppDBText_TR_AddKbn01Print
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_AddKbn01'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'AddKbn01'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 40432
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Code01: TppDBText
        Tag = 1
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Code01'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Code01'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 44407
        mmTop = 445
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Name01: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Name01'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Name01'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 51608
        mmTop = 445
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine145: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line55'
        Border.mmPadding = 0
        Position = lpLeft
        Visible = False
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 327440
        mmTop = 0
        mmWidth = 2646
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_AddKbn02: TppDBText
        OnPrint = ppDBText_TR_AddKbn02Print
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_AddKbn02'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'AddKbn02'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 72410
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Code02: TppDBText
        Tag = 2
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Code02'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Code02'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 76386
        mmTop = 445
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Name02: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Name02'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Name02'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 83586
        mmTop = 445
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_AddKbn03: TppDBText
        OnPrint = ppDBText_TR_AddKbn03Print
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_AddKbn03'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'AddKbn03'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 104389
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Code03: TppDBText
        Tag = 3
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Code03'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Code03'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 108364
        mmTop = 445
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Name03: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Name03'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Name03'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 115565
        mmTop = 445
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_AddKbn04: TppDBText
        OnPrint = ppDBText_TR_AddKbn04Print
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_AddKbn04'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'AddKbn04'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 136368
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Code04: TppDBText
        Tag = 4
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Code04'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Code04'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 140343
        mmTop = 445
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Name04: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Name04'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Name04'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 147544
        mmTop = 445
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_AddKbn05: TppDBText
        OnPrint = ppDBText_TR_AddKbn05Print
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_AddKbn05'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'AddKbn05'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 168346
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Code05: TppDBText
        Tag = 5
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Code05'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Code05'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 172322
        mmTop = 445
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Name05: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Name05'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Name05'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 179522
        mmTop = 445
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_AddKbn06: TppDBText
        OnPrint = ppDBText_TR_AddKbn06Print
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_AddKbn06'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'AddKbn06'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 200325
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Code06: TppDBText
        Tag = 6
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Code06'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Code06'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 204300
        mmTop = 445
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Name06: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Name06'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Name06'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 211501
        mmTop = 445
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_AddKbn07: TppDBText
        OnPrint = ppDBText_TR_AddKbn07Print
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_AddKbn07'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'AddKbn07'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 232304
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Code07: TppDBText
        Tag = 7
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Code07'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Code07'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 236279
        mmTop = 445
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Name07: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Name07'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Name07'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 243480
        mmTop = 445
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_AddKbn08: TppDBText
        OnPrint = ppDBText_TR_AddKbn08Print
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_AddKbn08'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'AddKbn08'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 264282
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Code08: TppDBText
        Tag = 8
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Code08'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Code08'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 268258
        mmTop = 445
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Name08: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Name08'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Name08'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 275458
        mmTop = 445
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_AddKbn09: TppDBText
        OnPrint = ppDBText_TR_AddKbn09Print
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_AddKbn09'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'AddKbn09'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 296261
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Code09: TppDBText
        Tag = 9
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Code09'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Code09'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 300236
        mmTop = 445
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText_TR_Name09: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'DBText_TR_Name09'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Name09'
        DataPipeline = RPipeline_Taikei
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
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3175
        mmLeft = 307437
        mmTop = 445
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_101: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_101'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 39632
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_102: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line1403'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 39632
        mmTop = 2116
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_101: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line1404'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 38837
        mmTop = 0
        mmWidth = 794
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_102: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line1405'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 39632
        mmTop = 0
        mmWidth = 794
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_201: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_201'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2116
        mmLeft = 70810
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_202: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_202'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 71610
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_202: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_202'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 71610
        mmTop = 2116
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_301: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_301'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 103589
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_302: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_302'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 103589
        mmTop = 2116
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_301: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_301'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 102789
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_302: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_302'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 103589
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_401: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_401'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 135568
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_402: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_402'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 135568
        mmTop = 2116
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_401: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_401'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 134768
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_402: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_402'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 135568
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_501: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_501'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 167546
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_502: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_502'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 167546
        mmTop = 2116
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_501: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_501'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 166746
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_502: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_502'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 167546
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_601: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_601'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 199525
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_602: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_602'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 199525
        mmTop = 2116
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_601: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_601'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 198725
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_602: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_602'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 199525
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_701: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_701'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 231504
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_702: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_702'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 231504
        mmTop = 2116
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_701: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_701'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 230704
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_702: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_702'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 231504
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_801: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line801'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 263482
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_802: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_802'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2116
        mmLeft = 263482
        mmTop = 2116
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_802: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_802'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 263482
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_801: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_801'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 262682
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_901: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line802'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 295461
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_902: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_902'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 295461
        mmTop = 2116
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_902: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_902'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 295461
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineYoko_901: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineYoko_901'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 294661
        mmTop = 0
        mmWidth = 795
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBImage_01: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBImage_01'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Bitmap01'
        DataPipeline = RPipeline_Taikei
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3556
        mmLeft = 40894
        mmTop = 447
        mmWidth = 3302
        BandType = 4
        LayerName = Foreground5
      end
      object ppLineTate_201: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'LineTate_201'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 71610
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBImage_02: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBImage_02'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Bitmap02'
        DataPipeline = RPipeline_Taikei
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3440
        mmLeft = 72873
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBImage_03: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBImage_03'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Bitmap03'
        DataPipeline = RPipeline_Taikei
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3440
        mmLeft = 104851
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBImage_04: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBImage_04'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Bitmap04'
        DataPipeline = RPipeline_Taikei
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3440
        mmLeft = 136830
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBImage_05: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBImage_05'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Bitmap05'
        DataPipeline = RPipeline_Taikei
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3440
        mmLeft = 168809
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBImage_06: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBImage_06'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Bitmap06'
        DataPipeline = RPipeline_Taikei
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3440
        mmLeft = 200787
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBImage_07: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBImage_07'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Bitmap07'
        DataPipeline = RPipeline_Taikei
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3440
        mmLeft = 232766
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBImage_08: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBImage_08'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Bitmap08'
        DataPipeline = RPipeline_Taikei
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3440
        mmLeft = 264745
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBImage_09: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBImage_09'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Bitmap09'
        DataPipeline = RPipeline_Taikei
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3440
        mmLeft = 296723
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBImage: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBImage'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'BitmapTop'
        DataPipeline = RPipeline_Taikei
        GraphicType = 'Bitmap'
        DataPipelineName = 'RPipeline_Taikei'
        mmHeight = 3440
        mmLeft = 8996
        mmTop = 445
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground5
      end
      object ppLabel29: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Label2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = '*'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmLeft = 326761
        mmTop = 529
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground5
      end
    end
    object ppFooterBand6: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5291
      mmPrintPosition = 0
      object R_TPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        mmLeft = 163777
        mmTop = 1323
        mmWidth = 11113
        BandType = 8
        LayerName = Foreground5
      end
      object R_TKaikeiName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        mmTop = 1270
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground5
      end
    end
    object ppPageStyle1: TppPageStyle
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 237066
      mmPrintPosition = 0
      object ppShape1: TppShape
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Shape1'
        Pen.Width = 2
        mmHeight = 214630
        mmLeft = 2647
        mmTop = 21961
        mmWidth = 326496
        BandType = 10
        LayerName = PageLayer1
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'RL_Kensu'
      BreakType = btCustomField
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      NewFile = False
      object ppGroupHeaderBand6: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 3970
        mmPrintPosition = 0
        object ppLine86: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer6
          UserName = 'Line86'
          Border.mmPadding = 0
          Position = lpBottom
          Visible = False
          Weight = 0.750000000000000000
          EllipseSize = 50
          mmHeight = 3970
          mmLeft = 8128
          mmTop = 0
          mmWidth = 319312
          BandType = 3
          GroupNo = 0
          LayerName = Foreground5
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers6: TppDesignLayers
      object ppDesignLayer7: TppDesignLayer
        UserName = 'PageLayer1'
        LayerType = ltPage
        Index = 0
      end
      object ppDesignLayer6: TppDesignLayer
        UserName = 'Foreground5'
        LayerType = ltBanded
        Index = 1
      end
    end
    object ppParameterList6: TppParameterList
    end
  end
  object RPipeline_Taikei: TppDBPipeline
    DataSource = DataSource_Taikei
    UserName = 'RPipeline_Taikei'
    Left = 29
    Top = 382
    object RPipeline_TaikeippField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object RPipeline_TaikeippField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'Code'
      FieldName = 'Code'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object RPipeline_TaikeippField3: TppField
      FieldAlias = 'SimpleName'
      FieldName = 'SimpleName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object RPipeline_TaikeippField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'Code01'
      FieldName = 'Code01'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object RPipeline_TaikeippField5: TppField
      FieldAlias = 'AddKbn01'
      FieldName = 'AddKbn01'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object RPipeline_TaikeippField6: TppField
      FieldAlias = 'Name01'
      FieldName = 'Name01'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object RPipeline_TaikeippField7: TppField
      FieldAlias = 'MaxEnt01'
      FieldName = 'MaxEnt01'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object RPipeline_TaikeippField8: TppField
      FieldAlias = 'AddKbn02'
      FieldName = 'AddKbn02'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object RPipeline_TaikeippField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'Code02'
      FieldName = 'Code02'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object RPipeline_TaikeippField10: TppField
      FieldAlias = 'Name02'
      FieldName = 'Name02'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object RPipeline_TaikeippField11: TppField
      FieldAlias = 'MaxEnt02'
      FieldName = 'MaxEnt02'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object RPipeline_TaikeippField12: TppField
      FieldAlias = 'AddKbn03'
      FieldName = 'AddKbn03'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object RPipeline_TaikeippField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'Code03'
      FieldName = 'Code03'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
    object RPipeline_TaikeippField14: TppField
      FieldAlias = 'Name03'
      FieldName = 'Name03'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object RPipeline_TaikeippField15: TppField
      FieldAlias = 'MaxEnt03'
      FieldName = 'MaxEnt03'
      FieldLength = 20
      DisplayWidth = 20
      Position = 14
    end
    object RPipeline_TaikeippField16: TppField
      FieldAlias = 'AddKbn04'
      FieldName = 'AddKbn04'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object RPipeline_TaikeippField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'Code04'
      FieldName = 'Code04'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object RPipeline_TaikeippField18: TppField
      FieldAlias = 'Name04'
      FieldName = 'Name04'
      FieldLength = 20
      DisplayWidth = 20
      Position = 17
    end
    object RPipeline_TaikeippField19: TppField
      FieldAlias = 'MaxEnt04'
      FieldName = 'MaxEnt04'
      FieldLength = 20
      DisplayWidth = 20
      Position = 18
    end
    object RPipeline_TaikeippField20: TppField
      FieldAlias = 'AddKbn05'
      FieldName = 'AddKbn05'
      FieldLength = 20
      DisplayWidth = 20
      Position = 19
    end
    object RPipeline_TaikeippField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'Code05'
      FieldName = 'Code05'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 20
    end
    object RPipeline_TaikeippField22: TppField
      FieldAlias = 'Name05'
      FieldName = 'Name05'
      FieldLength = 20
      DisplayWidth = 20
      Position = 21
    end
    object RPipeline_TaikeippField23: TppField
      FieldAlias = 'MaxEnt05'
      FieldName = 'MaxEnt05'
      FieldLength = 20
      DisplayWidth = 20
      Position = 22
    end
    object RPipeline_TaikeippField24: TppField
      FieldAlias = 'AddKbn06'
      FieldName = 'AddKbn06'
      FieldLength = 20
      DisplayWidth = 20
      Position = 23
    end
    object RPipeline_TaikeippField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'Code06'
      FieldName = 'Code06'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
    object RPipeline_TaikeippField26: TppField
      FieldAlias = 'Name06'
      FieldName = 'Name06'
      FieldLength = 20
      DisplayWidth = 20
      Position = 25
    end
    object RPipeline_TaikeippField27: TppField
      FieldAlias = 'MaxEnt06'
      FieldName = 'MaxEnt06'
      FieldLength = 20
      DisplayWidth = 20
      Position = 26
    end
    object RPipeline_TaikeippField28: TppField
      FieldAlias = 'AddKbn07'
      FieldName = 'AddKbn07'
      FieldLength = 20
      DisplayWidth = 20
      Position = 27
    end
    object RPipeline_TaikeippField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'Code07'
      FieldName = 'Code07'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 28
    end
    object RPipeline_TaikeippField30: TppField
      FieldAlias = 'Name07'
      FieldName = 'Name07'
      FieldLength = 20
      DisplayWidth = 20
      Position = 29
    end
    object RPipeline_TaikeippField31: TppField
      FieldAlias = 'MaxEnt07'
      FieldName = 'MaxEnt07'
      FieldLength = 20
      DisplayWidth = 20
      Position = 30
    end
    object RPipeline_TaikeippField32: TppField
      FieldAlias = 'AddKbn08'
      FieldName = 'AddKbn08'
      FieldLength = 20
      DisplayWidth = 20
      Position = 31
    end
    object RPipeline_TaikeippField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'Code08'
      FieldName = 'Code08'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 32
    end
    object RPipeline_TaikeippField34: TppField
      FieldAlias = 'Name08'
      FieldName = 'Name08'
      FieldLength = 20
      DisplayWidth = 20
      Position = 33
    end
    object RPipeline_TaikeippField35: TppField
      FieldAlias = 'MaxEnt08'
      FieldName = 'MaxEnt08'
      FieldLength = 20
      DisplayWidth = 20
      Position = 34
    end
    object RPipeline_TaikeippField36: TppField
      FieldAlias = 'AddKbn09'
      FieldName = 'AddKbn09'
      FieldLength = 20
      DisplayWidth = 20
      Position = 35
    end
    object RPipeline_TaikeippField37: TppField
      FieldAlias = 'Name09'
      FieldName = 'Name09'
      FieldLength = 20
      DisplayWidth = 20
      Position = 36
    end
    object RPipeline_TaikeippField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'Code09'
      FieldName = 'Code09'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 37
    end
    object RPipeline_TaikeippField39: TppField
      FieldAlias = 'MaxEnt09'
      FieldName = 'MaxEnt09'
      FieldLength = 20
      DisplayWidth = 20
      Position = 38
    end
    object RPipeline_TaikeippField40: TppField
      FieldAlias = 'BitmapTop'
      FieldName = 'BitmapTop'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 39
      Searchable = False
      Sortable = False
    end
    object RPipeline_TaikeippField41: TppField
      FieldAlias = 'Bitmap01'
      FieldName = 'Bitmap01'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 40
      Searchable = False
      Sortable = False
    end
    object RPipeline_TaikeippField42: TppField
      FieldAlias = 'Bitmap02'
      FieldName = 'Bitmap02'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 41
      Searchable = False
      Sortable = False
    end
    object RPipeline_TaikeippField43: TppField
      FieldAlias = 'Bitmap03'
      FieldName = 'Bitmap03'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 42
      Searchable = False
      Sortable = False
    end
    object RPipeline_TaikeippField44: TppField
      FieldAlias = 'Bitmap04'
      FieldName = 'Bitmap04'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 43
      Searchable = False
      Sortable = False
    end
    object RPipeline_TaikeippField45: TppField
      FieldAlias = 'Bitmap05'
      FieldName = 'Bitmap05'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 44
      Searchable = False
      Sortable = False
    end
    object RPipeline_TaikeippField46: TppField
      FieldAlias = 'Bitmap06'
      FieldName = 'Bitmap06'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 45
      Searchable = False
      Sortable = False
    end
    object RPipeline_TaikeippField47: TppField
      FieldAlias = 'Bitmap07'
      FieldName = 'Bitmap07'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 46
      Searchable = False
      Sortable = False
    end
    object RPipeline_TaikeippField48: TppField
      FieldAlias = 'Bitmap08'
      FieldName = 'Bitmap08'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 47
      Searchable = False
      Sortable = False
    end
    object RPipeline_TaikeippField49: TppField
      FieldAlias = 'Bitmap09'
      FieldName = 'Bitmap09'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 48
      Searchable = False
      Sortable = False
    end
    object RPipeline_TaikeippField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'SumKbn09'
      FieldName = 'SumKbn09'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 49
    end
  end
  object DataSource_Taikei: TDataSource
    DataSet = MemPrint_Taikei
    Left = 57
    Top = 382
  end
  object RPipeline_Ichiran: TppDBPipeline
    DataSource = DataSource_Ichiran
    UserName = 'RPipeline_Ichiran'
    Left = 29
    Top = 425
    object RPipeline_IchiranppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object RPipeline_IchiranppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'Ichi_KmkCode'
      FieldName = 'Ichi_KmkCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object RPipeline_IchiranppField3: TppField
      FieldAlias = 'Ichi_KmkName'
      FieldName = 'Ichi_KmkName'
      FieldLength = 20
      DisplayWidth = 14
      Position = 2
    end
  end
  object DataSource_Ichiran: TDataSource
    DataSet = MemPrint_Ichiran
    Left = 57
    Top = 425
  end
  object RHendo: TppReport
    AutoStop = False
    Columns = 3
    ColumnPositions.Strings = (
      '0'
      '113023'
      '226045'
      '0')
    DataPipeline = RPipeline_Hendo
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
    Template.FileName = 'D:\Delphi\MADJ\ADJ0350\adj0350rb.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = BeforePrint
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
    Left = 1
    Top = 464
    Version = '19.04'
    mmColumnWidth = 112355
    DataPipelineName = 'RPipeline_Hendo'
    object ppTitleBand8: TppTitleBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand8: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLine73: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        LayerName = Foreground6
      end
      object ppLabel22: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer8
        UserName = 'Label1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #22793#21205#25613#30410#38306#20418#12522#12473#12488
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
        LayerName = Foreground6
      end
      object R_HDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'SVppDate'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        VarType = vtDateTime
        DisplayFormat = 'yyyy/mm/dd hh:mm'
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
        LayerName = Foreground6
      end
      object R_HCorpNo: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        LayerName = Foreground6
      end
      object R_HCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        LayerName = Foreground6
      end
    end
    object ppColumnHeaderBand3: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4234
      mmPrintPosition = 0
      object ppLine78: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'LineT_Bottom'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 787
        mmTop = 0
        mmWidth = 110439
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine83: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'LineT_Top'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2032
        mmLeft = 787
        mmTop = 0
        mmWidth = 110439
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine87: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'LineT_Right1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 94793
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine147: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 37186
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel45: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'RLKamokuName'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmLeft = 1600
        mmTop = 445
        mmWidth = 12802
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine149: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line52'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 13183
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel46: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Label2'
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
        mmLeft = 16002
        mmTop = 445
        mmWidth = 22490
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel49: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Label29'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #22793#21205#36027
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
        mmLeft = 40005
        mmTop = 445
        mmWidth = 27203
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine151: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'LineT_Left'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 787
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine152: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'LineT_Right'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 109195
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel56: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Label28'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #22266#23450#36027
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
        mmLeft = 68809
        mmTop = 529
        mmWidth = 27203
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel57: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Label4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #22793#21205#27604#29575
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
        mmLeft = 97612
        mmTop = 529
        mmWidth = 12802
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine155: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line75'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 65989
        mmTop = 0
        mmWidth = 2032
        BandType = 2
        LayerName = Foreground6
      end
    end
    object ppDetailBand_Hendo: TppDetailBand
      BeforeGenerate = ppDetailBand_HendoBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4234
      mmPrintPosition = 0
      object UnderLine_Hendo: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 787
        mmTop = 0
        mmWidth = 110439
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine159: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 787
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText15: TppDBText
        OnPrint = ppDBTextCodePrint
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'H_KMCode'
        DataPipeline = RPipeline_Hendo
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
        DataPipelineName = 'RPipeline_Hendo'
        mmHeight = 3175
        mmLeft = 1600
        mmTop = 445
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine160: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line51'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 13183
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText18: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'H_KMKanryaku'
        DataPipeline = RPipeline_Hendo
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
        DataPipelineName = 'RPipeline_Hendo'
        mmHeight = 3175
        mmLeft = 16002
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine161: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 37186
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText20: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'pDT_BumonName1'
        HyperlinkEnabled = False
        BlankWhenZero = True
        Border.mmPadding = 0
        DataField = 'H_HendoCode'
        DataPipeline = RPipeline_Hendo
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65322#65331#21360#21047#12501#12457#12531#12488
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstWhiteTraiangle
        DataPipelineName = 'RPipeline_Hendo'
        mmHeight = 3175
        mmLeft = 40005
        mmTop = 529
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine163: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 41986
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText22: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText101'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'H_HendoName'
        DataPipeline = RPipeline_Hendo
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
        DataPipelineName = 'RPipeline_Hendo'
        mmHeight = 3175
        mmLeft = 44806
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine164: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line55'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 109195
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine165: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line64'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 65989
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText23: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText2'
        HyperlinkEnabled = False
        BlankWhenZero = True
        Border.mmPadding = 0
        DataField = 'H_KoteiCode'
        DataPipeline = RPipeline_Hendo
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65322#65331#21360#21047#12501#12457#12531#12488
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstWhiteTraiangle
        DataPipelineName = 'RPipeline_Hendo'
        mmHeight = 3175
        mmLeft = 68809
        mmTop = 529
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine166: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line66'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 70790
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText24: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'H_KoteiName'
        DataPipeline = RPipeline_Hendo
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
        DataPipelineName = 'RPipeline_Hendo'
        mmHeight = 3175
        mmLeft = 73609
        mmTop = 445
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText26: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'H_HendoRate'
        DataPipeline = RPipeline_Hendo
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
        DataPipelineName = 'RPipeline_Hendo'
        mmHeight = 3175
        mmLeft = 97612
        mmTop = 445
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine169: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line74'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 94793
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground6
      end
    end
    object ppColumnFooterBand3: TppColumnFooterBand
      AlignToBottom = True
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand8: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object R_HPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        mmLeft = 164307
        mmTop = 0
        mmWidth = 11113
        BandType = 8
        LayerName = Foreground6
      end
      object R_HKaikeiName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 304801
        mmTop = 0
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground6
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'RL_Kensu'
      BreakType = btCustomField
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      NewFile = False
      object ppGroupHeaderBand8: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers7: TppDesignLayers
      object ppDesignLayer8: TppDesignLayer
        UserName = 'Foreground6'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList7: TppParameterList
    end
  end
  object RPipeline_Hendo: TppDBPipeline
    DataSource = DataSource_Hendo
    UserName = 'RPipeline_Hendo'
    Left = 29
    Top = 467
    object RPipeline_HendoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object RPipeline_HendoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'H_KMCode'
      FieldName = 'H_KMCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object RPipeline_HendoppField3: TppField
      FieldAlias = 'H_KMKanryaku'
      FieldName = 'H_KMKanryaku'
      FieldLength = 14
      DisplayWidth = 14
      Position = 2
    end
    object RPipeline_HendoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'H_HendoCode'
      FieldName = 'H_HendoCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object RPipeline_HendoppField5: TppField
      FieldAlias = 'H_HendoName'
      FieldName = 'H_HendoName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object RPipeline_HendoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'H_KoteiCode'
      FieldName = 'H_KoteiCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object RPipeline_HendoppField7: TppField
      FieldAlias = 'H_KoteiName'
      FieldName = 'H_KoteiName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object RPipeline_HendoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'H_HendoRate'
      FieldName = 'H_HendoRate'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object DataSource_Hendo: TDataSource
    DataSet = MemPrint_Hendo
    Left = 57
    Top = 467
  end
  object RIchiran: TppReport
    AutoStop = False
    Columns = 7
    ColumnPositions.Strings = (
      '20000'
      '60056'
      '100112'
      '140168'
      '180224'
      '220279'
      '260335')
    DataPipeline = RPipeline_Ichiran
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RReport1'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 6998
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 6998
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
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
    Template.FileName = 'D:\Delphi\MADJ\ADJ0350\adj0350rb.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = BeforePrint
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
    Left = 1
    Top = 424
    Version = '19.04'
    mmColumnWidth = 40056
    DataPipelineName = 'RPipeline_Ichiran'
    object ppTitleBand7: TppTitleBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand7: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 20108
      mmPrintPosition = 0
      object ppLine61: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 139700
        mmTop = 12171
        mmWidth = 59002
        BandType = 0
        LayerName = Foreground7
      end
      object pL_IchiTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Label1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23455#22312#31185#30446#12467#12540#12489#19968#35239
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
        mmLeft = 140759
        mmTop = 8202
        mmWidth = 57150
        BandType = 0
        LayerName = Foreground7
      end
      object R_IchiDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'SVppDate'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        VarType = vtDateTime
        DisplayFormat = 'yyyy/mm/dd hh:mm'
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
        mmLeft = 279665
        mmTop = 0
        mmWidth = 56886
        BandType = 0
        LayerName = Foreground7
      end
      object R_IchiCorpNo: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
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
        mmLeft = 265
        mmTop = 529
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground7
      end
      object R_IchiCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
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
        mmLeft = 9525
        mmTop = 529
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground7
      end
    end
    object ppColumnHeaderBand2: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLine69: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line69'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 38491
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine63: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line63'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 38629
        BandType = 2
        LayerName = Foreground7
      end
      object ppLabel42: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'RLKamokuName'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmLeft = 800
        mmTop = 445
        mmWidth = 12802
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine80: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line52'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 14402
        mmTop = 0
        mmWidth = 2646
        BandType = 2
        LayerName = Foreground7
      end
      object ppLabel43: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Label2'
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
        mmLeft = 15202
        mmTop = 445
        mmWidth = 22490
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine81: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'LineT_Left'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 7938
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine82: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'LineT_Right'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4928
        mmLeft = 38629
        mmTop = 0
        mmWidth = 2646
        BandType = 2
        LayerName = Foreground7
      end
    end
    object ppDetailBand_Ichi: TppDetailBand
      BeforeGenerate = ppDetailBand_IchiBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object UnderLine_Ichi: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 38497
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine94: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 3969
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText11: TppDBText
        OnPrint = ppDBTextCodePrint
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Ichi_KmkCode'
        DataPipeline = RPipeline_Ichiran
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
        DataPipelineName = 'RPipeline_Ichiran'
        mmHeight = 3175
        mmLeft = 800
        mmTop = 445
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine140: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line51'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 14402
        mmTop = 0
        mmWidth = 2646
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText12: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Ichi_KmkName'
        DataPipeline = RPipeline_Ichiran
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
        DataPipelineName = 'RPipeline_Ichiran'
        mmHeight = 3175
        mmLeft = 15202
        mmTop = 445
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine146: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line2'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 38629
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground7
      end
    end
    object ppColumnFooterBand2: TppColumnFooterBand
      AlignToBottom = True
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand7: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object R_IchiPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
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
        mmLeft = 164307
        mmTop = 0
        mmWidth = 11113
        BandType = 8
        LayerName = Foreground7
      end
      object R_IchiKaikeiName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
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
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 304801
        mmTop = 0
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground7
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'RL_Kensu'
      BreakType = btCustomField
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      NewFile = False
      object ppGroupHeaderBand7: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppDesignLayers8: TppDesignLayers
      object ppDesignLayer9: TppDesignLayer
        UserName = 'Foreground7'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList8: TppParameterList
    end
  end
  object SPMasKmk: TFDStoredProc
    StoredProcName = 'MP_MAS_CHK_KMKMA'
    Left = 8
    Top = 520
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
    Left = 40
    Top = 520
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
    Left = 72
    Top = 520
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
    Left = 105
    Top = 520
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
  object SPMsHistParent: TFDStoredProc
    StoredProcName = 'MP_MSHIST_SETINFO'
    Left = 138
    Top = 520
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
end
