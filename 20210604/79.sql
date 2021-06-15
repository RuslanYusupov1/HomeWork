/*
Задание: 79 (Serge I: 2003-04-29)
Определить пассажиров, которые больше других времени провели в полетах.
Вывод: имя пассажира, общее время в минутах, проведенное в полетах
*/
with flight_time as (
	select 
		pt.id_psg
		,sum(
			case
				when time_out >= time_in then datediff(mi, time_out, time_in) + 1440
				else datediff(mi,time_out, time_in)
			end
		) as trip_time
	from pass_in_trip pt
		join trip t on t.trip_no = pt.trip_no
	group by pt.id_psg
)
select p.name, trip_time
from flight_time as pt 
	join passenger p on pt.id_psg = p.id_psg
where trip_time = (select max(trip_time) from flight_time)
