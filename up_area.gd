extends Area2D

var in_range = false
@onready var enemy_model = $"../.."
@onready var arrow = $"../../../arrow"
var is_near_enemy = false
func _init() -> void:
	collision_layer = 0 # where the box is 
	collision_mask = 5 # where it looks for collisions


func _ready() -> void:
	# listen for when somehting is inside thr HurtBox 2D area

	# MEMO: No need to update to check for specific Hitbox as the enemy Hitboxes will reside on a different layer

	connect("area_entered", self._on_area_entered)
	connect("area_exited", self._on_area_exited)

func _on_area_entered(hitbox: Area2D) -> void:

	in_range = true
		
func _on_area_exited(hitbox: Area2D) -> void:
		
	in_range = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if in_range:
		is_near_enemy = true
		arrow.arrow_direction = 3
	else:
		is_near_enemy = false
