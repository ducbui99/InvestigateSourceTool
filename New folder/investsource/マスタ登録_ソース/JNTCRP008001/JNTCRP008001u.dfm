object JNTCRP008001f: TJNTCRP008001f
  Left = 651
  Top = 220
  Align = alClient
  BorderStyle = bsNone
  Caption = 'JNTCRP008001f'
  ClientHeight = 618
  ClientWidth = 976
  Color = 15921906
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  OnActivate = fnJNTCRP008001fOnActivate
  OnClose = fnOnClose
  OnCloseQuery = fnJNTCRP008001fOnCloseQuery
  OnCreate = fnOnCreate
  OnDestroy = FormDestroy
  OnHide = fnJNTCRP008001fOnHide
  OnPaint = fnJNTCRP008001fOnPaint
  OnShow = fnOnShow
  PixelsPerInch = 96
  TextHeight = 12
  object CmnSplitter: TSplitter
    Left = 221
    Top = 25
    Height = 552
  end
  object DtlCmnClientPanel: TMPanel
    Left = 224
    Top = 25
    Width = 752
    Height = 552
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 3
    object DtlCmnScrollBox: TScrollBox
      Left = 0
      Top = 44
      Width = 752
      Height = 478
      Align = alClient
      BorderStyle = bsNone
      PopupMenu = DtlCmnPopupMenu
      TabOrder = 1
      object DtlCmnImageTag: TImage
        Left = 10
        Top = 14
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
      object DtlCmnLabelExCodeTitle: TMLabel
        Left = 33
        Top = 13
        Width = 140
        Height = 17
        AutoSize = False
        Caption = 'XXXXXXXXXXXXXX'#12467#12540#12489
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        FontRatio.Auto = False
      end
      object MLine1: TMLabel
        Left = 15
        Top = 132
        Width = 693
        Height = 1
        AutoSize = False
        Color = clSilver
        ParentColor = False
        BorderLine = tmb3DDown
        FontRatio.Auto = False
      end
      object MLabel1: TMLabel
        Left = 15
        Top = 409
        Width = 693
        Height = 1
        AutoSize = False
        Color = clSilver
        ParentColor = False
        BorderLine = tmb3DDown
        FontRatio.Auto = False
      end
      object DtlCmnLabelSegment: TMLabel
        Left = 366
        Top = 140
        Width = 91
        Height = 19
        AutoSize = False
        Caption = #12475#12464#12513#12531#12488#24773#22577
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = [fsBold]
        ParentFont = False
        FontRatio.Auto = False
      end
      object DtlCmnLabelBunrui: TMLabel
        Left = 16
        Top = 140
        Width = 65
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
      object DtlCmnEditExCodeFree: TMTxtEdit
        Left = 173
        Top = 14
        Width = 80
        Height = 19
        TabStop = False
        ArrowDisp = adFocused
        SelectDisp = sdNone
        OnArrowClick = DtlCmnEditExCodeNumericArrowClick
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
        OnChange = fnDtlCmnEditExCodeOnChange
        OnEnter = fnDtlCmnEditExCodeOnEnter
        OnKeyDown = fnCommonFunctionOnKeyDown01
        ValidChars = ''
      end
      object DtlCmnEditExCodeNumeric: TMNumEdit
        Left = 173
        Top = 14
        Width = 80
        Height = 19
        ArrowDisp = adFocused
        SelectDisp = sdNone
        OnArrowClick = ArrowClick
        FocusedColor = 16777158
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
        TabOrder = 0
        OnChange = fnDtlCmnEditExCodeOnChange
        OnEnter = fnDtlCmnEditExCodeOnEnter
        OnKeyDown = fnCommonFunctionOnKeyDown01
        FormatStr = '0'
        Negative = False
        Validate = False
        InputFlag = True
        InputFlagEnabled = True
        Zero = True
      end
      object DtlBumonScrBox: TScrollBox
        Left = 21
        Top = 169
        Width = 337
        Height = 229
        BorderStyle = bsNone
        TabOrder = 3
        object DtlCmnLabelBun01: TMLabel
          Tag = 521
          Left = 1
          Top = 0
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #65314#65321#20998#39006#12467#12540#12489#65297
          FontRatio.Auto = True
        end
        object DtlCmnDspBun01: TMLabel
          Left = 217
          Top = 0
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnLabelBun02: TMLabel
          Tag = 522
          Left = 1
          Top = 22
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #65314#65321#20998#39006#12467#12540#12489#65298
          FontRatio.Auto = True
        end
        object DtlCmnDspBun02: TMLabel
          Left = 217
          Top = 23
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnLabelBun03: TMLabel
          Tag = 523
          Left = 1
          Top = 44
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #65314#65321#20998#39006#12467#12540#12489#65299
          FontRatio.Auto = True
        end
        object DtlCmnLabelBun04: TMLabel
          Tag = 524
          Left = 1
          Top = 66
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #65314#65321#20998#39006#12467#12540#12489#65300
          FontRatio.Auto = True
        end
        object DtlCmnLabelBun05: TMLabel
          Tag = 525
          Left = 1
          Top = 88
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #65314#65321#20998#39006#12467#12540#12489#65301
          FontRatio.Auto = True
        end
        object DtlCmnLabelBun06: TMLabel
          Tag = 526
          Left = 1
          Top = 110
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #65314#65321#20998#39006#12467#12540#12489#65302
          FontRatio.Auto = True
        end
        object DtlCmnLabelBun07: TMLabel
          Tag = 527
          Left = 1
          Top = 132
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #65314#65321#20998#39006#12467#12540#12489#65303
          FontRatio.Auto = True
        end
        object DtlCmnLabelBun08: TMLabel
          Tag = 528
          Left = 1
          Top = 154
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #65314#65321#20998#39006#12467#12540#12489#65304
          FontRatio.Auto = True
        end
        object DtlCmnLabelBun09: TMLabel
          Tag = 529
          Left = 1
          Top = 176
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #65314#65321#20998#39006#12467#12540#12489#65305
          FontRatio.Auto = True
        end
        object DtlCmnLabelBun10: TMLabel
          Tag = 530
          Left = 1
          Top = 198
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #65314#65321#20998#39006#12467#12540#12489#65297#65296
          FontRatio.Auto = True
        end
        object DtlCmnDspBun03: TMLabel
          Left = 217
          Top = 44
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspBun04: TMLabel
          Left = 217
          Top = 66
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspBun05: TMLabel
          Left = 217
          Top = 89
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspBun06: TMLabel
          Left = 217
          Top = 110
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspBun07: TMLabel
          Left = 217
          Top = 132
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspBun08: TMLabel
          Left = 217
          Top = 154
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspBun09: TMLabel
          Left = 217
          Top = 176
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspBun10: TMLabel
          Left = 217
          Top = 198
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnEditBun01: TMTxtEdit
          Left = 114
          Top = 0
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 0
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditBun02: TMTxtEdit
          Left = 114
          Top = 22
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 1
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditBun03: TMTxtEdit
          Left = 114
          Top = 44
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 2
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditBun04: TMTxtEdit
          Left = 114
          Top = 66
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 3
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditBun05: TMTxtEdit
          Left = 114
          Top = 88
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 4
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditBun06: TMTxtEdit
          Left = 114
          Top = 110
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 5
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditBun07: TMTxtEdit
          Left = 114
          Top = 132
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 6
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditBun08: TMTxtEdit
          Left = 114
          Top = 154
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 7
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditBun09: TMTxtEdit
          Left = 114
          Top = 176
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 8
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditBun10: TMTxtEdit
          Left = 114
          Top = 198
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 9
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
      end
      object DtlSegScrBox: TScrollBox
        Left = 374
        Top = 167
        Width = 332
        Height = 229
        BorderStyle = bsNone
        TabOrder = 4
        object DtlCmnLabelSeg01: TMLabel
          Tag = 521
          Left = 1
          Top = 0
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488#12467#12540#12489#65297
          FontRatio.Auto = True
        end
        object DtlCmnLabelSeg02: TMLabel
          Tag = 522
          Left = 1
          Top = 21
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488#12467#12540#12489#65298
          FontRatio.Auto = True
        end
        object DtlCmnLabelSeg03: TMLabel
          Tag = 523
          Left = 1
          Top = 44
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488#12467#12540#12489#65299
          FontRatio.Auto = True
        end
        object DtlCmnLabelSeg04: TMLabel
          Tag = 524
          Left = 1
          Top = 66
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488#12467#12540#12489#65300
          FontRatio.Auto = True
        end
        object DtlCmnLabelSeg05: TMLabel
          Tag = 525
          Left = 1
          Top = 88
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488#12467#12540#12489#65301
          FontRatio.Auto = True
        end
        object DtlCmnLabelSeg06: TMLabel
          Tag = 526
          Left = 1
          Top = 110
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488#12467#12540#12489#65302
          FontRatio.Auto = True
        end
        object DtlCmnLabelSeg07: TMLabel
          Tag = 527
          Left = 1
          Top = 132
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488#12467#12540#12489#65303
          FontRatio.Auto = True
        end
        object DtlCmnLabelSeg08: TMLabel
          Tag = 528
          Left = 1
          Top = 154
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488#12467#12540#12489#65304
          FontRatio.Auto = True
        end
        object DtlCmnLabelSeg09: TMLabel
          Tag = 529
          Left = 1
          Top = 176
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488#12467#12540#12489#65305
          FontRatio.Auto = True
        end
        object DtlCmnLabelSeg10: TMLabel
          Tag = 530
          Left = 1
          Top = 198
          Width = 110
          Height = 19
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488#12467#12540#12489#65297#65296
          FontRatio.Auto = True
        end
        object DtlCmnDspSeg07: TMLabel
          Left = 212
          Top = 132
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspSeg08: TMLabel
          Left = 212
          Top = 154
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspSeg09: TMLabel
          Left = 212
          Top = 176
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspSeg10: TMLabel
          Left = 212
          Top = 198
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspSeg01: TMLabel
          Left = 212
          Top = 0
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspSeg02: TMLabel
          Left = 212
          Top = 22
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspSeg03: TMLabel
          Left = 212
          Top = 42
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspSeg04: TMLabel
          Left = 212
          Top = 66
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspSeg05: TMLabel
          Left = 212
          Top = 88
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnDspSeg06: TMLabel
          Left = 212
          Top = 110
          Width = 120
          Height = 19
          AutoSize = False
          FontRatio.Auto = True
        end
        object DtlCmnEditSeg01: TMTxtEdit
          Left = 113
          Top = 0
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 0
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditSeg02: TMTxtEdit
          Left = 113
          Top = 22
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 1
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditSeg03: TMTxtEdit
          Left = 113
          Top = 44
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 2
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditSeg04: TMTxtEdit
          Left = 113
          Top = 66
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 3
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditSeg05: TMTxtEdit
          Left = 113
          Top = 88
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 4
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditSeg06: TMTxtEdit
          Left = 113
          Top = 110
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 5
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditSeg07: TMTxtEdit
          Left = 113
          Top = 132
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 6
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditSeg08: TMTxtEdit
          Left = 113
          Top = 154
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 7
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditSeg09: TMTxtEdit
          Left = 113
          Top = 176
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 8
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditSeg10: TMTxtEdit
          Left = 113
          Top = 198
          Width = 97
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          TagStr = ''
          AutoSize = False
          ImeMode = imDisable
          FontRatio.Auto = False
          TabOrder = 9
          Text = ''
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
      end
      object MPanel: TMPanel
        Left = 26
        Top = 35
        Width = 594
        Height = 88
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 2
        object DtlCmnLabelAppDateAddtion: TMLabel
          Left = 468
          Top = 68
          Width = 17
          Height = 19
          AutoSize = False
          Caption = #65374
          FontRatio.Auto = False
        end
        object DtlCmnLabelName: TMLabel
          Left = 8
          Top = 45
          Width = 65
          Height = 17
          AutoSize = False
          Caption = #27491#24335#21517#31216
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object DtlCmnLabelNameSimple: TMLabel
          Left = 8
          Top = 68
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
        object DtlCmnLabelAssociation: TMLabel
          Left = 8
          Top = 23
          Width = 33
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
        object DtlCmnLabelAppDateTitle: TMLabel
          Left = 314
          Top = 68
          Width = 65
          Height = 17
          AutoSize = False
          Caption = #36969#29992#26399#38291
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object DtlCmnLabelDescSumDivision: TMLabel
          Left = 511
          Top = 25
          Width = 35
          Height = 17
          AutoSize = False
          Caption = #23455#22312
          Visible = False
          FontRatio.Auto = False
        end
        object DtlCmnLabelZengin: TMLabel
          Left = 8
          Top = 1
          Width = 86
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
        object DtlCmnLabelZenginName: TMLabel
          Left = 250
          Top = 2
          Width = 318
          Height = 19
          AutoSize = False
          Caption = #37504#34892#21517#31216
          Color = 15921906
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          ParentColor = False
          ParentFont = False
          MLeftMargin = 3
          FontRatio.Auto = False
        end
        object MLabel2: TMLabel
          Left = 185
          Top = 4
          Width = 13
          Height = 19
          AutoSize = False
          Caption = #65293
          FontRatio.Auto = False
        end
        object DtlCmnEditBkNCode: TMNumEdit
          Left = 440
          Top = 2
          Width = 121
          Height = 19
          TabStop = False
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
          TabOrder = 8
          Visible = False
          Validate = False
        end
        object DtlCmnEditName: TMTxtEdit
          Left = 147
          Top = 46
          Width = 421
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
          TabOrder = 4
          Text = ''
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object DtlCmnEditNameSimple: TMTxtEdit
          Left = 147
          Top = 68
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
          TabOrder = 5
          Text = ''
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = fnDtlCmnEditNameSimpleOnEnter
          OnExit = fnDtlCmnEditNameSimpleOnExit
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditAssociation: TMTxtEdit
          Left = 147
          Top = 24
          Width = 98
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
          Text = ''
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          ValidChars = ''
        end
        object DtlCmnEditAppDateEnd: TMDateEdit
          Left = 487
          Top = 68
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
          TabOrder = 7
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = fnDtlCommonFunctionOnEnter
          OnExit = fnDtlCmnEditAppDateEndOnExit
          OnKeyDown = fnCommonFunctionOnKeyDown02
          Calendar = True
          DateFormat = dfYMD
          DateInputType = diYMD
          Gengou = #0
          SepChar = '/'
          Value = 0
          Validate = False
        end
        object DtlCmnEditAppDateStart: TMDateEdit
          Left = 381
          Top = 68
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
          TabOrder = 6
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = fnDtlCommonFunctionOnEnter
          OnExit = fnDtlCmnEditAppDateStartOnExit
          OnKeyDown = fnCommonFunctionOnKeyDown02
          Calendar = True
          DateFormat = dfYMD
          DateInputType = diYMD
          Gengou = #0
          SepChar = '/'
          Value = 0
          Validate = False
        end
        object DtlCmnEditSumDivision: TMNumEdit
          Left = 543
          Top = 23
          Width = 17
          Height = 19
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
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          ImeMode = imClose
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 3
          Visible = False
          OnEnter = fnCommonFunctionOnEnter02
          FormatStr = '0'
          MaxValue = 1.000000000000000000
          Validate = False
          Zero = True
        end
        object DtlCmnEditBankCode: TMNumEdit
          Left = 147
          Top = 2
          Width = 38
          Height = 19
          ArrowDisp = adNone
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          DMaxLength = 4
          ImeMode = imDisable
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 0
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          FormatStr = '0'
          Negative = False
          MaxValue = 9999.000000000000000000
          Digits = 4
          Validate = False
          Value = 1234.000000000000000000
          InputFlag = True
          InputFlagEnabled = True
          Zero = True
        end
        object DtlCmnEditBrCode: TMNumEdit
          Left = 198
          Top = 2
          Width = 29
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
          FocusedColor = 16777158
          ArrowType = atOmission
          F4Arrow = True
          AutoSize = False
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#26126#26397
          Font.Style = []
          DMaxLength = 3
          ImeMode = imDisable
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 1
          OnChange = fnCommonFunctionDetailsOnChange
          OnEnter = fnDtlCommonFunctionOnEnter
          OnKeyDown = fnCommonFunctionOnKeyDown02
          FormatStr = '0'
          Negative = False
          MaxValue = 999.000000000000000000
          Digits = 3
          Validate = False
          Value = 123.000000000000000000
          InputFlag = True
          InputFlagEnabled = True
          Zero = True
        end
      end
    end
    object DtlCmnTab: TMTab
      Left = 0
      Top = 0
      Width = 752
      Height = 44
      Items = <
        item
          Caption = #23455#22312#24773#22577
          Color = 16766672
          Alignment = taCenter
          ImageIndex = 0
          ParentBorderCaption = True
        end
        item
          Caption = #21512#35336#24773#22577
          Color = 16766672
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
      BorderHeight = 19
      BorderFont.Charset = SHIFTJIS_CHARSET
      BorderFont.Color = clWindowText
      BorderFont.Height = -12
      BorderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
      BorderFont.Style = []
      OnKeyDown = fnDtlCmnTabOnKeyDown
      BorderCaptionAlign = taLeftJustify
      DropShadow = False
    end
    object MPanel2: TMPanel
      Left = 0
      Top = 522
      Width = 752
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 2
      DesignSize = (
        752
        30)
      object DtlCmnButtonUpdate: TMBitBtn
        Left = 600
        Top = 1
        Width = 70
        Height = 23
        Anchors = [akTop, akRight, akBottom]
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
        OnClick = fnDtlCmnButtonUpdateOnClick
        OnEnter = DtlCmnButtonUpdateEnter
      end
      object DtlCmnButtonCancel: TMBitBtn
        Left = 673
        Top = 1
        Width = 70
        Height = 23
        Anchors = [akTop, akRight, akBottom]
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
        OnClick = fnDtlCmnButtonCancelOnClick
      end
    end
  end
  object StdCmnClientPanel: TMPanel
    Left = 224
    Top = 25
    Width = 752
    Height = 552
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 2
    object StdCmnClientPanelTotal: TMPanel
      Left = 0
      Top = 44
      Width = 752
      Height = 508
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 1
      Visible = False
      object StdCmnGridTotal: TdxDBGrid
        Left = 1
        Top = 1
        Width = 750
        Height = 506
        Bands = <
          item
          end
          item
            Caption = #20184#31627#20633#32771
            Visible = False
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
        Font.Name = #65325#65331' '#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        PopupMenu = StdCmnGridPopupMenu
        TabOrder = 0
        OnEnter = fnStdCmnGridTotalOnEnter
        OnKeyPress = fnStdCmnGridTotalOnKeyPress
        OnMouseDown = fnStdCmnGridTotalOnMouseDown
        OnMouseMove = fnStdCmnGridTotalOnMouseMove
        BandColor = 10204878
        BandFont.Charset = SHIFTJIS_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -13
        BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BandFont.Style = []
        DataSource = StdCmnDataSourceTotal
        HeaderColor = 16766672
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
        OnChangeColumn = fnStdCmnGridTotaOnlChangeColumn
        OnChangeNodeEx = fnStdCmnGridTotalOnChangeNodeEx
        OnEditing = fnStdCmnGridTotalOnEditing
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
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          HeaderAlignment = taCenter
          Width = 75
          BandIndex = 0
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          StretchChar.Auto = False
          FieldName = 'strExCode'
          OnGetText = fnStdCmnGridTotalCodeOnGetText
        end
        object StdCmnGridTotalAssociation: TdxDBGridColumn
          Caption = #36899#24819
          HeaderAlignment = taCenter
          Width = 88
          BandIndex = 0
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 10
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'strAssociation'
        end
        object StdCmnGridTotalName: TdxDBGridColumn
          Caption = #27491#24335#21517#31216
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          HeaderAlignment = taCenter
          Width = 284
          BandIndex = 0
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 40
          StretchChar.Auto = False
          FieldName = 'strName'
        end
        object StdCmnGridTotalNameSimple: TdxDBGridColumn
          Caption = #31777#30053#21517#31216
          HeaderAlignment = taCenter
          Width = 102
          BandIndex = 0
          RowIndex = 0
          ImeMode = imHira
          StretchChar.Auto = False
          FieldName = 'strNameSimple'
        end
        object StdCmnGridTotalComment: TdxDBGridColumn
          Caption = #20184#31627#20633#32771
          ReadOnly = True
          Visible = False
          BandIndex = 1
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'strComment'
        end
      end
    end
    object StdCmnClientPanelExist: TMPanel
      Left = 0
      Top = 44
      Width = 752
      Height = 508
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      Visible = False
      object StdCmnGridExist: TdxDBGrid
        Left = 1
        Top = 1
        Width = 750
        Height = 506
        Bands = <
          item
            MinWidth = 21
            Width = 42
          end
          item
            Caption = #12467#12540#12489
          end
          item
            Caption = #20840#37504#21332#12467#12540#12489
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
            Caption = #24471#24847#20808
            Visible = False
            Width = 48
          end
          item
            Caption = #20181#20837#20808
            Visible = False
          end
          item
            Caption = #20184#31627#20633#32771
            Visible = False
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
        Font.Name = #65325#65331' '#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        PopupMenu = StdCmnGridPopupMenu
        TabOrder = 0
        OnEnter = fnStdCmnGridExistOnEnter
        OnKeyPress = fnStdCmnGridExistOnKeyPress
        OnMouseDown = fnStdCmnGridExistOnMouseDown
        OnMouseMove = fnStdCmnGridExistOnMouseMove
        BandColor = 16766672
        BandFont.Charset = SHIFTJIS_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -13
        BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BandFont.Style = []
        DataSource = StdCmnDataSourceExist
        HeaderColor = 16766672
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
        OnChangeColumn = fnStdCmnGridExistOnChangeColumn
        OnChangeNodeEx = fnStdCmnGridExistOnChangeNodeEx
        OnEditing = fnStdCmnGridExistOnEditing
        OnBeforeChangeColumn = fnStdCmnGridExistOnBeforeChangeColumn
        object StdCmnGridExistTag: TdxDBGridGraphicColumn
          Caption = ' '
          HeaderAlignment = taCenter
          ReadOnly = True
          TabStop = False
          Width = 20
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
          Font.Name = #65325#65331' '#12468#12471#12483#12463
          Font.Style = []
          HeaderAlignment = taCenter
          Width = 75
          BandIndex = 1
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          StretchChar.Auto = False
          FieldName = 'strExCode'
          OnGetText = fnStdCmnGridExistCodeOnGetText
        end
        object StdCmnGridExistBkExp: TdxDBGridButtonColumn
          Width = 76
          BandIndex = 2
          RowIndex = 0
          ImeMode = imClose
          StretchChar.Auto = False
          FieldName = 'strBkExp'
          OnEditButtonClick = StdCmnGridExistBkExpEditButtonClick
        end
        object StdCmnGridExistBkCode: TdxDBGridLookupColumn
          Visible = False
          BandIndex = 2
          RowIndex = 0
          ImeMode = imClose
          StretchChar.Auto = False
          FieldName = 'lBkCode'
          DropDownSelectEx = False
          ListFieldName = 'BkCode;BkName'
          ListWidth = 200
          OnCloseUp = StdCmnGridExistBkCodeCloseUp
        end
        object StdCmnGridExistAssociation: TdxDBGridColumn
          Caption = #36899#24819
          HeaderAlignment = taCenter
          Width = 88
          BandIndex = 3
          RowIndex = 0
          ImeMode = imSKata
          MaxLength = 10
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'strAssociation'
        end
        object StdCmnGridExistName: TdxDBGridColumn
          Caption = #27491#24335#21517#31216
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          HeaderAlignment = taCenter
          Width = 284
          BandIndex = 4
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 40
          StretchChar.Auto = False
          FieldName = 'strName'
        end
        object StdCmnGridExistNameSimple: TdxDBGridColumn
          Caption = #31777#30053#21517#31216
          HeaderAlignment = taCenter
          Width = 102
          BandIndex = 5
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 14
          StretchChar.Auto = False
          FieldName = 'strNameSimple'
        end
        object StdCmnGridExistAdoptDivision01: TdxDBGridLookupColumn
          MinWidth = 12
          Width = 20
          BandIndex = 6
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          StretchChar.Auto = False
          FieldName = 'nAdoptDivision01'
          DropDownSelectEx = False
          DropDownRows = 2
          ListFieldName = 'nDivision;strDescription'
          ListWidth = 70
        end
        object StdCmnGridExistAdoptComment01: TdxDBGridMaskColumn
          ReadOnly = True
          TabStop = False
          Width = 34
          BandIndex = 6
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'strAdoptComment01'
        end
        object StdCmnGridExistAdoptDivision02: TdxDBGridLookupColumn
          MinWidth = 12
          Width = 20
          BandIndex = 7
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          StretchChar.Auto = False
          FieldName = 'nAdoptDivision02'
          DropDownSelectEx = False
          DropDownRows = 2
          ListFieldName = 'nDivision;strDescription'
          ListWidth = 70
        end
        object StdCmnGridExistAdoptComment02: TdxDBGridMaskColumn
          ReadOnly = True
          TabStop = False
          Width = 34
          BandIndex = 7
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'strAdoptComment02'
        end
        object StdCmnGridExistComment: TdxDBGridColumn
          Caption = #20184#31627#20633#32771
          ReadOnly = True
          Visible = False
          BandIndex = 8
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'strComment'
        end
      end
    end
    object StdCmnTab: TMTab
      Left = 0
      Top = 0
      Width = 752
      Height = 44
      Items = <
        item
          Caption = #23455#22312#24773#22577
          Color = 16766672
          SyncControl = StdCmnClientPanelExist
          Alignment = taCenter
          ImageIndex = 0
          ParentBorderCaption = True
        end
        item
          Caption = #21512#35336#24773#22577
          Color = 16766672
          SyncControl = StdCmnClientPanelTotal
          Alignment = taCenter
          ImageIndex = 0
          ParentBorderCaption = True
        end>
      Align = alTop
      TabOrder = 2
      OnChange = fnStdCmnTabOnChange
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
      OnEnter = fnStdCmnTabOnEnter
      OnKeyDown = fnStdCmnTabOnKeyDown
      BorderCaptionAlign = taLeftJustify
      DropShadow = False
    end
  end
  object CmnToolBar: TPanel
    Left = 0
    Top = 0
    Width = 976
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    ParentColor = True
    TabOrder = 0
    Visible = False
    object BEnd: TMSpeedButton
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
      ParentFont = False
    end
    object BPrint: TMSpeedButton
      Left = 74
      Top = 2
      Width = 70
      Height = 21
      Caption = #21360#21047'(&P)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#12468#12471#12483#12463
      Font.Style = []
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
      ParentFont = False
      OnClick = fnBPrintOnClick
    end
    object BChange: TMSpeedButton
      Left = 146
      Top = 2
      Width = 73
      Height = 21
      Caption = #20999#20986'(&G)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#12468#12471#12483#12463
      Font.Style = []
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
      ParentFont = False
      OnClick = BChangeClick
    end
    object BDelete: TMSpeedButton
      Left = 293
      Top = 2
      Width = 70
      Height = 21
      Caption = #21066#38500'(&D)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#12468#12471#12483#12463
      Font.Style = []
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000C40E0000C40E00000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D1D1D1D1D1D1
        D1D10000000000000000F6F6F6F6F6F6F6F60000000000000000D1D1D1D1D1D1
        D1D12D072D310782F600F6F6F6F6F6F6F6F62D072D3107F7FF00D1D1D1D1D1D1
        D1D12D86AFFFFFF6AF00F6F6F6F6F6F6F6F62D86AFFFFFFFAF00D1D1D1D1D1D1
        D1D12D2D2D2D2D2D2D2DF6F6F6F6F6F6F6F62D2D2D2D2D2D2D2DD1D1D1D1D1D1
        D1D1D1D1D1D1D1D1D1D1F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6D1D1D10000D1
        D1D1D1D1D1D1D1D1D1D1F6F6F60000F6F6F6F6F6F6F6F6F6F6F6D1D100DC00D1
        D1D10000000000000000F6F6003100F6F6F60000000000000000D100DCFEE900
        0000000000486DB5C000F6003186F7000000000000F0F531F70000DCFEFEFEE9
        E9DCF50000B5C4C4C0000031868686F7F731F50000318282F700FFFEFEFEFEFE
        E9E5DCF1004949494949FF8686868686F70731F000F1F1F1F1F1D1FFFEFEE9E5
        E5E5E5E5F1D1D1D1D1D1F6FF8686F70707070707F0F6F6F6F6F6D1D1FFFEE5D1
        D1D1D1D1D1D1D1D1D1D1F6F6FF8607F6F6F6F6F6F6F6F6F6F6F6D1D1D1FFE5D1
        D1D10000000000000000F6F6F6FF07F6F6F60000000000000000D1D1D1D1D1D1
        D1D12D072D310782F600F6F6F6F6F6F6F6F62D072D3107F7FF00D1D1D1D1D1D1
        D1D12D86AFFFFFF6AF00F6F6F6F6F6F6F6F62D86AFFFFFFFAF00D1D1D1D1D1D1
        D1D12D2D2D2D2D2D2D2DF6F6F6F6F6F6F6F62D2D2D2D2D2D2D2D}
      NumGlyphs = 2
      ParentFont = False
      OnClick = fnBDeleteOnClick
      OnMouseDown = BDeleteMouseDown
    end
    object BDetails: TMSpeedButton
      Left = 221
      Top = 2
      Width = 70
      Height = 21
      Caption = #35443#32048'(&T)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#12468#12471#12483#12463
      Font.Style = []
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000C40E0000C40E00000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D1D1D1D1D1D1
        D1D10000D1D1D1D1D1D1F6F6F6F6F6F6F6F60000F6F6F6F6F6F6D1D1D1D1D1D1
        0000AAAA00D1D1D1D1D1F6F6F6F6F6F60000080800F6F6F6F6F6D154D1D10000
        AAAAFFFFAA00D1D1D1D1F631F6F600000808FFFF0800F6F6F6F654C65400AAAA
        FFFF0707FFAA00D1D1D1318231000808FFFF0707FF0800F6F6F6C6D3C65400AA
        0707AAAA0707AA00D1D182F6823100080707080807070800F6F6D1C6D3C65400
        00000000AAFF07AA00D1F682F68231000000000008FF070800F6D1D1C6D3C65E
        F6F6FF5E0007AAFFAA00F6F682F682F7FFFFFFF7000708FF0800D1D1D1C6AFF6
        DD1B1BF65E000707FFAAF6F6F682AFFF31F7F7FFF7000707FF08D1D1D1AFFFEE
        D9FFFFDDF65E00FFAAD1F6F6F6AFFFF0F6FFFF31FFF700FF08F6D1D1D1FF00D8
        FFB3B31BDDF6D1AAD1D1F6F6F6FF00AFFFF6F6F731FFF608F6F6D1D1D1FF00B3
        B3B38BDDEEF6D1D1D1D1F6F6F6FF00F6F6F60831F0FFF6F6F6F6D1D1D1FF00AF
        D8B3DDDDEEF6D1D1D1D1F6F6F6FF00AFAFF63131F0FFF6F6F6F6D1D1D1AFFF00
        AF1BDDEEF6AFD1D1D1D1F6F6F6AFFF00AFF731F0FFAFF6F6F6F6D1D1D1D1AFFF
        0000EEFFAFD1D1D1D1D1F6F6F6F6AFFF0000F0FFAFF6F6F6F6F6D1D1D1D1D1AF
        FFFFFFAFD1D1D1D1D1D1F6F6F6F6F6AFFFFFFFAFF6F6F6F6F6F6D1D1D1D1D1D1
        D1D1D1D1D1D1D1D1D1D1F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6}
      NumGlyphs = 2
      ParentFont = False
      OnClick = fnBDetailsOnClick
    end
    object BRowChange: TMSpeedButton
      Left = 365
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
      OnClick = BRowChangeClick
    end
    object BSearch: TMSpeedButton
      Left = 461
      Top = 2
      Width = 83
      Height = 21
      Caption = #26908#32034'(&Q)'
      Flat = True
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #65325#65331' '#12468#12471#12483#12463
      Font.Style = []
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000C40E0000C40E00000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D12D2D2D2D2D
        D1D1D1D12D2D2D2D2DD1F62D2D2D2D2DF6F6F6F62D2D2D2D2DF62D0000EDEDED
        2DD1D12D0000EDEDED2D2D0000F0F0F02DF6F62D0000F0F0F02D0000DDDDDDED
        EDD1D10000DDDDDDEDED0000313131F0F0F6F60000313131F0F000DD1BB38BDD
        EDD1D100DD1BB38BDDED0031F7F60831F0F6F60031F7F60831F0001BB38B1BDD
        ED2D2D001BB38B1BDDED00F7F608F731F02D2D00F7F608F731F000EEDD1BDDEE
        2D7E7E2DEEDD1BDDEE2D00F031F731F02D07072DF031F731F02D2D00EEEEEE00
        2DD07E2D00EEEEEE002D2D00F0F0F0002DAF072D00F0F0F0002D2D7E0000002D
        002D2D007E0000002D2D2D070000002D002D2D00070000002D2D2DED7E7E2D00
        00EDED00ED7E7E2DED2D2DF007072D0000F0F000F007072DF02D2DEDED000000
        00002DEDEDED0000002D2DF0F000000000002DF0F0F00000002DD17EEDED002D
        002D7EED7EEDED002DD1F607F0F0002D002D07F007F0F0002DF6D1ED7E2D2DED
        00ED2DEDED7E2D2D00D1F6F0072D2DF000F02DF0F0072D2D00F6D1D12DEDEDED
        2D00ED2DEDED002DD1D1F6F62DF0F0F02D00F02DF0F0002DF6F6D1D1D1D17E2D
        ED00007E2D00D1D1D1D1F6F6F6F6072DF00000072D00F6F6F6F6D1D1D1D1D12D
        00D1D12D00D1D1D1D1D1F6F6F6F6F62D00F6F62D00F6F6F6F6F6D1D1D1D1D1D1
        D1D1D1D1D1D1D1D1D1D1F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6}
      NumGlyphs = 2
      ParentFont = False
      OnClick = BSearchClick
    end
    object ToolBar1: TToolBar
      Left = 546
      Top = 2
      Width = 75
      Height = 21
      Align = alNone
      ButtonHeight = 21
      ButtonWidth = 25
      Caption = 'ToolBar1'
      Images = CmnToolbarImage
      TabOrder = 0
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
  object CmnTreeView: TMTreeView
    Left = 0
    Top = 25
    Width = 221
    Height = 552
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
    PopupMenu = CmnTreeViewPopupMenu
    ReadOnly = True
    RightClickSelect = True
    ShowLines = False
    TabOrder = 1
    OnChange = fnCmnTreeViewOnChange
    OnDblClick = fnCmnTreeViewOnDblClick
    OnDragDrop = fnCmnTreeViewOnDragDrop
    OnDragOver = fnCmnTreeViewOnDragOver
    OnEnter = fnCmnTreeViewOnEnter
    OnExit = CmnTreeViewExit
  end
  object ProgPanel: TMPanel
    Left = 0
    Top = 598
    Width = 976
    Height = 20
    Align = alBottom
    Caption = 'ProgPanel'
    Color = 15921906
    ParentBackground = False
    TabOrder = 4
    object CmnStatusBar: TStatusBar
      Left = 1
      Top = 1
      Width = 974
      Height = 18
      Align = alClient
      Color = 15921906
      Panels = <>
      ParentShowHint = False
      ShowHint = True
      SimplePanel = True
    end
    object Prog1: TProgressBar
      Left = 4
      Top = 7
      Width = 200
      Height = 8
      Smooth = True
      TabOrder = 1
    end
  end
  object MSPFunctionBar: TMSPFunctionBar
    Left = 0
    Top = 577
    Width = 976
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
    ButtonWidth = 122
    FuncAnchors = True
    OnFunctionClick = MSPFunctionBarFunctionClick
    SysBaseColorB = 10841658
    SysBaseColorD = 6956042
  end
  object CmnTreeViewImage: TImageList
    Left = 12
    Top = 32
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
      0000000000000000000000000000000000000000000000000000000000004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000000000000000000042424200424242004242420000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000424242004242
      4200424242004242420063636300636363006363630042424200424242004242
      4200424242004242420042424200000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      630063636300424242000000000000000000000000000000000063636300EFDE
      C60063636300EFDEC600EFDECE00EFDECE00EFDEC600EFE7CE00EFDECE00EFDE
      CE00636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      000063636300424242000000000000000000000000000000000063636300EFDE
      C60063636300EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDEC600EFDE
      C600636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      000063636300424242000000000000000000000000000000000063636300E7D6
      BD0063636300E7D6BD00E7D6BD00E7D6BD00E7D6BD00E7D6BD00E7D6BD00E7D6
      BD00636363004242420000000000000000000000000000000000000000006363
      6300000000006363630063636300636363006363630000000000636363000000
      0000636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000000000000000006363
      6300000000006363630063636300000000000000000000000000636363000000
      000063636300424242000000000000000000000000000000000063636300E7CE
      B50063636300E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500E7CEB500E7CE
      B500636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      63000000000000000000000000008C5229008C52290000000000000000000000
      000063636300424242000000000000000000000000000000000063636300DECE
      AD0063636300DECEAD00DECEAD00DECEAD00DECEAD00DECEAD00DECEAD00DECE
      AD00636363004242420000000000000000000000000000000000000000006363
      6300000000006363630063636300636363006363630063636300636363000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000424242004242420000000000636363000000000042424200000000004242
      4200000000006363630042424200000000000000000000000000000000006363
      63000000000063636300000000008C5229008C5229008C5229008C5229000000
      000063636300424242000000000000000000000000000000000063636300DEC6
      A50063636300DEC6A500DEC6A500DEC6A500DEC6A500DEC6A500DEC6A500DEC6
      A500636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000008C522900F7C67B00F7C67B008C52
      290000000000424242000000000000000000000000000000000063636300D6BD
      9C0063636300D6BD9C006363630063636300636363006363630063636300D6BD
      9C00636363004242420000000000000000000000000000000000000000006363
      6300000000000000000063636300636363000000000063636300636363000000
      0000636363004242420000000000000000000000000063636300000000004242
      4200000000004242420000000000636363000000000042424200424242000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000063636300000000008C522900F7C67B00F7C67B00F7C6
      7B008C522900000000000000000000000000000000000000000063636300D6B5
      940063636300D6BD94004242420042424200424242004242420042424200D6B5
      9400636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      630000000000000000000000000000000000000000008C522900F7C67B00F7C6
      7B00F7C67B008C5229000000000000000000000000000000000063636300D6B5
      8C0063636300D6B58C00D6B58C00D6B58C00D6B58C00D6B58C00D6B58C00D6B5
      8C00636363004242420000000000000000000000000000000000000000006363
      6300000000006363630063636300636363006363630063636300636363000000
      0000636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000000000000000006363
      63000000000063636300636363006363630063636300000000008C522900F7C6
      7B00F7C67B00F7C67B008C522900000000000000000000000000636363000000
      0000636363000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000063636300636363006363630000000000000000000000
      0000000000006363630042424200000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000008C52
      2900F7C67B008C52290000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000000000000000000006363
      6300000000000000000000000000000000000000000000000000000000000000
      00008C5229000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFE003F003FC7FF003
      C003E003C001E003C003EFF38001EFF3C003EFF3BEF9EFF3C003E853A289E9D3
      C003EFF3BEF9EE73C003E813B2A9EA13C003EFF3BEF9EF0BC003EC93AA99ED07
      C003EFF3BEF9EF83C003E813A289E841D7F3EFF3BC79EFE3C007EFF38383EFF7
      FFFFE007FFFFE00FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object StdCmnMemDataExist: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = fnStdCmnMemDataExistBeforePost
    Left = 78
    Top = 32
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
      DisplayWidth = 40
      FieldName = 'strName'
      Size = 60
    end
    object StdCmnMemDataExistNameSimple: TStringField
      FieldName = 'strNameSimple'
      Size = 14
    end
    object StdCmnMemDataExistAssociation: TStringField
      FieldName = 'strAssociation'
      Size = 10
    end
    object StdCmnMemDataExistAppDateStart: TDateField
      FieldName = 'dtAppDateStart'
    end
    object StdCmnMemDataExistAppDateEnd: TDateField
      FieldName = 'dtAppDateEnd'
    end
    object StdCmnMemDataExistnAdoptDivision01: TIntegerField
      FieldKind = fkLookup
      FieldName = 'nAdoptDivision01'
      LookupDataSet = StdCmnMemDataCustomer
      LookupKeyFields = 'nDivision'
      LookupResultField = 'nDivision'
      KeyFields = 'nAdoptData01'
      Lookup = True
    end
    object StdCmnMemDataExistnAdoptDivision02: TIntegerField
      FieldKind = fkLookup
      FieldName = 'nAdoptDivision02'
      LookupDataSet = StdCmnMemDataSupplier
      LookupKeyFields = 'nDivision'
      LookupResultField = 'nDivision'
      KeyFields = 'nAdoptData02'
      Lookup = True
    end
    object StdCmnMemDataExiststrAdoptComment01: TStringField
      FieldKind = fkLookup
      FieldName = 'strAdoptComment01'
      LookupDataSet = StdCmnMemDataCustomer
      LookupKeyFields = 'nDivision'
      LookupResultField = 'strDescription'
      KeyFields = 'nAdoptData01'
      Lookup = True
    end
    object StdCmnMemDataExiststrAdoptComment02: TStringField
      FieldKind = fkLookup
      FieldName = 'strAdoptComment02'
      LookupDataSet = StdCmnMemDataSupplier
      LookupKeyFields = 'nDivision'
      LookupResultField = 'strDescription'
      KeyFields = 'nAdoptData02'
      Lookup = True
    end
    object StdCmnMemDataExistnAdoptData01: TSmallintField
      FieldName = 'nAdoptData01'
    end
    object StdCmnMemDataExistnAdoptData02: TSmallintField
      FieldName = 'nAdoptData02'
    end
    object StdCmnMemDataExiststrComment: TStringField
      FieldName = 'strComment'
      Size = 60
    end
    object StdCmnMemDataExistcBankNCode: TCurrencyField
      FieldName = 'cBankNCode'
    end
    object StdCmnMemDataExistcNCode: TCurrencyField
      FieldName = 'cNCode'
    end
    object StdCmnMemDataExistlBkCode: TStringField
      DisplayLabel = #20840#37504#21332#12467#12540#12489
      FieldKind = fkLookup
      FieldName = 'lBkCode'
      LookupDataSet = dxMBankInfo
      LookupKeyFields = 'NCode'
      LookupResultField = 'BkCode'
      KeyFields = 'cBankNCode'
      Size = 10
      Lookup = True
    end
    object StdCmnMemDataExistlBkName: TStringField
      FieldKind = fkLookup
      FieldName = 'lBkName'
      LookupDataSet = dxMBankInfo
      LookupKeyFields = 'NCode'
      LookupResultField = 'BkName'
      KeyFields = 'cBankNCode'
      Size = 40
      Lookup = True
    end
    object StdCmnMemDataExiststrBkExp: TStringField
      FieldName = 'strBkExp'
    end
    object StdCmnMemDataExistZenBankNM: TStringField
      FieldName = 'ZenBankNM'
      Size = 60
    end
    object StdCmnMemDataExistZenOfficeNM: TStringField
      FieldName = 'ZenOfficeNM'
      Size = 60
    end
  end
  object StdCmnDataSourceExist: TDataSource
    DataSet = StdCmnMemDataExist
    OnStateChange = fnStdCmnDataSourceExistOnStateChange
    Left = 106
    Top = 32
  end
  object StdCmnDataSourceTotal: TDataSource
    DataSet = StdCmnMemDataTotal
    OnStateChange = fnStdCmnDataSourceTotalOnStateChange
    Left = 106
    Top = 65
  end
  object StdCmnMemDataTotal: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = fnStdCmnMemDataTotalBeforePost
    Left = 77
    Top = 65
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
      DisplayWidth = 40
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
    object StdCmnMemDataTotalcBankNCode: TCurrencyField
      FieldName = 'cBankNCode'
    end
    object StdCmnMemDataTotalcNCode: TCurrencyField
      FieldName = 'cNCode'
    end
    object StdCmnMemDataTotallAllBkCode: TIntegerField
      FieldKind = fkLookup
      FieldName = 'lAllBkCode'
      LookupDataSet = dxMBankInfo
      LookupKeyFields = 'NCode'
      LookupResultField = 'AllBkCode'
      KeyFields = 'cBankNCode'
      Lookup = True
    end
    object StdCmnMemDataTotalAppDateStart: TDateField
      FieldName = 'dtAppDateStart'
    end
    object StdCmnMemDataTotalAppDateEnd: TDateField
      FieldName = 'dtAppDateEnd'
    end
  end
  object CmnTreeViewPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = fnCmnTreeViewPopupMenuOnPopup
    Left = 8
    Top = 156
    object CmnTreeViewPopupMenuDetail: TMenuItem
      Caption = #35443#32048
      ImageIndex = 0
      OnClick = fnCmnTreeViewPopupMenuDetailOnClick
    end
    object CmnTreeViewPopupMenuBreak01: TMenuItem
      Caption = '-'
    end
    object CmnTreeViewPopupMenuCopy: TMenuItem
      Caption = #20182#12398#21152#31639#20808#12408#12467#12500#12540
      ImageIndex = 0
      OnClick = fnCmnTreeViewPopupMenuCopyOnClick
    end
    object CmnTreeViewPopupMenuPaste: TMenuItem
      Caption = #20182#12398#21152#31639#20808#12363#12425#36028#12426#20184#12369
      ImageIndex = 0
      OnClick = fnCmnTreeViewPopupMenuPasteOnClick
    end
    object CmnTreeViewPopupMenuBreak02: TMenuItem
      Caption = '-'
    end
    object CmnTreeViewPopupMenuErase: TMenuItem
      Caption = #21152#31639#12375#12394#12356
      ImageIndex = 0
      OnClick = fnCmnTreeViewPopupMenuEraseOnClick
    end
    object CmnTreeViewPopupMenuDelete: TMenuItem
      Caption = #21066#38500
      ImageIndex = 0
      OnClick = fnCmnTreeViewPopupMenuDeleteOnClick
    end
    object CmnTreeViewPopupMenuBreak03: TMenuItem
      Caption = '-'
    end
    object CmnTreeViewPopupMenuTagOff: TMenuItem
      Caption = #12399#12364#12377'(&D)'
      OnClick = fnCmnTreeViewPopupMenuTagOnClick
    end
    object CmnTreeViewPopupMenuTagComment: TMenuItem
      Caption = #20633#32771#20462#27491'(&U)...'
      OnClick = fnCmnTreeViewPopupMenuTagOnClickEx
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CmnTreeViewPopupMenuTag01: TMenuItem
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
      object CmnTreeViewPopupMenuItemTag01: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnTreeViewPopupMenuTagOnClick
      end
      object CmnTreeViewPopupMenuItemTag01Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnTreeViewPopupMenuTagOnClickEx
      end
    end
    object CmnTreeViewPopupMenuTag02: TMenuItem
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
      object CmnTreeViewPopupMenuItemTag02: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnTreeViewPopupMenuTagOnClick
      end
      object CmnTreeViewPopupMenuItemTag02Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnTreeViewPopupMenuTagOnClickEx
      end
    end
    object CmnTreeViewPopupMenuTag03: TMenuItem
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
      object CmnTreeViewPopupMenuItemTag03: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnTreeViewPopupMenuTagOnClick
      end
      object CmnTreeViewPopupMenuItemTag03Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnTreeViewPopupMenuTagOnClickEx
      end
    end
    object CmnTreeViewPopupMenuTag04: TMenuItem
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
      object CmnTreeViewPopupMenuItemTag04: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnCmnTreeViewPopupMenuTagOnClick
      end
      object CmnTreeViewPopupMenuItemTag04Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnCmnTreeViewPopupMenuTagOnClickEx
      end
    end
  end
  object StdCmnGridPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = fnStdCmnGridPopupMenuOnPopup
    Left = 36
    Top = 156
    object StdCmnGridPopupMenuTagOff: TMenuItem
      Caption = #12399#12364#12377'(&D)'
      OnClick = fnStdCmnGridPopupMenuTagOnClick
    end
    object StdCmnGridPopupMenuTagComment: TMenuItem
      Caption = #20633#32771#20462#27491'(&U)...'
      OnClick = fnStdCmnGridPopupMenuTagOnClickEx
    end
    object N2: TMenuItem
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
      ImageIndex = 0
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
      ImageIndex = 0
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
      ImageIndex = 0
      object StdCmnGridPopupMenuItemTag04: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnStdCmnGridPopupMenuTagOnClick
      end
      object StdCmnGridPopupMenuItemTag04Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnStdCmnGridPopupMenuTagOnClickEx
      end
    end
    object BmpGrid01: TMenuItem
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
    object BmpGrid02: TMenuItem
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
    object BmpGrid03: TMenuItem
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
    object BmpGrid04: TMenuItem
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
  object StdCmnMemDataCustomer: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 8
    Top = 64
    object StdCmnMemDataCustomerDivision: TIntegerField
      DisplayWidth = 2
      FieldName = 'nDivision'
    end
    object StdCmnMemDataCustomerDescription: TStringField
      DisplayWidth = 10
      FieldName = 'strDescription'
    end
  end
  object StdCmnMemDataSupplier: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 8
    Top = 88
    object StdCmnMemDataSupplierDivision: TIntegerField
      DisplayWidth = 2
      FieldName = 'nDivision'
    end
    object StdCmnMemDataSupplierDescription: TStringField
      DisplayWidth = 10
      FieldName = 'strDescription'
    end
  end
  object CmnMemDataPrintExtStandard: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 32
    Top = 356
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
    object CmnMemDataPrintExtStandardstrCustomerDesc: TStringField
      FieldName = 'strCustomerDesc'
      Size = 2
    end
    object CmnMemDataPrintExtStandardstrSupplierDesc: TStringField
      FieldName = 'strSupplierDesc'
      Size = 2
    end
    object CmnMemDataPrintExtStandardstrClassDesc: TStringField
      FieldName = 'strClassDesc'
      Size = 14
    end
    object CmnMemDataPrintExtStandardnExCodeCustDeb: TIntegerField
      FieldName = 'nExCodeCustDeb'
    end
    object CmnMemDataPrintExtStandardnExCodeCustCre: TIntegerField
      FieldName = 'nExCodeCustCre'
    end
    object CmnMemDataPrintExtStandardstrCustDebDesc: TStringField
      FieldName = 'strCustDebDesc'
      Size = 14
    end
    object CmnMemDataPrintExtStandardstrCustCreDesc: TStringField
      FieldName = 'strCustCreDesc'
      Size = 14
    end
    object CmnMemDataPrintExtStandardnExCodeSuppDeb: TIntegerField
      FieldName = 'nExCodeSuppDeb'
    end
    object CmnMemDataPrintExtStandardnExCodeSuppCre: TIntegerField
      FieldName = 'nExCodeSuppCre'
    end
    object CmnMemDataPrintExtStandardstrSuppDebDesc: TStringField
      FieldName = 'strSuppDebDesc'
      Size = 14
    end
    object CmnMemDataPrintExtStandardstrSuppCreDesc: TStringField
      FieldName = 'strSuppCreDesc'
      Size = 14
    end
    object CmnMemDataPrintExtStandardnTaxCodeSales: TIntegerField
      FieldName = 'nTaxCodeSales'
    end
    object CmnMemDataPrintExtStandardnTaxCodeStock: TIntegerField
      FieldName = 'nTaxCodeStock'
    end
    object CmnMemDataPrintExtStandardstrTaxSalesDesc: TStringField
      FieldName = 'strTaxSalesDesc'
      Size = 8
    end
    object CmnMemDataPrintExtStandardstrTaxStockDesc: TStringField
      FieldName = 'strTaxStockDesc'
      Size = 8
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
    object CmnMemDataPrintExtStandardSectionCode: TStringField
      FieldName = 'SectionCode'
    end
    object CmnMemDataPrintExtStandardSectionName: TStringField
      FieldName = 'SectionName'
    end
    object CmnMemDataPrintExtStandardstrBkExp: TStringField
      FieldName = 'strBkExp'
    end
    object CmnMemDataPrintExtStandardAllBkCd: TStringField
      FieldName = 'AllBkCd'
    end
    object CmnMemDataPrintExtStandardAllBkNm: TStringField
      FieldName = 'AllBkNm'
      Size = 78
    end
    object CmnMemDataPrintExtStandarddtUpdateDateDisp: TStringField
      FieldName = 'dtUpdateDateDisp'
    end
  end
  object CmnPipelinePrintExtStandard: TppDBPipeline
    DataSource = CmnDataSourcePrintExtStandard
    UserName = 'CmnPipelinePrintExtStandard'
    Left = 60
    Top = 356
  end
  object CmnDataSourcePrintExtStandard: TDataSource
    DataSet = CmnMemDataPrintExtStandard
    Left = 4
    Top = 356
  end
  object CmnReportExtStandardCst: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintExtStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 4999
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 4999
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 256
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
    BeforePrint = fnCommonFunctionOnBeforePrint
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
    Left = 116
    Top = 356
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'CmnPipelinePrintExtStandard'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLine50: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line42'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 33866
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground
      end
      object ppLine52: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 131234
        mmTop = 14552
        mmWidth = 1323
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel52: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
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
        mmLeft = 20902
        mmTop = 17463
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel53: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
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
        mmLeft = 70644
        mmTop = 17463
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel54: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
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
        mmLeft = 137054
        mmTop = 17463
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel55: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
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
        mmLeft = 160073
        mmTop = 17463
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel56: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label48'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #24471#24847#20808
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
        mmLeft = 173038
        mmTop = 17463
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel57: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label49'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20181#20837#20808
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
        mmLeft = 183886
        mmTop = 17463
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportExtStandardCstLabelCorpCode: TppLabel
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
        mmLeft = 16669
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportExtStandardCstLabelCorpName: TppLabel
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
        mmLeft = 33602
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportExtStandardCstLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23455#22312#21462#24341#20808#30331#37682#12522#12473#12488
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 18
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Distributed = True
        Layout = tlTop
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 136525
        mmTop = 4233
        mmWidth = 63500
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportExtStandardCstLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 8467
        mmWidth = 64558
        BandType = 0
        LayerName = Foreground
      end
      object CmnReportExtStandardCstSysVarDate: TppSystemVariable
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
        mmLeft = 244211
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel62: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label62'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21462#24341#20808#20998#39006
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
        mmLeft = 197909
        mmTop = 17463
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel63: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label63'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #24471#24847#20808#20511#26041#36039#37329#32368
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
        mmLeft = 219340
        mmTop = 15346
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel64: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label64'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20181#20837#20808#20511#26041#36039#37329#32368
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
        mmLeft = 247386
        mmTop = 15346
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel87: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label87'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = '      '#36024#26041#36039#37329#32368
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
        mmLeft = 219340
        mmTop = 19315
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground
      end
      object ppLine49: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line49'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 155047
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground
      end
      object ppLine51: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line51'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 172243
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground
      end
      object ppLine53: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line53'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 183091
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground
      end
      object ppLine137: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line137'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 193940
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground
      end
      object ppLine54: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line54'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 217752
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground
      end
      object ppLine55: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line55'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 246063
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground
      end
      object ppLine68: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line68'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 274374
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel50: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label50'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = '      '#36024#26041#36039#37329#32368
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
        mmLeft = 247386
        mmTop = 19315
        mmWidth = 25400
        BandType = 0
        LayerName = Foreground
      end
      object ppLine69: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line69'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 292893
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel51: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label51'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22770#19978#28040#36027#31246
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
        mmLeft = 275696
        mmTop = 17463
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel88: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label88'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20181#20837#28040#36027#31246
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
        mmLeft = 294482
        mmTop = 17463
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground
      end
      object ppLine24: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line24'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1058
        mmLeft = 217932
        mmTop = 18034
        mmWidth = 56515
        BandType = 0
        LayerName = Foreground
      end
      object ppLine124: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'StandardCstUnderLine1'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1058
        mmLeft = 16403
        mmTop = 21960
        mmWidth = 295540
        BandType = 0
        LayerName = Foreground
      end
      object ppLine125: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line125'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1058
        mmLeft = 16403
        mmTop = 14552
        mmWidth = 295540
        BandType = 0
        LayerName = Foreground
      end
      object ppLine126: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line126'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 16510
        mmTop = 14552
        mmWidth = 1058
        BandType = 0
        LayerName = Foreground
      end
      object ppLine127: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line127'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 310358
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground
      end
      object ppLSaiyouName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LSaiyouName'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
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
        mmLeft = 16404
        mmTop = 11113
        mmWidth = 76729
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand_StandardCst: TppDetailBand
      BeforeGenerate = ppDetailBand_StandardCstBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine57: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1058
        mmLeft = 217932
        mmTop = 3175
        mmWidth = 56515
        BandType = 4
        LayerName = Foreground
      end
      object CmnReportExtStandardCstDBTextCode: TppDBText
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
        mmLeft = 17463
        mmTop = 2646
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText95: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText86'
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
        mmLeft = 34660
        mmTop = 2647
        mmWidth = 96012
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText96: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText87'
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
        mmLeft = 132027
        mmTop = 2647
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText97: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText88'
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
        mmLeft = 155840
        mmTop = 2647
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText98: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strCustomerDesc'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 173038
        mmTop = 2647
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText99: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText90'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSupplierDesc'
        DataPipeline = CmnPipelinePrintExtStandard
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
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 183886
        mmTop = 2647
        mmWidth = 9601
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
        mmHeight = 8467
        mmLeft = 16510
        mmTop = 0
        mmWidth = 1181
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
        mmHeight = 8467
        mmLeft = 310357
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground
      end
      object ppLine60: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line34'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 131234
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground
      end
      object ppLine61: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 155046
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground
      end
      object ppLine62: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 172244
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground
      end
      object ppLine63: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line37'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 183092
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground
      end
      object ppLine64: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line38'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 33867
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText102: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText102'
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
        mmLeft = 194734
        mmTop = 2647
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText103: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText103'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExCodeCustDeb'
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
        mmLeft = 218546
        mmTop = 529
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText104: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText104'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strCustDebDesc'
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
        mmLeft = 223044
        mmTop = 529
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText106: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText106'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nTaxCodeSales'
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
        mmLeft = 275167
        mmTop = 2647
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText107: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText107'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strTaxSalesDesc'
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
        mmLeft = 279665
        mmTop = 2647
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground
      end
      object ppLine67: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line67'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 193940
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground
      end
      object ppLine70: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line70'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 217753
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground
      end
      object ppLine72: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line72'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 246063
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground
      end
      object ppStandardCstUnderLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'StandardCstUnderLine'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1058
        mmLeft = 16404
        mmTop = 7408
        mmWidth = 295540
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText93: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText93'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExCodeCustCre'
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
        mmLeft = 218546
        mmTop = 4763
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText100: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText100'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strCustCreDesc'
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
        mmLeft = 223043
        mmTop = 4763
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText101: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExCodeSuppDeb'
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
        mmLeft = 246857
        mmTop = 529
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText130: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText130'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSuppDebDesc'
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
        mmLeft = 251355
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText131: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText131'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExCodeSuppCre'
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
        mmLeft = 246857
        mmTop = 4763
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText132: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1001'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strSuppCreDesc'
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
        mmLeft = 251354
        mmTop = 4763
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground
      end
      object ppLine65: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line65'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 274373
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground
      end
      object ppLine66: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line66'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 292894
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText105: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText105'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nTaxCodeStock'
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
        mmLeft = 293688
        mmTop = 2647
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText133: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText133'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strTaxStockDesc'
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
        mmLeft = 298186
        mmTop = 2647
        mmWidth = 12700
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
        mmHeight = 3969
        mmLeft = 10583
        mmTop = 2381
        mmWidth = 4498
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
      object CmnReportExtStandardCstSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
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
        LayerName = Foreground
      end
      object CmnReportExtStandardCstAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'CmnReportExtStandardBnkAccOffice1'
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
        mmLeft = 280194
        mmTop = 529
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
  object CmnReportExtStandardBnk: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintExtStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 4999
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 4999
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 256
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
    BeforePrint = fnCommonFunctionOnBeforePrint
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
    Left = 88
    Top = 356
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'CmnPipelinePrintExtStandard'
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
      object ppLabel65: TppLabel
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
      object ppLabel66: TppLabel
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
      object ppLabel67: TppLabel
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
      object ppLabel68: TppLabel
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
      object CmnReportExtStandardBnkLabelCorpCode: TppLabel
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
        mmLeft = 16669
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground1
      end
      object CmnReportExtStandardBnkLabelCorpName: TppLabel
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
        mmLeft = 33602
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground1
      end
      object CmnReportExtStandardBnkLabelTitle: TppLabel
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
      object CmnReportExtStandardBnkLineTitle: TppLine
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
      object CmnReportExtStandardBnkSysVarDate: TppSystemVariable
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
        mmLeft = 244211
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel69: TppLabel
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
      object ppLine27: TppLine
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
      object ppLine28: TppLine
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
      object ppLine29: TppLine
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
      object ppLine30: TppLine
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
    object ppDetailBand_StandardBnk: TppDetailBand
      BeforeGenerate = ppDetailBand_StandardBnkBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppStandardBnkUnderLine: TppLine
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
      object CmnReportExtStandardBnkDBTextCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
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
        mmLeft = 181769
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object CmnReportExtStandardBnkDBTextAppDateStart: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateStart'
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
        mmLeft = 198967
        mmTop = 529
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground1
      end
      object CmnReportExtStandardBnkDBTextAppDateEnd: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText90'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateEnd'
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
      object CmnReportExtStandardBnkDBTextUpdateDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportExtStandardBnkDBTextUpdateDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDate'
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
      object CmnReportExtStandardBnkSysVarPage: TppSystemVariable
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
      object CmnReportExtStandardBnkAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'CmnReportExtStandardBnkAccOffice'
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
  object CmnReportTtlStandardCst: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintTtlStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 4999
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 4999
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 256
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
    BeforePrint = fnCommonFunctionOnBeforePrint
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
    Left = 116
    Top = 384
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'CmnPipelinePrintTtlStandard'
    object ppHeaderBand7: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLine71: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line42'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 33866
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine138: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 131234
        mmTop = 14552
        mmWidth = 1323
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel89: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        mmLeft = 20902
        mmTop = 15346
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel90: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        mmLeft = 70644
        mmTop = 15346
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel95: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        mmLeft = 137054
        mmTop = 15346
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel96: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        mmLeft = 160073
        mmTop = 15346
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel97: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label48'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21517#23492#12379
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
        mmLeft = 174361
        mmTop = 15346
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground2
      end
      object CmnReportTtlStandardCstLabelCorpCode: TppLabel
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
        mmLeft = 16669
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground2
      end
      object CmnReportTtlStandardCstLabelCorpName: TppLabel
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
        mmLeft = 33602
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground2
      end
      object CmnReportTtlStandardCstLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2910
        mmLeft = 135732
        mmTop = 7673
        mmWidth = 64294
        BandType = 0
        LayerName = Foreground2
      end
      object CmnReportTtlStandardCstSysVarDate: TppSystemVariable
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
        mmLeft = 244211
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel103: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label63'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20303'  '#25152'  '#31561
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
        mmLeft = 227013
        mmTop = 15346
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine141: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line49'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 155047
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine142: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line51'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 172243
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine144: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line137'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 186266
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine148: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line69'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4234
        mmLeft = 283635
        mmTop = 14552
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel108: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label88'
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
        mmLeft = 288396
        mmTop = 15346
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground2
      end
      object CmnReportTtlStandardCstLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'CmnReportTtlStandardCstLabelTitle'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21512#35336#21462#24341#20808#30331#37682#12522#12473#12488
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 18
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taCentered
        Transparent = True
        Distributed = True
        Layout = tlTop
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 136261
        mmTop = 3704
        mmWidth = 63500
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine120: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line120'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 16403
        mmTop = 16933
        mmWidth = 296334
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine121: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1201'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 16403
        mmTop = 14288
        mmWidth = 296334
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine122: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line122'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4498
        mmLeft = 16403
        mmTop = 14288
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine123: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line123'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4498
        mmLeft = 311415
        mmTop = 14288
        mmWidth = 1323
        BandType = 0
        LayerName = Foreground2
      end
    end
    object ppDetailBand_TtlStandardCst: TppDetailBand
      BeforeGenerate = ppDetailBand_TtlStandardCstBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine149: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1058
        mmLeft = 186532
        mmTop = 3175
        mmWidth = 97102
        BandType = 4
        LayerName = Foreground2
      end
      object CmnReportTtlStandardCstDBTextCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
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
        mmLeft = 17463
        mmTop = 2646
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText139: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText86'
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
        mmLeft = 34660
        mmTop = 2647
        mmWidth = 96012
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText140: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText87'
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
        mmLeft = 132027
        mmTop = 2647
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText141: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText88'
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
        mmLeft = 155840
        mmTop = 2647
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText142: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAdoptDesc'
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
        mmLeft = 173038
        mmTop = 2647
        mmWidth = 12802
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine150: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 16404
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine151: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line33'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 311415
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine152: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line34'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 131234
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine153: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 155046
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine154: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 172244
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine156: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line38'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 33867
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText146: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText104'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nZipCodeUpper'
        DataPipeline = CmnPipelinePrintTtlStandard
        DisplayFormat = '000'
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
        mmLeft = 191294
        mmTop = 529
        mmWidth = 4801
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine157: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line67'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 186267
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText150: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText100'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAddress'
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
        mmLeft = 187061
        mmTop = 4763
        mmWidth = 96012
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText151: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nZipCodeLower'
        DataPipeline = CmnPipelinePrintTtlStandard
        DisplayFormat = '0000'
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
        mmLeft = 197115
        mmTop = 529
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine161: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line65'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 8467
        mmLeft = 283634
        mmTop = 0
        mmWidth = 1058
        BandType = 4
        LayerName = Foreground2
      end
      object CmnReportTtlStandardCstDBTextUpdateDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText105'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDate'
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
        mmLeft = 284428
        mmTop = 2646
        mmWidth = 27203
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel98: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label98'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #12306
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
        mmLeft = 187061
        mmTop = 529
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppLabel109: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label109'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = '-'
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
        mmLeft = 195792
        mmTop = 529
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground2
      end
      object ppTtlStandardCstUnderLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line135'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 16404
        mmTop = 6350
        mmWidth = 296334
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppFooterBand7: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object CmnReportTtlStandardCstSysVarPage: TppSystemVariable
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
      object CmnReportTtlStandardCstAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'CmnReportTtlStandardBnkAccOffice1'
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
        mmLeft = 280723
        mmTop = 794
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
  object CmnReportExtStandardStf: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '1270'
      '164084')
    DataPipeline = CmnPipelinePrintExtStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 4999
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 4999
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 256
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
    BeforePrint = fnCommonFunctionOnBeforePrint
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
    Left = 76
    Top = 528
    Version = '19.04'
    mmColumnWidth = 162560
    DataPipelineName = 'CmnPipelinePrintExtStandard'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object CmnReportExtStandardStfLabelCorpCode: TppLabel
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
        mmLeft = 16669
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground3
      end
      object CmnReportExtStandardStfLabelCorpName: TppLabel
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
        mmLeft = 33602
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground3
      end
      object CmnReportExtStandardStfLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23455#22312#31038#21729#30331#37682#12522#12473#12488
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
        LayerName = Foreground3
      end
      object CmnReportExtStandardStfLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        LayerName = Foreground3
      end
      object CmnReportExtStandardStfSysVarDate: TppSystemVariable
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
        mmLeft = 244211
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground3
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppLine11: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line43'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 29104
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine12: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 62442
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine33: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line45'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 86254
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine34: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line46'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 103452
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine35: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line47'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 117475
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel42: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        mmLeft = 15875
        mmTop = 794
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel43: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label45'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #27491' '#24335' '#21517' '#31216
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
        mmLeft = 36777
        mmTop = 794
        mmWidth = 17463
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel44: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        mmLeft = 68263
        mmTop = 794
        mmWidth = 12700
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel45: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        mmLeft = 91546
        mmTop = 794
        mmWidth = 6350
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel46: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        mmLeft = 104246
        mmTop = 794
        mmWidth = 12700
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel47: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        mmLeft = 118269
        mmTop = 794
        mmWidth = 12700
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel59: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        mmLeft = 136261
        mmTop = 794
        mmWidth = 19050
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine37: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line110'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 131498
        mmTop = 0
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine31: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line31'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 11641
        mmTop = 2646
        mmWidth = 149225
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine32: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line32'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 11641
        mmTop = 0
        mmWidth = 149225
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine38: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line1'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 11641
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine81: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line81'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 159014
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground3
      end
    end
    object ppDetailBand_StandardStf: TppDetailBand
      BeforeGenerate = ppDetailBand_StandardStfBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppStandardStfUnderLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 11642
        mmTop = 2381
        mmWidth = 149225
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText85: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText86'
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
        mmLeft = 29898
        mmTop = 529
        mmWidth = 32015
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText86: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText87'
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
        mmLeft = 63236
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText87: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText88'
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
        mmLeft = 87048
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object CmnReportExtStandardStfDBTextAppDateStart: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateStart'
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
        mmLeft = 104246
        mmTop = 529
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object CmnReportExtStandardStfDBTextAppDateEnd: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText90'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateEnd'
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
        mmLeft = 118269
        mmTop = 529
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine39: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 11641
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine40: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line33'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 159015
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine41: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line34'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 62442
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine42: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 86254
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine43: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 103452
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine44: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line37'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 117475
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine45: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line38'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 29104
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground3
      end
      object CmnReportExtStandardStfDBTextUpdateDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText126'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDate'
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
        mmLeft = 132292
        mmTop = 529
        mmWidth = 27252
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine46: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line109'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 131498
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground3
      end
      object CmnReportExtStandardStfDBTextCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'CmnPipelinePrintExtStandard'
        mmHeight = 3175
        mmLeft = 12435
        mmTop = 529
        mmWidth = 15875
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
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object CmnReportExtStandardStfSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
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
        LayerName = Foreground3
      end
      object CmnReportExtStandardStfAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'CmnReportExtStandardStfAccOffice'
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
        mmTop = 1323
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
  object CmnReportExtStandardGen: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintExtStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 4999
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 4999
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 256
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
    BeforePrint = fnCommonFunctionOnBeforePrint
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
    Left = 48
    Top = 528
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'CmnPipelinePrintExtStandard'
    object ppHeaderBand5: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLine47: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line43'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 65088
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine48: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 162454
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine73: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line45'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 186267
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine74: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line46'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 203465
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine89: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line47'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 241300
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel70: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        mmLeft = 51858
        mmTop = 15346
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel73: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        mmLeft = 101336
        mmTop = 15346
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel74: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        mmLeft = 168011
        mmTop = 15346
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel75: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        mmLeft = 192088
        mmTop = 15346
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel76: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        mmLeft = 228071
        mmTop = 15346
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel77: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        mmLeft = 242094
        mmTop = 15346
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground4
      end
      object CmnReportExtStandardGenLabelCorpCode: TppLabel
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
        mmLeft = 16669
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground4
      end
      object CmnReportExtStandardGenLabelCorpName: TppLabel
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
        mmLeft = 33602
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground4
      end
      object CmnReportExtStandardGenLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23455#22312#27726#29992#35036#21161#65297#30331#37682#12522#12473#12488
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
        mmLeft = 130175
        mmTop = 3175
        mmWidth = 76200
        BandType = 0
        LayerName = Foreground4
      end
      object CmnReportExtStandardGenLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2646
        mmLeft = 129382
        mmTop = 7938
        mmWidth = 77523
        BandType = 0
        LayerName = Foreground4
      end
      object CmnReportExtStandardGenSysVarDate: TppSystemVariable
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
        mmLeft = 244211
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel102: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        mmLeft = 260351
        mmTop = 15346
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine91: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line110'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 255323
        mmTop = 14552
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine102: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line102'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 227278
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel104: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label104'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21462#24341#20808#20998#39006
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
        mmLeft = 207434
        mmTop = 15346
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine92: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line92'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 47625
        mmTop = 17198
        mmWidth = 237067
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine112: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line112'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 47625
        mmTop = 14552
        mmWidth = 237067
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine113: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line113'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 47625
        mmTop = 14552
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine114: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line114'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 282840
        mmTop = 14552
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground4
      end
    end
    object ppDetailBand_StandardGen: TppDetailBand
      BeforeGenerate = ppDetailBand_StandardGenBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppStandardGenUnderLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 47625
        mmTop = 2381
        mmWidth = 237067
        BandType = 4
        LayerName = Foreground4
      end
      object CmnReportExtStandardGenDBTextCode: TppDBText
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
        mmLeft = 48683
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText92: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText86'
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
        mmLeft = 65881
        mmTop = 529
        mmWidth = 96044
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText108: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText87'
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
        mmLeft = 163248
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText115: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText88'
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
        mmLeft = 187061
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground4
      end
      object CmnReportExtStandardGenDBTextAppDateStart: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateStart'
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
        mmLeft = 228071
        mmTop = 529
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground4
      end
      object CmnReportExtStandardGenDBTextAppDateEnd: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText90'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateEnd'
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
        mmLeft = 242094
        mmTop = 529
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine93: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 47625
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine94: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line33'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 282840
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine95: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line34'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 162454
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine96: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 186267
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine97: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 203465
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine98: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line37'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 241300
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine99: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line38'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 65088
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground4
      end
      object CmnReportExtStandardGenDBTextUpdateDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText126'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDate'
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
        mmLeft = 256117
        mmTop = 529
        mmWidth = 27252
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine100: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line109'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 255323
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText119: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText119'
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
        mmLeft = 204259
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine101: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 227278
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground4
      end
    end
    object ppFooterBand5: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object CmnReportExtStandardGenSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
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
        LayerName = Foreground4
      end
      object CmnReportExtStandardGenAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'CmnReportExtStandardStfAccOffice1'
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
        mmTop = 1323
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
  object CmnReportTtlStandardBnk: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '0'
      '167640')
    DataPipeline = CmnPipelinePrintTtlStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 4999
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 4999
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 256
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
    BeforePrint = fnCommonFunctionOnBeforePrint
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
    Left = 88
    Top = 384
    Version = '19.04'
    mmColumnWidth = 169534
    DataPipelineName = 'CmnPipelinePrintTtlStandard'
    object ppHeaderBand8: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object CmnReportTtlStandardBnkLabelCorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        mmLeft = 16669
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground5
      end
      object CmnReportTtlStandardBnkLabelCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        mmLeft = 33602
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground5
      end
      object CmnReportTtlStandardBnkLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
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
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 123561
        mmTop = 3175
        mmWidth = 88900
        BandType = 0
        LayerName = Foreground5
      end
      object CmnReportTtlStandardBnkLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2646
        mmLeft = 123031
        mmTop = 7938
        mmWidth = 89959
        BandType = 0
        LayerName = Foreground5
      end
      object CmnReportTtlStandardBnkSysVarDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        mmLeft = 244211
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground5
      end
    end
    object ppColumnHeaderBand2: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppLine103: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line43'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 24077
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground5
      end
      object ppLine104: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 89429
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground5
      end
      object ppLine105: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line45'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 113242
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground5
      end
      object ppLine106: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line46'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 130440
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground5
      end
      object ppLabel105: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        mmLeft = 10848
        mmTop = 794
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground5
      end
      object ppLabel106: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        mmLeft = 46038
        mmTop = 794
        mmWidth = 22225
        BandType = 2
        LayerName = Foreground5
      end
      object ppLabel107: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        mmLeft = 95250
        mmTop = 794
        mmWidth = 12700
        BandType = 2
        LayerName = Foreground5
      end
      object ppLabel110: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        mmLeft = 119063
        mmTop = 794
        mmWidth = 6350
        BandType = 2
        LayerName = Foreground5
      end
      object ppLabel116: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        mmLeft = 135202
        mmTop = 794
        mmWidth = 19050
        BandType = 2
        LayerName = Foreground5
      end
      object ppLine132: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line1'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 6614
        mmTop = 2646
        mmWidth = 152929
        BandType = 2
        LayerName = Foreground5
      end
      object ppLine133: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line2'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 6614
        mmTop = 0
        mmWidth = 152929
        BandType = 2
        LayerName = Foreground5
      end
      object ppLine134: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4763
        mmLeft = 6614
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground5
      end
      object ppLine135: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line4'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4498
        mmLeft = 157163
        mmTop = 0
        mmWidth = 2646
        BandType = 2
        LayerName = Foreground5
      end
    end
    object ppDetailBand_TtlStandardBnk: TppDetailBand
      BeforeGenerate = ppDetailBand_TtlStandardBnkBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppTtlStandardBnkUnderLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 6615
        mmTop = 2381
        mmWidth = 152929
        BandType = 4
        LayerName = Foreground5
      end
      object CmnReportTtlStandardBnkDBTextCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        mmLeft = 7673
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText121: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText86'
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
        mmLeft = 24871
        mmTop = 529
        mmWidth = 64029
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText122: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText87'
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
        mmLeft = 90223
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBText123: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText88'
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
        mmLeft = 114036
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine140: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 6615
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine143: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line33'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 157163
        mmTop = 0
        mmWidth = 2646
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine145: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line34'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 89429
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine146: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 113242
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine147: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 130440
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground5
      end
      object ppLine158: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'Line38'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 24077
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground5
      end
      object CmnReportTtlStandardBnkDBTextUpdateDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBText126'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDate'
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
        mmLeft = 131234
        mmTop = 529
        mmWidth = 27252
        BandType = 4
        LayerName = Foreground5
      end
      object ppDBImage4: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'DBImage4'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'grTag'
        DataPipeline = CmnPipelinePrintTtlStandard
        GraphicType = 'Bitmap'
        DataPipelineName = 'CmnPipelinePrintTtlStandard'
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 265
        mmWidth = 4498
        BandType = 4
        LayerName = Foreground5
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
    object ppFooterBand8: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object CmnReportTtlStandardBnkSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
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
        LayerName = Foreground5
      end
      object CmnReportTtlStandardBnkAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer6
        UserName = 'CmnReportTtlStandardBnkAccOffice'
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
        mmTop = 1323
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground5
      end
    end
    object ppDesignLayers6: TppDesignLayers
      object ppDesignLayer6: TppDesignLayer
        UserName = 'Foreground5'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList6: TppParameterList
    end
  end
  object CmnReportTtlStandardStf: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '0'
      '142240')
    DataPipeline = CmnPipelinePrintTtlStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 4999
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 4999
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 256
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
    BeforePrint = fnCommonFunctionOnBeforePrint
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
    Left = 76
    Top = 556
    Version = '19.04'
    mmColumnWidth = 162560
    DataPipelineName = 'CmnPipelinePrintTtlStandard'
    object ppHeaderBand9: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object CmnReportTtlStandardStfLabelCorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
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
        mmLeft = 16669
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground6
      end
      object CmnReportTtlStandardStfLabelCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
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
        mmLeft = 33602
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground6
      end
      object CmnReportTtlStandardStfLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
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
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 123561
        mmTop = 3175
        mmWidth = 88900
        BandType = 0
        LayerName = Foreground6
      end
      object CmnReportTtlStandardStfLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2646
        mmLeft = 123296
        mmTop = 7938
        mmWidth = 89165
        BandType = 0
        LayerName = Foreground6
      end
      object CmnReportTtlStandardStfSysVarDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
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
        mmLeft = 244211
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground6
      end
    end
    object ppColumnHeaderBand3: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppLine111: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line43'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 54240
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine155: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 87577
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine159: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line45'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 111390
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine162: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line46'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 128588
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel118: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
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
        mmLeft = 41010
        mmTop = 794
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel119: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Label45'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #27491' '#24335' '#21517' '#31216
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
        mmLeft = 61913
        mmTop = 794
        mmWidth = 17463
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel120: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
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
        mmLeft = 93398
        mmTop = 794
        mmWidth = 12700
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel121: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
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
        mmLeft = 116681
        mmTop = 794
        mmWidth = 6350
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel124: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
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
        mmLeft = 133879
        mmTop = 794
        mmWidth = 19050
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine128: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line128'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 36777
        mmTop = 2646
        mmWidth = 121179
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine129: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line1'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 36777
        mmTop = 0
        mmWidth = 121179
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine130: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line130'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 36777
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine131: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line131'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 155839
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground6
      end
    end
    object ppDetailBand_TtlStandardStf: TppDetailBand
      BeforeGenerate = ppDetailBand_TtlStandardStfBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppTtlStandardStfUnderLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 36777
        mmTop = 2381
        mmWidth = 121179
        BandType = 4
        LayerName = Foreground6
      end
      object CmnReportTtlStandardStfDBTextCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
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
        mmHeight = 25400
        mmLeft = 37835
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText125: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'DBText86'
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
        mmLeft = 55033
        mmTop = 529
        mmWidth = 32015
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText128: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'DBText87'
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
        mmLeft = 88371
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText143: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'DBText88'
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
        mmLeft = 112184
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine166: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 36777
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine167: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line33'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 155840
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine168: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line34'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 87577
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine169: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 111390
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine170: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 128588
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine172: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line38'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 54240
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground6
      end
      object CmnReportTtlStandardStfDBTextUpdateDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'DBText126'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDate'
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
        mmLeft = 129382
        mmTop = 529
        mmWidth = 27252
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBImage2: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'DBImage2'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'grTag'
        DataPipeline = CmnPipelinePrintTtlStandard
        GraphicType = 'Bitmap'
        DataPipelineName = 'CmnPipelinePrintTtlStandard'
        mmHeight = 3440
        mmLeft = 30163
        mmTop = 529
        mmWidth = 5292
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
    object ppFooterBand9: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object CmnReportTtlStandardStfSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
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
        LayerName = Foreground6
      end
      object CmnReportTtlStandardStfAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'CmnReportTtlStandardStfAccOffice'
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
        mmTop = 1323
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground6
      end
    end
    object ppDesignLayers7: TppDesignLayers
      object ppDesignLayer7: TppDesignLayer
        UserName = 'Foreground6'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList7: TppParameterList
    end
  end
  object CmnReportTtlStandardGen: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintTtlStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 4999
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 4999
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 256
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
    BeforePrint = fnCommonFunctionOnBeforePrint
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
    Left = 48
    Top = 556
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'CmnPipelinePrintTtlStandard'
    object ppHeaderBand10: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLine163: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line43'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 94986
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine164: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 192352
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine171: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line45'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 216165
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine173: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line46'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 233363
        mmTop = 14817
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel122: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        mmLeft = 81756
        mmTop = 15346
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel123: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        mmLeft = 131234
        mmTop = 15346
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel125: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        mmLeft = 197909
        mmTop = 15346
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel126: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        mmLeft = 221986
        mmTop = 15346
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground7
      end
      object CmnReportTtlStandardGenLabelCorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        mmLeft = 16669
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground7
      end
      object CmnReportTtlStandardGenLabelCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        mmLeft = 33602
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground7
      end
      object CmnReportTtlStandardGenLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
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
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 123561
        mmTop = 3175
        mmWidth = 88900
        BandType = 0
        LayerName = Foreground7
      end
      object CmnReportTtlStandardGenLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2646
        mmLeft = 123296
        mmTop = 7938
        mmWidth = 89165
        BandType = 0
        LayerName = Foreground7
      end
      object CmnReportTtlStandardGenSysVarDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        mmLeft = 244211
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground7
      end
      object ppLabel132: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        mmLeft = 238125
        mmTop = 15346
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine36: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line1'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 77523
        mmTop = 17198
        mmWidth = 184944
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine56: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line56'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 77523
        mmTop = 14817
        mmWidth = 184944
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine80: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line80'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 77523
        mmTop = 14817
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground7
      end
      object ppLine90: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line90'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 261143
        mmTop = 14817
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground7
      end
    end
    object ppDetailBand_TtlStandardGen: TppDetailBand
      BeforeGenerate = ppDetailBand_TtlStandardGenBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppTtlStandardGenUnderLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 77523
        mmTop = 2381
        mmWidth = 184944
        BandType = 4
        LayerName = Foreground7
      end
      object CmnReportTtlStandardGenDBTextCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        mmLeft = 78581
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText145: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText86'
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
        mmLeft = 95779
        mmTop = 529
        mmWidth = 96044
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText148: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText87'
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
        mmLeft = 193146
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText149: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText88'
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
        mmLeft = 216959
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine179: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 77523
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine180: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line33'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 261144
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine181: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line34'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 192352
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine182: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 216165
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine183: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 233363
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine185: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line38'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 94986
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground7
      end
      object CmnReportTtlStandardGenDBTextUpdateDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText126'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDate'
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
        mmLeft = 234157
        mmTop = 529
        mmWidth = 27252
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBImage3: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBImage3'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'grTag'
        DataPipeline = CmnPipelinePrintTtlStandard
        GraphicType = 'Bitmap'
        DataPipelineName = 'CmnPipelinePrintTtlStandard'
        mmHeight = 3969
        mmLeft = 71438
        mmTop = 265
        mmWidth = 5292
        BandType = 4
        LayerName = Foreground7
      end
    end
    object ppFooterBand10: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object CmnReportTtlStandardGenSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
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
        LayerName = Foreground7
      end
      object CmnReportTtlStandardGenAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'CmnReportTtlStandardStfAccOffice1'
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
        mmTop = 1323
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground7
      end
    end
    object ppDesignLayers8: TppDesignLayers
      object ppDesignLayer8: TppDesignLayer
        UserName = 'Foreground7'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList8: TppParameterList
    end
  end
  object DataSource1: TDataSource
    DataSet = CmnMemDataPrintSystem
    Left = 4
    Top = 440
  end
  object CmnMemDataPrintSystem: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 32
    Top = 440
    object StringField1: TStringField
      Alignment = taRightJustify
      FieldName = 'strExCodeDst'
      Size = 10
    end
    object StringField2: TStringField
      Alignment = taRightJustify
      FieldName = 'strExCodeSrc'
      Size = 10
    end
    object StringField3: TStringField
      FieldName = 'strNameSimpleDst'
      Size = 14
    end
    object StringField4: TStringField
      FieldName = 'strNameSimpleSrc'
      Size = 14
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource1
    UserName = 'CmnPipelinePrintSystem1'
    Left = 60
    Top = 440
    object ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'strExCodeDst'
      FieldName = 'strExCodeDst'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'strExCodeSrc'
      FieldName = 'strExCodeSrc'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'strNameSimpleDst'
      FieldName = 'strNameSimpleDst'
      FieldLength = 14
      DisplayWidth = 14
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'strNameSimpleSrc'
      FieldName = 'strNameSimpleSrc'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
  end
  object CmnReportSystem: TppReport
    AutoStop = False
    Columns = 3
    ColumnPositions.Strings = (
      '7620'
      '109220'
      '210820')
    DataPipeline = ppDBPipeline1
    OnEndPage = fnCmnReportSystemOnEndPage
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 4999
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 4999
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 256
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
    BeforePrint = fnCommonFunctionOnBeforePrint
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
    Left = 88
    Top = 440
    Version = '19.04'
    mmColumnWidth = 113022
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand11: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 15346
      mmPrintPosition = 0
      object CmnReportSystemLabelCorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
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
        mmLeft = 16669
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground8
      end
      object CmnReportSystemLabelCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
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
        mmLeft = 33602
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground8
      end
      object CmnReportSystemLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = 'XXXXXXXXXXXXXX'#20307#31995#30331#37682#12522#12473#12488
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
        mmLeft = 126207
        mmTop = 3175
        mmWidth = 88900
        BandType = 0
        LayerName = Foreground8
      end
      object CmnReportSystemLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3440
        mmLeft = 125677
        mmTop = 7144
        mmWidth = 89694
        BandType = 0
        LayerName = Foreground8
      end
      object CmnReportSystemSysVarDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
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
        mmLeft = 244211
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground8
      end
    end
    object ppColumnHeaderBand4: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppLine19: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line44'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 64558
        mmTop = 265
        mmWidth = 1852
        BandType = 2
        LayerName = Foreground8
      end
      object ppLabel12: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Label44'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21152#31639#20808#21517#31216
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
        mmLeft = 35454
        mmTop = 794
        mmWidth = 15875
        BandType = 2
        LayerName = Foreground8
      end
      object ppLabel13: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Label46'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21152#31639#20803#21517#31216
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
        mmLeft = 76200
        mmTop = 794
        mmWidth = 15875
        BandType = 2
        LayerName = Foreground8
      end
      object ppLine18: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'CmnReportSystemppLineDetailsBottom2'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 23284
        mmTop = 3175
        mmWidth = 83344
        BandType = 2
        LayerName = Foreground8
      end
      object ppLine107: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line107'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 23284
        mmTop = 0
        mmWidth = 83344
        BandType = 2
        LayerName = Foreground8
      end
      object ppLine108: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line108'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4498
        mmLeft = 23019
        mmTop = 0
        mmWidth = 1323
        BandType = 2
        LayerName = Foreground8
      end
      object ppLine119: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line119'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4498
        mmLeft = 106363
        mmTop = 0
        mmWidth = 1588
        BandType = 2
        LayerName = Foreground8
      end
    end
    object ppDetailBand_System: TppDetailBand
      BeforeGenerate = ppDetailBand_SystemBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object CmnReportSystemDBTextCodeDst: TppDBText
        OnPrint = fnCmnReportSystemppDBTextExCodeDstOnPrint
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'DBText85'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExCodeDst'
        DataPipeline = ppDBPipeline1
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
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 23813
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground8
      end
      object CmnReportSystemDBTextNameSimpleDst: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'DBText88'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimpleDst'
        DataPipeline = ppDBPipeline1
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
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground8
      end
      object CmnReportSystemDBTextCodeSrc: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'DBText135'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExCodeSrc'
        DataPipeline = ppDBPipeline1
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
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 65352
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground8
      end
      object ppDBText18: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'DBText136'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimpleSrc'
        DataPipeline = ppDBPipeline1
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
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground8
      end
      object ppLine20: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line121'
        Border.mmPadding = 0
        Pen.Style = psDot
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 40481
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground8
      end
      object ppLine21: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line129'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 64558
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground8
      end
      object ppLine22: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line132'
        Border.mmPadding = 0
        Pen.Style = psDot
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 82021
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground8
      end
      object ppLine25: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line133'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 106363
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground8
      end
      object ppLine26: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line134'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 23019
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground8
      end
      object CmnReportSystemLineDetailsBottom: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'CmnReportSystemppLineDetailsBottom'
        Border.mmPadding = 0
        Position = lpBottom
        Visible = False
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 23283
        mmTop = 2910
        mmWidth = 83344
        BandType = 4
        LayerName = Foreground8
      end
      object CmnReportSystemLineDetailsTop: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'CmnReportSystemppLineDetailsBottom1'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 23019
        mmTop = 0
        mmWidth = 83609
        BandType = 4
        LayerName = Foreground8
      end
    end
    object ppColumnFooterBand4: TppColumnFooterBand
      AlignToBottom = True
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 1323
      mmPrintPosition = 0
    end
    object ppFooterBand11: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object CmnReportSystemSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
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
        LayerName = Foreground8
      end
      object CmnReportSystemAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'CmnReportExtDetailsCstAccOffice1'
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
        mmLeft = 302155
        mmTop = 1059
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground8
      end
    end
    object ppDesignLayers9: TppDesignLayers
      object ppDesignLayer9: TppDesignLayer
        UserName = 'Foreground8'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList9: TppParameterList
    end
  end
  object CmnDataSourcePrintCsDetails: TDataSource
    DataSet = CmnMemDataPrintExtDetailsCst
    Left = 4
    Top = 412
  end
  object CmnMemDataPrintExtDetailsCst: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 32
    Top = 412
    object CmnMemDataPrintExtDetailsCstExCode: TStringField
      FieldName = 'strExCode'
      Size = 10
    end
    object CmnMemDataPrintExtDetailsCstgrTag: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object CmnMemDataPrintExtDetailsCststrAdoptDesc: TStringField
      DisplayWidth = 14
      FieldName = 'strAdoptDesc'
      Size = 14
    end
    object CmnMemDataPrintExtDetailsCstAssociation: TStringField
      DisplayWidth = 10
      FieldName = 'strAssociation'
      Size = 10
    end
    object CmnMemDataPrintExtDetailsCststrNameSimple: TStringField
      FieldName = 'strNameSimple'
      Size = 14
    end
    object CmnMemDataPrintExtDetailsCstName: TStringField
      FieldName = 'strName'
      Size = 60
    end
    object CmnMemDataPrintExtDetailsCstnZipCodeUpper: TIntegerField
      FieldName = 'nZipCodeUpper'
    end
    object CmnMemDataPrintExtDetailsCstnZipCodeLower: TIntegerField
      FieldName = 'nZipCodeLower'
    end
    object CmnMemDataPrintExtDetailsCststrAddressUpper: TStringField
      FieldName = 'strAddressUpper'
      Size = 60
    end
    object CmnMemDataPrintExtDetailsCststrAddressLower: TStringField
      FieldName = 'strAddressLower'
      Size = 60
    end
    object CmnMemDataPrintExtDetailsCststrPostName: TStringField
      FieldName = 'strPostName'
      Size = 40
    end
    object CmnMemDataPrintExtDetailsCststrChargeName: TStringField
      FieldName = 'strChargeName'
      Size = 16
    end
    object CmnMemDataPrintExtDetailsCststrRespectDesc: TStringField
      FieldName = 'strRespectDesc'
      Size = 4
    end
    object CmnMemDataPrintExtDetailsCststrTelephoneNo: TStringField
      FieldName = 'strTelephoneNo'
    end
    object CmnMemDataPrintExtDetailsCstnExCodeDebCustomer: TIntegerField
      FieldName = 'nExCodeDebCustomer'
    end
    object CmnMemDataPrintExtDetailsCststrFundDescDebCustomer: TStringField
      FieldName = 'strFundDescDebCustomer'
      Size = 14
    end
    object CmnMemDataPrintExtDetailsCstnExCodeCreCustomer: TIntegerField
      FieldName = 'nExCodeCreCustomer'
    end
    object CmnMemDataPrintExtDetailsCststrFundDescCreCustomer: TStringField
      FieldName = 'strFundDescCreCustomer'
      Size = 14
    end
    object CmnMemDataPrintExtDetailsCstnExCodeDebSupplier: TIntegerField
      FieldName = 'nExCodeDebSupplier'
    end
    object CmnMemDataPrintExtDetailsCststrFundDescDebSupplier: TStringField
      FieldName = 'strFundDescDebSupplier'
      Size = 14
    end
    object CmnMemDataPrintExtDetailsCstnExCodeCreSupplier: TIntegerField
      FieldName = 'nExCodeCreSupplier'
    end
    object CmnMemDataPrintExtDetailsCststrFundDescCreSupplier: TStringField
      FieldName = 'strFundDescCreSupplier'
      Size = 14
    end
    object CmnMemDataPrintExtDetailsCstnTaxCodeSales: TIntegerField
      FieldName = 'nTaxCodeSales'
    end
    object CmnMemDataPrintExtDetailsCststrTaxDescSales: TStringField
      FieldName = 'strTaxDescSales'
      Size = 30
    end
    object CmnMemDataPrintExtDetailsCstnTaxCodeStock: TIntegerField
      FieldName = 'nTaxCodeStock'
    end
    object CmnMemDataPrintExtDetailsCststrTaxDescStock: TStringField
      FieldName = 'strTaxDescStock'
      Size = 30
    end
    object CmnMemDataPrintExtDetailsCststrClassDesc: TStringField
      FieldName = 'strClassDesc'
      Size = 14
    end
    object CmnMemDataPrintExtDetailsCstnClosingDay01Rec: TIntegerField
      FieldName = 'nClosingDay01Rec'
    end
    object CmnMemDataPrintExtDetailsCstnClosingDay02Rec: TIntegerField
      FieldName = 'nClosingDay02Rec'
    end
    object CmnMemDataPrintExtDetailsCstnClosingDay03Rec: TIntegerField
      FieldName = 'nClosingDay03Rec'
    end
    object CmnMemDataPrintExtDetailsCststrExpectMonthDesc01Rec: TStringField
      FieldName = 'strExpectMonthDesc01Rec'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCststrExpectMonthDesc02Rec: TStringField
      FieldName = 'strExpectMonthDesc02Rec'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCststrExpectMonthDesc03Rec: TStringField
      FieldName = 'strExpectMonthDesc03Rec'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCstnExpectDay01Rec: TIntegerField
      FieldName = 'nExpectDay01Rec'
    end
    object CmnMemDataPrintExtDetailsCstnExpectDay02Rec: TIntegerField
      FieldName = 'nExpectDay02Rec'
    end
    object CmnMemDataPrintExtDetailsCstnExpectDay03Rec: TIntegerField
      FieldName = 'nExpectDay03Rec'
    end
    object CmnMemDataPrintExtDetailsCststrHolidayDesc01Rec: TStringField
      FieldName = 'strHolidayDesc01Rec'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCststrHolidayDesc02Rec: TStringField
      FieldName = 'strHolidayDesc02Rec'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCststrHolidayDesc03Rec: TStringField
      FieldName = 'strHolidayDesc03Rec'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCstnClosingDay01Pay: TIntegerField
      FieldName = 'nClosingDay01Pay'
    end
    object CmnMemDataPrintExtDetailsCstnClosingDay02Pay: TIntegerField
      FieldName = 'nClosingDay02Pay'
    end
    object CmnMemDataPrintExtDetailsCstnClosingDay03Pay: TIntegerField
      FieldName = 'nClosingDay03Pay'
    end
    object CmnMemDataPrintExtDetailsCststrExpectMonthDesc01Pay: TStringField
      FieldName = 'strExpectMonthDesc01Pay'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCststrExpectMonthDesc02Pay: TStringField
      FieldName = 'strExpectMonthDesc02Pay'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCststrExpectMonthDesc03Pay: TStringField
      FieldName = 'strExpectMonthDesc03Pay'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCstnExpectDay01Pay: TIntegerField
      FieldName = 'nExpectDay01Pay'
    end
    object CmnMemDataPrintExtDetailsCstnExpectDay02Pay: TIntegerField
      FieldName = 'nExpectDay02Pay'
    end
    object CmnMemDataPrintExtDetailsCstnExpectDay03Pay: TIntegerField
      FieldName = 'nExpectDay03Pay'
    end
    object CmnMemDataPrintExtDetailsCststrHolidayDesc01Pay: TStringField
      FieldName = 'strHolidayDesc01Pay'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCststrHolidayDesc02Pay: TStringField
      FieldName = 'strHolidayDesc02Pay'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCststrHolidayDesc03Pay: TStringField
      FieldName = 'strHolidayDesc03Pay'
      Size = 8
    end
    object CmnMemDataPrintExtDetailsCstdtAppDateStart: TDateField
      FieldName = 'dtAppDateStart'
    end
    object CmnMemDataPrintExtDetailsCstdtAppDateEnd: TDateField
      FieldName = 'dtAppDateEnd'
    end
    object CmnMemDataPrintExtDetailsCstdtUpdateDate: TDateTimeField
      FieldName = 'dtUpdateDate'
    end
    object CmnMemDataPrintExtDetailsCststrDraftRank: TStringField
      FieldName = 'strDraftRank'
      Size = 1
    end
    object CmnMemDataPrintExtDetailsCststrClearHouse01: TStringField
      DisplayWidth = 40
      FieldName = 'strClearHouse01'
      Size = 40
    end
    object CmnMemDataPrintExtDetailsCststrClearHouse02: TStringField
      DisplayWidth = 40
      FieldName = 'strClearHouse02'
      Size = 40
    end
    object CmnMemDataPrintExtDetailsCststrClearHouse03: TStringField
      DisplayWidth = 40
      FieldName = 'strClearHouse03'
      Size = 40
    end
    object CmnMemDataPrintExtDetailsCststrDrawerDraft01: TStringField
      FieldName = 'strDrawerDraft01'
      Size = 40
    end
    object CmnMemDataPrintExtDetailsCststrDrawerDraft02: TStringField
      FieldName = 'strDrawerDraft02'
      Size = 40
    end
    object CmnMemDataPrintExtDetailsCststrDrawerDraft03: TStringField
      FieldName = 'strDrawerDraft03'
      Size = 40
    end
    object CmnMemDataPrintExtDetailsCststrDrawerDraft04: TStringField
      FieldName = 'strDrawerDraft04'
      Size = 40
    end
    object CmnMemDataPrintExtDetailsCststrDrawerDraft05: TStringField
      FieldName = 'strDrawerDraft05'
      Size = 40
    end
    object CmnMemDataPrintExtDetailsCstnLimitPrice: TCurrencyField
      DisplayWidth = 15
      FieldName = 'nLimitPrice'
    end
  end
  object CmnPipelinePrintCsDetails: TppDBPipeline
    DataSource = CmnDataSourcePrintCsDetails
    UserName = 'CmnPipelinePrintCsDetails'
    Left = 60
    Top = 412
  end
  object CmnReportExtDetailsCst: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintCsDetails
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4 (JIS)'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 4999
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 256911
    PrinterSetup.mmPaperWidth = 364067
    PrinterSetup.PaperSize = 256
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
    BeforePrint = fnCommonFunctionOnBeforePrint
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
    Left = 88
    Top = 412
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'CmnPipelinePrintCsDetails'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object CmnReportExtDetailsCstLabelCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'CmnReportExtDetailsCstLabelCorpName'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'CmnReportExtDetailsCstLabelCorpName'
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
        mmLeft = 30692
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground9
      end
      object CmnReportExtDetailsCstLabelCorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'CmnReportExtDetailsCstLabelCorpCode'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'CmnReportExtDetailsCstLabelCorpCode'
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
        mmLeft = 13495
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground9
      end
      object CmnReportExtDetailsCstSysVarDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'CmnReportExtDetailsCstSysVarDate'
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
        mmLeft = 271728
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground9
      end
      object CmnReportExtDetailsCstLineTitle: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'CmnReportExtDetailsCstLineTitle'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 150019
        mmTop = 7144
        mmWidth = 63500
        BandType = 0
        LayerName = Foreground9
      end
      object CmnReportExtDetailsCstLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'CmnReportExtDetailsCstLabelTitle'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #23455#22312#21462#24341#20808#30331#37682#12522#12473#12488
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
        mmLeft = 150019
        mmTop = 2117
        mmWidth = 63500
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine5: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7938
        mmLeft = 112448
        mmTop = 14288
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine6: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line6'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7938
        mmLeft = 170392
        mmTop = 14288
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine7: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 7938
        mmLeft = 232569
        mmTop = 14288
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25163'  '#24418'  '#24773'  '#22577
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
        mmLeft = 262467
        mmTop = 16933
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #36039#37329#32368#65295#28040#36027#31246
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
        mmLeft = 130704
        mmTop = 16933
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21462'   '#24341'   '#20808'   '#24773'   '#22577
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
        mmLeft = 44186
        mmTop = 16933
        mmWidth = 34925
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine8: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line8'
        Border.mmPadding = 0
        Pen.Width = 0
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 170392
        mmTop = 18256
        mmWidth = 62442
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel4: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #32224' '#26085' '#24773' '#22577
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
        mmLeft = 191823
        mmTop = 14817
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel5: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #32224#26085
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
        mmLeft = 187061
        mmTop = 18785
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel6: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label6'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20104#23450#26376#26085
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
        mmTop = 18785
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground9
      end
      object ppLabel7: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label7'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20241#26085#21306#20998
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
        mmLeft = 218546
        mmTop = 18785
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine15: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line15'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 18521
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine16: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line16'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3704
        mmLeft = 193940
        mmTop = 18521
        mmWidth = 1323
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine17: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line17'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3704
        mmLeft = 216959
        mmTop = 18521
        mmWidth = 1323
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine115: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line115'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 13494
        mmTop = 21167
        mmWidth = 326232
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine116: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line116'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 13495
        mmTop = 14288
        mmWidth = 326233
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine117: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line117'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 7938
        mmLeft = 13495
        mmTop = 14288
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground9
      end
      object ppLine118: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line118'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 8128
        mmLeft = 338403
        mmTop = 14288
        mmWidth = 1588
        BandType = 0
        LayerName = Foreground9
      end
      object ppLSaiyouName2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label11'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
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
        mmHeight = 3440
        mmLeft = 13494
        mmTop = 10583
        mmWidth = 67998
        BandType = 0
        LayerName = Foreground9
      end
    end
    object ppDetailBand_ExtDetailsCst: TppDetailBand
      BeforeGenerate = ppDetailBand_ExtDetailsCstBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object CmnReportExtDetailsCstDBTextCode: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'CmnReportExtDetailsCstDBTextCode'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExCode'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 14817
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strName'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 14817
        mmTop = 8467
        mmWidth = 96044
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText3: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strNameSimple'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 32279
        mmTop = 4498
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText4: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAssociation'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 14817
        mmTop = 4498
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground9
      end
      object ppLine2: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line2'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 32279
        mmLeft = 13494
        mmTop = 0
        mmWidth = 1058
        BandType = 4
        LayerName = Foreground9
      end
      object ppLine3: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line3'
        Border.mmPadding = 0
        Position = lpRight
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 32279
        mmLeft = 338329
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground9
      end
      object ppLine4: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 32015
        mmLeft = 112448
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText13: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText13'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExCodeCreCustomer'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 141552
        mmTop = 4498
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText15: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText15'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExCodeDebSupplier'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 141552
        mmTop = 8467
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText16: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText16'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strTaxDescSales'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 16404
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText19: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText19'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strFundDescCreCustomer'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 4498
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText20: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText20'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strFundDescDebCustomer'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText21: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText21'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExCodeDebCustomer'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 141552
        mmTop = 529
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText23: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText23'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strTaxDescStock'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 20373
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText24: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText24'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExCodeCreSupplier'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 141552
        mmTop = 12435
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText27: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText27'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strFundDescDebSupplier'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 8467
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText28: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText201'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strFundDescCreSupplier'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 12435
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground9
      end
      object ppLine23: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line23'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 32279
        mmLeft = 170392
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText29: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText29'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAddressUpper'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 14817
        mmTop = 16404
        mmWidth = 96044
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText30: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText30'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAddressLower'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 14817
        mmTop = 20373
        mmWidth = 96044
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText31: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText28'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strClassDesc'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 141552
        mmTop = 24342
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText32: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText31'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strPostName'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 24342
        mmWidth = 64029
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText33: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText32'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strChargeName'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 28310
        mmWidth = 25665
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText34: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText33'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strClearHouse02'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 252413
        mmTop = 4498
        mmWidth = 64028
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText35: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText35'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strClearHouse03'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 252413
        mmTop = 8467
        mmWidth = 64028
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText36: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText36'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strClearHouse01'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 252413
        mmTop = 529
        mmWidth = 64028
        BandType = 4
        LayerName = Foreground9
      end
      object ppLine1: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 32279
        mmLeft = 232569
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText38: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText38'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strDrawerDraft01'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 252413
        mmTop = 12435
        mmWidth = 64029
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText39: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText39'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strDrawerDraft02'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 252413
        mmTop = 16404
        mmWidth = 64029
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText40: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText40'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strDrawerDraft03'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 252413
        mmTop = 20373
        mmWidth = 64029
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText41: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText41'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strDrawerDraft04'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 252413
        mmTop = 24342
        mmWidth = 64029
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel28: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label28'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25163#24418#12521#12531#12463
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
        mmLeft = 318559
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText42: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText42'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strDraftRank'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 335757
        mmTop = 529
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText43: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText34'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strRespectDesc'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 57679
        mmTop = 28310
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel26: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label26'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12306
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
        mmHeight = 3440
        mmLeft = 14817
        mmTop = 12435
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText44: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText44'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nZipCodeUpper'
        DataPipeline = CmnPipelinePrintCsDetails
        DisplayFormat = '000'
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 17992
        mmTop = 12435
        mmWidth = 4763
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel27: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label27'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = '-'
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
        mmHeight = 3440
        mmLeft = 22754
        mmTop = 12435
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText45: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText45'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nZipCodeLower'
        DataPipeline = CmnPipelinePrintCsDetails
        DisplayFormat = '0000'
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 24342
        mmTop = 12435
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText46: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText46'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strTelephoneNo'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 78581
        mmTop = 28310
        mmWidth = 32015
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel29: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label29'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #38651#35441
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
        mmLeft = 70908
        mmTop = 28310
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText47: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText47'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nClosingDay01Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 187061
        mmTop = 529
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText48: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText48'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nClosingDay02Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 187061
        mmTop = 4498
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText49: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText49'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nClosingDay03Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 187061
        mmTop = 8467
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel30: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label30'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 190236
        mmTop = 529
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel31: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label301'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 190236
        mmTop = 4498
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel32: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label32'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 190236
        mmTop = 8467
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText51: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText101'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExpectMonthDesc01Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 195263
        mmTop = 529
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText53: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText53'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExpectMonthDesc02Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 195263
        mmTop = 4498
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText55: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText55'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExpectMonthDesc03Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 195263
        mmTop = 8467
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText56: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText56'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExpectDay01Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 210080
        mmTop = 529
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel33: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label302'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 213255
        mmTop = 529
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText57: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText57'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExpectDay02Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 210080
        mmTop = 4498
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel34: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label34'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 213255
        mmTop = 4498
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText58: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText58'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExpectDay03Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 210080
        mmTop = 8467
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel35: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label35'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 213255
        mmTop = 8467
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText60: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText60'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExpectMonthDesc01Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 195263
        mmTop = 12435
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText62: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText62'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExpectMonthDesc02Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 195263
        mmTop = 16404
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText64: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText64'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strExpectMonthDesc03Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 195263
        mmTop = 20373
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText65: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText65'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nClosingDay01Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 187061
        mmTop = 12435
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText66: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText66'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nClosingDay02Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 187061
        mmTop = 16404
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText67: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText67'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nClosingDay03Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 187061
        mmTop = 20373
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel36: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label303'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 190236
        mmTop = 12435
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel37: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label37'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 190236
        mmTop = 16404
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel38: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label38'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 190236
        mmTop = 20373
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText71: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText71'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHolidayDesc01Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 218017
        mmTop = 529
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText72: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText72'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHolidayDesc02Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 218017
        mmTop = 4498
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText73: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText73'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHolidayDesc03Rec'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 218017
        mmTop = 8467
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText74: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText74'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExpectDay01Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 210080
        mmTop = 12435
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText75: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText75'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExpectDay02Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 210080
        mmTop = 16404
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText76: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText76'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExpectDay03Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 210080
        mmTop = 20373
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel39: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label39'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 213255
        mmTop = 12435
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel40: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label40'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 213255
        mmTop = 16404
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel41: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label41'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26085
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
        mmHeight = 3440
        mmLeft = 213255
        mmTop = 20373
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText80: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText601'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHolidayDesc01Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 218017
        mmTop = 12435
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText81: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText81'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHolidayDesc02Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 218017
        mmTop = 16404
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText82: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText82'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strHolidayDesc03Pay'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 218017
        mmTop = 20373
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground9
      end
      object ppExtDetailsCstUnderLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line13'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 13494
        mmTop = 30956
        mmWidth = 326233
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText5: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strDrawerDraft05'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 252413
        mmTop = 28310
        mmWidth = 64029
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText6: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText6'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nTaxCodeSales'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 141552
        mmTop = 16404
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText7: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText7'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nTaxCodeStock'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3440
        mmLeft = 141552
        mmTop = 20373
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText8: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText8'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nLimitPrice'
        DataPipeline = CmnPipelinePrintCsDetails
        DisplayFormat = '   ,   ,   ,   ,   0'
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 141552
        mmTop = 28310
        mmWidth = 24077
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel21: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label21'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #24471#24847#20808#20511#26041#36039#37329#32368
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
        mmTop = 529
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel22: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label22'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = '      '#36024#26041#36039#37329#32368
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
        mmTop = 4498
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel23: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label23'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20181#20837#20808#20511#26041#36039#37329#32368
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
        mmTop = 8467
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel24: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label24'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = '      '#36024#26041#36039#37329#32368
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
        mmTop = 12435
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel25: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label25'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22770#19978#28040#36027#31246
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
        mmTop = 16404
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel127: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label127'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20181#20837#28040#36027#31246
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
        mmTop = 20373
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel128: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label128'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #21462#24341#20808#20998#39006
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
        mmTop = 24342
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel133: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label133'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #19982#20449#38480#24230#38989
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
        mmTop = 28310
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel134: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label134'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20837#37329#26085#65297
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
        mmLeft = 171715
        mmTop = 529
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel135: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label135'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20837#37329#26085#65298
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
        mmLeft = 171715
        mmTop = 4498
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel136: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label136'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20837#37329#26085#65299
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
        mmLeft = 171715
        mmTop = 8467
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel137: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label137'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25903#25173#26085#65297
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
        mmLeft = 171715
        mmTop = 12435
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel138: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label138'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25903#25173#26085#65298
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
        mmLeft = 171715
        mmTop = 16404
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel139: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label139'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25903#25173#26085#65299
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
        mmLeft = 171715
        mmTop = 20373
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel140: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label140'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #36969#29992#26399#38291
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
        mmLeft = 171715
        mmTop = 24342
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel141: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label141'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #26356#26032#26085#26178
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
        mmLeft = 171715
        mmTop = 28310
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel142: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label142'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25903#25173#22580#25152#65297
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
        mmLeft = 233892
        mmTop = 529
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel143: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label143'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25903#25173#22580#25152#65298
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
        mmLeft = 233892
        mmTop = 4498
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel144: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label144'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25903#25173#22580#25152#65299
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
        mmLeft = 233892
        mmTop = 8467
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel145: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label145'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25391#20986#20154#65297
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
        mmLeft = 233892
        mmTop = 12435
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel146: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label146'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25391#20986#20154#65298
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
        mmLeft = 233892
        mmTop = 16404
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel147: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label147'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25391#20986#20154#65299
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
        mmLeft = 233892
        mmTop = 20373
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel148: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label1401'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25391#20986#20154#65300
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
        mmLeft = 233892
        mmTop = 24342
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel149: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label149'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25391#20986#20154#65301
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
        mmLeft = 233892
        mmTop = 28310
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLine9: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line9'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 32279
        mmLeft = 185738
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground9
      end
      object ppLine10: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line10'
        Border.mmPadding = 0
        Pen.Width = 0
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 170392
        mmTop = 23813
        mmWidth = 62442
        BandType = 4
        LayerName = Foreground9
      end
      object ppLine13: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 23813
        mmLeft = 193940
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground9
      end
      object ppLine14: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Line14'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 23813
        mmLeft = 216959
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground9
      end
      object CmnReportExtDetailsCstDBTextUpdateDate: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'CmnReportExtDetailsCstDBTextUpdateDate'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtUpdateDate'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 187061
        mmTop = 28310
        mmWidth = 27252
        BandType = 4
        LayerName = Foreground9
      end
      object CmnReportExtDetailsCstDBTextAppDateStart: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'CmnReportExtDetailsCstDBTextAppDateStart'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateStart'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 187061
        mmTop = 24342
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel8: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label8'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #65374
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
        mmHeight = 3440
        mmLeft = 200819
        mmTop = 24342
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground9
      end
      object CmnReportExtDetailsCstDBTextAppDateEnd: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText108'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'dtAppDateEnd'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 205317
        mmTop = 24342
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel9: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label9'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25964#31216
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
        mmLeft = 49742
        mmTop = 28310
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel10: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label10'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #37096#32626
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
        mmLeft = 14817
        mmTop = 24342
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground9
      end
      object ppLabel11: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'Label101'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25285#24403
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
        mmLeft = 14817
        mmTop = 28310
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBImage5: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBImage5'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'grTag'
        DataPipeline = CmnPipelinePrintCsDetails
        GraphicType = 'Bitmap'
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 265
        mmWidth = 3969
        BandType = 4
        LayerName = Foreground9
      end
      object ppDBText9: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'DBText9'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strAdoptDesc'
        DataPipeline = CmnPipelinePrintCsDetails
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
        DataPipelineName = 'CmnPipelinePrintCsDetails'
        mmHeight = 3175
        mmLeft = 46302
        mmTop = 529
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground9
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object CmnReportExtDetailsCstSysVarPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'CmnReportExtDetailsCstSysVarPage'
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
        mmLeft = 159279
        mmTop = 529
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground9
      end
      object CmnReportExtDetailsCstAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer10
        UserName = 'CmnReportExtDetailsCstAccOffice'
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
        mmLeft = 307711
        mmTop = 529
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground9
      end
    end
    object ppDesignLayers10: TppDesignLayers
      object ppDesignLayer10: TppDesignLayer
        UserName = 'Foreground9'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList10: TppParameterList
    end
  end
  object CmnDataSourcePrintTtlStandard: TDataSource
    DataSet = CmnMemDataPrintTtlStandard
    Left = 4
    Top = 384
  end
  object CmnMemDataPrintTtlStandard: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 32
    Top = 384
    object GraphicField1: TGraphicField
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object StringField5: TStringField
      FieldName = 'strExCode'
      Size = 10
    end
    object StringField6: TStringField
      FieldName = 'strName'
      Size = 60
    end
    object StringField7: TStringField
      FieldName = 'strNameSimple'
      Size = 14
    end
    object StringField8: TStringField
      FieldName = 'strAssociation'
      Size = 10
    end
    object CmnMemDataPrintTtlStandardstrAdoptDesc: TStringField
      FieldName = 'strAdoptDesc'
      Size = 8
    end
    object CmnMemDataPrintTtlStandardstrAddress: TStringField
      FieldName = 'strAddress'
      Size = 60
    end
    object CmnMemDataPrintTtlStandardnZipCodeUpper: TIntegerField
      FieldName = 'nZipCodeUpper'
    end
    object CmnMemDataPrintTtlStandardnZipCodeLower: TIntegerField
      FieldName = 'nZipCodeLower'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'dtUpdateDate'
    end
  end
  object CmnPipelinePrintTtlStandard: TppDBPipeline
    DataSource = CmnDataSourcePrintTtlStandard
    UserName = 'CmnPipelinePrintStandard1'
    Left = 60
    Top = 384
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
      FieldAlias = 'strAdoptDesc'
      FieldName = 'strAdoptDesc'
      FieldLength = 8
      DisplayWidth = 8
      Position = 6
    end
    object CmnPipelinePrintTtlStandardppField8: TppField
      FieldAlias = 'strAddress'
      FieldName = 'strAddress'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object CmnPipelinePrintTtlStandardppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'nZipCodeUpper'
      FieldName = 'nZipCodeUpper'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object CmnPipelinePrintTtlStandardppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'nZipCodeLower'
      FieldName = 'nZipCodeLower'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object CmnPipelinePrintTtlStandardppField11: TppField
      FieldAlias = 'dtUpdateDate'
      FieldName = 'dtUpdateDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
  end
  object DtlCmnPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = fnDtlCmnPopupMenuOnPopup
    Left = 64
    Top = 156
    object DtlCmnPopupMenuTagOff: TMenuItem
      Caption = #12399#12364#12377'(&D)'
      OnClick = fnDtlCmnPopupMenuTagOnClick
    end
    object DtlCmnPopupMenuTagComment: TMenuItem
      Caption = #20633#32771#20462#27491'(&U)...'
      OnClick = fnDtlCmnPopupMenuTagOnClickEx
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object DtlCmnPopupMenuTag01: TMenuItem
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
      object DtlCmnPopupMenuItemTag01: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnDtlCmnPopupMenuTagOnClick
      end
      object DtlCmnPopupMenuItemTag01Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnDtlCmnPopupMenuTagOnClickEx
      end
    end
    object DtlCmnPopupMenuTag02: TMenuItem
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
      object DtlCmnPopupMenuItemTag02: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnDtlCmnPopupMenuTagOnClick
      end
      object DtlCmnPopupMenuItemTag02Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnDtlCmnPopupMenuTagOnClickEx
      end
    end
    object DtlCmnPopupMenuTag03: TMenuItem
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
      object DtlCmnPopupMenuItemTag03: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnDtlCmnPopupMenuTagOnClick
      end
      object DtlCmnPopupMenuItemTag03Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnDtlCmnPopupMenuTagOnClickEx
      end
    end
    object DtlCmnPopupMenuTag04: TMenuItem
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
      object DtlCmnPopupMenuItemTag04: TMenuItem
        Caption = #20633#32771#28961#12375'(&N)'
        OnClick = fnDtlCmnPopupMenuTagOnClick
      end
      object DtlCmnPopupMenuItemTag04Ex: TMenuItem
        Caption = #20633#32771#26377#12426'(&O)...'
        OnClick = fnDtlCmnPopupMenuTagOnClickEx
      end
    end
  end
  object CmnToolbarDropDownMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 92
    Top = 156
    object CmnToolbarDropDownMenuTag01: TMenuItem
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
      OnClick = fnCmnToolbarDropDownMenuItemOnClick
    end
    object CmnToolbarDropDownMenuTag02: TMenuItem
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
      OnClick = fnCmnToolbarDropDownMenuItemOnClick
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
      OnClick = fnCmnToolbarDropDownMenuItemOnClick
    end
    object CmnToolbarDropDownMenuTag04: TMenuItem
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
      OnClick = fnCmnToolbarDropDownMenuItemOnClick
    end
  end
  object CmnToolbarImage: TImageList
    Height = 15
    Left = 284
    Top = 152
    Bitmap = {
      494C010105000900040010000F00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000800700000000000080030000000000008001000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      8001000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      8007800780078007800380038003800380018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      00000000000000000000000000000000000000000000}
  end
  object dxMBankInfo: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 80
    Top = 96
    object dxMBankInfoNCode: TCurrencyField
      FieldName = 'NCode'
    end
    object dxMBankInfoHojyoNCode: TCurrencyField
      FieldName = 'HojyoNCode'
    end
    object dxMBankInfoAllBkCode: TIntegerField
      FieldName = 'AllBkCode'
    end
    object dxMBankInfoAllBraCode: TIntegerField
      FieldName = 'AllBraCode'
    end
    object dxMBankInfoBankName: TStringField
      FieldName = 'BankName'
      Size = 30
    end
    object dxMBankInfoBkBraName: TStringField
      FieldName = 'BkBraName'
      Size = 30
    end
    object dxMBankInfoBkCode: TStringField
      FieldName = 'BkCode'
      Size = 10
    end
    object dxMBankInfoBkName: TStringField
      FieldName = 'BkName'
      Size = 40
    end
  end
  object MQMaSel: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      'SELECT GCode,NCode FROM HojyoMA'
      'WHERE'
      'GCode=:sGCode AND'
      'MasterKbn=:nMasterKbn AND'
      'SumKbn=:nSumKbn AND'
      'RDelKbn=0')
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 23
    Top = 257
    ParamData = <
      item
        Name = 'sGCode'
      end
      item
        Name = 'nMasterKbn'
      end
      item
        Name = 'nSumKbn'
      end>
  end
  object MQMaDetailIns: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      'INSERT INTO HojyoMA'
      '(MasterKbn,SumKbn,GCode,Renso,LongName,SimpleName,BankNCode,'
      'LimitSum,RDelKbn,UpdTantoNCode,TStartDate,TEndDate,'
      
        'BunruiNCode1,BunruiNCode2,BunruiNCode3,BunruiNCode4,BunruiNCode5' +
        ','
      
        'BunruiNCode6,BunruiNCode7,BunruiNCode8,BunruiNCode9,BunruiNCode1' +
        '0,'
      'SegNCode1,SegNCode2,SegNCode3,SegNCode4,SegNCode5,'
      'SegNCode6,SegNCode7,SegNCode8,SegNCode9,SegNCode10'
      ')'
      ''
      'VALUES'
      
        '(:MasterKbn,:SumKbn,:GCode,:Renso,:LongName,:SimpleName,:BankNCo' +
        'de,'
      '0,:RDelKbn,:UpdTantoNCode,:TStartDate,:TEndDate,'
      
        ':BunruiNCode1,:BunruiNCode2,:BunruiNCode3,:BunruiNCode4,:BunruiN' +
        'Code5,'
      
        ':BunruiNCode6,:BunruiNCode7,:BunruiNCode8,:BunruiNCode9,:BunruiN' +
        'Code10,'
      ':SegNCode1,:SegNCode2,:SegNCode3,:SegNCode4,:SegNCode5,'
      ':SegNCode6,:SegNCode7,:SegNCode8,:SegNCode9,:SegNCode10)')
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 227
    Top = 493
    ParamData = <
      item
        Name = 'MasterKbn'
      end
      item
        Name = 'SumKbn'
      end
      item
        Name = 'GCode'
      end
      item
        Name = 'Renso'
      end
      item
        Name = 'LongName'
      end
      item
        Name = 'SimpleName'
      end
      item
        Name = 'BankNCode'
      end
      item
        Name = 'RDelKbn'
      end
      item
        Name = 'UpdTantoNCode'
      end
      item
        Name = 'TStartDate'
      end
      item
        Name = 'TEndDate'
      end
      item
        Name = 'BunruiNCode1'
      end
      item
        Name = 'BunruiNCode2'
      end
      item
        Name = 'BunruiNCode3'
      end
      item
        Name = 'BunruiNCode4'
      end
      item
        Name = 'BunruiNCode5'
      end
      item
        Name = 'BunruiNCode6'
      end
      item
        Name = 'BunruiNCode7'
      end
      item
        Name = 'BunruiNCode8'
      end
      item
        Name = 'BunruiNCode9'
      end
      item
        Name = 'BunruiNCode10'
      end
      item
        Name = 'SegNCode1'
      end
      item
        Name = 'SegNCode2'
      end
      item
        Name = 'SegNCode3'
      end
      item
        Name = 'SegNCode4'
      end
      item
        Name = 'SegNCode5'
      end
      item
        Name = 'SegNCode6'
      end
      item
        Name = 'SegNCode7'
      end
      item
        Name = 'SegNCode8'
      end
      item
        Name = 'SegNCode9'
      end
      item
        Name = 'SegNCode10'
      end>
  end
  object MQMaDetailUpd: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 227
    Top = 537
  end
  object MQTreeSel: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      'SELECT * FROM HojyoTree'
      'WHERE MasterKbn=:nMasterKbn AND'
      'SumNCode=:cSumNCode AND'
      'BasedNCode=:cBasedNCode')
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 131
    Top = 249
    ParamData = <
      item
        Name = 'nMasterKbn'
      end
      item
        Name = 'cSumNCode'
      end
      item
        Name = 'cBasedNCode'
      end>
  end
  object MQTreeIns: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      'INSERT INTO HojyoTree'
      
        '(MasterKbn, PatternNo, SumNCode, EntNo, BasedNCode, UpdTantoNCod' +
        'e)'
      'VALUES'
      
        '(:nMasterKbn, 0, :cSumNCode, :nEntNo, :cBasedNCode, :cUpdTantoNC' +
        'ode)')
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 635
    Top = 1
    ParamData = <
      item
        Name = 'nMasterKbn'
      end
      item
        Name = 'cSumNCode'
      end
      item
        Name = 'nEntNo'
      end
      item
        Name = 'cBasedNCode'
      end
      item
        Name = 'cUpdTantoNCode'
      end>
  end
  object MQTreeEntNo: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      'SELECT EntNo FROM HojyoTree'
      'WHERE  MasterKbn=:nMasterKbn AND SumNCode=:cDstExCode'
      'ORDER BY EntNo DESC'
      '')
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 131
    Top = 293
    ParamData = <
      item
        Name = 'nMasterKbn'
      end
      item
        Name = 'cDstExCode'
      end>
  end
  object MQTreeCount: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      'SELECT Count(*) as Count from HojyoTree'
      'where  MasterKbn = :MKbn'
      '')
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 347
    Top = 537
    ParamData = <
      item
        Name = 'MKbn'
      end>
  end
  object MQTreeSortRead: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      
        'SELECT hm1.GCode, hm2.GCode, ht.SumNCode, ht.BasedNCode, ht.EntN' +
        'o'
      'FROM HojyoTree AS ht'
      'LEFT OUTER JOIN HojyoMA as hm1 ON (hm1.NCode=ht.SumNCode)'
      'LEFT OUTER JOIN HojyoMA as hm2 ON (hm1.NCode=ht.BasedNCode)'
      'WHERE ht.MasterKbn=:Mkbn'
      'Order By hm1.GCode, hm2.GCode, ht.EntNo')
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 423
    Top = 490
    ParamData = <
      item
        Name = 'Mkbn'
      end>
  end
  object MQTreeSortWrite: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      'UPDATE HojyoTree SET'
      'EntNo = :EntNo'
      'where'
      '    MasterKbn  =:MKbn'
      'and SumNCode   =:SCode'
      'and BasedNCode =:BCode')
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 326
    Top = 491
    ParamData = <
      item
        Name = 'EntNo'
      end
      item
        Name = 'MKbn'
      end
      item
        Name = 'SCode'
      end
      item
        Name = 'BCode'
      end>
  end
  object MQMaSortRead: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      'SELECT '
      'ht.BasedNCode AS NCode, '
      'ht.EntNo,'
      'ht.SumNCode,'
      'ht.BasedNCode,'
      'MA1.GCode AS SumGCode,'
      'MA2.SumKbn,'
      'MA2.GCode AS BasedGCode'
      ''
      'FROM HojyoTree AS ht'
      'LEFT OUTER JOIN HojyoMA MA1 ON'
      
        '(ht.SumNCode = MA1.NCode AND ht.MasterKbn=MA1.MasterKbn AND MA1.' +
        'RDelKbn=0)'
      'LEFT OUTER JOIN HojyoMA MA2 ON'
      
        '(ht.BasedNCode = MA2.NCode AND ht.MasterKbn=MA2.MasterKbn AND MA' +
        '2.RDelKbn=0)'
      'WHERE ht.MasterKbn=:MKbn'
      'Order By MA1.GCode, MA2.SumKbn, MA2.GCode, ht.EntNo')
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 818
    Top = 65535
    ParamData = <
      item
        Name = 'MKbn'
      end>
  end
  object MQMaSortWrite: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      'UPDATE HojyoTree SET EntNo=:NewEntNo'
      'WHERE BasedNCode=:cNCode ')
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 524
    Top = 36
    ParamData = <
      item
        Name = 'NewEntNo'
      end
      item
        Name = 'cNCode'
      end>
  end
  object QryBankInfo: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
    ResourceOptions.AssignedValues = [rvDirectExecute]
    ResourceOptions.DirectExecute = True
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode]
    SQL.Strings = (
      'select NCode, BankName, BkBraName from BankInfo'
      'where AllBkCode=:AllBkCode and AllBraCode=:AllBraCode '
      'and MasterKbn=21 and RDelKbn=0')
    MakeSQL = True
    LockRow = False
    AutoRefresh = True
    RequestLive = True
    UpdateMode = upWhereKeyOnly
    Left = 131
    Top = 205
    ParamData = <
      item
        Name = 'AllBkCode'
      end
      item
        Name = 'AllBraCode'
      end>
  end
  object aclExec: TActionList
    Left = 21
    Top = 306
    object FreeSetHojyo: TAction
      Category = 'Function'
      Caption = #65420#65432#65392#38917#30446
      OnExecute = FreeSetHojyoExecute
    end
  end
  object CmnMemDataPrintSegBun: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 180
    Top = 536
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
    object CmnMemDataPrintSegBunstrSeg06Code: TStringField
      FieldName = 'strSeg06Code'
    end
    object CmnMemDataPrintSegBunstrSeg07Code: TStringField
      FieldName = 'strSeg07Code'
    end
    object CmnMemDataPrintSegBunstrSeg08Code: TStringField
      FieldName = 'strSeg08Code'
    end
    object CmnMemDataPrintSegBunstrSeg09Code: TStringField
      FieldName = 'strSeg09Code'
    end
    object CmnMemDataPrintSegBunstrSeg10Code: TStringField
      FieldName = 'strSeg10Code'
    end
    object CmnMemDataPrintSegBunstrSeg06Name: TStringField
      FieldName = 'strSeg06Name'
    end
    object CmnMemDataPrintSegBunstrSeg07Name: TStringField
      FieldName = 'strSeg07Name'
    end
    object CmnMemDataPrintSegBunstrSeg08Name: TStringField
      FieldName = 'strSeg08Name'
    end
    object CmnMemDataPrintSegBunstrSeg09Name: TStringField
      FieldName = 'strSeg09Name'
    end
    object CmnMemDataPrintSegBunstrSeg10Name: TStringField
      FieldName = 'strSeg10Name'
    end
    object CmnMemDataPrintSegBunstrBun06Code: TStringField
      FieldName = 'strBun06Code'
    end
    object CmnMemDataPrintSegBunstrBun07Code: TStringField
      FieldName = 'strBun07Code'
    end
    object CmnMemDataPrintSegBunstrBun08Code: TStringField
      FieldName = 'strBun08Code'
    end
    object CmnMemDataPrintSegBunstrBun09Code: TStringField
      FieldName = 'strBun09Code'
    end
    object CmnMemDataPrintSegBunstrBun10Code: TStringField
      FieldName = 'strBun10Code'
    end
    object CmnMemDataPrintSegBunstrBun06Name: TStringField
      FieldName = 'strBun06Name'
    end
    object CmnMemDataPrintSegBunstrBun07Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun07Name'
    end
    object CmnMemDataPrintSegBunstrBun08Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun08Name'
    end
    object CmnMemDataPrintSegBunstrBun09Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun09Name'
    end
    object CmnMemDataPrintSegBunstrBun10Name: TStringField
      DisplayWidth = 14
      FieldName = 'strBun10Name'
    end
  end
  object SPMasHoj: TFDStoredProc
    StoredProcName = 'MP_MAS_CHK_HOJYOMA'
    Left = 16
    Top = 480
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
    Left = 48
    Top = 480
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
  object SpMSHist: TFDStoredProc
    StoredProcName = 'MP_MSHIST_SETINFO'
    Left = 820
    Top = 497
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
