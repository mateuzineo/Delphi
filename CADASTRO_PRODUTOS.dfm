object CAD0001: TCAD0001
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos'
  ClientHeight = 510
  ClientWidth = 803
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object stat1: TStatusBar
    Left = 0
    Top = 491
    Width = 803
    Height = 19
    Panels = <>
  end
  object pnlBarra: TPanel
    Left = 0
    Top = 0
    Width = 803
    Height = 40
    Align = alTop
    TabOrder = 1
    DesignSize = (
      803
      40)
    object btnAlterar: TButton
      Left = 90
      Top = 9
      Width = 75
      Height = 25
      Hint = 'Alterar Registro Atual'
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnIncluir: TButton
      Left = 9
      Top = 9
      Width = 75
      Height = 25
      Hint = 'Incluir um novo Registro'
      Caption = 'Incluir'
      TabOrder = 1
      OnClick = btnIncluirClick
    end
    object btnExcluir: TButton
      Left = 172
      Top = 9
      Width = 75
      Height = 25
      Hint = 'Exluir Registro Atual'
      Caption = 'Excluir'
      TabOrder = 5
      OnClick = btnExcluirClick
    end
    object DBNavigator1: TDBNavigator
      Left = 631
      Top = 6
      Width = 152
      Height = 25
      DataSource = DSProdutos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Anchors = [akTop, akRight]
      Hints.Strings = (
        'Primeiro Registro'
        'Registro Anterior'
        'Pr'#243'ximo Registro'
        #218'ltimo Registro')
      TabOrder = 0
    end
    object BtnGravar: TButton
      Left = 9
      Top = 9
      Width = 75
      Height = 25
      Hint = 'Alterar Registro Atual'
      Caption = 'Gravar'
      TabOrder = 3
      OnClick = BtnGravarClick
    end
    object BtnCancelar: TButton
      Left = 90
      Top = 9
      Width = 75
      Height = 25
      Hint = 'Alterar Registro Atual'
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = BtnCancelarClick
    end
  end
  object pgcConsulta: TPageControl
    Left = 0
    Top = 40
    Width = 803
    Height = 451
    ActivePage = tbsConsulta
    Align = alClient
    TabOrder = 2
    ExplicitTop = 79
    ExplicitWidth = 793
    ExplicitHeight = 402
    object tbsConsulta: TTabSheet
      AlignWithMargins = True
      Caption = 'Consulta'
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 789
        Height = 417
        Align = alClient
        Caption = 'pnl1'
        TabOrder = 0
        ExplicitWidth = 779
        ExplicitHeight = 368
        object dbgrd: TDBGrid
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 781
          Height = 409
          Align = alClient
          DataSource = DSProdutos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = dbgrdDblClick
        end
      end
    end
    object tbsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object pnl3: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 789
        Height = 417
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 16
        ExplicitWidth = 766
        ExplicitHeight = 368
        object lbl1: TLabel
          Left = 387
          Top = 16
          Width = 95
          Height = 13
          Caption = 'Unidade do Produto'
        end
        object lbldata: TLabel
          Left = 4
          Top = 63
          Width = 81
          Height = 13
          Caption = 'Data de Inclus'#227'o'
        end
        object lbldesc: TLabel
          Left = 136
          Top = 16
          Width = 102
          Height = 13
          Caption = 'Descri'#231#227'o do Produto'
        end
        object lbllocal: TLabel
          Left = 522
          Top = 16
          Width = 110
          Height = 13
          Caption = 'Localiza'#231#227'o do Produto'
        end
        object lblProd: TLabel
          Left = 4
          Top = 16
          Width = 89
          Height = 13
          Caption = 'C'#243'digo do Produto'
        end
        object lblanotacoes: TLabel
          Left = 4
          Top = 119
          Width = 107
          Height = 13
          Caption = 'Anota'#231#245'es do Produto'
        end
        object lblqtd: TLabel
          Left = 137
          Top = 63
          Width = 101
          Height = 13
          Caption = 'Quantidade Atual '
        end
        object dbedtCOD_ITEM: TDBEdit
          Left = 4
          Top = 35
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COD_ITEM'
          DataSource = DSProdutos
          TabOrder = 0
        end
        object dbedtDESCRICAO: TDBEdit
          Left = 137
          Top = 35
          Width = 240
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = DSProdutos
          TabOrder = 1
        end
        object dbedtDT_INCLUSAO: TDBEdit
          Left = 4
          Top = 82
          Width = 121
          Height = 21
          DataField = 'DT_INCLUSAO'
          DataSource = DSProdutos
          TabOrder = 4
        end
        object dbedtLOCALIZACAO: TDBEdit
          Left = 514
          Top = 35
          Width = 242
          Height = 21
          CharCase = ecUpperCase
          DataField = 'LOCALIZACAO'
          DataSource = DSProdutos
          TabOrder = 3
        end
        object dbedtUNIDADE: TDBEdit
          Left = 387
          Top = 35
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          DataField = 'UNIDADE'
          DataSource = DSProdutos
          TabOrder = 2
        end
        object DBANOTACOES: TDBMemo
          Left = 4
          Top = 144
          Width = 375
          Height = 208
          DataField = 'ANOTACOES'
          DataSource = DSProdutos
          TabOrder = 6
        end
        object DBQTD: TDBEdit
          Left = 137
          Top = 82
          Width = 121
          Height = 21
          DataField = 'QTD_ATUAL'
          DataSource = DSProdutos
          TabOrder = 5
          OnKeyPress = DBQTDKeyPress
        end
      end
    end
  end
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123456;Persist Security Info=True;U' +
      'ser ID=sa;Initial Catalog=DBPRODUTOS;Data Source=MATEUZINEO\SQLE' +
      'XPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB'
    Left = 717
    Top = 107
  end
  object QryProdutos: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 717
    Top = 155
    object strngfldQryProdutosCOD_ITEM: TStringField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'COD_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 10
    end
    object strngfldQryProdutosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'DESCRICAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 30
    end
    object strngfldQryProdutosUNIDADE: TStringField
      DisplayLabel = 'Unidade de Controle'
      DisplayWidth = 6
      FieldName = 'UNIDADE'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 15
    end
    object dtmfldQryProdutosDT_INCLUSAO: TDateTimeField
      DisplayLabel = 'Dt. Inclus'#227'o'
      FieldName = 'DT_INCLUSAO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/00;1;_'
    end
    object strngfldQryProdutosLOCALIZACAO: TStringField
      DisplayLabel = 'Localiza'#231#227'o'
      FieldName = 'LOCALIZACAO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 100
    end
    object strngfldQryProdutosANOTACOES: TStringField
      DisplayLabel = 'Anota'#231#245'es'
      FieldName = 'ANOTACOES'
      Size = 1000
    end
    object QryProdutosQTD_ATUAL: TStringField
      FieldName = 'QTD_ATUAL'
      Size = 100
    end
  end
  object PProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProdutos'
    AfterPost = PProdutosAfterPost
    AfterCancel = PProdutosAfterCancel
    AfterDelete = PProdutosAfterDelete
    Left = 717
    Top = 235
    object strngfldPProdutosCOD_ITEM: TStringField
      FieldName = 'COD_ITEM'
      FixedChar = True
      Size = 10
    end
    object strngfldPProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 30
    end
    object strngfldPProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 15
    end
    object strngfldPProdutosLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      FixedChar = True
      Size = 100
    end
    object dtmfldPProdutosDT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
    end
    object PProdutosANOTACOES: TStringField
      FieldName = 'ANOTACOES'
      Size = 50
    end
  end
  object DSProdutos: TDataSource
    DataSet = QryProdutos
    Left = 717
    Top = 283
  end
  object DataSetProdutos: TDataSetProvider
    DataSet = QryProdutos
    Left = 717
    Top = 195
  end
end
