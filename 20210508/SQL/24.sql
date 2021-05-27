/*
	Задание: 24 (Serge I: 2003-02-03) задание на два очка
	Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции
*/
with t as (
	select pc.price, pc.model
	from PC as pc
		join Product as pr on pr.model = pc.model
	union
	select p.price, p.model
	from Printer as p
		join Product as pr on pr.model = p.model
	union
	select l.price, l.model
	from Laptop as l
		join Product as pr on pr.model = l.model
)
select t.model
from t
where t.price = (select max(t.price) from t)