/*
	Задание: 57 (Serge I: 2003-02-14)
	Для классов, имеющих потери в виде потопленных кораблей и не менее 3 кораблей в базе данных,
	вывести имя класса и число потопленных кораблей
*/
with t1 as (
		select s.name, c.class 
		from ships as s
			join classes as c on c.class = s.class
		union 
		select o.ship, c.class 
		from outcomes as o
			join classes as c on c.class = o.ship
	)
select c.class, SUM(case when o.result = 'sunk' then 1 else 0 end) as Sunks
	from outcomes as o
    left join ships as s on o.ship = s.name
    left join classes as c on c.class = o.ship 
		or c.class = s.class
where c.class in (
		select t1.class 
		from t1 
		group by t1.class 
		having count(*) >= 3
	)
group by c.class
having SUM(case when o.result = 'sunk' then 1 else 0 end) > 0
