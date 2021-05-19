/*
Задание: 30 (Serge I: 2003-02-14)
В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз 
(первичным ключом в таблицах является столбец code), требуется получить таблицу, 
в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). 
Отсутствующие значения считать неопределенными (NULL)
*/
select isnull(i.point, o.point), isnull(i.date, o.date), sum(out), sum(inc)
from income as i 
	full join outcome as o on o.point = i.point 
		and o.code = i.code 
		and o.date = i.date
group by isnull(i.point, o.point), isnull(i.date, o.date)