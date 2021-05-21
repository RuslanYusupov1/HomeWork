/*
	Задание: 57 (Serge I: 2003-02-14)
	Для классов, имеющих потери в виде потопленных кораблей и не менее 3 кораблей в базе данных,
	вывести имя класса и число потопленных кораблей
*/
select class as c, count(ship)
from (
		select class, ship
		from Outcomes as o
			join Ships as s on o.ship = s.name and result = 'sunk'
		union
			select c.class, o.ship
			from Outcomes
				join Classes as c on o.ship = c.class and result = 'sunk'
	) as t1
where c.class in (
		select class
		from (
				select class, name
				from Ships
				union
				select ship, ship
				from Outcomes
					join Classes on ship = class
			) as t2	
		group by class
		having count( name ) > 2
		)
group by class