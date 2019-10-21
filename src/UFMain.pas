unit UFMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFMain = class(TForm)
    a4: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

var
  b: TBitmap;
  x, y, i: Integer;

procedure TFMain.FormCreate(Sender: TObject);
begin
  if ParamCount <> 2 then
  begin
    halt(0);
    exit;
  end;
  a4.Width := strtoint(ParamStr(1));
  a4.Height := strtoint(ParamStr(2));
  Width := a4.Width + 48;
  Height := a4.Height + 48;
  b := tbitmap.Create();
  x := 0;
  y := 0;
  i := 1;
  while FileExists(inttostr(i) + '.bmp') do
  begin
    b.LoadFromFile(inttostr(i) + '.bmp');
    a4.Canvas.Draw(x, y, b);
    Inc(x, b.Width);
    if (a4.Width - x < b.Width) then
    begin
      Inc(y, b.Height);
      x := 0;
    end;
    Inc(i);
  end;
  a4.Picture.SaveToFile('0.bmp');
end;

end.

