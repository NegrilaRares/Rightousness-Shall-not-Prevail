extends Area2D

var in_range = false
@onready var player = $"../.."
var hitbox_inside
@onready var arrowHitbox = $"../../../arrow/arrow_sprite/HitBox_Arrow"

func _init() -> void:
	collision_layer = 0 # where the box is 
	collision_mask = 4 # where it looks for collisions


func _ready() -> void:
	# listen for when somehting is inside thr HurtBox 2D area

	# MEMO: No need to update to check for specific Hitbox as the enemy Hitboxes will reside on a different layer

	connect("area_entered", self._on_area_entered)
	connect("area_exited", self._on_area_exited)

func _on_area_entered(hitbox: Area2D) -> void:

	player.call_deferred("queue_free") 

	hitbox_inside = hitbox
	in_range = true
		
func _on_area_exited(hitbox: Area2D) -> void:
	
	if hitbox_inside == hitbox:
		hitbox_inside = null
		
	in_range = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if hitbox_inside == arrowHitbox:
		player.call_deferred("queue_free")  # removes enemy node and all children
