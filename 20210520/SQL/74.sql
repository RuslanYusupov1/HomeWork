/*
	Вывести классы всех кораблей России (Russia). Если в базе данных нет классов кораблей России, вывести классы для всех имеющихся в БД стран.
	Вывод: страна, класс
*/
Select c.country, c.class
from classes as c
where (
		c.country = 'Russia' 
			and 'Russia' = any (
				select c.country 
				from classes as c
			)
	)
	or (
		c.country != 'Russia' 
			and not ('Russia' = any ( 
				select c.country 
				from classes as c
			)
		)
	)