extends Control


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
	PlayerStats.player_health = 100
	PlayerStats.player_experience = 0
	PlayerStats.player_level = 1
	GameMusic.boss_music.playing = !GameMusic.boss_music.playing
	GameMusic.game_music.play()
