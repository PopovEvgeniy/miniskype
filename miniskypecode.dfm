object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Mini skype'
  ClientHeight = 485
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  TextHeight = 15
  object EdgeBrowser1: TEdgeBrowser
    Left = 8
    Top = 8
    Width = 709
    Height = 469
    TabOrder = 0
    AllowSingleSignOnUsingOSPrimaryAccount = False
    TargetCompatibleBrowserVersion = '92.0.902.67'
    UserDataFolder = '%LOCALAPPDATA%\bds.exe.WebView2'
    OnCreateWebViewCompleted = EdgeBrowser1CreateWebViewCompleted
    OnNavigationCompleted = EdgeBrowser1NavigationCompleted
    OnNewWindowRequested = EdgeBrowser1NewWindowRequested
    OnSourceChanged = EdgeBrowser1SourceChanged
  end
end
