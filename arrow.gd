extends CharacterBody2D


var speed = 400
var delay = 100


var right : Vector2 = Vector2(1, 0)
var left : Vector2 = Vector2(-1, 0)
var up : Vector2 = Vector2(0, -1)
var down : Vector2 = Vector2(0, 1)

var dir : float
var spawnPos : Vector2
var spawnRot : float
const min_global_y = -210 #  up
const max_global_x = 310
const min_global_x = -510
const max_global_y = 250

var is_at_start = false
var arrow_is_moving = false
var is_destroyed = false

var arrow_direction = 2

func _ready():
	
	self.position = ($"../Player2".position) - (Vector2(115, -119))

	

func can_move() -> bool:
	return !arrow_is_moving

func _physics_process(delta: float):
	pass
	
func arrow_dir() -> int:
	return arrow_direction
	
func arrow_shoot(direction : Vector2) -> void:
	
	if self.position == ($"../Player2".position) - (Vector2(115, -119)):
		is_destroyed = false
	else:
		arrow_is_moving = true	
	
	if direction == right:
		$arrow_sprite.animation = "arrow_right"
	if direction == left:
		$arrow_sprite.animation = "arrow_left"
	if direction == up:
		$arrow_sprite.animation = "arrow_up"
	if direction == down:
		$arrow_sprite.animation = "arrow_down"
	
	
	

	velocity = direction.normalized() * speed
	
	
	
	if global_position.y <= min_global_y || global_position.x >= max_global_x || global_position.x <= min_global_x || global_position.y >= max_global_y:
		
		#if is_instance_valid($Player2):
			#$Player2.previous_dir = arrow_dir()
		
		self.position = ($"../Player2".position) - (Vector2(115, -119))
		is_destroyed = true
		arrow_is_moving = false
		is_at_start = true
	
	
	move_and_slide()
	
	is_at_start = false
	
	
	
