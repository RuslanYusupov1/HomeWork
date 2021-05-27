/*
	Задание: 52 (qwrqwr: 2010-04-23) задание на два очка
	Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем,
	имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн
*/
select s.name 
from ships s
	join (
			select c.class  
				,isnull(c.country, '') as country
				,isnull(c.type, 'bb') as type
				,isnull(c.numGuns, 9) as numGuns
				,isnull(c.bore, 18) as bore
				,isnull(c.displacement, 65000) as displacement
			from Classes as c
		) as a on a.class = s.class
where a.country = 'Japan' 
	and a.type = 'bb' 
	and a.numGuns >= 9 
	and a.bore < 19 
	and a.displacement <= 65000