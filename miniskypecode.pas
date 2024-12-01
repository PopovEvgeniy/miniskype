unit miniskypecode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.UITypes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Winapi.WebView2, Winapi.ActiveX,
  Vcl.Edge;

type
  TForm1 = class(TForm)
    EdgeBrowser1: TEdgeBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdgeBrowser1SourceChanged(Sender: TCustomEdgeBrowser;
      IsNewDocument: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure EdgeBrowser1CreateWebViewCompleted(Sender: TCustomEdgeBrowser;
      AResult: HRESULT);
    procedure EdgeBrowser1NavigationCompleted(Sender: TCustomEdgeBrowser;
      IsSuccess: Boolean; WebErrorStatus: COREWEBVIEW2_WEB_ERROR_STATUS);
    procedure EdgeBrowser1NewWindowRequested(Sender: TCustomEdgeBrowser;
      Args: TNewWindowRequestedEventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var Form1: TForm1;

implementation

procedure window_setup();
begin
 Application.Title:='Mini skype';
 Form1.Caption:='Mini skype 0.5.6';
 Form1.BorderStyle:=bsSizeable;
 Form1.Font.Name:=Screen.MenuFont.Name;
 Form1.Font.Size:=14;
end;

procedure cache_setup();
var target:string;
begin
 target:=ExtractFilePath(Application.ExeName)+PathDelim+'unins000.exe';
 Form1.EdgeBrowser1.UserDataFolder:=ExtractFilePath(Application.ExeName)+PathDelim+'Cache';
 if FileExists(target)=True then
 begin
  Form1.EdgeBrowser1.UserDataFolder:=GetEnvironmentVariable('LOCALAPPDATA')+PathDelim+Application.Title;
 end;

end;

procedure client_setup();
begin
 Form1.EdgeBrowser1.AllowSingleSignOnUsingOSPrimaryAccount:=True;
 Form1.EdgeBrowser1.TargetCompatibleBrowserVersion:='92.0.902.67';
 Form1.EdgeBrowser1.CreateWebView();
end;

procedure setup();
begin
 window_setup();
 cache_setup();
 client_setup();
end;

{$R *.dfm}

procedure TForm1.EdgeBrowser1CreateWebViewCompleted(Sender: TCustomEdgeBrowser;
  AResult: HRESULT);
begin
 if AResult=0 then
 begin
  Sender.StatusBarEnabled:=False;
  Sender.BuiltInErrorPageEnabled:=False;
  Sender.DevToolsEnabled:=False;
  Sender.DefaultContextMenusEnabled:=True;
  Sender.DefaultScriptDialogsEnabled:=True;
  Sender.Navigate('https://web.skype.com');
 end;

end;

procedure TForm1.EdgeBrowser1NavigationCompleted(Sender: TCustomEdgeBrowser;
  IsSuccess: Boolean; WebErrorStatus: COREWEBVIEW2_WEB_ERROR_STATUS);
begin
 if IsSuccess=False then
 begin
  Sender.Refresh();
 end;

end;

procedure TForm1.EdgeBrowser1NewWindowRequested(Sender: TCustomEdgeBrowser;
  Args: TNewWindowRequestedEventArgs);
begin
 Args.ArgsInterface.Set_Handled(1);
 ShowMessage('An external link is not supported');
end;

procedure TForm1.EdgeBrowser1SourceChanged(Sender: TCustomEdgeBrowser;
  IsNewDocument: Boolean);
begin
  if Pos('https://www.skype.com',Sender.LocationURL)>0 then
  begin
   Sender.Stop();
   Sender.Navigate('https://web.skype.com');
  end;

end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CanClose:=MessageDlg('Do you want to quit?',mtConfirmation,mbYesNo,0)=mrYes;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 setup();
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 Form1.EdgeBrowser1.CloseWebView();
end;

procedure TForm1.FormResize(Sender: TObject);
begin
 Form1.EdgeBrowser1.Width:=Form1.ClientWidth;
 Form1.EdgeBrowser1.Height:=Form1.ClientHeight;
end;

end.