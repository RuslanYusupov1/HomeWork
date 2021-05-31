/*
Задание: 67 (Serge I: 2010-03-27)
Найти количество маршрутов, которые обслуживаются наибольшим числом рейсов.
Замечания.
1) A - B и B - A считать РАЗНЫМИ маршрутами.
2) Использовать только таблицу Trip
*/
with t1 as (
	select count(t.trip_no) as tn
	from trip as t
	group by t.town_from, t.town_to
)
select count(t1.tn)
from t1
where t1.tn = (
	select max(t1.tn) 
	from t1
)