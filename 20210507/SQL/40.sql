/*
	Задание: 40 (Serge I: 2012-04-20) на 2 очка
	Найти производителей, которые выпускают более одной модели, при этом все выпускаемые производителем модели являются продуктами одного типа.
	Вывести: maker, type
*/
select p.maker, p.type
from product as p
Where p.maker in (
		select p.maker 
		from product as p
		group by p.maker having count(distinct type) = 1
	)
group by p.maker, p.type
having count(type) > 1