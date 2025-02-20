extends TileMapLayer

var torch_1_state = true
var torch_2_state = false
var torch_3_state = true
var torch_4_state = false
var torch_5_state = false
var torch_6_state = true


var local_known_level : int = 10
var up = true
var down = false

func _ready():
	Narrative.level_1.connect(on_level_1_started_received)

func on_level_1_started_received():
	local_known_level = 1
func _process(_delta):
	if local_known_level == 1:
		
		if torch_1_state == true and torch_2_state == true and torch_3_state == true and torch_4_state == true and torch_5_state == true and torch_6_state == true:
			up = true
			down = false
		elif torch_1_state == false and torch_2_state == false and torch_3_state == false and torch_4_state == false and torch_5_state == false and torch_6_state == false:
			down = true
			up = false
		#else:
			#down = false
			#up = false
			#$"../door_cave_closed".show()
			
		if up == true and down == false:
			$"../door_cave_closed".hide()
			$"../door_cave_with_door_open".show()
			
		if up == false and down == true:
			$"../door_cave_closed".hide()
			$"../door_cave_with_cave_open".show()
			
		$Control_Torch.show()
		$Control_Torch/torch_1/AnimationPlayer.play("lit")
		$Control_Torch/torch_2/AnimationPlayer.play("lit")
		$Control_Torch/torch_3/AnimationPlayer.play("lit")
		$Control_Torch/torch_4/AnimationPlayer.play("lit")
		$Control_Torch/torch_5/AnimationPlayer.play("lit")
		$Control_Torch/torch_6/AnimationPlayer.play("lit")
	
		if torch_1_state:
			$Control_Torch/torch_1.animation = "on"
			$Control_Torch/torch_1/AnimationPlayer.play("lit")
		elif !torch_1_state:
			$Control_Torch/torch_1.animation = "off"
			$Control_Torch/torch_1/AnimationPlayer.play("lit")
			
		if torch_2_state:
			$Control_Torch/torch_2.animation = "on"
			$Control_Torch/torch_2/AnimationPlayer.play("lit")
		elif !torch_2_state:
			$Control_Torch/torch_2.animation = "off"
			$Control_Torch/torch_2/AnimationPlayer.play("lit")
			
		if torch_3_state:
			$Control_Torch/torch_3.animation = "on"
			$Control_Torch/torch_3/AnimationPlayer.play("lit")
		elif !torch_3_state:
			$Control_Torch/torch_3.animation = "off"
			$Control_Torch/torch_3/AnimationPlayer.play("lit")
			
		if torch_4_state:
			$Control_Torch/torch_4.animation = "on"
			$Control_Torch/torch_4/AnimationPlayer.play("lit")
		elif !torch_4_state:
			$Control_Torch/torch_4.animation = "off"
			$Control_Torch/torch_4/AnimationPlayer.play("lit")
			
		if torch_5_state:
			$Control_Torch/torch_5.animation = "on"
			$Control_Torch/torch_5/AnimationPlayer.play("lit")
		elif !torch_5_state:
			$Control_Torch/torch_5.animation = "off"
			$Control_Torch/torch_5/AnimationPlayer.play("lit")
			
		if torch_6_state:
			$Control_Torch/torch_6.animation = "on"
			$Control_Torch/torch_6/AnimationPlayer.play("lit")
		elif !torch_6_state:
			$Control_Torch/torch_6.animation = "off"
			$Control_Torch/torch_6/AnimationPlayer.play("lit")
