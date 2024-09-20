extends Control
var music = true

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
	pass


func _on_toggle_music_button_pressed():
	music = false
	GameMusic.game_music.playing = !GameMusic.game_music.playing
	

