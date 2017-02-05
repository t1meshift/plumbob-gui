unit uPlumbob;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  LIB_NAME = 'Plumbob.dll';

function pb_init : integer; cdecl; external LIB_NAME;
function pb_set_color(r, g, b: byte) : integer; cdecl; external LIB_NAME;

implementation

end.


