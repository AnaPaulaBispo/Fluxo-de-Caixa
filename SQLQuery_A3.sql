CREATE TABLE Conta (
    ContaID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    SaldoInicial DECIMAL(18, 2) DEFAULT 0.00,
    DataCriacao DATE NOT NULL DEFAULT GETDATE()
);

CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Tipo CHAR(1) CHECK (Tipo IN ('R', 'D', 'I'))
);

CREATE TABLE CentroCusto (
    CentroCustoID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL
);

CREATE TABLE FormaPagamento (
    FormaPagamentoID INT PRIMARY KEY IDENTITY(1,1),
    Descricao VARCHAR(100) NOT NULL
);

CREATE TABLE MovimentacaoFinanceira (
    MovimentacaoID INT PRIMARY KEY IDENTITY(1,1),
    ContaID INT,
    CategoriaID INT,
    CentroCustoID INT,
    FormaPagamentoID INT,
    Valor DECIMAL(18, 2) NOT NULL,
    DataMovimentacao DATE NOT NULL,
    Descricao VARCHAR(255),
    FOREIGN KEY (ContaID) REFERENCES Conta(ContaID),
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID),
    FOREIGN KEY (CentroCustoID) REFERENCES CentroCusto(CentroCustoID),
    FOREIGN KEY (FormaPagamentoID) REFERENCES FormaPagamento(FormaPagamentoID)
);