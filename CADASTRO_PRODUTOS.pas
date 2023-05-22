unit CADASTRO_PRODUTOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.FMTBcd, Data.SqlExpr, Vcl.StdCtrls,
  Vcl.DBCtrls, Datasnap.Provider, Datasnap.DBClient, Data.Win.ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Mask;

type
  TCAD0001 = class(TForm)
    stat1: TStatusBar;
    pnlBarra: TPanel;
    btnAlterar: TButton;
    btnIncluir: TButton;
    btnExcluir: TButton;
    DBNavigator1: TDBNavigator;
    pgcConsulta: TPageControl;
    tbsConsulta: TTabSheet;
    BtnGravar: TButton;
    BtnCancelar: TButton;
    Conexao: TADOConnection;
    QryProdutos: TADOQuery;
    PProdutos: TClientDataSet;
    DSProdutos: TDataSource;
    DataSetProdutos: TDataSetProvider;
    strngfldQryProdutosCOD_ITEM: TStringField;
    strngfldQryProdutosDESCRICAO: TStringField;
    strngfldQryProdutosUNIDADE: TStringField;
    strngfldQryProdutosLOCALIZACAO: TStringField;
    dtmfldQryProdutosDT_INCLUSAO: TDateTimeField;
    strngfldPProdutosCOD_ITEM: TStringField;
    strngfldPProdutosDESCRICAO: TStringField;
    strngfldPProdutosUNIDADE: TStringField;
    strngfldPProdutosLOCALIZACAO: TStringField;
    dtmfldPProdutosDT_INCLUSAO: TDateTimeField;
    tbsCadastro: TTabSheet;
    pnl1: TPanel;
    pnl3: TPanel;
    lbl1: TLabel;
    lbldata: TLabel;
    lbldesc: TLabel;
    lbllocal: TLabel;
    lblProd: TLabel;
    dbedtCOD_ITEM: TDBEdit;
    dbedtDESCRICAO: TDBEdit;
    dbedtDT_INCLUSAO: TDBEdit;
    dbedtLOCALIZACAO: TDBEdit;
    dbedtUNIDADE: TDBEdit;
    dbgrd: TDBGrid;
    strngfldQryProdutosANOTACOES: TStringField;
    DBANOTACOES: TDBMemo;
    PProdutosANOTACOES: TStringField;
    lblanotacoes: TLabel;
    DBQTD: TDBEdit;
    QryProdutosQTD_ATUAL: TStringField;
    lblqtd: TLabel;
    procedure PProdutosAfterPost(DataSet: TDataSet);
    procedure PProdutosAfterDelete(DataSet: TDataSet);
    procedure PProdutosAfterCancel(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrdDblClick(Sender: TObject);
    procedure DBQTDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Procedure inativacampos;
    Procedure ativacampos;
    Procedure inativabotoes;
    Procedure ativabotoes;


  public
    { Public declarations }
  end;

var
  CAD0001: TCAD0001;

implementation

{$R *.dfm}

procedure TCAD0001.ativabotoes;
begin
  btnIncluir.Visible  := True;
  btnAlterar.Visible  := True;
  BtnGravar.Visible   := False;
  BtnCancelar.Visible := False;
  btnExcluir.Visible  := True;
end;

procedure TCAD0001.ativacampos;
begin
  dbedtCOD_ITEM.Enabled     := True;
  dbedtDESCRICAO.Enabled    := True;
  dbedtDT_INCLUSAO.Enabled  := True;
  dbedtLOCALIZACAO.Enabled  := True;
  dbedtUNIDADE.Enabled      := True;
  DBANOTACOES.Enabled       := True;
  DBQTD.Enabled             := True;
end;

procedure TCAD0001.btnAlterarClick(Sender: TObject);
begin
  if MessageDlg('Deseja Alterar o Produto?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
     begin
     QryProdutos.Edit;
     ativacampos;
     pgcConsulta.ActivePage := tbsCadastro;
     inativabotoes;
     end
     else
     exit;
end;

procedure TCAD0001.BtnCancelarClick(Sender: TObject);
begin
   if MessageDlg('Deseja Cancelar?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
   begin
     QryProdutos.Cancel;
     pgcConsulta.ActivePage := tbsConsulta;
     inativacampos;
     ativabotoes;
   end
   else
   exit;
end;

procedure TCAD0001.btnExcluirClick(Sender: TObject);
begin
   if MessageDlg('Deseja Excluir o registro selecionado?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
   begin
     QryProdutos.Delete;
     pgcConsulta.ActivePage := tbsConsulta;
   end
   else
   exit;
end;

procedure TCAD0001.BtnGravarClick(Sender: TObject);
begin
  if dbedtCOD_ITEM.Text = '' then
  begin
    messageDLG('É necessário que o Código do Produto seja preenchido!',mtCustom,[mbOK],0);
    dbedtCOD_ITEM.SetFocus;
    exit
  end;

  PProdutos.Insert;
  PProdutos.Post;
  QryProdutos.Post;
  PProdutos.Close;
  PProdutos.Open;
  messageDLG('Registro Salvo com Sucesso!',mtCustom,[mbOK],0);
  pgcConsulta.ActivePage := tbsConsulta;
  inativacampos;
  ativabotoes;
end;

procedure TCAD0001.btnIncluirClick(Sender: TObject);
begin
  //AO INCLUIR REDIRECIONA PARA A ABA DE CADASTROS
  pgcConsulta.ActivePage := tbsCadastro;
  QryProdutos.Insert;
  //ALIMENTA O CAMPO DE DATA COM A DATA ATUAL
  dbedtDT_INCLUSAO.Text := DateToStr(Date());
  ativacampos;
  dbedtCOD_ITEM.SetFocus;
  inativabotoes;
end;

procedure TCAD0001.dbgrdDblClick(Sender: TObject);
begin
  // DUPLO CLIQUE NO REGISTRO DO GRID REDIRECIONA PARA A ABA DE CADASTROS
  pgcConsulta.ActivePage := tbsCadastro;
end;

procedure TCAD0001.DBQTDKeyPress(Sender: TObject; var Key: Char);
begin
  // NÃO DEIXA O USUÁRIO COLOCAR LETRAS
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
  key := #0;
end;

procedure TCAD0001.FormCreate(Sender: TObject);
begin
  Conexao.Connected := True;
  QryProdutos.Open ();
  inativacampos;
  ativabotoes;
end;

procedure TCAD0001.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key = VK_F2) and (btnGravar.Enabled) then
     btnGravarClick(btnGravar);
end;

procedure TCAD0001.FormShow(Sender: TObject);
begin
  QryProdutos.Open;
  PProdutos.Open;
  pgcConsulta.ActivePage := tbsConsulta;
end;

procedure TCAD0001.inativabotoes;
begin
  btnIncluir.Visible  := False;
  btnAlterar.Visible  := False;
  BtnGravar.Visible   := True;
  BtnCancelar.Visible := True;
  btnExcluir.Visible  := False;

end;

procedure TCAD0001.inativacampos;
begin
  dbedtCOD_ITEM.Enabled     := False;
  dbedtDESCRICAO.Enabled    := False;
  dbedtDT_INCLUSAO.Enabled  := False;
  dbedtLOCALIZACAO.Enabled  := False;
  dbedtUNIDADE.Enabled      := False;
  DBANOTACOES.Enabled       := False;
  DBQTD.Enabled             := False;
end;

procedure TCAD0001.PProdutosAfterCancel(DataSet: TDataSet);
begin
  PProdutos.CancelUpdates;
end;

procedure TCAD0001.PProdutosAfterDelete(DataSet: TDataSet);
begin
   PProdutos.ApplyUpdates(-1);
end;

procedure TCAD0001.PProdutosAfterPost(DataSet: TDataSet);
begin
   PProdutos.ApplyUpdates(-1);
end;

end.
