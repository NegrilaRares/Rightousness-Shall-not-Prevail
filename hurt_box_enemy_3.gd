extends Area2D

var in_range = false
@onready var enemy_model = $"../.."

func _init() -> void:
	collision_layer = 0 # where the box is 
	collision_mask = 2 # where it looks for collisions


func _ready() -> void:
	# listen for when somehting is inside thr HurtBox 2D area

	# MEMO: No need to update to check for specific Hitbox as the enemy Hitboxes will reside on a different layer

	connect("area_entered", self._on_area_entered)
	connect("area_exited", self._on_area_exited)

func _on_area_entered(hitbox: HitBox) -> void:

	in_range = true
		
func _on_area_exited(hitbox: HitBox) -> void:
		
	in_range = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && in_range:
		enemy_model.call_deferred("queue_free") # removes enemy node and all children
