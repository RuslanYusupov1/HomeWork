/*Задание: 16 (Serge I: 2003-02-03) задание на два очка
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i),
Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.*/
select distinct big.model, sm.model, sm.speed, sm.ram 
from PC big, PC sm
where big.ram = sm.ram
	and big.model > sm.model
	and big.speed = sm.speed