/*Задание: 56 (Serge I: 2003-02-16) задание на два очка
Для каждого класса определите число кораблей этого класса, потопленных в сражениях. 
Вывести: класс и число потопленных кораблей.*/
select c.class, count(o.result)
from classes as c
	left join (
		select name ship, class
		from ships as s
        union
        select o.ship, o.ship
        from outcomes as o
        	) as a on c.class = a.class
	left join outcomes as o on o.ship=a.ship
		and o.result = 'sunk'
group by c.class