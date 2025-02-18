class_name hit_box
extends Area2D


@export var damage: int  = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_layer = 2
	collision_mask = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
