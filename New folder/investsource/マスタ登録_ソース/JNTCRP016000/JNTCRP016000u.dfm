object JNTCRP016000f: TJNTCRP016000f
  Left = 260
  Top = 233
  Align = alClient
  BorderStyle = bsNone
  Caption = #20849#36890#35036#21161
  ClientHeight = 618
  ClientWidth = 976
  Color = 15921906
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  OnActivate = fnJNTCRP016000fOnActivate
  OnClose = fnOnClose
  OnCloseQuery = fnJNTCRP016000fOnCloseQuery
  OnCreate = fnOnCreate
  OnDestroy = FormDestroy
  OnHide = fnJNTCRP016000fOnHide
  OnPaint = fnJNTCRP016000fOnPaint
  OnShow = fnOnShow
  PixelsPerInch = 96
  TextHeight = 12
  object CmnSplitter: TSplitter
    Left = 200
    Top = 51
    Height = 526
  end
  object StdCmnClientPanel: TMPanel
    Left = 203
    Top = 51
    Width = 773
    Height = 526
    Align = alClient
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 3
    object StdCmnClientPanelExist: TMPanel
      Left = 0
      Top = 44
      Width = 773
      Height = 482
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 0
      Visible = False
      object StdCmnGridExist: TdxDBGrid
        Left = 1
        Top = 1
        Width = 771
        Height = 480
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
        Font.Height = -12
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        PopupMenu = StdCmnGridPopupMenu
        TabOrder = 0
        OnEnter = fnStdCmnGridExistOnEnter
        OnKeyPress = fnStdCmnGridExistOnKeyPress
        OnMouseDown = fnStdCmnGridExistOnMouseDown
        OnMouseMove = fnStdCmnGridExistOnMouseMove
        BandColor = 10204878
        BandFont.Charset = SHIFTJIS_CHARSET
        BandFont.Color = clWindowText
        BandFont.Height = -12
        BandFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        BandFont.Style = []
        DataSource = StdCmnDataSourceExist
        HeaderColor = 10204878
        HeaderFont.Charset = SHIFTJIS_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -13
        HeaderFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        HeaderFont.Style = []
        HideFocusRect = True
        HideSelectionColor = clWindow
        HideSelectionTextColor = clWindowText
        HighlightTextColor = clWindowText
        LookAndFeel = lfFlat
        Options = [egoColumnSizing, egoEditing, egoTabs, egoTabThrough, egoRowSelect, egoCanDelete, egoConfirmDelete, egoCanNavigation, egoCanAppend, egoCancelOnExit, egoImmediateEditor, egoCanInsert, egoIndicator]
        OptionsEx = [egoUseBitmap, egoBandHeaderWidth, egoBandSizing, egoVertThrough, egoEnterThrough, egoEnterShowEditor, egoDragScroll, egoAutoSort]
        PreviewFont.Charset = SHIFTJIS_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -12
        PreviewFont.Name = #65325#65331' '#65328#12468#12471#12483#12463
        PreviewFont.Style = []
        OnChangeColumn = fnStdCmnGridExistOnChangeColumn
        OnChangeNodeEx = fnStdCmnGridExistOnChangeNodeEx
        OnEditing = fnStdCmnGridExistOnEditing
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
          Width = 75
          BandIndex = 1
          RowIndex = 0
          ImeMode = imDisable
          EditAlignment = taRightJustify
          StretchChar.Auto = False
          FieldName = 'strExCode'
          OnGetText = fnStdCmnGridExistCodeOnGetText
        end
        object StdCmnGridExistAssociation: TdxDBGridColumn
          Caption = #36899#24819
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          HeaderAlignment = taCenter
          Width = 88
          BandIndex = 2
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
          BandIndex = 3
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 40
          StretchChar.Auto = False
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
          Width = 102
          BandIndex = 4
          RowIndex = 0
          ImeMode = imHira
          MaxLength = 14
          StretchChar.Auto = False
          FieldName = 'strNameSimple'
        end
        object StdCmnGridExistAdoptDivision01: TdxDBGridLookupColumn
          MinWidth = 12
          Width = 20
          BandIndex = 5
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
          BandIndex = 5
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'strAdoptComment01'
        end
        object StdCmnGridExistAdoptDivision02: TdxDBGridLookupColumn
          MinWidth = 12
          Width = 20
          BandIndex = 6
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
          BandIndex = 6
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'strAdoptComment02'
        end
        object StdCmnGridExistComment: TdxDBGridColumn
          Caption = #20184#31627#20633#32771
          ReadOnly = True
          Visible = False
          BandIndex = 7
          RowIndex = 0
          StretchChar.Auto = False
          FieldName = 'strComment'
        end
      end
    end
    object StdCmnClientPanelTotal: TMPanel
      Left = 0
      Top = 44
      Width = 773
      Height = 482
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 1
      Visible = False
      object StdCmnGridTotal: TdxDBGrid
        Left = 1
        Top = 1
        Width = 771
        Height = 480
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
        Font.Height = -12
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
        HeaderColor = 10204878
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
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
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
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
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
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
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
    object StdCmnTab: TMTab
      Left = 0
      Top = 0
      Width = 773
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
  object DtlCmnClientPanel: TMPanel
    Left = 203
    Top = 51
    Width = 773
    Height = 526
    Align = alClient
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 4
    object DtlCmnScrollBox: TScrollBox
      Left = 0
      Top = 44
      Width = 773
      Height = 441
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 1
      object MPnlHead: TMPanel
        Left = 0
        Top = 0
        Width = 773
        Height = 130
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentBackground = False
        ParentColor = True
        ParentFont = False
        PopupMenu = StdCmnGridPopupMenu
        TabOrder = 0
        object DtlCmnLabelExCodeTitle: TMLabel
          Left = 36
          Top = 14
          Width = 145
          Height = 17
          AutoSize = False
          Caption = 'XXXXXXXXXXXXXX'#12467#12540#12489
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object DtlCmnImgFusen: TImage
          Left = 12
          Top = 17
          Width = 16
          Height = 16
          AutoSize = True
          Transparent = True
          Visible = False
        end
        object DtlCmnEditExCodeFree: TMTxtEdit
          Left = 192
          Top = 14
          Width = 80
          Height = 19
          TabStop = False
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          OnExit = DtlCmnEditExCodeExit
          OnKeyDown = fnCommonFunctionOnKeyDown01
          ValidChars = ''
        end
        object DtlCmnEditExCodeNumeric: TMNumEdit
          Left = 192
          Top = 14
          Width = 80
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          OnExit = DtlCmnEditExCodeExit
          OnKeyDown = fnCommonFunctionOnKeyDown01
          FormatStr = '0'
          Negative = False
          Validate = False
          InputFlag = True
          InputFlagEnabled = True
          Zero = True
        end
        object PnlH2: TMPanel
          Left = 3
          Top = 40
          Width = 678
          Height = 58
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 3
          object DtlCmnLabelAppDateAddtion: TMLabel
            Left = 512
            Top = 33
            Width = 17
            Height = 19
            AutoSize = False
            Caption = #65374
            FontRatio.Auto = False
          end
          object DtlCmnLabelName: TMLabel
            Left = 44
            Top = 10
            Width = 65
            Height = 17
            AutoSize = False
            Caption = #27491#24335#21517#31216
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLabelNameSimple: TMLabel
            Left = 44
            Top = 34
            Width = 65
            Height = 17
            AutoSize = False
            Caption = #31777#30053#21517#31216
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnLabelAppDateTitle: TMLabel
            Left = 344
            Top = 33
            Width = 65
            Height = 17
            AutoSize = False
            Caption = #36969#29992#26399#38291
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            FontRatio.Auto = False
          end
          object DtlCmnEditName: TMTxtEdit
            Left = 188
            Top = 9
            Width = 421
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
            MaxLength = 40
            FontRatio.Auto = False
            ParentFont = False
            TabOrder = 0
            Text = ''
            OnChange = fnCommonFunctionDetailsOnChange
            OnEnter = fnDtlCommonFunctionOnEnter
            OnKeyDown = fnDtlCmnEditNameOnKeyDown
            ValidChars = ''
          end
          object DtlCmnEditNameSimple: TMTxtEdit
            Left = 188
            Top = 32
            Width = 125
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
            TabOrder = 1
            Text = ''
            OnChange = fnCommonFunctionDetailsOnChange
            OnEnter = fnDtlCmnEditNameSimpleOnEnter
            OnExit = fnDtlCmnEditNameSimpleOnExit
            OnKeyDown = fnCommonFunctionOnKeyDown02
            ValidChars = ''
          end
          object DtlCmnEditAppDateEnd: TMDateEdit
            Left = 528
            Top = 32
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            ArrowType = atOmission
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
            TabOrder = 3
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
            Left = 412
            Top = 32
            Width = 81
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdNone
            ArrowType = atOmission
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
        end
        object PnlH1: TMPanel
          Left = 280
          Top = 14
          Width = 213
          Height = 19
          BevelOuter = bvNone
          Color = 15921906
          ParentBackground = False
          TabOrder = 2
          object DtlCmnLabelAssociation: TMLabel
            Left = 72
            Top = 1
            Width = 33
            Height = 17
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
          object DtlCmnLabelDescSumDivision: TMLabel
            Left = 22
            Top = 1
            Width = 35
            Height = 17
            AutoSize = False
            Caption = #23455#22312
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            Visible = False
            FontRatio.Auto = False
          end
          object DtlCmnEditAssociation: TMTxtEdit
            Left = 115
            Top = 0
            Width = 98
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
            TabOrder = 1
            Text = ''
            OnChange = fnCommonFunctionDetailsOnChange
            OnEnter = fnDtlCommonFunctionOnEnter
            OnKeyDown = fnCommonFunctionOnKeyDown02
            ValidChars = ''
          end
          object DtlCmnEditSumDivision: TMNumEdit
            Left = 0
            Top = 0
            Width = 17
            Height = 19
            ArrowDisp = adFocused
            SelectDisp = sdArrowClick
            SelectItems.Strings = (
              '0: '#23455#22312
              '1: '#21512#35336)
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
            Visible = False
            OnEnter = fnCommonFunctionOnEnter02
            FormatStr = '0'
            MaxValue = 1.000000000000000000
            Validate = False
            Zero = True
          end
        end
      end
      object Pnl_SegBunInfo: TMPanel
        Left = 0
        Top = 130
        Width = 773
        Height = 311
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 1
        Visible = False
        object MLabel49: TMLabel
          Left = 6
          Top = 9
          Width = 95
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
        object Jituzai_LLabel_SegTitl1: TMLabel
          Left = 9
          Top = 38
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'1'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegTitl2: TMLabel
          Left = 9
          Top = 61
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'2'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegTitl3: TMLabel
          Left = 9
          Top = 84
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'3'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegTitl4: TMLabel
          Left = 9
          Top = 107
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'4'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegTitl5: TMLabel
          Left = 9
          Top = 130
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'5'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegTitl6: TMLabel
          Left = 9
          Top = 153
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'6'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegTitl7: TMLabel
          Left = 9
          Top = 176
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'7'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegTitl8: TMLabel
          Left = 9
          Top = 199
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'8'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegTitl9: TMLabel
          Left = 9
          Top = 222
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'9'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegTitl10: TMLabel
          Left = 9
          Top = 245
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'10'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegNm1: TMLabel
          Left = 257
          Top = 38
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'1'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegNm2: TMLabel
          Left = 257
          Top = 61
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'2'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegNm3: TMLabel
          Left = 257
          Top = 84
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'3'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegNm4: TMLabel
          Left = 257
          Top = 107
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'4'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegNm5: TMLabel
          Left = 257
          Top = 130
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'5'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegNm6: TMLabel
          Left = 257
          Top = 153
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'6'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegNm7: TMLabel
          Left = 257
          Top = 176
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'7'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegNm8: TMLabel
          Left = 257
          Top = 199
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'8'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegNm9: TMLabel
          Left = 257
          Top = 222
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'9'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_SegNm10: TMLabel
          Left = 257
          Top = 245
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #12475#12464#12513#12531#12488'10'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object MLabel35: TMLabel
          Left = 6
          Top = 0
          Width = 330
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel33: TMLabel
          Left = 6
          Top = 280
          Width = 330
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel37: TMLabel
          Left = 350
          Top = 0
          Width = 330
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel34: TMLabel
          Left = 350
          Top = 280
          Width = 330
          Height = 1
          AutoSize = False
          Color = clSilver
          ParentColor = False
          FontRatio.Auto = False
        end
        object MLabel53: TMLabel
          Left = 360
          Top = 9
          Width = 95
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
        object Jituzai_LLabel_BunTitl1: TMLabel
          Left = 366
          Top = 38
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #20998#39006'1'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunTitl2: TMLabel
          Left = 366
          Top = 61
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #20998#39006'2'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunTitl3: TMLabel
          Left = 366
          Top = 84
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #20998#39006'3'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunTitl4: TMLabel
          Left = 366
          Top = 107
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #20998#39006'4'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunTitl5: TMLabel
          Left = 366
          Top = 130
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #20998#39006'5'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunTitl6: TMLabel
          Left = 366
          Top = 153
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #20998#39006'6'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunTitl7: TMLabel
          Left = 366
          Top = 176
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #20998#39006'7'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunTitl8: TMLabel
          Left = 366
          Top = 199
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #20998#39006'8'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunTitl9: TMLabel
          Left = 366
          Top = 222
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #20998#39006'9'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunTitl10: TMLabel
          Left = 366
          Top = 245
          Width = 140
          Height = 17
          AutoSize = False
          Caption = #20998#39006'10'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunNm1: TMLabel
          Left = 605
          Top = 38
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #20998#39006'1'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunNm2: TMLabel
          Left = 605
          Top = 61
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #20998#39006'2'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunNm3: TMLabel
          Left = 605
          Top = 84
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #20998#39006'3'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunNm4: TMLabel
          Left = 605
          Top = 107
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #20998#39006'4'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunNm5: TMLabel
          Left = 605
          Top = 130
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #20998#39006'5'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunNm6: TMLabel
          Left = 605
          Top = 153
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #20998#39006'6'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunNm7: TMLabel
          Left = 605
          Top = 176
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #20998#39006'7'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunNm8: TMLabel
          Left = 605
          Top = 199
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #20998#39006'8'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunNm9: TMLabel
          Left = 605
          Top = 222
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #20998#39006'9'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_LLabel_BunNm10: TMLabel
          Left = 605
          Top = 245
          Width = 100
          Height = 17
          AutoSize = False
          Caption = #20998#39006'10'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
          FontRatio.Auto = False
        end
        object Jituzai_ETEdit_SegCd1: TMTxtEdit
          Tag = 22
          Left = 155
          Top = 38
          Width = 84
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 0
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_SegCd2: TMTxtEdit
          Tag = 22
          Left = 155
          Top = 61
          Width = 84
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 1
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_SegCd3: TMTxtEdit
          Tag = 22
          Left = 155
          Top = 84
          Width = 84
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 2
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_SegCd4: TMTxtEdit
          Tag = 22
          Left = 155
          Top = 107
          Width = 84
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 3
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_SegCd5: TMTxtEdit
          Tag = 22
          Left = 155
          Top = 130
          Width = 84
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 4
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_SegCd6: TMTxtEdit
          Tag = 22
          Left = 155
          Top = 153
          Width = 84
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 5
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_SegCd7: TMTxtEdit
          Tag = 22
          Left = 155
          Top = 176
          Width = 84
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 6
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_SegCd8: TMTxtEdit
          Tag = 22
          Left = 155
          Top = 199
          Width = 84
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 7
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_SegCd9: TMTxtEdit
          Tag = 22
          Left = 155
          Top = 222
          Width = 84
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 8
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_SegCd10: TMTxtEdit
          Tag = 22
          Left = 155
          Top = 245
          Width = 84
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 9
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_BunCd1: TMTxtEdit
          Tag = 22
          Left = 507
          Top = 38
          Width = 82
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 10
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_BunCd2: TMTxtEdit
          Tag = 22
          Left = 507
          Top = 61
          Width = 82
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 11
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_BunCd3: TMTxtEdit
          Tag = 22
          Left = 507
          Top = 84
          Width = 82
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 12
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_BunCd4: TMTxtEdit
          Tag = 22
          Left = 507
          Top = 107
          Width = 82
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 13
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_BunCd5: TMTxtEdit
          Tag = 22
          Left = 507
          Top = 130
          Width = 82
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 14
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_BunCd6: TMTxtEdit
          Tag = 22
          Left = 507
          Top = 153
          Width = 82
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 15
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_BunCd7: TMTxtEdit
          Tag = 22
          Left = 507
          Top = 176
          Width = 82
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 16
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_BunCd8: TMTxtEdit
          Tag = 22
          Left = 507
          Top = 199
          Width = 82
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 17
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_BunCd9: TMTxtEdit
          Tag = 22
          Left = 507
          Top = 222
          Width = 82
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
          OnArrowClick = ArrowClick
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 18
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
        object Jituzai_ETEdit_BunCd10: TMTxtEdit
          Tag = 22
          Left = 507
          Top = 245
          Width = 82
          Height = 19
          ArrowDisp = adFocused
          SelectDisp = sdNone
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
          MaxLength = 10
          FontRatio.Auto = False
          ParentFont = False
          TabOrder = 19
          Text = ''
          OnExit = Jituzai_ETEdit_FldChk
          OnKeyDown = fnDtlCmnEditNameOnKeyDown
          ValidChars = ''
        end
      end
    end
    object MPanel2: TMPanel
      Left = 0
      Top = 485
      Width = 773
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      Color = 15921906
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        773
        41)
      object DtlCmnButtonUpdate: TMBitBtn
        Left = 606
        Top = 9
        Width = 80
        Height = 25
        Anchors = [akRight, akBottom]
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
        OnEnter = DtlCmnButtonUpdateEnter
      end
      object DtlCmnButtonCancel: TMBitBtn
        Left = 688
        Top = 9
        Width = 80
        Height = 25
        Anchors = [akRight, akBottom]
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
      end
    end
    object DtlCmnTab: TMTab
      Left = 0
      Top = 0
      Width = 773
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
  end
  object CmnToolBar: TMPanel
    Left = 0
    Top = 0
    Width = 976
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Color = 15921906
    FullRepaint = False
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #65325#65331' '#12468#12471#12483#12463
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object CmnButtonToolbarExit: TMSpeedButton
      Left = 1
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
      Left = 72
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
      Left = 143
      Top = 2
      Width = 70
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
      Left = 285
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
      OnMouseDown = CmnToolbarButtonDeleteMouseDown
    end
    object CmnToolbarButtonDetail: TMSpeedButton
      Left = 214
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
    object BSpeedButtonSort: TMSpeedButton
      Left = 356
      Top = 2
      Width = 100
      Height = 21
      Caption = #20006#12403#26367#12360'(&S)'
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
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDDC
        DCDD666666000000000000C0C0C0DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDC
        DCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDCDDDCDCDDC0C0C00000000000
        00666666DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDFDFDFDFDFDF54
        8D13548C12DEDFDEDFDFDFDFDFDF666666000000000000C0C0C0DEDFDEDEDFDE
        DEDFDEDEDFDEDEDFDEDEDFDEDEDFDEDFDFDFDFDFDFC8C8C8C8C8C8DEDFDEDFDF
        DFDFDFDFC0C0C0000000000000666666E1E1E0874E28874E28874D28874E2887
        4E27E1E1E0E1E1E0E1E1E04E840E4E840EE1E1E0E1E0E1E1E0E1666666000000
        000000C0C0C0E1E1E0C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8E1E1E0E1E1E0E1E1
        E0B7B7B7B7B7B7E1E1E0E1E0E1E1E0E1C0C0C0000000000000666666E3E3E383
        4B27E3E3E3E3E3E3834B26E3E3E3E3E3E3497D0A497D0A487E0A487E0A497D0B
        487D0AE3E3E3666666000000000000C0C0C0E3E3E3C8C8C8E3E3E3E3E3E3C8C8
        C8E3E3E3E3E3E3B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7E3E3E3C0C0C000
        0000000000666666E5E6E67C48247C47257D48257D48257D4825E6E6E6437506
        427506437506427506437506437506E6E6E6666666000000000000C0C0C0E5E6
        E6C8C8C8C8C8C8C8C8C8C8C8C8C8C8C8E6E6E6B0B0B0B0B0B0B0B0B0B0B0B0B0
        B0B0B0B0B0E6E6E6C0C0C0000000000000666666E8E8E9774423E8E8E9E8E8E9
        764423E8E8E9E8E8E9E8E8E9E8E8E93E6F033E6F03E8E8E9E9E8E8E9E8E86666
        66000000000000C0C0C0E8E8E9C8C8C8E8E8E9E8E8E9C8C8C8E8E8E9E8E8E9E8
        E8E9E8E8E9B0B0B0B0B0B0E8E8E9E9E8E8E9E8E8C0C0C0000000000000666666
        EBEBEB704121704021704021704021704021704121704121EBEBEB3E6F033E6F
        03EBEBEBEBEBEBEBEBEB666666000000000000C0C0C0EBEBEBB0B0B0B0B0B0B0
        B0B0B0B0B0B0B0B0B0B0B0B0B0B0EBEBEBA8A8A8A8A8A8EBEBEBEBEBEBEBEBEB
        C0C0C0000000000000666666EDEDED6B3E1FEDEDEDEDEDED6A3E20EDEDEDEDED
        ED6A3D1FEDEDEDEDEDEDEDEDEDEDEDEDEEEDEEEEEDEE666666000000000000C0
        C0C0EDEDEDB0B0B0EDEDEDEDEDEDB0B0B0EDEDEDEDEDEDB0B0B0EDEDEDEDEDED
        EDEDEDEDEDEDEEEDEEEEEDEEC0C0C0000000000000666666F0F0F064391E643A
        1E643A1D643A1E64391D64391E64391E64391D643A1E643A1EF0F0F0F0F0F0F0
        F0F0666666000000000000C0C0C0F0F0F0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0
        B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0F0F0F0F0F0F0F0F0F0C0C0C00000000000
        00666666F3F3F35E361CF3F3F3F3F3F35D361BF3F3F3F3F3F35D361BF3F3F3F3
        F3F35E361BF3F3F3F3F3F3F3F3F3666666000000000000C0C0C0F3F3F3B0B0B0
        F3F3F3F3F3F3B0B0B0F3F3F3F3F3F3B0B0B0F3F3F3F3F3F3B0B0B0F3F3F3F3F3
        F3F3F3F3C0C0C0000000000000666666F6F6F657331A57331A57321A57321A57
        321A57321A57321A57321A57321A57321AF6F6F6F6F6F6F6F6F6666666000000
        000000C0C0C0F6F6F6A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8
        A8A8A8A8A8A8A8F6F6F6F6F6F6F6F6F6C0C0C0000000000000666666F9F8F852
        2F18F9F8F8F9F8F8522F18F9F8F8F9F8F8522F18F9F8F8F9F8F8522F18F9F8F8
        F9F8F8F9F9F8666666000000000000C0C0C0F9F8F8A8A8A8F9F8F8F9F8F8A8A8
        A8F9F8F8F9F8F8A8A8A8F9F8F8F9F8F8A8A8A8F9F8F8F9F8F8F9F9F8C0C0C000
        0000000000666666FCFCFB4E2D174E2D174E2D174E2D174E2D174E2D174E2D17
        4E2D174E2D174E2D17FCFCFBFCFCFBFBFBFB666666000000000000C0C0C0FCFC
        FBA8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8FC
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
      OnClick = BSpeedButtonSortClick
    end
    object B_Search: TMSpeedButton
      Left = 457
      Top = 2
      Width = 70
      Height = 21
      Caption = #26908#32034'(&Q)'
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
    object Image_Fusen_Red: TImage
      Left = 608
      Top = 0
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
    object Image_Fusen_Blue: TImage
      Left = 624
      Top = 0
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
    object Image_Fusen_Green: TImage
      Left = 640
      Top = 0
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
    object Image_Fusen_Orange: TImage
      Left = 656
      Top = 0
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
    object Image_Fusen_Glay: TImage
      Left = 672
      Top = 0
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
    object ToolBarFusen: TToolBar
      Left = 529
      Top = 1
      Width = 49
      Height = 22
      Align = alNone
      ButtonWidth = 25
      Caption = 'ToolBarFusen'
      DisabledImages = CmnToolbarImageD
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = CmnToolbarImage
      TabOrder = 0
      Transparent = True
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
  object CmnInstructionBar: TMPanel
    Left = 0
    Top = 25
    Width = 976
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    Color = 15921906
    ParentBackground = False
    TabOrder = 1
    object MLabel50: TMLabel
      Left = 4
      Top = 3
      Width = 53
      Height = 18
      AutoSize = False
      Caption = #35036#21161#20998#39006
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
      FontRatio.Auto = False
    end
    object CmnInstructionCombo: TMComboBox
      Left = 59
      Top = 2
      Width = 144
      Height = 19
      CanEdit = False
      Columns = <
        item
          Width = 200
          Color = clWindow
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end>
      FocusedColor = clAqua
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = fnCmnInstructionComboOnChange
      OnEnter = fnCommonFunctionOnEnter01
      OnExit = CmnInstructionComboExit
      OnKeyDown = fnCmnInstructionComboOnKeyDown
    end
  end
  object CmnTreeView: TMTreeView
    Left = 0
    Top = 51
    Width = 200
    Height = 526
    Align = alLeft
    DragMode = dmAutomatic
    HotTrack = True
    Images = CmnTreeViewImage
    Indent = 19
    PopupMenu = CmnTreeViewPopupMenu
    ReadOnly = True
    RightClickSelect = True
    TabOrder = 2
    OnChange = fnCmnTreeViewOnChange
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
    ParentBackground = False
    TabOrder = 5
    object CmnStatusBar: TMStatusBar
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
      Top = 8
      Width = 200
      Height = 8
      Smooth = True
      TabOrder = 1
      Visible = False
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
    Left = 1
    Top = 52
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
    Left = 57
    Top = 180
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
    object StdCmnMemDataExiststrExNCode: TFloatField
      FieldName = 'strExNCode'
    end
  end
  object StdCmnDataSourceExist: TDataSource
    OnStateChange = fnStdCmnDataSourceExistOnStateChange
    Left = 29
    Top = 180
  end
  object StdCmnQueryExist: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
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
    Left = 1
    Top = 180
  end
  object StdCmnQueryTotal: TMQuery
    FieldOptions.UpdatePersistent = True
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmVisible
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
    Left = 1
    Top = 222
  end
  object StdCmnDataSourceTotal: TDataSource
    OnStateChange = fnStdCmnDataSourceTotalOnStateChange
    Left = 29
    Top = 222
  end
  object StdCmnMemDataTotal: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = fnStdCmnMemDataTotalBeforePost
    Left = 57
    Top = 222
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
    object StdCmnMemDataTotalstrExNCode: TFloatField
      FieldName = 'strExNCode'
    end
  end
  object CmnTreeViewPopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = fnCmnTreeViewPopupMenuOnPopup
    Left = 85
    Top = 95
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
    Left = 29
    Top = 95
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
  object StdCmnMemDataCustomer: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 1
    Top = 264
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
    Left = 29
    Top = 264
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
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 29
    Top = 306
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
  end
  object CmnPipelinePrintExtStandard: TppDBPipeline
    DataSource = CmnDataSourcePrintExtStandard
    UserName = 'CmnPipelinePrintExtStandard'
    Left = 57
    Top = 306
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
      FieldAlias = 'strCustomerDesc'
      FieldName = 'strCustomerDesc'
      FieldLength = 2
      DisplayWidth = 2
      Position = 6
    end
    object CmnPipelinePrintExtStandardppField8: TppField
      FieldAlias = 'strSupplierDesc'
      FieldName = 'strSupplierDesc'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object CmnPipelinePrintExtStandardppField9: TppField
      FieldAlias = 'strClassDesc'
      FieldName = 'strClassDesc'
      FieldLength = 14
      DisplayWidth = 14
      Position = 8
    end
    object CmnPipelinePrintExtStandardppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'nExCodeCustDeb'
      FieldName = 'nExCodeCustDeb'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object CmnPipelinePrintExtStandardppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'nExCodeCustCre'
      FieldName = 'nExCodeCustCre'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object CmnPipelinePrintExtStandardppField12: TppField
      FieldAlias = 'strCustDebDesc'
      FieldName = 'strCustDebDesc'
      FieldLength = 14
      DisplayWidth = 14
      Position = 11
    end
    object CmnPipelinePrintExtStandardppField13: TppField
      FieldAlias = 'strCustCreDesc'
      FieldName = 'strCustCreDesc'
      FieldLength = 14
      DisplayWidth = 14
      Position = 12
    end
    object CmnPipelinePrintExtStandardppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'nExCodeSuppDeb'
      FieldName = 'nExCodeSuppDeb'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object CmnPipelinePrintExtStandardppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'nExCodeSuppCre'
      FieldName = 'nExCodeSuppCre'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object CmnPipelinePrintExtStandardppField16: TppField
      FieldAlias = 'strSuppDebDesc'
      FieldName = 'strSuppDebDesc'
      FieldLength = 14
      DisplayWidth = 14
      Position = 15
    end
    object CmnPipelinePrintExtStandardppField17: TppField
      FieldAlias = 'strSuppCreDesc'
      FieldName = 'strSuppCreDesc'
      FieldLength = 14
      DisplayWidth = 14
      Position = 16
    end
    object CmnPipelinePrintExtStandardppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'nTaxCodeSales'
      FieldName = 'nTaxCodeSales'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object CmnPipelinePrintExtStandardppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'nTaxCodeStock'
      FieldName = 'nTaxCodeStock'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object CmnPipelinePrintExtStandardppField20: TppField
      FieldAlias = 'strTaxSalesDesc'
      FieldName = 'strTaxSalesDesc'
      FieldLength = 8
      DisplayWidth = 8
      Position = 19
    end
    object CmnPipelinePrintExtStandardppField21: TppField
      FieldAlias = 'strTaxStockDesc'
      FieldName = 'strTaxStockDesc'
      FieldLength = 8
      DisplayWidth = 8
      Position = 20
    end
    object CmnPipelinePrintExtStandardppField22: TppField
      FieldAlias = 'dtAppDateStart'
      FieldName = 'dtAppDateStart'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 21
    end
    object CmnPipelinePrintExtStandardppField23: TppField
      FieldAlias = 'dtAppDateEnd'
      FieldName = 'dtAppDateEnd'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 22
    end
    object CmnPipelinePrintExtStandardppField24: TppField
      FieldAlias = 'dtUpdateDate'
      FieldName = 'dtUpdateDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 23
    end
    object CmnPipelinePrintExtStandardppField25: TppField
      FieldAlias = 'SectionCode'
      FieldName = 'SectionCode'
      FieldLength = 20
      DisplayWidth = 20
      Position = 24
    end
    object CmnPipelinePrintExtStandardppField26: TppField
      FieldAlias = 'SectionName'
      FieldName = 'SectionName'
      FieldLength = 20
      DisplayWidth = 20
      Position = 25
    end
  end
  object CmnDataSourcePrintExtStandard: TDataSource
    DataSet = CmnMemDataPrintExtStandard
    Left = 1
    Top = 306
  end
  object CmnReportExtStandardCst: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintExtStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Custom'
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
    Left = 113
    Top = 306
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
    PrinterSetup.PaperName = 'Custom'
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
    Left = 85
    Top = 306
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
    PrinterSetup.PaperName = 'Custom'
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
    Left = 113
    Top = 347
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
    PrinterSetup.PaperName = 'Custom'
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
    Left = 141
    Top = 306
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
    PrinterSetup.PaperName = 'Custom'
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
    Left = 169
    Top = 306
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
    PrinterSetup.PaperName = 'Custom'
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
    Left = 85
    Top = 347
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
    PrinterSetup.PaperName = 'Custom'
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
    Left = 141
    Top = 347
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
    PrinterSetup.PaperName = 'Custom'
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
    Left = 169
    Top = 347
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
    Left = 1
    Top = 432
  end
  object CmnMemDataPrintSystem: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 29
    Top = 432
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
    Left = 57
    Top = 432
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
    PrinterSetup.PaperName = 'Custom'
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
    Left = 85
    Top = 432
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
    Left = 1
    Top = 390
  end
  object CmnMemDataPrintExtDetailsCst: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 29
    Top = 390
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
    Left = 57
    Top = 390
  end
  object CmnReportExtDetailsCst: TppReport
    AutoStop = False
    DataPipeline = CmnPipelinePrintCsDetails
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Custom'
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
    Left = 85
    Top = 390
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
    Left = 1
    Top = 347
  end
  object CmnMemDataPrintTtlStandard: TdxMemData
    Active = True
    Indexes = <>
    SortOptions = []
    Left = 29
    Top = 347
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
    Left = 57
    Top = 347
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
    Left = 1
    Top = 95
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
    Left = 57
    Top = 95
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
    Left = 29
    Top = 52
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
  object CmnReportExtStandardStf2: TppReport
    AutoStop = False
    ColumnPositions.Strings = (
      '1270'
      '164084')
    DataPipeline = CmnPipelinePrintExtStandard
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpNone
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Custom'
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
    Left = 2
    Top = 475
    Version = '19.04'
    mmColumnWidth = 339068
    DataPipelineName = 'CmnPipelinePrintExtStandard'
    object ppHeaderBand6: TppHeaderBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppLine177: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line8'
        Border.mmPadding = 0
        Position = lpBottom
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 67469
        mmTop = 18521
        mmWidth = 205846
        BandType = 0
        LayerName = Foreground10
      end
      object ppLine178: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line9'
        Border.mmPadding = 0
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 67469
        mmTop = 16140
        mmWidth = 206111
        BandType = 0
        LayerName = Foreground10
      end
      object CmnReportExtStandardStfLabelCorpCode2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
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
        LayerName = Foreground10
      end
      object CmnReportExtStandardStfLabelCorpName2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
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
        LayerName = Foreground10
      end
      object CmnReportExtStandardStfLabelTitle2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
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
        mmLeft = 142082
        mmTop = 3175
        mmWidth = 57150
        BandType = 0
        LayerName = Foreground10
      end
      object CmnReportExtStandardStfLineTitle2: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'UnderLine1'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Style = lsDouble
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 2646
        mmLeft = 142177
        mmTop = 7938
        mmWidth = 57944
        BandType = 0
        LayerName = Foreground10
      end
      object CmnReportExtStandardStfSysVarDate2: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
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
        mmLeft = 243153
        mmTop = 0
        mmWidth = 68263
        BandType = 0
        LayerName = Foreground10
      end
      object ppLine184: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line1'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 67531
        mmTop = 16140
        mmWidth = 2117
        BandType = 0
        LayerName = Foreground10
      end
      object ppLabel17: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Label1'
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
        mmLeft = 72231
        mmTop = 17198
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground10
      end
      object ppLine139: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line2'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 86607
        mmTop = 16140
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground10
      end
      object ppLabel18: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Label2'
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
        mmLeft = 95478
        mmTop = 16933
        mmWidth = 17463
        BandType = 0
        LayerName = Foreground10
      end
      object ppLine160: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line3'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 121811
        mmTop = 16140
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground10
      end
      object ppLabel19: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Label3'
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
        mmLeft = 128323
        mmTop = 16933
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground10
      end
      object ppLine165: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line4'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 147414
        mmTop = 16140
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground10
      end
      object ppLabel20: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Label4'
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
        mmLeft = 153459
        mmTop = 16934
        mmWidth = 6350
        BandType = 0
        LayerName = Foreground10
      end
      object ppLine174: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line5'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 166490
        mmTop = 16140
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground10
      end
      object ppLabel48: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Label5'
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
        mmLeft = 212725
        mmTop = 16933
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground10
      end
      object ppLine175: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line6'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 185565
        mmTop = 16140
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground10
      end
      object ppLabel49: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Label6'
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
        mmLeft = 228600
        mmTop = 16933
        mmWidth = 12700
        BandType = 0
        LayerName = Foreground10
      end
      object ppLine176: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line1101'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 211168
        mmTop = 16140
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground10
      end
      object ppLabel58: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Label7'
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
        mmLeft = 248603
        mmTop = 16933
        mmWidth = 19050
        BandType = 0
        LayerName = Foreground10
      end
      object ppLine196: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line196'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 227026
        mmTop = 16140
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground10
      end
      object ppLine198: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line198'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 242926
        mmTop = 16140
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground10
      end
      object ppLine200: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line200'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 273330
        mmTop = 16140
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground10
      end
      object ppLabel72: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Label72'
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
        mmLeft = 171186
        mmTop = 16933
        mmWidth = 9525
        BandType = 0
        LayerName = Foreground10
      end
      object ppLBSectionName: TppLabel
        FontRatio.Auto = True
        FontRatio.Minimum = 80
        DesignLayer = ppDesignLayer11
        UserName = 'LBSectionName'
        HyperlinkEnabled = False
        AutoSize = False
        Border.mmPadding = 0
        Caption = #25152#23646#8251#8251#8251#8251#8251#8251#8251
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
        mmLeft = 187061
        mmTop = 16934
        mmWidth = 22490
        BandType = 0
        LayerName = Foreground10
      end
    end
    object ppDetailBand_StandardStf2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppStandardStfUnderLine2: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line18'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpBottom
        Weight = 0.250000000000000000
        EllipseSize = 50
        mmHeight = 1852
        mmLeft = 67469
        mmTop = 2381
        mmWidth = 205846
        BandType = 4
        LayerName = Foreground10
      end
      object ppLine188: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line10'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 67531
        mmTop = 0
        mmWidth = 2117
        BandType = 4
        LayerName = Foreground10
      end
      object ppLine194: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line11'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 86607
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground10
      end
      object ppDBText10: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'DBText2'
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
        mmLeft = 88207
        mmTop = 794
        mmWidth = 32004
        BandType = 4
        LayerName = Foreground10
      end
      object ppLine190: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line12'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 121811
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground10
      end
      object ppDBText11: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'DBText3'
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
        mmLeft = 123411
        mmTop = 794
        mmWidth = 22403
        BandType = 4
        LayerName = Foreground10
      end
      object ppLine191: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line13'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 147373
        mmTop = 0
        mmWidth = 3704
        BandType = 4
        LayerName = Foreground10
      end
      object ppDBText12: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'DBText4'
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
        mmLeft = 148974
        mmTop = 794
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground10
      end
      object ppLine192: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line14'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 166490
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground10
      end
      object CmnReportExtStandardStfDBTextAppDateStart2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'DBText5'
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
        mmLeft = 212725
        mmTop = 794
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground10
      end
      object ppLine193: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line15'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 185565
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground10
      end
      object CmnReportExtStandardStfDBTextAppDateEnd2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'DBText901'
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
        mmLeft = 228600
        mmTop = 794
        mmWidth = 12700
        BandType = 4
        LayerName = Foreground10
      end
      object ppLine195: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line16'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 211168
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground10
      end
      object CmnReportExtStandardStfDBTextUpdateDate2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'DBText6'
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
        mmLeft = 244526
        mmTop = 794
        mmWidth = 27203
        BandType = 4
        LayerName = Foreground10
      end
      object CmnReportExtStandardStfDBTextCode3: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'CmnReportExtStandardStfDBTextCode3'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SectionCode'
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
        mmLeft = 168090
        mmTop = 794
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground10
      end
      object ppDBText26: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'DBText26'
        HyperlinkEnabled = False
        Border.mmPadding = 0
        DataField = 'SectionName'
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
        mmTop = 794
        mmWidth = 22490
        BandType = 4
        LayerName = Foreground10
      end
      object ppLine199: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line199'
        Border.mmPadding = 0
        Position = lpLeft
        Weight = 0.750000000000000000
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 273330
        mmTop = 0
        mmWidth = 1852
        BandType = 4
        LayerName = Foreground10
      end
      object CmnReportExtStandardStfDBTextCode2: TppDBText
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'CmnReportExtStandardStfDBTextCode2'
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
        mmLeft = 69055
        mmTop = 794
        mmWidth = 15875
        BandType = 4
        LayerName = Foreground10
      end
      object ppLine136: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line136'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 227026
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground10
      end
      object ppLine186: TppLine
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
        UserName = 'Line186'
        Border.mmPadding = 0
        Pen.Width = 0
        Position = lpLeft
        Weight = 0.100000001490116100
        EllipseSize = 50
        mmHeight = 4233
        mmLeft = 242926
        mmTop = 0
        mmWidth = 1323
        BandType = 4
        LayerName = Foreground10
      end
    end
    object ppFooterBand6: TppFooterBand
      Background.Brush.Style = bsClear
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object CmnReportExtStandardStfSysVarPage2: TppSystemVariable
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
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
        mmTop = 0
        mmWidth = 12700
        BandType = 8
        LayerName = Foreground10
      end
      object CmnReportExtStandardStfAccOffice2: TppLabel
        FontRatio.Auto = False
        DesignLayer = ppDesignLayer11
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
        mmLeft = 279136
        mmTop = 0
        mmWidth = 32015
        BandType = 8
        LayerName = Foreground10
      end
    end
    object ppDesignLayers11: TppDesignLayers
      object ppDesignLayer11: TppDesignLayer
        UserName = 'Foreground10'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList11: TppParameterList
    end
  end
  object CmnToolbarImageD: TImageList
    Left = 57
    Top = 52
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
  object aclExec: TActionList
    Left = 1
    Top = 138
    object FreeSetHojyo: TAction
      Category = 'Function'
      Caption = #65420#65432#65392#38917#30446
      OnExecute = FreeSetHojyoExecute
    end
  end
  object CmnMemDataPrintSegBun: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 84
    Top = 520
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
    Left = 11
    Top = 527
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
    Left = 43
    Top = 527
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
  object SPMsHist: TFDStoredProc
    StoredProcName = 'MP_MSHIST_SETINFO'
    Left = 122
    Top = 527
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
    Left = 155
    Top = 527
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
