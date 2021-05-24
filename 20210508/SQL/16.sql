/*
	Задание: 16 (Serge I: 2003-02-03) задание на два очка
	Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
	В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i),
	Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
*/
select distinct b.model, a.model, b.speed, a.ram
from PC as a
	join PC as b on b.speed = a.speed
		and exists (
				select 1 
				from pc as c 
				where c.model = b.model
					and b.model > a.model
					and a.ram = b.ram
					and a.speed = b.speed
			)
					