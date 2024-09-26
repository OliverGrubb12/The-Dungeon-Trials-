extends Node2D

const BOSS = preload("res://Scenes/boss.tscn")
@onready var boss_spawn_point = $BossSpawnPoint
@onready var world = get_node("/root/World")
@onready var boss_spawn_timer = $BossSpawnTimer
@onready var spawn_timer = $"../EnemySpawners/SpawnTimer"
var boss_music_playing = false

# This is the code which spawns the boss
func spawn_boss():
	var boss = BOSS.instantiate()
	boss.global_position = boss_spawn_point.global_position
	world.add_child(boss)
	boss_spawn_timer.start()
 
# This is the code which triggers the spawning of the boss. It also changes the music.
func _on_boss_spawn_timer_timeout():
	spawn_boss()
	GameMusic.game_music.playing = !GameMusic.game_music.playing
	if OptionsMenu.music == true:
		GameMusic.boss_music.play()
		boss_music_playing = true
	else:
		pass
		
	spawn_timer.wait_time = 1
	boss_spawn_timer.stop()
	
