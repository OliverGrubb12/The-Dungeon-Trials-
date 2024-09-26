extends Control

# This is the code for the button which takes you back to the main menu
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
	pass
