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
    Imagem: TImage;
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
    lb_resultado: TLabel;
    DBGrid1: TDBGrid;
    rg_opcoes: TRadioGroup;
    btn_buscarTudo: TButton;
    btn_pesquisar: TButton;
    btn_imprimir: TButton;
    txt_Peso: TDBEdit;
    txt_data: TDBEdit;
    lb_buscar: TLabel;
    Data_Con: TDateTimePicker;
    txt_buscar: TDBEdit;
    txt_impressao: TEdit;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Voltar1Click(Sender: TObject);
    procedure rg_opcoesClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_deletarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_procurarClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure txt_impressaoChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
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

procedure TFrm_Produto.DBGrid1CellClick(Column: TColumn);
begin
  with dm.sql_imprimir_produto do
  begin
   close;
   sql.clear;
   if txt_impressao.text = '' then
   begin
     sql.add ('Select * from produto');
   end
   else
   begin
     sql.add('Select * from produto where Produto_ID = :codigo');
     ParamByName('codigo').Value := StrToInt(txt_impressao.text);
   end;
   open;
   dm.report_produto.LoadFromFile(GetCurrentDir + '\rel\relatorio.fr3');
   dm.report_produto.ShowReport();
  end;
end;

procedure TFrm_Produto.FormCreate(Sender: TObject);
  Begin
    PageControl.TabIndex:= 0;
    tb_consulta.TabVisible:= false;

    btn_salvar.Enabled:= false;
    btn_cancelar.Enabled:= false;

    txt_buscar.Visible:= false;
    lb_buscar.Visible:= false;
    Data_Con.Visible:= false;

    btn_imprimir.Enabled:= false;
    btn_pesquisar.Enabled:= false;
  End;

Procedure TFrm_Produto.QuantidadeRegistros; //Quantidade de produtos registrados
  Begin
    if (Dm.SQL_Con_Produto.RecordCount = 0) then
      lb_resultado.Visible:= true;
      lb_resultado.Caption:= '';
      lb_resultado.Caption:= 'Nenhum produto encontrado!';
      btn_imprimir.Enabled:= false;

    if (Dm.SQL_Con_Produto.RecordCount = 1) then
      lb_resultado.Visible:= true;
      lb_resultado.Caption:= '';
      lb_resultado.Caption:= 'Produto encontrado!' + IntToStr(Dm.SQL_Con_Produto.RecordCount) + 'produto';
      btn_imprimir.Enabled:= true;

    if (Dm.SQL_Con_Produto.RecordCount > 1) then
      lb_resultado.Visible:= true;
      lb_resultado.Caption:= '';
      lb_resultado.Caption:= 'Produto encontrados!' + IntToStr(Dm.SQL_Con_Produto.RecordCount) + 'produtos';
      btn_imprimir.Enabled:= true;
  End;

Procedure TFrm_Produto.rg_opcoesClick(Sender: TObject); //Consultar
  Begin
    Case rg_opcoes.ItemIndex of
      0: //Por código
        Begin
          txt_buscar.Visible:= true;
          lb_buscar.Visible:= true;
          lb_buscar.Caption:= 'Digite o código do produto:';
          Data_Con.Visible:= false;
          txt_buscar.Clear;
          btn_pesquisar.Enabled:= true;
          txt_buscar.SetFocus;
        End;

      1: //Por nome
        Begin
          txt_buscar.Visible:= true;
          lb_buscar.Visible:= true;
          lb_buscar.Caption:= 'Digite o nome do produto:';
          Data_Con.Visible:= false;
          txt_buscar.Clear;
          btn_pesquisar.Enabled:= true;
          txt_buscar.SetFocus;
        End;
      2: //Por peso
        Begin
          txt_buscar.Visible:= true;
          lb_buscar.Visible:= true;
          lb_buscar.Caption:= 'Digite o peso do produto:';
          Data_Con.Visible:= false;
          txt_buscar.Clear;
          btn_pesquisar.Enabled:= true;
          txt_buscar.SetFocus;
        End;
      3: //Por preço
        Begin
          txt_buscar.Visible:= true;
          lb_buscar.Visible:= true;
          lb_buscar.Caption:= 'Digite o preço do produto:';
          Data_Con.Visible:= false;
          txt_buscar.Clear;
          btn_pesquisar.Enabled:= true;
          txt_buscar.SetFocus;
        End;
      4: //Por data
        Begin
          txt_buscar.Visible:= false;
          lb_buscar.Visible:= true;
          lb_buscar.Caption:= 'Digite a data do produto:';
          Data_Con.Visible:= true;
          txt_buscar.Clear;
          btn_pesquisar.Enabled:= true;
          txt_buscar.SetFocus;
        End;

    End;
    Dm.SQL_Con_Produto.Close;
    Dm.SQL_Con_Produto.SQL.Clear;
    Dm.SQL_Con_Produto.SQL.Add('select * from Produto');
    Dm.SQL_Con_Produto.Open;
    btn_imprimir.Enabled:= true;
    QuantidadeRegistros;
  End;

Procedure TFrm_Produto.Sair1Click(Sender: TObject); //Fecha o programa
  Begin
    If (Dm.tb_produto.State in [dsInsert, dsEdit]) then
      Begin
        showMessage('Salve ou cancele antes de fechar!');
        exit;
      End
    Else
      Frm_Principal.Close;
      Frm_Produto.Close;
  End;

Procedure TFrm_Produto.txt_impressaoChange(Sender: TObject);
begin
txt_impressao.Text := IntToStr(dm.SQL_Con_ProdutoProduto_ID.Value);
btn_imprimir.Enabled:=true;
end;

procedure TFrm_Produto.Voltar1Click(Sender: TObject); //Volta para o formulário anterior(Principal)
  Begin
    If (tb_consulta.TabVisible = true) then //Se
      Begin
        PageControl.TabIndex:= 0;
        tb_consulta.TabVisible:= false;
        tb_produto.TabVisible:= true;
      End
    Else
    If (Dm.tb_produto.State in [dsInsert, dsEdit]) then
      Begin
        Showmessage('Salve ou cancele antes de voltar!');
        exit;
      End
    Else
      Frm_Produto.Visible:= false;
      Frm_Principal.Visible:= true;
  End;

Procedure TFrm_Produto.btn_cancelarClick(Sender: TObject); //Cancelar
  Begin
    if (Dm.tb_produto.State in [dsInsert, dsEdit]) then
      Case Application.MessageBox('Deseja realmente cancelar', 'Cancelar', MB_YESNO + MB_ICONQUESTION) of
        IDYES: //Se sim
          Begin
            Frm_Produto.Visible:= false;
            Frm_Principal.Visible:= true;
          End;

        IDNO: //Se não
          Begin
            Exit;
          End;
    End
    Else
      Frm_Produto.Visible:= false;
      Frm_Principal.Visible:= true;
  End;

Procedure TFrm_Produto.btn_deletarClick(Sender: TObject); //Deletar
  Begin
    Case Application.MessageBox('Deseja realmente deletar o produto?', 'Excluir Produto', MB_YESNO + MB_ICONQUESTION) of
      IDYES: //Se sim
        Begin
          Dm.tb_produto.Delete; //Deletar
          Showmessage('Produto excluído com sucesso!');
        End;

      IDNO: //Se não
        Begin
          Exit;
        End;
    End;
  End;

Procedure TFrm_Produto.btn_editarClick(Sender: TObject); //Editar
  Begin
    Dm.tb_produto.Edit; //Edita dados na tabela
  End;

Procedure TFrm_Produto.btn_inserirClick(Sender: TObject); //Inserir
  Begin
    Dm.tb_Produto.Active:= true; //Incia inserção
    Dm.tb_Produto.Insert;

    ConfigBotoes; //Habilita ou desabilita botões

    Dm.tb_produtoProduto_Data.Value:=  date; //Trata data

    txt_nome.SetFocus; //Foca no nome
  End;

Procedure TFrm_Produto.btn_pesquisarClick(Sender: TObject);
  Begin
    If (txt_buscar.Text = '') then //Se o buscar estiver vazio
      Begin
        Showmessage('Digite algo para pesquisar!');
        txt_buscar.SetFocus;
        exit;
      End;

    With Dm.SQL_Con_Produto do //Consultar
      Begin
        Close;
        SQL.Clear;
        SQL.Add('select * from produto');

        Case (rg_opcoes.ItemIndex) of //Index do opções
          0: //Por ID
            Begin
              SQL.Add('where Produto_ID =: codigo');
              ParamByName('codigo').Value:= txt_buscar.Text;
            End;

          1: //Por nome
            Begin
              SQL.Add('where Produto_Nome like nome');
              ParamByName('nome').Value:= '%' + txt_buscar.Text + '%';

            End;

          2: //Por peso
            Begin
              SQL.Add('where Produto_Peso =: peso');
              ParamByName('peso').Value:= txt_buscar.Text;
            End;

          3: //Por preço
            Begin
              SQL.Add('where Produto_Preco =: preco');
              ParamByName('preco').Value:= txt_buscar.Text;
            End;

          4: //Por data
            Begin
              SQL.Add('where Produto_Data =: data');
              ParamByName('data').AsDate:= StrtoDate(formatdatetime('dd/mm/yyyy', Data_Con.Date));
            End;

        End;
        Open
      End;
  End;

Procedure TFrm_Produto.btn_procurarClick(Sender: TObject); //Procurar
  Begin
    PageControl.TabIndex:= 1;
    tb_consulta.TabVisible:= true;
    tb_produto.TabVisible:= false;
  End;

Procedure TFrm_Produto.btn_salvarClick(Sender: TObject); //Salvar
  Begin
    Dm.tb_Produto.Post; //Salva dados na tabela
    ShowMessage('Salvo com sucesso');
  End;

procedure TFrm_Produto.BuscarTudo;  //Buscar tudo
begin

end;

End.
