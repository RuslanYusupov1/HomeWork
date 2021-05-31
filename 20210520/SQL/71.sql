/*
	Найти тех производителей ПК, все модели ПК которых имеются в таблице PC.
*/
select p.maker
from Product as p
	left join pc on pc.model = p.model
where p.type = 'PC'
group by p.maker
having count(pc.model) = count(p.model)