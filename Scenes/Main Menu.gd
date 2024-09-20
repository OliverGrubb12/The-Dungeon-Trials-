extends Control

@onready var fade = $Fade
var button_clicked = false


func _on_options_button_pressed():
	if not button_clicked:
		get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")
	

func _on_quit_button_pressed():
	if not button_clicked:
		get_tree().quit()
	

func _on_play_button_pressed():
	if not button_clicked:
		button_clicked = true
		fade.fade_in(0.05,20)
	
