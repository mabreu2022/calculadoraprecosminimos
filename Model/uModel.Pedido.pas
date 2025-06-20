unit uModel.Pedido;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TPedidoItem = class
  public
    IDProduto: Integer;
    Quantidade: Integer;
    PrecoUnitario: Double;

    function TotalItem: Double;
  end;

  TPedido = class
  private
    FItens: TObjectList<TPedidoItem>;
  public
    ID: Integer;
    DataPedido: TDateTime;
    IDVendedor: Integer;
    IDUsuario: Integer;

    constructor Create;
    destructor Destroy; override;

    procedure AdicionarItem(IDProduto: Integer; Quantidade: Integer; PrecoUnitario: Double);
    procedure LimparItens;
    function CalcularTotal: Double;
    function ObterItens: TObjectList<TPedidoItem>;
  end;

implementation

{ TPedidoItem }

function TPedidoItem.TotalItem: Double;
begin
  Result := Quantidade * PrecoUnitario;
end;

{ TPedido }

constructor TPedido.Create;
begin
  inherited;
  FItens := TObjectList<TPedidoItem>.Create(True); // True = owns objects
end;

destructor TPedido.Destroy;
begin
  FItens.Free;
  inherited;
end;

procedure TPedido.AdicionarItem(IDProduto, Quantidade: Integer; PrecoUnitario: Double);
var
  Item: TPedidoItem;
begin
  Item := TPedidoItem.Create;
  Item.IDProduto := IDProduto;
  Item.Quantidade := Quantidade;
  Item.PrecoUnitario := PrecoUnitario;
  FItens.Add(Item);
end;

procedure TPedido.LimparItens;
begin
  FItens.Clear;
end;

function TPedido.CalcularTotal: Double;
var
  Item: TPedidoItem;
begin
  Result := 0;
  for Item in FItens do
    Result := Result + Item.TotalItem;
end;

function TPedido.ObterItens: TObjectList<TPedidoItem>;
begin
  Result := FItens;
end;

end.
