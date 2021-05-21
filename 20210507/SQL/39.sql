/*
	Задание: 39 (Serge I: 2003-02-14) на 2 очка
	Найдите корабли, `сохранившиеся для будущих сражений`; т.е. выведенные из строя в одной битве (damaged),
	они участвовали в другой, произошедшей позже.
*/
select distinct o.ship
from outcomes as o
	join battles as b on b.name = o.battle
where o.result = 'damaged' 
	and exists (
			select oo.ship 
			from outcomes as oo 
				join battles as bs on bs.name = oo.battle 
			where bs.date > b.date 
				and o.ship = oo.ship
		)