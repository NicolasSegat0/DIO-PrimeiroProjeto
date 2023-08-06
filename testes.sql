select count(*) from Cliente; 
select * from Cliente P, Veiculo V where P.idCliente = idServico; 

select Pnome, Lnome, idServico from Cliente P, Veiculo V where P.idClient = idOrdemServico;
select concat(Pnome,'',Lnome) as Cliente, idVeiculo;

select * from Cliente P inner join Veiculo V on P.idCliente = V.idVeiculo;
