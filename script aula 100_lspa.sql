create database ibge_lspa;
use ibge_lspa;

create table produtos (
	cod_produto int,
	nome_produto varchar(45),
	primary key (cod_produto)
);

create table safra (
	cod_safra int,
	cod_produto int,
	volume int,
	ano int,
	mes int,
	primary key (cod_safra),
	foreign key(cod_produto) references produtos(cod_produto)
 );

-- Dados dos produtos
INSERT INTO `produtos` VALUES (1,'Cereais, leguminosas e oleaginosas'),(2,'Algodão herbáceo'),(3,'Amendoim'),(4,'Arroz'),(5,'Aveia'),(6,'Centeio'),(7,'Cevada'),(8,'Feijão'),(9,'Girassol'),(10,'Mamona'),(11,'Milho'),(12,'Soja'),(13,'Sorgo'),(14,'Trigo'),(15,'Triticale'),(16,'Banana'),(17,'Batata - inglesa'),(18,'Cacau'),(19,'Café arábico'),(20,'Café canephora'),(21,'Cana-de-açúcar'),(22,'Castanha-de-caju'),(23,'Fumo'),(24,'Laranja'),(25,'Mandioca'),(26,'Tomate'),(27,'Uva');

-- Dados da safra
INSERT INTO `safra` VALUES (1000,1,263154606,2022,6),(1001,2,6740437,2022,6),(1002,3,835020,2022,6),(1003,4,10658247,2022,6),(1004,5,1202885,2022,6),(1005,6,8006,2022,6),(1006,7,503586,2022,6),(1007,8,1085962,2022,6),(1008,9,60181,2022,6),(1009,10,38920,2022,6),(1010,11,25426766,2022,6),(1011,12,119523533,2022,6),(1012,13,2850368,2022,6),(1013,14,10042331,2022,6),(1014,15,63199,2022,6),(1015,16,7065752,2022,6),(1016,17,1695919,2022,6),(1017,18,290118,2022,6),(1018,19,2035314,2022,6),(1019,20,1104313,2022,6),(1020,21,625679400,2022,6),(1021,22,147174,2022,6),(1022,23,665412,2022,6),(1023,24,16722488,2022,6),(1024,25,18200277,2022,6),(1025,26,3856430,2022,6),(1026,27,1502371,2022,6),(1027,1,307305876,2023,6),(1028,2,6930751,2023,6),(1029,3,800037,2023,6),(1030,4,10020843,2023,6),(1031,5,1195562,2023,6),(1032,6,8942,2023,6),(1033,7,511255,2023,6),(1034,8,1111089,2023,6),(1035,9,61275,2023,6),(1036,10,33353,2023,6),(1037,11,28117912,2023,6),(1038,12,148376257,2023,6),(1039,13,3818734,2023,6),(1040,14,10624720,2023,6),(1041,15,70480,2023,6),(1042,16,7033297,2023,6),(1043,17,1844690,2023,6),(1044,18,290375,2023,6),(1045,19,2306441,2023,6),(1046,20,999391,2023,6),(1047,21,666166727,2023,6),(1048,22,122051,2023,6),(1049,23,682603,2023,6),(1050,24,16761356,2023,6),(1051,25,18452547,2023,6),(1052,26,3789222,2023,6),(1053,27,1664777,2023,6);

-- Listar todos os produtos e suas safras correspondentes
select*from produtos p inner join safra s on s.cod_produto = p.cod_produto;

-- Listar o nome do produto, volume e ano da safra para um produto específico (por exemplo, código do produto 1)
select p.nome_produto, s.volume, s.ano from safra s
inner join produtos p on s.cod_produto = p.cod_produto
where p.cod_produto = 9;

-- Calcular o volume total de safras para cada produto
select p.nome_produto, sum(s.volume) as total_volume from produtos p
inner join safra s on s.cod_produto = p.cod_produto
group by s.cod_produto;

select p.nome_produto from produtos p
inner join safra s on p.cod_produto = s.cod_produto
where s.ano = 2023;

select p.nome_produto, avg(s.volume) as volume_medio
from produtos p
inner join safra s on p.cod_produto = s.cod_produto
group by p.nome_produto
having volume_medio > 100000000;

