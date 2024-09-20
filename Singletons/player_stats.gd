extends Node


var player_level = 1
var player_experience = 0
var player_health = 100
var player_max_health = 100
var next_level = 15
var max_speed_level = 4
var speed_level = 1
var player_speed = 175
var heal = 20

signal level_up
signal add_xp
signal take_damage


func add_experience(val):
	player_experience += val
	emit_signal("add_xp")
	if player_experience >= next_level:
		level_up_player()

func level_up_player():
	player_level+=1
	next_level = next_level + 10
	player_experience = 0
	emit_signal("level_up")
	
func damage_player(amount):
	player_health -= amount
	emit_signal("take_damage")
	if player_health <= 0:
		get_tree().change_scene_to_file("res://Scenes/death_menu.tscn")
		player_health = 100
		player_experience = 0
		player_level = 1

func add_health():
	player_health += heal
	emit_signal("take_damage")

func level_up_speed():
	speed_level +=1
	match speed_level:
		1:
			pass
		2:
			player_speed = 190
		3:
			player_speed = 200
		4:
			player_speed = 215
	emit_signal("take_damage")
