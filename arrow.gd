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

<<<<<<< Updated upstream
var arrow_is_moving = false
=======
var is_at_start = false
var arrow_is_moving = false
var is_destroyed = false
>>>>>>> Stashed changes

var arrow_direction = 1

func _ready():
	
	print (position)
	print("/////////////////")
	print($"../Player2".position)
	
	#self.global_position = Vector2($"../Player2".global_position.x + 305, $"../Player2".global_position.y - 431)
	self.position = ($"../Player2".position) - (Vector2(115, -119))

	
	print (position)
	print("*******************88")
	print($"../Player2".position)
	

func can_move() -> bool:
	return !arrow_is_moving

func _physics_process(delta: float):
	pass
	
func arrow_dir() -> int:
	return arrow_direction
	
func arrow_shoot(direction : Vector2) -> void:
	
<<<<<<< Updated upstream
=======
	if self.position == ($"../Player2".position) - (Vector2(115, -119)):
		is_destroyed = false
	else:
		arrow_is_moving = true	
	
>>>>>>> Stashed changes
	if direction == right:
		$arrow_sprite.animation = "arrow_right"
	if direction == left:
		$arrow_sprite.animation = "arrow_left"
	if direction == up:
		$arrow_sprite.animation = "arrow_up"
	if direction == down:
		$arrow_sprite.animation = "arrow_down"			
	
	
	
	print("arrow fun called")

	velocity = direction.normalized() * speed
	
	print(global_position)
	
	if global_position.y <= min_global_y || global_position.x >= max_global_x || global_position.x <= min_global_x || global_position.y >= max_global_y:
		if self != null:
			#self.hide()
			print("arrow destoyed")
		#	self.global_position = Vector2(421, -644)
		self.visible = false
		
		if delay <= 0:
			self.visible = true
			delay = 100
			if arrow_direction == 4:
				arrow_direction = 1
			else:
				arrow_direction += 1	
			
			self.position = ($"../Player2".position) - (Vector2(115, -119))
		else:
			delay -= 1
		arrow_is_moving = false
<<<<<<< Updated upstream

=======
		is_at_start = true
	
>>>>>>> Stashed changes
	
	move_and_slide()
	
	
	
