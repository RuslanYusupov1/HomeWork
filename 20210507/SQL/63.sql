/*
Задание: 63 (Serge I: 2003-04-08) на 2 очка
Определить имена разных пассажиров, когда-либо летевших на одном и том же месте более одного раза.
*/
select p.name 
from passenger as p
where ps.id_psg in (
	select ps.id_psg
	from pass_in_trip as ps
	group by ps.id_psg, ps.place
	having count(ps.place) > 1
	)