/*
Задание: 87 (Serge I: 2003-08-28)
Считая, что пункт самого первого вылета пассажира является местом жительства, найти не москвичей, которые прилетали в Москву более одного раза.
Вывод: имя пассажира, количество полетов в Москву
*/
with t as (
	select pit.date, id_psg, t.*
	from pass_in_trip pit
		join trip t on pit.trip_no = t.trip_no
)
, fo as (
	select id_psg, min(date + time_out) as date_out
	from t group by id_psg
)
, notmoscow as (
  select fo.id_psg
  from fo join t on fo.date_out = (t.date + t.time_out)
  where town_from != 'Moscow'
)
select p.name, count(*)
from t 
	join passenger as p on t.id_psg = p.id_psg
where town_to = 'Moscow'
	and t.id_psg in (select * from notmoscow)
group by t.id_psg, p.name
having count(*) > 1
