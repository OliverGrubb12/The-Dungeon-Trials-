extends Area2D
@onready var fireball = $"."
@export var SPEED = 10
var direction = Vector2.ZERO
@onready var fireball_anim = $FireballAnim

# This is the code which deletes the fireball after it completes its animation. This is so that it doesn't keep on moving forever.
func _ready():
	await fireball_anim.animation_finished
	queue_free()

# This is the code for the fireball direction and speed.
func _physics_process(_delta: float):
	if direction != Vector2.ZERO:
		var velocity = direction * WeaponFireball.fireball_speed
		global_position += velocity

# This is code relating to the fireball's direction.
func set_direction(direction: Vector2):
	self.direction = direction

# This is the code which damages the enemy if it collides with them. It also deletes the fireball.
func _on_body_entered(body):
	if body.is_in_group("Enemy") or body.is_in_group("Boss") and body.has_method("take_damage"):
		body.take_damage(WeaponFireball.fireball_damage)
		queue_free()
