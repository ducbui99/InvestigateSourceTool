object FrmJNTCRP004004F: TFrmJNTCRP004004F
  Left = 506
  Top = 195
  HelpContext = 130
  BorderStyle = bsNone
  Caption = #36009#22770#24773#22577
  ClientHeight = 550
  ClientWidth = 945
  Color = clWindow
  ParentFont = True
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
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
  object DtlPanel: TMPanel
    Left = 0
    Top = 50
    Width = 945
    Height = 460
    Align = alClient
    BevelOuter = bvNone
    Caption = 'DtlPanel'
    Color = 15921906
    ParentBackground = False
    TabOrder = 1
    object MTab1: TMTab
      Left = 0
      Top = 0
      Width = 945
      Height = 44
      Items = <
        item
          Caption = #22522#26412#24773#22577
          Color = 16766672
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          SyncControl = tbsKihon
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end
        item
          Caption = #24471#24847#20808#20837#21147#12539#38598#35336#24773#22577
          Color = 16766672
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          SyncControl = tbsInput
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end
        item
          Caption = #20181#20837#20808#20837#21147#12539#38598#35336#24773#22577
          Color = 16766672
          SyncControl = tbsInputS
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end
        item
          Caption = #24471#24847#20808#21360#21047#24773#22577
          Color = 16766672
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          SyncControl = tbsPrint
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end
        item
          Caption = #20181#20837#20808#21360#21047#24773#22577
          Color = 16766672
          SyncControl = tbsPrintS
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end
        item
          Caption = #12381#12398#20182
          Color = 16766672
          SyncControl = tbsOther
          Alignment = taCenter
          ImageIndex = -1
          ParentBorderCaption = True
        end>
      Align = alTop
      TabOrder = 0
      OnChange = MTab1Change
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
      BorderCaptionAlign = taCenter
      DropShadow = False
    end
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 44
      Width = 945
      Height = 416
      Align = alClient
      BorderStyle = bsNone
      Color = 15659756
      ParentColor = False
      TabOrder = 1
      object tbsInputS: TMPanel
        Left = 0
        Top = 0
        Width = 945
        Height = 416
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 4
        Visible = False
        object Label35: TMLabel
          Left = 535
          Top = 40
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #21462#24341#21306#20998
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
        object Label36: TMLabel
          Left = 535
          Top = 62
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #21517#31216#20837#21147#21306#20998
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
        object Label39: TMLabel
          Left = 535
          Top = 129
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #25351#23450#21830#21697#65402#65392#65412#65438#21306#20998
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
        object Label40: TMLabel
          Left = 535
          Top = 151
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #25351#23450#21830#21697#65402#65392#65412#65438#26689#25968
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
        object f1TRIHIKIKBNNM_Si: TMLabel
          Left = 685
          Top = 40
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
          FontRatio.Auto = False
        end
        object f1NMKBNNM_Si: TMLabel
          Left = 685
          Top = 62
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
          FontRatio.Auto = False
        end
        object f1SSHCDKBNNM_Si: TMLabel
          Left = 685
          Top = 129
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
          FontRatio.Auto = False
        end
        object Label45: TMLabel
          Left = 670
          Top = 151
          Width = 20
          Height = 19
          AutoSize = False
          Caption = #26689
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
          Left = 508
          Top = 18
          Width = 89
          Height = 19
          AutoSize = False
          Caption = #20181#20837#20253#31080#20837#21147
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object Label50: TMLabel
          Left = 56
          Top = 39
          Width = 100
          Height = 19
          AutoSize = False
          Caption = #20181#20837#31471#25968#21306#20998
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
        object f1URKINHSUKBNNM_Si: TMLabel
          Left = 232
          Top = 39
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
          FontRatio.Auto = False
        end
        object Label52: TMLabel
          Left = 56
          Top = 127
          Width = 100
          Height = 19
          AutoSize = False
          Caption = #28040#36027#31246#31471#25968#20966#29702
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
        object f1ZHSUKBNNM_Si: TMLabel
          Left = 232
          Top = 127
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
          FontRatio.Auto = False
        end
        object Label54: TMLabel
          Left = 56
          Top = 105
          Width = 100
          Height = 19
          AutoSize = False
          Caption = #28040#36027#31246#31471#25968#21336#20301
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
        object f1ZHSUTNIKBNNM_Si: TMLabel
          Left = 232
          Top = 105
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
          FontRatio.Auto = False
        end
        object Label56: TMLabel
          Left = 56
          Top = 83
          Width = 100
          Height = 19
          AutoSize = False
          Caption = #28040#36027#31246#25903#25173#21306#20998
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
        object f1ZSEIKBNNM_Si: TMLabel
          Left = 232
          Top = 83
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
          FontRatio.Auto = False
        end
        object Label59: TMLabel
          Left = 56
          Top = 61
          Width = 100
          Height = 19
          AutoSize = False
          Caption = #29694#20181#31246#25903#25173#21306#20998
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
        object f1GRUZSEIKBNNM_Si: TMLabel
          Left = 232
          Top = 61
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
          FontRatio.Auto = False
        end
        object MLabel19: TMLabel
          Left = 33
          Top = 18
          Width = 109
          Height = 19
          AutoSize = False
          Caption = #20181#20837#12539#28040#36027#31246#35336#31639
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel18: TMLabel
          Left = 25
          Top = 15
          Width = 429
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel20: TMLabel
          Left = 500
          Top = 15
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel37: TMLabel
          Left = 25
          Top = 340
          Width = 429
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel38: TMLabel
          Left = 500
          Top = 340
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object lblLineKKSI: TMLabel
          Left = 25
          Top = 180
          Width = 429
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object lblTitleKKSI: TMLabel
          Left = 33
          Top = 183
          Width = 109
          Height = 19
          AutoSize = False
          Caption = #20998#39006
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object fKKSIBRNM1: TMLabel
          Left = 56
          Top = 206
          Width = 135
          Height = 19
          AutoSize = False
          Caption = #25313#24373#20181#20837#20808#20998#39006#65297
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = True
        end
        object fKKSIBRNM2: TMLabel
          Left = 56
          Top = 229
          Width = 135
          Height = 19
          AutoSize = False
          Caption = #25313#24373#20181#20837#20808#20998#39006#65298
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = True
        end
        object f1KKSIBRNM1: TMLabel
          Left = 315
          Top = 206
          Width = 148
          Height = 19
          AutoSize = False
          Caption = 'X(20)--------------X'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object f1KKSIBRNM2: TMLabel
          Left = 315
          Top = 229
          Width = 148
          Height = 19
          AutoSize = False
          Caption = 'X(20)--------------X'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object f1TRIHIKIKBN_Si: TMNumEdit
          Left = 644
          Top = 40
          Width = 23
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
          TabOrder = 7
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1NMKBN_Si: TMNumEdit
          Left = 644
          Top = 62
          Width = 23
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
          TabOrder = 8
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1SSHCDKBN_Si: TMNumEdit
          Left = 644
          Top = 129
          Width = 23
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
          TabOrder = 10
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1SSHCDKET_Si: TMNumEdit
          Left = 644
          Top = 151
          Width = 23
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
          TabOrder = 11
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1URKINHSUKBN_Si: TMNumEdit
          Left = 191
          Top = 39
          Width = 23
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
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1GRUZSEIKBN_Si: TMNumEdit
          Left = 191
          Top = 61
          Width = 23
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
          TabOrder = 1
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1ZSEIKBN_Si: TMNumEdit
          Left = 191
          Top = 83
          Width = 23
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
          TabOrder = 2
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1ZHSUKBN_Si: TMNumEdit
          Left = 191
          Top = 127
          Width = 23
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
          TabOrder = 4
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1ZHSUTNIKBN_Si: TMNumEdit
          Left = 191
          Top = 105
          Width = 23
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
          TabOrder = 3
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object MPnlSi: TMPanel
          Left = 535
          Top = 81
          Width = 261
          Height = 46
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 9
          object MLabel45: TMLabel
            Left = 14
            Top = 340
            Width = 441
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel46: TMLabel
            Left = 0
            Top = 4
            Width = 110
            Height = 19
            AutoSize = False
            Caption = #21336#20385#12521#12531#12463
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
          object MLabel47: TMLabel
            Left = 0
            Top = 26
            Width = 110
            Height = 19
            AutoSize = False
            Caption = #21336#20385#25499#29575
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
          object MLabel48: TMLabel
            Left = 183
            Top = 26
            Width = 20
            Height = 19
            AutoSize = False
            Caption = #65285
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
          object f1TNKRNK_Si: TMNumEdit
            Left = 109
            Top = 4
            Width = 23
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
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
            Digits = 2
            Validate = False
            Value = 99.000000000000000000
          end
          object f1KAKERT_Si: TMNumEdit
            Tag = 8100
            Left = 109
            Top = 26
            Width = 53
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
            MaxValue = 2.000000000000000000
            Decimals = 2
            Digits = 5
            Validate = False
            Value = 999.990000000000000000
          end
        end
        object f1KKSIBRCD1: TMTxtEdit
          Tag = 801
          Left = 191
          Top = 206
          Width = 106
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = CODEArrowClick
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          Ctl3D = True
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ImeMode = imClose
          MaxLength = 3
          FontRatio.Auto = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
          Text = 'XXX'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
        object f1KKSIBRCD2: TMTxtEdit
          Tag = 802
          Left = 191
          Top = 229
          Width = 106
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = CODEArrowClick
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          Ctl3D = True
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ImeMode = imClose
          MaxLength = 3
          FontRatio.Auto = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
          Text = 'XXX'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
      end
      object tbsInput: TMPanel
        Left = 0
        Top = 0
        Width = 945
        Height = 416
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 0
        Visible = False
        object Label9: TMLabel
          Left = 535
          Top = 40
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #21462#24341#21306#20998
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
        object Label29: TMLabel
          Left = 535
          Top = 62
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #21517#31216#20837#21147#21306#20998
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
        object Label32: TMLabel
          Left = 535
          Top = 129
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #25351#23450#21830#21697#65402#65392#65412#65438#21306#20998
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
        object Label46: TMLabel
          Left = 535
          Top = 151
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #25351#23450#21830#21697#65402#65392#65412#65438#26689#25968
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
        object f1TRIHIKIKBNNM: TMLabel
          Left = 685
          Top = 40
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
          FontRatio.Auto = False
        end
        object f1NMKBNNM: TMLabel
          Left = 685
          Top = 62
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
          FontRatio.Auto = False
        end
        object f1SSHCDKBNNM: TMLabel
          Left = 685
          Top = 129
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
          FontRatio.Auto = False
        end
        object Label57: TMLabel
          Left = 670
          Top = 151
          Width = 20
          Height = 19
          AutoSize = False
          Caption = #26689
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
        object MLabel13: TMLabel
          Left = 508
          Top = 18
          Width = 89
          Height = 19
          AutoSize = False
          Caption = #22770#19978#20253#31080#20837#21147
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object Label15: TMLabel
          Left = 56
          Top = 39
          Width = 100
          Height = 19
          AutoSize = False
          Caption = #22770#19978#31471#25968#21306#20998
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
        object f1URKINHSUKBNNM: TMLabel
          Left = 232
          Top = 39
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
          FontRatio.Auto = False
        end
        object Label18: TMLabel
          Left = 56
          Top = 127
          Width = 100
          Height = 19
          AutoSize = False
          Caption = #28040#36027#31246#31471#25968#20966#29702
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
        object f1ZHSUKBNNM: TMLabel
          Left = 232
          Top = 127
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
          FontRatio.Auto = False
        end
        object Label23: TMLabel
          Left = 56
          Top = 105
          Width = 100
          Height = 19
          AutoSize = False
          Caption = #28040#36027#31246#31471#25968#21336#20301
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
        object f1ZHSUTNIKBNNM: TMLabel
          Left = 232
          Top = 105
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
          FontRatio.Auto = False
        end
        object Label27: TMLabel
          Left = 56
          Top = 83
          Width = 100
          Height = 19
          AutoSize = False
          Caption = #28040#36027#31246#35531#27714#21306#20998
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
        object f1ZSEIKBNNM: TMLabel
          Left = 232
          Top = 83
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
          FontRatio.Auto = False
        end
        object Label33: TMLabel
          Left = 56
          Top = 61
          Width = 100
          Height = 19
          AutoSize = False
          Caption = #29694#22770#31246#35531#27714#21306#20998
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
        object f1GRUZSEIKBNNM: TMLabel
          Left = 232
          Top = 61
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
          FontRatio.Auto = False
        end
        object MLabel25: TMLabel
          Left = 33
          Top = 18
          Width = 109
          Height = 19
          AutoSize = False
          Caption = #22770#19978#12539#28040#36027#31246#35336#31639
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel14: TMLabel
          Left = 25
          Top = 15
          Width = 429
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel15: TMLabel
          Left = 500
          Top = 15
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel35: TMLabel
          Left = 25
          Top = 340
          Width = 429
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel36: TMLabel
          Left = 500
          Top = 340
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object lblLineKKTK: TMLabel
          Left = 25
          Top = 180
          Width = 429
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object lblTitleKKTK: TMLabel
          Left = 33
          Top = 183
          Width = 109
          Height = 19
          AutoSize = False
          Caption = #20998#39006
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object fKKTKBRNM1: TMLabel
          Left = 56
          Top = 206
          Width = 135
          Height = 19
          AutoSize = False
          Caption = #25313#24373#24471#24847#20808#20998#39006#65297
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = True
        end
        object fKKTKBRNM2: TMLabel
          Left = 56
          Top = 229
          Width = 135
          Height = 19
          AutoSize = False
          Caption = #25313#24373#24471#24847#20808#20998#39006#65298
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = True
        end
        object f1KKTKBRNM1: TMLabel
          Left = 315
          Top = 206
          Width = 148
          Height = 19
          AutoSize = False
          Caption = 'X(20)--------------X'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object f1KKTKBRNM2: TMLabel
          Left = 315
          Top = 229
          Width = 148
          Height = 19
          AutoSize = False
          Caption = 'X(20)--------------X'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object f1TRIHIKIKBN: TMNumEdit
          Left = 644
          Top = 40
          Width = 23
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
          TabOrder = 7
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1NMKBN: TMNumEdit
          Left = 644
          Top = 62
          Width = 23
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
          TabOrder = 8
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1SSHCDKBN: TMNumEdit
          Left = 644
          Top = 129
          Width = 23
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
          TabOrder = 10
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1SSHCDKET: TMNumEdit
          Left = 644
          Top = 151
          Width = 23
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
          TabOrder = 11
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1URKINHSUKBN: TMNumEdit
          Left = 191
          Top = 39
          Width = 23
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
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1GRUZSEIKBN: TMNumEdit
          Left = 191
          Top = 61
          Width = 23
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
          TabOrder = 1
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1ZSEIKBN: TMNumEdit
          Left = 191
          Top = 83
          Width = 23
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
          TabOrder = 2
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1ZHSUKBN: TMNumEdit
          Left = 191
          Top = 127
          Width = 23
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
          TabOrder = 4
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1ZHSUTNIKBN: TMNumEdit
          Left = 191
          Top = 105
          Width = 23
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
          TabOrder = 3
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object MPnlUr: TMPanel
          Left = 535
          Top = 81
          Width = 261
          Height = 46
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 9
          object MLabel57: TMLabel
            Left = 14
            Top = 340
            Width = 441
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object Label2: TMLabel
            Left = 0
            Top = 4
            Width = 110
            Height = 19
            AutoSize = False
            Caption = #21336#20385#12521#12531#12463
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
          object Label31: TMLabel
            Left = 0
            Top = 26
            Width = 110
            Height = 19
            AutoSize = False
            Caption = #21336#20385#25499#29575
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
          object Label30: TMLabel
            Left = 183
            Top = 26
            Width = 20
            Height = 19
            AutoSize = False
            Caption = #65285
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
          object f1TNKRNK: TMNumEdit
            Left = 109
            Top = 4
            Width = 23
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdArrowClick
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
            Digits = 2
            Validate = False
            Value = 99.000000000000000000
          end
          object f1KAKERT: TMNumEdit
            Tag = 8100
            Left = 109
            Top = 26
            Width = 53
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
            MaxValue = 2.000000000000000000
            Decimals = 2
            Digits = 5
            Validate = False
            Value = 999.990000000000000000
          end
        end
        object f1KKTKBRCD1: TMTxtEdit
          Tag = 801
          Left = 191
          Top = 206
          Width = 106
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = CODEArrowClick
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          Ctl3D = True
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ImeMode = imClose
          MaxLength = 3
          FontRatio.Auto = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 5
          Text = 'XXX'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
        object f1KKTKBRCD2: TMTxtEdit
          Tag = 802
          Left = 191
          Top = 229
          Width = 106
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = CODEArrowClick
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          Ctl3D = True
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = []
          ImeMode = imClose
          MaxLength = 3
          FontRatio.Auto = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 6
          Text = 'XXX'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
      end
      object tbsKihon: TMPanel
        Left = 0
        Top = 0
        Width = 945
        Height = 416
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object Blind_TK: TMPanel
          Left = 2
          Top = 0
          Width = 476
          Height = 342
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 0
          object LblYUBIN: TMLabel
            Left = 29
            Top = 39
            Width = 72
            Height = 19
            AutoSize = False
            Caption = #37109#20415#30058#21495
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
          object LblJUSHO1: TMLabel
            Left = 29
            Top = 61
            Width = 72
            Height = 19
            AutoSize = False
            Caption = #20303#25152#19978#27573
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
          object LblJUSHO2: TMLabel
            Left = 29
            Top = 83
            Width = 72
            Height = 19
            AutoSize = False
            Caption = #20303#25152#19979#27573
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
          object LblTEL: TMLabel
            Left = 29
            Top = 106
            Width = 72
            Height = 19
            AutoSize = False
            Caption = #38651#35441#30058#21495'(1)'
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
          object LblFAX: TMLabel
            Left = 29
            Top = 150
            Width = 72
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
          object Label47: TMLabel
            Left = 29
            Top = 172
            Width = 72
            Height = 19
            AutoSize = False
            Caption = #36865#20184#37096#32626
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
            Left = 29
            Top = 194
            Width = 72
            Height = 19
            AutoSize = False
            Caption = #25285#24403#32773#21517
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
          object Label25: TMLabel
            Left = 29
            Top = 128
            Width = 72
            Height = 19
            AutoSize = False
            Caption = #38651#35441#30058#21495'(2)'
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
            Left = 136
            Top = 39
            Width = 9
            Height = 19
            AutoSize = False
            Caption = '-'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel10: TMLabel
            Left = 17
            Top = 18
            Width = 109
            Height = 19
            AutoSize = False
            Caption = #24471#24847#20808#22522#26412#24773#22577
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel9: TMLabel
            Left = 13
            Top = 15
            Width = 445
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel5: TMLabel
            Left = 29
            Top = 216
            Width = 72
            Height = 19
            AutoSize = False
            Caption = #65426#65392#65433#65393#65412#65438#65434#65405
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
          object MLabel33: TMLabel
            Left = 14
            Top = 340
            Width = 445
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object f1BMNAME: TMLabel
            Left = 217
            Top = 238
            Width = 148
            Height = 19
            AutoSize = False
            Caption = 'X(20)----X---------X'
            FontRatio.Auto = False
          end
          object f1TNNAME: TMLabel
            Left = 217
            Top = 260
            Width = 148
            Height = 19
            AutoSize = False
            Caption = 'X(20)----X---------X'
            FontRatio.Auto = False
          end
          object LblBMCODE: TMLabel
            Left = 29
            Top = 239
            Width = 60
            Height = 19
            AutoSize = False
            Caption = #37096#38272#65402#65392#65412#65438
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object LblTNCODE: TMLabel
            Left = 29
            Top = 261
            Width = 72
            Height = 19
            AutoSize = False
            Caption = #25285#24403#32773#65402#65392#65412#65438
            FontRatio.Auto = False
          end
          object f1ADS1: TMTxtEdit
            Left = 106
            Top = 61
            Width = 350
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnAdsArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = 13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imHira
            MaxLength = 60
            FontRatio.Auto = True
            ParentFont = False
            TabOrder = 2
            Text = 'X(60)------------------------------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1ADS2: TMTxtEdit
            Left = 106
            Top = 83
            Width = 350
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = 13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imHira
            MaxLength = 60
            FontRatio.Auto = True
            ParentFont = False
            TabOrder = 3
            Text = 'X(60)------------------------------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1TEL1: TMTxtEdit
            Left = 106
            Top = 106
            Width = 149
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
            TabOrder = 4
            Text = 'X(20)--------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1TEL2: TMTxtEdit
            Left = 106
            Top = 128
            Width = 149
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
            TabOrder = 5
            Text = 'X(20)--------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1FAX1: TMTxtEdit
            Left = 106
            Top = 150
            Width = 149
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
            Text = 'X(20)--------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1SectionName: TMTxtEdit
            Left = 106
            Top = 172
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
            ImeMode = imHira
            MaxLength = 40
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 7
            Text = 'X(40)----------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1TanNM: TMTxtEdit
            Left = 106
            Top = 194
            Width = 149
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
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 8
            Text = 'X(20)--------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1POSTNO1: TMNumEdit
            Left = 106
            Top = 39
            Width = 27
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            FocusedColor = clAqua
            ArrowType = atOmission
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
            OnChange = fnFldOnChg
            FormatStr = '###000'
            Negative = False
            MaxValue = 999.000000000000000000
            Digits = 3
            Validate = False
          end
          object f1POSTNO2: TMNumEdit
            Left = 147
            Top = 39
            Width = 36
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = fnPostArrowClick
            FocusedColor = clAqua
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
            OnChange = fnFldOnChg
            FormatStr = '####0000'
            Negative = False
            MaxValue = 9999.000000000000000000
            Digits = 4
            Validate = False
          end
          object f1KeisyoKbn: TMTxtEdit
            Left = 260
            Top = 194
            Width = 48
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
            MaxLength = 16
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 9
            Text = 'X(16)-----------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1MailAd: TMTxtEdit
            Left = 106
            Top = 216
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
            MaxLength = 100
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 10
            Text = 'X(100)----------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1BMCODE: TMTxtEdit
            Tag = 22
            Left = 106
            Top = 238
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = CODEArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 11
            Text = 'X(10)----X'
            OnChange = fnFldOnChg
            OnKeyPress = f1BMCODEKeyPress
            ValidChars = ''
          end
          object f1TNCODE: TMTxtEdit
            Tag = 22
            Left = 106
            Top = 260
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = CODEArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 12
            Text = 'X(10)----X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
        end
        object Blind_SI: TMPanel
          Left = 475
          Top = 0
          Width = 474
          Height = 342
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 1
          object MLabel16: TMLabel
            Left = 7
            Top = 18
            Width = 131
            Height = 19
            AutoSize = False
            Caption = #20181#20837#20808#22522#26412#24773#22577
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object Label17: TMLabel
            Left = 19
            Top = 39
            Width = 70
            Height = 19
            AutoSize = False
            Caption = #37109#20415#30058#21495
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
          object Label19: TMLabel
            Left = 19
            Top = 61
            Width = 70
            Height = 19
            AutoSize = False
            Caption = #20303#25152#19978#27573
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
          object Label20: TMLabel
            Left = 19
            Top = 83
            Width = 70
            Height = 19
            AutoSize = False
            Caption = #20303#25152#19979#27573
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
          object Label21: TMLabel
            Left = 19
            Top = 106
            Width = 70
            Height = 19
            AutoSize = False
            Caption = #38651#35441#30058#21495'(1)'
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
          object Label22: TMLabel
            Left = 19
            Top = 150
            Width = 70
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
          object Label24: TMLabel
            Left = 19
            Top = 172
            Width = 70
            Height = 19
            AutoSize = False
            Caption = #36865#20184#37096#32626
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
          object Label26: TMLabel
            Left = 19
            Top = 194
            Width = 70
            Height = 19
            AutoSize = False
            Caption = #25285#24403#32773#21517
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
          object Label28: TMLabel
            Left = 19
            Top = 128
            Width = 70
            Height = 19
            AutoSize = False
            Caption = #38651#35441#30058#21495'(2)'
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
          object Label34: TMLabel
            Left = 124
            Top = 39
            Width = 9
            Height = 19
            AutoSize = False
            Caption = '-'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel12: TMLabel
            Left = 3
            Top = 15
            Width = 445
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel6: TMLabel
            Left = 19
            Top = 216
            Width = 72
            Height = 19
            AutoSize = False
            Caption = #65426#65392#65433#65393#65412#65438#65434#65405
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
          object MLabel34: TMLabel
            Left = 3
            Top = 340
            Width = 445
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object LblBMCODE_Si: TMLabel
            Left = 19
            Top = 238
            Width = 60
            Height = 19
            AutoSize = False
            Caption = #37096#38272#65402#65392#65412#65438
            FontRatio.Auto = False
          end
          object LblTNCODE_Si: TMLabel
            Left = 19
            Top = 260
            Width = 72
            Height = 19
            AutoSize = False
            Caption = #25285#24403#32773#65402#65392#65412#65438
            FontRatio.Auto = False
          end
          object f1BMNAME_Si: TMLabel
            Left = 201
            Top = 238
            Width = 148
            Height = 19
            AutoSize = False
            Caption = 'X(20)----X---------X'
            FontRatio.Auto = False
          end
          object f1TNNAME_Si: TMLabel
            Left = 201
            Top = 260
            Width = 148
            Height = 19
            AutoSize = False
            Caption = 'X(20)----X---------X'
            FontRatio.Auto = False
          end
          object f1ADS1_Si: TMTxtEdit
            Left = 93
            Top = 61
            Width = 350
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = f1ADS1_SiArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = 13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imHira
            MaxLength = 60
            FontRatio.Auto = True
            ParentFont = False
            TabOrder = 2
            Text = 'X(60)------------------------------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1ADS2_Si: TMTxtEdit
            Left = 93
            Top = 83
            Width = 350
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = 13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imHira
            MaxLength = 60
            FontRatio.Auto = True
            ParentFont = False
            TabOrder = 3
            Text = 'X(60)------------------------------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1TEL1_Si: TMTxtEdit
            Left = 93
            Top = 106
            Width = 149
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
            TabOrder = 4
            Text = 'X(20)--------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1TEL2_Si: TMTxtEdit
            Left = 93
            Top = 128
            Width = 149
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
            TabOrder = 5
            Text = 'X(20)--------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1FAX1_Si: TMTxtEdit
            Left = 93
            Top = 150
            Width = 149
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
            Text = 'X(20)--------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1SectionName_Si: TMTxtEdit
            Left = 93
            Top = 172
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
            ImeMode = imHira
            MaxLength = 40
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 7
            Text = 'X(40)----------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1TanNM_Si: TMTxtEdit
            Left = 93
            Top = 194
            Width = 149
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
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 8
            Text = 'X(20)--------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1POSTNO1_Si: TMNumEdit
            Left = 93
            Top = 39
            Width = 27
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            FocusedColor = clAqua
            ArrowType = atOmission
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
            OnChange = fnFldOnChg
            FormatStr = '###000'
            Negative = False
            MaxValue = 999.000000000000000000
            Digits = 3
            Validate = False
          end
          object f1POSTNO2_Si: TMNumEdit
            Left = 137
            Top = 39
            Width = 36
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = f1POSTNO2_SiArrowClick
            FocusedColor = clAqua
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
            OnChange = fnFldOnChg
            FormatStr = '####0000'
            Negative = False
            MaxValue = 9999.000000000000000000
            Digits = 4
            Validate = False
          end
          object f1KeisyoKbn_Si: TMTxtEdit
            Left = 248
            Top = 194
            Width = 48
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
            MaxLength = 16
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 9
            Text = 'X(16)-----------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1MailAd_Si: TMTxtEdit
            Left = 93
            Top = 216
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
            MaxLength = 100
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 10
            Text = 'X(100)----------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1BMCODE_Si: TMTxtEdit
            Tag = 22
            Left = 93
            Top = 238
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = CODEArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 11
            Text = 'X(10)----X'
            OnChange = fnFldOnChg
            OnKeyPress = f1BMCODE_SiKeyPress
            ValidChars = ''
          end
          object f1TNCODE_Si: TMTxtEdit
            Tag = 22
            Left = 93
            Top = 260
            Width = 84
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = CODEArrowClick
            ArrowType = atOmission
            F4Arrow = True
            TagStr = ''
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imClose
            MaxLength = 10
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 12
            Text = 'X(10)----X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
        end
      end
      object tbsPrint: TMPanel
        Left = 0
        Top = 0
        Width = 945
        Height = 416
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 2
        Visible = False
        object Label1: TMLabel
          Left = 91
          Top = 44
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #21644#26278#65295#35199#26278#21306#20998
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
        object f1YYKBNNM: TMLabel
          Left = 243
          Top = 44
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
          FontRatio.Auto = False
        end
        object Label38: TMLabel
          Left = 91
          Top = 66
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #20195#34920#32773#21517#12398#21360#23383
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
        object f1DAINMKBNNM: TMLabel
          Left = 243
          Top = 66
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
          FontRatio.Auto = False
        end
        object Label3: TMLabel
          Left = 91
          Top = 144
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #32013#21697#26360#65420#65387#65392#65425
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
        object f1USDENPFMNM: TMLabel
          Left = 243
          Top = 144
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
          FontRatio.Auto = False
        end
        object lbl_JHDENPFM: TMLabel
          Left = 91
          Top = 232
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #21463#27880#20253#31080#65420#65387#65392#65425
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
        object f1JHDENPFMNM: TMLabel
          Left = 243
          Top = 232
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
          FontRatio.Auto = False
        end
        object f1MITPFMNM: TMLabel
          Left = 243
          Top = 210
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
          FontRatio.Auto = False
        end
        object lbl_SNDENPFM: TMLabel
          Left = 91
          Top = 254
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #20986#33655#20253#31080#65420#65387#65392#65425
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
        object f1SNDENPFMNM: TMLabel
          Left = 243
          Top = 254
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
          FontRatio.Auto = False
        end
        object lbl_JYGKEI: TMLabel
          Left = 91
          Top = 188
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #19978#20195#21512#35336#27396#31246#21360#23383
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
        object f1JYGKEINM: TMLabel
          Left = 243
          Top = 188
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
          FontRatio.Auto = False
        end
        object lbl_USGKEI: TMLabel
          Left = 91
          Top = 166
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #22770#19978#21512#35336#27396#31246#21360#23383
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
        object f1USGKEINM: TMLabel
          Left = 243
          Top = 166
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
          FontRatio.Auto = False
        end
        object lbl_MITPFM: TMLabel
          Left = 91
          Top = 210
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #35211#31309#26360#65420#65387#65392#65425
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
        object lab_SOFOPFM: TMLabel
          Left = 528
          Top = 44
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #36865#12426#29366#65420#65387#65392#65425
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
        object f1SOFOPFMNM: TMLabel
          Left = 682
          Top = 44
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
          FontRatio.Auto = False
        end
        object MLabel1: TMLabel
          Left = 58
          Top = 18
          Width = 65
          Height = 19
          AutoSize = False
          Caption = #23451#21517#27396
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel3: TMLabel
          Left = 58
          Top = 118
          Width = 65
          Height = 19
          AutoSize = False
          Caption = #20253#31080
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel11: TMLabel
          Left = 498
          Top = 18
          Width = 65
          Height = 19
          AutoSize = False
          Caption = #36865#12426#29366
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel28: TMLabel
          Left = 50
          Top = 114
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel2: TMLabel
          Left = 50
          Top = 15
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel4: TMLabel
          Left = 490
          Top = 15
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel43: TMLabel
          Left = 50
          Top = 340
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel44: TMLabel
          Left = 490
          Top = 340
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel29: TMLabel
          Left = 490
          Top = 114
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object lbl_KUSDENPFM_Tk: TMLabel
          Left = 528
          Top = 144
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #24037#20107#22770#19978#20253#31080#65420#65387#65392#65425
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
        object lbl_KOJDEN_Tk: TMLabel
          Left = 498
          Top = 118
          Width = 65
          Height = 19
          AutoSize = False
          Caption = #24037#20107#20253#31080
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object lbl_KMITPFM_Tk: TMLabel
          Left = 528
          Top = 166
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #24037#20107#35211#31309#26360#65420#65387#65392#65425
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
        object lbl_KJHDENPFM_Tk: TMLabel
          Left = 528
          Top = 188
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #24037#20107#21463#27880#20253#31080#65420#65387#65392#65425
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
        object lbl_KUSGKEI_Tk: TMLabel
          Left = 528
          Top = 210
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #24037#20107#21512#35336#27396#31246#21360#23383
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
        object f1KUSDENPFMNM_Tk: TMLabel
          Left = 682
          Top = 144
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
          FontRatio.Auto = False
        end
        object f1KMITPFMNM_Tk: TMLabel
          Left = 682
          Top = 166
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
          FontRatio.Auto = False
        end
        object f1KJHDENPFMNM_Tk: TMLabel
          Left = 682
          Top = 188
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
          FontRatio.Auto = False
        end
        object f1KUSGKEINM_Tk: TMLabel
          Left = 682
          Top = 210
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
          FontRatio.Auto = False
        end
        object f1YYKBN: TMNumEdit
          Left = 202
          Top = 44
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
          TabOrder = 0
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1DAINMKBN: TMNumEdit
          Left = 202
          Top = 66
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
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1USDENPFM: TMNumEdit
          Left = 202
          Top = 144
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
        object f1MITPFM: TMNumEdit
          Left = 202
          Top = 210
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
          TabOrder = 5
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1JHDENPFM: TMNumEdit
          Left = 202
          Top = 232
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
          TabOrder = 6
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1SNDENPFM: TMNumEdit
          Left = 202
          Top = 254
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
          TabOrder = 7
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1USGKEI: TMNumEdit
          Left = 202
          Top = 166
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
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1JYGKEI: TMNumEdit
          Left = 202
          Top = 188
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
          TabOrder = 4
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1SOFOPFM: TMNumEdit
          Left = 641
          Top = 44
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
          TabOrder = 8
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1KUSDENPFM_Tk: TMNumEdit
          Left = 641
          Top = 144
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
          TabOrder = 9
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1KMITPFM_Tk: TMNumEdit
          Left = 641
          Top = 166
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
          TabOrder = 10
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1KJHDENPFM_Tk: TMNumEdit
          Left = 641
          Top = 188
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
          TabOrder = 11
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1KUSGKEI_Tk: TMNumEdit
          Left = 641
          Top = 210
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
          TabOrder = 12
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
      end
      object tbsPrintS: TMPanel
        Left = 0
        Top = 0
        Width = 945
        Height = 416
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 5
        Visible = False
        object Label41: TMLabel
          Left = 91
          Top = 44
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #21644#26278#65295#35199#26278#21306#20998
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
        object f1YYKBNNM_Si: TMLabel
          Left = 243
          Top = 44
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
          FontRatio.Auto = False
        end
        object Label43: TMLabel
          Left = 91
          Top = 66
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #20195#34920#32773#21517#12398#21360#23383
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
        object f1DAINMKBNNM_Si: TMLabel
          Left = 243
          Top = 66
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
          FontRatio.Auto = False
        end
        object Label53: TMLabel
          Left = 91
          Top = 144
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #20181#20837#20253#31080#65420#65387#65392#65425
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
        object f1USDENPFMNM_Si: TMLabel
          Left = 243
          Top = 144
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
          FontRatio.Auto = False
        end
        object Label58: TMLabel
          Left = 91
          Top = 188
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #30330#27880#20253#31080#65420#65387#65392#65425
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
        object f1JHDENPFMNM_Si: TMLabel
          Left = 243
          Top = 188
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
          FontRatio.Auto = False
        end
        object Label62: TMLabel
          Left = 91
          Top = 210
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #20837#33655#20253#31080#65420#65387#65392#65425
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
        object f1SNDENPFMNM_Si: TMLabel
          Left = 243
          Top = 210
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
          FontRatio.Auto = False
        end
        object Label66: TMLabel
          Left = 91
          Top = 166
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #20181#20837#21512#35336#27396#31246#21360#23383
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
        object f1USGKEINM_Si: TMLabel
          Left = 243
          Top = 166
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
          FontRatio.Auto = False
        end
        object MLabel23: TMLabel
          Left = 58
          Top = 18
          Width = 65
          Height = 19
          AutoSize = False
          Caption = #23451#21517#27396
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel27: TMLabel
          Left = 58
          Top = 118
          Width = 65
          Height = 19
          AutoSize = False
          Caption = #20253#31080
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel30: TMLabel
          Left = 50
          Top = 15
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel24: TMLabel
          Left = 50
          Top = 114
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel42: TMLabel
          Left = 50
          Top = 340
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel7: TMLabel
          Left = 490
          Top = 15
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel8: TMLabel
          Left = 490
          Top = 340
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object lbl_KOJDEN_Si: TMLabel
          Left = 498
          Top = 18
          Width = 65
          Height = 19
          AutoSize = False
          Caption = #24037#20107#20253#31080
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Pitch = fpFixed
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object lbl_KUSDENPFM_Si: TMLabel
          Left = 528
          Top = 44
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #24037#20107#21407#20385#20253#31080#65420#65387#65392#65425
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
        object lbl_KJHDENPFM_Si: TMLabel
          Left = 528
          Top = 66
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #24037#20107#30330#27880#20253#31080#65420#65387#65392#65425
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
        object lbl_KUSGKEI_Si: TMLabel
          Left = 528
          Top = 88
          Width = 111
          Height = 19
          AutoSize = False
          Caption = #24037#20107#21512#35336#27396#31246#21360#23383
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
        object f1KUSDENPFMNM_Si: TMLabel
          Left = 682
          Top = 44
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
          FontRatio.Auto = False
        end
        object f1KJHDENPFMNM_Si: TMLabel
          Left = 682
          Top = 66
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
          FontRatio.Auto = False
        end
        object f1KUSGKEINM_Si: TMLabel
          Left = 682
          Top = 88
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
          FontRatio.Auto = False
        end
        object f1YYKBN_Si: TMNumEdit
          Left = 202
          Top = 44
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
          TabOrder = 0
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1DAINMKBN_Si: TMNumEdit
          Left = 202
          Top = 66
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
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1USDENPFM_Si: TMNumEdit
          Left = 202
          Top = 144
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
        object f1JHDENPFM_Si: TMNumEdit
          Left = 202
          Top = 188
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
          TabOrder = 4
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1SNDENPFM_Si: TMNumEdit
          Left = 202
          Top = 210
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
          TabOrder = 5
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1USGKEI_Si: TMNumEdit
          Left = 202
          Top = 166
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
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
        object f1KUSDENPFM_Si: TMNumEdit
          Left = 641
          Top = 44
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
          TabOrder = 6
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1KJHDENPFM_Si: TMNumEdit
          Left = 641
          Top = 66
          Width = 23
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdArrowClick
          OnArrowClick = CODEArrowClick
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
          TabOrder = 7
          OnChange = fnFldOnChg
          Digits = 2
          Validate = False
          Value = 99.000000000000000000
        end
        object f1KUSGKEI_Si: TMNumEdit
          Left = 641
          Top = 88
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
          TabOrder = 8
          OnChange = fnFldOnChg
          Digits = 1
          Validate = False
          Value = 9.000000000000000000
        end
      end
      object tbsOther: TMPanel
        Left = 0
        Top = 0
        Width = 945
        Height = 416
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 3
        Visible = False
        object MLabel39: TMLabel
          Left = 25
          Top = 340
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel41: TMLabel
          Left = 490
          Top = 340
          Width = 354
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object Blind_Othr_TK: TMPanel
          Left = 24
          Top = 3
          Width = 444
          Height = 331
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 0
          object lblPASS_H: TMLabel
            Left = 3
            Top = 165
            Width = 131
            Height = 19
            AutoSize = False
            Caption = #24471#24847#20808#12497#12473#12527#12540#12489#35373#23450
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object lblPASSKBN: TMLabel
            Left = 16
            Top = 188
            Width = 83
            Height = 19
            AutoSize = False
            Caption = #12497#12473#12527#12540#12489#35373#23450
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
          object lblPASSITEMKBN: TMLabel
            Left = 16
            Top = 214
            Width = 116
            Height = 19
            AutoSize = False
            Caption = #12497#12473#12527#12540#12489#21512#25104#38917#30446
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
          object lblPLUS: TMLabel
            Left = 213
            Top = 238
            Width = 17
            Height = 19
            AutoSize = False
            Caption = #65291
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
          object lblPASSWORD: TMLabel
            Left = 16
            Top = 265
            Width = 116
            Height = 19
            AutoSize = False
            Caption = #30452#25509#20837#21147
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
          object btnMask: TMSpeedButton
            Left = 167
            Top = 290
            Width = 23
            Height = 22
            Glyph.Data = {
              CE070000424DCE07000000000000360000002800000024000000120000000100
              18000000000098070000C21E0000C21E00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000006666666666666666666666666666666666666666666666
              66666666666666666666666666666666666666666666666666000000000000C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666EDEDEDEDEDEDEDED
              EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
              EDED666666000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C00000000000
              00666666EDEDEDEDEDEDEDEDEDEDEDEDEDEDED874E28874E28874E28874E28ED
              EDEDEDEDEDEDEDEDEDEDEDEDEDED666666000000000000C0C0C0FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFB6B6B6B6B6B6B6B6B6B6B6B6FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFC0C0C0000000000000666666EDEDEDEDEDEDEDEDEDEDEDED824B2682
              4B26824B26824B26824B26824B26EDEDEDEDEDEDEDEDEDEDEDED666666000000
              000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFB4B4B4B4B4B4B4B4B4B4B4B4B4B4
              B4B4B4B4FFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000000000666666EDEDEDED
              EDEDEDEDED7D47247D47247D47247D47247D47247D47247D47247D4724EDEDED
              EDEDEDEDEDED666666000000000000C0C0C0FFFFFFFFFFFFFFFFFFB2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2FFFFFFFFFFFFFFFFFFC0C0C000
              0000000000666666EDEDEDEDEDEDEDEDED764422764422764422764422764422
              764422764422764422EDEDEDEDEDEDEDEDED666666000000000000C0C0C0FFFF
              FFFFFFFFFFFFFFB0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0FF
              FFFFFFFFFFFFFFFFC0C0C0000000000000666666EDEDEDEDEDEDEDEDED704021
              704021F0DCB0F0DCB0704021704021704021704021EDEDEDEDEDEDEDEDED6666
              66000000000000C0C0C0FFFFFFFFFFFFFFFFFFAEAEAEAEAEAEEDEDEDEDEDEDAE
              AEAEAEAEAEAEAEAEAEAEAEFFFFFFFFFFFFFFFFFFC0C0C0000000000000666666
              EDEDED6A3D20EDEDED6A3D1F6A3D1FF0DCB0F0DCB06A3D1F6A3D1F6A3D1F6A3D
              1FEDEDED6A3D20EDEDED666666000000000000C0C0C0FFFFFFB0B0B0FFFFFFAC
              ACACACACACEDEDEDEDEDEDACACACACACACACACACACACACFFFFFFB0B0B0FFFFFF
              C0C0C0000000000000666666EDEDED5E361BEDEDEDEDEDED643A1D643A1D643A
              1D643A1D643A1D643A1DEDEDEDEDEDED5E361BEDEDED666666000000000000C0
              C0C0FFFFFFAEAEAEFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
              FFFFFFFFFFFFAEAEAEFFFFFFC0C0C0000000000000666666EDEDED5732195732
              19EDEDEDEDEDED5D361C5D361C5D361C5D361CEDEDEDEDEDED573219573219ED
              EDED666666000000000000C0C0C0FFFFFFACACACACACACFFFFFFFFFFFFA8A8A8
              A8A8A8A8A8A8A8A8A8FFFFFFFFFFFFACACACACACACFFFFFFC0C0C00000000000
              00666666EDEDEDEDEDED522F18522F18EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
              EDED522F18522F18EDEDEDEDEDED666666000000000000C0C0C0FFFFFFFFFFFF
              AAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAFFFF
              FFFFFFFFC0C0C0000000000000666666EDEDEDEDEDEDEDEDED4E2D174E2D174E
              2D174E2D174E2D174E2D174E2D174E2D17EDEDEDEDEDEDEDEDED666666000000
              000000C0C0C0FFFFFFFFFFFFFFFFFFA9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
              A9A9A9A9A9A9A9FFFFFFFFFFFFFFFFFFC0C0C0000000000000666666EDEDEDED
              EDEDEDEDEDEDEDED4E2D174E2D174E2D174E2D174E2D174E2D17EDEDEDEDEDED
              EDEDEDEDEDED666666000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFA8A8
              A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8FFFFFFFFFFFFFFFFFFFFFFFFC0C0C000
              0000000000666666EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
              EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED666666000000000000C0C0C0FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFC0C0C0000000000000666666EDEDEDEDEDEDEDEDEDEDEDED
              EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED6666
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
            OnClick = btnMaskClick
          end
          object lblAPIKBN: TMLabel
            Left = 16
            Top = 128
            Width = 83
            Height = 19
            AutoSize = False
            Caption = #22806#37096#36899#25658#21306#20998
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
          object f1APIKBNNM: TMLabel
            Left = 140
            Top = 128
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
            FontRatio.Auto = False
          end
          object MLabel26: TMLabel
            Left = 3
            Top = 13
            Width = 131
            Height = 19
            AutoSize = False
            Caption = #24471#24847#20808#12467#12513#12531#12488
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object Label77: TMLabel
            Left = 17
            Top = 42
            Width = 68
            Height = 19
            AutoSize = False
            Caption = #12467#12513#12531#12488#65297
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
          object Label81: TMLabel
            Left = 17
            Top = 64
            Width = 68
            Height = 19
            AutoSize = False
            Caption = #12467#12513#12531#12488#65298
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
          object MLabel40: TMLabel
            Left = 3
            Top = 6
            Width = 354
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object f1PASSKBNNM: TMLabel
            Left = 138
            Top = 188
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
            FontRatio.Auto = False
          end
          object lblAPIKBN_H: TMLabel
            Left = 3
            Top = 99
            Width = 131
            Height = 19
            AutoSize = False
            Caption = #24471#24847#20808#36899#25658
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object f1PASSITEMKBN1NM: TMLabel
            Left = 51
            Top = 238
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
            FontRatio.Auto = False
          end
          object f1PASSITEMKBN2NM: TMLabel
            Left = 270
            Top = 238
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
            FontRatio.Auto = False
          end
          object lblBAR1: TMLabel
            Left = 3
            Top = 96
            Width = 354
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object lblBAR2: TMLabel
            Left = 3
            Top = 158
            Width = 354
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object f1PASSITEMKBN2: TMNumEdit
            Left = 235
            Top = 238
            Width = 23
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = CODEArrowClick
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
            TabOrder = 5
            OnChange = fnFldOnChg
            Digits = 2
            Validate = False
            Value = 99.000000000000000000
          end
          object f1PASSWORD: TMTxtEdit
            Left = 16
            Top = 290
            Width = 145
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            Ctl3D = True
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imDisable
            MaxLength = 20
            FontRatio.Auto = False
            ParentCtl3D = False
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 6
            Text = 'X(21)---------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1APIKBN: TMNumEdit
            Left = 105
            Top = 128
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
            Digits = 1
            Validate = False
            Value = 9.000000000000000000
          end
          object f1MEMO1: TMTxtEdit
            Left = 94
            Top = 42
            Width = 292
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            Ctl3D = True
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imHira
            MaxLength = 40
            FontRatio.Auto = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            Text = 'X(40)----------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1MEMO2: TMTxtEdit
            Left = 94
            Top = 64
            Width = 292
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            Ctl3D = True
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imHira
            MaxLength = 40
            FontRatio.Auto = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            Text = 'X(40)----------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1PASSKBN: TMNumEdit
            Left = 105
            Top = 188
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
            Digits = 1
            Validate = False
            Value = 9.000000000000000000
          end
          object f1PASSITEMKBN1: TMNumEdit
            Left = 16
            Top = 238
            Width = 23
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = CODEArrowClick
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
            TabOrder = 4
            OnChange = fnFldOnChg
            Digits = 2
            Validate = False
            Value = 99.000000000000000000
          end
        end
        object Blind_Othr_Si: TMPanel
          Left = 488
          Top = 3
          Width = 444
          Height = 331
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 1
          object MLabel21: TMLabel
            Left = 5
            Top = 13
            Width = 131
            Height = 19
            AutoSize = False
            Caption = #20181#20837#20808#12467#12513#12531#12488
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel22: TMLabel
            Left = 19
            Top = 42
            Width = 68
            Height = 19
            AutoSize = False
            Caption = #12467#12513#12531#12488#65297
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
          object MLabel31: TMLabel
            Left = 19
            Top = 64
            Width = 68
            Height = 19
            AutoSize = False
            Caption = #12467#12513#12531#12488#65298
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
          object MLabel32: TMLabel
            Left = 3
            Top = 6
            Width = 354
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object lblAPIKBN_Si: TMLabel
            Left = 20
            Top = 129
            Width = 83
            Height = 19
            AutoSize = False
            Caption = #22806#37096#36899#25658#21306#20998
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
          object f1APIKBNNM_Si: TMLabel
            Left = 157
            Top = 129
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
            FontRatio.Auto = False
          end
          object lblPASS_H_Si: TMLabel
            Left = 3
            Top = 166
            Width = 131
            Height = 19
            AutoSize = False
            Caption = #20181#20837#20808#12497#12473#12527#12540#12489#35373#23450
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object lblPASSKBN_Si: TMLabel
            Left = 20
            Top = 188
            Width = 83
            Height = 19
            AutoSize = False
            Caption = #12497#12473#12527#12540#12489#35373#23450
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
          object lblPASSITEMKBN_Si: TMLabel
            Left = 20
            Top = 214
            Width = 116
            Height = 19
            AutoSize = False
            Caption = #12497#12473#12527#12540#12489#21512#25104#38917#30446
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
          object lblPLUS_Si: TMLabel
            Left = 208
            Top = 238
            Width = 17
            Height = 19
            AutoSize = False
            Caption = #65291
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
          object lblPASSWORD_Si: TMLabel
            Left = 20
            Top = 265
            Width = 116
            Height = 19
            AutoSize = False
            Caption = #30452#25509#20837#21147
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
          object btnMask_Si: TMSpeedButton
            Left = 171
            Top = 290
            Width = 23
            Height = 22
            Glyph.Data = {
              CE070000424DCE07000000000000360000002800000024000000120000000100
              18000000000098070000C21E0000C21E00000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000006666666666666666666666666666666666666666666666
              66666666666666666666666666666666666666666666666666000000000000C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000666666EDEDEDEDEDEDEDED
              EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
              EDED666666000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C00000000000
              00666666EDEDEDEDEDEDEDEDEDEDEDEDEDEDED874E28874E28874E28874E28ED
              EDEDEDEDEDEDEDEDEDEDEDEDEDED666666000000000000C0C0C0FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFB6B6B6B6B6B6B6B6B6B6B6B6FFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFC0C0C0000000000000666666EDEDEDEDEDEDEDEDEDEDEDED824B2682
              4B26824B26824B26824B26824B26EDEDEDEDEDEDEDEDEDEDEDED666666000000
              000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFB4B4B4B4B4B4B4B4B4B4B4B4B4B4
              B4B4B4B4FFFFFFFFFFFFFFFFFFFFFFFFC0C0C0000000000000666666EDEDEDED
              EDEDEDEDED7D47247D47247D47247D47247D47247D47247D47247D4724EDEDED
              EDEDEDEDEDED666666000000000000C0C0C0FFFFFFFFFFFFFFFFFFB2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2FFFFFFFFFFFFFFFFFFC0C0C000
              0000000000666666EDEDEDEDEDEDEDEDED764422764422764422764422764422
              764422764422764422EDEDEDEDEDEDEDEDED666666000000000000C0C0C0FFFF
              FFFFFFFFFFFFFFB0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0FF
              FFFFFFFFFFFFFFFFC0C0C0000000000000666666EDEDEDEDEDEDEDEDED704021
              704021F0DCB0F0DCB0704021704021704021704021EDEDEDEDEDEDEDEDED6666
              66000000000000C0C0C0FFFFFFFFFFFFFFFFFFAEAEAEAEAEAEEDEDEDEDEDEDAE
              AEAEAEAEAEAEAEAEAEAEAEFFFFFFFFFFFFFFFFFFC0C0C0000000000000666666
              EDEDED6A3D20EDEDED6A3D1F6A3D1FF0DCB0F0DCB06A3D1F6A3D1F6A3D1F6A3D
              1FEDEDED6A3D20EDEDED666666000000000000C0C0C0FFFFFFB0B0B0FFFFFFAC
              ACACACACACEDEDEDEDEDEDACACACACACACACACACACACACFFFFFFB0B0B0FFFFFF
              C0C0C0000000000000666666EDEDED5E361BEDEDEDEDEDED643A1D643A1D643A
              1D643A1D643A1D643A1DEDEDEDEDEDED5E361BEDEDED666666000000000000C0
              C0C0FFFFFFAEAEAEFFFFFFFFFFFFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
              FFFFFFFFFFFFAEAEAEFFFFFFC0C0C0000000000000666666EDEDED5732195732
              19EDEDEDEDEDED5D361C5D361C5D361C5D361CEDEDEDEDEDED573219573219ED
              EDED666666000000000000C0C0C0FFFFFFACACACACACACFFFFFFFFFFFFA8A8A8
              A8A8A8A8A8A8A8A8A8FFFFFFFFFFFFACACACACACACFFFFFFC0C0C00000000000
              00666666EDEDEDEDEDED522F18522F18EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
              EDED522F18522F18EDEDEDEDEDED666666000000000000C0C0C0FFFFFFFFFFFF
              AAAAAAAAAAAAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAAAAAAAAAAAFFFF
              FFFFFFFFC0C0C0000000000000666666EDEDEDEDEDEDEDEDED4E2D174E2D174E
              2D174E2D174E2D174E2D174E2D174E2D17EDEDEDEDEDEDEDEDED666666000000
              000000C0C0C0FFFFFFFFFFFFFFFFFFA9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
              A9A9A9A9A9A9A9FFFFFFFFFFFFFFFFFFC0C0C0000000000000666666EDEDEDED
              EDEDEDEDEDEDEDED4E2D174E2D174E2D174E2D174E2D174E2D17EDEDEDEDEDED
              EDEDEDEDEDED666666000000000000C0C0C0FFFFFFFFFFFFFFFFFFFFFFFFA8A8
              A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8FFFFFFFFFFFFFFFFFFFFFFFFC0C0C000
              0000000000666666EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
              EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED666666000000000000C0C0C0FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFC0C0C0000000000000666666EDEDEDEDEDEDEDEDEDEDEDED
              EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED6666
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
            OnClick = btnMaskClick
          end
          object f1PASSKBNNM_Si: TMLabel
            Left = 157
            Top = 188
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
            FontRatio.Auto = False
          end
          object lblAPIKBN_H_Si: TMLabel
            Left = 5
            Top = 100
            Width = 131
            Height = 19
            AutoSize = False
            Caption = #20181#20837#20808#36899#25658
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = [fsBold]
            ParentFont = False
            FontRatio.Auto = False
          end
          object f1PASSITEMKBN1NM_Si: TMLabel
            Left = 55
            Top = 238
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
            FontRatio.Auto = False
          end
          object f1PASSITEMKBN2NM_Si: TMLabel
            Left = 266
            Top = 238
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
            FontRatio.Auto = False
          end
          object lblBAR1_Si: TMLabel
            Left = 3
            Top = 97
            Width = 354
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object lblBAR2_Si: TMLabel
            Left = 3
            Top = 159
            Width = 354
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object f1MEMO1_Si: TMTxtEdit
            Left = 96
            Top = 42
            Width = 292
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            Ctl3D = True
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imHira
            MaxLength = 40
            FontRatio.Auto = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            Text = 'X(40)----------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1MEMO2_Si: TMTxtEdit
            Left = 96
            Top = 64
            Width = 292
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            Ctl3D = True
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imHira
            MaxLength = 40
            FontRatio.Auto = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            Text = 'X(40)----------------------------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1APIKBN_Si: TMNumEdit
            Left = 116
            Top = 129
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
            Digits = 1
            Validate = False
            Value = 9.000000000000000000
          end
          object f1PASSITEMKBN1_Si: TMNumEdit
            Left = 20
            Top = 238
            Width = 23
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = CODEArrowClick
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
            TabOrder = 4
            OnChange = fnFldOnChg
            Digits = 2
            Validate = False
            Value = 99.000000000000000000
          end
          object f1PASSITEMKBN2_Si: TMNumEdit
            Left = 231
            Top = 238
            Width = 23
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            OnArrowClick = CODEArrowClick
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
            TabOrder = 5
            OnChange = fnFldOnChg
            Digits = 2
            Validate = False
            Value = 99.000000000000000000
          end
          object f1PASSWORD_Si: TMTxtEdit
            Left = 20
            Top = 290
            Width = 145
            Height = 19
            ArrowDisp = adNone
            SelectDisp = sdNone
            ArrowType = atArrow
            TagStr = ''
            AutoSize = False
            Ctl3D = True
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Pitch = fpFixed
            Font.Style = []
            ImeMode = imDisable
            MaxLength = 20
            FontRatio.Auto = False
            ParentCtl3D = False
            ParentFont = False
            PasswordChar = '*'
            TabOrder = 6
            Text = 'X(21)---------------X'
            OnChange = fnFldOnChg
            ValidChars = ''
          end
          object f1PASSKBN_Si: TMNumEdit
            Left = 116
            Top = 188
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
            Digits = 1
            Validate = False
            Value = 9.000000000000000000
          end
        end
      end
      object MBitBtnBefor: TMBitBtn
        Tag = 10
        Left = 589
        Top = 358
        Width = 80
        Height = 25
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
        TabOrder = 8
        OnClick = BtnClick
      end
      object MBitBtnAfter: TMBitBtn
        Tag = 10
        Left = 673
        Top = 358
        Width = 80
        Height = 25
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
        TabOrder = 6
        OnClick = BtnClick
      end
      object BtnUpd: TMBitBtn
        Tag = 10
        Left = 757
        Top = 358
        Width = 80
        Height = 25
        Caption = #26356#26032'(&U)'
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
        ModalResult = 1
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 7
        OnClick = BtnClick
      end
      object BtnCan: TMBitBtn
        Tag = 9
        Left = 841
        Top = 358
        Width = 80
        Height = 25
        Caption = #21462#28040'(&C)'
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
        ModalResult = 2
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 9
        OnClick = BtnClick
      end
    end
  end
  object MPnlTop: TMPanel
    Left = 0
    Top = 0
    Width = 945
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 0
    object LblTRCODE: TMLabel
      Left = 16
      Top = 12
      Width = 129
      Height = 19
      AutoSize = False
      Caption = #24471#24847#20808#65402#65392#65412#65438
      FontRatio.Auto = True
    end
    object Image_Fusen_Glay: TImage
      Left = 80
      Top = 32
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
    object Image_Fusen_Orange: TImage
      Left = 64
      Top = 32
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
    object Image_Fusen_Green: TImage
      Left = 48
      Top = 32
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
    object Image_Fusen_Blue: TImage
      Left = 32
      Top = 32
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
      Left = 16
      Top = 32
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
    object f0CODE: TMTxtEdit
      Tag = 22
      Left = 152
      Top = 12
      Width = 106
      Height = 19
      ArrowDisp = adFocused
      SelectDisp = sdNone
      OnArrowClick = CODEArrowClick
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
      MaxLength = 16
      FontRatio.Auto = False
      ParentFont = False
      TabOrder = 0
      Text = 'X(16)----0-----X'
      OnEnter = f0CODEEnter
      OnExit = f0CODEExit
      ValidChars = ''
    end
    object f0NM: TMTxtEdit
      Left = 278
      Top = 12
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
      Left = 723
      Top = 12
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
  object MPanel3: TMPanel
    Left = 0
    Top = 510
    Width = 945
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object MSPFunctionBar: TMSPFunctionBar
      Left = 0
      Top = 0
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
      ButtonWidth = 117
      OnFunctionClick = MSPFunctionBarFunctionClick
      SysBaseColorB = 10841658
      SysBaseColorD = 6956042
    end
    object stbStatusBar: TMStatusBar
      Left = 0
      Top = 21
      Width = 945
      Height = 19
      Color = 15921906
      Panels = <>
      SimplePanel = True
    end
  end
  object Qry: TFDQuery
    Left = 706
    Top = 43
  end
  object QryINI: TFDQuery
    SQL.Strings = (
      'select * from MTOKUI_SEL')
    Left = 735
    Top = 43
  end
  object Query_Chk: TFDQuery
    Left = 772
    Top = 47
  end
  object QryMain: TMQuery
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
    Left = 798
    Top = 47
  end
  object Query_MstCopy: TMQuery
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
    Left = 828
    Top = 47
  end
  object aclExec: TActionList
    Left = 714
    Top = 91
    object AcTemplate: TAction
      Category = 'Function'
      Caption = #12486#12531#12503#12524#12540#12488
      OnExecute = AcTemplateExecute
    end
  end
  object StdProc6: TFDStoredProc
    StoredProcName = 'PRC_MA0130_106'
    Left = 780
    Top = 87
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
  object StdProc6_S: TFDStoredProc
    StoredProcName = 'PRC_MA0150_106'
    Left = 750
    Top = 87
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
  object MemPrint: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 17
    Top = 476
    object MemPrintGCode: TStringField
      FieldName = 'GCode'
      Size = 16
    end
    object MemPrintMasKbnNm: TStringField
      FieldName = 'MasKbnNm'
    end
    object MemPrintMasKbn: TIntegerField
      FieldName = 'MasKbn'
    end
    object MemPrintRenso: TStringField
      FieldName = 'Renso'
      Size = 12
    end
    object MemPrintNmk: TStringField
      DisplayWidth = 20
      FieldName = 'Nmk'
    end
    object MemPrintNm: TStringField
      DisplayWidth = 80
      FieldName = 'Nm'
      Size = 80
    end
    object MemPrintPostNo1: TStringField
      FieldName = 'PostNo1'
      Size = 3
    end
    object MemPrintPostNo2: TStringField
      FieldName = 'PostNo2'
    end
    object MemPrintAds1: TStringField
      FieldName = 'Ads1'
      Size = 60
    end
    object MemPrintAds2: TStringField
      FieldName = 'Ads2'
      Size = 60
    end
    object MemPrintSectNm: TStringField
      FieldName = 'SectNm'
      Size = 40
    end
    object MemPrintTanNm: TStringField
      FieldName = 'TanNm'
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
    object MemPrintTel1: TStringField
      FieldName = 'Tel1'
    end
    object MemPrintTel2: TStringField
      FieldName = 'Tel2'
    end
    object MemPrintFAX: TStringField
      FieldName = 'FAX'
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
    object MemPrintUrKinHsuKbn: TIntegerField
      FieldName = 'UrKinHsuKbn'
    end
    object MemPrintUrKinHsuKbnNm: TStringField
      FieldName = 'UrKinHsuKbnNm'
    end
    object MemPrintGRuZSeiKbn: TIntegerField
      FieldName = 'GRuZSeiKbn'
    end
    object MemPrintGRuZSeiKbnNm: TStringField
      FieldName = 'GRuZSeiKbnNm'
    end
    object MemPrintZSeiKbn: TIntegerField
      FieldName = 'ZSeiKbn'
    end
    object MemPrintZSeiKbnNm: TStringField
      FieldName = 'ZSeiKbnNm'
    end
    object MemPrintZHsuTniKbn: TIntegerField
      FieldName = 'ZHsuTniKbn'
    end
    object MemPrintZHsuTniKbnNm: TStringField
      FieldName = 'ZHsuTniKbnNm'
    end
    object MemPrintZHsuKbn: TIntegerField
      FieldName = 'ZHsuKbn'
    end
    object MemPrintZHsuKbnNm: TStringField
      FieldName = 'ZHsuKbnNm'
    end
    object MemPrintTrihikiKbn: TIntegerField
      FieldName = 'TrihikiKbn'
    end
    object MemPrintTrihikiKbnNm: TStringField
      FieldName = 'TrihikiKbnNm'
    end
    object MemPrintNmKbn: TIntegerField
      FieldName = 'NmKbn'
    end
    object MemPrintNmKbnNm: TStringField
      FieldName = 'NmKbnNm'
    end
    object MemPrintTnkRnk: TIntegerField
      FieldName = 'TnkRnk'
    end
    object MemPrintKakeRt: TFloatField
      FieldName = 'KakeRt'
    end
    object MemPrintSShCdKbn: TIntegerField
      FieldName = 'SShCdKbn'
    end
    object MemPrintSShCdKbnNm: TStringField
      FieldName = 'SShCdKbnNm'
    end
    object MemPrintSShCdKet: TIntegerField
      FieldName = 'SShCdKet'
    end
    object MemPrintYYKbn: TIntegerField
      FieldName = 'YYKbn'
    end
    object MemPrintYYKbnNm: TStringField
      FieldName = 'YYKbnNm'
    end
    object MemPrintDaiNmKbn: TIntegerField
      FieldName = 'DaiNmKbn'
    end
    object MemPrintDaiNmKbnNm: TStringField
      FieldName = 'DaiNmKbnNm'
    end
    object MemPrintUSDENPFM: TIntegerField
      FieldName = 'USDENPFM'
    end
    object MemPrintUSDENPFMNm: TStringField
      FieldName = 'USDENPFMNm'
    end
    object MemPrintUSGKEI: TIntegerField
      FieldName = 'USGKEI'
    end
    object MemPrintUSGKEINm: TStringField
      FieldName = 'USGKEINm'
    end
    object MemPrintJYGKEI: TIntegerField
      FieldName = 'JYGKEI'
    end
    object MemPrintJYGKEINm: TStringField
      FieldName = 'JYGKEINm'
    end
    object MemPrintMITPFM: TIntegerField
      FieldName = 'MITPFM'
    end
    object MemPrintMITPFMNm: TStringField
      FieldName = 'MITPFMNm'
    end
    object MemPrintJHDENPFM: TIntegerField
      FieldName = 'JHDENPFM'
    end
    object MemPrintJHDENPFMNm: TStringField
      FieldName = 'JHDENPFMNm'
    end
    object MemPrintSNDENPFM: TIntegerField
      FieldName = 'SNDENPFM'
    end
    object MemPrintSNDENPFMNm: TStringField
      FieldName = 'SNDENPFMNm'
    end
    object MemPrintSOFOPFM: TIntegerField
      FieldName = 'SOFOPFM'
    end
    object MemPrintSOFOPFMNm: TStringField
      FieldName = 'SOFOPFMNm'
    end
    object MemPrintMemo1: TStringField
      FieldName = 'Memo1'
      Size = 40
    end
    object MemPrintMemo2: TStringField
      FieldName = 'Memo2'
      Size = 40
    end
    object MemPrintSumKbn: TSmallintField
      FieldName = 'SumKbn'
    end
    object MemPrintSumKbnNm: TStringField
      FieldName = 'SumKbnNm'
    end
    object MemPrintFkana: TStringField
      FieldName = 'Fkana'
      Size = 40
    end
    object MemPrintKeisyoKbn: TStringField
      FieldName = 'KeisyoKbn'
      Size = 16
    end
    object MemPrintgrTag: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object H_MemPrintMailAddress: TStringField
      FieldName = 'H_MailAddress'
      Size = 100
    end
    object MemPrintH_KeisyoKbn: TStringField
      FieldName = 'H_KeisyoKbn'
      Size = 16
    end
    object MemPrintKKBNCD1: TStringField
      FieldName = 'KKBNCD1'
    end
    object MemPrintKKBNNM1: TStringField
      FieldName = 'KKBNNM1'
    end
    object MemPrintKKBNCD2: TStringField
      FieldName = 'KKBNCD2'
    end
    object MemPrintKKBNNM2: TStringField
      FieldName = 'KKBNNM2'
    end
    object MemPrintCountryKbn: TIntegerField
      DisplayWidth = 1
      FieldName = 'CountryKbn'
    end
    object MemPrintCountryNm: TStringField
      FieldName = 'CountryNm'
      Size = 10
    end
    object MemPrintCurrencyCd: TStringField
      Tag = 19002
      DisplayWidth = 16
      FieldName = 'CurrencyCd'
      Size = 16
    end
    object MemPrintCurrencyNm: TStringField
      FieldName = 'CurrencyNm'
      Size = 37
    end
    object MemPrintKUSDENPFM: TIntegerField
      FieldName = 'KUSDENPFM'
    end
    object MemPrintKUSDENPFMNm: TStringField
      FieldName = 'KUSDENPFMNm'
    end
    object MemPrintKMITPFM: TIntegerField
      FieldName = 'KMITPFM'
    end
    object MemPrintKMITPFMNm: TStringField
      FieldName = 'KMITPFMNm'
    end
    object MemPrintKJHDENPFM: TIntegerField
      FieldName = 'KJHDENPFM'
    end
    object MemPrintKJHDENPFMNm: TStringField
      FieldName = 'KJHDENPFMNm'
    end
    object MemPrintKUSGKEI: TIntegerField
      FieldName = 'KUSGKEI'
    end
    object MemPrintKUSGKEINm: TStringField
      FieldName = 'KUSGKEINm'
    end
    object MemPrintRHolidayKbnNM: TStringField
      FieldName = 'RHolidayKbnNM'
    end
    object MemPrintDHyoNm2: TStringField
      FieldName = 'DHyoNm2'
    end
    object MemPrintENDDD1: TStringField
      FieldName = 'ENDDD1'
    end
    object MemPrintENDDD2: TStringField
      FieldName = 'ENDDD2'
    end
    object MemPrintENDDD3: TStringField
      FieldName = 'ENDDD3'
    end
    object MemPrintCYCLE1: TStringField
      FieldName = 'CYCLE1'
    end
    object MemPrintCYCLE2: TStringField
      FieldName = 'CYCLE2'
    end
    object MemPrintCYCLE3: TStringField
      FieldName = 'CYCLE3'
    end
    object MemPrintKAISYUDD1: TStringField
      FieldName = 'KAISYUDD1'
    end
    object MemPrintKAISYUDD2: TStringField
      FieldName = 'KAISYUDD2'
    end
    object MemPrintKAISYUDD3: TStringField
      FieldName = 'KAISYUDD3'
    end
    object MemPrintSeiGCode: TStringField
      FieldName = 'SeiGCode'
    end
    object MemPrintSeiNMK: TStringField
      FieldName = 'SeiNMK'
    end
    object MemPrintUsKinKbn: TIntegerField
      FieldName = 'UsKinKbn'
    end
    object MemPrintUsKinNM: TStringField
      FieldName = 'UsKinNM'
    end
    object MemPrintRZuiSSite: TStringField
      FieldName = 'RZuiSSite'
    end
    object MemPrintRTSEINO: TStringField
      FieldName = 'RTSEINO'
    end
    object MemPrintPassKbn: TStringField
      FieldName = 'PassKbn'
    end
    object MemPrintPassItemKbn1: TStringField
      FieldName = 'PassItemKbn1'
    end
    object MemPrintPassItemKbn2: TStringField
      FieldName = 'PassItemKbn2'
    end
    object MemPrintPassKbnNm: TStringField
      FieldName = 'PassKbnNm'
    end
    object MemPrintPassItemKbn1Nm: TStringField
      FieldName = 'PassItemKbn1Nm'
    end
    object MemPrintPassItemKbn2Nm: TStringField
      FieldName = 'PassItemKbn2Nm'
    end
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
        DataType = ftFloat
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
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = '@pTanNCode'
        DataType = ftFloat
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
