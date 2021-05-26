/*
	Задание: 27 (Serge I: 2003-02-03) задание на 2 очка
	Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. 
	Вывести: maker, средний размер HD.
*/
select pr.maker, avg(hd)
from product as pr
	join pc on pc.model = pr.model
where pr.maker in (
		select maker 
		from product
		where pr.type = 'printer'
	)
group by pr.maker