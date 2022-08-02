object JNTCRP008002_9f: TJNTCRP008002_9f
  Left = 367
  Top = 213
  BorderStyle = bsDialog
  Caption = #26032#25163#25968#26009#30331#37682
  ClientHeight = 440
  ClientWidth = 616
  Color = 15921906
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = fnJNTCRP008002_9fOnCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 12
  object CmnLabelAccountCode: TMLabel
    Left = 8
    Top = 11
    Width = 89
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
  object LabelAllBkName: TMLabel
    Left = 169
    Top = 10
    Width = 384
    Height = 19
    AutoSize = False
    Caption = #37504#34892#21517#31216'---------------------------------------------X'
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#12468#12471#12483#12463
    Font.Style = []
    ParentFont = False
    FontRatio.Auto = False
  end
  object LabelStatus: TMLabel
    Left = 563
    Top = 11
    Width = 49
    Height = 19
    Alignment = taCenter
    AutoSize = False
    Caption = #26032#35215
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#12468#12471#12483#12463
    Font.Style = []
    ParentFont = False
    BorderLine = tmb3DDown
    FontRatio.Auto = False
  end
  object MLabel22: TMLabel
    Left = 12
    Top = 336
    Width = 85
    Height = 18
    AutoSize = False
    Caption = #38651#23376#35352#37682#20661#27177
    FontRatio.Auto = False
  end
  object DlgPanelMessage: TMPanel
    Left = 2
    Top = 414
    Width = 284
    Height = 22
    BevelOuter = bvLowered
    Color = 15921906
    ParentBackground = False
    TabOrder = 4
    object DlgLabelMessage: TMLabel
      Left = 4
      Top = 2
      Width = 381
      Height = 18
      AutoSize = False
      Caption = 'F8 '#12501#12449#12452#12523#20986#21147
      Color = 15921906
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBtnText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentColor = False
      ParentFont = False
      FontRatio.Auto = False
    end
  end
  object DlgButtonOK: TMBitBtn
    Left = 293
    Top = 413
    Width = 105
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
    TabOrder = 5
    OnClick = fnDlgButtonOKOnClick
  end
  object DlgButtonCancel: TMBitBtn
    Left = 401
    Top = 413
    Width = 105
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
      DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
      DCDD666666000000000000C0C0C0F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
      F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1C0C0C00000000000
      00666666DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDE
      DFDEDEDFDEDEDFDEDEDFDEDFDFDF666666000000000000C0C0C0F2F2F2F2F2F2
      F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2
      F2F2F2F2C0C0C0000000000000666666E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1
      E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E1E0E1E0E1666666000000
      000000C0C0C0F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
      F3F3F3F3F3F3F3F3F3F3F3F3F3F2F2F2C0C0C0000000000000666666E3E3E3E3
      E3E3E3E3E3824B27824A26824A27824A26824A26824A26824A27824A27824A26
      E3E3E3E3E3E3666666000000000000C0C0C0F3F3F3F3F3F3F3F3F3B4B4B4B4B4
      B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4B4F3F3F3F3F3F3C0C0C000
      0000000000666666E5E6E6E5E6E67B46257B46257B46247B46247B46257B4624
      7A46247A46257B4624E5E6E6E5E6E6E6E6E6666666000000000000C0C0C0F5F5
      F5F5F5F5B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2F5
      F5F5F5F5F5F5F5F5C0C0C0000000000000666666E8E8E9E8E8E9724122734222
      E8E8E9E8E8E9E8E8E9734222734222734122E8E8E9E8E8E9E8E8E9E9E8E86666
      66000000000000C0C0C0F6F6F6F6F6F6B0B0B0B1B1B1F6F6F6F6F6F6F6F6F6B1
      B1B1B1B1B1B0B0B0F6F6F6F6F6F6F6F6F6F6F6F6C0C0C0000000000000666666
      EBEBEBEBEBEB6B3D1F6B3D20EBEBEBEBEBEB6B3D206B3E1F6B3D1FEBEBEBEBEB
      EBEBEBEBEBEBEBEBEBEB666666000000000000C0C0C0F7F7F7F7F7F7AFAFAFAF
      AFAFF7F7F7F7F7F7AFAFAFAFAFAFAFAFAFF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7
      C0C0C0000000000000666666EDEDEDEDEDED64391D64391DEDEDEDEDEDED6339
      1DEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEEEDEE666666000000000000C0
      C0C0F8F8F8F8F8F8ADADADADADADF8F8F8F8F8F8ADADADF8F8F8F8F8F8F8F8F8
      F8F8F8F8F8F8F8F8F8F8F8F8C0C0C0000000000000666666F0F0F0F0F0F05B34
      1B5B341AF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
      F0F0666666000000000000C0C0C0F9F9F9F9F9F9ABABABABABABF9F9F9F9F9F9
      F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9C0C0C00000000000
      00666666F3F3F3F3F3F353301953301953301954301853301853301954301853
      3018533018533018F3F3F3F3F3F3666666000000000000C0C0C0FAFAFAFAFAFA
      A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9FAFA
      FAFAFAFAC0C0C0000000000000666666F6F6F6F6F6F6F6F6F64E2D174E2D174E
      2D174E2D174E2D174E2D174E2D174E2D17F6F6F6F6F6F6F6F6F6666666000000
      000000C0C0C0FBFBFBFBFBFBFBFBFBA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
      A8A8A8A8A8A8A8FBFBFBFBFBFBFBFBFBC0C0C0000000000000666666F9F8F8F9
      F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8F9F8F8
      F9F8F8F9F9F8666666000000000000C0C0C0FCFCFCFCFCFCFCFCFCFCFCFCFCFC
      FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFDFDC0C0C000
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
    TabOrder = 6
    OnClick = fnDlgButtonCancelOnClick
  end
  object MPanelStartYMD: TMPanel
    Left = 8
    Top = 32
    Width = 209
    Height = 25
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 1
    object MLabel_From: TMLabel
      Left = 0
      Top = 4
      Width = 71
      Height = 19
      AutoSize = False
      Caption = #36969#29992#38283#22987#26085
      FontRatio.Auto = False
    end
    object MDateStartYMD: TMDateEdit
      Left = 100
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
      OnExit = MDateStartYMDExit
      OnKeyDown = fnDlgFunctionOnKeyDown
      Calendar = True
      DateFormat = dfEMD
      DateInputType = diYMD
      Gengou = 'H'
      SepChar = '/'
      Value = 0
      Validate = False
    end
  end
  object NeAllBkCode: TMNumEdit
    Left = 108
    Top = 11
    Width = 39
    Height = 19
    ArrowDisp = adFocused
    SelectDisp = sdNone
    SelectItems.Strings = (
      '0: '#12381#12398#20182#19968#33324
      '1: '#36899#32080#23376'('#35242')'#20250#31038
      '2: '#38750#36899#32080#23376#20250#31038
      '3: '#38306#36899#20250#31038)
    OnArrowClick = NeAllBkCodeArrowClick
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
    OnEnter = NeAllBkCodeEnter
    OnExit = NeAllBkCodeExit
    OnKeyDown = fnDlgFunctionOnKeyDown
    FormatStr = '0000'
    Negative = False
    MaxValue = 99.000000000000000000
    Digits = 4
    Validate = False
    InputFlagEnabled = True
    Zero = True
  end
  object CmnPanelInformation01: TMPanel
    Left = -4
    Top = 58
    Width = 620
    Height = 278
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 2
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnExit = CmnEditFeeValue010102Exit
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnExit = CmnEditFeeValue010202Exit
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnExit = CmnEditFeeValue020102Exit
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnExit = CmnEditFeeValue020202Exit
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnExit = CmnEditFeeValue030102Exit
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnExit = CmnEditFeeValue030202Exit
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
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
          TabOrder = 2
          OnChange = CmnChange
          OnKeyDown = fnDlgFunctionOnKeyDown
          FormatStr = ',,,0'
          Negative = False
          MaxValue = 9999.000000000000000000
          Digits = 4
          Validate = False
          Zero = True
        end
      end
    end
  end
  object DlgButtonEnd: TMBitBtn
    Left = 509
    Top = 413
    Width = 105
    Height = 25
    Caption = #32066#20102'(&X)'
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
    TabOrder = 7
    OnClick = DlgButtonEndClick
  end
  object MPanel2: TMPanel
    Left = 8
    Top = 355
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
        OnChange = CmnChange
        OnKeyDown = fnDlgFunctionOnKeyDown
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
        OnChange = CmnChange
        OnKeyDown = fnDlgFunctionOnKeyDown
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
  object SpMSHist: TFDStoredProc
    StoredProcName = 'MP_MSHIST_SETINFO'
    Left = 224
    Top = 409
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
  object CmnSaveDialogFileName: TMSaveDialog
    Left = 197
    Top = 404
  end
end
