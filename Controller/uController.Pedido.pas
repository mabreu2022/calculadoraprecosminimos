unit uController.Pedido;

interface

uses
  uModel.Pedido, FireDAC.Comp.Client;

type
  TPedidoController = class
  public
    class function SalvarPedido(const Pedido: TPedido; FDConnection: TFDConnection): Boolean;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

class function TPedidoController.SalvarPedido(const Pedido: TPedido; FDConnection: TFDConnection): Boolean;
var
  FDQuery: TFDQuery;
  IDPedidoGerado: Integer;
  Item: TPedidoItem;
begin
  Result := False;
  FDQuery := TFDQuery.Create(nil);
  try
    FDQuery.Connection := FDConnection;
    FDConnection.StartTransaction;

    // Inserir pedido
    FDQuery.SQL.Text :=
      'INSERT INTO PEDIDOS (DataPedido, IDVendedor, IDUsuario) ' +
      'VALUES (:Data, :Vendedor, :Usuario) RETURNING IDPedido';
    FDQuery.ParamByName('Data').AsDate := Pedido.DataPedido;
    FDQuery.ParamByName('Vendedor').AsInteger := Pedido.IDVendedor;
    FDQuery.ParamByName('Usuario').AsInteger := Pedido.IDUsuario;
    FDQuery.Open;
    IDPedidoGerado := FDQuery.FieldByName('IDPedido').AsInteger;
    FDQuery.Close;

    // Inserir itens
    for Item in Pedido.ObterItens do
    begin
      FDQuery.SQL.Text :=
        'INSERT INTO PEDIDOITENS (IDPedido, IDProduto, Quantidade, PrecoUnitario) ' +
        'VALUES (:Pedido, :Produto, :Qtd, :Preco)';
      FDQuery.ParamByName('Pedido').AsInteger := IDPedidoGerado;
      FDQuery.ParamByName('Produto').AsInteger := Item.IDProduto;
      FDQuery.ParamByName('Qtd').AsInteger := Item.Quantidade;
      FDQuery.ParamByName('Preco').AsFloat := Item.PrecoUnitario;
      FDQuery.ExecSQL;
    end;

    FDConnection.Commit;
    Result := True;
  except
    on E: Exception do
    begin
      FDConnection.Rollback;
      ShowMessage('Erro ao salvar pedido: ' + E.Message);
    end;
  end;
  FDQuery.Free;
end;

end.
