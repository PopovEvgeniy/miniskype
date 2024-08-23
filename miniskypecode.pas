unit miniskypecode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure WebBrowser1ProgressChange(ASender: TObject; Progress,
      ProgressMax: Integer);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure WebBrowser1BeforeNavigate2(ASender: TObject;
      const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
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
 Form1.Caption:='Mini skype 0.2.2';
 Form1.BorderStyle:=bsSizeable;
 Form1.Font.Name:=Screen.MenuFont.Name;
 Form1.Font.Size:=14;
end;

procedure interface_setup();
begin
 Form1.ProgressBar1.Smooth:=True;
 Form1.ProgressBar1.Style:=pbstMarquee;
 Form1.ProgressBar1.Orientation:=pbHorizontal;
 Form1.ProgressBar1.Min:=0;
 Form1.ProgressBar1.Position:=0;
 Form1.ProgressBar1.Max:=100;
 Form1.ProgressBar1.Step:=1;
 Form1.ProgressBar1.MarqueeInterval:=1;
end;

procedure resize_window();
begin
 Form1.ProgressBar1.Width:=Form1.ClientWidth;
 Form1.ProgressBar1.Top:=Form1.ClientHeight-Form1.ProgressBar1.Height;
 Form1.WebBrowser1.Width:=Form1.ClientWidth;
 Form1.WebBrowser1.Height:=Form1.ProgressBar1.Top;
end;

procedure client_setup();
begin
 Form1.WebBrowser1.Silent:=False;
 Form1.WebBrowser1.RegisterAsBrowser:=True;
 Form1.WebBrowser1.RegisterAsDropTarget:=False;
 Form1.WebBrowser1.Offline:=False;
 Form1.WebBrowser1.SelectedEngine:=EdgeOnly;
end;

procedure setup();
begin
 window_setup();
 interface_setup();
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

procedure TForm1.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
 Form1.ProgressBar1.Position:=0;
 Form1.ProgressBar1.Max:=0;
end;

procedure TForm1.WebBrowser1ProgressChange(ASender: TObject; Progress,
  ProgressMax: Integer);
begin
 Form1.ProgressBar1.Max:=ProgressMax;
 Form1.ProgressBar1.Position:=Progress;
end;

end.
