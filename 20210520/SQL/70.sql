/*
	Укажите сражения, в которых участвовало по меньшей мере три корабля одной и той же страны.
*/
select distinct a.battle
from (
		select o.battle, o.ship, c.country
		from outcomes as o, classes as c
		where c.class = o.ship and c.country is not null
		union
			select o.battle, o.ship, c.country
			from outcomes as o, ships as s, classes as c
			where o.ship = s.name and s.class = c.class and c.country is not null
	) as a
group by a.country, a.battle
having count (a.ship) >= 3