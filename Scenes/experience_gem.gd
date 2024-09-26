extends Area2D
@onready var experience_gem = $"."
@export var experience_value = 5
var collected = false
@onready var player = get_tree().get_first_node_in_group("Player")

# This is the code which moves the experience orb to the player if it enters the player's collection area.
func _process(delta):
	if collected:
		if player:
			global_position = global_position.move_toward(player.global_position, 300 * delta)
	
# This is the code which updates the player's experience.
func collect():
	collected = true
	PlayerStats.add_experience(experience_value)
	
# This is the code which deletes the experience orb after it collides with the player.
func _on_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
