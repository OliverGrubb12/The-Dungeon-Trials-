extends CanvasLayer

@onready var experience = $UI/Experience
@onready var health = $UI/Health
@onready var level_up_notice = $UI/LevelUpNotice


func _ready():
	PlayerStats.level_up.connect(level_up)
	PlayerStats.take_damage.connect(update_health)
	PlayerStats.add_xp.connect(update_xp)

func level_up():
	update_xp()
	level_up_notice.visible = true

func update_xp():
	experience.max_value = PlayerStats.next_level
	experience.value = PlayerStats.player_experience
	
func update_health():
	health.max_value = PlayerStats.player_max_health
	health.value = PlayerStats.player_health


func _on_level_up_notice_visibility_changed():
	if level_up_notice.visible == true:
		Engine.time_scale = 0
	else:
		Engine.time_scale = 1


func _on_heal_player_pressed():
	PlayerStats.add_health()
	level_up_notice.visible = false

func _on_level_up_fireball_pressed():
	WeaponFireball.level_up_fireball()
	level_up_notice.visible = false


func _on_level_up_speed_pressed():
	PlayerStats.level_up_speed()
	level_up_notice.visible = false
