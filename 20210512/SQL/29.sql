/*Задание: 29 (Serge I: 2003-02-14)
В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день 
[т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход). 
Использовать таблицы Income_o и Outcome_o.*/

select isnull(a.point, b.point), isnull(a.date, b.date), a.inc, b.out 
from income_o as a
	join outcome_o b as b on a.date=b.date
		and a.point = b.point