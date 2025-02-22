extends Area2D

func _init() -> void:
	collision_layer = 0 
	collision_mask = 3


func _ready() -> void:
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox: HitBox) -> void:
	if $"../door_cave_with_cave_open".visible == true:
		$"../Player".position = Vector2i(-167,-200)
		$"../Player/AnimatedSprite2D".animation = "walk_down"
		Narrative.enter_level_m1()
		$"../tower_floor/Control_Torch/torch_1".hide()
		$"../tower_floor/Control_Torch/torch_2".hide()
		$"../tower_floor/Control_Torch/torch_3".hide()
		$"../tower_floor/Control_Torch/torch_4".hide()
		$"../tower_floor/Control_Torch/torch_5".hide()
		$"../tower_floor/Control_Torch/torch_6".hide()
		Narrative.torch_hide.emit()
