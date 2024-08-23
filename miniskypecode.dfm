object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Mini skype'
  ClientHeight = 463
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 15
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 8
    Width = 616
    Height = 425
    TabOrder = 0
    OnProgressChange = WebBrowser1ProgressChange
    OnBeforeNavigate2 = WebBrowser1BeforeNavigate2
    OnDocumentComplete = WebBrowser1DocumentComplete
    OnNavigateError = WebBrowser1NavigateError
    ControlData = {
      4C000000AA3F0000ED2B00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 439
    Width = 616
    Height = 17
    TabOrder = 1
  end
end
