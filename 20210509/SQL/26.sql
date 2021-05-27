/*
	Задание: 26 (Serge I: 2003-02-14) задание на 2 очка
	Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
*/
select avg(t.price)
from product as pr
	join (
			select p.price, p.model
			from pc as p
			union all
			select l.price, l.model
			from laptop as l
		) as t
	on pr.model = t.model
where pr.maker = 'A'