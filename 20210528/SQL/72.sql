/*
Задание: 72 (Serge I: 2003-04-29)
Среди тех, кто пользуется услугами только какой-нибудь одной компании, определить имена разных пассажиров, летавших чаще других.
Вывести: имя пассажира и число полетов.
*/
with a as (
	select pt.id_psg, count(pt.date) as dsum
	from Pass_in_trip as pt
		join trip as t on pt.trip_no = t.trip_no
	group by pt.ID_psg
	having count(distinct t.ID_comp) = 1
)
select p.name, dsum
from a 
	join Passenger as p on a.ID_psg = p.ID_psg
		where dsum = (select max(dsum) from a)