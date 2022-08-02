object JNTCRP004005F: TJNTCRP004005F
  Left = 255
  Top = 162
  BorderStyle = bsNone
  Caption = #20661#21209#24773#22577'('#946#29256')'
  ClientHeight = 567
  ClientWidth = 945
  Color = 15921906
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object ScrollBox_Main: TScrollBox
    Left = 0
    Top = 0
    Width = 945
    Height = 487
    HorzScrollBar.Smooth = True
    VertScrollBar.Increment = 46
    Align = alClient
    BiDiMode = bdLeftToRight
    BorderStyle = bsNone
    Color = 15921906
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object DtlCsMainPanel: TMPanel
      Left = 0
      Top = 0
      Width = 945
      Height = 487
      Align = alClient
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 0
      object HedCsTab: TMTab
        Left = 0
        Top = 0
        Width = 945
        Height = 50
        Items = <
          item
            Caption = #12288#23455#22312#12288
            Color = 16766672
            SyncControl = DtlCsSub01Panel
            Alignment = taCenter
            ImageIndex = -1
            ParentBorderCaption = True
          end
          item
            Caption = #12288#21512#35336#12288
            Color = 16766672
            SyncControl = DtlCsSub01Panel
            Alignment = taCenter
            ImageIndex = -1
            ParentBorderCaption = True
          end
          item
            Caption = ' '#21517#23492#12379' '
            Color = 16766672
            SyncControl = DtlCsSub02Panel
            Alignment = taCenter
            ImageIndex = -1
            ParentBorderCaption = True
          end
          item
            Caption = ' '#36890#30693#26360#21517#23492#12379' '
            Color = 16766672
            SyncControl = DtlCsSub02Panel
            Alignment = taCenter
            ImageIndex = -1
            ParentBorderCaption = True
          end>
        Align = alTop
        TabOrder = 0
        OnChange = HedCsTabChange
        ItemWidth = 0
        ItemHeight = 0
        ItemMargin = 6
        Style = tsCrystal
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        BorderHeight = 20
        BorderFont.Charset = SHIFTJIS_CHARSET
        BorderFont.Color = clWindowText
        BorderFont.Height = -12
        BorderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BorderFont.Style = []
        BorderCaptionAlign = taLeftJustify
        DropShadow = False
      end
      object HedPanel: TMPanel
        Left = 0
        Top = 50
        Width = 945
        Height = 28
        Align = alTop
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 1
        object LblTRCODE: TMLabel
          Left = 16
          Top = 2
          Width = 129
          Height = 19
          AutoSize = False
          Caption = #24471#24847#20808#65402#65392#65412#65438
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = True
        end
        object f0CODE: TMTxtEdit
          Tag = 22
          Left = 149
          Top = 2
          Width = 167
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
          Text = 'X(10)----X'
          OnEnter = fnEnter
          OnExit = f0CODEExit
          ValidChars = ''
        end
        object f1NAME: TMTxtEdit
          Left = 339
          Top = 2
          Width = 430
          Height = 19
          TabStop = False
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          Color = 15921906
          Enabled = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ImeMode = imHira
          MaxLength = 40
          FontRatio.Auto = True
          ParentFont = False
          TabOrder = 1
          Text = 'X(60)------------------------------------------------------X'
          ValidChars = ''
        end
        object TempMode: TPanel
          Left = 784
          Top = 3
          Width = 90
          Height = 19
          BevelOuter = bvLowered
          Caption = #12486#12531#12503#12524#12540#12488
          Color = clSilver
          Ctl3D = True
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
      end
      object DtlCsSub02Panel: TMPanel
        Left = 0
        Top = 78
        Width = 945
        Height = 409
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 3
        Visible = False
        DesignSize = (
          945
          409)
        object SeikyuKbnLabel2: TLabel
          Left = 700
          Top = 40
          Width = 120
          Height = 19
          AutoSize = False
          Caption = #35531#27714#21306#20998
          Color = 15921906
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ParentColor = False
          ParentFont = False
          Layout = tlCenter
          Visible = False
        end
        object SKYKBNNM2: TMLabel
          Left = 736
          Top = 64
          Width = 160
          Height = 19
          AutoSize = False
          Caption = 'X(20)----X---------X'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          Visible = False
          FontRatio.Auto = False
        end
        object NayoseOyaLabel2: TMLabel
          Left = 700
          Top = 92
          Width = 120
          Height = 19
          AutoSize = False
          Caption = #21517#23492#12379#35242#20195#26367#20181#20837#20808
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          Visible = False
          FontRatio.Auto = False
        end
        object NayoseNM2: TMLabel
          Left = 796
          Top = 116
          Width = 148
          Height = 19
          AutoSize = False
          Caption = 'X(20)----X---------X'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          Visible = False
          FontRatio.Auto = False
        end
        object MLabel24: TMLabel
          Left = 16
          Top = 15
          Width = 145
          Height = 19
          AutoSize = False
          Caption = #21517#23492#12379#35242#20181#20837#20808
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = True
        end
        object f2OyaName: TMLabel
          Left = 19
          Top = 60
          Width = 148
          Height = 19
          AutoSize = False
          Caption = 'X(20)----X---------X'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel27: TMLabel
          Left = 16
          Top = 91
          Width = 145
          Height = 19
          AutoSize = False
          Caption = #23376#20181#20837#20808
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = True
        end
        object f2KoName: TMLabel
          Left = 20
          Top = 140
          Width = 148
          Height = 19
          AutoSize = False
          Caption = 'X(20)----X---------X'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel28: TMLabel
          Left = 15
          Top = 5
          Width = 150
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel26: TMLabel
          Left = 15
          Top = 168
          Width = 150
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object GridNayose: TdxDBGrid
          Left = 191
          Top = 10
          Width = 500
          Height = 391
          Bands = <
            item
              Caption = #21517#23492#12379#35242#20181#20837#20808
            end
            item
              Caption = #23376#20181#20837#20808
            end
            item
              Visible = False
            end>
          DefaultLayout = False
          HeaderPanelRowCount = 1
          KeyField = 'BaseHojCode'
          SummaryGroups = <>
          SummarySeparator = ', '
          BorderStyle = bsNone
          TabOrder = 0
          OnEnter = NayoseEnter
          OnExit = NayoseExit
          OnKeyDown = CmnGridKeyDown
          OnKeyPress = evtGridNayoseKeyPress
          BandColor = 16766672
          DataSource = DSNayose
          HeaderColor = 16766672
          HideFocusRect = True
          HideSelection = True
          HighlightTextColor = clWindowText
          LookAndFeel = lfFlat
          Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
          OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoBandMoving, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
          ShowBands = True
          OnChangeColumn = GridNayoseChangeColumn
          OnChangeNodeEx = GridNayoseChangeNodeEx
          OnCustomDraw = GridNayoseCustomDraw
          OnBeforeChangeColumn = GridNayoseBeforeChangeColumn
          Anchors = [akLeft, akTop, akBottom]
          object GridNayoseCode: TdxDBGridButtonColumn
            Caption = #12467#12540#12489
            HeaderAlignment = taCenter
            Sizing = False
            Width = 100
            BandIndex = 1
            RowIndex = 0
            StretchChar.Auto = True
            FieldName = 'HojCode'
            OnEditButtonClick = GridClmBtnClick
          end
          object GridNayoseName: TdxDBGridColumn
            Caption = #21517#31216
            HeaderAlignment = taCenter
            ReadOnly = True
            Sizing = False
            TabStop = False
            Width = 135
            BandIndex = 1
            RowIndex = 0
            StretchChar.Auto = False
            FieldName = 'SName'
          end
          object GridNayoseOyaCode: TdxDBGridButtonColumn
            Caption = #12467#12540#12489
            HeaderAlignment = taCenter
            Sizing = False
            Width = 100
            BandIndex = 0
            RowIndex = 0
            StretchChar.Auto = True
            FieldName = 'OyaHojCD'
            OnEditButtonClick = GridClmBtnClick
          end
          object GridNayoseOyaName: TdxDBGridColumn
            Caption = #21517#31216
            HeaderAlignment = taCenter
            ReadOnly = True
            Sizing = False
            TabStop = False
            Width = 135
            BandIndex = 0
            RowIndex = 0
            StretchChar.Auto = False
            FieldName = 'OyaName'
          end
          object GridNayosePayNCode: TdxDBGridCurrencyColumn
            Alignment = taRightJustify
            BandIndex = 2
            RowIndex = 0
            StretchChar.Auto = True
            FieldName = 'PayNCode'
          end
          object GridNayoseCngNCode: TdxDBGridCurrencyColumn
            Alignment = taRightJustify
            BandIndex = 2
            RowIndex = 0
            StretchChar.Auto = True
            FieldName = 'CngNCode'
          end
        end
        object SKYKBN2: TMNumEdit
          Tag = 10
          Left = 708
          Top = 64
          Width = 24
          Height = 19
          TabStop = False
          ArrowDisp = adNone
          SelectDisp = sdArrowClick
          FocusedColor = clAqua
          Static = True
          ArrowType = atArrow
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          DMaxLength = 1
          ImeMode = imClose
          FontRatio.Auto = False
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          Visible = False
          Negative = False
          MinValue = 1.000000000000000000
          Digits = 1
          Validate = False
        end
        object NayoseOyaCode2: TMTxtEdit
          Tag = 22
          Left = 708
          Top = 116
          Width = 84
          Height = 19
          TabStop = False
          ArrowDisp = adNone
          SelectDisp = sdNone
          Static = True
          ArrowType = atOmission
          TagStr = ''
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MaxLength = 10
          FontRatio.Auto = True
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          Text = 'X(10)----X'
          Visible = False
          ValidChars = ''
        end
        object f2OyaCode: TMTxtEdit
          Tag = 22
          Left = 18
          Top = 37
          Width = 106
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
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
          ImeMode = imClose
          MaxLength = 10
          FontRatio.Auto = True
          ParentFont = False
          TabOrder = 3
          Text = ''
          OnEnter = fnEnter
          OnExit = f1ItemsCheak
          ValidChars = ''
        end
        object f2KoCode: TMTxtEdit
          Tag = 22
          Left = 19
          Top = 113
          Width = 106
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
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
          ImeMode = imClose
          MaxLength = 10
          FontRatio.Auto = True
          ParentFont = False
          TabOrder = 4
          Text = ''
          OnEnter = fnEnter
          OnExit = f1ItemsCheak
          ValidChars = ''
        end
      end
      object DtlCsSub01Panel: TMPanel
        Left = 0
        Top = 78
        Width = 945
        Height = 409
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 2
        Visible = False
        object tbsPay: TMPanel
          Left = 0
          Top = 50
          Width = 945
          Height = 359
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 2
          Visible = False
          object MLabel11: TMLabel
            Left = 20
            Top = 0
            Width = 437
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel12: TMLabel
            Left = 20
            Top = 100
            Width = 437
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object PnlGensenInfo: TMPanel
            Left = 0
            Top = 3
            Width = 440
            Height = 76
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 0
            object f2GensenKbnNM: TMLabel
              Left = 212
              Top = 26
              Width = 160
              Height = 19
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel47: TMLabel
              Left = 29
              Top = 4
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #25903#25173#35519#26360
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object lblPersonKbn: TMLabel
              Left = 39
              Top = 48
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #20491#20154#65295#27861#20154#21306#20998
              Enabled = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f2PersonKbnNM: TMLabel
              Left = 212
              Top = 48
              Width = 148
              Height = 19
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Enabled = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object lblGensenKbn: TMLabel
              Left = 39
              Top = 26
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #25505#29992#21306#20998
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f2GensenKbn: TMNumEdit
              Tag = 10
              Left = 168
              Top = 26
              Width = 24
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              FocusedColor = clAqua
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              DMaxLength = 1
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnExit = f2ItemsCheak
              Negative = False
              MinValue = 1.000000000000000000
              Digits = 1
              Validate = False
            end
            object f2PersonKbn: TMNumEdit
              Tag = 10
              Left = 168
              Top = 48
              Width = 24
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              FocusedColor = clAqua
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Enabled = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              DMaxLength = 1
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnExit = f2ItemsCheak
              Negative = False
              MinValue = 1.000000000000000000
              Digits = 1
              Validate = False
            end
          end
          object PnlMailnfo: TMPanel
            Left = 0
            Top = 103
            Width = 440
            Height = 76
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 1
            object f2MailKbnNM: TMLabel
              Left = 212
              Top = 26
              Width = 160
              Height = 19
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel21: TMLabel
              Left = 29
              Top = 4
              Width = 156
              Height = 19
              AutoSize = False
              Caption = #25903#25173#36890#30693#26360#12513#12540#12523#37197#20449
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object lblPassword: TMLabel
              Left = 39
              Top = 48
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #12497#12473#12527#12540#12489
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object lblMailKbn: TMLabel
              Left = 39
              Top = 26
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #25505#29992#21306#20998
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f2MailKbn: TMNumEdit
              Tag = 10
              Left = 168
              Top = 26
              Width = 24
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              FocusedColor = clAqua
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              DMaxLength = 1
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnExit = f2ItemsCheak
              Negative = False
              MinValue = 1.000000000000000000
              Digits = 1
              Validate = False
            end
            object f2Password: TMTxtEdit
              Left = 168
              Top = 48
              Width = 129
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              ImeMode = imDisable
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 1
              Text = 'x(16)----x-----x'
              OnChange = fnFldOnChg
              ValidChars = ''
            end
          end
        end
        object tbsKihon: TMPanel
          Left = 0
          Top = 50
          Width = 945
          Height = 359
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 1
          Visible = False
          object MLabel2: TMLabel
            Left = 20
            Top = 0
            Width = 830
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel18: TMLabel
            Left = 20
            Top = 167
            Width = 400
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel1: TMLabel
            Left = 34
            Top = 173
            Width = 117
            Height = 19
            AutoSize = False
            Caption = #32224#26085
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel29: TMLabel
            Left = 39
            Top = 217
            Width = 104
            Height = 19
            AutoSize = False
            Caption = #37857#27396#31246#21360#23383
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object f1SSDENPFMNM: TMLabel
            Left = 213
            Top = 194
            Width = 148
            Height = 19
            AutoSize = False
            Caption = 'X(20)----X---------X'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object f1SSGKEINM: TMLabel
            Left = 213
            Top = 217
            Width = 148
            Height = 19
            AutoSize = False
            Caption = 'X(20)----X---------X'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel20: TMLabel
            Left = 20
            Top = 244
            Width = 400
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel10: TMLabel
            Left = 444
            Top = 342
            Width = 400
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel17: TMLabel
            Left = 39
            Top = 194
            Width = 104
            Height = 19
            AutoSize = False
            Caption = #25903#25173#36890#30693#26360#65420#65387#65392#65425
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object AddPanel: TMPanel
            Left = 24
            Top = 3
            Width = 825
            Height = 160
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 0
            object MLabel15: TMLabel
              Left = 5
              Top = 4
              Width = 117
              Height = 19
              AutoSize = False
              Caption = #20181#20837#20808#20303#25152
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object LblYUBIN: TMLabel
              Left = 15
              Top = 26
              Width = 69
              Height = 17
              AutoSize = False
              Caption = #37109#20415#30058#21495
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs1LabelTelephoneNoTitle: TMLabel
              Left = 15
              Top = 92
              Width = 69
              Height = 17
              AutoSize = False
              Caption = #38651#35441#30058#21495
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs1LabelPostNameTitle: TMLabel
              Left = 15
              Top = 114
              Width = 69
              Height = 17
              AutoSize = False
              Caption = #36865#20184#20808#37096#32626
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object DtlCs1LabelChargeNameTitle: TMLabel
              Left = 459
              Top = 114
              Width = 49
              Height = 17
              AutoSize = False
              Caption = #25285#24403#32773
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel16: TMLabel
              Left = 182
              Top = 26
              Width = 9
              Height = 19
              AutoSize = False
              Caption = '-'
              FontRatio.Auto = False
            end
            object LblJUSHO1: TMLabel
              Left = 15
              Top = 48
              Width = 69
              Height = 17
              AutoSize = False
              Caption = #20303#25152
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object Label2: TMLabel
              Left = 15
              Top = 136
              Width = 88
              Height = 19
              AutoSize = False
              Caption = #12513#12540#12523#12450#12489#12524#12473
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
            object DtlCs1LabelBmnNameTitle: TMLabel
              Left = 459
              Top = 136
              Width = 105
              Height = 19
              AutoSize = False
              Caption = #37096#38272
              Enabled = False
              Visible = False
              FontRatio.Auto = True
              FontRatio.Minimum = 80
            end
            object f1BmnName: TMLabel
              Left = 682
              Top = 136
              Width = 105
              Height = 19
              AutoSize = False
              Caption = 'f1BmnName'
              Enabled = False
              Visible = False
              FontRatio.Auto = False
            end
            object f1ADS1: TMTxtEdit
              Left = 144
              Top = 48
              Width = 420
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnZipOnArrowClick
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
              ImeMode = imHira
              MaxLength = 60
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 2
              Text = 'x(60)----x---------x---------x---------x---------x---------x'
              OnChange = fnFldOnChg
              OnExit = f1Exit
              ValidChars = ''
            end
            object f1ADS2: TMTxtEdit
              Left = 144
              Top = 70
              Width = 420
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
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
              TabOrder = 3
              Text = 'x(60)----x---------x---------x---------x---------x---------x'
              OnChange = fnFldOnChg
              ValidChars = ''
            end
            object f1TEL1: TMTxtEdit
              Left = 144
              Top = 92
              Width = 140
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpVariable
              Font.Style = []
              ImeMode = imDisable
              MaxLength = 20
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 4
              Text = 'x(20)----x---------x'
              OnChange = fnFldOnChg
              ValidChars = ''
            end
            object f1SectionName: TMTxtEdit
              Left = 144
              Top = 114
              Width = 285
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
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
              TabOrder = 5
              Text = 'x(40)----x---------x---------x---------x'
              OnChange = fnFldOnChg
              ValidChars = ''
            end
            object f1TanNm: TMTxtEdit
              Left = 509
              Top = 114
              Width = 155
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
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
              MaxLength = 20
              FontRatio.Auto = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 6
              Text = 'x(20)----x---------x'
              OnChange = fnFldOnChg
              ValidChars = ''
            end
            object f1POSTNO1: TMNumEdit
              Left = 144
              Top = 26
              Width = 33
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
              OnChange = fnFldOnChg
              OnExit = f1POSTNO1Exit
              FormatStr = '000'
              MaxValue = 999.000000000000000000
              Digits = 3
              Validate = False
            end
            object f1POSTNO2: TMNumEdit
              Left = 192
              Top = 26
              Width = 39
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = fnZipOnArrowClick
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
              OnChange = fnFldOnChg
              OnExit = f1Exit
              OnKeyDown = fnDtlCs1EditZipCodeOnKeyDown
              FormatStr = '0000'
              MaxValue = 9999.000000000000000000
              Digits = 4
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object f1MailAd: TMTxtEdit
              Left = 144
              Top = 136
              Width = 285
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
              MaxLength = 128
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 8
              Text = 'X(100)----------------------------------X'
              OnChange = fnFldOnChg
              ValidChars = ''
            end
            object f1KEISYO: TMTxtEdit
              Left = 673
              Top = 114
              Width = 46
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
              MaxLength = 6
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 7
              Text = 'X(6)-X'
              OnClick = fnFldOnChg
              ValidChars = ''
            end
            object f1BmnCode: TMTxtEdit
              Left = 565
              Top = 136
              Width = 106
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = ArrowClick
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              Enabled = False
              FontRatio.Auto = False
              TabOrder = 9
              Text = ''
              Visible = False
              OnChange = fnFldOnChg
              OnEnter = fnEnter
              OnExit = f1ItemsCheak
              OnKeyPress = f1BmnCodeKeyPress
              ValidChars = ''
            end
          end
          object f1SSGKEI: TMNumEdit
            Left = 168
            Top = 217
            Width = 23
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            ArrowType = atArrow
            F4Arrow = True
            AutoSize = False
            Ctl3D = True
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            OnChange = fnFldOnChg
            OnExit = f1ItemsCheak
            Digits = 1
            Validate = False
            Value = 9.000000000000000000
          end
          object f1SSDENPFM: TMNumEdit
            Left = 168
            Top = 194
            Width = 23
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = ArrowClick
            ArrowType = atOmission
            F4Arrow = True
            AutoSize = False
            Ctl3D = True
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ImeMode = imClose
            FontRatio.Auto = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            OnChange = fnFldOnChg
            Digits = 2
            Validate = False
            Value = 99.000000000000000000
          end
          object PnlNayoseInfo: TMPanel
            Left = 0
            Top = 249
            Width = 440
            Height = 98
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 4
            object f1SKYKBNNM: TMLabel
              Left = 212
              Top = 43
              Width = 160
              Height = 19
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel35: TMLabel
              Left = 34
              Top = 1
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #21517#23492#12379#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel34: TMLabel
              Left = 20
              Top = 93
              Width = 400
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object NayoseOyaLabel: TMLabel
              Left = 40
              Top = 65
              Width = 116
              Height = 19
              AutoSize = False
              Caption = #21517#23492#12379#35242#20195#26367#20181#20837#20808
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1NayoseNM: TMLabel
              Left = 290
              Top = 65
              Width = 148
              Height = 19
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object SeikyuKbnLabel: TMLabel
              Left = 40
              Top = 43
              Width = 116
              Height = 19
              AutoSize = False
              Caption = #35531#27714#21306#20998
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1SKYKBN: TMNumEdit
              Tag = 10
              Left = 168
              Top = 43
              Width = 24
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              FocusedColor = clAqua
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              DMaxLength = 1
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnChange = f1SKYKBNChange
              OnExit = f1ItemsCheak
              Negative = False
              MinValue = 1.000000000000000000
              Digits = 1
              Validate = False
            end
            object cbPayRootKbn: TMCheckBox
              Left = 40
              Top = 21
              Width = 145
              Height = 19
              Caption = #21517#23492#12379#12398#35242#12392#12375#12390#25505#29992
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = cbPayRootKbnClick
            end
            object f1NayoseOyaCode: TMTxtEdit
              Tag = 22
              Left = 168
              Top = 65
              Width = 106
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = ArrowClick
              ArrowType = atOmission
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              Enabled = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Pitch = fpFixed
              Font.Style = []
              ImeMode = imClose
              MaxLength = 10
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 2
              Text = 'X(10)----X'
              OnChange = fnFldOnChg
              OnEnter = fnEnter
              OnExit = f1ItemsCheak
              ValidChars = ''
            end
          end
          object PnlRendouInfo: TMPanel
            Left = 442
            Top = 243
            Width = 425
            Height = 60
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 6
            object MLabel6: TMLabel
              Left = 16
              Top = 7
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #20661#27177#36899#21205
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel7: TMLabel
              Left = 2
              Top = 1
              Width = 400
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object LblRendouCode: TMLabel
              Left = 21
              Top = 28
              Width = 65
              Height = 19
              AutoSize = False
              Caption = #36899#21205#24471#24847#20808
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1RendouNM: TMLabel
              Left = 242
              Top = 28
              Width = 148
              Height = 19
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1RendouCode: TMTxtEdit
              Tag = 22
              Left = 120
              Top = 28
              Width = 106
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
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 0
              Text = 'X(10)----X'
              OnChange = fnFldOnChg
              OnEnter = fnEnter
              OnExit = f1ItemsCheak
              ValidChars = ''
            end
          end
          object MPanel1: TMPanel
            Left = 442
            Top = 166
            Width = 425
            Height = 77
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 5
            object MLabel5: TMLabel
              Left = 16
              Top = 7
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #25903#25173
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel8: TMLabel
              Left = 2
              Top = 1
              Width = 400
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object MLabel9: TMLabel
              Left = 21
              Top = 28
              Width = 65
              Height = 19
              AutoSize = False
              Caption = #21463#21462#20154#21517#31216
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1LetterKbnNM: TMLabel
              Left = 165
              Top = 51
              Width = 160
              Height = 19
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel19: TMLabel
              Left = 21
              Top = 51
              Width = 91
              Height = 19
              AutoSize = False
              Caption = #25903#25173#36890#30693#26360#21306#20998
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1LetterKbn: TMNumEdit
              Tag = 10
              Left = 120
              Top = 51
              Width = 24
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              FocusedColor = clAqua
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              DMaxLength = 1
              ImeMode = imClose
              FontRatio.Auto = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnExit = f1ItemsCheak
              Negative = False
              MinValue = 1.000000000000000000
              Digits = 1
              Validate = False
            end
            object PnlReceiverName: TMPanel
              Left = 120
              Top = 28
              Width = 273
              Height = 19
              BevelOuter = bvNone
              Caption = 'PnlReceiverName'
              Color = 15921906
              ParentBackground = False
              TabOrder = 0
              object f1ReceiverName: TMTxtEdit
                Left = 0
                Top = 0
                Width = 266
                Height = 19
                ArrowDisp = adNone
                SelectDisp = sdNone
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
                TabOrder = 0
                Text = ''
                ValidChars = ''
              end
            end
          end
          object PnlSelInfo: TMPanel
            Left = 442
            Top = 347
            Width = 425
            Height = 125
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
            Visible = False
            object MLabel14: TMLabel
              Left = 16
              Top = 6
              Width = 117
              Height = 19
              AutoSize = False
              Caption = #31649#29702#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object LblBMCODE: TMLabel
              Left = 21
              Top = 27
              Width = 60
              Height = 19
              AutoSize = False
              Caption = #37096#38272#65402#65392#65412#65438
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object LblTNCODE: TMLabel
              Left = 21
              Top = 49
              Width = 72
              Height = 19
              AutoSize = False
              Caption = #25285#24403#32773#65402#65392#65412#65438
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object LblUSDENPFM: TMLabel
              Left = 21
              Top = 71
              Width = 123
              Height = 17
              AutoSize = False
              Caption = #20181#20837#20253#31080#65420#65387#65392#65425
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object LblUSGKEI: TMLabel
              Left = 21
              Top = 93
              Width = 104
              Height = 13
              AutoSize = False
              Caption = #20181#20837#21512#35336#27396#31246#21360#23383
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1USDENPFMNM: TMLabel
              Left = 210
              Top = 71
              Width = 148
              Height = 19
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1USGKEINM: TMLabel
              Left = 210
              Top = 93
              Width = 148
              Height = 19
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1BMNAME: TMLabel
              Left = 270
              Top = 27
              Width = 148
              Height = 19
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1TNNAME: TMLabel
              Left = 270
              Top = 49
              Width = 148
              Height = 19
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel3: TMLabel
              Left = 2
              Top = 1
              Width = 400
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object MLabel4: TMLabel
              Left = 2
              Top = 119
              Width = 400
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object f1BMCODE: TMTxtEdit
              Tag = 22
              Left = 160
              Top = 27
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
              Text = 'X(10)----X'
              OnChange = fnFldOnChg
              ValidChars = ''
            end
            object f1USDENPFM: TMNumEdit
              Left = 160
              Top = 71
              Width = 23
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              OnArrowClick = ArrowClick
              ArrowType = atOmission
              F4Arrow = True
              AutoSize = False
              Ctl3D = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 2
              OnChange = fnFldOnChg
              Digits = 2
              Validate = False
              Value = 99.000000000000000000
            end
            object f1USGKEI: TMNumEdit
              Left = 160
              Top = 93
              Width = 23
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Ctl3D = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              FontRatio.Auto = False
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 3
              OnChange = fnFldOnChg
              OnExit = f1ItemsCheak
              Digits = 1
              Validate = False
              Value = 9.000000000000000000
            end
            object f1TNCODE: TMTxtEdit
              Tag = 22
              Left = 160
              Top = 49
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
              Text = 'X(10)----X'
              OnChange = fnFldOnChg
              ValidChars = ''
            end
          end
        end
        object DtlCsTab: TMTab
          Left = 0
          Top = 0
          Width = 945
          Height = 50
          Items = <
            item
              Caption = #22522#26412#24773#22577
              Color = 16766672
              SyncControl = tbsKihon
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #25903#25173#24773#22577
              Color = 16766672
              SyncControl = tbsPay
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end>
          Align = alTop
          TabOrder = 0
          OnChange = DtlCsTabChange
          ItemWidth = 0
          ItemHeight = 0
          ItemMargin = 6
          Style = tsCrystal
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          BorderHeight = 20
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
  end
  object MPanel3: TMPanel
    Left = 0
    Top = 527
    Width = 945
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object MSPFunctionBar: TMSPFunctionBar
      Left = 0
      Top = 0
      Width = 945
      Height = 21
      Alignment = taLeftJustify
      FuncColor = 7230266
      Align = alBottom
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
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
    object CmnStatusBar: TMStatusBar
      Left = 0
      Top = 21
      Width = 945
      Height = 19
      Color = 15921906
      Panels = <>
      SimplePanel = True
    end
  end
  object PnlButton: TMPanel
    Left = 0
    Top = 487
    Width = 945
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      945
      40)
    object Image_Fusen_Red: TImage
      Left = 454
      Top = 16
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
      Left = 470
      Top = 16
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
      Left = 486
      Top = 16
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
      Left = 502
      Top = 16
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
      Left = 518
      Top = 16
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
    object MBitBtnUpd: TMBitBtn
      Left = 729
      Top = 6
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #26356#26032'(&U)'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
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
      ParentFont = False
      TabOrder = 0
      OnClick = BtnClick
    end
    object MBitBtnCancel: TMBitBtn
      Left = 813
      Top = 6
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #21462#28040'(&C)'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
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
      TabOrder = 1
      OnClick = BtnClick
    end
  end
  object DSrcTanka: TDataSource
    Left = 1060
    Top = 376
  end
  object DMemRitu: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 1088
    Top = 348
    object DMemRituRitu: TStringField
      FieldName = 'Ritu'
    end
    object DMemRituTaxRitu: TFloatField
      FieldName = 'TaxRitu'
      DisplayFormat = '##,###,##0.00'
      EditFormat = '##,###,##0.00'
    end
    object DMemRituFieldName: TStringField
      FieldName = 'FieldName'
    end
    object DMemRituTableName: TStringField
      FieldName = 'TableName'
    end
  end
  object DSrcRitu: TDataSource
    DataSet = DMemRitu
    Left = 1088
    Top = 376
  end
  object KanaAdd1: TMFurigana
    Left = 1060
    Top = 320
  end
  object KanaAdd2: TMFurigana
    Left = 1088
    Top = 320
  end
  object DSNayose: TDataSource
    DataSet = MemNayose
    OnStateChange = DSNayoseStateChange
    Left = 18
    Top = 537
  end
  object MemNayose: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = MemNayoseBeforePost
    Left = 58
    Top = 537
    object MemNayoseHojCode: TStringField
      FieldName = 'HojCode'
    end
    object MemNayoseBaseHojCode: TStringField
      FieldName = 'BaseHojCode'
    end
    object MemNayoseSName: TStringField
      FieldName = 'SName'
    end
    object MemNayoseOyaHojCD: TStringField
      FieldName = 'OyaHojCD'
    end
    object MemNayoseOyaBaseHojCD: TStringField
      FieldName = 'OyaBaseHojCD'
    end
    object MemNayoseOyaName: TStringField
      FieldName = 'OyaName'
    end
    object MemNayosePayNCode: TFloatField
      FieldName = 'PayNCode'
    end
    object MemNayoseOyaNCode: TFloatField
      FieldName = 'OyaNCode'
    end
    object MemNayoseCngNCode: TFloatField
      FieldName = 'CngNCode'
    end
    object MemNayoseNDCode: TStringField
      FieldName = 'NDCode'
    end
    object MemNayoseNDNAME: TStringField
      FieldName = 'NDNAME'
    end
    object MemNayoseUsKinKbn: TIntegerField
      FieldName = 'UsKinKbn'
    end
  end
  object aclExec: TActionList
    Left = 101
    Top = 537
    object AcTemplate: TAction
      Category = 'Function'
      Caption = #12486#12531#12503#12524#12540#12488
      OnExecute = AcTemplateExecute
    end
    object AcCloseDay: TAction
      Category = 'Function'
      Caption = #32224#26085#21046#38480
      OnExecute = AcCloseDayExecute
    end
  end
  object StdProc3: TFDStoredProc
    StoredProcName = 'PRC_MA0150_011'
    Left = 18
    Top = 578
    ParamData = <
      item
        Name = '@pTRNCD'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@pSDYMD'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = '@pEDYMD'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = '@pSNYM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@pENYM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object StdProc6: TFDStoredProc
    StoredProcName = 'PRC_MA0150_106'
    Left = 142
    Top = 578
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
      end
      item
        Name = '@RETMSG'
        DataType = ftString
        ParamType = ptInputOutput
      end>
  end
  object StdProc5: TFDStoredProc
    StoredProcName = 'PRC_MA0150_104'
    Left = 100
    Top = 578
    ParamData = <
      item
        Name = '@pTRNCD'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@pOLDSEINCD'
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
  object StdProc4: TFDStoredProc
    StoredProcName = 'PRC_MA0150_103'
    Left = 58
    Top = 578
    ParamData = <
      item
        Name = '@pTRNCD'
        DataType = ftFloat
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
  object MemPrint: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 401
    Top = 578
    object MemPrintGCode: TStringField
      FieldName = 'GCode'
      Size = 16
    end
    object MemPrintRenso: TStringField
      FieldName = 'Renso'
      Size = 12
    end
    object MemPrintNmk: TStringField
      FieldName = 'Nmk'
    end
    object MemPrintNm: TStringField
      FieldName = 'Nm'
      Size = 60
    end
    object MemPrintPostNo1: TStringField
      FieldName = 'PostNo1'
      Size = 3
    end
    object MemPrintPostNo2: TStringField
      FieldName = 'PostNo2'
    end
    object MemPrintTStartDate: TStringField
      FieldName = 'TStartDate'
      Size = 10
    end
    object MemPrintTEndDate: TStringField
      FieldName = 'TEndDate'
      Size = 10
    end
    object MemPrintUpdDateTM: TStringField
      FieldName = 'UpdDateTM'
    end
    object MemPrintAds1: TStringField
      FieldName = 'Ads1'
      Size = 60
    end
    object MemPrintAds2: TStringField
      FieldName = 'Ads2'
      Size = 60
    end
    object MemPrintTel1: TStringField
      FieldName = 'Tel1'
    end
    object MemPrintSectNm: TStringField
      FieldName = 'SectNm'
      Size = 40
    end
    object MemPrintTanNm: TStringField
      FieldName = 'TanNm'
    end
    object MemPrintKeisyo: TStringField
      FieldName = 'Keisyo'
    end
    object MemPrintMail: TStringField
      FieldName = 'Mail'
      Size = 100
    end
    object MemPrintBmNCd: TStringField
      FieldName = 'BmNCd'
    end
    object MemPrintBmNm: TStringField
      FieldName = 'BmNm'
    end
    object MemPrintTnNCd: TStringField
      FieldName = 'TnNCd'
    end
    object MemPrintTnNm: TStringField
      FieldName = 'TnNm'
    end
    object MemPrintUSDenPfm: TIntegerField
      FieldName = 'USDenPfm'
    end
    object MemPrintUSDenPfmNm: TStringField
      FieldName = 'USDenPfmNm'
    end
    object MemPrintUSGKei: TIntegerField
      FieldName = 'USGKei'
    end
    object MemPrintUSGKeiNm: TStringField
      FieldName = 'USGKeiNm'
    end
    object MemPrintRendoCode: TStringField
      FieldName = 'RendoCode'
      Size = 16
    end
    object MemPrintRendoNmk: TStringField
      FieldName = 'RendoNmk'
    end
  end
  object MemPrintNayose: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 429
    Top = 578
    object StringField1: TStringField
      FieldName = 'HojCode'
    end
    object StringField2: TStringField
      FieldName = 'BaseHojCode'
    end
    object StringField3: TStringField
      FieldName = 'SName'
    end
    object StringField4: TStringField
      FieldName = 'OyaHojCD'
    end
    object StringField5: TStringField
      FieldName = 'OyaBaseHojCD'
    end
    object StringField6: TStringField
      FieldName = 'OyaName'
    end
    object FloatField1: TFloatField
      FieldName = 'PayNCode'
    end
    object FloatField2: TFloatField
      FieldName = 'OyaNCode'
    end
    object IntegerField1: TIntegerField
      FieldName = 'UsKinKbn'
    end
  end
  object MemPtnJitsuzai: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 345
    Top = 578
    object MemPtnJitsuzaiFusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object MemPtnJitsuzaiGCode: TStringField
      FieldName = 'GCode'
      Size = 16
    end
    object MemPtnJitsuzaiRenso: TStringField
      FieldName = 'Renso'
      Size = 12
    end
    object MemPtnJitsuzaiNmk: TStringField
      FieldName = 'Nmk'
    end
    object MemPtnJitsuzaiNm: TStringField
      FieldName = 'Nm'
      Size = 60
    end
  end
  object MemPtnGoukei: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 373
    Top = 578
    object GraphicField1: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object StringField7: TStringField
      FieldName = 'strExCode'
      Size = 10
    end
    object StringField8: TStringField
      FieldName = 'strName'
      Size = 60
    end
    object StringField9: TStringField
      DisplayWidth = 20
      FieldName = 'strNameSimple'
    end
    object StringField10: TStringField
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
  end
  object StdProc7: TFDStoredProc
    StoredProcName = 'MP_PAY_CHK_DAITAI'
    Left = 184
    Top = 578
    ParamData = <
      item
        Name = '@p_PayNCode'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@p_Status'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object MDPrint: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 181
    Top = 538
    object MDPrintFusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object MDPrintGCode: TStringField
      FieldName = 'GCode'
      Size = 60
    end
    object MDPrintRenso: TStringField
      FieldName = 'Renso'
      Size = 60
    end
    object MDPrintNmk: TStringField
      FieldName = 'Nmk'
      Size = 60
    end
    object MDPrintNm: TStringField
      FieldName = 'Nm'
      Size = 60
    end
    object MDPrintPostNo1: TStringField
      FieldName = 'PostNo1'
      Size = 60
    end
    object MDPrintPostNo2: TStringField
      FieldName = 'PostNo2'
      Size = 60
    end
    object MDPrintTStartDate: TStringField
      FieldName = 'TStartDate'
      Size = 60
    end
    object MDPrintTEndDate: TStringField
      FieldName = 'TEndDate'
      Size = 60
    end
    object MDPrintUpdDateTM: TStringField
      FieldName = 'UpdDateTM'
      Size = 60
    end
    object MDPrintAds1: TStringField
      FieldName = 'Ads1'
      Size = 60
    end
    object MDPrintAds2: TStringField
      FieldName = 'Ads2'
      Size = 60
    end
    object MDPrintTel1: TStringField
      FieldName = 'Tel1'
      Size = 60
    end
    object MDPrintSectNm: TStringField
      FieldName = 'SectNm'
      Size = 60
    end
    object MDPrintTanNm: TStringField
      FieldName = 'TanNm'
      Size = 60
    end
    object MDPrintKeisyo: TStringField
      FieldName = 'Keisyo'
      Size = 60
    end
    object MDPrintMail: TStringField
      FieldName = 'Mail'
      Size = 100
    end
    object MDPrintMail1: TStringField
      FieldName = 'Mail1'
      Size = 60
    end
    object MDPrintMail2: TStringField
      FieldName = 'Mail2'
      Size = 60
    end
    object MDPrintBmnTitle: TStringField
      FieldName = 'BmnTitle'
    end
    object MDPrintBmNCd: TStringField
      FieldName = 'BmNCd'
      Size = 60
    end
    object MDPrintBmNm: TStringField
      FieldName = 'BmNm'
      Size = 60
    end
    object MDPrintTnNCd: TStringField
      FieldName = 'TnNCd'
      Size = 60
    end
    object MDPrintTnNm: TStringField
      FieldName = 'TnNm'
      Size = 60
    end
    object MDPrintUSDenPfm: TIntegerField
      FieldName = 'USDenPfm'
    end
    object MDPrintUSDenPfmNm: TStringField
      FieldName = 'USDenPfmNm'
      Size = 60
    end
    object MDPrintUSGKei: TIntegerField
      FieldName = 'USGKei'
    end
    object MDPrintUSGKeiNm: TStringField
      FieldName = 'USGKeiNm'
      Size = 60
    end
    object MDPrintRendoCode: TStringField
      FieldName = 'RendoCode'
      Size = 16
    end
    object MDPrintRendoNmk: TStringField
      FieldName = 'RendoNmk'
    end
    object MDPrintUketoriName: TStringField
      FieldName = 'UketoriName'
      Size = 40
    end
    object MDPrintLetterKbn: TStringField
      FieldName = 'LetterKbn'
      Size = 2
    end
    object MDPrintLetterKbnName: TStringField
      FieldName = 'LetterKbnName'
      Size = 6
    end
    object MDPrintUsKinKbn: TIntegerField
      FieldName = 'UsKinKbn'
    end
    object MDPrintUsKinKbnNm: TStringField
      FieldName = 'UsKinKbnNm'
    end
    object MDPrintCngGCode: TStringField
      FieldName = 'CngGCode'
      Size = 16
    end
    object MDPrintCngName: TStringField
      FieldName = 'CngName'
    end
    object MDPrintGensenKbn: TStringField
      FieldName = 'GensenKbn'
      Size = 2
    end
    object MDPrintGensenKbnName: TStringField
      FieldName = 'GensenKbnName'
      Size = 10
    end
    object MDPrintPersonKbn: TStringField
      FieldName = 'PersonKbn'
      Size = 2
    end
    object MDPrintPersonKbnName: TStringField
      FieldName = 'PersonKbnName'
      Size = 10
    end
    object MDPrintVerData: TIntegerField
      FieldName = 'VerData'
    end
    object MDPrintMailKbn: TStringField
      FieldName = 'MailKbn'
    end
    object MDPrintMailKbnName: TStringField
      FieldName = 'MailKbnName'
    end
    object MDPrintPassword: TStringField
      FieldName = 'Password'
    end
  end
  object MemPtnNayose: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 229
    Top = 539
    object MemPtnNayoseHojCode: TStringField
      FieldName = 'HojCode'
    end
    object MemPtnNayoseBaseHojCode: TStringField
      FieldName = 'BaseHojCode'
    end
    object MemPtnNayoseSName: TStringField
      DisplayWidth = 60
      FieldName = 'SName'
      Size = 60
    end
    object MemPtnNayoseOyaHojCD: TStringField
      FieldName = 'OyaHojCD'
    end
    object MemPtnNayoseOyaBaseHojCD: TStringField
      FieldName = 'OyaBaseHojCD'
    end
    object MemPtnNayoseOyaName: TStringField
      DisplayWidth = 60
      FieldName = 'OyaName'
      Size = 60
    end
    object MemPtnNayosePayNCode: TFloatField
      FieldName = 'PayNCode'
    end
    object MemPtnNayoseOyaNCode: TFloatField
      FieldName = 'OyaNCode'
    end
    object MemPtnNayoseCngNCode: TIntegerField
      FieldName = 'CngNCode'
    end
    object MemPtnNayoseSeikyuKbnNm: TStringField
      FieldName = 'SeikyuKbnNm'
    end
    object MemPtnNayoseREndKaisu: TIntegerField
      FieldName = 'REndKaisu'
    end
    object MemPtnNayosePCloseDay1: TIntegerField
      FieldName = 'PCloseDay1'
    end
    object MemPtnNayosePCloseDay1Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PCloseDay1Nm'
      Size = 60
    end
    object MemPtnNayosePCloseDay2: TIntegerField
      FieldName = 'PCloseDay2'
    end
    object MemPtnNayosePCloseDay2Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PCloseDay2Nm'
      Size = 60
    end
    object MemPtnNayosePCloseDay3: TIntegerField
      FieldName = 'PCloseDay3'
    end
    object MemPtnNayosePCloseDay3Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PCloseDay3Nm'
      Size = 60
    end
    object MemPtnNayosePayMonth1: TIntegerField
      FieldName = 'PayMonth1'
    end
    object MemPtnNayosePayMonth1Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PayMonth1Nm'
      Size = 60
    end
    object MemPtnNayosePayMonth2: TIntegerField
      FieldName = 'PayMonth2'
    end
    object MemPtnNayosePayMonth2Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PayMonth2Nm'
      Size = 60
    end
    object MemPtnNayosePayMonth3: TIntegerField
      FieldName = 'PayMonth3'
    end
    object MemPtnNayosePayMonth3Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PayMonth3Nm'
      Size = 60
    end
    object MemPtnNayosePayDay1: TIntegerField
      FieldName = 'PayDay1'
    end
    object MemPtnNayosePayDay1Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PayDay1Nm'
      Size = 60
    end
    object MemPtnNayosePayDay2: TIntegerField
      FieldName = 'PayDay2'
    end
    object MemPtnNayosePayDay2Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PayDay2Nm'
      Size = 60
    end
    object MemPtnNayosePayDay3: TIntegerField
      FieldName = 'PayDay3'
    end
    object MemPtnNayosePayDay3Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PayDay3Nm'
      Size = 60
    end
    object MemPtnNayosePHolidayKbn1: TIntegerField
      FieldName = 'PHolidayKbn1'
    end
    object MemPtnNayosePHolidayKbn1Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PHolidayKbn1Nm'
      Size = 60
    end
    object MemPtnNayosePHolidayKbn2: TIntegerField
      FieldName = 'PHolidayKbn2'
    end
    object MemPtnNayosePHolidayKbn2Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PHolidayKbn2Nm'
      Size = 60
    end
    object MemPtnNayosePHolidayKbn3: TIntegerField
      FieldName = 'PHolidayKbn3'
    end
    object MemPtnNayosePHolidayKbn3Nm: TStringField
      DisplayWidth = 60
      FieldName = 'PHolidayKbn3Nm'
      Size = 60
    end
    object MemPtnNayoseDaitaiMark: TStringField
      FieldName = 'DaitaiMark'
    end
    object MemPtnNayosePageEnd: TIntegerField
      FieldName = 'PageEnd'
    end
  end
  object SPMsHist: TFDStoredProc
    StoredProcName = 'MP_MSHIST_SETINFO'
    Left = 273
    Top = 539
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
    Left = 301
    Top = 539
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
