extends TileMapLayer

var local_known_level : int = 10


func _ready():
	Narrative.level_1.connect(on_level_1_started_received)

func on_level_1_started_received():
	local_known_level = 1

func _process(_delta):
	if local_known_level == 1:
		$Control/torch_1/AnimationPlayer.play("lit")
	
