object fmthclient: Tfmthclient
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TH Client'
  ClientHeight = 703
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'NanumGothic'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object page_main: TPageControl
    Left = 0
    Top = 0
    Width = 419
    Height = 703
    ActivePage = page_home
    Align = alClient
    TabOrder = 0
    object page_login: TTabSheet
      Caption = 'page_login'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 411
        Height = 675
        Align = alClient
        BevelOuter = bvNone
        Color = 15921906
        ParentBackground = False
        TabOrder = 0
        object Label1: TLabel
          Left = 129
          Top = 222
          Width = 22
          Height = 19
          Alignment = taRightJustify
          Caption = 'IP :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'NanumGothic'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 108
          Top = 278
          Width = 43
          Height = 19
          Alignment = taRightJustify
          Caption = #51060' '#47492' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'NanumGothic'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 405
          Height = 31
          Align = alTop
          Alignment = taCenter
          Caption = #50728' '#46020' / '#49845' '#46020' '#44228
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'NanumGothic'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 175
        end
        object edt_ip: TEdit
          Left = 168
          Top = 220
          Width = 121
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'NanumGothic'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edt_name: TEdit
          Left = 168
          Top = 276
          Width = 121
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'NanumGothic'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object pnl_login: TPanel
          Left = 104
          Top = 369
          Width = 185
          Height = 41
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'LOGIN'
          Color = 12615680
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'NanumGothic'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          OnClick = pnl_loginClick
          OnMouseEnter = pnl_loginMouseEnter
          OnMouseLeave = pnl_loginMouseLeave
        end
      end
    end
    object page_home: TTabSheet
      Caption = 'page_home'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 411
        Height = 675
        Align = alClient
        TabOrder = 0
        object fakers: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 376
          Width = 403
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
          object Panel8: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 256
            Width = 393
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
            object btn_excel: TButton
              Left = 314
              Top = 0
              Width = 75
              Height = 28
              Align = alRight
              Caption = 'EXCEL'
              TabOrder = 0
              OnClick = btn_excelClick
            end
          end
          object Panel9: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 393
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
              Left = 314
              Top = 0
              Width = 75
              Height = 24
              Align = alRight
              Caption = 'Search'
              TabOrder = 2
              OnClick = btn_searchClick
            end
          end
          object thG: TDBGridEh
            AlignWithMargins = True
            Left = 3
            Top = 37
            Width = 393
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
          Width = 403
          Height = 328
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
          object lbl_info: TLabel
            Left = 88
            Top = 46
            Width = 225
            Height = 15
            Alignment = taCenter
            AutoSize = False
            Caption = #49892#49884#44036' '#47784#45768#53664#47553' '#51473#45800'!'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'NanumGothic'
            Font.Style = []
            ParentFont = False
          end
          object lbl_timestamp: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 302
            Width = 393
            Height = 19
            Align = alBottom
            Alignment = taCenter
            Caption = 'TIMESTAMP :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'NanumGothic'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 102
          end
          object Panel5: TPanel
            Left = 111
            Top = 69
            Width = 177
            Height = 62
            BevelKind = bkFlat
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object Label8: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 24
              Height = 52
              Align = alLeft
              AutoSize = False
              Caption = #49845#46020
              Layout = tlCenter
              ExplicitHeight = 15
            end
            object lbl_hum: TLabel
              AlignWithMargins = True
              Left = 33
              Top = 3
              Width = 89
              Height = 52
              Align = alClient
              Alignment = taCenter
              AutoSize = False
              Caption = '....'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -40
              Font.Name = 'NanumGothic'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              ExplicitWidth = 84
              ExplicitHeight = 46
            end
            object Label10: TLabel
              AlignWithMargins = True
              Left = 128
              Top = 3
              Width = 42
              Height = 52
              Align = alRight
              AutoSize = False
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'NanumGothic'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
              ExplicitLeft = 112
              ExplicitHeight = 39
            end
          end
          object Panel6: TPanel
            Left = 111
            Top = 147
            Width = 177
            Height = 62
            BevelKind = bkFlat
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object Label11: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 24
              Height = 52
              Align = alLeft
              AutoSize = False
              Caption = #50728#46020
              Layout = tlCenter
              ExplicitHeight = 15
            end
            object lbl_temp: TLabel
              AlignWithMargins = True
              Left = 33
              Top = 3
              Width = 92
              Height = 52
              Align = alClient
              Alignment = taCenter
              AutoSize = False
              Caption = '....'
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -40
              Font.Name = 'NanumGothic'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
              ExplicitWidth = 84
              ExplicitHeight = 46
            end
            object Label13: TLabel
              AlignWithMargins = True
              Left = 131
              Top = 3
              Width = 39
              Height = 52
              Align = alRight
              AutoSize = False
              Caption = #176'C'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -20
              Font.Name = 'NanumGothic'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
          end
          object Panel7: TPanel
            Left = 111
            Top = 222
            Width = 177
            Height = 62
            BevelKind = bkFlat
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object Label14: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 24
              Height = 52
              Align = alLeft
              AutoSize = False
              Caption = #44592#50517
              Layout = tlCenter
              ExplicitHeight = 15
            end
            object lbl_press: TLabel
              AlignWithMargins = True
              Left = 33
              Top = 3
              Width = 89
              Height = 52
              Align = alClient
              Alignment = taCenter
              AutoSize = False
              Caption = '......'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -27
              Font.Name = 'NanumGothic'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              ExplicitWidth = 88
              ExplicitHeight = 31
            end
            object Label16: TLabel
              AlignWithMargins = True
              Left = 128
              Top = 3
              Width = 42
              Height = 52
              Align = alRight
              AutoSize = False
              Caption = 'hPa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'NanumGothic'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
              ExplicitLeft = 131
              ExplicitTop = 0
              ExplicitHeight = 58
            end
          end
          object btn_start: TButton
            Left = 19
            Top = 3
            Width = 121
            Height = 39
            Caption = #47784#45768#53664#47553' '#49884#51089
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'NanumGothic'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = btn_startClick
          end
          object btn_stop: TButton
            Left = 258
            Top = 3
            Width = 121
            Height = 39
            Caption = #47784#45768#53664#47553' '#51473#45800
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'NanumGothic'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnClick = btn_stopClick
          end
        end
        object pnl_title: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 403
          Height = 32
          Align = alTop
          BevelKind = bkFlat
          BevelOuter = bvNone
          Caption = 'IP : Name'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'NanumGothic'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel files (*.xlsx)|*.xlsx'
    Left = 335
    Top = 232
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 30000
    OnTimer = Timer1Timer
    Left = 32
    Top = 242
  end
end
