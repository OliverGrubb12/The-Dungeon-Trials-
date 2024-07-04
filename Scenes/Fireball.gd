extends Area2D
@onready var fireball = $Fireball
@export var SPEED = 10
var direction := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float):
	if direction != Vector2.ZERO:
		var velocity = direction * SPEED
	#translate(Vector2.RIGHT.rotated(rotation) * SPEED * delta)
		global_position += velocity

func set_direction(direction: Vector2):
	self.direction = direction
	
