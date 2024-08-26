unit miniskypecode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure WebBrowser1BeforeNavigate2(ASender: TObject;
      const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowser1NewWindow3(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool; dwFlags: LongWord; const bstrUrlContext,
      bstrUrl: WideString);
    procedure WebBrowser1NewWindow2(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
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
 Form1.Caption:='Mini skype 0.2.9';
 Form1.BorderStyle:=bsSizeable;
 Form1.Font.Name:=Screen.MenuFont.Name;
 Form1.Font.Size:=14;
end;

procedure resize_window();
begin
 Form1.WebBrowser1.Width:=Form1.ClientWidth;
 Form1.WebBrowser1.Height:=Form1.ClientHeight;
end;

procedure client_setup();
begin
 Form1.WebBrowser1.EdgeUserDataFolder:=ExtractFilePath(Application.ExeName)+PathDelim+'Cache';
 Form1.WebBrowser1.Silent:=False;
 Form1.WebBrowser1.RegisterAsBrowser:=True;
 Form1.WebBrowser1.RegisterAsDropTarget:=False;
 Form1.WebBrowser1.Offline:=False;
 Form1.WebBrowser1.SelectedEngine:=EdgeOnly;
end;

procedure setup();
begin
 window_setup();
 client_setup();
 resize_window();
end;

{$R *.dfm}

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CanClose:=MessageDlg('Do you want to quit?',mtConfirmation,mbYesNo,0)=mrYes;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 setup();
end;

procedure TForm1.FormResize(Sender: TObject);
begin
 resize_window();
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if Form1.WebBrowser1.LocationURL='' then
  begin
   Form1.WebBrowser1.Navigate('https://web.skype.com');
  end;

end;

procedure TForm1.WebBrowser1BeforeNavigate2(ASender: TObject;
  const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  if Pos('https://www.skype.com',URL)>0 then
  begin
   Cancel:=True;
   Form1.WebBrowser1.Navigate('https://web.skype.com');
  end;

end;

procedure TForm1.WebBrowser1NewWindow2(ASender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool);
begin
 Cancel:=True;
end;

procedure TForm1.WebBrowser1NewWindow3(ASender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool; dwFlags: LongWord; const bstrUrlContext,
  bstrUrl: WideString);
begin
 Cancel:=True;
 ShowMessage('Sorry. You cant open external links');
end;

end.
