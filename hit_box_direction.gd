extends Area2D


@export var damage: int  = 0 #maybe use this later for enemies with a bigger healthpool

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	collision_layer = 5 # where the box is 
	collision_mask = 0 # where it looks for collisions


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
