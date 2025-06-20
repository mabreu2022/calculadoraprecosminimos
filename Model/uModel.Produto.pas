unit uModel.Produto;

interface

type
  TProduto = class
  private
    FSKU: string;
    FCusto: Double;
    FPrecoVenda: Double;
    FMargemMinima: Double;
  public
    function PrecoMinimo: Double;
    function DescontoMaximo: Double;

    property SKU: string read FSKU write FSKU;
    property Custo: Double read FCusto write FCusto;
    property PrecoVenda: Double read FPrecoVenda write FPrecoVenda;
    property MargemMinima: Double read FMargemMinima write FMargemMinima;
  end;

implementation

function TProduto.PrecoMinimo: Double;
begin
  Result := FCusto * (1 + FMargemMinima / 100);
end;

function TProduto.DescontoMaximo: Double;
begin
  Result := ((FPrecoVenda - PrecoMinimo) / FPrecoVenda) * 100;
end;

end.
