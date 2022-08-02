object JNTCRP004001MsgDlgf: TJNTCRP004001MsgDlgf
  Left = 228
  Top = 227
  BorderStyle = bsDialog
  Caption = '起動確認'
  ClientHeight = 171
  ClientWidth = 422
  Color = clWhite
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'ＭＳ Ｐゴシック'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel_Base: TMPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 136
    Align = alClient
    BevelOuter = bvNone
    Color = 15921906
    TabOrder = 0
    object Image1: TImage
      Left = 14
      Top = 17
      Width = 51
      Height = 51
    end
    object chkDLGInfo: TMCheckBox
      Left = 20
      Top = 78
      Width = 231
      Height = 19
      Caption = '次回からこのメッセージは表示しない'
      TabOrder = 0
    end
    object MMessage: TMMemo
      Left = 72
      Top = 12
      Width = 345
      Height = 59
      TabStop = False
      BorderStyle = bsNone
      ParentColor = True
      ReadOnly = True
      TabOrder = 1
    end
  end
  object Panel_Button: TMPanel
    Left = 0
    Top = 136
    Width = 422
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    Color = 15921906
    TabOrder = 1
    object Btn_OK: TMBitBtn
      Left = 4
      Top = 5
      Width = 106
      Height = 25
      Caption = 'はい(&Y)'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'ＭＳ Ｐゴシック'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      NumGlyphs = 2
    end
    object Btn_NO: TMBitBtn
      Left = 116
      Top = 5
      Width = 106
      Height = 25
      Cancel = True
      Caption = 'いいえ(&N)'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'ＭＳ Ｐゴシック'
      Font.Style = []
      ModalResult = 7
      ParentFont = False
      TabOrder = 2
      NumGlyphs = 2
    end
    object Btn_Yes: TMBitBtn
      Left = 6
      Top = 5
      Width = 106
      Height = 25
      Caption = 'はい(&Y)'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'ＭＳ Ｐゴシック'
      Font.Style = []
      ModalResult = 6
      ParentFont = False
      TabOrder = 1
      NumGlyphs = 2
    end
    object Btn_Cancel: TMBitBtn
      Left = 197
      Top = 5
      Width = 106
      Height = 25
      Cancel = True
      Caption = 'キャンセル(&C)'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'ＭＳ Ｐゴシック'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 3
      NumGlyphs = 2
    end
  end
end
