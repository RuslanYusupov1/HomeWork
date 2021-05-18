/* Задание: 40 (Serge I: 2012-04-20) на 2 очка
Найти производителей, которые выпускают более одной модели, при этом все выпускаемые производителем модели являются продуктами одного типа.
Вывести: maker, type*/
select maker, type
from product 
Where maker in (
	select maker 
	from product 
	group by maker having count(distinct type)=1
		)
group by maker, type
having count(type) >  1