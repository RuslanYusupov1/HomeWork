/*
Задание: 78 (Serge I: 2005-01-19)
Для каждого сражения определить первый и последний день
месяца,
в котором оно состоялось.
Вывод: сражение, первый день месяца, последний
день месяца.
*/
select b.name
	,dateadd(day, 1, eomonth(dateadd(month, -1, date))) firstday_month
	,eomonth(date) lastday_month
from battles as b
