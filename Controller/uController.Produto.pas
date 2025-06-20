unit UController.Produto;

interface

uses
  uModel.Produto, FireDAC.Comp.Client, System.SysUtils;

type
  TProdutoController = class
  public
    function CarregarProduto(const SKU: string; Query: TFDQuery): TProduto;
  end;

implementation

function TProdutoController.CarregarProduto(const SKU: string; Query: TFDQuery): TProduto;
begin
  Result := TProduto.Create;
  Query.SQL.Text := 'SELECT * FROM Produtos WHERE SKU = :SKU';
  Query.ParamByName('SKU').AsString := SKU;
  Query.Open;

  if not Query.IsEmpty then
  begin
    Result.SKU := SKU;
    Result.Custo := Query.FieldByName('Custo').AsFloat;
    Result.PrecoVenda := Query.FieldByName('PrecoVenda').AsFloat;
    Result.MargemMinima := Query.FieldByName('MargemMinima').AsFloat;
  end
  else
    raise Exception.Create('Produto não encontrado!');
end;

end.
