/*
	Задание: 75 (Serge I: 2020-01-31)
	Для тех производителей, у которых есть продукты с известной ценой хотя бы в одной из таблиц Laptop, PC, Printer найти максимальные цены на каждый из типов продукции.
	Вывод: maker, максимальная цена на ноутбуки, максимальная цена на ПК, максимальная цена на принтеры.
	Для отсутствующих продуктов/цен использовать NULL
*/
select pr.maker, max(l.price), max(pc.price), max(p.price)
from Product as pr
	left join Laptop as l on l.model = pr.model
	left join PC on pc.model = pr.model
	left join Printer as p on p.model = pr.model
group by pr.maker
having max(l.price) is not null 
	or max(pc.price) is not null 
	or max(p.price) is not null