/*Задание: 18 (Serge I: 2003-02-03) задание на два очка
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price*/
select distinct maker, price 
from printer as pr
	join product as pt on pr.model = pt.model
where pr.price = all (select min(prin.price) from printer as prin where prin.color = 'y')
	and color = 'y'