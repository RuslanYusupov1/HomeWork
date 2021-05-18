/*Задание: 51 (Serge I: 2003-02-17) задание на два очка
Найдите названия кораблей, имеющих наибольшее число орудий среди всех имеющихся кораблей
 такого же водоизмещения (учесть корабли из таблицы Outcomes)*/
with all_ships as (
		select s.name,s.class 
		from Ships as s
		union
		select o.ship,o.ship 
		from Outcomes as o
				)
select a.name 
from all_ships as a
	join Classes c on (a.class=c.class)
where c.numGuns > = all (
			select numGuns
			from Classes
			where displacement=c.displacement
			and class in (select class from all_ships)
					)