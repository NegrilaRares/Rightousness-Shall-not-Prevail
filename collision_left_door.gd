extends Area2D


var in_range = false
var level : int = 1

func _init() -> void:
	collision_layer = 0 
	collision_mask = 3


func _ready() -> void:
	connect("area_entered", self._on_area_entered)

func _on_area_entered(hitbox: HitBox) -> void:
	if $"../door_cave_with_door_open".visible == true or $"../door_cave_both_open".visible == true or $"../cave_cave_with_second_closed".visible == true or $"../cave_cave_with_second_open".visible == true or $"../door_door_with_second_closed".visible == true or $"../door_door_with_second_open" .visible == true:
		in_range = true
		
		$"../Player".position = Vector2i(-167,-227)
		$"../Player/AnimatedSprite2D".animation = "walk_down"
		if level == 1:
			Narrative.enter_level_2()
			level = 2
			$"../tower_floor/Control_Torch/torch_1".hide()
			$"../tower_floor/Control_Torch/torch_2".hide()
			$"../tower_floor/Control_Torch/torch_3".hide()
			$"../tower_floor/Control_Torch/torch_4".hide()
			$"../tower_floor/Control_Torch/torch_5".hide()
			$"../tower_floor/Control_Torch/torch_6".hide()
		elif level == 2:
			level = 1
			Narrative.enter_level_1()
			$"../tower_floor/Control_Torch/torch_1".show()
			$"../tower_floor/Control_Torch/torch_2".show()
			$"../tower_floor/Control_Torch/torch_3".show()
			$"../tower_floor/Control_Torch/torch_4".show()
			$"../tower_floor/Control_Torch/torch_5".show()
			$"../tower_floor/Control_Torch/torch_6".show()
		#elif level == 3:
			#level = 2
			#Narrative.enter_level_2()
		#elif level == -1:
			#level = 1
			#Narrative.enter_level_1()
		#elif level == -2:
			#level = -1
			#Narrative.enter_level_m1()
		#elif level == -3:
			#level = -2
			#Narrative.enter_level_m2()

			
			
