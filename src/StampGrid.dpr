program StampGrid;

uses
  Forms,
  UFMain in 'UFMain.pas' {FMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmain, FMain);
  Application.Run;
end.

