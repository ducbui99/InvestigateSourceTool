object JNTCRP020000f: TJNTCRP020000f
  Left = 211
  Top = 132
  Align = alBottom
  BorderStyle = bsNone
  Caption = 'JNTCRP020000f'
  ClientHeight = 622
  ClientWidth = 945
  Color = 15921906
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  OnActivate = fnJNTCRP020000fOnActivate
  OnClose = fnJNTCRP020000fOnClose
  OnCloseQuery = fnJNTCRP020000fOnCloseQuery
  OnCreate = fnJNTCRP020000fOnCreate
  OnDestroy = fnJNTCRP020000fOnDestroy
  OnHide = fnJNTCRP020000fOnHide
  OnPaint = fnJNTCRP020000fOnPaint
  OnShow = fnJNTCRP020000fOnShow
  PixelsPerInch = 96
  TextHeight = 12
  object CmnSplitter: TSplitter
    Left = 230
    Top = 49
    Height = 533
  end
  object StdCmnClientPanel: TMPanel
    Left = 233
    Top = 49
    Width = 712
    Height = 533
    Align = alClient
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 2
    OnEnter = fnCmnTreeViewOnEnter
    object StdCmnClientPanelTotal: TMPanel
      Left = 0
      Top = 44
      Width = 712
      Height = 489
      Align = alClient
      Color = 14608367
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object StdCmnGridTotal: TdxDBGrid
        Left = 1
        Top = 1
        Width = 710
        Height = 487
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'nExCode'
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
        TabOrder = 0
        OnEnter = fnStdCmnGridTotalOnEnter
        OnKeyPress = fnStdCmnGridTotalOnKeyPress
        BandColor = 16766672
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
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll]
        PreviewFont.Charset = SHIFTJIS_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -13
        PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        PreviewFont.Style = []
        OnChangeNodeEx = fnStdCmnGridTotalOnChangeNodeEx
        OnColumnClick = fnStdCmnGridTotalOnColumnClick
        OnBeforeChangeColumn = fnStdCmnGridTotalOnBeforeChangeColumn
        OnBeforeChangeNode = StdCmnGridTotalBeforeChangeNode
        object StdCmnGridTotalCode: TdxDBGridColumn
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
          MaxLength = 6
          StretchChar.Auto = False
          FieldName = 'nExCode'
        end
        object StdCmnGridTotalAssociation: TdxDBGridColumn
          Caption = #36899#24819
          HeaderAlignment = taCenter
          Width = 88
          BandIndex = 0
          RowIndex = 0
          ImeMode = imSKata
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'strAssociation'
        end
        object StdCmnGridTotalName: TdxDBGridColumn
          Caption = #25688#35201
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          HeaderAlignment = taCenter
          Width = 495
          BandIndex = 0
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 60
          StretchChar.Auto = False
          FieldName = 'strName'
        end
      end
    end
    object StdCmnTab: TMTab
      Left = 0
      Top = 0
      Width = 712
      Height = 44
      Items = <
        item
          Caption = #22266#23450#25688#35201
          Color = 15921906
          SyncControl = StdCmnClientPanelExist
          Alignment = taCenter
          ImageIndex = 0
          ParentBorderCaption = True
        end
        item
          Caption = #25688#35201#20998#39006
          Color = 15921906
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
    object StdCmnClientPanelExist: TMPanel
      Left = 0
      Top = 44
      Width = 712
      Height = 489
      Align = alClient
      Color = 14608367
      ParentBackground = False
      TabOrder = 0
      Visible = False
      object StdCmnGridExist: TdxDBGrid
        Left = 1
        Top = 1
        Width = 710
        Height = 487
        Bands = <
          item
            MinWidth = 21
          end
          item
            Caption = #12467#12540#12489
          end
          item
            Caption = #36899#24819
          end
          item
            Caption = #25688#35201
            MinWidth = 60
          end
          item
            Caption = #20184#31627#20633#32771
            Visible = False
            Width = 30
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'nExCode'
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
        HideSelection = True
        HideSelectionColor = clWindow
        HideSelectionTextColor = clBlack
        HighlightTextColor = clWindowText
        LookAndFeel = lfFlat
        Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor]
        PreviewFont.Charset = SHIFTJIS_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -13
        PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        PreviewFont.Style = []
        OnChangeNodeEx = fnStdCmnGridExistOnChangeNodeEx
        OnGetNodeDragText = fnStdCmnGridExistOnGetNodeDragText
        OnColumnClick = fnStdCmnGridExistOnColumnClick
        OnBeforeChangeColumn = fnStdCmnGridExistOnBeforeChangeColumn
        OnBeforeChangeNode = fnStdCmnGridExistOnBeforeChangeNode
        object StdCmnGridExistTag: TdxDBGridGraphicColumn
          Alignment = taCenter
          Caption = ' '
          HeaderAlignment = taCenter
          ReadOnly = True
          TabStop = False
          Width = 21
          BandIndex = 0
          RowIndex = 0
          HeaderMaxLineCount = 1
          EditAlignment = taCenter
          StretchChar.Auto = False
          FieldName = 'grTag'
          PopupToolBar.Buttons = []
          PopupToolBar.ShowCaptions = False
          PopupToolBar.Visible = False
          PopupToolbarPosStored = False
          Stretch = False
        end
        object StdCmnGridExistCode: TdxDBGridColumn
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
          MaxLength = 6
          StretchChar.Auto = False
          FieldName = 'nExCode'
        end
        object StdCmnGridExistAssociation: TdxDBGridColumn
          Caption = #36899#24819
          HeaderAlignment = taCenter
          Width = 88
          BandIndex = 2
          RowIndex = 0
          ImeMode = imSKata
          Hankaku = True
          StretchChar.Auto = False
          FieldName = 'strAssociation'
        end
        object StdCmnGridExistName: TdxDBGridColumn
          Alignment = taLeftJustify
          Caption = #25688#35201
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          HeaderAlignment = taCenter
          Width = 495
          BandIndex = 3
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 60
          StretchChar.Auto = False
          FieldName = 'strName'
        end
        object StdCmnGridExistComment: TdxDBGridColumn
          Caption = #20184#31627#20633#32771
          ReadOnly = True
          Visible = False
          Width = 20
          BandIndex = 4
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'strComment'
        end
      end
    end
  end
  object DtlCmnClientPanel: TMPanel
    Left = 233
    Top = 49
    Width = 712
    Height = 533
    Align = alClient
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 3
    Visible = False
    object DtlCmnScrollBox: TScrollBox
      Left = 0
      Top = 44
      Width = 712
      Height = 459
      Align = alClient
      BorderStyle = bsNone
      Color = 15921906
      ParentColor = False
      PopupMenu = DtlCmnPopupMenu
      TabOrder = 1
      object DtlCmnImageTag: TImage
        Left = 9
        Top = 6
        Width = 16
        Height = 16
        AutoSize = True
        Enabled = False
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
        PopupMenu = DtlCmnPopupMenu
        Transparent = True
        Visible = False
      end
      object DtlCLblExCdTitle: TMLabel
        Left = 37
        Top = 6
        Width = 97
        Height = 14
        AutoSize = False
        Caption = #12467#12540#12489
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Pitch = fpFixed
        Font.Style = []
        ParentFont = False
        FontRatio.Auto = False
      end
      object DtlCmnPanelAddition: TMPanel
        Left = 3
        Top = 55
        Width = 684
        Height = 62
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 2
        object DtlCmnPanelAddition1: TMPanel
          Left = 13
          Top = 2
          Width = 679
          Height = 25
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 0
          object DtlCmnLbelDealDivisionTitle: TMLabel
            Left = 20
            Top = 1
            Width = 156
            Height = 17
            AutoSize = False
            Caption = 'XXXXXXXXXXXXXXXXXXXX'#21306#20998
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLbelDealClassTitle: TMLabel
            Left = 342
            Top = 1
            Width = 172
            Height = 17
            AutoSize = False
            Caption = 'XXXXXXXXXXXXXXXXXXXX'#20998#39006
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLbelDealDivisionDesc: TMLabel
            Left = 223
            Top = 1
            Width = 103
            Height = 17
            AutoSize = False
            Caption = 'XXXXXXXXXXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLbelDealClassDesc: TMLabel
            Left = 549
            Top = 1
            Width = 103
            Height = 17
            AutoSize = False
            Caption = 'XXXXXXXXXXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object MLabel1: TMLabel
            Left = 8
            Top = 24
            Width = 335
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object MLabel3: TMLabel
            Left = 352
            Top = 24
            Width = 314
            Height = 1
            AutoSize = False
            Color = clSilver
            ParentColor = False
            FontRatio.Auto = False
          end
          object DtlCmnEditDealDivision: TMNumEdit
            Left = 183
            Top = 0
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
            OnChange = fnDtlCmnEditDealDivisionOnChange
            OnEnter = fnCommonFunctionOnEnter01
            OnExit = fnDtlCmnEditDealDivisionOnExit
            OnKeyDown = fnOnKeyDown
            Validate = False
            Zero = True
          end
          object DtlCmnEditDealClass: TMNumEdit
            Left = 518
            Top = 0
            Width = 16
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12381#12398#20182#19968#33324
              '1: '#36899#32080#23376'('#35242')'#20250#31038
              '2: '#38750#36899#32080#23376#20250#31038
              '3: '#38306#36899#20250#31038)
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
            OnChange = fnDtlCmnEditDealClassOnChange
            OnEnter = fnCommonFunctionOnEnter01
            OnExit = fnDtlCmnEditDealClassOnExit
            OnKeyDown = fnOnKeyDown
            Digits = 1
            Validate = False
            InputFlagEnabled = True
            Zero = True
          end
        end
        object chk_Busyo: TMCheckBox
          Left = 32
          Top = 36
          Width = 201
          Height = 19
          Caption = #37096#32626#20253#31080#12398#36766#26360#12392#12375#12390#20351#29992#12377#12427#12290
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object DtlCEdtExCd: TMNumEdit
        Left = 137
        Top = 4
        Width = 62
        Height = 20
        ArrowDisp = adFocused
        SelectDisp = sdNone
        OnArrowClick = CmnArrowClick
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
        OnChange = fnDtlCEdtExCdOnChange
        OnEnter = fnDtlCEdtExCdOnEnter
        OnExit = fnDtlCEdtExCdOnExit
        OnKeyDown = fnOnKeyDown
        Digits = 6
        Validate = False
      end
      object DtlCmnPanelAddition3: TMPanel
        Left = 215
        Top = 1
        Width = 464
        Height = 46
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 1
        object LRen: TMLabel
          Left = 0
          Top = 2
          Width = 25
          Height = 19
          AutoSize = False
          Caption = #36899#24819
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object LTeki: TMLabel
          Left = 0
          Top = 22
          Width = 27
          Height = 19
          AutoSize = False
          Caption = #25688#35201
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object DtlCmnEditAssociation: TMTxtEdit
          Left = 37
          Top = 3
          Width = 73
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 0
          Text = ''
          OnChange = fnOnChange
          OnEnter = fnDtlCmnFunctionOnEnter
          OnKeyDown = fnOnKeyDown
          ValidChars = ''
        end
        object DtlCmnEditName: TMTxtEdit
          Left = 37
          Top = 25
          Width = 426
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
          MaxLength = 60
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 1
          Text = 'X(60)------------------------------------------------------X'
          OnChange = fnOnChange
          OnEnter = fnDtlCmnFunctionOnEnter
          OnKeyDown = fnOnKeyDown
          ValidChars = ''
        end
      end
      object DtlCmnPanelAddition2: TMPanel
        Left = 21
        Top = 116
        Width = 684
        Height = 362
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 3
        object DtlCmnLbelGroupComTaxInfo: TMLabel
          Left = 8
          Top = 196
          Width = 69
          Height = 19
          AutoSize = False
          Caption = #28040#36027#31246#38306#20418
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel6: TMLabel
          Left = 3
          Top = 191
          Width = 663
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel7: TMLabel
          Left = 8
          Top = 1
          Width = 84
          Height = 19
          AutoSize = False
          Caption = #20511#26041#20181#35379#24773#22577
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel8: TMLabel
          Left = 351
          Top = 1
          Width = 84
          Height = 19
          AutoSize = False
          Caption = #36024#26041#20181#35379#24773#22577
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object MPanel1: TMPanel
          Left = 12
          Top = 56
          Width = 330
          Height = 122
          BevelOuter = bvNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object DtlDSwkGrid: TdxDBGrid
            Left = 0
            Top = 0
            Width = 330
            Height = 122
            Bands = <
              item
                Caption = #35036#21161#12510#12473#12479
                Width = 71
              end
              item
                Caption = #12467#12540#12489
                Width = 134
              end
              item
                Caption = #21517#31216
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'nExCode'
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alClient
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnEnter = evtDtlSwkGridEnter
            OnExit = evtDtlSwkGridExit
            OnKeyPress = evtDtlSwkGridKeyPress
            BandColor = 16766672
            BandFont.Charset = SHIFTJIS_CHARSET
            BandFont.Color = clWindowText
            BandFont.Height = -12
            BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            BandFont.Style = []
            DataSource = DtlDSwkDataSource
            HeaderColor = 16766672
            HeaderFont.Charset = SHIFTJIS_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            HeaderFont.Style = []
            HideFocusRect = True
            HideSelection = True
            HideSelectionColor = clWindow
            HideSelectionTextColor = clBlack
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCancelOnExit, egoImmediateEditor, egoIndicator]
            OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoBandMoving, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
            PreviewFont.Charset = SHIFTJIS_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -12
            PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            PreviewFont.Style = []
            ScrollBars = ssVertical
            ShowBands = True
            ShowHeader = False
            OnChangeNode = evtDtlSwkGridChangeNode
            OnCustomDrawCell = evtDtlSwkGridCustomDrawCell
            OnEditing = evtDtlSwkGridEditing
            object DtlDSwkGridColumnMaster: TdxDBGridColumn
              Caption = #12510#12473#12479#21517
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ReadOnly = True
              TabStop = False
              Width = 71
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'strMaster'
            end
            object DtlDSwkGridColumnLookup: TdxDBGridLookupColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 20
              BandIndex = 1
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              StretchChar.Auto = False
              FieldName = 'nCtrlDivision'
              DropDownSelectEx = False
              DropDownRows = 3
              ListFieldName = 'nDivision;strDescription'
              ListWidth = 111
            end
            object dxDBGridColumnKbn: TdxDBGridColumn
              Caption = #21306#20998#29992
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              MinWidth = 1
              ReadOnly = True
              Visible = False
              Width = 1
              BandIndex = 1
              RowIndex = 0
              StretchChar.Auto = False
            end
            object dxDBGridColumnKbnName: TdxDBGridMaskColumn
              Caption = #21306#20998#21517
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ReadOnly = True
              TabStop = False
              Width = 36
              BandIndex = 1
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'strDivisionDesc'
            end
            object DtlDSwkGridColumnCode: TdxDBGridButtonColumn
              Caption = #12467#12540#12489
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              HeaderAlignment = taCenter
              Sizing = False
              Width = 81
              BandIndex = 1
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 16
              StretchChar.Auto = True
              FieldName = 'strGCode'
              ClickKey = 115
              OnEditButtonClick = evtdxDBGridColumnCodeEditButtonClick
            end
            object dxDBGridColumnName: TdxDBGridColumn
              Caption = #21517#31216
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              HeaderAlignment = taCenter
              ReadOnly = True
              TabStop = False
              Width = 90
              BandIndex = 2
              RowIndex = 0
              ImeMode = imDisable
              StretchChar.Auto = False
              FieldName = 'strSubjectDesc'
            end
            object DtlDSwkGridColumnAttr: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'iAttr'
            end
            object DtlDSwkGridColumn8: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'iDigit'
            end
            object DtlDSwkGridColumn9: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'iMasterKbn'
            end
          end
        end
        object MPanel3: TMPanel
          Left = 355
          Top = 56
          Width = 330
          Height = 122
          BevelOuter = bvNone
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
          object DtlCSwkGrid: TdxDBGrid
            Left = 0
            Top = 0
            Width = 330
            Height = 122
            Bands = <
              item
                Caption = #35036#21161#12510#12473#12479
                Width = 71
              end
              item
                Caption = #12467#12540#12489
                Width = 134
              end
              item
                Caption = #21517#31216
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'nExCode'
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alClient
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnEnter = evtDtlSwkGridEnter
            OnExit = evtDtlSwkGridExit
            OnKeyPress = evtDtlSwkGridKeyPress
            BandColor = 16766672
            BandFont.Charset = SHIFTJIS_CHARSET
            BandFont.Color = clWindowText
            BandFont.Height = -12
            BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            BandFont.Style = []
            DataSource = DtlCSwkDataSource
            HeaderColor = 16766672
            HeaderFont.Charset = SHIFTJIS_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            HeaderFont.Style = []
            HideFocusRect = True
            HideSelection = True
            HideSelectionColor = clWindow
            HideSelectionTextColor = clBlack
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoConfirmDelete, egoCanNavigation, egoCancelOnExit, egoImmediateEditor, egoIndicator]
            OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoBandMoving, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
            PreviewFont.Charset = SHIFTJIS_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -12
            PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            PreviewFont.Style = []
            ScrollBars = ssVertical
            ShowBands = True
            ShowHeader = False
            OnChangeNode = evtDtlSwkGridChangeNode
            OnCustomDrawCell = evtDtlSwkGridCustomDrawCell
            OnEditing = evtDtlSwkGridEditing
            object dxDBGridColumn1: TdxDBGridColumn
              Caption = #12510#12473#12479#21517
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ReadOnly = True
              TabStop = False
              Width = 71
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'strMaster'
            end
            object DtlCSwkGridColumnLookup: TdxDBGridLookupColumn
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              Width = 20
              BandIndex = 1
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              StretchChar.Auto = False
              FieldName = 'nCtrlDivision'
              DropDownSelectEx = False
              DropDownRows = 2
              ListFieldName = 'nDivision;strDescription'
              ListWidth = 111
            end
            object dxDBGridColumn2: TdxDBGridColumn
              Caption = #21306#20998#29992
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              MinWidth = 1
              ReadOnly = True
              Visible = False
              Width = 1
              BandIndex = 1
              RowIndex = 0
              StretchChar.Auto = False
            end
            object dxDBGridMaskColumn1: TdxDBGridMaskColumn
              Caption = #21306#20998#21517
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ReadOnly = True
              TabStop = False
              Width = 36
              BandIndex = 1
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'strDivisionDesc'
            end
            object DtlCSwkGridColumnCode: TdxDBGridButtonColumn
              Caption = #12467#12540#12489
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              HeaderAlignment = taCenter
              Sizing = False
              Width = 81
              BandIndex = 1
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 16
              StretchChar.Auto = True
              FieldName = 'strGCode'
              ClickKey = 115
              OnEditButtonClick = evtdxDBGridColumnCodeEditButtonClick
            end
            object dxDBGridColumn3: TdxDBGridColumn
              Caption = #21517#31216
              DisableEditor = True
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              HeaderAlignment = taCenter
              ReadOnly = True
              TabStop = False
              Width = 90
              BandIndex = 2
              RowIndex = 0
              ImeMode = imDisable
              StretchChar.Auto = False
              FieldName = 'strSubjectDesc'
            end
            object DtlCSwkGridColumnAttr: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'iAttr'
            end
            object DtlCSwkGridColumn8: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'iDigit'
            end
            object DtlCSwkGridColumn9: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'iMasterKbn'
            end
          end
        end
        object PSwkDKmk: TMPanel
          Left = 12
          Top = 20
          Width = 317
          Height = 33
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 0
          object LDKamoku: TMLabel
            Left = 0
            Top = 8
            Width = 52
            Height = 19
            AutoSize = False
            Caption = #21208#23450#31185#30446
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object cLblK1DDsc: TMLabel
            Left = 207
            Top = 8
            Width = 91
            Height = 19
            AutoSize = False
            Caption = 'XXXXXXXXXXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object cCmbK1DCmb: TMComboBox
            Left = 64
            Top = 8
            Width = 52
            Height = 19
            CanEdit = False
            Columns = <
              item
                Width = 52
                Color = clWindow
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end>
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            Items.Strings = (
              #22522#28310
              #32622#25563)
            ParentFont = False
            TabOrder = 0
            OnChange = evtcCmbK1CmbChange
            OnEnter = fnCommonFunctionOnEnter01
          end
          object cEdtK1DNum: TMNumEdit
            Left = 129
            Top = 8
            Width = 62
            Height = 20
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = CmnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            DMaxLength = 8
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 1
            OnChange = fnDtlCEdtExCdK1OnChange
            OnEnter = fnCommonFunctionOnEnter01
            OnExit = evtcEdtKmkNumExit
            Digits = 8
            Validate = False
          end
        end
        object PSwkCKmk: TMPanel
          Left = 355
          Top = 20
          Width = 317
          Height = 33
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 2
          object MLabel10: TMLabel
            Left = 0
            Top = 8
            Width = 52
            Height = 19
            AutoSize = False
            Caption = #21208#23450#31185#30446
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object cLblK1CDsc: TMLabel
            Left = 207
            Top = 8
            Width = 91
            Height = 19
            AutoSize = False
            Caption = 'XXXXXXXXXXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object cCmbK1CCmb: TMComboBox
            Left = 64
            Top = 8
            Width = 52
            Height = 19
            CanEdit = False
            Columns = <
              item
                Width = 52
                Color = clWindow
                Font.Charset = SHIFTJIS_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end>
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            Items.Strings = (
              #22522#28310
              #32622#25563)
            ParentFont = False
            TabOrder = 0
            OnChange = evtcCmbK1CmbChange
            OnEnter = fnCommonFunctionOnEnter01
          end
          object cEdtK1CNum: TMNumEdit
            Left = 129
            Top = 7
            Width = 62
            Height = 20
            ArrowDisp = adFocused
            SelectDisp = sdNone
            OnArrowClick = CmnArrowClick
            ArrowType = atOmission
            F4Arrow = True
            AutoSize = False
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#26126#26397
            Font.Style = []
            DMaxLength = 8
            ImeMode = imDisable
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 1
            OnChange = fnDtlCEdtExCdK1OnChange
            OnEnter = fnCommonFunctionOnEnter01
            OnExit = evtcEdtKmkNumExit
            Digits = 8
            Validate = False
          end
        end
        object PTaxInfo: TMPanel
          Left = 91
          Top = 192
          Width = 550
          Height = 50
          BevelOuter = bvNone
          ParentBackground = False
          ParentColor = True
          TabOrder = 4
          object DtlCmnLbelTaxDivisionTitle: TMLabel
            Left = 0
            Top = 4
            Width = 73
            Height = 19
            AutoSize = False
            Caption = #28040#36027#31246#21306#20998
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLbelTaxCodeTitle: TMLabel
            Left = 0
            Top = 26
            Width = 77
            Height = 19
            AutoSize = False
            Caption = #28040#36027#31246#12467#12540#12489
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLbelTaxDivisionDesc: TMLabel
            Left = 119
            Top = 5
            Width = 35
            Height = 17
            AutoSize = False
            Caption = 'XXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLbelTaxCodeDesc: TMLabel
            Left = 119
            Top = 27
            Width = 182
            Height = 13
            AutoSize = False
            Caption = 'XXXXXXXXXXXXXXXXXXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLbelTaxRateTitle: TMLabel
            Left = 310
            Top = 4
            Width = 62
            Height = 19
            AutoSize = False
            Caption = #28040#36027#31246#29575
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLbelTypeCodeTitle: TMLabel
            Left = 310
            Top = 26
            Width = 62
            Height = 19
            AutoSize = False
            Caption = #26989#31278#12467#12540#12489
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLbelTaxRateDesc: TMLabel
            Left = 412
            Top = 5
            Width = 105
            Height = 17
            AutoSize = False
            Caption = 'XXXXXXXXXXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLbelTypeCodeDesc: TMLabel
            Left = 412
            Top = 27
            Width = 105
            Height = 17
            AutoSize = False
            Caption = 'XXXXXXXXXXXXXX'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnEditTaxDivision: TMNumEdit
            Left = 82
            Top = 4
            Width = 16
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#12394#12375
              '1: '#22770#19978
              '2: '#20181#20837)
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
            OnChange = fnDtlCmnEditTaxDivisionOnChange
            OnEnter = fnCommonFunctionOnEnter01
            OnExit = fnDtlCmnEditTaxDivisionOnExit
            OnKeyDown = fnOnKeyDown
            Validate = False
            Zero = True
          end
          object DtlCmnEditTaxCode: TMNumEdit
            Left = 78
            Top = 26
            Width = 23
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectMaxRowCount = 7
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
            OnChange = fnDtlCmnEditTaxCodeOnChange
            OnEnter = fnCommonFunctionOnEnter01
            OnExit = fnDtlCmnEditTaxCodeOnExit
            OnKeyDown = fnOnKeyDown
            Validate = False
            InputFlagEnabled = True
            Zero = True
          end
          object DtlCmnEditTaxRate: TMNumEdit
            Left = 379
            Top = 4
            Width = 16
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#31185#30446#35373#23450#12395#24467#12358
              '1: '#65299#65285
              '2: '#65301#65285)
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
            OnChange = fnDtlCmnEditTaxRateOnChange
            OnEnter = fnCommonFunctionOnEnter01
            OnExit = fnDtlCmnEditTaxRateOnExit
            OnKeyDown = fnOnKeyDown
            Digits = 1
            Validate = False
            InputFlagEnabled = True
            Zero = True
          end
          object DtlCmnEditTypeCode: TMNumEdit
            Left = 379
            Top = 26
            Width = 16
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#31185#30446#35373#23450#12395#24467#12358
              '1: '#31532#65297#31278#20107#26989
              '2: '#31532#65298#31278#20107#26989
              '3: '#31532#65299#31278#20107#26989
              '4: '#31532#65300#31278#20107#26989
              '5: '#31532#65301#31278#20107#26989
              '6: '#31532#65302#31278#20107#26989)
            SelectMaxRowCount = 7
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
            OnChange = fnDtlCmnEditTypeCodeOnChange
            OnEnter = fnCommonFunctionOnEnter01
            OnExit = fnDtlCmnEditTypeCodeOnExit
            OnKeyDown = fnOnKeyDown
            Validate = False
            InputFlagEnabled = True
            Zero = True
          end
        end
      end
      object DtlCmnPanelAddition4: TMPanel
        Left = 21
        Top = 354
        Width = 684
        Height = 122
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 4
        object MLabel5: TMLabel
          Left = 3
          Top = 8
          Width = 663
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object Pnl_RensoTitle: TMLabel
          Left = 8
          Top = 12
          Width = 57
          Height = 19
          AutoSize = False
          Caption = #31185#30446#36899#24819
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = [fsBold]
          ParentFont = False
          FontRatio.Auto = False
        end
        object DtlCmnPanelGrid: TMPanel
          Left = 147
          Top = 30
          Width = 331
          Height = 92
          BevelOuter = bvNone
          Caption = 'DtlCmnPanelGrid'
          ParentBackground = False
          TabOrder = 0
          object DtlCmnGrid: TdxDBGrid
            Left = 0
            Top = 0
            Width = 331
            Height = 92
            Bands = <
              item
                Caption = #36899' '#24819' '#31185' '#30446
              end
              item
                Caption = #25688#35201#27531#39640
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'nExCode'
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alClient
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnEnter = fnDtlCmnGridOnEnter
            OnKeyDown = fnDtlCmnGridOnKeyDown
            OnKeyPress = fnDtlCmnGridOnKeyPress
            OnMouseDown = fnDtlCmnGridOnMouseDown
            BandColor = 16766672
            BandFont.Charset = SHIFTJIS_CHARSET
            BandFont.Color = clWindowText
            BandFont.Height = -12
            BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            BandFont.Style = []
            DataSource = DtlCmnDataSource
            HeaderColor = 16766672
            HeaderFont.Charset = SHIFTJIS_CHARSET
            HeaderFont.Color = clWindowText
            HeaderFont.Height = -12
            HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            HeaderFont.Style = []
            HideFocusRect = True
            HideSelection = True
            HideSelectionColor = clWindow
            HideSelectionTextColor = clBlack
            HighlightTextColor = clWindowText
            LookAndFeel = lfFlat
            Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
            OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoBandMoving, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
            PreviewFont.Charset = SHIFTJIS_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -12
            PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
            PreviewFont.Style = []
            ScrollBars = ssVertical
            ShowBands = True
            ShowHeader = False
            OnChangeNodeEx = fnDtlCmnGridOnChangeNodeEx
            OnBeforeChangeColumn = fnDtlCmnGridOnBeforeChangeColumn
            object DtlCmnGridColumn5: TdxDBGridColumn
              MinWidth = 1
              ReadOnly = True
              Width = 1
              BandIndex = 0
              RowIndex = 0
              StretchChar.Auto = False
            end
            object DtlCmnGridColumnExCode: TdxDBGridButtonColumn
              Caption = #31185#30446#65402#65392#65412#65438
              HeaderAlignment = taCenter
              Sizing = False
              Width = 81
              BandIndex = 0
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              MaxLength = 6
              StretchChar.Auto = False
              FieldName = 'nExCode'
              ClickKey = 115
              OnEditButtonClick = fnDtlCmnGridColumnExCodeOnEditButtonClick
            end
            object DtlCmnGridColumnCtrlDivision: TdxDBGridLookupColumn
              Width = 20
              BandIndex = 1
              RowIndex = 0
              ImeMode = imDisable
              EditAlignment = taRightJustify
              StretchChar.Auto = False
              FieldName = 'nCtrlDivision'
              DropDownSelectEx = False
              DropDownRows = 2
              ListFieldName = 'nDivision;strDescription'
              ListWidth = 111
            end
            object DtlCmnGridColumnSubjectDesc: TdxDBGridColumn
              Caption = #36899' '#24819' '#31185' '#30446
              HeaderAlignment = taCenter
              ReadOnly = True
              TabStop = False
              Width = 105
              BandIndex = 0
              RowIndex = 0
              ImeMode = imDisable
              StretchChar.Auto = False
              FieldName = 'strSubjectDesc'
            end
            object DtlCmnGridColumnDivisionDesc: TdxDBGridMaskColumn
              ReadOnly = True
              TabStop = False
              Width = 91
              BandIndex = 1
              RowIndex = 0
              StretchChar.Auto = False
              FieldName = 'strDivisionDesc'
            end
          end
        end
      end
    end
    object DtlCmnTab: TMTab
      Left = 0
      Top = 0
      Width = 712
      Height = 44
      Items = <
        item
          Caption = #22266#23450#25688#35201
          Color = 15921906
          Alignment = taCenter
          ImageIndex = 0
          ParentBorderCaption = False
        end
        item
          Caption = #25688#35201#20998#39006
          Color = 15921906
          Alignment = taCenter
          ImageIndex = 0
          BorderCaption = #25688#35201#20998#39006#20307#31995
          ParentBorderCaption = False
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
      OnEnter = fnCommonFunctionOnEnter02
      OnKeyDown = fnDtlCmnTabOnKeyDown
      BorderCaptionAlign = taLeftJustify
      DropShadow = False
    end
    object MPanel2: TMPanel
      Left = 0
      Top = 503
      Width = 712
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        712
        30)
      object DtlCmnButtonUpdate: TMBitBtn
        Left = 544
        Top = 1
        Width = 80
        Height = 25
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
        OnEnter = fnDtlCmnFunctionOnEnter
      end
      object DtlCmnButtonCancel: TMBitBtn
        Left = 627
        Top = 1
        Width = 80
        Height = 25
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
        OnEnter = fnDtlCmnFunctionOnEnter
      end
    end
  end
  object MStatusBar1: TMStatusBar
    Left = 0
    Top = 603
    Width = 945
    Height = 19
    Color = 15921906
    Panels = <>
  end
  object P_Tree1Panel: TMPanel
    Left = 0
    Top = 49
    Width = 230
    Height = 533
    Align = alLeft
    BevelInner = bvLowered
    Color = 14608367
    ParentBackground = False
    TabOrder = 1
    OnEnter = fnCmnTreeViewOnEnter
    object CmnPanelTreeViewTop: TMPanel
      Left = 2
      Top = 2
      Width = 226
      Height = 529
      Align = alClient
      BevelOuter = bvNone
      Caption = 'CmnPanelTreeViewTop'
      ParentBackground = False
      TabOrder = 0
      object CmnTreeView: TTreeView
        Left = 0
        Top = 0
        Width = 226
        Height = 529
        Align = alClient
        BorderStyle = bsNone
        DragMode = dmAutomatic
        HotTrack = True
        Images = CmnTreeViewImage
        Indent = 19
        PopupMenu = CmnTreeViewPopupMenu
        ReadOnly = True
        RightClickSelect = True
        ShowLines = False
        TabOrder = 0
        OnChange = fnCmnTreeViewOnChange
        OnDragDrop = fnCmnTreeViewOnDragDrop
        OnDragOver = fnCmnTreeViewOnDragOver
        OnEnter = fnCmnTreeViewOnEnter
        OnExit = CmnTreeViewExit
      end
    end
  end
  object ComInstructionBar: TMPanel
    Left = 0
    Top = 25
    Width = 945
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    Color = 15921906
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    OnEnter = fnCmnTreeViewOnEnter
    object MLabel27: TMLabel
      Left = 3
      Top = 3
      Width = 929
      Height = 19
      AutoSize = False
      Caption = #25688#35201#20307#31995'                                              '
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
      OnClick = MLabel27Click
      FontRatio.Auto = False
    end
    object CmnComboBoxInstruction: TMComboBox
      Left = 61
      Top = 3
      Width = 169
      Height = 19
      CanEdit = False
      Columns = <
        item
          Width = 169
          Color = clWindow
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end>
      FocusedColor = clAqua
      Items.Strings = (
        #22266#23450#25688#35201
        #31185#30446#36899#24819)
      TabOrder = 0
      OnChange = fnCmnComboBoxInstructionOnChange
      OnEnter = fnCmnComboBoxInstructionOnEnter
      OnKeyDown = fnCmnComboBoxInstructionOnKeyDown
    end
  end
  object PPanelSpeed: TMPanel
    Left = 0
    Top = 0
    Width = 945
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 5
    object BSpeedButtonEnd: TMSpeedButton
      Left = 2
      Top = 2
      Width = 70
      Height = 21
      Caption = #32066#20102'(&X)'
      Flat = True
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
      OnClick = B_EndClick
    end
    object CmnToolbarButtonPrint: TMSpeedButton
      Left = 74
      Top = 2
      Width = 70
      Height = 21
      Caption = #21360#21047'(&P)'
      Flat = True
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
    object B_Change: TMSpeedButton
      Left = 146
      Top = 2
      Width = 70
      Height = 21
      Caption = #20999#20986'(&G)'
      Flat = True
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
      OnClick = B_ChangeClick
    end
    object CmnToolbarButtonDetail: TMSpeedButton
      Left = 218
      Top = 2
      Width = 70
      Height = 21
      Caption = #35443#32048'(&T)'
      Flat = True
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
    object CmnToolbarButtonDelete: TMSpeedButton
      Left = 291
      Top = 2
      Width = 70
      Height = 21
      Caption = #21066#38500'(&D)'
      Flat = True
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
    end
    object B_Search: TMSpeedButton
      Left = 363
      Top = 2
      Width = 70
      Height = 21
      Caption = #26908#32034'(&Q)'
      Enabled = False
      Flat = True
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
        DCDC666666000000000000C0C0C0F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
        F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1C0C0C00000000000
        00666666DEDFDE8B5029DEDFDE8B5029DEDFDEDEDFDEDEDFDEDEDFDE8B5029DE
        DFDE8B5029DEDFDE8B5029DEDFDE666666000000000000C0C0C0F2F2F2B7B7B7
        F2F2F2B7B7B7F2F2F2F2F2F2F2F2F2F2F2F2B7B7B7F2F2F2B7B7B7F2F2F2B7B7
        B7F2F2F2C0C0C0000000000000666666E1E1E0884E28874E28874E28E1E1E087
        4E28874D28E1E1E0874E28884E28884E28884E27874E28E1E1E0666666000000
        000000C0C0C0F3F3F3B6B6B6B6B6B6B6B6B6F3F3F3B6B6B6B5B5B5F3F3F3B6B6
        B6B6B6B6B6B6B6B6B6B6B6B6B6F3F3F3C0C0C0000000000000666666E3E3E3E3
        E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3
        E3E3E3E3E3E3666666000000000000C0C0C0F3F3F3F3F3F3F3F3F3F3F3F3F3F3
        F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3C0C0C000
        0000000000666666E5E6E6E5E6E6E5E6E6E5E6E6E5E6E67D48257C47257C4724
        7C47257D47247D48257C48257C4724E5E6E6666666000000000000C0C0C0F5F5
        F5F5F5F5F5F5F5F5F5F5F5F5F5B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3
        B3B3B3B3B3F5F5F5C0C0C0000000000000666666E8E8E9E8E8E9E8E8E9E8E8E9
        E8E8E9764423FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF764423E8E8E96666
        66000000000000C0C0C0F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6B2B2B2FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2F6F6F6C0C0C0000000000000666666
        EBEBEB704021704021704121EBEBEB704121FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF704021EBEBEB666666000000000000C0C0C0F7F7F7B0B0B0B0B0B0B0
        B0B0F7F7F7B0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B0F7F7F7
        C0C0C0000000000000666666EDEDED6A3D1F6B3D206A3D1FEDEDED6A3D1F6A3E
        206B3D1F6A3D1F6A3D1F6A3D206A3D1F6A3E20EDEDED666666000000000000C0
        C0C0F8F8F8AFAFAFAFAFAFAFAFAFF8F8F8AFAFAFAFAFAFAFAFAFAFAFAFAFAFAF
        AFAFAFAFAFAFAFAFAFF8F8F8C0C0C0000000000000666666F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0666666000000000000C0C0C0F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9
        F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9C0C0C00000000000
        00666666F3F3F3F3F3F3F3F3F3F3F3F3F3F3F35D361C5E361C5E361B5D361B5D
        361C5E361B5E361C5D351CF3F3F3666666000000000000C0C0C0FAFAFAFAFAFA
        FAFAFAFAFAFAFAFAFAACACACACACACACACACACACACACACACACACACACACACABAB
        ABFAFAFAC0C0C0000000000000666666F6F6F6F6F6F6F6F6F6F6F6F6F6F6F658
        321AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57321AF6F6F6666666000000
        000000C0C0C0FBFBFBFBFBFBFBFBFBFBFBFBFBFBFBAAAAAAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFAAAAAAFBFBFBC0C0C0000000000000666666F9F8F852
        2F19522F18513019F9F8F8523018FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        522F19F9F8F8666666000000000000C0C0C0FCFCFCA9A9A9A9A9A9A9A9A9FCFC
        FCA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9FCFCFCC0C0C000
        0000000000666666FCFCFB4E2D174E2D174E2D17FCFCFB4E2D174E2D174E2D17
        4E2D174E2D174E2D174E2D174E2D17FCFCFB666666000000000000C0C0C0FEFE
        FEA8A8A8A8A8A8A8A8A8FEFEFEA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
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
      OnClick = B_SearchClick
    end
    object MToolBar1: TMToolBar
      Left = 439
      Top = 2
      Width = 100
      Height = 22
      Align = alNone
      Caption = 'FusenBar'
      DisabledImages = DisableImage
      Images = CmnToolbarImage
      TabOrder = 0
      Transparent = True
      SysBaseColorB = 10841658
      SysBaseColorD = 6956042
      object CmnToolbarButtonTag: TToolButton
        Left = 0
        Top = 0
        Caption = #20184#31627#36196'(&R)'
        DropdownMenu = CmnToolbarDropDownMenu
        ImageIndex = 4
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = fnCmnToolbarButtonTagOnClick
      end
    end
  end
  object MSPFunctionBar: TMSPFunctionBar
    Left = 0
    Top = 582
    Width = 945
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
    ButtonWidth = 118
    FuncAnchors = True
    SysBaseColorB = 10841658
    SysBaseColorD = 6956042
  end
  object DPrintdxMemData1: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 36
    Top = 152
    object DPrintdxMemData1Fusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object DPrintdxMemData1Gcode: TIntegerField
      FieldName = 'Gcode'
    end
    object DPrintdxMemData1TekiChar: TStringField
      DisplayWidth = 60
      FieldName = 'TekiChar'
      Size = 60
    end
    object DPrintdxMemData1RenChar: TStringField
      FieldName = 'RenChar'
    end
    object DPrintdxMemData1StaxKbn: TStringField
      FieldName = 'StaxKbn'
    end
    object DPrintdxMemData1StaxCode: TIntegerField
      FieldName = 'StaxCode'
    end
    object DPrintdxMemData1StaxRate: TStringField
      FieldName = 'StaxRate'
    end
    object DPrintdxMemData1TypeCode: TStringField
      FieldName = 'TypeCode'
    end
    object DPrintdxMemData1ZanKbn: TStringField
      FieldName = 'ZanKbn'
    end
    object DPrintdxMemData1ExgKbn: TStringField
      FieldName = 'ExgKbn'
    end
    object DPrintdxMemData1BunCode: TStringField
      FieldName = 'BunCode'
    end
    object DPrintdxMemData1UpdateTime: TDateTimeField
      FieldName = 'UpdateTime'
    end
  end
  object DPrintDBPipeline1: TppDBPipeline
    DataSource = DPrintDataSource1
    UserName = 'DPrintDBPipeline'
    Left = 64
    Top = 152
    object DPrintDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object DPrintDBPipeline1ppField2: TppField
      FieldAlias = 'Fusen'
      FieldName = 'Fusen'
      FieldLength = 0
      DataType = dtGraphic
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DPrintDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'Gcode'
      FieldName = 'Gcode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object DPrintDBPipeline1ppField4: TppField
      FieldAlias = 'TekiChar'
      FieldName = 'TekiChar'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object DPrintDBPipeline1ppField5: TppField
      FieldAlias = 'RenChar'
      FieldName = 'RenChar'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object DPrintDBPipeline1ppField6: TppField
      FieldAlias = 'StaxKbn'
      FieldName = 'StaxKbn'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object DPrintDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'StaxCode'
      FieldName = 'StaxCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object DPrintDBPipeline1ppField8: TppField
      FieldAlias = 'StaxRate'
      FieldName = 'StaxRate'
      FieldLength = 20
      DisplayWidth = 20
      Position = 7
    end
    object DPrintDBPipeline1ppField9: TppField
      FieldAlias = 'TypeCode'
      FieldName = 'TypeCode'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object DPrintDBPipeline1ppField10: TppField
      FieldAlias = 'ZanKbn'
      FieldName = 'ZanKbn'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object DPrintDBPipeline1ppField11: TppField
      FieldAlias = 'ExgKbn'
      FieldName = 'ExgKbn'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object DPrintDBPipeline1ppField12: TppField
      FieldAlias = 'BunCode'
      FieldName = 'BunCode'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object DPrintDBPipeline1ppField13: TppField
      FieldAlias = 'UpdateTime'
      FieldName = 'UpdateTime'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
  end
  object DPrintDataSource1: TDataSource
    DataSet = DPrintdxMemData1
    Left = 8
    Top = 152
  end
  object DPrintDBPipeline3: TppDBPipeline
    DataSource = DPrintDataSource3
    UserName = 'DPrintDBPipeline1'
    Left = 64
    Top = 208
  end
  object DPrintDataSource3: TDataSource
    DataSet = DPrintdxMemData3
    Left = 8
    Top = 208
  end
  object DPrintdxMemData3: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 36
    Top = 208
    object DPrintdxMemData3Gcode: TIntegerField
      FieldName = 'Gcode'
    end
    object DPrintdxMemData3TekiChar: TStringField
      DisplayWidth = 60
      FieldName = 'TekiChar'
      Size = 60
    end
    object DPrintdxMemData3RenChar: TStringField
      FieldName = 'RenChar'
    end
    object DPrintdxMemData3UpDateTime: TDateTimeField
      FieldName = 'UpDateTime'
    end
  end
  object DPrintdxMemData2: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 36
    Top = 180
    object DPrintdxMemData2Fusen: TGraphicField
      FieldName = 'Fusen'
      BlobType = ftGraphic
    end
    object DPrintdxMemData2Gcode: TIntegerField
      FieldName = 'Gcode'
    end
    object DPrintdxMemData2TekiChar: TStringField
      FieldName = 'TekiChar'
      Size = 30
    end
    object DPrintdxMemData2RenChar: TStringField
      FieldName = 'RenChar'
    end
    object DPrintdxMemData2StaxKbn: TStringField
      FieldName = 'StaxKbn'
    end
    object DPrintdxMemData2Staxcode: TIntegerField
      FieldName = 'Staxcode'
    end
    object DPrintdxMemData2StaxRate: TStringField
      FieldName = 'StaxRate'
    end
    object DPrintdxMemData2TypeCode: TStringField
      FieldName = 'TypeCode'
    end
    object DPrintdxMemData2ZanKbn: TStringField
      FieldName = 'ZanKbn'
    end
    object DPrintdxMemData2UpDateTime: TDateTimeField
      FieldName = 'UpDateTime'
    end
    object DPrintdxMemData2DKmkCode: TIntegerField
      FieldName = 'DKmkCode'
    end
    object DPrintdxMemData2DKmkName: TStringField
      FieldName = 'DKmkName'
    end
    object DPrintdxMemData2DHoj1Code: TStringField
      FieldName = 'DHojCode'
    end
    object DPrintdxMemData2DHojyo1Name: TStringField
      FieldName = 'DHojName'
    end
    object DPrintdxMemData2CKmkCode: TIntegerField
      FieldName = 'CKmkCode'
    end
    object DPrintdxMemData2CHojyo1Code: TStringField
      FieldName = 'CHojCode'
    end
    object DPrintdxMemData2CKmkName: TStringField
      FieldName = 'CKmkName'
    end
    object DPrintdxMemData2CHojyo1Name: TStringField
      FieldName = 'CHojName'
    end
    object DPrintdxMemData2bDtlLast: TBooleanField
      FieldName = 'bDtlLast'
    end
    object DPrintdxMemData2iLine: TIntegerField
      FieldName = 'iLine'
    end
    object DPrintdxMemData2DiAttr: TIntegerField
      FieldName = 'DiAttr'
    end
    object DPrintdxMemData2CiAttr: TIntegerField
      FieldName = 'CiAttr'
    end
    object DPrintdxMemData2BusDicKbn: TStringField
      FieldName = 'BusDicKbn'
      Size = 24
    end
  end
  object DPrintDBPipeline2: TppDBPipeline
    DataSource = DPrintDataSource2
    UserName = 'DPrintDBPipeline2'
    Left = 64
    Top = 180
  end
  object DPrintDataSource2: TDataSource
    DataSet = DPrintdxMemData2
    Left = 8
    Top = 180
  end
  object DPrintdxMemData5: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 36
    Top = 264
    object DPrintdxMemData5KGcodeC: TStringField
      FieldName = 'KGcodeC'
    end
    object DPrintdxMemData5TRenChar: TStringField
      FieldName = 'TRenChar'
    end
    object DPrintdxMemData5KTekiCharN: TStringField
      FieldName = 'KTekiCharN'
      Size = 30
    end
    object DPrintdxMemData5MGcodec: TStringField
      FieldName = 'MGcodec'
    end
    object DPrintdxMemData5RenChar: TStringField
      FieldName = 'RenChar'
    end
    object DPrintdxMemData5MTekiCharN: TStringField
      DisplayWidth = 60
      FieldName = 'MTekiCharN'
      Size = 60
    end
  end
  object DPrintDBPipeline5: TppDBPipeline
    DataSource = DPrintDataSource5
    UserName = 'DPrintDBPipeline5'
    Left = 64
    Top = 264
  end
  object DPrintDataSource5: TDataSource
    DataSet = DPrintdxMemData5
    Left = 8
    Top = 264
  end
  object RReport4: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '38100'
      '171450')
    DataPipeline = DPrintDBPipeline4
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4'
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
    BeforePrint = BeforePrint
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
    Left = 92
    Top = 236
    Version = '19.04'
    mmColumnWidth = 123190
    DataPipelineName = 'DPrintDBPipeline4'
    object ppHeaderBand6: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppLabel54: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label54'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22266#23450#25688#35201#20307#31995#30331#37682#12522#12473#12488
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 18
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 130969
        mmTop = 0
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground
      end
      object ppLine17: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 130969
        mmTop = 5027
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground
      end
      object LCorpCode3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LppCorpCode3'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpCode'
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
        mmLeft = 0
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground
      end
      object LCorpName3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LppCorpName3'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpName'
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
        mmLeft = 16933
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground
      end
      object SVppDate3: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'SVppDate2'
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
        mmLeft = 247650
        mmTop = 0
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLine19: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line19'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1323
        mmWidth = 121444
        BandType = 2
        LayerName = Foreground
      end
      object ppLine20: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line20'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3704
        mmLeft = 265
        mmTop = 0
        mmWidth = 121444
        BandType = 2
        LayerName = Foreground
      end
      object ppLabel58: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label58'
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
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground
      end
      object ppLabel59: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label59'
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
        mmHeight = 3969
        mmLeft = 12171
        mmTop = 1058
        mmWidth = 47890
        BandType = 2
        LayerName = Foreground
      end
      object ppLabel60: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label60'
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
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 61913
        mmTop = 1058
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground
      end
      object ppLabel61: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Label61'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25688#35201
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
        mmHeight = 3969
        mmLeft = 73025
        mmTop = 1058
        mmWidth = 47890
        BandType = 2
        LayerName = Foreground
      end
      object ppLine75: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line75'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5292
        mmLeft = 72231
        mmTop = 0
        mmWidth = 2381
        BandType = 2
        LayerName = Foreground
      end
      object ppLine77: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line77'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 60854
        mmTop = 0
        mmWidth = 2381
        BandType = 2
        LayerName = Foreground
      end
      object ppLine79: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line79'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 11377
        mmTop = 0
        mmWidth = 2381
        BandType = 2
        LayerName = Foreground
      end
      object ppLine16: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line16'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 265
        mmTop = 0
        mmWidth = 2381
        BandType = 2
        LayerName = Foreground
      end
      object ppLine18: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line18'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5292
        mmLeft = 121709
        mmTop = 0
        mmWidth = 2381
        BandType = 2
        LayerName = Foreground
      end
    end
    object PDetailBandKT: TppDetailBand
      BeforeGenerate = PDetailBandKTBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object PLineKT: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'PLineKT'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3704
        mmLeft = 265
        mmTop = 265
        mmWidth = 121444
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText67: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText67'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Gcode'
        DataPipeline = DPrintDBPipeline4
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline4'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 0
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText68: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText68'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'BunName'
        DataPipeline = DPrintDBPipeline4
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline4'
        mmHeight = 3969
        mmLeft = 12171
        mmTop = 0
        mmWidth = 48006
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText69: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText69'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'GcodeT'
        DataPipeline = DPrintDBPipeline4
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline4'
        mmHeight = 3969
        mmLeft = 61913
        mmTop = 0
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText70: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'DBText70'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TekiChar'
        DataPipeline = DPrintDBPipeline4
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline4'
        mmHeight = 3969
        mmLeft = 73025
        mmTop = 0
        mmWidth = 48006
        BandType = 4
        LayerName = Foreground
      end
      object ppLine76: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line76'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 60854
        mmTop = 0
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground
      end
      object ppLine35: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line35'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 72231
        mmTop = 0
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground
      end
      object ppLine80: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line80'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 265
        mmTop = 0
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground
      end
      object ppLine82: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line82'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 0
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground
      end
      object ppLine78: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'Line78'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 11377
        mmTop = 0
        mmWidth = 2381
        BandType = 4
        LayerName = Foreground
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
    object ppFooterBand6: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object SVppPage3: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'SVppPage6'
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
        mmLeft = 159544
        mmTop = 2117
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground
      end
      object LAccOffice3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer1
        UserName = 'LppAccOffice2'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppAccOffice'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 247650
        mmTop = 1058
        mmWidth = 69586
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
  object RReport1: TppReport
    AutoStop = False
    DataPipeline = DPrintDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4'
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
    BeforePrint = BeforePrint
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
    Left = 92
    Top = 152
    Version = '19.04'
    mmColumnWidth = 339068
    DataPipelineName = 'DPrintDBPipeline1'
    object ppHeaderBand8: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 20320
      mmPrintPosition = 0
      object ppLine3: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line1203'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3175
        mmLeft = 48473
        mmTop = 17198
        mmWidth = 235747
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine4: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line4'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3175
        mmLeft = 48473
        mmTop = 15346
        mmWidth = 235747
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel67: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label67'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22266#23450#25688#35201#30331#37682#12522#12473#12488
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 18
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 141023
        mmTop = 3175
        mmWidth = 57150
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine93: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'UnderLine2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 6350
        mmLeft = 140759
        mmTop = 4233
        mmWidth = 57679
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel68: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label68'
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
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3969
        mmLeft = 54029
        mmTop = 16404
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel69: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label69'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25688#35201
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
        mmHeight = 3969
        mmLeft = 65142
        mmTop = 16404
        mmWidth = 47890
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel70: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label70'
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
        mmHeight = 3969
        mmLeft = 114619
        mmTop = 16404
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel71: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label71'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #28040#36027#31246#21306#20998
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
        mmHeight = 3969
        mmLeft = 132346
        mmTop = 16404
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel72: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label72'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #28040#36027#31246#12467#12540#12489
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
        mmHeight = 3969
        mmLeft = 149809
        mmTop = 16404
        mmWidth = 19315
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel73: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label73'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #28040#36027#31246#29575
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
        mmLeft = 170711
        mmTop = 16404
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel74: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label74'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #26989#31278
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
        mmHeight = 3969
        mmLeft = 185264
        mmTop = 16404
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel75: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label75'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21462#24341#20808#21306#20998
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
        mmLeft = 199817
        mmTop = 16404
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel76: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label76'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #21462#24341#20808#20998#39006
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
        mmHeight = 3969
        mmLeft = 217280
        mmTop = 16404
        mmWidth = 19315
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel77: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label77'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25688#35201#27531#31649#29702
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
        mmLeft = 238182
        mmTop = 16404
        mmWidth = 15875
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel78: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Label78'
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
        mmHeight = 3969
        mmLeft = 255645
        mmTop = 16404
        mmWidth = 27252
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine96: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line96'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 64348
        mmTop = 15346
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine97: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line97'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 52971
        mmTop = 15346
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine99: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line99'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 113561
        mmTop = 15346
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine100: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line100'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 131288
        mmTop = 15346
        mmWidth = 3440
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine102: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line102'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 148750
        mmTop = 15346
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine104: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line104'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 169652
        mmTop = 15346
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine106: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line106'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 184205
        mmTop = 15346
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine114: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line114'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 198758
        mmTop = 15346
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine115: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line115'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 216221
        mmTop = 15346
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine116: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line116'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 237123
        mmTop = 15346
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine119: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line119'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 254586
        mmTop = 15346
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground1
      end
      object LppCorpCode: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'LppCorpCode2'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpCode'
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
        mmLeft = 0
        mmTop = 0
        mmWidth = 15610
        BandType = 0
        LayerName = Foreground1
      end
      object LppCorpName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'LppCorpName2'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpName'
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
        mmLeft = 16933
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground1
      end
      object SVppDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'SVppDate4'
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
        mmLeft = 247650
        mmTop = 0
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine1: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line1'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 48473
        mmTop = 15347
        mmWidth = 2910
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine2: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line2'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5027
        mmLeft = 284220
        mmTop = 15346
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground1
      end
    end
    object PDetailBandM: TppDetailBand
      BeforeGenerate = PDetailBandMBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object PFuterLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'PFuterLine'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3175
        mmLeft = 48473
        mmTop = 794
        mmWidth = 235747
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBImage1: TppDBImage
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBImage1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Border.mmPadding = 0
        DataField = 'Fusen'
        DataPipeline = DPrintDBPipeline1
        GraphicType = 'Bitmap'
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 3440
        mmLeft = 49267
        mmTop = 265
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine122: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line1201'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 48473
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText77: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText77'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Gcode'
        DataPipeline = DPrintDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 4064
        mmLeft = 53922
        mmTop = 0
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText75: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText75'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TekiChar'
        DataPipeline = DPrintDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 4064
        mmLeft = 65123
        mmTop = 0
        mmWidth = 48006
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText76: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText76'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RenChar'
        DataPipeline = DPrintDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 3969
        mmLeft = 114729
        mmTop = 0
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText78: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText78'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'StaxKbn'
        DataPipeline = DPrintDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 4064
        mmLeft = 137132
        mmTop = 0
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText79: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText79'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'StaxCode'
        DataPipeline = DPrintDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 4064
        mmLeft = 157935
        mmTop = 0
        mmWidth = 3200
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText80: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText80'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'StaxRate'
        DataPipeline = DPrintDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 4064
        mmLeft = 173937
        mmTop = 0
        mmWidth = 6401
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText81: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText81'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TypeCode'
        DataPipeline = DPrintDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 4064
        mmLeft = 185264
        mmTop = 0
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText83: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText83'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ExgKbn'
        DataPipeline = DPrintDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 3969
        mmLeft = 199817
        mmTop = 0
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText84: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText84'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'BunCode'
        DataPipeline = DPrintDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 3969
        mmLeft = 217280
        mmTop = 0
        mmWidth = 19315
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText82: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText82'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ZanKbn'
        DataPipeline = DPrintDBPipeline1
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 3969
        mmLeft = 238182
        mmTop = 0
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground1
      end
      object ppDBText85: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'DBText85'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'UpdateTime'
        DataPipeline = DPrintDBPipeline1
        DisplayFormat = 'ee/mm/dd hh:nn:ss'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline1'
        mmHeight = 3969
        mmLeft = 255645
        mmTop = 0
        mmWidth = 27252
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine94: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line94'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 52971
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine95: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line95'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 64348
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine98: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line98'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 113561
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine101: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line101'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 131288
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine103: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line103'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 148750
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine105: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line105'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 169652
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine107: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line107'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 184206
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine117: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line117'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 198758
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine83: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line91'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 216221
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine84: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line92'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 237073
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine121: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line121'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 254586
        mmTop = 0
        mmWidth = 2910
        BandType = 4
        LayerName = Foreground1
      end
      object ppLine124: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'Line1202'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 284220
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand8: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object SVppPage: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'SVppPage4'
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
        mmLeft = 163050
        mmTop = 0
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground1
      end
      object LppAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer2
        UserName = 'LppAccOffice4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppAccOffice'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 247650
        mmTop = 0
        mmWidth = 69850
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
  object RReport2: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '1000'
      '172456')
    DataPipeline = DPrintDBPipeline2
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4'
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
    BeforePrint = BeforePrint
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
    Left = 92
    Top = 180
    Version = '19.04'
    mmColumnWidth = 0
    DataPipelineName = 'DPrintDBPipeline2'
    object ppHeaderBand9: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 20320
      mmPrintPosition = 0
      object ppLabel79: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label79'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #20181#35379#36766#26360#25688#35201#30331#37682#12522#12473#12488
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 18
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 134610
        mmTop = 529
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine125: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line401'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 6350
        mmLeft = 134610
        mmTop = 1323
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground2
      end
      object LCorpCode1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'LppCorpCode5'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpCode'
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
        mmLeft = 0
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground2
      end
      object LCorpName1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'LppCorpName5'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpName'
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
        mmLeft = 16933
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground2
      end
      object SVppData1: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'SVppDate5'
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
        mmLeft = 267386
        mmTop = 0
        mmWidth = 70115
        BandType = 0
        LayerName = Foreground2
      end
    end
    object ppColumnHeaderBand2: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabel80: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label80'
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
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3800
        mmLeft = 5808
        mmTop = 1000
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground2
      end
      object ppLabel81: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label81'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25688#35201
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
        mmHeight = 3800
        mmLeft = 17186
        mmTop = 1000
        mmWidth = 47890
        BandType = 2
        LayerName = Foreground2
      end
      object ppLabel83: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label83'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = ' '#28040#36027#31246' '
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
        mmHeight = 3800
        mmLeft = 66663
        mmTop = 1000
        mmWidth = 12700
        BandType = 2
        LayerName = Foreground2
      end
      object ppLabel89: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label89'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #20511#26041#24773#22577
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
        mmHeight = 3800
        mmLeft = 81215
        mmTop = 1000
        mmWidth = 39952
        BandType = 2
        LayerName = Foreground2
      end
      object ppLabel90: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Label90'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #36024#26041#24773#22577
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
        mmHeight = 3800
        mmLeft = 122754
        mmTop = 1000
        mmWidth = 39952
        BandType = 2
        LayerName = Foreground2
      end
      object ppLine10: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line10'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 781
        mmTop = 0
        mmWidth = 162454
        BandType = 2
        LayerName = Foreground2
      end
      object ppLine11: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line108'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 781
        mmTop = 0
        mmWidth = 162454
        BandType = 2
        LayerName = Foreground2
      end
      object ppLine130: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line130'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5821
        mmLeft = 5015
        mmTop = 0
        mmWidth = 4233
        BandType = 2
        LayerName = Foreground2
      end
      object ppLine132: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line132'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5821
        mmLeft = 16127
        mmTop = 0
        mmWidth = 4233
        BandType = 2
        LayerName = Foreground2
      end
      object ppLine133: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line133'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 65869
        mmTop = 0
        mmWidth = 4233
        BandType = 2
        LayerName = Foreground2
      end
      object ppLine135: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line135'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5821
        mmLeft = 80157
        mmTop = 0
        mmWidth = 4233
        BandType = 2
        LayerName = Foreground2
      end
      object ppLine150: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line150'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5292
        mmLeft = 121696
        mmTop = 0
        mmWidth = 4233
        BandType = 2
        LayerName = Foreground2
      end
      object ppLine8: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1301'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5821
        mmLeft = 780
        mmTop = 0
        mmWidth = 4233
        BandType = 2
        LayerName = Foreground2
      end
      object ppLine9: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line1501'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 163235
        mmTop = 0
        mmWidth = 2381
        BandType = 2
        LayerName = Foreground2
      end
    end
    object PDetailBandST: TppDetailBand
      BeforeGenerate = PDetailBandSTBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 18143
      mmPrintPosition = 0
      object ppLine151: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line151'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 18143
        mmLeft = 781
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText86: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText86'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Fusen'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 1310
        mmTop = 265
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText87: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText87'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Gcode'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 6073
        mmTop = 265
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText88: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText88'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TekiChar'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 17186
        mmTop = 265
        mmWidth = 48006
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText89: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText89'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RenChar'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 17186
        mmTop = 4763
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText94: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText94'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'ZanKbn'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 17186
        mmTop = 9260
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText95: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText95'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'UpDateTime'
        DataPipeline = DPrintDBPipeline2
        DisplayFormat = 'ee/mm/dd hh:nn:ss'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 17186
        mmTop = 13758
        mmWidth = 27252
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText90: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText90'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'StaxKbn'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 69838
        mmTop = 265
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText91: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText91'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Staxcode'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 71425
        mmTop = 4763
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText92: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText92'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'StaxRate'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 69838
        mmTop = 9260
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText1: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TypeCode'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 66796
        mmTop = 13758
        mmWidth = 12435
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText96: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText96'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DKmkCode'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 84390
        mmTop = 265
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText98: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText98'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DBmnCode'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 81215
        mmTop = 4763
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText99: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText99'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DSegCode'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 81215
        mmTop = 9260
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText101: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText101'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DHojyo1Code'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 81215
        mmTop = 13758
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText97: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText97'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CKmkCode'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 125929
        mmTop = 265
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText100: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText100'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CBmnCode'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 122754
        mmTop = 4763
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText104: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText104'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CSegCode'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 122754
        mmTop = 9260
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText105: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText105'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CHojyo1Code'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 122754
        mmTop = 13758
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine126: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line126'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 18143
        mmLeft = 5015
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine129: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line129'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 18143
        mmLeft = 16127
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine131: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line131'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 18143
        mmLeft = 65869
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine148: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line148'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 18143
        mmLeft = 80157
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine149: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line149'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 18143
        mmLeft = 139158
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText108: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText108'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DKmkName'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 98677
        mmTop = 265
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText109: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText109'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DBmnName'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 98677
        mmTop = 4763
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText110: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText110'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DSegName'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 98677
        mmTop = 9260
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText111: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText111'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'DHojyo1Name'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 98677
        mmTop = 13758
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText114: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText114'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CKmkName'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 140216
        mmTop = 265
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText115: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText115'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CBmnName'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 140216
        mmTop = 4763
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText116: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText116'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CSegName'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 140216
        mmTop = 9260
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText117: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'DBText117'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'CHojyo1Name'
        DataPipeline = DPrintDBPipeline2
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline2'
        mmHeight = 3969
        mmLeft = 140216
        mmTop = 13758
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine5: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 18143
        mmLeft = 97619
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine7: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line7'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 18143
        mmLeft = 121696
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground2
      end
      object PLienST: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'PLienST'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1
        mmLeft = 781
        mmTop = 18142
        mmWidth = 162454
        BandType = 4
        LayerName = Foreground2
      end
      object ppLine6: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'Line6'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 18143
        mmLeft = 163235
        mmTop = 0
        mmWidth = 1588
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppColumnFooterBand7: TppColumnFooterBand
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
      mmHeight = 3969
      mmPrintPosition = 0
      object SVppPage1: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'SVppPage3'
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
        mmLeft = 162050
        mmTop = 0
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground2
      end
      object LAccOffice1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer3
        UserName = 'LppAccOffice5'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppAccOffice'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 247650
        mmTop = 0
        mmWidth = 69850
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
  object RReport3: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '41530'
      '154456')
    DataPipeline = DPrintDBPipeline3
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4'
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
    BeforePrint = BeforePrint
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
    Left = 92
    Top = 208
    Version = '19.04'
    mmColumnWidth = 169534
    DataPipelineName = 'DPrintDBPipeline3'
    object ppHeaderBand10: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine154: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'UnderLine3'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 6350
        mmLeft = 134673
        mmTop = 2381
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel91: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label91'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22266#23450#25688#35201#20998#39006#30331#37682#12522#12473#12488
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 18
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 134610
        mmTop = 1852
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground3
      end
      object LCorpCode2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'LppCorpCode4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpCode'
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
        mmLeft = 0
        mmTop = 0
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground3
      end
      object LCorpName2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'LppCorpName4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpName'
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
        mmLeft = 16933
        mmTop = 0
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground3
      end
      object SVppDate2: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'SVppDate6'
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
        mmLeft = 247650
        mmTop = 0
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground3
      end
    end
    object ppColumnHeaderBand3: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine14: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line14'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 18255
        mmTop = 1588
        mmWidth = 107156
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine15: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line15'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 18255
        mmTop = 0
        mmWidth = 107156
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine159: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line159'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5821
        mmLeft = 96309
        mmTop = 0
        mmWidth = 4233
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel107: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label107'
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
        mmLeft = 19050
        mmTop = 1588
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel108: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label108'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25688#35201
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
        mmLeft = 30163
        mmTop = 1588
        mmWidth = 47890
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel109: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label109'
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
        mmLeft = 79640
        mmTop = 1588
        mmWidth = 15875
        BandType = 2
        LayerName = Foreground3
      end
      object ppLabel110: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Label110'
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
        mmLeft = 97367
        mmTop = 1588
        mmWidth = 27252
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine155: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line155'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5292
        mmLeft = 29104
        mmTop = 0
        mmWidth = 4233
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine157: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line157'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 78581
        mmTop = 0
        mmWidth = 4233
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine12: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line12'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5292
        mmLeft = 18255
        mmTop = 0
        mmWidth = 4233
        BandType = 2
        LayerName = Foreground3
      end
      object ppLine13: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line13'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5821
        mmLeft = 125413
        mmTop = 0
        mmWidth = 4233
        BandType = 2
        LayerName = Foreground3
      end
    end
    object PDetailBandKB: TppDetailBand
      BeforeGenerate = PDetailBandKBBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object PLine1KB: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'PLine1KB'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 18256
        mmTop = 0
        mmWidth = 107156
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText120: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText120'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'UpDateTime'
        DataPipeline = DPrintDBPipeline3
        DisplayFormat = 'ee/mm/dd hh:nn:ss'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline3'
        mmHeight = 3969
        mmLeft = 97367
        mmTop = 0
        mmWidth = 27252
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText121: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText121'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RenChar'
        DataPipeline = DPrintDBPipeline3
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline3'
        mmHeight = 3969
        mmLeft = 79640
        mmTop = 0
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText122: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText122'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TekiChar'
        DataPipeline = DPrintDBPipeline3
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline3'
        mmHeight = 3969
        mmLeft = 30163
        mmTop = 0
        mmWidth = 48006
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText123: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'DBText123'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Gcode'
        DataPipeline = DPrintDBPipeline3
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        VerticalAlignment = avCenter
        FormatTraiangle = False
        Distributed = False
        Layout = tlCenter
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline3'
        mmHeight = 3969
        mmLeft = 19050
        mmTop = 0
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine156: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line156'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 29104
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine158: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line158'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 78581
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine160: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line160'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 96309
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine161: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line161'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 125413
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground3
      end
      object ppLine162: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'Line162'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 18256
        mmTop = 0
        mmWidth = 4233
        BandType = 4
        LayerName = Foreground3
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
    object ppFooterBand10: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object SVppPage2: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'SVppPage5'
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
        mmLeft = 163248
        mmTop = 0
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground3
      end
      object LAccOffice2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer4
        UserName = 'LppAccOffice6'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppAccOffice'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 247650
        mmTop = 0
        mmWidth = 69850
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
  object RReport5: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '0'
      '160020')
    DataPipeline = DPrintDBPipeline5
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'B4'
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
    BeforePrint = BeforePrint
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
    Left = 92
    Top = 264
    Version = '19.04'
    mmColumnWidth = 169534
    DataPipelineName = 'DPrintDBPipeline5'
    object ppHeaderBand12: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppLabel119: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label119'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #31185#30446#36899#24819#30331#37682#12522#12473#12488'('#31185#30446#12467#12540#12489#38918')'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 18
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 118269
        mmTop = 265
        mmWidth = 101600
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine174: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line174'
        Border.mmPadding = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 118269
        mmTop = 3440
        mmWidth = 101600
        BandType = 0
        LayerName = Foreground4
      end
      object LCorpCode4: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'LCorpCode4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpCode'
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
        mmLeft = 265
        mmTop = 265
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground4
      end
      object LCorpName4: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'LCorpName4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpName'
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
        mmLeft = 17198
        mmTop = 265
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground4
      end
      object SVppDate4: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'SVppDate4'
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
        mmLeft = 247650
        mmTop = 0
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground4
      end
    end
    object ppColumnHeaderBand5: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5537
      mmPrintPosition = 0
      object ppLine24: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line24'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3175
        mmLeft = 16933
        mmTop = 0
        mmWidth = 140759
        BandType = 2
        LayerName = Foreground4
      end
      object ppLine23: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line23'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 16933
        mmTop = 3686
        mmWidth = 141023
        BandType = 2
        LayerName = Foreground4
      end
      object ppLabel123: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label123'
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
        mmHeight = 3440
        mmLeft = 18534
        mmTop = 1323
        mmWidth = 9601
        BandType = 2
        LayerName = Foreground4
      end
      object ppLabel124: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label124'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31185#30446#21517
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
        mmHeight = 3440
        mmLeft = 50538
        mmTop = 1323
        mmWidth = 22403
        BandType = 2
        LayerName = Foreground4
      end
      object ppLabel125: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label125'
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
        mmHeight = 3440
        mmLeft = 76142
        mmTop = 1323
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground4
      end
      object ppLabel126: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label126'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25688#35201
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
        mmHeight = 3440
        mmLeft = 108070
        mmTop = 1323
        mmWidth = 48006
        BandType = 2
        LayerName = Foreground4
      end
      object ppLine177: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line177'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5537
        mmLeft = 29633
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground4
      end
      object ppLine179: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line179'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5537
        mmLeft = 74542
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground4
      end
      object ppLine181: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line181'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5537
        mmLeft = 106469
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground4
      end
      object ppLine21: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line21'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5537
        mmLeft = 16934
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground4
      end
      object ppLine22: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line22'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5537
        mmLeft = 157676
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground4
      end
      object ppLabel8: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label8'
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
        mmHeight = 3439
        mmLeft = 31336
        mmTop = 1323
        mmWidth = 16002
        BandType = 2
        LayerName = Foreground4
      end
      object ppLine62: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line62'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5537
        mmLeft = 48948
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground4
      end
      object ppLine64: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line64'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5537
        mmLeft = 87267
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground4
      end
      object ppLabel10: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Label10'
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
        mmHeight = 3439
        mmLeft = 88867
        mmTop = 1323
        mmWidth = 16002
        BandType = 2
        LayerName = Foreground4
      end
    end
    object PDetailBandKR: TppDetailBand
      BeforeGenerate = PDetailBandKRBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4064
      mmPrintPosition = 0
      object ppDBText128: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText128'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'MTekiCharN'
        DataPipeline = DPrintDBPipeline5
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline5'
        mmHeight = 3175
        mmLeft = 108070
        mmTop = 528
        mmWidth = 48006
        BandType = 4
        LayerName = Foreground4
      end
      object PLineKR: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'PLineKR'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1323
        mmLeft = 16933
        mmTop = 2646
        mmWidth = 141023
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText129: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText129'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KTekiCharN'
        DataPipeline = DPrintDBPipeline5
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline5'
        mmHeight = 3175
        mmLeft = 50536
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText130: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText130'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KGcodeC'
        DataPipeline = DPrintDBPipeline5
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
        DataPipelineName = 'DPrintDBPipeline5'
        mmHeight = 3175
        mmLeft = 18534
        mmTop = 529
        mmWidth = 9601
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText131: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText131'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'MGcodec'
        DataPipeline = DPrintDBPipeline5
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
        DataPipelineName = 'DPrintDBPipeline5'
        mmHeight = 3175
        mmLeft = 76142
        mmTop = 529
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine176: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line176'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 16933
        mmTop = 0
        mmWidth = 3704
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine178: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line178'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 29634
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine180: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line180'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 74542
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine182: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line182'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 106469
        mmTop = 0
        mmWidth = 3704
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine183: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line183'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 157676
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText16: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText16'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RenChar'
        DataPipeline = DPrintDBPipeline5
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
        DataPipelineName = 'DPrintDBPipeline5'
        mmHeight = 3175
        mmLeft = 31336
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine63: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line63'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 48948
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground4
      end
      object ppLine65: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'Line1801'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 87267
        mmTop = 0
        mmWidth = 3175
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText17: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'DBText17'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TRenChar'
        DataPipeline = DPrintDBPipeline5
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
        DataPipelineName = 'DPrintDBPipeline5'
        mmHeight = 3175
        mmLeft = 88867
        mmTop = 528
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground4
      end
    end
    object ppColumnFooterBand5: TppColumnFooterBand
      AlignToBottom = True
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand12: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object SVppPage4: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'SVppPage4'
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
        mmLeft = 161661
        mmTop = 2117
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground4
      end
      object LAccOffice4: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer5
        UserName = 'LAccOffice4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppAccOffice'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 247650
        mmTop = 1058
        mmWidth = 69850
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
  object DPrintDataSource4: TDataSource
    DataSet = DPrintdxMemData4
    Left = 8
    Top = 236
  end
  object DPrintDBPipeline4: TppDBPipeline
    DataSource = DPrintDataSource4
    UserName = 'DPrintDBPipeline4'
    Left = 64
    Top = 236
  end
  object DPrintdxMemData4: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 36
    Top = 236
    object DPrintdxMemData4Gcode: TIntegerField
      FieldName = 'Gcode'
    end
    object DPrintdxMemData4BunName: TStringField
      DisplayWidth = 60
      FieldName = 'BunName'
      Size = 60
    end
    object DPrintdxMemData4GcodeT: TIntegerField
      FieldName = 'GcodeT'
    end
    object DPrintdxMemData4TekiChar: TStringField
      DisplayWidth = 60
      FieldName = 'TekiChar'
      Size = 60
    end
  end
  object StdCmnDataSourceExist: TDataSource
    OnStateChange = fnStdCmnDataSourceExistOnStateChange
    Left = 8
    Top = 68
  end
  object StdCmnMemDataExist: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = fnStdCmnMemDataExistBeforePost
    Left = 36
    Top = 68
    object StdCmnMemDataExistgrTag: TGraphicField
      Alignment = taCenter
      FieldName = 'grTag'
      BlobType = ftGraphic
    end
    object StdCmnMemDataExistnExCode: TIntegerField
      FieldName = 'nExCode'
    end
    object StdCmnMemDataExistAssociation: TStringField
      FieldName = 'strAssociation'
      Size = 10
    end
    object StdCmnMemDataExistName: TStringField
      DisplayWidth = 60
      FieldName = 'strName'
      Size = 60
    end
    object StdCmnMemDataExiststrComment: TStringField
      FieldName = 'strComment'
      Size = 60
    end
  end
  object StdCmnMemDataTotal: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = fnStdCmnMemDataTotalBeforePost
    Left = 36
    Top = 96
    object StdCmnMemDataTotalnExCode: TIntegerField
      FieldName = 'nExCode'
    end
    object StdCmnMemDataTotalAssociation: TStringField
      FieldName = 'strAssociation'
      Size = 10
    end
    object StdCmnMemDataTotalName: TStringField
      DisplayWidth = 60
      FieldName = 'strName'
      Size = 60
    end
  end
  object StdCmnDataSourceTotal: TDataSource
    OnStateChange = fnStdCmnDataSourceTotalOnStateChange
    Left = 8
    Top = 96
  end
  object CmnTreeViewImage: TImageList
    Left = 8
    Top = 349
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400000000000000000000000000000000000000000000000000424242004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420042424200000000000000000000000000000000004242
      4200424242004242420042424200424242004242420042424200424242004242
      4200424242004242420000000000000000000000000000000000000000000000
      0000000000000000000042424200424242004242420000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630042424200000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363004242420000000000000000000000000000000000424242004242
      4200424242004242420063636300636363006363630042424200424242004242
      42004242420042424200424242000000000000000000FFFFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000063636300ADADF700ADAD
      F700ADADF700ADADF700ADADF700ADADF700ADADF700ADADF700ADADF700ADAD
      F700ADADF700636363004242420000000000000000000000000063636300DEC6
      DE0063636300DEC6DE00DEC6DE00DEC6DE00DEC6DE00DEC6E700DEC6DE00DEC6
      E700636363004242420000000000000000000000000063636300636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630042424200000000000000000000FFFF00848484000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000848400008484000000000000000000636363009C9CEF009C9C
      EF009C9CEF009C9CEF009C9CEF009C9CEF009C9CEF009C9CEF009C9CEF009C9C
      EF009C9CEF00636363004242420000000000000000000000000063636300D6C6
      DE0063636300D6C6DE00D6C6DE00D6C6DE00D6C6DE00D6C6DE00D6C6DE00D6C6
      DE00636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      00000000000063636300424242000000000000000000FFFFFF0084848400FFFF
      FF00000000000000000000000000000000000084840000848400008484000084
      8400008484000084840000848400000000000000000063636300948CE700948C
      E700948CE700948CE700948CE700948CE700948CE700948CE700948CE700948C
      E700948CE700636363004242420000000000000000000000000063636300CEBD
      D60063636300CEBDD600CEBDD600CEBDD600CEBDD600CEBDD600CEBDD600CEBD
      D600636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      4200000000006363630042424200000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300847BD600847B
      D600847BD600847BD600847BD600847BD600847BD600847BD600847BD600847B
      D600847BD600636363004242420000000000000000000000000063636300CEB5
      CE0063636300CEB5CE00CEB5CE00CEB5CE00CEB5CE00CEB5CE00CEB5CE00CEB5
      CE00636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      00000000000063636300424242000000000000000000FFFFFF0084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00C6C6
      C600000000000000000000000000000000000000000063636300736BCE00736B
      CE00736BCE00736BCE00736BCE00736BCE00736BCE00736BCE00736BCE00736B
      CE00736BCE00636363004242420000000000000000000000000063636300C6AD
      C60063636300C6ADC600C6ADC600C6ADC600C6ADC600C6ADC600C6ADC600C6AD
      C600636363004242420000000000000000000000000063636300000000000000
      0000424242004242420000000000636363000000000042424200000000004242
      4200000000006363630042424200000000000000000000FFFF0084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000636363006352BD006352
      BD006352BD006352BD006352BD006352BD006352BD006352BD006352BD006352
      BD006352BD00636363004242420000000000000000000000000063636300BDA5
      BD0063636300BDA5BD00BDA5BD00BDA5BD00BDA5BD00BDA5BD00BDA5BD00BDA5
      BD00636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      000000000000636363004242420000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF008484840000FF
      000000FF000000000000000000000000000000000000636363005242AD005242
      AD005242AD005242AD005242AD005242AD000000000000000000000000000000
      000000000000636363004242420000000000000000000000000063636300BDA5
      B50063636300BDA5B5006363630063636300636363006363630063636300BDA5
      B500636363004242420000000000000000000000000063636300000000004242
      4200000000004242420000000000636363000000000042424200424242000000
      000000000000636363004242420000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00848484008484840000FF
      000000FF00000000000000000000000000000000000063636300000000004229
      A5004229A5004229A5004229A500000000006363630063636300636363006363
      630063636300636363000000000000000000000000000000000063636300B59C
      B50063636300B59CB5004242420042424200424242004242420042424200B59C
      B500636363004242420000000000000000000000000063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      000000000000636363004242420000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C6008484840000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000636363000000
      0000000000000000000000000000636363000000000000000000000000000000
      000000000000000000000000000000000000000000000000000063636300B59C
      AD0063636300B59CAD00B59CAD00B59CAD00B59CAD00B59CAD00B59CAD00B59C
      AD00636363004242420000000000000000000000000063636300000000004242
      4200424242004242420000000000636363000000000042424200424242004242
      420000000000636363004242420000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008484840000FF000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000006363
      6300636363006363630063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363000000
      0000636363000000000000000000000000000000000000000000000000000000
      0000636363004242420000000000000000000000000063636300000000000000
      0000000000000000000063636300636363006363630000000000000000000000
      0000000000006363630042424200000000000000000000000000848484008484
      84008484840084848400848484008484840084848400848484008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363000000000000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000063636300636363006363
      6300636363006363630000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000FFFFFFFFFFFFF0007C001E003FC7F
      00038001C003C00100018001C003800100008001C003BEF900008001C003A289
      00008001C003BEF900078001C003B2A900038001C003BEF9800380F9C003AA99
      C001A103C003BEF9C000DEFFC003A289C000E1FFD7F3BC79C001FFFFC0078383
      FFC3FFFFFFFFFFFFFFE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFE003F003FC7FF003
      C003E003C001E003C003EFF38001EFF3C003EFF3BEF9EFF3C003E853A289E9D3
      C003EFF3BEF9EE73C003E813B2A9EA13C003EFF3BEF9EF0BC003EC93AA99ED07
      C003EFF3BEF9EF83C003E813A289E841D7F3EFF3BC79EFE3C007EFF38383EFF7
      FFFFE007FFFFE00FFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object CmnTreeViewPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = fnCmnTreeViewPopupMenuOnPopup
    Left = 8
    Top = 377
    object CmnTreeViewPopupMenuDetail: TMenuItem
      Caption = #35443#32048
      ImageIndex = 0
      OnClick = fnCmnTreeViewPopupMenuDetailOnClick
    end
    object CmnTreeViewPopupMenuBreak01: TMenuItem
      Caption = '-'
    end
    object CmnTreeViewPopupMenuCopy: TMenuItem
      Caption = #20182#12398#20998#39006#12408#12467#12500#12540
      ImageIndex = 0
      OnClick = fnCmnTreeViewPopupMenuCopyOnClick
    end
    object CmnTreeViewPopupMenuPaste: TMenuItem
      Caption = #20182#12398#20998#39006#12363#12425#36028#12426#20184#12369
      ImageIndex = 0
      OnClick = fnCmnTreeViewPopupMenuPasteOnClick
    end
    object CmnTreeViewPopupMenuBreak02: TMenuItem
      Caption = '-'
    end
    object CmnTreeViewPopupMenuErase: TMenuItem
      Caption = #20998#39006#12395#21547#12414#12394#12356
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
      OnClick = fnCmnTreeViewPopupMenuTagOnClick
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
    object CmnTreeViewPopupMenuTag001: TMenuItem
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
    object CmnTreeViewPopupMenuTag002: TMenuItem
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
    object CmnTreeViewPopupMenuTag003: TMenuItem
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
    object CmnTreeViewPopupMenuTag004: TMenuItem
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
  object CmnImageGeneral: TImageList
    Left = 36
    Top = 349
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      3100CECECE003131310000000000000000000000000031313100426B1800426B
      1800426B180031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100C68C4A00C68C
      4A00C68C4A0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100318CFF00318C
      FF00318CFF0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE0031313100000000000000000000000000313131005A4AB5005A4A
      B5005A4AB50031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100638C4200638C
      4200638C420031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100CEA56B00CEA5
      6B00D6A56B0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE00313131000000000000000000313131005AADFF005AAD
      FF005AADFF0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE00313131000000000000000000313131007363CE00736B
      CE007363CE0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100739C5A00739C
      5A00739C5A0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100D6B57B00D6B5
      7B00D6B57B0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      31003131310031313100313131000000000000000000313131007BBDFF007BBD
      FF007BBDFF0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      31003131310031313100313131000000000000000000313131008484DE008484
      DE008484DE0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003131310000000000000000003131310084B5730084AD
      730084AD730031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100DEBD9400DEBD
      9400DEBD940031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003131310000000000000000003131310094CEFF0094CE
      FF0094CEFF0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00313131000000000000000000313131009C9CEF009C9C
      EF009C9CEF0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF003131310000000000000000003131310094BD840094BD
      840094BD840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7CEA500E7CE
      A500E7CEA50031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100ADD6F700ADD6
      F700ADD6F70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100ADADF700ADAD
      F700ADADF70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100A5CE9400A5CE
      9400A5CE940031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100EFD6AD00EFD6
      AD00EFD6AD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000080070000000000008003000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      80010000000000008001000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80078007800780078003800380038003
      8001800180018001800180018001800180018001800180018001800180018001
      80018001800180018001800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object StdCmnGridPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = fnStdCmnGridPopupMenuOnPopup
    Left = 36
    Top = 377
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
  end
  object CmnTreeViewPopupMenuEx: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = fnCmnTreeViewPopupMenuExOnPopup
    Left = 92
    Top = 377
    object CmnTreeViewPopupMenuExErase: TMenuItem
      Caption = #31185#30446#36899#24819#12363#12425#22806#12377
      ImageIndex = 0
      OnClick = fnCmnTreeViewPopupMenuExEraseOnClick
    end
  end
  object DtlCmnPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = fnDtlCmnPopupMenuOnPopup
    Left = 64
    Top = 377
    object DtlCmnPopupMenuTagOff: TMenuItem
      Caption = #12399#12364#12377'(&D)'
      OnClick = fnDtlCmnPopupMenuTagOnClick
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
      OnClick = fnDtlCmnPopupMenuTagOnClick
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
      OnClick = fnDtlCmnPopupMenuTagOnClick
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
      OnClick = fnDtlCmnPopupMenuTagOnClick
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
      OnClick = fnDtlCmnPopupMenuTagOnClick
    end
  end
  object CmnDataSourcePrintKanaOrder: TDataSource
    DataSet = CmnMemDataPrintKanaOrder
    Left = 8
    Top = 124
  end
  object CmnMemDataPrintKanaOrder: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 36
    Top = 124
    object CmnMemDataPrintKanaOrdernExCode: TIntegerField
      FieldName = 'nExCode'
    end
    object CmnMemDataPrintKanaOrderstrDescription: TStringField
      DisplayWidth = 60
      FieldName = 'strDescription'
      Size = 60
    end
  end
  object CmnPipelinePrintKanaOrder: TppDBPipeline
    DataSource = CmnDataSourcePrintKanaOrder
    UserName = 'CmnPipelinePrintKanaOrder'
    Left = 64
    Top = 124
  end
  object CmnReportKanaOrder: TppReport
    AutoStop = False
    Columns = 4
    ColumnPositions.Strings = (
      '0'
      '45507'
      '91016'
      '136525')
    DataPipeline = CmnPipelinePrintKanaOrder
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.OutputPaperName = 'B4 (JIS)'
    PrinterSetup.mmMarginBottom = 4999
    PrinterSetup.mmMarginLeft = 20000
    PrinterSetup.mmMarginRight = 4999
    PrinterSetup.mmMarginTop = 4999
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
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
    Left = 92
    Top = 124
    Version = '19.04'
    mmColumnWidth = 45212
    DataPipelineName = 'CmnPipelinePrintKanaOrder'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
    end
    object ppColumnHeaderBand7: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand_CmnReportSystem: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4234
      mmPrintPosition = 0
      object CmnPrintFieldExCode: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'CmnPrintFieldExCode'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'nExCode'
        DataPipeline = CmnPipelinePrintKanaOrder
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
        DataPipelineName = 'CmnPipelinePrintKanaOrder'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 529
        mmWidth = 8202
        BandType = 4
        LayerName = Foreground5
      end
      object CmnPrintFieldDescription: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer6
        UserName = 'CmnPrintFieldDescription'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'strDescription'
        DataPipeline = CmnPipelinePrintKanaOrder
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
        DataPipelineName = 'CmnPipelinePrintKanaOrder'
        mmHeight = 3175
        mmLeft = 10054
        mmTop = 529
        mmWidth = 35454
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
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
    end
    object ppPageStyle1: TppPageStyle
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 282576
      mmPrintPosition = 0
      object ppShape1: TppShape
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Shape2'
        mmHeight = 265642
        mmLeft = 0
        mmTop = 10583
        mmWidth = 182298
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel3: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Label3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65402#65392#65412#65438
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 10
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 11906
        mmWidth = 7408
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine26: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line26'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 265641
        mmLeft = 8996
        mmTop = 10583
        mmWidth = 1588
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel4: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Label4'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25688'  '#35201'  '#21517'  '#31216
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 10
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 14817
        mmTop = 11906
        mmWidth = 24871
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine28: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line28'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 265641
        mmLeft = 45508
        mmTop = 10583
        mmWidth = 1323
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine36: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line36'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 0
        mmTop = 14817
        mmWidth = 182299
        BandType = 10
        LayerName = PageLayer1
      end
      object CmnReportKanaOrderSysVarPage: TppSystemVariable
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
        mmLeft = 84138
        mmTop = 279401
        mmWidth = 12700
        BandType = 10
        LayerName = PageLayer1
      end
      object CmnReportKanaOrderDepAccOffice: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'CmnReportKanaOrderDepAccOffice'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #12354#12356#12358#12360#12362#12363#12365#12367#12369#12371
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 2910
        mmLeft = 127265
        mmTop = 278342
        mmWidth = 55298
        BandType = 10
        LayerName = PageLayer1
      end
      object CmnReportSystemLabelTitle: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'CmnReportCsStdppLabelTitle1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #22266#23450#25688#35201#19968#35239#34920
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
        mmLeft = 69850
        mmTop = 1323
        mmWidth = 44450
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine120: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3440
        mmLeft = 69321
        mmTop = 5292
        mmWidth = 45773
        BandType = 10
        LayerName = PageLayer1
      end
      object CmnReportKanaOrderSysVarDate: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'CmnReportCsStdppSysVarDate1'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        mmHeight = 2910
        mmLeft = 138377
        mmTop = 0
        mmWidth = 43656
        BandType = 10
        LayerName = PageLayer1
      end
      object CmnReportKanaOrderLabelCorpCode: TppLabel
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
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 2910
        mmLeft = 0
        mmTop = 0
        mmWidth = 13494
        BandType = 10
        LayerName = PageLayer1
      end
      object CmnReportKanaOrderLabelCorpName: TppLabel
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
        Font.Size = 8
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 2910
        mmLeft = 14023
        mmTop = 0
        mmWidth = 33602
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel1: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Label1'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65402#65392#65412#65438
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 10
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 46567
        mmTop = 11906
        mmWidth = 7408
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine25: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line25'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 265641
        mmLeft = 54504
        mmTop = 10583
        mmWidth = 1588
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Label2'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25688'  '#35201'  '#21517'  '#31216
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 10
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 60325
        mmTop = 11906
        mmWidth = 24871
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine27: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line27'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 265641
        mmLeft = 91017
        mmTop = 10583
        mmWidth = 1323
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel5: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Label5'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65402#65392#65412#65438
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 10
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 92075
        mmTop = 11906
        mmWidth = 7408
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine29: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line29'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 265641
        mmLeft = 100013
        mmTop = 10583
        mmWidth = 1588
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel6: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Label6'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25688'  '#35201'  '#21517'  '#31216
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 10
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 105834
        mmTop = 11906
        mmWidth = 24871
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine30: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line30'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 265641
        mmLeft = 136525
        mmTop = 10583
        mmWidth = 1323
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel7: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Label7'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #65402#65392#65412#65438
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 10
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 137584
        mmTop = 11906
        mmWidth = 7408
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLine31: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Line31'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 265641
        mmLeft = 145521
        mmTop = 10583
        mmWidth = 1588
        BandType = 10
        LayerName = PageLayer1
      end
      object ppLabel9: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer7
        UserName = 'Label9'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #25688'  '#35201'  '#21517'  '#31216
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 10
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3440
        mmLeft = 151342
        mmTop = 11906
        mmWidth = 24871
        BandType = 10
        LayerName = PageLayer1
      end
    end
    object ppDesignLayers6: TppDesignLayers
      object ppDesignLayer7: TppDesignLayer
        UserName = 'PageLayer1'
        LayerType = ltPage
        Index = 0
      end
      object ppDesignLayer6: TppDesignLayer
        UserName = 'Foreground5'
        LayerType = ltBanded
        Index = 1
      end
    end
    object ppParameterList6: TppParameterList
    end
  end
  object CmnToolbarImage: TImageList
    Height = 15
    Left = 64
    Top = 349
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
  object CmnToolbarDropDownMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 120
    Top = 377
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
  object DtlCmnMemData: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = fnDtlCmnMemDataBeforePost
    Left = 54
    Top = 577
    object DtlCmnMemDatanExCode: TIntegerField
      FieldName = 'nExCode'
    end
    object DtlCmnMemDatastrSubjectDesc: TStringField
      FieldName = 'strSubjectDesc'
      Size = 30
    end
    object DtlCmnMemDatanCtrlDivision: TSmallintField
      FieldKind = fkLookup
      FieldName = 'nCtrlDivision'
      LookupDataSet = DtlCmnMemDataControl
      LookupKeyFields = 'nDivision'
      LookupResultField = 'nDivision'
      KeyFields = 'nDivisionData'
      Lookup = True
    end
    object DtlCmnMemDatastrDivisionDesc: TStringField
      FieldKind = fkLookup
      FieldName = 'strDivisionDesc'
      LookupDataSet = DtlCmnMemDataControl
      LookupKeyFields = 'nDivision'
      LookupResultField = 'strDescription'
      KeyFields = 'nDivisionData'
      Size = 8
      Lookup = True
    end
    object DtlCmnMemDatanDivisionData: TSmallintField
      FieldName = 'nDivisionData'
    end
  end
  object DtlCmnDataSource: TDataSource
    DataSet = DtlCmnMemData
    OnStateChange = fnDtlCmnDataSourceOnStateChange
    OnDataChange = fnDtlCmnDataSourceOnDataChange
    Left = 26
    Top = 577
  end
  object DtlCmnMemDataControl: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 82
    Top = 577
    object IntegerField1: TIntegerField
      DisplayWidth = 2
      FieldName = 'nDivision'
    end
    object StringField1: TStringField
      DisplayWidth = 8
      FieldName = 'strDescription'
      Size = 30
    end
  end
  object DPrintDataSource7: TDataSource
    DataSet = DPrintdxMemData7
    Left = 8
    Top = 320
  end
  object DPrintDBPipeline7: TppDBPipeline
    DataSource = DPrintDataSource7
    UserName = 'DPrintDBPipeline7'
    Left = 64
    Top = 320
    object DPrintDBPipeline7ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RecId'
      FieldName = 'RecId'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object DPrintDBPipeline7ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TGCode'
      FieldName = 'TGCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object DPrintDBPipeline7ppField3: TppField
      FieldAlias = 'TekiChar'
      FieldName = 'TekiChar'
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object DPrintDBPipeline7ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'KGCode'
      FieldName = 'KGCode'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object DPrintDBPipeline7ppField5: TppField
      FieldAlias = 'SimpleName'
      FieldName = 'SimpleName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
  end
  object RReport7: TppReport
    AutoStop = False
    Columns = 3
    ColumnPositions.Strings = (
      '10160'
      '111760'
      '213360')
    DataPipeline = DPrintDBPipeline7
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
    PrinterSetup.PaperSize = 256
    PrinterSetup.mmEvenMarginBottom = 0
    PrinterSetup.mmEvenMarginLeft = 0
    PrinterSetup.mmEvenMarginRight = 0
    PrinterSetup.mmEvenMarginTop = 0
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
    BeforePrint = BeforePrint
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
    Left = 100
    Top = 320
    Version = '19.04'
    mmColumnWidth = 100323
    DataPipelineName = 'DPrintDBPipeline7'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Label119'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #31185#30446#36899#24819#30331#37682#12522#12473#12488'('#25688#35201#12467#12540#12489#38918')'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 18
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 111654
        mmTop = 0
        mmWidth = 101600
        BandType = 0
        LayerName = Foreground6
      end
      object ppLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line174'
        Border.mmPadding = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 117739
        mmTop = 3175
        mmWidth = 101600
        BandType = 0
        LayerName = Foreground6
      end
      object LCorpCode5: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'LCorpCode4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpCode'
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
        mmLeft = 265
        mmTop = 265
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground6
      end
      object LCorpName5: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'LCorpName4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpName'
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
        mmLeft = 16933
        mmTop = 265
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground6
      end
      object SVppDate5: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'SVppDate4'
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
        mmLeft = 247650
        mmTop = 0
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground6
      end
    end
    object ppColumnHeaderBand4: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Label126'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25688#35201
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
        mmHeight = 3439
        mmLeft = 15088
        mmTop = 1323
        mmWidth = 47890
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine33: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line24'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3175
        mmLeft = 3440
        mmTop = 0
        mmWidth = 95779
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine34: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line23'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 3440
        mmTop = 3703
        mmWidth = 95779
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel12: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Label123'
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
        mmHeight = 3440
        mmLeft = 3969
        mmTop = 1323
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel14: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Label125'
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
        mmHeight = 3439
        mmLeft = 64577
        mmTop = 1323
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine37: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line177'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 14288
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine38: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line179'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5292
        mmLeft = 63777
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine39: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line181'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5292
        mmLeft = 74902
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine40: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line21'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 3440
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground6
      end
      object ppLine41: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line22'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5292
        mmLeft = 99219
        mmTop = 0
        mmWidth = 3704
        BandType = 2
        LayerName = Foreground6
      end
      object ppLabel13: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Label124'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31185#30446#21517
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
        mmHeight = 3440
        mmLeft = 75702
        mmTop = 1323
        mmWidth = 22490
        BandType = 2
        LayerName = Foreground6
      end
    end
    object PDetailBand: TppDetailBand
      BeforeGenerate = PDetailBandBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4064
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText128'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TekiChar'
        DataPipeline = DPrintDBPipeline7
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline7'
        mmHeight = 3175
        mmLeft = 15088
        mmTop = 794
        mmWidth = 48006
        BandType = 4
        LayerName = Foreground6
      end
      object PLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'PLineKR'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1588
        mmLeft = 3440
        mmTop = 2646
        mmWidth = 95779
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText8: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText130'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TGCode'
        DataPipeline = DPrintDBPipeline7
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
        DataPipelineName = 'DPrintDBPipeline7'
        mmHeight = 3175
        mmLeft = 4233
        mmTop = 794
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText9: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText131'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'KGCode'
        DataPipeline = DPrintDBPipeline7
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
        DataPipelineName = 'DPrintDBPipeline7'
        mmHeight = 3175
        mmLeft = 64577
        mmTop = 794
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine43: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line176'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 0
        mmWidth = 3704
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine44: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line178'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 14288
        mmTop = 0
        mmWidth = 3704
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine45: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line180'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 63777
        mmTop = 0
        mmWidth = 3704
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine46: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line182'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 74902
        mmTop = 0
        mmWidth = 3704
        BandType = 4
        LayerName = Foreground6
      end
      object ppLine47: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'Line183'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 99219
        mmTop = 0
        mmWidth = 3704
        BandType = 4
        LayerName = Foreground6
      end
      object ppDBText7: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'DBText129'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SimpleName'
        DataPipeline = DPrintDBPipeline7
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        FormatTraiangle = False
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        FormatSignType = fstDefault
        DataPipelineName = 'DPrintDBPipeline7'
        mmHeight = 3175
        mmLeft = 75702
        mmTop = 794
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground6
      end
    end
    object ppColumnFooterBand4: TppColumnFooterBand
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
      mmHeight = 6085
      mmPrintPosition = 0
      object SVppPage5: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'SVppPage4'
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
        mmLeft = 152136
        mmTop = 2117
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground6
      end
      object LAccOffice5: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer8
        UserName = 'LAccOffice4'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppAccOffice'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 247650
        mmTop = 1058
        mmWidth = 69850
        BandType = 8
        LayerName = Foreground6
      end
    end
    object ppDesignLayers7: TppDesignLayers
      object ppDesignLayer8: TppDesignLayer
        UserName = 'Foreground6'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList7: TppParameterList
    end
  end
  object DPrintdxMemData7: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 36
    Top = 320
    object DPrintdxMemData7TGCode: TIntegerField
      FieldName = 'TGCode'
    end
    object DPrintdxMemData7TekiChar: TStringField
      DisplayWidth = 30
      FieldName = 'TekiChar'
      Size = 30
    end
    object DPrintdxMemData7KGCode: TIntegerField
      FieldName = 'KGCode'
    end
    object DPrintdxMemData7SimpleName: TStringField
      FieldName = 'SimpleName'
    end
  end
  object RReport6: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '0'
      '167020')
    DataPipeline = DPrintDBPipeline6
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
    PrinterSetup.PaperSize = 256
    PrinterSetup.mmEvenMarginBottom = 0
    PrinterSetup.mmEvenMarginLeft = 0
    PrinterSetup.mmEvenMarginRight = 0
    PrinterSetup.mmEvenMarginTop = 0
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
    Left = 135
    Top = 320
    Version = '19.04'
    mmColumnWidth = 168533
    DataPipelineName = 'DPrintDBPipeline6'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object LCorpCode6: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'LCorpCode6'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpCode'
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
        mmLeft = 265
        mmTop = 265
        mmWidth = 15081
        BandType = 0
        LayerName = Foreground7
      end
      object LCorpName6: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'LCorpName6'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppCorpName'
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
        mmLeft = 16933
        mmTop = 265
        mmWidth = 41010
        BandType = 0
        LayerName = Foreground7
      end
      object SVppDate6: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'SVppDate6'
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
        mmLeft = 262090
        mmTop = 0
        mmWidth = 69850
        BandType = 0
        LayerName = Foreground7
      end
      object pTitleName: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'pTitleName'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        Caption = #31185#30446#36899#24819#30331#37682#12522#12473#12488'('#25688#35201#36899#24819#38918')'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 18
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 6350
        mmLeft = 116946
        mmTop = 265
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground7
      end
      object pTitleLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'pTitleLine'
        Border.mmPadding = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 116946
        mmTop = 3440
        mmWidth = 95250
        BandType = 0
        LayerName = Foreground7
      end
    end
    object ppColumnHeaderBand6: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 5291
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Label16'
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
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 3283
        mmTop = 1323
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground7
      end
      object ppLabel17: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Label17'
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
        mmLeft = 16008
        mmTop = 1323
        mmWidth = 16002
        BandType = 2
        LayerName = Foreground7
      end
      object ppLabel18: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Label18'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25688#35201
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
        mmLeft = 35211
        mmTop = 1323
        mmWidth = 47890
        BandType = 2
        LayerName = Foreground7
      end
      object ppLabel19: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Label19'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #28040#36027#31246#12467#12540#12489
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
        mmLeft = 86417
        mmTop = 1323
        mmWidth = 19050
        BandType = 2
        LayerName = Foreground7
      end
      object ppLabel31: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Label31'
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
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 108857
        mmTop = 1323
        mmWidth = 9525
        BandType = 2
        LayerName = Foreground7
      end
      object ppLabel20: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Label20'
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
        mmLeft = 121583
        mmTop = 1323
        mmWidth = 16002
        BandType = 2
        LayerName = Foreground7
      end
      object ppLabel21: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Label21'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #31185#30446#21517
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
        mmLeft = 140785
        mmTop = 1323
        mmWidth = 22490
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine32: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line32'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 1807
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine42: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line42'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 14408
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine48: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line48'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 33611
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine49: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line49'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 84817
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine50: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line50'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 107257
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine51: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line501'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 119983
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine52: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line52'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 139185
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine91: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line91'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 5556
        mmLeft = 164788
        mmTop = 0
        mmWidth = 2117
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine53: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line53'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 2381
        mmLeft = 1933
        mmTop = 0
        mmWidth = 162934
        BandType = 2
        LayerName = Foreground7
      end
      object ppLine54: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line54'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 1933
        mmTop = 3440
        mmWidth = 162934
        BandType = 2
        LayerName = Foreground7
      end
    end
    object SDetailBand: TppDetailBand
      BeforeGenerate = SDetailBandBeforeGenerate
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4064
      mmPrintPosition = 0
      object ppLine55: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line55'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 1807
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine56: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line56'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 14408
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine57: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line57'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 33611
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine58: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line58'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 84817
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine59: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line502'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 107257
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine60: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line60'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 4064
        mmLeft = 119983
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine61: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line61'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 139185
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground7
      end
      object ppLine92: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'Line92'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 3969
        mmLeft = 164788
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground7
      end
      object FLine: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'FLine'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2117
        mmLeft = 1933
        mmTop = 1852
        mmWidth = 162934
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText10: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'DBText10'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TekiCode'
        DataPipeline = DPrintDBPipeline6
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
        DataPipelineName = 'DPrintDBPipeline6'
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 529
        mmWidth = 9260
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText11: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer9
        UserName = 'DBText11'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TRenChar'
        DataPipeline = DPrintDBPipeline6
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
        DataPipelineName = 'DPrintDBPipeline6'
        mmHeight = 3175
        mmLeft = 16008
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText12: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'DBText12'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TekiChar'
        DataPipeline = DPrintDBPipeline6
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
        DataPipelineName = 'DPrintDBPipeline6'
        mmHeight = 3175
        mmLeft = 35211
        mmTop = 529
        mmWidth = 47890
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText18: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'DBText18'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'TaxCode'
        DataPipeline = DPrintDBPipeline6
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
        DataPipelineName = 'DPrintDBPipeline6'
        mmHeight = 3175
        mmLeft = 86417
        mmTop = 529
        mmWidth = 19000
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText13: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'DBText13'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'Kmkcode'
        DataPipeline = DPrintDBPipeline6
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
        DataPipelineName = 'DPrintDBPipeline6'
        mmHeight = 3175
        mmLeft = 108857
        mmTop = 529
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText14: TppDBText
        FontRatio.Auto = True
        DesignLayer = ppDesignLayer9
        UserName = 'DBText14'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'RenChar'
        DataPipeline = DPrintDBPipeline6
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
        DataPipelineName = 'DPrintDBPipeline6'
        mmHeight = 3175
        mmLeft = 121583
        mmTop = 529
        mmWidth = 16002
        BandType = 4
        LayerName = Foreground7
      end
      object ppDBText15: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'DBText15'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SimpleName'
        DataPipeline = DPrintDBPipeline6
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
        DataPipelineName = 'DPrintDBPipeline6'
        mmHeight = 3175
        mmLeft = 140790
        mmTop = 529
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground7
      end
    end
    object ppColumnFooterBand6: TppColumnFooterBand
      AlignToBottom = True
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand3: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 6086
      mmPrintPosition = 0
      object LAccOffice6: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'LAccOffice6'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'LppAccOffice'
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Name = #65325#65331' '#26126#26397
        Font.Size = 9
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        Distributed = False
        Layout = tlTop
        Distributed2 = False
        mmHeight = 3175
        mmLeft = 247650
        mmTop = 1058
        mmWidth = 69850
        BandType = 8
        LayerName = Foreground7
      end
      object SVppPage6: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer9
        UserName = 'SVppPage6'
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
        mmLeft = 160867
        mmTop = 1852
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground7
      end
    end
    object ppDesignLayers8: TppDesignLayers
      object ppDesignLayer9: TppDesignLayer
        UserName = 'Foreground7'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList8: TppParameterList
    end
  end
  object DPrintdxMemData6: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 163
    Top = 320
    object DPrintdxMemData6TekiCode: TIntegerField
      FieldName = 'TekiCode'
    end
    object DPrintdxMemData6TRenChar: TStringField
      FieldName = 'TRenChar'
    end
    object DPrintdxMemData6TekiChar: TStringField
      DisplayWidth = 60
      FieldName = 'TekiChar'
      Size = 60
    end
    object DPrintdxMemData6TaxCode: TStringField
      FieldName = 'TaxCode'
    end
    object DPrintdxMemData6Kmkcode: TIntegerField
      FieldName = 'Kmkcode'
    end
    object DPrintdxMemData6RenChar: TStringField
      FieldName = 'RenChar'
    end
    object DPrintdxMemData6SimpleName: TStringField
      FieldName = 'SimpleName'
    end
  end
  object DPrintDataSource6: TDataSource
    DataSet = DPrintdxMemData6
    Left = 135
    Top = 292
  end
  object DPrintDBPipeline6: TppDBPipeline
    DataSource = DPrintDataSource6
    UserName = 'DPrintDBPipeline6'
    Left = 163
    Top = 292
  end
  object ImLst: TImageList
    Width = 32
    Left = 8
    Top = 449
    Bitmap = {
      494C010102000400040020001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000001000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE0000000000BDBDBD00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00BDBDBD0000000000DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE0000000000BDBDBD00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEDEDE008C6300008C63
      00008C6300008C6300008C6300008C6300008C630000DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE0000000000BDBDBD00EFEFEF00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00BDBDBD0000000000DEDEDE008C6300008C63
      00008C6300008C6300008C6300008C6300008C630000DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00DEDEDE00DEDEDE0000000000BDBDBD00EFEFEF00ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7E7008C630000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C630000E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E70000000000BDBDBD00EFEFEF00ADADAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00BDBDBD0000000000E7E7E7008C630000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C630000E7E7E700E7E7E700E7E7
      E700E7E7E700E7E7E700E7E7E70000000000BDBDBD00EFEFEF00ADADAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00EFEFEF00EFEFEF00EFEF
      EF00EFEFEF00EFEFEF00EFEFEF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7E7008C630000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C6300008C6300008C6300008C63
      00008C6300008C630000E7E7E70000000000BDBDBD00F7F7F700ADADAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00F7F7F700BDBDBD0000000000E7E7E7008C630000FFFF
      FF008C6300008C6300008C6300008C6300008C6300008C6300008C6300008C63
      00008C6300008C630000E7E7E70000000000BDBDBD00F7F7F700ADADAD00FFFF
      FF00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00F7F7F700BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7E7008C630000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C630000FFFFFF008C630000FFFF
      FF00FFFFFF008C630000E7E7E70000000000BDBDBD00F7F7F700ADADAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00FFFFFF00ADADAD00FFFF
      FF00FFFFFF00ADADAD00F7F7F700BDBDBD0000000000E7E7E7008C630000FFFF
      FF008C630000FFFFFF00FFFFFF00FFFFFF008C630000FFFFFF008C630000FFFF
      FF00FFFFFF008C630000E7E7E70000000000BDBDBD00F7F7F700ADADAD00FFFF
      FF00ADADAD00FFFFFF00FFFFFF00FFFFFF00ADADAD00FFFFFF00ADADAD00FFFF
      FF00FFFFFF00ADADAD00F7F7F700BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF008C630000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C630000FFFFFF008C630000FFFF
      FF00FFFFFF008C630000EFEFEF0000000000BDBDBD00F7F7F700ADADAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00FFFFFF00ADADAD00FFFF
      FF00FFFFFF00ADADAD00F7F7F700BDBDBD0000000000EFEFEF008C630000FFFF
      FF008C630000FFFFFF00FFFFFF00FFFFFF008C630000FFFFFF008C630000FFFF
      FF00FFFFFF008C630000EFEFEF0000000000BDBDBD00F7F7F700ADADAD00FFFF
      FF00ADADAD00FFFFFF00FFFFFF00FFFFFF00ADADAD00FFFFFF00ADADAD00FFFF
      FF00FFFFFF00ADADAD00F7F7F700BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF008C6300008C63
      00008C6300008C6300008C6300008C6300008C630000FFFFFF008C630000FFFF
      FF00FFFFFF008C630000EFEFEF0000000000BDBDBD00F7F7F700ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00FFFFFF00ADADAD00FFFF
      FF00FFFFFF00ADADAD00F7F7F700BDBDBD0000000000EFEFEF008C6300008C63
      00008C6300008C6300008C6300008C6300008C630000FFFFFF008C630000FFFF
      FF00FFFFFF008C630000EFEFEF0000000000BDBDBD00F7F7F700ADADAD00ADAD
      AD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00FFFFFF00ADADAD00FFFF
      FF00FFFFFF00ADADAD00F7F7F700BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EFEFEF00EFEFEF00EFEF
      EF008C630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C630000FFFF
      FF00FFFFFF008C630000EFEFEF0000000000BDBDBD00F7F7F700F7F7F700F7F7
      F700ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00FFFF
      FF00FFFFFF00ADADAD00F7F7F700BDBDBD0000000000EFEFEF00EFEFEF00EFEF
      EF008C630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C630000FFFF
      FF00FFFFFF008C630000EFEFEF0000000000BDBDBD00F7F7F700F7F7F700F7F7
      F700ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAD00FFFF
      FF00FFFFFF00ADADAD00F7F7F700BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700F7F7F700F7F7
      F7008C6300008C6300008C6300008C6300008C6300008C6300008C630000FFFF
      FF00FFFFFF008C630000F7F7F70000000000BDBDBD00F7F7F700FFFFFF00FFFF
      FF00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00FFFF
      FF00FFFFFF00ADADAD00F7F7F700BDBDBD0000000000F7F7F700F7F7F700F7F7
      F7008C6300008C6300008C6300008C6300008C6300008C6300008C630000FFFF
      FF00FFFFFF008C630000F7F7F70000000000BDBDBD00F7F7F700FFFFFF00FFFF
      FF00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00FFFF
      FF00FFFFFF00ADADAD00F7F7F700BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700F7F7F700F7F7
      F7008C630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008C630000F7F7F70000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ADADAD00FFFFFF00BDBDBD0000000000F7F7F700F7F7F700F7F7
      F7008C630000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008C630000F7F7F70000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ADADAD00FFFFFF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700F7F7F700F7F7
      F7008C6300008C6300008C6300008C6300008C6300008C6300008C6300008C63
      00008C6300008C630000F7F7F70000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00FFFFFF00BDBDBD0000000000F7F7F700F7F7F700F7F7
      F7008C6300008C6300008C6300008C6300008C6300008C6300008C6300008C63
      00008C6300008C630000F7F7F70000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00FFFFFF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF008C630000F7C67B00F7C67B00F7C67B00F7C67B00F7C67B00F7C67B00F7C6
      7B00F7C67B008C630000FFFFFF0000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00ADADAD00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00ADADAD00FFFFFF00BDBDBD0000000000FFFFFF00FFFFFF00FFFF
      FF008C630000F7C67B00F7C67B00F7C67B00F7C67B00F7C67B00F7C67B00F7C6
      7B00F7C67B008C630000FFFFFF0000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00ADADAD00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDEDE00DEDE
      DE00DEDEDE00ADADAD00FFFFFF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF008C6300008C6300008C6300008C6300008C6300008C6300008C6300008C63
      00008C6300008C630000FFFFFF0000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00FFFFFF00BDBDBD0000000000FFFFFF00FFFFFF00FFFF
      FF008C6300008C6300008C6300008C6300008C6300008C6300008C6300008C63
      00008C6300008C630000FFFFFF0000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADADAD00ADAD
      AD00ADADAD00ADADAD00FFFFFF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDBDBD0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000BDBDBD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000100000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF0000FFFF00000000000000000000
      8001000080010000000000000000000080010000800100000000000000000000
      8001000080010000000000000000000080010000800100000000000000000000
      8001000080010000000000000000000080010000800100000000000000000000
      8001000080010000000000000000000080010000800100000000000000000000
      8001000080010000000000000000000080010000800100000000000000000000
      8001000080010000000000000000000080010000800100000000000000000000
      8001000080010000000000000000000080010000800100000000000000000000
      FFFF0000FFFF0000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object DisableImage: TImageList
    Left = 35
    Top = 449
    Bitmap = {
      494C010105000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      84008484840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100848484008484
      84008484840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100848484008484
      84008484840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100848484008484
      84008484840031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE003131310000000000000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100ADADAD00ADAD
      AD00ADADAD0031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100CECECE00CECECE0031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100C6C6C600C6C6
      C600C6C6C60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003131
      3100313131003131310031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100D6D6D600D6D6
      D600D6D6D60031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0031313100000000000000000031313100E7E7E700E7E7
      E700E7E7E70031313100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
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
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000080070000000000008003000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      80010000000000008001000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80078007800780078003800380038003
      8001800180018001800180018001800180018001800180018001800180018001
      80018001800180018001800180018001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object SPMasTeki: TFDStoredProc
    StoredProcName = 'MP_MAS_CHK_TEKIMA'
    Left = 178
    Top = 451
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
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
  object SPPayTeki: TFDStoredProc
    StoredProcName = 'MP_PAY_CHK_TEKIMA'
    Left = 178
    Top = 479
    ParamData = <
      item
        Name = '@NCode'
        DataType = ftFloat
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
  object DtlDSwkDataSource: TDataSource
    DataSet = DtlDSwkMem
    Left = 26
    Top = 535
  end
  object DtlDSwkMem: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = evtDtlSwkMemBeforePost
    Left = 54
    Top = 535
    object StringField2: TStringField
      FieldName = 'strSubjectDesc'
      Size = 30
    end
    object SmallintField1: TSmallintField
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'nCtrlDivision'
      LookupDataSet = DtlSwkKbnList
      LookupKeyFields = 'nDivision'
      LookupResultField = 'nDivision'
      KeyFields = 'nDivisionData'
      Lookup = True
    end
    object StringField3: TStringField
      FieldKind = fkLookup
      FieldName = 'strDivisionDesc'
      LookupDataSet = DtlSwkKbnList
      LookupKeyFields = 'nDivision'
      LookupResultField = 'strDescription'
      KeyFields = 'nDivisionData'
      Lookup = True
    end
    object SmallintField2: TSmallintField
      FieldName = 'nDivisionData'
    end
    object DtlDSwkMemstrMaster: TStringField
      FieldName = 'strMaster'
    end
    object DtlDSwkMemiMasterKbn: TIntegerField
      FieldName = 'iMasterKbn'
    end
    object DtlDSwkMemstrGCode: TStringField
      FieldName = 'strGCode'
      Size = 16
    end
    object DtlDSwkMemiAttr: TIntegerField
      FieldName = 'iAttr'
    end
    object DtlDSwkMemiDigit: TIntegerField
      FieldName = 'iDigit'
    end
    object DtlDSwkMemexNCode: TFloatField
      FieldName = 'exNCode'
    end
    object DtlDSwkMemstrGCode_Save: TStringField
      FieldName = 'strGCode_Save'
    end
  end
  object DtlSwkKbnList: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 162
    Top = 535
    object IntegerField3: TIntegerField
      DisplayWidth = 2
      FieldName = 'nDivision'
    end
    object StringField4: TStringField
      DisplayWidth = 8
      FieldName = 'strDescription'
      Size = 8
    end
  end
  object DtlCSwkDataSource: TDataSource
    DataSet = DtlCSwkMem
    Left = 98
    Top = 535
  end
  object DtlCSwkMem: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = evtDtlSwkMemBeforePost
    Left = 126
    Top = 535
    object StringField5: TStringField
      FieldName = 'strSubjectDesc'
      Size = 30
    end
    object SmallintField3: TSmallintField
      FieldKind = fkLookup
      FieldName = 'nCtrlDivision'
      LookupDataSet = DtlSwkKbnList
      LookupKeyFields = 'nDivision'
      LookupResultField = 'nDivision'
      KeyFields = 'nDivisionData'
      Lookup = True
    end
    object StringField6: TStringField
      FieldKind = fkLookup
      FieldName = 'strDivisionDesc'
      LookupDataSet = DtlSwkKbnList
      LookupKeyFields = 'nDivision'
      LookupResultField = 'strDescription'
      KeyFields = 'nDivisionData'
      Size = 8
      Lookup = True
    end
    object SmallintField4: TSmallintField
      FieldName = 'nDivisionData'
    end
    object StringField7: TStringField
      FieldName = 'strMaster'
    end
    object DtlCSwkMemiMasterKbn: TIntegerField
      FieldName = 'iMasterKbn'
    end
    object DtlCSwkMemstrGCode: TStringField
      FieldName = 'strGCode'
      Size = 16
    end
    object DtlCSwkMemiAttr: TIntegerField
      FieldName = 'iAttr'
    end
    object DtlCSwkMemiDigit: TIntegerField
      FieldName = 'iDigit'
    end
    object DtlCSwkMemexNCode: TFloatField
      FieldName = 'exNCode'
    end
    object DtlCSwkMemstrGCode_Save: TStringField
      FieldName = 'strGCode_Save'
    end
  end
  object DMemSwDicTekiCSV: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 124
    Top = 180
    object IntegerField2: TIntegerField
      FieldName = 'Gcode'
    end
    object StringField8: TStringField
      FieldName = 'TekiChar'
      Size = 60
    end
    object StringField9: TStringField
      FieldName = 'RenChar'
    end
    object StringField10: TStringField
      FieldName = 'StaxKbn'
    end
    object IntegerField4: TIntegerField
      FieldName = 'Staxcode'
    end
    object StringField11: TStringField
      FieldName = 'StaxRate'
    end
    object StringField12: TStringField
      FieldName = 'TypeCode'
    end
    object StringField13: TStringField
      FieldName = 'ZanKbn'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'UpDateTime'
    end
    object DMemSwDicTekiCSVDKmkKbn: TStringField
      FieldName = 'DKmkKbn'
      Size = 10
    end
    object IntegerField5: TIntegerField
      FieldName = 'DKmkCode'
    end
    object DMemSwDicTekiCSVDKmkName: TStringField
      FieldName = 'DKmkName'
      Size = 14
    end
    object DMemSwDicTekiCSVCKmkKbn: TStringField
      FieldName = 'CKmkKbn'
      Size = 10
    end
    object IntegerField6: TIntegerField
      FieldName = 'CKmkCode'
    end
    object StringField17: TStringField
      FieldName = 'CKmkName'
    end
    object DMemSwDicTekiCSVDSubKbn: TStringField
      FieldName = 'DSubKbn'
      Size = 10
    end
    object DMemSwDicTekiCSVDSubCode: TStringField
      FieldName = 'DSubCode'
      Size = 10
    end
    object DMemSwDicTekiCSVDSubName: TStringField
      FieldName = 'DSubName'
      Size = 14
    end
    object DMemSwDicTekiCSVDBmnKbn: TStringField
      FieldName = 'DBmnKbn'
      Size = 10
    end
    object DMemSwDicTekiCSVDBmnCode: TStringField
      FieldName = 'DBmnCode'
      Size = 10
    end
    object DMemSwDicTekiCSVDBmnName: TStringField
      FieldName = 'DBmnName'
      Size = 14
    end
    object DMemSwDicTekiCSVDSegKbn1: TStringField
      FieldName = 'DSegKbn1'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegCode1: TStringField
      FieldName = 'DSegCode1'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegName1: TStringField
      FieldName = 'DSegName1'
      Size = 14
    end
    object DMemSwDicTekiCSVDSegKbn2: TStringField
      FieldName = 'DSegKbn2'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegCode2: TStringField
      FieldName = 'DSegCode2'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegName2: TStringField
      FieldName = 'DSegName2'
      Size = 14
    end
    object DMemSwDicTekiCSVDSegKbn3: TStringField
      FieldName = 'DSegKbn3'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegCode3: TStringField
      FieldName = 'DSegCode3'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegName3: TStringField
      FieldName = 'DSegName3'
      Size = 14
    end
    object DMemSwDicTekiCSVDSegKbn4: TStringField
      FieldName = 'DSegKbn4'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegCode4: TStringField
      FieldName = 'DSegCode4'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegName4: TStringField
      FieldName = 'DSegName4'
      Size = 14
    end
    object DMemSwDicTekiCSVDSegKbn5: TStringField
      FieldName = 'DSegKbn5'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegCode5: TStringField
      FieldName = 'DSegCode5'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegName5: TStringField
      FieldName = 'DSegName5'
      Size = 14
    end
    object DMemSwDicTekiCSVDSegKbn6: TStringField
      FieldName = 'DSegKbn6'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegCode6: TStringField
      FieldName = 'DSegCode6'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegName6: TStringField
      FieldName = 'DSegName6'
      Size = 14
    end
    object DMemSwDicTekiCSVDSegKbn7: TStringField
      FieldName = 'DSegKbn7'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegCode7: TStringField
      FieldName = 'DSegCode7'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegName7: TStringField
      FieldName = 'DSegName7'
      Size = 14
    end
    object DMemSwDicTekiCSVDSegKbn8: TStringField
      FieldName = 'DSegKbn8'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegCode8: TStringField
      FieldName = 'DSegCode8'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegName8: TStringField
      FieldName = 'DSegName8'
      Size = 14
    end
    object DMemSwDicTekiCSVDSegKbn9: TStringField
      FieldName = 'DSegKbn9'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegCode9: TStringField
      FieldName = 'DSegCode9'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegName9: TStringField
      FieldName = 'DSegName9'
      Size = 14
    end
    object DMemSwDicTekiCSVDSegKbn10: TStringField
      FieldName = 'DSegKbn10'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegCode10: TStringField
      FieldName = 'DSegCode10'
      Size = 10
    end
    object DMemSwDicTekiCSVDSegName10: TStringField
      FieldName = 'DSegName10'
      Size = 14
    end
    object DMemSwDicTekiCSVDPrjKbn1: TStringField
      FieldName = 'DPrjKbn1'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjCode1: TStringField
      FieldName = 'DPrjCode1'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjName1: TStringField
      FieldName = 'DPrjName1'
      Size = 14
    end
    object DMemSwDicTekiCSVDPrjKbn2: TStringField
      FieldName = 'DPrjKbn2'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjCode2: TStringField
      FieldName = 'DPrjCode2'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjName2: TStringField
      FieldName = 'DPrjName2'
      Size = 14
    end
    object DMemSwDicTekiCSVDPrjKbn3: TStringField
      FieldName = 'DPrjKbn3'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjCode3: TStringField
      FieldName = 'DPrjCode3'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjName3: TStringField
      FieldName = 'DPrjName3'
      Size = 14
    end
    object DMemSwDicTekiCSVDPrjKbn4: TStringField
      FieldName = 'DPrjKbn4'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjCode4: TStringField
      FieldName = 'DPrjCode4'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjName4: TStringField
      FieldName = 'DPrjName4'
      Size = 14
    end
    object DMemSwDicTekiCSVDPrjKbn5: TStringField
      FieldName = 'DPrjKbn5'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjCode5: TStringField
      FieldName = 'DPrjCode5'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjName5: TStringField
      FieldName = 'DPrjName5'
      Size = 14
    end
    object DMemSwDicTekiCSVDPrjKbn6: TStringField
      FieldName = 'DPrjKbn6'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjCode6: TStringField
      FieldName = 'DPrjCode6'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjName6: TStringField
      FieldName = 'DPrjName6'
      Size = 14
    end
    object DMemSwDicTekiCSVDPrjKbn7: TStringField
      FieldName = 'DPrjKbn7'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjCode7: TStringField
      FieldName = 'DPrjCode7'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjName7: TStringField
      FieldName = 'DPrjName7'
      Size = 14
    end
    object DMemSwDicTekiCSVDPrjKbn8: TStringField
      FieldName = 'DPrjKbn8'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjCode8: TStringField
      FieldName = 'DPrjCode8'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjName8: TStringField
      FieldName = 'DPrjName8'
      Size = 14
    end
    object DMemSwDicTekiCSVDPrjKbn9: TStringField
      FieldName = 'DPrjKbn9'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjCode9: TStringField
      FieldName = 'DPrjCode9'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjName9: TStringField
      FieldName = 'DPrjName9'
      Size = 14
    end
    object DMemSwDicTekiCSVDPrjKbn10: TStringField
      FieldName = 'DPrjKbn10'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjCode10: TStringField
      FieldName = 'DPrjCode10'
      Size = 10
    end
    object DMemSwDicTekiCSVDPrjName10: TStringField
      FieldName = 'DPrjName10'
      Size = 14
    end
    object DMemSwDicTekiCSVDPjSubKbn1: TStringField
      FieldName = 'DPjSubKbn1'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubCode1: TStringField
      FieldName = 'DPjSubCode1'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubName1: TStringField
      FieldName = 'DPjSubName1'
      Size = 14
    end
    object DMemSwDicTekiCSVDPjSubKbn2: TStringField
      FieldName = 'DPjSubKbn2'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubCode2: TStringField
      FieldName = 'DPjSubCode2'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubName2: TStringField
      FieldName = 'DPjSubName2'
      Size = 14
    end
    object DMemSwDicTekiCSVDPjSubKbn3: TStringField
      FieldName = 'DPjSubKbn3'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubCode3: TStringField
      FieldName = 'DPjSubCode3'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubName3: TStringField
      FieldName = 'DPjSubName3'
      Size = 14
    end
    object DMemSwDicTekiCSVDPjSubKbn4: TStringField
      FieldName = 'DPjSubKbn4'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubCode4: TStringField
      FieldName = 'DPjSubCode4'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubName4: TStringField
      FieldName = 'DPjSubName4'
      Size = 14
    end
    object DMemSwDicTekiCSVDPjSubKbn5: TStringField
      FieldName = 'DPjSubKbn5'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubCode5: TStringField
      FieldName = 'DPjSubCode5'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubName5: TStringField
      FieldName = 'DPjSubName5'
      Size = 14
    end
    object DMemSwDicTekiCSVDPjSubKbn6: TStringField
      FieldName = 'DPjSubKbn6'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubCode6: TStringField
      FieldName = 'DPjSubCode6'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubName6: TStringField
      FieldName = 'DPjSubName6'
      Size = 14
    end
    object DMemSwDicTekiCSVDPjSubKbn7: TStringField
      FieldName = 'DPjSubKbn7'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubCode7: TStringField
      FieldName = 'DPjSubCode7'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubName7: TStringField
      FieldName = 'DPjSubName7'
      Size = 14
    end
    object DMemSwDicTekiCSVDPjSubKbn8: TStringField
      FieldName = 'DPjSubKbn8'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubCode8: TStringField
      FieldName = 'DPjSubCode8'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubName8: TStringField
      FieldName = 'DPjSubName8'
      Size = 14
    end
    object DMemSwDicTekiCSVDPjSubKbn9: TStringField
      FieldName = 'DPjSubKbn9'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubCode9: TStringField
      FieldName = 'DPjSubCode9'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubName9: TStringField
      FieldName = 'DPjSubName9'
      Size = 14
    end
    object DMemSwDicTekiCSVDPjSubKbn10: TStringField
      FieldName = 'DPjSubKbn10'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubCode10: TStringField
      FieldName = 'DPjSubCode10'
      Size = 10
    end
    object DMemSwDicTekiCSVDPjSubName10: TStringField
      FieldName = 'DPjSubName10'
      Size = 14
    end
    object DMemSwDicTekiCSVDBankKbn: TStringField
      FieldName = 'DBankKbn'
      Size = 10
    end
    object DMemSwDicTekiCSVDBankCode: TStringField
      FieldName = 'DBankCode'
      Size = 10
    end
    object DMemSwDicTekiCSVDBankName: TStringField
      FieldName = 'DBankName'
      Size = 14
    end
    object DMemSwDicTekiCSVDCsKbn: TStringField
      FieldName = 'DCsKbn'
      Size = 10
    end
    object DMemSwDicTekiCSVDCsCode: TStringField
      FieldName = 'DCsCode'
      Size = 10
    end
    object DMemSwDicTekiCSVDCsName: TStringField
      FieldName = 'DCsName'
      Size = 14
    end
    object DMemSwDicTekiCSVDEmpKbn: TStringField
      FieldName = 'DEmpKbn'
      Size = 10
    end
    object DMemSwDicTekiCSVDEmpCode: TStringField
      FieldName = 'DEmpCode'
      Size = 10
    end
    object DMemSwDicTekiCSVDEmpName: TStringField
      FieldName = 'DEmpName'
      Size = 14
    end
    object DMemSwDicTekiCSVDMulKbn1: TStringField
      FieldName = 'DMulKbn1'
      Size = 10
    end
    object DMemSwDicTekiCSVDMulCode1: TStringField
      FieldName = 'DMulCode1'
      Size = 10
    end
    object DMemSwDicTekiCSVDMulName1: TStringField
      FieldName = 'DMulName1'
      Size = 14
    end
    object DMemSwDicTekiCSVDMulKbn2: TStringField
      FieldName = 'DMulKbn2'
      Size = 10
    end
    object DMemSwDicTekiCSVDMulCode2: TStringField
      FieldName = 'DMulCode2'
      Size = 10
    end
    object DMemSwDicTekiCSVDMulName2: TStringField
      FieldName = 'DMulName2'
      Size = 14
    end
    object DMemSwDicTekiCSVDMulKbn3: TStringField
      FieldName = 'DMulKbn3'
      Size = 10
    end
    object DMemSwDicTekiCSVDMulCode3: TStringField
      FieldName = 'DMulCode3'
      Size = 10
    end
    object DMemSwDicTekiCSVDMulName3: TStringField
      FieldName = 'DMulName3'
      Size = 14
    end
    object DMemSwDicTekiCSVDMulKbn4: TStringField
      FieldName = 'DMulKbn4'
      Size = 10
    end
    object DMemSwDicTekiCSVDMulCode4: TStringField
      FieldName = 'DMulCode4'
      Size = 10
    end
    object DMemSwDicTekiCSVDMulName4: TStringField
      FieldName = 'DMulName4'
      Size = 14
    end
    object DMemSwDicTekiCSVDMulKbn5: TStringField
      FieldName = 'DMulKbn5'
      Size = 10
    end
    object DMemSwDicTekiCSVDMulCode5: TStringField
      FieldName = 'DMulCode5'
      Size = 10
    end
    object DMemSwDicTekiCSVDMulName5: TStringField
      FieldName = 'DMulName5'
      Size = 14
    end
    object DMemSwDicTekiCSVCSubKbn: TStringField
      FieldName = 'CSubKbn'
      Size = 10
    end
    object DMemSwDicTekiCSVCSubCode: TStringField
      FieldName = 'CSubCode'
      Size = 10
    end
    object DMemSwDicTekiCSVCSubName: TStringField
      FieldName = 'CSubName'
      Size = 14
    end
    object DMemSwDicTekiCSVCBmnKbn: TStringField
      FieldName = 'CBmnKbn'
      Size = 10
    end
    object DMemSwDicTekiCSVCBmnCode: TStringField
      FieldName = 'CBmnCode'
      Size = 10
    end
    object DMemSwDicTekiCSVCBmnName: TStringField
      FieldName = 'CBmnName'
      Size = 14
    end
    object DMemSwDicTekiCSVCSegKbn1: TStringField
      FieldName = 'CSegKbn1'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegCode1: TStringField
      FieldName = 'CSegCode1'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegName1: TStringField
      FieldName = 'CSegName1'
      Size = 14
    end
    object DMemSwDicTekiCSVCSegKbn2: TStringField
      FieldName = 'CSegKbn2'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegCode2: TStringField
      FieldName = 'CSegCode2'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegName2: TStringField
      FieldName = 'CSegName2'
      Size = 14
    end
    object DMemSwDicTekiCSVCSegKbn3: TStringField
      FieldName = 'CSegKbn3'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegCode3: TStringField
      FieldName = 'CSegCode3'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegName3: TStringField
      FieldName = 'CSegName3'
      Size = 14
    end
    object DMemSwDicTekiCSVCSegKbn4: TStringField
      FieldName = 'CSegKbn4'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegCode4: TStringField
      FieldName = 'CSegCode4'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegName4: TStringField
      FieldName = 'CSegName4'
      Size = 14
    end
    object DMemSwDicTekiCSVCSegKbn5: TStringField
      FieldName = 'CSegKbn5'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegCode5: TStringField
      FieldName = 'CSegCode5'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegName5: TStringField
      FieldName = 'CSegName5'
      Size = 14
    end
    object DMemSwDicTekiCSVCSegKbn6: TStringField
      FieldName = 'CSegKbn6'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegCode6: TStringField
      FieldName = 'CSegCode6'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegName6: TStringField
      FieldName = 'CSegName6'
      Size = 14
    end
    object DMemSwDicTekiCSVCSegKbn7: TStringField
      FieldName = 'CSegKbn7'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegCode7: TStringField
      FieldName = 'CSegCode7'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegName7: TStringField
      FieldName = 'CSegName7'
      Size = 14
    end
    object DMemSwDicTekiCSVCSegKbn8: TStringField
      FieldName = 'CSegKbn8'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegCode8: TStringField
      FieldName = 'CSegCode8'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegName8: TStringField
      FieldName = 'CSegName8'
      Size = 14
    end
    object DMemSwDicTekiCSVCSegKbn9: TStringField
      FieldName = 'CSegKbn9'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegCode9: TStringField
      FieldName = 'CSegCode9'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegName9: TStringField
      FieldName = 'CSegName9'
      Size = 14
    end
    object DMemSwDicTekiCSVCSegKbn10: TStringField
      FieldName = 'CSegKbn10'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegCode10: TStringField
      FieldName = 'CSegCode10'
      Size = 10
    end
    object DMemSwDicTekiCSVCSegName10: TStringField
      FieldName = 'CSegName10'
      Size = 14
    end
    object DMemSwDicTekiCSVCPrjKbn1: TStringField
      FieldName = 'CPrjKbn1'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjCode1: TStringField
      FieldName = 'CPrjCode1'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjName1: TStringField
      FieldName = 'CPrjName1'
      Size = 14
    end
    object DMemSwDicTekiCSVCPrjKbn2: TStringField
      FieldName = 'CPrjKbn2'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjCode2: TStringField
      FieldName = 'CPrjCode2'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjName2: TStringField
      FieldName = 'CPrjName2'
      Size = 14
    end
    object DMemSwDicTekiCSVCPrjKbn3: TStringField
      FieldName = 'CPrjKbn3'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjCode3: TStringField
      FieldName = 'CPrjCode3'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjName3: TStringField
      FieldName = 'CPrjName3'
      Size = 14
    end
    object DMemSwDicTekiCSVCPrjKbn4: TStringField
      FieldName = 'CPrjKbn4'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjCode4: TStringField
      FieldName = 'CPrjCode4'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjName4: TStringField
      FieldName = 'CPrjName4'
      Size = 14
    end
    object DMemSwDicTekiCSVCPrjKbn5: TStringField
      FieldName = 'CPrjKbn5'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjCode5: TStringField
      FieldName = 'CPrjCode5'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjName5: TStringField
      FieldName = 'CPrjName5'
      Size = 14
    end
    object DMemSwDicTekiCSVCPrjKbn6: TStringField
      FieldName = 'CPrjKbn6'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjCode6: TStringField
      FieldName = 'CPrjCode6'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjName6: TStringField
      FieldName = 'CPrjName6'
      Size = 14
    end
    object DMemSwDicTekiCSVCPrjKbn7: TStringField
      FieldName = 'CPrjKbn7'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjCode7: TStringField
      FieldName = 'CPrjCode7'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjName7: TStringField
      FieldName = 'CPrjName7'
      Size = 14
    end
    object DMemSwDicTekiCSVCPrjKbn8: TStringField
      FieldName = 'CPrjKbn8'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjCode8: TStringField
      FieldName = 'CPrjCode8'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjName8: TStringField
      FieldName = 'CPrjName8'
      Size = 14
    end
    object DMemSwDicTekiCSVCPrjKbn9: TStringField
      FieldName = 'CPrjKbn9'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjCode9: TStringField
      FieldName = 'CPrjCode9'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjName9: TStringField
      FieldName = 'CPrjName9'
      Size = 14
    end
    object DMemSwDicTekiCSVCPrjKbn10: TStringField
      FieldName = 'CPrjKbn10'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjCode10: TStringField
      FieldName = 'CPrjCode10'
      Size = 10
    end
    object DMemSwDicTekiCSVCPrjName10: TStringField
      FieldName = 'CPrjName10'
      Size = 14
    end
    object DMemSwDicTekiCSVCPjSubKbn1: TStringField
      FieldName = 'CPjSubKbn1'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubCode1: TStringField
      FieldName = 'CPjSubCode1'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubName1: TStringField
      FieldName = 'CPjSubName1'
      Size = 14
    end
    object DMemSwDicTekiCSVCPjSubKbn2: TStringField
      FieldName = 'CPjSubKbn2'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubCode2: TStringField
      FieldName = 'CPjSubCode2'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubName2: TStringField
      FieldName = 'CPjSubName2'
      Size = 14
    end
    object DMemSwDicTekiCSVCPjSubKbn3: TStringField
      FieldName = 'CPjSubKbn3'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubCode3: TStringField
      FieldName = 'CPjSubCode3'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubName3: TStringField
      FieldName = 'CPjSubName3'
      Size = 14
    end
    object DMemSwDicTekiCSVCPjSubKbn4: TStringField
      FieldName = 'CPjSubKbn4'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubCode4: TStringField
      FieldName = 'CPjSubCode4'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubName4: TStringField
      FieldName = 'CPjSubName4'
      Size = 14
    end
    object DMemSwDicTekiCSVCPjSubKbn5: TStringField
      FieldName = 'CPjSubKbn5'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubCode5: TStringField
      FieldName = 'CPjSubCode5'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubName5: TStringField
      FieldName = 'CPjSubName5'
      Size = 14
    end
    object DMemSwDicTekiCSVCPjSubKbn6: TStringField
      FieldName = 'CPjSubKbn6'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubCode6: TStringField
      FieldName = 'CPjSubCode6'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubName6: TStringField
      FieldName = 'CPjSubName6'
      Size = 14
    end
    object DMemSwDicTekiCSVCPjSubKbn7: TStringField
      FieldName = 'CPjSubKbn7'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubCode7: TStringField
      FieldName = 'CPjSubCode7'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubName7: TStringField
      FieldName = 'CPjSubName7'
      Size = 14
    end
    object DMemSwDicTekiCSVCPjSubKbn8: TStringField
      FieldName = 'CPjSubKbn8'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubCode8: TStringField
      FieldName = 'CPjSubCode8'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubName8: TStringField
      FieldName = 'CPjSubName8'
      Size = 14
    end
    object DMemSwDicTekiCSVCPjSubKbn9: TStringField
      FieldName = 'CPjSubKbn9'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubCode9: TStringField
      FieldName = 'CPjSubCode9'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubName9: TStringField
      FieldName = 'CPjSubName9'
      Size = 14
    end
    object DMemSwDicTekiCSVCPjSubKbn10: TStringField
      FieldName = 'CPjSubKbn10'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubCode10: TStringField
      FieldName = 'CPjSubCode10'
      Size = 10
    end
    object DMemSwDicTekiCSVCPjSubName10: TStringField
      FieldName = 'CPjSubName10'
      Size = 14
    end
    object DMemSwDicTekiCSVCBankKbn: TStringField
      FieldName = 'CBankKbn'
      Size = 10
    end
    object DMemSwDicTekiCSVCBankCode: TStringField
      FieldName = 'CBankCode'
      Size = 10
    end
    object DMemSwDicTekiCSVCBankName: TStringField
      FieldName = 'CBankName'
      Size = 14
    end
    object DMemSwDicTekiCSVCCsKbn: TStringField
      FieldName = 'CCsKbn'
      Size = 10
    end
    object DMemSwDicTekiCSVCCsCode: TStringField
      FieldName = 'CCsCode'
      Size = 10
    end
    object DMemSwDicTekiCSVCCsName: TStringField
      FieldName = 'CCsName'
      Size = 14
    end
    object DMemSwDicTekiCSVCEmpKbn: TStringField
      FieldName = 'CEmpKbn'
      Size = 10
    end
    object DMemSwDicTekiCSVCEmpCode: TStringField
      FieldName = 'CEmpCode'
      Size = 10
    end
    object DMemSwDicTekiCSVCEmpName: TStringField
      FieldName = 'CEmpName'
      Size = 14
    end
    object DMemSwDicTekiCSVCMulKbn1: TStringField
      FieldName = 'CMulKbn1'
      Size = 10
    end
    object DMemSwDicTekiCSVCMulCode1: TStringField
      FieldName = 'CMulCode1'
      Size = 10
    end
    object DMemSwDicTekiCSVCMulName1: TStringField
      FieldName = 'CMulName1'
      Size = 14
    end
    object DMemSwDicTekiCSVCMulKbn2: TStringField
      FieldName = 'CMulKbn2'
      Size = 10
    end
    object DMemSwDicTekiCSVCMulCode2: TStringField
      FieldName = 'CMulCode2'
      Size = 10
    end
    object DMemSwDicTekiCSVCMulName2: TStringField
      FieldName = 'CMulName2'
      Size = 14
    end
    object DMemSwDicTekiCSVCMulKbn3: TStringField
      FieldName = 'CMulKbn3'
      Size = 10
    end
    object DMemSwDicTekiCSVCMulCode3: TStringField
      FieldName = 'CMulCode3'
      Size = 10
    end
    object DMemSwDicTekiCSVCMulName3: TStringField
      FieldName = 'CMulName3'
      Size = 14
    end
    object DMemSwDicTekiCSVCMulKbn4: TStringField
      FieldName = 'CMulKbn4'
      Size = 10
    end
    object DMemSwDicTekiCSVCMulCode4: TStringField
      FieldName = 'CMulCode4'
      Size = 10
    end
    object DMemSwDicTekiCSVCMulName4: TStringField
      FieldName = 'CMulName4'
      Size = 14
    end
    object DMemSwDicTekiCSVCMulKbn5: TStringField
      FieldName = 'CMulKbn5'
      Size = 10
    end
    object DMemSwDicTekiCSVCMulCode5: TStringField
      FieldName = 'CMulCode5'
      Size = 10
    end
    object DMemSwDicTekiCSVCMulName5: TStringField
      FieldName = 'CMulName5'
      Size = 14
    end
    object DMemSwDicTekiCSVBusDicKbn: TStringField
      FieldName = 'BusDicKbn'
    end
  end
end
