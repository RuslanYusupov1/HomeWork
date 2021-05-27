/*
	Задание: 86 (Serge I: 2012-04-20)
	Для каждого производителя перечислить в алфавитном порядке с разделителем "/" все типы выпускаемой им продукции.
	Вывод: maker, список типов продукции
*/
select pr.maker
	,case count(distinct pr.type)
		when 2 then min(pr.type) + '/' + max(pr.type)
		when 1 then MAX(pr.type)
		when 3 then 'Laptop/PC/Printer' end
from product as pr
group by pr.maker
