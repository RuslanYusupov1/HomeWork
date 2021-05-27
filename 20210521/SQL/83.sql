/*
	Задание: 83 (dorin_larsen: 2006-03-14)
	Определить названия всех кораблей из таблицы Ships, которые удовлетворяют, по крайней мере, комбинации любых четырёх критериев из следующего списка:
	numGuns = 8
	bore = 15
	displacement = 32000
	type = bb
	launched = 1915
	class=Kongo
	country=USA
*/
with t1 as (
	Select 
		s.name
		,case when c.numGuns=8 then 1 else 0 end as c1
		,case when c.bore=15.0 then 1 else 0 end as c2
		,case when c.displacement=32000 then 1 else 0 end as c3
		,case when c.type='bb' then 1 else 0 end as c4
		,case when s.launched=1915 then 1 else 0 end as c5
		,case when c.class='Kongo' then 1 else 0 end as c6
		,case when c.country='USA' then 1 else 0 end as c7
	from ships s
		join classes c ON c.class=s.class
)
select name 
from t1
where (c1+c2+c3+c4+c5+c6+c7)> =4
