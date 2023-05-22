program CADASTRO;

uses
  Vcl.Forms,
  CADASTRO_PRODUTOS in 'CADASTRO_PRODUTOS.pas' {CAD0001};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCAD0001, CAD0001);
  Application.Run;
end.
