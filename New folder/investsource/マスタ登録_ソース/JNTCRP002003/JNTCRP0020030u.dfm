object JNTCRP0020030f: TJNTCRP0020030f
  Left = 303
  Top = 236
  Align = alClient
  BorderStyle = bsNone
  Caption = 'JNTCRP0020030f'
  ClientHeight = 595
  ClientWidth = 939
  Color = 15921906
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  OnActivate = fnJNTCRP0020030fOnActivate
  OnClose = fnOnClose
  OnCloseQuery = fnJNTCRP0020030fOnCloseQuery
  OnCreate = fnOnCreate
  OnDestroy = FormDestroy
  OnHide = fnJNTCRP0020030fOnHide
  OnPaint = fnJNTCRP0020030fOnPaint
  OnShow = fnOnShow
  PixelsPerInch = 96
  TextHeight = 12
  object CmnSplitter: TSplitter
    Left = 0
    Top = 25
    Width = 0
    Height = 530
  end
  object DtlCmnClientPanel: TMPanel
    Left = 0
    Top = 25
    Width = 939
    Height = 530
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 2
    object DtlCmnScrollBox: TScrollBox
      Left = 0
      Top = 69
      Width = 939
      Height = 431
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 1
      object MLine1t: TMLabel
        Left = 4
        Top = 8
        Width = 922
        Height = 1
        AutoSize = False
        Color = clSilver
        ParentColor = False
        FontRatio.Auto = False
      end
      object MLine5d: TMLabel
        Left = 476
        Top = 412
        Width = 450
        Height = 1
        AutoSize = False
        Color = clSilver
        ParentColor = False
        FontRatio.Auto = False
      end
      object MLine4d: TMLabel
        Left = 4
        Top = 412
        Width = 450
        Height = 1
        AutoSize = False
        Color = clSilver
        ParentColor = False
        FontRatio.Auto = False
      end
      object MLabel3: TMLabel
        Left = 4
        Top = 134
        Width = 922
        Height = 1
        AutoSize = False
        Color = clSilver
        ParentColor = False
        FontRatio.Auto = False
      end
      object MLine4t: TMLabel
        Left = 4
        Top = 260
        Width = 922
        Height = 1
        AutoSize = False
        Color = clSilver
        ParentColor = False
        FontRatio.Auto = False
      end
      object DtlCmnLabelAppDateTitle: TMLabel
        Left = 500
        Top = 33
        Width = 61
        Height = 17
        AutoSize = False
        Caption = #36969#29992#26085
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        FontRatio.Auto = False
      end
      object DtlCmnLabelAppDateAddtion: TMLabel
        Left = 650
        Top = 33
        Width = 17
        Height = 19
        AutoSize = False
        Caption = #65374
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        FontRatio.Auto = False
      end
      object Dummy: TMTxtEdit
        Left = 24
        Top = 56
        Width = 81
        Height = 19
        ArrowDisp = adNone
        SelectDisp = sdNone
        FocusedColor = 16777158
        ArrowType = atArrow
        TagStr = ''
        AutoSize = False
        FontRatio.Auto = False
        TabOrder = 3
        Text = 'Dummy'
        OnEnter = DummyEnter
        ValidChars = ''
      end
      object MPanel8: TMPanel
        Left = 0
        Top = 52
        Width = 761
        Height = 76
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 4
        object DtlCmnLabelName: TMLabel
          Left = 28
          Top = 5
          Width = 156
          Height = 17
          AutoSize = False
          Caption = #27491#24335#21517#31216
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object DtlCmnLabelNameSimple: TMLabel
          Left = 28
          Top = 29
          Width = 156
          Height = 17
          AutoSize = False
          Caption = #31777#30053#21517#31216
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object DtlCmnLabelAssociation: TMLabel
          Left = 28
          Top = 53
          Width = 156
          Height = 17
          AutoSize = False
          Caption = #36899#24819
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object DtlCmnEditName: TMTxtEdit
          Left = 204
          Top = 4
          Width = 549
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
          TabOrder = 0
          Text = '60XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = DtlCmnEditNameEnter
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object DtlCmnEditNameSimple: TMTxtEdit
          Left = 204
          Top = 28
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
          TabOrder = 1
          Text = '14XXXXXXXXXXXX'
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = fnDtlCmnEditNameSimpleOnEnter
          OnExit = fnDtlCmnEditNameSimpleOnExit
          OnKeyDown = fnCommonFunctionOnKeyDown01
          ValidChars = ''
        end
        object DtlCmnEditAssociation: TMTxtEdit
          Left = 204
          Top = 52
          Width = 93
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
          TabOrder = 2
          Text = '10XXXXXXXX'
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = AllCtrlEnter
          OnKeyDown = fnCommonFunctionOnKeyDown01
          ValidChars = ''
        end
      end
      object DtlCmnEditSumDivision: TMNumEdit
        Left = 786
        Top = 32
        Width = 17
        Height = 19
        TabStop = False
        ArrowDisp = adFocused
        SelectDisp = sdArrowClick
        SelectItems.Strings = (
          '0: '#23455#22312
          '1: '#21512#35336)
        FocusedColor = 16777158
        ArrowType = atArrow
        AutoSize = False
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ImeMode = imClose
        FontRatio.Auto = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Visible = False
        FormatStr = '0'
        MaxValue = 1.000000000000000000
        Validate = False
        Zero = True
      end
      object PDtlMasPanel: TMPanel
        Left = 0
        Top = 136
        Width = 457
        Height = 121
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 5
        object DtlCmnLabelNCodeBSAdd: TMLabel
          Left = 312
          Top = 4
          Width = 137
          Height = 19
          AutoSize = False
          Caption = '0'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          Visible = False
          FontRatio.Auto = False
        end
        object MLabel8: TMLabel
          Left = 12
          Top = 4
          Width = 165
          Height = 17
          AutoSize = False
          Caption = #20250#35336#24773#22577
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object DtlCmnLabelExCodeBSAddTitle: TMLabel
          Left = 28
          Top = 23
          Width = 156
          Height = 17
          AutoSize = False
          Caption = 'BS '#35336#19978'20XXXXXXXXXXXXXXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = True
        end
        object DtlCmnLabelExCodeBSAddDesc: TMLabel
          Left = 312
          Top = 23
          Width = 137
          Height = 19
          AutoSize = False
          Caption = '14XXXXXXXXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object DtlCmnLabelClassDesc: TMLabel
          Left = 312
          Top = 47
          Width = 137
          Height = 19
          AutoSize = False
          Caption = 'XXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = True
        end
        object DtlCmnLabelClassTitle: TMLabel
          Left = 28
          Top = 47
          Width = 156
          Height = 17
          AutoSize = False
          Caption = '20XXXXXXXXXXXXXXXXXX'#20998#39006
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = True
        end
        object DtlCmnLabelCharacterTitle: TMLabel
          Left = 28
          Top = 71
          Width = 156
          Height = 17
          AutoSize = False
          Caption = '20XXXXXXXXXXXXXXXXXX'#24615#26684#65402#65392#65412#65438
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = True
        end
        object DtlCmnLabelCharacterDesc: TMLabel
          Left = 312
          Top = 71
          Width = 137
          Height = 19
          AutoSize = False
          Caption = 'XXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = True
        end
        object DtlCmnLabelCommonStockDesc: TMLabel
          Left = 312
          Top = 95
          Width = 137
          Height = 19
          AutoSize = False
          Caption = 'XXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = True
        end
        object DtlCmnLabelCommonStockTitle: TMLabel
          Left = 28
          Top = 95
          Width = 156
          Height = 17
          AutoSize = False
          Caption = #20849#36890#20181#20837'20XXXXXXXXXXXXXXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = True
        end
        object DtlCmnEditExCodeBSAddFree: TMTxtEdit
          Left = 204
          Top = 22
          Width = 93
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = fnDtlCmnEditExCodeBSAddOnArrowClick
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
          Hankaku = True
          ImeMode = imClose
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 1
          Text = ''
          OnChange = fnCommonFunctionDetailsOnChange
          OnExit = fnDtlCmnEditExCodeBSAddFreeOnExit
          OnKeyDown = fnCommonFunctionOnKeyDown01
          ValidChars = ''
        end
        object DtlCmnEditExCodeBSAddNumeric: TMNumEdit
          Left = 204
          Top = 22
          Width = 93
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = fnDtlCmnEditExCodeBSAddOnArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
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
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = AllCtrlEnter
          OnExit = fnDtlCmnEditExCodeBSAddNumericOnExit
          OnKeyDown = fnCommonFunctionOnKeyDown01
          FormatStr = '0'
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object DtlCmnEditClassCode: TMNumEdit
          Left = 280
          Top = 46
          Width = 17
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          SelectItems.Strings = (
            '0: P/LXXXXXXXXXXXXXX'
            '1: '#20849#36890'XXXXXXXXXXXXXX(B/S+P/L)'
            '2: B/SXXXXXXXXXXXXXX')
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
          TabOrder = 2
          OnChange = fnDtlCmnEditClassCodeOnChange
          OnEnter = AllCtrlEnter
          OnKeyDown = fnCmnFunctionNumEditSelectOnKeyDown
          Digits = 1
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object DtlCmnEditCharacterCode: TMNumEdit
          Left = 280
          Top = 70
          Width = 17
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          SelectItems.Strings = (
            '0: '#36890#24120'XXXXXXXXXXXXXX'
            '1: '#21942#26989'XXXXXXXXXXXXXX'
            '2: '#35069#36896'XXXXXXXXXXXXXX'
            '3: '#31649#29702'XXXXXXXXXXXXXX'
            '4: '#21942#26989'+'#31649#29702'XXXXXXXXXXXXXX'
            '5: '#35069#36896'+'#31649#29702'XXXXXXXXXXXXXX')
          SelectMaxRowCount = 7
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
          TabOrder = 3
          OnChange = fnDtlCmnEditCharacterCodeOnChange
          OnEnter = AllCtrlEnter
          OnKeyDown = fnCmnFunctionNumEditSelectOnKeyDown
          Digits = 1
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object DtlCmnEditCommonStockDivision: TMNumEdit
          Left = 280
          Top = 94
          Width = 17
          Height = 19
          TabStop = False
          ArrowDisp = adNone
          SelectDisp = sdNone
          SelectItems.Strings = (
            '0: '#23550#35937#22806
            '1: '#23550#35937'XXXXXXXXXXXXXX')
          FocusedColor = 16777158
          Static = True
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
          ReadOnly = True
          TabOrder = 4
          OnChange = fnDtlCmnEditCommonStockDivisionOnChange
          OnEnter = AllCtrlEnter
          OnKeyDown = fnCmnFunctionNumEditSelectOnKeyDown
          Digits = 1
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
      end
      object PDtlDepPanel: TMPanel
        Left = 472
        Top = 136
        Width = 457
        Height = 105
        BevelOuter = bvNone
        Enabled = False
        ParentBackground = False
        ParentColor = True
        TabOrder = 6
        object MLabel12: TMLabel
          Left = 12
          Top = 4
          Width = 165
          Height = 17
          AutoSize = False
          Caption = #36039#29987#24773#22577
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object DtlCmnLabelHonsitenTitle: TMLabel
          Left = 28
          Top = 23
          Width = 101
          Height = 17
          AutoSize = False
          Caption = #26412#25903#24215#65402#65392#65412#65438
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object DtlCmnLabelDfKeihiTitle: TMLabel
          Left = 28
          Top = 47
          Width = 165
          Height = 17
          AutoSize = False
          Caption = #27161#28310#32076#36027#65402#65392#65412#65438
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object DtlCmnLabelHonsitenDesc: TMLabel
          Left = 296
          Top = 23
          Width = 109
          Height = 19
          AutoSize = False
          Caption = 'XXXXXXXXXXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object DtlCmnLabelDfKeihiDesc: TMLabel
          Left = 296
          Top = 47
          Width = 109
          Height = 19
          AutoSize = False
          Caption = 'XXXXXXXXXXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object DtlCmnEditDfKeihiCode: TMNumEdit
          Left = 264
          Top = 46
          Width = 17
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          SelectItems.Strings = (
            '0: '#19968#33324#31649#29702#36027
            '1: '#35069#36896#21407#20385
            '2: '#36009#22770#36027
            '3: '#19968#33324#31649#29702#36027
            '4: '#21942#26989#22806#36027#29992
            '5: '#12381#12398#20182
            ''
            ' ')
          FocusedColor = 16777158
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 1
          OnChange = DtlCmnEditDfKeihiCodeChange
          OnEnter = AllCtrlEnter
          OnKeyDown = fnCmnFunctionNumEditSelectOnKeyDown
          Digits = 1
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object DtlCmnEditHonsitenCodeNumeric: TMNumEdit
          Left = 200
          Top = 22
          Width = 81
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = DtlCmnEditHonsitenCodeNumericArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
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
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = AllCtrlEnter
          OnExit = fnDtlCmnEditExCodeBSAddNumericOnExit
          FormatStr = '0'
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
      end
      object PDtlBiCdPanel: TMPanel
        Left = 0
        Top = 264
        Width = 457
        Height = 145
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 7
        object MLabel18: TMLabel
          Left = 12
          Top = 4
          Width = 165
          Height = 17
          AutoSize = False
          Caption = #20998#39006#24773#22577
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object ScrollBox3: TScrollBox
          Left = 28
          Top = 20
          Width = 423
          Height = 120
          HorzScrollBar.Range = 193
          VertScrollBar.Increment = 24
          VertScrollBar.Margin = 2
          VertScrollBar.Range = 240
          AutoScroll = False
          BorderStyle = bsNone
          TabOrder = 0
          object MPanel5: TMPanel
            Left = 0
            Top = 0
            Width = 413
            Height = 240
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 0
            object MLabel9: TMLabel
              Left = 0
              Top = 126
              Width = 156
              Height = 17
              AutoSize = False
              Caption = 'BI'#20998#39006#65402#65392#65412#65438'6'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel10: TMLabel
              Left = 0
              Top = 150
              Width = 156
              Height = 17
              AutoSize = False
              Caption = 'BI'#20998#39006#65402#65392#65412#65438'7'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel27: TMLabel
              Left = 0
              Top = 174
              Width = 156
              Height = 17
              AutoSize = False
              Caption = 'BI'#20998#39006#65402#65392#65412#65438'8'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel28: TMLabel
              Left = 0
              Top = 198
              Width = 156
              Height = 17
              AutoSize = False
              Caption = 'BI'#20998#39006#65402#65392#65412#65438'9'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel29: TMLabel
              Left = 0
              Top = 222
              Width = 156
              Height = 17
              AutoSize = False
              Caption = 'BI'#20998#39006#65402#65392#65412'10'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel19: TMLabel
              Left = 0
              Top = 6
              Width = 156
              Height = 17
              AutoSize = False
              Caption = 'BI'#20998#39006#65402#65392#65412#65438'1'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel20: TMLabel
              Left = 0
              Top = 30
              Width = 156
              Height = 17
              AutoSize = False
              Caption = 'BI'#20998#39006#65402#65392#65412#65438'2'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel21: TMLabel
              Left = 0
              Top = 54
              Width = 156
              Height = 17
              AutoSize = False
              Caption = 'BI'#20998#39006#65402#65392#65412#65438'3'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel22: TMLabel
              Left = 0
              Top = 78
              Width = 156
              Height = 17
              AutoSize = False
              Caption = 'BI'#20998#39006#65402#65392#65412#65438'4'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel23: TMLabel
              Left = 0
              Top = 102
              Width = 156
              Height = 17
              AutoSize = False
              Caption = 'BI'#20998#39006#65402#65392#65412#65438'5'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel5: TMLabel
              Left = 284
              Top = 6
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel40: TMLabel
              Left = 284
              Top = 30
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel41: TMLabel
              Left = 284
              Top = 54
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel42: TMLabel
              Left = 284
              Top = 78
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel43: TMLabel
              Left = 284
              Top = 102
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel44: TMLabel
              Left = 284
              Top = 126
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel45: TMLabel
              Left = 284
              Top = 150
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel46: TMLabel
              Left = 284
              Top = 174
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel47: TMLabel
              Left = 284
              Top = 198
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel48: TMLabel
              Left = 284
              Top = 222
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object DtlCmnEditBunruiCD1: TMTxtEdit
              Left = 176
              Top = 5
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditBunruiCD1ArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditBunruiCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditBunruiCD2: TMTxtEdit
              Left = 176
              Top = 29
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditBunruiCD1ArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 1
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditBunruiCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditBunruiCD3: TMTxtEdit
              Left = 176
              Top = 53
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditBunruiCD1ArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 2
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditBunruiCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditBunruiCD4: TMTxtEdit
              Left = 176
              Top = 77
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditBunruiCD1ArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 3
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditBunruiCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditBunruiCD5: TMTxtEdit
              Left = 176
              Top = 101
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditBunruiCD1ArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 4
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditBunruiCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditBunruiCD6: TMTxtEdit
              Left = 176
              Top = 125
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditBunruiCD1ArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 5
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditBunruiCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditBunruiCD7: TMTxtEdit
              Left = 176
              Top = 149
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditBunruiCD1ArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 6
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditBunruiCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditBunruiCD8: TMTxtEdit
              Left = 176
              Top = 173
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditBunruiCD1ArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 7
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditBunruiCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditBunruiCD9: TMTxtEdit
              Left = 176
              Top = 197
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditBunruiCD1ArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 8
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditBunruiCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditBunruiCD10: TMTxtEdit
              Left = 176
              Top = 221
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditBunruiCD1ArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 9
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditBunruiCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
          end
        end
      end
      object PDtlSegCdPanel: TMPanel
        Left = 472
        Top = 264
        Width = 457
        Height = 145
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 8
        object MLabel6: TMLabel
          Left = 12
          Top = 4
          Width = 165
          Height = 17
          AutoSize = False
          Caption = #65406#65400#65438#65426#65437#65412#24773#22577
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = False
        end
        object ScrollBox4: TScrollBox
          Left = 28
          Top = 20
          Width = 423
          Height = 120
          HorzScrollBar.Range = 193
          VertScrollBar.Increment = 24
          VertScrollBar.Margin = 2
          VertScrollBar.Range = 240
          AutoScroll = False
          BorderStyle = bsNone
          TabOrder = 0
          object MPanel7: TMPanel
            Left = 0
            Top = 0
            Width = 413
            Height = 240
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 0
            object MLabel30: TMLabel
              Left = 0
              Top = 126
              Width = 156
              Height = 17
              AutoSize = False
              Caption = #65406#65400#65438#65426#65437#65412#65402#65392#65412#65438'6'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel31: TMLabel
              Left = 0
              Top = 150
              Width = 156
              Height = 17
              AutoSize = False
              Caption = #65406#65400#65438#65426#65437#65412#65402#65392#65412#65438'7'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel32: TMLabel
              Left = 0
              Top = 174
              Width = 156
              Height = 17
              AutoSize = False
              Caption = #65406#65400#65438#65426#65437#65412#65402#65392#65412#65438'8'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel33: TMLabel
              Left = 0
              Top = 198
              Width = 156
              Height = 17
              AutoSize = False
              Caption = #65406#65400#65438#65426#65437#65412#65402#65392#65412#65438'9'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel34: TMLabel
              Left = 0
              Top = 222
              Width = 156
              Height = 17
              AutoSize = False
              Caption = #65406#65400#65438#65426#65437#65412#65402#65392#65412'10'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel35: TMLabel
              Left = 0
              Top = 6
              Width = 156
              Height = 17
              AutoSize = False
              Caption = '20XXXXXXXXXXXXXXXXXX'#65402#65392#65412#65438
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel36: TMLabel
              Left = 0
              Top = 30
              Width = 156
              Height = 17
              AutoSize = False
              Caption = #65406#65400#65438#65426#65437#65412#65402#65392#65412#65438'2'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel37: TMLabel
              Left = 0
              Top = 54
              Width = 156
              Height = 17
              AutoSize = False
              Caption = #65406#65400#65438#65426#65437#65412#65402#65392#65412#65438'3'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel38: TMLabel
              Left = 0
              Top = 78
              Width = 156
              Height = 17
              AutoSize = False
              Caption = #65406#65400#65438#65426#65437#65412#65402#65392#65412#65438'4'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel39: TMLabel
              Left = 0
              Top = 102
              Width = 156
              Height = 17
              AutoSize = False
              Caption = #65406#65400#65438#65426#65437#65412#65402#65392#65412#65438'5'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = True
            end
            object MLabel49: TMLabel
              Left = 268
              Top = 6
              Width = 119
              Height = 19
              AutoSize = False
              Caption = '14XXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel50: TMLabel
              Left = 268
              Top = 30
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel51: TMLabel
              Left = 268
              Top = 54
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel52: TMLabel
              Left = 268
              Top = 78
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel53: TMLabel
              Left = 268
              Top = 102
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel54: TMLabel
              Left = 268
              Top = 126
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel55: TMLabel
              Left = 268
              Top = 150
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel56: TMLabel
              Left = 268
              Top = 174
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel57: TMLabel
              Left = 268
              Top = 198
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object MLabel58: TMLabel
              Left = 268
              Top = 222
              Width = 119
              Height = 19
              AutoSize = False
              Caption = 'XXXXXXXXXXXXXX'
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentFont = False
              ShowAccelChar = False
              FontRatio.Auto = False
            end
            object DtlCmnEditSegCD1: TMTxtEdit
              Left = 160
              Top = 5
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditSegCDArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 0
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditSegCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditSegCD2: TMTxtEdit
              Left = 160
              Top = 29
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditSegCDArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 1
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditSegCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditSegCD3: TMTxtEdit
              Left = 160
              Top = 53
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditSegCDArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 2
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditSegCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditSegCD4: TMTxtEdit
              Left = 160
              Top = 77
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditSegCDArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 3
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditSegCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditSegCD5: TMTxtEdit
              Left = 160
              Top = 101
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditSegCDArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 4
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditSegCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditSegCD6: TMTxtEdit
              Left = 160
              Top = 125
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditSegCDArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 5
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditSegCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditSegCD7: TMTxtEdit
              Left = 160
              Top = 149
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditSegCDArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 6
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditSegCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditSegCD8: TMTxtEdit
              Left = 160
              Top = 173
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditSegCDArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 7
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditSegCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditSegCD9: TMTxtEdit
              Left = 160
              Top = 197
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditSegCDArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 8
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditSegCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
            object DtlCmnEditSegCD10: TMTxtEdit
              Left = 160
              Top = 221
              Width = 93
              Height = 19
              ArrowDisp = adFocused
              SelectDisp = sdNone
              OnArrowClick = DtlCmnEditSegCDArrowClick
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
              Hankaku = True
              ImeMode = imClose
              MaxLength = 16
              FontRatio.Auto = False
              ParentFont = False
              TabOrder = 9
              Text = '10XXXXXXXX'
              OnChange = fnCommonFunctionDetailsOnChange
              OnEnter = AllCtrlEnter
              OnExit = DtlCmnEditSegCD1Exit
              OnKeyDown = fnCommonFunctionOnKeyDown01
              ValidChars = ''
            end
          end
        end
      end
      object DtlCmnEditAppDateStart: TMDateEdit
        Left = 552
        Top = 32
        Width = 81
        Height = 19
        ArrowDisp = adFocused
        SelectDisp = sdNone
        FocusedColor = 16777158
        ArrowType = atArrow
        F4Arrow = True
        AutoSize = False
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Pitch = fpVariable
        Font.Style = []
        ImeMode = imClose
        ParentFont = False
        TabOrder = 1
        OnEnter = AllCtrlEnter
        OnExit = DtlCmnEditAppDateStartExit
        OnKeyDown = fnDtlCmnEditAppDateOnKeyDown
        Calendar = True
        DateFormat = dfYMD
        DateInputType = diYMD
        Gengou = #0
        SepChar = '/'
        Value = 0
        Validate = False
      end
      object DtlCmnEditAppDateEnd: TMDateEdit
        Left = 672
        Top = 32
        Width = 81
        Height = 19
        ArrowDisp = adFocused
        SelectDisp = sdNone
        FocusedColor = 16777158
        ArrowType = atArrow
        F4Arrow = True
        AutoSize = False
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Pitch = fpVariable
        Font.Style = []
        ImeMode = imClose
        ParentFont = False
        TabOrder = 2
        OnEnter = DtlCmnEditAppDateEndEnter
        OnExit = DtlCmnEditAppDateStartExit
        OnKeyDown = fnCommonFunctionOnKeyDown01
        Calendar = True
        DateFormat = dfYMD
        DateInputType = diYMD
        Gengou = #0
        SepChar = '/'
        Value = 0
        Validate = False
      end
      object MPanel9: TMPanel
        Left = 0
        Top = 10
        Width = 441
        Height = 42
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        PopupMenu = StdCmnGridPopupMenu
        TabOrder = 0
        object DtlCmnLabelExCodeTitle: TMLabel
          Left = 28
          Top = 23
          Width = 156
          Height = 17
          AutoSize = False
          Caption = '20XXXXXXXXXXXXXXXXXX'#65402#65392#65412#65438
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          ShowAccelChar = False
          FontRatio.Auto = True
        end
        object DtlCmnImageTag: TImage
          Left = 10
          Top = 24
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
        end
        object MLabel4: TMLabel
          Left = 12
          Top = 4
          Width = 165
          Height = 17
          AutoSize = False
          Caption = #22522#26412#24773#22577
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object DtlCmnEditExCodeNumeric: TMNumEdit
          Left = 204
          Top = 22
          Width = 93
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = DtlCmnEditExCodeArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
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
          OnChange = fnDtlCmnEditExCodeNumericOnChange
          OnEnter = fnDtlCmnEditExCodeNumericOnEnter
          OnExit = DtlCmnEditExCodeNumericExit
          OnKeyDown = fnCommonFunctionOnKeyDown01
          FormatStr = '0'
          Negative = False
          Validate = False
          InputFlag = True
          InputFlagEnabled = True
          Zero = True
        end
        object DtlCmnEditExCodeFree: TMTxtEdit
          Left = 204
          Top = 22
          Width = 93
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = DtlCmnEditExCodeArrowClick
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
          Hankaku = True
          ImeMode = imClose
          MaxLength = 16
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 0
          Text = '10XXXXXXXX'
          OnChange = fnDtlCmnEditExCodeFreeOnChange
          OnEnter = fnDtlCmnEditExCodeFreeOnEnter
          OnExit = DtlCmnEditExCodeFreeExit
          OnKeyDown = fnCommonFunctionOnKeyDown01
          ValidChars = ''
        end
      end
    end
    object DtlCmnTab: TMTab
      Left = 0
      Top = 25
      Width = 939
      Height = 44
      Items = <
        item
          Caption = #23455#12288#22312
          Color = 7230266
          Alignment = taCenter
          ImageIndex = 0
          ParentBorderCaption = True
        end
        item
          Caption = #21512#12288#35336
          Color = 7230266
          Alignment = taCenter
          ImageIndex = 0
          ParentBorderCaption = True
        end>
      Align = alTop
      TabOrder = 0
      OnChange = fnDtlCmnTabOnChange
      ItemWidth = 0
      ItemHeight = 0
      ItemMargin = 6
      Style = tsCrystal
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      BorderHeight = 19
      BorderFont.Charset = SHIFTJIS_CHARSET
      BorderFont.Color = clWindowText
      BorderFont.Height = -12
      BorderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
      BorderFont.Style = []
      OnEnter = DtlCmnTabEnter
      OnKeyDown = fnDtlCmnTabOnKeyDown
      BorderCaptionAlign = taLeftJustify
      DropShadow = False
    end
    object Panel1: TMPanel
      Left = 0
      Top = 0
      Width = 939
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      FullRepaint = False
      ParentBackground = False
      ParentColor = True
      TabOrder = 3
      object MLabel13: TMLabel
        Left = 13
        Top = 3
        Width = 53
        Height = 18
        AutoSize = False
        Caption = #12475#12464#12513#12531#12488
        FontRatio.Auto = False
      end
      object LidsGuideDtl: TMLabel
        Left = 13
        Top = 3
        Width = 532
        Height = 18
        AutoSize = False
        Caption = #36969#29992#38283#22987#26085#12399#12471#12511#12517#12524#12540#12471#12519#12531#30330#20196#26085'(G EE/MM/DD)'#20197#21069#12434#25351#23450#12375#12390#12367#12384#12373#12356#12290
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        FontRatio.Auto = False
      end
      object MPanel6: TMPanel
        Left = 861
        Top = 0
        Width = 78
        Height = 25
        Align = alRight
        BevelOuter = bvNone
        Enabled = False
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
        object ModeBtn: TMSpeedButton
          Left = 2
          Top = 1
          Width = 70
          Height = 21
          GroupIndex = 1
          Down = True
          Caption = #20462#12288#27491
          Flat = True
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
        end
      end
      object CmnInstructionComboDtl: TMComboBox
        Left = 72
        Top = 2
        Width = 145
        Height = 19
        CanEdit = False
        Columns = <
          item
            Width = 60
            Color = clWindow
            ParentColor = False
            ParentFont = True
          end>
        TabOrder = 1
        OnChange = CmnInstructionComboDtlChange
        OnClick = CmnInstructionComboClick
        OnEnter = CmnInstructionComboEnter
        OnKeyDown = CmnInstructionComboKeyDown
      end
    end
    object MPanel2: TMPanel
      Left = 0
      Top = 500
      Width = 939
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 2
      DesignSize = (
        939
        30)
      object DtlCmnButtonUpdate: TMBitBtn
        Left = 774
        Top = 3
        Width = 80
        Height = 23
        Anchors = [akTop, akRight, akBottom]
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
        OnClick = fnDtlCmnButtonUpdateOnClick
        OnEnter = AllCtrlEnter
        OnKeyDown = fnCommonFunctionOnKeyDown01
      end
      object DtlCmnButtonCancel: TMBitBtn
        Left = 856
        Top = 3
        Width = 80
        Height = 23
        Anchors = [akTop, akRight, akBottom]
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
        OnClick = fnDtlCmnButtonCancelOnClick
        OnEnter = DtlCmnButtonCancelEnter
        OnKeyDown = fnCommonFunctionOnKeyDown01
      end
    end
  end
  object CmnToolBar: TMPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentBackground = False
    ParentColor = True
    ParentFont = False
    TabOrder = 0
    object CmnButtonToolbarExit: TMSpeedButton
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
      OnClick = fnCmnButtonToolbarExitOnClick
    end
    object CmnToolbarButtonPrint: TMSpeedButton
      Left = 74
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
      OnClick = fnCmnToolbarButtonPrintOnClick
    end
    object CmnToolbarButtonChange: TMSpeedButton
      Left = 146
      Top = 2
      Width = 73
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
      OnClick = fnCmnToolbarButtonChangeOnClick
    end
    object CmnToolbarButtonDelete: TMSpeedButton
      Left = 293
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
      OnClick = fnCmnToolbarButtonDeleteOnClick
      OnMouseDown = fnCmnToolbarButtonDeleteOnMouseDown
    end
    object CmnToolbarButtonDetail: TMSpeedButton
      Left = 221
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
      OnClick = fnCmnToolbarButtonDetailOnClick
    end
    object ToolBar1: TMToolBar
      Left = 365
      Top = 2
      Width = 49
      Height = 22
      Align = alNone
      ButtonHeight = 21
      ButtonWidth = 25
      Caption = 'ToolBar1'
      DisabledImages = CmnToolbarImageD
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = CmnImageGeneral
      TabOrder = 0
      Transparent = True
      SysBaseColorB = 10841658
      SysBaseColorD = 6956042
      object CmnToolbarButtonTag: TToolButton
        Left = 0
        Top = 0
        Caption = 'CmnToolbarButtonTag'
        DropdownMenu = CmnToolbarDropDownMenu
        ImageIndex = 0
        Style = tbsDropDown
        OnClick = fnCmnToolbarButtonTagOnClick
      end
    end
  end
  object FFunctionBar: TMSPFunctionBar
    Left = 0
    Top = 555
    Width = 939
    Height = 20
    Alignment = taLeftJustify
    FuncColor = 15921906
    Align = alBottom
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    KeyDownEvent = False
    ButtonCount = 8
    ButtonWidth = 117
    OnFunctionClick = FFunctionBarFunctionClick
    SysBaseColorB = 16766672
    SysBaseColorD = 7230266
  end
  object MPanel1: TMPanel
    Left = 0
    Top = 575
    Width = 939
    Height = 20
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'MPanel1'
    ParentBackground = False
    ParentColor = True
    TabOrder = 3
    DesignSize = (
      939
      20)
    object CmnStatusBar: TMStatusBar
      Left = 0
      Top = 0
      Width = 939
      Height = 20
      Align = alClient
      Color = 15921906
      Panels = <>
      ParentShowHint = False
      ShowHint = True
      SimplePanel = True
    end
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 6
      Width = 199
      Height = 9
      Anchors = []
      Max = 0
      Smooth = True
      TabOrder = 1
      Visible = False
    end
  end
  object StdCmnClientPanel: TMPanel
    Left = 0
    Top = 25
    Width = 939
    Height = 530
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 1
    DesignSize = (
      939
      530)
    object MLabel11: TMLabel
      Left = 13
      Top = 3
      Width = 53
      Height = 18
      AutoSize = False
      Caption = #12475#12464#12513#12531#12488
      FontRatio.Auto = False
    end
    object LidsGuideStd: TMLabel
      Left = 13
      Top = 3
      Width = 532
      Height = 18
      AutoSize = False
      Caption = #26032#35215#9675#9675#9675#9675#9675#36969#29992#38283#22987#26085#12399#12471#12511#12517#12524#12540#12471#12519#12531#30330#20196#26085'(G EE/MM/DD)'#20197#21069#12434#25351#23450#12375#12390#12367#12384#12373#12356#12290
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
      ShowAccelChar = False
      FontRatio.Auto = False
    end
    object MPanel3: TMPanel
      Left = 549
      Top = 0
      Width = 308
      Height = 23
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      DesignSize = (
        308
        23)
      object MLabel1: TMLabel
        Left = 0
        Top = 3
        Width = 53
        Height = 18
        Anchors = [akTop]
        AutoSize = False
        Caption = #36969#29992#26085
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        FontRatio.Auto = False
      end
      object MLabel2: TMLabel
        Left = 156
        Top = 3
        Width = 12
        Height = 18
        Anchors = [akTop]
        AutoSize = False
        Caption = #65374
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        ShowAccelChar = False
        FontRatio.Auto = False
      end
      object EDateStart: TMDateEdit
        Left = 51
        Top = 2
        Width = 81
        Height = 19
        ArrowDisp = adFocused
        SelectDisp = sdNone
        FocusedColor = 16777158
        ArrowType = atArrow
        F4Arrow = True
        AutoSize = False
        ImeMode = imClose
        TabOrder = 0
        OnEnter = AllCtrlEnter
        OnExit = EDateStartExit
        OnKeyDown = fnCommonFunctionOnKeyDown01
        Calendar = True
        DateFormat = dfYMD
        DateInputType = diYMD
        Gengou = #0
        SepChar = '/'
        Value = 0
        Validate = False
      end
      object EDateEnd: TMDateEdit
        Left = 187
        Top = 2
        Width = 81
        Height = 19
        ArrowDisp = adFocused
        SelectDisp = sdNone
        FocusedColor = 16777158
        ArrowType = atArrow
        F4Arrow = True
        AutoSize = False
        ImeMode = imClose
        TabOrder = 1
        OnEnter = AllCtrlEnter
        OnExit = EDateEndExit
        OnKeyDown = fnCommonFunctionOnKeyDown01
        Calendar = True
        DateFormat = dfYMD
        DateInputType = diYMD
        Gengou = #0
        SepChar = '/'
        Value = 0
        Validate = False
      end
    end
    object MPanel4: TMPanel
      Left = 0
      Top = 25
      Width = 939
      Height = 44
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 1
      object StdCmnTab: TMTab
        Left = 0
        Top = 0
        Width = 939
        Height = 44
        Items = <
          item
            Caption = #23455#12288#22312
            Color = 7230266
            SyncControl = StdCmnClientPanelExist
            Alignment = taCenter
            ImageIndex = 0
            ParentBorderCaption = True
          end
          item
            Caption = #21512#12288#35336
            Color = 7230266
            SyncControl = StdCmnClientPanelTotal
            Alignment = taCenter
            ImageIndex = 0
            ParentBorderCaption = True
          end>
        Align = alClient
        TabOrder = 0
        OnChange = fnStdCmnTabOnChange
        ItemWidth = 0
        ItemHeight = 0
        ItemMargin = 6
        Style = tsCrystal
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        BorderHeight = 19
        BorderFont.Charset = SHIFTJIS_CHARSET
        BorderFont.Color = clWindowText
        BorderFont.Height = -12
        BorderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BorderFont.Style = []
        OnEnter = fnStdCmnTabOnEnter
        OnKeyDown = fnStdCmnTabOnKeyDown
        BorderCaptionAlign = taLeftJustify
        DropShadow = False
      end
    end
    object CmnInstructionCombo: TMComboBox
      Left = 72
      Top = 2
      Width = 145
      Height = 19
      CanEdit = False
      Columns = <
        item
          Width = 60
          Color = clWindow
          ParentColor = False
          ParentFont = True
        end>
      TabOrder = 2
      OnChange = CmnInstructionComboChange
      OnClick = CmnInstructionComboClick
      OnEnter = CmnInstructionComboEnter
      OnKeyDown = CmnInstructionComboKeyDown
    end
    object scrGridPanel: TScrollBox
      Left = 0
      Top = 69
      Width = 939
      Height = 461
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      TabOrder = 3
      DesignSize = (
        939
        461)
      object StdCmnClientPanelTotal: TMPanel
        Left = 14
        Top = 0
        Width = 914
        Height = 461
        Anchors = [akLeft, akTop, akBottom]
        BevelInner = bvLowered
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        Visible = False
        object StdCmnGridTotal: TdxDBGrid
          Left = 1
          Top = 1
          Width = 912
          Height = 459
          Bands = <
            item
            end
            item
              Caption = #20184#31627#20633#32771
              Visible = False
              Width = 30
            end>
          DefaultLayout = False
          HeaderPanelRowCount = 1
          KeyField = 'strExCode'
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
          PopupMenu = StdCmnGridPopupMenu
          TabOrder = 0
          OnDblClick = StdCmnGridTotalDblClick
          OnEnter = fnStdCmnGridTotalOnEnter
          OnExit = StdCmnGridTotalExit
          OnKeyPress = fnStdCmnGridTotalOnKeyPress
          OnMouseDown = fnStdCmnGridTotalOnMouseDown
          OnMouseMove = fnStdCmnGridTotalOnMouseMove
          BandColor = 7230266
          BandFont.Charset = SHIFTJIS_CHARSET
          BandFont.Color = clWindowText
          BandFont.Height = -13
          BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
          BandFont.Style = []
          DataSource = StdCmnDataSourceTotal
          HeaderColor = 7230266
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
          OnChangeColumn = fnStdCmnGridTotalOnChangeColumn
          OnChangeNodeEx = fnStdCmnGridTotalOnChangeNodeEx
          OnBeforeChangeColumn = fnStdCmnGridTotalOnBeforeChangeColumn
          object StdCmnGridTotalTag: TdxDBGridGraphicColumn
            Caption = ' '
            HeaderAlignment = taCenter
            ReadOnly = True
            TabStop = False
            Width = 21
            BandIndex = 0
            RowIndex = 0
            HeaderMaxLineCount = 1
            StretchChar.Auto = False
            FieldName = 'grTag'
            Stretch = False
          end
          object StdCmnGridTotalCode: TdxDBGridMaskColumn
            Alignment = taRightJustify
            Caption = #12467#12540#12489
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            HeaderAlignment = taCenter
            Width = 88
            BandIndex = 0
            RowIndex = 0
            ImeMode = imDisable
            EditAlignment = taRightJustify
            StretchChar.Auto = False
            FieldName = 'strExCode'
            OnGetText = fnStdCmnGridTotalCodeOnGetText
          end
          object StdCmnGridTotalName: TdxDBGridColumn
            Caption = #27491#24335#21517#31216
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            HeaderAlignment = taCenter
            Width = 320
            BandIndex = 0
            RowIndex = 0
            ImeMode = imHira
            MaxLength = 60
            StretchChar.Auto = True
            FieldName = 'strName'
          end
          object StdCmnGridTotalNameSimple: TdxDBGridColumn
            Caption = #31777#30053#21517#31216
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            HeaderAlignment = taCenter
            Width = 98
            BandIndex = 0
            RowIndex = 0
            ImeMode = imHira
            StretchChar.Auto = True
            FieldName = 'strNameSimple'
          end
          object StdCmnGridTotalAssociation: TdxDBGridColumn
            Caption = #36899#24819
            HeaderAlignment = taCenter
            Width = 80
            BandIndex = 0
            RowIndex = 0
            ImeMode = imSKata
            MaxLength = 10
            Hankaku = True
            StretchChar.Auto = False
            FieldName = 'strAssociation'
          end
          object StdCmnGridTotalComment: TdxDBGridColumn
            Caption = #20184#31627#20633#32771
            ReadOnly = True
            Visible = False
            BandIndex = 0
            RowIndex = 0
            StretchChar.Auto = False
            FieldName = 'strComment'
          end
          object StdCmnGridTotalNCode: TdxDBGridColumn
            Caption = #20869#37096#65402#65392#65412#65438
            Visible = False
            BandIndex = 0
            RowIndex = 0
            StretchChar.Auto = False
            FieldName = 'nInCode'
          end
          object StdCmnGridTotalStartDate: TdxDBGridDateColumn
            Alignment = taRightJustify
            Caption = #36969#29992#26085'('#38283#22987')'
            HeaderAlignment = taCenter
            Width = 98
            BandIndex = 0
            RowIndex = 0
            ImeMode = imClose
            EditAlignment = taRightJustify
            StretchChar.Auto = False
            FieldName = 'dtStartDate'
            DropDownSelectEx = False
            Gengou = 'H'
          end
          object StdCmnGridTotalEndDate: TdxDBGridDateColumn
            Alignment = taRightJustify
            Caption = #36969#29992#26085'('#32066#20102')'
            HeaderAlignment = taCenter
            Width = 98
            BandIndex = 0
            RowIndex = 0
            ImeMode = imClose
            EditAlignment = taRightJustify
            StretchChar.Auto = False
            FieldName = 'dtEndDate'
            DropDownSelectEx = False
            Gengou = 'H'
          end
        end
      end
      object StdCmnClientPanelExist: TMPanel
        Left = 14
        Top = 0
        Width = 914
        Height = 461
        Anchors = [akLeft, akTop, akBottom]
        BevelInner = bvLowered
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
        Visible = False
        object StdCmnGridExist: TdxDBGrid
          Left = 1
          Top = 1
          Width = 912
          Height = 459
          Bands = <
            item
              MinWidth = 21
            end
            item
              Caption = #12467#12540#12489
            end
            item
              Caption = #27491#24335#21517#31216
            end
            item
              Caption = #31777#30053#21517#31216
              Width = 119
            end
            item
              Caption = #20998#39006
              Visible = False
              Width = 48
            end
            item
              Caption = #36899#24819
            end
            item
              Caption = #20184#31627#20633#32771
              Visible = False
            end
            item
              Visible = False
            end
            item
              Caption = #36969#29992#26085'('#38283#22987')'
            end
            item
              Caption = #36969#29992#26085'('#32066#20102')'
            end
            item
              Caption = #20998#39006
              Width = 48
            end>
          DefaultLayout = False
          HeaderPanelRowCount = 1
          KeyField = 'strExCode'
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
          PopupMenu = StdCmnGridPopupMenu
          TabOrder = 0
          OnDblClick = StdCmnGridExistDblClick
          OnEnter = fnStdCmnGridExistOnEnter
          OnExit = StdCmnGridTotalExit
          OnKeyPress = fnStdCmnGridExistOnKeyPress
          OnMouseDown = fnStdCmnGridExistOnMouseDown
          OnMouseMove = fnStdCmnGridExistOnMouseMove
          BandColor = 7230266
          BandFont.Charset = SHIFTJIS_CHARSET
          BandFont.Color = clWindowText
          BandFont.Height = -13
          BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
          BandFont.Style = []
          DataSource = StdCmnDataSourceExist
          HeaderColor = 7230266
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
          Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoCaseInsensitive, egoIndicator]
          OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
          PreviewFont.Charset = SHIFTJIS_CHARSET
          PreviewFont.Color = clBlue
          PreviewFont.Height = -13
          PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
          PreviewFont.Style = []
          ShowBands = True
          ShowHeader = False
          OnChangeColumn = fnStdCmnGridExistOnChangeColumn
          OnChangeNodeEx = fnStdCmnGridExistOnChangeNodeEx
          OnBeforeChangeColumn = fnStdCmnGridExistOnBeforeChangeColumn
          object StdCmnGridExistTag: TdxDBGridGraphicColumn
            Caption = ' '
            HeaderAlignment = taCenter
            ReadOnly = True
            TabStop = False
            Width = 21
            BandIndex = 0
            RowIndex = 0
            HeaderMaxLineCount = 1
            StretchChar.Auto = False
            FieldName = 'grTag'
            PopupToolBar.Buttons = []
            PopupToolBar.ShowCaptions = False
            PopupToolBar.Visible = False
            PopupToolbarPosStored = False
            Stretch = False
          end
          object StdCmnGridExistCode: TdxDBGridMaskColumn
            Alignment = taRightJustify
            Caption = #12467#12540#12489
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            HeaderAlignment = taCenter
            Width = 88
            BandIndex = 1
            RowIndex = 0
            ImeMode = imDisable
            EditAlignment = taRightJustify
            StretchChar.Auto = False
            FieldName = 'strExCode'
            OnGetText = fnStdCmnGridExistCodeOnGetText
          end
          object StdCmnGridExistName: TdxDBGridColumn
            Alignment = taLeftJustify
            Caption = #27491#24335#21517#31216
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            HeaderAlignment = taCenter
            Width = 320
            BandIndex = 2
            RowIndex = 0
            ImeMode = imHira
            MaxLength = 60
            StretchChar.Auto = True
            FieldName = 'strName'
          end
          object StdCmnGridExistNameSimple: TdxDBGridColumn
            Caption = #31777#30053#21517#31216
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            HeaderAlignment = taCenter
            Width = 98
            BandIndex = 3
            RowIndex = 0
            ImeMode = imHira
            MaxLength = 14
            StretchChar.Auto = True
            FieldName = 'strNameSimple'
          end
          object StdCmnGridExistAssociation: TdxDBGridColumn
            Caption = #36899#24819
            HeaderAlignment = taCenter
            Width = 80
            BandIndex = 5
            RowIndex = 0
            ImeMode = imSKata
            MaxLength = 10
            Hankaku = True
            StretchChar.Auto = False
            FieldName = 'strAssociation'
          end
          object StdCmnGridExistComment: TdxDBGridColumn
            Caption = #20184#31627#20633#32771
            ReadOnly = True
            Visible = False
            BandIndex = 6
            RowIndex = 0
            StretchChar.Auto = False
            FieldName = 'strComment'
          end
          object StdCmnGridExistNCode: TdxDBGridColumn
            Caption = #20869#37096#65402#65392#65412#65438
            Visible = False
            BandIndex = 7
            RowIndex = 0
            StretchChar.Auto = False
            FieldName = 'nInCode'
          end
          object StdCmnGridExistAdoptDivision: TdxDBGridLookupColumn
            MinWidth = 12
            Width = 20
            BandIndex = 10
            RowIndex = 0
            ImeMode = imDisable
            EditAlignment = taRightJustify
            StretchChar.Auto = False
            FieldName = 'nAdoptDivision'
            DropDownSelectEx = False
            DropDownRows = 3
            ListFieldName = 'nDivision;strDescription'
            ListWidth = 97
          end
          object StdCmnGridExistAdoptComment: TdxDBGridMaskColumn
            ReadOnly = True
            TabStop = False
            Width = 60
            BandIndex = 10
            RowIndex = 0
            StretchChar.Auto = False
            FieldName = 'strAdoptComment'
          end
          object StdCmnGridExistStartDate: TdxDBGridDateColumn
            Alignment = taRightJustify
            Width = 98
            BandIndex = 8
            RowIndex = 0
            ImeMode = imClose
            EditAlignment = taRightJustify
            StretchChar.Auto = False
            FieldName = 'dtStartDate'
            DropDownSelectEx = False
            Gengou = 'H'
          end
          object StdCmnGridExistEndDate: TdxDBGridDateColumn
            Alignment = taRightJustify
            Width = 98
            BandIndex = 9
            RowIndex = 0
            ImeMode = imClose
            EditAlignment = taRightJustify
            StretchChar.Auto = False
            FieldName = 'dtEndDate'
            DropDownSelectEx = False
            Gengou = 'H'
          end
        end
      end
    end
  end
  object StdCmnMemDataExist: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = fnStdCmnMemDataExistBeforePost
    AfterScroll = StdCmnMemDataExistAfterScroll
    Left = 102
    Top = 504
    object StdCmnMemDataExistgrTag: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object StdCmnMemDataExistExCode: TStringField
      DisplayWidth = 3
      FieldName = 'strExCode'
      Size = 10
    end
    object StdCmnMemDataExistName: TStringField
      DisplayWidth = 30
      FieldName = 'strName'
      Size = 60
    end
    object StdCmnMemDataExistNameSimple: TStringField
      FieldName = 'strNameSimple'
      Size = 14
    end
    object StdCmnMemDataExistAssociation: TStringField
      DisplayWidth = 10
      FieldName = 'strAssociation'
      Size = 10
    end
    object StdCmnMemDataExistStartDate: TDateField
      Alignment = taRightJustify
      FieldName = 'dtStartDate'
    end
    object StdCmnMemDataExistEndDate: TDateField
      Alignment = taRightJustify
      FieldName = 'dtEndDate'
    end
    object StdCmnMemDataExistnAdoptDivision: TIntegerField
      FieldKind = fkLookup
      FieldName = 'nAdoptDivision'
      LookupDataSet = StdCmnMemDataClass
      LookupKeyFields = 'nDivision'
      LookupResultField = 'nDivision'
      KeyFields = 'nAdoptData01'
      Lookup = True
    end
    object StdCmnMemDataExiststrAdoptComment: TStringField
      FieldKind = fkLookup
      FieldName = 'strAdoptComment'
      LookupDataSet = StdCmnMemDataClass
      LookupKeyFields = 'nDivision'
      LookupResultField = 'strDescription'
      KeyFields = 'nAdoptData01'
      Lookup = True
    end
    object StdCmnMemDataExistnAdoptData01: TSmallintField
      FieldName = 'nAdoptData01'
    end
    object StdCmnMemDataExiststrComment: TStringField
      FieldName = 'strComment'
      Size = 60
    end
    object StdCmnMemDataExistnInCode: TStringField
      FieldName = 'nInCode'
      Size = 10
    end
  end
  object StdCmnDataSourceExist: TDataSource
    OnStateChange = fnStdCmnDataSourceExistOnStateChange
    Left = 74
    Top = 504
  end
  object StdCmnQueryExist: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evCursorKind]
    FetchOptions.CursorKind = ckDefault
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      
        'select deptno,deptname,ryaku,rensou from adjmd where adddeptno =' +
        ' '#39'0000000001'#39)
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 46
    Top = 504
  end
  object StdCmnQueryTotal: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evCursorKind]
    FetchOptions.CursorKind = ckDefault
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      
        'select deptno,deptname,ryaku,rensou from adjmd where adddeptno =' +
        ' '#39'0000000001'#39)
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 46
    Top = 536
  end
  object StdCmnDataSourceTotal: TDataSource
    OnStateChange = fnStdCmnDataSourceTotalOnStateChange
    Left = 74
    Top = 536
  end
  object StdCmnMemDataTotal: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = fnStdCmnMemDataTotalBeforePost
    AfterScroll = StdCmnMemDataTotalAfterScroll
    Left = 102
    Top = 536
    object StdCmnMemDataTotalgrTag: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object StdCmnMemDataTotalExCode: TStringField
      DisplayWidth = 3
      FieldName = 'strExCode'
      Size = 10
    end
    object StdCmnMemDataTotalName: TStringField
      FieldName = 'strName'
      Size = 60
    end
    object StdCmnMemDataTotalNameSimple: TStringField
      FieldName = 'strNameSimple'
      Size = 14
    end
    object StdCmnMemDataTotalAssociation: TStringField
      FieldName = 'strAssociation'
      Size = 10
    end
    object StdCmnMemDataTotalstrComment: TStringField
      FieldName = 'strComment'
      Size = 60
    end
    object StdCmnMemDataTotalnInCode: TStringField
      FieldName = 'nInCode'
      Size = 10
    end
    object StdCmnMemDataTotalStartDate: TDateField
      Alignment = taRightJustify
      FieldName = 'dtStartDate'
    end
    object StdCmnMemDataTotalEndDate: TDateField
      Alignment = taRightJustify
      FieldName = 'dtEndDate'
    end
  end
  object CmnTreeViewPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Images = CmnImageGeneral
    Left = 896
    Top = 168
    object CmnTreeViewPopupMenuDetail: TMenuItem
      Caption = #35443#32048
      ImageIndex = 0
    end
    object CmnTreeViewPopupMenuBreak01: TMenuItem
      Caption = '-'
    end
    object CmnTreeViewPopupMenuCopy: TMenuItem
      Caption = #20182#12398#21152#31639#20808#12408#12467#12500#12540
      ImageIndex = 0
    end
    object CmnTreeViewPopupMenuPaste: TMenuItem
      Caption = #20182#12398#21152#31639#20808#12363#12425#36028#12426#20184#12369
      ImageIndex = 0
    end
    object CmnTreeViewPopupMenuBreak02: TMenuItem
      Caption = '-'
    end
    object CmnTreeViewPopupMenuErase: TMenuItem
      Caption = #21152#31639#12375#12394#12356
      ImageIndex = 0
    end
    object CmnTreeViewPopupMenuDelete: TMenuItem
      Caption = #21066#38500
      ImageIndex = 0
    end
    object CmnTreeViewPopupMenuBreak03: TMenuItem
      Caption = '-'
    end
    object CmnTreeViewPopupMenuTagOff: TMenuItem
      Caption = #12399#12364#12377'(&D)'
    end
    object CmnTreeViewPopupMenuTagComment: TMenuItem
      Caption = #20633#32771#20462#27491'(&U)...'
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object CmnTreeViewPopupMenuAllOpen: TMenuItem
      Caption = #20840#12390#23637#38283
    end
    object CmnTreeViewPopupMenuAllClose: TMenuItem
      Caption = #20840#12390#38281#12376#12427
    end
    object CmnTreeViewPopupMenuTagBreak: TMenuItem
      Caption = '-'
    end
    object CmnTreeViewPopupMenuTag01: TMenuItem
      Caption = #36196'(&R)'
      ImageIndex = 0
      object CmnTreeViewPopupMenuItemTag01: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
      end
      object CmnTreeViewPopupMenuItemTag01Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
      end
    end
    object CmnTreeViewPopupMenuTag02: TMenuItem
      Caption = #38738'(&B)'
      ImageIndex = 1
      object CmnTreeViewPopupMenuItemTag02: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
      end
      object CmnTreeViewPopupMenuItemTag02Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
      end
    end
    object CmnTreeViewPopupMenuTag03: TMenuItem
      Caption = #32209'(&G)'
      ImageIndex = 2
      object CmnTreeViewPopupMenuItemTag03: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
      end
      object CmnTreeViewPopupMenuItemTag03Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
      end
    end
    object CmnTreeViewPopupMenuTag04: TMenuItem
      Caption = #27225'(&O)'
      ImageIndex = 3
      object CmnTreeViewPopupMenuItemTag04: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
      end
      object CmnTreeViewPopupMenuItemTag04Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
      end
    end
  end
  object StdCmnGridPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Images = CmnImageGeneral
    OnPopup = fnStdCmnGridPopupMenuOnPopup
    Left = 864
    Top = 136
    object StdCmnGridPopupMenuTagOff: TMenuItem
      Caption = #12399#12364#12377'(&D)'
      OnClick = fnStdCmnGridPopupMenuTagOnClick
    end
    object StdCmnGridPopupMenuTagComment: TMenuItem
      Caption = #20633#32771#20462#27491'(&U)...'
      OnClick = fnStdCmnGridPopupMenuTagOnClickEx
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object StdCmnGridPopupMenuTag01: TMenuItem
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
      object StdCmnGridPopupMenuItemTag01: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnStdCmnGridPopupMenuTagOnClick
      end
      object StdCmnGridPopupMenuItemTag01Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnStdCmnGridPopupMenuTagOnClickEx
      end
    end
    object StdCmnGridPopupMenuTag02: TMenuItem
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
      ImageIndex = 1
      object StdCmnGridPopupMenuItemTag02: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnStdCmnGridPopupMenuTagOnClick
      end
      object StdCmnGridPopupMenuItemTag02Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnStdCmnGridPopupMenuTagOnClickEx
      end
    end
    object StdCmnGridPopupMenuTag03: TMenuItem
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
      ImageIndex = 2
      object StdCmnGridPopupMenuItemTag03: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnStdCmnGridPopupMenuTagOnClick
      end
      object StdCmnGridPopupMenuItemTag03Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnStdCmnGridPopupMenuTagOnClickEx
      end
    end
    object StdCmnGridPopupMenuTag04: TMenuItem
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
      ImageIndex = 3
      object StdCmnGridPopupMenuItemTag04: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnStdCmnGridPopupMenuTagOnClick
      end
      object StdCmnGridPopupMenuItemTag04Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnStdCmnGridPopupMenuTagOnClickEx
      end
    end
  end
  object StdCmnMemDataClass: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 136
    Top = 536
    object StdCmnMemDataClassDivision: TIntegerField
      DisplayWidth = 2
      FieldName = 'nDivision'
    end
    object StdCmnMemDataClassDescription: TStringField
      DisplayWidth = 10
      FieldName = 'strDescription'
    end
  end
  object CmnMemDataPrintExtStandard: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 212
    Top = 508
    object CmnMemDataPrintExtStandardgrTag: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object CmnMemDataPrintExtStandardstrExCode: TStringField
      FieldName = 'strExCode'
      Size = 10
    end
    object CmnMemDataPrintExtStandardstrName: TStringField
      FieldName = 'strName'
      Size = 60
    end
    object CmnMemDataPrintExtStandardstrNameSimple: TStringField
      FieldName = 'strNameSimple'
      Size = 14
    end
    object CmnMemDataPrintExtStandardstrAssociation: TStringField
      FieldName = 'strAssociation'
      Size = 10
    end
    object CmnMemDataPrintExtStandardstrClassDesc: TStringField
      DisplayWidth = 7
      FieldName = 'strClassDesc'
      Size = 7
    end
    object CmnMemDataPrintExtStandardstrCharacterDesc: TStringField
      DisplayWidth = 9
      FieldName = 'strCharacterDesc'
      Size = 9
    end
    object CmnMemDataPrintExtStandardstrExCodeBSAdd: TStringField
      FieldName = 'strExCodeBSAdd'
      Size = 10
    end
    object CmnMemDataPrintExtStandardstrNameSimpleBSAdd: TStringField
      FieldName = 'strNameSimpleBSAdd'
      Size = 14
    end
    object CmnMemDataPrintExtStandardflCostRate: TFloatField
      FieldName = 'flCostRate'
    end
    object CmnMemDataPrintExtStandardstrCmnStockDesc: TStringField
      FieldName = 'strCmnStockDesc'
      Size = 24
    end
    object CmnMemDataPrintExtStandarddtAppDateStart: TDateField
      FieldName = 'dtAppDateStart'
    end
    object CmnMemDataPrintExtStandarddtAppDateEnd: TDateField
      FieldName = 'dtAppDateEnd'
    end
    object CmnMemDataPrintExtStandarddtUpdateDate: TDateTimeField
      FieldName = 'dtUpdateDate'
    end
    object CmnMemDataPrintExtStandarddtAppDateStartDisp: TStringField
      FieldName = 'dtAppDateStartDisp'
    end
    object CmnMemDataPrintExtStandarddtAppDateEndDisp: TStringField
      FieldName = 'dtAppDateEndDisp'
    end
    object CmnMemDataPrintExtStandarddtUpdateDateDisp: TStringField
      FieldName = 'dtUpdateDateDisp'
    end
  end
  object CmnPipelinePrintExtStandard: TppDBPipeline
    DataSource = CmnDataSourcePrintExtStandard
    UserName = 'CmnPipelinePrintExtStandard'
    Left = 240
    Top = 508
    object CmnPipelinePrintExtStandardppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object CmnPipelinePrintExtStandardppField2: TppField
      FieldAlias = 'grTag'
      FieldName = 'grTag'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
    object CmnPipelinePrintExtStandardppField3: TppField
      FieldAlias = 'strExCode'
      FieldName = 'strExCode'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object CmnPipelinePrintExtStandardppField4: TppField
      FieldAlias = 'strName'
      FieldName = 'strName'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object CmnPipelinePrintExtStandardppField5: TppField
      FieldAlias = 'strNameSimple'
      FieldName = 'strNameSimple'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object CmnPipelinePrintExtStandardppField6: TppField
      FieldAlias = 'strAssociation'
      FieldName = 'strAssociation'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object CmnPipelinePrintExtStandardppField7: TppField
      FieldAlias = 'strClassDesc'
      FieldName = 'strClassDesc'
      FieldLength = 7
      DisplayWidth = 7
      Position = 6
    end
    object CmnPipelinePrintExtStandardppField8: TppField
      FieldAlias = 'strCharacterDesc'
      FieldName = 'strCharacterDesc'
      FieldLength = 9
      DisplayWidth = 9
      Position = 7
    end
    object CmnPipelinePrintExtStandardppField9: TppField
      FieldAlias = 'strExCodeBSAdd'
      FieldName = 'strExCodeBSAdd'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object CmnPipelinePrintExtStandardppField10: TppField
      FieldAlias = 'strNameSimpleBSAdd'
      FieldName = 'strNameSimpleBSAdd'
      FieldLength = 14
      DisplayWidth = 14
      Position = 9
    end
    object CmnPipelinePrintExtStandardppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'flCostRate'
      FieldName = 'flCostRate'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object CmnPipelinePrintExtStandardppField12: TppField
      FieldAlias = 'strCmnStockDesc'
      FieldName = 'strCmnStockDesc'
      FieldLength = 24
      DisplayWidth = 24
      Position = 11
    end
    object CmnPipelinePrintExtStandardppField13: TppField
      FieldAlias = 'dtAppDateStart'
      FieldName = 'dtAppDateStart'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 12
    end
    object CmnPipelinePrintExtStandardppField14: TppField
      FieldAlias = 'dtAppDateEnd'
      FieldName = 'dtAppDateEnd'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 13
    end
    object CmnPipelinePrintExtStandardppField15: TppField
      FieldAlias = 'dtUpdateDate'
      FieldName = 'dtUpdateDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object CmnPipelinePrintExtStandardppField16: TppField
      FieldAlias = 'dtAppDateStartDisp'
      FieldName = 'dtAppDateStartDisp'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object CmnPipelinePrintExtStandardppField17: TppField
      FieldAlias = 'dtAppDateEndDisp'
      FieldName = 'dtAppDateEndDisp'
      FieldLength = 20
      DisplayWidth = 20
      Position = 16
    end
    object CmnPipelinePrintExtStandardppField18: TppField
      FieldAlias = 'dtUpdateDateDisp'
      FieldName = 'dtUpdateDateDisp'
      FieldLength = 20
      DisplayWidth = 20
      Position = 17
    end
  end
  object CmnDataSourcePrintExtStandard: TDataSource
    DataSet = CmnMemDataPrintExtStandard
    Left = 184
    Top = 508
  end
  object CmnReportExtStandardDep: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintExtStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4'
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
    BeforePrint = CmnReportExtStandardDepBeforePrint
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
    Left = 268
    Top = 508
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'CmnPipelinePrintExtStandard'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppLine49: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line401'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 28840
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine52: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 126471
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine53: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line45'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 150548
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine54: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line46'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 168011
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine55: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line47'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 182563
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel50: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label42'
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
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 16668
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel51: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label43'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491' '#24335' '#21517' '#31216
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
        mmLeft = 31750
        mmTop = 16668
        mmWidth = 96012
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel54: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label46'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#21517#31216
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
        mmLeft = 129382
        mmTop = 16668
        mmWidth = 21960
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel55: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label47'
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
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 153459
        mmTop = 16668
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel56: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label48'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#39006
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
        mmLeft = 170921
        mmTop = 16668
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel57: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label49'
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
        mmLeft = 185473
        mmTop = 16668
        mmWidth = 14402
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportExtStandardDepLabelCorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
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
        mmLeft = 1600
        mmTop = 0
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportExtStandardDepLabelCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
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
        mmLeft = 16002
        mmTop = 0
        mmWidth = 96012
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportExtStandardDepLabelTitle: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #23455#22312#37096#38272#30331#37682#12522#12473#12488
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
        LayerName = Foreground
      end
      object CmnReportExtStandardDepLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 121971
        mmTop = 7409
        mmWidth = 92101
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportExtStandardDepSysVarDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
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
        mmLeft = 272543
        mmTop = 0
        mmWidth = 64008
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel62: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label62'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'B/S'#35336#19978
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
        mmLeft = 201348
        mmTop = 16668
        mmWidth = 40005
        BandType = 0
        LayerName = Foreground
      end
      object ppLine68: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line68'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 198438
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine21: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line21'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 240242
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'Label6'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #28040#36027#31246#35506#31246#20181#20837
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
        mmLeft = 242888
        mmTop = 16668
        mmWidth = 23813
        BandType = 0
        LayerName = Foreground
      end
      object ppLine28: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line28'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 265642
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label7'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36969#29992#38283#22987
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
        mmLeft = 268553
        mmTop = 16668
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground
      end
      object ppLine29: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line29'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 283369
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label9'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36969#29992#32066#20102
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
        mmLeft = 286015
        mmTop = 16668
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground
      end
      object ppLine30: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line30'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 300832
        mmTop = 16139
        mmWidth = 2032
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
        Caption = #26368#32066#26356#26032#26085#26178
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
        mmLeft = 303742
        mmTop = 16668
        mmWidth = 30427
        BandType = 0
        LayerName = Foreground
      end
      object ppLine4: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line4'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 13229
        mmTop = 18521
        mmWidth = 321469
        BandType = 0
        LayerName = Foreground
      end
      object ppLine5: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line5'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 13229
        mmTop = 16140
        mmWidth = 321469
        BandType = 0
        LayerName = Foreground
      end
      object ppLine6: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line2'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 13229
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLine7: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 332846
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
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
    object ppDetailBand_StandardDep: TppDetailBand
      BeforeGenerate = ppDetailBand_StandardDepBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppStandardDepUnderLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 13229
        mmTop = 2116
        mmWidth = 321469
        BandType = 4
        LayerName = Foreground
      end
      object CmnReportExtStandardDepDBTextCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText85'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExCode'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 14023
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText96: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'DBText87'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strName'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 31750
        mmTop = 529
        mmWidth = 96012
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText97: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText88'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimple'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 129382
        mmTop = 529
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText98: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAssociation'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 153459
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText99: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText90'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strClassDesc'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 170921
        mmTop = 529
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppLine58: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 13229
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine59: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line33'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 332846
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine61: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 126471
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine62: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 150548
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine63: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line37'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 168011
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine65: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line39'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 28840
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object CmnReportExtStandardBSBumonCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'CmnReportExtStandardBSBumonCode'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExCodeBSAdd'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 201348
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText103: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText103'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimpleBSAdd'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 219075
        mmTop = 529
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground
      end
      object ppLine67: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line67'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 182563
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText901'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strCharacterDesc'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 185473
        mmTop = 529
        mmWidth = 14402
        BandType = 4
        LayerName = Foreground
      end
      object ppLine12: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 198438
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine13: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line13'
        Border.mmPadding = 0
        Pen.Style = psDot
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 216165
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppLine16: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line16'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 240242
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText21: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer1
        UserName = 'DBText201'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strCmnStockDesc'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 242888
        mmTop = 529
        mmWidth = 23813
        BandType = 4
        LayerName = Foreground
      end
      object ppLine18: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line18'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 265642
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object CmnReportExtStandardDepDBTextAppDateStart: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'CmnReportExtStandardDepDBTextAppDateStart'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateStartDisp'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 268553
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground
      end
      object ppLine19: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line19'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 283369
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object CmnReportExtStandardDepDBTextAppDateEnd: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'CmnReportExtStandardDepDBTextAppDateEnd'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateEndDisp'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 286015
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground
      end
      object ppLine20: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line20'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 300832
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground
      end
      object CmnReportExtStandardDepDBTextUpdateDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'CmnReportExtStandardDepDBTextUpdateDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDateDisp'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 2910
        mmLeft = 303742
        mmTop = 529
        mmWidth = 30427
        BandType = 4
        LayerName = Foreground
      end
      object ppDBImage1: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBImage1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'grTag'
        DataPipeline = CmnPipelinePrintExtStandard
        GraphicType = 'Bitmap'
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3440
        mmLeft = 7673
        mmTop = 265
        mmWidth = 5027
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand3: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object CmnReportExtStandardDepSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'CmnReportCsStdppSysVarPage1'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmLeft = 161621
        mmTop = 2381
        mmWidth = 15875
        BandType = 8
        LayerName = Foreground
      end
      object CmnReportExtStandardDepAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'CmnReportExtStandardDepAccOffice'
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
        mmLeft = 304536
        mmTop = 2380
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground
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
  object CmnReportTtlStandard: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintTtlStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4'
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
    BeforePrint = CmnReportExtStandardDepBeforePrint
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
    Left = 268
    Top = 540
    Version = '19.04'
    mmColumnWidth = 337067
    DataPipelineName = 'CmnPipelinePrintTtlStandard'
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label10'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36969#29992#32066#20102
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
        mmLeft = 213255
        mmTop = 16669
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine15: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line15'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 70115
        mmTop = 16140
        mmWidth = 192352
        BandType = 0
        LayerName = Foreground1
      end
      object CmnReportTtlStandardLabelCorpCode: TppLabel
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
        mmLeft = 1600
        mmTop = 0
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground1
      end
      object CmnReportTtlStandardLabelCorpName: TppLabel
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
        mmLeft = 16002
        mmTop = 0
        mmWidth = 96012
        BandType = 0
        LayerName = Foreground1
      end
      object CmnReportTtlStandardLabelTitle: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21512#35336'XXXXXXXXXXXXXX'#30331#37682#12522#12473#12488
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
      object CmnReportTtlStandardLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 121971
        mmTop = 7409
        mmWidth = 92101
        BandType = 0
        LayerName = Foreground1
      end
      object CmnReportTtlStandardSysVarDate: TppSystemVariable
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
        mmLeft = 273635
        mmTop = 0
        mmWidth = 64008
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label2'
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
        LayerName = Foreground1
      end
      object ppLine38: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line401'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 85725
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine64: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 151342
        mmTop = 16404
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine66: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line45'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 16404
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine73: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line46'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 192882
        mmTop = 16404
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel20: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label42'
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
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 70908
        mmTop = 16669
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel22: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label43'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491' '#24335' '#21517' '#31216
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
        mmLeft = 88636
        mmTop = 16669
        mmWidth = 64029
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel23: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label46'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#21517#31216
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
        mmLeft = 154252
        mmTop = 16669
        mmWidth = 22490
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel24: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label47'
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
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 178065
        mmTop = 16669
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel40: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label13'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26368#32066#26356#26032#26085#26178
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
        mmLeft = 230717
        mmTop = 16669
        mmWidth = 30427
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine14: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line14'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 70115
        mmTop = 18785
        mmWidth = 192352
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine23: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line23'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 70115
        mmTop = 16140
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine24: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line24'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 260351
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel8: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label8'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36969#29992#38283#22987
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
        mmLeft = 195792
        mmTop = 16669
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine43: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line43'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 210609
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine45: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 228071
        mmTop = 16404
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand_TtlStandard: TppDetailBand
      BeforeGenerate = ppDetailBand_TtlStandardBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object CmnReportTtlStandardDBTextAppDateEnd: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportExtStandardDepDBTextAppDateEnd1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateEndDisp'
        DataPipeline = CmnPipelinePrintTtlStandard
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
        DataPipelineName = 'CmnPipelinePrintTtlStandard'
        mmHeight = 3175
        mmLeft = 213255
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object CmnReportTtlStandardDBTextAppDateStart: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportExtStandardDepDBTextAppDateStart1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateStartDisp'
        DataPipeline = CmnPipelinePrintTtlStandard
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
        DataPipelineName = 'CmnPipelinePrintTtlStandard'
        mmHeight = 3175
        mmLeft = 195792
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppTtlStandardUnderLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 70115
        mmTop = 2117
        mmWidth = 192352
        BandType = 4
        LayerName = Foreground1
      end
      object CmnReportTtlStandardDBTextCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText85'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExCode'
        DataPipeline = CmnPipelinePrintTtlStandard
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
        DataPipelineName = 'CmnPipelinePrintTtlStandard'
        mmHeight = 3175
        mmLeft = 70908
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText29: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer2
        UserName = 'DBText87'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strName'
        DataPipeline = CmnPipelinePrintTtlStandard
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
        DataPipelineName = 'CmnPipelinePrintTtlStandard'
        mmHeight = 3175
        mmLeft = 88636
        mmTop = 529
        mmWidth = 64029
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText33: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText88'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimple'
        DataPipeline = CmnPipelinePrintTtlStandard
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
        DataPipelineName = 'CmnPipelinePrintTtlStandard'
        mmHeight = 3175
        mmLeft = 154252
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText34: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAssociation'
        DataPipeline = CmnPipelinePrintTtlStandard
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
        DataPipelineName = 'CmnPipelinePrintTtlStandard'
        mmHeight = 3175
        mmLeft = 178065
        mmTop = 529
        mmWidth = 15875
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
        mmLeft = 70115
        mmTop = 0
        mmWidth = 1588
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
        mmLeft = 260351
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine84: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 151342
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine85: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine86: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line37'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 192882
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine87: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line39'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 85725
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground1
      end
      object CmnReportTtlStandardDBTextUpdateDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportExtStandardDepDBTextUpdateDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDateDisp'
        DataPipeline = CmnPipelinePrintTtlStandard
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
        DataPipelineName = 'CmnPipelinePrintTtlStandard'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 529
        mmWidth = 30427
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBImage3: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBImage1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'grTag'
        DataPipeline = CmnPipelinePrintTtlStandard
        GraphicType = 'Bitmap'
        DataPipelineName = 'CmnPipelinePrintTtlStandard'
        mmHeight = 3440
        mmLeft = 64558
        mmTop = 265
        mmWidth = 5027
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine44: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 210609
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine46: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line3'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 228071
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand4: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object CmnReportTtlStandardSysVarPage: TppSystemVariable
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
        mmLeft = 162719
        mmTop = 2381
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground1
      end
      object CmnReportTtlStandardAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportTtlStandardAccOffice'
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
        mmLeft = 304536
        mmTop = 2381
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
  object CmnDataSourcePrintTtlStandard: TDataSource
    DataSet = CmnMemDataPrintTtlStandard
    Left = 184
    Top = 540
  end
  object CmnMemDataPrintTtlStandard: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 212
    Top = 540
    object CmnMemDataPrintTtlStandardgrTag: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object CmnMemDataPrintTtlStandardstrExCode: TStringField
      FieldName = 'strExCode'
      Size = 10
    end
    object CmnMemDataPrintTtlStandardstrName: TStringField
      FieldName = 'strName'
      Size = 60
    end
    object CmnMemDataPrintTtlStandardstrNameSimple: TStringField
      FieldName = 'strNameSimple'
      Size = 14
    end
    object CmnMemDataPrintTtlStandardstrAssociation: TStringField
      FieldName = 'strAssociation'
      Size = 10
    end
    object CmnMemDataPrintTtlStandarddtAppDateStart: TDateField
      FieldName = 'dtAppDateStart'
    end
    object CmnMemDataPrintTtlStandarddtAppDateEnd: TDateField
      FieldName = 'dtAppDateEnd'
    end
    object CmnMemDataPrintTtlStandarddtUpdateDate: TDateTimeField
      FieldName = 'dtUpdateDate'
    end
    object CmnMemDataPrintTtlStandarddtAppDateStartDisp: TStringField
      FieldName = 'dtAppDateStartDisp'
    end
    object CmnMemDataPrintTtlStandarddtAppDateEndDisp: TStringField
      FieldName = 'dtAppDateEndDisp'
    end
    object CmnMemDataPrintTtlStandarddtUpdateDateDisp: TStringField
      FieldName = 'dtUpdateDateDisp'
    end
  end
  object CmnPipelinePrintTtlStandard: TppDBPipeline
    DataSource = CmnDataSourcePrintTtlStandard
    UserName = 'CmnPipelinePrineTtlStandard'
    Left = 240
    Top = 540
    object CmnPipelinePrintTtlStandardppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object CmnPipelinePrintTtlStandardppField2: TppField
      FieldAlias = 'grTag'
      FieldName = 'grTag'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
    object CmnPipelinePrintTtlStandardppField3: TppField
      FieldAlias = 'strExCode'
      FieldName = 'strExCode'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object CmnPipelinePrintTtlStandardppField4: TppField
      FieldAlias = 'strName'
      FieldName = 'strName'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object CmnPipelinePrintTtlStandardppField5: TppField
      FieldAlias = 'strNameSimple'
      FieldName = 'strNameSimple'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object CmnPipelinePrintTtlStandardppField6: TppField
      FieldAlias = 'strAssociation'
      FieldName = 'strAssociation'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object CmnPipelinePrintTtlStandardppField7: TppField
      FieldAlias = 'dtAppDateStart'
      FieldName = 'dtAppDateStart'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 6
    end
    object CmnPipelinePrintTtlStandardppField8: TppField
      FieldAlias = 'dtAppDateEnd'
      FieldName = 'dtAppDateEnd'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 7
    end
    object CmnPipelinePrintTtlStandardppField9: TppField
      FieldAlias = 'dtUpdateDate'
      FieldName = 'dtUpdateDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object CmnPipelinePrintTtlStandardppField10: TppField
      FieldAlias = 'dtAppDateStartDisp'
      FieldName = 'dtAppDateStartDisp'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object CmnPipelinePrintTtlStandardppField11: TppField
      FieldAlias = 'dtAppDateEndDisp'
      FieldName = 'dtAppDateEndDisp'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object CmnPipelinePrintTtlStandardppField12: TppField
      FieldAlias = 'dtUpdateDateDisp'
      FieldName = 'dtUpdateDateDisp'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
  end
  object CmnImageGeneral: TImageList
    Height = 15
    Left = 4
    Top = 501
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
      9C0031219C0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE003131310000000000000000000000000031313100C68C4A00C68C
      4A00C68C4A0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE003131310000000000000000000000000031313100426B1800426B
      1800426B180031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE003131310000000000000000000000000031313100318CFF00318C
      FF00318CFF0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE0031313100000000000000000000000000313131005A4AB5005A4A
      B5005A4AB50031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100CEA56B00CEA5
      6B00D6A56B0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100638C4200638C
      4200638C420031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE00CECECE00313131000000000000000000313131005AADFF005AAD
      FF005AADFF0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE00CECECE00313131000000000000000000313131007363CE00736B
      CE007363CE0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100313131003131310031313100000000000000000031313100D6B57B00D6B5
      7B00D6B57B0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100313131003131310031313100000000000000000031313100739C5A00739C
      5A00739C5A0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      31003131310031313100313131000000000000000000313131007BBDFF007BBD
      FF007BBDFF0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      31003131310031313100313131000000000000000000313131008484DE008484
      DE008484DE0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100DEBD9400DEBD
      9400DEBD940031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF003131310000000000000000003131310084B5730084AD
      730084AD730031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF003131310000000000000000003131310094CEFF0094CE
      FF0094CEFF0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF00313131000000000000000000313131009C9CEF009C9C
      EF009C9CEF0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100E7CEA500E7CE
      A500E7CEA50031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF003131310000000000000000003131310094BD840094BD
      840094BD840031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100ADD6F700ADD6
      F700ADD6F70031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100ADADF700ADAD
      F700ADADF70031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100EFD6AD00EFD6
      AD00EFD6AD0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100A5CE9400A5CE
      9400A5CE940031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100ADD6F700ADD6
      F700ADD6F70031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100313131003131
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
  object CmnToolbarDropDownMenu: TPopupMenu
    AutoHotkeys = maManual
    BiDiMode = bdLeftToRight
    Images = CmnImageGeneral
    OwnerDraw = True
    ParentBiDiMode = False
    Left = 896
    Top = 136
    object CmnToolbarDropDownMenuTag01: TMenuItem
      Caption = #36196'(&R)'
      ImageIndex = 0
      OnClick = fnCmnToolbarDropDownMenuTagOnClick
    end
    object CmnToolbarDropDownMenuTag02: TMenuItem
      Caption = #38738'(&B)'
      ImageIndex = 1
      OnClick = fnCmnToolbarDropDownMenuTagOnClick
    end
    object CmnToolbarDropDownMenuTag03: TMenuItem
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
      ImageIndex = 2
      OnClick = fnCmnToolbarDropDownMenuTagOnClick
    end
    object CmnToolbarDropDownMenuTag04: TMenuItem
      Caption = #27225'(&O)'
      ImageIndex = 3
      OnClick = fnCmnToolbarDropDownMenuTagOnClick
    end
  end
  object DtlCmnPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Images = CmnImageGeneral
    OnPopup = fnDtlCmnPopupMenuOnPopup
    Left = 868
    Top = 168
    object DtlCmnPopupMenuTagOff: TMenuItem
      Caption = #12399#12364#12377'(&D)'
      OnClick = fnDtlCmnPopupMenuTagOnClick
    end
    object DtlCmnPopupMenuTagComment: TMenuItem
      Caption = #20633#32771#20462#27491'(&U)...'
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object DtlCmnPopupMenuTag01: TMenuItem
      Caption = #36196'(&R)'
      ImageIndex = 0
      object DtlCmnPopupMenuItemTag01: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnDtlCmnPopupMenuTagOnClick
      end
      object DtlCmnPopupMenuItemTag01Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
      end
    end
    object DtlCmnPopupMenuTag02: TMenuItem
      Caption = #38738'(&B)'
      ImageIndex = 1
      object DtlCmnPopupMenuItemTag02: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnDtlCmnPopupMenuTagOnClick
      end
      object DtlCmnPopupMenuItemTag02Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
      end
    end
    object DtlCmnPopupMenuTag03: TMenuItem
      Caption = #32209'(&G)'
      ImageIndex = 2
      object DtlCmnPopupMenuItemTag03: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnDtlCmnPopupMenuTagOnClick
      end
      object DtlCmnPopupMenuItemTag03Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
      end
    end
    object DtlCmnPopupMenuTag04: TMenuItem
      Caption = #27225'(&O)'
      ImageIndex = 3
      object DtlCmnPopupMenuItemTag04: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnDtlCmnPopupMenuTagOnClick
      end
      object DtlCmnPopupMenuItemTag04Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 896
    Top = 196
    object CmnReportPopupMenuImage01: TMenuItem
      Bitmap.Data = {
        3E020000424D3E0200000000000036000000280000000D0000000D0000000100
        18000000000008020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFF000000000000000000000000000000000000000000000000
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
        FF00}
      Caption = #12452#12513#12540#12472#9312
    end
    object CmnReportPopupMenuImage02: TMenuItem
      Bitmap.Data = {
        3E020000424D3E0200000000000036000000280000000D0000000D0000000100
        18000000000008020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFF000000000000
        FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF00000080
        8080C0C0C0FFFFFF000000000000FFFFFF00FFFFFFFFFFFF000000FFFFFFFFFF
        FFC0C0C0000000000000808080C0C0C0FFFFFFC0C0C000000000FFFFFF000000
        FFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000000000808080FFFFFF8080
        8000000000FFFFFFFFFFFFC0C0C0FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
        00000000000080808000000000FFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000C0C0C0FFFFFFFFFFFF0000
        00000000000000000000000000FFFFFFFFFFFFFFFFFF00000000000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FF00FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
        000000FFFFFFFFFFFF00FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00}
      Caption = #12452#12513#12540#12472#9313
    end
  end
  object CmnToolbarImageD: TImageList
    Height = 15
    Masked = False
    Left = 1
    Top = 532
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
      3100313131000000000000000000000000000000000031313100848484008484
      84008484840031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE003131310000000000000000000000000031313100848484008484
      84008484840031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE003131310000000000000000000000000031313100848484008484
      84008484840031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE003131310000000000000000000000000031313100848484008484
      84008484840031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE003131310000000000000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100313131003131310031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100313131003131310031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100313131003131310031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF003131
      3100313131003131310031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FF
      FF00F7FFFF00F7FFFF0031313100000000000000000031313100313131003131
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
  object CmnDataSourcePrintSystem: TDataSource
    DataSet = CmnMemDataPrintSystem
    Left = 304
    Top = 512
  end
  object CmnMemDataPrintSystem: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 332
    Top = 512
    object CmnMemDataPrintSystemstrExCode: TStringField
      Alignment = taRightJustify
      FieldName = 'strExCodeDst'
      Size = 10
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
    object CmnMemDataPrintSystemdtStartDisp: TStringField
      FieldName = 'dtStartDisp'
    end
    object CmnMemDataPrintSystemdtEndDisp: TStringField
      FieldName = 'dtEndDisp'
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
  end
  object CmnPipelinePrintSystem: TppDBPipeline
    DataSource = CmnDataSourcePrintSystem
    UserName = 'CmnPipelinePrintSystem'
    Left = 360
    Top = 512
    object CmnPipelinePrintSystemppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object CmnPipelinePrintSystemppField2: TppField
      FieldAlias = 'strExCodeDst'
      FieldName = 'strExCodeDst'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object CmnPipelinePrintSystemppField3: TppField
      FieldAlias = 'strNameSimpleDst'
      FieldName = 'strNameSimpleDst'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object CmnPipelinePrintSystemppField4: TppField
      FieldAlias = 'dtStart'
      FieldName = 'dtStart'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object CmnPipelinePrintSystemppField5: TppField
      FieldAlias = 'dtEnd'
      FieldName = 'dtEnd'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object CmnPipelinePrintSystemppField6: TppField
      FieldAlias = 'dtStartDisp'
      FieldName = 'dtStartDisp'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object CmnPipelinePrintSystemppField7: TppField
      FieldAlias = 'dtEndDisp'
      FieldName = 'dtEndDisp'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object CmnPipelinePrintSystemppField8: TppField
      FieldAlias = 'strSeg01Code'
      FieldName = 'strSeg01Code'
      FieldLength = 20
      DisplayWidth = 10
      Position = 7
    end
    object CmnPipelinePrintSystemppField9: TppField
      FieldAlias = 'strSeg02Code'
      FieldName = 'strSeg02Code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object CmnPipelinePrintSystemppField10: TppField
      FieldAlias = 'strSeg03Code'
      FieldName = 'strSeg03Code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object CmnPipelinePrintSystemppField11: TppField
      FieldAlias = 'strSeg04Code'
      FieldName = 'strSeg04Code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object CmnPipelinePrintSystemppField12: TppField
      FieldAlias = 'strSeg05Code'
      FieldName = 'strSeg05Code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object CmnPipelinePrintSystemppField13: TppField
      FieldAlias = 'strSeg01Name'
      FieldName = 'strSeg01Name'
      FieldLength = 14
      DisplayWidth = 14
      Position = 12
    end
    object CmnPipelinePrintSystemppField14: TppField
      FieldAlias = 'strSeg02Name'
      FieldName = 'strSeg02Name'
      FieldLength = 20
      DisplayWidth = 14
      Position = 13
    end
    object CmnPipelinePrintSystemppField15: TppField
      FieldAlias = 'strSeg03Name'
      FieldName = 'strSeg03Name'
      FieldLength = 20
      DisplayWidth = 14
      Position = 14
    end
    object CmnPipelinePrintSystemppField16: TppField
      FieldAlias = 'strSeg04Name'
      FieldName = 'strSeg04Name'
      FieldLength = 20
      DisplayWidth = 14
      Position = 15
    end
    object CmnPipelinePrintSystemppField17: TppField
      FieldAlias = 'strSeg05Name'
      FieldName = 'strSeg05Name'
      FieldLength = 20
      DisplayWidth = 14
      Position = 16
    end
    object CmnPipelinePrintSystemppField18: TppField
      FieldAlias = 'strBun01Code'
      FieldName = 'strBun01Code'
      FieldLength = 20
      DisplayWidth = 10
      Position = 17
    end
    object CmnPipelinePrintSystemppField19: TppField
      FieldAlias = 'strBun02Code'
      FieldName = 'strBun02Code'
      FieldLength = 20
      DisplayWidth = 10
      Position = 18
    end
    object CmnPipelinePrintSystemppField20: TppField
      FieldAlias = 'strBun03Code'
      FieldName = 'strBun03Code'
      FieldLength = 20
      DisplayWidth = 10
      Position = 19
    end
    object CmnPipelinePrintSystemppField21: TppField
      FieldAlias = 'strBun04Code'
      FieldName = 'strBun04Code'
      FieldLength = 20
      DisplayWidth = 10
      Position = 20
    end
    object CmnPipelinePrintSystemppField22: TppField
      FieldAlias = 'strBun05Code'
      FieldName = 'strBun05Code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object CmnPipelinePrintSystemppField23: TppField
      FieldAlias = 'strBun01Name'
      FieldName = 'strBun01Name'
      FieldLength = 20
      DisplayWidth = 14
      Position = 22
    end
    object CmnPipelinePrintSystemppField24: TppField
      FieldAlias = 'strBun02Name'
      FieldName = 'strBun02Name'
      FieldLength = 20
      DisplayWidth = 14
      Position = 23
    end
    object CmnPipelinePrintSystemppField25: TppField
      FieldAlias = 'strBun03Name'
      FieldName = 'strBun03Name'
      FieldLength = 20
      DisplayWidth = 14
      Position = 24
    end
    object CmnPipelinePrintSystemppField26: TppField
      FieldAlias = 'strBun04Name'
      FieldName = 'strBun04Name'
      FieldLength = 20
      DisplayWidth = 14
      Position = 25
    end
    object CmnPipelinePrintSystemppField27: TppField
      FieldAlias = 'strBun05Name'
      FieldName = 'strBun05Name'
      FieldLength = 14
      DisplayWidth = 14
      Position = 26
    end
  end
  object CmnReportSystem: TppReport
    AutoStop = False
    ColumnPositions.Strings = (
      '20000'
      '116520'
      '213040')
    DataPipeline = CmnPipelinePrintSystem
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4'
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
    BeforePrint = CmnReportExtStandardDepBeforePrint
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
    Left = 388
    Top = 512
    Version = '19.04'
    mmColumnWidth = 335281
    DataPipelineName = 'CmnPipelinePrintSystem'
    object ppHeaderBand6: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 24268
      mmPrintPosition = 0
      object CmnReportSystemLabelCorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        mmLeft = 1600
        mmTop = 0
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground2
      end
      object CmnReportSystemLabelCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        mmLeft = 16002
        mmTop = 0
        mmWidth = 96012
        BandType = 0
        LayerName = Foreground2
      end
      object CmnReportSystemLabelTitle: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer3
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #23455#22312'XXXXXXXXXXXXXX'#30331#37682#12522#12473#12488
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
        LayerName = Foreground2
      end
      object CmnReportSystemLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 121971
        mmTop = 7409
        mmWidth = 92101
        BandType = 0
        LayerName = Foreground2
      end
      object CmnReportSystemSysVarDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        mmLeft = 273635
        mmTop = 0
        mmWidth = 64008
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12304#20998#39006#12289#12475#12464#12513#12531#12488#12305
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
        mmLeft = 218872
        mmTop = 4234
        mmWidth = 31750
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine116: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 56388
        mmTop = 20204
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel81: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label44'
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
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 4801
        mmTop = 16668
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel83: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label46'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36969#29992#38283#22987
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
        mmLeft = 59208
        mmTop = 20732
        mmWidth = 28804
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine25: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'CmnReportSystemppLineDetailsBottom2'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 3988
        mmTop = 22945
        mmWidth = 323266
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine26: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line26'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 3988
        mmTop = 16140
        mmWidth = 323266
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine27: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line27'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 8128
        mmLeft = 3988
        mmTop = 16140
        mmWidth = 1323
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine36: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 8128
        mmLeft = 325222
        mmTop = 16140
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine1: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8128
        mmLeft = 19583
        mmTop = 16140
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel4: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491#24335#21517#31216
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
        mmLeft = 22403
        mmTop = 16668
        mmWidth = 96012
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine2: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line3'
        Border.mmPadding = 0
        Pen.Width = 0
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 58420
        mmTop = 20204
        mmWidth = 268834
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine3: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 86792
        mmTop = 20204
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel5: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label5'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36969#29992#32066#20102
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
        mmLeft = 89611
        mmTop = 20732
        mmWidth = 28804
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine8: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line8'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8128
        mmLeft = 117196
        mmTop = 16140
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppBun1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Bun1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#39006'1'
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
        mmLeft = 120015
        mmTop = 16668
        mmWidth = 40005
        BandType = 0
        LayerName = Foreground2
      end
      object ppSeg1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Seg1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12475#12464#12513#12531#12488'1'
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
        mmLeft = 120015
        mmTop = 20732
        mmWidth = 40005
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine9: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line9'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8128
        mmLeft = 158801
        mmTop = 16140
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine10: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line10'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 200406
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground2
      end
      object ppBun2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Bun2'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#39006'1'
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
        mmTop = 16668
        mmWidth = 39952
        BandType = 0
        LayerName = Foreground2
      end
      object ppSeg2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label101'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12475#12464#12513#12531#12488'1'
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
        mmTop = 20732
        mmWidth = 39952
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine11: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 242012
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground2
      end
      object ppBun3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Bun3'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#39006'1'
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
        mmLeft = 203226
        mmTop = 16668
        mmWidth = 39952
        BandType = 0
        LayerName = Foreground2
      end
      object ppSeg3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label102'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12475#12464#12513#12531#12488'1'
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
        mmLeft = 203226
        mmTop = 20732
        mmWidth = 39952
        BandType = 0
        LayerName = Foreground2
      end
      object ppBun4: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Bun4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#39006'1'
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
        mmLeft = 244831
        mmTop = 16668
        mmWidth = 39952
        BandType = 0
        LayerName = Foreground2
      end
      object ppSeg4: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Seg4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12475#12464#12513#12531#12488'1'
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
        mmLeft = 244831
        mmTop = 20732
        mmWidth = 39952
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine17: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line17'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 283617
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground2
      end
      object ppBun5: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Bun5'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20998#39006'1'
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
        mmLeft = 286809
        mmTop = 16668
        mmWidth = 39952
        BandType = 0
        LayerName = Foreground2
      end
      object ppSeg5: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Seg5'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12475#12464#12513#12531#12488'1'
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
        mmLeft = 286436
        mmTop = 20732
        mmWidth = 39952
        BandType = 0
        LayerName = Foreground2
      end
    end
    object ppDetailBand_CmnReportSystem: TppDetailBand
      BeforeGenerate = ppDetailBand_CmnReportSystemBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object CmnReportSystemppDBTextExCodeDst: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText85'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExCodeDst'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 4801
        mmTop = 528
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground2
      end
      object CmnReportSystemppDBTextNameSimpleDst: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer3
        UserName = 'DBText88'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimpleDst'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 22403
        mmTop = 529
        mmWidth = 96012
        BandType = 4
        LayerName = Foreground2
      end
      object CmnReportSystemppDBTextAppDateStart: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'CmnReportSystemppDBTextAppDateStart'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtStartDisp'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 59208
        mmTop = 4592
        mmWidth = 28804
        BandType = 4
        LayerName = Foreground2
      end
      object CmnReportSystemppDBTextAppDateEnd: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'CmnReportSystemppDBTextAppDateEnd'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtEndDisp'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 89611
        mmTop = 4592
        mmWidth = 28804
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine121: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line121'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8128
        mmLeft = 19583
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine129: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line129'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 56388
        mmTop = 4064
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine132: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line132'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 86792
        mmTop = 4064
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine133: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line133'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 8128
        mmLeft = 325222
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine134: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line134'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 8128
        mmLeft = 3988
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground2
      end
      object CmnReportSystemppLineDetailsBottom: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'CmnReportSystemppLineDetailsBottom'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 3988
        mmTop = 6805
        mmWidth = 323266
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine22: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line22'
        Border.mmPadding = 0
        Pen.Width = 0
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 58420
        mmTop = 4064
        mmWidth = 268817
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine31: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line31'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 117196
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine32: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line32'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 158801
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine33: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line6'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 200406
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine34: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line34'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 242012
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine35: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 283617
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine37: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Style = psDot
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 134798
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine39: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line12'
        Border.mmPadding = 0
        Pen.Style = psDot
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 176403
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine40: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line40'
        Border.mmPadding = 0
        Pen.Style = psDot
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 218009
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine41: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line41'
        Border.mmPadding = 0
        Pen.Style = psDot
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 259614
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine42: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line42'
        Border.mmPadding = 0
        Pen.Style = psDot
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 8202
        mmLeft = 301219
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBBun1: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBBun1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBun01Code'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 120015
        mmTop = 528
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBSeg1: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBSeg1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSeg01Code'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 120015
        mmTop = 4592
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBBun2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBBun2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBun02Code'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 161621
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBSeg2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBSeg2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSeg02Code'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 161621
        mmTop = 4498
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBBun3: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBBun3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBun03Code'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 203226
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBSeg3: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBSeg3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSeg03Code'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 203226
        mmTop = 4498
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBSeg4: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBSeg4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSeg04Code'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 244831
        mmTop = 4498
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBBun4: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBBun4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBun04Code'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 244831
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBBun5: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBBun5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBun05Code'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 286436
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBSeg5: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBSeg5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSeg05Code'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 286436
        mmTop = 4498
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText11: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText11'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBun01Name'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 137617
        mmTop = 528
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText12: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText12'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSeg01Name'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 137617
        mmTop = 4592
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText14: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText14'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBun02Name'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 179223
        mmTop = 528
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText15: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText15'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSeg02Name'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 179223
        mmTop = 4592
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText16: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText16'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBun03Name'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 220828
        mmTop = 528
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText17: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText17'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSeg03Name'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 220828
        mmTop = 4592
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText18: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText18'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSeg04Name'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 262433
        mmTop = 4592
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText19: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText19'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBun04Name'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 262433
        mmTop = 528
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText20: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText20'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSeg05Name'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 304039
        mmTop = 4592
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText22: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText22'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strBun05Name'
        DataPipeline = CmnPipelinePrintSystem
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
        DataPipelineName = 'CmnPipelinePrintSystem'
        mmHeight = 3175
        mmLeft = 304039
        mmTop = 528
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppFooterBand6: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object CmnReportSystemSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        mmLeft = 162719
        mmTop = 1058
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground2
      end
      object CmnReportSystemAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'CmnReportTtlStandardAccOffice1'
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
        mmLeft = 304536
        mmTop = 1059
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
  object SPDep: TFDStoredProc
    StoredProcName = 'MP_DEP_CHK_HojyoMA'
    Left = 452
    Top = 273
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@MasterKbn'
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
  object SPEnt: TFDStoredProc
    StoredProcName = 'MP_ETY_CHK_HojyoMA'
    Left = 492
    Top = 273
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@MasterKbn'
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
  object SPMas: TFDStoredProc
    StoredProcName = 'MP_MAS_CHK_HOJYOMA'
    Left = 536
    Top = 281
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@MasterKbn'
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
  object SPPay: TFDStoredProc
    StoredProcName = 'MP_PAY_CHK_HOJYOMA'
    Left = 576
    Top = 281
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@MasterKbn'
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
  object SPSel: TFDStoredProc
    StoredProcName = 'MP_SEL_CHK_HOJYOMA'
    Left = 640
    Top = 281
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@MasterKbn'
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
  object SPHap: TFDStoredProc
    StoredProcName = 'MP_HAP_CHK_HOJYOMA'
    Left = 616
    Top = 280
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
        ParamType = ptInput
        Value = 0.000000000000000000
      end
      item
        Name = '@MasterKbn'
        DataType = ftSmallint
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
  object CmnReportFree: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintFree
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4'
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
    BeforePrint = CmnReportExtStandardDepBeforePrint
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
    Left = 509
    Top = 512
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'CmnPipelinePrintFree'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppLine47: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line401'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 51858
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine48: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 77258
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine56: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line47'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 202142
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel11: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label42'
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
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 36248
        mmTop = 16669
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel12: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label43'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#21517#31216
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
        mmLeft = 54769
        mmTop = 16669
        mmWidth = 23548
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel14: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label46'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25991#23383#12501#12522#12540#24773#22577
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
        mmLeft = 80169
        mmTop = 16669
        mmWidth = 123031
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel17: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label49'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25968#20516#12501#12522#12540#24773#22577
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
        mmLeft = 205052
        mmTop = 16669
        mmWidth = 49477
        BandType = 0
        LayerName = Foreground3
      end
      object CmnReportFreeLabelCorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        mmLeft = 1600
        mmTop = 0
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground3
      end
      object CmnReportFreeLabelCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        mmLeft = 16002
        mmTop = 0
        mmWidth = 96012
        BandType = 0
        LayerName = Foreground3
      end
      object CmnReportFreeLabelTitle: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer4
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #37096#38272#30331#37682#12501#12522#12540#38917#30446#30331#37682#12522#12473#12488
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
      object ppLine57: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 121971
        mmTop = 7409
        mmWidth = 92101
        BandType = 0
        LayerName = Foreground3
      end
      object CmnReportFreeSysVarDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        mmLeft = 272543
        mmTop = 0
        mmWidth = 64008
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine70: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line28'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 253207
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel27: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label7'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085#20184#12501#12522#12540#24773#22577
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
        mmLeft = 256117
        mmTop = 16669
        mmWidth = 44450
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine74: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line4'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 35454
        mmTop = 18785
        mmWidth = 265907
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine75: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line5'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 794
        mmLeft = 35454
        mmTop = 16140
        mmWidth = 265907
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine76: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line2'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 35454
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine77: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 299244
        mmTop = 16140
        mmWidth = 2381
        BandType = 0
        LayerName = Foreground3
      end
    end
    object ppDetailBand_Free: TppDetailBand
      BeforeGenerate = ppDetailBand_FreeBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppFreeUnderLineLeft: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 35454
        mmTop = 2117
        mmWidth = 43656
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText1: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText85'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExCode'
        DataPipeline = CmnPipelinePrintFree
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ReprintOnSubsequent = True
        ResetGroup = ppGroup1
        SuppressRepeatedValues = True
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintFree'
        mmHeight = 3175
        mmLeft = 36248
        mmTop = 529
        mmWidth = 16669
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText87'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimple'
        DataPipeline = CmnPipelinePrintFree
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ReprintOnSubsequent = True
        ResetGroup = ppGroup1
        SuppressRepeatedValues = True
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintFree'
        mmHeight = 3175
        mmLeft = 54769
        mmTop = 529
        mmWidth = 23548
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText3: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText88'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strVFreeTitle'
        DataPipeline = CmnPipelinePrintFree
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
        DataPipelineName = 'CmnPipelinePrintFree'
        mmHeight = 3175
        mmLeft = 80169
        mmTop = 529
        mmWidth = 23548
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText4: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strVFree'
        DataPipeline = CmnPipelinePrintFree
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
        DataPipelineName = 'CmnPipelinePrintFree'
        mmHeight = 3175
        mmLeft = 105304
        mmTop = 529
        mmWidth = 97896
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine79: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 35454
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine80: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line33'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 299244
        mmTop = 0
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine81: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 77258
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine88: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 102659
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine90: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line39'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 51858
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine91: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line67'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 202142
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText8: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText901'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNFreeTitle'
        DataPipeline = CmnPipelinePrintFree
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
        DataPipelineName = 'CmnPipelinePrintFree'
        mmHeight = 3175
        mmLeft = 205052
        mmTop = 529
        mmWidth = 23813
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine94: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line16'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 227807
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText9: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText201'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNFree'
        DataPipeline = CmnPipelinePrintFree
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
        DataPipelineName = 'CmnPipelinePrintFree'
        mmHeight = 3175
        mmLeft = 230717
        mmTop = 529
        mmWidth = 23813
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine95: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line18'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 253207
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText10: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'CmnReportExtStandardDepDBTextAppDateStart'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strDFreeTitle'
        DataPipeline = CmnPipelinePrintFree
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
        DataPipelineName = 'CmnPipelinePrintFree'
        mmHeight = 3175
        mmLeft = 256117
        mmTop = 529
        mmWidth = 23813
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine97: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line20'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 278871
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText24: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'CmnReportExtStandardDepDBTextUpdateDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strDFree'
        DataPipeline = CmnPipelinePrintFree
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
        DataPipelineName = 'CmnPipelinePrintFree'
        mmHeight = 2910
        mmLeft = 281782
        mmTop = 529
        mmWidth = 18785
        BandType = 4
        LayerName = Foreground3
      end
      object ppFreeUnderLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'FreeUnderLine'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 79375
        mmTop = 2117
        mmWidth = 221986
        BandType = 4
        LayerName = Foreground3
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object CmnReportFreeSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'CmnReportCsStdppSysVarPage1'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmLeft = 161621
        mmTop = 2381
        mmWidth = 15875
        BandType = 8
        LayerName = Foreground3
      end
      object CmnReportFreeAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'CmnReportExtStandardDepAccOffice'
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
        mmLeft = 304536
        mmTop = 2380
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground3
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'strExCode'
      DataPipeline = CmnPipelinePrintFree
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'CmnPipelinePrintFree'
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
  object CmnPipelinePrintFree: TppDBPipeline
    DataSource = CmnDataSourcePrintFree
    UserName = 'CmnPipelinePrintFree'
    Left = 481
    Top = 512
    object CmnPipelinePrintFreeppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object CmnPipelinePrintFreeppField2: TppField
      FieldAlias = 'strExCode'
      FieldName = 'strExCode'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object CmnPipelinePrintFreeppField3: TppField
      FieldAlias = 'strNameSimple'
      FieldName = 'strNameSimple'
      FieldLength = 14
      DisplayWidth = 14
      Position = 2
    end
    object CmnPipelinePrintFreeppField4: TppField
      FieldAlias = 'strVFreeTitle'
      FieldName = 'strVFreeTitle'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object CmnPipelinePrintFreeppField5: TppField
      FieldAlias = 'strVFree'
      FieldName = 'strVFree'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object CmnPipelinePrintFreeppField6: TppField
      FieldAlias = 'strNFreeTitle'
      FieldName = 'strNFreeTitle'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object CmnPipelinePrintFreeppField7: TppField
      FieldAlias = 'strNFree'
      FieldName = 'strNFree'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object CmnPipelinePrintFreeppField8: TppField
      FieldAlias = 'strDFreeTitle'
      FieldName = 'strDFreeTitle'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object CmnPipelinePrintFreeppField9: TppField
      FieldAlias = 'strDFree'
      FieldName = 'strDFree'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object CmnPipelinePrintFreeppField10: TppField
      FieldAlias = 'dtDFree'
      FieldName = 'dtDFree'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 9
    end
    object CmnPipelinePrintFreeppField11: TppField
      FieldAlias = 'bCodeBreak'
      FieldName = 'bCodeBreak'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 10
    end
  end
  object CmnMemDataPrintFree: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 453
    Top = 512
    object CmnMemDataPrintFreestrExCode: TStringField
      FieldName = 'strExCode'
      Size = 10
    end
    object CmnMemDataPrintFreestrNameSimple: TStringField
      FieldName = 'strNameSimple'
      Size = 14
    end
    object CmnMemDataPrintFreestrVFreeTitle: TStringField
      FieldName = 'strVFreeTitle'
    end
    object CmnMemDataPrintFreestrVFree: TStringField
      FieldName = 'strVFree'
      Size = 60
    end
    object CmnMemDataPrintFreestrNFreeTitle: TStringField
      FieldName = 'strNFreeTitle'
    end
    object CmnMemDataPrintFreestrNFree: TStringField
      FieldName = 'strNFree'
    end
    object CmnMemDataPrintFreestrDFreeTitle: TStringField
      FieldName = 'strDFreeTitle'
    end
    object CmnMemDataPrintFreestrDFree: TStringField
      FieldName = 'strDFree'
    end
    object CmnMemDataPrintFreedtDFree: TDateField
      FieldName = 'dtDFree'
    end
    object CmnMemDataPrintFreebCodeBreak: TBooleanField
      FieldName = 'bCodeBreak'
    end
  end
  object CmnDataSourcePrintFree: TDataSource
    DataSet = CmnMemDataPrintFree
    Left = 425
    Top = 512
  end
  object CmnReportExtStandardDep_DEP: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintExtStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4'
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
    BeforePrint = CmnReportExtStandardDepBeforePrint
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
    Left = 268
    Top = 477
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'CmnPipelinePrintExtStandard'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppLine50: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line401'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 72761
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine51: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 170392
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine60: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line45'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 194469
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine69: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line46'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 211932
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel15: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label42'
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
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 57944
        mmTop = 16668
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel16: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label43'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #27491' '#24335' '#21517' '#31216
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
        mmLeft = 75671
        mmTop = 16668
        mmWidth = 96012
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel18: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label46'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31777#30053#21517#31216
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
        mmLeft = 173302
        mmTop = 16668
        mmWidth = 21960
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel19: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label47'
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
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 197380
        mmTop = 16668
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground4
      end
      object CmnReportExtStandardDepLabelCorpCode_DEP: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        mmLeft = 1600
        mmTop = 0
        mmWidth = 12802
        BandType = 0
        LayerName = Foreground4
      end
      object CmnReportExtStandardDepLabelCorpName_DEP: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        mmLeft = 16002
        mmTop = 0
        mmWidth = 96012
        BandType = 0
        LayerName = Foreground4
      end
      object CmnReportExtStandardDepLabelTitle_DEP: TppLabel
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer5
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #37096#38272#30331#37682#12522#12473#12488
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
      object CmnReportExtStandardDepLineTitle_DEP: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 121971
        mmTop = 7409
        mmWidth = 92101
        BandType = 0
        LayerName = Foreground4
      end
      object CmnReportExtStandardDepSysVarDate_DEP: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        mmLeft = 272543
        mmTop = 0
        mmWidth = 64008
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine92: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line28'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 229130
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel32: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label7'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36969#29992#38283#22987
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
        mmLeft = 214578
        mmTop = 16668
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine93: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line29'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 246857
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel33: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label9'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36969#29992#32066#20102
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
        mmLeft = 232040
        mmTop = 16668
        mmWidth = 16002
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel34: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label13'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26368#32066#26356#26032#26085#26178
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
        mmLeft = 249767
        mmTop = 16668
        mmWidth = 30427
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine98: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line4'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 57150
        mmTop = 18521
        mmWidth = 224103
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine99: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line5'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 794
        mmLeft = 57150
        mmTop = 15875
        mmWidth = 223838
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine100: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line2'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 57150
        mmTop = 16139
        mmWidth = 2032
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine101: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 279136
        mmTop = 15875
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel35: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label1'
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
        Visible = False
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
    object ppDetailBand_StandardDep_DEP: TppDetailBand
      BeforeGenerate = ppDetailBand_StandardDepBeforeGenerate_DEP
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppStandardDepUnderLine_DEP: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 57150
        mmTop = 2116
        mmWidth = 223838
        BandType = 4
        LayerName = Foreground4
      end
      object CmnReportExtStandardDepDBTextCode_DEP: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText85'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExCode'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 57944
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText6: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer5
        UserName = 'DBText87'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strName'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 75671
        mmTop = 529
        mmWidth = 96012
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText7: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText88'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimple'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 173302
        mmTop = 529
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText23: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAssociation'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 197380
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine103: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 57150
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine104: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line33'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 279136
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine105: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 170392
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine106: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 194469
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine107: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line37'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 211932
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine108: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line39'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 72761
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine113: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line18'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 229130
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText31: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'CmnReportExtStandardDepDBTextAppDateStart'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateStartDisp'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 214578
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine114: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line19'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpRight
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 246857
        mmTop = 0
        mmWidth = 2032
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText32: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'CmnReportExtStandardDepDBTextAppDateEnd'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateEndDisp'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 232040
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText35: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'CmnReportExtStandardDepDBTextUpdateDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDateDisp'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 249767
        mmTop = 529
        mmWidth = 30427
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBImage2: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBImage1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'grTag'
        DataPipeline = CmnPipelinePrintExtStandard
        GraphicType = 'Bitmap'
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3440
        mmLeft = 51594
        mmTop = 265
        mmWidth = 5027
        BandType = 4
        LayerName = Foreground4
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object CmnReportExtStandardDepSysVarPage_DEP: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'CmnReportCsStdppSysVarPage1'
        HyperlinkEnabled = False
        AutoSize = False
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
        mmLeft = 161621
        mmTop = 2381
        mmWidth = 15875
        BandType = 8
        LayerName = Foreground4
      end
      object CmnReportExtStandardDepAccOffice_DEP: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'CmnReportExtStandardDepAccOffice'
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
        mmLeft = 304536
        mmTop = 2380
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground4
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
end
