program BONTH;

uses
  Vcl.Forms,
  ubonth in 'ubonth.pas' {fmbonth},
  u_module in 'u_module.pas' {d_module: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmbonth, fmbonth);
  Application.CreateForm(Td_module, d_module);
  Application.Run;
end.
