/*
	Для каждой страны определить сражения, в которых не участвовали корабли данной страны.
	Вывод: страна, сражение
*/
select c.country, b.name
from Classes as c, battles as b
except
	select c.country, o.battle
	from outcomes as o
		left join ships as s on o.ship = s.name
		left join classes as c on c.class = s.class
			 or c.class = o.ship
where country is not null
group by c.country, o.battle