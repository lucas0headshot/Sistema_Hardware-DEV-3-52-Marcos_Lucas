unit U_Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Buttons, Data.DB,
  Vcl.Menus, Vcl.Grids, Vcl.DBGrids;

type
  TFrm_Produto = class(TForm)
    PageControl: TPageControl;
    tb_produto: TTabSheet;
    Image_1: TImage;
    btn_salvar: TSpeedButton;
    btn_editar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_deletar: TSpeedButton;
    btn_bloquear: TSpeedButton;
    btn_procurar: TSpeedButton;
    btn_inserir: TSpeedButton;
    txt_ID: TDBEdit;
    txt_Nome: TDBEdit;
    txt_Descricao: TDBEdit;
    txt_Especificacoes: TDBEdit;
    txt_Preco: TDBEdit;
    db_Disponibilidade: TDBComboBox;
    tb_consulta: TTabSheet;
    txt_Quantidade: TDBEdit;
    txt_Codigo: TDBEdit;
    txt_Caracteristicas: TDBEdit;
    MainMenu: TMainMenu;
    Sair1: TMenuItem;
    Voltar1: TMenuItem;
    lb_msg: TLabel;
    DBGrid1: TDBGrid;
    rg_opcoes: TRadioGroup;
    btn_buscarTudo: TButton;
    btn_pesquisar: TButton;
    btn_imprimir: TButton;
    txt_Peso: TDBEdit;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Voltar1Click(Sender: TObject);
    procedure rg_opcoesClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    procedure QuantidadeRegistros;
    procedure ConfigBotoes;
    procedure BuscarTudo;
  public
    { Public declarations }
  end;

var
  Frm_Produto: TFrm_Produto;

implementation

{$R *.dfm}

uses U_Dm, U_principal;

Procedure TFrm_Produto.ConfigBotoes; //Configura os botões
  Begin
    btn_inserir.Enabled:= Dm.tb_Produto.State in [dsbrowse];
    btn_editar.Enabled:= Dm.tb_Produto.State in [dsbrowse];
    btn_deletar.Enabled:= Dm.tb_Produto.State in [dsbrowse];

    btn_salvar.Enabled:= Dm.tb_Produto.State in [dsedit, dsinsert];
    btn_bloquear.Enabled:= Dm.tb_Produto.State in [dsedit, dsinsert];

  End;

Procedure TFrm_Produto.QuantidadeRegistros;
  Begin
    if (Dm.SQL_Con_Produto.RecordCount = 0) then
      lb_msg.Visible:= true;
      lb_msg.Caption:= '';
      lb_msg.Caption:= 'Nenhum produto encontrado!';
      btn_imprimir.Enabled:= false;

    if (Dm.SQL_Con_Produto.RecordCount = 1) then
      lb_msg.Visible:= true;
      lb_msg.Caption:= '';
      lb_msg.Caption:= 'Produto encontrado!' + IntToStr(Dm.SQL_Con_Produto.RecordCount) + 'produto';
      btn_imprimir.Enabled:= true;

    if (Dm.SQL_Con_Produto.RecordCount > 1) then
      lb_msg.Visible:= true;
      lb_msg.Caption:= '';
      lb_msg.Caption:= 'Produto encontrados!' + IntToStr(Dm.SQL_Con_Produto.RecordCount) + 'produtos';
      btn_imprimir.Enabled:= true;
  End;

Procedure TFrm_Produto.rg_opcoesClick(Sender: TObject);
  Begin
    Dm.SQL_Con_Produto.Close;
    Dm.SQL_Con_Produto.SQL.Clear;
    Dm.SQL_Con_Produto.SQL.Add('select * from Produto');
    Dm.SQL_Con_Produto.Open;
    btn_imprimir.Enabled:= true;
    QuantidadeRegistros;
  End;

Procedure TFrm_Produto.Sair1Click(Sender: TObject); //Fecha o programa
  Begin
    Frm_Principal.Close;
    Frm_Produto.Close;
  End;

Procedure TFrm_Produto.Voltar1Click(Sender: TObject); //Volta para o formulário anterior(Principal)
  Begin
    Frm_Produto.Visible:= false;
    Frm_Principal.Visible:= true;
  End;

Procedure TFrm_Produto.btn_cancelarClick(Sender: TObject);
  Begin
    if dm.tb_produto.State in  [dsInsert,dsEdit] then
      Begin
        showmessage ('Salve ou Cancele antes de fechar!');
        exit;
    End Else
      close;
  End;

Procedure TFrm_Produto.btn_inserirClick(Sender: TObject);
  Begin
    Dm.tb_Produto.Active:= true; //Incia inserção
    Dm.tb_Produto.Insert;

    ConfigBotoes; //Habilita ou desabilita botões
    txt_nome.SetFocus;
  End;

Procedure TFrm_Produto.btn_salvarClick(Sender: TObject);
  Begin
    Dm.tb_Produto.Post; //Salva dados na tabela
    ShowMessage('Salvo com sucesso');
  End;

procedure TFrm_Produto.BuscarTudo;
begin

end;

End.
