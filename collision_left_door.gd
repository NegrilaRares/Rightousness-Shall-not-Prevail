extends Area2D


var level : int = 1
var tel_ready = false

func _init() -> void:
	collision_layer = 0 
	collision_mask = 3


func _ready() -> void:
	connect("area_entered", self._on_area_entered)
	Narrative.level_m1.connect(on_level_m1)
	Narrative.ready_teleport.connect(on_teleport_ready)

func on_level_m1():
	level = -1
	
func on_teleport_ready():
	tel_ready = true

func _on_area_entered(hitbox: HitBox) -> void:
	
		if $"../door_cave_with_door_open".visible == true or $"../door_cave_both_open".visible == true or $"../cave_cave_with_second_closed".visible == true or $"../cave_cave_with_second_open".visible == true or $"../door_door_with_second_closed".visible == true or $"../door_door_with_second_open" .visible == true:
			
			$"../Player/AnimatedSprite2D".animation = "walk_down"
			if level == 1:
				Narrative.enter_level_2()
				level = 2
				$"../Player".position = Vector2i(-167,-200)
				$"../tower_floor/Control_Torch/torch_1".hide()
				$"../tower_floor/Control_Torch/torch_2".hide()
				$"../tower_floor/Control_Torch/torch_3".hide()
				$"../tower_floor/Control_Torch/torch_4".hide()
				$"../tower_floor/Control_Torch/torch_5".hide()
				$"../tower_floor/Control_Torch/torch_6".hide()
				Narrative.torch_hide.emit()
				print("hide")
			elif level == 2:
				level = 1
				Narrative.enter_level_1()
				$"../Player".position = Vector2i(-167,-200)
				$"../tower_floor/Control_Torch/torch_1".show()
				$"../tower_floor/Control_Torch/torch_2".show()
				$"../tower_floor/Control_Torch/torch_3".show()
				$"../tower_floor/Control_Torch/torch_4".show()
				$"../tower_floor/Control_Torch/torch_5".show()
				$"../tower_floor/Control_Torch/torch_6".show()
				print("show")
				Narrative.torch_show.emit()
			elif level == -1:
				level = 1
				Narrative.enter_level_1()
				$"../Player".position = Vector2i(238,-200)
				$"../tower_floor/Control_Torch/torch_1".show()
				$"../tower_floor/Control_Torch/torch_2".show()
				$"../tower_floor/Control_Torch/torch_3".show()
				$"../tower_floor/Control_Torch/torch_4".show()
				$"../tower_floor/Control_Torch/torch_5".show()
				$"../tower_floor/Control_Torch/torch_6".show()
				Narrative.torch_show.emit()
				print("show")
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

			
			
