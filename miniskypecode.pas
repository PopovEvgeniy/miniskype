unit miniskypecode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Winapi.WebView2, Winapi.ActiveX,
  Vcl.Edge;

type
  TMainWindow = class(TForm)
    WebClient: TEdgeBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure WebClientSourceChanged(Sender: TCustomEdgeBrowser;
      IsNewDocument: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure WebClientCreateWebViewCompleted(Sender: TCustomEdgeBrowser;
      AResult: HRESULT);
    procedure WebClientNavigationCompleted(Sender: TCustomEdgeBrowser;
      IsSuccess: Boolean; WebErrorStatus: COREWEBVIEW2_WEB_ERROR_STATUS);
    procedure WebClientNewWindowRequested(Sender: TCustomEdgeBrowser;
      Args: TNewWindowRequestedEventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var MainWindow: TMainWindow;

implementation

procedure window_setup();
begin
 Application.Title:='Mini Skype';
 MainWindow.Caption:='Mini Skype 0.5.9';
 MainWindow.BorderStyle:=bsSizeable;
 MainWindow.Font.Name:=Screen.MenuFont.Name;
 MainWindow.Font.Size:=14;
end;

procedure cache_setup();
var target:string;
begin
 target:=ExtractFilePath(Application.ExeName)+PathDelim+'unins000.exe';
 MainWindow.WebClient.UserDataFolder:=ExtractFilePath(Application.ExeName)+PathDelim+'Cache';
 if FileExists(target)=True then
 begin
  MainWindow.WebClient.UserDataFolder:=GetEnvironmentVariable('LOCALAPPDATA')+PathDelim+Application.Title;
 end;

end;

procedure client_setup();
begin
 MainWindow.WebClient.AllowSingleSignOnUsingOSPrimaryAccount:=True;
 MainWindow.WebClient.TargetCompatibleBrowserVersion:='92.0.902.67';
 MainWindow.WebClient.CreateWebView();
end;

procedure setup();
begin
 window_setup();
 cache_setup();
 client_setup();
end;

{$R *.dfm}

procedure TMainWindow.FormCreate(Sender: TObject);
begin
 setup();
end;

procedure TMainWindow.FormDestroy(Sender: TObject);
begin
 MainWindow.WebClient.CloseWebView();
end;

procedure TMainWindow.FormResize(Sender: TObject);
begin
 MainWindow.WebClient.Width:=MainWindow.ClientWidth;
 MainWindow.WebClient.Height:=MainWindow.ClientHeight;
end;

procedure TMainWindow.WebClientCreateWebViewCompleted(Sender: TCustomEdgeBrowser;
  AResult: HRESULT);
begin
 if Sender.WebViewCreated=True then
 begin
  Sender.StatusBarEnabled:=False;
  Sender.BuiltInErrorPageEnabled:=False;
  Sender.DevToolsEnabled:=False;
  Sender.DefaultContextMenusEnabled:=True;
  Sender.DefaultScriptDialogsEnabled:=True;
  Sender.Navigate('https://preview.web.skype.com');
 end;

end;

procedure TMainWindow.WebClientNavigationCompleted(Sender: TCustomEdgeBrowser;
  IsSuccess: Boolean; WebErrorStatus: COREWEBVIEW2_WEB_ERROR_STATUS);
begin
 if IsSuccess=False then
 begin
  Sender.Refresh();
 end;

end;

procedure TMainWindow.WebClientNewWindowRequested(Sender: TCustomEdgeBrowser;
  Args: TNewWindowRequestedEventArgs);
begin
 Args.ArgsInterface.Set_Handled(1);
 ShowMessage('An external link is not supported');
end;

procedure TMainWindow.WebClientSourceChanged(Sender: TCustomEdgeBrowser;
  IsNewDocument: Boolean);
begin
  if Pos('https://www.skype.com',Sender.LocationURL)>0 then
  begin
   Sender.Stop();
   Sender.Navigate('https://preview.web.skype.com');
  end;

end;

procedure TMainWindow.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CanClose:=MessageDlg('Do you want to quit?',mtConfirmation,mbYesNo,0)=mrYes;
end;

end.