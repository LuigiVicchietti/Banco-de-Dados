CREATE DATABASE bdEstoque
USE bdEstoque

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	, nomeCliente VARCHAR(50) NOT NULL
	, cpfCliente VARCHAR(14) NOT NULL
	, emailCliente VARCHAR(70) NOT NULL
	, sexoCliente VARCHAR(1) NOT NULL
	, dataNascimentoCliente SMALLDATETIME NOT NULL
)
CREATE TABLE tbFabricante(
	codFabricante INT PRIMARY KEY IDENTITY(1,1)
	, nomeFabricante VARCHAR(50) NOT NULL
)
CREATE TABLE tbFornecedor(
	codFornecedor INT PRIMARY KEY IDENTITY(1,1)
	, nomeFornecedor VARCHAR(50) NOT NULL
	, contatoFornecedor VARCHAR(50)	NOT NULL
)
CREATE TABLE tbVenda(
	codVenda INT PRIMARY KEY IDENTITY(1,1)
	, dataVenda SMALLDATETIME NOT NULL
	, valorTotalVenda SMALLMONEY NOT NULL
	, codClinte INT FOREIGN KEY REFERENCES tbCliente(codCliente)
)
CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY(1,1)
	, descricaoProduto VARCHAR(50) NOT NULL
	, valorProduto SMALLMONEY NOT NULL
	, quantidadeProduto VARCHAR(10) NOT NULL
	, codFabricante INT FOREIGN KEY REFERENCES tbFabricante(codFabricante)
	, codFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(codFornecedor)
)
CREATE TABLE tbItensVenda(
	codItensVenda INT PRIMARY KEY IDENTITY(1,1)
	, codVenda INT FOREIGN KEY REFERENCES tbVenda(codVenda)
	, codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	, quantidadeItensVenda VARCHAR(10) NOT NULL
	, subTotalItensVenda SMALLMONEY NOT NULL
)