program THClient;

uses
  Vcl.Forms,
  uthclient in 'uthclient.pas' {fmthclient},
  u_module in 'u_module.pas' {d_module: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfmthclient, fmthclient);
  Application.CreateForm(Td_module, d_module);
  Application.Run;
end.
