object JNTCRP004003F: TJNTCRP004003F
  Left = 225
  Top = 158
  BorderStyle = bsNone
  Caption = #20661#27177#24773#22577
  ClientHeight = 572
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
    Height = 534
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
      Height = 494
      Align = alClient
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 0
      object DtlCsSub02Panel: TMPanel
        Left = 0
        Top = 74
        Width = 945
        Height = 420
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 3
        Visible = False
        DesignSize = (
          945
          420)
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
          Caption = #21517#23492#12379#35242#20195#26367#24471#24847#20808
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
          Caption = #21517#23492#12379#35242#24471#24847#20808
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
          Caption = #23376#24471#24847#20808
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
        object GridNayose: TdxDBGrid
          Left = 201
          Top = 8
          Width = 545
          Height = 402
          Bands = <
            item
              Caption = #21517#23492#12379#35242#24471#24847#20808
            end
            item
              Caption = #23376#24471#24847#20808
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
          OnEnter = GridNayoseEnter
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
          object GridNayoseOyaCode: TdxDBGridButtonColumn
            Tag = 22
            Caption = #12467#12540#12489
            HeaderAlignment = taCenter
            Sizing = False
            Width = 120
            BandIndex = 0
            RowIndex = 0
            ImeMode = imDisable
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
          object GridNayoseCode: TdxDBGridButtonColumn
            Tag = 22
            Alignment = taLeftJustify
            Caption = #12467#12540#12489
            HeaderAlignment = taCenter
            Sizing = False
            Width = 120
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
          object GridNayoseNknNCode: TdxDBGridCurrencyColumn
            BandIndex = 2
            RowIndex = 0
            StretchChar.Auto = False
            FieldName = 'NknNCode'
          end
          object GridNayoseCngNCode: TdxDBGridCurrencyColumn
            BandIndex = 2
            RowIndex = 0
            StretchChar.Auto = False
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
          FontRatio.Auto = False
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
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MaxLength = 16
          FontRatio.Auto = True
          ParentFont = False
          TabOrder = 3
          Text = ''
          OnEnter = fnEnter
          OnExit = CODEExit
          ValidChars = ''
        end
        object f2KoCode: TMTxtEdit
          Tag = 22
          Left = 19
          Top = 113
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
          OnExit = CODEExit
          ValidChars = ''
        end
      end
      object DtlCsSub01Panel: TMPanel
        Left = 0
        Top = 74
        Width = 945
        Height = 420
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 2
        Visible = False
        object tbsAccountInfo: TMPanel
          Left = 0
          Top = 46
          Width = 945
          Height = 374
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 4
          Visible = False
          object pnlAccountHeader: TMPanel
            Left = 0
            Top = 0
            Width = 945
            Height = 87
            Align = alTop
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 0
            object MLabel10: TMLabel
              Left = 25
              Top = 8
              Width = 160
              Height = 18
              AutoSize = False
              Caption = #21475#24231#25391#26367#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel12: TMLabel
              Left = 40
              Top = 35
              Width = 105
              Height = 18
              AutoSize = False
              Caption = #21475#24231#25391#26367#65400#65438#65433#65392#65420#65439'NO'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object lblKoufuriNo1_Account: TMLabel
              Left = 207
              Top = 35
              Width = 362
              Height = 12
              AutoSize = False
              Caption = #12521#12505#12523#65297
              FontRatio.Auto = False
            end
            object lblKoufuriNo2_Account: TMLabel
              Left = 207
              Top = 64
              Width = 406
              Height = 12
              AutoSize = False
              Caption = #12521#12505#12523#65298
              FontRatio.Auto = False
            end
            object MLabel59: TMLabel
              Left = 1
              Top = 0
              Width = 850
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object numKoufuriNo_Account: TMNumEdit
              Left = 166
              Top = 34
              Width = 22
              Height = 19
              ArrowDisp = adAlways
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '1:'#12391#12435#12373#12356
                '2:'#65322#65317#65325#65315#65327#38651#25163)
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              DMaxLength = 1
              ImeMode = imDisable
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              OnChange = numKoufuriNo_AccountChange
              OnEnter = fnEnter
              Negative = False
              Digits = 1
              Validate = False
              Value = 1.000000000000000000
              InputFlagEnabled = True
            end
          end
          object pnlAccountDetail: TMPanel
            Left = 0
            Top = 87
            Width = 945
            Height = 287
            Align = alClient
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 1
            object MLabel48: TMLabel
              Left = 25
              Top = 8
              Width = 193
              Height = 19
              AutoSize = False
              Caption = #24471#24847#20808#24341#33853#21475#24231#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel49: TMLabel
              Left = 40
              Top = 35
              Width = 63
              Height = 18
              AutoSize = False
              Caption = #39015#23458#30058#21495
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel51: TMLabel
              Left = 40
              Top = 62
              Width = 97
              Height = 17
              AutoSize = False
              Caption = #37504#34892#12467#12540#12489
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel13: TMLabel
              Left = 40
              Top = 90
              Width = 97
              Height = 19
              AutoSize = False
              Caption = #37504#34892#12459#12490
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel44: TMLabel
              Left = 40
              Top = 118
              Width = 97
              Height = 19
              AutoSize = False
              Caption = #25903#24215#12459#12490
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel52: TMLabel
              Left = 40
              Top = 145
              Width = 85
              Height = 17
              AutoSize = False
              Caption = #38928#37329#31278#30446
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object lblAccKbnName_Account: TMLabel
              Left = 178
              Top = 145
              Width = 117
              Height = 19
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel54: TMLabel
              Left = 40
              Top = 173
              Width = 101
              Height = 17
              AutoSize = False
              Caption = #21475#24231#30058#21495
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel46: TMLabel
              Left = 40
              Top = 202
              Width = 97
              Height = 19
              AutoSize = False
              Caption = #38928#37329#32773#21517
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel50: TMLabel
              Left = 378
              Top = 8
              Width = 193
              Height = 19
              AutoSize = False
              Caption = #12501#12522#12540#38917#30446
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel53: TMLabel
              Left = 395
              Top = 35
              Width = 63
              Height = 18
              AutoSize = False
              Caption = #12501#12522#12540#38917#30446#65297
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel55: TMLabel
              Left = 395
              Top = 62
              Width = 63
              Height = 18
              AutoSize = False
              Caption = #12501#12522#12540#38917#30446#65298
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel56: TMLabel
              Left = 395
              Top = 90
              Width = 63
              Height = 18
              AutoSize = False
              Caption = #12501#12522#12540#38917#30446#65299
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel57: TMLabel
              Left = 395
              Top = 118
              Width = 63
              Height = 18
              AutoSize = False
              Caption = #12501#12522#12540#38917#30446#65300
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel58: TMLabel
              Left = 395
              Top = 145
              Width = 63
              Height = 18
              AutoSize = False
              Caption = #12501#12522#12540#38917#30446#65301
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel60: TMLabel
              Left = 2
              Top = 0
              Width = 850
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object numAllBkCode_Account: TMNumEdit
              Left = 143
              Top = 62
              Width = 39
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
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
              OnEnter = fnEnter
              FormatStr = '0000'
              MaxValue = 9999.000000000000000000
              Digits = 4
              Validate = False
              InputFlagEnabled = True
            end
            object numAllBraCode_Account: TMNumEdit
              Left = 198
              Top = 62
              Width = 32
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
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
              OnEnter = fnEnter
              FormatStr = '000'
              MaxValue = 999.000000000000000000
              Digits = 3
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object txtBankName_Account: TMTxtEdit
              Tag = 8
              Left = 143
              Top = 90
              Width = 150
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
              Font.Style = []
              Hankaku = True
              ImeMode = imSKata
              MaxLength = 15
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 3
              Text = ''
              OnEnter = fnEnter
              OnExit = f1KanaName1Exit
              OnKeyPress = f1KanaName1KeyPress
              ValidChars = ''
            end
            object txtBranchName_Account: TMTxtEdit
              Tag = 8
              Left = 143
              Top = 120
              Width = 150
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
              Font.Style = []
              Hankaku = True
              ImeMode = imSKata
              MaxLength = 15
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 4
              Text = ''
              OnEnter = fnEnter
              OnExit = f1KanaName1Exit
              OnKeyPress = f1KanaName1KeyPress
              ValidChars = ''
            end
            object numAccKbn_Account: TMNumEdit
              Left = 143
              Top = 145
              Width = 18
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '1: '#26222#36890
                '2: '#24403#24231
                '9: '#12381#12398#20182)
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
              OnEnter = fnEnter
              MaxValue = 99.000000000000000000
              Digits = 1
              Validate = False
            end
            object txtAccNo_Account: TMTxtEdit
              Tag = 8
              Left = 143
              Top = 173
              Width = 69
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
              Font.Style = []
              Hankaku = True
              ImeMode = imDisable
              MaxLength = 7
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 6
              Text = ''
              OnEnter = fnEnter
              OnExit = MTAccNoExit
              OnKeyPress = MTAccNoKeyPress
              ValidChars = ''
            end
            object txtUserName_Account: TMTxtEdit
              Tag = 8
              Left = 143
              Top = 202
              Width = 150
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
              Font.Style = []
              ImeMode = imSKata
              MaxLength = 30
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 7
              Text = ''
              OnEnter = fnEnter
              OnExit = f1KanaName1Exit
              OnKeyPress = f1KanaName1KeyPress
              ValidChars = ''
            end
            object txtFreeFld1_Account: TMTxtEdit
              Tag = 8
              Left = 472
              Top = 35
              Width = 270
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
              Font.Style = []
              ImeMode = imHira
              MaxLength = 50
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 8
              Text = ''
              OnEnter = fnEnter
              ValidChars = ''
            end
            object txtFreeFld2_Account: TMTxtEdit
              Tag = 8
              Left = 472
              Top = 62
              Width = 270
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
              Font.Style = []
              ImeMode = imHira
              MaxLength = 50
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 9
              Text = ''
              OnEnter = fnEnter
              ValidChars = ''
            end
            object txtFreeFld3_Account: TMTxtEdit
              Tag = 8
              Left = 472
              Top = 90
              Width = 270
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
              Font.Style = []
              ImeMode = imHira
              MaxLength = 50
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 10
              Text = ''
              OnEnter = fnEnter
              ValidChars = ''
            end
            object txtFreeFld4_Account: TMTxtEdit
              Tag = 8
              Left = 472
              Top = 118
              Width = 270
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
              Font.Style = []
              ImeMode = imHira
              MaxLength = 50
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 11
              Text = ''
              OnEnter = fnEnter
              ValidChars = ''
            end
            object txtFreeFld5_Account: TMTxtEdit
              Tag = 8
              Left = 472
              Top = 145
              Width = 270
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
              Font.Style = []
              ImeMode = imHira
              MaxLength = 50
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 12
              Text = ''
              OnEnter = fnEnter
              ValidChars = ''
            end
            object txtUserCode_Account: TMTxtEdit
              Tag = 8
              Left = 143
              Top = 35
              Width = 150
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
              Font.Style = []
              ImeMode = imDisable
              MaxLength = 20
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 0
              Text = ''
              OnEnter = fnEnter
              OnExit = txtUserCode_AccountExit
              OnKeyPress = txtUserCode_AccountKeyPress
              ValidChars = ''
            end
          end
        end
        object tbsKihon: TMPanel
          Left = 0
          Top = 46
          Width = 945
          Height = 374
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 1
          Visible = False
          object MLabel2: TMLabel
            Left = 32
            Top = 161
            Width = 120
            Height = 19
            AutoSize = False
            Caption = #20661#27177#31649#29702
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel18: TMLabel
            Left = 20
            Top = 160
            Width = 420
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object YSNPanel: TMPanel
            Left = 16
            Top = 182
            Width = 461
            Height = 45
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 1
            object MLabel19: TMLabel
              Left = 21
              Top = 2
              Width = 120
              Height = 17
              AutoSize = False
              Caption = #19982#20449#38480#24230#38989
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel3: TMLabel
              Left = 261
              Top = 2
              Width = 26
              Height = 19
              AutoSize = False
              Caption = #20870
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object Label4: TLabel
              Left = 21
              Top = 24
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #25163#24418#12469#12452#12488
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
            end
            object Label11: TLabel
              Left = 185
              Top = 24
              Width = 20
              Height = 19
              AutoSize = False
              Caption = #26085
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
            end
            object f1YSGKIN: TMNumEdit
              Left = 149
              Top = 2
              Width = 108
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
              Negative = False
              Separetor = True
              Validate = False
            end
            object f1TGSITE: TMNumEdit
              Left = 149
              Top = 24
              Width = 30
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
              OnChange = fnFldOnChg
              Negative = False
              Digits = 3
              Validate = False
            end
          end
          object AddPanel: TScrollBox
            Left = 0
            Top = 0
            Width = 945
            Height = 157
            HorzScrollBar.Smooth = True
            VertScrollBar.Increment = 46
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
            object MLabel15: TMLabel
              Left = 32
              Top = 2
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #21462#24341#20808#20303#25152
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object LblYUBIN: TMLabel
              Left = 40
              Top = 24
              Width = 120
              Height = 19
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
              Left = 40
              Top = 90
              Width = 120
              Height = 19
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
              Left = 40
              Top = 112
              Width = 120
              Height = 19
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
              Left = 500
              Top = 112
              Width = 49
              Height = 19
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
              Left = 204
              Top = 24
              Width = 9
              Height = 19
              AutoSize = False
              Caption = '-'
              FontRatio.Auto = False
            end
            object LblJUSHO1: TMLabel
              Left = 40
              Top = 46
              Width = 120
              Height = 19
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
              Left = 40
              Top = 134
              Width = 120
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
            object MLabel17: TMLabel
              Left = 20
              Top = 0
              Width = 880
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object f1ADS1: TMTxtEdit
              Left = 168
              Top = 46
              Width = 450
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
              Left = 168
              Top = 68
              Width = 450
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
              Left = 168
              Top = 90
              Width = 160
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
              Left = 168
              Top = 112
              Width = 300
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
              Left = 561
              Top = 112
              Width = 160
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
              Left = 168
              Top = 24
              Width = 30
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
              Negative = False
              MaxValue = 999.000000000000000000
              Digits = 3
              Validate = False
            end
            object f1POSTNO2: TMNumEdit
              Left = 216
              Top = 24
              Width = 36
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
              Negative = False
              MaxValue = 9999.000000000000000000
              Digits = 4
              Validate = False
              InputFlag = True
              InputFlagEnabled = True
              Zero = True
            end
            object f1MailAd: TMTxtEdit
              Left = 168
              Top = 134
              Width = 300
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
              TabOrder = 8
              Text = 'X(100)----------------------------------X'
              OnChange = fnFldOnChg
              ValidChars = ''
            end
            object f1KEISYO: TMTxtEdit
              Left = 726
              Top = 112
              Width = 60
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
              ValidChars = ''
            end
            object MGroupBox1: TMGroupBox
              Left = 676
              Top = 20
              Width = 253
              Height = 73
              Caption = #29694#22312#26410#20351#29992
              TabOrder = 9
              Visible = False
              object LblUSDENPFM: TMLabel
                Left = 12
                Top = 17
                Width = 91
                Height = 19
                AutoSize = False
                Caption = #32013#21697#26360#65420#65387#65392#65425
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentFont = False
                FontRatio.Auto = False
              end
              object f1USDENPFMNM: TMLabel
                Left = 73
                Top = 17
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
              object LblUSGKEI: TMLabel
                Left = 12
                Top = 40
                Width = 104
                Height = 19
                AutoSize = False
                Caption = #22770#19978#21512#35336#27396#31246#21360#23383
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentFont = False
                FontRatio.Auto = False
              end
              object f1USGKEINM: TMLabel
                Left = 73
                Top = 40
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
              object f1USDENPFM: TMNumEdit
                Left = 151
                Top = 17
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
                TabOrder = 0
                OnChange = fnFldOnChg
                Negative = False
                Digits = 2
                Validate = False
                Value = 99.000000000000000000
              end
              object f1USGKEI: TMNumEdit
                Left = 151
                Top = 40
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
                TabOrder = 1
                OnChange = fnFldOnChg
                OnExit = f1ItemsCheak
                Negative = False
                Digits = 1
                Validate = False
                Value = 9.000000000000000000
              end
            end
          end
          object PnlRyosyu: TMPanel
            Left = 464
            Top = 243
            Width = 460
            Height = 121
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 5
            object MLabel25: TMLabel
              Left = 32
              Top = 29
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #38936#21454#35388
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel30: TMLabel
              Left = 40
              Top = 48
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #38936#21454#35388#65420#65387#65392#65425
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object f1RYOPFMNM: TLabel
              Left = 212
              Top = 48
              Width = 148
              Height = 19
              AutoSize = False
              Caption = 'X(20)--------------X'
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
            end
            object MLabel31: TMLabel
              Left = 40
              Top = 70
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #38936#21454#35388#12398#20294#12375#26360#12365
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object f1RYOTEKINM: TLabel
              Left = 212
              Top = 70
              Width = 148
              Height = 19
              AutoSize = False
              Caption = 'X(20)--------------X'
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
            end
            object MLabel32: TMLabel
              Left = 40
              Top = 92
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #38598#37329#29992#38936#21454#35388
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object f1SYURYOKBNNM: TLabel
              Left = 212
              Top = 92
              Width = 148
              Height = 19
              AutoSize = False
              Caption = 'X(20)--------------X'
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
            end
            object MLabel20: TMLabel
              Left = 20
              Top = 25
              Width = 420
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object MLabel36: TMLabel
              Left = 20
              Top = 115
              Width = 420
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object f1RYOPFM: TMNumEdit
              Left = 168
              Top = 50
              Width = 24
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
              TabOrder = 0
              OnChange = fnFldOnChg
              OnEnter = fnEnter
              Negative = False
              Digits = 2
              Validate = False
              Value = 99.000000000000000000
            end
            object f1RYOTEKI: TMNumEdit
              Left = 168
              Top = 71
              Width = 24
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
              TabOrder = 1
              OnChange = fnFldOnChg
              OnEnter = fnEnter
              Negative = False
              Digits = 1
              Validate = False
              Value = 9.000000000000000000
            end
            object f1SYURYOKBN: TMNumEdit
              Left = 168
              Top = 92
              Width = 24
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
              OnEnter = fnEnter
              Negative = False
              Digits = 1
              Validate = False
              Value = 9.000000000000000000
            end
          end
          object SKPanel: TMPanel
            Left = 16
            Top = 229
            Width = 449
            Height = 49
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 2
            object Label1: TLabel
              Left = 21
              Top = 0
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #35531#27714#26360#65420#65387#65392#65425
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
            end
            object f1SSDENPFMNM: TMLabel
              Left = 193
              Top = 0
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
              Left = 194
              Top = 22
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
            object MLabel29: TMLabel
              Left = 21
              Top = 22
              Width = 120
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
            object MLabel34: TMLabel
              Left = 3
              Top = 90
              Width = 420
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object f1SSDENPFM: TMNumEdit
              Left = 149
              Top = 0
              Width = 24
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
              TabOrder = 0
              OnChange = fnFldOnChg
              Negative = False
              Digits = 2
              Validate = False
              Value = 99.000000000000000000
            end
            object f1SSGKEI: TMNumEdit
              Left = 149
              Top = 22
              Width = 24
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
              TabOrder = 1
              OnChange = fnFldOnChg
              OnExit = f1ItemsCheak
              Negative = False
              Digits = 1
              Validate = False
              Value = 9.000000000000000000
            end
          end
          object PnlKanri: TMPanel
            Left = 22
            Top = 371
            Width = 425
            Height = 105
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 6
            object MLabel22: TMLabel
              Left = 2
              Top = 120
              Width = 400
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object PnlUri: TMPanel
              Left = 3
              Top = 69
              Width = 381
              Height = 48
              BevelOuter = bvNone
              ParentBackground = False
              ParentColor = True
              TabOrder = 0
            end
          end
          object PnlNayoseInfo: TMPanel
            Left = 15
            Top = 275
            Width = 465
            Height = 97
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 3
            object NayoseOyaLabel: TMLabel
              Left = 18
              Top = 63
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #21517#23492#12379#35242#20195#26367#24471#24847#20808
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1NayoseNM: TMLabel
              Left = 286
              Top = 63
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
              FontRatio.Auto = True
            end
            object SeikyuKbnLabel: TLabel
              Left = 20
              Top = 40
              Width = 118
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
            end
            object f1SKYKBNNM: TMLabel
              Left = 191
              Top = 40
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
              Left = 15
              Top = -4
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
            object MLabel21: TMLabel
              Left = 3
              Top = 84
              Width = 420
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object cbNykRootKbn: TMCheckBox
              Left = 22
              Top = 19
              Width = 148
              Height = 19
              Caption = #21517#23492#12379#12398#35242#12392#12375#12390#25505#29992
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = cbNykRootKbnClick
            end
            object f1NayoseOyaCode: TMTxtEdit
              Tag = 22
              Left = 146
              Top = 63
              Width = 125
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
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
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
            object f1SKYKBN: TMNumEdit
              Tag = 10
              Left = 147
              Top = 40
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
          end
          object KJPanel: TMPanel
            Left = 478
            Top = 152
            Width = 460
            Height = 92
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 4
            object MLabel39: TMLabel
              Left = 4
              Top = 7
              Width = 420
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object MLabel40: TMLabel
              Left = 20
              Top = 118
              Width = 420
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object LblBMCODE: TMLabel
              Left = 24
              Top = 34
              Width = 121
              Height = 21
              AutoSize = False
              Caption = #37096#38272#65402#65392#65412#65438
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object f1BMNAME: TMLabel
              Left = 250
              Top = 34
              Width = 148
              Height = 21
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
              Left = 250
              Top = 56
              Width = 148
              Height = 21
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
            object LblTNCODE: TMLabel
              Left = 24
              Top = 56
              Width = 121
              Height = 21
              AutoSize = False
              Caption = #25285#24403#32773#65402#65392#65412#65438
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = True
            end
            object MLabel14: TMLabel
              Left = 15
              Top = 15
              Width = 120
              Height = 12
              AutoSize = False
              Caption = #22238#21454#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1BMCODE: TMTxtEdit
              Left = 152
              Top = 34
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
              OnKeyPress = f1BMCODEKeyPress
              ValidChars = ''
            end
            object f1TNCODE: TMTxtEdit
              Tag = 22
              Left = 152
              Top = 59
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
        object tbsNyukin: TMPanel
          Left = 0
          Top = 46
          Width = 945
          Height = 374
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 2
          Visible = False
          object MLabel4: TMLabel
            Left = 32
            Top = 4
            Width = 100
            Height = 19
            AutoSize = False
            Caption = #22238#21454#26041#27861
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel8: TMLabel
            Left = 20
            Top = 0
            Width = 780
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel1: TMLabel
            Left = 40
            Top = 24
            Width = 120
            Height = 19
            AutoSize = False
            Caption = #20998#35299#26041#27861
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object f1BunkaiNM: TMLabel
            Left = 151
            Top = 24
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
          object MLabel23: TMLabel
            Left = 20
            Top = 160
            Width = 780
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object KAIJY1Label: TMLabel
            Left = 596
            Top = 10
            Width = 161
            Height = 19
            Alignment = taRightJustify
            AutoSize = False
            Caption = '10,000,000,000'#20870' '#26410#28288
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            Visible = False
            FontRatio.Auto = False
          end
          object PkaisyuHouhou: TMPanel
            Left = 35
            Top = 60
            Width = 493
            Height = 63
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            OnExit = PkaisyuHouhouExit
            object MLabel37: TMLabel
              Left = 0
              Top = 0
              Width = 25
              Height = 20
              Alignment = taCenter
              AutoSize = False
              Caption = 'NO'
              Color = 16766672
              ParentColor = False
              BorderLine = tmb3DUp
              FontRatio.Auto = False
            end
            object MLabel33: TMLabel
              Left = 25
              Top = 0
              Width = 174
              Height = 20
              Alignment = taCenter
              AutoSize = False
              Caption = #22238#21454#26041#27861
              Color = 16766672
              ParentColor = False
              BorderLine = tmb3DUp
              FontRatio.Auto = False
            end
            object MLabel38: TMLabel
              Left = 0
              Top = 20
              Width = 25
              Height = 20
              Alignment = taCenter
              AutoSize = False
              Caption = '1'
              Color = 16766672
              ParentColor = False
              BorderLine = tmb3DUp
              FontRatio.Auto = False
            end
            object MLabel41: TMLabel
              Left = 0
              Top = 42
              Width = 25
              Height = 19
              Alignment = taCenter
              AutoSize = False
              Caption = '2'
              Color = 16766672
              ParentColor = False
              DiagonalWidth = 2
              BorderLine = tmb3DUp
              FontRatio.Auto = False
            end
            object f1KAIJYNM1: TMLabel
              Left = 50
              Top = 21
              Width = 148
              Height = 20
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Color = clWhite
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentColor = False
              ParentFont = False
              MLeftMargin = 10
              FontRatio.Auto = False
            end
            object f1KAIJYNM2: TMLabel
              Left = 50
              Top = 42
              Width = 148
              Height = 20
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Color = clWhite
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentColor = False
              ParentFont = False
              MLeftMargin = 10
              FontRatio.Auto = False
            end
            object MLabel42: TMLabel
              Left = 199
              Top = 0
              Width = 156
              Height = 20
              Alignment = taCenter
              AutoSize = False
              Caption = #20998#35299#22522#28310#20516
              Color = 16766672
              ParentColor = False
              BorderLine = tmb3DUp
              FontRatio.Auto = False
            end
            object MLabel43: TMLabel
              Left = 355
              Top = 0
              Width = 138
              Height = 20
              Alignment = taCenter
              AutoSize = False
              Caption = #31471#25968#20966#29702#26041#27861
              Color = 16766672
              ParentColor = False
              BorderLine = tmb3DUp
              FontRatio.Auto = False
            end
            object f1KAIHasuNM: TMLabel
              Left = 380
              Top = 21
              Width = 112
              Height = 20
              AutoSize = False
              Caption = 'X(20)----X---------X'
              Color = clWhite
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel7: TMLabel
              Left = 355
              Top = 42
              Width = 137
              Height = 20
              AutoSize = False
              Color = clWhite
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = False
            end
            object kijyun1Label: TMLabel
              Left = 324
              Top = 21
              Width = 30
              Height = 20
              Alignment = taCenter
              AutoSize = False
              Caption = #26410#28288
              Color = clWhite
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = False
            end
            object kijyun2Label: TMLabel
              Left = 324
              Top = 42
              Width = 30
              Height = 20
              Alignment = taCenter
              AutoSize = False
              Caption = #20197#19978
              Color = clWhite
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentColor = False
              ParentFont = False
              FontRatio.Auto = False
            end
            object KAIJY2Label: TMLabel
              Left = 199
              Top = 42
              Width = 124
              Height = 20
              Alignment = taRightJustify
              AutoSize = False
              Color = clWhite
              Enabled = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ParentColor = False
              ParentFont = False
              MTopMargin = 1
              FontRatio.Auto = False
            end
            object f1KAIJY1: TMNumEdit
              Left = 25
              Top = 21
              Width = 24
              Height = 20
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '1:'#29694#37329
                '2:'#25391#36796
                '3:'#25163#24418
                '4:'#30456#27578)
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              BorderStyle = bsNone
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              MTopMargin = 3
              MRightMargin = 3
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              OnChange = fnFldOnChg
              OnExit = f1ItemsCheak
              Negative = False
              Digits = 1
              Validate = False
              Value = 9.000000000000000000
            end
            object f1KAIJY2: TMNumEdit
              Left = 25
              Top = 42
              Width = 24
              Height = 20
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              BorderStyle = bsNone
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              MTopMargin = 3
              MRightMargin = 3
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 4
              OnChange = fnFldOnChg
              OnExit = f1ItemsCheak
              Negative = False
              Digits = 1
              Validate = False
              Value = 9.000000000000000000
            end
            object f1KAIHasu: TMNumEdit
              Left = 355
              Top = 21
              Width = 24
              Height = 20
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '0:'#20999#12426#25448#12390
                '1:'#20999#12426#19978#12370
                '2:'#22235#25448#20116#20837)
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              BorderStyle = bsNone
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              MTopMargin = 3
              MRightMargin = 3
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 3
              OnChange = fnFldOnChg
              OnExit = f1ItemsCheak
              Negative = False
              Digits = 1
              Validate = False
              Value = 9.000000000000000000
              Zero = True
            end
            object f1KAISYWKIN: TMNumEdit
              Tag = 8000
              Left = 199
              Top = 21
              Width = 124
              Height = 20
              ArrowDisp = adNone
              SelectDisp = sdNone
              ArrowType = atArrow
              AutoSize = False
              BorderStyle = bsNone
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              MTopMargin = 5
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 2
              OnChange = f1KAISYWKINChange
              Negative = False
              MaxValue = 2.000000000000000000
              Separetor = True
              Digits = 11
              Validate = False
            end
            object f1KAIRITU: TMNumEdit
              Tag = 8000
              Left = 199
              Top = 21
              Width = 124
              Height = 20
              ArrowDisp = adNone
              SelectDisp = sdNone
              ArrowType = atArrow
              AutoSize = False
              BorderStyle = bsNone
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              ImeMode = imClose
              MTopMargin = 5
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 1
              OnChange = f1KAIRITUChange
              Negative = False
              MaxValue = 100.000000000000000000
              Separetor = True
              Decimals = 2
              Digits = 5
              Validate = True
              Value = 999.000000000000000000
            end
          end
          object PMatching: TMPanel
            Left = 0
            Top = 162
            Width = 920
            Height = 207
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 2
            object MLabel5: TMLabel
              Left = 32
              Top = 2
              Width = 100
              Height = 19
              AutoSize = False
              Caption = #12510#12483#12481#12531#12464#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLf1KanaName1: TMLabel
              Left = 40
              Top = 22
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #12459#12490#21517#31216'1'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLf1TesuryoFutan: TMLabel
              Left = 40
              Top = 92
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #25163#25968#26009#36000#25285#21306#20998
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1TesuryoFutanNm: TMLabel
              Left = 224
              Top = 92
              Width = 148
              Height = 17
              AutoSize = False
              Caption = #33258#31038#36000#25285
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLf1Ku: TMLabel
              Left = 40
              Top = 114
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #65317#65316#65321#12539#20206#24819#21475#24231#21306#20998
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1KuNm: TMLabel
              Left = 224
              Top = 114
              Width = 148
              Height = 17
              AutoSize = False
              Caption = #65317#65316#65321#25505#29992#12354#12426
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object LblDefoltEDI: TMLabel
              Left = 40
              Top = 136
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #65317#65316#65321#12539#20206#24819#21475#24231#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel6: TMLabel
              Left = 20
              Top = 168
              Width = 780
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object MLf1KanaName2: TMLabel
              Left = 39
              Top = 44
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #12459#12490#21517#31216'2'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLf1KanaName3: TMLabel
              Left = 40
              Top = 66
              Width = 120
              Height = 19
              AutoSize = False
              Caption = #12459#12490#21517#31216'3'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object f1KanaName1: TMTxtEdit
              Tag = 8
              Left = 180
              Top = 22
              Width = 350
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
              Font.Style = []
              Hankaku = True
              ImeMode = imSKata
              MaxLength = 40
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              Text = ''
              OnChange = fnFldOnChg
              OnExit = f1KanaName1Exit
              OnKeyPress = f1KanaName1KeyPress
              ValidChars = ''
            end
            object f1TesuryoFutan: TMNumEdit
              Tag = 9
              Left = 180
              Top = 92
              Width = 24
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              OnArrowClick = f1TesuryoFutanArrowClick
              FocusedColor = clAqua
              ArrowType = atArrow
              F4Arrow = True
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
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              OnChange = f1TesuryoFutanChange
              OnEnter = TMNum_KnjkmkEnter
              OnExit = f1ItemsCheak
              Negative = False
              MaxValue = 1.000000000000000000
              MinValue = 1.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
            object f1Ku: TMNumEdit
              Tag = 10
              Left = 180
              Top = 114
              Width = 24
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              OnArrowClick = f1TesuryoFutanArrowClick
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
              TabOrder = 4
              OnChange = f1TesuryoFutanChange
              OnEnter = TMNum_KnjkmkEnter
              OnExit = f1ItemsCheak
              Negative = False
              MaxValue = 1.000000000000000000
              MinValue = 1.000000000000000000
              Digits = 1
              Validate = False
              Zero = True
            end
            object f1DefoltEDI: TMTxtEdit
              Tag = 11
              Left = 180
              Top = 136
              Width = 220
              Height = 19
              ArrowDisp = adNone
              SelectDisp = sdNone
              ArrowType = atArrow
              TagStr = ''
              AutoSize = False
              Enabled = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Hankaku = True
              ImeMode = imClose
              MaxLength = 20
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 5
              Text = ''
              TrimOption = toTrimRight
              OnChange = fnFldOnChg
              OnEnter = TMNum_KnjkmkEnter
              OnExit = f1ItemsCheak
              ValidChars = ''
            end
            object f1KanaName2: TMTxtEdit
              Tag = 8
              Left = 180
              Top = 44
              Width = 350
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
              Font.Style = []
              Hankaku = True
              ImeMode = imSKata
              MaxLength = 40
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 1
              Text = ''
              OnChange = fnFldOnChg
              OnExit = f1KanaName1Exit
              OnKeyPress = f1KanaName1KeyPress
              ValidChars = ''
            end
            object f1KanaName3: TMTxtEdit
              Tag = 8
              Left = 180
              Top = 66
              Width = 350
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
              Font.Style = []
              Hankaku = True
              ImeMode = imSKata
              MaxLength = 40
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 2
              Text = ''
              OnChange = fnFldOnChg
              OnExit = f1KanaName1Exit
              OnKeyPress = f1KanaName1KeyPress
              ValidChars = ''
            end
          end
          object f1Bunkai: TMNumEdit
            Left = 107
            Top = 24
            Width = 24
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0:'#27604#29575
              '1:'#23450#38989)
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
            OnChange = f1BunkaiChange
            OnExit = f1ItemsCheak
            Negative = False
            Digits = 1
            Validate = False
            Value = 9.000000000000000000
            Zero = True
          end
        end
        object tbsDenshiSaiken: TMPanel
          Left = 0
          Top = 46
          Width = 945
          Height = 374
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 3
          Visible = False
          object MPDensaiKirokukikanInfo: TMPanel
            Left = 5
            Top = 3
            Width = 931
            Height = 70
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 0
            object MLabel47: TMLabel
              Left = 25
              Top = 8
              Width = 160
              Height = 18
              AutoSize = False
              Caption = #38651#23376#20661#27177#12487#12540#12479#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLDenDataKbn: TMLabel
              Left = 40
              Top = 35
              Width = 105
              Height = 18
              AutoSize = False
              Caption = #38651#23376#20661#27177#12487#12540#12479#31278#21029
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLDenDataKbnName: TMLabel
              Left = 207
              Top = 35
              Width = 160
              Height = 18
              AutoSize = False
              FontRatio.Auto = False
            end
            object MLabel45: TMLabel
              Left = 1
              Top = 0
              Width = 850
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object MLabel9: TMLabel
              Left = 2
              Top = 66
              Width = 850
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object MNDenDataKbn: TMNumEdit
              Left = 166
              Top = 34
              Width = 22
              Height = 19
              ArrowDisp = adAlways
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '1:'#12391#12435#12373#12356
                '2:'#65322#65317#65325#65315#65327#38651#25163)
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              DMaxLength = 1
              ImeMode = imDisable
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              OnChange = MNDenDataKbnChange
              OnEnter = fnEnter
              OnExit = MNDenDataKbnExit
              Negative = False
              Digits = 1
              Validate = False
              Value = 1.000000000000000000
              InputFlagEnabled = True
            end
          end
          object MPDensaiCsInfo: TMPanel
            Left = 5
            Top = 70
            Width = 800
            Height = 300
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 1
            object MLDensaiCsInfo: TMLabel
              Left = 25
              Top = 8
              Width = 193
              Height = 19
              AutoSize = False
              Caption = #12391#12435#12373#12356#12493#12483#12488#21462#24341#20808#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object lblAccKbnName_Denshi: TMLabel
              Left = 178
              Top = 116
              Width = 54
              Height = 19
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object PGridDensai1: TMPanel
              Left = 40
              Top = 36
              Width = 672
              Height = 240
              BevelInner = bvLowered
              BevelOuter = bvNone
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentBackground = False
              ParentColor = True
              ParentFont = False
              TabOrder = 0
              object DGridDensai1: TdxDBGrid
                Left = 1
                Top = 1
                Width = 670
                Height = 238
                Bands = <
                  item
                    Caption = #21033#29992#32773#30058#21495'(9'#26689')'
                  end
                  item
                    Caption = #12459#12490#21517#31216
                  end
                  item
                    Caption = #37504#34892#12467#12540#12489
                  end
                  item
                    Caption = #25903#24215#12467#12540#12489
                  end
                  item
                    Caption = #38928#37329#31278#30446
                  end
                  item
                    Caption = #21475#24231#30058#21495
                  end>
                DefaultLayout = False
                HeaderPanelRowCount = 1
                KeyField = 'RecId'
                SummaryGroups = <>
                SummarySeparator = ', '
                Align = alClient
                BorderStyle = bsNone
                TabOrder = 0
                OnEnter = DGridDensai1Enter
                OnExit = DGridDensai1Exit
                OnKeyPress = DGridDensai1KeyPress
                OnMouseDown = DGridDensai1MouseDown
                DataSource = DDataSourceDensai1
                HideFocusRect = True
                HideSelection = True
                HighlightTextColor = clWindowText
                LookAndFeel = lfFlat
                Options = [egoColumnSizing, egoColumnMoving, egoEditing, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoLoadAllRecords, egoIndicator]
                ShowBands = True
                ShowHeader = False
                OnBeforeChangeColumn = DGridDensai1BeforeChangeColumn
                object DGridDensai1UserID: TdxDBGridColumn
                  Caption = #21033#29992#32773#30058#21495
                  Width = 100
                  BandIndex = 0
                  RowIndex = 0
                  ImeMode = imClose
                  MaxLength = 9
                  Hankaku = True
                  StretchChar.Auto = False
                  FieldName = 'UserID'
                end
                object DGridDensai1KanaName: TdxDBGridColumn
                  Caption = #12459#12490#21517#31216
                  Width = 240
                  BandIndex = 1
                  RowIndex = 0
                  ImeMode = imSKata
                  MaxLength = 60
                  Hankaku = True
                  StretchChar.Auto = False
                  FieldName = 'KanaName'
                end
                object DGridDensai1BankCode: TdxDBGridColumn
                  Caption = #37504#34892#12467#12540#12489
                  Width = 68
                  BandIndex = 2
                  RowIndex = 0
                  ImeMode = imDisable
                  EditAlignment = taRightJustify
                  MaxLength = 4
                  StretchChar.Auto = False
                  FieldName = 'BankCode'
                end
                object DGridDensai1BranchCode: TdxDBGridColumn
                  Caption = #25903#24215#12467#12540#12489
                  Width = 68
                  BandIndex = 3
                  RowIndex = 0
                  ImeMode = imDisable
                  EditAlignment = taRightJustify
                  MaxLength = 3
                  StretchChar.Auto = False
                  FieldName = 'BranchCode'
                end
                object DGridDensai1AccKbn: TdxDBGridLookupColumn
                  Caption = #38928#37329#31278#30446
                  MinWidth = 12
                  Width = 20
                  BandIndex = 4
                  RowIndex = 0
                  ImeMode = imDisable
                  EditAlignment = taRightJustify
                  MaxLength = 1
                  StretchChar.Auto = False
                  FieldName = 'AccKbn'
                  DropDownSelectEx = False
                  DropDownRows = 3
                  ListFieldName = 'Code;Name'
                  ListWidth = 97
                end
                object DGridDensai1AccKbnName: TdxDBGridMaskColumn
                  Caption = #38928#37329#31278#30446#21517#31216
                  DisableEditor = True
                  ReadOnly = True
                  TabStop = False
                  Width = 60
                  BandIndex = 4
                  RowIndex = 0
                  ImeMode = imDisable
                  StretchChar.Auto = False
                  FieldName = 'AccKbnName'
                end
                object DGridDensai1AccNo: TdxDBGridColumn
                  Caption = #21475#24231#30058#21495
                  Width = 80
                  BandIndex = 5
                  RowIndex = 0
                  ImeMode = imDisable
                  EditAlignment = taRightJustify
                  MaxLength = 7
                  StretchChar.Auto = False
                  FieldName = 'AccNo'
                end
              end
            end
          end
          object MPJemcoCsInfo: TMPanel
            Left = 477
            Top = 74
            Width = 452
            Height = 229
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 2
            Visible = False
            object MLJEMCOCsInfo: TMLabel
              Left = 25
              Top = 8
              Width = 193
              Height = 19
              AutoSize = False
              Caption = #65322#65317#65325#65315#65327#21462#24341#20808#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLJemcoUserID1: TMLabel
              Left = 40
              Top = 35
              Width = 90
              Height = 18
              AutoSize = False
              Caption = #12362#23458#27096#30058#21495
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLJemcoUserID2: TMLabel
              Left = 39
              Top = 63
              Width = 66
              Height = 18
              AutoSize = False
              Caption = #12362#23458#27096#30058#21495
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLComment_4keta: TMLabel
              Left = 104
              Top = 35
              Width = 33
              Height = 18
              AutoSize = False
              Caption = '(4'#26689')'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel11: TMLabel
              Left = 104
              Top = 63
              Width = 34
              Height = 18
              AutoSize = False
              Caption = '(7'#26689')'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clBlue
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MTJemcoUserID1: TMTxtEdit
              Tag = 8
              Left = 146
              Top = 35
              Width = 44
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdArrowClick
              ArrowType = atArrow
              F4Arrow = True
              TagStr = ''
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Hankaku = True
              ImeMode = imDisable
              MaxLength = 4
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              Text = ''
              OnEnter = fnEnter
              OnExit = MTDensaiUserIDExit
              OnKeyPress = f1NumNameKeyPress
              ValidChars = ''
            end
            object MTJemcoUserID2: TMTxtEdit
              Tag = 8
              Left = 145
              Top = 63
              Width = 69
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
              Font.Style = []
              Hankaku = True
              ImeMode = imDisable
              MaxLength = 7
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 1
              Text = ''
              OnEnter = fnEnter
              OnExit = f1KanaName1Exit
              OnKeyPress = f1NumNameKeyPress
              ValidChars = ''
            end
          end
        end
        object tbsGaikaInfo: TMPanel
          Left = 0
          Top = 46
          Width = 945
          Height = 374
          Align = alClient
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 5
          object pnlGaikaHeader: TMPanel
            Left = 0
            Top = 0
            Width = 945
            Height = 70
            Align = alTop
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 0
            object MLabel61: TMLabel
              Left = 25
              Top = 8
              Width = 160
              Height = 18
              AutoSize = False
              Caption = #22806#36008#20837#37329#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel62: TMLabel
              Left = 40
              Top = 35
              Width = 105
              Height = 18
              AutoSize = False
              Caption = #25505#29992#21306#20998
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object lblSaiyoKbn_Gaika: TMLabel
              Left = 207
              Top = 35
              Width = 160
              Height = 18
              AutoSize = False
              FontRatio.Auto = False
            end
            object MLabel64: TMLabel
              Left = 1
              Top = 0
              Width = 850
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object numSaiyoKbn_Gaika: TMNumEdit
              Left = 166
              Top = 34
              Width = 22
              Height = 19
              ArrowDisp = adAlways
              SelectDisp = sdArrowClick
              SelectItems.Strings = (
                '1:'#12391#12435#12373#12356
                '2:'#65322#65317#65325#65315#65327#38651#25163)
              ArrowType = atArrow
              F4Arrow = True
              AutoSize = False
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#26126#26397
              Font.Style = []
              DMaxLength = 1
              ImeMode = imDisable
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              OnChange = numSaiyoKbn_GaikaChange
              OnEnter = fnEnter
              Negative = False
              Digits = 1
              Validate = False
              Value = 1.000000000000000000
              InputFlagEnabled = True
              Zero = True
            end
          end
          object pnlGaikaDetail: TMPanel
            Left = 0
            Top = 70
            Width = 945
            Height = 304
            Align = alClient
            BevelOuter = bvNone
            Color = 15921906
            ParentBackground = False
            TabOrder = 1
            object MLabel69: TMLabel
              Left = 2
              Top = 0
              Width = 850
              Height = 1
              AutoSize = False
              Color = clSilver
              ParentColor = False
              FontRatio.Auto = False
            end
            object MLabel63: TMLabel
              Left = 25
              Top = 8
              Width = 138
              Height = 19
              AutoSize = False
              Caption = #22806#36008#12510#12483#12481#12531#12464#24773#22577
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = [fsBold]
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel66: TMLabel
              Left = 39
              Top = 31
              Width = 109
              Height = 19
              AutoSize = False
              Caption = #36865#37329#20381#38972#20154#21517#31216'1'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel67: TMLabel
              Left = 39
              Top = 53
              Width = 101
              Height = 19
              AutoSize = False
              Caption = #36865#37329#20381#38972#20154#21517#31216'2'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object MLabel68: TMLabel
              Left = 39
              Top = 75
              Width = 101
              Height = 19
              AutoSize = False
              Caption = #36865#37329#20381#38972#20154#21517#31216'3'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              FontRatio.Auto = False
            end
            object txtSoukinName1_Gaika: TMTxtEdit
              Tag = 8
              Left = 166
              Top = 31
              Width = 687
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
              Font.Style = []
              Hankaku = True
              ImeMode = imSAlpha
              MaxLength = 150
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 0
              Text = ''
              OnChange = fnFldOnChg
              OnExit = f1KanaName1Exit
              OnKeyPress = f1KanaName1KeyPress
              ValidChars = ''
            end
            object txtSoukinName2_Gaika: TMTxtEdit
              Tag = 8
              Left = 166
              Top = 53
              Width = 687
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
              Font.Style = []
              Hankaku = True
              ImeMode = imSAlpha
              MaxLength = 150
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 1
              Text = ''
              OnChange = fnFldOnChg
              OnExit = f1KanaName1Exit
              OnKeyPress = f1KanaName1KeyPress
              ValidChars = ''
            end
            object txtSoukinName3_Gaika: TMTxtEdit
              Tag = 8
              Left = 166
              Top = 75
              Width = 687
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
              Font.Style = []
              Hankaku = True
              ImeMode = imSAlpha
              MaxLength = 150
              FontRatio.Auto = True
              ParentFont = False
              TabOrder = 2
              Text = ''
              OnChange = fnFldOnChg
              OnExit = f1KanaName1Exit
              OnKeyPress = f1KanaName1KeyPress
              ValidChars = ''
            end
          end
        end
        object DtlCsTab: TMTab
          Left = 0
          Top = 0
          Width = 945
          Height = 46
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
              Caption = #20837#37329#24773#22577
              Color = 16766672
              SyncControl = tbsNyukin
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #38651#23376#35352#37682#20661#27177#24773#22577
              Color = 16766672
              SyncControl = tbsDenshiSaiken
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #21475#24231#25391#26367#24773#22577
              Color = 16766672
              SyncControl = tbsAccountInfo
              Alignment = taCenter
              ImageIndex = -1
              ParentBorderCaption = True
            end
            item
              Caption = #22806#36008#24773#22577
              Color = 16766672
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
      object HedCsTab: TMTab
        Left = 0
        Top = 0
        Width = 945
        Height = 46
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
        Top = 46
        Width = 945
        Height = 28
        Align = alTop
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 1
        object LblTRCODE: TMLabel
          Left = 16
          Top = 4
          Width = 100
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
          Left = 123
          Top = 4
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
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MaxLength = 10
          FontRatio.Auto = True
          ParentFont = False
          TabOrder = 0
          Text = ''
          OnEnter = fnEnter
          OnExit = f0CODEExit
          ValidChars = ''
        end
        object f1NAME: TMTxtEdit
          Left = 313
          Top = 4
          Width = 430
          Height = 19
          TabStop = False
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          TagStr = ''
          AutoSize = False
          Enabled = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imHira
          MaxLength = 40
          FontRatio.Auto = True
          ParentColor = True
          ParentFont = False
          TabOrder = 1
          Text = ''
          ValidChars = ''
        end
        object TempMode: TPanel
          Left = 751
          Top = 4
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
      object Memo1: TMemo
        Left = 271
        Top = 0
        Width = 161
        Height = 25
        Lines.Strings = (
          '///'#12497#12493#12523#24773#22577'///'
          'DtlCsMainPanel'
          '-DtlCsSub02Panel'
          '-DtlCsSub01Panel'
          '--tbsKihon'
          '--tbsNyukin'
          '--tbsDenshiSaiken'
          '')
        TabOrder = 4
        Visible = False
      end
    end
    object PnlButton: TMPanel
      Left = 0
      Top = 494
      Width = 945
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        945
        40)
      object Image_Fusen_Red: TImage
        Left = 456
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
        Left = 472
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
        Left = 488
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
        Left = 504
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
        Left = 520
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
        Left = 728
        Top = 8
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
        TabOrder = 2
        OnClick = BtnClick
      end
      object MBitBtnCancel: TMBitBtn
        Left = 812
        Top = 8
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
        TabOrder = 3
        OnClick = BtnClick
      end
      object MBitBtnBefor: TMBitBtn
        Tag = 10
        Left = 560
        Top = 8
        Width = 80
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #21069#12408'(&L)'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
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
        ParentFont = False
        TabOrder = 0
        TabStop = False
        OnClick = BtnClick
      end
      object MBitBtnAfter: TMBitBtn
        Tag = 10
        Left = 644
        Top = 8
        Width = 80
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #27425#12408'(&N)'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
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
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 1
        TabStop = False
        OnClick = BtnClick
      end
    end
  end
  object MPanel3: TMPanel
    Left = 0
    Top = 534
    Width = 945
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object MSPFunctionBar: TMSPFunctionBar
      Left = 0
      Top = 0
      Width = 945
      Height = 19
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
      ButtonWidth = 118
      FuncAnchors = True
      OnFunctionClick = MSPFunctionBarFunctionClick
      SysBaseColorB = 10841658
      SysBaseColorD = 6956042
    end
    object CmnStatusBar: TMStatusBar
      Left = 0
      Top = 19
      Width = 945
      Height = 19
      Color = 15921906
      Panels = <>
      SimplePanel = True
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
    Left = 194
    Top = 544
  end
  object MemNayose: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = MemNayoseBeforePost
    Left = 234
    Top = 544
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
    object MemNayoseNknNCode: TFloatField
      FieldName = 'NknNCode'
    end
    object MemNayoseOyaNCode: TFloatField
      FieldName = 'OyaNCode'
    end
    object MemNayoseUsKinKbn: TIntegerField
      FieldName = 'UsKinKbn'
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
  end
  object aclExec: TActionList
    Left = 276
    Top = 544
    object AcTemplate: TAction
      Category = 'Function'
      Caption = #12486#12531#12503#12524#12540#12488
      OnExecute = AcTemplateExecute
    end
    object AcCloseDay: TAction
      Category = 'Function'
      Caption = 'AcCloseDay'
      OnExecute = AcCloseDayExecute
    end
  end
  object StdProc3: TFDStoredProc
    StoredProcName = 'PRC_MA0130_011'
    Left = 18
    Top = 543
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
    StoredProcName = 'PRC_MA0130_106'
    Left = 142
    Top = 543
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
    StoredProcName = 'PRC_MA0130_104'
    Left = 100
    Top = 543
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
    StoredProcName = 'PRC_MA0130_103'
    Left = 58
    Top = 543
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
  object StdProc7: TFDStoredProc
    StoredProcName = 'PRC_MA0130_013'
    Left = 17
    Top = 502
    ParamData = <
      item
        Name = '@pTRNCD'
        DataType = ftFloat
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
  object MDPrint: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 357
    Top = 547
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
    object MDPrintMail3: TStringField
      FieldName = 'Mail3'
      Size = 60
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
    object MDPrintYsGKin: TFloatField
      FieldName = 'YsGKin'
    end
    object MDPrintSite: TFloatField
      FieldName = 'Site'
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
    object MDPrintBunkaiKbn: TIntegerField
      FieldName = 'BunkaiKbn'
    end
    object MDPrintBunkaiNm: TStringField
      FieldName = 'BunkaiNm'
      Size = 60
    end
    object MDPrintStdRitu: TFloatField
      FieldName = 'StdRitu'
    end
    object MDPrintStdKin: TFloatField
      FieldName = 'StdKin'
    end
    object MDPrintJouken1: TIntegerField
      FieldName = 'Jouken1'
    end
    object MDPrintJouken2: TIntegerField
      FieldName = 'Jouken2'
    end
    object MDPrintJouken1Nm: TStringField
      FieldName = 'Jouken1Nm'
      Size = 60
    end
    object MDPrintJouken2Nm: TStringField
      FieldName = 'Jouken2Nm'
      Size = 60
    end
    object MDPrintKanaName: TStringField
      FieldName = 'KanaName'
      Size = 60
    end
    object MDPrintKanaName2: TStringField
      FieldName = 'KanaName2'
      Size = 60
    end
    object MDPrintKanaName3: TStringField
      FieldName = 'KanaName3'
      Size = 60
    end
    object MDPrintTesuryoFutan: TIntegerField
      FieldName = 'TesuryoFutan'
    end
    object MDPrintTesuryoNm: TStringField
      FieldName = 'TesuryoNm'
      Size = 60
    end
    object MDPrintEDIKbn: TIntegerField
      FieldName = 'EDIKbn'
    end
    object MDPrintEDINm: TStringField
      FieldName = 'EDINm'
      Size = 60
    end
    object MDPrintDefoltEDI: TStringField
      FieldName = 'DefoltEDI'
      Size = 60
    end
    object MDPrintOyaNCd: TStringField
      FieldName = 'OyaNCd'
      Size = 60
    end
    object MDPrintOyaNm: TStringField
      FieldName = 'OyaNm'
      Size = 60
    end
    object MDPrintnSSsyoPfm: TIntegerField
      FieldName = 'nSSsyoPfm'
    end
    object MDPrintnSSsyoPfmNm: TStringField
      FieldName = 'nSSsyoPfmNm'
      Size = 60
    end
    object MDPrintnSSsyoKgm: TIntegerField
      FieldName = 'nSSsyoKgm'
    end
    object MDPrintnSSsyoKgmNm: TStringField
      FieldName = 'nSSsyoKgmNm'
      Size = 60
    end
    object MDPrintnRyoPfm: TIntegerField
      FieldName = 'nRyoPfm'
    end
    object MDPrintnRyoPfmNm: TStringField
      FieldName = 'nRyoPfmNm'
      Size = 60
    end
    object MDPrintnRyoTeki: TIntegerField
      FieldName = 'nRyoTeki'
    end
    object MDPrintnRyoTekiNm: TStringField
      FieldName = 'nRyoTekiNm'
      Size = 60
    end
    object MDPrintnSyuRyoKbn: TIntegerField
      FieldName = 'nSyuRyoKbn'
    end
    object MDPrintnSyuRyoKbnNm: TStringField
      FieldName = 'nSyuRyoKbnNm'
      Size = 60
    end
    object MDPrintnHasuuHou: TIntegerField
      FieldName = 'nHasuuHou'
    end
    object MDPrintnHasuuHouNm: TStringField
      FieldName = 'nHasuuHouNm'
      Size = 60
    end
    object MDPrintSeikyuKbn: TIntegerField
      FieldName = 'SeikyuKbn'
    end
    object MDPrintSeikyuKbnNm: TStringField
      FieldName = 'SeikyuKbnNm'
      Size = 60
    end
    object MDPrintNYKRootKbn: TIntegerField
      FieldName = 'NYKRootKbn'
    end
    object MDPrintGaikaSaiyoKbn: TIntegerField
      FieldName = 'GaikaSaiyoKbn'
    end
    object MDPrintGaikaSaiyoKbnNm: TStringField
      FieldName = 'GaikaSaiyoKbnNm'
    end
    object MDPrintGaikaSoukinName1: TStringField
      FieldName = 'GaikaSoukinName1'
      Size = 200
    end
    object MDPrintGaikaSoukinName2: TStringField
      FieldName = 'GaikaSoukinName2'
      Size = 200
    end
    object MDPrintGaikaSoukinName3: TStringField
      FieldName = 'GaikaSoukinName3'
      Size = 200
    end
  end
  object MemPtnNayose: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 389
    Top = 547
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
    object MemPtnNayoseNknNCode: TFloatField
      FieldName = 'NknNCode'
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
    object MemPtnNayoseRCloseDay1: TIntegerField
      FieldName = 'RCloseDay1'
    end
    object MemPtnNayoseRCloseDay1Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RCloseDay1Nm'
      Size = 60
    end
    object MemPtnNayoseRCloseDay2: TIntegerField
      FieldName = 'RCloseDay2'
    end
    object MemPtnNayoseRCloseDay2Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RCloseDay2Nm'
      Size = 60
    end
    object MemPtnNayoseRCloseDay3: TIntegerField
      FieldName = 'RCloseDay3'
    end
    object MemPtnNayoseRCloseDay3Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RCloseDay3Nm'
      Size = 60
    end
    object MemPtnNayoseRcvMonth1: TIntegerField
      FieldName = 'RcvMonth1'
    end
    object MemPtnNayoseRcvMonth1Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RcvMonth1Nm'
      Size = 60
    end
    object MemPtnNayoseRcvMonth2: TIntegerField
      FieldName = 'RcvMonth2'
    end
    object MemPtnNayoseRcvMonth2Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RcvMonth2Nm'
      Size = 60
    end
    object MemPtnNayoseRcvMonth3: TIntegerField
      FieldName = 'RcvMonth3'
    end
    object MemPtnNayoseRcvMonth3Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RcvMonth3Nm'
      Size = 60
    end
    object MemPtnNayoseRcvDay1: TIntegerField
      FieldName = 'RcvDay1'
    end
    object MemPtnNayoseRcvDay1Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RcvDay1Nm'
      Size = 60
    end
    object MemPtnNayoseRcvDay2: TIntegerField
      FieldName = 'RcvDay2'
    end
    object MemPtnNayoseRcvDay2Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RcvDay2Nm'
      Size = 60
    end
    object MemPtnNayoseRcvDay3: TIntegerField
      FieldName = 'RcvDay3'
    end
    object MemPtnNayoseRcvDay3Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RcvDay3Nm'
      Size = 60
    end
    object MemPtnNayoseRHolidayKbn1: TIntegerField
      FieldName = 'RHolidayKbn1'
    end
    object MemPtnNayoseRHolidayKbn1Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RHolidayKbn1Nm'
      Size = 60
    end
    object MemPtnNayoseRHolidayKbn2: TIntegerField
      FieldName = 'RHolidayKbn2'
    end
    object MemPtnNayoseRHolidayKbn2Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RHolidayKbn2Nm'
      Size = 60
    end
    object MemPtnNayoseRHolidayKbn3: TIntegerField
      FieldName = 'RHolidayKbn3'
    end
    object MemPtnNayoseRHolidayKbn3Nm: TStringField
      DisplayWidth = 60
      FieldName = 'RHolidayKbn3Nm'
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
    Left = 433
    Top = 547
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
    Left = 461
    Top = 547
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
  object MemPtnDensai: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 389
    Top = 498
    object MemPtnDensaiGCode: TStringField
      FieldName = 'GCode'
    end
    object MemPtnDensaiLongName: TStringField
      FieldName = 'LongName'
      Size = 60
    end
    object MemPtnDensaiDenUserID1: TStringField
      FieldName = 'DenUserID1'
    end
    object MemPtnDensaiDenUserID2: TStringField
      FieldName = 'DenUserID2'
    end
    object MemPtnDensaiDenUserName: TStringField
      FieldName = 'DenUserName'
      Size = 60
    end
    object MemPtnDensaiDenCSKanaName: TStringField
      FieldName = 'DenCSKanaName'
      Size = 60
    end
    object MemPtnDensaiAllBkCode: TStringField
      FieldName = 'AllBkCode'
      Size = 4
    end
    object MemPtnDensaiAllBraCode: TStringField
      FieldName = 'AllBraCode'
      Size = 3
    end
    object MemPtnDensaiBankName: TStringField
      FieldName = 'BankName'
      Size = 60
    end
    object MemPtnDensaiAccKbn: TIntegerField
      FieldName = 'AccKbn'
    end
    object MemPtnDensaiAccName: TStringField
      FieldName = 'AccName'
      Size = 10
    end
    object MemPtnDensaiAccNo: TStringField
      FieldName = 'AccNo'
      Size = 8
    end
    object MemPtnDensaiMatchingKey: TStringField
      FieldName = 'MatchingKey'
    end
  end
  object MemPtnAccount: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 351
    Top = 498
    object MemPtnAccountGCode: TStringField
      FieldName = 'GCode'
    end
    object MemPtnAccountLongName: TStringField
      FieldName = 'LongName'
      Size = 60
    end
    object MemPtnAccountKoufuriNo: TIntegerField
      FieldName = 'KoufuriNo'
    end
    object MemPtnAccountKoufuriName: TStringField
      FieldName = 'KoufuriName'
      Size = 128
    end
    object MemPtnAccountAccKbn: TIntegerField
      FieldName = 'AccKbn'
    end
    object MemPtnAccountAccNo: TStringField
      FieldName = 'AccNo'
      Size = 8
    end
    object MemPtnAccountAccName: TStringField
      FieldName = 'AccName'
      Size = 30
    end
    object MemPtnAccountBankName: TStringField
      FieldName = 'BankName'
      Size = 15
    end
    object MemPtnAccountBranchName: TStringField
      FieldName = 'BranchName'
      Size = 15
    end
    object MemPtnAccountUserCode: TStringField
      FieldName = 'UserCode'
    end
    object MemPtnAccountUserName: TStringField
      FieldName = 'UserName'
      Size = 30
    end
    object MemPtnAccountAllBkCode: TStringField
      FieldName = 'AllBkCode'
      Size = 4
    end
    object MemPtnAccountAllBraCode: TStringField
      FieldName = 'AllBraCode'
      Size = 3
    end
    object MemPtnAccountCsAccKbn: TIntegerField
      FieldName = 'CsAccKbn'
    end
    object MemPtnAccountCsAccName: TStringField
      FieldName = 'CsAccName'
      Size = 30
    end
    object MemPtnAccountCsAccNo: TStringField
      FieldName = 'CsAccNo'
      Size = 8
    end
    object MemPtnAccountCsBankName: TStringField
      FieldName = 'CsBankName'
      Size = 15
    end
    object MemPtnAccountCsBranchName: TStringField
      FieldName = 'CsBranchName'
      Size = 15
    end
    object MemPtnAccountFreeFld1: TStringField
      FieldName = 'FreeFld1'
      Size = 50
    end
    object MemPtnAccountFreeFld2: TStringField
      FieldName = 'FreeFld2'
      Size = 50
    end
    object MemPtnAccountFreeFld3: TStringField
      FieldName = 'FreeFld3'
      Size = 50
    end
    object MemPtnAccountFreeFld4: TStringField
      FieldName = 'FreeFld4'
      Size = 50
    end
    object MemPtnAccountFreeFld5: TStringField
      FieldName = 'FreeFld5'
      Size = 50
    end
    object MemPtnAccountFreeFld6: TStringField
      FieldName = 'FreeFld6'
      Size = 50
    end
    object MemPtnAccountFreeFld7: TStringField
      FieldName = 'FreeFld7'
      Size = 50
    end
    object MemPtnAccountFreeFld8: TStringField
      FieldName = 'FreeFld8'
      Size = 50
    end
    object MemPtnAccountFreeFld9: TStringField
      FieldName = 'FreeFld9'
      Size = 50
    end
    object MemPtnAccountFreeFld10: TStringField
      FieldName = 'FreeFld10'
      Size = 50
    end
  end
  object StdProcCRD_CHK_NAYOSE: TFDStoredProc
    StoredProcName = 'MP_CRD_CHK_NAYOSE'
    Left = 654
    Top = 543
    ParamData = <
      item
        Name = '@pCSNCode'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@RetCd'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object StdProcCRD_CHK_NAYOSE2: TFDStoredProc
    StoredProcName = 'MP_CRD_CHK_NAYOSE2'
    Left = 686
    Top = 543
    ParamData = <
      item
        Name = '@pCSNCode'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@pOyaCSNCode'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@RetCd'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object StdProc_Gaika: TFDStoredProc
    StoredProcName = 'MP_CRD_CHK_GAIKAKBN'
    Left = 141
    Top = 492
    ParamData = <
      item
        Name = '@DataKbn'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@NCode'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = '@GaikaKbn'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@RetCd'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Name = '@errMsg'
        DataType = ftString
        ParamType = ptOutput
      end>
  end
  object MemPtnGaika: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 389
    Top = 458
    object MemPtnGaikaGCode: TStringField
      FieldName = 'GCode'
    end
    object MemPtnGaikaLongName: TStringField
      FieldName = 'LongName'
      Size = 60
    end
    object MemPtnGaikaGaikaSaiyoKbn: TIntegerField
      FieldName = 'GaikaSaiyoKbn'
    end
    object MemPtnGaikaGaikaSaiyoKbnNm: TStringField
      FieldName = 'GaikaSaiyoKbnNm'
    end
    object MemPtnGaikaGaikaSoukinName1: TStringField
      FieldName = 'GaikaSoukinName1'
      Size = 150
    end
    object MemPtnGaikaGaikaSoukinName2: TStringField
      FieldName = 'GaikaSoukinName2'
      Size = 150
    end
    object MemPtnGaikaGaikaSoukinName3: TStringField
      FieldName = 'GaikaSoukinName3'
      Size = 150
    end
  end
  object DDataSourceDensai1: TDataSource
    DataSet = DMemDensai1
    Left = 840
    Top = 240
  end
  object DMemDensai1: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = DMemDensai1BeforePost
    Left = 840
    Top = 284
    object DMemDensai1UserID: TStringField
      DisplayWidth = 9
      FieldName = 'UserID'
      Size = 9
    end
    object DMemDensai1KanaName: TStringField
      DisplayWidth = 60
      FieldName = 'KanaName'
      Size = 60
    end
    object DMemDensai1BankCode: TIntegerField
      DisplayWidth = 4
      FieldName = 'BankCode'
      DisplayFormat = '0000'
    end
    object DMemDensai1BranchCode: TIntegerField
      DisplayWidth = 3
      FieldName = 'BranchCode'
      DisplayFormat = '000'
    end
    object DMemDensai1AccKbn: TIntegerField
      DisplayWidth = 1
      FieldKind = fkLookup
      FieldName = 'AccKbn'
      LookupDataSet = DMemDensaiAccKbn
      LookupKeyFields = 'Code'
      LookupResultField = 'Code'
      KeyFields = 'AccKbnCode'
      Lookup = True
    end
    object DMemDensai1AccKbnName: TStringField
      DisplayWidth = 6
      FieldKind = fkLookup
      FieldName = 'AccKbnName'
      LookupDataSet = DMemDensaiAccKbn
      LookupKeyFields = 'Code'
      LookupResultField = 'Name'
      KeyFields = 'AccKbnCode'
      Size = 6
      Lookup = True
    end
    object DMemDensai1AccNo: TIntegerField
      DisplayWidth = 7
      FieldName = 'AccNo'
      DisplayFormat = '0000000'
    end
    object DMemDensai1AccKbnCode: TIntegerField
      FieldName = 'AccKbnCode'
    end
  end
  object DMemDensaiAccKbn: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 840
    Top = 328
    object DMemDensaiAccKbnCode: TIntegerField
      DisplayWidth = 1
      FieldName = 'Code'
    end
    object DMemDensaiAccKbnName: TStringField
      DisplayWidth = 6
      FieldName = 'Name'
      Size = 6
    end
  end
  object DMemDensai1Sv: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 840
    Top = 372
    object DMemDensai1SvUserID: TStringField
      DisplayWidth = 9
      FieldName = 'UserID'
      Size = 9
    end
    object DMemDensai1SvKanaName: TStringField
      DisplayWidth = 60
      FieldName = 'KanaName'
      Size = 60
    end
    object DMemDensai1SvBankCode: TIntegerField
      DisplayWidth = 4
      FieldName = 'BankCode'
    end
    object DMemDensai1SvBranchCode: TIntegerField
      DisplayWidth = 3
      FieldName = 'BranchCode'
    end
    object DMemDensai1SvAccKbn: TIntegerField
      DisplayWidth = 1
      FieldName = 'AccKbn'
    end
    object DMemDensai1SvAccNo: TIntegerField
      DisplayWidth = 7
      FieldName = 'AccNo'
    end
  end
end
