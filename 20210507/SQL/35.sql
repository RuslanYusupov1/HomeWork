/*
Задание: 35 (qwrqwr: 2012-11-23) на 2 очка
В таблице Product найти модели, которые состоят только из цифр или только из латинских букв (A-Z, без учета регистра).
Вывод: номер модели, тип модели
*/
select p.model, p.type 
from Product as p
where p.model not like '%[^0-9]%'
	or p.model not like '%[^A-Z]%'