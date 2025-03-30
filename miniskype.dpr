program miniskype;

uses
  Vcl.Forms,
  miniskypecode in 'miniskypecode.pas' {MainWindow};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainWindow, MainWindow);
  Application.Run;
end.
