/*
	Вывести классы всех кораблей России (Russia). Если в базе данных нет классов кораблей России, вывести классы для всех имеющихся в БД стран.
	Вывод: страна, класс
*/
select c.country, c.class
from classes as c
where c.country = 'Russia' 
	and exists (
		select c.country, c.class
		from classes as c
		where c.country = 'Russia'
		union all
			select c.country, c.class
			from 
			classes as c 
			where not exists (
					select c.country, c.class
					from classes as class
					where c.country = 'Russia'
				)
			)