/*
Задание: 88 (Serge I: 2003-04-29)
Среди тех, кто пользуется услугами только одной компании, определить имена разных пассажиров, летавших чаще других.
Вывести: имя пассажира, число полетов и название компании.
*/
with cte as (
	select
		pit.id_psg
		,count(pit.trip_no) as trip_count
		,max(t.id_comp) as id_comp
	from pass_in_trip as pit
		join trip as t on pit.trip_no = t.trip_no
	group by pit.id_psg
	having count(distinct t.id_comp) = 1
)
select
	p.name, cte.trip_count, c.name
from cte
	join company as c on cte.id_comp = c.id_comp
	join passenger as p on cte.id_psg = p.id_psg
where cte.trip_count = (select max(trip_count) from cte)
