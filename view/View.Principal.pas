unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Dao.Dm, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus, uView.CadastroDePedidos;

type
  TFrmPedidoDesconto = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    EdtSKU: TEdit;
    DBGPEdidos: TDBGrid;
    DBGridItensPEdido: TDBGrid;
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Produtos1: TMenuItem;
    Pedidos1: TMenuItem;
    Usurios1: TMenuItem;
    Sair1: TMenuItem;
    Logofde1: TMenuItem;
    procedure Pedidos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedidoDesconto: TFrmPedidoDesconto;

implementation

{$R *.dfm}

procedure TFrmPedidoDesconto.Pedidos1Click(Sender: TObject);
begin
  Application.CreateForm(TFrmPedidoCadastro, FrmPedidoCadastro);
  try
    FrmPedidoCadastro.ShowModal;
  finally
    FrmPedidoCadastro.Free;
  end;

end;

end.
