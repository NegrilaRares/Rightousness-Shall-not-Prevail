extends Area2D


var in_range = false
var disabled = false

func _init() -> void:
	collision_layer = 0 
	collision_mask = 3


func _ready() -> void:
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox: HitBox) -> void:
	if disabled == false:
		disabled = true
		Menu.level_1.emit()
		in_range = true
		Narrative.enter_level_1()
		$"../Player".position = Vector2i(-152,-231)
		$"../Player/AnimatedSprite2D".animation = "walk_down"
	
	
