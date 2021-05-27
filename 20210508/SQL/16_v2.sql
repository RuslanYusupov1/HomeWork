/*
	Задание: 16 (Serge I: 2003-02-03) задание на два очка
	Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
	В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i),
	Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
*/
select b.model, a.model, b.speed, a.ram
from PC as a
	join PC as b on b.speed = a.speed
		and b.ram = a.ram
		and b.model > a.model 
group by b.model, a.model, b.speed, a.ram