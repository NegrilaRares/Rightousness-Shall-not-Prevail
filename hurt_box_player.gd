extends Area2D

var in_range = false
var in_melee_range = false
var in_melee_range_2 = false
@onready var player = $"../.."
var hitbox_inside
@onready var arrowHitbox = $"../../../arrow/arrow_sprite/HitBox_Arrow"
@onready var arrowHitbox2 = $"../../../arrow/arrow_sprite/HitBox_Arrow_2"
@onready var meleeHitbox_1 = $"../../../Player4/AnimatedSprite2D_2/Hitbox_Melee4"
@onready var meleeHitbox_2 = $"../../../Player3/AnimatedSprite2D_2/Hitbox_Melee3"
@onready var timer = $"../../../Timer"
@onready var timer_2 = $"../../../Timer2"

func _init() -> void:
	collision_layer = 0 # where the box is 
	collision_mask = 5 # where it looks for collisions

func _ready() -> void:

	connect("area_entered", self._on_area_entered)
	connect("area_exited", self._on_area_exited)
	
	timer_2.connect("timeout", self._on_melee_timer_2_timeout)
	timer.connect("timeout", self._on_melee_timer_timeout)

func _on_area_entered(hitbox: Area2D) -> void:
	hitbox_inside = hitbox
	in_range = true
	
	

	if hitbox_inside == meleeHitbox_1:
		in_melee_range = true
		timer.start(0.8)
		
	if hitbox_inside == meleeHitbox_2:
		in_melee_range_2 = true
		timer_2.start(0.8) 

func _on_area_exited(hitbox: Area2D) -> void:
	if hitbox_inside == hitbox:
		hitbox_inside = null
		in_range = false
	

		if hitbox == meleeHitbox_1:
			in_melee_range = false
			timer.stop()
			
		if hitbox == meleeHitbox_2:
			in_melee_range_2 = false
			timer_2.stop()
func _on_melee_timer_timeout() -> void:

	if hitbox_inside == meleeHitbox_1:
		player.call_deferred("queue_free")
		$"../../../Panel".show()

func _on_melee_timer_2_timeout() -> void:

	if hitbox_inside == meleeHitbox_2:
		player.call_deferred("queue_free")
		$"../../../Panel".show()

func _process(delta: float) -> void:

	if hitbox_inside == arrowHitbox && hitbox_inside != null:
		print(hitbox_inside)
		$"../../../Panel".show()
		player.call_deferred("queue_free")
