extends Node


var fireball_level = 1
var fireball_damage = 5
var fireball_speed = 10
var fireball_time = 0.6
var fireball_knockback = 10
var fireball_max_level = 6

func level_up_fireball():
	fireball_level +=1
	match fireball_level:
		1:
			pass
		2:
			fireball_damage = 6
			fireball_speed = 12
			fireball_time = 0.5
			fireball_knockback = 15
		3:
			fireball_damage = 7
			fireball_speed = 14
			fireball_time = 0.4
			fireball_knockback = 15
		4:
			fireball_damage = 8
			fireball_speed = 16
			fireball_time = 0.3
			fireball_knockback = 20
		5:
			fireball_damage = 9
			fireball_speed = 18
			fireball_time = 0.2
			fireball_knockback = 20
		6:
			fireball_damage = 10
			fireball_speed = 20
			fireball_time = 0.1
			fireball_knockback = 25
