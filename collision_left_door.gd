extends Area2D


var in_range = false
var disabled = false

func _init() -> void:
	collision_layer = 0 
	collision_mask = 3


func _ready() -> void:
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox: HitBox) -> void:
	if disabled == false and $"../door_cave_with_door_open".visible == true:
		disabled = true
		Menu.level_1.emit()
		in_range = true
		Narrative.enter_level_2()
		$"../Player".position = Vector2i(122,97)
		$"../Player/AnimatedSprite2D".animation = "walk_up"
		$"../tower_floor/Control_Torch/torch_1".hide()
		$"../tower_floor/Control_Torch/torch_2".hide()
		$"../tower_floor/Control_Torch/torch_3".hide()
		$"../tower_floor/Control_Torch/torch_4".hide()
		$"../tower_floor/Control_Torch/torch_5".hide()
		$"../tower_floor/Control_Torch/torch_6".hide()
