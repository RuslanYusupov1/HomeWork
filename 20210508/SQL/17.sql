/*
	Задание: 17 (Serge I: 2003-02-03) задание на два очка
	Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
	Вывести: type, model, speed
*/
select distinct p.type, l.model, l.speed 
from product as p
	join laptop as l on p.model = l.model
		and l.speed < all(
				select pc.speed 
				from PC
			)