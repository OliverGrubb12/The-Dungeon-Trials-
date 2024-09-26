extends CharacterBody2D

var SPEED = 150
const JUMP_VELOCITY = -400
@onready var player = get_tree().get_first_node_in_group("Player")
var health = 500
@onready var boss_sprite = $BossSprite
@onready var boss_damage_timer = $Hurtbox/BossDamageTimer
@export var boss_damage = 25

# This is the code for the boss movement and flipping its sprite depending on its direction.
func _physics_process(_delta):
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	if velocity.x > 0:
			boss_sprite.flip_h = false
	else :
			boss_sprite.flip_h = true
	check_collisions()
	move_and_slide()

# This is the code for when the boss takes damage. If its health <= 0 then it will die and the player will be teleported to the win menu.
func take_damage(dmg):
	health -= dmg
	if health <= 0:
		boss_sprite.play("Death")
		SPEED = 0
		boss_damage = 0
		await boss_sprite.animation_finished
		queue_free()
		get_tree().change_scene_to_file("res://Scenes/win_menu.tscn")

# This is the code which checks for collisions with the player. If it is colliding then the player will take damage.
func check_collisions():
	if not boss_damage_timer.is_stopped():
		return
	var collisions = $Hurtbox.get_overlapping_bodies()
	if collisions:
		for collision in collisions:
			if collision.is_in_group("Player") and boss_damage_timer.is_stopped():
				PlayerStats.damage_player(boss_damage)
				boss_damage_timer.start()
