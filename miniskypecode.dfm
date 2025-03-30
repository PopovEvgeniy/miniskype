object MainWindow: TMainWindow
  Left = 0
  Top = 0
  Caption = 'Mini Skype'
  ClientHeight = 504
  ClientWidth = 761
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
  object WebClient: TEdgeBrowser
    Left = 8
    Top = 8
    Width = 745
    Height = 488
    TabOrder = 0
    AllowSingleSignOnUsingOSPrimaryAccount = False
    TargetCompatibleBrowserVersion = '92.0.902.67'
    UserDataFolder = '%LOCALAPPDATA%\bds.exe.WebView2'
    OnCreateWebViewCompleted = WebClientCreateWebViewCompleted
    OnNavigationCompleted = WebClientNavigationCompleted
    OnNewWindowRequested = WebClientNewWindowRequested
    OnSourceChanged = WebClientSourceChanged
  end
end
