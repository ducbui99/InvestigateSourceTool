object JNTCRP004008F: TJNTCRP004008F
  Left = 510
  Top = 230
  BorderStyle = bsNone
  Caption = #25163#24418#24773#22577
  ClientHeight = 564
  ClientWidth = 935
  Color = 14608367
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
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
  TextHeight = 12
  object lStatusMessage: TMLabel
    Left = 766
    Top = 466
    Width = 109
    Height = 23
    AutoSize = False
    Caption = #21066#38500#12375#12394#12356#12391'!!'
    Color = clWhite
    ParentColor = False
    Visible = False
    FontRatio.Auto = False
  end
  object DtlCmnClientPanel: TMPanel
    Left = 0
    Top = 0
    Width = 935
    Height = 564
    Align = alClient
    BevelOuter = bvNone
    Color = 14608367
    ParentBackground = False
    TabOrder = 0
    object ScrollBox2: TScrollBox
      Left = 0
      Top = 0
      Width = 935
      Height = 524
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
      object PnlTop: TScrollBox
        Left = 0
        Top = 0
        Width = 935
        Height = 61
        HorzScrollBar.Smooth = True
        VertScrollBar.Increment = 46
        Align = alTop
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
        object f0CODELab: TMLabel
          Left = 16
          Top = 12
          Width = 129
          Height = 17
          AutoSize = False
          Caption = #21462#24341#20808#12467#12540#12489
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = True
        end
        object f0NAME: TMTxtEdit
          Left = 338
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
          TabOrder = 0
          Text = ''
          ValidChars = ''
        end
        object f0CODE: TMTxtEdit
          Tag = 1400
          Left = 152
          Top = 12
          Width = 166
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = f0CODEArrowClick
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
          TabOrder = 1
          Text = ''
          ValidChars = ''
        end
      end
      object BUpdate_Sousa: TMBitBtn
        Left = 729
        Top = 487
        Width = 80
        Height = 25
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
        OnClick = BUpdate
      end
      object BCancel_Sousa: TMBitBtn
        Left = 813
        Top = 487
        Width = 80
        Height = 25
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
        OnClick = BCancel
      end
      object PSousa: TScrollBox
        Left = 74
        Top = 59
        Width = 766
        Height = 358
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
        TabOrder = 1
        object LblTEL: TMLabel
          Left = 16
          Top = 69
          Width = 75
          Height = 19
          AutoSize = False
          Caption = #25903#25173#22580#25152
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
          Left = 403
          Top = 45
          Width = 54
          Height = 19
          AutoSize = False
          Caption = #25391#20986#20154
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
          Left = 8
          Top = 14
          Width = 101
          Height = 19
          AutoSize = False
          Caption = #25163#24418#24773#22577
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel2: TMLabel
          Left = 8
          Top = 3
          Width = 742
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object f1BRCDLab: TMLabel
          Left = 16
          Top = 44
          Width = 75
          Height = 17
          AutoSize = False
          Caption = #25163#24418#12521#12531#12463
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel3: TMLabel
          Left = 9
          Top = 325
          Width = 742
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object f1Frdasi1: TMTxtEdit
          Left = 460
          Top = 45
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
          ImeMode = imHira
          MaxLength = 40
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 4
          Text = 'X(40)----------------------------------X'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
        object f1Basho1: TMTxtEdit
          Left = 94
          Top = 68
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
          ImeMode = imHira
          MaxLength = 40
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 1
          Text = 'X(40)----------------------------------X'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
        object f1Basho2: TMTxtEdit
          Left = 94
          Top = 91
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
          ImeMode = imHira
          MaxLength = 40
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 2
          Text = 'X(40)----------------------------------X'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
        object f1Basho3: TMTxtEdit
          Left = 94
          Top = 114
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
          ImeMode = imHira
          MaxLength = 40
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 3
          Text = 'X(40)----------------------------------X'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
        object f1Frdasi2: TMTxtEdit
          Left = 460
          Top = 68
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
          ImeMode = imHira
          MaxLength = 40
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 5
          Text = 'X(40)----------------------------------X'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
        object f1Frdasi3: TMTxtEdit
          Left = 460
          Top = 91
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
          ImeMode = imHira
          MaxLength = 40
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 6
          Text = 'X(40)----------------------------------X'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
        object f1Frdasi4: TMTxtEdit
          Left = 460
          Top = 114
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
          ImeMode = imHira
          MaxLength = 40
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 7
          Text = 'X(40)----------------------------------X'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
        object f1Frdasi5: TMTxtEdit
          Left = 460
          Top = 137
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
          ImeMode = imHira
          MaxLength = 40
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 8
          Text = 'X(40)----------------------------------X'
          OnChange = fnFldOnChg
          ValidChars = ''
        end
        object f1TRank: TMTxtEdit
          Left = 94
          Top = 45
          Width = 18
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
          Hankaku = True
          MaxLength = 1
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 0
          Text = ''
          OnChange = fnFldOnChg
          ValidChars = ''
        end
      end
    end
    object MPanel3: TMPanel
      Left = 0
      Top = 524
      Width = 935
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object MSPFunctionBar: TMSPFunctionBar
        Left = 0
        Top = 0
        Width = 935
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
        ButtonWidth = 116
        FuncAnchors = True
        SysBaseColorB = 10841658
        SysBaseColorD = 6956042
      end
      object stbStatusBar: TMStatusBar
        Left = 0
        Top = 21
        Width = 935
        Height = 19
        Color = 15921906
        Panels = <>
        SimplePanel = True
      end
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
  object MemPrint: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 65
    Top = 441
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
    object MemPrintPaybash1: TStringField
      FieldName = 'Paybash1'
      Size = 40
    end
    object MemPrintPaybash2: TStringField
      FieldName = 'Paybash2'
      Size = 40
    end
    object MemPrintPaybash3: TStringField
      FieldName = 'Paybash3'
      Size = 40
    end
    object MemPrintFuri1: TStringField
      FieldName = 'Furi1'
      Size = 40
    end
    object MemPrintFuri2: TStringField
      FieldName = 'Furi2'
      Size = 40
    end
    object MemPrintFuri3: TStringField
      FieldName = 'Furi3'
      Size = 40
    end
    object MemPrintFuri4: TStringField
      FieldName = 'Furi4'
      Size = 40
    end
    object MemPrintFuri5: TStringField
      FieldName = 'Furi5'
      Size = 40
    end
    object MemPrintTgtRnk: TStringField
      FieldName = 'TgtRnk'
    end
  end
  object SPMsHistParent: TFDStoredProc
    StoredProcName = 'MP_MSHIST_SETINFO'
    Left = 98
    Top = 474
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
  object SPMsHist: TFDStoredProc
    StoredProcName = 'MP_MSHIST_SETINFO'
    Left = 65
    Top = 474
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
