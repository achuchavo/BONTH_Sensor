object fmbonth: Tfmbonth
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'BON THS'
  ClientHeight = 696
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'NanumGothic'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 511
    Width = 806
    Height = 182
    Align = alBottom
    TabOrder = 0
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 31
    Width = 806
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 800
      Height = 51
      Align = alClient
      Caption = #44592#44228' '#51221#48372
      TabOrder = 0
      object Label1: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 15
        Height = 26
        Align = alLeft
        Alignment = taRightJustify
        Caption = 'IP:'
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object Label2: TLabel
        AlignWithMargins = True
        Left = 326
        Top = 20
        Width = 36
        Height = 26
        Align = alLeft
        Alignment = taRightJustify
        Caption = ' '#50948#52824' :'
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object Label3: TLabel
        AlignWithMargins = True
        Left = 495
        Top = 20
        Width = 64
        Height = 26
        Align = alLeft
        Alignment = taRightJustify
        Caption = ' '#49345#49464' '#50948#52824' :'
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object Label4: TLabel
        AlignWithMargins = True
        Left = 153
        Top = 20
        Width = 40
        Height = 26
        Align = alLeft
        Alignment = taRightJustify
        Caption = #51060' '#47492'  :'
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object edt_ip: TEdit
        AlignWithMargins = True
        Left = 26
        Top = 20
        Width = 121
        Height = 26
        Align = alLeft
        Enabled = False
        TabOrder = 0
        ExplicitHeight = 23
      end
      object edt_loc: TEdit
        AlignWithMargins = True
        Left = 368
        Top = 20
        Width = 121
        Height = 26
        Align = alLeft
        TabOrder = 1
        ExplicitHeight = 23
      end
      object edt_detail_loc: TEdit
        AlignWithMargins = True
        Left = 565
        Top = 20
        Width = 121
        Height = 26
        Align = alLeft
        TabOrder = 2
        ExplicitHeight = 23
      end
      object edt_name: TEdit
        AlignWithMargins = True
        Left = 199
        Top = 20
        Width = 121
        Height = 26
        Align = alLeft
        TabOrder = 3
        ExplicitHeight = 23
      end
      object btn_save: TButton
        AlignWithMargins = True
        Left = 692
        Top = 20
        Width = 75
        Height = 26
        Align = alLeft
        Caption = #51200' '#51109
        TabOrder = 4
        OnClick = btn_saveClick
      end
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 806
    Height = 22
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lbl_status: TLabel
      Left = 746
      Top = 0
      Width = 41
      Height = 22
      Align = alRight
      Caption = 'Offline'
      Layout = tlCenter
      ExplicitHeight = 15
    end
    object pnl_status: TPanel
      AlignWithMargins = True
      Left = 790
      Top = 3
      Width = 13
      Height = 16
      Align = alRight
      Color = clRed
      ParentBackground = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 94
    Width = 806
    Height = 57
    Align = alTop
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 3
    object GroupBox2: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 796
      Height = 47
      Align = alClient
      Caption = #50728' '#49845' '#46020' '#44228' '#50672#44208
      TabOrder = 0
      object Label5: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 34
        Height = 22
        Align = alLeft
        Alignment = taRightJustify
        Caption = 'Port :'
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object Label6: TLabel
        Left = 699
        Top = 17
        Width = 64
        Height = 28
        Align = alRight
        Caption = #50672#44208' '#49345#53468' : '
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object Label7: TLabel
        AlignWithMargins = True
        Left = 119
        Top = 20
        Width = 78
        Height = 22
        Align = alLeft
        Alignment = taRightJustify
        Caption = 'Interval ('#52488') :'
        Layout = tlCenter
        ExplicitHeight = 15
      end
      object btn_connect: TButton
        AlignWithMargins = True
        Left = 253
        Top = 20
        Width = 53
        Height = 22
        Align = alLeft
        Caption = #50672' '#44208
        TabOrder = 0
        OnClick = btn_connectClick
      end
      object pnl_connect: TPanel
        AlignWithMargins = True
        Left = 766
        Top = 20
        Width = 25
        Height = 22
        Align = alRight
        Color = clRed
        ParentBackground = False
        TabOrder = 1
      end
      object cmb_port: TComboBox
        AlignWithMargins = True
        Left = 45
        Top = 20
        Width = 68
        Height = 23
        Align = alLeft
        TabOrder = 2
      end
      object spin_interval: TAdvSpinEdit
        Left = 200
        Top = 17
        Width = 50
        Height = 28
        Value = 60
        FloatValue = 60.000000000000000000
        HexValue = 0
        Align = alLeft
        IncrementFloat = 0.100000000000000000
        IncrementFloatPage = 1.000000000000000000
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        TabOrder = 3
        Visible = True
        Version = '1.7.0.0'
      end
    end
  end
  object Panel4: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 157
    Width = 806
    Height = 348
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    Color = -1
    ParentBackground = False
    TabOrder = 4
    object lbl_timestamp: TLabel
      Left = 8
      Top = 252
      Width = 188
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -13
      Font.Name = 'NanumGothic'
      Font.Style = []
      ParentFont = False
    end
    object Button3: TButton
      Left = 56
      Top = 0
      Width = 89
      Height = 32
      Caption = 'Get Value'
      TabOrder = 0
      Visible = False
      OnClick = Button3Click
    end
    object btn_start: TButton
      Left = 42
      Top = 74
      Width = 121
      Height = 67
      Caption = #47784#45768#53664#47553' '#49884#51089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'NanumGothic'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_startClick
    end
    object Panel5: TPanel
      Left = 199
      Top = 52
      Width = 177
      Height = 62
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
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
      Left = 199
      Top = 130
      Width = 177
      Height = 62
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 3
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
      Left = 199
      Top = 205
      Width = 177
      Height = 62
      BevelKind = bkFlat
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 4
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
    object btn_stop: TButton
      Left = 42
      Top = 162
      Width = 121
      Height = 67
      Caption = #47784#45768#53664#47553' '#51473#45800
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'NanumGothic'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btn_stopClick
    end
    object thG: TDBGridEh
      AlignWithMargins = True
      Left = 406
      Top = 3
      Width = 393
      Height = 338
      Align = alRight
      Color = clInactiveBorder
      DynProps = <>
      EvenRowColor = clInactiveBorder
      FixedColor = clInfoText
      IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
      RowDetailPanel.Color = clBtnFace
      TabOrder = 6
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Edit3: TEdit
      Left = 19
      Top = 9
      Width = 177
      Height = 23
      TabOrder = 7
      Visible = False
    end
  end
  object ths_port: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    OnRxChar = ths_portRxChar
    Left = 216
    Top = 424
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 619
    Top = 213
  end
end
