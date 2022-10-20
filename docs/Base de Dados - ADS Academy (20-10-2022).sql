

CREATE TABLE Usuario
(Codusuario number(10) not null,
Email varchar2(20) not null,
Senha varchar2(15) not null,
Telefone number(9)
);

CREATE TABLE franquia(
IdFranquia varchar(10) not null,
CNPJ number(14) not null,
RazaoSocial varchar(50) not null,
Endereco varchar2(150) not null,
Codusuario number(10)
);

CREATE TABLE loja(
IdLoja varchar(10) not null,
CNPJ number(14) not null,
RazaoSocial varchar(50) not null,
Endereco varchar2(150) not null,
Codusuario number(10),
IdFranquia varchar(10)
);

CREATE TABLE supervisor(
IdSupervisor varchar(10) not null,
CPF number(11) not null,
Nome varchar(70) not null,
Codusuario number(10)
);

CREATE TABLE Revendedor(
IdRevendedor varchar(10) not null,
CPF number(11) not null,
Nome varchar(70) not null,
Endereco varchar2(150) not null,
DataNascimento date,
Codusuario number(10)
);

CREATE TABLE Metas(
Nivel number(2),
Valor number(5,2),
Recompensa varchar2(50)
);

CREATE TABLE Pedido(
Codpedido number(8) not null,
Status varchar2(20) not null,
DataPedido date not null,
ValPedido number(5,2) not null,
NF number(9)
);

CREATE TABLE ItemPedido(
QtdeProd number(4),
Codpedido number(8),
Codproduto number(8) 
);

CREATE TABLE Produto(
Codproduto number(8) not null,
NomeProduto varchar2(30) not null,
Descricao varchar2(50),
QtdeEstoque number(4) not null,
ValorUnitario number(4,2) not null
);

CREATE TABLE ItensNF(
QtdeProd number(4),
PrecoUnit number(4,2),
QtdeFaturada number(4),
NF number(9),
Codproduto number(8)
);

CREATE TABLE NotaFiscal(
NF number(9) not null,
NomeFantasia varchar2(100) not null,
CNPJ number(14) not null,
Razaosocial varchar(50) not null,
InscricaoEstadual number(9) not null,
DataEmissao date not null,
ValorTotal number(5,2) not null,
Codpedido number(8)
);

--DEFININDO AS RESTRIÇÕES de PK

ALTER TABLE Usuario
 ADD CONSTRAINT PK_Usuario_codusuario PRIMARY KEY(Codusuario);
 
ALTER TABLE Franquia
 ADD CONSTRAINT PK_Franquia_IdFranquia PRIMARY KEY(IdFranquia);
 
ALTER TABLE Loja
 ADD CONSTRAINT PK_Loja_IdLoja PRIMARY KEY(IdLoja);
 
ALTER TABLE Supervisor
 ADD CONSTRAINT PK_Supervisor_IdSupervisor PRIMARY KEY(IdSupervisor);
 
ALTER TABLE Revendedor
 ADD CONSTRAINT PK_Revendedor_IdRevendedor PRIMARY KEY(IdRevendedor);

ALTER TABLE Metas
 ADD CONSTRAINT PK_Metas_Nivel PRIMARY KEY(Nivel);
 
ALTER TABLE Pedido
 ADD CONSTRAINT PK_Pedido_Codpedido PRIMARY KEY(Codpedido);
 
ALTER TABLE NotaFiscal
 ADD CONSTRAINT PK_NotaFiscal_NF PRIMARY KEY(NF);
 
--DEFININDO AS RESTRIÇÕES de FK

ALTER TABLE Franquia
 ADD CONSTRAINT FK_Franquia_codusario FOREIGN KEY(Codusuario) REFERENCES Usuario;
 
ALTER TABLE Loja
 ADD CONSTRAINT FK_Loja_codusario FOREIGN KEY(Codusuario) REFERENCES Usuario;
 
ALTER TABLE Loja
 ADD CONSTRAINT FK_Loja_IdFranquia FOREIGN KEY(IdFranquia) REFERENCES Franquia;
 
ALTER TABLE Supervisor
 ADD CONSTRAINT FK_Supervisor_codusario FOREIGN KEY(Codusuario) REFERENCES Usuario;
 
ALTER TABLE Revendedor
 ADD CONSTRAINT FK_Revendedor_codusario FOREIGN KEY(Codusuario) REFERENCES Usuario;
 
ALTER TABLE Pedido
 ADD CONSTRAINT FK_Pedido_NF FOREIGN KEY(NF) REFERENCES NotaFiscal;
 
ALTER TABLE ItemPedido
 ADD CONSTRAINT FK_ItemPedido_CodPedido FOREIGN KEY(Codpedido) REFERENCES Pedido;
 
ALTER TABLE ItemPedido
 ADD CONSTRAINT FK_ItemPedido_Codproduto FOREIGN KEY(Codproduto) REFERENCES Produto;
 
ALTER TABLE ItensNF
 ADD CONSTRAINT FK_ItensNF_NF FOREIGN KEY(NF) REFERENCES NotaFiscal;

ALTER TABLE ItensNF
 ADD CONSTRAINT FK_ItensNF_Codproduto FOREIGN KEY(Codproduto) REFERENCES Produto;
 
ALTER TABLE NotaFiscal
 ADD CONSTRAINT FK_NotaFiscal_Codproduto FOREIGN KEY(Codpedido) REFERENCES Pedido;
 
 
