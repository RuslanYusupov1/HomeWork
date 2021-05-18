/*Задание: 63 (Serge I: 2003-04-08) на 2 очка
Определить имена разных пассажиров, когда-либо летевших на одном и том же месте более одного раза.*/
select name 
from passenger
where id_psg in (
	select id_psg
	from pass_in_trip
	group by id_psg, place
	having count(place) > 1
			)