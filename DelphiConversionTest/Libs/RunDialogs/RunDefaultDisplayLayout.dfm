object frmRunDefaultDisplayLayout: TfrmRunDefaultDisplayLayout
  Left = 68
  Top = 163
  Align = alClient
  BorderStyle = bsNone
  Caption = 'RunDefaultDisplayLayout'
  ClientHeight = 679
  ClientWidth = 1175
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1175
    Height = 679
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 0
      Top = 300
      Width = 1175
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Color = clBtnFace
      MinSize = 20
      ParentColor = False
      ExplicitLeft = 1
      ExplicitTop = 301
      ExplicitWidth = 1173
    end
    object LogPanel: TPanel
      Left = 0
      Top = 303
      Width = 1175
      Height = 376
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 304
      ExplicitWidth = 1173
      ExplicitHeight = 374
      object Splitter1: TSplitter
        Left = 627
        Top = 0
        Height = 376
        Align = alRight
        Color = clBtnFace
        ParentColor = False
        ExplicitLeft = 625
        ExplicitHeight = 332
      end
      object pnlRunInfo: TPanel
        Left = 0
        Top = 0
        Width = 627
        Height = 376
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 625
        ExplicitHeight = 374
      end
      object pnlOtherInfo: TPanel
        Left = 630
        Top = 0
        Width = 545
        Height = 376
        Align = alRight
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 628
        ExplicitHeight = 374
        object pgctrlOtherInfo: TPageControl
          Left = 0
          Top = 0
          Width = 545
          Height = 376
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 374
        end
      end
    end
    object pnlMainTop: TPanel
      Left = 0
      Top = 0
      Width = 1175
      Height = 300
      Align = alTop
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 1
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 1173
      object Splitter3: TSplitter
        Left = 697
        Top = 0
        Height = 300
        Color = clBtnFace
        ParentColor = False
      end
      object pnlLayoutInfo: TPanel
        Left = 0
        Top = 0
        Width = 697
        Height = 300
        Align = alLeft
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
      end
      object pnlDelayInfo: TPanel
        Left = 700
        Top = 0
        Width = 475
        Height = 300
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        ExplicitWidth = 473
      end
    end
  end
end
