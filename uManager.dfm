object fmManager: TfmManager
  Left = 0
  Top = 0
  Caption = 'TH Manager'
  ClientHeight = 764
  ClientWidth = 1273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'NanumGothic'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object page_holder: TPageControl
    Left = 0
    Top = 0
    Width = 1273
    Height = 764
    ActivePage = page_home
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1091
    ExplicitHeight = 718
    object page_login: TTabSheet
      Caption = 'Login'
      ExplicitWidth = 1083
      ExplicitHeight = 688
      object Label4: TLabel
        Left = 376
        Top = 371
        Width = 126
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'PASSWORD : '
      end
      object Label15: TLabel
        Left = 432
        Top = 315
        Width = 70
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'USER : '
      end
      object btn_logIN: TButton
        Left = 568
        Top = 432
        Width = 121
        Height = 57
        Caption = 'Login'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'NanumGothic'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btn_logINClick
      end
      object edt_password: TEdit
        Left = 542
        Top = 368
        Width = 163
        Height = 23
        BevelEdges = [beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        PasswordChar = '*'
        TabOrder = 1
        Text = 'bonsys'
        OnKeyPress = edt_passwordKeyPress
      end
      object edt_user: TEdit
        Left = 542
        Top = 312
        Width = 163
        Height = 23
        BevelEdges = [beBottom]
        BevelInner = bvNone
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 0
        Text = 'bonsys'
        OnKeyPress = edt_passwordKeyPress
      end
    end
    object page_home: TTabSheet
      Caption = 'Home'
      ImageIndex = 1
      ExplicitWidth = 1083
      ExplicitHeight = 688
      object GridPanel1: TGridPanel
        AlignWithMargins = True
        Left = 3
        Top = 50
        Width = 1043
        Height = 681
        Align = alClient
        BevelKind = bkFlat
        BevelOuter = bvNone
        ColumnCollection = <
          item
            Value = 20.000000000000000000
          end
          item
            Value = 20.000000000000000000
          end
          item
            Value = 20.000000000000000000
          end
          item
            Value = 20.000000000000000000
          end
          item
            Value = 20.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = pnl01
            Row = 0
          end
          item
            Column = 1
            Control = pnl02
            Row = 0
          end
          item
            Column = 2
            Control = pnl03
            Row = 0
          end
          item
            Column = 3
            Control = pnl04
            Row = 0
          end
          item
            Column = 4
            Control = pnl05
            Row = 0
          end
          item
            Column = 0
            Control = pnl06
            Row = 1
          end
          item
            Column = 1
            Control = pnl07
            Row = 1
          end
          item
            Column = 2
            Control = pnl08
            Row = 1
          end
          item
            Column = 3
            Control = pnl09
            Row = 1
          end
          item
            Column = 4
            Control = pnl10
            Row = 1
          end>
        RowCollection = <
          item
            Value = 50.000000000000000000
          end
          item
            Value = 50.000000000000000000
          end>
        TabOrder = 0
        ExplicitTop = 3
        ExplicitWidth = 1077
        ExplicitHeight = 682
        object pnl01: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 201
          Height = 332
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitWidth = 208
          ExplicitHeight = 333
          object Panel11: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 191
            Height = 34
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            ExplicitWidth = 198
            object Label1: TLabel
              Left = 0
              Top = 0
              Width = 65
              Height = 34
              Align = alLeft
              Alignment = taRightJustify
              AutoSize = False
              Caption = #51060#47492' :'
              Layout = tlCenter
              ExplicitHeight = 30
            end
            object edt_name01: TEdit
              AlignWithMargins = True
              Left = 68
              Top = 3
              Width = 120
              Height = 28
              Align = alClient
              TabOrder = 0
              Text = '01'
              ExplicitLeft = 40
              ExplicitTop = 8
              ExplicitWidth = 121
              ExplicitHeight = 23
            end
          end
          object Panel12: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 43
            Width = 191
            Height = 34
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitWidth = 198
            object Label2: TLabel
              Left = 0
              Top = 0
              Width = 65
              Height = 34
              Align = alLeft
              Alignment = taRightJustify
              AutoSize = False
              Caption = #50948#52824' :'
              Layout = tlCenter
              ExplicitHeight = 30
            end
            object edt_location01: TEdit
              AlignWithMargins = True
              Left = 68
              Top = 3
              Width = 120
              Height = 28
              Align = alClient
              TabOrder = 0
              ExplicitLeft = 60
              ExplicitWidth = 131
              ExplicitHeight = 23
            end
          end
          object Panel13: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 83
            Width = 191
            Height = 34
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            ExplicitWidth = 198
            object Label3: TLabel
              Left = 0
              Top = 0
              Width = 65
              Height = 34
              Align = alLeft
              Alignment = taRightJustify
              AutoSize = False
              Caption = #49345#49464' '#50948#52824' :'
              Layout = tlCenter
              ExplicitHeight = 30
            end
            object edt_location_detail01: TEdit
              AlignWithMargins = True
              Left = 68
              Top = 3
              Width = 120
              Height = 28
              Align = alClient
              TabOrder = 0
              ExplicitLeft = 60
              ExplicitWidth = 131
              ExplicitHeight = 23
            end
          end
          object Panel14: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 123
            Width = 191
            Height = 162
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 3
            ExplicitWidth = 198
            ExplicitHeight = 163
            object Panel16: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 185
              Height = 50
              Align = alTop
              BevelKind = bkFlat
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              ExplicitWidth = 192
              object Label8: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 24
                Height = 40
                Align = alLeft
                AutoSize = False
                Caption = #49845#46020
                Layout = tlCenter
                ExplicitHeight = 15
              end
              object lbl_hum01: TLabel
                AlignWithMargins = True
                Left = 33
                Top = 3
                Width = 97
                Height = 40
                Align = alClient
                Alignment = taCenter
                AutoSize = False
                Caption = '....'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -27
                Font.Name = 'NanumGothic'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
                ExplicitWidth = 84
                ExplicitHeight = 46
              end
              object Label10: TLabel
                AlignWithMargins = True
                Left = 136
                Top = 3
                Width = 42
                Height = 40
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
            object Panel17: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 113
              Width = 185
              Height = 46
              Align = alClient
              BevelKind = bkFlat
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              ExplicitLeft = 17
              ExplicitTop = 97
              ExplicitWidth = 177
              ExplicitHeight = 62
              object Label11: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 24
                Height = 36
                Align = alLeft
                AutoSize = False
                Caption = #50728#46020
                Layout = tlCenter
                ExplicitHeight = 15
              end
              object lbl_temp01: TLabel
                AlignWithMargins = True
                Left = 33
                Top = 3
                Width = 100
                Height = 36
                Align = alClient
                Alignment = taCenter
                AutoSize = False
                Caption = '....'
                Color = clWhite
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -20
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
                Left = 139
                Top = 3
                Width = 39
                Height = 36
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
                ExplicitLeft = 131
                ExplicitHeight = 52
              end
            end
            object Panel18: TPanel
              AlignWithMargins = True
              Left = 3
              Top = 59
              Width = 185
              Height = 48
              Align = alTop
              BevelKind = bkFlat
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 2
              ExplicitTop = 65
              ExplicitWidth = 188
              object Label14: TLabel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 24
                Height = 38
                Align = alLeft
                AutoSize = False
                Caption = #44592#50517
                Layout = tlCenter
                ExplicitHeight = 15
              end
              object lbl_press01: TLabel
                AlignWithMargins = True
                Left = 33
                Top = 3
                Width = 97
                Height = 38
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
                Left = 136
                Top = 3
                Width = 42
                Height = 38
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
          end
          object Panel15: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 291
            Width = 191
            Height = 34
            Align = alBottom
            BevelKind = bkFlat
            BevelOuter = bvNone
            TabOrder = 4
            ExplicitLeft = 8
            ExplicitTop = 158
            ExplicitWidth = 198
            object btn_detail01: TButton
              Left = 112
              Top = 0
              Width = 75
              Height = 30
              Align = alRight
              Caption = #54788#54889
              TabOrder = 0
              ExplicitLeft = 64
              ExplicitTop = 8
              ExplicitHeight = 25
            end
          end
        end
        object pnl02: TPanel
          AlignWithMargins = True
          Left = 210
          Top = 3
          Width = 201
          Height = 332
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 217
          ExplicitWidth = 208
          ExplicitHeight = 333
        end
        object pnl03: TPanel
          AlignWithMargins = True
          Left = 417
          Top = 3
          Width = 201
          Height = 332
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 2
          ExplicitLeft = 431
          ExplicitWidth = 208
          ExplicitHeight = 333
        end
        object pnl04: TPanel
          AlignWithMargins = True
          Left = 624
          Top = 3
          Width = 201
          Height = 332
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 3
          ExplicitLeft = 645
          ExplicitWidth = 208
          ExplicitHeight = 333
        end
        object pnl05: TPanel
          AlignWithMargins = True
          Left = 831
          Top = 3
          Width = 205
          Height = 332
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 4
          ExplicitLeft = 859
          ExplicitWidth = 211
          ExplicitHeight = 333
        end
        object pnl06: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 341
          Width = 201
          Height = 333
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 5
          ExplicitTop = 342
          ExplicitWidth = 208
        end
        object pnl07: TPanel
          AlignWithMargins = True
          Left = 210
          Top = 341
          Width = 201
          Height = 333
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 6
          ExplicitLeft = 217
          ExplicitTop = 342
          ExplicitWidth = 208
        end
        object pnl08: TPanel
          AlignWithMargins = True
          Left = 417
          Top = 341
          Width = 201
          Height = 333
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 7
          ExplicitLeft = 431
          ExplicitTop = 342
          ExplicitWidth = 208
        end
        object pnl09: TPanel
          AlignWithMargins = True
          Left = 624
          Top = 341
          Width = 201
          Height = 333
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 8
          ExplicitLeft = 645
          ExplicitTop = 342
          ExplicitWidth = 208
        end
        object pnl10: TPanel
          AlignWithMargins = True
          Left = 831
          Top = 341
          Width = 205
          Height = 333
          Align = alClient
          BevelKind = bkFlat
          BevelOuter = bvNone
          TabOrder = 9
          ExplicitLeft = 859
          ExplicitTop = 342
          ExplicitWidth = 211
        end
      end
      object Panel3: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1259
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 448
        ExplicitTop = 328
        ExplicitWidth = 185
        object btn_create_components: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 94
          Height = 35
          Align = alLeft
          Caption = #47784#45768#53664#47553' '#49884#51089
          TabOrder = 0
          OnClick = btn_create_componentsClick
        end
        object Button2: TButton
          AlignWithMargins = True
          Left = 103
          Top = 3
          Width = 75
          Height = 35
          Align = alLeft
          Caption = 'Check'
          TabOrder = 1
          Visible = False
          OnClick = Button2Click
          ExplicitLeft = 6
          ExplicitTop = 16
          ExplicitHeight = 25
        end
        object btn_stop: TButton
          AlignWithMargins = True
          Left = 184
          Top = 3
          Width = 105
          Height = 35
          Align = alLeft
          Caption = #47784#45768#53664#47553' '#51473#51648
          TabOrder = 2
          OnClick = btn_stopClick
        end
        object btn_refresh: TButton
          Left = 1184
          Top = 0
          Width = 75
          Height = 41
          Align = alRight
          Caption = 'REFRESH'
          TabOrder = 3
          OnClick = btn_refreshClick
          ExplicitLeft = 720
          ExplicitTop = 16
          ExplicitHeight = 25
        end
        object Button4: TButton
          Left = 316
          Top = 0
          Width = 97
          Height = 25
          Caption = 'Terminate UI'
          TabOrder = 4
          Visible = False
          OnClick = Button4Click
        end
        object Panel1: TPanel
          AlignWithMargins = True
          Left = 1032
          Top = 3
          Width = 149
          Height = 35
          Align = alRight
          BevelKind = bkFlat
          BevelOuter = bvNone
          Padding.Left = 5
          Padding.Top = 5
          Padding.Right = 5
          Padding.Bottom = 5
          TabOrder = 5
          object Label5: TLabel
            Left = 5
            Top = 5
            Width = 90
            Height = 21
            Align = alLeft
            Alignment = taRightJustify
            Caption = 'Interval ('#52488')'
            Layout = tlCenter
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 70
            ExplicitHeight = 15
          end
          object spin_interval: TAdvSpinEdit
            Left = 95
            Top = 5
            Width = 41
            Height = 24
            Value = 5
            FloatValue = 5.000000000000000000
            TimeValue = 0.208333333333333300
            HexValue = 0
            Align = alLeft
            IncrementFloat = 0.100000000000000000
            IncrementFloatPage = 1.000000000000000000
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'Tahoma'
            LabelFont.Style = []
            MinValue = 10
            TabOrder = 0
            Visible = True
            Version = '1.7.0.0'
            ExplicitLeft = 140
            ExplicitTop = 3
          end
        end
      end
      object mem_info: TMemo
        AlignWithMargins = True
        Left = 1052
        Top = 50
        Width = 210
        Height = 681
        Align = alRight
        TabOrder = 2
        ExplicitLeft = 1032
        ExplicitTop = 47
        ExplicitHeight = 649
      end
    end
  end
end
