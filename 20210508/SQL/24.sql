/*
	Задание: 24 (Serge I: 2003-02-03) задание на два очка
	Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции
*/
select a.model
from (
		select p.model, p.price from pc as p
		union
		select l.model, l.price from laptop as l
		union
		select pr.model, pr.price from printer as pr
	) as a
where price = (
		select max(b.price)
		from (
				select p.model, p.price from pc as p
				union
				select l.model, l.price from laptop as l
				union
				select pr.model, pr.price from printer as pr
			) as b
	)