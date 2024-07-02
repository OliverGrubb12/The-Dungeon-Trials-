extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var enemy_sprite = $EnemySprite

func _physics_process(delta):
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	if velocity.x > 0:
			enemy_sprite.flip_h = false
	else :
			enemy_sprite.flip_h = true
	
	
	
	move_and_slide()

