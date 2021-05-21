/*
	Задание: 43 (qwrqwr: 2011-10-28) задание на 2 очка
	Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.
*/
select b.name
from battles as b
where year(date) not in (
		select s.launched
		from ships as s
		where s.launched is not null
	)