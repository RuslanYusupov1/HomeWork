/*
Задание: 37 (Serge I: 2003-02-17) задание на 2 очка
Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).
*/
select a.class 
from (
	select c.class, s.name 
	from classes as c,ships as s 
	where c.class=s.class 
union
	select c.class, o.ship 
	from classes as c,outcomes as o 
	where c.class = o.ship 
	) as a 
group by a.class 
having count(name) = 1