extends Control
var music = true

# This is the code for the button which takes the player back to the main menu
func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
	pass

# This is the code for the button which toggles the music which plays in the game
func _on_toggle_music_button_pressed():
	music = false
	GameMusic.game_music.playing = !GameMusic.game_music.playing
	
