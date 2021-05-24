/*
	Задание: 46 (Serge I: 2003-02-14) на 2 очка
	Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal),
	вывести название, водоизмещение и число орудий.
*/
select o.ship, c.displacement, c.numGuns
from outcomes as o
	left join ships as s on o.ship = s.name
	left join classes as c on s.class = c.class
		or o.ship = c.class
where o.battle = 'Guadalcanal'