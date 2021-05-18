/*Задание: 60 (Serge I: 2003-02-15)
Посчитать остаток денежных средств на начало дня 15/04/01 на каждом пункте приема для базы данных
 с отчетностью не чаще одного раза в день. Вывод: пункт, остаток.
Замечание. Не учитывать пункты, информации о которых нет до указанной даты.*/
select point, SUM(inc)
from (
	select i.point, i.date, i.inc
	from Income_o as i
	union 
	select o.point, o.date, -out
	from Outcome_o as o) as a
where a.date < '2001-04-15'
group by point