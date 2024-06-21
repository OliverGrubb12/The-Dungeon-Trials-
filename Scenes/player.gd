extends CharacterBody2D


@export var SPEED = 175
@export var ACCELERATION = 20.0
@export var FRICTION = 10.0
@onready var sprite = $Sprite

@onready var world = get_node('/root/World')
var direction = Vector2.ZERO
var last_direction = Vector2.ZERO

func _physics_process(delta):
	# Movement
	direction = Input.get_vector("left", "right", "up", "down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
		last_direction = direction
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
	
	move_and_slide()
