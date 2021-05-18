/*Задание: 43 (qwrqwr: 2011-10-28) задание на 2 очка
Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.*/
select name
from battles
where year(date) not in (
		select launched
		from ships
		where launched is not null
						)