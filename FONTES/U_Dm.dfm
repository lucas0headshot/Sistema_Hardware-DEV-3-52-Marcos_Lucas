object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 233
  Width = 184
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=Sistema_Hardware'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    Left = 24
    Top = 8
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 32
    Top = 64
  end
  object tb_produto: TFDTable
    IndexFieldNames = 'Produto_ID'
    Connection = FDConnection
    UpdateOptions.UpdateTableName = 'Sistema_Hardware.produto'
    TableName = 'Sistema_Hardware.produto'
    Left = 96
    Top = 8
    object tb_produtoProduto_ID: TFDAutoIncField
      FieldName = 'Produto_ID'
      Origin = 'Produto_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tb_produtoProduto_Preco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Preco'
      Origin = 'Produto_Preco'
      Size = 10
    end
    object tb_produtoProduto_Descricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Descricao'
      Origin = 'Produto_Descricao'
      Size = 500
    end
    object tb_produtoProduto_Especificacoes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Especificacoes'
      Origin = 'Produto_Especificacoes'
      Size = 500
    end
    object tb_produtoProduto_Quantidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Quantidade'
      Origin = 'Produto_Quantidade'
      Size = 5
    end
    object tb_produtoProduto_Codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Codigo'
      Origin = 'Produto_Codigo'
      Size = 10
    end
    object tb_produtoProduto_Caracteristicas: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Caracteristicas'
      Origin = 'Produto_Caracteristicas'
      Size = 250
    end
    object tb_produtoProduto_Disponibilidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Disponibilidade'
      Origin = 'Produto_Disponibilidade'
      Size = 1
    end
    object tb_produtoProduto_Peso: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Peso'
      Origin = 'Produto_Peso'
      Size = 10
    end
    object tb_produtoProduto_Data: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Data'
      Origin = 'Produto_Data'
      EditMask = '!99/99/0000;1;_'
    end
    object tb_produtoProduto_Nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Nome'
      Origin = 'Produto_Nome'
      Size = 100
    end
  end
  object DataSource: TDataSource
    DataSet = tb_produto
    Left = 112
    Top = 64
  end
  object Driver: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\3-52\Marcos e Lucas Ronchi\Sistema_Hardware\Sistema_Hardware-' +
      'DEV-3-52-Marcos_Lucas\LIB\libmySQL.dll'
    Left = 8
    Top = 112
  end
  object SQL_Con_Produto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from produto')
    Left = 88
    Top = 112
    object SQL_Con_ProdutoProduto_ID: TFDAutoIncField
      FieldName = 'Produto_ID'
      Origin = 'Produto_ID'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object SQL_Con_ProdutoProduto_Nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Nome'
      Origin = 'Produto_Nome'
      Size = 100
    end
    object SQL_Con_ProdutoProduto_Preco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Preco'
      Origin = 'Produto_Preco'
      Size = 10
    end
    object SQL_Con_ProdutoProduto_Descricao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Descricao'
      Origin = 'Produto_Descricao'
      Size = 500
    end
    object SQL_Con_ProdutoProduto_Especificacoes: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Especificacoes'
      Origin = 'Produto_Especificacoes'
      Size = 500
    end
    object SQL_Con_ProdutoProduto_Quantidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Quantidade'
      Origin = 'Produto_Quantidade'
      Size = 5
    end
    object SQL_Con_ProdutoProduto_Codigo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Codigo'
      Origin = 'Produto_Codigo'
      Size = 10
    end
    object SQL_Con_ProdutoProduto_Caracteristicas: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Caracteristicas'
      Origin = 'Produto_Caracteristicas'
      Size = 250
    end
    object SQL_Con_ProdutoProduto_Disponibilidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Disponibilidade'
      Origin = 'Produto_Disponibilidade'
      Size = 12
    end
    object SQL_Con_ProdutoProduto_Peso: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Peso'
      Origin = 'Produto_Peso'
      Size = 10
    end
    object SQL_Con_ProdutoProduto_Data: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Data'
      Origin = 'Produto_Data'
    end
  end
  object Ds_Con_Produto: TDataSource
    DataSet = SQL_Con_Produto
    Left = 32
    Top = 160
  end
  object SQL_Imprimir_Produto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select * from produto')
    Left = 112
    Top = 184
    object FDAutoIncField1: TFDAutoIncField
      FieldName = 'Produto_ID'
      Origin = 'Produto_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Nome'
      Origin = 'Produto_Nome'
      Size = 100
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Preco'
      Origin = 'Produto_Preco'
      Size = 10
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Descricao'
      Origin = 'Produto_Descricao'
      Size = 500
    end
    object StringField4: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Especificacoes'
      Origin = 'Produto_Especificacoes'
      Size = 500
    end
    object StringField5: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Quantidade'
      Origin = 'Produto_Quantidade'
      Size = 5
    end
    object StringField6: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Codigo'
      Origin = 'Produto_Codigo'
      Size = 10
    end
    object StringField7: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Caracteristicas'
      Origin = 'Produto_Caracteristicas'
      Size = 250
    end
    object StringField8: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Disponibilidade'
      Origin = 'Produto_Disponibilidade'
      Size = 12
    end
    object StringField9: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Peso'
      Origin = 'Produto_Peso'
      Size = 10
    end
    object DateField1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Data'
      Origin = 'Produto_Data'
    end
  end
end
