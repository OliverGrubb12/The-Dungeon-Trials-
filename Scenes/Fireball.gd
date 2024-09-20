extends Area2D
@onready var fireball = $"."
@export var SPEED = 10
var direction = Vector2.ZERO
@onready var fireball_anim = $FireballAnim


func _ready():
	await fireball_anim.animation_finished
	queue_free()

func _physics_process(_delta: float):
	if direction != Vector2.ZERO:
		var velocity = direction * WeaponFireball.fireball_speed
		global_position += velocity

func set_direction(direction: Vector2):
	self.direction = direction

func _on_body_entered(body):
	if body.is_in_group("Enemy") or body.is_in_group("Boss") and body.has_method("take_damage"):
		body.take_damage(WeaponFireball.fireball_damage)
		queue_free()

