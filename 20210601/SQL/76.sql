/*
Задание: 76 (Serge I: 2003-08-28)
Определить время, проведенное в полетах, для пассажиров, летавших всегда на разных местах. Вывод: имя пассажира, время в минутах.
*/
select p.name, minutes
from passenger p 
	join (
				select id_psg
				,sum(datediff(minute, t.time_out, t.time_in + case when t.time_out > t.time_in then 1 else 0 end)
			) as minutes
		from pass_in_trip pt 
			join trip t on pt.trip_no = t.trip_no
		group by id_psg
	) t on p.id_psg = t.id_psg
where t.id_psg not in (
	select pt.id_psg 
	from pass_in_trip as pt
	group by pt.id_psg, pt.place
	having count(pt.place) > 1
)