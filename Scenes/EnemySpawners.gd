extends Node2D
@onready var spawn_points = $SpawnPoints.get_children()
@onready var spawn_timer = $SpawnTimer
@onready var world = get_node("/root/World")
@onready var camera = $".."
const ENEMY_ORC = preload("res://Scenes/enemy_orc.tscn")

# This is the code which spawns the enemy orcs
func spawn_enemy():
	var enemy = ENEMY_ORC.instantiate()
	var spawn_point = spawn_points.pick_random()
	enemy.global_position = spawn_point.global_position
	world.add_child(enemy)

# This is the code which triggers the enemy orcs to spawn
func _on_spawn_timer_timeout():
		spawn_enemy()
