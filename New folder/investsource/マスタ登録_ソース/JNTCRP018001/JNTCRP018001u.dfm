object JNTCRP018001f: TJNTCRP018001f
  Left = 541
  Top = 169
  BorderStyle = bsNone
  Caption = 'JNTCRP018001f'
  ClientHeight = 612
  ClientWidth = 940
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
  OnPaint = FormPaint
  OnShow = FormShow
  DesignSize = (
    940
    612)
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 220
    Top = 44
    Width = 2
    Height = 528
  end
  object MLabel39: TMLabel
    Left = 0
    Top = 25
    Width = 940
    Height = 19
    Align = alTop
    AutoSize = False
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentFont = False
    FontRatio.Auto = False
  end
  object LLabel_ECombo_Header: TMLabel
    Left = 4
    Top = 24
    Width = 67
    Height = 19
    AutoSize = False
    Caption = #12503#12525#12472#12455#12463#12488
    FontRatio.Auto = False
  end
  object MLabel16: TMLabel
    Left = 797
    Top = 25
    Width = 57
    Height = 18
    AutoSize = False
    Caption = #30331#37682#20214#25968
    FontRatio.Auto = False
  end
  object LblRecCnt: TMLabel
    Left = 858
    Top = 25
    Width = 48
    Height = 19
    Alignment = taRightJustify
    AutoSize = False
    Caption = '999999'
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clNone
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentFont = False
    BorderLine = tmbSingle
    FontRatio.Auto = False
  end
  object MLabel17: TMLabel
    Left = 912
    Top = 25
    Width = 16
    Height = 18
    AutoSize = False
    Caption = #20214
    FontRatio.Auto = False
  end
  object MLabel40: TMLabel
    Left = 84
    Top = 228
    Width = 93
    Height = 19
    AutoSize = False
    Caption = #38651#35441#30058#21495
    FontRatio.Auto = False
  end
  object MLabel44: TMLabel
    Left = 219
    Top = 16
    Width = 78
    Height = 19
    AutoSize = False
    FontRatio.Auto = False
  end
  object PPanelBase: TMPanel
    Left = 222
    Top = 44
    Width = 718
    Height = 528
    Align = alClient
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 1
    object PPanelKasan: TMPanel
      Left = 0
      Top = 44
      Width = 718
      Height = 484
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PPanelKasan'
      Color = 15921906
      ParentBackground = False
      TabOrder = 5
      Visible = False
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 718
        Height = 484
        HorzScrollBar.Position = 201
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object Kasan_Parent_Panel: TMPanel
          Left = -191
          Top = 0
          Width = 280
          Height = 475
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 0
          object Lbl_KasanParent: TMLabel
            Left = 0
            Top = 0
            Width = 280
            Height = 19
            Align = alTop
            AutoSize = False
            Caption = #21517#23492#12379#35242
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = True
          end
          object Kasan_Parent_DBGrid: TdxDBGrid
            Left = 0
            Top = 19
            Width = 280
            Height = 456
            Bands = <
              item
                MinWidth = 20
                Sizing = False
                Visible = False
                Width = 20
              end
              item
                Caption = #12467#12540#12489
                MinWidth = 20
                Width = 20
              end
              item
                Caption = #21517#31216
                Width = 201
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'GCode'
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alClient
            Color = clWhite
            TabOrder = 0
            OnEnter = EnterEvent
            OnKeyDown = Jituzai_DdxDBGridKeyDown
            OnKeyUp = Jituzai_DdxDBGridKeyUp
            OnMouseDown = DBGridMouseDown
            BandColor = 10204878
            DataSource = dsKasanParent
            HeaderColor = 10204878
            HideFocusRect = True
            HideSelection = True
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoColumnSizing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
            OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
            ShowBands = True
            ShowHeader = False
            OnChangeNodeEx = DBGridChangeNodeEx
            OnCustomDrawCell = DBGridCustomDrawCell
            object Kasan_Parent_DBGridRecId: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'RecId'
            end
            object Kasan_Parent_DBGridFusen: TdxDBGridGraphicColumn
              TabStop = False
              Width = 20
              BandIndex = 1
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'Fusen'
            end
            object Kasan_Parent_DBGridGCode: TdxDBGridMaskColumn
              TabStop = False
              Width = 86
              BandIndex = 1
              RowIndex = 0
              ImeMode = imDisable
              MaxLength = 30
              StretchChar.Auto = False
              FieldName = 'GCode'
            end
            object Kasan_Parent_DBGridLongName: TdxDBGridMaskColumn
              TabStop = False
              Visible = False
              Width = 201
              BandIndex = 2
              RowIndex = 0
              ImeMode = imHira
              MaxLength = 60
              StretchChar.Auto = False
              FieldName = 'LongName'
            end
            object Kasan_Parent_DBGridSimpleName: TdxDBGridMaskColumn
              TabStop = False
              Width = 130
              BandIndex = 2
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'SimpleName'
            end
          end
        end
        object Kasan_Child_Panel: TMPanel
          Left = 126
          Top = 0
          Width = 320
          Height = 475
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 1
          object Lbl_KasanChild: TMLabel
            Left = 0
            Top = 0
            Width = 320
            Height = 19
            Align = alTop
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = True
          end
          object Kasan_Child_DBGrid: TdxDBGrid
            Left = 0
            Top = 19
            Width = 320
            Height = 456
            Bands = <
              item
                Caption = 'NO'
                MinWidth = 20
                Width = 20
              end
              item
                Caption = #12467#12540#12489
                MinWidth = 20
                Width = 20
              end
              item
                Caption = #21517#31216
                Width = 201
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'GCode'
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alClient
            Color = clWhite
            DragMode = dmAutomatic
            PopupMenu = PMChild
            TabOrder = 0
            OnDragDrop = DBGridDragDrop
            OnDragOver = DBGridDragOver
            OnEndDrag = DBGridEndDrag
            OnEnter = EnterEvent
            OnKeyDown = Jituzai_DdxDBGridKeyDown
            OnKeyPress = Jituzai_DdxDBGridKeyPress
            OnKeyUp = Jituzai_DdxDBGridKeyUp
            OnMouseDown = DBGridMouseDown
            OnStartDrag = DBGridStartDrag
            BandColor = 10204878
            DataSource = dsKasanChild
            HeaderColor = 10204878
            HideFocusRect = True
            HideSelection = True
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
            OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
            ShowBands = True
            ShowHeader = False
            OnChangeNodeEx = DBGridChangeNodeEx
            object Kasan_Child_DBGridRecId: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'RecId'
            end
            object Kasan_Child_DBGridDspNO: TdxDBGridMaskColumn
              ReadOnly = True
              TabStop = False
              Width = 30
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'DspNo'
            end
            object Kasan_Child_DBGridFusen: TdxDBGridGraphicColumn
              TabStop = False
              Width = 20
              BandIndex = 1
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'Fusen'
            end
            object Kasan_Child_DBGridGCode: TdxDBGridButtonColumn
              Width = 86
              BandIndex = 1
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'GCode'
              OnGetText = Jituzai_DdxDBGridGCodeGetText
              OnEditButtonClick = DBGridCodeEditButtonClick
            end
            object Kasan_Child_DBGridLongName: TdxDBGridMaskColumn
              ReadOnly = True
              TabStop = False
              Visible = False
              Width = 201
              BandIndex = 2
              RowIndex = 0
              ImeMode = imHira
              MaxLength = 60
              StretchChar.Auto = False
              FieldName = 'LongName'
            end
            object Kasan_Child_DBGridSimpleName: TdxDBGridMaskColumn
              TabStop = False
              Width = 130
              BandIndex = 2
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'SimpleName'
            end
          end
        end
        object PPanelTree_Kasan: TMPanel
          Left = 482
          Top = 0
          Width = 220
          Height = 475
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 2
          object Lbl_KasanTaikei: TMLabel
            Left = 0
            Top = 0
            Width = 220
            Height = 19
            Align = alTop
            AutoSize = False
            Caption = #21152#31639#20307#31995#12452#12513#12540#12472
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object VTreeView_Kasan: TMTreeView
            Left = 0
            Top = 19
            Width = 220
            Height = 456
            Align = alClient
            HotTrack = True
            Images = TreeView_VImageList
            Indent = 19
            ReadOnly = True
            ShowLines = False
            TabOrder = 0
            TabStop = False
            OnMouseDown = TreeViewMouseDown
          end
        end
        object chb_KasanUpdate: TMCheckBox
          Left = 10
          Top = 27
          Width = 317
          Height = 19
          Caption = #20182#12398#21152#31639#20808#12408#12467#12500#12540#12375#12390#26356#26032#12377#12427#12290
          Color = 15921906
          ParentColor = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
      end
    end
    object Goukei_PPanel_Grid: TMPanel
      Left = 0
      Top = 44
      Width = 718
      Height = 484
      Align = alClient
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 2
      Visible = False
      object Goukei_DdxDBGrid: TdxDBGrid
        Left = 0
        Top = 0
        Width = 718
        Height = 484
        Bands = <
          item
            MinWidth = 20
            Width = 20
          end
          item
            Caption = #12467#12540#12489
            MinWidth = 20
            Width = 20
          end
          item
            Caption = #36899#24819
            Width = 75
          end
          item
            Caption = #27491#24335#21517#31216
            Width = 395
          end
          item
            Caption = #31777#30053#21517#31216
            Width = 96
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'GCode'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        PopupMenu = PMKouji
        TabOrder = 0
        OnEnter = EnterEvent
        OnExit = Goukei_DdxDBGridExit
        OnKeyDown = Goukei_DdxDBGridKeyDown
        OnKeyPress = Goukei_DdxDBGridKeyPress
        OnKeyUp = Goukei_DdxDBGridKeyUp
        OnMouseDown = Goukei_DdxDBGridMouseDown
        OnMouseMove = Jituzai_DdxDBGridMouseMove
        BandColor = 16766672
        DataSource = GHojyoMA_DDataSource
        HeaderColor = 16766672
        HideFocusRect = True
        HideSelection = True
        HighlightTextColor = clWindowText
        LookAndFeel = lfFlat
        Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
        ShowBands = True
        ShowHeader = False
        OnChangeNodeEx = Goukei_DdxDBGridChangeNodeEx
        OnBeforeChangeColumn = Goukei_DdxDBGridBeforeChangeColumn
        object Goukei_DdxDBGridRecId: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'RecId'
        end
        object Goukei_DdxDBGridFusen: TdxDBGridGraphicColumn
          TabStop = False
          Width = 20
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'Fusen'
        end
        object Goukei_DdxDBGridGCode: TdxDBGridMaskColumn
          Width = 105
          BandIndex = 1
          RowIndex = 0
          ImeMode = imDisable
          MaxLength = 60
          StretchChar.Auto = True
          FieldName = 'GCode'
          OnGetText = Goukei_DdxDBGridGCodeGetText
        end
        object Goukei_DdxDBGridRenChar: TdxDBGridMaskColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          Width = 105
          BandIndex = 2
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 10
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'RenChar'
        end
        object Goukei_DdxDBGridLongName: TdxDBGridMaskColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          Width = 357
          BandIndex = 3
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 60
          StretchChar.Auto = False
          FieldName = 'LongName'
        end
        object Goukei_DdxDBGridSimpleName: TdxDBGridMaskColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          Width = 96
          BandIndex = 4
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 14
          StretchChar.Auto = False
          FieldName = 'SimpleName'
        end
      end
    end
    object Jituzai_PPanel_Grid: TMPanel
      Left = 0
      Top = 44
      Width = 718
      Height = 484
      Align = alClient
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object Jituzai_DdxDBGrid: TdxDBGrid
        Left = 0
        Top = 0
        Width = 718
        Height = 484
        Bands = <
          item
            MinWidth = 20
            Width = 20
          end
          item
            Caption = #12467#12540#12489
            MinWidth = 20
            Width = 20
          end
          item
            Caption = #36899#24819
            Width = 75
          end
          item
            Caption = #27491#24335#21517#31216
            Width = 395
          end
          item
            Caption = #31777#30053#21517#31216
            Width = 96
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'GCode'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        PopupMenu = PMKouji
        TabOrder = 0
        OnEnter = EnterEvent
        OnExit = Jituzai_DdxDBGridExit
        OnKeyDown = Jituzai_DdxDBGridKeyDown
        OnKeyPress = Jituzai_DdxDBGridKeyPress
        OnKeyUp = Jituzai_DdxDBGridKeyUp
        OnMouseDown = Jituzai_DdxDBGridMouseDown
        OnMouseMove = Jituzai_DdxDBGridMouseMove
        BandColor = 16766672
        DataSource = JHojyoMA_DDataSource
        HeaderColor = 16766672
        HideFocusRect = True
        HideSelection = True
        HighlightTextColor = clWindowText
        LookAndFeel = lfFlat
        Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
        ShowBands = True
        ShowHeader = False
        OnChangeNodeEx = Jituzai_DdxDBGridChangeNodeEx
        OnBeforeChangeColumn = Jituzai_DdxDBGridBeforeChangeColumn
        object Jituzai_DdxDBGridRecId: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'RecId'
        end
        object Jituzai_DdxDBGridFusen: TdxDBGridGraphicColumn
          ReadOnly = True
          TabStop = False
          Width = 20
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'Fusen'
          Stretch = False
        end
        object Jituzai_DdxDBGridGCode: TdxDBGridMaskColumn
          Width = 105
          BandIndex = 1
          RowIndex = 0
          ImeMode = imDisable
          MaxLength = 30
          StretchChar.Auto = True
          FieldName = 'GCode'
          OnGetText = Jituzai_DdxDBGridGCodeGetText
        end
        object Jituzai_DdxDBGridRenChar: TdxDBGridMaskColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          Width = 105
          BandIndex = 2
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 10
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'RenChar'
        end
        object Jituzai_DdxDBGridLongName: TdxDBGridMaskColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          Width = 357
          BandIndex = 3
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 60
          StretchChar.Auto = False
          FieldName = 'LongName'
        end
        object Jituzai_DdxDBGridSimpleName: TdxDBGridMaskColumn
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          Width = 96
          BandIndex = 4
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 14
          StretchChar.Auto = False
          FieldName = 'SimpleName'
        end
      end
    end
    object Goukei_PPanel_Card: TMPanel
      Left = 0
      Top = 44
      Width = 718
      Height = 484
      Align = alClient
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 4
      Visible = False
      object ScrollBox2: TScrollBox
        Left = 0
        Top = 22
        Width = 718
        Height = 462
        Align = alClient
        BorderStyle = bsNone
        Color = 15921906
        ParentColor = False
        TabOrder = 1
        object Goukei_PPanel_Seikyu: TMPanel
          Left = 0
          Top = 113
          Width = 718
          Height = 324
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 8
          Visible = False
          DesignSize = (
            718
            324)
          object Goukei_LLabel_SeikyusakiCd: TMLabel
            Left = 11
            Top = 8
            Width = 44
            Height = 19
            AutoSize = False
            Caption = #35531#27714#20808
            FontRatio.Auto = False
          end
          object Goukei_LLabel_SeikyuKoujiCd: TMLabel
            Left = 11
            Top = 296
            Width = 96
            Height = 19
            AutoSize = False
            Caption = #19968#25324#35531#27714#20808#24037#20107
            Visible = False
            FontRatio.Auto = False
          end
          object Goukei_LLabel_SeikyusakiNm: TMLabel
            Left = 238
            Top = 8
            Width = 100
            Height = 19
            AutoSize = False
            Caption = 'xxxxxx'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Goukei_LLabel_SeikyuKoujiNm: TMLabel
            Left = 261
            Top = 296
            Width = 100
            Height = 19
            AutoSize = False
            Caption = 'xxxxxxx'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            Visible = False
            FontRatio.Auto = False
          end
          object Goukei_DdxDBGrid_Seikyu: TdxDBGrid
            Left = 0
            Top = 36
            Width = 718
            Height = 253
            Bands = <
              item
                Caption = #65326#65327
                Width = 40
              end
              item
                Caption = #35531#27714#20104#23450#26085
                Width = 105
              end
              item
                Caption = #35531#27714#21517#30446
                Width = 111
              end
              item
                Caption = #35531#27714#20808
              end
              item
                Caption = #35531#27714#38989
                Width = 111
              end
              item
                Caption = #31246#29575
                Width = 77
              end
              item
                Caption = #65288#20869#65289#28040#36027#31246#38989
                Width = 111
              end
              item
                Caption = #35531#27714#26360#30330#34892#24180#26376#26085
                Width = 105
              end
              item
                Caption = #35531#27714#26085
                Width = 105
              end
              item
                Caption = #20837#37329#20104#23450#26085
                Width = 105
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'RecId'
            ShowSummaryFooter = True
            SummaryGroups = <>
            SummarySeparator = ', '
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnEnter = EnterEvent
            OnExit = DdxDBGrid_SeikyuExit
            OnKeyPress = DdxDBGrid_SeikyuKeyPress
            OnMouseDown = DdxDBGrid_SeikyuMouseDown
            BandColor = 16766672
            BandFont.Charset = SHIFTJIS_CHARSET
            BandFont.Color = clWindowText
            BandFont.Height = -13
            BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            BandFont.Style = []
            DataSource = GSeikyu_DDataSource
            HeaderColor = 15921906
            HeaderFont.Charset = SHIFTJIS_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            HeaderFont.Style = []
            HideFocusRect = True
            HideSelection = True
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoEditing, egoTabs, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoLoadAllRecords, egoIndicator]
            OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
            PreviewFont.Charset = SHIFTJIS_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -13
            PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            PreviewFont.Style = []
            ShowBands = True
            ShowHeader = False
            OnChangeColumn = DdxDBGrid_SeikyuChangeColumn
            OnChangeNodeEx = DdxDBGrid_SeikyuChangeNodeEx
            OnCustomDrawCell = DdxDBGrid_SeikyuCustomDrawCell
            OnEdited = evtGridOnEdited
            OnEditing = DdxDBGrid_SeikyuEditing
            OnBeforeChangeColumn = DdxDBGrid_SeikyuBeforeChangeColumn
            OnBeforeChangeNode = DdxDBGrid_SeikyuBeforeChangeNode
            Anchors = [akLeft, akTop, akRight]
            object Goukei_DdxDBGrid_SeikyuRecId: TdxDBGridColumn
              Visible = False
              Width = 24
              BandIndex = 1
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'RecId'
            end
            object Goukei_DdxDBGrid_SeikyuNo: TdxDBGridMaskColumn
              Alignment = taRightJustify
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ReadOnly = True
              TabStop = False
              Width = 40
              BandIndex = 0
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 20
              Hankaku = True
              StretchChar.Auto = False
              FieldName = 'NO'
            end
            object Goukei_DdxDBGrid_SeikyuContMoney: TdxDBGridCurrencyColumn
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              Width = 139
              BandIndex = 4
              RowIndex = 0
              EditAlignment = taRightJustify
              FormatOnEditing = True
              MaxLength = 17
              StretchChar.Auto = False
              FieldName = 'ContMoney'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '###,##0'
            end
            object Goukei_DdxDBGrid_SeikyuDummyTax_Rate: TdxDBGridMaskColumn
              Visible = False
              BandIndex = 5
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'DummyTax_Rate'
            end
            object Goukei_DdxDBGrid_SeikyuTax_Rate: TdxDBGridLookupColumn
              Width = 20
              BandIndex = 5
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'Tax_Rate'
              DropDownSelectEx = False
              ListFieldName = 'iCode;iName'
              ListWidth = 90
            end
            object Goukei_DdxDBGrid_SeikyuTax_RateName: TdxDBGridLookupColumn
              Alignment = taRightJustify
              TabStop = False
              Width = 70
              BandIndex = 5
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'Tax_RateName'
              DropDownSelectEx = False
            end
            object Goukei_DdxDBGrid_SeikyuSales_Tax: TdxDBGridCurrencyColumn
              Width = 139
              BandIndex = 6
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              FormatOnEditing = True
              MaxLength = 17
              StretchChar.Auto = False
              FieldName = 'Sales_Tax'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '###,##0'
            end
            object Goukei_DdxDBGrid_SeikyuCostomerGCode: TdxDBGridButtonColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 96
              BandIndex = 3
              RowIndex = 0
              ImeMode = imDisable
              StretchChar.Auto = False
              FieldName = 'CostomerGCode'
              OnGetText = evtDdxDBGrid_KeiCostomerCodeGetText
              OnEditButtonClick = DdxDBGrid_SeikyuCostomerGCodeEditButtonClick
            end
            object Goukei_DdxDBGrid_SeikyuCostomerName: TdxDBGridMaskColumn
              DisableEditor = True
              TabStop = False
              Width = 133
              BandIndex = 3
              RowIndex = 0
              MaxLength = 20
              StretchChar.Auto = False
              FieldName = 'CostomerName'
            end
            object Goukei_DdxDBGrid_SeikyuContDate: TdxDBGridDateColumn
              Alignment = taRightJustify
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 105
              BandIndex = 9
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 10
              StretchChar.Auto = False
              FieldName = 'ContDate'
              DropDownSelectEx = False
              DateOnError = deNull
              DateValidation = True
              OnDateValidateInput = Goukei_DdxDBGrid_KeiContDateDateValidateInput
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Goukei_DdxDBGrid_SeikyuSeikyuYoteiDate: TdxDBGridDateColumn
              Alignment = taRightJustify
              BandIndex = 1
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 10
              StretchChar.Auto = False
              FieldName = 'SeikyuYoteiDate'
              DropDownSelectEx = False
              DateOnError = deNull
              DateValidation = True
              OnDateValidateInput = Goukei_DdxDBGrid_KeiContDateDateValidateInput
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Goukei_DdxDBGrid_SeikyuSeikyuOutputDate: TdxDBGridDateColumn
              Alignment = taRightJustify
              DisableEditor = True
              ReadOnly = True
              TabStop = False
              Width = 120
              BandIndex = 7
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 10
              StretchChar.Auto = False
              FieldName = 'SeikyuOutputDate'
              DropDownSelectEx = False
              DateOnError = deNull
              DateValidation = True
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Goukei_DdxDBGrid_SeikyuSeikyuDate: TdxDBGridDateColumn
              Alignment = taRightJustify
              DisableEditor = True
              ReadOnly = True
              TabStop = False
              BandIndex = 8
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 10
              StretchChar.Auto = False
              FieldName = 'SeikyuDate'
              DropDownSelectEx = False
              DateOnError = deNull
              DateValidation = True
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Goukei_DdxDBGrid_SeikyuSeikyuMeimoku: TdxDBGridMaskColumn
              Width = 265
              BandIndex = 2
              RowIndex = 0
              ImeMode = imHira
              MaxLength = 40
              StretchChar.Auto = False
              FieldName = 'SeikyuMeimoku'
            end
          end
          object Goukei_ENEdit_SeikyuKoujiCd: TMNumEdit
            Left = 111
            Top = 296
            Width = 118
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 3
            Visible = False
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            Negative = False
            Digits = 16
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Goukei_ETEdit_SeikyuKoujiCd: TMTxtEdit
            Left = 111
            Top = 296
            Width = 161
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            MaxLength = 16
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 4
            Text = ''
            Visible = False
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Goukei_ENEdit_SeikyusakiCd: TMNumEdit
            Left = 111
            Top = 8
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 1
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            FormatStr = '#'
            Negative = False
            Digits = 10
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Goukei_ETEdit_SeikyusakiCd: TMTxtEdit
            Left = 111
            Top = 8
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 10
            FontRatio.Auto = False
            TabOrder = 0
            Text = ''
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
        end
        object Goukei_PPanel_Koji: TMPanel
          Left = 0
          Top = 113
          Width = 718
          Height = 324
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 3
          Visible = False
          object MLabel9: TMLabel
            Left = 28
            Top = 9
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #37109#20415#30058#21495
            FontRatio.Auto = False
          end
          object MLabel10: TMLabel
            Left = 225
            Top = 9
            Width = 13
            Height = 19
            AutoSize = False
            Caption = #65293
            FontRatio.Auto = False
          end
          object MLabel11: TMLabel
            Left = 28
            Top = 31
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #20303#25152
            FontRatio.Auto = False
          end
          object MLabel13: TMLabel
            Left = 28
            Top = 75
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #38651#35441#30058#21495
            FontRatio.Auto = False
          end
          object MLabel19: TMLabel
            Left = 28
            Top = 97
            Width = 93
            Height = 19
            AutoSize = False
            Caption = 'FAX'#30058#21495
            FontRatio.Auto = False
          end
          object Goukei_ENEdit_ZipCode1: TMNumEdit
            Left = 181
            Top = 9
            Width = 41
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
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 0
            OnChange = evtOnChange
            OnEnter = EnterEvent
            FormatStr = '###000'
            MaxValue = 999.000000000000000000
            Digits = 3
            Validate = False
          end
          object Goukei_ENEdit_ZipCode2: TMNumEdit
            Left = 241
            Top = 9
            Width = 49
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = CmnPostShow
            ArrowType = atOmission
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 1
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            FormatStr = '####0000'
            MaxValue = 9999.000000000000000000
            Digits = 4
            Validate = False
          end
          object Goukei_ETEdit_Address1: TMTxtEdit
            Left = 181
            Top = 31
            Width = 506
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = CmnPostShow
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 50
            FontRatio.Auto = False
            TabOrder = 2
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            ValidChars = ''
          end
          object Goukei_ETEdit_Address2: TMTxtEdit
            Left = 181
            Top = 53
            Width = 506
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 50
            FontRatio.Auto = False
            TabOrder = 3
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object Goukei_ETEdit_TelNo: TMTxtEdit
            Left = 181
            Top = 75
            Width = 206
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 20
            FontRatio.Auto = False
            TabOrder = 4
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object Goukei_ETEdit_FAXNo: TMTxtEdit
            Left = 181
            Top = 97
            Width = 206
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 20
            FontRatio.Auto = False
            TabOrder = 5
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
        end
        object Goukei_PPanel_Bikou: TMPanel
          Left = 0
          Top = 113
          Width = 718
          Height = 324
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 5
          Visible = False
          object MLabel41: TMLabel
            Left = 18
            Top = 158
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #20633#32771
            FontRatio.Auto = False
          end
          object MLabel43: TMLabel
            Left = 18
            Top = 5
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #24037#20107#27010#35201
            FontRatio.Auto = False
          end
          object Goukei_ETEdit_BIKO: TMMemo
            Left = 16
            Top = 181
            Width = 677
            Height = 125
            ImeMode = imHira
            Lines.Strings = (
              '')
            MaxLength = 255
            TabOrder = 1
            OnChange = evtOnChange
            OnEnter = EnterEvent
          end
          object Goukei_ETEdit_Gaiyou: TMMemo
            Left = 16
            Top = 25
            Width = 677
            Height = 125
            ImeMode = imHira
            Lines.Strings = (
              '')
            MaxLength = 255
            TabOrder = 0
            OnChange = evtOnChange
            OnEnter = EnterEvent
          end
        end
        object Goukei_PPanel_KeNyukin: TMPanel
          Left = 0
          Top = 113
          Width = 718
          Height = 324
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 4
          Visible = False
          object Goukei_DdxDBGrid_Nyu: TdxDBGrid
            Left = 4
            Top = 2
            Width = 502
            Height = 215
            Bands = <
              item
                Caption = #20837#37329#20104#23450#26085
                Width = 92
              end
              item
                Caption = #20837#37329#20104#23450#38989
                Width = 111
              end
              item
                Caption = #21462#24341#20808
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'RecId'
            ShowSummaryFooter = True
            SummaryGroups = <>
            SummarySeparator = ', '
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnEnter = EnterEvent
            OnExit = Goukei_DdxDBGrid_NyuExit
            OnKeyPress = DdxDBGrid_KeiKeyPress
            BandColor = 16766672
            BandFont.Charset = SHIFTJIS_CHARSET
            BandFont.Color = clWindowText
            BandFont.Height = -13
            BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            BandFont.Style = []
            DataSource = GNyukin_DDataSource
            HeaderColor = 15921906
            HeaderFont.Charset = SHIFTJIS_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            HeaderFont.Style = []
            HideFocusRect = True
            HideSelection = True
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoEditing, egoTabs, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoLoadAllRecords]
            OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
            PreviewFont.Charset = SHIFTJIS_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -13
            PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            PreviewFont.Style = []
            ScrollBars = ssVertical
            ShowBands = True
            ShowHeader = False
            OnChangeColumn = Goukei_DdxDBGrid_NyuChangeColumn
            OnChangeNodeEx = Goukei_DdxDBGrid_NyuChangeNodeEx
            OnBeforeChangeColumn = Goukei_DdxDBGrid_NyuBeforeChangeColumn
            OnBeforeChangeNode = Goukei_DdxDBGrid_NyuBeforeChangeNode
            object Goukei_DdxDBGrid_NyuRecId: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'RecId'
            end
            object Goukei_DdxDBGrid_NyuContDate: TdxDBGridDateColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              BandIndex = 0
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 8
              StretchChar.Auto = False
              FieldName = 'ContDate'
              DropDownSelectEx = False
              OnDateValidateInput = Goukei_DdxDBGrid_KeiContDateDateValidateInput
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Goukei_DdxDBGrid_NyuContMoney: TdxDBGridCurrencyColumn
              Width = 139
              BandIndex = 1
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              FormatOnEditing = True
              MaxLength = 17
              StretchChar.Auto = False
              FieldName = 'ContMoney'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '###,##0'
            end
            object Goukei_DdxDBGrid_NyuCostomerGCode: TdxDBGridButtonColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 98
              BandIndex = 2
              RowIndex = 0
              StretchChar.Auto = True
              FieldName = 'CostomerGCode'
              OnGetText = evtDdxDBGrid_KeiCostomerCodeGetText
              OnEditButtonClick = evtNyuCostomerCodeEditButtonClick
            end
            object Goukei_DdxDBGrid_NyuCostomerName: TdxDBGridMaskColumn
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              TabStop = False
              Width = 133
              BandIndex = 2
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'CostomerName'
            end
          end
        end
        object Goukei_PPanel_Kihon: TMPanel
          Left = 0
          Top = 113
          Width = 718
          Height = 324
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 2
          Visible = False
          object Goukei_LLabel_PersonCode: TMLabel
            Left = 28
            Top = 126
            Width = 96
            Height = 19
            AutoSize = False
            Caption = #25285#24403#32773
            FontRatio.Auto = False
          end
          object Goukei_LLabel_PersonName: TMLabel
            Left = 303
            Top = 126
            Width = 146
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Goukei_LLabel_CostomerCode: TMLabel
            Left = 28
            Top = 148
            Width = 96
            Height = 19
            AutoSize = False
            Caption = #21463#27880#20808
            FontRatio.Auto = False
          end
          object Goukei_LLabel_CustomerName: TMLabel
            Left = 303
            Top = 148
            Width = 170
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object MLabel21: TMLabel
            Left = 28
            Top = 60
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #20104#23450#24037#26399
            FontRatio.Auto = False
          end
          object MLabel23: TMLabel
            Left = 28
            Top = 82
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #23455#32318#24037#26399
            FontRatio.Auto = False
          end
          object MLabel24: TMLabel
            Left = 28
            Top = 16
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #21517#23492#12379#21306#20998
            FontRatio.Auto = False
          end
          object Goukei_LLabel_RootKbnDsp: TMLabel
            Left = 219
            Top = 16
            Width = 78
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object MLabel15: TMLabel
            Left = 28
            Top = 104
            Width = 121
            Height = 19
            AutoSize = False
            Caption = #23436#25104#65288#24341#28193#65289#24180#26376#26085
            FontRatio.Auto = False
          end
          object Goukei_LLabel_BmnName: TMLabel
            Left = 303
            Top = 38
            Width = 146
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object MLabel8: TMLabel
            Left = 308
            Top = 58
            Width = 17
            Height = 19
            AutoSize = False
            Caption = #65374
            FontRatio.Auto = False
          end
          object MLabel30: TMLabel
            Left = 308
            Top = 82
            Width = 17
            Height = 19
            AutoSize = False
            Caption = #65374
            FontRatio.Auto = False
          end
          object Goukei_LLabel_BmnCode: TMLabel
            Left = 28
            Top = 38
            Width = 145
            Height = 19
            AutoSize = False
            Caption = #38598#35336#37096#38272#12467#12540#12489
            FontRatio.Auto = False
          end
          object Goukei_LLabel_SeshuName: TMLabel
            Left = 303
            Top = 170
            Width = 146
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Goukei_LLabel_SeshuCode: TMLabel
            Left = 28
            Top = 170
            Width = 96
            Height = 19
            AutoSize = False
            Caption = #26045#20027
            FontRatio.Auto = False
          end
          object Goukei_ETEdit_CustomerName: TMTxtEdit
            Left = 181
            Top = 148
            Width = 396
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 60
            FontRatio.Auto = False
            TabOrder = 12
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object Goukei_ETEdit_PersonCode: TMTxtEdit
            Left = 181
            Top = 126
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 10
            FontRatio.Auto = False
            TabOrder = 9
            Text = ''
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            ValidChars = ''
          end
          object Goukei_ETEdit_CustomerCode: TMTxtEdit
            Left = 181
            Top = 148
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 10
            FontRatio.Auto = True
            TabOrder = 11
            Text = ''
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            ValidChars = ''
          end
          object Goukei_EDEdit_StartDate: TMDateEdit
            Left = 181
            Top = 60
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            ImeMode = imClose
            TabOrder = 3
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            Calendar = True
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
          object Goukei_EDEdit_EndDate: TMDateEdit
            Left = 327
            Top = 60
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            ImeMode = imClose
            TabOrder = 4
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            Calendar = True
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
          object Goukei_ENEdit_RootKbn: TMNumEdit
            Left = 181
            Top = 17
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0:'#36890#24120
              '1:'#21517#23492#12379#35242)
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
            OnChange = Goukei_ENEdit_RootKbnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            MaxValue = 1.000000000000000000
            Digits = 1
            Validate = False
            Zero = True
          end
          object Goukei_EDEdit_FinishDate: TMDateEdit
            Left = 181
            Top = 104
            Width = 106
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            AutoSize = False
            Enabled = False
            ImeMode = imDisable
            ParentColor = True
            TabOrder = 7
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
          object Goukei_ENEdit_PersonCode: TMNumEdit
            Left = 181
            Top = 126
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            Negative = False
            Digits = 10
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Goukei_ENEdit_CustomerCode: TMNumEdit
            Left = 181
            Top = 148
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 10
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            Negative = False
            Digits = 10
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Goukei_EDEdit_JStartDate: TMDateEdit
            Left = 181
            Top = 82
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            ImeMode = imClose
            TabOrder = 5
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            Calendar = True
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
          object Goukei_EDEdit_JEndDate: TMDateEdit
            Left = 327
            Top = 82
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            ImeMode = imClose
            TabOrder = 6
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            Calendar = True
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
          object Goukei_ETEdit_BmnCode: TMTxtEdit
            Left = 181
            Top = 38
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 10
            FontRatio.Auto = False
            TabOrder = 2
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            ValidChars = ''
          end
          object Goukei_ENEdit_BmnCode: TMNumEdit
            Left = 181
            Top = 38
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 1
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            Negative = False
            Digits = 10
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Goukei_ETEdit_SeshuCode: TMTxtEdit
            Left = 181
            Top = 170
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 10
            FontRatio.Auto = False
            TabOrder = 14
            Text = ''
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            ValidChars = ''
          end
          object Goukei_ENEdit_SeshuCode: TMNumEdit
            Left = 181
            Top = 170
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 13
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            Negative = False
            Digits = 10
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Goukei_PPanel_Move: TMPanel
            Left = 16
            Top = 189
            Width = 689
            Height = 78
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 15
            object Goukei_LLabel_UkeoiKbn: TMLabel
              Left = 12
              Top = 3
              Width = 96
              Height = 19
              AutoSize = False
              Caption = #35531#36000#21306#20998
              FontRatio.Auto = False
            end
            object Goukei_LLabel_UkeoiKbnDsp: TMLabel
              Left = 203
              Top = 3
              Width = 78
              Height = 19
              AutoSize = False
              FontRatio.Auto = False
            end
            object Goukei_LLabel_SekouBmnCode: TMLabel
              Left = 12
              Top = 25
              Width = 141
              Height = 19
              AutoSize = False
              Caption = #26045#24037#37096#38272
              FontRatio.Auto = False
            end
            object Goukei_LLabel_SekouBmnName: TMLabel
              Left = 287
              Top = 25
              Width = 146
              Height = 19
              AutoSize = False
              FontRatio.Auto = False
            end
            object Goukei_LLabel_SekouPersonCode: TMLabel
              Left = 12
              Top = 47
              Width = 141
              Height = 19
              AutoSize = False
              Caption = #26045#24037#25285#24403#32773
              FontRatio.Auto = False
            end
            object Goukei_LLabel_SekouPersonName: TMLabel
              Left = 287
              Top = 47
              Width = 146
              Height = 19
              AutoSize = False
              FontRatio.Auto = False
            end
            object Goukei_ENEdit_UkeoiKbn: TMNumEdit
              Left = 165
              Top = 3
              Width = 20
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0:'#20803#35531
                '1:'#19979#35531)
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
              OnChange = Goukei_ENEdit_RootKbnChange
              OnEnter = EnterEvent
              OnExit = GoukeiEditExit
              MaxValue = 1.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
            object Goukei_ETEdit_SekouBmnCode: TMTxtEdit
              Left = 165
              Top = 25
              Width = 106
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = ArrowClick
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              ImeMode = imDisable
              MaxLength = 10
              FontRatio.Auto = False
              TabOrder = 1
              Text = ''
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = GoukeiEditExit
              ValidChars = ''
            end
            object Goukei_ENEdit_SekouBmnCode: TMNumEdit
              Left = 165
              Top = 25
              Width = 106
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              OnArrowClick = ArrowClick
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
              TabOrder = 2
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = GoukeiEditExit
              FormatStr = '#'
              Negative = False
              Digits = 10
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object Goukei_ENEdit_SekouPersonCode: TMNumEdit
              Left = 165
              Top = 47
              Width = 106
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              OnArrowClick = ArrowClick
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
              TabOrder = 3
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = GoukeiEditExit
              Negative = False
              Digits = 10
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object Goukei_ETEdit_SekouPersonCode: TMTxtEdit
              Left = 165
              Top = 47
              Width = 106
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = ArrowClick
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              ImeMode = imDisable
              MaxLength = 10
              FontRatio.Auto = False
              TabOrder = 4
              Text = ''
              OnEnter = EnterEvent
              OnExit = GoukeiEditExit
              ValidChars = ''
            end
          end
        end
        object Goukei_PPanel_Keiyaku: TMPanel
          Left = 0
          Top = 113
          Width = 718
          Height = 324
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 7
          Visible = False
          object Goukei_DdxDBGrid_Kei: TdxDBGrid
            Left = 0
            Top = 0
            Width = 718
            Height = 324
            Bands = <
              item
                Caption = #22865#32004#24180#26376#26085
                Width = 189
              end
              item
                Caption = #22865#32004#26360#65326#65327
                Width = 111
              end
              item
                Caption = #22865#32004#37329#38989#65288#31246#36796#65289
                Width = 111
              end
              item
                Caption = #31246#29575
                Width = 77
              end
              item
                Caption = #28040#36027#31246#38989
                Width = 111
              end
              item
                Caption = #21462#24341#20808
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'RecId'
            ShowSummaryFooter = True
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alClient
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnEnter = EnterEvent
            OnExit = Goukei_DdxDBGrid_KeiExit
            OnKeyPress = DdxDBGrid_KeiKeyPress
            OnMouseDown = Goukei_DdxDBGrid_KeiMouseDown
            BandColor = 16766672
            BandFont.Charset = SHIFTJIS_CHARSET
            BandFont.Color = clWindowText
            BandFont.Height = -13
            BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            BandFont.Style = []
            DataSource = GKeiyaku_DDataSource
            HeaderColor = 15921906
            HeaderFont.Charset = SHIFTJIS_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            HeaderFont.Style = []
            HideFocusRect = True
            HideSelection = True
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoEditing, egoTabs, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoLoadAllRecords, egoIndicator]
            OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
            PreviewFont.Charset = SHIFTJIS_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -13
            PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            PreviewFont.Style = []
            ShowBands = True
            ShowHeader = False
            OnChangeColumn = Goukei_DdxDBGrid_KeiChangeColumn
            OnChangeNodeEx = Goukei_DdxDBGrid_KeiChangeNodeEx
            OnCustomDrawCell = Jituzai_DdxDBGrid_KeiCustomDrawCell
            OnBeforeChangeColumn = Goukei_DdxDBGrid_KeiBeforeChangeColumn
            OnBeforeChangeNode = Goukei_DdxDBGrid_KeiBeforeChangeNode
            object Goukei_DdxDBGrid_KeiRecId: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'RecId'
            end
            object Goukei_DdxDBGrid_KeiContDate: TdxDBGridDateColumn
              Alignment = taCenter
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 105
              BandIndex = 0
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 8
              StretchChar.Auto = False
              FieldName = 'ContDate'
              DropDownSelectEx = False
              DateOnError = deNull
              DateValidation = True
              OnDateValidateInput = Goukei_DdxDBGrid_KeiContDateDateValidateInput
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Goukei_DdxDBGrid_KeiContNo: TdxDBGridMaskColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 205
              BandIndex = 1
              RowIndex = 0
              ImeMode = imClose
              MaxLength = 20
              Hankaku = True
              StretchChar.Auto = False
              FieldName = 'ContNo'
            end
            object Goukei_DdxDBGrid_KeiContMoney: TdxDBGridCurrencyColumn
              Width = 139
              BandIndex = 2
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              FormatOnEditing = True
              MaxLength = 17
              StretchChar.Auto = False
              FieldName = 'ContMoney'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '###,##0'
            end
            object Goukei_DdxDBGrid_KeiDummyTax_Rate: TdxDBGridMaskColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'DummyTax_Rate'
            end
            object Goukei_DdxDBGrid_KeiTax_Rate: TdxDBGridLookupColumn
              Width = 20
              BandIndex = 3
              RowIndex = 0
              MaxLength = 1
              StretchChar.Auto = False
              FieldName = 'Tax_Rate'
              DropDownSelectEx = False
              ListFieldName = 'iCode;iName'
              ListWidth = 90
            end
            object Goukei_DdxDBGrid_KeiTax_RateName: TdxDBGridLookupColumn
              Alignment = taRightJustify
              TabStop = False
              Width = 70
              BandIndex = 3
              RowIndex = 0
              EditAlignment = taRightJustify
              StretchChar.Auto = False
              FieldName = 'Tax_RateName'
              DropDownSelectEx = False
            end
            object Goukei_DdxDBGrid_KeiSales_Tax: TdxDBGridCurrencyColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              Width = 109
              BandIndex = 4
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              FormatOnEditing = True
              MaxLength = 17
              StretchChar.Auto = False
              FieldName = 'Sales_Tax'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '###,##0'
            end
            object Goukei_DdxDBGrid_KeiCostomerCode: TdxDBGridButtonColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 96
              BandIndex = 5
              RowIndex = 0
              ImeMode = imDisable
              StretchChar.Auto = True
              FieldName = 'CostomerGCode'
              OnGetText = evtDdxDBGrid_KeiCostomerCodeGetText
              OnEditButtonClick = evtKeiCostomerCodeEditButtonClick
            end
            object Goukei_DdxDBGrid_KeiCostomerName: TdxDBGridMaskColumn
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              TabStop = False
              Width = 133
              BandIndex = 5
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'CostomerName'
            end
            object Goukei_DdxDBGrid_KeiTax_RateName2: TdxDBGridColumn
              Alignment = taRightJustify
              TabStop = False
              Width = 30
              BandIndex = 3
              RowIndex = 0
              EditAlignment = taRightJustify
              StretchChar.Auto = False
              FieldName = 'Tax_RateName2'
            end
            object Goukei_DdxDBGrid_KeiFontColorDate: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorDate'
            end
            object Goukei_DdxDBGrid_KeiFontColorNo: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorNo'
            end
            object Goukei_DdxDBGrid_KeiFontColorMoney: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorMoney'
            end
            object Goukei_DdxDBGrid_KeiFontColorTax: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorTax'
            end
            object Goukei_DdxDBGrid_KeiFontColorTaxRete: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorTaxRete'
            end
            object Goukei_DdxDBGrid_KeiFontColorTaxReteName: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorTaxReteName'
            end
            object Goukei_DdxDBGrid_KeiFontColorTaxRateName2: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorTaxRateName2'
            end
          end
        end
        object Goukei_PPanel_Card_2: TMPanel
          Left = 0
          Top = 437
          Width = 718
          Height = 25
          Align = alBottom
          AutoSize = True
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 6
          OnResize = Goukei_PPanel_Card_2Resize
          object Goukei_BBitBtn_Ok: TMBitBtn
            Left = 540
            Top = 0
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
            OnClick = Goukei_BBitBtn_OkClick
            OnEnter = EnterEvent
          end
          object Goukei_BBitBtn_Cancel: TMBitBtn
            Left = 622
            Top = 0
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
            OnClick = Goukei_BBitBtn_CancelClick
            OnEnter = EnterEvent
          end
        end
        object Goukei_PMTab: TMTab
          Left = 0
          Top = 73
          Width = 718
          Height = 40
          Items = <
            item
              Caption = #22522#26412#24773#22577
              Color = 16766672
              SyncControl = Goukei_PPanel_Kihon
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #24037#20107
              Color = 16766672
              SyncControl = Goukei_PPanel_Koji
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #22865#32004#24773#22577
              Color = 16766672
              SyncControl = Goukei_PPanel_Keiyaku
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #20837#37329#24773#22577
              Color = 16766672
              SyncControl = Goukei_PPanel_KeNyukin
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #35531#27714#12539#20837#37329#20104#23450
              Color = 15921906
              SyncControl = Goukei_PPanel_Seikyu
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #27010#35201#12539#20633#32771
              Color = 16766672
              SyncControl = Goukei_PPanel_Bikou
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end>
          Align = alTop
          TabOrder = 1
          OnChange = Goukei_PMTabChange
          ItemWidth = 0
          ItemHeight = 0
          ItemMargin = 6
          Style = tsCrystal
          BorderHeight = 8
          BorderFont.Charset = SHIFTJIS_CHARSET
          BorderFont.Color = clWindowText
          BorderFont.Height = -12
          BorderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
          BorderFont.Style = []
          OnEnter = EnterEvent
          OnKeyDown = Goukei_PMTabKeyDown
          BorderCaptionAlign = taCenter
          DropShadow = False
        end
        object Goukei_PPanel_Card_1: TMPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 73
          Align = alTop
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          PopupMenu = PMKouji
          TabOrder = 0
          object MLabel3: TMLabel
            Left = 39
            Top = 3
            Width = 58
            Height = 19
            AutoSize = False
            Caption = #27491#24335#21517#31216
            FontRatio.Auto = False
          end
          object MLabel4: TMLabel
            Left = 39
            Top = 25
            Width = 58
            Height = 19
            AutoSize = False
            Caption = #31777#30053#21517#31216
            FontRatio.Auto = False
          end
          object MLabel18: TMLabel
            Left = 39
            Top = 48
            Width = 58
            Height = 19
            AutoSize = False
            Caption = #20184#31627#24773#22577
            FontRatio.Auto = False
          end
          object Goukei_ImageRaised_FusenRed: TImage
            Left = 601
            Top = 45
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E63333333620993520993521
              99333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E63333335A4BB65A4BB6594CB6333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337167C87168C87167
              C8333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E63333338681DB8781DA8781DA333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333339B99EA9A99EA9A98
              EA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A8A9F5A8A9F5A8A9F5333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            OnClick = FusenClick
          end
          object Goukei_ImageRaised_FusenGreen: TImage
            Left = 617
            Top = 45
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333456E1C466E1C466E
              1C333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E6333333638B41638B41638B42333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333769D59769E59769E
              5A333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E633333387B07087AF7087AF70333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E633333397BF8497BF8497BF
              84333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A2CA92A2CA92A2CA92333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            OnClick = FusenClick
          end
          object Goukei_ImageRaised_FusenBlue: TImage
            Left = 563
            Top = 45
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333C38F4BC38E4BC38E
              4B333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E6333333CFA469CFA469D0A469333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333D7B27ED6B27ED7B2
              7E333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E6333333DEBE90DDBE90DDBE90333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333E4CAA1E4CAA1E4CA
              A1333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333E8D2ACE8D2ACE8D2AC333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            OnClick = FusenClick
          end
          object Goukei_ImageRaised_FusenOrange: TImage
            Left = 579
            Top = 45
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333338EFE328EFD328E
              FD333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E63333335FA9FB5EA9FB5EA9FB333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337ABAF97ABAF97ABA
              FA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E633333395CAF895CBF895CAF8333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333A8D6F7A8D6F7A8D6
              F7333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A8D6F7A8D6F7A8D6F7333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            OnClick = FusenClick
          end
          object Goukei_ImageLowered_FusenRed: TImage
            Left = 532
            Top = 45
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E63333333620993520993521
              99333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E63333335A4BB65A4BB6594CB6333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337167C87168C87167
              C8333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E63333338681DB8781DA8781DA333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333339B99EA9A99EA9A98
              EA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A8A9F5A8A9F5A8A9F5333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Goukei_ImageLowered_FusenGreen: TImage
            Left = 548
            Top = 45
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333456E1C466E1C466E
              1C333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E6333333638B41638B41638B42333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333769D59769E59769E
              5A333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E633333387B07087AF7087AF70333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E633333397BF8497BF8497BF
              84333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A2CA92A2CA92A2CA92333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Goukei_ImageLowered_FusenBlue: TImage
            Left = 633
            Top = 45
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333C38F4BC38E4BC38E
              4B333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E6333333CFA469CFA469D0A469333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333D7B27ED6B27ED7B2
              7E333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E6333333DEBE90DDBE90DDBE90333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333E4CAA1E4CAA1E4CA
              A1333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333E8D2ACE8D2ACE8D2AC333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Goukei_ImageLowered_FusenOrange: TImage
            Left = 649
            Top = 45
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333338EFE328EFD328E
              FD333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E63333335FA9FB5EA9FB5EA9FB333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337ABAF97ABAF97ABA
              FA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E633333395CAF895CBF895CAF8333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333A8D6F7A8D6F7A8D6
              F7333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A8D6F7A8D6F7A8D6F7333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object MLabel2: TMLabel
            Left = 251
            Top = 25
            Width = 37
            Height = 19
            AutoSize = False
            Caption = #36899#24819
            FontRatio.Auto = False
          end
          object Goukei_ETEdit_LongName: TMTxtEdit
            Left = 99
            Top = 3
            Width = 396
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 60
            FontRatio.Auto = False
            TabOrder = 0
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            ValidChars = ''
          end
          object Goukei_ETEdit_SimpleName: TMTxtEdit
            Left = 99
            Top = 25
            Width = 146
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 14
            FontRatio.Auto = False
            TabOrder = 1
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = GoukeiEditExit
            ValidChars = ''
          end
          object Goukei_ETEdit_Fusen: TMTxtEdit
            Left = 130
            Top = 47
            Width = 395
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imOpen
            MaxLength = 60
            FontRatio.Auto = False
            TabOrder = 3
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object Goukei_ETEdit_RenChar: TMTxtEdit
            Left = 289
            Top = 25
            Width = 106
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
            TabOrder = 2
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
        end
      end
      object MPanel1: TMPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        PopupMenu = PMKouji
        TabOrder = 0
        object MLabel1: TMLabel
          Left = 39
          Top = 3
          Width = 58
          Height = 19
          AutoSize = False
          Caption = #12467#12540#12489
          FontRatio.Auto = False
        end
        object Goukei_Fusen1: TImage
          Left = 12
          Top = 6
          Width = 16
          Height = 16
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000120B0000120B0000000000000000
            0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6333333333333333333333333333333333333333333333333333333
            333333333333333333E6E6E6E6E6E6E6E6E6E6E6E63333333620993520993521
            99333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
            E6E6E6E6E63333335A4BB65A4BB6594CB6333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337167C87168C87167
            C8333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
            E6E6E6E6E63333338681DB8781DA8781DA333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333339B99EA9A99EA9A98
            EA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
            E6E6E6E6E6333333A8A9F5A8A9F5A8A9F5333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
            33333333333333333333333333333333333333333333333333333333333333E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6}
          Transparent = True
          OnClick = FusenClick
        end
        object Goukei_Fusen3: TImage
          Left = 12
          Top = 6
          Width = 16
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000120B0000120B0000000000000000
            0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6333333333333333333333333333333333333333333333333333333
            333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333C38F4BC38E4BC38E
            4B333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
            E6E6E6E6E6333333CFA469CFA469D0A469333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333D7B27ED6B27ED7B2
            7E333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
            E6E6E6E6E6333333DEBE90DDBE90DDBE90333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333E4CAA1E4CAA1E4CA
            A1333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
            E6E6E6E6E6333333E8D2ACE8D2ACE8D2AC333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
            33333333333333333333333333333333333333333333333333333333333333E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6}
          Transparent = True
          OnClick = FusenClick
        end
        object Goukei_Fusen2: TImage
          Left = 12
          Top = 6
          Width = 16
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000120B0000120B0000000000000000
            0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6333333333333333333333333333333333333333333333333333333
            333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333456E1C466E1C466E
            1C333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
            E6E6E6E6E6333333638B41638B41638B42333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333769D59769E59769E
            5A333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
            E6E6E6E6E633333387B07087AF7087AF70333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E633333397BF8497BF8497BF
            84333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
            E6E6E6E6E6333333A2CA92A2CA92A2CA92333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
            33333333333333333333333333333333333333333333333333333333333333E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6}
          Transparent = True
          OnClick = FusenClick
        end
        object Goukei_Fusen4: TImage
          Left = 12
          Top = 6
          Width = 16
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000120B0000120B0000000000000000
            0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6333333333333333333333333333333333333333333333333333333
            333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333338EFE328EFD328E
            FD333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
            E6E6E6E6E63333335FA9FB5EA9FB5EA9FB333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337ABAF97ABAF97ABA
            FA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
            E6E6E6E6E633333395CAF895CBF895CAF8333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333A8D6F7A8D6F7A8D6
            F7333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
            E6E6E6E6E6333333A8D6F7A8D6F7A8D6F7333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
            33333333333333333333333333333333333333333333333333333333333333E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6}
          Transparent = True
          OnClick = FusenClick
        end
        object Goukei_ENEdit_GCode: TMNumEdit
          Left = 99
          Top = 3
          Width = 118
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = ArrowClick
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
          TabOrder = 0
          OnEnter = EnterEvent
          OnExit = GoukeiEditExit
          Negative = False
          Digits = 10
          Validate = False
          InputFlag = True
          InputFlagEnabled = True
          Zero = True
        end
        object Goukei_ETEdit_GCode: TMTxtEdit
          Left = 99
          Top = 3
          Width = 166
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = ArrowClick
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          Hankaku = True
          ImeMode = imClose
          MaxLength = 10
          FontRatio.Auto = False
          TabOrder = 1
          Text = ''
          OnEnter = EnterEvent
          OnExit = GoukeiEditExit
          ValidChars = ''
        end
      end
    end
    object Jituzai_PPanel_Card: TMPanel
      Left = 0
      Top = 44
      Width = 718
      Height = 484
      Align = alClient
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 3
      Visible = False
      object MPnlTop: TMPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        PopupMenu = PMKouji
        TabOrder = 0
        object Jituzai_LLabel_GCode: TMLabel
          Left = 39
          Top = 3
          Width = 58
          Height = 19
          AutoSize = False
          Caption = #12467#12540#12489
          FontRatio.Auto = False
        end
        object Jituzai_Fusen1: TImage
          Left = 12
          Top = 6
          Width = 16
          Height = 16
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000120B0000120B0000000000000000
            0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6333333333333333333333333333333333333333333333333333333
            333333333333333333E6E6E6E6E6E6E6E6E6E6E6E63333333620993520993521
            99333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
            E6E6E6E6E63333335A4BB65A4BB6594CB6333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337167C87168C87167
            C8333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
            E6E6E6E6E63333338681DB8781DA8781DA333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333339B99EA9A99EA9A98
            EA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
            E6E6E6E6E6333333A8A9F5A8A9F5A8A9F5333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
            33333333333333333333333333333333333333333333333333333333333333E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6}
          Transparent = True
          OnClick = FusenClick
        end
        object Jituzai_Fusen2: TImage
          Left = 12
          Top = 6
          Width = 16
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000120B0000120B0000000000000000
            0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6333333333333333333333333333333333333333333333333333333
            333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333456E1C466E1C466E
            1C333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
            E6E6E6E6E6333333638B41638B41638B42333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333769D59769E59769E
            5A333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
            E6E6E6E6E633333387B07087AF7087AF70333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E633333397BF8497BF8497BF
            84333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
            E6E6E6E6E6333333A2CA92A2CA92A2CA92333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
            33333333333333333333333333333333333333333333333333333333333333E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6}
          Transparent = True
          OnClick = FusenClick
        end
        object Jituzai_Fusen3: TImage
          Left = 12
          Top = 6
          Width = 16
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000120B0000120B0000000000000000
            0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6333333333333333333333333333333333333333333333333333333
            333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333C38F4BC38E4BC38E
            4B333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
            E6E6E6E6E6333333CFA469CFA469D0A469333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333D7B27ED6B27ED7B2
            7E333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
            E6E6E6E6E6333333DEBE90DDBE90DDBE90333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333E4CAA1E4CAA1E4CA
            A1333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
            E6E6E6E6E6333333E8D2ACE8D2ACE8D2AC333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
            33333333333333333333333333333333333333333333333333333333333333E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6}
          Transparent = True
          OnClick = FusenClick
        end
        object Jituzai_Fusen4: TImage
          Left = 12
          Top = 6
          Width = 16
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000120B0000120B0000000000000000
            0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6333333333333333333333333333333333333333333333333333333
            333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333338EFE328EFD328E
            FD333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
            E6E6E6E6E63333335FA9FB5EA9FB5EA9FB333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337ABAF97ABAF97ABA
            FA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
            E6E6E6E6E633333395CAF895CBF895CAF8333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333A8D6F7A8D6F7A8D6
            F7333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
            E6E6E6E6E6333333A8D6F7A8D6F7A8D6F7333333FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
            33333333333333333333333333333333333333333333333333333333333333E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
            E6E6}
          Transparent = True
          OnClick = FusenClick
        end
        object Jituzai_ETEdit_GCode: TMTxtEdit
          Left = 99
          Top = 3
          Width = 166
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = ArrowClick
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          Hankaku = True
          ImeMode = imClose
          MaxLength = 16
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 0
          Text = ''
          OnEnter = EnterEvent
          OnExit = JituzaiEditExit
          ValidChars = ''
        end
        object Jituzai_ENEdit_GCode: TMNumEdit
          Left = 99
          Top = 3
          Width = 118
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = ArrowClick
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
          TabOrder = 1
          OnEnter = EnterEvent
          OnExit = JituzaiEditExit
          Negative = False
          Digits = 16
          Validate = False
          InputFlag = True
          InputFlagEnabled = True
          Zero = True
        end
      end
      object Jituzai_PScrollBox_Card: TScrollBox
        Left = 0
        Top = 22
        Width = 718
        Height = 462
        Align = alClient
        BorderStyle = bsNone
        Color = 15921906
        ParentColor = False
        TabOrder = 1
        object Jituzai_PPanel_Keiyaku: TMPanel
          Left = 0
          Top = 112
          Width = 718
          Height = 325
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 7
          Visible = False
          object Jituzai_DdxDBGrid_Kei: TdxDBGrid
            Left = 0
            Top = 41
            Width = 718
            Height = 284
            Bands = <
              item
                Caption = #22865#32004#24180#26376#26085
                Width = 105
              end
              item
                Caption = #22865#32004#26360#65326#65327
                Width = 111
              end
              item
                Caption = #22865#32004#37329#38989#65288#31246#36796#65289
                Width = 111
              end
              item
                Caption = #31246#29575
                Width = 77
              end
              item
                Caption = #28040#36027#31246#38989
                Width = 111
              end
              item
                Caption = #21462#24341#20808
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'RecId'
            ShowSummaryFooter = True
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alClient
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnEnter = EnterEvent
            OnExit = Jituzai_DdxDBGrid_KeiExit
            OnKeyPress = DdxDBGrid_KeiKeyPress
            OnMouseDown = Jituzai_DdxDBGrid_KeiMouseDown
            BandColor = 16766672
            BandFont.Charset = SHIFTJIS_CHARSET
            BandFont.Color = clWindowText
            BandFont.Height = -13
            BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            BandFont.Style = []
            DataSource = JKeiyaku_DDataSource
            HeaderColor = 15921906
            HeaderFont.Charset = SHIFTJIS_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            HeaderFont.Style = []
            HideFocusRect = True
            HideSelection = True
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoEditing, egoTabs, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoLoadAllRecords, egoIndicator]
            OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
            PreviewFont.Charset = SHIFTJIS_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -13
            PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            PreviewFont.Style = []
            ShowBands = True
            ShowHeader = False
            OnChangeColumn = Jituzai_DdxDBGrid_KeiChangeColumn
            OnChangeNodeEx = Jituzai_DdxDBGrid_KeiChangeNodeEx
            OnCustomDrawCell = Jituzai_DdxDBGrid_KeiCustomDrawCell
            OnEdited = evtGridOnEdited
            OnBeforeChangeColumn = Jituzai_DdxDBGrid_KeiBeforeChangeColumn
            OnBeforeChangeNode = Jituzai_DdxDBGrid_KeiBeforeChangeNode
            object Jituzai_DdxDBGrid_KeiRecId: TdxDBGridColumn
              Visible = False
              Width = 24
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'RecId'
            end
            object Jituzai_DdxDBGrid_KeiContDate: TdxDBGridDateColumn
              Alignment = taRightJustify
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 105
              BandIndex = 0
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 10
              StretchChar.Auto = False
              FieldName = 'ContDate'
              DropDownSelectEx = False
              DateOnError = deNull
              DateValidation = True
              OnDateValidateInput = Jituzai_DdxDBGrid_KeiContDateDateValidateInput
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Jituzai_DdxDBGrid_KeiContNo: TdxDBGridMaskColumn
              Alignment = taLeftJustify
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 205
              BandIndex = 1
              RowIndex = 0
              ImeMode = imClose
              MaxLength = 20
              Hankaku = True
              StretchChar.Auto = False
              FieldName = 'ContNo'
            end
            object Jituzai_DdxDBGrid_KeiContMoney: TdxDBGridCurrencyColumn
              Alignment = taRightJustify
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              HeaderAlignment = taCenter
              Width = 139
              BandIndex = 2
              RowIndex = 0
              EditAlignment = taRightJustify
              FormatOnEditing = True
              MaxLength = 17
              StretchChar.Auto = False
              FieldName = 'ContMoney'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '###,##0'
            end
            object Jituzai_DdxDBGrid_KeiDummyTax_Rate: TdxDBGridMaskColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'DummyTax_Rate'
            end
            object Jituzai_DdxDBGrid_KeiTax_Rate: TdxDBGridLookupColumn
              Width = 20
              BandIndex = 3
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'Tax_Rate'
              DropDownSelectEx = False
              ListFieldName = 'iCode;iName'
              ListWidth = 90
            end
            object Jituzai_DdxDBGrid_KeiTax_RateName: TdxDBGridLookupColumn
              Alignment = taRightJustify
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              TabStop = False
              Width = 70
              BandIndex = 3
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'Tax_RateName'
              DropDownSelectEx = False
            end
            object Jituzai_DdxDBGrid_KeiSales_Tax: TdxDBGridCurrencyColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              Width = 109
              BandIndex = 4
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              FormatOnEditing = True
              MaxLength = 17
              StretchChar.Auto = False
              FieldName = 'Sales_Tax'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '###,##0'
            end
            object Jituzai_DdxDBGrid_KeiCostomerCode: TdxDBGridButtonColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 96
              BandIndex = 5
              RowIndex = 0
              ImeMode = imDisable
              StretchChar.Auto = True
              FieldName = 'CostomerGCode'
              OnGetText = evtDdxDBGrid_KeiCostomerCodeGetText
              OnEditButtonClick = evtKeiCostomerCodeEditButtonClick
            end
            object Jituzai_DdxDBGrid_KeiCostomerName: TdxDBGridMaskColumn
              DisableEditor = True
              TabStop = False
              Width = 133
              BandIndex = 5
              RowIndex = 0
              MaxLength = 20
              StretchChar.Auto = False
              FieldName = 'CostomerName'
            end
            object Jituzai_DdxDBGrid_KeiFontColorDate: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorDate'
            end
            object Jituzai_DdxDBGrid_KeiFontColorNo: TdxDBGridColumn
              Visible = False
              BandIndex = 1
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorNo'
            end
            object Jituzai_DdxDBGrid_KeiFontColorMoney: TdxDBGridColumn
              Visible = False
              BandIndex = 2
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorMoney'
            end
            object Jituzai_DdxDBGrid_KeiFontColorTax: TdxDBGridColumn
              Visible = False
              BandIndex = 4
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorTax'
            end
            object Jituzai_DdxDBGrid_KeiFontColorTaxRete: TdxDBGridColumn
              Visible = False
              BandIndex = 3
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorTaxRete'
            end
            object Jituzai_DdxDBGrid_KeiFontColorTaxReteName: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorTaxReteName'
            end
            object Jituzai_DdxDBGrid_KeiTax_RateName2: TdxDBGridColumn
              Alignment = taRightJustify
              TabStop = False
              Width = 30
              BandIndex = 3
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'Tax_RateName2'
            end
            object Jituzai_DdxDBGrid_KeiFontColorTaxRateName2: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorTaxRateName2'
            end
          end
          object pnlJTax: TMPanel
            Left = 0
            Top = 0
            Width = 718
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 0
            object lblJTax: TMLabel
              Left = 4
              Top = 8
              Width = 129
              Height = 19
              AutoSize = False
              Caption = #22865#32004#37329#38989#20837#21147#26041#27861
              FontRatio.Auto = False
            end
            object rdJTaxIn: TMRadioButton
              Left = 143
              Top = 8
              Width = 67
              Height = 19
              Caption = #31246#36796
              TabOrder = 0
              OnClick = rdTaxClick
              OnEnter = EnterEvent
            end
            object rdJTaxOut: TMRadioButton
              Left = 214
              Top = 8
              Width = 67
              Height = 19
              Caption = #31246#25244
              TabOrder = 1
              OnClick = rdTaxClick
              OnEnter = EnterEvent
            end
          end
        end
        object Jituzai_PPanel_Seikyu: TMPanel
          Left = 0
          Top = 112
          Width = 718
          Height = 325
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 10
          Visible = False
          DesignSize = (
            718
            325)
          object Jituzai_LLabel_SeikyusakiCd: TMLabel
            Left = 11
            Top = 8
            Width = 44
            Height = 19
            AutoSize = False
            Caption = #35531#27714#20808
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SeikyuKoujiCd: TMLabel
            Left = 11
            Top = 296
            Width = 96
            Height = 19
            AutoSize = False
            Caption = #19968#25324#35531#27714#20808#24037#20107
            Visible = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SeikyusakiNm: TMLabel
            Left = 238
            Top = 8
            Width = 100
            Height = 19
            AutoSize = False
            Caption = 'xxxxxx'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SeikyuKoujiNm: TMLabel
            Left = 261
            Top = 296
            Width = 100
            Height = 19
            AutoSize = False
            Caption = 'xxxxxxx'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            Visible = False
            FontRatio.Auto = False
          end
          object Jituzai_DdxDBGrid_Seikyu: TdxDBGrid
            Left = 0
            Top = 36
            Width = 718
            Height = 253
            Bands = <
              item
                Caption = #65326#65327
                Width = 40
              end
              item
                Caption = #35531#27714#20104#23450#26085
                Width = 105
              end
              item
                Caption = #35531#27714#21517#30446
                Width = 111
              end
              item
                Caption = #35531#27714#20808
              end
              item
                Caption = #35531#27714#38989
                Width = 111
              end
              item
                Caption = #31246#29575
                Width = 77
              end
              item
                Caption = #65288#20869#65289#28040#36027#31246#38989
                Width = 111
              end
              item
                Caption = #35531#27714#26360#30330#34892#24180#26376#26085
                Width = 105
              end
              item
                Caption = #35531#27714#26085
                Width = 105
              end
              item
                Caption = #20837#37329#20104#23450#26085
                Width = 105
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'RecId'
            ShowSummaryFooter = True
            SummaryGroups = <>
            SummarySeparator = ', '
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnEnter = EnterEvent
            OnExit = DdxDBGrid_SeikyuExit
            OnKeyPress = DdxDBGrid_SeikyuKeyPress
            OnMouseDown = DdxDBGrid_SeikyuMouseDown
            BandColor = 16766672
            BandFont.Charset = SHIFTJIS_CHARSET
            BandFont.Color = clWindowText
            BandFont.Height = -13
            BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            BandFont.Style = []
            DataSource = JSeikyu_DDataSource
            HeaderColor = 15921906
            HeaderFont.Charset = SHIFTJIS_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            HeaderFont.Style = []
            HideFocusRect = True
            HideSelection = True
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoEditing, egoTabs, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoLoadAllRecords, egoIndicator]
            OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
            PreviewFont.Charset = SHIFTJIS_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -13
            PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            PreviewFont.Style = []
            ShowBands = True
            ShowHeader = False
            OnChangeColumn = DdxDBGrid_SeikyuChangeColumn
            OnChangeNodeEx = DdxDBGrid_SeikyuChangeNodeEx
            OnCustomDrawCell = DdxDBGrid_SeikyuCustomDrawCell
            OnEdited = evtGridOnEdited
            OnEditing = DdxDBGrid_SeikyuEditing
            OnBeforeChangeColumn = DdxDBGrid_SeikyuBeforeChangeColumn
            OnBeforeChangeNode = DdxDBGrid_SeikyuBeforeChangeNode
            Anchors = [akLeft, akTop, akRight]
            object Jituzai_DdxDBGrid_SeikyuRecId: TdxDBGridColumn
              DisableEditor = True
              ReadOnly = True
              TabStop = False
              Visible = False
              Width = 24
              BandIndex = 1
              RowIndex = 0
              ImeMode = imDisable
              StretchChar.Auto = False
              FieldName = 'RecId'
            end
            object Jituzai_DdxDBGrid_SeikyuNO: TdxDBGridMaskColumn
              Alignment = taRightJustify
              Caption = 'NO'
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ReadOnly = True
              TabStop = False
              Width = 40
              BandIndex = 0
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 20
              Hankaku = True
              StretchChar.Auto = False
              FieldName = 'ContNo'
            end
            object Jituzai_DdxDBGrid_SeikyuContMoney: TdxDBGridCurrencyColumn
              Alignment = taRightJustify
              HeaderAlignment = taCenter
              Width = 139
              BandIndex = 4
              RowIndex = 0
              EditAlignment = taRightJustify
              FormatOnEditing = True
              MaxLength = 17
              StretchChar.Auto = False
              FieldName = 'ContMoney'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '###,##0'
            end
            object Jituzai_DdxDBGrid_SeikyuDummyTax_Rate: TdxDBGridMaskColumn
              Visible = False
              BandIndex = 1
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'DummyTax_Rate'
            end
            object Jituzai_DdxDBGrid_SeikyuTax_Rate: TdxDBGridLookupColumn
              Width = 20
              BandIndex = 5
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'Tax_Rate'
              DropDownSelectEx = False
              ListFieldName = 'iCode;iName'
              ListWidth = 90
            end
            object Jituzai_DdxDBGrid_SeikyuTax_RateName: TdxDBGridLookupColumn
              Alignment = taRightJustify
              TabStop = False
              Width = 70
              BandIndex = 5
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'Tax_RateName'
              DropDownSelectEx = False
            end
            object Jituzai_DdxDBGrid_SeikyuSales_Tax: TdxDBGridCurrencyColumn
              Width = 139
              BandIndex = 6
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              FormatOnEditing = True
              MaxLength = 17
              StretchChar.Auto = False
              FieldName = 'Sales_Tax'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '###,##0'
            end
            object Jituzai_DdxDBGrid_SeikyuCostomerGCode: TdxDBGridButtonColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 96
              BandIndex = 3
              RowIndex = 0
              ImeMode = imDisable
              StretchChar.Auto = False
              FieldName = 'CostomerGCode'
              OnGetText = evtDdxDBGrid_KeiCostomerCodeGetText
              OnEditButtonClick = DdxDBGrid_SeikyuCostomerGCodeEditButtonClick
            end
            object Jituzai_DdxDBGrid_SeikyuCostomerName: TdxDBGridMaskColumn
              DisableEditor = True
              TabStop = False
              Width = 133
              BandIndex = 3
              RowIndex = 0
              MaxLength = 20
              StretchChar.Auto = False
              FieldName = 'CostomerName'
            end
            object Jituzai_DdxDBGrid_SeikyuContDate: TdxDBGridDateColumn
              Alignment = taRightJustify
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 105
              BandIndex = 9
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 10
              StretchChar.Auto = False
              FieldName = 'ContDate'
              DropDownSelectEx = False
              DateOnError = deNull
              DateValidation = True
              OnDateValidateInput = Jituzai_DdxDBGrid_KeiContDateDateValidateInput
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Jituzai_DdxDBGrid_SeikyuSeikyuYoteiDate: TdxDBGridDateColumn
              Alignment = taRightJustify
              BandIndex = 1
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 10
              StretchChar.Auto = False
              FieldName = 'SeikyuYoteiDate'
              DropDownSelectEx = False
              DateOnError = deNull
              DateValidation = True
              OnDateValidateInput = Jituzai_DdxDBGrid_KeiContDateDateValidateInput
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Jituzai_DdxDBGrid_SeikyuSeikyuOutputDate: TdxDBGridDateColumn
              Alignment = taRightJustify
              DisableEditor = True
              ReadOnly = True
              TabStop = False
              Width = 120
              BandIndex = 7
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 10
              StretchChar.Auto = False
              FieldName = 'SeikyuOutputDate'
              DropDownSelectEx = False
              DateOnError = deNull
              DateValidation = True
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Jituzai_DdxDBGrid_SeikyuSeikyuDate: TdxDBGridDateColumn
              Alignment = taRightJustify
              DisableEditor = True
              ReadOnly = True
              TabStop = False
              BandIndex = 8
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 10
              StretchChar.Auto = False
              FieldName = 'SeikyuDate'
              DropDownSelectEx = False
              DateOnError = deNull
              DateValidation = True
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Jituzai_DdxDBGrid_SeikyuSeikyuMeimoku: TdxDBGridMaskColumn
              Width = 265
              BandIndex = 2
              RowIndex = 0
              ImeMode = imHira
              MaxLength = 40
              StretchChar.Auto = False
              FieldName = 'SeikyuMeimoku'
            end
          end
          object Jituzai_ENEdit_SeikyuKoujiCd: TMNumEdit
            Left = 106
            Top = 296
            Width = 118
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 3
            Visible = False
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            Digits = 16
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Jituzai_ETEdit_SeikyuKoujiCd: TMTxtEdit
            Left = 107
            Top = 296
            Width = 161
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            MaxLength = 16
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 4
            Text = ''
            Visible = False
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ENEdit_SeikyusakiCd: TMNumEdit
            Left = 111
            Top = 8
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 1
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            FormatStr = '#'
            Negative = False
            Digits = 10
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Jituzai_ETEdit_SeikyusakiCd: TMTxtEdit
            Left = 111
            Top = 8
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 10
            FontRatio.Auto = False
            TabOrder = 0
            Text = ''
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
        end
        object Jituzai_PPanel_Bikou: TMPanel
          Left = 0
          Top = 112
          Width = 718
          Height = 325
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 6
          Visible = False
          object MLabel54: TMLabel
            Left = 18
            Top = 158
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #20633#32771
            FontRatio.Auto = False
          end
          object MLabel38: TMLabel
            Left = 18
            Top = 5
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #24037#20107#27010#35201
            FontRatio.Auto = False
          end
          object Jituzai_ETEdit_BIKO: TMMemo
            Left = 16
            Top = 181
            Width = 677
            Height = 125
            ImeMode = imHira
            Lines.Strings = (
              '')
            MaxLength = 255
            TabOrder = 1
            OnChange = evtOnChange
            OnEnter = EnterEvent
          end
          object Jituzai_ETEdit_Gaiyou: TMMemo
            Left = 16
            Top = 25
            Width = 677
            Height = 125
            ImeMode = imHira
            Lines.Strings = (
              '')
            MaxLength = 255
            TabOrder = 0
            OnChange = evtOnChange
            OnEnter = EnterEvent
          end
        end
        object Jituzai_PPanel_KeNyukin: TMPanel
          Left = 0
          Top = 112
          Width = 718
          Height = 325
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 5
          Visible = False
          object Jituzai_DdxDBGrid_Nyu: TdxDBGrid
            Left = 4
            Top = 2
            Width = 502
            Height = 215
            Bands = <
              item
                Caption = #20837#37329#20104#23450#26085
                Width = 92
              end
              item
                Caption = #20837#37329#20104#23450#38989
                Width = 111
              end
              item
                Caption = #21462#24341#20808
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'RecId'
            ShowSummaryFooter = True
            SummaryGroups = <>
            SummarySeparator = ', '
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnEnter = EnterEvent
            OnExit = Jituzai_DdxDBGrid_NyuExit
            OnKeyPress = DdxDBGrid_KeiKeyPress
            BandColor = 16766672
            BandFont.Charset = SHIFTJIS_CHARSET
            BandFont.Color = clWindowText
            BandFont.Height = -13
            BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            BandFont.Style = []
            DataSource = JNyukin_DDataSource
            HeaderColor = 15921906
            HeaderFont.Charset = SHIFTJIS_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            HeaderFont.Style = []
            HideFocusRect = True
            HideSelection = True
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoEditing, egoTabs, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoLoadAllRecords]
            OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
            PreviewFont.Charset = SHIFTJIS_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -13
            PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            PreviewFont.Style = []
            ScrollBars = ssVertical
            ShowBands = True
            ShowHeader = False
            OnChangeColumn = Jituzai_DdxDBGrid_NyuChangeColumn
            OnChangeNodeEx = Jituzai_DdxDBGrid_NyuChangeNodeEx
            OnCustomDrawCell = Jituzai_DdxDBGrid_NyuCustomDrawCell
            OnEdited = evtGridOnEdited
            OnBeforeChangeColumn = Jituzai_DdxDBGrid_NyuBeforeChangeColumn
            OnBeforeChangeNode = Jituzai_DdxDBGrid_NyuBeforeChangeNode
            object Jituzai_DdxDBGrid_NyuRecId: TdxDBGridColumn
              Visible = False
              Width = 74
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'RecId'
            end
            object Jituzai_DdxDBGrid_NyuContDate: TdxDBGridDateColumn
              Alignment = taRightJustify
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 130
              BandIndex = 0
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 10
              StretchChar.Auto = False
              FieldName = 'ContDate'
              DropDownSelectEx = False
              DateOnError = deNull
              DateValidation = True
              OnDateValidateInput = Jituzai_DdxDBGrid_KeiContDateDateValidateInput
              DateEditFormat = dfYMD
              Gengou = 'H'
            end
            object Jituzai_DdxDBGrid_NyuContMoney: TdxDBGridCurrencyColumn
              Alignment = taRightJustify
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              Width = 139
              BandIndex = 1
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              FormatOnEditing = True
              MaxLength = 17
              StretchChar.Auto = False
              FieldName = 'ContMoney'
              SummaryFooterType = cstSum
              SummaryFooterFormat = '###,##0'
            end
            object Jituzai_DdxDBGrid_NyuCostomerCode: TdxDBGridButtonColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 98
              BandIndex = 2
              RowIndex = 0
              StretchChar.Auto = True
              FieldName = 'CostomerGCode'
              OnGetText = evtDdxDBGrid_KeiCostomerCodeGetText
              OnEditButtonClick = evtNyuCostomerCodeEditButtonClick
            end
            object Jituzai_DdxDBGrid_NyuCostomerName: TdxDBGridMaskColumn
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              TabStop = False
              Width = 133
              BandIndex = 2
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'CostomerName'
            end
            object Jituzai_DdxDBGrid_NyuFontColorDate: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorDate'
            end
            object Jituzai_DdxDBGrid_NyuFontColorMony: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'FontColorMony'
            end
          end
        end
        object Jituzai_PPanel_Koji: TMPanel
          Left = 0
          Top = 112
          Width = 718
          Height = 325
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Visible = False
          object Jituzai_LLabel_ZipCode1: TMLabel
            Left = 28
            Top = 9
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #37109#20415#30058#21495
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_Address: TMLabel
            Left = 28
            Top = 31
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #20303#25152
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_ZipCode2: TMLabel
            Left = 234
            Top = 9
            Width = 13
            Height = 19
            AutoSize = False
            Caption = #65293
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_TelNo: TMLabel
            Left = 28
            Top = 75
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #38651#35441#30058#21495
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BmnCode: TMLabel
            Left = 28
            Top = 119
            Width = 157
            Height = 19
            AutoSize = False
            Caption = #23436#25104#25391#26367#37096#38272
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_DetailKbn1: TMLabel
            Left = 28
            Top = 141
            Width = 115
            Height = 19
            AutoSize = False
            Caption = #23436#25104#25391#26367#12497#12479#12540#12531
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_DetailKbn1Dsp: TMLabel
            Left = 227
            Top = 141
            Width = 221
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SalesKmkCd: TMLabel
            Left = 28
            Top = 185
            Width = 148
            Height = 19
            AutoSize = False
            Caption = #22770#19978#35336#19978#31185#30446#12467#12540#12489
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SalesKmkCdDsp: TMLabel
            Left = 270
            Top = 185
            Width = 198
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_DetailKbn2: TMLabel
            Left = 28
            Top = 207
            Width = 149
            Height = 19
            AutoSize = False
            Caption = #23436#25104#22770#19978#39640#30456#25163#21208#23450#21306#20998
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_DetailKbn2Dsp: TMLabel
            Left = 227
            Top = 208
            Width = 221
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BmnName: TMLabel
            Left = 313
            Top = 119
            Width = 146
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SalesBase: TMLabel
            Left = 28
            Top = 230
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #22770#19978#35336#19978#22522#28310
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SalesBaseDsp: TMLabel
            Left = 227
            Top = 229
            Width = 221
            Height = 19
            AutoSize = False
            Caption = #24037#20107#36914#34892#22522#28310
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_FaxNo: TMLabel
            Left = 28
            Top = 97
            Width = 93
            Height = 19
            AutoSize = False
            Caption = 'FAX'#30058#21495
            FontRatio.Auto = False
          end
          object MLabel25: TMLabel
            Left = 28
            Top = 163
            Width = 115
            Height = 19
            AutoSize = False
            Caption = #22770#19978#39640#33258#21205#25391#26367#21306#20998
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_KojKbn2Dsp: TMLabel
            Left = 227
            Top = 163
            Width = 221
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Jituzai_ENEdit_ZipCode1: TMNumEdit
            Left = 190
            Top = 9
            Width = 41
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
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 0
            OnChange = evtOnChange
            OnEnter = EnterEvent
            FormatStr = '###000'
            Negative = False
            MaxValue = 999.000000000000000000
            Digits = 3
            Validate = False
          end
          object Jituzai_ENEdit_ZipCode2: TMNumEdit
            Left = 250
            Top = 9
            Width = 49
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = CmnPostShow
            ArrowType = atOmission
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 1
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            FormatStr = '####0000'
            Negative = False
            MaxValue = 9999.000000000000000000
            Digits = 4
            Validate = False
          end
          object Jituzai_ETEdit_Address1: TMTxtEdit
            Left = 190
            Top = 31
            Width = 506
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = CmnPostShow
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 50
            FontRatio.Auto = False
            TabOrder = 2
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_Address2: TMTxtEdit
            Left = 190
            Top = 53
            Width = 506
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 50
            FontRatio.Auto = False
            TabOrder = 3
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object Jituzai_ETEdit_TelNo: TMTxtEdit
            Left = 190
            Top = 75
            Width = 206
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 20
            FontRatio.Auto = False
            TabOrder = 4
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object Jituzai_ENEdit_DetailKbn1: TMNumEdit
            Left = 190
            Top = 141
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0:'#12497#12479#12540#12531'A'#65288#27161#28310#65289
              '1:'#12497#12479#12540#12531'B'
              '2:'#12497#12479#12540#12531'C'
              '3:'#12497#12479#12540#12531'D'
              '4:'#12497#12479#12540#12531'E')
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 8
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            MaxValue = 4.000000000000000000
            Digits = 1
            Validate = False
            Zero = True
          end
          object Jituzai_ENEdit_SalesKmkCd: TMNumEdit
            Left = 190
            Top = 185
            Width = 62
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 10
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            MaxValue = 999999.000000000000000000
            Digits = 8
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Jituzai_ENEdit_DetailKbn2: TMNumEdit
            Left = 190
            Top = 207
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0:'#27161#28310
              '1:'#20837#37329#21208#23450
              '2:'#36890#36942#21208#23450)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 11
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            MaxValue = 2.000000000000000000
            Digits = 1
            Validate = False
            Zero = True
          end
          object Jituzai_ETEdit_BmnCode: TMTxtEdit
            Left = 190
            Top = 119
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 10
            FontRatio.Auto = False
            TabOrder = 7
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ENEdit_SalesBase: TMNumEdit
            Left = 190
            Top = 229
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0:'#24037#20107#23436#25104#22522#28310
              '1:'#24037#20107#36914#34892#22522#28310
              '2:'#21407#20385#22238#21454#22522#28310)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 12
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            MaxValue = 2.000000000000000000
            Digits = 1
            Validate = False
            Value = 1.000000000000000000
            Zero = True
          end
          object Jituzai_ENEdit_BmnCode: TMNumEdit
            Left = 190
            Top = 119
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 6
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            FormatStr = '#'
            Negative = False
            Digits = 10
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Jituzai_ETEdit_FaxNo: TMTxtEdit
            Left = 190
            Top = 97
            Width = 206
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 20
            FontRatio.Auto = False
            TabOrder = 5
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object Jituzai_ENEdit_KojKbn2: TMNumEdit
            Left = 190
            Top = 163
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0:'#12354#12426
              '1:'#12394#12375)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 9
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            MaxValue = 1.000000000000000000
            Digits = 1
            Validate = False
            Zero = True
          end
        end
        object Jituzai_PPanel_Kansei: TMPanel
          Left = 0
          Top = 112
          Width = 718
          Height = 325
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 4
          Visible = False
          object MLabel32: TMLabel
            Left = 11
            Top = 7
            Width = 67
            Height = 19
            AutoSize = False
            Caption = #12510#12473#12479#21306#20998
            FontRatio.Auto = False
          end
          object dxKanseiGid: TdxDBGrid
            Tag = 1
            Left = 79
            Top = 35
            Width = 576
            Height = 279
            Bands = <
              item
                Width = 302
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            SummaryGroups = <>
            SummarySeparator = ', '
            BorderStyle = bsNone
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnEnter = dxKanseiGidEnter
            OnExit = dxKanseiGidExit
            AutoExpandOnSearch = False
            BandFont.Charset = SHIFTJIS_CHARSET
            BandFont.Color = clBlack
            BandFont.Height = -13
            BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            BandFont.Style = []
            DataSource = JKanseiDataSource
            DblClkExpanding = False
            HeaderColor = 16766672
            HeaderFont.Charset = SHIFTJIS_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -13
            HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            HeaderFont.Style = []
            HideFocusRect = True
            HideSelection = True
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoAutoWidth, egoIndicator]
            OptionsEx = [egoBandSizing, egoBandMoving, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll]
            PreviewFont.Charset = SHIFTJIS_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -13
            PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            PreviewFont.Style = []
            OnCustomDrawCell = dxKanseiGidCustomDrawCell
            OnEdited = evtGridOnEdited
            object dxKanseiGidTaitol: TdxDBGridMaskColumn
              Caption = '       '
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              HeaderAlignment = taCenter
              TabStop = False
              Width = 150
              BandIndex = 0
              RowIndex = 0
              MaxLength = 4
              StretchChar.Auto = False
              FieldName = 'Titol'
            end
            object dxKanseiGidCODE: TdxDBGridButtonColumn
              Alignment = taRightJustify
              Caption = #12467#12540#12489
              HeaderAlignment = taCenter
              Width = 106
              BandIndex = 0
              RowIndex = 0
              EditAlignment = taRightJustify
              StretchChar.Auto = False
              FieldName = 'GCODE'
              OnEditButtonClick = dxKanseiGidCODEEditButtonClick
            end
            object dxKanseiGidNM: TdxDBGridMaskColumn
              Caption = #21517#31216
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              HeaderAlignment = taCenter
              ReadOnly = True
              TabStop = False
              Width = 257
              BandIndex = 0
              RowIndex = 0
              EditAlignment = taRightJustify
              MaxLength = 14
              StretchChar.Auto = False
              FieldName = 'NAME'
            end
          end
          object MMasterKBN: TMComboBox
            Left = 79
            Top = 7
            Width = 172
            Height = 19
            CanEdit = False
            Columns = <
              item
                Width = 172
                Color = clWindow
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end>
            Color = clWhite
            DropDownCount = 3
            Items.Strings = (
              #12503#12525#12472#12455#12463#12488
              #27726#29992#35036#21161
              #12475#12464#12513#12531#12488)
            TabOrder = 1
            OnChange = MMasterKBNChange
            OnEnter = EnterEvent
          end
        end
        object Jituzai_PPanel_Sonota: TMPanel
          Left = 0
          Top = 112
          Width = 718
          Height = 325
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 8
          Visible = False
          object MLabel49: TMLabel
            Left = 6
            Top = 9
            Width = 95
            Height = 19
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488#24773#22577
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegTitl1: TMLabel
            Left = 9
            Top = 38
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'1'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegTitl2: TMLabel
            Left = 9
            Top = 60
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'2'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegTitl3: TMLabel
            Left = 9
            Top = 82
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'3'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegTitl4: TMLabel
            Left = 9
            Top = 104
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'4'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegTitl5: TMLabel
            Left = 9
            Top = 126
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'5'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegTitl6: TMLabel
            Left = 9
            Top = 148
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'6'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegTitl7: TMLabel
            Left = 9
            Top = 170
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'7'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegTitl8: TMLabel
            Left = 9
            Top = 192
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'8'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegTitl9: TMLabel
            Left = 9
            Top = 214
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'9'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegTitl10: TMLabel
            Left = 9
            Top = 236
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'10'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegNm1: TMLabel
            Left = 257
            Top = 38
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'1'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegNm2: TMLabel
            Left = 257
            Top = 60
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'2'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegNm3: TMLabel
            Left = 257
            Top = 82
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'3'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegNm4: TMLabel
            Left = 257
            Top = 104
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'4'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegNm5: TMLabel
            Left = 257
            Top = 126
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'5'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegNm6: TMLabel
            Left = 257
            Top = 148
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'6'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegNm7: TMLabel
            Left = 257
            Top = 170
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'7'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegNm8: TMLabel
            Left = 257
            Top = 192
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'8'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegNm9: TMLabel
            Left = 257
            Top = 214
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'9'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SegNm10: TMLabel
            Left = 257
            Top = 236
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #12475#12464#12513#12531#12488'10'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel35: TMLabel
            Left = 6
            Top = 0
            Width = 330
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel33: TMLabel
            Left = 6
            Top = 275
            Width = 330
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel37: TMLabel
            Left = 350
            Top = 0
            Width = 330
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel34: TMLabel
            Left = 350
            Top = 275
            Width = 330
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel53: TMLabel
            Left = 360
            Top = 9
            Width = 95
            Height = 19
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
          object Jituzai_LLabel_BunTitl1: TMLabel
            Left = 366
            Top = 38
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #20998#39006'1'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunTitl2: TMLabel
            Left = 366
            Top = 60
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #20998#39006'2'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunTitl3: TMLabel
            Left = 366
            Top = 82
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #20998#39006'3'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunTitl4: TMLabel
            Left = 366
            Top = 104
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #20998#39006'4'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunTitl5: TMLabel
            Left = 366
            Top = 126
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #20998#39006'5'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunTitl6: TMLabel
            Left = 366
            Top = 148
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #20998#39006'6'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunTitl7: TMLabel
            Left = 366
            Top = 170
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #20998#39006'7'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunTitl8: TMLabel
            Left = 366
            Top = 192
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #20998#39006'8'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunTitl9: TMLabel
            Left = 366
            Top = 214
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #20998#39006'9'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunTitl10: TMLabel
            Left = 366
            Top = 236
            Width = 140
            Height = 17
            AutoSize = False
            Caption = #20998#39006'10'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunNm1: TMLabel
            Left = 605
            Top = 38
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #20998#39006'1'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunNm2: TMLabel
            Left = 605
            Top = 60
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #20998#39006'2'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunNm3: TMLabel
            Left = 605
            Top = 82
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #20998#39006'3'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunNm4: TMLabel
            Left = 605
            Top = 104
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #20998#39006'4'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunNm5: TMLabel
            Left = 605
            Top = 126
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #20998#39006'5'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunNm6: TMLabel
            Left = 605
            Top = 148
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #20998#39006'6'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunNm7: TMLabel
            Left = 605
            Top = 170
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #20998#39006'7'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunNm8: TMLabel
            Left = 605
            Top = 192
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #20998#39006'8'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunNm9: TMLabel
            Left = 605
            Top = 214
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #20998#39006'9'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunNm10: TMLabel
            Left = 605
            Top = 236
            Width = 100
            Height = 17
            AutoSize = False
            Caption = #20998#39006'10'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_ETEdit_SegCd1: TMTxtEdit
            Tag = 22
            Left = 155
            Top = 36
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 0
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_SegCd2: TMTxtEdit
            Tag = 22
            Left = 155
            Top = 60
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 1
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_SegCd3: TMTxtEdit
            Tag = 22
            Left = 155
            Top = 82
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 2
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_SegCd4: TMTxtEdit
            Tag = 22
            Left = 155
            Top = 104
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 3
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_SegCd5: TMTxtEdit
            Tag = 22
            Left = 155
            Top = 126
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 4
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_SegCd6: TMTxtEdit
            Tag = 22
            Left = 155
            Top = 148
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 5
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_SegCd7: TMTxtEdit
            Tag = 22
            Left = 155
            Top = 170
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 6
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_SegCd8: TMTxtEdit
            Tag = 22
            Left = 155
            Top = 192
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 7
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_SegCd9: TMTxtEdit
            Tag = 22
            Left = 155
            Top = 214
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 8
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_SegCd10: TMTxtEdit
            Tag = 22
            Left = 155
            Top = 236
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 9
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_BunCd1: TMTxtEdit
            Tag = 22
            Left = 507
            Top = 38
            Width = 82
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 10
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_BunCd2: TMTxtEdit
            Tag = 22
            Left = 507
            Top = 60
            Width = 82
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 11
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_BunCd3: TMTxtEdit
            Tag = 22
            Left = 507
            Top = 82
            Width = 82
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 12
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_BunCd4: TMTxtEdit
            Tag = 22
            Left = 507
            Top = 104
            Width = 82
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 13
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_BunCd5: TMTxtEdit
            Tag = 22
            Left = 507
            Top = 126
            Width = 82
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 14
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_BunCd6: TMTxtEdit
            Tag = 22
            Left = 507
            Top = 148
            Width = 82
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 15
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_BunCd7: TMTxtEdit
            Tag = 22
            Left = 507
            Top = 170
            Width = 82
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 16
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_BunCd8: TMTxtEdit
            Tag = 22
            Left = 507
            Top = 192
            Width = 82
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 17
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_BunCd9: TMTxtEdit
            Tag = 22
            Left = 507
            Top = 214
            Width = 82
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 18
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_BunCd10: TMTxtEdit
            Tag = 22
            Left = 507
            Top = 236
            Width = 82
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 19
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
        end
        object Jituzai_PPanel_Kihon: TMPanel
          Left = 0
          Top = 112
          Width = 718
          Height = 325
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 2
          Visible = False
          object Jituzai_LLabel_HaifuKbnDsp: TMLabel
            Left = 228
            Top = 3
            Width = 221
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_PersonName: TMLabel
            Left = 313
            Top = 181
            Width = 146
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_HaifuKbn: TMLabel
            Left = 25
            Top = 3
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #37197#36070#21306#20998
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_StartDate: TMLabel
            Left = 25
            Top = 72
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #20104#23450#24037#26399
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_FinishDate: TMLabel
            Left = 25
            Top = 114
            Width = 137
            Height = 19
            AutoSize = False
            Caption = #23436#25104#65288#24341#28193#65289#24180#26376#26085
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_MoveKbn: TMLabel
            Left = 25
            Top = 159
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #32716#26399#31227#36865#21306#20998
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_PartKbn: TMLabel
            Left = 25
            Top = 26
            Width = 149
            Height = 19
            AutoSize = False
            Caption = #65336#65336#65336#65336#65336#65336#65336#31649#29702#21306#20998
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_PartKbnDsp: TMLabel
            Left = 228
            Top = 26
            Width = 221
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_PatternNo: TMLabel
            Left = 25
            Top = 48
            Width = 158
            Height = 19
            AutoSize = False
            Caption = #38272#38272#38272#38272#38272#38272#38272#12497#12479#12540#12531#65326#65327
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_PatternNoDsp: TMLabel
            Left = 255
            Top = 47
            Width = 198
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object MLabel12: TMLabel
            Left = 25
            Top = 92
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #23455#32318#24037#26399
            FontRatio.Auto = False
          end
          object MLabel14: TMLabel
            Left = 457
            Top = 126
            Width = 149
            Height = 19
            AutoSize = False
            Caption = #36914#25431#29575
            Visible = False
            FontRatio.Auto = False
          end
          object MLabel20: TMLabel
            Left = 296
            Top = 71
            Width = 17
            Height = 19
            AutoSize = False
            Caption = #65374
            FontRatio.Auto = False
          end
          object MLabel22: TMLabel
            Left = 296
            Top = 90
            Width = 17
            Height = 19
            AutoSize = False
            Caption = #65374
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_MoveKbnDsp: TMLabel
            Left = 231
            Top = 160
            Width = 78
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object MLabel26: TMLabel
            Left = 669
            Top = 126
            Width = 41
            Height = 19
            AutoSize = False
            Caption = '%'
            Visible = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_PersonCode: TMLabel
            Left = 25
            Top = 181
            Width = 96
            Height = 19
            AutoSize = False
            Caption = #25285#24403#32773
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_CostomerCode: TMLabel
            Left = 25
            Top = 203
            Width = 96
            Height = 19
            AutoSize = False
            Caption = #21463#27880#20808
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_CustomerName: TMLabel
            Left = 313
            Top = 203
            Width = 170
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunCode: TMLabel
            Left = 25
            Top = 136
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #20837#21147#21306#20998
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_BunCodeDsp: TMLabel
            Left = 231
            Top = 136
            Width = 91
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object MLabel42: TMLabel
            Left = 437
            Top = 104
            Width = 261
            Height = 19
            AutoSize = False
            Caption = #8595#8595#8595#12288#65298#27425#23550#24540#12398#28858#38750#34920#31034#12288#8595#8595#8595
            Color = 15921906
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Visible = False
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SeshuCode: TMLabel
            Left = 25
            Top = 225
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #26045#20027
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SeshuName: TMLabel
            Left = 313
            Top = 225
            Width = 146
            Height = 19
            AutoSize = False
            FontRatio.Auto = False
          end
          object Jituzai_ETEdit_CustomerName: TMTxtEdit
            Left = 190
            Top = 203
            Width = 396
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 60
            FontRatio.Auto = False
            TabOrder = 14
            Text = ''
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object Jituzai_ENEdit_CustomerCode: TMNumEdit
            Left = 190
            Top = 203
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 12
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            FormatStr = '#'
            Negative = False
            Digits = 10
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Jituzai_EDEdit_StartDate: TMDateEdit
            Left = 190
            Top = 70
            Width = 83
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imClose
            ParentFont = False
            TabOrder = 3
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            AllowZero = True
            Calendar = True
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
          object Jituzai_ENEdit_HaifuKbn: TMNumEdit
            Left = 190
            Top = 3
            Width = 20
            Height = 20
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0:'#37197#36070#23550#35937
              '1:'#37197#36070#23550#35937#22806)
            ArrowType = atArrow
            F4Arrow = True
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
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            MaxValue = 1.000000000000000000
            Digits = 1
            Validate = True
            Zero = True
          end
          object Jituzai_EDEdit_FinishDate: TMDateEdit
            Left = 190
            Top = 114
            Width = 83
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            AutoSize = False
            Enabled = False
            ImeMode = imDisable
            ParentColor = True
            TabOrder = 7
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
          object Jituzai_ENEdit_MoveKbn: TMNumEdit
            Left = 190
            Top = 159
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0:'#12377#12427
              '1:'#12375#12394#12356)
            ArrowType = atArrow
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentColor = True
            ParentFont = False
            TabOrder = 9
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            MaxValue = 1.000000000000000000
            Digits = 1
            Validate = False
            Zero = True
          end
          object Jituzai_ENEdit_PartKbn: TMNumEdit
            Left = 190
            Top = 26
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0:'#12394#12375
              '1:'#12354#12426#65288#20840#65336#65336#65336#65336#65336#65336#65336#65289
              '2:'#12354#12426#65288#12497#12479#12540#12531#25351#23450#65289)
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 1
            OnChange = Jituzai_ENEdit_PartKbnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            MaxValue = 2.000000000000000000
            Digits = 1
            Validate = True
            Zero = True
          end
          object Jituzai_ENEdit_PatternNo: TMNumEdit
            Left = 190
            Top = 48
            Width = 48
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 2
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            MaxValue = 999999.000000000000000000
            Digits = 6
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Jituzai_EDEdit_JStartDate: TMDateEdit
            Left = 190
            Top = 92
            Width = 83
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            ImeMode = imClose
            TabOrder = 5
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            AllowZero = True
            Calendar = True
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
          object MNumEdit1: TMNumEdit
            Left = 619
            Top = 126
            Width = 39
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Color = 15921906
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 18
            Visible = False
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            MaxValue = 2.000000000000000000
            Digits = 1
            Validate = False
            Zero = True
          end
          object Jituzai_EDEdit_EndDate: TMDateEdit
            Left = 322
            Top = 70
            Width = 83
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ImeMode = imClose
            ParentFont = False
            TabOrder = 4
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            AllowZero = True
            Calendar = True
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
          object Jituzai_EDEdit_JEndDate: TMDateEdit
            Left = 322
            Top = 92
            Width = 83
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            ImeMode = imClose
            TabOrder = 6
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            AllowZero = True
            Calendar = True
            DateFormat = dfYMD
            DateInputType = diYMD
            Gengou = #0
            SepChar = '/'
            Value = 0
            Validate = False
          end
          object Jituzai_ETEdit_PersonCode: TMTxtEdit
            Left = 190
            Top = 181
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 10
            FontRatio.Auto = False
            TabOrder = 11
            Text = ''
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ENEdit_PersonCode: TMNumEdit
            Left = 190
            Top = 181
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 10
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            FormatStr = '#'
            Negative = False
            Digits = 10
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Jituzai_ETEdit_CustomerCode: TMTxtEdit
            Left = 190
            Top = 203
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 10
            FontRatio.Auto = True
            TabOrder = 13
            Text = ''
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ENEdit_BunCode: TMNumEdit
            Left = 190
            Top = 136
            Width = 20
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0:'#20837#21147#21487
              '1:'#21407#20385#31185#30446#12399#19981#21487
              '2:'#20837#21147#19981#21487)
            ArrowType = atArrow
            AutoSize = False
            Enabled = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentColor = True
            ParentFont = False
            TabOrder = 8
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            Negative = False
            MaxValue = 1.000000000000000000
            Digits = 1
            Validate = False
            Zero = True
          end
          object Jituzai_ETEdit_SeshuCode: TMTxtEdit
            Left = 190
            Top = 225
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            ImeMode = imDisable
            MaxLength = 10
            FontRatio.Auto = False
            TabOrder = 15
            Text = ''
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ENEdit_SeshuCode: TMNumEdit
            Left = 190
            Top = 225
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
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
            TabOrder = 16
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            FormatStr = '#'
            Negative = False
            Digits = 10
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object Jituzai_PPanel_Move: TMPanel
            Left = 16
            Top = 244
            Width = 689
            Height = 78
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 17
            object Jituzai_LLabel_UkeoiCode: TMLabel
              Left = 9
              Top = 3
              Width = 93
              Height = 19
              AutoSize = False
              Caption = #35531#36000#21306#20998
              FontRatio.Auto = False
            end
            object Jituzai_LLabel_UkeoiKbnDsp: TMLabel
              Left = 215
              Top = 3
              Width = 221
              Height = 19
              AutoSize = False
              FontRatio.Auto = False
            end
            object Jituzai_LLabel_SekouBmnCode: TMLabel
              Left = 9
              Top = 26
              Width = 93
              Height = 19
              AutoSize = False
              Caption = #26045#24037#37096#38272
              FontRatio.Auto = False
            end
            object Jituzai_LLabel_SekouBmnName: TMLabel
              Left = 297
              Top = 26
              Width = 146
              Height = 19
              AutoSize = False
              FontRatio.Auto = False
            end
            object Jituzai_LLabel_SekouPersonCode: TMLabel
              Left = 9
              Top = 48
              Width = 93
              Height = 19
              AutoSize = False
              Caption = #26045#24037#25285#24403#32773
              FontRatio.Auto = False
            end
            object Jituzai_LLabel_SekouPersonName: TMLabel
              Left = 297
              Top = 48
              Width = 146
              Height = 19
              AutoSize = False
              FontRatio.Auto = False
            end
            object Jituzai_ENEdit_UkeoiKbn: TMNumEdit
              Left = 174
              Top = 3
              Width = 20
              Height = 20
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0:'#20803#35531
                '1:'#19979#35531)
              ArrowType = atArrow
              F4Arrow = True
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
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = JituzaiEditExit
              Negative = False
              MaxValue = 1.000000000000000000
              Digits = 1
              Validate = True
              Zero = True
            end
            object Jituzai_ETEdit_SekouBmnCode: TMTxtEdit
              Left = 174
              Top = 26
              Width = 106
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = ArrowClick
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              ImeMode = imDisable
              MaxLength = 10
              FontRatio.Auto = False
              TabOrder = 1
              Text = ''
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = JituzaiEditExit
              ValidChars = ''
            end
            object Jituzai_ETEdit_SekouPersonCode: TMTxtEdit
              Left = 174
              Top = 48
              Width = 106
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = ArrowClick
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              ImeMode = imDisable
              MaxLength = 10
              FontRatio.Auto = False
              TabOrder = 3
              Text = ''
              OnEnter = EnterEvent
              OnExit = JituzaiEditExit
              ValidChars = ''
            end
            object Jituzai_ENEdit_SekouBmnCode: TMNumEdit
              Left = 174
              Top = 26
              Width = 106
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              OnArrowClick = ArrowClick
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
              TabOrder = 2
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = JituzaiEditExit
              FormatStr = '#'
              Negative = False
              Digits = 10
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object Jituzai_ENEdit_SekouPersonCode: TMNumEdit
              Left = 174
              Top = 48
              Width = 106
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              OnArrowClick = ArrowClick
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
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = JituzaiEditExit
              FormatStr = '#'
              Negative = False
              Digits = 10
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
          end
        end
        object Jituzai_PPanel_Card_1: TMPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 77
          Align = alTop
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 1
          object Jituzai_LLabel_RenChar: TMLabel
            Left = 279
            Top = 25
            Width = 32
            Height = 19
            AutoSize = False
            Caption = #36899#24819
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_LongName: TMLabel
            Left = 39
            Top = 3
            Width = 58
            Height = 19
            AutoSize = False
            Caption = #27491#24335#21517#31216
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SimpleName: TMLabel
            Left = 39
            Top = 25
            Width = 58
            Height = 19
            AutoSize = False
            Caption = #31777#30053#21517#31216
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_Fusen: TMLabel
            Left = 39
            Top = 48
            Width = 58
            Height = 19
            AutoSize = False
            Caption = #20184#31627#24773#22577
            FontRatio.Auto = False
          end
          object Jituzai_ImageRaised_FusenRed: TImage
            Left = 546
            Top = 49
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E63333333620993520993521
              99333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E63333335A4BB65A4BB6594CB6333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337167C87168C87167
              C8333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E63333338681DB8781DA8781DA333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333339B99EA9A99EA9A98
              EA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A8A9F5A8A9F5A8A9F5333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            OnClick = FusenClick
          end
          object Jituzai_ImageRaised_FusenGreen: TImage
            Left = 562
            Top = 49
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333456E1C466E1C466E
              1C333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E6333333638B41638B41638B42333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333769D59769E59769E
              5A333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E633333387B07087AF7087AF70333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E633333397BF8497BF8497BF
              84333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A2CA92A2CA92A2CA92333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            OnClick = FusenClick
          end
          object Jituzai_ImageRaised_FusenBlue: TImage
            Left = 578
            Top = 49
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333C38F4BC38E4BC38E
              4B333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E6333333CFA469CFA469D0A469333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333D7B27ED6B27ED7B2
              7E333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E6333333DEBE90DDBE90DDBE90333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333E4CAA1E4CAA1E4CA
              A1333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333E8D2ACE8D2ACE8D2AC333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            OnClick = FusenClick
          end
          object Jituzai_ImageRaised_FusenOrange: TImage
            Left = 594
            Top = 49
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333338EFE328EFD328E
              FD333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E63333335FA9FB5EA9FB5EA9FB333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337ABAF97ABAF97ABA
              FA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E633333395CAF895CBF895CAF8333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333A8D6F7A8D6F7A8D6
              F7333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A8D6F7A8D6F7A8D6F7333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            OnClick = FusenClick
          end
          object Jituzai_ImageLowered_FusenRed: TImage
            Left = 615
            Top = 48
            Width = 16
            Height = 16
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E63333333620993520993521
              99333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E63333335A4BB65A4BB6594CB6333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337167C87168C87167
              C8333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E63333338681DB8781DA8781DA333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333339B99EA9A99EA9A98
              EA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A8A9F5A8A9F5A8A9F5333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_ImageLowered_FusenGreen: TImage
            Left = 631
            Top = 48
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333456E1C466E1C466E
              1C333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E6333333638B41638B41638B42333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333769D59769E59769E
              5A333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E633333387B07087AF7087AF70333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E633333397BF8497BF8497BF
              84333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A2CA92A2CA92A2CA92333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_ImageLowered_FusenBlue: TImage
            Left = 647
            Top = 48
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333C38F4BC38E4BC38E
              4B333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E6333333CFA469CFA469D0A469333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E6333333D7B27ED6B27ED7B2
              7E333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E6333333DEBE90DDBE90DDBE90333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333E4CAA1E4CAA1E4CA
              A1333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333E8D2ACE8D2ACE8D2AC333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_ImageLowered_FusenOrange: TImage
            Left = 663
            Top = 48
            Width = 16
            Height = 16
            AutoSize = True
            Picture.Data = {
              07544269746D617036030000424D360300000000000036000000280000001000
              000010000000010018000000000000030000120B0000120B0000000000000000
              0000E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6333333333333333333333333333333333333333333333333333333
              333333333333333333E6E6E6E6E6E6E6E6E6E6E6E6333333338EFE328EFD328E
              FD333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333CCCCCC333333E6E6E6E6
              E6E6E6E6E63333335FA9FB5EA9FB5EA9FB333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF333333CCCCCCCCCCCC333333E6E6E6E6E6E63333337ABAF97ABAF97ABA
              FA333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333333333333333333333E6
              E6E6E6E6E633333395CAF895CBF895CAF8333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E6333333A8D6F7A8D6F7A8D6
              F7333333FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333E6
              E6E6E6E6E6333333A8D6F7A8D6F7A8D6F7333333FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFF333333E6E6E6E6E6E63333333333333333333333
              33333333333333333333333333333333333333333333333333333333333333E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6
              E6E6}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_ETEdit_RenChar: TMTxtEdit
            Left = 317
            Top = 25
            Width = 106
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
            TabOrder = 2
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object Jituzai_ETEdit_LongName: TMTxtEdit
            Left = 99
            Top = 3
            Width = 396
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 60
            FontRatio.Auto = False
            TabOrder = 0
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_SimpleName: TMTxtEdit
            Left = 99
            Top = 25
            Width = 146
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 14
            FontRatio.Auto = False
            TabOrder = 1
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_Fusen: TMTxtEdit
            Left = 130
            Top = 47
            Width = 395
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imOpen
            MaxLength = 60
            FontRatio.Auto = False
            TabOrder = 4
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object Jituzai_ChkBox_Tokusyu: TMCheckBox
            Left = 473
            Top = 25
            Width = 199
            Height = 19
            Caption = #29305#27530#65336#65336#65336#65336#65336#65336#65336#12392#12375#12390#20351#29992
            TabOrder = 3
            OnClick = Jituzai_ChkBox_TokusyuClick
            OnEnter = EnterEvent
          end
        end
        object Jituzai_PMTab: TMTab
          Left = 0
          Top = 77
          Width = 718
          Height = 35
          Items = <
            item
              Caption = #22522#26412#24773#22577
              Color = 16766672
              SyncControl = Jituzai_PPanel_Kihon
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #24037#20107
              Color = 16766672
              SyncControl = Jituzai_PPanel_Koji
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #24037#20107#23436#25104#25391#26367
              Color = 16766672
              SyncControl = Jituzai_PPanel_Kansei
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #22865#32004#24773#22577
              Color = 16766672
              SyncControl = Jituzai_PPanel_Keiyaku
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #20837#37329#24773#22577
              Color = 16766672
              SyncControl = Jituzai_PPanel_KeNyukin
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #35531#27714#12539#20837#37329#20104#23450
              Color = 16766672
              SyncControl = Jituzai_PPanel_Seikyu
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #27010#35201#12539#20633#32771
              Color = 16766672
              SyncControl = Jituzai_PPanel_Bikou
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #12381#12398#20182
              Color = 16766672
              SyncControl = Jituzai_PPanel_Sonota
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end>
          Align = alTop
          TabOrder = 0
          OnChange = Jituzai_PMTabChange
          ItemWidth = 0
          ItemHeight = 0
          ItemMargin = 6
          Style = tsCrystal
          BorderHeight = 8
          BorderFont.Charset = SHIFTJIS_CHARSET
          BorderFont.Color = clWindowText
          BorderFont.Height = -12
          BorderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
          BorderFont.Style = []
          OnKeyDown = Jituzai_PMTabKeyDown
          BorderCaptionAlign = taCenter
          DropShadow = False
        end
        object Jituzai_PPanel_Card_2: TMPanel
          Left = 0
          Top = 437
          Width = 718
          Height = 25
          Align = alBottom
          AutoSize = True
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 9
          OnResize = Jituzai_PPanel_Card_2Resize
          object Jituzai_BBitBtn_Ok: TMBitBtn
            Left = 540
            Top = 0
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
            OnClick = Jituzai_BBitBtn_OkClick
            OnEnter = EnterEvent
          end
          object Jituzai_BBitBtn_Cancel: TMBitBtn
            Left = 622
            Top = 0
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
            OnClick = Jituzai_BBitBtn_CancelClick
            OnEnter = EnterEvent
          end
        end
      end
    end
    object Root_PMTab: TMTab
      Left = 0
      Top = 0
      Width = 718
      Height = 44
      Items = <
        item
          Caption = #23455#22312#24037#20107
          Color = 16766672
          SyncControl = Jituzai_PPanel_Grid
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end
        item
          Caption = #21512#35336#24037#20107
          Color = 16766672
          SyncControl = Goukei_PPanel_Grid
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end
        item
          Caption = #21152#31639#20307#31995
          Visible = False
          Color = 16766672
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end>
      Align = alTop
      TabOrder = 0
      OnChange = Root_PMTabChange
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
      OnEnter = EnterEvent
      OnKeyDown = Root_PMTabKeyDown
      BorderCaptionAlign = taLeftJustify
      DropShadow = False
    end
  end
  object PPanelSpeed: TMPanel
    Left = 0
    Top = 0
    Width = 940
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 0
    object BSpeedButtonEnd: TMSpeedButton
      Left = 1
      Top = 2
      Width = 70
      Height = 21
      Caption = #32066#20102'(&X)'
      Flat = True
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
      OnClick = BSpeedButtonEndClick
    end
    object BSpeedButtonPrn: TMSpeedButton
      Left = 73
      Top = 2
      Width = 70
      Height = 21
      Caption = #21360#21047'(&P)'
      Flat = True
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
      OnClick = BSpeedButtonPrnClick
    end
    object BSpeedButtonChg: TMSpeedButton
      Left = 145
      Top = 2
      Width = 70
      Height = 21
      Caption = #20999#20986'(&G)'
      Flat = True
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
      OnClick = BSpeedButtonChgClick
    end
    object BSpeedButtonIS: TMSpeedButton
      Left = 217
      Top = 2
      Width = 70
      Height = 21
      Caption = #35443#32048'(&T)'
      Flat = True
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
      OnClick = BSpeedButtonISClick
    end
    object BSpeedButtonDel: TMSpeedButton
      Left = 289
      Top = 2
      Width = 70
      Height = 21
      Caption = #21066#38500'(&D)'
      Flat = True
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
      OnClick = BSpeedButtonDelClick
      OnMouseDown = BSpeedButtonDelMouseDown
    end
    object BSpeedButtonSort: TMSpeedButton
      Left = 361
      Top = 2
      Width = 94
      Height = 21
      Caption = #20006#12403#26367#12360'(&S)'
      Flat = True
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
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDDC
        DCDD666666000000000000C0C0C0DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDDCDCDDC0C0C00000000000
        00666666DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDFDFDFDFDFDF54
        8D13548C12DEDFDEDFDFDFDFDFDF666666000000000000C0C0C0DEDFDEDEDFDE
        DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDFDFDFDFDFDFC8C8C8C8C8C8DEDFDEDFDF
        DFDFDFDFC0C0C0000000000000666666E1E1E0874E28874E28874D28874E2887
        4E27E1E1E0E1E1E0E1E1E04E840E4E840EE1E1E0E1E0E1E1E0E1666666000000
        000000C0C0C0E1E1E0C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8E1E1E0E1E1E0E1E1
        E0B7B7B7B7B7B7E1E1E0E1E0E1E1E0E1C0C0C0000000000000666666E3E3E383
        4B27E3E3E3E3E3E3834B26E3E3E3E3E3E3497D0A497D0A487E0A487E0A497D0B
        487D0AE3E3E3666666000000000000C0C0C0E3E3E3C8C8C8E3E3E3E3E3E3C8C8
        C8E3E3E3E3E3E3B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7E3E3E3C0C0C000
        0000000000666666E5E6E67C48247C47257D48257D48257D4825E6E6E6437506
        427506437506427506437506437506E6E6E6666666000000000000C0C0C0E5E6
        E6C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8E6E6E6B0B0B0B0B0B0B0B0B0B0B0B0B0
        B0B0B0B0B0E6E6E6C0C0C0000000000000666666E8E8E9774423E8E8E9E8E8E9
        764423E8E8E9E8E8E9E8E8E9E8E8E93E6F033E6F03E8E8E9E9E8E8E9E8E86666
        66000000000000C0C0C0E8E8E9C8C8C8E8E8E9E8E8E9C8C8C8E8E8E9E8E8E9E8
        E8E9E8E8E9B0B0B0B0B0B0E8E8E9E9E8E8E9E8E8C0C0C0000000000000666666
        EBEBEB704121704021704021704021704021704121704121EBEBEB3E6F033E6F
        03EBEBEBEBEBEBEBEBEB666666000000000000C0C0C0EBEBEBB0B0B0B0B0B0B0
        B0B0B0B0B0B0B0B0B0B0B0B0B0B0EBEBEBA8A8A8A8A8A8EBEBEBEBEBEBEBEBEB
        C0C0C0000000000000666666EDEDED6B3E1FEDEDEDEDEDED6A3E20EDEDEDEDED
        ED6A3D1FEDEDEDEDEDEDEDEDEDEDEDEDEEEDEEEEEDEE666666000000000000C0
        C0C0EDEDEDB0B0B0EDEDEDEDEDEDB0B0B0EDEDEDEDEDEDB0B0B0EDEDEDEDEDED
        EDEDEDEDEDEDEEEDEEEEEDEEC0C0C0000000000000666666F0F0F064391E643A
        1E643A1D643A1E64391D64391E64391E64391D643A1E643A1EF0F0F0F0F0F0F0
        F0F0666666000000000000C0C0C0F0F0F0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0
        B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0F0F0F0F0F0F0F0F0F0C0C0C00000000000
        00666666F3F3F35E361CF3F3F3F3F3F35D361BF3F3F3F3F3F35D361BF3F3F3F3
        F3F35E361BF3F3F3F3F3F3F3F3F3666666000000000000C0C0C0F3F3F3B0B0B0
        F3F3F3F3F3F3B0B0B0F3F3F3F3F3F3B0B0B0F3F3F3F3F3F3B0B0B0F3F3F3F3F3
        F3F3F3F3C0C0C0000000000000666666F6F6F657331A57331A57321A57321A57
        321A57321A57321A57321A57321A57321AF6F6F6F6F6F6F6F6F6666666000000
        000000C0C0C0F6F6F6A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8A8A8F6F6F6F6F6F6F6F6F6C0C0C0000000000000666666F9F8F852
        2F18F9F8F8F9F8F8522F18F9F8F8F9F8F8522F18F9F8F8F9F8F8522F18F9F8F8
        F9F8F8F9F9F8666666000000000000C0C0C0F9F8F8A8A8A8F9F8F8F9F8F8A8A8
        A8F9F8F8F9F8F8A8A8A8F9F8F8F9F8F8A8A8A8F9F8F8F9F8F8F9F9F8C0C0C000
        0000000000666666FCFCFB4E2D174E2D174E2D174E2D174E2D174E2D174E2D17
        4E2D174E2D174E2D17FCFCFBFCFCFBFBFBFB666666000000000000C0C0C0FCFC
        FBA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8FC
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
      OnClick = BSpeedButtonSortClick
    end
    object BSpeedButtonFind: TMSpeedButton
      Left = 456
      Top = 2
      Width = 70
      Height = 21
      Caption = #26908#32034'(&Q)'
      Flat = True
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
      OnClick = BSpeedButtonFindClick
    end
    object B_ImportWF: TMSpeedButton
      Left = 526
      Top = 2
      Width = 112
      Height = 21
      Caption = #30003#35531#26360#21442#29031'(&B)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Pitch = fpFixed
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
      OnClick = B_ImportWFClick
    end
    object B_GrpSec: TMSpeedButton
      Left = 688
      Top = 2
      Width = 140
      Height = 21
      Caption = #65400#65438#65433#65392#65420#65439#21029#65406#65399#65389#65432#65411#65384'(&O)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Pitch = fpFixed
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
      OnClick = B_GrpSecClick
    end
    object B_SetUp: TMSpeedButton
      Left = 831
      Top = 2
      Width = 70
      Height = 21
      Caption = #35373#23450'(&O)'
      Flat = True
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
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = BSpeedButtonClick
    end
    object Image_Jitsuzai: TImage
      Left = 913
      Top = 3
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        0000100000000100180000000000000300000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4040
        40404040404040404040404040404040404040404040404040404040FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF666666666666666666666666666666666666666666
        666666666666666666404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666404040FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF666666404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FFFF
        FF666666666666666666666666FFFFFF666666FFFFFF666666404040FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF666666404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FFFF
        FF666666666666666666666666666666666666FFFFFF666666404040FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF666666404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FFFF
        FFFFFFFF666666666666FFFFFF666666666666FFFFFF666666404040FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF666666404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FFFF
        FF666666666666666666666666666666666666FFFFFF666666404040FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF666666404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF666666404040FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF666666666666666666666666666666666666666666
        666666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Visible = False
    end
    object Image_Goukei: TImage
      Left = 900
      Top = 7
      Width = 16
      Height = 18
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000120B0000120B0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4040404040
        40404040404040404040404040404040404040404040404040404040FFFFFFFF
        FFFFFFFFFFFFFFFF666666666666666666666666666666666666666666666666
        666666666666666666404040FFFFFFFFFFFFFFFFFFFFFFFF666666EEDFC76666
        66EDDFC7EDDFC8EDDFC8EDDFC7EEE0C8EEDFC8EDDFC8666666404040FFFFFFFF
        FFFFFFFFFFFFFFFF666666EADAC0666666EADAC1EADAC0EADAC0EAD9C0EADAC0
        EADAC0EADAC0666666404040FFFFFFFFFFFFFFFFFFFFFFFF666666E6D3B86666
        66E6D3B8E6D3B8E5D4B8E6D4B9E6D3B8E5D4B8E6D4B8666666404040FFFFFFFF
        FFFFFFFFFFFFFFFF666666E2CEB0666666E2CDB1E2CEB0E2CEB1E2CEB1E2CDB1
        E1CDB1E2CEB0666666404040FFFFFFFFFFFFFFFFFFFFFFFF666666DEC8A96666
        66DEC8A9DEC8A9DEC9A9DDC8A9DEC9AADEC8A9DDC9AA666666404040FFFFFFFF
        FFFFFFFFFFFFFFFF666666DAC2A2666666DAC2A2DAC2A2DAC2A1DAC2A1DAC2A2
        DAC2A1DAC2A2666666404040FFFFFFFFFFFFFFFFFFFFFFFF666666D6BC9A6666
        66D7BC9A666666666666666666666666666666D6BC9A666666404040FFFFFFFF
        FFFFFFFFFFFFFFFF666666D2B794666666D2B894404040404040404040404040
        404040D3B793666666404040FFFFFFFFFFFFFFFFFFFFFFFF666666D0B48F6666
        66D0B48FD0B48FD0B48FD0B48FD0B48FD0B48FD0B48F666666404040FFFFFFFF
        FFFFFFFFFFFFFFFF666666FFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF666666404040FFFFFFFFFFFFFFFFFFFFFFFF6666666666666666
        66666666666666666666666666666666666666666666666666FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Visible = False
    end
    object LVStyleBar: TMToolBar
      Left = 638
      Top = 0
      Width = 50
      Height = 22
      Align = alNone
      Caption = 'LVStyleBar'
      DisabledImages = imgFusenD
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = imgFusen
      TabOrder = 0
      Transparent = True
      SysBaseColorB = 10841658
      SysBaseColorD = 6956042
      object btnFusenCtl: TToolButton
        Tag = 100
        Left = 0
        Top = 0
        Caption = 'btnFusenCtl'
        DropdownMenu = PMFusen
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = btnFusenCtlClick
      end
    end
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 598
    Width = 273
    Height = 9
    Anchors = []
    Max = 0
    Smooth = True
    TabOrder = 2
    Visible = False
  end
  object MPanel3: TMPanel
    Left = 0
    Top = 572
    Width = 940
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    object SStatusBar: TMStatusBar
      Left = 0
      Top = 21
      Width = 940
      Height = 19
      Color = 15921906
      Panels = <>
      SimplePanel = True
    end
    object MSPFunctionBar: TMSPFunctionBar
      Left = 0
      Top = 0
      Width = 940
      Height = 21
      Alignment = taLeftJustify
      FuncColor = 15921906
      Align = alBottom
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Pitch = fpFixed
      Font.Style = []
      KeyDownEvent = False
      ButtonCount = 8
      ButtonWidth = 117
      FuncAnchors = True
      OnFunctionClick = MSPFunctionBarFunctionClick
      SysBaseColorB = 10841658
      SysBaseColorD = 6956042
    end
  end
  object PPanelTree: TMPanel
    Left = 0
    Top = 44
    Width = 220
    Height = 528
    Align = alLeft
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 4
    object VTreeView: TMTreeView
      Left = 0
      Top = 0
      Width = 220
      Height = 528
      Align = alClient
      DragMode = dmAutomatic
      HotTrack = True
      Images = TreeView_VImageList
      Indent = 19
      PopupMenu = PMKasantaikei
      ReadOnly = True
      RightClickSelect = True
      ShowLines = False
      TabOrder = 0
      TabStop = False
      OnChange = VTreeViewChange
      OnClick = VTreeViewClick
      OnDragDrop = VTreeViewDragDrop
      OnDragOver = VTreeViewDragOver
      OnEnter = VTreeViewEnter
      OnExit = VTreeViewExit
    end
  end
  object PPanel_ECombo: TMPanel
    Left = 75
    Top = 24
    Width = 170
    Height = 19
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 5
    object ECombo_Header: TMComboBox
      Left = 0
      Top = 0
      Width = 153
      Height = 19
      CanEdit = False
      Columns = <
        item
          Width = 153
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
      DropDownCount = 10
      Items.Strings = (
        #22522#26412#24773#22577
        #20250#35336#24773#22577
        #20661#27177#24773#22577
        #36009#22770#24773#22577
        #25903#25173#24773#22577
        #25903#25173#24773#22577#65288#38917#30446#21029#65289)
      TabOrder = 0
      OnChange = ECombo_HeaderChange
      OnEnter = ECombo_HeaderEnter
      OnExit = ECombo_HeaderExit
      OnKeyDown = ECombo_HeaderKeyDown
    end
  end
  object LSinsei: TMPanel
    Left = 698
    Top = 25
    Width = 90
    Height = 19
    BevelOuter = bvLowered
    Caption = #30003#35531#26360#21442#29031
    Color = 15921906
    Ctl3D = True
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Pitch = fpFixed
    Font.Style = []
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 6
    Visible = False
  end
  object JHojyoMA_DMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = JHojyoMA_DMemDataBeforePost
    AfterPost = JHojyoMA_DMemDataAfterPost
    Left = 2
    Top = 387
    object JHojyoMA_DMemDataFusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object JHojyoMA_DMemDataFusenIndex: TIntegerField
      FieldName = 'FusenIndex'
    end
    object JHojyoMA_DMemDataMasterKbn: TIntegerField
      FieldName = 'MasterKbn'
    end
    object JHojyoMA_DMemDataSumKbn: TIntegerField
      FieldName = 'SumKbn'
    end
    object JHojyoMA_DMemDataRecordKbn: TIntegerField
      FieldName = 'RecordKbn'
    end
    object JHojyoMA_DMemDataGCode: TStringField
      FieldName = 'GCode'
      Size = 16
    end
    object JHojyoMA_DMemDataRenChar: TStringField
      DisplayWidth = 10
      FieldName = 'RenChar'
      Size = 10
    end
    object JHojyoMA_DMemDataLongName: TStringField
      FieldName = 'LongName'
      Size = 60
    end
    object JHojyoMA_DMemDataSimpleName: TStringField
      FieldName = 'SimpleName'
      Size = 14
    end
    object JHojyoMA_DMemDataNCode: TFloatField
      FieldName = 'NCODE'
    end
    object JHojyoMA_DMemDataRootKbn: TIntegerField
      FieldName = 'RootKbn'
    end
    object JHojyoMA_DMemDataZipCode1: TIntegerField
      FieldName = 'ZipCode1'
    end
    object JHojyoMA_DMemDataZipCode2: TIntegerField
      FieldName = 'ZipCode2'
    end
    object JHojyoMA_DMemDataAddress1: TStringField
      FieldName = 'Address1'
      Size = 50
    end
    object JHojyoMA_DMemDataAddress2: TStringField
      FieldName = 'Address2'
      Size = 50
    end
    object JHojyoMA_DMemDataTelNo: TStringField
      FieldName = 'TelNo'
    end
    object JHojyoMA_DMemDataPersonCode: TStringField
      FieldName = 'PersonCode'
      Size = 16
    end
    object JHojyoMA_DMemDataCostomerCode: TStringField
      FieldName = 'CostomerCode'
      Size = 16
    end
    object JHojyoMA_DMemDataBmnCode: TStringField
      FieldName = 'BmnCode'
      Size = 16
    end
    object JHojyoMA_DMemDataSalesBase: TIntegerField
      FieldName = 'SalesBase'
    end
    object JHojyoMA_DMemDataHaifuKbn: TIntegerField
      FieldName = 'HaifuKbn'
    end
    object JHojyoMA_DMemDataPartKbn: TIntegerField
      FieldName = 'PartKbn'
    end
    object JHojyoMA_DMemDataStartDate: TDateField
      FieldName = 'StartDate'
    end
    object JHojyoMA_DMemDataScheduleDate: TDateField
      FieldName = 'ScheduleDate'
    end
    object JHojyoMA_DMemDataDetailKbn1: TIntegerField
      FieldName = 'DetailKbn1'
    end
    object JHojyoMA_DMemDataDetailKbn2: TIntegerField
      FieldName = 'DetailKbn2'
    end
    object JHojyoMA_DMemDataFinishDate: TDateField
      FieldName = 'FinishDate'
    end
    object JHojyoMA_DMemDataBunCode: TIntegerField
      FieldName = 'BunCode'
    end
    object JHojyoMA_DMemDataMoveKbn: TIntegerField
      FieldName = 'MoveKbn'
    end
    object JHojyoMA_DMemDataCostomerName: TStringField
      FieldName = 'CostomerName'
      Size = 60
    end
    object JHojyoMA_DMemDataSalesKmkCd: TIntegerField
      FieldName = 'SalesKmkCd'
    end
    object JHojyoMA_DMemDataPatternNo: TIntegerField
      FieldName = 'PatternNo'
    end
    object JHojyoMA_DMemDataEndDate: TDateField
      FieldName = 'EndDate'
    end
    object JHojyoMA_DMemDataJStartDate: TDateField
      FieldName = 'JStartDate'
    end
    object JHojyoMA_DMemDataJEndDate: TDateField
      FieldName = 'JEndDate'
    end
    object JHojyoMA_DMemDataBIKO: TStringField
      FieldName = 'BIKO'
      Size = 255
    end
    object JHojyoMA_DMemDataSegCode1: TStringField
      FieldName = 'SegCode1'
      Size = 10
    end
    object JHojyoMA_DMemDataSegCode2: TStringField
      FieldName = 'SegCode2'
      Size = 10
    end
    object JHojyoMA_DMemDataSegCode3: TStringField
      FieldName = 'SegCode3'
      Size = 10
    end
    object JHojyoMA_DMemDataSegCode4: TStringField
      FieldName = 'SegCode4'
      Size = 10
    end
    object JHojyoMA_DMemDataSegCode5: TStringField
      FieldName = 'SegCode5'
      Size = 10
    end
    object JHojyoMA_DMemDataSegCode6: TStringField
      FieldName = 'SegCode6'
      Size = 10
    end
    object JHojyoMA_DMemDataSegCode7: TStringField
      FieldName = 'SegCode7'
      Size = 10
    end
    object JHojyoMA_DMemDataSegCode8: TStringField
      FieldName = 'SegCode8'
      Size = 10
    end
    object JHojyoMA_DMemDataSegCode9: TStringField
      FieldName = 'SegCode9'
      Size = 10
    end
    object JHojyoMA_DMemDataSegCode10: TStringField
      FieldName = 'SegCode10'
    end
    object JHojyoMA_DMemDataBunruiCode1: TStringField
      FieldName = 'BunruiCode1'
      Size = 10
    end
    object JHojyoMA_DMemDataBunruiCode2: TStringField
      FieldName = 'BunruiCode2'
      Size = 10
    end
    object JHojyoMA_DMemDataBunruiCode3: TStringField
      FieldName = 'BunruiCode3'
      Size = 10
    end
    object JHojyoMA_DMemDataBunruiCode4: TStringField
      FieldName = 'BunruiCode4'
      Size = 10
    end
    object JHojyoMA_DMemDataBunruiCode5: TStringField
      FieldName = 'BunruiCode5'
      Size = 10
    end
    object JHojyoMA_DMemDataBunruiCode6: TStringField
      FieldName = 'BunruiCode6'
      Size = 10
    end
    object JHojyoMA_DMemDataBunruiCode7: TStringField
      FieldName = 'BunruiCode7'
      Size = 10
    end
    object JHojyoMA_DMemDataBunruiCode8: TStringField
      FieldName = 'BunruiCode8'
      Size = 10
    end
    object JHojyoMA_DMemDataBunruiCode9: TStringField
      FieldName = 'BunruiCode9'
      Size = 10
    end
    object JHojyoMA_DMemDataBunruiCode10: TStringField
      FieldName = 'BunruiCode10'
    end
    object JHojyoMA_DMemDataSyokuchikbn: TIntegerField
      FieldName = 'Syokuchikbn'
    end
    object JHojyoMA_DMemDatagaiyou: TStringField
      FieldName = 'gaiyou'
      Size = 255
    end
    object JHojyoMA_DMemDataUkeoiKbn: TIntegerField
      FieldName = 'UkeoiKbn'
    end
    object JHojyoMA_DMemDataFAXNo: TStringField
      FieldName = 'FAXNo'
    end
    object JHojyoMA_DMemDataJHojyoMA_DMemDataSeiBmnNCode: TStringField
      FieldName = 'JHojyoMA_DMemDataSeiBmnNCode'
    end
    object JHojyoMA_DMemDataSesNCode: TStringField
      FieldName = 'SesNCode'
    end
    object JHojyoMA_DMemDataSekouPersonCode: TStringField
      FieldName = 'SekouPersonCode'
    end
    object JHojyoMA_DMemDataSekouBmnCode: TStringField
      FieldName = 'SekouBmnCode'
    end
    object JHojyoMA_DMemDataSeikyusakiGCode: TStringField
      FieldName = 'SeikyusakiGCode'
    end
    object JHojyoMA_DMemDataSeikyuKoujiGCode: TStringField
      FieldName = 'SeikyuKoujiGCode'
    end
    object JHojyoMA_DMemDataTaxType: TIntegerField
      FieldName = 'TaxType'
    end
  end
  object JHojyoMA_DDataSource: TDataSource
    DataSet = JHojyoMA_DMemData
    OnStateChange = JHojyoMA_DDataSourceStateChange
    Left = 1
    Top = 432
  end
  object JKeiyaku_DMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = JKeiyaku_DMemDataBeforePost
    BeforeCancel = Keiyaku_DMemDataBeforeCancel
    AfterCancel = Keiyaku_DMemDataAfterCancel
    Left = 58
    Top = 387
    object JKeiyaku_DMemDataInfoKbn: TIntegerField
      FieldName = 'InfoKbn'
    end
    object JKeiyaku_DMemDataNCode: TFloatField
      FieldName = 'NCode'
    end
    object JKeiyaku_DMemDataUpdateTime: TDateField
      FieldName = 'UpdateTime'
    end
    object JKeiyaku_DMemDataContDate: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'ContDate'
    end
    object JKeiyaku_DMemDataContNo: TStringField
      FieldName = 'ContNo'
    end
    object JKeiyaku_DMemDataContMoney: TCurrencyField
      FieldName = 'ContMoney'
      DisplayFormat = '###,##0'
      EditFormat = '###,##0'
    end
    object JKeiyaku_DMemDataDummyTax_Rate: TIntegerField
      FieldName = 'DummyTax_Rate'
    end
    object JKeiyaku_DMemDataTax_Rate: TIntegerField
      DisplayWidth = 2
      FieldKind = fkLookup
      FieldName = 'Tax_Rate'
      LookupDataSet = ListMemTax_Rate
      LookupKeyFields = 'iCode'
      LookupResultField = 'iCode'
      KeyFields = 'DummyTax_Rate'
      Lookup = True
    end
    object JKeiyaku_DMemDataTax_RateName: TStringField
      FieldKind = fkLookup
      FieldName = 'Tax_RateName'
      LookupDataSet = ListMemTax_Rate
      LookupKeyFields = 'iCode'
      LookupResultField = 'iName'
      KeyFields = 'DummyTax_Rate'
      Lookup = True
    end
    object JKeiyaku_DMemDataSales_Tax: TCurrencyField
      FieldName = 'Sales_Tax'
      DisplayFormat = '###,##0'
      EditFormat = '###,##0'
    end
    object JKeiyaku_DMemDataKojiInfo2NCode: TFloatField
      FieldName = 'KojiInfo2NCode'
    end
    object JKeiyaku_DMemDataDspOrder: TIntegerField
      FieldName = 'DspOrder'
    end
    object JKeiyaku_DMemDataCheck: TIntegerField
      FieldName = 'Check'
    end
    object JKeiyaku_DMemDataPrevContDate: TDateTimeField
      FieldName = 'PrevContDate'
    end
    object JKeiyaku_DMemDataOrgNo: TFloatField
      FieldName = 'OrgNo'
    end
    object JKeiyaku_DMemDataInpType: TIntegerField
      FieldName = 'InpType'
    end
    object JKeiyaku_DMemDataCostomerGCode: TStringField
      FieldName = 'CostomerGCode'
    end
    object JKeiyaku_DMemDataCostomerName: TStringField
      FieldName = 'CostomerName'
    end
    object JKeiyaku_DMemDataCostomerNCode: TFloatField
      FieldName = 'CostomerNCode'
    end
    object JKeiyaku_DMemDataFontColorDate: TIntegerField
      FieldName = 'FontColorDate'
    end
    object JKeiyaku_DMemDataFontColorNo: TIntegerField
      FieldName = 'FontColorNo'
    end
    object JKeiyaku_DMemDataFontColorMoney: TIntegerField
      FieldName = 'FontColorMoney'
    end
    object JKeiyaku_DMemDataFontColorTax: TIntegerField
      FieldName = 'FontColorTax'
    end
    object JKeiyaku_DMemDataFontColorTaxRete: TIntegerField
      FieldName = 'FontColorTaxRete'
    end
    object JKeiyaku_DMemDataFontColorTaxReteName: TIntegerField
      FieldName = 'FontColorTaxReteName'
    end
    object JKeiyaku_DMemDataTax_RateName2: TStringField
      FieldName = 'Tax_RateName2'
    end
    object JKeiyaku_DMemDataFontColorTaxRateName2: TIntegerField
      FieldName = 'FontColorTaxRateName2'
    end
  end
  object JNyukin_DMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = JNyukin_DMemDataBeforePost
    Left = 86
    Top = 387
    object JNyukin_DMemDataInfoKbn: TIntegerField
      FieldName = 'InfoKbn'
    end
    object JNyukin_DMemDataNCODE: TFloatField
      FieldName = 'NCode'
    end
    object JNyukin_DMemDataUpdateTime: TDateField
      FieldName = 'UpdateTime'
    end
    object JNyukin_DMemDataContDate: TDateField
      Alignment = taRightJustify
      DisplayWidth = 18
      FieldName = 'ContDate'
    end
    object JNyukin_DMemDataContNo: TStringField
      FieldName = 'ContNo'
    end
    object JNyukin_DMemDataContMoney: TCurrencyField
      FieldName = 'ContMoney'
      DisplayFormat = '###,##0'
      EditFormat = '###,##0'
    end
    object JNyukin_DMemDataTax_Rate: TIntegerField
      FieldName = 'Tax_Rate'
    end
    object JNyukin_DMemDataSales_Tax: TIntegerField
      FieldName = 'Sales_Tax'
    end
    object JNyukin_DMemDataKojiInfo2NCode: TFloatField
      FieldName = 'KojiInfo2NCode'
    end
    object JNyukin_DMemDataDspOrder: TIntegerField
      FieldName = 'DspOrder'
    end
    object JNyukin_DMemDataCheck: TIntegerField
      FieldName = 'Check'
    end
    object JNyukin_DMemDataPrevContDate: TDateTimeField
      FieldName = 'PrevContDate'
    end
    object JNyukin_DMemDataCostomerGCode: TStringField
      FieldName = 'CostomerGCode'
    end
    object JNyukin_DMemDataCostomerName: TStringField
      FieldName = 'CostomerName'
    end
    object JNyukin_DMemDataCostomerNCode: TFloatField
      FieldName = 'CostomerNCode'
    end
    object JNyukin_DMemDataOrgNo: TFloatField
      FieldName = 'OrgNo'
    end
    object JNyukin_DMemDataInpType: TIntegerField
      FieldName = 'InpType'
    end
    object JNyukin_DMemDataFontColorDate: TIntegerField
      FieldName = 'FontColorDate'
    end
    object JNyukin_DMemDataFontColorMony: TIntegerField
      FieldName = 'FontColorMony'
    end
  end
  object JKeiyaku_DDataSource: TDataSource
    DataSet = JKeiyaku_DMemData
    Left = 57
    Top = 432
  end
  object JNyukin_DDataSource: TDataSource
    DataSet = JNyukin_DMemData
    Left = 85
    Top = 432
  end
  object TreeView_VImageList: TImageList
    Left = 57
    Top = 217
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      4200424242004242420000000000000000000000000000000000000000004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000000000000000000042424200424242004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000424242004242
      4200424242004242420063636300636363006363630042424200424242004242
      4200424242004242420042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      000063636300424242000000000000000000000000000000000063636300EFDE
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
      6300000000006363630063636300636363006363630000000000636363000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000006363630063636300000000000000000000000000636363000000
      000063636300424242000000000000000000000000000000000063636300E7D6
      BD0063636300E7D6BD00E7D6BD00E7D6BD00E7D6BD00E7D6BD00E7D6BD00E7D6
      BD00636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      63000000000000000000000000008C5229008C52290000000000000000000000
      000063636300424242000000000000000000000000000000000063636300E7CE
      B50063636300E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500E7CE
      B500636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000006363630063636300636363006363630063636300636363000000
      0000636363004242420000000000000000000000000000000000000000006363
      63000000000063636300000000008C5229008C5229008C5229008C5229000000
      000063636300424242000000000000000000000000000000000063636300DECE
      AD0063636300DECEAD00DECEAD00DECEAD00DECEAD00DECEAD00DECEAD00DECE
      AD00636363004242420000000000000000000000000063636300000000000000
      0000424242004242420000000000636363000000000042424200000000004242
      4200000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000008C522900F7C67B00F7C67B008C52
      290000000000424242000000000000000000000000000000000063636300DEC6
      A50063636300DEC6A500DEC6A500DEC6A500DEC6A500DEC6A500DEC6A500DEC6
      A500636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000063636300636363000000000063636300636363000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000063636300000000008C522900F7C67B00F7C67B00F7C6
      7B008C522900000000000000000000000000000000000000000063636300D6BD
      9C0063636300D6BD9C006363630063636300636363006363630063636300D6BD
      9C00636363004242420000000000000000000000000063636300000000004242
      4200000000004242420000000000636363000000000042424200424242000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      630000000000000000000000000000000000000000008C522900F7C67B00F7C6
      7B00F7C67B008C5229000000000000000000000000000000000063636300D6B5
      940063636300D6BD94004242420042424200424242004242420042424200D6B5
      9400636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000006363630063636300636363006363630063636300636363000000
      0000636363004242420000000000000000000000000000000000000000006363
      63000000000063636300636363006363630063636300000000008C522900F7C6
      7B00F7C67B00F7C67B008C52290000000000000000000000000063636300D6B5
      8C0063636300D6B58C00D6B58C00D6B58C00D6B58C00D6B58C00D6B58C00D6B5
      8C00636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000008C52
      2900F7C67B008C52290000000000000000000000000000000000636363000000
      0000636363000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000063636300636363006363630000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      00008C5229000000000000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000006363
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFF003F003E003FC7F
      E003E003C003C001EFF3EFF3C0038001EFF3EFF3C003BEF9E853E9D3C003A289
      EFF3EE73C003BEF9E813EA13C003B2A9EFF3EF0BC003BEF9EC93ED07C003AA99
      EFF3EF83C003BEF9E813E841C003A289EFF3EFE3D7F3BC79EFF3EFF7C0078383
      E007E00FFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object HojyoMA_DMQuery: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 2
    Top = 302
  end
  object KojiInfo_DMQuery: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 30
    Top = 302
  end
  object GHojyoMA_DMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = GHojyoMA_DMemDataBeforePost
    AfterPost = GHojyoMA_DMemDataAfterPost
    Left = 30
    Top = 387
    object GHojyoMA_DMemDataFusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object GHojyoMA_DMemDataFusenIndex: TIntegerField
      FieldName = 'FusenIndex'
    end
    object GHojyoMA_DMemDataMasterKbn: TIntegerField
      FieldName = 'MasterKbn'
    end
    object GHojyoMA_DMemDataSumKbn: TIntegerField
      FieldName = 'SumKbn'
    end
    object GHojyoMA_DMemDataRecordKbn: TIntegerField
      FieldName = 'RecordKbn'
    end
    object GHojyoMA_DMemDataGCode: TStringField
      FieldName = 'GCode'
      Size = 16
    end
    object GHojyoMA_DMemDataRenChar: TStringField
      DisplayWidth = 10
      FieldName = 'RenChar'
      Size = 10
    end
    object GHojyoMA_DMemDataSimpleName: TStringField
      FieldName = 'SimpleName'
      Size = 14
    end
    object GHojyoMA_DMemDataLongName: TStringField
      FieldName = 'LongName'
      Size = 60
    end
    object GHojyoMA_DMemDataNCode: TFloatField
      FieldName = 'NCODE'
    end
    object GHojyoMA_DMemDataRootKbn: TIntegerField
      FieldName = 'RootKbn'
    end
    object GHojyoMA_DMemDataZipCode1: TIntegerField
      FieldName = 'ZipCode1'
    end
    object GHojyoMA_DMemDataZipCode2: TIntegerField
      FieldName = 'ZipCode2'
    end
    object GHojyoMA_DMemDataAddress1: TStringField
      FieldName = 'Address1'
      Size = 50
    end
    object GHojyoMA_DMemDataAddress2: TStringField
      FieldName = 'Address2'
      Size = 50
    end
    object GHojyoMA_DMemDataTelNo: TStringField
      FieldName = 'TelNo'
    end
    object GHojyoMA_DMemDataPersonCode: TStringField
      FieldName = 'PersonCode'
      Size = 16
    end
    object GHojyoMA_DMemDataCostomerCode: TStringField
      FieldName = 'CostomerCode'
      Size = 16
    end
    object GHojyoMA_DMemDataBmnCode: TStringField
      FieldName = 'BmnCode'
      Size = 16
    end
    object GHojyoMA_DMemDataSalesBase: TIntegerField
      FieldName = 'SalesBase'
    end
    object GHojyoMA_DMemDataHaifuKbn: TIntegerField
      FieldName = 'HaifuKbn'
    end
    object GHojyoMA_DMemDataPartKbn: TIntegerField
      FieldName = 'PartKbn'
    end
    object GHojyoMA_DMemDataStartDate: TDateField
      FieldName = 'StartDate'
    end
    object GHojyoMA_DMemDataEndDate: TDateField
      FieldName = 'EndDate'
    end
    object GHojyoMA_DMemDataDetailKbn1: TIntegerField
      FieldName = 'DetailKbn1'
    end
    object GHojyoMA_DMemDataDetailKbn2: TIntegerField
      FieldName = 'DetailKbn2'
    end
    object GHojyoMA_DMemDataFinishDate: TDateField
      FieldName = 'FinishDate'
    end
    object GHojyoMA_DMemDataMoveKbn: TIntegerField
      FieldName = 'MoveKbn'
    end
    object GHojyoMA_DMemDataCostomerName: TStringField
      FieldName = 'CostomerName'
      Size = 60
    end
    object GHojyoMA_DMemDataSalesKmkCd: TIntegerField
      FieldName = 'SalesKmkCd'
    end
    object GHojyoMA_DMemDataPatternNo: TIntegerField
      FieldName = 'PatternNo'
    end
    object GHojyoMA_DMemDataJStartDate: TDateField
      FieldName = 'JStartDate'
    end
    object GHojyoMA_DMemDataJEndDate: TDateField
      FieldName = 'JEndDate'
    end
    object GHojyoMA_DMemDataSyokuchikbn: TIntegerField
      FieldName = 'Syokuchikbn'
    end
    object GHojyoMA_DMemDataFAXNo: TStringField
      FieldName = 'FAXNo'
    end
    object GHojyoMA_DMemDataUkeoiKbn: TIntegerField
      FieldName = 'UkeoiKbn'
    end
    object GHojyoMA_DMemDataSesNCode: TStringField
      FieldName = 'SesNCode'
    end
    object GHojyoMA_DMemDatagaiyou: TStringField
      FieldName = 'gaiyou'
      Size = 255
    end
    object GHojyoMA_DMemDataBIKO: TStringField
      FieldName = 'BIKO'
      Size = 255
    end
    object GHojyoMA_DMemDataSekouPersonCode: TStringField
      FieldName = 'SekouPersonCode'
    end
    object GHojyoMA_DMemDataSekouBmnCode: TStringField
      FieldName = 'SekouBmnCode'
    end
    object GHojyoMA_DMemDataSeikyusakiGCode: TStringField
      FieldName = 'SeikyusakiGCode'
    end
    object GHojyoMA_DMemDataSeikyuKoujiGCode: TStringField
      FieldName = 'SeikyuKoujiGCode'
    end
  end
  object GHojyoMA_DDataSource: TDataSource
    DataSet = GHojyoMA_DMemData
    OnStateChange = GHojyoMA_DDataSourceStateChange
    Left = 29
    Top = 432
  end
  object GKeiyaku_DMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = GKeiyaku_DMemDataBeforePost
    BeforeCancel = Keiyaku_DMemDataBeforeCancel
    AfterCancel = Keiyaku_DMemDataAfterCancel
    Left = 114
    Top = 387
    object GKeiyaku_DMemDataInfoKbn: TIntegerField
      FieldName = 'InfoKbn'
    end
    object GKeiyaku_DMemDataNCode: TFloatField
      FieldName = 'NCode'
    end
    object GKeiyaku_DMemDataUpDateTime: TDateTimeField
      FieldName = 'UpDateTime'
    end
    object GKeiyaku_DMemDataContDate: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'ContDate'
    end
    object GKeiyaku_DMemDataContNo: TStringField
      FieldName = 'ContNo'
    end
    object GKeiyaku_DMemDataContMoney: TCurrencyField
      FieldName = 'ContMoney'
      DisplayFormat = '###,##0'
      EditFormat = '###,##0'
    end
    object GKeiyaku_DMemDataDummyTax_Rate: TIntegerField
      FieldName = 'DummyTax_Rate'
    end
    object GKeiyaku_DMemDataTax_Rate: TIntegerField
      DisplayWidth = 2
      FieldKind = fkLookup
      FieldName = 'Tax_Rate'
      LookupDataSet = ListMemTax_Rate
      LookupKeyFields = 'iCode'
      LookupResultField = 'iCode'
      KeyFields = 'DummyTax_Rate'
      Lookup = True
    end
    object GKeiyaku_DMemDataTax_RateName: TStringField
      FieldKind = fkLookup
      FieldName = 'Tax_RateName'
      LookupDataSet = ListMemTax_Rate
      LookupKeyFields = 'iCode'
      LookupResultField = 'iName'
      KeyFields = 'DummyTax_Rate'
      Lookup = True
    end
    object GKeiyaku_DMemDataSales_Tax: TCurrencyField
      FieldName = 'Sales_Tax'
      DisplayFormat = '###,##0'
      EditFormat = '###,##0'
    end
    object GKeiyaku_DMemDataKojiInfo2NCode: TFloatField
      FieldName = 'KojiInfo2NCode'
    end
    object GKeiyaku_DMemDataDspOrder: TIntegerField
      FieldName = 'DspOrder'
    end
    object GKeiyaku_DMemDataCheck: TIntegerField
      FieldName = 'Check'
    end
    object GKeiyaku_DMemDataPrevContDate: TDateTimeField
      FieldName = 'PrevContDate'
    end
    object GKeiyaku_DMemDataOrgNo: TFloatField
      FieldName = 'OrgNo'
    end
    object GKeiyaku_DMemDataInpType: TIntegerField
      FieldName = 'InpType'
    end
    object GKeiyaku_DMemDataCostomerGCode: TStringField
      FieldName = 'CostomerGCode'
    end
    object GKeiyaku_DMemDataCostomerName: TStringField
      FieldName = 'CostomerName'
    end
    object GKeiyaku_DMemDataCostomerNCode: TFloatField
      FieldName = 'CostomerNCode'
    end
    object GKeiyaku_DMemDataTax_RateName2: TStringField
      FieldName = 'Tax_RateName2'
    end
    object GKeiyaku_DMemDataFontColorDate: TIntegerField
      FieldName = 'FontColorDate'
    end
    object GKeiyaku_DMemDataFontColorNo: TIntegerField
      FieldName = 'FontColorNo'
    end
    object GKeiyaku_DMemDataFontColorMoney: TIntegerField
      FieldName = 'FontColorMoney'
    end
    object GKeiyaku_DMemDataFontColorTax: TIntegerField
      FieldName = 'FontColorTax'
    end
    object GKeiyaku_DMemDataFontColorTaxRete: TIntegerField
      FieldName = 'FontColorTaxRete'
    end
    object GKeiyaku_DMemDataFontColorTaxReteName: TIntegerField
      FieldName = 'FontColorTaxReteName'
    end
    object GKeiyaku_DMemDataFontColorTaxRateName2: TIntegerField
      FieldName = 'FontColorTaxRateName2'
    end
  end
  object GNyukin_DMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = GNyukin_DMemDataBeforePost
    Left = 142
    Top = 387
    object GNyukin_DMemDataInfoKbn: TIntegerField
      FieldName = 'InfoKbn'
    end
    object GNyukin_DMemDataNCode: TFloatField
      FieldName = 'NCode'
    end
    object GNyukin_DMemDataUpdateTime: TDateTimeField
      FieldName = 'UpdateTime'
    end
    object GNyukin_DMemDataContDate: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'ContDate'
    end
    object GNyukin_DMemDataContNo: TStringField
      FieldName = 'ContNo'
    end
    object GNyukin_DMemDataContMoney: TCurrencyField
      FieldName = 'ContMoney'
      DisplayFormat = '###,##0'
      EditFormat = '###,##0'
    end
    object GNyukin_DMemDataTax_Rate: TIntegerField
      FieldName = 'Tax_Rate'
    end
    object GNyukin_DMemDataSales_Tax: TCurrencyField
      FieldName = 'Sales_Tax'
      DisplayFormat = '###,##0'
      EditFormat = '###,##0'
    end
    object GNyukin_DMemDataKojiInfo2NCode: TFloatField
      FieldName = 'KojiInfo2NCode'
    end
    object GNyukin_DMemDataDspOrder: TIntegerField
      FieldName = 'DspOrder'
    end
    object GNyukin_DMemDataCheck: TIntegerField
      FieldName = 'Check'
    end
    object GNyukin_DMemDataPrevContDate: TDateTimeField
      FieldName = 'PrevContDate'
    end
    object GNyukin_DMemDataCostomerGCode: TStringField
      FieldName = 'CostomerGCode'
    end
    object GNyukin_DMemDataCostomerName: TStringField
      FieldName = 'CostomerName'
    end
    object GNyukin_DMemDataCostomerNCode: TFloatField
      FieldName = 'CostomerNCode'
    end
    object GNyukin_DMemDataOrgNo: TFloatField
      FieldName = 'OrgNo'
    end
    object GNyukin_DMemDataInpType: TIntegerField
      FieldName = 'InpType'
    end
  end
  object GKeiyaku_DDataSource: TDataSource
    DataSet = GKeiyaku_DMemData
    Left = 113
    Top = 432
  end
  object GNyukin_DDataSource: TDataSource
    DataSet = GNyukin_DMemData
    Left = 141
    Top = 432
  end
  object PMKasantaikei: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PMKasantaikeiPopup
    Left = 8
    Top = 260
    object TPDetail: TMenuItem
      Caption = #35443#32048
      OnClick = TPDetailClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object TPCopy: TMenuItem
      Caption = #20182#12398#21152#31639#20808#12408#12467#12500#12540
      ImageIndex = 1
      OnClick = CopyClick
    end
    object TPPaste: TMenuItem
      Caption = #20182#12398#21152#31639#20808#12363#12425#12398#36028#12426#20184#12369
      ImageIndex = 2
      OnClick = PasteClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object TPAllDel: TMenuItem
      Caption = #21152#31639#12375#12394#12356
      ImageIndex = 4
      OnClick = AllDelClick
    end
    object TPDelete: TMenuItem
      Caption = #21066#38500
      ImageIndex = 3
      OnClick = DeleteClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object TPOpen: TMenuItem
      Caption = #20840#12390#23637#38283
      OnClick = TPOpenClick
    end
    object TPClose: TMenuItem
      Caption = #20840#12390#38281#12376#12427
      OnClick = TPCloseClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object TFDel: TMenuItem
      Caption = #12399#12364#12377'(&D)'
      OnClick = TFDelClick
    end
    object TFRe: TMenuItem
      Caption = #20633#32771#20462#27491'(&U)'
      OnClick = TFReClick
    end
    object TFSep: TMenuItem
      Caption = '-'
    end
    object TFRed: TMenuItem
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
      object TFRedOff: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = TFRedOffClick
      end
      object TFRedOn: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = TFRedOnClick
      end
    end
    object TFBlue: TMenuItem
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
      object TFBlueOff: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = TFBlueOffClick
      end
      object TFBlueOn: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = TFBlueOnClick
      end
    end
    object TFGreen: TMenuItem
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
      object TFGreenOff: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = TFGreenOffClick
      end
      object TFGreenOn: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = TFGreenOnClick
      end
    end
    object TFOrange: TMenuItem
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
      object TFOrangeOff: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = TFOrangeOffClick
      end
      object TFOrangeOn: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = TFOrangeOnClick
      end
    end
  end
  object ImageList2: TImageList
    Left = 1
    Top = 217
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
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000FF000000FF000000FF000000FF000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      000000000000000000000000000000000000523952008484840052395200525A
      520084848400AD9CAD00F7FFFF00000000000000000000000000000000008400
      0000000000000000000084000000000000000000000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      00000000000000000000000000000000000052395200ADBDAD00FFDED600FFFF
      FF00FFFFFF00F7FFFF00FFDED600000000000000000000000000000000008400
      0000000000000000000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000005239520052395200523952005239
      5200523952005239520052395200523952000000000000000000000000008400
      0000000000000000000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF008400000000000000000000000000000000000000AD7B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000AD7B0000FFFF
      0000FFDE00000000000000000000000000000000000000000000000000000000
      7B005200AD00AD00FF00AD5AFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      00008400000000000000000000000000000000000000AD7B0000FFFF0000FFFF
      0000FFFF0000FFDE0000FFDE0000AD7B0000523929000000000000000000AD00
      FF00AD7BFF00AD7BFF00AD5AFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      840000848400000000000000000000000000FFFFFF00FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFDE0000FFBD0000AD7B000052182900000000005200
      7B0052007B0052007B0052007B0052007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      84008484840000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFDE0000FFBD0000FFBD0000FFBD0000FFBD0000FFBD0000521829000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084848400848484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000008484
      8400008484000000000000000000000000000000000000000000FFFFFF00FFFF
      0000FFBD00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      840084848400000000000000000000000000000000000000000000000000FFFF
      FF00FFBD00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000523952008484840052395200525A
      520084848400AD9CAD00F7FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000052395200ADBDAD00FFDED600FFFF
      FF00FFFFFF00F7FFFF00FFDED600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005239520052395200523952005239
      520052395200523952005239520052395200424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFC1000000000000
      FFC1000000000000FF81000000000000FF41000000000000E6BF000000000000
      C101000000000000C041000000000000C001000000000000C041000000000000
      C13F000000000000FA81000000000000FF41000000000000FF81000000000000
      FFC1000000000000FFFF000000000000FFFFFFFFFFFFFF00F3FFFFFFFC00FF00
      ED9FFE008000FF00ED6FFE000000FF00ED6FFE000000FFFFF16F80000000E7FF
      FD1F80000001C700FC7F800000038000FEFF800000030000FC7F800100030000
      FD7F80030003801FF93F80070003C7FFFBBF807F0003E700FBBF80FF8007FF00
      FBBF81FFF87FFF00FFFFFFFFFFFFFF0000000000000000000000000000000000
      000000000000}
  end
  object ImageList3: TImageList
    Left = 113
    Top = 217
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
      0000000000000000000000000000000000000000000063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300E7E7E7004A29
      10004A2910004A2910004A2910004A291000E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E70063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E70063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF002100BD002100BD00EFEF
      EF002100BD00EFEFEF0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300EFEFEF000873
      E7000873E7000873E7000873E7000873E700EFEFEF00EFEFEF002100AD002100
      AD00EFEFEF00EFEFEF0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300EFEFEF00104A
      DE00104ADE00104ADE00104ADE00104ADE00EFEFEF00EFEFEF0018008C001800
      8C00EFEFEF00EFEFEF0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F70018008C0018008C00F7F7
      F70018008C00F7F7F70063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300F7F7F700F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300F7F7F7008C52
      29008C5229008C5229008C5229008C522900F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700F7F7F70063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFF0000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      8001000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80078007800780078003800380038003
      8001800180018001800180018001800180018001800180018001800180018001
      80018001800180018001800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PMKouji: TPopupMenu
    Alignment = paRight
    AutoHotkeys = maManual
    Images = ImageList3
    OnPopup = PMKoujiPopup
    Left = 32
    Top = 260
    object GFDel: TMenuItem
      Caption = #12399#12364#12377'(&D)'
      OnClick = GFDelClick
    end
    object GFRe: TMenuItem
      Caption = #20184#31627#20633#32771'(&U)'
      OnClick = GFReClick
    end
    object GFSep: TMenuItem
      Caption = '-'
    end
    object GFRed: TMenuItem
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
      object GFRedOff: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = GFRedOffClick
      end
      object GFRedOn: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = GFRedOnClick
      end
    end
    object GFBlue: TMenuItem
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
      object GFBlueOff: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = GFBlueOffClick
      end
      object GFBlueOn: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = GFBlueOnClick
      end
    end
    object GFGreen: TMenuItem
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
      object GFGreenOff: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = GFGreenOffClick
      end
      object GFGreenOn: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = GFGreenOnClick
      end
    end
    object GFOrange: TMenuItem
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
      object GFOrangeOff: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = GFOrangeOffClick
      end
      object GFOrangeOn: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)'
        OnClick = GFOrangeOnClick
      end
    end
    object GFRed2: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333
        3333333333333333333333333333333333333333333333333333333333333333
        33FFFFFFFFFFFFFFFFFFFFFFFF333333362099352099352199333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFF333333CCCCCC333333FFFFFFFFFFFFFFFFFF333333
        5A4BB65A4BB6594CB6333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333CCCC
        CCCCCCCC333333FFFFFFFFFFFF3333337167C87168C87167C8333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFF333333333333333333333333FFFFFFFFFFFF333333
        8681DB8781DA8781DA333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FB
        FFF0FBFF333333FFFFFFFFFFFF3333339B99EA9A99EA9A98EA333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF333333
        A8A9F5A8A9F5A8A9F5333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FB
        FFF0FBFF333333FFFFFFFFFFFF33333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Visible = False
    end
    object GFBlue2: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333
        3333333333333333333333333333333333333333333333333333333333333333
        33FFFFFFFFFFFFFFFFFFFFFFFF333333C38F4BC38E4BC38E4B333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFF333333CCCCCC333333FFFFFFFFFFFFFFFFFF333333
        CFA469CFA469D0A469333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333CCCC
        CCCCCCCC333333FFFFFFFFFFFF333333D7B27ED6B27ED7B27E333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFF333333333333333333333333FFFFFFFFFFFF333333
        DEBE90DDBE90DDBE90333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FB
        FFF0FBFF333333FFFFFFFFFFFF333333E4CAA1E4CAA1E4CAA1333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF333333
        E8D2ACE8D2ACE8D2AC333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FB
        FFF0FBFF333333FFFFFFFFFFFF33333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Visible = False
    end
    object GFGreen2: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333
        3333333333333333333333333333333333333333333333333333333333333333
        33FFFFFFFFFFFFFFFFFFFFFFFF333333456E1C466E1C466E1C333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFF333333CCCCCC333333FFFFFFFFFFFFFFFFFF333333
        638B41638B41638B42333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333CCCC
        CCCCCCCC333333FFFFFFFFFFFF333333769D59769E59769E5A333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFF333333333333333333333333FFFFFFFFFFFF333333
        87B07087AF7087AF70333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FB
        FFF0FBFF333333FFFFFFFFFFFF33333397BF8497BF8497BF84333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF333333
        A2CA92A2CA92A2CA92333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FB
        FFF0FBFF333333FFFFFFFFFFFF33333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Visible = False
    end
    object GFOrange2: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333333
        3333333333333333333333333333333333333333333333333333333333333333
        33FFFFFFFFFFFFFFFFFFFFFFFF333333338EFE328EFD328EFD333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFF333333CCCCCC333333FFFFFFFFFFFFFFFFFF333333
        5FA9FB5EA9FB5EA9FB333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333CCCC
        CCCCCCCC333333FFFFFFFFFFFF3333337ABAF97ABAF97ABAFA333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFF333333333333333333333333FFFFFFFFFFFF333333
        95CAF895CBF895CAF8333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FB
        FFF0FBFF333333FFFFFFFFFFFF333333A8D6F7A8D6F7A8D6F7333333F0FBFFF0
        FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFF333333FFFFFFFFFFFF333333
        A8D6F7A8D6F7A8D6F7333333F0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FBFFF0FB
        FFF0FBFF333333FFFFFFFFFFFF33333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Visible = False
    end
  end
  object DataSourceKaniJ: TDataSource
    DataSet = JHojyoMA_Print
    Left = 1
    Top = 174
  end
  object ppReportKaniJ: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '0'
      '169533')
    DataPipeline = ppBDEPipelineKaniJ
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RReport1'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (257x364mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'Letter'
    PrinterSetup.mmMarginBottom = 5000
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 5000
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
    Template.FileName = 
      'E:\Program Files\Delphi5\Projects\JNTCRP018001\JNTCRP018001Kan.r' +
      'tm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = ppReportKaniJBeforePrint
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
    Left = 29
    Top = 174
    Version = '19.04'
    mmColumnWidth = 169533
    DataPipelineName = 'ppBDEPipelineKaniJ'
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
      mmHeight = 23813
      mmPrintPosition = 0
      object ppListNameKaniJ: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'ListNameKaniJ'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65336#65336#65336#65336#65336#65336#65336#30331#37682#12522#12473#12488
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
        mmLeft = 131234
        mmTop = 12700
        mmWidth = 76200
        BandType = 0
        LayerName = Foreground
      end
      object ppLine88: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 6350
        mmLeft = 131234
        mmTop = 14288
        mmWidth = 76200
        BandType = 0
        LayerName = Foreground
      end
      object RSV_JituzaiKoujiK_Date: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'SVppDate'
        HyperlinkEnabled = False
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
        mmLeft = 282840
        mmTop = 0
        mmWidth = 53711
        BandType = 0
        LayerName = Foreground
      end
      object JituzaiKoujiK_CorpCode: TppLabel
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
        mmLeft = 265
        mmTop = 529
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground
      end
      object JituzaiKoujiK_CorpName: TppLabel
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
        mmLeft = 9525
        mmTop = 529
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape4: TppShape
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Shape1'
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 0
        mmWidth = 162190
        BandType = 2
        LayerName = Foreground
      end
      object ppLabel58: TppLabel
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
        mmLeft = 4498
        mmTop = 529
        mmWidth = 15875
        BandType = 2
        LayerName = Foreground
      end
      object ppLabel60: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'RLKamokuName1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#24335#21517#31216
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
        mmLeft = 39159
        mmTop = 529
        mmWidth = 101600
        BandType = 2
        LayerName = Foreground
      end
      object ppLine89: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 20902
        mmTop = 0
        mmWidth = 2646
        BandType = 2
        LayerName = Foreground
      end
      object ppLine90: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 0
        mmWidth = 2646
        BandType = 2
        LayerName = Foreground
      end
      object ppLine91: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line10'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 141552
        mmTop = 0
        mmWidth = 2646
        BandType = 2
        LayerName = Foreground
      end
      object ppLabel61: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label61'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#21517#31216
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
        mmLeft = 142611
        mmTop = 529
        mmWidth = 22490
        BandType = 2
        LayerName = Foreground
      end
      object ppLabel86: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
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
        mmLeft = 21697
        mmTop = 529
        mmWidth = 15875
        BandType = 2
        LayerName = Foreground
      end
    end
    object ppDetailBand5: TppDetailBand
      BeforeGenerate = ppDetailBand5BeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLine94: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 0
        mmWidth = 161661
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText14: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'GCode'
        DataPipeline = ppBDEPipelineKaniJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineKaniJ'
        mmHeight = 3175
        mmLeft = 4498
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText53: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RenChar'
        DataPipeline = ppBDEPipelineKaniJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineKaniJ'
        mmHeight = 3175
        mmLeft = 21696
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground
      end
      object ppLine95: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 38100
        mmTop = 0
        mmWidth = 2646
        BandType = 4
        LayerName = Foreground
      end
      object ppLine96: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 141552
        mmTop = 0
        mmWidth = 2646
        BandType = 4
        LayerName = Foreground
      end
      object ppLine97: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 3704
        mmTop = 0
        mmWidth = 3969
        BandType = 4
        LayerName = Foreground
      end
      object ppLine98: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line8'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 165629
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground
      end
      object ppLine108: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line108'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 20902
        mmTop = 0
        mmWidth = 2646
        BandType = 4
        LayerName = Foreground
      end
      object RImageJitsuFusen: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'RImageJitsuFusen'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Fusen'
        DataPipeline = ppBDEPipelineKaniJ
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppBDEPipelineKaniJ'
        mmHeight = 3969
        mmLeft = 529
        mmTop = 0
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText16: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Seishiki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'LongName'
        DataPipeline = ppBDEPipelineKaniJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineKaniJ'
        mmHeight = 3175
        mmLeft = 39158
        mmTop = 529
        mmWidth = 101600
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText52: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SimpleName'
        DataPipeline = ppBDEPipelineKaniJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineKaniJ'
        mmHeight = 3175
        mmLeft = 142611
        mmTop = 529
        mmWidth = 22490
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
    object ppFooterBand5: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RSV_JituzaiKoujiK_Page: TppSystemVariable
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
      object RL_JituzaiKoujiK_Kaikei: TppLabel
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
        mmHeight = 3175
        mmPrintPosition = 0
        object LJitsu_Kensu: TppLabel
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
          mmLeft = 10319
          mmTop = 0
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel150: TppLabel
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
          mmLeft = 3704
          mmTop = 0
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLabel151: TppLabel
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
          mmLeft = 25400
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
  object ppBDEPipelineKaniJ: TppDBPipeline
    DataSource = DataSourceKaniJ
    UserName = 'BDEPipelineKaniJ'
    Left = 57
    Top = 174
  end
  object ppReportKaniG: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '0'
      '169533')
    DataPipeline = ppBDEPipelineKaniG
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RReport1'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (257x364mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'Letter'
    PrinterSetup.mmMarginBottom = 5000
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 5000
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
    Template.FileName = 
      'E:\Program Files\Delphi5\Projects\JNTCRP018001\JNTCRP018001Kan.r' +
      'tm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = ppReportKaniGBeforePrint
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
    Left = 30
    Top = 131
    Version = '19.04'
    mmColumnWidth = 169533
    DataPipelineName = 'ppBDEPipelineKaniG'
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
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLine1: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 6350
        mmLeft = 131234
        mmTop = 14288
        mmWidth = 76200
        BandType = 0
        LayerName = Foreground1
      end
      object RSV_GoukeiKoujiK_Date: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'SVppDate'
        HyperlinkEnabled = False
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
        mmLeft = 289455
        mmTop = 0
        mmWidth = 47096
        BandType = 0
        LayerName = Foreground1
      end
      object GoukeiKoujiK_CorpCode: TppLabel
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
        mmLeft = 265
        mmTop = 529
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground1
      end
      object GoukeiKoujiK_CorpName: TppLabel
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
        mmLeft = 9525
        mmTop = 529
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground1
      end
      object ppListNameKaniG: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'ListNameKaniG'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65336#65336#65336#65336#65336#65336#65336#30331#37682#12522#12473#12488
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
        mmLeft = 131234
        mmTop = 12700
        mmWidth = 76200
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppColumnHeaderBand2: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape1: TppShape
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Shape1'
        mmHeight = 3969
        mmLeft = 4498
        mmTop = 0
        mmWidth = 162190
        BandType = 2
        LayerName = Foreground1
      end
      object ppLabel4: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        mmLeft = 5291
        mmTop = 529
        mmWidth = 15875
        BandType = 2
        LayerName = Foreground1
      end
      object ppLabel5: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'RLKamokuName1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#24335#21517#31216
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
        mmLeft = 39952
        mmTop = 529
        mmWidth = 101600
        BandType = 2
        LayerName = Foreground1
      end
      object ppLine2: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 21697
        mmTop = 0
        mmWidth = 2646
        BandType = 2
        LayerName = Foreground1
      end
      object ppLine3: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 38895
        mmTop = 0
        mmWidth = 2646
        BandType = 2
        LayerName = Foreground1
      end
      object ppLine4: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line10'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 142347
        mmTop = 0
        mmWidth = 2646
        BandType = 2
        LayerName = Foreground1
      end
      object ppLabel6: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label61'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#21517#31216
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
        mmLeft = 143404
        mmTop = 529
        mmWidth = 22490
        BandType = 2
        LayerName = Foreground1
      end
      object ppLabel8: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        mmLeft = 22489
        mmTop = 529
        mmWidth = 15875
        BandType = 2
        LayerName = Foreground1
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforeGenerate = ppDetailBand1BeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLine5: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 4763
        mmTop = 0
        mmWidth = 161661
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText1: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'GCode'
        DataPipeline = ppBDEPipelineKaniG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineKaniG'
        mmHeight = 3175
        mmLeft = 5292
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RenChar'
        DataPipeline = ppBDEPipelineKaniG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineKaniG'
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine6: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 38894
        mmTop = 0
        mmWidth = 2646
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine7: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 142346
        mmTop = 0
        mmWidth = 2646
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine8: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 4498
        mmTop = 0
        mmWidth = 3969
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine9: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line8'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 166423
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine10: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line108'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 21696
        mmTop = 0
        mmWidth = 2646
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBImage1: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'RImageJitsuFusen'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Fusen'
        DataPipeline = ppBDEPipelineKaniJ
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppBDEPipelineKaniJ'
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 0
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText3: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_Seishiki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'LongName'
        DataPipeline = ppBDEPipelineKaniG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineKaniG'
        mmHeight = 3175
        mmLeft = 39952
        mmTop = 529
        mmWidth = 101600
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText4: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SimpleName'
        DataPipeline = ppBDEPipelineKaniG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineKaniG'
        mmHeight = 3175
        mmLeft = 143404
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground1
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
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RSV_GoukeiKoujiK_Page: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        LayerName = Foreground1
      end
      object RL_GoukeiKoujiK_Kaikei: TppLabel
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
        object LGou_Kensu: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer2
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
          mmLeft = 11113
          mmTop = 0
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel11: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer2
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
          mmLeft = 4498
          mmTop = 0
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel12: TppLabel
          FontRatio.Auto = False
          DesignLayer = ppDesignLayer2
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
          mmLeft = 26723
          mmTop = 0
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
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
  object ppBDEPipelineKaniG: TppDBPipeline
    DataSource = DataSourceKaniG
    UserName = 'BDEPipelineKaniG'
    Left = 58
    Top = 131
  end
  object DataSourceKaniG: TDataSource
    DataSet = GHojyoMA_Print
    Left = 2
    Top = 131
  end
  object DataSourceShosaiJ: TDataSource
    DataSet = JHojyoMA_Print
    Left = 1
    Top = 45
  end
  object ppReportShosaiJ: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '0'
      '169533')
    DataPipeline = ppBDEPipelineShosaiJ
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RReport1'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (257x364mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'Letter'
    PrinterSetup.mmMarginBottom = 5000
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 5000
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
    Template.FileName = 'F:\Project(D5)\'#30331#37682#31995'\JNTCRP018001\JNTCRP018001SyoJ.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
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
    Left = 33
    Top = 45
    Version = '19.04'
    mmColumnWidth = 169533
    DataPipelineName = 'ppBDEPipelineShosaiJ'
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
      mmHeight = 19844
      mmPrintPosition = 0
      object ppLine11: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 6350
        mmLeft = 130704
        mmTop = 12700
        mmWidth = 76200
        BandType = 0
        LayerName = Foreground2
      end
      object SVppDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'SVppDate'
        HyperlinkEnabled = False
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
        mmLeft = 292630
        mmTop = 0
        mmWidth = 43921
        BandType = 0
        LayerName = Foreground2
      end
      object LppCorpCode: TppLabel
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
        mmLeft = 265
        mmTop = 529
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground2
      end
      object LppCorpName: TppLabel
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
        mmLeft = 9525
        mmTop = 529
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground2
      end
      object ppListNameShosaiJ: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'ListNameShosaiJ'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65336#65336#65336#65336#65336#65336#65336#30331#37682#12522#12473#12488
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
        mmLeft = 130704
        mmTop = 11113
        mmWidth = 76200
        BandType = 0
        LayerName = Foreground2
      end
    end
    object ppColumnHeaderBand3: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 206111
      mmPrintPosition = 0
      object ppShape2: TppShape
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Shape1'
        mmHeight = 188648
        mmLeft = 1852
        mmTop = 14817
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText21: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText15'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CostomerName'
        DataPipeline = ppBDEPipelineShosaiJ
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
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 59531
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText12: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText8'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CostomerCode'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 59531
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText17: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText11'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CostomerCodeName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 63765
        mmTop = 59531
        mmWidth = 50800
        BandType = 4
        LayerName = Foreground2
      end
      object pDT_Code: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'GCode'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 5821
        mmTop = 11377
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground2
      end
      object pDT_Seishiki: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Seishiki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'LongName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 24077
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground2
      end
      object pDT_Kanryaku: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SimpleName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 32544
        mmTop = 11377
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object pDT_Renso: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RenChar'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 19844
        mmWidth = 30956
        BandType = 4
        LayerName = Foreground2
      end
      object RImageZitsuSFusen: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'RImageJitsuFusen1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Fusen'
        DataPipeline = ppBDEPipelineShosaiJ
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3969
        mmLeft = 59796
        mmTop = 10583
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground2
      end
      object R_JS_LastUpDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_EndDate1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'UpDateTime'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3440
        mmLeft = 46038
        mmTop = 107156
        mmWidth = 53446
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText5: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Address1'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 40217
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText6: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Address2'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 43656
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText7: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ZipCode1'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '000'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 36248
        mmWidth = 4763
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel15: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = '-'
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
        mmLeft = 51065
        mmTop = 36248
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText8: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ZipCode2'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '0000'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 52917
        mmTop = 36248
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText9: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TelNo'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 47625
        mmWidth = 49477
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText10: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText6'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'BmnCode'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 51594
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText11: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText7'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'PersonCode'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 55563
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText13: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText9'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'BmnCodeName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 63765
        mmTop = 51594
        mmWidth = 50800
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText15: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText10'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'PersonCodeName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 63765
        mmTop = 55563
        mmWidth = 50800
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText18: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText12'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'StartDate'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 63500
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText19: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText13'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ScheduleDate'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 67469
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText20: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText14'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'FinishDate'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 71438
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText23: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText17'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'HaifuKbn'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 75406
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText24: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText18'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'HaifuKbnName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 50006
        mmTop = 75406
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText25: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText19'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'BunCode'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 79375
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText26: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText20'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'BunCodeName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 50006
        mmTop = 79375
        mmWidth = 22225
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText27: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText21'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'MoveKbn'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 83344
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText28: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText22'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'MoveKbnName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 50006
        mmTop = 83344
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 2646
        mmTop = 19844
        mmWidth = 7144
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine12: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 91546
        mmLeft = 44979
        mmTop = 19315
        mmWidth = 2646
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel9: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label8'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#24335#21517#31216
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
        mmLeft = 2646
        mmTop = 24077
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel33: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label33'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#21517#31216
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
        mmHeight = 3440
        mmLeft = 2646
        mmTop = 28046
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel42: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 2646
        mmTop = 107156
        mmWidth = 20638
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel10: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #37109#20415#30058#21495
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
        mmLeft = 2646
        mmTop = 36248
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel13: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20303#25152
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
        mmLeft = 2646
        mmTop = 40217
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel16: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label7'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #38651#35441#30058#21495
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
        mmLeft = 2646
        mmTop = 47625
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppKanFuriBmnJ: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label9'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23436#25104#25391#26367#65336#65336#65336#65336#65336#65336#65336
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
        mmLeft = 2646
        mmTop = 51594
        mmWidth = 34925
        BandType = 4
        LayerName = Foreground2
      end
      object ppTantoJ: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label10'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25285#24403#32773
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
        mmLeft = 2646
        mmTop = 55563
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel19: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label101'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21463#27880#20808
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
        mmLeft = 2646
        mmTop = 59531
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel20: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label11'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #30528#24037#24180#26376#26085
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
        mmLeft = 2646
        mmTop = 63500
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel21: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label12'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23436#25104#20104#23450#26085
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
        mmLeft = 2646
        mmTop = 67469
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel22: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label13'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23436#25104#24180#26376#26085
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
        mmLeft = 2646
        mmTop = 71438
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel24: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label15'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #37197#36070#21306#20998
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
        mmLeft = 2646
        mmTop = 75406
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel25: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label16'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20837#21147#21306#20998
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
        mmLeft = 2646
        mmTop = 79375
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel26: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label17'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #32716#26399#31227#36865#21306#20998
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
        mmLeft = 2910
        mmTop = 83344
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel27: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label18'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12304
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
        mmLeft = 2117
        mmTop = 11377
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel28: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label19'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12305
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
        mmLeft = 55563
        mmTop = 11377
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel29: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label20'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22522#12288#12288#12288#12288#12288#12288#26412#12288#12288#12288#12288#12288#12288#24773#12288#12288#12288#12288#12288#12288#22577
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
        mmLeft = 39423
        mmTop = 15610
        mmWidth = 69850
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine14: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line9'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 16404
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine22: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line102'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 21431
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine23: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line103'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 1852
        mmTop = 25665
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine25: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line104'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 1852
        mmTop = 29898
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine26: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line105'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 37571
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine27: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line106'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 33602
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine28: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line107'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 44979
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine29: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line109'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 48948
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine30: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1010'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 52917
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine31: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1011'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 56886
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine32: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1012'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 61648
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine33: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1013'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 64823
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine34: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1014'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 68792
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine35: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1015'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 73554
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine36: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1016'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 76729
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine37: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1017'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 81492
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine38: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1018'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 84667
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine39: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line39'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 88636
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine40: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line40'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 92604
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine41: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line41'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 96573
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine42: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line42'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 100542
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine43: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line43'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 104511
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText29: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'pDT_Kanryaku1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SimpleName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3440
        mmLeft = 46038
        mmTop = 28046
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText30: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText23'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'FusenCmt'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 32279
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine13: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line13'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 108744
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel35: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label21'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20184#31627#12467#12513#12531#12488
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
        mmLeft = 2646
        mmTop = 32279
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel36: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label201'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22865' '#12288#12288#32004#12288' '#12288#20837' '#12288#12288#37329' '#12288#12288#20104' '#12288#12288#23450' '#12288#12288#24773' '#12288#12288#22577
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
        mmLeft = 34131
        mmTop = 111919
        mmWidth = 80963
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine16: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line16'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 113771
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel37: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label22'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65326#65327
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
        mmLeft = 3969
        mmTop = 116417
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine17: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line17'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 39423
        mmLeft = 67469
        mmTop = 116152
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine18: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line18'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 39423
        mmLeft = 12171
        mmTop = 116152
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel38: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label23'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22865#32004#24180#26376#26085
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
        mmLeft = 14288
        mmTop = 116417
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine19: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line19'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 35719
        mmLeft = 31750
        mmTop = 116152
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine20: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line20'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 118534
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel39: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label24'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22865#32004#26360#65326#65327
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
        mmLeft = 40481
        mmTop = 116417
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine21: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line201'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 122502
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel40: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label26'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22865#32004#37329#38989
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
        mmLeft = 78581
        mmTop = 116417
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine24: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line24'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 126471
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel41: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label27'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #31246#29575
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
        mmLeft = 109802
        mmTop = 116417
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine44: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 130440
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel43: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label28'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #28040#36027#31246#38989
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
        mmLeft = 133350
        mmTop = 116417
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine45: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line45'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 134409
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine46: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line202'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 138377
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine47: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line47'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 142346
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine48: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line48'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 146315
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine49: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line49'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 150284
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine50: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line50'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 158221
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine51: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line51'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 162190
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine52: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line52'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 166159
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine53: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line53'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 170127
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine54: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line54'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 174096
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel68: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label68'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65297
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
        mmLeft = 5556
        mmTop = 120386
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel55: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label29'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65326#65327
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
        mmLeft = 3969
        mmTop = 156104
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel56: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label35'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20837#37329#20104#23450#26085
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
        mmLeft = 14288
        mmTop = 156104
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel57: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label36'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20837#37329#20104#23450#37329#38989
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
        mmLeft = 39688
        mmTop = 156104
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine58: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line58'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 47625
        mmLeft = 12171
        mmTop = 155575
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText31: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText24'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN1'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 160073
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText42: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText42'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN1'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 160073
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText43: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText43'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN2'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 164042
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText44: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText44'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN3'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 168011
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText45: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText45'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN4'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 171980
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText46: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText46'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN5'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 175948
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText47: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText47'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN2'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 164042
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText48: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText48'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN3'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 168011
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText49: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText49'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN4'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 171980
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText50: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText50'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN5'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 175948
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText51: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText51'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK1'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 120386
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText54: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText54'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK1'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 120386
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText55: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText55'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK1'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 33867
        mmTop = 120386
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText56: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText56'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK1'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 120386
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText57: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText57'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK1'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 120386
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText58: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText58'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK2'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 124354
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText59: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText59'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK2'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 33867
        mmTop = 124354
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText60: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText60'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK2'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 124354
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText61: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText61'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK2'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 124354
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText62: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText62'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK2'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 124354
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText63: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText63'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK3'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 128323
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText64: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText64'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK3'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 33867
        mmTop = 128323
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText65: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText601'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK3'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 128323
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText66: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText66'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK3'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 128323
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText67: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText67'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK3'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 128323
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel74: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label37'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12304#21512#35336#12305
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
        mmLeft = 794
        mmTop = 152136
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText68: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText501'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'NyukinG'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 199761
        mmWidth = 33338
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText69: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText502'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ShohiG'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 152136
        mmWidth = 33338
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText70: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText503'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KeiyakuG'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 68792
        mmTop = 152136
        mmWidth = 33338
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabelTokusyu: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText25'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TokCaption'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Size = 10
        Font.Style = []
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 67204
        mmTop = 11377
        mmWidth = 91281
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText81: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText16'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK1Name'
        DataPipeline = ppBDEPipelineShosaiJ
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
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 120386
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText84: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText84'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK2Name'
        DataPipeline = ppBDEPipelineShosaiJ
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
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 124354
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText90: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText90'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK3Name'
        DataPipeline = ppBDEPipelineShosaiJ
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
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 128323
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65298
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
        mmLeft = 5556
        mmTop = 124354
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label14'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65299
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
        mmLeft = 5556
        mmTop = 128323
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel7: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label30'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65300
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
        mmLeft = 5556
        mmTop = 132292
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel14: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label31'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65301
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
        mmLeft = 5556
        mmTop = 136261
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel17: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label32'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65302
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
        mmLeft = 5556
        mmTop = 140229
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel18: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label34'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65303
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
        mmLeft = 5556
        mmTop = 144198
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel23: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label38'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65304
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
        mmLeft = 5556
        mmTop = 148167
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel30: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label301'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65304
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
        mmLeft = 5556
        mmTop = 187855
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel31: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label39'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65303
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
        mmLeft = 5556
        mmTop = 183886
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel32: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label40'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65302
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
        mmLeft = 5556
        mmTop = 179917
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel34: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label41'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65301
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
        mmLeft = 5556
        mmTop = 175948
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel44: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label302'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65300
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
        mmLeft = 5556
        mmTop = 171980
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel45: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label42'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65299
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
        mmLeft = 5556
        mmTop = 168011
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel46: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label43'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65298
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
        mmLeft = 5556
        mmTop = 164042
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel47: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label44'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65297
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
        mmLeft = 5556
        mmTop = 160073
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine100: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line100'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 178065
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine101: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line101'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 182034
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine102: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 186002
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine139: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line139'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 189971
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel48: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label45'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65297#65296
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
        mmLeft = 3969
        mmTop = 195792
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine140: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line140'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 193940
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel49: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label46'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65305
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
        mmLeft = 5556
        mmTop = 191823
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine141: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line141'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 47625
        mmLeft = 67469
        mmTop = 155840
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine55: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 47625
        mmLeft = 31750
        mmTop = 155575
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine56: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 39423
        mmLeft = 103188
        mmTop = 116152
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine57: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line6'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 39423
        mmLeft = 122767
        mmTop = 116152
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText138: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText138'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK4'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 132292
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText139: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText139'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK5'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 136261
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText140: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText140'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK6'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 140229
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText141: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText141'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK7'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 144198
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText142: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText1401'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK8'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 148167
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText143: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText143'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK4'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 33867
        mmTop = 132292
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText144: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText144'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK5'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 33867
        mmTop = 136261
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText145: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText145'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK6'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 33867
        mmTop = 140229
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText146: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText146'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK4'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 132292
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText147: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText602'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK5'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 136261
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText148: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText148'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK6'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 140229
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText149: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText149'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK6'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 140229
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText150: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText150'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK5'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 136261
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText151: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText151'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK4'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 132292
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText152: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText152'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK4Name'
        DataPipeline = ppBDEPipelineShosaiJ
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
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 132292
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText153: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText153'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK5Name'
        DataPipeline = ppBDEPipelineShosaiJ
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
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 136261
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText154: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText901'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK6Name'
        DataPipeline = ppBDEPipelineShosaiJ
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
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 140229
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText155: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText155'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK6'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 140229
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText156: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText156'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK5'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 136261
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText157: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText157'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK4'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 132292
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText158: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText158'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK7'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 33867
        mmTop = 144198
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText159: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText159'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK8'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 33867
        mmTop = 148167
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText160: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText160'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK7'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 144198
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText161: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText161'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK8'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 70379
        mmTop = 148167
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText162: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText1501'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK7'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 144198
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText163: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText163'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK8'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 148167
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText164: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText164'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK7Name'
        DataPipeline = ppBDEPipelineShosaiJ
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
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 144198
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText165: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText165'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK8Name'
        DataPipeline = ppBDEPipelineShosaiJ
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
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 148167
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText166: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText166'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK8'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 148167
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText167: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText167'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK7'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 144198
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText168: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText168'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN6'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 179917
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText169: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText169'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN7'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 183886
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText170: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText170'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN8'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 187855
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText171: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText171'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN9'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 191823
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText172: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText172'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN10'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 195792
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText173: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText504'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN10'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 195792
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText174: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText174'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN9'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 191823
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText175: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText175'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN8'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 187855
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText176: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText176'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN7'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 183886
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText177: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText177'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN6'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 179917
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine62: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line10'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 154252
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine59: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1401'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 197909
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel50: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label501'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12304#21512#35336#12305
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
        mmLeft = 794
        mmTop = 199761
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine93: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line93'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 31750
        mmLeft = 108215
        mmTop = 119856
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel96: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label96'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23436#25104#25391#26367#12497#12479#12540#12531
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
        mmLeft = 2910
        mmTop = 87313
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel97: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label97'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22770#19978#35336#19978#31185#30446#12467#12540#12489
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
        mmLeft = 2910
        mmTop = 91281
        mmWidth = 28575
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel99: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label99'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23436#25104#22770#19978#39640#30456#25163#21208#23450#21306#20998
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
        mmLeft = 2910
        mmTop = 95250
        mmWidth = 34925
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel103: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label103'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65336#65336#65336#65336#65336#65336#65336#31649#29702#21306#20998
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
        mmLeft = 3175
        mmTop = 99219
        mmWidth = 34925
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel104: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label104'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65336#65336#65336#65336#65336#65336#65336#12497#12479#12540#12531#65326#65327
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
        mmLeft = 3175
        mmTop = 103188
        mmWidth = 41275
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText32: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText32'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DetailKbn1'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 87313
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText33: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText33'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DetailKbn1Name'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 50006
        mmTop = 87313
        mmWidth = 33073
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText34: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText34'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SalesKmkCd'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '######'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 91281
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText35: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText35'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SalesKmkCdName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 60140
        mmTop = 91281
        mmWidth = 50800
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText36: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText36'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'PatternNo'
        DataPipeline = ppBDEPipelineShosaiJ
        DisplayFormat = '######'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 103188
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText37: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText37'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'PatternNoName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 56356
        mmTop = 103188
        mmWidth = 97631
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText38: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText38'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DetailKbn2'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 95250
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText39: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText39'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DetailKbn2Name'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 50006
        mmTop = 95250
        mmWidth = 57415
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText40: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText40'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'PartKbn'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 99219
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText41: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText41'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'PartKbnName'
        DataPipeline = ppBDEPipelineShosaiJ
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiJ'
        mmHeight = 3175
        mmLeft = 50006
        mmTop = 99219
        mmWidth = 103981
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel105: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label6'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = '1234567890123456'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 4233
        mmLeft = 5821
        mmTop = 6879
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel106: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label106'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = '1234567890123456'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 40217
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground2
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
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object SVppPage: TppSystemVariable
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
        mmWidth = 338667
        BandType = 8
        LayerName = Foreground2
      end
      object LppAccOffice: TppLabel
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
  object ppBDEPipelineShosaiJ: TppDBPipeline
    DataSource = DataSourceShosaiJ
    UserName = 'BDEPipelineShosaiJ'
    Left = 57
    Top = 45
  end
  object ppBDEPipelineShosaiG: TppDBPipeline
    DataSource = DataSourceShosaiG
    UserName = 'BDEPipelineShosaiG'
    Left = 58
    Top = 88
  end
  object ppReportShosaiG: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '0'
      '169533')
    DataPipeline = ppBDEPipelineShosaiG
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RReport1'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (257x364mm)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'Letter'
    PrinterSetup.mmMarginBottom = 5000
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 5000
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
    Template.FileName = 'F:\Project(D5)\'#30331#37682#31995'\JNTCRP018001\JNTCRP018001SyoG.rtm'
    DuplexNewPage = False
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
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
    Left = 30
    Top = 88
    Version = '19.04'
    mmColumnWidth = 169533
    DataPipelineName = 'ppBDEPipelineShosaiG'
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
      mmHeight = 19844
      mmPrintPosition = 0
      object ppLine70: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 6350
        mmLeft = 130969
        mmTop = 12171
        mmWidth = 76200
        BandType = 0
        LayerName = Foreground3
      end
      object ppSystemVariable1: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'SVppDate'
        HyperlinkEnabled = False
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
        mmLeft = 288132
        mmTop = 0
        mmWidth = 48419
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel79: TppLabel
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
        mmLeft = 265
        mmTop = 529
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel80: TppLabel
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
        mmLeft = 9525
        mmTop = 529
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground3
      end
      object ppListNameShosaiG: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'ListNameShosaiG'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65336#65336#65336#65336#65336#65336#65336#30331#37682#12522#12473#12488
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
        mmLeft = 130969
        mmTop = 10583
        mmWidth = 76200
        BandType = 0
        LayerName = Foreground3
      end
    end
    object ppColumnHeaderBand4: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 198702
      mmPrintPosition = 0
      object ppShape3: TppShape
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Shape3'
        mmHeight = 180711
        mmLeft = 1852
        mmTop = 14817
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText71: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'pDT_Code'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'GCode'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 5556
        mmTop = 11377
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText72: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'pDT_Seishiki'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'LongName'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 24077
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText73: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'pDT_Kanryaku'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SimpleName'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 32279
        mmTop = 11377
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText74: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'pDT_Renso'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RenChar'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 19844
        mmWidth = 41275
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBImage2: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'RImageJitsuFusen1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Fusen'
        DataPipeline = ppBDEPipelineShosaiG
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3969
        mmLeft = 59531
        mmTop = 10583
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText75: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'pDT_EndDate1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'UpDateTime'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3440
        mmLeft = 39423
        mmTop = 99219
        mmWidth = 53446
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText76: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Address1'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 40217
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText77: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Address2'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 43656
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText78: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ZipCode1'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '000'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 36248
        mmWidth = 4763
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel81: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = '-'
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
        mmLeft = 44450
        mmTop = 36248
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText79: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ZipCode2'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '0000'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 46302
        mmTop = 36248
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText80: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TelNo'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 47625
        mmWidth = 48683
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText82: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText7'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'PersonCode'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 51594
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText83: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText8'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CostomerCode'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 55563
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText85: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText10'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'PersonCodeName'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 57150
        mmTop = 51594
        mmWidth = 50800
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText86: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText11'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CostomerCodeName'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 57150
        mmTop = 55563
        mmWidth = 50800
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText87: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText12'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'StartDate'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 67469
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText88: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText13'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ScheduleDate'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 71438
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText89: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText14'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'FinishDate'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 75406
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText94: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText19'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RootKbn'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 59531
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText95: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText20'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RootKbnName'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 59531
        mmWidth = 22225
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel82: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 2646
        mmTop = 19844
        mmWidth = 7144
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine71: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 83873
        mmLeft = 38629
        mmTop = 19315
        mmWidth = 2646
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel83: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label8'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#24335#21517#31216
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
        mmLeft = 2646
        mmTop = 24077
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel84: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label33'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#21517#31216
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
        mmHeight = 3440
        mmLeft = 2646
        mmTop = 28046
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel85: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 2646
        mmTop = 99219
        mmWidth = 20638
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel87: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #37109#20415#30058#21495
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
        mmLeft = 2646
        mmTop = 36248
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel88: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20303#25152
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
        mmLeft = 2646
        mmTop = 40217
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel89: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label7'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #38651#35441#30058#21495
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
        mmLeft = 2646
        mmTop = 47625
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppTantoG: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label10'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25285#24403#32773
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
        mmLeft = 2646
        mmTop = 51594
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel92: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label101'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21463#27880#20808
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
        mmLeft = 2646
        mmTop = 55563
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel93: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label11'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #30528#24037#24180#26376#26085
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
        mmLeft = 2646
        mmTop = 67469
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel94: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label12'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23436#25104#20104#23450#26085
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
        mmLeft = 2646
        mmTop = 71438
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel95: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label13'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23436#25104#24180#26376#26085
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
        mmLeft = 2646
        mmTop = 75406
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel98: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label16'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21517#23492#12379#21306#20998
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
        mmLeft = 2646
        mmTop = 59531
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel100: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label18'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12304
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
        mmLeft = 1852
        mmTop = 11377
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel101: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label19'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12305
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
        mmLeft = 55298
        mmTop = 11377
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel102: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label20'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22522#12288#12288#12288#12288#12288#12288#26412#12288#12288#12288#12288#12288#12288#24773#12288#12288#12288#12288#12288#12288#22577
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
        mmLeft = 39423
        mmTop = 15610
        mmWidth = 69850
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine72: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line9'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 16404
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine73: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line102'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 21431
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine74: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line103'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 1852
        mmTop = 25665
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine75: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line104'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 1852
        mmTop = 29898
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine76: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line105'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 37571
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine77: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line106'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 33602
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine78: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line107'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 44979
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine79: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line109'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 48948
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine80: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1010'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 52917
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine81: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1011'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 56886
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine82: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1012'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 65617
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine83: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1013'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 68792
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine84: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1014'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 72761
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine85: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1015'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 77523
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine86: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1016'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 80698
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine87: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1017'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 85461
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine92: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1018'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 88636
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText98: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'pDT_Kanryaku1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SimpleName'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3440
        mmLeft = 39423
        mmTop = 28046
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText99: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText23'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'FusenCmt'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 32279
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine103: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line13'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 92604
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel108: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label21'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20184#31627#12467#12513#12531#12488
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
        mmLeft = 2646
        mmTop = 32279
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine104: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line15'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 96573
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel109: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label201'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22865' '#12288#12288#32004' '#12288#12288#20837' '#12288#12288#37329' '#12288#12288#20104' '#12288#12288#23450' '#12288#12288#24773' '#12288#12288#22577
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
        mmLeft = 34130
        mmTop = 103981
        mmWidth = 80963
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine105: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line16'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 105834
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel110: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label22'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65326#65327
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
        mmLeft = 3970
        mmTop = 108479
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine106: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line17'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 39688
        mmLeft = 67470
        mmTop = 108215
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine107: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line18'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 39688
        mmLeft = 12172
        mmTop = 108214
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel111: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label23'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22865#32004#24180#26376#26085
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
        mmLeft = 14023
        mmTop = 108479
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine109: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line19'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 35719
        mmLeft = 31750
        mmTop = 108215
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine110: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line20'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 110596
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel112: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label24'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22865#32004#26360#65326#65327
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
        mmLeft = 41010
        mmTop = 108479
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine111: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line201'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 114565
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel113: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label26'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22865#32004#37329#38989
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
        mmLeft = 78581
        mmTop = 108479
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine112: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line24'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 118534
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel114: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label27'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #31246#29575
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
        mmLeft = 109802
        mmTop = 108479
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine113: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 122502
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel115: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label28'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #28040#36027#31246#38989
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
        mmLeft = 132027
        mmTop = 108479
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine114: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line45'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 126471
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine115: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line202'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 130440
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine116: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line47'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 134409
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine117: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line48'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 138377
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine118: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line49'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 142346
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine119: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line50'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2116
        mmTop = 146315
        mmWidth = 146579
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine120: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line51'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 150284
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine121: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line52'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 154252
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine122: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line53'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 158221
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine123: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line54'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 162190
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel129: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label35'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20837#37329#20104#23450#26085
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
        mmLeft = 14023
        mmTop = 148167
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine127: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line58'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 39688
        mmLeft = 103188
        mmTop = 108214
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText110: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText24'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN1'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 152136
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText111: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText42'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN1'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 34661
        mmTop = 152136
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText112: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText43'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN2'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 156104
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText113: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText44'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN3'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 160073
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText114: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText45'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN4'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 164042
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText115: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText46'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN5'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 168011
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText116: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText47'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN2'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 34661
        mmTop = 156104
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText117: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText48'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN3'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 34661
        mmTop = 160073
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText118: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText49'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN4'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 34661
        mmTop = 164042
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText119: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText50'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN5'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 34661
        mmTop = 168011
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText120: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText51'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK1'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 70378
        mmTop = 112448
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText121: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText54'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK1'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 112448
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText122: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText55'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK1'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 33866
        mmTop = 112448
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText123: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText56'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK1'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 112448
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText124: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText57'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK1'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 112448
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText125: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText58'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK2'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 116417
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText126: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText59'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK2'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 33866
        mmTop = 116417
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText127: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText60'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK2'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 70378
        mmTop = 116417
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText128: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText61'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK2'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 116417
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText129: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText62'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK2'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 116417
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText130: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText63'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK3'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 120386
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText131: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText64'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK3'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 33866
        mmTop = 120386
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText132: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText601'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK3'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 70378
        mmTop = 120386
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText133: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText66'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK3'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 120386
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText134: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText67'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK3'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 120386
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText135: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText501'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'NyukinG'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 33073
        mmTop = 191823
        mmWidth = 33338
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText136: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText502'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ShohiG'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 124090
        mmTop = 144198
        mmWidth = 33338
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText137: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText503'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KeiyakuG'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 68792
        mmTop = 144198
        mmWidth = 33338
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine99: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line401'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 100806
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText22: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText6'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CostomerName'
        DataPipeline = ppBDEPipelineShosaiG
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
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 55563
        mmWidth = 107950
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText91: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText91'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK1Name'
        DataPipeline = ppBDEPipelineShosaiG
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
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 112448
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText92: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText92'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK2Name'
        DataPipeline = ppBDEPipelineShosaiG
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
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 116417
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText93: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText93'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK3Name'
        DataPipeline = ppBDEPipelineShosaiG
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
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 120386
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine15: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 60854
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppBmnG: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label102'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #38598#35336#37096#38272
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
        mmLeft = 2646
        mmTop = 63500
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText96: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText96'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'BmnCode'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 63500
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText97: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText108'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'BmnCodeName'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 57150
        mmTop = 63500
        mmWidth = 50800
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine60: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line601'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 39688
        mmLeft = 122766
        mmTop = 108214
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText178: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText178'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK4'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 124354
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText179: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText179'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK5'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 128323
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText180: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText180'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK6'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 132292
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText181: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText181'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK7'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 136261
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText182: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText182'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateK8'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 140229
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText183: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText183'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK4'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 33866
        mmTop = 124354
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText184: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText184'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK5'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 33866
        mmTop = 128323
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText185: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText185'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK6'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 33866
        mmTop = 132292
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText186: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText186'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK7'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 33866
        mmTop = 136261
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText187: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText187'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContNoK8'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 33866
        mmTop = 140229
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel51: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label51'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65297
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
        mmLeft = 5555
        mmTop = 112448
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel52: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label52'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65298
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
        mmLeft = 5555
        mmTop = 116417
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel53: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label53'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65299
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
        mmLeft = 5555
        mmTop = 120386
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel54: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label303'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65300
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
        mmLeft = 5555
        mmTop = 124354
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel59: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label59'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65301
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
        mmLeft = 5555
        mmTop = 128323
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel62: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label62'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65302
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
        mmLeft = 5555
        mmTop = 132292
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel63: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label63'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65303
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
        mmLeft = 5555
        mmTop = 136261
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel64: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label64'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65304
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
        mmLeft = 5555
        mmTop = 140229
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel65: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label65'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12304#21512#35336#12305
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
        mmLeft = 795
        mmTop = 144198
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel66: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label66'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65326#65327
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
        mmLeft = 3970
        mmTop = 148167
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel67: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label67'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65297
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
        mmLeft = 5555
        mmTop = 152136
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel69: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label69'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65298
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
        mmLeft = 5555
        mmTop = 156104
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel70: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label70'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65299
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
        mmLeft = 5555
        mmTop = 160073
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel71: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label71'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65300
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
        mmLeft = 5555
        mmTop = 164042
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel72: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label72'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65301
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
        mmLeft = 5555
        mmTop = 168011
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel73: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label401'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65302
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
        mmLeft = 5555
        mmTop = 171980
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel75: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65304
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
        mmLeft = 5555
        mmTop = 179917
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel76: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label9'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65303
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
        mmLeft = 5555
        mmTop = 175948
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel77: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label14'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65305
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
        mmLeft = 5555
        mmTop = 183886
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel78: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label78'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65297#65296
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
        mmLeft = 3969
        mmTop = 187855
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel90: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label90'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12304#21512#35336#12305
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
        mmLeft = 795
        mmTop = 191823
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine61: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 189971
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine63: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1402'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 186002
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine64: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 182034
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine65: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line6'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 178065
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine66: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 174096
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine67: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1001'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 170127
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine68: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line8'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 166159
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine69: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line10'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 162190
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine142: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line142'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 158221
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine143: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line143'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 154252
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine144: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1019'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 1852
        mmTop = 146315
        mmWidth = 157163
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine145: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line501'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 2117
        mmTop = 150284
        mmWidth = 65616
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine146: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line146'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 47625
        mmLeft = 31750
        mmTop = 147638
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine147: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line147'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 47625
        mmLeft = 12172
        mmTop = 147638
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine148: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line148'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 47625
        mmLeft = 67470
        mmTop = 147902
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppLabel91: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label91'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20837#37329#20104#23450#37329#38989
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
        mmLeft = 40217
        mmTop = 148167
        mmWidth = 19050
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText188: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText188'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK4'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 70378
        mmTop = 124354
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText189: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText603'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK5'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 70378
        mmTop = 128323
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText190: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText190'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK6'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 70378
        mmTop = 132292
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText191: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText191'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK7'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 70378
        mmTop = 136261
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText192: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText192'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyK8'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 70378
        mmTop = 140229
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText193: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText193'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK4'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 124354
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText194: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText194'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK4Name'
        DataPipeline = ppBDEPipelineShosaiG
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
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 124354
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText195: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText195'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK5Name'
        DataPipeline = ppBDEPipelineShosaiG
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
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 128323
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText196: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText196'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK5'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 128323
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText197: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText197'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK6'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 132292
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText198: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText198'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK6Name'
        DataPipeline = ppBDEPipelineShosaiG
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
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 132292
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText199: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText199'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK6'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 132292
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText200: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText200'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK5'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 128323
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText201: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText201'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK4'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 124354
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText202: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText202'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK7'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 136261
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText203: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText203'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK8'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 140229
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText204: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText204'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK8Name'
        DataPipeline = ppBDEPipelineShosaiG
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
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 140229
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText205: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText205'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Tax_RateK7Name'
        DataPipeline = ppBDEPipelineShosaiG
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
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 136261
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText206: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText2001'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK7'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 136261
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText207: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText207'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Sales_TaxK8'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 140229
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText208: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText208'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN6'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 171980
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText209: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText209'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN6'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 34661
        mmTop = 171980
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText210: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText210'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN7'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 175948
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText211: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText211'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN8'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 179917
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText212: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText212'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN9'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 183886
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText213: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText213'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContDateN10'
        DataPipeline = ppBDEPipelineShosaiG
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 187855
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText214: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText214'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN7'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 34661
        mmTop = 175948
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText215: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText215'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN8'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 34661
        mmTop = 179917
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText216: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText216'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN9'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 34661
        mmTop = 183886
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText217: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText505'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ContMoneyN10'
        DataPipeline = ppBDEPipelineShosaiG
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'ppBDEPipelineShosaiG'
        mmHeight = 3175
        mmLeft = 34661
        mmTop = 187855
        mmWidth = 31750
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine124: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line124'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 31750
        mmLeft = 108215
        mmTop = 111919
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground3
      end
    end
    object ppColumnFooterBand4: TppColumnFooterBand
      AlignToBottom = True
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand3: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppSystemVariable2: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        mmWidth = 338667
        BandType = 8
        LayerName = Foreground3
      end
      object ppLabel147: TppLabel
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
  object DataSourceShosaiG: TDataSource
    DataSet = GHojyoMA_Print
    Left = 2
    Top = 88
  end
  object MasterInfo_DMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 59
    Top = 344
    object MasterInfo_DMemDataJHojyoName: TStringField
      FieldName = 'JHojyoName'
    end
    object MasterInfo_DMemDataGHojyoName: TStringField
      FieldName = 'GHojyoName'
    end
    object MasterInfo_DMemDataSpHojyoNCd1: TFloatField
      FieldName = 'SpHojyoNCd1'
    end
    object MasterInfo_DMemDataKojKbn1: TIntegerField
      FieldName = 'KojKbn1'
    end
    object MasterInfo_DMemDataKojKbn2: TIntegerField
      FieldName = 'KojKbn2'
    end
    object MasterInfo_DMemDataMstrKbn4: TIntegerField
      FieldName = 'MstrKbn4'
    end
    object MasterInfo_DMemDataMstrKbn5: TIntegerField
      FieldName = 'MstrKbn5'
    end
    object MasterInfo_DMemDataMstrKbn6: TIntegerField
      FieldName = 'MstrKbn6'
    end
    object MasterInfo_DMemDataMstrKbn7: TIntegerField
      FieldName = 'MstrKbn7'
    end
    object MasterInfo_DMemDataMstrKbn8: TIntegerField
      FieldName = 'MstrKbn8'
    end
    object MasterInfo_DMemDataMstrKbn9: TIntegerField
      FieldName = 'MstrKbn9'
    end
    object MasterInfo_DMemDataMstrKbn10: TIntegerField
      FieldName = 'MstrKbn10'
    end
    object MasterInfo_DMemDataKmkCode3: TIntegerField
      FieldName = 'KmkCode3'
    end
    object MasterInfo_DMemDataKmkCode4: TIntegerField
      FieldName = 'KmkCode4'
    end
    object MasterInfo_DMemDataKmkCode6: TIntegerField
      FieldName = 'KmkCode6'
    end
    object MasterInfo_DMemDataCodeDigit: TIntegerField
      FieldName = 'CodeDigit'
    end
    object MasterInfo_DMemDataCodeAttr: TIntegerField
      FieldName = 'CodeAttr'
    end
    object MasterInfo_DMemDataBumonName: TStringField
      FieldName = 'BumonName'
    end
    object MasterInfo_DMemDataShainName: TStringField
      FieldName = 'ShainName'
    end
    object MasterInfo_DMemDataTorihikiName: TStringField
      FieldName = 'TorihikiName'
    end
    object MasterInfo_DMemDataKosyuName: TStringField
      FieldName = 'KosyuName'
    end
    object MasterInfo_DMemDataCodeDigitBmn: TIntegerField
      FieldName = 'CodeDigitBmn'
    end
    object MasterInfo_DMemDataCodeAttrBmn: TIntegerField
      FieldName = 'CodeAttrBmn'
    end
    object MasterInfo_DMemDataCodeDigitShain: TIntegerField
      FieldName = 'CodeDigitShain'
    end
    object MasterInfo_DMemDataCodeAttrShain: TIntegerField
      FieldName = 'CodeAttrShain'
    end
    object MasterInfo_DMemDataCodeDigitTorihiki: TIntegerField
      FieldName = 'CodeDigitTorihiki'
    end
    object MasterInfo_DMemDataCodeAttrTorihiki: TIntegerField
      FieldName = 'CodeAttrTorihiki'
    end
    object MasterInfo_DMemDataKsyUse: TIntegerField
      FieldName = 'KsyUse'
    end
    object MasterInfo_DMemDataTorihikiUse: TIntegerField
      FieldName = 'TorihikiUse'
    end
    object MasterInfo_DMemDataKojKbn17: TIntegerField
      FieldName = 'KojKbn17'
    end
    object MasterInfo_DMemDataKojKbn18: TIntegerField
      FieldName = 'KojKbn18'
    end
    object MasterInfo_DMemDataCodeDigitSeshu: TIntegerField
      FieldName = 'CodeDigitSeshu'
    end
    object MasterInfo_DMemDataCodeAttrSeshu: TIntegerField
      FieldName = 'CodeAttrSeshu'
    end
    object MasterInfo_DMemDataSeshuName: TStringField
      FieldName = 'SeshuName'
    end
    object MasterInfo_DMemDataMstrKbn20: TIntegerField
      FieldName = 'MstrKbn20'
    end
  end
  object ListMemTax_Rate: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 30
    Top = 344
    object ListMemTax_RateiCode: TIntegerField
      DisplayWidth = 2
      FieldName = 'iCode'
    end
    object ListMemTax_RateiName: TStringField
      DisplayWidth = 8
      FieldName = 'iName'
    end
  end
  object MemDIC_COTXRATE: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 1
    Top = 344
    object MemDIC_COTXRATEStartYMD: TDateField
      FieldName = 'StartYMD'
    end
    object MemDIC_COTXRATETaxRate: TCurrencyField
      FieldName = 'TaxRate'
    end
    object MemDIC_COTXRATERateCD: TSmallintField
      FieldName = 'RateCD'
    end
  end
  object imgFusen: TImageList
    Left = 85
    Top = 217
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80078007800780078003800380038003
      8001800180018001800180018001800180018001800180018001800180018001
      80018001800180018001800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object imgFusenD: TImageList
    Left = 29
    Top = 217
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80078007800780078003800380038003
      8001800180018001800180018001800180018001800180018001800180018001
      80018001800180018001800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PMFusen: TPopupMenu
    AutoHotkeys = maManual
    Images = imgFusen
    Left = 58
    Top = 260
    object MenuItem1: TMenuItem
      Tag = 1
      Caption = #36196'(&R)'
      ImageIndex = 0
      OnClick = FusenListClick
    end
    object B1: TMenuItem
      Tag = 2
      Caption = #38738'(&B)'
      ImageIndex = 1
      OnClick = FusenListClick
    end
    object G1: TMenuItem
      Tag = 3
      Caption = #32209'(&G)'
      ImageIndex = 2
      OnClick = FusenListClick
    end
    object O1: TMenuItem
      Tag = 4
      Caption = #27225'(&O)'
      ImageIndex = 3
      OnClick = FusenListClick
    end
  end
  object JHojyoMA_Print: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 85
    Top = 45
    object JHojyoMA_PrintFusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object JHojyoMA_PrintGCode: TStringField
      DisplayWidth = 16
      FieldName = 'GCode'
      Size = 16
    end
    object JHojyoMA_PrintRenChar: TStringField
      FieldName = 'RenChar'
      Size = 10
    end
    object JHojyoMA_PrintLongName: TStringField
      FieldName = 'LongName'
      Size = 60
    end
    object JHojyoMA_PrintSimpleName: TStringField
      FieldName = 'SimpleName'
      Size = 14
    end
    object JHojyoMA_PrintZipCode1: TIntegerField
      FieldName = 'ZipCode1'
    end
    object JHojyoMA_PrintZipCode2: TIntegerField
      FieldName = 'ZipCode2'
    end
    object JHojyoMA_PrintAddress1: TStringField
      FieldName = 'Address1'
      Size = 50
    end
    object JHojyoMA_PrintAddress2: TStringField
      FieldName = 'Address2'
      Size = 50
    end
    object JHojyoMA_PrintTelNo: TStringField
      FieldName = 'TelNo'
    end
    object JHojyoMA_PrintPersonCode: TStringField
      FieldName = 'PersonCode'
      Size = 10
    end
    object JHojyoMA_PrintCostomerCode: TStringField
      FieldName = 'CostomerCode'
    end
    object JHojyoMA_PrintBmnCode: TStringField
      FieldName = 'BmnCode'
      Size = 10
    end
    object JHojyoMA_PrintSalesBase: TIntegerField
      FieldName = 'SalesBase'
    end
    object JHojyoMA_PrintHaifuKbn: TIntegerField
      FieldName = 'HaifuKbn'
    end
    object JHojyoMA_PrintBunCode: TIntegerField
      FieldName = 'BunCode'
    end
    object JHojyoMA_PrintMoveKbn: TIntegerField
      FieldName = 'MoveKbn'
    end
    object JHojyoMA_PrintPersonCodeName: TStringField
      FieldName = 'PersonCodeName'
      Size = 60
    end
    object JHojyoMA_PrintCostomerCodeName: TStringField
      FieldName = 'CostomerCodeName'
      Size = 60
    end
    object JHojyoMA_PrintBmnCodeName: TStringField
      FieldName = 'BmnCodeName'
      Size = 60
    end
    object JHojyoMA_PrintSalesBaseName: TStringField
      FieldName = 'SalesBaseName'
    end
    object JHojyoMA_PrintHaifuKbnName: TStringField
      FieldName = 'HaifuKbnName'
    end
    object JHojyoMA_PrintBunCodeName: TStringField
      FieldName = 'BunCodeName'
      Size = 60
    end
    object JHojyoMA_PrintMoveKbnName: TStringField
      FieldName = 'MoveKbnName'
    end
    object JHojyoMA_PrintKeiyakuG: TCurrencyField
      FieldName = 'KeiyakuG'
    end
    object JHojyoMA_PrintShohiG: TCurrencyField
      FieldName = 'ShohiG'
    end
    object JHojyoMA_PrintNyukinG: TCurrencyField
      FieldName = 'NyukinG'
    end
    object JHojyoMA_PrintFusenCmt: TStringField
      FieldName = 'FusenCmt'
      Size = 60
    end
    object JHojyoMA_PrintListName: TStringField
      FieldName = 'ListName'
      Size = 30
    end
    object JHojyoMA_PrintTokCaption: TStringField
      DisplayWidth = 60
      FieldName = 'TokCaption'
      Size = 60
    end
    object JHojyoMA_PrintCostomerName: TStringField
      FieldName = 'CostomerName'
      Size = 60
    end
    object JHojyoMA_PrintStartDate: TStringField
      FieldName = 'StartDate'
    end
    object JHojyoMA_PrintEndDate: TStringField
      FieldName = 'EndDate'
    end
    object JHojyoMA_PrintScheduleDate: TStringField
      FieldName = 'ScheduleDate'
    end
    object JHojyoMA_PrintFinishDate: TStringField
      FieldName = 'FinishDate'
    end
    object JHojyoMA_PrintUpDateTime: TStringField
      FieldName = 'UpDateTime'
    end
    object JHojyoMA_PrintDetailKbn1: TIntegerField
      FieldName = 'DetailKbn1'
    end
    object JHojyoMA_PrintDetailKbn1Name: TStringField
      FieldName = 'DetailKbn1Name'
    end
    object JHojyoMA_PrintSalesKmkCd: TIntegerField
      FieldName = 'SalesKmkCd'
    end
    object JHojyoMA_PrintSalesKmkCdName: TStringField
      FieldName = 'SalesKmkCdName'
    end
    object JHojyoMA_PrintDetailKbn2: TIntegerField
      FieldName = 'DetailKbn2'
    end
    object JHojyoMA_PrintDetailKbn2Name: TStringField
      FieldName = 'DetailKbn2Name'
    end
    object JHojyoMA_PrintPartKbn: TIntegerField
      FieldName = 'PartKbn'
    end
    object JHojyoMA_PrintPartKbnName: TStringField
      DisplayWidth = 30
      FieldName = 'PartKbnName'
      Size = 30
    end
    object JHojyoMA_PrintPatternNo: TIntegerField
      FieldName = 'PatternNo'
    end
    object JHojyoMA_PrintPatternNoName: TStringField
      FieldName = 'PatternNoName'
      Size = 30
    end
    object JHojyoMA_PrintContDateK1: TStringField
      FieldName = 'ContDateK1'
    end
    object JHojyoMA_PrintContNoK1: TStringField
      FieldName = 'ContNoK1'
    end
    object JHojyoMA_PrintContMoneyK1: TCurrencyField
      FieldName = 'ContMoneyK1'
    end
    object JHojyoMA_PrintTax_RateK1: TIntegerField
      FieldName = 'Tax_RateK1'
    end
    object JHojyoMA_PrintTax_RateK1Name: TStringField
      FieldName = 'Tax_RateK1Name'
    end
    object JHojyoMA_PrintSales_TaxK1: TCurrencyField
      FieldName = 'Sales_TaxK1'
    end
    object JHojyoMA_PrintContDateK2: TStringField
      FieldName = 'ContDateK2'
    end
    object JHojyoMA_PrintContNoK2: TStringField
      FieldName = 'ContNoK2'
    end
    object JHojyoMA_PrintContMoneyK2: TCurrencyField
      FieldName = 'ContMoneyK2'
    end
    object JHojyoMA_PrintTax_RateK2: TIntegerField
      FieldName = 'Tax_RateK2'
    end
    object JHojyoMA_PrintTax_RateK2Name: TStringField
      FieldName = 'Tax_RateK2Name'
    end
    object JHojyoMA_PrintSales_TaxK2: TCurrencyField
      FieldName = 'Sales_TaxK2'
    end
    object JHojyoMA_PrintContDateK3: TStringField
      FieldName = 'ContDateK3'
    end
    object JHojyoMA_PrintContNoK3: TStringField
      FieldName = 'ContNoK3'
    end
    object JHojyoMA_PrintContMoneyK3: TCurrencyField
      FieldName = 'ContMoneyK3'
    end
    object JHojyoMA_PrintTax_RateK3: TIntegerField
      FieldName = 'Tax_RateK3'
    end
    object JHojyoMA_PrintTax_RateK3Name: TStringField
      FieldName = 'Tax_RateK3Name'
    end
    object JHojyoMA_PrintSales_TaxK3: TCurrencyField
      FieldName = 'Sales_TaxK3'
    end
    object JHojyoMA_PrintContDateK4: TStringField
      FieldName = 'ContDateK4'
    end
    object JHojyoMA_PrintContNoK4: TStringField
      FieldName = 'ContNoK4'
    end
    object JHojyoMA_PrintContMoneyK4: TCurrencyField
      FieldName = 'ContMoneyK4'
    end
    object JHojyoMA_PrintTax_RateK4: TIntegerField
      FieldName = 'Tax_RateK4'
    end
    object JHojyoMA_PrintTax_RateK4Name: TStringField
      FieldName = 'Tax_RateK4Name'
    end
    object JHojyoMA_PrintSales_TaxK4: TCurrencyField
      FieldName = 'Sales_TaxK4'
    end
    object JHojyoMA_PrintContDateK5: TStringField
      FieldName = 'ContDateK5'
    end
    object JHojyoMA_PrintContMoneyK5: TCurrencyField
      FieldName = 'ContMoneyK5'
    end
    object JHojyoMA_PrintContNoK5: TStringField
      FieldName = 'ContNoK5'
    end
    object JHojyoMA_PrintTax_RateK5: TIntegerField
      FieldName = 'Tax_RateK5'
    end
    object JHojyoMA_PrintTax_RateK5Name: TStringField
      FieldName = 'Tax_RateK5Name'
    end
    object JHojyoMA_PrintSales_TaxK5: TCurrencyField
      FieldName = 'Sales_TaxK5'
    end
    object JHojyoMA_PrintContDateK6: TStringField
      FieldName = 'ContDateK6'
    end
    object JHojyoMA_PrintContNoK6: TStringField
      FieldName = 'ContNoK6'
    end
    object JHojyoMA_PrintContMoneyK6: TCurrencyField
      FieldName = 'ContMoneyK6'
    end
    object JHojyoMA_PrintTax_RateK6: TIntegerField
      FieldName = 'Tax_RateK6'
    end
    object JHojyoMA_PrintTax_RateK6Name: TStringField
      FieldName = 'Tax_RateK6Name'
    end
    object JHojyoMA_PrintSales_TaxK6: TCurrencyField
      FieldName = 'Sales_TaxK6'
    end
    object JHojyoMA_PrintContDateK7: TStringField
      FieldName = 'ContDateK7'
    end
    object JHojyoMA_PrintContNoK7: TStringField
      FieldName = 'ContNoK7'
    end
    object JHojyoMA_PrintContMoneyK7: TCurrencyField
      FieldName = 'ContMoneyK7'
    end
    object JHojyoMA_PrintTax_RateK7: TIntegerField
      FieldName = 'Tax_RateK7'
    end
    object JHojyoMA_PrintTax_RateK7Name: TStringField
      FieldName = 'Tax_RateK7Name'
    end
    object JHojyoMA_PrintSales_TaxK7: TCurrencyField
      FieldName = 'Sales_TaxK7'
    end
    object JHojyoMA_PrintContDateK8: TStringField
      FieldName = 'ContDateK8'
    end
    object JHojyoMA_PrintContNoK8: TStringField
      FieldName = 'ContNoK8'
    end
    object JHojyoMA_PrintContMoneyK8: TCurrencyField
      FieldName = 'ContMoneyK8'
    end
    object JHojyoMA_PrintTax_RateK8: TIntegerField
      FieldName = 'Tax_RateK8'
    end
    object JHojyoMA_PrintTax_RateK8Name: TStringField
      FieldName = 'Tax_RateK8Name'
    end
    object JHojyoMA_PrintSales_TaxK8: TCurrencyField
      FieldName = 'Sales_TaxK8'
    end
    object JHojyoMA_PrintContDateN1: TStringField
      FieldName = 'ContDateN1'
    end
    object JHojyoMA_PrintContDateN2: TStringField
      FieldName = 'ContDateN2'
    end
    object JHojyoMA_PrintContDateN3: TStringField
      FieldName = 'ContDateN3'
    end
    object JHojyoMA_PrintContDateN4: TStringField
      FieldName = 'ContDateN4'
    end
    object JHojyoMA_PrintContDateN5: TStringField
      FieldName = 'ContDateN5'
    end
    object JHojyoMA_PrintContDateN6: TStringField
      FieldName = 'ContDateN6'
    end
    object JHojyoMA_PrintContDateN7: TStringField
      FieldName = 'ContDateN7'
    end
    object JHojyoMA_PrintContDateN8: TStringField
      FieldName = 'ContDateN8'
    end
    object JHojyoMA_PrintContDateN9: TStringField
      FieldName = 'ContDateN9'
    end
    object JHojyoMA_PrintContDateN10: TStringField
      FieldName = 'ContDateN10'
    end
    object JHojyoMA_PrintContMoneyN1: TCurrencyField
      FieldName = 'ContMoneyN1'
    end
    object JHojyoMA_PrintContMoneyN2: TCurrencyField
      FieldName = 'ContMoneyN2'
    end
    object JHojyoMA_PrintContMoneyN3: TCurrencyField
      FieldName = 'ContMoneyN3'
    end
    object JHojyoMA_PrintContMoneyN4: TCurrencyField
      FieldName = 'ContMoneyN4'
    end
    object JHojyoMA_PrintContMoneyN5: TCurrencyField
      FieldName = 'ContMoneyN5'
    end
    object JHojyoMA_PrintContMoneyN6: TCurrencyField
      FieldName = 'ContMoneyN6'
    end
    object JHojyoMA_PrintContMoneyN7: TCurrencyField
      FieldName = 'ContMoneyN7'
    end
    object JHojyoMA_PrintContMoneyN8: TCurrencyField
      FieldName = 'ContMoneyN8'
    end
    object JHojyoMA_PrintContMoneyN9: TCurrencyField
      FieldName = 'ContMoneyN9'
    end
    object JHojyoMA_PrintContMoneyN10: TCurrencyField
      FieldName = 'ContMoneyN10'
    end
    object JHojyoMA_PrintScheduleDateS: TStringField
      FieldName = 'ScheduleDateS'
    end
    object JHojyoMA_PrintKanseiCd1: TStringField
      FieldName = 'KanseiCd1'
    end
    object JHojyoMA_PrintKanseiCd2: TStringField
      FieldName = 'KanseiCd2'
    end
    object JHojyoMA_PrintKanseiCd3: TStringField
      FieldName = 'KanseiCd3'
    end
    object JHojyoMA_PrintKanseiCd4: TStringField
      FieldName = 'KanseiCd4'
    end
    object JHojyoMA_PrintKanseiCd5: TStringField
      FieldName = 'KanseiCd5'
    end
    object JHojyoMA_PrintKanseiCd6: TStringField
      FieldName = 'KanseiCd6'
    end
    object JHojyoMA_PrintKanseiCd7: TStringField
      FieldName = 'KanseiCd7'
    end
    object JHojyoMA_PrintKanseiCd8: TStringField
      FieldName = 'KanseiCd8'
    end
    object JHojyoMA_PrintKanseiCd9: TStringField
      FieldName = 'KanseiCd9'
    end
    object JHojyoMA_PrintKanseiCd10: TStringField
      FieldName = 'KanseiCd10'
    end
    object JHojyoMA_PrintKanseiCd11: TStringField
      FieldName = 'KanseiCd11'
    end
    object JHojyoMA_PrintKanseiCd12: TStringField
      FieldName = 'KanseiCd12'
    end
    object JHojyoMA_PrintKanseiCd13: TStringField
      FieldName = 'KanseiCd13'
    end
    object JHojyoMA_PrintKanseiCd14: TStringField
      FieldName = 'KanseiCd14'
    end
    object JHojyoMA_PrintKanseiCd15: TStringField
      FieldName = 'KanseiCd15'
    end
    object JHojyoMA_PrintKanseiCd16: TStringField
      FieldName = 'KanseiCd16'
    end
    object JHojyoMA_PrintKanseiCd17: TStringField
      FieldName = 'KanseiCd17'
    end
    object JHojyoMA_PrintKanseiCd18: TStringField
      FieldName = 'KanseiCd18'
    end
    object JHojyoMA_PrintKanseiCd19: TStringField
      FieldName = 'KanseiCd19'
    end
    object JHojyoMA_PrintKanseiCd20: TStringField
      FieldName = 'KanseiCd20'
    end
    object JHojyoMA_PrintKanseiCd21: TStringField
      FieldName = 'KanseiCd21'
    end
    object JHojyoMA_PrintKanseiCd22: TStringField
      FieldName = 'KanseiCd22'
    end
    object JHojyoMA_PrintKanseiCd23: TStringField
      FieldName = 'KanseiCd23'
    end
    object JHojyoMA_PrintKanseiCd24: TStringField
      FieldName = 'KanseiCd24'
    end
    object JHojyoMA_PrintKanseiCd25: TStringField
      FieldName = 'KanseiCd25'
    end
    object JHojyoMA_PrintKanseiNm1: TStringField
      FieldName = 'KanseiNm1'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm2: TStringField
      FieldName = 'KanseiNm2'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm3: TStringField
      FieldName = 'KanseiNm3'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm4: TStringField
      FieldName = 'KanseiNm4'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm5: TStringField
      FieldName = 'KanseiNm5'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm6: TStringField
      FieldName = 'KanseiNm6'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm7: TStringField
      FieldName = 'KanseiNm7'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm8: TStringField
      FieldName = 'KanseiNm8'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm9: TStringField
      FieldName = 'KanseiNm9'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm10: TStringField
      FieldName = 'KanseiNm10'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm11: TStringField
      FieldName = 'KanseiNm11'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm12: TStringField
      FieldName = 'KanseiNm12'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm13: TStringField
      FieldName = 'KanseiNm13'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm14: TStringField
      FieldName = 'KanseiNm14'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm15: TStringField
      FieldName = 'KanseiNm15'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm16: TStringField
      FieldName = 'KanseiNm16'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm17: TStringField
      FieldName = 'KanseiNm17'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm18: TStringField
      FieldName = 'KanseiNm18'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm19: TStringField
      FieldName = 'KanseiNm19'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm20: TStringField
      FieldName = 'KanseiNm20'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm21: TStringField
      FieldName = 'KanseiNm21'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm22: TStringField
      FieldName = 'KanseiNm22'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm23: TStringField
      FieldName = 'KanseiNm23'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm24: TStringField
      FieldName = 'KanseiNm24'
      Size = 60
    end
    object JHojyoMA_PrintKanseiNm25: TStringField
      FieldName = 'KanseiNm25'
      Size = 60
    end
    object JHojyoMA_PrintMasKbn1: TIntegerField
      FieldName = 'MasKbn1'
    end
    object JHojyoMA_PrintMasKbn2: TIntegerField
      FieldName = 'MasKbn2'
    end
    object JHojyoMA_PrintMasKbn3: TIntegerField
      FieldName = 'MasKbn3'
    end
    object JHojyoMA_PrintMasKbn4: TIntegerField
      FieldName = 'MasKbn4'
    end
    object JHojyoMA_PrintMasKbn5: TIntegerField
      FieldName = 'MasKbn5'
    end
    object JHojyoMA_PrintMasKbn6: TIntegerField
      FieldName = 'MasKbn6'
    end
    object JHojyoMA_PrintMasKbn7: TIntegerField
      FieldName = 'MasKbn7'
    end
    object JHojyoMA_PrintMasKbn8: TIntegerField
      FieldName = 'MasKbn8'
    end
    object JHojyoMA_PrintMasKbn9: TIntegerField
      FieldName = 'MasKbn9'
    end
    object JHojyoMA_PrintMasKbn10: TIntegerField
      FieldName = 'MasKbn10'
    end
    object JHojyoMA_PrintMasKbn11: TIntegerField
      FieldName = 'MasKbn11'
    end
    object JHojyoMA_PrintMasKbn12: TIntegerField
      FieldName = 'MasKbn12'
    end
    object JHojyoMA_PrintMasKbn13: TIntegerField
      FieldName = 'MasKbn13'
    end
    object JHojyoMA_PrintMasKbn14: TIntegerField
      FieldName = 'MasKbn14'
    end
    object JHojyoMA_PrintMasKbn15: TIntegerField
      FieldName = 'MasKbn15'
    end
    object JHojyoMA_PrintMasKbn16: TIntegerField
      FieldName = 'MasKbn16'
    end
    object JHojyoMA_PrintMasKbn17: TIntegerField
      FieldName = 'MasKbn17'
    end
    object JHojyoMA_PrintMasKbn18: TIntegerField
      FieldName = 'MasKbn18'
    end
    object JHojyoMA_PrintMasKbn19: TIntegerField
      FieldName = 'MasKbn19'
    end
    object JHojyoMA_PrintMasKbn20: TIntegerField
      FieldName = 'MasKbn20'
    end
    object JHojyoMA_PrintMasKbn21: TIntegerField
      FieldName = 'MasKbn21'
    end
    object JHojyoMA_PrintMasKbn22: TIntegerField
      FieldName = 'MasKbn22'
    end
    object JHojyoMA_PrintMasKbn23: TIntegerField
      FieldName = 'MasKbn23'
    end
    object JHojyoMA_PrintMasKbn24: TIntegerField
      FieldName = 'MasKbn24'
    end
    object JHojyoMA_PrintMasKbn25: TIntegerField
      FieldName = 'MasKbn25'
    end
    object JHojyoMA_PrintMasNm1: TStringField
      FieldName = 'MasNm1'
    end
    object JHojyoMA_PrintMasNm2: TStringField
      FieldName = 'MasNm2'
    end
    object JHojyoMA_PrintMasNm3: TStringField
      FieldName = 'MasNm3'
    end
    object JHojyoMA_PrintMasNm4: TStringField
      FieldName = 'MasNm4'
    end
    object JHojyoMA_PrintMasNm5: TStringField
      FieldName = 'MasNm5'
    end
    object JHojyoMA_PrintMasNm6: TStringField
      FieldName = 'MasNm6'
    end
    object JHojyoMA_PrintMasNm7: TStringField
      FieldName = 'MasNm7'
    end
    object JHojyoMA_PrintMasNm8: TStringField
      FieldName = 'MasNm8'
    end
    object JHojyoMA_PrintMasNm9: TStringField
      FieldName = 'MasNm9'
    end
    object JHojyoMA_PrintMasNm10: TStringField
      FieldName = 'MasNm10'
    end
    object JHojyoMA_PrintMasNm11: TStringField
      FieldName = 'MasNm11'
    end
    object JHojyoMA_PrintMasNm12: TStringField
      FieldName = 'MasNm12'
    end
    object JHojyoMA_PrintMasNm13: TStringField
      FieldName = 'MasNm13'
    end
    object JHojyoMA_PrintMasNm14: TStringField
      FieldName = 'MasNm14'
    end
    object JHojyoMA_PrintMasNm15: TStringField
      FieldName = 'MasNm15'
    end
    object JHojyoMA_PrintMasNm16: TStringField
      FieldName = 'MasNm16'
    end
    object JHojyoMA_PrintMasNm17: TStringField
      FieldName = 'MasNm17'
    end
    object JHojyoMA_PrintMasNm18: TStringField
      FieldName = 'MasNm18'
    end
    object JHojyoMA_PrintMasNm19: TStringField
      FieldName = 'MasNm19'
    end
    object JHojyoMA_PrintMasNm20: TStringField
      FieldName = 'MasNm20'
    end
    object JHojyoMA_PrintMasNm21: TStringField
      FieldName = 'MasNm21'
    end
    object JHojyoMA_PrintMasNm22: TStringField
      FieldName = 'MasNm22'
    end
    object JHojyoMA_PrintMasNm23: TStringField
      FieldName = 'MasNm23'
    end
    object JHojyoMA_PrintMasNm24: TStringField
      FieldName = 'MasNm24'
    end
    object JHojyoMA_PrintMasNm25: TStringField
      FieldName = 'MasNm25'
    end
    object JHojyoMA_PrintBIKO: TStringField
      FieldName = 'BIKO'
      Size = 255
    end
    object JHojyoMA_PrintGaiyou: TStringField
      DisplayWidth = 128
      FieldName = 'Gaiyou'
      Size = 255
    end
    object JHojyoMA_PrintFAXNo: TStringField
      FieldName = 'FAXNo'
    end
    object JHojyoMA_PrintUkeoiKbn: TIntegerField
      FieldName = 'UkeoiKbn'
    end
    object JHojyoMA_PrintUkeoiKbnName: TStringField
      FieldName = 'UkeoiKbnName'
    end
    object JHojyoMA_PrintSeshuCode: TStringField
      FieldName = 'SeshuCode'
    end
    object JHojyoMA_PrintSeshuCodeName: TStringField
      FieldName = 'SeshuCodeName'
      Size = 60
    end
    object JHojyoMA_PrintSekouPersonCode: TStringField
      FieldName = 'SekouPersonCode'
    end
    object JHojyoMA_PrintSekouPersonCodeName: TStringField
      FieldName = 'SekouPersonCodeName'
      Size = 60
    end
    object JHojyoMA_PrintSekouBmnCodeName: TStringField
      FieldName = 'SekouBmnCodeName'
      Size = 60
    end
    object JHojyoMA_PrintSekouBmnCode: TStringField
      FieldName = 'SekouBmnCode'
    end
    object JHojyoMA_PrintKojKbn2: TIntegerField
      FieldName = 'KojKbn2'
    end
    object JHojyoMA_PrintKojKbn2Name: TStringField
      FieldName = 'KojKbn2Name'
    end
    object JHojyoMA_PrintCostomerCode1: TStringField
      FieldName = 'CostomerCode1'
    end
    object JHojyoMA_PrintCostomerCode2: TStringField
      FieldName = 'CostomerCode2'
    end
    object JHojyoMA_PrintCostomerCode3: TStringField
      FieldName = 'CostomerCode3'
    end
    object JHojyoMA_PrintCostomerCode4: TStringField
      FieldName = 'CostomerCode4'
    end
    object JHojyoMA_PrintCostomerCode5: TStringField
      FieldName = 'CostomerCode5'
    end
    object JHojyoMA_PrintCostomerCode6: TStringField
      FieldName = 'CostomerCode6'
    end
    object JHojyoMA_PrintCostomerCode7: TStringField
      FieldName = 'CostomerCode7'
    end
    object JHojyoMA_PrintCostomerCode8: TStringField
      FieldName = 'CostomerCode8'
    end
    object JHojyoMA_PrintCostomerCode9: TStringField
      FieldName = 'CostomerCode9'
    end
    object JHojyoMA_PrintCostomerCode10: TStringField
      FieldName = 'CostomerCode10'
    end
    object JHojyoMA_PrintCostomerName1: TStringField
      FieldName = 'CostomerName1'
    end
    object JHojyoMA_PrintCostomerName2: TStringField
      FieldName = 'CostomerName2'
    end
    object JHojyoMA_PrintCostomerName3: TStringField
      FieldName = 'CostomerName3'
    end
    object JHojyoMA_PrintCostomerName4: TStringField
      FieldName = 'CostomerName4'
    end
    object JHojyoMA_PrintCostomerName5: TStringField
      FieldName = 'CostomerName5'
    end
    object JHojyoMA_PrintCostomerName6: TStringField
      FieldName = 'CostomerName6'
    end
    object JHojyoMA_PrintCostomerName7: TStringField
      FieldName = 'CostomerName7'
    end
    object JHojyoMA_PrintCostomerName8: TStringField
      FieldName = 'CostomerName8'
    end
    object JHojyoMA_PrintCostomerName9: TStringField
      FieldName = 'CostomerName9'
    end
    object JHojyoMA_PrintCostomerName10: TStringField
      FieldName = 'CostomerName10'
    end
    object JHojyoMA_PrintPartPattern: TIntegerField
      FieldName = 'PartPattern'
    end
    object JHojyoMA_PrintPartPatternName: TStringField
      FieldName = 'PartPatternName'
    end
  end
  object GHojyoMA_Print: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 86
    Top = 88
    object GHojyoMA_PrintFusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object GHojyoMA_PrintGCode: TStringField
      DisplayWidth = 16
      FieldName = 'GCode'
      Size = 16
    end
    object GHojyoMA_PrintRenChar: TStringField
      FieldName = 'RenChar'
      Size = 10
    end
    object GHojyoMA_PrintLongName: TStringField
      FieldName = 'LongName'
      Size = 60
    end
    object GHojyoMA_PrintSimpleName: TStringField
      FieldName = 'SimpleName'
      Size = 14
    end
    object GHojyoMA_PrintRootKbn: TIntegerField
      FieldName = 'RootKbn'
    end
    object GHojyoMA_PrintZipCode1: TIntegerField
      FieldName = 'ZipCode1'
    end
    object GHojyoMA_PrintZipCode2: TIntegerField
      FieldName = 'ZipCode2'
    end
    object GHojyoMA_PrintstrZipCode1: TStringField
      FieldName = 'strZipCode1'
      Size = 3
    end
    object GHojyoMA_PrintstrZipCode2: TStringField
      FieldName = 'strZipCode2'
      Size = 4
    end
    object GHojyoMA_PrintAddress1: TStringField
      FieldName = 'Address1'
      Size = 50
    end
    object GHojyoMA_PrintAddress2: TStringField
      FieldName = 'Address2'
      Size = 50
    end
    object GHojyoMA_PrintTelNo: TStringField
      FieldName = 'TelNo'
    end
    object GHojyoMA_PrintPersonCode: TStringField
      FieldName = 'PersonCode'
      Size = 10
    end
    object GHojyoMA_PrintCostomerCode: TStringField
      FieldName = 'CostomerCode'
    end
    object GHojyoMA_PrintBmnCode: TStringField
      FieldName = 'BmnCode'
      Size = 10
    end
    object GHojyoMA_PrintSalesBase: TIntegerField
      FieldName = 'SalesBase'
    end
    object GHojyoMA_PrintHaifuKbn: TIntegerField
      FieldName = 'HaifuKbn'
    end
    object GHojyoMA_PrintMoveKbn: TIntegerField
      FieldName = 'MoveKbn'
    end
    object GHojyoMA_PrintRootKbnName: TStringField
      FieldName = 'RootKbnName'
    end
    object GHojyoMA_PrintPersonCodeName: TStringField
      FieldName = 'PersonCodeName'
      Size = 60
    end
    object GHojyoMA_PrintCostomerCodeName: TStringField
      FieldName = 'CostomerCodeName'
      Size = 60
    end
    object GHojyoMA_PrintBmnCodeName: TStringField
      FieldName = 'BmnCodeName'
      Size = 60
    end
    object GHojyoMA_PrintSalesBaseName: TStringField
      FieldName = 'SalesBaseName'
    end
    object GHojyoMA_PrintHaifuKbnName: TStringField
      FieldName = 'HaifuKbnName'
    end
    object GHojyoMA_PrintMoveKbnName: TStringField
      FieldName = 'MoveKbnName'
    end
    object GHojyoMA_PrintKeiyakuG: TCurrencyField
      FieldName = 'KeiyakuG'
    end
    object GHojyoMA_PrintShohiG: TCurrencyField
      FieldName = 'ShohiG'
    end
    object GHojyoMA_PrintNyukinG: TCurrencyField
      FieldName = 'NyukinG'
    end
    object GHojyoMA_PrintFusenCmt: TStringField
      FieldName = 'FusenCmt'
      Size = 60
    end
    object GHojyoMA_PrintListName: TStringField
      FieldName = 'ListName'
      Size = 30
    end
    object GHojyoMA_PrintCostomerName: TStringField
      FieldName = 'CostomerName'
      Size = 60
    end
    object GHojyoMA_PrintStartDate: TStringField
      FieldName = 'StartDate'
    end
    object GHojyoMA_PrintScheduleDate: TStringField
      FieldName = 'ScheduleDate'
    end
    object GHojyoMA_PrintFinishDate: TStringField
      FieldName = 'FinishDate'
    end
    object GHojyoMA_PrintUpDateTime: TStringField
      FieldName = 'UpDateTime'
    end
    object GHojyoMA_PrintContDateK1: TStringField
      FieldName = 'ContDateK1'
    end
    object GHojyoMA_PrintContNoK1: TStringField
      FieldName = 'ContNoK1'
    end
    object GHojyoMA_PrintContMoneyK1: TCurrencyField
      FieldName = 'ContMoneyK1'
    end
    object GHojyoMA_PrintTax_RateK1: TIntegerField
      FieldName = 'Tax_RateK1'
    end
    object GHojyoMA_PrintTax_RateK1Name: TStringField
      FieldName = 'Tax_RateK1Name'
    end
    object GHojyoMA_PrintSales_TaxK1: TCurrencyField
      FieldName = 'Sales_TaxK1'
    end
    object GHojyoMA_PrintContDateK2: TStringField
      FieldName = 'ContDateK2'
    end
    object GHojyoMA_PrintContNoK2: TStringField
      FieldName = 'ContNoK2'
    end
    object GHojyoMA_PrintContMoneyK2: TCurrencyField
      FieldName = 'ContMoneyK2'
    end
    object GHojyoMA_PrintTax_RateK2: TIntegerField
      FieldName = 'Tax_RateK2'
    end
    object GHojyoMA_PrintTax_RateK2Name: TStringField
      FieldName = 'Tax_RateK2Name'
    end
    object GHojyoMA_PrintSales_TaxK2: TCurrencyField
      FieldName = 'Sales_TaxK2'
    end
    object GHojyoMA_PrintContDateK3: TStringField
      FieldName = 'ContDateK3'
    end
    object GHojyoMA_PrintContNoK3: TStringField
      FieldName = 'ContNoK3'
    end
    object GHojyoMA_PrintContMoneyK3: TCurrencyField
      FieldName = 'ContMoneyK3'
    end
    object GHojyoMA_PrintTax_RAteK3: TIntegerField
      FieldName = 'Tax_RAteK3'
    end
    object GHojyoMA_PrintTax_RateK3Name: TStringField
      FieldName = 'Tax_RateK3Name'
    end
    object GHojyoMA_PrintSales_TaxK3: TCurrencyField
      FieldName = 'Sales_TaxK3'
    end
    object GHojyoMA_PrintContDateK4: TStringField
      FieldName = 'ContDateK4'
    end
    object GHojyoMA_PrintContNoK4: TStringField
      FieldName = 'ContNoK4'
    end
    object GHojyoMA_PrintContMoneyK4: TCurrencyField
      FieldName = 'ContMoneyK4'
    end
    object GHojyoMA_PrintTax_RateK4: TIntegerField
      FieldName = 'Tax_RateK4'
    end
    object GHojyoMA_PrintTax_RateK4Name: TStringField
      FieldName = 'Tax_RateK4Name'
    end
    object GHojyoMA_PrintSales_TaxK4: TCurrencyField
      FieldName = 'Sales_TaxK4'
    end
    object GHojyoMA_PrintContDateK5: TStringField
      FieldName = 'ContDateK5'
    end
    object GHojyoMA_PrintContNoK5: TStringField
      FieldName = 'ContNoK5'
    end
    object GHojyoMA_PrintContMoneyK5: TCurrencyField
      FieldName = 'ContMoneyK5'
    end
    object GHojyoMA_PrintTax_RateK5: TIntegerField
      FieldName = 'Tax_RateK5'
    end
    object GHojyoMA_PrintTax_RateK5Name: TStringField
      FieldName = 'Tax_RateK5Name'
    end
    object GHojyoMA_PrintSales_TaxK5: TCurrencyField
      FieldName = 'Sales_TaxK5'
    end
    object GHojyoMA_PrintContDateK6: TStringField
      FieldName = 'ContDateK6'
    end
    object GHojyoMA_PrintContNoK6: TStringField
      FieldName = 'ContNoK6'
    end
    object GHojyoMA_PrintContMoneyK6: TCurrencyField
      FieldName = 'ContMoneyK6'
    end
    object GHojyoMA_PrintTax_RateK6: TIntegerField
      FieldName = 'Tax_RateK6'
    end
    object GHojyoMA_PrintTax_RateK6Name: TStringField
      FieldName = 'Tax_RateK6Name'
    end
    object GHojyoMA_PrintSales_TaxK6: TCurrencyField
      FieldName = 'Sales_TaxK6'
    end
    object GHojyoMA_PrintContDateK7: TStringField
      FieldName = 'ContDateK7'
    end
    object GHojyoMA_PrintContNoK7: TStringField
      FieldName = 'ContNoK7'
    end
    object GHojyoMA_PrintContMoneyK7: TCurrencyField
      FieldName = 'ContMoneyK7'
    end
    object GHojyoMA_PrintTax_RateK7: TIntegerField
      FieldName = 'Tax_RateK7'
    end
    object GHojyoMA_PrintTax_RateK7Name: TStringField
      FieldName = 'Tax_RateK7Name'
    end
    object GHojyoMA_PrintSales_TaxK7: TCurrencyField
      FieldName = 'Sales_TaxK7'
    end
    object GHojyoMA_PrintContDateK8: TStringField
      FieldName = 'ContDateK8'
    end
    object GHojyoMA_PrintContNoK8: TStringField
      FieldName = 'ContNoK8'
    end
    object GHojyoMA_PrintContMoneyK8: TCurrencyField
      FieldName = 'ContMoneyK8'
    end
    object GHojyoMA_PrintTax_RateK8: TIntegerField
      FieldName = 'Tax_RateK8'
    end
    object GHojyoMA_PrintTax_RateK8Name: TStringField
      FieldName = 'Tax_RateK8Name'
    end
    object GHojyoMA_PrintSales_TaxK8: TCurrencyField
      FieldName = 'Sales_TaxK8'
    end
    object GHojyoMA_PrintContDateN1: TStringField
      FieldName = 'ContDateN1'
    end
    object GHojyoMA_PrintContDateN2: TStringField
      FieldName = 'ContDateN2'
    end
    object GHojyoMA_PrintContDateN3: TStringField
      FieldName = 'ContDateN3'
    end
    object GHojyoMA_PrintContDateN4: TStringField
      FieldName = 'ContDateN4'
    end
    object GHojyoMA_PrintContDateN5: TStringField
      FieldName = 'ContDateN5'
    end
    object GHojyoMA_PrintContDateN6: TStringField
      FieldName = 'ContDateN6'
    end
    object GHojyoMA_PrintContDateN7: TStringField
      FieldName = 'ContDateN7'
    end
    object GHojyoMA_PrintContDateN8: TStringField
      FieldName = 'ContDateN8'
    end
    object GHojyoMA_PrintContDateN9: TStringField
      FieldName = 'ContDateN9'
    end
    object GHojyoMA_PrintContDateN10: TStringField
      FieldName = 'ContDateN10'
    end
    object GHojyoMA_PrintContMoneyN1: TCurrencyField
      FieldName = 'ContMoneyN1'
    end
    object GHojyoMA_PrintContMoneyN2: TCurrencyField
      FieldName = 'ContMoneyN2'
    end
    object GHojyoMA_PrintContMoneyN3: TCurrencyField
      FieldName = 'ContMoneyN3'
    end
    object GHojyoMA_PrintContMoneyN4: TCurrencyField
      FieldName = 'ContMoneyN4'
    end
    object GHojyoMA_PrintContMoneyN5: TCurrencyField
      FieldName = 'ContMoneyN5'
    end
    object GHojyoMA_PrintContMoneyN6: TCurrencyField
      FieldName = 'ContMoneyN6'
    end
    object GHojyoMA_PrintContMoneyN7: TCurrencyField
      FieldName = 'ContMoneyN7'
    end
    object GHojyoMA_PrintContMoneyN8: TCurrencyField
      FieldName = 'ContMoneyN8'
    end
    object GHojyoMA_PrintContMoneyN9: TCurrencyField
      FieldName = 'ContMoneyN9'
    end
    object GHojyoMA_PrintContMoneyN10: TCurrencyField
      FieldName = 'ContMoneyN10'
    end
    object GHojyoMA_PrintScheduleDateS: TStringField
      FieldName = 'ScheduleDateS'
    end
    object GHojyoMA_PrintEndDate: TStringField
      FieldName = 'EndDate'
    end
    object GHojyoMA_PrintBIKO: TStringField
      FieldName = 'BIKO'
      Size = 255
    end
    object GHojyoMA_PrintFAXNo: TStringField
      FieldName = 'FAXNo'
    end
    object GHojyoMA_PrintUkeoiKbn: TIntegerField
      FieldName = 'UkeoiKbn'
    end
    object GHojyoMA_PrintUkeoiKbnName: TStringField
      FieldName = 'UkeoiKbnName'
    end
    object GHojyoMA_PrintSeshuCode: TStringField
      FieldName = 'SeshuCode'
    end
    object GHojyoMA_PrintSeshuCodeName: TStringField
      FieldName = 'SeshuCodeName'
      Size = 60
    end
    object GHojyoMA_PrintGaiyou: TStringField
      FieldName = 'gaiyou'
      Size = 255
    end
    object GHojyoMA_PrintSekouPersonCode: TStringField
      FieldName = 'SekouPersonCode'
    end
    object GHojyoMA_PrintSekouPersonCodeName: TStringField
      FieldName = 'SekouPersonCodeName'
      Size = 60
    end
    object GHojyoMA_PrintSekouBmnCode: TStringField
      FieldName = 'SekouBmnCode'
    end
    object GHojyoMA_PrintSekouBmnCodeName: TStringField
      FieldName = 'SekouBmnCodeName'
      Size = 60
    end
    object GHojyoMA_PrintCostomerName1: TStringField
      FieldName = 'CostomerName1'
    end
    object GHojyoMA_PrintCostomerName2: TStringField
      FieldName = 'CostomerName2'
    end
    object GHojyoMA_PrintCostomerName3: TStringField
      FieldName = 'CostomerName3'
    end
    object GHojyoMA_PrintCostomerName4: TStringField
      FieldName = 'CostomerName4'
    end
    object GHojyoMA_PrintCostomerName5: TStringField
      FieldName = 'CostomerName5'
    end
    object GHojyoMA_PrintCostomerName6: TStringField
      FieldName = 'CostomerName6'
    end
    object GHojyoMA_PrintCostomerName7: TStringField
      FieldName = 'CostomerName7'
    end
    object GHojyoMA_PrintCostomerName8: TStringField
      FieldName = 'CostomerName8'
    end
    object GHojyoMA_PrintCostomerName9: TStringField
      FieldName = 'CostomerName9'
    end
    object GHojyoMA_PrintCostomerName10: TStringField
      FieldName = 'CostomerName10'
    end
    object GHojyoMA_PrintCostomerCode1: TStringField
      FieldName = 'CostomerCode1'
    end
    object GHojyoMA_PrintCostomerCode2: TStringField
      FieldName = 'CostomerCode2'
    end
    object GHojyoMA_PrintCostomerCode3: TStringField
      FieldName = 'CostomerCode3'
    end
    object GHojyoMA_PrintCostomerCode4: TStringField
      FieldName = 'CostomerCode4'
    end
    object GHojyoMA_PrintCostomerCode5: TStringField
      FieldName = 'CostomerCode5'
    end
    object GHojyoMA_PrintCostomerCode6: TStringField
      FieldName = 'CostomerCode6'
    end
    object GHojyoMA_PrintCostomerCode7: TStringField
      FieldName = 'CostomerCode7'
    end
    object GHojyoMA_PrintCostomerCode8: TStringField
      FieldName = 'CostomerCode8'
    end
    object GHojyoMA_PrintCostomerCode9: TStringField
      FieldName = 'CostomerCode9'
    end
    object GHojyoMA_PrintCostomerCode10: TStringField
      FieldName = 'CostomerCode10'
    end
  end
  object JKanseiDataSource: TDataSource
    DataSet = JKansei
    Left = 169
    Top = 432
  end
  object JKansei: TdxMemData
    Indexes = <>
    SortOptions = []
    SortedField = 'MasterKbn'
    BeforePost = JKanseiBeforePost
    AfterPost = JKanseiAfterPost
    OnCalcFields = JKanseiCalcFields
    Left = 171
    Top = 387
    object JKanseiTitol: TStringField
      FieldName = 'Titol'
      ReadOnly = True
      Size = 50
    end
    object JKanseiGCODE: TStringField
      FieldName = 'GCODE'
      Size = 16
    end
    object JKanseiMasterKbn: TIntegerField
      FieldName = 'MasterKbn'
    end
    object JKanseiNAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'NAME'
      Size = 60
      Calculated = True
    end
    object JKanseiNCODE: TFloatField
      FieldKind = fkCalculated
      FieldName = 'NCODE'
      Calculated = True
    end
    object JKanseiCodeAttr: TIntegerField
      FieldName = 'CodeAttr'
    end
    object JKanseiCodeDigit: TIntegerField
      FieldName = 'CodeDigit'
    end
  end
  object aclExec: TActionList
    Left = 86
    Top = 260
    object FreeSetMtokui: TAction
      Category = 'Function'
      Caption = #65420#65432#65392#38917#30446
      OnExecute = FreeSetMtokuiExecute
    end
    object InpModeChange: TAction
      Category = 'Function'
      Caption = #20837#21147#12514#12540#12489#20999#26367
      OnExecute = InpModeChangeExecute
    end
    object FindHojyoMA: TAction
      Category = 'Function'
      Caption = 'FindHojyoMA'
      OnExecute = FindHojyoMAExecute
    end
    object DeleteSeikyuOutputDate: TAction
      Category = 'Function'
      Caption = #35531#27714#26360#30330#34892#24180#26376#26085#21066#38500
      OnExecute = DeleteSeikyuOutputDateExecute
    end
    object DeleteSeikyuInfo: TAction
      Category = 'Function'
      Caption = #21066#38500
      OnExecute = DeleteSeikyuInfoExecute
    end
    object UpperCopy: TAction
      Category = 'Function'
      Caption = 'UpperCopy'
      OnExecute = ContCopyExecute
    end
    object ActionTaxCalc: TAction
      Category = 'Function'
      Caption = 'ActionTaxCalc'
      OnExecute = TaxCalcExecute
    end
    object ExpChange: TAction
      Category = 'Function'
      Caption = 'ExpChange'
      OnExecute = ExpChangeValue
    end
  end
  object SPMasHoj: TFDStoredProc
    StoredProcName = 'MP_MAS_CHK_HOJYOMA'
    Left = 8
    Top = 492
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0
      end
      item
        Name = '@MasterKbn'
        DataType = ftInteger
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
  object SPPayHoj: TFDStoredProc
    StoredProcName = 'MP_PAY_CHK_HOJYOMA'
    Left = 40
    Top = 492
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0
      end
      item
        Name = '@MasterKbn'
        DataType = ftInteger
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
  object SPSelHoj: TFDStoredProc
    StoredProcName = 'MP_SEL_CHK_HOJYOMA'
    Left = 72
    Top = 492
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0
      end
      item
        Name = '@MasterKbn'
        DataType = ftInteger
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
  object SPDepHoj: TFDStoredProc
    StoredProcName = 'MP_DEP_CHK_HOJYOMA'
    Left = 104
    Top = 492
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0
      end
      item
        Name = '@MasterKbn'
        DataType = ftInteger
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
  object MemPtnSegBun: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 5
    Top = 533
    object CmnMemDataPrintSystemstrExCode: TStringField
      Alignment = taRightJustify
      DisplayWidth = 16
      FieldName = 'strExCodeDst'
      Size = 16
    end
    object CmnMemDataPrintSystemstrName: TStringField
      DisplayWidth = 60
      FieldName = 'strNameSimpleDst'
      Size = 60
    end
    object CmnMemDataPrintSystemdtStart: TDateTimeField
      FieldName = 'dtStart'
    end
    object CmnMemDataPrintSystemdtEnd: TDateTimeField
      FieldName = 'dtEnd'
    end
    object CmnMemDataPrintSystemstrSeg01Code: TStringField
      DisplayWidth = 10
      FieldName = 'strSeg01Code'
    end
    object CmnMemDataPrintSystemstrSeg02Code: TStringField
      FieldName = 'strSeg02Code'
      Size = 10
    end
    object CmnMemDataPrintSystemstrSeg03Code: TStringField
      FieldName = 'strSeg03Code'
      Size = 10
    end
    object CmnMemDataPrintSystemstrSeg04Code: TStringField
      FieldName = 'strSeg04Code'
      Size = 10
    end
    object CmnMemDataPrintSystemstrSeg05Code: TStringField
      FieldName = 'strSeg05Code'
      Size = 10
    end
    object CmnMemDataPrintSystemstrSeg01Name: TStringField
      FieldName = 'strSeg01Name'
      Size = 14
    end
    object CmnMemDataPrintSystemstrSeg02Name: TStringField
      DisplayWidth = 14
      FieldName = 'strSeg02Name'
    end
    object CmnMemDataPrintSystemstrSeg03Name: TStringField
      DisplayWidth = 14
      FieldName = 'strSeg03Name'
    end
    object CmnMemDataPrintSystemstrSeg04Name: TStringField
      DisplayWidth = 14
      FieldName = 'strSeg04Name'
    end
    object CmnMemDataPrintSystemstrSeg05Name: TStringField
      DisplayWidth = 14
      FieldName = 'strSeg05Name'
    end
    object CmnMemDataPrintSystemstrBun01Code: TStringField
      DisplayWidth = 10
      FieldName = 'strBun01Code'
    end
    object CmnMemDataPrintSystemstrBun02Code: TStringField
      DisplayWidth = 10
      FieldName = 'strBun02Code'
    end
    object CmnMemDataPrintSystemstrBun03Code: TStringField
      DisplayWidth = 10
      FieldName = 'strBun03Code'
    end
    object CmnMemDataPrintSystemstrBun04Code: TStringField
      DisplayWidth = 10
      FieldName = 'strBun04Code'
    end
    object CmnMemDataPrintSystemstrBun05Code: TStringField
      FieldName = 'strBun05Code'
      Size = 10
    end
    object CmnMemDataPrintSystemstrBun01Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun01Name'
    end
    object CmnMemDataPrintSystemstrBun02Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun02Name'
    end
    object CmnMemDataPrintSystemstrBun03Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun03Name'
    end
    object CmnMemDataPrintSystemstrBun04Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun04Name'
    end
    object CmnMemDataPrintSystemstrBun05Name: TStringField
      FieldName = 'strBun05Name'
      Size = 14
    end
    object MemPtnSegBunstrSeg06Code: TStringField
      FieldName = 'strSeg06Code'
    end
    object MemPtnSegBunstrSeg07Code: TStringField
      FieldName = 'strSeg07Code'
    end
    object MemPtnSegBunstrSeg08Code: TStringField
      FieldName = 'strSeg08Code'
    end
    object MemPtnSegBunstrSeg09Code: TStringField
      FieldName = 'strSeg09Code'
    end
    object MemPtnSegBunstrSeg10Code: TStringField
      FieldName = 'strSeg10Code'
    end
    object MemPtnSegBunstrSeg06Name: TStringField
      FieldName = 'strSeg06Name'
    end
    object MemPtnSegBunstrSeg07Name: TStringField
      FieldName = 'strSeg07Name'
    end
    object MemPtnSegBunstrSeg08Name: TStringField
      FieldName = 'strSeg08Name'
    end
    object MemPtnSegBunstrSeg09Name: TStringField
      FieldName = 'strSeg09Name'
    end
    object MemPtnSegBunstrSeg10Name: TStringField
      FieldName = 'strSeg10Name'
    end
    object MemPtnSegBunstrBun06Code: TStringField
      FieldName = 'strBun06Code'
    end
    object MemPtnSegBunstrBun07Code: TStringField
      FieldName = 'strBun07Code'
    end
    object MemPtnSegBunstrBun08Code: TStringField
      FieldName = 'strBun08Code'
    end
    object MemPtnSegBunstrBun09Code: TStringField
      FieldName = 'strBun09Code'
    end
    object MemPtnSegBunstrBun10Code: TStringField
      FieldName = 'strBun10Code'
    end
    object MemPtnSegBunstrBun06Name: TStringField
      FieldName = 'strBun06Name'
    end
    object MemPtnSegBunstrBun07Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun07Name'
    end
    object MemPtnSegBunstrBun08Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun08Name'
    end
    object MemPtnSegBunstrBun09Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun09Name'
    end
    object MemPtnSegBunstrBun10Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun10Name'
    end
  end
  object SPMsHist: TFDStoredProc
    StoredProcName = 'MP_MSHIST_SETINFO'
    Left = 56
    Top = 544
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
    Left = 84
    Top = 544
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
  object dMemData_KeiyakuPrint: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 153
    Top = 73
    object dMemData_KeiyakuPrintNo: TIntegerField
      FieldName = 'No'
    end
    object dMemData_KeiyakuPrintGCode: TStringField
      DisplayWidth = 16
      FieldName = 'GCode'
      Size = 16
    end
    object dMemData_KeiyakuPrintLongName: TStringField
      FieldName = 'LongName'
      Size = 60
    end
    object dMemData_KeiyakuPrintSimpleName: TStringField
      FieldName = 'SimpleName'
      Size = 14
    end
    object dMemData_KeiyakuPrintCostomerCode: TStringField
      FieldName = 'CostomerCode'
      Size = 16
    end
    object dMemData_KeiyakuPrintCostomerName: TStringField
      FieldName = 'CostomerName'
      Size = 60
    end
    object dMemData_KeiyakuPrintContDate: TStringField
      FieldName = 'ContDate'
    end
    object dMemData_KeiyakuPrintContMoney: TCurrencyField
      FieldName = 'ContMoney'
    end
    object dMemData_KeiyakuPrintTaxRate: TIntegerField
      FieldName = 'Tax_Rate'
    end
    object dMemData_KeiyakuPrintContNo: TStringField
      FieldName = 'ContNo'
    end
    object dMemData_KeiyakuPrintTax_RateName: TStringField
      FieldName = 'Tax_RateName'
    end
    object dMemData_KeiyakuPrintSales_Tax: TCurrencyField
      FieldName = 'Sales_Tax'
    end
    object dMemData_KeiyakuPrintNCode: TFloatField
      FieldName = 'NCode'
    end
    object dMemData_KeiyakuPrintKeiyakuG: TCurrencyField
      FieldName = 'KeiyakuG'
    end
    object dMemData_KeiyakuPrintShohiG: TCurrencyField
      FieldName = 'ShohiG'
    end
    object dMemData_KeiyakuPrintPartPattern: TIntegerField
      FieldName = 'PartPattern'
    end
    object dMemData_KeiyakuPrintPartPatternName: TStringField
      FieldName = 'PartPatternName'
    end
  end
  object SPMP_KJURDATA: TFDStoredProc
    StoredProcName = 'MP_SEL_CHK_KJURDATA'
    Left = 172
    Top = 540
    ParamData = <
      item
        Name = '@pKjNCd'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
  object dMemData_KasanPrint: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 5
    Top = 560
    object dMemData_KasanPrintGCodeDst: TStringField
      Alignment = taRightJustify
      FieldName = 'strExCodeDst'
      Size = 16
    end
    object dMemData_KasanPrintGCodeSrc: TStringField
      Alignment = taRightJustify
      FieldName = 'strExCodeSrc'
      Size = 16
    end
    object dMemData_KasanPrintSimpleNameDst: TStringField
      FieldName = 'strNameSimpleDst'
      Size = 14
    end
    object dMemData_KasanPrintSimpleNameSrc: TStringField
      FieldName = 'strNameSimpleSrc'
      Size = 14
    end
  end
  object dsKasanParent: TDataSource
    DataSet = MemKasanParent
    Left = 189
    Top = 510
  end
  object MemKasanParent: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 223
    Top = 513
    object MemKasanParentFusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object MemKasanParentFusenIndex: TIntegerField
      FieldName = 'FusenIndex'
    end
    object MemKasanParentSumKbn: TIntegerField
      FieldName = 'SumKbn'
    end
    object MemKasanParentGCode: TStringField
      FieldName = 'GCode'
      Size = 16
    end
    object MemKasanParentLongName: TStringField
      DisplayWidth = 80
      FieldName = 'LongName'
      Size = 80
    end
    object MemKasanSimpleName: TStringField
      FieldName = 'SimpleName'
    end
    object MemKasanNCode: TFloatField
      FieldName = 'NCODE'
    end
  end
  object dsKasanChild: TDataSource
    DataSet = MemKasanChild
    Left = 183
    Top = 544
  end
  object MemKasanChild: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = MemDataBeforePost
    AfterPost = MemDataAfterPost
    Left = 213
    Top = 545
    object MemKasanChildEntNoSumKbn: TIntegerField
      FieldName = 'SumKbn'
    end
    object MemKasanChildFusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object MemKasanChildGCode: TStringField
      FieldName = 'GCode'
      Size = 16
    end
    object MemKasanChildEntNoLongName: TStringField
      DisplayWidth = 80
      FieldName = 'LongName'
      Size = 80
    end
    object MemKasanChildSimpleName: TStringField
      FieldName = 'SimpleName'
    end
    object MemKasanChildNewData: TBooleanField
      FieldName = 'NewData'
    end
    object MemKasanChildPatternNo: TIntegerField
      FieldName = 'PatternNo'
    end
    object MemKasanChildSumNCode: TFloatField
      FieldName = 'SumNCode'
    end
    object MemKasanChildEntNo: TIntegerField
      FieldName = 'EntNo'
    end
    object MemKasanChildBasedNCode: TFloatField
      FieldName = 'NCode'
    end
    object MemKasanChildAddKbn: TIntegerField
      FieldName = 'AddKbn'
    end
    object MemKasanChildSaveGCode: TStringField
      FieldName = 'SaveGCode'
    end
    object MemKasanChildUpdDateTM: TDateTimeField
      FieldName = 'UpdDateTM'
    end
    object MemKasanChildInsDateTM: TDateTimeField
      FieldName = 'InsDateTM'
    end
    object MemKasanChildDspNo: TIntegerField
      FieldName = 'DspNo'
    end
  end
  object PMChild: TPopupMenu
    OnPopup = PMPopup
    Left = 118
    Top = 266
    object TPInsert: TMenuItem
      Caption = #25407#20837
      OnClick = BSpeedButtonInsClick
    end
    object TPDelChild: TMenuItem
      Caption = #21152#31639#12375#12394#12356
      OnClick = BSpeedButtonClick
    end
  end
  object JSeikyu_DMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = JSeikyu_DMemDataBeforePost
    Left = 226
    Top = 387
    object JSeikyu_DMemDataInfoKbn: TIntegerField
      FieldName = 'InfoKbn'
    end
    object JSeikyu_DMemDataNCode: TFloatField
      FieldName = 'NCode'
    end
    object JSeikyu_DMemDataUpdateTime: TDateField
      FieldName = 'UpdateTime'
    end
    object JSeikyu_DMemDataContDate: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'ContDate'
    end
    object JSeikyu_DMemDataContMoney: TCurrencyField
      FieldName = 'ContMoney'
      DisplayFormat = '###,##0'
      EditFormat = '###,##0'
    end
    object JSeikyu_DMemDataDummyTax_Rate: TIntegerField
      FieldName = 'DummyTax_Rate'
    end
    object JSeikyu_DMemDataTax_Rate: TIntegerField
      DisplayWidth = 2
      FieldKind = fkLookup
      FieldName = 'Tax_Rate'
      LookupDataSet = ListMemTax_Rate
      LookupKeyFields = 'iCode'
      LookupResultField = 'iCode'
      KeyFields = 'DummyTax_Rate'
      Lookup = True
    end
    object JSeikyu_DMemDataTax_RateName: TStringField
      FieldKind = fkLookup
      FieldName = 'Tax_RateName'
      LookupDataSet = ListMemTax_Rate
      LookupKeyFields = 'iCode'
      LookupResultField = 'iName'
      KeyFields = 'DummyTax_Rate'
      Lookup = True
    end
    object JSeikyu_DMemDataSales_Tax: TCurrencyField
      FieldName = 'Sales_Tax'
      DisplayFormat = '###,##0'
      EditFormat = '###,##0'
    end
    object JSeikyu_DMemDataKojiInfo2NCode: TFloatField
      FieldName = 'KojiInfo2NCode'
    end
    object JSeikyu_DMemDataDspOrder: TIntegerField
      FieldName = 'DspOrder'
    end
    object JSeikyu_DMemDataCheck: TIntegerField
      FieldName = 'Check'
    end
    object JSeikyu_DMemDataPrevContDate: TDateTimeField
      FieldName = 'PrevContDate'
    end
    object JSeikyu_DMemDataOrgNo: TFloatField
      FieldName = 'OrgNo'
    end
    object JSeikyu_DMemDataInpType: TIntegerField
      FieldName = 'InpType'
    end
    object JSeikyu_DMemDataCostomerGCode: TStringField
      FieldName = 'CostomerGCode'
    end
    object JSeikyu_DMemDataCostomerName: TStringField
      FieldName = 'CostomerName'
    end
    object JSeikyu_DMemDataCostomerNCode: TFloatField
      FieldName = 'CostomerNCode'
    end
    object JSeikyu_DMemDataNO: TIntegerField
      FieldName = 'NO'
    end
    object JSeikyu_DMemDataSeikyuYoteiDate: TDateField
      FieldName = 'SeikyuYoteiDate'
    end
    object JSeikyu_DMemDataSeikyuOutputDate: TDateField
      FieldName = 'SeikyuOutputDate'
    end
    object JSeikyu_DMemDataSeikyuDate: TDateField
      FieldName = 'SeikyuDate'
    end
    object JSeikyu_DMemDataSeikyuMeimoku: TStringField
      DisplayWidth = 40
      FieldName = 'SeikyuMeimoku'
      Size = 40
    end
  end
  object GSeikyu_DMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = GSeikyu_DMemDataBeforePost
    Left = 254
    Top = 387
    object GSeikyu_DMemDataInfoKbn: TIntegerField
      FieldName = 'InfoKbn'
    end
    object GSeikyu_DMemDataNCode: TFloatField
      FieldName = 'NCode'
    end
    object GSeikyu_DMemDataUpdateTime: TDateField
      FieldName = 'UpdateTime'
    end
    object GSeikyu_DMemDataContDate: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'ContDate'
    end
    object GSeikyu_DMemDataContMoney: TCurrencyField
      FieldName = 'ContMoney'
      DisplayFormat = '###,##0'
      EditFormat = '###,##0'
    end
    object GSeikyu_DMemDataDummyTax_Rate: TIntegerField
      FieldName = 'DummyTax_Rate'
    end
    object GSeikyu_DMemDataTax_Rate: TIntegerField
      DisplayWidth = 2
      FieldKind = fkLookup
      FieldName = 'Tax_Rate'
      LookupDataSet = ListMemTax_Rate
      LookupKeyFields = 'iCode'
      LookupResultField = 'iCode'
      KeyFields = 'DummyTax_Rate'
      Lookup = True
    end
    object GSeikyu_DMemDataTax_RateName: TStringField
      FieldKind = fkLookup
      FieldName = 'Tax_RateName'
      LookupDataSet = ListMemTax_Rate
      LookupKeyFields = 'iCode'
      LookupResultField = 'iName'
      KeyFields = 'DummyTax_Rate'
      Lookup = True
    end
    object GSeikyu_DMemDataSales_Tax: TCurrencyField
      FieldName = 'Sales_Tax'
      DisplayFormat = '###,##0'
      EditFormat = '###,##0'
    end
    object GSeikyu_DMemDataKojiInfo2NCode: TFloatField
      FieldName = 'KojiInfo2NCode'
    end
    object GSeikyu_DMemDataDspOrder: TIntegerField
      FieldName = 'DspOrder'
    end
    object GSeikyu_DMemDataCheck: TIntegerField
      FieldName = 'Check'
    end
    object GSeikyu_DMemDataPrevContDate: TDateTimeField
      FieldName = 'PrevContDate'
    end
    object GSeikyu_DMemDataOrgNo: TFloatField
      FieldName = 'OrgNo'
    end
    object GSeikyu_DMemDataInpType: TIntegerField
      FieldName = 'InpType'
    end
    object GSeikyu_DMemDataCostomerGCode: TStringField
      FieldName = 'CostomerGCode'
    end
    object GSeikyu_DMemDataCostomerName: TStringField
      FieldName = 'CostomerName'
    end
    object GSeikyu_DMemDataCostomerNCode: TFloatField
      FieldName = 'CostomerNCode'
    end
    object GSeikyu_DMemDataNO: TIntegerField
      FieldName = 'NO'
    end
    object GSeikyu_DMemDataSeikyuYoteiDate: TDateField
      FieldName = 'SeikyuYoteiDate'
    end
    object GSeikyu_DMemDataSeikyuOutputDate: TDateField
      FieldName = 'SeikyuOutputDate'
    end
    object GSeikyu_DMemDataSeikyuDate: TDateField
      FieldName = 'SeikyuDate'
    end
    object GSeikyu_DMemDataSeikyuMeimoku: TStringField
      DisplayWidth = 40
      FieldName = 'SeikyuMeimoku'
      Size = 40
    end
  end
  object JSeikyu_DDataSource: TDataSource
    DataSet = JSeikyu_DMemData
    Left = 225
    Top = 432
  end
  object GSeikyu_DDataSource: TDataSource
    DataSet = GSeikyu_DMemData
    Left = 253
    Top = 432
  end
end
