/*
	Задание: 25 (Serge I: 2003-02-14) задание на 2 очка
	Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM
	и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
*/
select pr.maker
from Product as pr 
	join PC on pr.model = PC.model
where pc.ram = (select min(ram) from PC)
	and PC.speed = (
					select min(speed) 
					from PC 
					where PC.ram = (select min(ram) from PC)
				)	
	intersect
	select pr.maker
	from Product as pr
	where pr.type = 'Printer'