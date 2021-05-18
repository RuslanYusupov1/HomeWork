/*Задание: 52 (qwrqwr: 2010-04-23) задание на два очка
Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем,
имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн*/
select s.name 
from ships as s join classes as c
on c.class = s.class
where c.country = 'Japan'
	and (c.numGuns >= 9 or c.numGuns is null)
	and (c.bore < 19 or c.bore is null)
	and (c.displacement <= 65000 or c.displacement is null)
	and c.type = 'bb'