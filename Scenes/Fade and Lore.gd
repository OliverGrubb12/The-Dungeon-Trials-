extends Node2D
@onready var screen = $BlackScreen
@onready var lore = $Control/Lore


var lore_has_shown_up = false

# This is the code which sets the lore and blackscreen to have a colour modulation of 0
func _ready():
	lore.modulate.a = 0
	screen.modulate.a = 0

# This is the code for the fade in. It transitions into a screen where a paragraph of lore shows up.
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
	
# This is the code which takes the player to the game/world if they Left Click.
func _process(_delta):
	if lore_has_shown_up and Input.is_action_just_pressed("Fireball"):
		for i in range(20):
			lore.modulate.a -= 0.05
			await get_tree().create_timer(0.05).timeout
		get_tree().change_scene_to_file("res://Scenes/world.tscn")

# This is the code for the lore screen to disappear as the screen fades again into the game/world
func fade_out(amount, times):
	screen.modulate.a = 1
	for i in range(times):
		screen.modulate.a -= amount
		await get_tree().create_timer(0.05).timeout
