extends Area2D


var in_range = false

func _init() -> void:
	collision_layer = 0 
	collision_mask = 3


func _ready() -> void:
	connect("area_entered", self._on_area_entered)
	connect("area_exited", self._on_area_exited)

func _on_area_entered(hitbox: HitBox) -> void:
		in_range = true

func _on_area_exited(hitbox: HitBox) -> void:
		in_range = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and in_range:
		Narrative.torch_6_touched.emit()
