extends Node2D
@onready var screen = $BlackScreen
@onready var lore = $Control/Lore


var lore_has_shown_up = false

func _ready():
	lore.modulate.a = 0
	screen.modulate.a = 0

func fade_in(amount, times):
	lore.modulate.a = 0
	screen.modulate.a = 0
	for i in range(times):
		screen.modulate.a += amount
		await get_tree().create_timer(0.05).timeout
	await get_tree().create_timer(1).timeout
	for i in range(20):
		lore.modulate.a += 0.05
		await get_tree().create_timer(0.05).timeout
	lore_has_shown_up = true
	
func _process(_delta):
	if lore_has_shown_up and Input.is_action_just_pressed("Fireball"):
		for i in range(20):
			lore.modulate.a -= 0.05
			await get_tree().create_timer(0.05).timeout
		get_tree().change_scene_to_file("res://Scenes/world.tscn")

func fade_out(amount, times):
	screen.modulate.a = 1
	for i in range(times):
		screen.modulate.a -= amount
		await get_tree().create_timer(0.05).timeout

