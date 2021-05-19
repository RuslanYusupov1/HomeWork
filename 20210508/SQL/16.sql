/*
Задание: 16 (Serge I: 2003-02-03) задание на два очка
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i),
Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
*/
select p.model,	l.model, p.speed, p.ram
from PC as p
	join PC as l on l.speed = p.speed
		and l.ram = p.ram 
		and l.model < p.model
group by p.model, l.model, p.speed, p.ram