program Sistema_Hardware;

uses
  Vcl.Forms,
  U_principal in 'U_principal.pas' {Frm_Principal},
  U_Produto in 'U_Produto.pas' {Frm_Produto},
  U_Dm in 'U_Dm.pas' {Dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.CreateForm(TFrm_Produto, Frm_Produto);
  Application.CreateForm(TDm, Dm);
  Application.Run;
end.
