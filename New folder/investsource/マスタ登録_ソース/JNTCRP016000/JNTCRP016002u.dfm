object JNTCRP016002f: TJNTCRP016002f
  Left = 351
  Top = 284
  BorderStyle = bsDialog
  Caption = 'JNTCRP016002f'
  ClientHeight = 149
  ClientWidth = 502
  Color = clWhite
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = fnJNTCRP016002fOnCloseQuery
  OnCreate = fnJNTCRP016002fOnCreate
  PixelsPerInch = 96
  TextHeight = 12
  object MLabel3: TMLabel
    Left = 4
    Top = 50
    Width = 396
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = #27491'  '#24335'  '#21517'  '#31216
    Color = 16766672
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BorderLine = tmb3DUp
    FontRatio.Auto = False
  end
  object MLabel4: TMLabel
    Left = 401
    Top = 50
    Width = 97
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = #31777' '#30053' '#21517' '#31216
    Color = 16766672
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BorderLine = tmb3DUp
    FontRatio.Auto = False
  end
  object MLabel1: TMLabel
    Left = 112
    Top = 7
    Width = 106
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = #36899' '#24819
    Color = 16766672
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BorderLine = tmb3DUp
    FontRatio.Auto = False
  end
  object MLabel2: TMLabel
    Left = 4
    Top = 7
    Width = 106
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = #12467#12540#12489
    Color = 16766672
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BorderLine = tmb3DUp
    FontRatio.Auto = False
  end
  object DialogEditExCodeNumeric: TMNumEdit
    Left = 4
    Top = 27
    Width = 106
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
    OnKeyDown = fnDialogCommonFunctionOnKeyDown01
    FormatStr = '0'
    Negative = False
    Validate = False
    Zero = True
  end
  object DialogEditExCodeFree: TMTxtEdit
    Left = 4
    Top = 27
    Width = 106
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
    ImeMode = imClose
    FontRatio.Auto = False
    ParentFont = False
    TabOrder = 1
    Text = ''
    OnKeyDown = fnDialogCommonFunctionOnKeyDown01
    ValidChars = ''
  end
  object DialogEditAssociation: TMTxtEdit
    Left = 112
    Top = 27
    Width = 106
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
    ImeMode = imSKata
    MaxLength = 10
    FontRatio.Auto = False
    ParentFont = False
    TabOrder = 2
    Text = ''
    OnKeyDown = fnDialogCommonFunctionOnKeyDown02
    ValidChars = ''
  end
  object DialogEditName: TMTxtEdit
    Left = 4
    Top = 71
    Width = 396
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
    Text = ''
    OnKeyDown = fnDialogCommonFunctionOnKeyDown02
    ValidChars = ''
  end
  object DialogEditNameSimple: TMTxtEdit
    Left = 401
    Top = 71
    Width = 97
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
    MaxLength = 14
    FontRatio.Auto = False
    ParentFont = False
    TabOrder = 4
    Text = ''
    OnEnter = DialogEditNameSimpleEnter
    OnExit = DialogEditNameSimpleExit
    OnKeyDown = fnDialogCommonFunctionOnKeyDown02
    ValidChars = ''
  end
  object DialogButtonRegistration: TMBitBtn
    Left = 282
    Top = 96
    Width = 106
    Height = 25
    Caption = '&OK'
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
    ParentFont = False
    TabOrder = 5
    OnClick = fnDialogButtonRegistrationOnClick
  end
  object BCancel: TMBitBtn
    Left = 392
    Top = 96
    Width = 106
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523'(&C)'
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
    ModalResult = 2
    NumGlyphs = 2
    ParentFont = False
    TabOrder = 6
  end
  object DialogPanelErrorMessage: TMPanel
    Left = 4
    Top = 126
    Width = 494
    Height = 19
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    Caption = #35576#21475#12434#30331#37682#12375#12390#12367#12384#12373#12356#12290#30331#37682#12375#12394#12356#22580#21512#12399'"'#12461#12515#12531#12475#12523'"'#12434#25276#12375#12390#12367#12384#12373#12356#12290
    Color = clWhite
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 7
  end
  object SPMsHist: TFDStoredProc
    StoredProcName = 'MP_MSHIST_SETINFO'
    Left = 15
    Top = 94
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
    Left = 48
    Top = 94
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
