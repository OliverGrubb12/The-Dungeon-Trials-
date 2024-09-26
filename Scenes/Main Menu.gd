extends Control

@onready var fade = $Fade
var button_clicked = false

# This is the code for the button which takes you to the options menu
func _on_options_button_pressed():
	if not button_clicked:
		get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")
	
# This is the code for the button which closes the game
func _on_quit_button_pressed():
	if not button_clicked:
		get_tree().quit()
	
# This is the code for the button which starts the game and takes the user to the level/world. Firstly though it will fade into a short lore screen.
func _on_play_button_pressed():
	if not button_clicked:
		button_clicked = true
		fade.fade_in(0.05,20)
	
