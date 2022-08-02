object JNTCRP004001f: TJNTCRP004001f
  Left = 2826
  Top = 236
  BorderStyle = bsNone
  Caption = ' '
  ClientHeight = 649
  ClientWidth = 943
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
  object Splitter1: TSplitter
    Left = 180
    Top = 25
    Height = 584
  end
  object PPanelBase: TMPanel
    Left = 183
    Top = 25
    Width = 760
    Height = 584
    Align = alClient
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 2
    object PPanelKasan: TMPanel
      Left = 0
      Top = 44
      Width = 760
      Height = 540
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PPanelKasan'
      Color = 15921906
      ParentBackground = False
      TabOrder = 4
      Visible = False
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 0
        Width = 760
        Height = 540
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object Kasan_Parent_Panel: TMPanel
          Left = 10
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
          Left = 327
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
          Left = 683
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
    object Jituzai_PPanel_Grid: TMPanel
      Left = 0
      Top = 44
      Width = 760
      Height = 540
      Align = alClient
      BevelOuter = bvNone
      Color = 14608367
      ParentBackground = False
      TabOrder = 2
      object Jituzai_DdxDBGrid: TdxDBGrid
        Left = 0
        Top = 0
        Width = 760
        Height = 540
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
            Width = 89
          end
          item
            Caption = #27491#24335#21517#31216
            Width = 201
          end
          item
            Caption = #31777#30053#21517#31216
            Width = 95
          end
          item
            Caption = #24471#24847#20808
            Width = 100
          end
          item
            Caption = #20181#20837#20808
            Width = 100
          end
          item
            Caption = #36092#20837#20808
            Width = 75
          end
          item
            Caption = #22770#21364#20808
            Width = 75
          end
          item
            Caption = #12522#12540#12473
            Width = 75
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'GCode'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        Color = clWhite
        PopupMenu = PMTokui
        TabOrder = 0
        OnDblClick = Jituzai_DdxDBGridDblClick
        OnEnter = EnterEvent
        OnExit = Jituzai_DdxDBGridExit
        OnKeyDown = Jituzai_DdxDBGridKeyDown
        OnKeyPress = Jituzai_DdxDBGridKeyPress
        OnKeyUp = Jituzai_DdxDBGridKeyUp
        OnMouseDown = Jituzai_DdxDBGridMouseDown
        OnMouseMove = Jituzai_DdxDBGridMouseMove
        BandColor = 10204878
        DataSource = JHojyoMA_DDataSource
        HeaderColor = 10204878
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
          TabStop = False
          Width = 20
          BandIndex = 0
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'Fusen'
        end
        object Jituzai_DdxDBGridGCode: TdxDBGridMaskColumn
          Width = 86
          BandIndex = 1
          RowIndex = 0
          ImeMode = imDisable
          MaxLength = 30
          StretchChar.Auto = True
          FieldName = 'GCode'
          OnGetText = Jituzai_DdxDBGridGCodeGetText
        end
        object Jituzai_DdxDBGridRenChar: TdxDBGridMaskColumn
          Width = 60
          BandIndex = 2
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 10
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'RenChar'
        end
        object Jituzai_DdxDBGridLongName: TdxDBGridMaskColumn
          Width = 201
          BandIndex = 3
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 60
          StretchChar.Auto = False
          FieldName = 'LongName'
        end
        object Jituzai_DdxDBGridSimpleName: TdxDBGridMaskColumn
          Width = 130
          BandIndex = 4
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 20
          StretchChar.Auto = False
          FieldName = 'SimpleName'
        end
        object Jituzai_DdxDBGridTKBN: TdxDBGridColumn
          Alignment = taCenter
          DisableEditor = True
          HeaderAlignment = taCenter
          ReadOnly = True
          Width = 45
          BandIndex = 5
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taCenter
          StretchChar.Auto = False
          FieldName = 'TKBN'
        end
        object Jituzai_DdxDBGridSKBN: TdxDBGridColumn
          Alignment = taCenter
          DisableEditor = True
          HeaderAlignment = taCenter
          ReadOnly = True
          Width = 45
          BandIndex = 6
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taCenter
          StretchChar.Auto = False
          FieldName = 'SKBN'
        end
        object Jituzai_DdxDBGridSHojyoKbn1: TdxDBGridColumn
          Alignment = taCenter
          DisableEditor = True
          ReadOnly = True
          Width = 45
          BandIndex = 7
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'SHojyoKbn1'
        end
        object Jituzai_DdxDBGridSHojyoKbn2: TdxDBGridColumn
          Alignment = taCenter
          DisableEditor = True
          ReadOnly = True
          Width = 45
          BandIndex = 8
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'SHojyoKbn2'
        end
        object Jituzai_DdxDBGridSHojyoKbn3: TdxDBGridColumn
          Alignment = taCenter
          DisableEditor = True
          ReadOnly = True
          Width = 45
          BandIndex = 9
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'SHojyoKbn3'
        end
      end
    end
    object Jituzai_PPanel_Card: TMPanel
      Left = 0
      Top = 44
      Width = 760
      Height = 540
      Align = alClient
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object v: TScrollBox
        Left = 0
        Top = 0
        Width = 760
        Height = 540
        HorzScrollBar.Range = 731
        VertScrollBar.Range = 461
        Align = alClient
        AutoScroll = False
        BorderStyle = bsNone
        Color = 15921906
        ParentColor = False
        TabOrder = 0
        object PPanel_Saiyo: TMPanel
          Left = 0
          Top = 71
          Width = 760
          Height = 469
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 3
          Visible = False
          object Label3: TMLabel
            Left = 21
            Top = 23
            Width = 88
            Height = 21
            AutoSize = False
            Caption = #24471#24847#20808#25505#29992
            Color = 15921906
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ParentColor = False
            ParentFont = False
            FontRatio.Auto = False
          end
          object LblMASKBN_N: TMLabel
            Left = 213
            Top = 23
            Width = 100
            Height = 21
            AutoSize = False
            Caption = #24471#24847#20808#21306#20998
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object f1TKBNNM: TMLabel
            Left = 354
            Top = 24
            Width = 148
            Height = 21
            AutoSize = False
            Caption = 'X(20)--------------X'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object LblSaiyo_S: TMLabel
            Left = 21
            Top = 166
            Width = 88
            Height = 21
            AutoSize = False
            Caption = #20181#20837#20808#25505#29992
            Color = 15921906
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ParentColor = False
            ParentFont = False
            FontRatio.Auto = False
          end
          object LblMASKBN_S: TMLabel
            Left = 213
            Top = 166
            Width = 100
            Height = 21
            AutoSize = False
            Caption = #20181#20837#20808#21306#20998
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object f1SKBNNM: TMLabel
            Left = 354
            Top = 167
            Width = 148
            Height = 21
            AutoSize = False
            Caption = 'X(20)--------------X'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel9: TMLabel
            Left = 21
            Top = 15
            Width = 670
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel40: TMLabel
            Left = 21
            Top = 297
            Width = 670
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object LblSHojyoKbn1: TMLabel
            Left = 21
            Top = 309
            Width = 74
            Height = 19
            AutoSize = False
            Caption = #36039#29987#36092#20837#20808
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object LblSHojyoKbn2: TMLabel
            Left = 222
            Top = 309
            Width = 74
            Height = 19
            AutoSize = False
            Caption = #36039#29987#22770#21364#20808
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object LblSHojyoKbn3: TMLabel
            Left = 424
            Top = 309
            Width = 81
            Height = 19
            AutoSize = False
            Caption = #12522#12540#12473#21462#24341#20808
            FontRatio.Auto = False
          end
          object MPanel_NY: TMPanel
            Left = 9
            Top = 47
            Width = 688
            Height = 116
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 2
            object MLabel5: TMLabel
              Left = 15
              Top = 1
              Width = 74
              Height = 19
              AutoSize = False
              Caption = #20837#37329#20104#23450
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel21: TMLabel
              Left = 25
              Top = 26
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #32224#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel22: TMLabel
              Left = 25
              Top = 48
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #32224#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel23: TMLabel
              Left = 25
              Top = 70
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #32224#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs2Label0101: TMLabel
              Left = 90
              Top = 26
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26376
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs2Label0102: TMLabel
              Left = 90
              Top = 48
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26376
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs2Label0103: TMLabel
              Left = 90
              Top = 70
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26376
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs2Label0201: TMLabel
              Left = 226
              Top = 26
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs2Label0202: TMLabel
              Left = 226
              Top = 48
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs2Label0203: TMLabel
              Left = 226
              Top = 70
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs2Label0301: TMLabel
              Left = 311
              Top = 26
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #20241#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs2Label0302: TMLabel
              Left = 311
              Top = 48
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #20241#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs2Label0303: TMLabel
              Left = 311
              Top = 70
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #20241#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel39: TMLabel
              Left = 12
              Top = 105
              Width = 670
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object f1NClosingDay1: TMNumEdit
              Left = 57
              Top = 26
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1NClosingDay2: TMNumEdit
              Left = 57
              Top = 48
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 4
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1NClosingDay3: TMNumEdit
              Left = 57
              Top = 70
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 8
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1NMonth1: TMComboBox
              Left = 139
              Top = 26
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #24403#26376
                #32716#26376
                #32716#12293#26376
                '3'#12534#26376#24460
                '4'#12534#26376#24460
                '5'#12534#26376#24460
                '6'#12534#26376#24460
                '7'#12534#26376#24460
                '8'#12534#26376#24460
                '9'#12534#26376#24460)
              TabOrder = 1
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object f1NMonth2: TMComboBox
              Left = 139
              Top = 48
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #24403#26376
                #32716#26376
                #32716#12293#26376
                '3'#12534#26376#24460
                '4'#12534#26376#24460
                '5'#12534#26376#24460
                '6'#12534#26376#24460
                '7'#12534#26376#24460
                '8'#12534#26376#24460
                '9'#12534#26376#24460)
              TabOrder = 5
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object f1NMonth3: TMComboBox
              Left = 139
              Top = 70
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #24403#26376
                #32716#26376
                #32716#12293#26376
                '3'#12534#26376#24460
                '4'#12534#26376#24460
                '5'#12534#26376#24460
                '6'#12534#26376#24460
                '7'#12534#26376#24460
                '8'#12534#26376#24460
                '9'#12534#26376#24460)
              TabOrder = 9
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object f1NDay1: TMNumEdit
              Left = 275
              Top = 26
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 2
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1NDay2: TMNumEdit
              Left = 275
              Top = 48
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 6
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1NDay3: TMNumEdit
              Left = 275
              Top = 70
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 10
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1NHoliday3: TMComboBox
              Left = 347
              Top = 70
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #32716#21942#26989#26085
                #21069#21942#26989#26085
                #24403#26085)
              TabOrder = 11
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object f1NHoliday2: TMComboBox
              Left = 347
              Top = 48
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #32716#21942#26989#26085
                #21069#21942#26989#26085
                #24403#26085)
              TabOrder = 7
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object f1NHoliday1: TMComboBox
              Left = 347
              Top = 26
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #32716#21942#26989#26085
                #21069#21942#26989#26085
                #24403#26085)
              TabOrder = 3
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object Pnl_SelSeikyu: TMPanel
              Left = 426
              Top = 16
              Width = 250
              Height = 80
              BevelOuter = bvNone
              Color = 15921906
              ParentBackground = False
              TabOrder = 12
              object MLabel6: TMLabel
                Left = 20
                Top = 32
                Width = 125
                Height = 17
                AutoSize = False
                Caption = #29305#27530#35531#27714#65326#65359
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentFont = False
                FontRatio.Auto = False
              end
              object MLabel7: TMLabel
                Left = 20
                Top = 10
                Width = 125
                Height = 17
                AutoSize = False
                Caption = #38543#26178#35531#27714#22238#21454#12469#12452#12488
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentFont = False
                FontRatio.Auto = False
              end
              object MLabel8: TMLabel
                Left = 185
                Top = 10
                Width = 25
                Height = 17
                AutoSize = False
                Caption = #26085
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentFont = False
                FontRatio.Auto = False
              end
              object MLabel32: TMLabel
                Left = 20
                Top = 55
                Width = 125
                Height = 17
                AutoSize = False
                Caption = #38543#26178'/'#29305#27530#20241#26085
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentFont = False
                FontRatio.Auto = False
              end
              object f1NSSite: TMNumEdit
                Left = 150
                Top = 10
                Width = 28
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
                TabOrder = 0
                OnChange = evtOnChange
                OnEnter = EnterEvent
                OnExit = evtOnExit
                FormatStr = '##0'
                Digits = 3
                Validate = False
                Value = 999.000000000000000000
              end
              object f1NSeino: TMNumEdit
                Left = 150
                Top = 32
                Width = 36
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
                TabOrder = 1
                OnChange = evtOnChange
                OnEnter = EnterEvent
                OnExit = evtOnExit
                FormatStr = '###0'
                Negative = False
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
              end
              object f1NHolidayKbn: TMComboBox
                Left = 150
                Top = 54
                Width = 75
                Height = 19
                CanEdit = False
                Columns = <
                  item
                    Width = 75
                    Color = clWindow
                    ParentColor = False
                    ParentFont = True
                  end>
                Items.Strings = (
                  #32716#21942#26989#26085
                  #21069#21942#26989#26085
                  #24403#26085)
                TabOrder = 2
                OnChange = evtOnChange
                OnEnter = EnterEvent
                OnExit = evtOnExit
                OnKeyDown = ConboKeyDown
              end
            end
          end
          object f1TSKBN: TMCheckBox
            Left = 115
            Top = 24
            Width = 84
            Height = 21
            Caption = #25505#29992#12377#12427
            TabOrder = 0
            OnClick = f1TSKBNClick
            OnEnter = EnterEvent
          end
          object f1TKBN: TMNumEdit
            Left = 313
            Top = 24
            Width = 23
            Height = 21
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '1:'#36890#24120#24471#24847#20808
              '2:'#31038#20869#24471#24847#20808)
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
            OnChange = KBNChange
            OnEnter = EnterEvent
            OnExit = evtOnExit
            Digits = 1
            Validate = False
            Value = 9.000000000000000000
          end
          object f1SSKBN: TMCheckBox
            Left = 115
            Top = 167
            Width = 84
            Height = 21
            Caption = #25505#29992#12377#12427
            TabOrder = 3
            OnClick = f1TSKBNClick
            OnEnter = EnterEvent
          end
          object f1SKBN: TMNumEdit
            Left = 313
            Top = 167
            Width = 23
            Height = 21
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '1:'#36890#24120#20181#20837#20808
              '2:'#31038#20869#20181#20837#20808)
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
            OnChange = KBNChange
            OnEnter = EnterEvent
            OnExit = evtOnExit
            Digits = 1
            Validate = False
            Value = 9.000000000000000000
          end
          object MPanel_SH: TMPanel
            Left = 9
            Top = 192
            Width = 688
            Height = 96
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 5
            object MLabel10: TMLabel
              Left = 15
              Top = -1
              Width = 74
              Height = 19
              AutoSize = False
              Caption = #25903#25173#20104#23450
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel11: TMLabel
              Left = 25
              Top = 24
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #32224#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel12: TMLabel
              Left = 25
              Top = 46
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #32224#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel13: TMLabel
              Left = 25
              Top = 68
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #32224#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel14: TMLabel
              Left = 90
              Top = 24
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26376
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel15: TMLabel
              Left = 90
              Top = 46
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26376
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel18: TMLabel
              Left = 90
              Top = 68
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26376
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel19: TMLabel
              Left = 226
              Top = 24
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel24: TMLabel
              Left = 226
              Top = 46
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel25: TMLabel
              Left = 226
              Top = 68
              Width = 41
              Height = 17
              AutoSize = False
              Caption = #20104#23450#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel26: TMLabel
              Left = 311
              Top = 24
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #20241#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel27: TMLabel
              Left = 311
              Top = 46
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #20241#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel28: TMLabel
              Left = 311
              Top = 68
              Width = 25
              Height = 17
              AutoSize = False
              Caption = #20241#26085
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1SClosingDay1: TMNumEdit
              Left = 57
              Top = 24
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1SClosingDay2: TMNumEdit
              Left = 57
              Top = 46
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 4
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1SClosingDay3: TMNumEdit
              Left = 57
              Top = 68
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 8
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1SMonth1: TMComboBox
              Left = 139
              Top = 24
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #24403#26376
                #32716#26376
                #32716#12293#26376
                '3'#12534#26376#24460
                '4'#12534#26376#24460
                '5'#12534#26376#24460
                '6'#12534#26376#24460
                '7'#12534#26376#24460
                '8'#12534#26376#24460
                '9'#12534#26376#24460)
              TabOrder = 1
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object f1SMonth2: TMComboBox
              Left = 139
              Top = 46
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #24403#26376
                #32716#26376
                #32716#12293#26376
                '3'#12534#26376#24460
                '4'#12534#26376#24460
                '5'#12534#26376#24460
                '6'#12534#26376#24460
                '7'#12534#26376#24460
                '8'#12534#26376#24460
                '9'#12534#26376#24460)
              TabOrder = 5
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object f1SMonth3: TMComboBox
              Left = 139
              Top = 68
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #24403#26376
                #32716#26376
                #32716#12293#26376
                '3'#12534#26376#24460
                '4'#12534#26376#24460
                '5'#12534#26376#24460
                '6'#12534#26376#24460
                '7'#12534#26376#24460
                '8'#12534#26376#24460
                '9'#12534#26376#24460)
              TabOrder = 9
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object f1SDay1: TMNumEdit
              Left = 275
              Top = 24
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 2
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1SDay2: TMNumEdit
              Left = 275
              Top = 46
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 6
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1SDay3: TMNumEdit
              Left = 275
              Top = 68
              Width = 25
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
              DMaxLength = 2
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 10
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              Negative = False
              Digits = 2
              Validate = False
              InputFlagEnabled = True
            end
            object f1SHoliday3: TMComboBox
              Left = 347
              Top = 68
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #32716#21942#26989#26085
                #21069#21942#26989#26085
                #24403#26085)
              TabOrder = 11
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object f1SHoliday2: TMComboBox
              Left = 347
              Top = 46
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #32716#21942#26989#26085
                #21069#21942#26989#26085
                #24403#26085)
              TabOrder = 7
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object f1SHoliday1: TMComboBox
              Left = 347
              Top = 24
              Width = 75
              Height = 19
              CanEdit = False
              Columns = <
                item
                  Width = 75
                  Color = clWindow
                  ParentColor = False
                  ParentFont = True
                end>
              Items.Strings = (
                #32716#21942#26989#26085
                #21069#21942#26989#26085
                #24403#26085)
              TabOrder = 3
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyDown = ConboKeyDown
            end
            object Pnl_SelSihrai: TMPanel
              Left = 426
              Top = 14
              Width = 250
              Height = 80
              BevelOuter = bvNone
              Color = 15921906
              ParentBackground = False
              TabOrder = 12
              object MLabel29: TMLabel
                Left = 20
                Top = 32
                Width = 125
                Height = 17
                AutoSize = False
                Caption = #29305#27530#35531#27714#65326#65359
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentFont = False
                FontRatio.Auto = False
              end
              object MLabel30: TMLabel
                Left = 20
                Top = 10
                Width = 125
                Height = 17
                AutoSize = False
                Caption = #38543#26178#35531#27714#25903#25173#12469#12452#12488
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentFont = False
                FontRatio.Auto = False
              end
              object MLabel31: TMLabel
                Left = 185
                Top = 10
                Width = 25
                Height = 17
                AutoSize = False
                Caption = #26085
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentFont = False
                FontRatio.Auto = False
              end
              object MLabel33: TMLabel
                Left = 20
                Top = 55
                Width = 125
                Height = 17
                AutoSize = False
                Caption = #38543#26178'/'#29305#27530#20241#26085
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentFont = False
                FontRatio.Auto = False
              end
              object f1SSSite: TMNumEdit
                Left = 150
                Top = 10
                Width = 28
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
                TabOrder = 0
                OnChange = evtOnChange
                OnEnter = EnterEvent
                OnExit = evtOnExit
                FormatStr = '##0'
                Digits = 3
                Validate = False
                Value = 999.000000000000000000
              end
              object f1SSeino: TMNumEdit
                Left = 150
                Top = 32
                Width = 36
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
                TabOrder = 1
                OnChange = evtOnChange
                OnEnter = EnterEvent
                OnExit = evtOnExit
                FormatStr = '###0'
                Negative = False
                Digits = 4
                Validate = False
                Value = 9999.000000000000000000
              end
              object f1SHolidayKbn: TMComboBox
                Left = 150
                Top = 54
                Width = 75
                Height = 19
                CanEdit = False
                Columns = <
                  item
                    Width = 75
                    Color = clWindow
                    ParentColor = False
                    ParentFont = True
                  end>
                Items.Strings = (
                  #32716#21942#26989#26085
                  #21069#21942#26989#26085
                  #24403#26085)
                TabOrder = 2
                OnChange = evtOnChange
                OnEnter = EnterEvent
                OnExit = evtOnExit
                OnKeyDown = ConboKeyDown
              end
            end
          end
          object f1SHojyoKbn1: TMCheckBox
            Left = 115
            Top = 310
            Width = 84
            Height = 21
            Caption = #25505#29992#12377#12427
            TabOrder = 6
            OnClick = f1TSKBNClick
            OnEnter = EnterEvent
          end
          object f1SHojyoKbn2: TMCheckBox
            Left = 317
            Top = 310
            Width = 74
            Height = 21
            Caption = #25505#29992#12377#12427
            TabOrder = 7
            OnClick = f1TSKBNClick
            OnEnter = EnterEvent
          end
          object f1SHojyoKbn3: TMCheckBox
            Left = 518
            Top = 310
            Width = 97
            Height = 21
            Caption = #25505#29992#12377#12427
            TabOrder = 8
            OnClick = f1TSKBNClick
            OnEnter = EnterEvent
          end
        end
        object PPanel_Seg: TMPanel
          Left = 0
          Top = 71
          Width = 760
          Height = 469
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 4
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
          object f2SegLab1: TMLabel
            Left = 25
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
          object f2SegLab2: TMLabel
            Left = 25
            Top = 58
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
          object f2SegLab3: TMLabel
            Left = 25
            Top = 78
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
          object f2SegLab4: TMLabel
            Left = 25
            Top = 98
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
          object f2SegLab5: TMLabel
            Left = 25
            Top = 118
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
          object f2SegLab6: TMLabel
            Left = 25
            Top = 138
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
          object f2SegLab7: TMLabel
            Left = 25
            Top = 158
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
          object f2SegLab8: TMLabel
            Left = 25
            Top = 178
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
          object f2SegLab9: TMLabel
            Left = 25
            Top = 198
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
          object f2SegLab10: TMLabel
            Left = 25
            Top = 218
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
          object f2SgName1: TMLabel
            Left = 273
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
          object f2SgName2: TMLabel
            Left = 273
            Top = 58
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
          object f2SgName3: TMLabel
            Left = 273
            Top = 78
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
          object f2SgName4: TMLabel
            Left = 273
            Top = 98
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
          object f2SgName5: TMLabel
            Left = 273
            Top = 118
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
          object f2SgName6: TMLabel
            Left = 273
            Top = 138
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
          object f2SgName7: TMLabel
            Left = 273
            Top = 158
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
          object f2SgName8: TMLabel
            Left = 273
            Top = 178
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
          object f2SgName9: TMLabel
            Left = 273
            Top = 198
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
          object f2SgName10: TMLabel
            Left = 273
            Top = 218
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
          object MLabel36: TMLabel
            Left = 6
            Top = 248
            Width = 330
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object f2SgCode1: TMTxtEdit
            Tag = 22
            Left = 171
            Top = 38
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
          object f2SgCode2: TMTxtEdit
            Tag = 22
            Left = 171
            Top = 58
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
          object f2SgCode3: TMTxtEdit
            Tag = 22
            Left = 171
            Top = 78
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
          object f2SgCode4: TMTxtEdit
            Tag = 22
            Left = 171
            Top = 98
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
          object f2SgCode5: TMTxtEdit
            Tag = 22
            Left = 171
            Top = 118
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
          object f2SgCode6: TMTxtEdit
            Tag = 22
            Left = 171
            Top = 138
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
          object f2SgCode7: TMTxtEdit
            Tag = 22
            Left = 171
            Top = 158
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
          object f2SgCode8: TMTxtEdit
            Tag = 22
            Left = 171
            Top = 178
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
          object f2SgCode9: TMTxtEdit
            Tag = 22
            Left = 171
            Top = 198
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
          object f2SgCode10: TMTxtEdit
            Tag = 22
            Left = 171
            Top = 218
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
        end
        object PPanel_Br: TMPanel
          Left = 0
          Top = 71
          Width = 760
          Height = 469
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 5
          Visible = False
          object MLabel116: TMLabel
            Left = 6
            Top = 0
            Width = 330
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel117: TMLabel
            Left = 6
            Top = 248
            Width = 330
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel118: TMLabel
            Left = 350
            Top = 0
            Width = 330
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel119: TMLabel
            Left = 350
            Top = 248
            Width = 330
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel53: TMLabel
            Left = 9
            Top = 9
            Width = 95
            Height = 19
            AutoSize = False
            Caption = #20998#39006#24773#22577
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object f3TBrLab1: TMLabel
            Left = 15
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
          object f3TBrLab2: TMLabel
            Left = 15
            Top = 58
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
          object f3TBrLab3: TMLabel
            Left = 15
            Top = 78
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
          object f3TBrLab4: TMLabel
            Left = 15
            Top = 98
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
          object f3TBrLab5: TMLabel
            Left = 15
            Top = 118
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
          object f3TBrLab6: TMLabel
            Left = 15
            Top = 138
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
          object f3TBrLab7: TMLabel
            Left = 15
            Top = 158
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
          object f3TBrLab8: TMLabel
            Left = 15
            Top = 178
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
          object f3TBrLab9: TMLabel
            Left = 15
            Top = 198
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
          object f3TBrLab10: TMLabel
            Left = 15
            Top = 218
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
          object f3TBrName1: TMLabel
            Left = 254
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
          object f3TBrName2: TMLabel
            Left = 254
            Top = 58
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
          object f3TBrName3: TMLabel
            Left = 254
            Top = 78
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
          object f3TBrName4: TMLabel
            Left = 254
            Top = 98
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
          object f3TBrName5: TMLabel
            Left = 254
            Top = 118
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
          object f3TBrName6: TMLabel
            Left = 254
            Top = 138
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
          object f3TBrName7: TMLabel
            Left = 254
            Top = 158
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
          object f3TBrName8: TMLabel
            Left = 254
            Top = 178
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
          object f3TBrName9: TMLabel
            Left = 254
            Top = 198
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
          object f3TBrName10: TMLabel
            Left = 254
            Top = 218
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
          object f3SBrLab1: TMLabel
            Left = 359
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
          object f3SBrLab2: TMLabel
            Left = 359
            Top = 58
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
          object f3SBrLab3: TMLabel
            Left = 359
            Top = 78
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
          object f3SBrLab4: TMLabel
            Left = 359
            Top = 98
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
          object f3SBrLab5: TMLabel
            Left = 359
            Top = 118
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
          object f3SBrLab6: TMLabel
            Left = 359
            Top = 138
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
          object f3SBrLab7: TMLabel
            Left = 359
            Top = 158
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
          object f3SBrLab8: TMLabel
            Left = 359
            Top = 178
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
          object f3SBrLab9: TMLabel
            Left = 359
            Top = 198
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
          object f3SBrLab10: TMLabel
            Left = 359
            Top = 218
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
          object f3SBrName1: TMLabel
            Left = 597
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
          object f3SBrName2: TMLabel
            Left = 597
            Top = 58
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
          object f3SBrName3: TMLabel
            Left = 597
            Top = 78
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
          object f3SBrName4: TMLabel
            Left = 597
            Top = 98
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
          object f3SBrName5: TMLabel
            Left = 597
            Top = 118
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
          object f3SBrName6: TMLabel
            Left = 597
            Top = 138
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
          object f3SBrName7: TMLabel
            Left = 597
            Top = 158
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
          object f3SBrName8: TMLabel
            Left = 597
            Top = 178
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
          object f3SBrName9: TMLabel
            Left = 597
            Top = 198
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
          object f3SBrName10: TMLabel
            Left = 597
            Top = 218
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
          object f3TBrCode2: TMTxtEdit
            Tag = 22
            Left = 156
            Top = 58
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
            TabOrder = 1
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object f3TBrCode3: TMTxtEdit
            Tag = 22
            Left = 156
            Top = 78
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
            TabOrder = 2
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object f3TBrCode4: TMTxtEdit
            Tag = 22
            Left = 156
            Top = 98
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
            TabOrder = 3
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object f3TBrCode5: TMTxtEdit
            Tag = 22
            Left = 156
            Top = 118
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
            TabOrder = 4
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object f3TBrCode6: TMTxtEdit
            Tag = 22
            Left = 156
            Top = 138
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
            TabOrder = 5
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object f3TBrCode7: TMTxtEdit
            Tag = 22
            Left = 156
            Top = 158
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
            TabOrder = 6
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object f3TBrCode8: TMTxtEdit
            Tag = 22
            Left = 156
            Top = 178
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
            TabOrder = 7
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object f3TBrCode9: TMTxtEdit
            Tag = 22
            Left = 156
            Top = 198
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
            TabOrder = 8
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object f3TBrCode10: TMTxtEdit
            Tag = 22
            Left = 156
            Top = 218
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
            TabOrder = 9
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object f3SBrCode1: TMTxtEdit
            Tag = 22
            Left = 502
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
          object f3SBrCode2: TMTxtEdit
            Tag = 22
            Left = 502
            Top = 58
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
          object f3SBrCode3: TMTxtEdit
            Tag = 22
            Left = 502
            Top = 78
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
          object f3SBrCode4: TMTxtEdit
            Tag = 22
            Left = 502
            Top = 98
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
          object f3SBrCode5: TMTxtEdit
            Tag = 22
            Left = 502
            Top = 118
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
          object f3SBrCode6: TMTxtEdit
            Tag = 22
            Left = 502
            Top = 138
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
          object f3SBrCode7: TMTxtEdit
            Tag = 22
            Left = 502
            Top = 158
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
          object f3SBrCode8: TMTxtEdit
            Tag = 22
            Left = 502
            Top = 178
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
          object f3SBrCode9: TMTxtEdit
            Tag = 22
            Left = 502
            Top = 198
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
          object f3SBrCode10: TMTxtEdit
            Tag = 22
            Left = 502
            Top = 218
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
          object f3TBrCode1: TMTxtEdit
            Tag = 22
            Left = 156
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
            TabOrder = 0
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
        end
        object PPanel_Kihon: TMPanel
          Left = 0
          Top = 71
          Width = 760
          Height = 469
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          Enabled = False
          ParentBackground = False
          TabOrder = 2
          Visible = False
          OnExit = PPanel_KihonExit
          object Jituzai_LLabel_RenChar: TMLabel
            Left = 10
            Top = 90
            Width = 32
            Height = 19
            AutoSize = False
            Caption = #36899#24819
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_LongName: TMLabel
            Left = 10
            Top = 6
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #27491#24335#21517#31216
            FontRatio.Auto = False
          end
          object Jituzai_LLabel_SimpleName: TMLabel
            Left = 10
            Top = 69
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #31777#30053#21517#31216
            FontRatio.Auto = False
          end
          object MLabel1: TMLabel
            Left = 10
            Top = 27
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #25964#31216
            FontRatio.Auto = False
          end
          object Label44: TMLabel
            Left = 10
            Top = 48
            Width = 83
            Height = 19
            AutoSize = False
            Caption = #12501#12522#12460#12490
            Color = 15921906
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ParentColor = False
            ParentFont = False
            FontRatio.Auto = False
          end
          object MPanel1: TMPanel
            Left = 0
            Top = 109
            Width = 421
            Height = 193
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 5
            object Jituzai_LLabel_ZipCode1: TMLabel
              Left = 10
              Top = 2
              Width = 93
              Height = 19
              AutoSize = False
              Caption = #37109#20415#30058#21495
              FontRatio.Auto = False
            end
            object Jituzai_LLabel_Address: TMLabel
              Left = 10
              Top = 23
              Width = 93
              Height = 19
              AutoSize = False
              Caption = #20303#25152#19978#27573
              FontRatio.Auto = False
            end
            object Jituzai_LLabel_ZipCode2: TMLabel
              Left = 161
              Top = 2
              Width = 13
              Height = 19
              AutoSize = False
              Caption = #65293
              FontRatio.Auto = False
            end
            object Jituzai_LLabel_TelNo: TMLabel
              Left = 10
              Top = 65
              Width = 93
              Height = 19
              AutoSize = False
              Caption = #38651#35441#30058#21495#65288'1'#65289
              FontRatio.Auto = False
            end
            object MLabel2: TMLabel
              Left = 10
              Top = 44
              Width = 93
              Height = 19
              AutoSize = False
              Caption = #20303#25152#19979#27573
              FontRatio.Auto = False
            end
            object MLabel3: TMLabel
              Left = 10
              Top = 86
              Width = 93
              Height = 19
              AutoSize = False
              Caption = #38651#35441#30058#21495#65288'2'#65289
              FontRatio.Auto = False
            end
            object LblFAX: TMLabel
              Left = 10
              Top = 107
              Width = 88
              Height = 19
              AutoSize = False
              Caption = 'FAX'#30058#21495
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = False
            end
            object Label1: TMLabel
              Left = 10
              Top = 128
              Width = 88
              Height = 19
              AutoSize = False
              Caption = #20195#34920#32773#24441#32887#21517
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = False
            end
            object Label48: TMLabel
              Left = 10
              Top = 149
              Width = 88
              Height = 19
              AutoSize = False
              Caption = #20195#34920#32773#21517
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = False
            end
            object Label11: TMLabel
              Left = 10
              Top = 170
              Width = 88
              Height = 19
              AutoSize = False
              Caption = 'HP'#12450#12489#12524#12473
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = False
            end
            object f0ZipCode1: TMNumEdit
              Left = 103
              Top = 2
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
            object f0ZipCode2: TMNumEdit
              Left = 181
              Top = 2
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
            object f0Address1: TMTxtEdit
              Left = 103
              Top = 23
              Width = 292
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = CmnPostShow
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              ImeMode = imHira
              MaxLength = 60
              FontRatio.Auto = True
              TabOrder = 2
              Text = ''
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = JituzaiEditExit
              ValidChars = ''
            end
            object f0Address2: TMTxtEdit
              Left = 103
              Top = 44
              Width = 292
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              ImeMode = imHira
              MaxLength = 60
              FontRatio.Auto = True
              TabOrder = 3
              Text = ''
              OnChange = evtOnChange
              OnEnter = EnterEvent
              ValidChars = ''
            end
            object f0TelNo: TMTxtEdit
              Left = 103
              Top = 65
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
            object f0TelNo2: TMTxtEdit
              Left = 103
              Top = 86
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
            object f0FAX: TMTxtEdit
              Left = 103
              Top = 107
              Width = 150
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ImeMode = imClose
              MaxLength = 20
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 6
              Text = ''
              OnChange = evtOnChange
              OnEnter = EnterEvent
              ValidChars = ''
            end
            object f0DHYONM1: TMTxtEdit
              Left = 103
              Top = 128
              Width = 150
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ImeMode = imHira
              MaxLength = 20
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 7
              Text = ''
              OnChange = evtOnChange
              OnEnter = EnterEvent
              ValidChars = ''
            end
            object f0DHYONM2: TMTxtEdit
              Left = 103
              Top = 149
              Width = 150
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ImeMode = imHira
              MaxLength = 20
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 8
              Text = ''
              OnChange = evtOnChange
              OnEnter = EnterEvent
              ValidChars = ''
            end
            object f0HPADD: TMTxtEdit
              Left = 103
              Top = 170
              Width = 292
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ImeMode = imClose
              MaxLength = 100
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 9
              Text = ''
              OnChange = evtOnChange
              OnEnter = EnterEvent
              ValidChars = ''
            end
          end
          object f0RenChar: TMTxtEdit
            Left = 103
            Top = 90
            Width = 88
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imSKata
            MaxLength = 10
            FontRatio.Auto = True
            TabOrder = 4
            Text = '1234567890'
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object f0LongName: TMTxtEdit
            Left = 103
            Top = 6
            Width = 292
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 60
            FontRatio.Auto = True
            TabOrder = 0
            Text = ''
            OnChange = f0LongNameChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object f0SimpleName: TMTxtEdit
            Left = 103
            Top = 69
            Width = 146
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            ImeMode = imHira
            MaxLength = 20
            FontRatio.Auto = True
            TabOrder = 3
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object f0KEISYOKBN: TMTxtEdit
            Left = 103
            Top = 27
            Width = 53
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atArrow
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imHira
            MaxLength = 6
            FontRatio.Auto = True
            ParentFont = False
            TabOrder = 1
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object f0FKANA: TMTxtEdit
            Left = 103
            Top = 48
            Width = 292
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imSKata
            MaxLength = 40
            FontRatio.Auto = True
            ParentFont = False
            TabOrder = 2
            Text = ''
            OnChange = evtOnChange
            OnEnter = EnterEvent
            ValidChars = ''
          end
          object MPanel2: TMPanel
            Left = 397
            Top = 25
            Width = 321
            Height = 100
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 9
            object Jituzai_LLabel_StartDate: TMLabel
              Left = 4
              Top = 65
              Width = 61
              Height = 19
              AutoSize = False
              Caption = #36969#29992#26085#20184
              FontRatio.Auto = False
            end
            object MLabel20: TMLabel
              Left = 203
              Top = 65
              Width = 17
              Height = 19
              AutoSize = False
              Caption = #65374
              FontRatio.Auto = False
            end
            object Label13: TMLabel
              Left = 5
              Top = 2
              Width = 60
              Height = 19
              AutoSize = False
              Caption = #31038#21729#25968
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = False
            end
            object Label15: TMLabel
              Left = 5
              Top = 44
              Width = 60
              Height = 19
              AutoSize = False
              Caption = #36039#26412#37329
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = False
            end
            object Label14: TMLabel
              Left = 5
              Top = 23
              Width = 60
              Height = 19
              AutoSize = False
              Caption = #24180#21830
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = False
            end
            object f0StartDate: TMDateEdit
              Left = 100
              Top = 65
              Width = 83
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              ArrowType = atOmission
              F4Arrow = True
              AutoSize = False
              ImeMode = imClose
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
            object f0EndDate: TMDateEdit
              Left = 216
              Top = 65
              Width = 83
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              ArrowType = atOmission
              F4Arrow = True
              AutoSize = False
              ImeMode = imClose
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
            object f0SYAINSU: TMNumEdit
              Left = 100
              Top = 2
              Width = 141
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdArrowClick
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
              OnChange = evtOnChange
              OnEnter = EnterEvent
              FormatStr = '#,###'
              Digits = 10
              Validate = False
            end
            object f0SIHONKIN: TMNumEdit
              Left = 100
              Top = 44
              Width = 141
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              SelectMaxRowCount = 0
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
              OnChange = evtOnChange
              OnEnter = EnterEvent
              FormatStr = '#,###'
              Digits = 15
              Validate = False
            end
            object f0NENSYO: TMNumEdit
              Left = 100
              Top = 23
              Width = 141
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              SelectMaxRowCount = 0
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
              OnChange = evtOnChange
              OnEnter = EnterEvent
              FormatStr = '#,###'
              Digits = 15
              Validate = False
            end
          end
          object PGyousyu: TMPanel
            Left = 0
            Top = 300
            Width = 417
            Height = 25
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 6
            object f0GYLab: TMLabel
              Left = 8
              Top = 0
              Width = 95
              Height = 19
              AutoSize = False
              Caption = #26989#31278
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = True
            end
            object f0GYName: TMLabel
              Left = 208
              Top = 0
              Width = 195
              Height = 17
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f0GYCode: TMTxtEdit
              Tag = 22
              Left = 103
              Top = 0
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
              TabOrder = 0
              Text = ''
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = JituzaiEditExit
              ValidChars = ''
            end
          end
          object pnlJPorFR: TMPanel
            Left = 0
            Top = 321
            Width = 417
            Height = 44
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 7
            object MLabel4: TMLabel
              Left = 8
              Top = 0
              Width = 95
              Height = 19
              AutoSize = False
              Caption = #22269#20869#22806#21306#20998
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = True
            end
            object f0LCOUNTRY: TMLabel
              Left = 146
              Top = 1
              Width = 195
              Height = 17
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel37: TMLabel
              Left = 8
              Top = 21
              Width = 95
              Height = 19
              AutoSize = False
              Caption = #36890#36008
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = True
            end
            object f0LCURRENCY: TMLabel
              Left = 142
              Top = 22
              Width = 195
              Height = 17
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f0ECURRENCY: TMTxtEdit
              Tag = 19002
              Left = 103
              Top = 21
              Width = 21
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              ArrowType = atArrow
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
            object f0ECOUNTRY: TMNumEdit
              Left = 103
              Top = 0
              Width = 21
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
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
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = JituzaiEditExit
              Negative = False
              Digits = 1
              Validate = False
              Value = 9.000000000000000000
            end
          end
          object MPanelMYN: TMPanel
            Left = 0
            Top = 363
            Width = 381
            Height = 46
            BevelOuter = bvNone
            Color = 15921906
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 8
            object MLabel34: TMLabel
              Left = 8
              Top = 0
              Width = 95
              Height = 19
              AutoSize = False
              Caption = #27861#20154#65381#20491#20154#21306#20998
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = True
            end
            object f0LMYNKbnNm: TMLabel
              Left = 142
              Top = 1
              Width = 195
              Height = 17
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f0HoujinLab: TMLabel
              Left = 8
              Top = 21
              Width = 95
              Height = 19
              AutoSize = False
              Caption = #27861#20154#65381#20491#20154#30058#21495
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = True
            end
            object f0MYNKbn: TMNumEdit
              Left = 103
              Top = 0
              Width = 21
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0:'#27861#20154
                '1:'#20491#20154)
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
              OnChange = KBNChange
              OnEnter = EnterEvent
              OnExit = evtOnExit
              OnKeyPress = fnKeyPressMYN
              Negative = False
              MaxValue = 1.000000000000000000
              Digits = 1
              Validate = True
              Value = 9.000000000000000000
              Zero = True
            end
            object f0MYNNo: TMTxtEdit
              Left = 103
              Top = 21
              Width = 110
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = f0MYNNoArrowClick
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
              MaxLength = 13
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 1
              Text = ''
              OnChange = evtOnChange
              OnEnter = EnterEvent
              OnExit = JituzaiEditExit
              OnKeyPress = fnKeyPressMYN
              ValidChars = ''
            end
            object MPanelKojin: TMPanel
              Left = 236
              Top = 21
              Width = 101
              Height = 24
              BevelOuter = bvNone
              Color = 15921906
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 2
              object Image_Mask: TImage
                Left = 47
                Top = 1
                Width = 16
                Height = 16
                Hint = #20491#20154#30058#21495#34920#31034
                Picture.Data = {
                  07544269746D617036030000424D360300000000000036000000280000001000
                  000010000000010018000000000000030000C21E0000C21E0000000000000000
                  0000636563636563636563636563636563636563636563636563636563636563
                  636563636563636563636563636563636563636563DEDFDEDEDFDEDEDFDEDEDF
                  DEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDE63
                  6563636563DEDFDEDEDFDEDEDFDEDEDFDEDEDFDE8C51298C51298C51298C5129
                  DEDFDEDEDFDEDEDFDEDEDFDEDEDFDE636563636563E7E3E7E7E3E7E7E3E7E7E3
                  E78C4D298C4D298C4D298C4D298C4D298C4D29E7E3E7E7E3E7E7E3E7E7E3E763
                  6563636563E7E3E7E7E3E7EFEBEF844921844921844921844921844921844921
                  844921844921E7E3E7E7E3E7E7E3E7636563636563E7E7E7E7E7E7EFEBEF7B49
                  217B49217B49217B49217B49217B49217B49217B4921E7E7E7E7E7E7E7E7E763
                  6563636563EFEBEFEFEBEFEFEBEF734521734521EFEBEFEFEBEF734521734521
                  734521734521EFEBEFEFEBEFEFEBEF636563636563EFEBEFEFEBEFEFEBEF7341
                  21734121EFEBEFEFEBEF734121734121734121734121EFEBEFEFEBEFEFEBEF63
                  6563636563EFEFEF734121F7F3F7F7F3F76B3C216B3C216B3C216B3C216B3C21
                  6B3C21F7F3F7F7F3F76B3C21EFEFEF636563636563F7F3F76B3C186B3C18F7F3
                  F7F7F3F76B3C186B3C186B3C186B3C18F7F3F7F7F3F76B3C186B3C18F7F3F763
                  6563636563F7F3F7F7F3F75A34185A3418F7F3F7F7F3F7F7F3F7F7F3F7F7F3F7
                  F7F3F75A34185A3418F7F3F7F7F3F7636563636563F7F7F7F7F7F7F7F7F75230
                  18523018523018523018523018523018523018523018F7F7F7F7F7F7F7F7F763
                  6563636563FFFBFFFFFBFFFFFBFFFFFBFF4A2C104A2C104A2C104A2C104A2C10
                  4A2C10FFFBFFFFFBFFFFFBFFFFFBFF636563636563FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63
                  6563636563FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6365636365636365636365636365636365
                  6363656363656363656363656363656363656363656363656363656363656363
                  6563}
                OnClick = Image_MaskClick
              end
              object Image_MaskGray: TImage
                Left = 47
                Top = 1
                Width = 16
                Height = 16
                Hint = #20491#20154#30058#21495#34920#31034
                Picture.Data = {
                  07544269746D617036030000424D360300000000000036000000280000001000
                  0000100000000100180000000000000300000000000000000000000000000000
                  0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                  C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0DEDFDEDEDFDEDEDFDEDEDF
                  DEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEC0
                  C0C0C0C0C0DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEBCBCBCBCBCBCBCBCBCBCBCBC
                  DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEC0C0C0C0C0C0E7E3E7E7E3E7E7E3E7E7E3
                  E7B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9E7E3E7E7E3E7E7E3E7E7E3E7C0
                  C0C0C0C0C0E7E3E7E7E3E7EFEBEFB4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4
                  B4B4B4B4B4B4E7E3E7E7E3E7E7E3E7C0C0C0C0C0C0E7E7E7E7E7E7EFEBEFB3B3
                  B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3E7E7E7E7E7E7E7E7E7C0
                  C0C0C0C0C0EFEBEFEFEBEFEFEBEFAFAFAFAFAFAFEFEBEFEFEBEFAFAFAFAFAFAF
                  AFAFAFAFAFAFEFEBEFEFEBEFEFEBEFC0C0C0C0C0C0EFEBEFEFEBEFEFEBEFACAC
                  ACACACACEFEBEFEFEBEFACACACACACACACACACACACACEFEBEFEFEBEFEFEBEFC0
                  C0C0C0C0C0EFEFEFACACACF7F3F7F7F3F7A7A7A7A7A7A7A7A7A7A7A7A7A7A7A7
                  A7A7A7F7F3F7F7F3F7A7A7A7EFEFEFC0C0C0C0C0C0F7F3F7A6A6A6A6A6A6F7F3
                  F7F7F3F7A6A6A6A6A6A6A6A6A6A6A6A6F7F3F7F7F3F7A6A6A6A6A6A6F7F3F7C0
                  C0C0C0C0C0F7F3F7F7F3F79F9F9F9F9F9FF7F3F7F7F3F7F7F3F7F7F3F7F7F3F7
                  F7F3F79F9F9F9F9F9FF7F3F7F7F3F7C0C0C0C0C0C0F7F7F7F7F7F7F7F7F79B9B
                  9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9BF7F7F7F7F7F7F7F7F7C0
                  C0C0C0C0C0FFFBFFFFFBFFFFFBFFFFFBFF969696969696969696969696969696
                  969696FFFBFFFFFBFFFFFBFFFFFBFFC0C0C0C0C0C0FFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0
                  C0C0C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                  C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
                  C0C0}
              end
              object BtnMYNKojinUpd: TMBitBtn
                Left = 0
                Top = 0
                Width = 40
                Height = 19
                Caption = #30331#37682
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                NumGlyphs = 2
                ParentFont = False
                TabOrder = 0
                OnClick = Button1Click
                OnEnter = EnterEvent
              end
            end
          end
        end
        object PMTab: TMTab
          Left = 0
          Top = 35
          Width = 760
          Height = 36
          Items = <
            item
              Caption = #22522#26412#24773#22577
              Color = 16766672
              SyncControl = PPanel_Kihon
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #25505#29992#24773#22577
              Color = 16766672
              SyncControl = PPanel_Saiyo
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #12475#12464#12513#12531#12488
              Color = 16766672
              SyncControl = PPanel_Seg
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #20998#39006
              Color = 16766672
              SyncControl = PPanel_Br
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end>
          Align = alTop
          TabStop = True
          TabOrder = 1
          OnChange = PMTabChange
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
          OnKeyDown = PMTabKeyDown
          BorderCaptionAlign = taCenter
          DropShadow = False
        end
        object Jituzai_PPanel_Card_1: TMPanel
          Left = 0
          Top = 0
          Width = 760
          Height = 35
          Align = alTop
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          PopupMenu = PMTokui
          TabOrder = 0
          object Jituzai_LLabel_Fusen: TMLabel
            Left = 480
            Top = 3
            Width = 93
            Height = 19
            AutoSize = False
            Caption = #20184#31627#24773#22577
            Visible = False
            FontRatio.Auto = False
          end
          object Jituzai_ImageRaised_FusenRed: TImage
            Left = 616
            Top = 3
            Width = 16
            Height = 18
            Picture.Data = {
              07544269746D617056050000424D560500000000000036040000280000001000
              000012000000010008000000000020010000C40E0000C40E0000000100000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
              E00000400000004020000040400000406000004080000040A0000040C0000040
              E00000600000006020000060400000606000006080000060A0000060C0000060
              E00000800000008020000080400000806000008080000080A0000080C0000080
              E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
              E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
              E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
              E00040000000400020004000400040006000400080004000A0004000C0004000
              E00040200000402020004020400040206000402080004020A0004020C0004020
              E00040400000404020004040400040406000404080004040A0004040C0004040
              E00040600000406020004060400040606000406080004060A0004060C0004060
              E00040800000408020004080400040806000408080004080A0004080C0004080
              E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
              E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
              E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
              E00080000000800020008000400080006000800080008000A0008000C0008000
              E00080200000802020008020400080206000802080008020A0008020C0008020
              E00080400000804020008040400080406000804080008040A0008040C0008040
              E00080600000806020008060400080606000806080008060A0008060C0008060
              E00080800000808020008080400080806000808080008080A0008080C0008080
              E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
              E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
              E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
              E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
              E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
              E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
              E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
              E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
              E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
              E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
              A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00070707070707070707070707070707070707070707070707070707070707
              07070707070700000000000000070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707F9F9F9F9F9F900070707
              070707070707F9F9F9F9F9F900070707070707070707F9F9F9F9F9F900070707
              070707070707F9F9F9F9F9F90007070707070707070707070707070707070707
              0707070707070707070707070707070707070707070707070707070707070707
              0707}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_ImageRaised_FusenGreen: TImage
            Left = 632
            Top = 3
            Width = 16
            Height = 18
            AutoSize = True
            Picture.Data = {
              07544269746D617056050000424D560500000000000036040000280000001000
              000012000000010008000000000020010000C40E0000C40E0000000100000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
              E00000400000004020000040400000406000004080000040A0000040C0000040
              E00000600000006020000060400000606000006080000060A0000060C0000060
              E00000800000008020000080400000806000008080000080A0000080C0000080
              E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
              E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
              E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
              E00040000000400020004000400040006000400080004000A0004000C0004000
              E00040200000402020004020400040206000402080004020A0004020C0004020
              E00040400000404020004040400040406000404080004040A0004040C0004040
              E00040600000406020004060400040606000406080004060A0004060C0004060
              E00040800000408020004080400040806000408080004080A0004080C0004080
              E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
              E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
              E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
              E00080000000800020008000400080006000800080008000A0008000C0008000
              E00080200000802020008020400080206000802080008020A0008020C0008020
              E00080400000804020008040400080406000804080008040A0008040C0008040
              E00080600000806020008060400080606000806080008060A0008060C0008060
              E00080800000808020008080400080806000808080008080A0008080C0008080
              E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
              E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
              E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
              E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
              E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
              E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
              E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
              E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
              E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
              E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
              A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00070707070707070707070707070707070707070707070707070707070707
              07070707070700000000000000070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF0007070707070707070702020202020200070707
              0707070707070202020202020007070707070707070702020202020200070707
              0707070707070202020202020007070707070707070707070707070707070707
              0707070707070707070707070707070707070707070707070707070707070707
              0707}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_ImageRaised_FusenBlue: TImage
            Left = 648
            Top = 3
            Width = 16
            Height = 18
            AutoSize = True
            Picture.Data = {
              07544269746D617056050000424D560500000000000036040000280000001000
              000012000000010008000000000020010000C40E0000C40E0000000100000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
              E00000400000004020000040400000406000004080000040A0000040C0000040
              E00000600000006020000060400000606000006080000060A0000060C0000060
              E00000800000008020000080400000806000008080000080A0000080C0000080
              E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
              E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
              E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
              E00040000000400020004000400040006000400080004000A0004000C0004000
              E00040200000402020004020400040206000402080004020A0004020C0004020
              E00040400000404020004040400040406000404080004040A0004040C0004040
              E00040600000406020004060400040606000406080004060A0004060C0004060
              E00040800000408020004080400040806000408080004080A0004080C0004080
              E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
              E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
              E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
              E00080000000800020008000400080006000800080008000A0008000C0008000
              E00080200000802020008020400080206000802080008020A0008020C0008020
              E00080400000804020008040400080406000804080008040A0008040C0008040
              E00080600000806020008060400080606000806080008060A0008060C0008060
              E00080800000808020008080400080806000808080008080A0008080C0008080
              E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
              E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
              E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
              E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
              E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
              E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
              E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
              E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
              E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
              E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
              A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00070707070707070707070707070707070707070707070707070707070707
              07070707070700000000000000070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FCFCFCFCFCFC00070707
              070707070707FCFCFCFCFCFC00070707070707070707FCFCFCFCFCFC00070707
              070707070707FCFCFCFCFCFC0007070707070707070707070707070707070707
              0707070707070707070707070707070707070707070707070707070707070707
              0707}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_ImageRaised_FusenOrange: TImage
            Left = 664
            Top = 3
            Width = 16
            Height = 18
            AutoSize = True
            Picture.Data = {
              07544269746D617056050000424D560500000000000036040000280000001000
              000012000000010008000000000020010000C40E0000C40E0000000100000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
              E00000400000004020000040400000406000004080000040A0000040C0000040
              E00000600000006020000060400000606000006080000060A0000060C0000060
              E00000800000008020000080400000806000008080000080A0000080C0000080
              E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
              E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
              E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
              E00040000000400020004000400040006000400080004000A0004000C0004000
              E00040200000402020004020400040206000402080004020A0004020C0004020
              E00040400000404020004040400040406000404080004040A0004040C0004040
              E00040600000406020004060400040606000406080004060A0004060C0004060
              E00040800000408020004080400040806000408080004080A0004080C0004080
              E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
              E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
              E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
              E00080000000800020008000400080006000800080008000A0008000C0008000
              E00080200000802020008020400080206000802080008020A0008020C0008020
              E00080400000804020008040400080406000804080008040A0008040C0008040
              E00080600000806020008060400080606000806080008060A0008060C0008060
              E00080800000808020008080400080806000808080008080A0008080C0008080
              E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
              E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
              E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
              E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
              E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
              E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
              E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
              E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
              E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
              E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
              A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00070707070707070707070707070707070707070707070707070707070707
              07070707070700000000000000070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF00070707070707070707FFFFFFFFFFFF00070707
              070707070707FFFFFFFFFFFF0007070707070707070767676767676700070707
              0707070707076767676767670007070707070707070767676767676700070707
              0707070707076767676767670007070707070707070707070707070707070707
              0707070707070707070707070707070707070707070707070707070707070707
              0707}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_ImageLowered_FusenRed: TImage
            Left = 588
            Top = 3
            Width = 16
            Height = 18
            Picture.Data = {
              07544269746D617056050000424D560500000000000036040000280000001000
              000012000000010008000000000020010000C40E0000C40E0000000100000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
              E00000400000004020000040400000406000004080000040A0000040C0000040
              E00000600000006020000060400000606000006080000060A0000060C0000060
              E00000800000008020000080400000806000008080000080A0000080C0000080
              E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
              E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
              E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
              E00040000000400020004000400040006000400080004000A0004000C0004000
              E00040200000402020004020400040206000402080004020A0004020C0004020
              E00040400000404020004040400040406000404080004040A0004040C0004040
              E00040600000406020004060400040606000406080004060A0004060C0004060
              E00040800000408020004080400040806000408080004080A0004080C0004080
              E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
              E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
              E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
              E00080000000800020008000400080006000800080008000A0008000C0008000
              E00080200000802020008020400080206000802080008020A0008020C0008020
              E00080400000804020008040400080406000804080008040A0008040C0008040
              E00080600000806020008060400080606000806080008060A0008060C0008060
              E00080800000808020008080400080806000808080008080A0008080C0008080
              E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
              E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
              E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
              E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
              E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
              E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
              E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
              E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
              E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
              E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
              A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF0007070707070707070707070707070707A407FF07FF00000000000000FF07
              FF07A4FF07FF000000000000000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07F9F9F9F9F9F90000FF07
              FF07A4FF07FFF9F9F9F9F9F9000007FF0707A407FF07F9F9F9F9F9F90000FF07
              FF07A4FF07FFF9F9F9F9F9F900FF07FF0707A407FF07FF07FF07FF07FF07FF07
              FF07A4FF07FF07FF07FF07FF07FF07FF0707A4A4A4A4A4A4A4A4A4A4A4A4A4A4
              FF07}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_ImageLowered_FusenGreen: TImage
            Left = 604
            Top = 3
            Width = 16
            Height = 18
            AutoSize = True
            Picture.Data = {
              07544269746D617056050000424D560500000000000036040000280000001000
              000012000000010008000000000020010000C40E0000C40E0000000100000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
              E00000400000004020000040400000406000004080000040A0000040C0000040
              E00000600000006020000060400000606000006080000060A0000060C0000060
              E00000800000008020000080400000806000008080000080A0000080C0000080
              E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
              E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
              E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
              E00040000000400020004000400040006000400080004000A0004000C0004000
              E00040200000402020004020400040206000402080004020A0004020C0004020
              E00040400000404020004040400040406000404080004040A0004040C0004040
              E00040600000406020004060400040606000406080004060A0004060C0004060
              E00040800000408020004080400040806000408080004080A0004080C0004080
              E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
              E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
              E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
              E00080000000800020008000400080006000800080008000A0008000C0008000
              E00080200000802020008020400080206000802080008020A0008020C0008020
              E00080400000804020008040400080406000804080008040A0008040C0008040
              E00080600000806020008060400080606000806080008060A0008060C0008060
              E00080800000808020008080400080806000808080008080A0008080C0008080
              E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
              E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
              E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
              E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
              E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
              E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
              E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
              E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
              E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
              E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
              A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF0007070707070707070707070707070707A407FF07FF00000000000000FF07
              FF07A4FF07FF000000000000000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF070202020202020000FF07
              FF07A4FF07FF020202020202000007FF0707A407FF070202020202020000FF07
              FF07A4FF07FF02020202020200FF07FF0707A407FF07FF07FF07FF07FF07FF07
              FF07A4FF07FF07FF07FF07FF07FF07FF0707A4A4A4A4A4A4A4A4A4A4A4A4A4A4
              FF07}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_ImageLowered_FusenBlue: TImage
            Left = 648
            Top = 3
            Width = 16
            Height = 18
            AutoSize = True
            Picture.Data = {
              07544269746D617056050000424D560500000000000036040000280000001000
              000012000000010008000000000020010000C40E0000C40E0000000100000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
              E00000400000004020000040400000406000004080000040A0000040C0000040
              E00000600000006020000060400000606000006080000060A0000060C0000060
              E00000800000008020000080400000806000008080000080A0000080C0000080
              E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
              E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
              E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
              E00040000000400020004000400040006000400080004000A0004000C0004000
              E00040200000402020004020400040206000402080004020A0004020C0004020
              E00040400000404020004040400040406000404080004040A0004040C0004040
              E00040600000406020004060400040606000406080004060A0004060C0004060
              E00040800000408020004080400040806000408080004080A0004080C0004080
              E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
              E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
              E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
              E00080000000800020008000400080006000800080008000A0008000C0008000
              E00080200000802020008020400080206000802080008020A0008020C0008020
              E00080400000804020008040400080406000804080008040A0008040C0008040
              E00080600000806020008060400080606000806080008060A0008060C0008060
              E00080800000808020008080400080806000808080008080A0008080C0008080
              E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
              E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
              E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
              E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
              E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
              E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
              E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
              E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
              E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
              E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
              A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF0007070707070707070707070707070707A407FF07FF00000000000000FF07
              FF07A4FF07FF000000000000000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FCFCFCFCFCFC0000FF07
              FF07A4FF07FFFCFCFCFCFCFC000007FF0707A407FF07FCFCFCFCFCFC0000FF07
              FF07A4FF07FFFCFCFCFCFCFC00FF07FF0707A407FF07FF07FF07FF07FF07FF07
              FF07A4FF07FF07FF07FF07FF07FF07FF0707A4A4A4A4A4A4A4A4A4A4A4A4A4A4
              FF07}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_ImageLowered_FusenOrange: TImage
            Left = 664
            Top = 3
            Width = 16
            Height = 18
            AutoSize = True
            Picture.Data = {
              07544269746D617056050000424D560500000000000036040000280000001000
              000012000000010008000000000020010000C40E0000C40E0000000100000000
              000000000000000080000080000000808000800000008000800080800000C0C0
              C000C0DCC000F0CAA6000020400000206000002080000020A0000020C0000020
              E00000400000004020000040400000406000004080000040A0000040C0000040
              E00000600000006020000060400000606000006080000060A0000060C0000060
              E00000800000008020000080400000806000008080000080A0000080C0000080
              E00000A0000000A0200000A0400000A0600000A0800000A0A00000A0C00000A0
              E00000C0000000C0200000C0400000C0600000C0800000C0A00000C0C00000C0
              E00000E0000000E0200000E0400000E0600000E0800000E0A00000E0C00000E0
              E00040000000400020004000400040006000400080004000A0004000C0004000
              E00040200000402020004020400040206000402080004020A0004020C0004020
              E00040400000404020004040400040406000404080004040A0004040C0004040
              E00040600000406020004060400040606000406080004060A0004060C0004060
              E00040800000408020004080400040806000408080004080A0004080C0004080
              E00040A0000040A0200040A0400040A0600040A0800040A0A00040A0C00040A0
              E00040C0000040C0200040C0400040C0600040C0800040C0A00040C0C00040C0
              E00040E0000040E0200040E0400040E0600040E0800040E0A00040E0C00040E0
              E00080000000800020008000400080006000800080008000A0008000C0008000
              E00080200000802020008020400080206000802080008020A0008020C0008020
              E00080400000804020008040400080406000804080008040A0008040C0008040
              E00080600000806020008060400080606000806080008060A0008060C0008060
              E00080800000808020008080400080806000808080008080A0008080C0008080
              E00080A0000080A0200080A0400080A0600080A0800080A0A00080A0C00080A0
              E00080C0000080C0200080C0400080C0600080C0800080C0A00080C0C00080C0
              E00080E0000080E0200080E0400080E0600080E0800080E0A00080E0C00080E0
              E000C0000000C0002000C0004000C0006000C0008000C000A000C000C000C000
              E000C0200000C0202000C0204000C0206000C0208000C020A000C020C000C020
              E000C0400000C0402000C0404000C0406000C0408000C040A000C040C000C040
              E000C0600000C0602000C0604000C0606000C0608000C060A000C060C000C060
              E000C0800000C0802000C0804000C0806000C0808000C080A000C080C000C080
              E000C0A00000C0A02000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0
              E000C0C00000C0C02000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0
              A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF0007070707070707070707070707070707A407FF07FF00000000000000FF07
              FF07A4FF07FF000000000000000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF07FFFFFFFFFFFF0000FF07
              FF07A4FF07FFFFFFFFFFFFFF000007FF0707A407FF076767676767670000FF07
              FF07A4FF07FF676767676767000007FF0707A407FF076767676767670000FF07
              FF07A4FF07FF67676767676700FF07FF0707A407FF07FF07FF07FF07FF07FF07
              FF07A4FF07FF07FF07FF07FF07FF07FF0707A4A4A4A4A4A4A4A4A4A4A4A4A4A4
              FF07}
            Transparent = True
            Visible = False
            OnClick = FusenClick
          end
          object Jituzai_LLabel_GCode: TMLabel
            Left = 25
            Top = 2
            Width = 144
            Height = 19
            AutoSize = False
            Caption = '12345678901234567890'
            FontRatio.Auto = True
          end
          object f1Fusen1: TImage
            Left = 2
            Top = 5
            Width = 16
            Height = 18
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
          object f1Fusen2: TImage
            Left = 2
            Top = 5
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
          object f1Fusen3: TImage
            Left = 2
            Top = 5
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
          object f1Fusen4: TImage
            Left = 2
            Top = 5
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
          object f0Name: TMLabel
            Left = 305
            Top = 3
            Width = 430
            Height = 19
            AutoSize = False
            BorderLine = tmbSingle
            FontRatio.Auto = True
          end
          object f0NGCode: TMNumEdit
            Left = 171
            Top = 3
            Width = 106
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = ArrowClick
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
            TabOrder = 2
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            FormatStr = '0'
            Negative = False
            Digits = 10
            Validate = False
            InputFlag = True
            InputFlagEnabled = True
            Zero = True
          end
          object f0TGCode: TMTxtEdit
            Left = 171
            Top = 3
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
            OnEnter = EnterEvent
            OnExit = JituzaiEditExit
            ValidChars = ''
          end
          object Jituzai_ETEdit_Fusen: TMTxtEdit
            Left = 328
            Top = 3
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
            TabOrder = 0
            Text = ''
            Visible = False
            OnEnter = EnterEvent
            ValidChars = ''
          end
        end
        object BtnPagePrevious: TMBitBtn
          Left = 383
          Top = 436
          Width = 80
          Height = 25
          Caption = #21069#12408'(&L)'
          Enabled = False
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
          TabOrder = 6
          OnClick = fnCmnPageMoveClick
          OnEnter = EnterEvent
        end
        object BtnPageNext: TMBitBtn
          Left = 467
          Top = 436
          Width = 80
          Height = 25
          Caption = #27425#12408'(&N)'
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
          TabOrder = 7
          OnClick = fnCmnPageMoveClick
          OnEnter = EnterEvent
        end
        object Jituzai_BBitBtn_Ok: TMBitBtn
          Left = 551
          Top = 436
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
          TabOrder = 8
          OnClick = Jituzai_BBitBtn_OkClick
          OnEnter = EnterEvent
        end
        object Jituzai_BBitBtn_Cancel: TMBitBtn
          Left = 635
          Top = 436
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
          TabOrder = 9
          Visible = False
          OnClick = Jituzai_BBitBtn_CancelClick
          OnEnter = EnterEvent
        end
      end
    end
    object Root_PMTab: TMTab
      Left = 0
      Top = 0
      Width = 760
      Height = 44
      Items = <
        item
          Caption = #23455#22312#24773#22577
          Color = 16766672
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end
        item
          Caption = #21512#35336#24773#22577
          Color = 16766672
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
    object LSinsei: TMPanel
      Left = 585
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
      TabOrder = 3
      Visible = False
    end
  end
  object PPanelSpeed: TMPanel
    Left = 0
    Top = 0
    Width = 943
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 0
    Visible = False
    object BSpeedButtonEnd: TMSpeedButton
      Left = 1
      Top = 2
      Width = 70
      Height = 21
      Caption = #32066#20102'(&X)'
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC808080DCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDDDDCDDDCDCDCDCDCDC
        DCDCDCDCDCDCDD808080BCBCBCEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDBCBCBC808080DEDFDE
        DFDEDFDEDEDEDFDFDEDEDEDFDEDFDEDEDEDFDEDEDFDEDFDEDEDEDFDFDEDEDEDF
        DEDFDFDEDFDFDF808080BCBCBCEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEBCBCBC808080E1E1E0
        E1E0E18C64008C6400E0E1E1E0E1E0E0E1E1E1E0E1E1E1E0E0E1E08C64008C64
        00E1E0E1E1E0E1808080BCBCBCEFEFEFEFEFEFA8A8A8A8A8A8EFEFEFEFEFEFEF
        EFEFEFEFEFEFEFEFEFEFEFA8A8A8A8A8A8EFEFEFEFEFEFBCBCBC808080E3E3E3
        E3E3E38C64008C64008C6400E3E3E3E3E3E3E3E3E3E4E3E38C64008C64008C64
        00E3E3E4E3E3E3808080BCBCBCF0F0F0F0F0F0A8A8A8A8A8A8A8A8A8F0F0F0F0
        F0F0F0F0F0F0F0F0A8A8A8A8A8A8A8A8A8F0F0F0F0F0F0BCBCBC808080E5E6E6
        E6E6E5E5E6E68C64008C64008C6400E6E6E6E6E6E68C64008C64008C6400E6E6
        E6E6E6E6E6E6E6808080BCBCBCF2F2F2F2F2F2F2F2F2A8A8A8A8A8A8A8A8A8F2
        F2F2F2F2F2A8A8A8A8A8A8A8A8A8F2F2F2F2F2F2F2F2F2BCBCBC808080E8E8E9
        E8E9E8E8E8E9E9E8E98C64008C6400E8E9E8E9E9E88C64008C6400E8E8E8E8E8
        E9E8E8E9E9E8E8808080BCBCBCF3F3F3F3F3F3F3F3F3F3F3F3A8A8A8A8A8A8F3
        F3F3F3F3F3A8A8A8A8A8A8F3F3F3F3F3F3F3F3F3F3F3F3BCBCBC808080EBEBEB
        EAEBEBEBEBEBEBEBEBEBEBEB8C64008C64008C64008C6400EBEBEBEBEBEBEBEB
        EBEBEBEAEBEBEB808080BCBCBCF4F4F4F4F4F4F4F4F4F4F4F4F4F4F4A8A8A8A8
        A8A8A8A8A8A8A8A8F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4BCBCBC808080EDEDED
        EEEDEEEDEDEDEEEDEDEEEDEE8C64008C64008C64008C6400EEEDEDEDEDEDEDED
        EDEDEDEDEEEDEE808080BCBCBCF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6A8A8A8A8
        A8A8A8A8A8A8A8A8F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6BCBCBC808080F0F0F0
        F0F1F0F1F0F1F0F0F18C64008C6400F0F0F0F0F1F08C64008C6400F1F0F1F1F0
        F0F0F0F1F0F0F0808080BCBCBCF7F7F7F8F8F8F7F7F7F7F7F7A8A8A8A8A8A8F7
        F7F7F8F8F8A8A8A8A8A8A8F7F7F7F7F7F7F7F7F7F7F7F7BCBCBC808080F3F3F3
        F4F3F3F3F3F38C64008C64008C6400F3F4F3F3F3F38C64008C64008C6400F3F3
        F4F3F3F3F3F3F3808080BCBCBCF8F8F8F8F8F8F8F8F8A8A8A8A8A8A8A8A8A8F9
        F9F9F8F8F8A8A8A8A8A8A8A8A8A8F8F8F8F8F8F8F8F8F8BCBCBC808080F6F6F6
        F6F6F68C64008C64008C6400F6F6F6F6F6F6F6F6F6F6F6F68C64008C64008C64
        00F6F6F6F6F6F6808080BCBCBCFAFAFAFAFAFAA8A8A8A8A8A8A8A8A8FAFAFAFA
        FAFAFAFAFAFAFAFAA8A8A8A8A8A8A8A8A8FAFAFAFAFAFABCBCBC808080F9F8F8
        F9F8F98C64008C6400F9F8F9F9F9F8F9F9F9F9F9F8F9F9F9F9F9F98C64008C64
        00F9F8F9F9F9F8808080BCBCBCFBFBFBFBFBFBA8A8A8A8A8A8FBFBFBFCFCFCFC
        FCFCFCFCFCFCFCFCFCFCFCA8A8A8A8A8A8FBFBFBFCFCFCBCBCBC808080FCFCFB
        FBFCFCFBFBFCFCFBFCFBFBFBFBFBFCFCFBFCFCFBFBFBFBFBFCFCFBFCFBFBFBFC
        FCFBFBFBFBFBFB808080BCBCBCFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFDFDFDFDFDFDBCBCBC808080FEFEFE
        FDFEFEFDFEFEFDFEFDFEFEFDFDFEFEFEFDFDFDFEFEFEFDFDFEFEFDFEFEFDFDFD
        FEFDFDFEFEFEFE808080BCBCBCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBCBCBC808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC}
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
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC808080DCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDC808080BCBCBCEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDBCBCBC808080DEDFDE
        DEDFDE8C64008C64008C64008C64008C64008C64008C64008C64008C64008C64
        00DEDFDEDEDFDE808080BCBCBCEEEEEEEEEEEEA8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8EEEEEEEEEEEEBCBCBC808080E1E1E0
        E1E1E08C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C64
        00E1E1E0E1E1E0808080BCBCBCEFEFEFEFEFEFA8A8A8FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8EFEFEFEFEFEFBCBCBC808080E3E3E3
        E3E3E38C6400FFFFFF8C64008C64008C64008C64008C64008C6400FFFFFF8C64
        00E3E3E3E3E3E3808080BCBCBCF0F0F0F0F0F0A8A8A8FFFFFFA8A8A8A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8FFFFFFA8A8A8F0F0F0F0F0F0BCBCBC808080E5E6E6
        E5E6E68C6400FFFFFFFFFFFFFFFFFF8C64008C6400FFFFFFFFFFFFFFFFFF8C64
        00E5E6E6E5E6E6808080BCBCBCF2F2F2F2F2F2A8A8A8FFFFFFFFFFFFFFFFFFA8
        A8A8A8A8A8FFFFFFFFFFFFFFFFFFA8A8A8F2F2F2F2F2F2BCBCBC808080E8E8E9
        E8E8E9E8E8E98C6400F2F2F28C64008C64008C64008C6400F2F2F28C6400E8E8
        E9E8E8E9E8E8E9808080BCBCBCF3F3F3F3F3F3F3F3F3A8A8A8F8F8F8A8A8A8A8
        A8A8A8A8A8A8A8A8F8F8F8A8A8A8F3F3F3F3F3F3F3F3F3BCBCBC808080EBEBEB
        8C64008C64008C6400E0E0E0E0E0E0E0E0DFE0E0E0E0E0E0DFDFDF8C64008C64
        008C6400EBEBEB808080BCBCBCF4F4F4A8A8A8A8A8A8A8A8A8EFEFEFEFEFEFEF
        EFEFEFEFEFEFEFEFEEEEEEA8A8A8A8A8A8A8A8A8F4F4F4BCBCBC808080EDEDED
        8C6400EDEDED8C6400CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC8C6400EDED
        ED8C6400EDEDED808080BCBCBCF6F6F6A8A8A8F6F6F6A8A8A8E4E4E4E4E4E4E4
        E4E4E4E4E4E4E4E4E4E4E4A8A8A8F6F6F6A8A8A8F6F6F6BCBCBC808080F0F0F0
        8C6400F0F0F08C64008C64008C64008C64008C64008C64008C64008C6400F0F0
        F08C6400F0F0F0808080BCBCBCF7F7F7A8A8A8F7F7F7A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8A8A8A8F7F7F7A8A8A8F7F7F7BCBCBC808080F3F3F3
        8C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF8C6400F3F3F3808080BCBCBCF8F8F8A8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8F8F8F8BCBCBC808080F6F6F6
        8C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B00D6FFFFFF29A40029A400FFFF
        FF8C6400F6F6F6808080BCBCBCFAFAFAA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFACACACFFFFFFBEBEBEBEBEBEFFFFFFA8A8A8FAFAFABCBCBC808080F9F8F8
        8C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF8C6400F9F8F8808080BCBCBCFBFBFBA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8FBFBFBBCBCBC808080FCFCFB
        8C64008C64008C64008C64008C64008C64008C64008C64008C64008C64008C64
        008C6400FCFCFB808080BCBCBCFEFEFEA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8FEFEFEBCBCBC808080FEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE808080BCBCBCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBCBCBC808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC}
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
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC808080DCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDDDDCDDDCDCDCDCDCDC
        DCDCDCDCDCDCDD808080BCBCBCEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDBCBCBC808080DEDFDE
        8C64008C64008C64008C64008C64008C64008C6400DEDFDEDEDEDFDFDEDEDEDF
        DEDFDFDEDFDFDF808080BCBCBCEEEEEEA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEBCBCBC808080E1E1E0
        8C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C6400E1E1E0E0E1E0E1E1E1E0E1
        E0E1E0E1E1E0E1808080BCBCBCEFEFEFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA8A8A8EFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFBCBCBC808080E3E3E3
        8C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C64008C64008C64008C64008C64
        008C6400E3E3E3808080BCBCBCF0F0F0A8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8F0F0F0BCBCBC808080E5E6E6
        8C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C6400FFFFFF8C6400FFFFFFFFFF
        FF8C6400E6E6E6808080BCBCBCF2F2F2A8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA8A8A8FFFFFFA8A8A8FFFFFFFFFFFFA8A8A8F2F2F2BCBCBC808080E8E8E9
        8C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C6400FFFFFF8C6400FFFFFFFFFF
        FF8C6400E9E8E8808080BCBCBCF3F3F3A8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA8A8A8FFFFFFA8A8A8FFFFFFFFFFFFA8A8A8F3F3F3BCBCBC808080EBEBEB
        8C64008C64008C64008C64008C64008C64008C6400FFFFFF8C6400FFFFFFFFFF
        FF8C6400EBEBEB808080BCBCBCF4F4F4A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8FFFFFFA8A8A8FFFFFFFFFFFFA8A8A8F4F4F4BCBCBC808080EDEDED
        EDEDEDEEEDEE8C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C6400FFFFFFFFFF
        FF8C6400EEEDEE808080BCBCBCF6F6F6F6F6F6F6F6F6A8A8A8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFA8A8A8FFFFFFFFFFFFA8A8A8F6F6F6BCBCBC808080F0F0F0
        F3F3F3F4F3F38C64008C64008C64008C64008C64008C64008C6400FFFFFFFFFF
        FF8C6400F0F0F0808080BCBCBCF7F7F7F8F8F8F8F8F8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8FFFFFFFFFFFFA8A8A8F7F7F7BCBCBC808080F3F3F3
        F3F3F3F4F3F38C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF8C6400F3F3F3808080BCBCBCF8F8F8F8F8F8F8F8F8A8A8A8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8F8F8F8BCBCBC808080F6F6F6
        F6F6F6F6F6F68C64008C64008C64008C64008C64008C64008C64008C64008C64
        008C6400F6F6F6808080BCBCBCFAFAFAFAFAFAFAFAFAA8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8FAFAFABCBCBC808080F9F8F8
        F9F8F8F9F8F98C6400F0C47AF0C47AF0C47AF0C47AF0C47AF0C47AF0C47AF0C4
        7A8C6400F9F9F8808080BCBCBCFBFBFBFBFBFBFBFBFBA8A8A8DADADADADADADA
        DADADADADADADADADADADADADADADADADAA8A8A8FCFCFCBCBCBC808080FCFCFB
        FCFCFBFBFBFC8C64008C64008C64008C64008C64008C64008C64008C64008C64
        008C6400FBFBFB808080BCBCBCFEFEFEFEFEFEFDFDFDA8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8FDFDFDBCBCBC808080FEFEFE
        FEFEFEFDFEFEFCFBFCFBFBFBFBFBFCFCFBFCFCFBFBFBFBFBFCFCFBFCFBFBFBFC
        FCFBFBFBFEFEFE808080BCBCBCFEFEFEFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFEFEFEFDFDFDFEFEFEFDFDFDFEFEFEBCBCBC808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC}
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
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC808080DCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDC808080BCBCBCEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
        EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDBCBCBC808080DEDFDE
        8C6400DEDFDE8C6400DEDFDEDEDFDEDEDFDEDEDFDE8C6400DEDFDE8C6400DEDF
        DE8C6400DEDFDE808080BCBCBCEEEEEEA8A8A8EEEEEEA8A8A8EEEEEEEEEEEEEE
        EEEEEEEEEEA8A8A8EEEEEEA8A8A8EEEEEEA8A8A8EEEEEEBCBCBC808080E1E1E0
        8C64008C64008C6400E1E1E08C64008C6400E1E1E08C64008C64008C64008C64
        008C6400E1E1E0808080BCBCBCEFEFEFA8A8A8A8A8A8A8A8A8EFEFEFA8A8A8A8
        A8A8EFEFEFA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8EFEFEFBCBCBC808080E3E3E3
        E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
        E3E3E3E3E3E3E3808080BCBCBCF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0BCBCBC808080E5E6E6
        E5E6E6E5E6E6E5E6E6E5E6E68C64008C64008C64008C64008C64008C64008C64
        008C6400E5E6E6808080BCBCBCF2F2F2F2F2F2F2F2F2F2F2F2F2F2F2A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8F2F2F2BCBCBC808080E8E8E9
        E8E8E9E8E8E9E8E8E9E8E8E98C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF8C6400E8E8E9808080BCBCBCF3F3F3F3F3F3F3F3F3F3F3F3F3F3F3A8A8A8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8F3F3F3BCBCBC808080EBEBEB
        8C64008C64008C6400EBEBEB8C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF8C6400EBEBEB808080BCBCBCF4F4F4A8A8A8A8A8A8A8A8A8F4F4F4A8A8A8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8F4F4F4BCBCBC808080EDEDED
        8C64008C64008C6400EDEDED8C64008C64008C64008C64008C64008C64008C64
        008C6400EDEDED808080BCBCBCF6F6F6A8A8A8A8A8A8A8A8A8F6F6F6A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8F6F6F6BCBCBC808080F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0808080BCBCBCF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7BCBCBC808080F3F3F3
        F3F3F3F3F3F3F3F3F3F3F3F38C64008C64008C64008C64008C64008C64008C64
        008C6400F3F3F3808080BCBCBCF8F8F8F8F8F8F8F8F8F8F8F8F8F8F8A8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8F8F8F8BCBCBC808080F6F6F6
        F6F6F6F6F6F6F6F6F6F6F6F68C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF8C6400F6F6F6808080BCBCBCFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAA8A8A8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8FAFAFABCBCBC808080F9F8F8
        8C64008C64008C6400F9F8F88C6400FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF8C6400F9F8F8808080BCBCBCFBFBFBA8A8A8A8A8A8A8A8A8FBFBFBA8A8A8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8FBFBFBBCBCBC808080FCFCFB
        8C64008C64008C6400FCFCFB8C64008C64008C64008C64008C64008C64008C64
        008C6400FCFCFB808080BCBCBCFEFEFEA8A8A8A8A8A8A8A8A8FEFEFEA8A8A8A8
        A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8FEFEFEBCBCBC808080FEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFE808080BCBCBCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBCBCBC808080808080
        8080808080808080808080808080808080808080808080808080808080808080
        80808080808080808080BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC
        BCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBC}
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
        26040000424D2604000000000000360000002800000012000000120000000100
        180000000000F003000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000006666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        66666666660000000000000000666666DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDD666666000000
        0000000000666666DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDE
        DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDFDFDF6666660000000000000000666666
        E1E1E08B50298B50298B50298B50298B50298B5029E1E1E0E1E1E0E1E1E0E1E1
        E0E1E1E0E1E1E0E1E0E16666660000000000000000666666E3E3E34E2D174E2D
        174E2D174E2D174E2D174E2D17E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
        E3E36666660000000000000000666666E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5
        E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E5E6E6E6E6E6666666000000
        0000000000666666E8E8E9E8E8E9E8E8E9E8E8E9E8E8E9E8E8E9E8E8E9E8E8E9
        2600BD2600BDE8E8E92600BD2600BDE9E8E86666660000000000000000666666
        EBEBEB0D76E60D76E60D76E60D76E60D76E60D76E6EBEBEBEBEBEB2300AC2300
        AC2200ACEBEBEBEBEBEB6666660000000000000000666666EDEDED154CDE154C
        DE154CDE154CDE154CDE154CDEEDEDEDEDEDED1C008D1C008D1C008DEDEDEDEE
        EDEE6666660000000000000000666666F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F01C008D1C008DF0F0F01C008D1C008DF0F0F0666666000000
        0000000000666666F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
        F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F36666660000000000000000666666
        F6F6F68B50298B50298B50298B50298B50298B5029F6F6F6F6F6F6F6F6F6F6F6
        F6F6F6F6F6F6F6F6F6F66666660000000000000000666666F9F8F84E2D174E2D
        174E2D174E2D174E2D174E2D17F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9
        F9F86666660000000000000000666666FCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFC
        FCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFCFCFBFBFBFB666666000000
        0000000000666666FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE6666660000000000000000666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666600000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000}
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
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000230B0000230B00000000000000000000C0C0C0C0C0C0
        C0C0C0C0C0C0868686000000AA002AAA002A0000000000000000000000000000
        00000000000000000000C0C0C0C0C0C0000000000000000000000000AA7F2AFF
        DF2AFF7F00AA002ACCCCCCCCCCCCCCCCCCCCCCCCCCCCCC000000C0C0C0000000
        AA5F2AAA7F2AAA7F2AAA7F2AFF7F00FFFF66FFFFAAFF7F00AA002A99FFFFFFFF
        FF99FFFFCCCCCC000000000000AA5F2AAA7F2AFF9F00FFBF55FFBF55FFDF2AFF
        FFAAFFFFCCFFFFCCFF7F00CC3300009FD4FFFFFFCCCCCC000000000000AA7F2A
        FF9F00AA5F2AAA5F2AFF7F00FF7F00FFFF66FFFFAAAA002AAA002A99FFFFFFFF
        FF99FFFFCCCCCC000000AA5F2AFF9F00AA5F2ACCCCCC868686FFFFFFFF7F00FF
        DF2AAA002A009FD4009FD4009FD4009FD4FFFFFFCCCCCC000000AA5F2AFF9F00
        AA5F2AFFFFFF868686FFFFFFFF7F00AA002AFFFFFF99FFFFFFFFFF99FFFFFFFF
        FF99FFFFCCCCCC000000AA5F55AA7F55AA5F5599FFFF868686FFFFFF99FFFF00
        9FD4009FD4009FD4009FD4009FD4009FD4FFFFFFCCCCCC000000868686FFFFFF
        99FFFF993300868686FFFFFFFFFFFF99FFFFFFFFFF99FFFFFFFFFF99FFFFFFFF
        FFCCCCCCCCCCCC000000868686FFFFFFFFFFFFFFFFFF868686FFFFFFFFFFFF00
        9FD4009FD4009FD4009FD499FFFF000000000000000000000000868686FFFFFF
        99FFFF993300868686FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99FFFFFFFFFF8686
        86FFFFFF000000C0C0C0868686FFFFFFFFFFFF99FFFF868686FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF868686000000C0C0C0C0C0C0868686FFFFFF
        FFFFFF9933008686868686868686868686868686868686868686868686868686
        86C0C0C0C0C0C0C0C0C0868686FFFFFFFFFFFFFFFFFF99FFFFFFFFFFFFFFFF99
        FFFF868686FFFFFF000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0868686FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868686000000C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C086868686868686868686868686868686868686868686
        8686868686C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
      OnClick = BSpeedButtonSortClick
    end
    object BSpeedButtonFind: TMSpeedButton
      Left = 457
      Top = 2
      Width = 79
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
    object Image_Fusen_Blue: TImage
      Left = 720
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
    object Image_Fusen_Red: TImage
      Left = 704
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
    object Image_Fusen_Green: TImage
      Left = 736
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
      Left = 752
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
      Left = 768
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
    object BSpeedButtonWF: TMSpeedButton
      Left = 538
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
      OnClick = BSpeedButtonWFClick
    end
    object Image_Goukei: TImage
      Left = 692
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
    object Image_Jitsuzai: TImage
      Left = 787
      Top = 1
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
    object LVStyleBar: TMToolBar
      Left = 650
      Top = 1
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
    object MPnlCount: TMPanel
      Left = 804
      Top = 0
      Width = 139
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 1
      object LblRecCntChild: TMLabel
        Left = 67
        Top = 1
        Width = 48
        Height = 22
        Alignment = taRightJustify
        AutoSize = False
        Caption = '999999'
        Color = clBtnFace
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentColor = False
        ParentFont = False
        BorderLine = tmb3DDown
        FontRatio.Auto = False
      end
      object MLabel16: TMLabel
        Left = 10
        Top = 2
        Width = 57
        Height = 18
        AutoSize = False
        Caption = #30331#37682#20214#25968
        FontRatio.Auto = False
      end
      object MLabel17: TMLabel
        Left = 119
        Top = 2
        Width = 16
        Height = 18
        AutoSize = False
        Caption = #20214
        FontRatio.Auto = False
      end
    end
  end
  object PPanelTree: TMPanel
    Left = 0
    Top = 25
    Width = 180
    Height = 584
    Align = alLeft
    BevelOuter = bvNone
    Color = 14608367
    ParentBackground = False
    TabOrder = 1
    object VTreeView: TMTreeView
      Left = 0
      Top = 0
      Width = 180
      Height = 584
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
  object MPanel3: TMPanel
    Left = 0
    Top = 609
    Width = 943
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    object MSPFunctionBar: TMSPFunctionBar
      Left = 0
      Top = 0
      Width = 943
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
      ButtonWidth = 117
      OnFunctionClick = MSPFunctionBarFunctionClick
      SysBaseColorB = 10841658
      SysBaseColorD = 6956042
    end
    object SStatusBar: TMStatusBar
      Left = 0
      Top = 21
      Width = 943
      Height = 19
      Color = 15921906
      Panels = <>
      SimplePanel = True
    end
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 27
      Width = 224
      Height = 9
      Max = 0
      Smooth = True
      TabOrder = 2
      Visible = False
    end
  end
  object JHojyoMA_DMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = JHojyoMA_DMemDataBeforePost
    AfterPost = JHojyoMA_DMemDataAfterPost
    Left = 69
    Top = 34
    object JHojyoMA_DMemDataFusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object JHojyoMA_DMemDataFusenIndex: TIntegerField
      FieldName = 'FusenIndex'
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
      FieldName = 'RenChar'
      Size = 12
    end
    object JHojyoMA_DMemDataLongName: TStringField
      DisplayWidth = 80
      FieldName = 'LongName'
      Size = 80
    end
    object JHojyoMA_DMemDataSimpleName: TStringField
      FieldName = 'SimpleName'
    end
    object JHojyoMA_DMemDataNCode: TFloatField
      FieldName = 'NCODE'
    end
    object JHojyoMA_DMemDataTKBN: TStringField
      FieldName = 'TKBN'
      Size = 2
    end
    object JHojyoMA_DMemDataSKBN: TStringField
      FieldName = 'SKBN'
      Size = 2
    end
    object JHojyoMA_DMemDataSyokuchiKbn: TIntegerField
      FieldName = 'SyokuchiKbn'
    end
    object JHojyoMA_DMemDataSHojyoKbn1: TStringField
      FieldName = 'SHojyoKbn1'
    end
    object JHojyoMA_DMemDataSHojyoKbn2: TStringField
      FieldName = 'SHojyoKbn2'
    end
    object JHojyoMA_DMemDataSHojyoKbn3: TStringField
      FieldName = 'SHojyoKbn3'
    end
    object JHojyoMA_DMemDataHoujinKbn: TStringField
      FieldName = 'HoujinKbn'
      Size = 1
    end
    object JHojyoMA_DMemDataHoujinNo: TStringField
      FieldName = 'HoujinNo'
      Size = 13
    end
    object JHojyoMA_DMemDataKojinKey: TStringField
      FieldName = 'KojinKey'
      Size = 36
    end
  end
  object JHojyoMA_DDataSource: TDataSource
    DataSet = JHojyoMA_DMemData
    OnStateChange = JHojyoMA_DDataSourceStateChange
    Left = 41
    Top = 34
  end
  object TreeView_VImageList: TImageList
    Left = 78
    Top = 300
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
  object MTOKUI_DMQuery: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 205
    Top = 34
  end
  object PMKasantaikei: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PMKasantaikeiPopup
    Left = 52
    Top = 247
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
    Left = 106
    Top = 300
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
    Left = 134
    Top = 300
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
      5200523952005239520052395200523952000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AD7B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AD7B0000FFFF
      0000FFDE00000000000000000000000000000000000000000000000000000000
      7B005200AD00AD00FF00AD5AFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD7B0000FFFF0000FFFF
      0000FFFF0000FFDE0000FFDE0000AD7B0000523929000000000000000000AD00
      FF00AD7BFF00AD7BFF00AD5AFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFDE0000FFBD0000AD7B000052182900000000005200
      7B0052007B0052007B0052007B0052007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFF0000FFFF
      0000FFDE0000FFBD0000FFBD0000FFBD0000FFBD0000FFBD0000521829000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      0000FFBD00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFBD00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      5200523952005239520052395200523952000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FF00000000000000FF00000000000000
      FF00000000000000FF00000000000000FFFF000000000000E7FF000000000000
      C700000000000000800000000000000000000000000000000000000000000000
      801F000000000000C7FF000000000000E700000000000000FF00000000000000
      FF00000000000000FF00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80078007800780078003800380038003
      8001800180018001800180018001800180018001800180018001800180018001
      80018001800180018001800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PMTokui: TPopupMenu
    Alignment = paRight
    AutoHotkeys = maManual
    Images = ImageList3
    OnPopup = PMTokuiPopup
    Left = 24
    Top = 247
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
  end
  object MasterInfo_DMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 125
    Top = 34
    object MasterInfo_DMemDataJHojyoName: TStringField
      FieldName = 'JHojyoName'
    end
    object MasterInfo_DMemDataGHojyoName: TStringField
      FieldName = 'GHojyoName'
    end
    object MasterInfo_DMemDataCodeDigit: TIntegerField
      FieldName = 'CodeDigit'
    end
    object MasterInfo_DMemDataCodeAttr: TIntegerField
      FieldName = 'CodeAttr'
    end
    object MasterInfo_DMemDataMstrKbn26: TIntegerField
      FieldName = 'MstrKbn26'
    end
  end
  object imgFusen: TImageList
    Left = 22
    Top = 299
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
    Left = 50
    Top = 299
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
    Left = 412
    Top = 243
    object R1: TMenuItem
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
  object MemPtnJitsuzai: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 25
    Top = 145
    object MemPtnJitsuzaiFusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object MemPtnJitsuzaiGCode: TStringField
      FieldName = 'GCode'
      Size = 16
    end
    object MemPtnJitsuzaiHojyoKbn: TStringField
      FieldName = 'HojyoKbn'
      Size = 38
    end
    object MemPtnJitsuzaiRenso: TStringField
      FieldName = 'Renso'
      Size = 12
    end
    object MemPtnJitsuzaiNmk: TStringField
      FieldName = 'Nmk'
    end
    object MemPtnJitsuzaiNm: TStringField
      DisplayWidth = 80
      FieldName = 'Nm'
      Size = 80
    end
    object MemPtnJitsuzaiPostNo1: TStringField
      FieldName = 'PostNo1'
      Size = 3
    end
    object MemPtnJitsuzaiPostNo2: TStringField
      FieldName = 'PostNo2'
    end
    object MemPtnJitsuzaiAds1: TStringField
      FieldName = 'Ads1'
      Size = 60
    end
    object MemPtnJitsuzaiAds2: TStringField
      FieldName = 'Ads2'
      Size = 60
    end
    object MemPtnJitsuzaiDHyoNm1: TStringField
      FieldName = 'DHyoNm1'
    end
    object MemPtnJitsuzaiDHyoNm2: TStringField
      FieldName = 'DHyoNm2'
    end
    object MemPtnJitsuzaiTel1: TStringField
      FieldName = 'Tel1'
    end
    object MemPtnJitsuzaiTel2: TStringField
      FieldName = 'Tel2'
    end
    object MemPtnJitsuzaiFax1: TStringField
      FieldName = 'Fax1'
    end
    object MemPtnJitsuzaiShihonKin: TFloatField
      FieldName = 'ShihonKin'
    end
    object MemPtnJitsuzaiSyainSu: TFloatField
      FieldName = 'SyainSu'
    end
    object MemPtnJitsuzaiNensyo: TFloatField
      FieldName = 'Nensyo'
    end
    object MemPtnJitsuzaiTStartDate: TStringField
      FieldName = 'TStartDate'
      Size = 10
    end
    object MemPtnJitsuzaiTEndDate: TStringField
      FieldName = 'TEndDate'
      Size = 10
    end
    object MemPtnJitsuzaiRCloseDay1: TSmallintField
      FieldName = 'RCloseDay1'
    end
    object MemPtnJitsuzaiRCloseDay2: TSmallintField
      FieldName = 'RCloseDay2'
    end
    object MemPtnJitsuzaiRCloseDay3: TSmallintField
      FieldName = 'RCloseDay3'
    end
    object MemPtnJitsuzaiRcvDay1: TSmallintField
      FieldName = 'RcvDay1'
    end
    object MemPtnJitsuzaiRcvDay2: TSmallintField
      FieldName = 'RcvDay2'
    end
    object MemPtnJitsuzaiRcvDay3: TSmallintField
      FieldName = 'RcvDay3'
    end
    object MemPtnJitsuzaiRcvMonth1: TSmallintField
      FieldName = 'RcvMonth1'
    end
    object MemPtnJitsuzaiRcvMonth2: TSmallintField
      FieldName = 'RcvMonth2'
    end
    object MemPtnJitsuzaiRcvMonth3: TSmallintField
      FieldName = 'RcvMonth3'
    end
    object MemPtnJitsuzaiRHolidayKbn1: TSmallintField
      FieldName = 'RHolidayKbn1'
    end
    object MemPtnJitsuzaiRHolidayKbn2: TSmallintField
      FieldName = 'RHolidayKbn2'
    end
    object MemPtnJitsuzaiRHolidayKbn3: TSmallintField
      FieldName = 'RHolidayKbn3'
    end
    object MemPtnJitsuzaiPCloseDay1: TSmallintField
      FieldName = 'PCloseDay1'
    end
    object MemPtnJitsuzaiPCloseDay2: TSmallintField
      FieldName = 'PCloseDay2'
    end
    object MemPtnJitsuzaiPCloseDay3: TSmallintField
      FieldName = 'PCloseDay3'
    end
    object MemPtnJitsuzaiPayDay1: TSmallintField
      FieldName = 'PayDay1'
    end
    object MemPtnJitsuzaiPayDay2: TSmallintField
      FieldName = 'PayDay2'
    end
    object MemPtnJitsuzaiPayDay3: TSmallintField
      FieldName = 'PayDay3'
    end
    object MemPtnJitsuzaiPayMonth1: TSmallintField
      FieldName = 'PayMonth1'
    end
    object MemPtnJitsuzaiPayMonth2: TSmallintField
      FieldName = 'PayMonth2'
    end
    object MemPtnJitsuzaiPayMonth3: TSmallintField
      FieldName = 'PayMonth3'
    end
    object MemPtnJitsuzaiPHolidayKbn1: TSmallintField
      FieldName = 'PHolidayKbn1'
    end
    object MemPtnJitsuzaiPHolidayKbn2: TSmallintField
      FieldName = 'PHolidayKbn2'
    end
    object MemPtnJitsuzaiHPAddress: TStringField
      FieldName = 'HPAddress'
      Size = 100
    end
    object MemPtnJitsuzaiTRRZuiSSite: TIntegerField
      FieldName = 'TRRZuiSSite'
    end
    object MemPtnJitsuzaiTRRHolidayKbn: TSmallintField
      FieldName = 'TRRHolidayKbn'
    end
    object MemPtnJitsuzaiTRRHolidayName: TStringField
      FieldName = 'TRRHolidayName'
    end
    object MemPtnJitsuzaiSRRZuiSSite: TIntegerField
      FieldName = 'SRRZuiSSite'
    end
    object MemPtnJitsuzaiSRRHolidayKbn: TSmallintField
      FieldName = 'SRRHolidayKbn'
    end
    object MemPtnJitsuzaiSRRHolidayName: TStringField
      FieldName = 'SRRHolidayName'
    end
    object MemPtnJitsuzaiRcvMonth1Name: TStringField
      FieldName = 'RcvMonth1Name'
    end
    object MemPtnJitsuzaiRcvMonth2Name: TStringField
      FieldName = 'RcvMonth2Name'
    end
    object MemPtnJitsuzaiRcvMonth3Name: TStringField
      FieldName = 'RcvMonth3Name'
    end
    object MemPtnJitsuzaiRHolidayKbn1Name: TStringField
      FieldName = 'RHolidayKbn1Name'
    end
    object MemPtnJitsuzaiRHolidayKbn2Name: TStringField
      FieldName = 'RHolidayKbn2Name'
    end
    object MemPtnJitsuzaiRHolidayKbn3Name: TStringField
      FieldName = 'RHolidayKbn3Name'
    end
    object MemPtnJitsuzaiPayMonth1Name: TStringField
      FieldName = 'PayMonth1Name'
    end
    object MemPtnJitsuzaiPayMonth2Name: TStringField
      FieldName = 'PayMonth2Name'
    end
    object MemPtnJitsuzaiPayMonth3Name: TStringField
      FieldName = 'PayMonth3Name'
    end
    object MemPtnJitsuzaiPHolidayKbn1Name: TStringField
      FieldName = 'PHolidayKbn1Name'
    end
    object MemPtnJitsuzaiPHolidayKbn2Name: TStringField
      FieldName = 'PHolidayKbn2Name'
    end
    object MemPtnJitsuzaiPHolidayKbn3Name: TStringField
      FieldName = 'PHolidayKbn3Name'
    end
    object MemPtnJitsuzaiUpdDateTM: TStringField
      FieldName = 'UpdDateTM'
    end
    object MemPtnJitsuzaiPHolidayKbn3: TSmallintField
      FieldName = 'PHolidayKbn3'
    end
    object MemPtnJitsuzaiTRRTSEINO: TStringField
      FieldName = 'TRRTSEINO'
      Size = 4
    end
    object MemPtnJitsuzaiSRRTSEINO: TStringField
      FieldName = 'SRRTSEINO'
      Size = 4
    end
    object MemPtnJitsuzaiTSAIYOU: TStringField
      FieldName = 'TSAIYOU'
    end
    object MemPtnJitsuzaiSSAIYOU: TStringField
      FieldName = 'SSAIYOU'
    end
    object MemPtnJitsuzaiSisanHojyoKbn1: TStringField
      FieldName = 'SisanHojyoKbn1'
    end
    object MemPtnJitsuzaiSisanHojyoKbn2: TStringField
      FieldName = 'SisanHojyoKbn2'
    end
    object MemPtnJitsuzaiSisanHojyoKbn3: TStringField
      FieldName = 'SisanHojyoKbn3'
    end
    object MemPtnJitsuzaiSisan: TStringField
      FieldName = 'Sisan'
      Size = 22
    end
    object MemPtnJitsuzaiFkana: TStringField
      DisplayWidth = 40
      FieldName = 'Fkana'
      Size = 40
    end
    object MemPtnJitsuzaiKeisyokbn: TStringField
      FieldName = 'Keisyokbn'
    end
    object MemPtnJitsuzaiGyoGcode: TStringField
      FieldName = 'GyoGcode'
    end
    object MemPtnJitsuzaiGyoNMK: TStringField
      DisplayWidth = 40
      FieldName = 'GyoNMK'
      Size = 40
    end
    object MemPtnJitsuzaiMYNHoujinKojinKbnNm: TStringField
      FieldName = 'MYNHoujinKojinKbnNm'
    end
    object MemPtnJitsuzaiMYNHoujinKojinNo: TStringField
      FieldName = 'MYNHoujinKojinNo'
    end
  end
  object KanaCtl: TMFurigana
    OnCompositionStr = KanaCtlCompositionStr
    Left = 25
    Top = 199
  end
  object aclExec: TActionList
    Left = 53
    Top = 199
    object FreeSetMtokui: TAction
      Category = 'Function'
      Caption = #65420#65432#65392#38917#30446
      OnExecute = FreeSetMtokuiExecute
    end
    object FindMTokui: TAction
      Category = 'Function'
      Caption = 'FindMTokui'
      OnExecute = FindMtokuiExecute
    end
    object CopyMtokui: TAction
      Category = 'Function'
      Caption = 'CopyMtokui'
      OnExecute = CopyMtokuiExecute
    end
  end
  object StdProc7: TFDStoredProc
    StoredProcName = 'PRC_MA0130_013'
    Left = 101
    Top = 86
    ParamData = <
      item
        Name = '@pTRNCD'
        DataType = ftLargeint
        ParamType = ptInput
      end
      item
        Name = '@RET_S'
        DataType = ftInteger
        ParamType = ptInputOutput
      end
      item
        Name = '@RET_ZANHAS'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object StdProc7_S: TFDStoredProc
    StoredProcName = 'PRC_MA0150_013'
    Left = 73
    Top = 86
    ParamData = <
      item
        Name = '@pTRNCD'
        DataType = ftLargeint
        ParamType = ptInput
      end
      item
        Name = '@RET_S'
        DataType = ftInteger
        ParamType = ptInputOutput
      end
      item
        Name = '@RET_ZANHAS'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object StdProc1: TFDStoredProc
    StoredProcName = 'PRC_MA0130_010'
    Left = 45
    Top = 86
    ParamData = <
      item
        Name = '@pTRNCD'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object StdProc1_S: TFDStoredProc
    StoredProcName = 'PRC_MA0150_010'
    Left = 17
    Top = 86
    ParamData = <
      item
        Name = '@pTRNCD'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object StdProc4: TFDStoredProc
    StoredProcName = 'PRC_MA0130_103'
    Left = 129
    Top = 86
    ParamData = <
      item
        Name = '@pTRNCD'
        DataType = ftLargeint
        ParamType = ptInput
      end
      item
        Name = '@pSEIKBN_B'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@pSEIKBN_A'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptInputOutput
      end
      item
        Name = '@RETMSG'
        DataType = ftString
        ParamType = ptInputOutput
      end>
  end
  object StdProc4_S: TFDStoredProc
    StoredProcName = 'PRC_MA0150_103'
    Left = 157
    Top = 86
    ParamData = <
      item
        Name = '@pTRNCD'
        DataType = ftLargeint
        ParamType = ptInput
      end
      item
        Name = '@pSEIKBN_B'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@pSEIKBN_A'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptInputOutput
      end
      item
        Name = '@RETMSG'
        DataType = ftString
        ParamType = ptInputOutput
      end>
  end
  object MemPtnSegBun: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 53
    Top = 145
    object CmnMemDataPrintSystemstrExCode: TStringField
      Alignment = taRightJustify
      FieldName = 'strExCodeDst'
      Size = 16
    end
    object CmnMemDataPrintSystemstrName: TStringField
      DisplayWidth = 80
      FieldName = 'strNameSimpleDst'
      Size = 80
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
    object CmnMemDataPrintSystemdtStart: TStringField
      FieldName = 'dtStart'
    end
    object CmnMemDataPrintSystemdtEnd: TStringField
      FieldName = 'dtEnd'
    end
  end
  object MemPtnGoukei: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 85
    Top = 145
    object MemPtnGoukeigrTag: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object MemPtnGoukeistrExCode: TStringField
      DisplayWidth = 16
      FieldName = 'strExCode'
      Size = 16
    end
    object MemPtnGoukeistrName: TStringField
      DisplayWidth = 80
      FieldName = 'strName'
      Size = 80
    end
    object MemPtnGoukeistrNameSimple: TStringField
      FieldName = 'strNameSimple'
    end
    object MemPtnGoukeistrAssociation: TStringField
      FieldName = 'strAssociation'
      Size = 10
    end
    object MemPtnGoukeistrAddress: TStringField
      FieldName = 'strAddress'
      Size = 60
    end
    object MemPtnGoukeinZipCodeUpper: TIntegerField
      FieldName = 'nZipCodeUpper'
    end
    object MemPtnGoukeinZipCodeLower: TIntegerField
      FieldName = 'nZipCodeLower'
    end
    object MemPtnGoukeiTSAIYOU: TStringField
      FieldName = 'TSAIYOU'
    end
    object MemPtnGoukeiSSAIYOU: TStringField
      FieldName = 'SSAIYOU'
    end
    object MemPtnGoukeiKSAIYOU: TStringField
      FieldName = 'KSAIYOU'
    end
    object MemPtnGoukeiBSAIYOU: TStringField
      FieldName = 'BSAIYOU'
    end
    object MemPtnGoukeiRSAIYOU: TStringField
      FieldName = 'RSAIYOU'
    end
  end
  object MemPtnKasan: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 109
    Top = 145
    object MemPtnKasanstrExCodeDst: TStringField
      Alignment = taRightJustify
      FieldName = 'strExCodeDst'
      Size = 16
    end
    object MemPtnKasanstrExCodeSrc: TStringField
      Alignment = taRightJustify
      FieldName = 'strExCodeSrc'
      Size = 16
    end
    object MemPtnKasanstrNameSimpleDst: TStringField
      FieldName = 'strNameSimpleDst'
    end
    object MemPtnKasanstrNameSimpleSrc: TStringField
      FieldName = 'strNameSimpleSrc'
    end
  end
  object SPMasTori: TFDStoredProc
    StoredProcName = 'MP_MAS_CHK_MTOKUI'
    Left = 11
    Top = 359
    ParamData = <
      item
        Name = '@p_NCode'
        DataType = ftInteger
        ParamType = ptInput
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
      end>
  end
  object SPPayTori: TFDStoredProc
    StoredProcName = 'MP_PAY_CHK_MTOKUI'
    Left = 67
    Top = 359
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
        ParamType = ptInput
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
      end>
  end
  object SPCrdTori: TFDStoredProc
    StoredProcName = 'MP_CRD_CHK_MTOKUI'
    Left = 123
    Top = 360
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftInteger
        ParamType = ptInput
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
      end>
  end
  object SPDepTori: TFDStoredProc
    StoredProcName = 'MP_DEP_CHK_MTOKUI'
    Left = 39
    Top = 359
    ParamData = <
      item
        Name = '@p_NCode'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@p_RetCd'
        DataType = ftInteger
        ParamType = ptInputOutput
      end
      item
        Name = '@p_errMsg'
        DataType = ftString
        ParamType = ptInputOutput
      end>
  end
  object SPSelTori: TFDStoredProc
    StoredProcName = 'MP_SEL_CHK_MTOKUI'
    Left = 95
    Top = 359
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
        ParamType = ptInput
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
      end>
  end
  object memFsn: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 16
    Top = 401
    object memFsnCode: TStringField
      FieldName = 'Code'
    end
    object memFsnCmnt: TStringField
      FieldName = 'Cmnt'
      Size = 300
    end
  end
  object StoredProc10: TFDStoredProc
    StoredProcName = 'MP_MAS_DEL_MTOKUI'
    Left = 17
    Top = 114
    ParamData = <
      item
        Name = '@p_NCode'
        DataType = ftInteger
        ParamType = ptInput
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
      end>
  end
  object MP_DEP_CHK_MTOKUI_Saiyo: TFDStoredProc
    StoredProcName = 'MP_DEP_CHK_MTOKUI_SAIYO'
    Left = 152
    Top = 361
    ParamData = <
      item
        Name = '@p_NCode'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@p_RetCd1'
        DataType = ftInteger
        ParamType = ptInputOutput
      end
      item
        Name = '@p_RetCd2'
        DataType = ftInteger
        ParamType = ptInputOutput
      end
      item
        Name = '@p_RetCd3'
        DataType = ftInteger
        ParamType = ptInputOutput
      end
      item
        Name = '@p_ErrMsg'
        DataType = ftString
        ParamType = ptInputOutput
      end>
  end
  object MP_BIL_DEL_MTOKUI: TFDStoredProc
    StoredProcName = 'MP_BIL_DEL_MTOKUI'
    Left = 48
    Top = 120
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftInteger
        ParamType = ptInput
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
        DataType = ftByte
        ParamType = ptInput
      end
      item
        Name = '@pTanNCode'
        DataType = ftLargeint
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
        DataType = ftByte
        ParamType = ptInput
      end
      item
        Name = '@pTanNCode'
        DataType = ftLargeint
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
  object SPDenChkSEL: TFDStoredProc
    StoredProcName = 'MP_SEL_CHK_TRAN_EXCLUDING_TEKIYO'
    Left = 56
    Top = 405
    ParamData = <
      item
        Name = '@NCODE'
        DataType = ftLargeint
        ParamType = ptInput
      end
      item
        Name = '@TSTARTDATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = '@TENDDATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = '@RetCd'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object SPDenChkMAS: TFDStoredProc
    StoredProcName = 'MP_MAS_CHK_TRAN_EXCLUDING_TEKIYO'
    Left = 92
    Top = 405
    ParamData = <
      item
        Name = '@p_nNCode'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@p_dStartDate'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = '@p_dEndDate'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = '@p_Ret'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object dsKasanParent: TDataSource
    DataSet = MemKasanParent
    Left = 181
    Top = 554
  end
  object MemKasanParent: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 215
    Top = 557
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
    Left = 179
    Top = 588
  end
  object MemKasanChild: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = MemDataBeforePost
    AfterPost = MemDataAfterPost
    Left = 209
    Top = 589
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
    Left = 110
    Top = 248
    object TPInsert: TMenuItem
      Caption = #25407#20837
      OnClick = BSpeedButtonInsClick
    end
    object TPDelChild: TMenuItem
      Caption = #21152#31639#12375#12394#12356
      OnClick = BSpeedButtonClick
    end
  end
  object CopyMtokuiProc: TFDStoredProc
    StoredProcName = 'MP_MTOKUICOPY_BASE'
    Left = 32
    Top = 501
    ParamData = <
      item
        Name = '@p_FR_MstNo'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@p_TO_MstNo'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@p_TantoNcd'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptInputOutput
      end
      item
        Name = '@RETMSG'
        DataType = ftString
        ParamType = ptInputOutput
      end>
  end
end
