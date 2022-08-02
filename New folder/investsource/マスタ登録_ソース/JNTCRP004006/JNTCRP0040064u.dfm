object JNTCRP0040064f: TJNTCRP0040064f
  Left = 318
  Top = 149
  BorderStyle = bsDialog
  Caption = #35443#32048#24773#22577#35373#23450
  ClientHeight = 196
  ClientWidth = 712
  Color = clWhite
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object CmnPanelInformation01: TMPanel
    Left = 0
    Top = 0
    Width = 712
    Height = 196
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lbPayInfoDisp: TMLabel
      Left = 7
      Top = 6
      Width = 206
      Height = 20
      AutoSize = False
      Caption = #35443#32048#24773#22577
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      FontRatio.Auto = False
    end
    object CmnPanelPaymentBase: TMPanel
      Left = 6
      Top = 32
      Width = 698
      Height = 107
      BevelInner = bvLowered
      Color = 14608367
      ParentBackground = False
      TabOrder = 0
      object CmnPanelPayment: TMPanel
        Left = 2
        Top = 2
        Width = 694
        Height = 103
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object MLabel16: TMLabel
          Left = 0
          Top = 0
          Width = 25
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = 'NO'
          Color = 16766672
          ParentColor = False
          BorderLine = tmb3DUp
          FontRatio.Auto = False
        end
        object MLabel17: TMLabel
          Left = 1
          Top = 18
          Width = 25
          Height = 17
          Alignment = taCenter
          AutoSize = False
          Caption = '1'
          Color = 16766672
          ParentColor = False
          BorderLine = tmb3DUp
          FontRatio.Auto = False
        end
        object MLabel18: TMLabel
          Left = 1
          Top = 34
          Width = 25
          Height = 17
          Alignment = taCenter
          AutoSize = False
          Caption = '2'
          Color = 16766672
          ParentColor = False
          BorderLine = tmb3DUp
          FontRatio.Auto = False
        end
        object MLabel19: TMLabel
          Left = 1
          Top = 51
          Width = 25
          Height = 17
          Alignment = taCenter
          AutoSize = False
          Caption = '3'
          Color = 16766672
          ParentColor = False
          BorderLine = tmb3DUp
          FontRatio.Auto = False
        end
        object MLabel20: TMLabel
          Left = 1
          Top = 69
          Width = 25
          Height = 17
          Alignment = taCenter
          AutoSize = False
          Caption = '4'
          Color = 16766672
          ParentColor = False
          BorderLine = tmb3DUp
          FontRatio.Auto = False
        end
        object MLabel21: TMLabel
          Left = 1
          Top = 86
          Width = 25
          Height = 17
          Alignment = taCenter
          AutoSize = False
          Caption = '5'
          Color = 16766672
          ParentColor = False
          BorderLine = tmb3DUp
          FontRatio.Auto = False
        end
        object MLabel12: TMLabel
          Left = 25
          Top = 0
          Width = 302
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = #22522#28310#37329#38989
          Color = 16766672
          ParentColor = False
          BorderLine = tmb3DUp
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedMinPrice01Unit: TMLabel
          Left = 136
          Top = 18
          Width = 39
          Height = 16
          AutoSize = False
          Caption = #20870#20197#19978
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedMinPrice02Unit: TMLabel
          Left = 136
          Top = 35
          Width = 39
          Height = 16
          AutoSize = False
          Caption = #20870#20197#19978
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedMinPrice03Unit: TMLabel
          Left = 136
          Top = 52
          Width = 39
          Height = 16
          AutoSize = False
          Caption = #20870#20197#19978
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedMinPrice04Unit: TMLabel
          Left = 136
          Top = 69
          Width = 39
          Height = 16
          AutoSize = False
          Caption = #20870#20197#19978
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedMinPrice05Unit: TMLabel
          Left = 136
          Top = 86
          Width = 39
          Height = 16
          AutoSize = False
          Caption = #20870#20197#19978
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedMaxPrice05Unit: TMLabel
          Left = 287
          Top = 86
          Width = 39
          Height = 16
          AutoSize = False
          Caption = #20870#26410#28288
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedMaxPrice04Unit: TMLabel
          Left = 287
          Top = 69
          Width = 39
          Height = 16
          AutoSize = False
          Caption = #20870#26410#28288
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedMaxPrice03Unit: TMLabel
          Left = 287
          Top = 52
          Width = 39
          Height = 16
          AutoSize = False
          Caption = #20870#26410#28288
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedMaxPrice02Unit: TMLabel
          Left = 287
          Top = 35
          Width = 39
          Height = 16
          AutoSize = False
          Caption = #20870#26410#28288
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedMaxPrice01Unit: TMLabel
          Left = 287
          Top = 18
          Width = 39
          Height = 16
          AutoSize = False
          Caption = #20870#26410#28288
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object MLabel14: TMLabel
          Left = 327
          Top = 0
          Width = 111
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = #20998#35299#22522#28310#20516
          Color = 16766672
          ParentColor = False
          BorderLine = tmb3DUp
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedValue05Unit: TMLabel
          Left = 426
          Top = 86
          Width = 11
          Height = 16
          AutoSize = False
          Caption = '%'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedValue04Unit: TMLabel
          Left = 426
          Top = 69
          Width = 11
          Height = 16
          AutoSize = False
          Caption = '%'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedValue03Unit: TMLabel
          Left = 426
          Top = 52
          Width = 11
          Height = 16
          AutoSize = False
          Caption = '%'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedValue02Unit: TMLabel
          Left = 426
          Top = 35
          Width = 11
          Height = 16
          AutoSize = False
          Caption = '%'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabelPaymentColumnBasedValue01Unit: TMLabel
          Left = 426
          Top = 18
          Width = 11
          Height = 16
          AutoSize = False
          Caption = '%'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object MLabel6: TMLabel
          Left = 438
          Top = 0
          Width = 111
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = #31471#25968#20966#29702#38989
          Color = 16766672
          ParentColor = False
          BorderLine = tmb3DUp
          FontRatio.Auto = False
        end
        object MLabel11: TMLabel
          Left = 549
          Top = 0
          Width = 98
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = #31471#25968#20966#29702#26041#27861
          Color = 16766672
          ParentColor = False
          BorderLine = tmb3DUp
          FontRatio.Auto = False
        end
        object CmnLabel01005PaymentColumnFractionDesc: TMLabel
          Left = 576
          Top = 18
          Width = 62
          Height = 16
          AutoSize = False
          Caption = 'XXXXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabel02005PaymentColumnFractionDesc: TMLabel
          Left = 576
          Top = 35
          Width = 62
          Height = 16
          AutoSize = False
          Caption = 'XXXXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabel03005PaymentColumnFractionDesc: TMLabel
          Left = 576
          Top = 52
          Width = 62
          Height = 16
          AutoSize = False
          Caption = 'XXXXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabel04005PaymentColumnFractionDesc: TMLabel
          Left = 576
          Top = 69
          Width = 62
          Height = 16
          AutoSize = False
          Caption = 'XXXXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object CmnLabel05005PaymentColumnFractionDesc: TMLabel
          Left = 576
          Top = 86
          Width = 62
          Height = 16
          AutoSize = False
          Caption = 'XXXXXXXX'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          MBottomMargin = 1
          FontRatio.Auto = False
        end
        object MLabel7: TMLabel
          Left = 647
          Top = 0
          Width = 48
          Height = 18
          Alignment = taCenter
          AutoSize = False
          Caption = #12469#12452#12488
          Color = 16766672
          ParentColor = False
          BorderLine = tmb3DUp
          FontRatio.Auto = False
        end
        object MPanel2: TMPanel
          Left = 25
          Top = 34
          Width = 670
          Height = 1
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
        end
        object MPanel3: TMPanel
          Left = 25
          Top = 51
          Width = 670
          Height = 1
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 31
        end
        object MPanel4: TMPanel
          Left = 25
          Top = 68
          Width = 670
          Height = 1
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 32
        end
        object MPanel5: TMPanel
          Left = 25
          Top = 85
          Width = 670
          Height = 1
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 33
        end
        object MPanel6: TMPanel
          Left = 25
          Top = 102
          Width = 670
          Height = 1
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 34
        end
        object MPanel7: TMPanel
          Left = 135
          Top = 18
          Width = 1
          Height = 84
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 35
        end
        object MPanel8: TMPanel
          Left = 175
          Top = 18
          Width = 1
          Height = 84
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 36
        end
        object MPanel9: TMPanel
          Left = 286
          Top = 18
          Width = 1
          Height = 84
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 37
        end
        object MPanel10: TMPanel
          Left = 326
          Top = 18
          Width = 1
          Height = 84
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 38
        end
        object QRShape1: TMPanel
          Left = 572
          Top = 19
          Width = 1
          Height = 84
          ParentBackground = False
          TabOrder = 39
        end
        object CmnEdit01001PaymentColumnBasedMinPrice: TMNumEdit
          Left = 25
          Top = 18
          Width = 110
          Height = 16
          TabStop = False
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit02001PaymentColumnBasedMinPrice: TMNumEdit
          Left = 25
          Top = 35
          Width = 110
          Height = 16
          TabStop = False
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit03001PaymentColumnBasedMinPrice: TMNumEdit
          Left = 25
          Top = 52
          Width = 110
          Height = 16
          TabStop = False
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit04001PaymentColumnBasedMinPrice: TMNumEdit
          Left = 25
          Top = 69
          Width = 110
          Height = 16
          TabStop = False
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 19
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit05001PaymentColumnBasedMinPrice: TMNumEdit
          Left = 25
          Top = 86
          Width = 110
          Height = 16
          TabStop = False
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 25
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit01002PaymentColumnBasedMaxPrice: TMNumEdit
          Left = 176
          Top = 18
          Width = 110
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 2
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnBasedMaxPriceExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Negative = False
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit02002PaymentColumnBasedMaxPrice: TMNumEdit
          Left = 176
          Top = 35
          Width = 110
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 8
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnBasedMaxPriceExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Negative = False
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit03002PaymentColumnBasedMaxPrice: TMNumEdit
          Left = 176
          Top = 52
          Width = 110
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 14
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnBasedMaxPriceExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Negative = False
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit04002PaymentColumnBasedMaxPrice: TMNumEdit
          Left = 176
          Top = 69
          Width = 110
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 20
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnBasedMaxPriceExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Negative = False
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit05002PaymentColumnBasedMaxPrice: TMNumEdit
          Left = 176
          Top = 86
          Width = 110
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 26
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnBasedMaxPriceExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Negative = False
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object MPanel11: TMPanel
          Left = 437
          Top = 19
          Width = 1
          Height = 84
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 40
        end
        object MPanel12: TMPanel
          Left = 548
          Top = 19
          Width = 1
          Height = 84
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 41
        end
        object MPanel13: TMPanel
          Left = 646
          Top = 19
          Width = 1
          Height = 84
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 42
        end
        object CmnEdit01003PaymentColumnBasedValue: TMNumEdit
          Left = 327
          Top = 18
          Width = 98
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 3
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnBasedValueExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '##0.00'
          Negative = False
          Decimals = 2
          Digits = 5
          Validate = False
          Value = 100.000000000000000000
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit02003PaymentColumnBasedValue: TMNumEdit
          Left = 327
          Top = 35
          Width = 98
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 9
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnBasedValueExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '##0.00'
          Negative = False
          Decimals = 2
          Digits = 5
          Validate = False
          Value = 100.000000000000000000
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit03003PaymentColumnBasedValue: TMNumEdit
          Left = 327
          Top = 52
          Width = 98
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 15
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnBasedValueExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '##0.00'
          Negative = False
          Decimals = 2
          Digits = 5
          Validate = False
          Value = 100.000000000000000000
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit04003PaymentColumnBasedValue: TMNumEdit
          Left = 327
          Top = 69
          Width = 98
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 21
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnBasedValueExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '##0.00'
          Negative = False
          Decimals = 2
          Digits = 5
          Validate = False
          Value = 100.000000000000000000
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit05003PaymentColumnBasedValue: TMNumEdit
          Left = 327
          Top = 86
          Width = 98
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 27
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnBasedValueExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '##0.00'
          Negative = False
          Decimals = 2
          Digits = 5
          Validate = False
          Value = 100.000000000000000000
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit01004PaymentColumnFractionPrice: TMNumEdit
          Left = 438
          Top = 18
          Width = 110
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 4
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnFractionPriceExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Negative = False
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit02004PaymentColumnFractionPrice: TMNumEdit
          Left = 438
          Top = 35
          Width = 110
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 10
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnFractionPriceExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Negative = False
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit03004PaymentColumnFractionPrice: TMNumEdit
          Left = 438
          Top = 52
          Width = 110
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 16
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnFractionPriceExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Negative = False
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit04004PaymentColumnFractionPrice: TMNumEdit
          Left = 438
          Top = 69
          Width = 110
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 22
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnFractionPriceExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Negative = False
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit05004PaymentColumnFractionPrice: TMNumEdit
          Left = 438
          Top = 86
          Width = 110
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 28
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnFractionPriceExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          FormatStr = '#,##0'
          Negative = False
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit05005PaymentColumnFraction: TMNumEdit
          Left = 549
          Top = 86
          Width = 23
          Height = 16
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          SelectItems.Strings = (
            '0: '#20999#12426#25448#12390
            '1: '#20999#12426#19978#12370
            '2: '#22235#25448#20116#20837)
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 29
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnFractionExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit04005PaymentColumnFraction: TMNumEdit
          Left = 549
          Top = 69
          Width = 23
          Height = 16
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          SelectItems.Strings = (
            '0: '#20999#12426#25448#12390
            '1: '#20999#12426#19978#12370
            '2: '#22235#25448#20116#20837)
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 23
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnFractionExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit03005PaymentColumnFraction: TMNumEdit
          Left = 549
          Top = 52
          Width = 23
          Height = 16
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          SelectItems.Strings = (
            '0: '#20999#12426#25448#12390
            '1: '#20999#12426#19978#12370
            '2: '#22235#25448#20116#20837)
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 17
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnFractionExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit02005PaymentColumnFraction: TMNumEdit
          Left = 549
          Top = 35
          Width = 23
          Height = 16
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          SelectItems.Strings = (
            '0: '#20999#12426#25448#12390
            '1: '#20999#12426#19978#12370
            '2: '#22235#25448#20116#20837)
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 11
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnFractionExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit01005PaymentColumnFraction: TMNumEdit
          Left = 549
          Top = 18
          Width = 23
          Height = 16
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          SelectItems.Strings = (
            '0: '#20999#12426#25448#12390
            '1: '#20999#12426#19978#12370
            '2: '#22235#25448#20116#20837)
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 5
          OnChange = CmnEditColumnChange
          OnExit = CmnEditPaymentColumnFractionExit
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit01006PaymentColumnSite: TMNumEdit
          Left = 647
          Top = 18
          Width = 48
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 6
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          Negative = False
          Digits = 4
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit02006PaymentColumnSite: TMNumEdit
          Left = 647
          Top = 35
          Width = 48
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 12
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          Negative = False
          Digits = 4
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit03006PaymentColumnSite: TMNumEdit
          Left = 647
          Top = 52
          Width = 48
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 18
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          Negative = False
          Digits = 4
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit04006PaymentColumnSite: TMNumEdit
          Left = 647
          Top = 69
          Width = 48
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 24
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          Negative = False
          Digits = 4
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object CmnEdit05006PaymentColumnSite: TMNumEdit
          Left = 647
          Top = 86
          Width = 48
          Height = 16
          ArrowDisp = adNone
          SelectDisp = sdNone
          ArrowType = atArrow
          F4Arrow = True
          AutoSize = False
          BorderStyle = bsNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ImeMode = imClose
          MTopMargin = 2
          MRightMargin = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 30
          OnKeyDown = fnDialogCommonFunctionOnKeyDown
          Negative = False
          Digits = 4
          Validate = False
          InputFlagEnabled = True
          Zero = True
        end
        object MPanel1: TMPanel
          Left = -1
          Top = 18
          Width = 695
          Height = 1
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 43
        end
      end
    end
    object CmnButtonUpdate: TMBitBtn
      Left = 485
      Top = 156
      Width = 107
      Height = 23
      Caption = '&OK'
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
        F2F2F2F2C0C0C0000000000000666666E1E1E0E1E1E0E1E1E0E1E0DFBFAB9DA1
        7C638B59388B5938A17C63BFAB9DE1E0DFE1E1E0E1E1E0E1E0E1666666000000
        000000C0C0C0F3F3F3F3F3F3F3F3F3F2F2F2DCDCDCC8C8C8BABABABABABAC8C8
        C8DCDCDCF2F2F2F3F3F3F3F3F3F2F2F2C0C0C0000000000000666666E3E3E3E3
        E3E3E3E2E2B095847E47257E47247E47257D48247D48257E4724B09584E3E2E2
        E3E3E3E3E3E3666666000000000000C0C0C0F3F3F3F3F3F3F3F3F3D3D3D3B3B3
        B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3D3D3D3F3F3F3F3F3F3F3F3F3C0C0C000
        0000000000666666E5E6E6E5E6E6BDACA0774423825536AE9585D3CBC6D3CBC6
        AE9585825536774323BDACA0E5E6E6E6E6E6666666000000000000C0C0C0F5F5
        F5F5F5F5DCDCDCB2B2B2B8B8B8D3D3D3E9E9E9E9E9E9D3D3D3B8B8B8B1B1B1DC
        DCDCF5F5F5F5F5F5C0C0C0000000000000666666E8E8E9E8E8E99777636F4021
        AC9485E8E8E9E8E8E9E8E8E9E8E8E9AC94856F4021977762E8E8E9E9E8E86666
        66000000000000C0C0C0F6F6F6F6F6F6C6C6C6B0B0B0D3D3D3F6F6F6F6F6F6F6
        F6F6F6F6F6D3D3D3B0B0B0C6C6C6F6F6F6F6F6F6C0C0C0000000000000666666
        EBEBEBEBEBEB754C33693C1FD5CEC9EBEBEBEBEBEBEBEBEBEBEBEBD5CEC9683C
        1F764C33EBEBEBEBEBEB666666000000000000C0C0C0F7F7F7F7F7F7B5B5B5AE
        AEAEEAEAEAF7F7F7F7F7F7F7F7F7F7F7F7EAEAEAAEAEAEB5B5B5F7F7F7F7F7F7
        C0C0C0000000000000666666EDEDEDEDEDED6F4A3162381DD6CFCBEDEDEDEDED
        EDEDEDEDEDEDEDD6CFCB61371D6F4931EDEDEDEEEDEE666666000000000000C0
        C0C0F8F8F8F8F8F8B4B4B4ADADADEBEBEBF8F8F8F8F8F8F8F8F8F8F8F8EBEBEB
        ACACACB4B4B4F8F8F8F8F8F8C0C0C0000000000000666666F0F0F0F0F0F08B71
        605A331BA59286F0F0F0F0F0F0F0F0F0F0F0F0A592865A331A8B7160F0F0F0F0
        F0F0666666000000000000C0C0C0F9F9F9F9F9F9C4C4C4ABABABD2D2D2F9F9F9
        F9F9F9F9F9F9F9F9F9D2D2D2ABABABC4C4C4F9F9F9F9F9F9C0C0C00000000000
        00666666F3F3F3F3F3F3B9ADA4532F1863442EA39286D9D3CFD9D3CFA3928662
        442E532F18B9ADA4F3F3F3F3F3F3666666000000000000C0C0C0FAFAFAFAFAFA
        DDDDDDA9A9A9B1B1B1D2D2D2EDEDEDEDEDEDD2D2D2B1B1B1A9A9A9DDDDDDFAFA
        FAFAFAFAC0C0C0000000000000666666F6F6F6F6F6F6F5F5F5A291864E2D174E
        2D174E2D174E2D174E2D174E2D17A29186F5F5F5F6F6F6F6F6F6666666000000
        000000C0C0C0FBFBFBFBFBFBFBFBFBD1D1D1A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8D1D1D1FBFBFBFBFBFBFBFBFBC0C0C0000000000000666666F9F8F8F9
        F8F8F9F8F8F8F7F7BBAFA78670615F412D5F412D867061BBAFA7F8F7F7F9F8F8
        F9F8F8F9F9F8666666000000000000C0C0C0FCFCFCFCFCFCFCFCFCFCFCFCDEDE
        DEC4C4C4B0B0B0B0B0B0C4C4C4DEDEDEFCFCFCFCFCFCFCFCFCFDFDFDC0C0C000
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
      TabOrder = 1
      OnClick = CmnButtonUpdateClick
    end
    object CmnButtonCancel: TMBitBtn
      Left = 596
      Top = 156
      Width = 107
      Height = 23
      Caption = #12461#12515#12531#12475#12523'(&C)'
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
      TabOrder = 2
      OnClick = CmnButtonCancelClick
    end
  end
end
