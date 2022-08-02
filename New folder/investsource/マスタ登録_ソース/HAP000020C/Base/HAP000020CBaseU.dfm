object HAP000020CBaseF: THAP000020CBaseF
  Left = 732
  Top = 338
  Caption = #21336#36523'/'#20986#21521
  ClientHeight = 543
  ClientWidth = 999
  Color = 15921906
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TMPanel
    Left = 8
    Top = 36
    Width = 940
    Height = 420
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 1
    object MLabel9: TMLabel
      Left = 5
      Top = 11
      Width = 119
      Height = 19
      AutoSize = False
      Caption = #21336#36523#36212#20219#24773#22577
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      FontRatio.Auto = False
    end
    object MLabel48: TMLabel
      Left = 470
      Top = 44
      Width = 464
      Height = 1
      AutoSize = False
      Color = clSilver
      ParentColor = False
      FontRatio.Auto = False
    end
    object MLabel17: TMLabel
      Left = 3
      Top = 4
      Width = 449
      Height = 1
      AutoSize = False
      Color = clSilver
      ParentColor = False
      FontRatio.Auto = False
    end
    object MLabel52: TMLabel
      Left = 3
      Top = 409
      Width = 931
      Height = 1
      AutoSize = False
      Color = clSilver
      ParentColor = False
      FontRatio.Auto = False
    end
    object MLabel50: TMLabel
      Left = 472
      Top = 52
      Width = 119
      Height = 19
      AutoSize = False
      Caption = #29694#22312#20986#21521#24773#22577
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
      FontRatio.Auto = False
    end
    object LLoanCount: TMLabel
      Left = 591
      Top = 52
      Width = 120
      Height = 19
      AutoSize = False
      Caption = #29694#22312#20986#21521#20013' 99'#20214
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
      FontRatio.Auto = False
    end
    object MLabel2: TMLabel
      Left = 470
      Top = 4
      Width = 464
      Height = 1
      AutoSize = False
      Color = clSilver
      ParentColor = False
      FontRatio.Auto = False
    end
    object MPanel11: TMPanel
      Left = 476
      Top = 78
      Width = 455
      Height = 100
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 2
      object MLabel42: TMLabel
        Tag = 148301
        Left = 3
        Top = 20
        Width = 107
        Height = 19
        AutoSize = False
        Caption = #20986#21521#20808#20250#31038#21517
        ShowAccelChar = False
        MBottomMargin = 1
        MLeftMargin = 2
        FontRatio.Auto = True
      end
      object MLabel45: TMLabel
        Tag = 148321
        Left = 3
        Top = 0
        Width = 107
        Height = 19
        AutoSize = False
        Caption = #20986#21521#38283#22987#26085
        ShowAccelChar = False
        MBottomMargin = 1
        MLeftMargin = 2
        FontRatio.Auto = True
      end
      object MLabel41: TMLabel
        Tag = 148303
        Left = 3
        Top = 40
        Width = 107
        Height = 19
        AutoSize = False
        Caption = #20986#21521#20808#37096#32626
        ShowAccelChar = False
        MBottomMargin = 1
        MLeftMargin = 2
        FontRatio.Auto = True
      end
      object MLabel43: TMLabel
        Tag = 148304
        Left = 3
        Top = 60
        Width = 107
        Height = 19
        AutoSize = False
        Caption = #20986#21521#20808#24441#32887
        ShowAccelChar = False
        MBottomMargin = 1
        MLeftMargin = 2
        FontRatio.Auto = True
      end
      object MLabel44: TMLabel
        Tag = 148311
        Left = 3
        Top = 80
        Width = 107
        Height = 19
        AutoSize = False
        Caption = #20986#21521#20107#30001
        ShowAccelChar = False
        MBottomMargin = 1
        MLeftMargin = 2
        FontRatio.Auto = True
      end
      object LLoanDeptName: TMLabel
        Left = 111
        Top = 40
        Width = 336
        Height = 19
        AutoSize = False
        Caption = 'XXXXXXXXX0XXXXX6'
        ShowAccelChar = False
        MBottomMargin = 1
        MLeftMargin = 2
        BorderLine = tmbSingle
        FontRatio.Auto = True
      end
      object LLoanPostName: TMLabel
        Left = 111
        Top = 60
        Width = 336
        Height = 19
        AutoSize = False
        Caption = 'XXXXXXXXX0XXXXX6'
        ShowAccelChar = False
        MBottomMargin = 1
        MLeftMargin = 2
        BorderLine = tmbSingle
        FontRatio.Auto = True
      end
      object LLoanComment: TMLabel
        Left = 111
        Top = 80
        Width = 336
        Height = 19
        AutoSize = False
        Caption = 'XXXXXXXXX0XXXXX6'
        ShowAccelChar = False
        MBottomMargin = 1
        MLeftMargin = 2
        BorderLine = tmbSingle
        FontRatio.Auto = True
      end
      object LLoanDate: TMLabel
        Left = 111
        Top = 0
        Width = 82
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'H99/99/99'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#26126#26397
        Font.Style = []
        ParentFont = False
        MBottomMargin = 1
        MRightMargin = 2
        BorderLine = tmbSingle
        FontRatio.Auto = False
      end
      object LLoanCorpName: TMLabel
        Left = 111
        Top = 20
        Width = 336
        Height = 19
        AutoSize = False
        Caption = 'XXXXXXXXX0XXXXX6'
        ShowAccelChar = False
        MBottomMargin = 1
        MLeftMargin = 2
        BorderLine = tmbSingle
        FontRatio.Auto = True
      end
      object ELoanDateSt: TMComboBox
        Left = 111
        Top = 0
        Width = 97
        Height = 19
        CanEdit = False
        Columns = <
          item
            Width = 102
            Color = clWindow
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end>
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#26126#26397
        Font.Style = []
        IMEMode = imDisable
        ParentFont = False
        TabOrder = 0
        OnChange = ELoanDateStChange
      end
    end
    object MPanel10: TMPanel
      Tag = 2
      Left = 10
      Top = 38
      Width = 437
      Height = 100
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object MLabel31: TMLabel
        Tag = 148002
        Left = 1
        Top = 60
        Width = 109
        Height = 19
        AutoSize = False
        Caption = #20303#25152#19979#27573
        ShowAccelChar = False
        MBottomMargin = 1
        FontRatio.Auto = True
      end
      object MLabel32: TMLabel
        Tag = 148001
        Left = 1
        Top = 40
        Width = 109
        Height = 19
        AutoSize = False
        Caption = #20303#25152#19978#27573
        ShowAccelChar = False
        MBottomMargin = 1
        FontRatio.Auto = True
      end
      object MLabel33: TMLabel
        Tag = 147900
        Left = 1
        Top = 20
        Width = 109
        Height = 19
        AutoSize = False
        Caption = #37109#20415#30058#21495
        ShowAccelChar = False
        MBottomMargin = 1
        FontRatio.Auto = True
      end
      object MLabel34: TMLabel
        Tag = 148100
        Left = 1
        Top = 80
        Width = 109
        Height = 19
        AutoSize = False
        Caption = #38651#35441#30058#21495
        ShowAccelChar = False
        MBottomMargin = 1
        FontRatio.Auto = True
      end
      object MLabel35: TMLabel
        Tag = 147800
        Left = 1
        Top = 0
        Width = 109
        Height = 19
        AutoSize = False
        Caption = #21336#36523#36212#20219#21306#20998
        ShowAccelChar = False
        MBottomMargin = 1
        FontRatio.Auto = True
      end
      object LETansin: TMLabel
        Left = 172
        Top = 0
        Width = 131
        Height = 19
        AutoSize = False
        Caption = 'XXXXXXXXX0XXXXX6'
        ShowAccelChar = False
        MBottomMargin = 1
        FontRatio.Auto = True
      end
      object MLabel36: TMLabel
        Left = 139
        Top = 19
        Width = 14
        Height = 19
        AutoSize = False
        Caption = #65293
        FontRatio.Auto = False
      end
      object ETanAddress1: TMTxtEdit
        Tag = 148001
        Left = 111
        Top = 40
        Width = 325
        Height = 19
        ArrowDisp = adNone
        SelectDisp = sdNone
        FocusedColor = 16777158
        ArrowType = atArrow
        TagStr = ''
        AutoSize = False
        ImeMode = imHira
        MaxLength = 40
        FontRatio.Auto = True
        TabOrder = 3
        Text = 'XXXXXXXXX0XXXXXXXXX0XXXXXXXXX0XXXXXXXXX0'
        ValidChars = ''
      end
      object ETanAddress2: TMTxtEdit
        Tag = 148002
        Left = 111
        Top = 60
        Width = 325
        Height = 19
        ArrowDisp = adNone
        SelectDisp = sdNone
        FocusedColor = 16777158
        ArrowType = atArrow
        TagStr = ''
        AutoSize = False
        ImeMode = imHira
        MaxLength = 40
        FontRatio.Auto = True
        TabOrder = 4
        Text = 'XXXXXXXXX0XXXXXXXXX0XXXXXXXXX0XXXXXXXXX0'
        ValidChars = ''
      end
      object ETanTelNo: TMTxtEdit
        Tag = 148100
        Left = 111
        Top = 80
        Width = 226
        Height = 19
        ArrowDisp = adNone
        SelectDisp = sdNone
        FocusedColor = 16777158
        ArrowType = atArrow
        TagStr = ''
        AutoSize = False
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = 13
        Font.Name = #65325#65331' '#65328#26126#26397
        Font.Style = []
        ImeMode = imDisable
        MaxLength = 20
        FontRatio.Auto = False
        ParentFont = False
        TabOrder = 5
        Text = 'XXXXXXXXX0XXXXXXXXX0'
        ValidChars = ''
      end
      object ETansin: TMNumEdit
        Tag = 147800
        Left = 111
        Top = 0
        Width = 42
        Height = 19
        ArrowDisp = adFocused
        SelectDisp = sdFocused
        SelectItems.Strings = (
          '1:'#30007#24615
          '2:'#22899#24615)
        FocusedColor = 16777158
        ArrowType = atArrow
        F4Arrow = True
        AutoSize = False
        Enabled = False
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#26126#26397
        Font.Style = []
        ImeMode = imClose
        FontRatio.Auto = False
        ParentFont = False
        TabOrder = 0
        Digits = 3
        Validate = False
      end
      object ETanYuubinA: TMTxtEdit
        Tag = 147900
        Left = 111
        Top = 20
        Width = 27
        Height = 19
        ArrowDisp = adNone
        SelectDisp = sdArrowClick
        SelectColCount = 0
        OnArrowClick = EYuubinAArrowClick
        FocusedColor = clYellow
        ArrowType = atOmission
        F4Arrow = True
        TagStr = 'No'
        AutoSize = False
        Ctl3D = True
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#26126#26397
        Font.Style = []
        ImeMode = imDisable
        MaxLength = 3
        FontRatio.Auto = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        Text = '123'
        OnKeyPress = EYuubinAKeyPress
        ValidChars = ''
      end
      object ETanYuubinB: TMTxtEdit
        Tag = 147900
        Left = 153
        Top = 20
        Width = 35
        Height = 19
        ArrowDisp = adFocused
        SelectDisp = sdArrowClick
        SelectColCount = 0
        OnArrowClick = EYuubinAArrowClick
        FocusedColor = clYellow
        ArrowType = atOmission
        F4Arrow = True
        TagStr = 'Exp'
        AutoSize = False
        Ctl3D = True
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#26126#26397
        Font.Style = []
        ImeMode = imDisable
        MaxLength = 4
        FontRatio.Auto = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Text = '1234'
        OnKeyPress = EYuubinAKeyPress
        ValidChars = ''
      end
    end
    object MPanel1: TMPanel
      Left = 478
      Top = 15
      Width = 455
      Height = 21
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 1
      object MLabel1: TMLabel
        Tag = 105210
        Left = 1
        Top = 0
        Width = 109
        Height = 19
        AutoSize = False
        Caption = #12464#12523#12540#12503#20837#31038#26085
        ShowAccelChar = False
        MBottomMargin = 1
        FontRatio.Auto = True
      end
      object lblGroupEnter1: TMLabel
        Left = 208
        Top = 0
        Width = 35
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = #21220#32154
        MRightMargin = 3
        FontRatio.Auto = False
      end
      object LGroupEnterY: TMLabel
        Left = 239
        Top = 0
        Width = 22
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        FontRatio.Auto = False
      end
      object lblGroupEnter2: TMLabel
        Left = 264
        Top = 0
        Width = 15
        Height = 19
        AutoSize = False
        Caption = #24180
        FontRatio.Auto = False
      end
      object LGroupEnterM: TMLabel
        Left = 276
        Top = 0
        Width = 22
        Height = 19
        Alignment = taRightJustify
        AutoSize = False
        Caption = '99'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        FontRatio.Auto = False
      end
      object lblGroupEnter3: TMLabel
        Left = 299
        Top = 0
        Width = 42
        Height = 19
        AutoSize = False
        Caption = #12534#26376
        FontRatio.Auto = False
      end
      object dtGroupEnter: TMDateEdit
        Tag = 2
        Left = 111
        Top = 0
        Width = 82
        Height = 19
        ArrowDisp = adNone
        SelectDisp = sdNone
        FocusedColor = clYellow
        ArrowType = atArrow
        F4Arrow = True
        AutoSize = False
        Ctl3D = True
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#26126#26397
        Font.Style = []
        ImeMode = imDisable
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Calendar = True
        DateFormat = dfEMD
        DateInputType = diYMD
        Gengou = #0
        SepChar = '/'
        Value = 0
        Validate = False
      end
    end
  end
  object PTool: TMPanel
    Left = 2
    Top = 2
    Width = 397
    Height = 21
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object btnTelSearch: TMSpeedButton
      Left = 278
      Top = 0
      Width = 112
      Height = 21
      Caption = #38651#35441#30058#21495#26908#32034
      Enabled = False
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404040404040404040404040
        4040404040404040404040404040404040404040FFFFFFFFFFFFFFFFFFFFFFFF
        6666666666666666666666666666666666666666666666666666666666666666
        66404040FFFFFFFFFFFFFFFFFFFFFFFF666666BED6B2666666BED6B2BED6B2BE
        D6B2BED6B2BED6B2BED6B2BED6B2666666404040FFFFFFFFFFFFFFFFFFFFFFFF
        666666B8CFAA666666B7D0AAB8D0AAB7CFAAB7CFAAB8D0AAB7CFAAB8CFAA6666
        66404040FFFFFFFFFFFFFFFFFFFFFFFF666666B0C7A0666666AFC7A1AFC7A0AF
        C7A0B0C8A1AFC7A1B0C7A1AFC8A1666666404040FFFFFFFFFFFFFFFFFFFFFFFF
        666666A7C097666666A8BF97A8C097A8C097A8C098A7BF98A8C097A7C0976666
        66404040FFFFFFFFFFFFFFFFFFFFFFFF666666A0B88E666666A0B98EA0B98EA0
        B98EA0B98EA1B98EA1B88EA0B98E666666404040FFFFFFFFFFFFFFFFFFFFFFFF
        66666698B08366666698B08398B08498B08398B08398B08497B08398B0836666
        66404040FFFFFFFFFFFFFFFFFFFFFFFF6666668FA7796666668FA77966666666
        66666666666666666666668FA779666666404040FFFFFFFFFFFFFFFFFFFFFFFF
        666666879F6F666666879F6F404040404040404040404040404040879F6F6666
        66404040FFFFFFFFFFFFFFFFFFFFFFFF666666829A69666666829A69829A6982
        9A69829A69829A69829A69829A69666666404040FFFFFFFFFFFFFFFFFFFFFFFF
        666666FFFFFF666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6666
        66404040FFFFFFFFFFFFFFFFFFFFFFFF66666666666666666666666666666666
        6666666666666666666666666666666666FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btnTelSearchClick
    end
  end
  object mdLoanNow: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 269
    Top = 387
    object mdLoanNowLoanDateSt: TDateTimeField
      FieldName = 'LoanDateSt'
    end
    object mdLoanNowLoanCorpName: TStringField
      FieldName = 'LoanCorpName'
      Size = 60
    end
    object mdLoanNowLoanDeptName: TStringField
      FieldName = 'LoanDeptName'
      Size = 60
    end
    object mdLoanNowLoanPostName: TStringField
      FieldName = 'LoanPostName'
      Size = 60
    end
    object mdLoanNowLoanComment: TStringField
      FieldName = 'LoanComment'
      Size = 40
    end
  end
end
