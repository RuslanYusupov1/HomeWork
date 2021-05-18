/*Задание: 24 (Serge I: 2003-02-03) задание на два очка
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.*/
select model
from (
	select model, price from pc
	union
	select model, price from laptop
	union
	select model, price from printer
	) as a
where price = (
	select max(price)
	from (
		select model, price from pc
		union
		select model, price from laptop
		union
		select model, price from printer
		) as b
)