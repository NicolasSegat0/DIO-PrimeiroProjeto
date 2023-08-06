DROP DATABASE Oficina;
CREATE DATABASE Oficina; 
USE Oficina; 


CREATE TABLE Cliente(
	idCliente   int   auto_increment   primary key,
    Pnome       varchar(20)   not null, 
    Lnome       varchar(30)   not null, 
    CPF         char(11)      not null
);


CREATE TABLE Veiculo(
	idVeiculo   int    auto_increment    primary key,
    idCliente   int,
    Marca       varchar(15)   not null, 
    Modelo      varchar(20)   not null,
    Ano         datetime      not null,
	Placa       varchar(7)    not null   unique, 
    foreign key (idCliente) references Cliente(idCliente)
);


CREATE TABLE Servico(
	idServico   int    auto_increment   primary key,
    idVeiculo   int, 
    Ddata       date   not null, 
    Descricao   varchar(35), 
    Custo       double   not null, 
    foreign key (idVeiculo) references Veiculo(idVeiculo)
); 


CREATE TABLE Peca(
	idPecas    int   auto_increment   primary key, 
    Nome       varchar(15)   not null, 
    Descricao  varchar(20), 
	Preco      double        not null
); 



CREATE TABLE OrdemServico(
	idServico  int, 
    idPecas    int,
	foreign key (idServico) references Servico(idServico), 
    foreign key (idPecas) references Peca(idPecas), 
    Quantidade   int   not null
); 




INSERT INTO Cliente (Pnome, Lnome, CPF)	
	values("João", "Silva", 12345678912), 
		  ("Pedro", "Rodrigues", 23456789019), 
          ("Anna", "Medeiros", 09876543213), 
          ("Julio", "Augusto", 09128734560); 
          
          
 INSERT INTO Veiculo (idCliente, Marca, Modelo, Ano, Placa)
	values(1, "FIAT", "UNO", "Quadrado", 2014, "1234567"),
		  (2, "VW", "Fox", "Flex", 2012, "2345678"), 
          (3, "Renault", "Sandero", "Stepway", 2013, "3456789"),
          (4, "Peugeot", "208", "T200", 2024, "4567890");
          
          
INSERT INTO Servico (idVeiculo, Ddata, Descricacao, Custo)
	values(1, "06-08-2023", "Pastilha de freio", 100), 
		  (2, "02-08-2023", "Troca de óleo", 65.9), 
          (3, "17-07-2023", "Balanceamento", 50), 
          (4, "01-07-2023", "Pastilha de para-brisa", 40); 
          
          
INSERT INTO Peca(Nome, Descricao, Preco)
	values("Pastilha de freio", null, 50), 
		  ("Óleo X", null, 30), 
          ("Equipamento de balanceamento", null, 50), 
          ("Pastilha SN", null, 15); 
          
          
INSERT INTO OrdemServico(Quantidade)
	values(1, 1, 2), 
		  (2, 2, 1), 
          (3, 3, 1), 
          (4, 4, 2);