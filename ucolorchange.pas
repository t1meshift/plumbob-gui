unit uColorChange;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, uPlumbob;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ColorDialog1: TColorDialog;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    PickedColor: TColor;
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
     PickedColor := ColorDialog1.Color;

  //Button1.Caption := IntToStr(PickedColor shr 16) + ' ' + IntToStr((PickedColor shr 8) mod 256) + ' ' + IntToStr(PickedColor mod 256);
  pb_set_color(PickedColor mod 256, (PickedColor shr 8) mod 256, PickedColor shr 16);

end;

procedure TForm1.FormCreate(Sender: TObject);
var DlgStatus : TModalResult;
begin
  PickedColor := $FF11FF;
  while (pb_init <= 0) do
     begin
       DlgStatus := MessageDlg('Plumbob is not connected!',mtWarning,mbAbortRetryIgnore,0);
       if DlgStatus <> mrRetry then
         halt;
     end;
end;

end.

