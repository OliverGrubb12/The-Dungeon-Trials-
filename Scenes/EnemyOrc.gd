extends CharacterBody2D

var SPEED = 100.0
const JUMP_VELOCITY = -400
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var anim = $EnemySprite
@export var health = 10
@export var enemy_damage = 10
@onready var damage_timer = $Hurtbox/DamageTimer
const EXPERIENCE_GEM = preload("res://Scenes/experience_gem.tscn")

# This is the code which upgrades the enemy stats as the player levels up. It upgrades its damage and speed.
func _ready():
	if PlayerStats.player_level >= 3:
		enemy_damage = 15
		SPEED = 125
	if PlayerStats.player_level >= 7:
		enemy_damage = 20
		SPEED = 150
	if PlayerStats.player_level >= 10:
		enemy_damage = 25
		SPEED = 175
	if PlayerStats.player_level >= 20:
		enemy_damage = 34
		SPEED = 200

# This is the code which checks if the player overlaps with the enemy and if it does then it damages the player.
func check_collisions():
	if not damage_timer.is_stopped():
		return
	var collisions = $Hurtbox.get_overlapping_bodies()
	if collisions:
		for collision in collisions:
			if collision.is_in_group("Player") and damage_timer.is_stopped():
				PlayerStats.damage_player(enemy_damage)
				damage_timer.start()

# This is the code for the enemy movement and for flipping the enemy sprite depending on its direction.
func _physics_process(_delta):
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	if velocity.x > 0:
			anim.flip_h = false
	else :
			anim.flip_h = true
			
	check_collisions()
	move_and_slide()

# This is the code for when the enemy takes damage. If its health is <= 0 then it will die and spawn an experience orb.
func take_damage(dmg):
	health -= dmg
	if health <= 0:
		anim.play("Death")
		SPEED = 0
		enemy_damage = 0
		await anim.animation_finished
		var new_gem = EXPERIENCE_GEM.instantiate()
		new_gem.global_position = global_position
		add_sibling(new_gem)
		queue_free()
		
		
