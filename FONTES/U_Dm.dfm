object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 213
  Width = 161
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
    end
    object tb_produtoProduto_Nome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_Nome'
      Origin = 'Produto_Nome'
      Size = 100
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
      Size = 3
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
      Size = 5
    end
  end
  object DataSource: TDataSource
    DataSet = tb_produto
    Left = 112
    Top = 64
  end
  object Driver: TFDPhysMySQLDriverLink
    VendorLib = 'C:\3-52\Marcos e Lucas Ronchi\Sistema_Hardware\LIB\libmySQL.dll'
    Left = 8
    Top = 112
  end
  object SQL_Con_Produto: TFDQuery
    Connection = FDConnection
    Left = 88
    Top = 112
  end
  object Ds_Con_Produto: TDataSource
    Left = 32
    Top = 160
  end
end
