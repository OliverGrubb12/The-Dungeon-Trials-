extends Node2D

@onready var fade = $Fade



func _ready():
	fade.fade_out(0.05,20)

