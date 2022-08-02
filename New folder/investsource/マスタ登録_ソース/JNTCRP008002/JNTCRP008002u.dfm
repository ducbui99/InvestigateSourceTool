object JNTCRP008002f: TJNTCRP008002f
  Left = 204
  Top = 156
  Align = alClient
  BorderStyle = bsNone
  Caption = #37504#34892#24773#22577#30331#37682
  ClientHeight = 622
  ClientWidth = 945
  Color = 15921906
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  OnActivate = fnJNTCRP008002fOnActivate
  OnClose = fnJNTCRP008002fOnClose
  OnCloseQuery = fnJNTCRP008002fOnCloseQuery
  OnCreate = fnJNTCRP008002fOnCreate
  OnDestroy = FormDestroy
  OnHide = fnJNTCRP008002fOnHide
  OnShow = fnJNTCRP008002fOnShow
  PixelsPerInch = 96
  TextHeight = 12
  object CmnSplitter: TSplitter
    Left = 200
    Top = 0
    Width = 2
    Height = 583
  end
  object CmnTreeView: TMTreeView
    Left = 0
    Top = 0
    Width = 200
    Height = 583
    Align = alLeft
    DragMode = dmAutomatic
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #65325#65331' '#12468#12471#12483#12463
    Font.Style = []
    HotTrack = True
    Images = CmnTreeViewImage
    Indent = 19
    ParentFont = False
    ReadOnly = True
    RightClickSelect = True
    TabOrder = 0
    OnChange = fnCmnTreeViewOnChange
    OnChanging = CmnTreeViewChanging
    OnEnter = fnCmnTreeViewOnEnter
    OnExit = CmnTreeViewExit
  end
  object MSPFunctionBar: TMSPFunctionBar
    Left = 0
    Top = 583
    Width = 945
    Height = 21
    Alignment = taLeftJustify
    FuncColor = 15921906
    Align = alBottom
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #65325#65331' '#12468#12471#12483#12463
    Font.Pitch = fpFixed
    Font.Style = []
    KeyDownEvent = False
    ButtonCount = 8
    ButtonWidth = 118
    FuncAnchors = True
    OnFunctionClick = MSPFunctionBarFunctionClick
    SysBaseColorB = 10841658
    SysBaseColorD = 6956042
  end
  object CmnStatusBar: TStatusBar
    Left = 0
    Top = 604
    Width = 945
    Height = 18
    Color = 15921906
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object CmnPanelClientStandard: TMPanel
    Left = 202
    Top = 0
    Width = 743
    Height = 583
    Align = alClient
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 331
      Width = 743
      Height = 2
      Cursor = crVSplit
      Align = alTop
    end
    object CmnPanelGridHojyoMA: TMPanel
      Left = 0
      Top = 0
      Width = 743
      Height = 331
      Align = alTop
      BevelInner = bvLowered
      Color = 15921906
      ParentBackground = False
      TabOrder = 0
      object CmnGridHojyoMA: TdxDBGrid
        Left = 2
        Top = 22
        Width = 739
        Height = 307
        Bands = <
          item
            MinWidth = 18
            Width = 300
          end
          item
            Caption = #20840#37504#21332#12467#12540#12489
            Width = 110
          end
          item
            Caption = #36899#24819
            Width = 112
          end
          item
            Caption = #37504#34892#21517#31216'/'#12459#12490
            Width = 190
          end
          item
            Caption = #25903#24215#21517#31216'/'#12459#12490
            Width = 163
          end
          item
            Caption = #20241#26085#21517#31216
            Width = 106
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'orderCODE'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnEnter = fnCmnGridHojyoMAOnEnter
        OnExit = CmnGridHojyoMAExit
        OnKeyPress = fnCmnGridHojyoMAOnKeyPress
        OnMouseDown = fnCmnGridHojyoMAOnMouseDown
        OnMouseMove = fnCmnGridHojyoMAOnMouseMove
        BandColor = 10204878
        BandFont.Charset = SHIFTJIS_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -13
        BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BandFont.Style = []
        DataSource = CmnDataSourceHojyoMA
        DblClkExpanding = False
        HeaderColor = 16242875
        HeaderFont.Charset = SHIFTJIS_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        HeaderFont.Style = []
        HideFocusRect = True
        HideSelectionColor = clWindow
        HideSelectionTextColor = clBlack
        HighlightTextColor = clWindowText
        LookAndFeel = lfFlat
        Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoLoadAllRecords, egoIndicator]
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort, egoAnsiSort]
        PreviewFont.Charset = SHIFTJIS_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -13
        PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        PreviewFont.Style = []
        ShowBands = True
        ShowHeader = False
        OnChangeColumn = fnCmnGridHojyoMAOnChangeColumn
        OnChangeNodeEx = fnCmnGridHojyoMAOnChangeNodeEx
        OnBeforeChangeColumn = fnCmnGridHojyoMAOnBeforeChangeColumn
        object CmnGridHojyoMAColumnTag: TdxDBGridGraphicColumn
          Caption = ' '
          HeaderAlignment = taCenter
          MinWidth = 18
          ReadOnly = True
          TabStop = False
          Width = 18
          BandIndex = 0
          RowIndex = 0
          HeaderMaxLineCount = 1
          StretchChar.Auto = False
          FieldName = 'grTag'
          PopupToolBar.Buttons = []
          PopupToolBar.ShowCaptions = False
          PopupToolBar.Visible = False
          PopupToolbarPosStored = False
          ShadowSelection = False
          Stretch = False
        end
        object CmnGridHojyoMAColumnBKCode: TdxDBGridMaskColumn
          Alignment = taRightJustify
          Caption = #37504#34892#12467#12540#12489
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          HeaderAlignment = taCenter
          Visible = False
          Width = 55
          BandIndex = 1
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 4
          StretchChar.Auto = False
          FieldName = 'nBKCODE'
        end
        object CmnGridHojyoMAColumnBRCode: TdxDBGridMaskColumn
          Caption = #25903#24215#12467#12540#12489
          HeaderAlignment = taCenter
          Visible = False
          Width = 55
          BandIndex = 1
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 3
          StretchChar.Auto = False
          FieldName = 'nBrCode'
        end
        object CmnGridHojyoMAColumnBtnBKCode: TdxDBGridButtonColumn
          Caption = #37504#34892#12467#12540#12489
          BandIndex = 1
          RowIndex = 0
          ImeMode = imClose
          MaxLength = 4
          StretchChar.Auto = False
          FieldName = 'nBKCODE'
          ClickKey = 115
          OnEditButtonClick = fnEditBkBtnClick
        end
        object CmnGridHojyoMAColumnBtnBRCode: TdxDBGridButtonColumn
          BandIndex = 1
          RowIndex = 0
          ImeMode = imClose
          MaxLength = 3
          StretchChar.Auto = False
          FieldName = 'nBrCode'
          ClickKey = 115
          OnEditButtonClick = fnEditBrBtnClick
        end
        object CmnGridHojyoMAColumnBKName: TdxDBGridColumn
          Caption = #37504#34892#21517#31216
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          HeaderAlignment = taCenter
          Width = 95
          BandIndex = 3
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 40
          StretchChar.Auto = False
          FieldName = 'strBKName'
        end
        object CmnGridHojyoMAColumnBKKana: TdxDBGridColumn
          Caption = #37504#34892#12459#12490
          HeaderAlignment = taCenter
          Width = 95
          BandIndex = 3
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 15
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'strBkKana'
        end
        object CmnGridHojyoMAColumnBRName: TdxDBGridColumn
          Caption = #25903#24215#21517
          HeaderAlignment = taCenter
          Width = 82
          BandIndex = 4
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 14
          StretchChar.Auto = False
          FieldName = 'strBrName'
        end
        object CmnGridHojyoMAColumnBRKana: TdxDBGridColumn
          Caption = #25903#24215#12459#12490
          Width = 82
          BandIndex = 4
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 15
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'strBrKana'
        end
        object CmnGridHojyoMAColumnComment: TdxDBGridColumn
          Caption = #20184#31627#20633#32771
          ReadOnly = True
          Visible = False
          BandIndex = -1
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'strComment'
        end
        object CmnGridHojyoMAHRCode: TdxDBGridLookupColumn
          Width = 20
          BandIndex = 5
          RowIndex = 0
          ImeMode = imDisable
          MaxLength = 1
          StretchChar.Auto = False
          FieldName = 'OffDCode'
          DropDownSelectEx = False
          ListFieldName = 'CODE;NM'
          ListWidth = 150
        end
        object CmnGridHojyoMAColumnHRBANE: TdxDBGridColumn
          DisableEditor = True
          ReadOnly = True
          TabStop = False
          Width = 92
          BandIndex = 5
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'OffDNm'
        end
        object CmnGridHojyoMAColumnRenso: TdxDBGridColumn
          Width = 112
          BandIndex = 2
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 10
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'strRenso'
        end
      end
      object CmnTabBank: TMTab
        Left = 2
        Top = 2
        Width = 739
        Height = 20
        Items = <
          item
            Caption = 'Caption'
            Color = 16766672
            Alignment = taCenter
            ImageIndex = -1
            ParentBorderCaption = True
          end>
        Enabled = False
        Align = alTop
        TabOrder = 1
        ItemWidth = 0
        ItemHeight = 0
        ItemMargin = 10
        Style = tsGlass
        BorderHeight = 18
        BorderCaption = 'XXXXXXXXXXXXXX'#24773#22577
        BorderFont.Charset = SHIFTJIS_CHARSET
        BorderFont.Color = clWindowText
        BorderFont.Height = -12
        BorderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BorderFont.Style = []
        BorderCaptionAlign = taLeftJustify
        DropShadow = False
      end
    end
    object CmnPanelGridAccInfo: TMPanel
      Left = 0
      Top = 333
      Width = 743
      Height = 250
      Align = alClient
      BevelInner = bvLowered
      Color = 15921906
      ParentBackground = False
      TabOrder = 1
      object CmnGridAccInfo: TdxDBGrid
        Left = 2
        Top = 22
        Width = 739
        Height = 226
        Bands = <
          item
            Caption = #21475#24231
            MinWidth = 18
          end
          item
            Caption = #38928#37329#31278#30446
            Width = 48
          end
          item
            Caption = #21475#24231#30058#21495
          end
          item
            Caption = #20381#38972#20154#12467#12540#12489
          end
          item
            Caption = #25391#36796#20381#38972#20154#21517#31216' '#65288#12459#12490#65289
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'nNCODE'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        PopupMenu = CmnPopupMenuDummy
        TabOrder = 0
        OnKeyDown = fnCmnGridAccInfoOnKeyDown
        OnKeyPress = fnCmnGridAccInfoOnKeyPress
        OnMouseDown = fnCmnGridAccInfoOnMouseDown
        BandColor = 10204878
        BandFont.Charset = SHIFTJIS_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -13
        BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BandFont.Style = []
        DataSource = CmnDataSourceAccInfo
        HeaderColor = 16242875
        HeaderFont.Charset = SHIFTJIS_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        HeaderFont.Style = []
        HideFocusRect = True
        HideSelectionColor = clWindow
        HideSelectionTextColor = clBlack
        HighlightTextColor = clWindowText
        LookAndFeel = lfFlat
        Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
        PreviewFont.Charset = SHIFTJIS_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -13
        PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        PreviewFont.Style = []
        ShowBands = True
        ShowHeader = False
        OnChangeNodeEx = fnCmnGridAccInfoChangeNodeEx
        OnBeforeChangeColumn = fnCmnGridAccInfoOnBeforeChangeColumn
        object CmnGridAccInfoColumnDummy: TdxDBGridColumn
          MinWidth = 0
          ReadOnly = True
          Sizing = False
          TabStop = False
          Width = 0
          BandIndex = 0
          RowIndex = 0
          ImeMode = imDisable
          StretchChar.Auto = False
        end
        object CmnGridAccInfoColumnAccountCode: TdxDBGridColumn
          Caption = ' '
          HeaderAlignment = taCenter
          MinWidth = 18
          ReadOnly = True
          Width = 40
          BandIndex = 0
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          MaxLength = 4
          StretchChar.Auto = False
          FieldName = 'nAccountCode'
        end
        object CmnGridAccInfoColumnDepDivision: TdxDBGridLookupColumn
          MinWidth = 12
          Width = 20
          BandIndex = 1
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          StretchChar.Auto = False
          FieldName = 'nDepDivision'
          DropDownSelectEx = False
          DropDownRows = 4
          ListFieldName = 'nDivision;strDescription'
          ListWidth = 70
        end
        object CmnGridAccInfoColumnDepDivisionDesc: TdxDBGridMaskColumn
          ReadOnly = True
          TabStop = False
          Width = 60
          BandIndex = 1
          RowIndex = 0
          ImeMode = imDisable
          StretchChar.Auto = False
          FieldName = 'strDepDivisionDesc'
        end
        object CmnGridAccInfoColumnAccountNo: TdxDBGridColumn
          Alignment = taLeftJustify
          BandIndex = 2
          RowIndex = 0
          ImeMode = imDisable
          MaxLength = 8
          StretchChar.Auto = False
          FieldName = 'strAccountNo'
          OnGetText = fnCmnGridAccInfoColumnAccountNoOnGetText
        end
        object CmnGridAccInfoColumnClientCode: TdxDBGridColumn
          Width = 90
          BandIndex = 3
          RowIndex = 0
          ImeMode = imDisable
          MaxLength = 10
          StretchChar.Auto = False
          FieldName = 'strClientCode'
          OnGetText = fnCmnGridAccInfoColumnClientCodeOnGetText
        end
        object CmnGridAccInfoColumnClientNameKana: TdxDBGridColumn
          BandIndex = 4
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 40
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'strClientNameKana'
        end
      end
      object CmnTabAccount: TMTab
        Left = 2
        Top = 2
        Width = 739
        Height = 20
        Items = <
          item
            Caption = 'Caption'
            Color = 16766672
            Alignment = taCenter
            ImageIndex = -1
            ParentBorderCaption = True
          end>
        Enabled = False
        Align = alTop
        TabOrder = 1
        ItemWidth = 0
        ItemHeight = 0
        ItemMargin = 10
        Style = tsGlass
        BorderHeight = 18
        BorderFont.Charset = SHIFTJIS_CHARSET
        BorderFont.Color = clWindowText
        BorderFont.Height = -12
        BorderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BorderFont.Style = []
        BorderCaptionAlign = taLeftJustify
        DropShadow = False
      end
    end
  end
  object CmnPanelClientDetail: TMPanel
    Left = 202
    Top = 0
    Width = 743
    Height = 583
    Align = alClient
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 2
    object CmnScrollBoxInformation: TScrollBox
      Left = 0
      Top = 0
      Width = 743
      Height = 549
      HorzScrollBar.Range = 733
      VertScrollBar.Range = 490
      Align = alClient
      AutoScroll = False
      BorderStyle = bsNone
      Color = 15921906
      ParentColor = False
      TabOrder = 0
      object CmnPanelInformations: TMPanel
        Left = 0
        Top = 90
        Width = 733
        Height = 455
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 2
        object CmnPanelInformation01: TMPanel
          Left = 0
          Top = 35
          Width = 733
          Height = 420
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 1
          Visible = False
          object MLabel5: TMLabel
            Left = 12
            Top = 357
            Width = 61
            Height = 18
            AutoSize = False
            Caption = #25163#24418#21106#24341#29575
            FontRatio.Auto = False
          end
          object MLabel3: TMLabel
            Left = 176
            Top = 357
            Width = 25
            Height = 18
            AutoSize = False
            Caption = #65285
            FontRatio.Auto = False
          end
          object MLabel22: TMLabel
            Left = 12
            Top = 280
            Width = 85
            Height = 18
            AutoSize = False
            Caption = #38651#23376#35352#37682#20661#27177
            FontRatio.Auto = False
          end
          object CmnLabelOverseaRem: TMLabel
            Left = 196
            Top = 280
            Width = 85
            Height = 18
            AutoSize = False
            Caption = #28023#22806#36865#37329
            FontRatio.Auto = False
          end
          object CmnPanelFeeStandard: TMPanel
            Left = 8
            Top = 5
            Width = 610
            Height = 88
            BevelInner = bvLowered
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 0
            object CmnPanelFeeListTitle0101: TMPanel
              Left = 1
              Top = 1
              Width = 276
              Height = 18
              Alignment = taLeftJustify
              Caption = '  '#27161#28310#25163#25968#26009
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 5
            end
            object CmnPanelFeeListTitle0102: TMPanel
              Left = 277
              Top = 1
              Width = 83
              Height = 18
              Caption = #21516#19968#24215#23451
              Color = 15921906
              ParentBackground = False
              TabOrder = 6
            end
            object CmnPanelFeeListTitle0103: TMPanel
              Left = 360
              Top = 1
              Width = 83
              Height = 18
              Caption = #26412#25903#24215#23451
              Color = 15921906
              ParentBackground = False
              TabOrder = 7
            end
            object CmnPanelFeeListTitle0104: TMPanel
              Left = 443
              Top = 1
              Width = 83
              Height = 18
              Caption = #20182#34892#25991#26360
              Color = 15921906
              ParentBackground = False
              TabOrder = 8
            end
            object CmnPanelFeeListTitle0105: TMPanel
              Left = 526
              Top = 1
              Width = 83
              Height = 18
              Caption = #20182#34892#38651#20449
              Color = 15921906
              ParentBackground = False
              TabOrder = 9
            end
            object CmnPanelFeeStdColumn01: TMPanel
              Left = 1
              Top = 19
              Width = 276
              Height = 68
              Alignment = taLeftJustify
              Color = 15921906
              ParentBackground = False
              TabOrder = 0
              object CmnLabelFeeUnit010201: TMLabel
                Left = 94
                Top = 25
                Width = 45
                Height = 18
                AutoSize = False
                Caption = #20870#20197#19978
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010301: TMLabel
                Left = 94
                Top = 46
                Width = 45
                Height = 18
                AutoSize = False
                Caption = #20870#20197#19978
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010102: TMLabel
                Left = 232
                Top = 3
                Width = 42
                Height = 18
                AutoSize = False
                Caption = #20870#26410#28288
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010202: TMLabel
                Left = 232
                Top = 25
                Width = 42
                Height = 18
                AutoSize = False
                Caption = #20870#26410#28288
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010101: TMLabel
                Left = 94
                Top = 3
                Width = 45
                Height = 18
                AutoSize = False
                Caption = #20870#20197#19978
                FontRatio.Auto = False
              end
              object CmnEditFeeValue010101: TMNumEdit
                Left = 3
                Top = 3
                Width = 84
                Height = 19
                TabStop = False
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
                Static = True
                ArrowType = atArrow
                AutoSize = False
                Color = 15921906
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#26126#26397
                Font.Style = []
                ImeMode = imClose
                FontRatio.Auto = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                FormatStr = ',,0'
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue010201: TMNumEdit
                Left = 3
                Top = 24
                Width = 84
                Height = 19
                TabStop = False
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
                Static = True
                ArrowType = atArrow
                AutoSize = False
                Color = 15921906
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#26126#26397
                Font.Style = []
                ImeMode = imClose
                FontRatio.Auto = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
                FormatStr = ',,,0'
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue010301: TMNumEdit
                Left = 3
                Top = 45
                Width = 84
                Height = 19
                TabStop = False
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
                Static = True
                ArrowType = atArrow
                AutoSize = False
                Color = 15921906
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#26126#26397
                Font.Style = []
                ImeMode = imClose
                FontRatio.Auto = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
                FormatStr = ',,,0'
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue010102: TMNumEdit
                Left = 140
                Top = 3
                Width = 84
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnEditFeeListColumn02OnKeyDown
                FormatStr = ',,,0'
                Negative = False
                Digits = 6
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue010202: TMNumEdit
                Left = 140
                Top = 24
                Width = 84
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnEditFeeListColumn02OnKeyDown
                FormatStr = ',,,0'
                Negative = False
                Digits = 6
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeStdColumn02: TMPanel
              Left = 277
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 1
              object CmnLabelFeeUnit010103: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010203: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010303: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue010106: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue010206: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue010306: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeStdColumn03: TMPanel
              Left = 360
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 2
              object CmnLabelFeeUnit010104: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010204: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010304: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue010105: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue010205: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue010305: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeStdColumn04: TMPanel
              Left = 443
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 3
              object CmnLabelFeeUnit010105: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010205: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010305: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue010104: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue010204: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue010304: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeStdColumn05: TMPanel
              Left = 526
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 4
              object CmnLabelFeeUnit010106: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010206: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit010306: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue010103: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue010203: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue010303: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
          end
          object CmnPanelFeeFBUse: TMPanel
            Left = 8
            Top = 95
            Width = 610
            Height = 88
            BevelInner = bvLowered
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 1
            object CmnPanelFeeListTitle0201: TMPanel
              Left = 1
              Top = 1
              Width = 276
              Height = 18
              Alignment = taLeftJustify
              Caption = '  '#65318#65314#29992#25163#25968#26009
              Color = 15921906
              ParentBackground = False
              TabOrder = 0
            end
            object CmnPanelFeeListTitle0202: TMPanel
              Left = 277
              Top = 1
              Width = 83
              Height = 18
              Caption = #21516#19968#24215#23451
              Color = 15921906
              ParentBackground = False
              TabOrder = 1
            end
            object CmnPanelFeeListTitle0203: TMPanel
              Left = 360
              Top = 1
              Width = 83
              Height = 18
              Caption = #26412#25903#24215#23451
              Color = 15921906
              ParentBackground = False
              TabOrder = 2
            end
            object CmnPanelFeeListTitle0204: TMPanel
              Left = 443
              Top = 1
              Width = 83
              Height = 18
              Caption = #20182#34892#25991#26360
              Color = 15921906
              ParentBackground = False
              TabOrder = 3
            end
            object CmnPanelFeeListTitle0205: TMPanel
              Left = 526
              Top = 1
              Width = 83
              Height = 18
              Caption = #20182#34892#38651#20449
              Color = 15921906
              ParentBackground = False
              TabOrder = 4
            end
            object CmnPanelFeeFbuColumn01: TMPanel
              Left = 1
              Top = 19
              Width = 276
              Height = 68
              Alignment = taLeftJustify
              Color = 15921906
              ParentBackground = False
              TabOrder = 5
              object CmnLabelFeeUnit020101: TMLabel
                Left = 94
                Top = 3
                Width = 45
                Height = 18
                AutoSize = False
                Caption = #20870#20197#19978
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020201: TMLabel
                Left = 94
                Top = 25
                Width = 45
                Height = 18
                AutoSize = False
                Caption = #20870#20197#19978
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020301: TMLabel
                Left = 94
                Top = 46
                Width = 45
                Height = 18
                AutoSize = False
                Caption = #20870#20197#19978
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020102: TMLabel
                Left = 232
                Top = 3
                Width = 42
                Height = 18
                AutoSize = False
                Caption = #20870#26410#28288
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020202: TMLabel
                Left = 232
                Top = 25
                Width = 42
                Height = 18
                AutoSize = False
                Caption = #20870#26410#28288
                FontRatio.Auto = False
              end
              object CmnEditFeeValue020101: TMNumEdit
                Left = 3
                Top = 3
                Width = 84
                Height = 19
                TabStop = False
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
                Static = True
                ArrowType = atArrow
                AutoSize = False
                Color = 15921906
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#26126#26397
                Font.Style = []
                ImeMode = imClose
                FontRatio.Auto = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                FormatStr = ',,0'
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue020201: TMNumEdit
                Left = 3
                Top = 24
                Width = 84
                Height = 19
                TabStop = False
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
                Static = True
                ArrowType = atArrow
                AutoSize = False
                Color = 15921906
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#26126#26397
                Font.Style = []
                ImeMode = imClose
                FontRatio.Auto = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
                FormatStr = ',,,0'
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue020301: TMNumEdit
                Left = 3
                Top = 45
                Width = 84
                Height = 19
                TabStop = False
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
                Static = True
                ArrowType = atArrow
                AutoSize = False
                Color = 15921906
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#26126#26397
                Font.Style = []
                ImeMode = imClose
                FontRatio.Auto = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
                FormatStr = ',,,0'
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue020102: TMNumEdit
                Left = 140
                Top = 3
                Width = 84
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnEditFeeListColumn02OnKeyDown
                FormatStr = ',,,0'
                Negative = False
                Digits = 6
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue020202: TMNumEdit
                Left = 140
                Top = 24
                Width = 84
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnEditFeeListColumn02OnKeyDown
                FormatStr = ',,,0'
                Negative = False
                Digits = 6
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeFbuColumn02: TMPanel
              Left = 277
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 6
              object CmnLabelFeeUnit020103: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020203: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020303: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue020106: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue020206: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue020306: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeFbuColumn03: TMPanel
              Left = 360
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 7
              object CmnLabelFeeUnit020104: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020204: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020304: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue020105: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue020205: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue020305: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeFbuColumn04: TMPanel
              Left = 443
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 8
              object CmnLabelFeeUnit020105: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020205: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020305: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue020104: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue020204: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue020304: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeFbuColumn05: TMPanel
              Left = 526
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 9
              object CmnLabelFeeUnit020106: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020206: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit020306: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue020103: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue020203: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue020303: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
          end
          object CmnPanelFeeWindowUse: TMPanel
            Left = 8
            Top = 185
            Width = 610
            Height = 88
            BevelInner = bvLowered
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 2
            object CmnPanelFeeListTitle0301: TMPanel
              Left = 1
              Top = 1
              Width = 276
              Height = 18
              Alignment = taLeftJustify
              Caption = '  '#31379#21475#29992#25163#25968#26009
              Color = 15921906
              ParentBackground = False
              TabOrder = 0
            end
            object CmnPanelFeeListTitle0302: TMPanel
              Left = 277
              Top = 1
              Width = 83
              Height = 18
              Caption = #21516#19968#24215#23451
              Color = 15921906
              ParentBackground = False
              TabOrder = 1
            end
            object CmnPanelFeeListTitle0303: TMPanel
              Left = 360
              Top = 1
              Width = 83
              Height = 18
              Caption = #26412#25903#24215#23451
              Color = 15921906
              ParentBackground = False
              TabOrder = 2
            end
            object CmnPanelFeeListTitle0304: TMPanel
              Left = 443
              Top = 1
              Width = 83
              Height = 18
              Caption = #20182#34892#25991#26360
              Color = 15921906
              ParentBackground = False
              TabOrder = 3
            end
            object CmnPanelFeeListTitle0305: TMPanel
              Left = 526
              Top = 1
              Width = 83
              Height = 18
              Caption = #20182#34892#38651#20449
              Color = 15921906
              ParentBackground = False
              TabOrder = 4
            end
            object CmnPanelFeeWinColumn01: TMPanel
              Left = 1
              Top = 19
              Width = 276
              Height = 68
              Alignment = taLeftJustify
              Color = 15921906
              ParentBackground = False
              TabOrder = 5
              object CmnLabelFeeUnit030101: TMLabel
                Left = 94
                Top = 3
                Width = 45
                Height = 18
                AutoSize = False
                Caption = #20870#20197#19978
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030201: TMLabel
                Left = 94
                Top = 25
                Width = 45
                Height = 18
                AutoSize = False
                Caption = #20870#20197#19978
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030301: TMLabel
                Left = 94
                Top = 46
                Width = 45
                Height = 18
                AutoSize = False
                Caption = #20870#20197#19978
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030102: TMLabel
                Left = 232
                Top = 3
                Width = 42
                Height = 18
                AutoSize = False
                Caption = #20870#26410#28288
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030202: TMLabel
                Left = 232
                Top = 25
                Width = 42
                Height = 18
                AutoSize = False
                Caption = #20870#26410#28288
                FontRatio.Auto = False
              end
              object CmnEditFeeValue030101: TMNumEdit
                Left = 3
                Top = 3
                Width = 84
                Height = 19
                TabStop = False
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
                Static = True
                ArrowType = atArrow
                AutoSize = False
                Color = 15921906
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#26126#26397
                Font.Style = []
                ImeMode = imClose
                FontRatio.Auto = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
                FormatStr = ',,0'
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue030201: TMNumEdit
                Left = 3
                Top = 24
                Width = 84
                Height = 19
                TabStop = False
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
                Static = True
                ArrowType = atArrow
                AutoSize = False
                Color = 15921906
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#26126#26397
                Font.Style = []
                ImeMode = imClose
                FontRatio.Auto = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
                FormatStr = ',,,0'
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue030301: TMNumEdit
                Left = 3
                Top = 45
                Width = 84
                Height = 19
                TabStop = False
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
                Static = True
                ArrowType = atArrow
                AutoSize = False
                Color = 15921906
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#26126#26397
                Font.Style = []
                ImeMode = imClose
                FontRatio.Auto = False
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
                FormatStr = ',,,0'
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue030102: TMNumEdit
                Left = 140
                Top = 3
                Width = 84
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnEditFeeListColumn02OnKeyDown
                FormatStr = ',,,0'
                Negative = False
                Digits = 6
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue030202: TMNumEdit
                Left = 140
                Top = 24
                Width = 84
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnEditFeeListColumn02OnKeyDown
                FormatStr = ',,,0'
                Negative = False
                Digits = 6
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeWinColumn02: TMPanel
              Left = 277
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 6
              object CmnLabelFeeUnit030103: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030203: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030303: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue030106: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue030206: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue030306: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeWinColumn03: TMPanel
              Left = 360
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 7
              object CmnLabelFeeUnit030104: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030204: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030304: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue030105: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue030205: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue030305: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeWinColumn04: TMPanel
              Left = 443
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 8
              object CmnLabelFeeUnit030105: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030205: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030305: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue030104: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue030204: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue030304: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
            object CmnPanelFeeWinColumn05: TMPanel
              Left = 526
              Top = 19
              Width = 83
              Height = 68
              Color = 15921906
              ParentBackground = False
              TabOrder = 9
              object CmnLabelFeeUnit030106: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030206: TMLabel
                Left = 64
                Top = 25
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnLabelFeeUnit030306: TMLabel
                Left = 64
                Top = 46
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEditFeeValue030103: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
              object CmnEditFeeValue030203: TMNumEdit
                Left = 3
                Top = 24
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 1
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
              object CmnEditFeeValue030303: TMNumEdit
                Left = 3
                Top = 45
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 2
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Zero = True
              end
            end
          end
          object CmnEdit01050BiilRate: TMNumEdit
            Left = 79
            Top = 357
            Width = 90
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            FocusedColor = 16777158
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
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 6
            OnChange = fnCmnFunctionOnChange
            OnKeyDown = fnCmnFunctionOnKeyDown
            Negative = False
            MaxValue = 999.990000000000000000
            Decimals = 2
            Digits = 5
            Validate = False
            Zero = True
          end
          object MPanel2: TMPanel
            Left = 8
            Top = 299
            Width = 169
            Height = 45
            BevelInner = bvLowered
            BevelOuter = bvNone
            Color = 14608367
            ParentBackground = False
            TabOrder = 3
            object MPanel3: TMPanel
              Left = 1
              Top = 1
              Width = 83
              Height = 18
              Caption = #21516#34892
              Color = 15921906
              ParentBackground = False
              TabOrder = 2
            end
            object MPanel4: TMPanel
              Left = 84
              Top = 1
              Width = 83
              Height = 18
              Caption = #20182#34892
              Color = 15921906
              ParentBackground = False
              TabOrder = 3
            end
            object MPanel5: TMPanel
              Left = 1
              Top = 19
              Width = 83
              Height = 26
              Color = 15921906
              ParentBackground = False
              TabOrder = 0
              object MLabel20: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEdit01044Densai1: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
            end
            object MPanel6: TMPanel
              Left = 84
              Top = 19
              Width = 83
              Height = 26
              Color = 15921906
              ParentBackground = False
              TabOrder = 1
              object MLabel21: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEdit01045Densai2: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 9999.000000000000000000
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
                Zero = True
              end
            end
          end
          object MPanelStartYMD: TMPanel
            Left = 464
            Top = 276
            Width = 185
            Height = 33
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 5
            object MLabel_From: TMLabel
              Left = 2
              Top = 4
              Width = 71
              Height = 19
              AutoSize = False
              Caption = #36969#29992#38283#22987#26085
              FontRatio.Auto = False
            end
            object CmnEdit01049StartYMD: TMDateEdit
              Left = 72
              Top = 4
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              FocusedColor = 15921906
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Color = clWhite
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ImeMode = imClose
              ParentFont = False
              TabOrder = 0
              OnExit = CmnEdit01049StartYMDExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              Calendar = True
              DateFormat = dfEMD
              DateInputType = diYMD
              Gengou = 'H'
              SepChar = '/'
              Value = 0
              Validate = False
            end
          end
          object CmnPanelOverseaRem: TMPanel
            Left = 192
            Top = 299
            Width = 252
            Height = 45
            BevelInner = bvLowered
            BevelOuter = bvNone
            Color = 14608367
            ParentBackground = False
            TabOrder = 4
            object CmnPanelTitle01046Oversea1: TMPanel
              Left = 1
              Top = 1
              Width = 83
              Height = 18
              Caption = #38306#20418#37504#34892
              Color = 15921906
              ParentBackground = False
              TabOrder = 2
            end
            object CmnPanelTitle01047Oversea2: TMPanel
              Left = 84
              Top = 1
              Width = 83
              Height = 18
              Caption = #20182#37504#34892
              Color = 15921906
              ParentBackground = False
              TabOrder = 3
            end
            object CmnPanelWin01046Oversea1: TMPanel
              Left = 1
              Top = 19
              Width = 83
              Height = 26
              Color = 15921906
              ParentBackground = False
              TabOrder = 0
              object CmnLabelUnit01046Oversea1: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEdit01046Oversea1: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 99999.000000000000000000
                Digits = 5
                Validate = False
                Value = 99999.000000000000000000
                Zero = True
              end
            end
            object CmnPanelWin01047Oversea2: TMPanel
              Left = 84
              Top = 19
              Width = 83
              Height = 26
              Color = 15921906
              ParentBackground = False
              TabOrder = 1
              object CmnLabelUnit01047Oversea2: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEdit01047Oversea2: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 99999.000000000000000000
                Digits = 5
                Validate = False
                Value = 99999.000000000000000000
                Zero = True
              end
            end
            object CmnPanelTitle01048Oversea3: TMPanel
              Left = 167
              Top = 1
              Width = 83
              Height = 18
              Caption = #28023#22806#25163#25968#26009
              Color = 15921906
              ParentBackground = False
              TabOrder = 4
            end
            object CmnPanelWin01048Oversea3: TMPanel
              Left = 167
              Top = 19
              Width = 83
              Height = 26
              Color = 15921906
              ParentBackground = False
              TabOrder = 5
              object CmnLabelUnit01048Oversea3: TMLabel
                Left = 64
                Top = 3
                Width = 18
                Height = 18
                AutoSize = False
                Caption = #20870
                FontRatio.Auto = False
              end
              object CmnEdit01048Oversea3: TMNumEdit
                Left = 3
                Top = 3
                Width = 54
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
                FocusedColor = 16777158
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
                PopupMenu = CmnPopupMenuDummy
                TabOrder = 0
                OnChange = fnCmnFunctionOnChange
                OnEnter = fnCmnFunctionOnEnter
                OnKeyDown = fnCmnFunctionOnKeyDown
                FormatStr = ',,0'
                Negative = False
                MaxValue = 99999.000000000000000000
                Digits = 5
                Validate = False
                Value = 99999.000000000000000000
                Zero = True
              end
            end
          end
        end
        object CmnPanelInformation03: TMPanel
          Left = 0
          Top = 35
          Width = 733
          Height = 420
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 3
          Visible = False
          object MLabel23: TMLabel
            Left = 12
            Top = 13
            Width = 91
            Height = 19
            AutoSize = False
            Caption = #12524#12452#12450#12454#12488#24773#22577
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel32: TMLabel
            Left = 24
            Top = 36
            Width = 142
            Height = 17
            AutoSize = False
            Caption = #25163#24418#12524#12452#12450#12454#12488#12497#12473
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnLabel02002ChaDivisionDraftDesc: TMLabel
            Left = 225
            Top = 57
            Width = 100
            Height = 18
            AutoSize = False
            Caption = 'XXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel39: TMLabel
            Left = 24
            Top = 58
            Width = 142
            Height = 17
            AutoSize = False
            Caption = #25163#24418#37329#38989#25991#23383#31278#21029
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel40: TMLabel
            Left = 24
            Top = 80
            Width = 142
            Height = 17
            AutoSize = False
            Caption = #23567#20999#25163#12524#12452#12450#12454#12488#12497#12473
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnLabel02004ChaDivisionCheckDesc: TMLabel
            Left = 225
            Top = 101
            Width = 100
            Height = 18
            AutoSize = False
            Caption = 'XXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel74: TMLabel
            Left = 24
            Top = 102
            Width = 142
            Height = 17
            AutoSize = False
            Caption = #23567#20999#25163#37329#38989#25991#23383#31278#21029
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel9: TMLabel
            Left = 24
            Top = 124
            Width = 161
            Height = 17
            AutoSize = False
            Caption = #21106#24341#20381#38972#26360#65434#65394#65393#65395#65412#65418#65439#65405
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel10: TMLabel
            Left = 24
            Top = 146
            Width = 157
            Height = 17
            AutoSize = False
            Caption = #21462#31435#20381#38972#34920#65434#65394#65393#65395#65412#65418#65439#65405
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel11: TMLabel
            Left = 24
            Top = 168
            Width = 153
            Height = 17
            AutoSize = False
            Caption = #25285#20445#20381#38972#24046#20837#35388#65434#65394#65393#65395#65412#65418#65439#65405
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel12: TMLabel
            Left = 24
            Top = 213
            Width = 142
            Height = 17
            AutoSize = False
            Caption = #20837#37329#21475#24231
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnLabel02008ChaDivisionCheckDesc: TMLabel
            Left = 254
            Top = 212
            Width = 387
            Height = 18
            AutoSize = False
            Caption = 'XXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel13: TMLabel
            Left = 8
            Top = 5
            Width = 723
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel15: TMLabel
            Left = 8
            Top = 243
            Width = 723
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel17: TMLabel
            Left = 24
            Top = 190
            Width = 161
            Height = 17
            AutoSize = False
            Caption = #32068#25147#20381#38972#26360#65434#65394#65393#65395#65412#65418#65439#65405
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnLabelSoukinInfo: TMLabel
            Left = 12
            Top = 251
            Width = 91
            Height = 19
            AutoSize = False
            Caption = #22806#22269#36865#37329#24773#22577
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnLabel02010SoukinClientCode: TMLabel
            Left = 24
            Top = 274
            Width = 116
            Height = 17
            AutoSize = False
            Caption = #36865#37329#20381#38972#20154#12467#12540#12489
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnLabel02011SoukinClientNameKana: TMLabel
            Left = 24
            Top = 296
            Width = 116
            Height = 17
            AutoSize = False
            Caption = #36865#37329#20381#38972#20154#21517
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnLabel02012SoukinCodeMode: TMLabel
            Left = 24
            Top = 318
            Width = 113
            Height = 17
            AutoSize = False
            Caption = #21322#35282#12467#12540#12489#20307#31995
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnLabel02012SoukinCodeModeDesc: TMLabel
            Left = 225
            Top = 318
            Width = 95
            Height = 18
            AutoSize = False
            Caption = 'XXXXXXXXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnLabel02013SoukinRecordPause: TMLabel
            Left = 24
            Top = 340
            Width = 113
            Height = 17
            AutoSize = False
            Caption = #12524#12467#12540#12489#21306#20999
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnLabel02013SoukinRecordPauseDesc: TMLabel
            Left = 225
            Top = 340
            Width = 95
            Height = 18
            AutoSize = False
            Caption = 'XXXXXXXXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnLabel02014SoukinFileName: TMLabel
            Left = 24
            Top = 362
            Width = 116
            Height = 17
            AutoSize = False
            Caption = #12501#12449#12452#12523#21517
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object CmnEdit02002ChaDivisionDraft: TMNumEdit
            Left = 188
            Top = 57
            Width = 19
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#32294#32286
              '1: '#26012#32286
              '2: '#28450#25968#23383
              '3: '#32294#32286#65288#29421#65289
              '4: '#26012#32286#65288#29421#65289)
            FocusedColor = 16777158
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
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 1
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            OnKeyPress = fnCmnKeyPress
            MaxValue = 99.000000000000000000
            Digits = 1
            Validate = False
            Zero = True
          end
          object CmnEdit02001LayoutPathDraft: TMTxtEdit
            Left = 188
            Top = 35
            Width = 435
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCmnEditFileNameOnArrowClick
            FocusedColor = 16777158
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpVariable
            Font.Style = []
            ImeMode = imClose
            MaxLength = 100
            FontRatio.Auto = False
            ParentFont = False
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 0
            Text = ''
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            ValidChars = ''
          end
          object CmnEdit02003LayoutPathCheck: TMTxtEdit
            Left = 188
            Top = 79
            Width = 435
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCmnEditFileNameOnArrowClick
            FocusedColor = 16777158
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpVariable
            Font.Style = []
            ImeMode = imClose
            MaxLength = 100
            FontRatio.Auto = False
            ParentFont = False
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 2
            Text = ''
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            ValidChars = ''
          end
          object CmnEdit02004ChaDivisionCheck: TMNumEdit
            Left = 188
            Top = 101
            Width = 19
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#32294#32286
              '1: '#26012#32286
              '2: '#28450#25968#23383
              '3: '#32294#32286#65288#29421#65289
              '4: '#26012#32286#65288#29421#65289)
            FocusedColor = 16777158
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
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 3
            OnChange = fnCmnEditListDispOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            OnKeyPress = fnCmnKeyPress
            MaxValue = 99.000000000000000000
            Digits = 1
            Validate = False
            Zero = True
          end
          object CmnEdit02005LayoutPathCheck: TMTxtEdit
            Left = 188
            Top = 123
            Width = 435
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCmnEditFileNameOnArrowClick
            FocusedColor = 16777158
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpVariable
            Font.Style = []
            ImeMode = imClose
            MaxLength = 100
            FontRatio.Auto = False
            ParentFont = False
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 4
            Text = ''
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            ValidChars = ''
          end
          object CmnEdit02006LayoutPathCheck: TMTxtEdit
            Left = 188
            Top = 145
            Width = 435
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCmnEditFileNameOnArrowClick
            FocusedColor = 16777158
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpVariable
            Font.Style = []
            ImeMode = imClose
            MaxLength = 100
            FontRatio.Auto = False
            ParentFont = False
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 5
            Text = ''
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            ValidChars = ''
          end
          object CmnEdit02007LayoutPathCheck: TMTxtEdit
            Left = 188
            Top = 167
            Width = 435
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCmnEditFileNameOnArrowClick
            FocusedColor = 16777158
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpVariable
            Font.Style = []
            ImeMode = imClose
            MaxLength = 100
            FontRatio.Auto = False
            ParentFont = False
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 6
            Text = ''
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            ValidChars = ''
          end
          object CmnEdit02008ChaDivisionCheck: TMNumEdit
            Left = 188
            Top = 211
            Width = 38
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnAllowClick
            FocusedColor = 16777158
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
            TabOrder = 8
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            FormatStr = '0000'
            Negative = False
            Digits = 4
            Validate = False
            InputFlagEnabled = True
          end
          object CmnEdit02009LayoutPathCheck: TMTxtEdit
            Left = 188
            Top = 189
            Width = 435
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCmnEditFileNameOnArrowClick
            FocusedColor = 16777158
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpVariable
            Font.Style = []
            ImeMode = imClose
            MaxLength = 100
            FontRatio.Auto = False
            ParentFont = False
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 7
            Text = ''
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            ValidChars = ''
          end
          object CmnEdit02010SoukinClientCode: TMTxtEdit
            Left = 188
            Top = 273
            Width = 83
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            FocusedColor = 16777158
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpVariable
            Font.Style = []
            Hankaku = True
            ImeMode = imClose
            MaxLength = 10
            MLeftMargin = 4
            FontRatio.Auto = False
            ParentFont = False
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 9
            Text = '0000000000'
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            OnKeyPress = fnCmnFunctionTxtEditOnKeyPress
            ValidChars = ''
          end
          object CmnEdit02011SoukinClientNameKana: TMTxtEdit
            Left = 188
            Top = 295
            Width = 333
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            FocusedColor = 16777158
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpVariable
            Font.Style = []
            Hankaku = True
            ImeMode = imSKata
            MaxLength = 40
            FontRatio.Auto = False
            ParentFont = False
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 10
            Text = ''
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            OnKeyPress = fnCmnEditNameKanaOnKeyPress
            ValidChars = ''
          end
          object CmnEdit02012SoukinCodeMode: TMNumEdit
            Left = 188
            Top = 317
            Width = 19
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: JIS'
              '1: EBCDIC')
            FocusedColor = 16777158
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
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 11
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            OnKeyPress = fnCmnKeyPress
            MaxValue = 99.000000000000000000
            Digits = 1
            Validate = False
            Zero = True
          end
          object CmnEdit02013SoukinRecordPause: TMNumEdit
            Left = 188
            Top = 339
            Width = 19
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: CR'
              '2: CR/LF')
            FocusedColor = 16777158
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
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 12
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            OnKeyPress = fnCmnKeyPress
            MaxValue = 99.000000000000000000
            Digits = 1
            Validate = False
            Zero = True
          end
          object CmnEdit02014SoukinFileName: TMTxtEdit
            Left = 188
            Top = 361
            Width = 435
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnCmnEditFileNameOnArrowClick
            FocusedColor = 16777158
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpVariable
            Font.Style = []
            ImeMode = imClose
            MaxLength = 100
            FontRatio.Auto = False
            ParentFont = False
            PopupMenu = CmnPopupMenuDummy
            TabOrder = 13
            Text = ''
            OnChange = fnCmnFunctionOnChange
            OnEnter = fnCmnFunctionOnEnter
            OnExit = fnCmnExit
            OnKeyDown = fnCmnFunctionOnKeyDown
            ValidChars = ''
          end
        end
        object CmnPanelInformation04: TMPanel
          Left = 0
          Top = 35
          Width = 733
          Height = 420
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 2
          Visible = False
          object CmnPanelRefer: TMPanel
            Left = 0
            Top = 0
            Width = 733
            Height = 420
            Align = alClient
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 1
            object CmnLabelClientNameKana: TMLabel
              Left = 24
              Top = 154
              Width = 116
              Height = 17
              AutoSize = False
              Caption = #25391#36796#20381#38972#20154#21517
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabelDepDivision: TMLabel
              Left = 223
              Top = 3
              Width = 59
              Height = 17
              AutoSize = False
              Caption = #38928#37329#31278#30446#65306
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03002DepDivisionDesc: TMLabel
              Left = 325
              Top = 2
              Width = 54
              Height = 19
              AutoSize = False
              Caption = 'XXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabelAccountNo: TMLabel
              Left = 387
              Top = 3
              Width = 61
              Height = 17
              AutoSize = False
              Caption = #21475#24231#30058#21495#65306
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel61: TMLabel
              Left = 12
              Top = 50
              Width = 125
              Height = 19
              AutoSize = False
              Caption = #65318#65314'/'#38651#23376#20661#27177#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabelClientCode: TMLabel
              Left = 24
              Top = 133
              Width = 116
              Height = 17
              AutoSize = False
              Caption = #25391#36796#20381#38972#20154#12467#12540#12489
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel71: TMLabel
              Left = 12
              Top = 264
              Width = 83
              Height = 19
              AutoSize = False
              Caption = #20181#35379#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03014KmkCode: TMLabel
              Left = 20
              Top = 283
              Width = 116
              Height = 17
              AutoSize = False
              Caption = #21208#23450#31185#30446
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object CmnLabel03015KmsCode: TMLabel
              Left = 374
              Top = 283
              Width = 116
              Height = 17
              AutoSize = False
              Caption = #31185#30446#21029#35036#21161
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object CmnLabel03016BumCode: TMLabel
              Left = 20
              Top = 304
              Width = 116
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object CmnLabel03017SegCode: TMLabel
              Left = 374
              Top = 346
              Width = 116
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object CmnLabel03018HojCode: TMLabel
              Left = 374
              Top = 304
              Width = 116
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object CmnLabel03019HojCode: TMLabel
              Left = 374
              Top = 325
              Width = 116
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object CmnLabel03014KmkCodeDesc: TMLabel
              Left = 240
              Top = 283
              Width = 105
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03015KmsCodeDesc: TMLabel
              Left = 594
              Top = 283
              Width = 105
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03016BumCodeDesc: TMLabel
              Left = 240
              Top = 304
              Width = 105
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03017SegCodeDesc: TMLabel
              Left = 594
              Top = 346
              Width = 105
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03018HojCodeDesc: TMLabel
              Left = 594
              Top = 304
              Width = 105
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object CmnLabel03019HojCodeDesc: TMLabel
              Left = 594
              Top = 325
              Width = 105
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object MLabel1: TMLabel
              Left = 24
              Top = 175
              Width = 116
              Height = 17
              AutoSize = False
              Caption = #12459#12490#25391#36796#20381#38972#20154#21517
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabelFBCodeMode: TMLabel
              Left = 352
              Top = 68
              Width = 113
              Height = 17
              AutoSize = False
              Caption = #21322#35282#12467#12540#12489#20307#31995
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03007FBCodeModeDesc: TMLabel
              Left = 525
              Top = 68
              Width = 95
              Height = 18
              AutoSize = False
              Caption = 'XXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabelRecordPause: TMLabel
              Left = 352
              Top = 89
              Width = 113
              Height = 17
              AutoSize = False
              Caption = #12524#12467#12540#12489#21306#20999
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03008RecordPauseDesc: TMLabel
              Left = 525
              Top = 89
              Width = 95
              Height = 18
              AutoSize = False
              Caption = 'XXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel67: TMLabel
              Left = 24
              Top = 196
              Width = 116
              Height = 17
              AutoSize = False
              Caption = #12501#12449#12452#12523#21517
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel68: TMLabel
              Left = 24
              Top = 217
              Width = 116
              Height = 17
              AutoSize = False
              Caption = #12508#12522#12517#12540#12512#21517
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel01044PayDivision: TMLabel
              Left = 24
              Top = 69
              Width = 71
              Height = 17
              AutoSize = False
              Caption = #25391#36796#31278#21029
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03004PayDivisionDesc: TMLabel
              Left = 185
              Top = 68
              Width = 82
              Height = 19
              AutoSize = False
              Caption = #25391#36796#20381#38972#26360
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel2: TMLabel
              Left = 24
              Top = 90
              Width = 105
              Height = 17
              AutoSize = False
              Caption = #20381#38972#26360#38651#20449#25201#12356
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03005ReqKbnDesc: TMLabel
              Left = 185
              Top = 89
              Width = 82
              Height = 19
              AutoSize = False
              Caption = #25391#36796#20381#38972#26360
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel7: TMLabel
              Left = 24
              Top = 111
              Width = 71
              Height = 17
              AutoSize = False
              Caption = #21462#25201#31278#30446
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03006SyumokuDesc: TMLabel
              Left = 185
              Top = 110
              Width = 82
              Height = 19
              AutoSize = False
              Caption = #25391#36796#20381#38972#26360
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel01001FeeDivision: TMLabel
              Left = 262
              Top = 217
              Width = 103
              Height = 17
              AutoSize = False
              Caption = #25163#25968#26009#36969#29992#21306#20998
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03021FeeDivisionDesc: TMLabel
              Left = 406
              Top = 217
              Width = 199
              Height = 19
              AutoSize = False
              Caption = #20491#21029#25163#25968#26009#65288#33258#31038#65295#20182#31038#36000#25285#65289
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel14: TMLabel
              Left = 8
              Top = 50
              Width = 723
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object MLabel4: TMLabel
              Left = 8
              Top = 264
              Width = 723
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object MLabel8: TMLabel
              Left = 8
              Top = 391
              Width = 723
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object CmnLabel03020PrjCode: TMLabel
              Left = 20
              Top = 325
              Width = 116
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object CmnLabel03020PrjCodeDesc: TMLabel
              Left = 240
              Top = 325
              Width = 105
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03022PjSCode: TMLabel
              Left = 20
              Top = 346
              Width = 116
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object CmnLabel03022PjSCodeDesc: TMLabel
              Left = 240
              Top = 346
              Width = 105
              Height = 17
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel18: TMLabel
              Left = 20
              Top = 367
              Width = 116
              Height = 17
              AutoSize = False
              Caption = #25163#25968#26009#25903#25173#21306#20998
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03023FeePayKbnDesc: TMLabel
              Left = 181
              Top = 367
              Width = 82
              Height = 19
              AutoSize = False
              Caption = #25903#25173#21306#20998
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel19: TMLabel
              Left = 352
              Top = 111
              Width = 113
              Height = 17
              AutoSize = False
              Caption = #25903#25173#12524#12452#12450#12454#12488
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabelFreeItem: TMLabel
              Left = 352
              Top = 133
              Width = 116
              Height = 17
              AutoSize = False
              Caption = #12501#12522#12540#38917#30446
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabelAccMemo: TMLabel
              Left = 10
              Top = 24
              Width = 125
              Height = 17
              AutoSize = False
              Caption = #12513#12514
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel24: TMLabel
              Left = 24
              Top = 238
              Width = 121
              Height = 17
              AutoSize = False
              Caption = #32207#21512#25391#36796#20986#21147#26041#24335
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnLabel03027SouFuripatternDesc: TMLabel
              Left = 185
              Top = 238
              Width = 82
              Height = 19
              AutoSize = False
              Caption = 'XML'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnEdit03015KmsCodeFree: TMTxtEdit
              Left = 494
              Top = 283
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 25
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03022PjSCodeFree: TMTxtEdit
              Left = 140
              Top = 346
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 23
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03022PjSCodeNumeric: TMNumEdit
              Left = 140
              Top = 346
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 22
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              FormatStr = '0'
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object CmnEdit03020PrjCodeFree: TMTxtEdit
              Left = 140
              Top = 325
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 21
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03020PrjCodeNumeric: TMNumEdit
              Left = 140
              Top = 325
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 20
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              FormatStr = '0'
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object CmnEdit03015KmsCodeNumeric: TMNumEdit
              Left = 494
              Top = 283
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 24
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              FormatStr = '0'
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object CmnEdit03018HojCodeFree: TMTxtEdit
              Left = 494
              Top = 304
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 26
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03016BumCodeFree: TMTxtEdit
              Left = 140
              Top = 304
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 18
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03019HojCodeNumeric: TMNumEdit
              Left = 494
              Top = 325
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 29
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              FormatStr = '0'
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object CmnEdit03018HojCodeNumeric: TMNumEdit
              Left = 494
              Top = 304
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 27
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              FormatStr = '0'
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object CmnEdit03017SegCodeNumeric: TMNumEdit
              Left = 494
              Top = 346
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 30
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              FormatStr = '0'
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object CmnEdit03016BumCodeNumeric: TMNumEdit
              Left = 140
              Top = 304
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 19
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              FormatStr = '0'
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object CmnEdit03019HojCodeFree: TMTxtEdit
              Left = 494
              Top = 325
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 28
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03017SegCodeFree: TMTxtEdit
              Left = 494
              Top = 346
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              MaxLength = 10
              FontRatio.Auto = True
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 31
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03003AccountNo: TMTxtEdit
              Left = 453
              Top = 3
              Width = 69
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              FocusedColor = 16777158
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              MaxLength = 8
              MLeftMargin = 4
              FontRatio.Auto = False
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 1
              Text = '00000000'
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnFunctionTxtEditOnKeyPress
              ValidChars = ''
            end
            object CmnEdit03002DepDivision: TMNumEdit
              Left = 289
              Top = 3
              Width = 18
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '1: '#26222#36890
                '2: '#24403#24231
                '4: '#36015#33988
                '9: '#12381#12398#20182)
              FocusedColor = 16777158
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
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 0
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnKeyPress
              MaxValue = 99.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
            object CmnEdit03010ClientName: TMTxtEdit
              Left = 144
              Top = 153
              Width = 333
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              FocusedColor = 16777158
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              ImeMode = imHira
              MaxLength = 60
              FontRatio.Auto = False
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 11
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03009ClientCode: TMTxtEdit
              Left = 144
              Top = 132
              Width = 83
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              FocusedColor = 16777158
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              Hankaku = True
              ImeMode = imClose
              MaxLength = 10
              MLeftMargin = 4
              FontRatio.Auto = False
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 10
              Text = '0000000000'
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnFunctionTxtEditOnKeyPress
              ValidChars = ''
            end
            object CmnEdit03014KmkCode: TMNumEdit
              Left = 140
              Top = 283
              Width = 81
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
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
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 17
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              FormatStr = '0'
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object CmnEdit03011ClientNameKana: TMTxtEdit
              Left = 144
              Top = 174
              Width = 333
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              FocusedColor = 16777158
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              Hankaku = True
              ImeMode = imSKata
              MaxLength = 40
              FontRatio.Auto = False
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 12
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnEditNameKanaOnKeyPress
              ValidChars = ''
            end
            object CmnEdit03007FBCodeMode: TMNumEdit
              Left = 488
              Top = 69
              Width = 19
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: JIS'
                '1: EBCDIC')
              FocusedColor = 16777158
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
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 6
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnKeyPress
              MaxValue = 99.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
            object CmnEdit03008RecordPause: TMNumEdit
              Left = 488
              Top = 90
              Width = 19
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#12394#12375
                '1: CR'
                '2: CR/LF')
              FocusedColor = 16777158
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
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 7
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnKeyPress
              MaxValue = 99.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
            object CmnEdit03012FileName: TMTxtEdit
              Left = 144
              Top = 195
              Width = 435
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnCmnEditFileNameOnArrowClick
              FocusedColor = 16777158
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              ImeMode = imClose
              MaxLength = 100
              FontRatio.Auto = False
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 13
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03013VolumeName: TMTxtEdit
              Left = 144
              Top = 216
              Width = 100
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              FocusedColor = 16777158
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              Hankaku = True
              MaxLength = 11
              FontRatio.Auto = False
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 14
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03004PayDivision: TMNumEdit
              Left = 144
              Top = 69
              Width = 19
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#20840#37504#21332'FD'
                '1: '#25391#36796#20381#38972#26360)
              FocusedColor = 16777158
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
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 3
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnKeyPress
              MaxValue = 99.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
            object CmnEdit03005ReqKbn: TMNumEdit
              Left = 144
              Top = 90
              Width = 19
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#38651#20449
                '1: '#25991#26360)
              FocusedColor = 16777158
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
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 4
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnKeyPress
              MaxValue = 99.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
            object CmnEdit03006Syumoku: TMNumEdit
              Left = 144
              Top = 111
              Width = 19
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#32207#21512#25391#36796
                '1: '#32102#19982#25391#36796
                '2: '#25391#36796
                '3: '#20849#36890)
              FocusedColor = 16777158
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
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 5
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnKeyPress
              MaxValue = 99.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
            object CmnEdit03021FeeDivision: TMNumEdit
              Left = 370
              Top = 217
              Width = 18
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#27161#28310#25163#25968#26009#12398#12415
                '1: '#20491#21029#25163#25968#26009#65288#33258#31038#36000#25285#65289
                '2: '#20491#21029#25163#25968#26009#65288#33258#31038#65295#20182#31038#36000#25285#65289)
              FocusedColor = 16777158
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
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 15
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnKeyPress
              MaxValue = 99.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
            object CmnEdit03023FeePayKbn: TMNumEdit
              Left = 140
              Top = 367
              Width = 19
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#26410#25173#35336#19978
                '1: '#25903#25173#26178#35336#19978)
              FocusedColor = 16777158
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
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 32
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnKeyPress
              MaxValue = 99.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
            object CmnCmbo03024Layout: TMComboBox
              Left = 488
              Top = 111
              Width = 233
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 60
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              TabOrder = 8
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
            end
            object CmnEdit03025FreeItem: TMTxtEdit
              Left = 488
              Top = 132
              Width = 233
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              FocusedColor = 16777158
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              ImeMode = imClose
              MaxLength = 40
              FontRatio.Auto = False
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 9
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03026AccMemo: TMTxtEdit
              Left = 144
              Top = 24
              Width = 233
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              FocusedColor = 16777158
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              ImeMode = imHira
              MaxLength = 40
              FontRatio.Auto = False
              ParentFont = False
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 2
              Text = ''
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              ValidChars = ''
            end
            object CmnEdit03027SouFuripattern: TMNumEdit
              Left = 144
              Top = 238
              Width = 19
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0: '#22266#23450#38263
                '1: XML')
              SelectMaxRowCount = 2
              FocusedColor = 16777158
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
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 16
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              OnKeyPress = fnCmnKeyPress
              MaxValue = 1.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
          end
          object CmnPanelCode: TMPanel
            Left = 4
            Top = 0
            Width = 202
            Height = 22
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 0
            object CmnLabelAccountCode: TMLabel
              Left = 6
              Top = 3
              Width = 125
              Height = 17
              AutoSize = False
              Caption = #20381#38972#20808#21475#24231#12467#12540#12489
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object CmnEdit03001AccountCode: TMNumEdit
              Left = 140
              Top = 3
              Width = 39
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              SelectItems.Strings = (
                '0: '#12381#12398#20182#19968#33324
                '1: '#36899#32080#23376'('#35242')'#20250#31038
                '2: '#38750#36899#32080#23376#20250#31038
                '3: '#38306#36899#20250#31038)
              OnArrowClick = fnAllowClick
              FocusedColor = 16777158
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
              PopupMenu = CmnPopupMenuDummy
              TabOrder = 0
              OnChange = fnCmnFunctionOnChange
              OnEnter = fnCmnFunctionOnEnter
              OnExit = fnCmnExit
              OnKeyDown = fnCmnFunctionOnKeyDown
              FormatStr = '0000'
              Negative = False
              MaxValue = 99.000000000000000000
              Digits = 4
              Validate = False
              InputFlagEnabled = True
              Zero = True
            end
          end
        end
        object CmnTabInformations: TMTab
          Left = 0
          Top = 0
          Width = 733
          Height = 35
          Items = <
            item
              Caption = #25163#25968#26009
              Color = 16766672
              SyncControl = CmnPanelInformation01
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #12524#12452#12450#12454#12488#65295#36865#37329#24773#22577
              Color = 16766672
              SyncControl = CmnPanelInformation03
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #21475#24231#31649#29702#24773#22577
              Color = 16766672
              SyncControl = CmnPanelInformation04
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end>
          Align = alTop
          TabOrder = 0
          OnChange = fnCmnTabInformationsOnChange
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
          OnKeyDown = fnCmnTabInformationsOnKeyDown
          BorderCaptionAlign = taCenter
          DropShadow = False
        end
      end
      object MPnlTop: TMPanel
        Left = 0
        Top = 22
        Width = 743
        Height = 69
        Align = alTop
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 1
        object CmnLabelName: TMLabel
          Left = 8
          Top = 5
          Width = 117
          Height = 17
          AutoSize = False
          Caption = #37504#34892#21517#31216'/'#12459#12490
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object CmnLabelNameSimple: TMLabel
          Left = 8
          Top = 45
          Width = 65
          Height = 17
          AutoSize = False
          Caption = #31777#30053#21517#31216
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel6: TMLabel
          Left = 8
          Top = 25
          Width = 117
          Height = 17
          AutoSize = False
          Caption = #25903#24215#21517#31216'/'#12459#12490
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel16: TMLabel
          Left = 288
          Top = 45
          Width = 35
          Height = 17
          AutoSize = False
          Caption = #36899#24819
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object CmnEdit00007NMK: TMTxtEdit
          Left = 152
          Top = 45
          Width = 125
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          FocusedColor = 16777158
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpVariable
          Font.Style = []
          ImeMode = imHira
          MaxLength = 14
          FontRatio.Auto = False
          ParentFont = False
          PopupMenu = CmnPopupMenuDummy
          TabOrder = 4
          Text = ''
          OnChange = fnCmnFunctionOnChange
          OnEnter = fnCmnFunctionOnEnter
          OnKeyDown = fnCmnFunctionOnKeyDown
          ValidChars = ''
        end
        object CmnEdit00004BkKana: TMTxtEdit
          Left = 330
          Top = 5
          Width = 131
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          FocusedColor = 16777158
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpVariable
          Font.Style = []
          ImeMode = imSKata
          MaxLength = 15
          FontRatio.Auto = False
          ParentFont = False
          PopupMenu = CmnPopupMenuDummy
          TabOrder = 1
          Text = ''
          OnChange = fnCmnFunctionOnChange
          OnEnter = fnCmnFunctionOnEnter
          OnKeyDown = fnCmnFunctionOnKeyDown
          OnKeyPress = fnCmnEditNameKanaOnKeyPress
          ValidChars = ''
        end
        object CmnEdit00003BkName: TMTxtEdit
          Left = 152
          Top = 5
          Width = 173
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          FocusedColor = 16777158
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpVariable
          Font.Style = []
          ImeMode = imHira
          MaxLength = 30
          FontRatio.Auto = False
          ParentFont = False
          PopupMenu = CmnPopupMenuDummy
          TabOrder = 0
          Text = ''
          OnChange = fnCmnFunctionOnChange
          OnEnter = fnCmnFunctionOnEnter
          OnKeyDown = fnCmnFunctionOnKeyDown
          ValidChars = ''
        end
        object CmnEdit00005BrName: TMTxtEdit
          Left = 152
          Top = 25
          Width = 173
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          FocusedColor = 16777158
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpVariable
          Font.Style = []
          ImeMode = imHira
          MaxLength = 30
          FontRatio.Auto = False
          ParentFont = False
          PopupMenu = CmnPopupMenuDummy
          TabOrder = 2
          Text = ''
          OnChange = fnCmnFunctionOnChange
          OnEnter = fnCmnFunctionOnEnter
          OnExit = CmnEdit00005BrNameExit
          OnKeyDown = fnCmnFunctionOnKeyDown
          ValidChars = ''
        end
        object CmnEdit00006BrKana: TMTxtEdit
          Left = 330
          Top = 25
          Width = 131
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          FocusedColor = 16777158
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpVariable
          Font.Style = []
          ImeMode = imSKata
          MaxLength = 15
          FontRatio.Auto = False
          ParentFont = False
          PopupMenu = CmnPopupMenuDummy
          TabOrder = 3
          Text = ''
          OnChange = fnCmnFunctionOnChange
          OnEnter = fnCmnFunctionOnEnter
          OnKeyDown = fnCmnFunctionOnKeyDown
          OnKeyPress = fnCmnEditNameKanaOnKeyPress
          ValidChars = ''
        end
        object CmnEdit00008Renso: TMTxtEdit
          Left = 330
          Top = 45
          Width = 131
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          FocusedColor = 16777158
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpVariable
          Font.Style = []
          Hankaku = True
          ImeMode = imSKata
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          PopupMenu = CmnPopupMenuDummy
          TabOrder = 5
          Text = ''
          OnChange = fnCmnFunctionOnChange
          OnEnter = fnCmnFunctionOnEnter
          OnKeyDown = fnCmnFunctionOnKeyDown
          ValidChars = ''
        end
      end
      object MPanel1: TMPanel
        Left = 0
        Top = 0
        Width = 743
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 0
        object CmnLabelAllBankCode: TMLabel
          Left = 8
          Top = 4
          Width = 113
          Height = 17
          AutoSize = False
          Caption = #20840#37504#21332#12467#12540#12489
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object CmnEdit00002BrCode: TMNumEdit
          Left = 217
          Top = 3
          Width = 32
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = fnBrAllowClick
          FocusedColor = 16777158
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
          PopupMenu = CmnPopupMenuDummy
          TabOrder = 1
          OnChange = fnCmnFunctionOnChange
          OnEnter = fnCmnFunctionOnEnter
          OnExit = fnCmnExit
          OnKeyDown = fnCmnFunctionOnKeyDown
          FormatStr = '000'
          MaxValue = 999.000000000000000000
          Digits = 3
          Validate = False
          Zero = True
        end
        object CmnEdit00001BkCode: TMNumEdit
          Left = 152
          Top = 3
          Width = 39
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = fnCmnEditAllBankCodeOnArrowClick
          FocusedColor = 16777158
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
          PopupMenu = CmnPopupMenuDummy
          TabOrder = 0
          OnChange = fnCmnFunctionOnChange
          OnEnter = fnCmnFunctionOnEnter
          OnExit = fnCmnExit
          OnKeyDown = fnCmnFunctionOnKeyDown
          FormatStr = '0000'
          MaxValue = 9999.000000000000000000
          Digits = 4
          Validate = False
          Zero = True
        end
      end
    end
    object CmnPanelButtons: TMPanel
      Left = 0
      Top = 549
      Width = 743
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 1
      OnResize = fnCmnPanelButtonsOnResize
      DesignSize = (
        743
        34)
      object CmnButtonUpdate: TMBitBtn
        Left = 591
        Top = 5
        Width = 70
        Height = 23
        Anchors = []
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
        TabOrder = 2
        OnClick = fnCmnButtonUpdateOnClick
        OnEnter = fnCmnButtonPageOnEnter
      end
      object CmnButtonCancel: TMBitBtn
        Left = 666
        Top = 5
        Width = 70
        Height = 23
        Anchors = []
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
        TabOrder = 3
        OnClick = fnCmnButtonCancelOnClick
        OnEnter = fnCmnFunctionOnEnterException
      end
      object CmnButtonPagePrevious: TMBitBtn
        Left = 434
        Top = 5
        Width = 70
        Height = 23
        Anchors = []
        Caption = #21069#38913'(&L)'
        Glyph.Data = {
          CE070000424DCE07000000000000360000002800000024000000120000000100
          1800000000009807000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000006666666666666666666666666666666666666666666666
          66666666666666666666666666666666666666666666666666000000000000C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666DCDCDDDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDC666666000000000000C0C0C0DCDCDDDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
          DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCC0C0C00000000000
          00666666DFDFDF8B50298B50298B50298B50298B50298B50298B50298B50298B
          50298B50298B50298B5029DEDFDE666666000000000000C0C0C0DFDFDFB7B7B7
          B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
          B7DEDFDEC0C0C0000000000000666666E1E0E1884E28E1E1E0E1E1E0E1E1E0E1
          E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0874E28E1E1E0666666000000
          000000C0C0C0E1E0E1B7B7B7E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1
          E0E1E1E0E1E1E0E1E1E0B7B7B7E1E1E0C0C0C0000000000000666666E3E3E382
          4B27E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
          834B26E3E3E3666666000000000000C0C0C0E3E3E3B3B3B3E3E3E3E3E3E3E3E3
          E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3B3B3B3E3E3E3C0C0C000
          0000000000666666E6E6E67D4824E5E6E6E5E6E6E5E6E68B50298B5029E5E6E6
          E5E6E6E5E6E6E5E6E6E5E6E67C4725E5E6E6666666000000000000C0C0C0E6E6
          E6B3B3B3E5E6E6E5E6E6E5E6E6B7B7B7B7B7B7E5E6E6E5E6E6E5E6E6E5E6E6E5
          E6E6B3B3B3E5E6E6C0C0C0000000000000666666E9E8E8764523E8E8E9E8E8E9
          814A26814A26E8E8E9E8E8E9E8E8E9E8E8E9E8E8E9E8E8E9774423E8E8E96666
          66000000000000C0C0C0E9E8E8B0B0B0E8E8E9E8E8E9B3B3B3B3B3B3E8E8E9E8
          E8E9E8E8E9E8E8E9E8E8E9E8E8E9B0B0B0E8E8E9C0C0C0000000000000666666
          EBEBEB704121EBEBEB7443227442227343227442227442237342227343227342
          22EBEBEB6F4021EBEBEB666666000000000000C0C0C0EBEBEBB0B0B0EBEBEBB0
          B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0EBEBEBB0B0B0EBEBEB
          C0C0C0000000000000666666EEEDEE6A3E20EDEDED663B1E663C1E673B1F663B
          1E673B1E663B1F673B1E673B1EEDEDED6A3D1FEDEDED666666000000000000C0
          C0C0EEEDEEABABABEDEDEDABABABABABABABABABABABABABABABABABABABABAB
          ABABABEDEDEDABABABEDEDEDC0C0C0000000000000666666F0F0F0643A1DF0F0
          F0F0F0F059331A58331AF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0643A1DF0
          F0F0666666000000000000C0C0C0F0F0F0ABABABF0F0F0F0F0F0A8A8A8A8A8A8
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0ABABABF0F0F0C0C0C00000000000
          00666666F3F3F35D351CF3F3F3F3F3F3F3F3F34E2D174E2D17F3F3F3F3F3F3F3
          F3F3F3F3F3F3F3F35D361BF3F3F3666666000000000000C0C0C0F3F3F3A8A8A8
          F3F3F3F3F3F3F3F3F3A8A8A8A8A8A8F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3A8A8
          A8F3F3F3C0C0C0000000000000666666F6F6F657321AF6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6573219F6F6F6666666000000
          000000C0C0C0F6F6F6A8A8A8F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6A8A8A8F6F6F6C0C0C0000000000000666666F9F9F852
          2F18F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8
          522F18F9F8F8666666000000000000C0C0C0F9F9F8A8A8A8F9F8F8F9F8F8F9F8
          F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8A8A8A8F9F8F8C0C0C000
          0000000000666666FBFBFB4E2D174E2D174E2D174E2D174E2D174E2D174E2D17
          4E2D174E2D174E2D174E2D174E2D17FCFCFB666666000000000000C0C0C0FBFB
          FBA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
          A8A8A8A8A8FCFCFBC0C0C0000000000000666666FEFEFEFEFEFEFEFEFEFEFEFE
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
        TabOrder = 0
        OnClick = fnCmnButtonPageOnClick
      end
      object CmnButtonPageNext: TMBitBtn
        Left = 509
        Top = 5
        Width = 70
        Height = 23
        Anchors = []
        Caption = #27425#38913'(&N)'
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
          00666666DEDFDE8B50298B50298B50298B50298B50298B50298B50298B50298B
          50298B50298B50298B5029DFDFDF666666000000000000C0C0C0DEDFDEB7B7B7
          B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7
          B7DFDFDFC0C0C0000000000000666666E1E1E0874E28E1E1E0E1E1E0E1E1E0E1
          E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0884E28E1E0E1666666000000
          000000C0C0C0E1E1E0B7B7B7E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1
          E0E1E1E0E1E1E0E1E1E0B7B7B7E1E0E1C0C0C0000000000000666666E3E3E383
          4B26E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
          824B27E3E3E3666666000000000000C0C0C0E3E3E3B3B3B3E3E3E3E3E3E3E3E3
          E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3B3B3B3E3E3E3C0C0C000
          0000000000666666E5E6E67C4725E5E6E6E5E6E6E5E6E6E5E6E6E5E6E68B5029
          8B5029E5E6E6E5E6E6E5E6E67D4824E6E6E6666666000000000000C0C0C0E5E6
          E6B3B3B3E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6B7B7B7B7B7B7E5E6E6E5E6E6E5
          E6E6B3B3B3E6E6E6C0C0C0000000000000666666E8E8E9774423E8E8E9E8E8E9
          E8E8E9E8E8E9E8E8E9E8E8E9814A26814A26E8E8E9E8E8E9764523E9E8E86666
          66000000000000C0C0C0E8E8E9B0B0B0E8E8E9E8E8E9E8E8E9E8E8E9E8E8E9E8
          E8E9B3B3B3B3B3B3E8E8E9E8E8E9B0B0B0E9E8E8C0C0C0000000000000666666
          EBEBEB6F4021EBEBEB7342227343227342227442237442227343227442227443
          22EBEBEB704121EBEBEB666666000000000000C0C0C0EBEBEBB0B0B0EBEBEBB0
          B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0EBEBEBB0B0B0EBEBEB
          C0C0C0000000000000666666EDEDED6A3D1FEDEDED673B1E673B1E663B1F673B
          1E663B1E673B1F663C1E663B1EEDEDED6A3E20EEEDEE666666000000000000C0
          C0C0EDEDEDABABABEDEDEDABABABABABABABABABABABABABABABABABABABABAB
          ABABABEDEDEDABABABEEEDEEC0C0C0000000000000666666F0F0F0643A1DF0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F058331A59331AF0F0F0F0F0F0643A1DF0
          F0F0666666000000000000C0C0C0F0F0F0ABABABF0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0A8A8A8A8A8A8F0F0F0F0F0F0ABABABF0F0F0C0C0C00000000000
          00666666F3F3F35D361BF3F3F3F3F3F3F3F3F3F3F3F3F3F3F34E2D174E2D17F3
          F3F3F3F3F3F3F3F35D351CF3F3F3666666000000000000C0C0C0F3F3F3A8A8A8
          F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3A8A8A8A8A8A8F3F3F3F3F3F3F3F3F3A8A8
          A8F3F3F3C0C0C0000000000000666666F6F6F6573219F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F657321AF6F6F6666666000000
          000000C0C0C0F6F6F6A8A8A8F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6A8A8A8F6F6F6C0C0C0000000000000666666F9F8F852
          2F18F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8
          522F18F9F9F8666666000000000000C0C0C0F9F8F8A8A8A8F9F8F8F9F8F8F9F8
          F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8A8A8A8F9F9F8C0C0C000
          0000000000666666FCFCFB4E2D174E2D174E2D174E2D174E2D174E2D174E2D17
          4E2D174E2D174E2D174E2D174E2D17FBFBFB666666000000000000C0C0C0FCFC
          FBA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
          A8A8A8A8A8FBFBFBC0C0C0000000000000666666FEFEFEFEFEFEFEFEFEFEFEFE
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
        Layout = blGlyphRight
        NumGlyphs = 2
        TabOrder = 1
        OnClick = fnCmnButtonPageOnClick
        OnEnter = fnCmnButtonPageOnEnter
      end
    end
  end
  object CmnTreeViewImage: TImageList
    Left = 12
    Top = 64
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000042424200424242004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000424242004242
      4200424242004242420063636300636363006363630042424200424242004242
      4200424242004242420042424200000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000000000000000006363
      6300000000006363630063636300000000000000000000000000636363000000
      0000636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      63000000000000000000000000008C5229008C52290000000000000000000000
      0000636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000424242004242420000000000636363000000000042424200000000004242
      4200000000006363630042424200000000000000000000000000000000006363
      63000000000063636300000000008C5229008C5229008C5229008C5229000000
      0000636363004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000008C522900F7C67B00F7C67B008C52
      2900000000004242420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000004242
      4200000000004242420000000000636363000000000042424200424242000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000063636300000000008C522900F7C67B00F7C67B00F7C6
      7B008C5229000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      630000000000000000000000000000000000000000008C522900F7C67B00F7C6
      7B00F7C67B008C52290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000000000000000006363
      63000000000063636300636363006363630063636300000000008C522900F7C6
      7B00F7C67B00F7C67B008C522900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300000000000000
      0000000000000000000063636300636363006363630000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000008C52
      2900F7C67B008C52290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      00008C5229000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000000000000000000042424200424242004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000424242004242
      4200424242004242420063636300636363006363630042424200424242004242
      420042424200424242004242420000000000000000000000000063636300BDD6
      B50063636300BDD6B500BDD6B500BDD6B500BDD6B500BDD6B500BDD6B500BDD6
      B50063636300424242000000000000000000000000000000000063636300DEC6
      DE0063636300DEC6DE00DEC6DE00DEC6DE00DEC6DE00DEC6E700DEC6DE00DEC6
      E700636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      630063636300636363004242420000000000000000000000000063636300BDCE
      AD0063636300B5D6AD00BDD6AD00B5CEAD00B5CEAD00BDD6AD00B5CEAD00BDCE
      AD0063636300424242000000000000000000000000000000000063636300D6C6
      DE0063636300D6C6DE00D6C6DE00D6C6DE00D6C6DE00D6C6DE00D6C6DE00D6C6
      DE00636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      000000000000636363004242420000000000000000000000000063636300B5C6
      A50063636300ADC6A500ADC6A500ADC6A500B5CEA500ADC6A500B5C6A500ADCE
      A50063636300424242000000000000000000000000000000000063636300CEBD
      D60063636300CEBDD600CEBDD600CEBDD600CEBDD600CEBDD600CEBDD600CEBD
      D600636363004242420000000000000000000000000000000000000000006363
      6300000000006363630063636300636363006363630000000000636363000000
      0000636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      420000000000636363004242420000000000000000000000000063636300A5C6
      940063636300ADBD9400ADC69400ADC69400ADC69C00A5BD9C00ADC69400A5C6
      940063636300424242000000000000000000000000000000000063636300CEB5
      CE0063636300CEB5CE00CEB5CE00CEB5CE00CEB5CE00CEB5CE00CEB5CE00CEB5
      CE00636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      000000000000636363004242420000000000000000000000000063636300A5BD
      8C0063636300A5BD8C00A5BD8C00A5BD8C00A5BD8C00A5BD8C00A5BD8C00A5BD
      8C0063636300424242000000000000000000000000000000000063636300C6AD
      C60063636300C6ADC600C6ADC600C6ADC600C6ADC600C6ADC600C6ADC600C6AD
      C600636363004242420000000000000000000000000000000000000000006363
      6300000000006363630063636300636363006363630063636300636363000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000424242004242420000000000636363000000000042424200000000004242
      4200000000006363630042424200000000000000000000000000636363009CB5
      8400636363009CB584009CB584009CB584009CB584009CB5840094B584009CB5
      840063636300424242000000000000000000000000000000000063636300BDA5
      BD0063636300BDA5BD00BDA5BD00BDA5BD00BDA5BD00BDA5BD00BDA5BD00BDA5
      BD00636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000636363008CA5
      7B00636363008CA57B0063636300636363006363630063636300636363008CA5
      7B0063636300424242000000000000000000000000000000000063636300BDA5
      B50063636300BDA5B5006363630063636300636363006363630063636300BDA5
      B500636363004242420000000000000000000000000000000000000000006363
      6300000000000000000063636300636363000000000063636300636363000000
      0000636363004242420000000000000000000000000063636300000000004242
      4200000000004242420000000000636363000000000042424200424242000000
      000000000000636363004242420000000000000000000000000063636300849C
      6B0063636300849C6B004242420042424200424242004242420042424200849C
      6B0063636300424242000000000000000000000000000000000063636300B59C
      B50063636300B59CB5004242420042424200424242004242420042424200B59C
      B500636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      000000000000636363004242420000000000000000000000000063636300849C
      6B0063636300849C6B00849C6B00849C6B00849C6B00849C6B00849C6B00849C
      6B0063636300424242000000000000000000000000000000000063636300B59C
      AD0063636300B59CAD00B59CAD00B59CAD00B59CAD00B59CAD00B59CAD00B59C
      AD00636363004242420000000000000000000000000000000000000000006363
      6300000000006363630063636300636363006363630063636300636363000000
      0000636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000000000636363000000
      0000636363000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000636363000000
      0000636363000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000063636300636363006363630000000000000000000000
      0000000000006363630042424200000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FC7FF00300000000
      C001E003000000008001EFF300000000BEF9EFF300000000A289E9D300000000
      BEF9EE7300000000B2A9EA1300000000BEF9EF0B00000000AA99ED0700000000
      BEF9EF8300000000A289E84100000000BC79EFE3000000008383EFF700000000
      FFFFE00F00000000FFFFFFFF00000000FFFFFFFFFFFFFFFFE003E003F003FC7F
      C003C003E003C001C003C003EFF38001C003C003EFF3BEF9C003C003E853A289
      C003C003EFF3BEF9C003C003E813B2A9C003C003EFF3BEF9C003C003EC93AA99
      C003C003EFF3BEF9C003C003E813A289D7F3D7F3EFF3BC79C007C007EFF38383
      FFFFFFFFE007FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object CmnDataSourceAccInfo: TDataSource
    DataSet = CmnMemDataAccInfo
    OnStateChange = fnCmnDataSourceAccInfoOnStateChange
    Left = 30
    Top = 241
  end
  object CmnMemDataAccInfo: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = fnCmnMemDataAccInfoBeforePost
    Left = 114
    Top = 229
    object CmnMemDataAccInfonAccountCode: TIntegerField
      DisplayWidth = 4
      FieldName = 'nAccountCode'
      DisplayFormat = '0000'
      EditFormat = '0000'
      MaxValue = 9999
    end
    object CmnMemDataAccInfostrBankCode: TStringField
      FieldName = 'strBankCode'
      Size = 10
    end
    object CmnMemDataAccInfostrBankNameSimple: TStringField
      FieldName = 'strBankNameSimple'
      Size = 14
    end
    object CmnMemDataAccInfonDivision: TSmallintField
      FieldKind = fkLookup
      FieldName = 'nDepDivision'
      LookupDataSet = CmnMemDataAccInfoDeposit
      LookupKeyFields = 'nDivision'
      LookupResultField = 'nDivision'
      KeyFields = 'nDepDivisionData'
      DisplayFormat = '#'
      Lookup = True
    end
    object CmnMemDataAccInfostrDivisionDesc: TStringField
      DisplayWidth = 24
      FieldKind = fkLookup
      FieldName = 'strDepDivisionDesc'
      LookupDataSet = CmnMemDataAccInfoDeposit
      LookupKeyFields = 'nDivision'
      LookupResultField = 'strDescription'
      KeyFields = 'nDepDivisionData'
      Size = 24
      Lookup = True
    end
    object CmnMemDataAccInfonDivisionData: TSmallintField
      FieldName = 'nDepDivisionData'
    end
    object CmnMemDataAccInfoAccountNo: TStringField
      FieldName = 'strAccountNo'
      Size = 8
    end
    object CmnMemDataAccInfostrClientCode: TStringField
      FieldName = 'strClientCode'
      Size = 10
    end
    object CmnMemDataAccInfostrClientNameKana: TStringField
      FieldName = 'strClientNameKana'
      Size = 40
    end
    object CmnMemDataAccInfonNCODE: TFloatField
      FieldName = 'nNCODE'
    end
  end
  object CmnMemDataAccInfoDeposit: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 138
    Top = 209
    object IntegerField1: TIntegerField
      DisplayWidth = 2
      FieldName = 'nDivision'
    end
    object StringField1: TStringField
      DisplayWidth = 8
      FieldName = 'strDescription'
      Size = 30
    end
  end
  object CmnToolbarImage: TImageList
    Height = 15
    Left = 40
    Top = 68
    Bitmap = {
      494C010104000900040010000F00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001E0000000100200000000000001E
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      28000000400000001E0000000100010000000000F00000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      8007800780078007800380038003800380018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      00000000000000000000000000000000000000000000}
  end
  object CmnDataSourceHojyoMA: TDataSource
    DataSet = CmnMemDataHojyoMA
    OnStateChange = fnCmnDataSourceHojyoMAOnStateChange
    Left = 38
    Top = 184
  end
  object CmnMemDataHojyoMA: TdxMemData
    Indexes = <>
    SortOptions = []
    SortedField = 'orderCODE'
    BeforePost = fnCmnMemDataHojyoMABeforePost
    AfterPost = CmnMemDataHojyoMAAfterPost
    Left = 106
    Top = 144
    object CmnMemDataHojyoMATag: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object CmnMemDataHojyoMAnBKCODE: TIntegerField
      DisplayWidth = 4
      FieldName = 'nBKCODE'
      DisplayFormat = '0000'
      EditFormat = '0000'
      MaxValue = 9999
    end
    object CmnMemDataHojyoMAnBraCode: TIntegerField
      DisplayWidth = 3
      FieldName = 'nBrCode'
      DisplayFormat = '000'
      EditFormat = '000'
      MaxValue = 999
    end
    object CmnMemDataHojyoMAName: TStringField
      DisplayLabel = 'strBkName'
      DisplayWidth = 40
      FieldName = 'strBKName'
      Size = 60
    end
    object CmnMemDataHojyoMAstrBkKana: TStringField
      FieldName = 'strBkKana'
      Size = 15
    end
    object CmnMemDataHojyoMAstrBrName: TStringField
      FieldName = 'strBrName'
      Size = 30
    end
    object CmnMemDataHojyoMAstrBrKana: TStringField
      FieldName = 'strBrKana'
      Size = 15
    end
    object CmnMemDataHojyoMAComment: TStringField
      FieldName = 'strComment'
      Size = 60
    end
    object CmnMemDataHojyoMAnCODE: TFloatField
      FieldName = 'nCODE'
    end
    object CmnMemDataHojyoMAOffDNcode: TFloatField
      FieldName = 'OffDNcode'
    end
    object CmnMemDataHojyoMAOffDNm: TStringField
      FieldKind = fkLookup
      FieldName = 'OffDNm'
      LookupDataSet = dxMemDataNM
      LookupKeyFields = 'NCODE'
      LookupResultField = 'NM'
      KeyFields = 'OffDNCode'
      Size = 40
      Lookup = True
    end
    object CmnMemDataHojyoMAOffDCode: TIntegerField
      FieldKind = fkLookup
      FieldName = 'OffDCode'
      LookupDataSet = dxMemDataNM
      LookupKeyFields = 'NCODE'
      LookupResultField = 'CODE'
      KeyFields = 'OffDNcode'
      Required = True
      DisplayFormat = '#'
      Lookup = True
    end
    object CmnMemDataHojyoMAorderCODE: TFloatField
      FieldName = 'orderCODE'
    end
    object CmnMemDataHojyoMAstrRenso: TStringField
      FieldName = 'strRenso'
      Size = 10
    end
  end
  object CmnPopupMenuTreeView: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = fnCmnPopupMenuTreeViewOnPopup
    Left = 12
    Top = 94
    object CmnPopupMenuTreeViewDetail: TMenuItem
      Caption = #35443#32048
      ImageIndex = 0
      OnClick = fnCmnPopupMenuTreeViewDetailOnClick
    end
    object CmnTreeViewPopupMenuBreak01: TMenuItem
      Caption = '-'
    end
    object CmnPopupMenuTreeViewDelete: TMenuItem
      Caption = #21066#38500
      ImageIndex = 0
      OnClick = fnCmnPopupMenuTreeViewDeleteOnClick
    end
    object CmnTreeViewPopupMenuBreak03: TMenuItem
      Caption = '-'
    end
    object CmnPopupMenuTreeViewTagOff: TMenuItem
      Caption = #12399#12364#12377'(&D)'
      OnClick = fnCmnPopupMenuTreeViewTagOnClick
    end
    object CmnPopupMenuTreeViewTagComment: TMenuItem
      Caption = #20633#32771#20462#27491'(&U)...'
      OnClick = fnCmnPopupMenuTreeViewTagOnClickEx
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CmnPopupMenuTreeViewTag01: TMenuItem
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
      ImageIndex = 0
      object CmnPopupMenuTreeViewTagItem01: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnPopupMenuTreeViewTagOnClick
      end
      object CmnPopupMenuTreeViewTagItem01Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnPopupMenuTreeViewTagOnClickEx
      end
    end
    object CmnPopupMenuTreeViewTag02: TMenuItem
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
      ImageIndex = 0
      object CmnPopupMenuTreeViewTagItem02: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnPopupMenuTreeViewTagOnClick
      end
      object CmnPopupMenuTreeViewTagItem02Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnPopupMenuTreeViewTagOnClickEx
      end
    end
    object CmnPopupMenuTreeViewTag03: TMenuItem
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
      ImageIndex = 0
      object CmnPopupMenuTreeViewTagItem03: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnPopupMenuTreeViewTagOnClick
      end
      object CmnPopupMenuTreeViewTagItem03Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnPopupMenuTreeViewTagOnClickEx
      end
    end
    object CmnPopupMenuTreeViewTag04: TMenuItem
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
      ImageIndex = 0
      object CmnPopupMenuTreeViewTagItem04: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnPopupMenuTreeViewTagOnClick
      end
      object CmnPopupMenuTreeViewTagItem04Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnPopupMenuTreeViewTagOnClickEx
      end
    end
  end
  object CmnPopupMenuGridHojyoMA: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = fnCmnPopupMenuGridHojyoMAOnPopup
    Left = 40
    Top = 94
    object CmnPopupMenuGridHojyoMATagOff: TMenuItem
      Caption = #12399#12364#12377'(&D)'
      OnClick = fnCmnPopupMenuGridHojyoMATagOnClick
    end
    object CmnPopupMenuGridHojyoMATagComment: TMenuItem
      Caption = #20633#32771#20462#27491'(&U)...'
      OnClick = fnCmnPopupMenuGridHojyoMATagOnClickEx
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object CmnPopupMenuGridHojyoMATag01: TMenuItem
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
      ImageIndex = 0
      object CmnPopupMenuGridHojyoMATagItem01: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnPopupMenuGridHojyoMATagOnClick
      end
      object CmnPopupMenuGridHojyoMATagItem01Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnPopupMenuGridHojyoMATagOnClickEx
      end
    end
    object CmnPopupMenuGridHojyoMATag02: TMenuItem
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
      ImageIndex = 0
      object CmnPopupMenuGridHojyoMATagItem02: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnPopupMenuGridHojyoMATagOnClick
      end
      object CmnPopupMenuGridHojyoMATagItem02Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnPopupMenuGridHojyoMATagOnClickEx
      end
    end
    object CmnPopupMenuGridHojyoMATag03: TMenuItem
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
      ImageIndex = 0
      object CmnPopupMenuGridHojyoMATagItem03: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnPopupMenuGridHojyoMATagOnClick
      end
      object CmnPopupMenuGridHojyoMATagItem03Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnPopupMenuGridHojyoMATagOnClickEx
      end
    end
    object CmnPopupMenuGridHojyoMATag04: TMenuItem
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
      ImageIndex = 0
      object CmnPopupMenuGridHojyoMATagItem04: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnPopupMenuGridHojyoMATagOnClick
      end
      object CmnPopupMenuGridHojyoMATagItem04Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnPopupMenuGridHojyoMATagOnClickEx
      end
    end
  end
  object CmnFuriganaName: TMFurigana
    Left = 12
    Top = 124
  end
  object CmnOpenDialogFileName: TMOpenDialog
    Left = 40
    Top = 124
  end
  object CmnPipelinePrintStandard: TppDBPipeline
    DataSource = CmnDataSourcePrintStandard
    UserName = 'CmnPipelinePrintStandard'
    Left = 66
    Top = 306
    object CmnPipelinePrintStandardppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object CmnPipelinePrintStandardppField2: TppField
      FieldAlias = 'grTag'
      FieldName = 'grTag'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
    object CmnPipelinePrintStandardppField3: TppField
      FieldAlias = 'strBankCode'
      FieldName = 'strBankCode'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object CmnPipelinePrintStandardppField4: TppField
      FieldAlias = 'strName'
      FieldName = 'strName'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object CmnPipelinePrintStandardppField5: TppField
      FieldAlias = 'strNameSimple'
      FieldName = 'strNameSimple'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object CmnPipelinePrintStandardppField6: TppField
      FieldAlias = 'strAssociation'
      FieldName = 'strAssociation'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object CmnPipelinePrintStandardppField7: TppField
      FieldAlias = 'dtAppDateStart'
      FieldName = 'dtAppDateStart'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 6
    end
    object CmnPipelinePrintStandardppField8: TppField
      FieldAlias = 'dtAppDateEnd'
      FieldName = 'dtAppDateEnd'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 7
    end
    object CmnPipelinePrintStandardppField9: TppField
      FieldAlias = 'dtUpdateDate'
      FieldName = 'dtUpdateDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
  end
  object CmnMemDataPrintStandard: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 38
    Top = 306
    object CmnMemDataPrintStandardTag: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object CmnMemDataPrintStandardBankCode: TStringField
      FieldName = 'strBankCode'
      Size = 10
    end
    object CmnMemDataPrintStandardName: TStringField
      FieldName = 'strName'
      Size = 60
    end
    object CmnMemDataPrintStandardNameSimple: TStringField
      FieldName = 'strNameSimple'
      Size = 14
    end
    object CmnMemDataPrintStandardAssociation: TStringField
      FieldName = 'strAssociation'
      Size = 10
    end
    object CmnMemDataPrintStandardAppDateStart: TDateField
      FieldName = 'dtAppDateStart'
    end
    object CmnMemDataPrintStandardAppDateEnd: TDateField
      FieldName = 'dtAppDateEnd'
    end
    object CmnMemDataPrintStandardUpdateDate: TDateTimeField
      FieldName = 'dtUpdateDate'
    end
  end
  object CmnDataSourcePrintStandard: TDataSource
    DataSet = CmnMemDataPrintStandard
    Left = 10
    Top = 306
  end
  object CmnReportDetail: TppReport
    AutoStop = False
    ColumnPositions.Strings = (
      '20000')
    DataPipeline = CmnPipelinePrintDetail
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RReport1'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (257x364mm)'
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
    Template.FileName = 'D:\'#26032#20250#35336#12471#12473#12486#12512'\JNTCRP008002\'#37504#34892#35443#32048#12522#12473#12488'.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = fnCmnReportBeforePrint
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
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 94
    Top = 334
    Version = '19.04'
    mmColumnWidth = 339067
    DataPipelineName = 'CmnPipelinePrintDetail'
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
      mmHeight = 16256
      mmPrintPosition = 0
      object CmnReportDetailSysVarDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
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
        mmLeft = 250826
        mmTop = 0
        mmWidth = 57150
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportDetailLabelCorpCode: TppLabel
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
        mmLeft = 26458
        mmTop = 529
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportDetailLabelCorpName: TppLabel
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
        mmLeft = 35719
        mmTop = 529
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportDetailLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'CmnReportDetailLabelTitle'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #37504#34892#35443#32048#12522#12473#12488
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
        mmLeft = 145257
        mmTop = 5556
        mmWidth = 44450
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportDetailLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2646
        mmLeft = 144992
        mmTop = 10319
        mmWidth = 44979
        BandType = 0
        LayerName = Foreground
      end
    end
    object CmnDetailBandDetail: TppDetailBand
      BeforeGenerate = fnCmnReportDetailBandBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 52832
      mmPrintPosition = 0
      object ppLine35: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line302'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 181636
        mmTop = 0
        mmWidth = 126416
        BandType = 4
        LayerName = Foreground
      end
      object ppLine15: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 50419
        mmTop = 8128
        mmWidth = 131217
        BandType = 4
        LayerName = Foreground
      end
      object CmnReportDetailDBTextBankCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBankCode'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 27203
        mmTop = 0
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Seishiki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimple'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 27203
        mmTop = 4064
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText15: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAllBankCodeDesc'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 89611
        mmTop = 4064
        mmWidth = 48006
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText17: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBranchCodeDesc'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 89611
        mmTop = 8128
        mmWidth = 48006
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText18: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Bunseki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strPayDivisionDesc'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 272786
        mmTop = 0
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText19: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Seikaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nAllBankCode'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '0000'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 89611
        mmTop = 0
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground
      end
      object ppLine16: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 52832
        mmLeft = 53188
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine17: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 52832
        mmLeft = 86792
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine18: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 52832
        mmLeft = 26416
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine19: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line8'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 52832
        mmLeft = 306020
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText21: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_KashiKuriName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strFeeDivisionDesc'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 206905
        mmTop = 0
        mmWidth = 48419
        BandType = 4
        LayerName = Foreground
      end
      object ppLine20: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line9'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12192
        mmLeft = 154001
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine21: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line108'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.500000000000000000
        EllipseSize = 50
        mmHeight = 52832
        mmLeft = 48387
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine22: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line109'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 12192
        mmLeft = 136398
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine23: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line110'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 44704
        mmLeft = 224409
        mmTop = 8128
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine24: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line111'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 203730
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground
      end
      object ppLine25: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line107'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.500000000000000000
        EllipseSize = 50
        mmHeight = 52832
        mmLeft = 179604
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine26: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line13'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 48768
        mmLeft = 200406
        mmTop = 4064
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground
      end
      object ppLine30: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line30'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 50419
        mmTop = 28448
        mmWidth = 131217
        BandType = 4
        LayerName = Foreground
      end
      object ppLine31: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line301'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 50419
        mmTop = 36576
        mmWidth = 131217
        BandType = 4
        LayerName = Foreground
      end
      object CmnLineReportDetailDetailBand: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'CmnLineReportDetailDetailBand'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.500000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 26416
        mmTop = 48768
        mmWidth = 281636
        BandType = 4
        LayerName = Foreground
      end
      object ppLine37: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line37'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 181636
        mmTop = 4064
        mmWidth = 126416
        BandType = 4
        LayerName = Foreground
      end
      object ppLine38: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line38'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 181636
        mmTop = 16256
        mmWidth = 126416
        BandType = 4
        LayerName = Foreground
      end
      object ppLine39: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line39'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 181636
        mmTop = 28448
        mmWidth = 126416
        BandType = 4
        LayerName = Foreground
      end
      object ppLine40: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line1101'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 48768
        mmLeft = 248412
        mmTop = 4064
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine41: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line1102'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 48768
        mmLeft = 262814
        mmTop = 4064
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine42: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line1103'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 48768
        mmLeft = 277216
        mmTop = 4064
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine43: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line1104'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 48768
        mmLeft = 291618
        mmTop = 4064
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'RLKamokuName2'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20840
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 51207
        mmTop = 0
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label12'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #37504
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 51207
        mmTop = 4064
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label13'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21332
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 51207
        mmTop = 8128
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Bunseki1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strFileName'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 89611
        mmTop = 16256
        mmWidth = 80010
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText24: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Bunseki2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strVolumeName'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 89611
        mmTop = 20320
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText25: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Bunseki3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strLayoutPathDraft'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 89611
        mmTop = 32512
        mmWidth = 80010
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText26: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Bunseki4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strChaDivisionDraftDesc'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 89694
        mmTop = 36576
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText27: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Bunseki5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strLayoutPathCheck'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 89611
        mmTop = 40640
        mmWidth = 80010
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText28: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Bunseki6'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strChaDivisionCheckDesc'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 89611
        mmTop = 44704
        mmWidth = 14288
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label16'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'FB'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 51207
        mmTop = 12192
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label17'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #24773
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 51207
        mmTop = 16256
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel18: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label18'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #22577
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 51207
        mmTop = 20320
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel19: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label19'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #23567
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 51207
        mmTop = 40640
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label20'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20999
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 51207
        mmTop = 44704
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel21: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label21'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25163
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 51207
        mmTop = 48768
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel22: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label22'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25163
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 51207
        mmTop = 32512
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel23: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label23'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #24418
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 51207
        mmTop = 36576
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel24: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label24'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20840#37504#21332#12467#12540#12489
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 56007
        mmTop = 0
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel25: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label25'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #37504#34892#21517#31216
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 56007
        mmTop = 4064
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel26: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label26'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25903#24215#21517#31216
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 56007
        mmTop = 8128
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel27: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label27'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25391#36796#26041#27861
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmLeft = 257705
        mmTop = 0
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel29: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25903#25173' '#12501#12449#12452#12523#21517#31216
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 56007
        mmTop = 16256
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel30: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label30'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12288#12288' '#12508#12522#12517#12540#12512#21517#31216
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 56007
        mmTop = 20320
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel32: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label32'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12524#12452#12450#12454#12488#12501#12449#12452#12523#21517
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 56007
        mmTop = 32512
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel33: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label33'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25991#23383#31278#21029
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 56007
        mmTop = 36576
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel34: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label34'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12524#12452#12450#12454#12488#12501#12449#12452#12523#21517
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 56007
        mmTop = 40640
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel35: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label201'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25991#23383#31278#21029
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 56007
        mmTop = 44704
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel36: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label36'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = '-'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 97612
        mmTop = 0
        mmWidth = 1600
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText29: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Seikaku1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nBranchCode'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '000'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 100813
        mmTop = 0
        mmWidth = 4801
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel37: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label37'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12459#12490#37504#34892#21517
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 139218
        mmTop = 4064
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel38: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label38'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12459#12490#25903#24215#21517
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 139218
        mmTop = 8128
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText30: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Kanryaku1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAllBankCodeDescKana'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 156820
        mmTop = 4064
        mmWidth = 24003
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText31: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Renso1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBranchCodeDescKana'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 156820
        mmTop = 8128
        mmWidth = 24003
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText32: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Bunseki7'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strFBCodeModeDesc'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 89694
        mmTop = 12192
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText33: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Bunseki8'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strRecordPauseDesc'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 123031
        mmTop = 12192
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel39: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label39'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21322#35282#12467#12540#12489#20307#31995
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 56007
        mmTop = 12192
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel40: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label40'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12524#12467#12540#12489#21306#20999
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 102129
        mmTop = 12192
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel41: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label41'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31278#39006
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = True
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 184944
        mmTop = 4064
        mmWidth = 14023
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel42: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label42'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27161#28310#25163#25968#26009
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 182423
        mmTop = 12192
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel43: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label43'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'FB'#29992#25163#25968#26009
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 182423
        mmTop = 24384
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel44: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label44'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31379#21475#29992#25163#25968#26009
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 182423
        mmTop = 36576
        mmWidth = 19202
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel45: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label45'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#20197#19978
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 216027
        mmTop = 40640
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel46: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label202'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#20197#19978
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 216027
        mmTop = 36576
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel47: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label47'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#20197#19978
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 216027
        mmTop = 32512
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel48: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label48'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#20197#19978
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 216027
        mmTop = 28448
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel49: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label49'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#20197#19978
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 216027
        mmTop = 24384
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel50: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label50'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#20197#19978
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 216027
        mmTop = 20320
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel51: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label51'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#20197#19978
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 216027
        mmTop = 16256
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel52: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label52'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#20197#19978
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 216027
        mmTop = 12192
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel53: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label53'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#20197#19978
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 216027
        mmTop = 8128
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel54: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label54'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#26410#28288
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 240030
        mmTop = 8128
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel55: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label55'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#26410#28288
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 240030
        mmTop = 12192
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel57: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label57'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#26410#28288
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 240030
        mmTop = 20320
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel59: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label59'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#26410#28288
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 240030
        mmTop = 24384
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel63: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label63'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#26410#28288
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 240030
        mmTop = 32512
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel64: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label203'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870#26410#28288
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 240030
        mmTop = 36576
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel66: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label66'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 260833
        mmTop = 40640
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel67: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label204'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 260833
        mmTop = 36576
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel68: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label68'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 260833
        mmTop = 32512
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel69: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label69'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 260833
        mmTop = 28448
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel70: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label70'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 260833
        mmTop = 24384
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel72: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label72'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 260833
        mmTop = 20320
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel73: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label73'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 260833
        mmTop = 16256
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel74: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label74'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 260833
        mmTop = 12192
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel75: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label75'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 260833
        mmTop = 8128
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel76: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label76'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 275235
        mmTop = 40640
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel77: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label205'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 275235
        mmTop = 36576
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel78: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label78'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 275235
        mmTop = 32512
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel79: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label79'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 275235
        mmTop = 28448
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel80: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label80'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 275235
        mmTop = 24384
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel81: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label81'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 275235
        mmTop = 20320
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel82: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label82'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 275235
        mmTop = 16256
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel83: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label83'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 275235
        mmTop = 12192
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel84: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label84'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 275235
        mmTop = 8128
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel88: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label88'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 289637
        mmTop = 40640
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel89: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label206'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 289637
        mmTop = 36576
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel90: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label90'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 289637
        mmTop = 32512
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel92: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label92'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 289637
        mmTop = 28448
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel93: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label93'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 289637
        mmTop = 24384
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel94: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label94'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 289637
        mmTop = 20320
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel95: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label95'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 289637
        mmTop = 16256
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel96: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label96'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 289637
        mmTop = 12192
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel97: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label97'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 289637
        mmTop = 8128
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel98: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label98'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 304039
        mmTop = 40640
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel99: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label207'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 304039
        mmTop = 36576
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel100: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label100'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 304039
        mmTop = 32512
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel101: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label101'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 304039
        mmTop = 28448
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel103: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label103'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 304039
        mmTop = 24384
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel104: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label104'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 304039
        mmTop = 20320
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel105: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label105'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 304039
        mmTop = 16256
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel106: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label106'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 304039
        mmTop = 12192
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel107: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label107'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20870
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 304039
        mmTop = 8128
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText34: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText34'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWinScopeFr03'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 203226
        mmTop = 40640
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText35: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText35'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWinScopeFr02'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 203226
        mmTop = 36576
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText36: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText36'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWinScopeFr01'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 203226
        mmTop = 32512
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText37: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText37'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbuScopeFr03'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 203226
        mmTop = 28448
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText38: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText38'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbuScopeFr02'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 203226
        mmTop = 24384
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText39: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText39'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbuScopeFr01'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 203226
        mmTop = 20320
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText40: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Bunseki9'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStdScopeFr03'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 203226
        mmTop = 16256
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText41: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Renso2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStdScopeFr02'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 203226
        mmTop = 12192
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText42: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Kanryaku2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStdScopeFr01'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 203226
        mmTop = 8128
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText44: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText44'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWinScopeRe02'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 227229
        mmTop = 36576
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText45: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText45'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWinScopeRe01'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 227229
        mmTop = 32512
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText47: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText47'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbuScopeRe02'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 227229
        mmTop = 24384
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText48: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText48'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbuScopeRe01'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 227229
        mmTop = 20320
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText50: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText50'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStdScopeRe02'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 227229
        mmTop = 12192
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText51: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText51'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStdScopeRe01'
        DataPipeline = CmnPipelinePrintDetail
        DisplayFormat = '#,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 227229
        mmTop = 8128
        mmWidth = 11201
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText58: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText58'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0104'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 251232
        mmTop = 8128
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText59: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText59'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0204'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 251232
        mmTop = 12192
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText60: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText60'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0304'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 251232
        mmTop = 16256
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText61: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText61'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0104'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 251232
        mmTop = 20320
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText63: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText63'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0204'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 251232
        mmTop = 24384
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText64: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText64'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0304'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 251232
        mmTop = 28448
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText65: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText65'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0104'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 251232
        mmTop = 32512
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText66: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText66'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0204'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 251232
        mmTop = 36576
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText67: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText67'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0304'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 251232
        mmTop = 40640
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText68: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText68'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0103'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 265634
        mmTop = 8128
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText69: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText69'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0203'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 265634
        mmTop = 12192
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText70: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText70'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0303'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 265634
        mmTop = 16256
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText71: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText71'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0103'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 265634
        mmTop = 20320
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText72: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText72'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0203'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 265634
        mmTop = 24384
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText73: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText73'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0303'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 265634
        mmTop = 28448
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText74: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText74'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0103'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 265634
        mmTop = 32512
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText75: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText75'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0203'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 265634
        mmTop = 36576
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText76: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText76'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0303'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 265634
        mmTop = 40640
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText77: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText77'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0102'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 280036
        mmTop = 8128
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText78: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText78'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0202'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 280036
        mmTop = 12192
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText79: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText79'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0302'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 280036
        mmTop = 16256
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText80: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText80'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0102'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 280036
        mmTop = 20320
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText81: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText81'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0202'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 280036
        mmTop = 24384
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText82: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText82'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0302'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 280036
        mmTop = 28448
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText83: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText83'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0102'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 280036
        mmTop = 32512
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText84: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText84'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0202'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 280036
        mmTop = 36576
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText86: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText86'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0302'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 280036
        mmTop = 40640
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText87: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText87'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0101'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 294437
        mmTop = 8128
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText88: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText88'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0201'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 294437
        mmTop = 12192
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText89: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceStd0301'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 294437
        mmTop = 16256
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText90: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText90'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0101'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 294437
        mmTop = 20320
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText91: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText91'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0201'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 294437
        mmTop = 24384
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText92: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText92'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceFbu0301'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 294437
        mmTop = 28448
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText93: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText93'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0101'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 294437
        mmTop = 32512
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText94: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText94'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0201'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 294437
        mmTop = 36576
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText95: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText95'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nFeePriceWin0301'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 294437
        mmTop = 40640
        mmWidth = 8001
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel56: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label56'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #37329#38989#31684#22258
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = True
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 210080
        mmTop = 4064
        mmWidth = 32279
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel62: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label62'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21516#19968#24215#23451
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 251232
        mmTop = 4064
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel65: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label65'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26412#25903#24215#23451
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 265634
        mmTop = 4064
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel108: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label108'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20182#34892#25991#26360
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 280036
        mmTop = 4064
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel109: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label109'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20182#34892#38651#20449
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        mmHeight = 4064
        mmLeft = 294437
        mmTop = 4064
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel110: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label110'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25163#25968#26009#36969#29992#21306#20998
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 182298
        mmTop = 0
        mmWidth = 23019
        BandType = 4
        LayerName = Foreground
      end
      object ppLine5: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 255059
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground
      end
      object ppLine9: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line10'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 269611
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label401'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #65318#65314#36865#20449#21306#20998
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 135467
        mmTop = 12192
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strFBSendDivisionDesc'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 156369
        mmTop = 12192
        mmWidth = 24871
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label8'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #32076#36027' '#12501#12449#12452#12523#21517#31216
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 56007
        mmTop = 24384
        mmWidth = 32015
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strFileNameExp'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 3969
        mmLeft = 89611
        mmTop = 24384
        mmWidth = 79904
        BandType = 4
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label301'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12288#12288' '#12508#12522#12517#12540#12512#21517#31216
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        VerticalAlignment = avCenter
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        mmHeight = 4064
        mmLeft = 56007
        mmTop = 28448
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText7'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strVolumeNameExp'
        DataPipeline = CmnPipelinePrintDetail
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintDetail'
        mmHeight = 4064
        mmLeft = 89611
        mmTop = 28448
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground
      end
      object ppLine10: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line102'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 181636
        mmTop = 40640
        mmWidth = 126471
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
      object CmnReportDetailSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'SVppPage'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 339197
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppGroup2: TppGroup
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
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        mmBottomOffset = 0
        mmHeight = 4064
        mmPrintPosition = 0
        object ppLine28: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'LineJK_Bottom'
          Border.mmPadding = 0
          Position = lpBottom
          Weight = 0.750000000000000000
          EllipseSize = 50
          mmHeight = 4064
          mmLeft = 26416
          mmTop = 0
          mmWidth = 281636
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine27: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'LineJK_Top'
          Border.mmPadding = 0
          Weight = 0.750000000000000000
          EllipseSize = 50
          mmHeight = 4064
          mmLeft = 26416
          mmTop = 0
          mmWidth = 281636
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel10: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'Label2'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = #20840#37504#21332#65295#65318#65314#24773#22577
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
          Distributed = True
          Layout = tlCenter
          Distributed2 = False
          mmHeight = 3969
          mmLeft = 84138
          mmTop = 0
          mmWidth = 63236
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine29: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'Line5'
          Border.mmPadding = 0
          Position = lpRight
          Weight = 0.500000000000000000
          EllipseSize = 50
          mmHeight = 4064
          mmLeft = 48387
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine33: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'Line106'
          Border.mmPadding = 0
          Position = lpRight
          Weight = 0.500000000000000000
          EllipseSize = 50
          mmHeight = 4064
          mmLeft = 179604
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel14: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'Label102'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = #25163#25968#26009
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Name = #65325#65331' '#26126#26397
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          VerticalAlignment = avCenter
          Distributed = True
          Layout = tlCenter
          Distributed2 = False
          mmHeight = 3970
          mmLeft = 227278
          mmTop = 0
          mmWidth = 38629
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine34: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'LineJK_Right'
          Border.mmPadding = 0
          Position = lpRight
          Weight = 0.750000000000000000
          EllipseSize = 50
          mmHeight = 4064
          mmLeft = 306020
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel15: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'RLKamokuName'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = #37504#34892#21517
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Name = #65325#65331' '#26126#26397
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          VerticalAlignment = avCenter
          Distributed = True
          Layout = tlCenter
          Distributed2 = False
          mmHeight = 3969
          mmLeft = 30956
          mmTop = 0
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine36: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer1
          UserName = 'LineJK_Left'
          Border.mmPadding = 0
          Position = lpLeft
          Weight = 0.750000000000000000
          EllipseSize = 50
          mmHeight = 4064
          mmLeft = 26416
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
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
  object CmnDataSourcePrintDetail: TDataSource
    DataSet = CmnMemDataPrintDetail
    Left = 10
    Top = 334
  end
  object CmnMemDataPrintDetail: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 38
    Top = 334
    object CmnMemDataPrintDetailTag: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object CmnMemDataPrintDetailBankCode: TStringField
      FieldName = 'strBankCode'
      Size = 10
    end
    object CmnMemDataPrintDetailNameSimple: TStringField
      FieldName = 'strNameSimple'
      Size = 14
    end
    object CmnMemDataPrintDetailAllBankCode: TIntegerField
      FieldName = 'nAllBankCode'
    end
    object CmnMemDataPrintDetailBranchCode: TIntegerField
      FieldName = 'nBranchCode'
    end
    object CmnMemDataPrintDetailAllBankCodeDesc: TStringField
      FieldName = 'strAllBankCodeDesc'
      Size = 30
    end
    object CmnMemDataPrintDetailAllBankCodeDescKana: TStringField
      FieldName = 'strAllBankCodeDescKana'
      Size = 15
    end
    object CmnMemDataPrintDetailBranchCodeDesc: TStringField
      FieldName = 'strBranchCodeDesc'
      Size = 30
    end
    object CmnMemDataPrintDetailBranchCodeDescKana: TStringField
      FieldName = 'strBranchCodeDescKana'
      Size = 15
    end
    object CmnMemDataPrintDetailPayDivisionDesc: TStringField
      FieldName = 'strPayDivisionDesc'
      Size = 10
    end
    object CmnMemDataPrintDetailstrFBSendDivisionDesc: TStringField
      FieldName = 'strFBSendDivisionDesc'
      Size = 10
    end
    object CmnMemDataPrintDetailFBCodeModeDesc: TStringField
      FieldName = 'strFBCodeModeDesc'
      Size = 6
    end
    object CmnMemDataPrintDetailRecordPauseDesc: TStringField
      FieldName = 'strRecordPauseDesc'
      Size = 5
    end
    object CmnMemDataPrintDetailFileName: TStringField
      FieldName = 'strFileName'
      Size = 128
    end
    object CmnMemDataPrintDetailVolumeName: TStringField
      FieldName = 'strVolumeName'
    end
    object CmnMemDataPrintDetailstrLayoutPathDraft: TStringField
      FieldName = 'strLayoutPathDraft'
      Size = 128
    end
    object CmnMemDataPrintDetailstrChaDivisionDraftDesc: TStringField
      DisplayWidth = 8
      FieldName = 'strChaDivisionDraftDesc'
      Size = 8
    end
    object CmnMemDataPrintDetailstrLayoutPathCheck: TStringField
      FieldName = 'strLayoutPathCheck'
      Size = 128
    end
    object CmnMemDataPrintDetailstrChaDivisionCheckDesc: TStringField
      DisplayWidth = 8
      FieldName = 'strChaDivisionCheckDesc'
      Size = 8
    end
    object CmnMemDataPrintDetailFeeDivision: TSmallintField
      FieldName = 'nFeeDivision'
    end
    object CmnMemDataPrintDetailstrFeeDivisionDesc: TStringField
      DisplayWidth = 26
      FieldName = 'strFeeDivisionDesc'
      Size = 26
    end
    object CmnMemDataPrintDetailnFeePriceStdScopeFr01: TCurrencyField
      FieldName = 'nFeePriceStdScopeFr01'
    end
    object CmnMemDataPrintDetailnFeePriceStdScopeFr02: TCurrencyField
      FieldName = 'nFeePriceStdScopeFr02'
    end
    object CmnMemDataPrintDetailnFeePriceStdScopeFr03: TCurrencyField
      FieldName = 'nFeePriceStdScopeFr03'
    end
    object CmnMemDataPrintDetailnFeePriceStdScopeRe01: TCurrencyField
      FieldName = 'nFeePriceStdScopeRe01'
    end
    object CmnMemDataPrintDetailnFeePriceStdScopeRe02: TCurrencyField
      FieldName = 'nFeePriceStdScopeRe02'
    end
    object CmnMemDataPrintDetailnFeePriceStd0101: TIntegerField
      FieldName = 'nFeePriceStd0101'
    end
    object CmnMemDataPrintDetailnFeePriceStd0201: TIntegerField
      FieldName = 'nFeePriceStd0201'
    end
    object CmnMemDataPrintDetailnFeePriceStd0301: TIntegerField
      FieldName = 'nFeePriceStd0301'
    end
    object CmnMemDataPrintDetailnFeePriceStd0102: TIntegerField
      FieldName = 'nFeePriceStd0102'
    end
    object CmnMemDataPrintDetailnFeePriceStd0202: TIntegerField
      FieldName = 'nFeePriceStd0202'
    end
    object CmnMemDataPrintDetailnFeePriceStd0302: TIntegerField
      FieldName = 'nFeePriceStd0302'
    end
    object CmnMemDataPrintDetailnFeePriceStd0103: TIntegerField
      FieldName = 'nFeePriceStd0103'
    end
    object CmnMemDataPrintDetailnFeePriceStd0203: TIntegerField
      FieldName = 'nFeePriceStd0203'
    end
    object CmnMemDataPrintDetailnFeePriceStd0303: TIntegerField
      FieldName = 'nFeePriceStd0303'
    end
    object CmnMemDataPrintDetailnFeePriceStd0104: TIntegerField
      FieldName = 'nFeePriceStd0104'
    end
    object CmnMemDataPrintDetailnFeePriceStd0204: TIntegerField
      FieldName = 'nFeePriceStd0204'
    end
    object CmnMemDataPrintDetailnFeePriceStd0304: TIntegerField
      FieldName = 'nFeePriceStd0304'
    end
    object CmnMemDataPrintDetailnFeePriceFbuScopeFr01: TCurrencyField
      FieldName = 'nFeePriceFbuScopeFr01'
    end
    object CmnMemDataPrintDetailnFeePriceFbuScopeFr02: TCurrencyField
      FieldName = 'nFeePriceFbuScopeFr02'
    end
    object CmnMemDataPrintDetailnFeePriceFbuScopeFr03: TCurrencyField
      FieldName = 'nFeePriceFbuScopeFr03'
    end
    object CmnMemDataPrintDetailnFeePriceFbuScopeRe01: TCurrencyField
      FieldName = 'nFeePriceFbuScopeRe01'
    end
    object CmnMemDataPrintDetailnFeePriceFbuScopeRe02: TCurrencyField
      FieldName = 'nFeePriceFbuScopeRe02'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0101: TIntegerField
      FieldName = 'nFeePriceFbu0101'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0201: TIntegerField
      FieldName = 'nFeePriceFbu0201'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0301: TIntegerField
      FieldName = 'nFeePriceFbu0301'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0102: TIntegerField
      FieldName = 'nFeePriceFbu0102'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0202: TIntegerField
      FieldName = 'nFeePriceFbu0202'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0302: TIntegerField
      FieldName = 'nFeePriceFbu0302'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0103: TIntegerField
      FieldName = 'nFeePriceFbu0103'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0203: TIntegerField
      FieldName = 'nFeePriceFbu0203'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0303: TIntegerField
      FieldName = 'nFeePriceFbu0303'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0104: TIntegerField
      FieldName = 'nFeePriceFbu0104'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0204: TIntegerField
      FieldName = 'nFeePriceFbu0204'
    end
    object CmnMemDataPrintDetailnFeePriceFbu0304: TIntegerField
      FieldName = 'nFeePriceFbu0304'
    end
    object CmnMemDataPrintDetailnFeePriceWinScopeFr01: TCurrencyField
      FieldName = 'nFeePriceWinScopeFr01'
    end
    object CmnMemDataPrintDetailnFeePriceWinScopeFr02: TCurrencyField
      FieldName = 'nFeePriceWinScopeFr02'
    end
    object CmnMemDataPrintDetailnFeePriceWinScopeFr03: TCurrencyField
      FieldName = 'nFeePriceWinScopeFr03'
    end
    object CmnMemDataPrintDetailnFeePriceWinScopeRe01: TCurrencyField
      FieldName = 'nFeePriceWinScopeRe01'
    end
    object CmnMemDataPrintDetailnFeePriceWinScopeRe02: TCurrencyField
      FieldName = 'nFeePriceWinScopeRe02'
    end
    object CmnMemDataPrintDetailnFeePriceWin0101: TIntegerField
      FieldName = 'nFeePriceWin0101'
    end
    object CmnMemDataPrintDetailnFeePriceWin0201: TIntegerField
      FieldName = 'nFeePriceWin0201'
    end
    object CmnMemDataPrintDetailnFeePriceWin0301: TIntegerField
      FieldName = 'nFeePriceWin0301'
    end
    object CmnMemDataPrintDetailnFeePriceWin0102: TIntegerField
      FieldName = 'nFeePriceWin0102'
    end
    object CmnMemDataPrintDetailnFeePriceWin0202: TIntegerField
      FieldName = 'nFeePriceWin0202'
    end
    object CmnMemDataPrintDetailnFeePriceWin0302: TIntegerField
      FieldName = 'nFeePriceWin0302'
    end
    object CmnMemDataPrintDetailnFeePriceWin0103: TIntegerField
      FieldName = 'nFeePriceWin0103'
    end
    object CmnMemDataPrintDetailnFeePriceWin0203: TIntegerField
      FieldName = 'nFeePriceWin0203'
    end
    object CmnMemDataPrintDetailnFeePriceWin0303: TIntegerField
      FieldName = 'nFeePriceWin0303'
    end
    object CmnMemDataPrintDetailnFeePriceWin0104: TIntegerField
      FieldName = 'nFeePriceWin0104'
    end
    object CmnMemDataPrintDetailnFeePriceWin0204: TIntegerField
      FieldName = 'nFeePriceWin0204'
    end
    object CmnMemDataPrintDetailnFeePriceWin0304: TIntegerField
      FieldName = 'nFeePriceWin0304'
    end
    object CmnMemDataPrintDetailstrFileNameExp: TStringField
      FieldName = 'strFileNameExp'
      Size = 512
    end
    object CmnMemDataPrintDetailstrVolumeNameExp: TStringField
      FieldName = 'strVolumeNameExp'
    end
    object CmnMemDataPrintDetailstrAllBankCd: TStringField
      FieldName = 'strAllBankCd'
    end
    object CmnMemDataPrintDetailBillLayPath1: TStringField
      FieldName = 'BillLayPath1'
      Size = 128
    end
    object CmnMemDataPrintDetailBillLayPath2: TStringField
      FieldName = 'BillLayPath2'
      Size = 128
    end
    object CmnMemDataPrintDetailBillLayPath3: TStringField
      FieldName = 'BillLayPath3'
      Size = 128
    end
    object CmnMemDataPrintDetailBillLayPath4: TStringField
      DisplayWidth = 128
      FieldName = 'BillLayPath4'
      Size = 128
    end
    object CmnMemDataPrintDetailAccNo: TStringField
      DisplayWidth = 128
      FieldName = 'AccNo'
      Size = 128
    end
    object CmnMemDataPrintDetailBillRate: TFloatField
      FieldName = 'BillRate'
    end
    object CmnMemDataPrintDetailstrStartYMD: TStringField
      FieldName = 'strStartYMD'
    end
    object CmnMemDataPrintDetailnDensai1: TIntegerField
      FieldName = 'nDensai1'
    end
    object CmnMemDataPrintDetailnDensai2: TIntegerField
      FieldName = 'nDensai2'
    end
    object CmnMemDataPrintDetailnOversea1: TIntegerField
      FieldName = 'nOversea1'
    end
    object CmnMemDataPrintDetailnOversea2: TIntegerField
      FieldName = 'nOversea2'
    end
    object CmnMemDataPrintDetailnOversea3: TIntegerField
      FieldName = 'nOversea3'
    end
    object CmnMemDataPrintDetailstrSoukinClientCode: TStringField
      FieldName = 'strSoukinClientCode'
    end
    object CmnMemDataPrintDetailstrSoukinClientName: TStringField
      FieldName = 'strSoukinClientName'
      Size = 40
    end
    object CmnMemDataPrintDetailstrSoukinCodeModeDesc: TStringField
      DisplayWidth = 6
      FieldName = 'strSoukinCodeModeDesc'
      Size = 6
    end
    object CmnMemDataPrintDetailstrSoukinRecordPauseDesc: TStringField
      DisplayWidth = 5
      FieldName = 'strSoukinRecordPauseDesc'
      Size = 5
    end
    object CmnMemDataPrintDetailstrSoukinFileName: TStringField
      DisplayWidth = 128
      FieldName = 'strSoukinFileName'
      Size = 128
    end
  end
  object CmnPipelinePrintDetail: TppDBPipeline
    DataSource = CmnDataSourcePrintDetail
    UserName = 'CmnPipelinePrintDetail'
    Left = 66
    Top = 334
  end
  object CmnReportStandard: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (257x364mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 4999
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 4999
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 12
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
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = fnCmnReportBeforePrint
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
    Left = 94
    Top = 306
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'CmnPipelinePrintStandard'
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLine75: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line43'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 91811
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine76: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 157163
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine77: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line45'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 180975
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine78: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line46'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 198173
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine79: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line47'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 212196
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel60: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label44'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12467#12540#12489
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
        mmLeft = 78581
        mmTop = 15346
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel61: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label45'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #27491'  '#24335'  '#21517'  '#31216
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
        mmLeft = 113771
        mmTop = 15346
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label46'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #31777#30053#21517#31216
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
        mmLeft = 162984
        mmTop = 15346
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label47'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #36899#24819
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
        mmLeft = 186796
        mmTop = 15346
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label48'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #36969#29992#38283#22987
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
        mmLeft = 198967
        mmTop = 15346
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel4: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label49'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #36969#29992#32066#20102
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
        mmLeft = 212990
        mmTop = 15346
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground1
      end
      object CmnReportStandardLabelCorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportCsStdppLabelCorpCode1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20250#31038#65402#65392#65412#65438
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
        mmLeft = 74877
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground1
      end
      object CmnReportStandardLabelCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportCsStdppLabelCorpName1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20250#31038#21517#31216
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
        mmLeft = 91811
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground1
      end
      object CmnReportStandardLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23455#22312#37504#34892#30331#37682#12522#12473#12488
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
        mmLeft = 138907
        mmTop = 3175
        mmWidth = 57150
        BandType = 0
        LayerName = Foreground1
      end
      object CmnReportStandardLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2646
        mmLeft = 138377
        mmTop = 7938
        mmWidth = 57944
        BandType = 0
        LayerName = Foreground1
      end
      object CmnReportStandardSysVarDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportCsStdppSysVarDate1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
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
        mmLeft = 187590
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel5: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label69'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #26368#32066#26356#26032#26085#26178
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
        mmLeft = 230717
        mmTop = 15346
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine110: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line110'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 226219
        mmTop = 14552
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine1: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line27'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 74348
        mmTop = 17198
        mmWidth = 181240
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine2: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line28'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 74348
        mmTop = 14478
        mmWidth = 181240
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine3: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line29'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4572
        mmLeft = 74348
        mmTop = 14478
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine4: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line30'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4572
        mmLeft = 253736
        mmTop = 14478
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground1
      end
    end
    object CmnDetailBandStandard: TppDetailBand
      BeforeGenerate = fnCmnReportDetailBandBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object CmnLineReportStandardDetailBand: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 74348
        mmTop = 2381
        mmWidth = 181240
        BandType = 4
        LayerName = Foreground1
      end
      object CmnReportStandardDBTextBankCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText85'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBankCode'
        DataPipeline = CmnPipelinePrintStandard
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
        DataPipelineName = 'CmnPipelinePrintStandard'
        mmHeight = 3175
        mmLeft = 75406
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText110: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText86'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strName'
        DataPipeline = CmnPipelinePrintStandard
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
        DataPipelineName = 'CmnPipelinePrintStandard'
        mmHeight = 3175
        mmLeft = 92604
        mmTop = 529
        mmWidth = 64029
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText111: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText87'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimple'
        DataPipeline = CmnPipelinePrintStandard
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
        DataPipelineName = 'CmnPipelinePrintStandard'
        mmHeight = 3175
        mmLeft = 157957
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText112: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText88'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAssociation'
        DataPipeline = CmnPipelinePrintStandard
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
        DataPipelineName = 'CmnPipelinePrintStandard'
        mmHeight = 3175
        mmLeft = 181769
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object CmnReportStandardDBTextAppDateStart: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateStart'
        DataPipeline = CmnPipelinePrintStandard
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
        DataPipelineName = 'CmnPipelinePrintStandard'
        mmHeight = 3175
        mmLeft = 198967
        mmTop = 529
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground1
      end
      object CmnReportStandardDBTextAppDateEnd: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText90'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateEnd'
        DataPipeline = CmnPipelinePrintStandard
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
        DataPipelineName = 'CmnPipelinePrintStandard'
        mmHeight = 3175
        mmLeft = 212990
        mmTop = 529
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine82: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 74348
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine83: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line33'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 253736
        mmTop = 0
        mmWidth = 2235
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine84: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line34'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 157163
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine85: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 180975
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine86: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 198173
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine87: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line37'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 212196
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine88: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line38'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 91811
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine109: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line109'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 226219
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground1
      end
      object CmnReportStandardDBTextUpdateDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportStandardDBTextUpdateDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDate'
        DataPipeline = CmnPipelinePrintStandard
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
        DataPipelineName = 'CmnPipelinePrintStandard'
        mmHeight = 3175
        mmLeft = 227076
        mmTop = 529
        mmWidth = 28310
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand4: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object CmnReportStandardSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportCsStdppSysVarPage1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        VarType = vtPageNoDesc
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
        mmLeft = 162984
        mmTop = 1323
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground1
      end
      object CmnReportStandardAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportStandardAccOffice'
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
        mmLeft = 223838
        mmTop = 1323
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground1
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
  object CmnDataSourcePrintAccount: TDataSource
    DataSet = CmnMemDataPrintAccount
    Left = 10
    Top = 362
  end
  object CmnMemDataPrintAccount: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 38
    Top = 362
    object CmnMemDataPrintAccountnAccCode: TIntegerField
      FieldName = 'AccCode'
      DisplayFormat = '0000'
      EditFormat = '0000'
    end
    object CmnMemDataPrintAccountBankCode: TStringField
      Alignment = taRightJustify
      FieldName = 'BankCode'
      Size = 10
    end
    object CmnMemDataPrintAccountBankName: TStringField
      FieldName = 'BankName'
      Size = 14
    end
    object CmnMemDataPrintAccountstrAccKbnName: TStringField
      FieldName = 'AccKbnName'
      Size = 6
    end
    object CmnMemDataPrintAccountstrAccNo: TStringField
      FieldName = 'AccNo'
      Size = 8
    end
    object CmnMemDataPrintAccountShubetsuName: TStringField
      FieldName = 'ShubetsuName'
      Size = 10
    end
    object CmnMemDataPrintAccountRequestKbnName: TStringField
      FieldName = 'RequestKbnName'
      Size = 4
    end
    object CmnMemDataPrintAccountShumokuName: TStringField
      FieldName = 'ShumokuName'
      Size = 8
    end
    object CmnMemDataPrintAccountFBCodeModeName: TStringField
      FieldName = 'FBCodeModeName'
      Size = 12
    end
    object CmnMemDataPrintAccountRecordPauseName: TStringField
      FieldName = 'RecordPauseName'
      Size = 10
    end
    object CmnMemDataPrintAccountnClientCode: TCurrencyField
      FieldName = 'ClientCode'
      DisplayFormat = '0000000000'
      EditFormat = '0000000000'
    end
    object CmnMemDataPrintAccountAccInfo1: TStringField
      FieldName = 'AccInfo1'
      Size = 60
    end
    object CmnMemDataPrintAccountClientName: TStringField
      FieldName = 'ClientName'
      Size = 40
    end
    object CmnMemDataPrintAccountFileName: TStringField
      FieldName = 'FileName'
      Size = 100
    end
    object CmnMemDataPrintAccountVolName: TStringField
      FieldName = 'VolName'
    end
    object CmnMemDataPrintAccountFeeUseModeName: TStringField
      FieldName = 'FeeUseModeName'
      Size = 28
    end
    object CmnMemDataPrintAccountnKmkCode: TIntegerField
      FieldName = 'nKmkCode'
    end
    object CmnMemDataPrintAccountstrKmkCodeDesc: TStringField
      FieldName = 'strKmkCodeDesc'
      Size = 14
    end
    object CmnMemDataPrintAccountstrHojCode01: TStringField
      FieldName = 'strHojCode01'
      Size = 10
    end
    object CmnMemDataPrintAccountnCodeAttribute01: TSmallintField
      FieldName = 'nCodeAttribute01'
    end
    object CmnMemDataPrintAccountstrHojCodeDesc01: TStringField
      FieldName = 'strHojCodeDesc01'
      Size = 14
    end
    object CmnMemDataPrintAccountstrHojCode02: TStringField
      FieldName = 'strHojCode02'
      Size = 10
    end
    object CmnMemDataPrintAccountnCodeAttribute02: TSmallintField
      FieldName = 'nCodeAttribute02'
    end
    object CmnMemDataPrintAccountstrHojCodeDesc02: TStringField
      FieldName = 'strHojCodeDesc02'
      Size = 14
    end
    object CmnMemDataPrintAccountstrHojCode03: TStringField
      FieldName = 'strHojCode03'
      Size = 10
    end
    object CmnMemDataPrintAccountnCodeAttribute03: TSmallintField
      FieldName = 'nCodeAttribute03'
    end
    object CmnMemDataPrintAccountstrHojCodeDesc03: TStringField
      FieldName = 'strHojCodeDesc03'
      Size = 14
    end
    object CmnMemDataPrintAccountstrHojCode04: TStringField
      FieldName = 'strHojCode04'
      Size = 16
    end
    object CmnMemDataPrintAccountnCodeAttribute04: TSmallintField
      FieldName = 'nCodeAttribute04'
    end
    object CmnMemDataPrintAccountstrHojCodeDesc04: TStringField
      FieldName = 'strHojCodeDesc04'
    end
    object CmnMemDataPrintAccountstrHojCode05: TStringField
      FieldName = 'strHojCode05'
      Size = 16
    end
    object CmnMemDataPrintAccountnCodeAttribute05: TSmallintField
      FieldName = 'nCodeAttribute05'
    end
    object CmnMemDataPrintAccountstrHojCodeDesc05: TStringField
      FieldName = 'strHojCodeDesc05'
    end
    object CmnMemDataPrintAccountstrHojCode06: TStringField
      FieldName = 'strHojCode06'
      Size = 16
    end
    object CmnMemDataPrintAccountnCodeAttribute06: TSmallintField
      FieldName = 'nCodeAttribute06'
    end
    object CmnMemDataPrintAccountstrHojCodeDesc06: TStringField
      FieldName = 'strHojCodeDesc06'
      Size = 14
    end
    object CmnMemDataPrintAccountstrHojCode07: TStringField
      FieldName = 'strHojCode07'
      Size = 16
    end
    object CmnMemDataPrintAccountnCodeAttribute07: TSmallintField
      FieldName = 'nCodeAttribute07'
    end
    object CmnMemDataPrintAccountstrHojCodeDesc07: TStringField
      FieldName = 'strHojCodeDesc07'
      Size = 14
    end
    object CmnMemDataPrintAccountFeePayKbnName: TStringField
      DisplayWidth = 20
      FieldName = 'FeePayKbnName'
    end
    object CmnMemDataPrintAccountLayoutInfo: TStringField
      FieldName = 'LayoutInfo'
      Size = 512
    end
    object CmnMemDataPrintAccountAccInfo2: TStringField
      FieldName = 'AccInfo2'
      Size = 40
    end
    object CmnMemDataPrintAccountAccMemo: TStringField
      FieldName = 'AccMemo'
      Size = 60
    end
    object CmnMemDataPrintAccountAccZanLimitName: TStringField
      FieldName = 'AccZanLimitName'
    end
  end
  object CmnPipelinePrintAccount: TppDBPipeline
    DataSource = CmnDataSourcePrintAccount
    UserName = 'CmnPipelinePrintAccount'
    Left = 66
    Top = 362
  end
  object CmnReportAccount: TppReport
    AutoStop = False
    ColumnPositions.Strings = (
      '20000')
    DataPipeline = CmnPipelinePrintAccount
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RReport1'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (257x364mm)'
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
    Template.FileName = 'K:\Project25\'#35373#35336#26360'\'#35443#32048'\'#37504#34892#24773#22577#30331#37682'\'#24115#31080'\'#21475#24231#12522#12473#12488'.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = fnCmnReportBeforePrint
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
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    Left = 94
    Top = 362
    Version = '19.04'
    mmColumnWidth = 339067
    DataPipelineName = 'CmnPipelinePrintAccount'
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
      mmHeight = 16256
      mmPrintPosition = 0
      object CmnReportAccountSysVarDate: TppSystemVariable
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
        mmLeft = 243946
        mmTop = 0
        mmWidth = 57150
        BandType = 0
        LayerName = Foreground2
      end
      object CmnReportAccountLabelCorpCode: TppLabel
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
        mmLeft = 34396
        mmTop = 529
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground2
      end
      object CmnReportAccountLabelCorpName: TppLabel
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
        mmLeft = 43656
        mmTop = 529
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel6: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label6'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21475#24231#30331#37682#12522#12473#12488
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
        mmLeft = 145257
        mmTop = 5821
        mmWidth = 44450
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine8: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line12'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2646
        mmLeft = 145257
        mmTop = 10583
        mmWidth = 44450
        BandType = 0
        LayerName = Foreground2
      end
    end
    object CmnDetailBandAccount: TppDetailBand
      BeforeGenerate = fnCmnReportDetailBandBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object CmnLineReportAccountDetailBand: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7938
        mmLeft = 34396
        mmTop = 0
        mmWidth = 267230
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText57: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_BunsekiName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strClientCodeDescKana'
        DataPipeline = CmnPipelinePrintAccount
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 4064
        mmLeft = 121615
        mmTop = 0
        mmWidth = 96012
        BandType = 4
        LayerName = Foreground2
      end
      object CmnReportAccountDBTextAccountCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nAccountCode'
        DataPipeline = CmnPipelinePrintAccount
        DisplayFormat = '0000'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 3969
        mmLeft = 35190
        mmTop = 1852
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object CmnReportAccountDBTextBankCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Seishiki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBankCode'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 4064
        mmLeft = 49606
        mmTop = 0
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText52: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strDepDivisionDesc'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 4064
        mmLeft = 78410
        mmTop = 1852
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText53: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAccountNo'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 4064
        mmLeft = 89611
        mmTop = 1852
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText54: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Bunseki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nClientCode'
        DataPipeline = CmnPipelinePrintAccount
        DisplayFormat = '0000000000'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 4064
        mmLeft = 104013
        mmTop = 1852
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText55: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Seikaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nDepDivision'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 4064
        mmLeft = 73609
        mmTop = 1852
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine95: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 7925
        mmLeft = 70790
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine96: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7925
        mmLeft = 86792
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine97: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 7925
        mmLeft = 34396
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine98: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line8'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 7925
        mmLeft = 299509
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText126: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_KashiKuri'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strKmkCodeDesc'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 4064
        mmLeft = 236830
        mmTop = 0
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground2
      end
      object CmnReportAccountDBTextHojCode02: TppDBText
        OnPrint = fnCmnReportAccountDBTextHojCodeOnPrint
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_KashiKuriName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHojCode02'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 4064
        mmLeft = 260833
        mmTop = 0
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText130: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_KariKuriName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nKmkCode'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 4064
        mmLeft = 219228
        mmTop = 0
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine99: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line9'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7925
        mmLeft = 118796
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText142: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText17'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHojCodeDesc02'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 4064
        mmLeft = 278435
        mmTop = 0
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine108: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line108'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7925
        mmLeft = 46787
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine6: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line109'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7925
        mmLeft = 101194
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine7: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line110'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7925
        mmLeft = 275616
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine111: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line111'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7925
        mmLeft = 234011
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine107: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line107'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7925
        mmLeft = 216408
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine13: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line13'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7925
        mmLeft = 258234
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText1: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_BunsekiName1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strClientCodeDesc'
        DataPipeline = CmnPipelinePrintAccount
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 3704
        mmWidth = 96044
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Seishiki1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimple'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 3969
        mmLeft = 49477
        mmTop = 3704
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object CmnReportAccountDBTextHojCode01: TppDBText
        OnPrint = fnCmnReportAccountDBTextHojCodeOnPrint
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_KariKuriName1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHojCode01'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 3969
        mmLeft = 219340
        mmTop = 3704
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText4: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_KashiKuri1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHojCodeDesc01'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 3969
        mmLeft = 236803
        mmTop = 3704
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object CmnReportAccountDBTextHojCode03: TppDBText
        OnPrint = fnCmnReportAccountDBTextHojCodeOnPrint
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_KashiKuriName1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHojCode03'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 3969
        mmLeft = 260880
        mmTop = 3704
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText6: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText6'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHojCodeDesc03'
        DataPipeline = CmnPipelinePrintAccount
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
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
        DataPipelineName = 'CmnPipelinePrintAccount'
        mmHeight = 3969
        mmLeft = 278342
        mmTop = 3704
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppFooterBand5: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object CmnReportAccountSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'SVppPage'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 339197
        BandType = 8
        LayerName = Foreground2
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
        mmHeight = 3969
        mmPrintPosition = 0
        object ppLineJK_Bottom: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'LineJK_Bottom'
          Border.mmPadding = 0
          Position = lpBottom
          Weight = 0.750000000000000000
          EllipseSize = 50
          mmHeight = 4064
          mmLeft = 34417
          mmTop = 0
          mmWidth = 267234
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLineJK_Top: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'LineJK_Top'
          Border.mmPadding = 0
          Weight = 0.750000000000000000
          EllipseSize = 50
          mmHeight = 4064
          mmLeft = 34417
          mmTop = 0
          mmWidth = 267234
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel91: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'Label2'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = #25391#36796#20381#38972#20154#21517#31216
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
          Distributed = True
          Layout = tlCenter
          Distributed2 = False
          mmHeight = 3969
          mmLeft = 142611
          mmTop = 0
          mmWidth = 52123
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLine90: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'Line5'
          Border.mmPadding = 0
          Position = lpRight
          Weight = 0.750000000000000000
          EllipseSize = 50
          mmHeight = 4064
          mmLeft = 70790
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLine91: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'Line10'
          Border.mmPadding = 0
          Pen.Width = 0
          Position = lpRight
          Weight = 0.250000000000000000
          EllipseSize = 50
          mmHeight = 3969
          mmLeft = 86792
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLine92: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'Line101'
          Border.mmPadding = 0
          Pen.Width = 0
          Position = lpRight
          Weight = 0.250000000000000000
          EllipseSize = 50
          mmHeight = 3969
          mmLeft = 101194
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel28: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'Label61'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = #38928#37329#31278#21029
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
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
          mmHeight = 4064
          mmLeft = 73609
          mmTop = 0
          mmWidth = 14402
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel86: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'pL_Renso'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = #21475#24231#30058#21495
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
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
          mmHeight = 4064
          mmLeft = 89611
          mmTop = 0
          mmWidth = 12802
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel87: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'pL_Bunseki'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = #25391#36796#20381#38972#20154
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
          mmHeight = 4064
          mmLeft = 104013
          mmTop = 0
          mmWidth = 16002
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLine102: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'Line11'
          Border.mmPadding = 0
          Pen.Width = 0
          Position = lpRight
          Weight = 0.250000000000000000
          EllipseSize = 50
          mmHeight = 3969
          mmLeft = 118796
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLine106: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'Line106'
          Border.mmPadding = 0
          Pen.Width = 0
          Position = lpRight
          Weight = 0.250000000000000000
          EllipseSize = 50
          mmHeight = 3969
          mmLeft = 216408
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel117: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'Label102'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = #31185#30446#65295#37096#38272#65295#35036#21161
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Name = #65325#65331' '#26126#26397
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          VerticalAlignment = avCenter
          Distributed = True
          Layout = tlCenter
          Distributed2 = False
          mmHeight = 3969
          mmLeft = 234157
          mmTop = 0
          mmWidth = 51329
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLineJK_Right: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'LineJK_Right'
          Border.mmPadding = 0
          Position = lpRight
          Weight = 0.750000000000000000
          EllipseSize = 50
          mmHeight = 4064
          mmLeft = 299619
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel58: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'RLKamokuName'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = #21475#24231#65402#65392#65412#65438
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Name = #65325#65331' '#26126#26397
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          VerticalAlignment = avCenter
          Distributed = True
          Layout = tlCenter
          Distributed2 = False
          mmHeight = 4064
          mmLeft = 35204
          mmTop = 0
          mmWidth = 12802
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel31: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'RLKamokuName1'
          HyperlinkEnabled = False
          AutoSize = False
          Border.mmPadding = 0
          Caption = #37504#34892#21517
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Name = #65325#65331' '#26126#26397
          Font.Size = 9
          Font.Style = []
          FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
          FormFieldSettings.FormFieldType = fftNone
          TextAlignment = taCentered
          Transparent = True
          VerticalAlignment = avCenter
          Distributed = True
          Layout = tlCenter
          Distributed2 = False
          mmHeight = 3969
          mmLeft = 52388
          mmTop = 0
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLine89: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'Line4'
          Border.mmPadding = 0
          Pen.Width = 0
          Position = lpRight
          Weight = 0.250000000000000000
          EllipseSize = 50
          mmHeight = 4064
          mmLeft = 46787
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLineJK_Left: TppLine
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer3
          UserName = 'LineJK_Left'
          Border.mmPadding = 0
          Position = lpLeft
          Weight = 0.750000000000000000
          EllipseSize = 50
          mmHeight = 3969
          mmLeft = 34417
          mmTop = 0
          mmWidth = 2032
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        Background.Brush.Style = bsClear
        Border.mmPadding = 0
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
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
  object CmnPopupMenuDummy: TPopupMenu
    OnPopup = fnCmnPopupMenuDummyOnPopup
    Left = 96
    Top = 94
  end
  object dxMemDataNM: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 162
    Top = 280
    object dxMemDataNMCODE: TIntegerField
      DisplayWidth = 2
      FieldName = 'CODE'
    end
    object dxMemDataNMNM: TStringField
      DisplayWidth = 130
      FieldName = 'NM'
      Size = 40
    end
    object dxMemDataNMNCODE: TFloatField
      FieldName = 'NCODE'
    end
  end
  object aclExec: TActionList
    Left = 153
    Top = 54
    object KyujituDialog: TAction
      Category = 'Function'
      Caption = #65420#65432#65392#38917#30446
      OnExecute = fnKyujituDialogCreate
    end
  end
  object SPPayAcc: TFDStoredProc
    StoredProcName = 'MP_PAY_CHK_ACCINFO'
    Left = 8
    Top = 416
    ParamData = <
      item
        Name = '@NCode'
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
  object SPCrdAcc: TFDStoredProc
    StoredProcName = 'MP_CRD_CHK_ACCINFO'
    Left = 40
    Top = 416
    ParamData = <
      item
        Name = '@NCode'
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
  object SPHapAcc: TFDStoredProc
    StoredProcName = 'MP_HAP_CHK_ACCINFO'
    Left = 72
    Top = 416
    ParamData = <
      item
        Name = '@NCode'
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
  object SpMSHist: TFDStoredProc
    StoredProcName = 'MP_MSHIST_SETINFO'
    Left = 124
    Top = 461
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
  object CmnMemDataPrint_MLXHAP: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 134
    Top = 366
    object CmnMemDataPrint_MLXHAPAccCode: TIntegerField
      FieldName = 'AccCode'
      DisplayFormat = '0000'
      EditFormat = '0000'
    end
    object CmnMemDataPrint_MLXHAPBankCode: TStringField
      Alignment = taRightJustify
      FieldName = 'BankCode'
      Size = 10
    end
    object CmnMemDataPrint_MLXHAPSimpleName: TStringField
      FieldName = 'SimpleName'
      Size = 14
    end
    object CmnMemDataPrint_MLXHAPAccKbnName: TStringField
      FieldName = 'AccKbnName'
      Size = 6
    end
    object CmnMemDataPrint_MLXHAPAccNo: TStringField
      FieldName = 'AccNo'
      Size = 8
    end
    object CmnMemDataPrint_MLXHAPShubetsuName: TStringField
      FieldName = 'ShubetsuName'
      Size = 10
    end
    object CmnMemDataPrint_MLXHAPRequestKbnName: TStringField
      FieldName = 'RequestKbnName'
      Size = 4
    end
    object CmnMemDataPrint_MLXHAPShumokuName: TStringField
      FieldName = 'ShumokuName'
      Size = 8
    end
    object CmnMemDataPrint_MLXHAPFBCodeModeName: TStringField
      FieldName = 'FBCodeModeName'
      Size = 12
    end
    object CmnMemDataPrint_MLXHAPRecordPauseName: TStringField
      FieldName = 'RecordPauseName'
      Size = 10
    end
    object CmnMemDataPrint_MLXHAPClientCode: TCurrencyField
      FieldName = 'ClientCode'
      DisplayFormat = '0000000000'
      EditFormat = '0000000000'
    end
    object CmnMemDataPrint_MLXHAPAccInfo1: TStringField
      FieldName = 'AccInfo1'
      Size = 60
    end
    object CmnMemDataPrint_MLXHAPClientName: TStringField
      FieldName = 'ClientName'
      Size = 40
    end
    object CmnMemDataPrint_MLXHAPFileName: TStringField
      FieldName = 'FileName'
      Size = 100
    end
    object CmnMemDataPrint_MLXHAPVolName: TStringField
      FieldName = 'VolName'
    end
    object CmnMemDataPrint_MLXHAPBankName: TStringField
      FieldName = 'BankName'
      Size = 30
    end
    object CmnMemDataPrint_MLXHAPBkBraName: TStringField
      FieldName = 'BkBraName'
      Size = 30
    end
    object CmnMemDataPrint_MLXHAPBankKanaName: TStringField
      FieldName = 'BankKanaName'
      Size = 15
    end
    object CmnMemDataPrint_MLXHAPBraKanaName: TStringField
      FieldName = 'BraKanaName'
      Size = 15
    end
    object CmnMemDataPrint_MLXHAPAccZanLimitName: TStringField
      FieldName = 'AccZanLimitName'
    end
    object CmnMemDataPrint_MLXHAPAccMemo: TStringField
      FieldName = 'AccMemo'
      Size = 60
    end
  end
end
