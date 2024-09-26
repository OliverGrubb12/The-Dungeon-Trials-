extends CanvasLayer

@onready var experience = $UI/Experience
@onready var health = $UI/Health
@onready var level_up_notice = $UI/LevelUpNotice

# This is the code for connecting the signals
func _ready():
	PlayerStats.level_up.connect(level_up)
	PlayerStats.take_damage.connect(update_health)
	PlayerStats.add_xp.connect(update_xp)

# This is the code which triggers the xp to update and causes the upgrade menu to appear
func level_up():
	update_xp()
	level_up_notice.visible = true

# This is the code which updates the player xp
func update_xp():
	experience.max_value = PlayerStats.next_level
	experience.value = PlayerStats.player_experience
	
# This is the code which updates the players health
func update_health():
	health.max_value = PlayerStats.player_max_health
	health.value = PlayerStats.player_health

# This is the code which pauses the game when the upgrade menu appears
func _on_level_up_notice_visibility_changed():
	if level_up_notice.visible == true:
		Engine.time_scale = 0
	else:
		Engine.time_scale = 1

# This is the code for the healing button in the upgrade menu
func _on_heal_player_pressed():
	PlayerStats.add_health()
	level_up_notice.visible = false

# This is the code for the upgrade fireball button in the upgrade menu
func _on_level_up_fireball_pressed():
	WeaponFireball.level_up_fireball()
	level_up_notice.visible = false

# This is the code for the upgrade player speed button in the upgrade menu
func _on_level_up_speed_pressed():
	PlayerStats.level_up_speed()
	level_up_notice.visible = false
