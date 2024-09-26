extends CharacterBody2D

@export var Fireball: PackedScene
@export var SPEED = 175
@export var ACCELERATION = 20.0
@export var FRICTION = 10.0
@export var is_ready :bool = true
@onready var sprite = $PlayerAnimations
@onready var hands = $Hands
@onready var world = get_node('/root/World')
@onready var shooting_timer = $ShootingTimer
@onready var pause_menu = $UI/PauseMenu
@onready var main = $"../../"
@onready var fireball_sound = $FireballSound
var direction = Vector2.ZERO
var last_direction = Vector2.ZERO
var paused = false

# This is the code which triggers the pause menu.
func _process(_delta):
	# Pause Game
	if Input.is_action_just_pressed("Pause"):
		pauseMenu()
	

# This is the code for the player movement and for the player sprite to flip depending on which direction they move.
func _physics_process(_delta):
	# Movement
	direction = Input.get_vector("left", "right", "up", "down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * PlayerStats.player_speed, ACCELERATION)
		last_direction = direction
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
	
	move_and_slide()

# This is the code which triggers the player to shoot a fireball
func _unhandled_input(_event):
	#Fireball Attack
	if Input.is_action_just_pressed("Fireball") and is_ready:
		fireball()

# This is the code for the pause menu.
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused

# This is the code for the fireball. It has all the code for its direction, speed, sound, position and animation
func fireball():
	shooting_timer.wait_time = WeaponFireball.fireball_time
	shooting_timer.start()
	var fireball = Fireball.instantiate()
	add_child(fireball)
	fireball.global_position = hands.global_position
	var target  = get_global_mouse_position()
	var direction_to_mouse = fireball.global_position.direction_to(target).normalized()
	fireball.look_at(get_global_mouse_position())
	fireball.set_direction(direction_to_mouse)
	fireball_sound.play()
	is_ready = false

# This is the code for when the player picks up an experience orb.
func _on_pickup_zone_area_entered(area):
	if area.is_in_group("Pickup"):
		if area.has_method("collect"):
			area.collect()

# This is the code for the button in the pause menu which takes you back to the main menu. It also resets the player's stats and the music.
func _on_main_menu_button_pressed():
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Scenes/Main Menu.tscn")
	PlayerStats.player_health = 100
	PlayerStats.player_experience = 0
	PlayerStats.player_level = 1
	if GameMusic.boss_music.playing:
		GameMusic.boss_music.playing = !GameMusic.boss_music.playing
	GameMusic.game_music.play()

# This is a bit of code relating to the shooting timer on the player.
func _on_shooting_timer_timeout():
	is_ready = true
