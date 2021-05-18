/*Задание: 52 (qwrqwr: 2010-04-23) задание на два очка
Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем,
имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн*/
select name 
from ships s
	join (
		select class,  
		isnull(country, '') as country,
		isnull(type, 'bb') as type,
		isnull(numGuns, 9) as numGuns,
		isnull(bore, 18) as bore,
		isnull(displacement, 65000) as displacement
		from Classes
		) as a on a.class=s.class
where country='Japan' 
	and type='bb' 
	and  numGuns > =9 
	and bore < 19 
	and displacement <= 65000