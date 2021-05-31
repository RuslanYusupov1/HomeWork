/*
	Задание: 85 (Serge I: 2012-03-16)
	Найти производителей, которые выпускают только принтеры или только PC.
	При этом искомые производители PC должны выпускать не менее 3 моделей.
*/
select pr.maker 
from product as pr
group by pr.maker
having count (distinct type) = 1 
	and (
		min(pr.type) = 'printer' 
			or (min(pr.type) = 'pc' and count(pr.model) >= 3)
	)
