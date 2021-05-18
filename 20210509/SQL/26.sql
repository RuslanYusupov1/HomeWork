/*Задание: 26 (Serge I: 2003-02-14) задание на 2 очка
Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.*/
select avg(a.price) 
from (
	select pc.price 
	from Product as pr, PC
	where pr.maker = 'A' 
		and Pr.model = PC.model
union all
	select l.price 
	from Product, Laptop as l
	where maker = 'A' 
		and Product.model = l.model
	) as a