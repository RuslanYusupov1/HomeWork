/*
Задание: 64 (Serge I: 2010-06-04)
Используя таблицы Income и Outcome, для каждого пункта приема определить дни, когда был приход, но не было расхода и наоборот.
Вывод: пункт, дата, тип операции (inc/out), денежная сумма за день.
*/
select i.point, i.date, 'inc' as pr, sum(i.inc) as a
from Income as i 
	left join Outcome as o on o.point = i.point
		and o.date = i.date
			where o.date is null
group by i.point, i.date
union all
select o.point, o.date, 'out' as pr, sum(o.out) as b
from Outcome as o
	left join Income as i on i.point = o.point
		and i.date = o.date
			where i.date is null
group by o.point, o.date