/*
Задание: 77 (Serge I: 2003-04-09)
Определить дни, когда было выполнено максимальное число рейсов из
Ростова ('Rostov'). Вывод: число рейсов, дата.
*/
select top 1 with ties count(distinct(pt.trip_no)) as sumtrip, pt.date
from Pass_in_trip pt
	join Trip as t on pt.trip_no = t.trip_no
where t.town_from = 'Rostov' 
group by pt.date
order by 1 desc
