object fmdetail: Tfmdetail
  Left = 0
  Top = 0
  Caption = #54788#54889
  ClientHeight = 657
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'NanumGothic'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 531
    Height = 657
    Align = alClient
    TabOrder = 0
    ExplicitTop = -160
    ExplicitWidth = 411
    ExplicitHeight = 675
    object fakers: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 358
      Width = 523
      Height = 295
      Align = alBottom
      BevelKind = bkFlat
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'NanumGothic'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitTop = 376
      ExplicitWidth = 403
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 256
        Width = 513
        Height = 32
        Align = alBottom
        BevelKind = bkFlat
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'NanumGothic'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 393
        object btn_excel: TButton
          Left = 434
          Top = 0
          Width = 75
          Height = 28
          Align = alRight
          Caption = 'EXCEL'
          TabOrder = 0
          OnClick = btn_excelClick
          ExplicitLeft = 314
        end
      end
      object Panel9: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 513
        Height = 28
        Align = alTop
        BevelKind = bkFlat
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'NanumGothic'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitWidth = 393
        object Label4: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 36
          Height = 18
          Align = alLeft
          Caption = #44592' '#44036' :'
          Layout = tlCenter
          ExplicitHeight = 15
        end
        object Label5: TLabel
          AlignWithMargins = True
          Left = 164
          Top = 3
          Width = 9
          Height = 18
          Align = alLeft
          Caption = '~'
          Layout = tlCenter
          ExplicitHeight = 15
        end
        object date1: TDateTimePicker
          Left = 42
          Top = 0
          Width = 119
          Height = 24
          Align = alLeft
          Date = 43817.583470069450000000
          Time = 43817.583470069450000000
          TabOrder = 0
        end
        object date2: TDateTimePicker
          Left = 176
          Top = 0
          Width = 119
          Height = 24
          Align = alLeft
          Date = 43817.583470069450000000
          Time = 43817.583470069450000000
          TabOrder = 1
        end
        object btn_search: TButton
          Left = 434
          Top = 0
          Width = 75
          Height = 24
          Align = alRight
          Caption = 'Search'
          TabOrder = 2
          OnClick = btn_searchClick
          ExplicitLeft = 314
        end
      end
      object thG: TDBGridEh
        AlignWithMargins = True
        Left = 3
        Top = 37
        Width = 513
        Height = 213
        Align = alClient
        Color = clInactiveBorder
        DynProps = <>
        EvenRowColor = clInactiveBorder
        FixedColor = clInfoText
        IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        RowDetailPanel.Color = clBtnFace
        TabOrder = 2
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 42
      Width = 523
      Height = 310
      Align = alClient
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = 2894892
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'NanumGothic'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 403
      ExplicitHeight = 328
    end
    object pnl_title: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 523
      Height = 32
      Align = alTop
      BevelKind = bkFlat
      BevelOuter = bvNone
      Caption = #51060#47492' : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'NanumGothic'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitWidth = 403
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx'
    Left = 335
    Top = 232
  end
end
