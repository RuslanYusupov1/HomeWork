/*
	Задание: 89 (Serge I: 2012-05-04)
	Найти производителей, у которых больше всего моделей в таблице Product, а также тех, у которых меньше всего моделей.
	Вывод: maker, число моделей
*/
select pr.maker, count(pr.model)
from product as pr
group by pr.maker
having count(pr.model) >= all(
		select count(pr.model)
		from product as pr
		group by pr.maker
	)
	or count(pr.model) <= all(
			select count(pr.model)
			from product as pr
			group by pr.maker
		)
