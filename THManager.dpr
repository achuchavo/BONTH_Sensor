program THManager;

uses
  Vcl.Forms,
  uManager in 'uManager.pas' {fmManager},
  uthcodebase in 'uthcodebase.pas',
  u_module in 'u_module.pas' {d_module: TDataModule},
  uUpdateUI in 'uUpdateUI.pas',
  udetails in 'udetails.pas' {fmdetail};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmManager, fmManager);
  Application.CreateForm(Td_module, d_module);
  Application.Run;
end.
