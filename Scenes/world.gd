extends Node2D

@onready var fade = $Fade


# This is the code which causes you to fade into the game when it begins.
func _ready():
	fade.fade_out(0.05,20)
