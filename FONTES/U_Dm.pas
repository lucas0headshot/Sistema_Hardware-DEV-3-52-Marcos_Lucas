unit U_Dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TDm = class(TDataModule)
    FDConnection: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    tb_produto: TFDTable;
    DataSource: TDataSource;
    Driver: TFDPhysMySQLDriverLink;
    SQL_Con_Produto: TFDQuery;
    Ds_Con_Produto: TDataSource;
    tb_produtoProduto_ID: TFDAutoIncField;
    tb_produtoProduto_Preco: TStringField;
    tb_produtoProduto_Descricao: TStringField;
    tb_produtoProduto_Especificacoes: TStringField;
    tb_produtoProduto_Quantidade: TStringField;
    tb_produtoProduto_Codigo: TStringField;
    tb_produtoProduto_Caracteristicas: TStringField;
    tb_produtoProduto_Disponibilidade: TStringField;
    tb_produtoProduto_Peso: TStringField;
    tb_produtoProduto_Data: TDateField;
    SQL_Imprimir_Produto: TFDQuery;
    FDAutoIncField1: TFDAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    DateField1: TDateField;
    tb_produtoProduto_Nome: TStringField;
    SQL_Con_ProdutoProduto_ID: TFDAutoIncField;
    SQL_Con_ProdutoProduto_Nome: TStringField;
    SQL_Con_ProdutoProduto_Preco: TStringField;
    SQL_Con_ProdutoProduto_Descricao: TStringField;
    SQL_Con_ProdutoProduto_Especificacoes: TStringField;
    SQL_Con_ProdutoProduto_Quantidade: TStringField;
    SQL_Con_ProdutoProduto_Codigo: TStringField;
    SQL_Con_ProdutoProduto_Caracteristicas: TStringField;
    SQL_Con_ProdutoProduto_Disponibilidade: TStringField;
    SQL_Con_ProdutoProduto_Peso: TStringField;
    SQL_Con_ProdutoProduto_Data: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Procedure TDm.DataModuleCreate(Sender: TObject);
  Begin
    FDconnection.Params.Database:= 'Sistema_Hardware'; //Parâmetros
    FDconnection.Params.UserName:= 'root';
    FDconnection.Params.Password:= '';

    FDconnection.Connected:= true; //Conexão
    Driver.VendorLib:= GetCurrentDir + '\LIB\libmysql.dll';

    tb_produto.TableName := 'Produto'; //Especifica a tabela do Banco de Dados
    tb_produto.Active := true;
  End;

end.
