extends CharacterBody2D


@onready var menu = get_tree().get_root().get_node("Menu")
@onready var arrow = get_node("../arrow")
var speed = 50

var right : Vector2 = Vector2(1, 0)
var left : Vector2 = Vector2(-1, 0)
var up : Vector2 = Vector2(0, -1)
var down : Vector2 = Vector2(0, 1)


func _ready():
	print(arrow)
	
func _process(delta: float) -> void:
	
	if arrow.can_move():
		velocity = left.normalized() * speed	
		move_and_slide()

<<<<<<< Updated upstream
	shoot()
=======
				if abs(velocity.x) > abs(velocity.y):
					if velocity.x > 0:
						dominant_direction = "Right"
					else:
						dominant_direction = "Left"
				else:
					if velocity.y > 0:
						dominant_direction = "Down"
					else:
						dominant_direction = "Up"

				if dominant_direction == "Right":
					$AnimatedSprite2D_2.animation = "walk_right"
				elif dominant_direction == "Left":
					$AnimatedSprite2D_2.animation = "walk_left"
				elif dominant_direction == "Up":
					$AnimatedSprite2D_2.animation = "walk_up"
				elif dominant_direction == "Down":
					$AnimatedSprite2D_2.animation = "walk_down"
					
				move_and_slide()
		
	if 	!$AnimatedSprite2D_2/near_hitbox.is_near_enemy:
		if is_instance_valid($"../Player"):
			$"../Player/AnimatedSprite2D/HurtBox_Player".monitoring = true
			shoot() 
	else:
		#$"../Player/AnimatedSprite2D/HurtBox_Player".monitoring = false
		if !arrow.arrow_is_moving:
			$"../arrow".position = (self.position) - (Vector2(115, -119))
		else:
			shoot()
				
			#previous_dir = 	arrow.arrow_dir()
			
		#$"../arrow".arrow_is_moving = false
>>>>>>> Stashed changes

	

func shoot():
	if arrow.arrow_dir() == 1:
		arrow.arrow_shoot(right)
	elif arrow.arrow_dir() == 2:
		arrow.arrow_shoot(left)
	elif arrow.arrow_dir() == 3:
		arrow.arrow_shoot(up)
	elif arrow.arrow_dir() == 4:
		arrow.arrow_shoot(down)
