extends CharacterBody2D


@onready var menu = get_tree().get_root().get_node("Menu")
@onready var arrow = get_node("../arrow")
@onready var target = $"../Player/AnimatedSprite2D"
var input_dir = right
@onready var previous_dir = arrow.arrow_direction
var move = false

var speed = 170

var right : Vector2 = Vector2(1, 0)
var left : Vector2 = Vector2(-1, 0)
var up : Vector2 = Vector2(0, -1)
var down : Vector2 = Vector2(0, 1)


func _ready():
	move = false
	$".".hide()
	$AnimatedSprite2D_2/HurtBox_Enemy/CollisionShape2D_Hurt.set_deferred("disabled", true)
	$AnimatedSprite2D_2/near_hitbox/CollisionShape2D_3.set_deferred("disabled", true)
	$AnimatedSprite2D_2/right_area/CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D_2/left_area/CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D_2/down_area/CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D_2/up_area/CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D_2.set_deferred("disabled", true)
	Narrative.entered_level_2.connect(on_active)
	Narrative.exited_level_2.connect(on_inactive)
	
func on_active():
	move = true
	$".".show()
	$AnimatedSprite2D_2/HurtBox_Enemy/CollisionShape2D_Hurt.set_deferred("disabled", false)
	$AnimatedSprite2D_2/near_hitbox/CollisionShape2D_3.set_deferred("disabled", false)
	$AnimatedSprite2D_2/right_area/CollisionShape2D.set_deferred("disabled", false)
	$AnimatedSprite2D_2/left_area/CollisionShape2D.set_deferred("disabled", false)
	$AnimatedSprite2D_2/down_area/CollisionShape2D.set_deferred("disabled", false)
	$AnimatedSprite2D_2/up_area/CollisionShape2D.set_deferred("disabled", false)
	$CollisionShape2D_2.set_deferred("disabled", false)
	
func on_inactive():
	move = false
	$".".hide()
	$AnimatedSprite2D_2/HurtBox_Enemy/CollisionShape2D_Hurt.set_deferred("disabled", true)
	$AnimatedSprite2D_2/near_hitbox/CollisionShape2D_3.set_deferred("disabled", true)
	$AnimatedSprite2D_2/right_area/CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D_2/left_area/CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D_2/down_area/CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D_2/up_area/CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D_2.set_deferred("disabled", true)
	
func _process(delta: float) -> void:
	if is_instance_valid($"../Player"):
		if $AnimatedSprite2D_2/near_hitbox.is_near_enemy:
			var input_dir
			if $"../Player".input_dir != null:
				input_dir = $"../Player".input_dir
				velocity = input_dir.normalized() * speed	
				
				var dominant_direction = ""

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
				
				if move == true:
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

	
func shoot():

	
	if previous_dir == arrow.arrow_dir():
		if arrow.arrow_dir() == 1:
			arrow.arrow_shoot(left)
			$AnimatedSprite2D_2.animation = "walk_left"
		elif arrow.arrow_dir() == 2:
			arrow.arrow_shoot(right)
			$AnimatedSprite2D_2.animation = "walk_right"
		elif arrow.arrow_dir() == 3:
			arrow.arrow_shoot(up)
			$AnimatedSprite2D_2.animation = "walk_up"
		elif arrow.arrow_dir() == 4:
			arrow.arrow_shoot(down)
			$AnimatedSprite2D_2.animation = "walk_down"

	if is_instance_valid($"../Player") && is_instance_valid($AnimatedSprite2D_2/HurtBox_Enemy):
		if $"../Player".input_dir != null && $AnimatedSprite2D_2/HurtBox_Enemy.in_range:
			input_dir = $"../Player".input_dir
			velocity = input_dir.normalized() * speed	
					
			var dominant_direction = ""

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
							
		

				

		
		elif arrow.is_destroyed:

			$"../arrow".position = (self.position) - (Vector2(115, -119))
			previous_dir = arrow.arrow_dir()
		elif arrow.arrow_is_moving:
			if previous_dir == 1:
				arrow.arrow_shoot(left)
			elif previous_dir == 2:
				arrow.arrow_shoot(right)
			elif previous_dir == 3:
				arrow.arrow_shoot(up)
			elif previous_dir == 4:
				arrow.arrow_shoot(down)
	
	
		#else:
			#if previous_dir == 1:
				#arrow.arrow_shoot(left)
			#elif previous_dir == 2:
				#arrow.arrow_shoot(right)
			#elif previous_dir == 3:
				#arrow.arrow_shoot(up)
			#elif previous_dir == 4:
				#arrow.arrow_shoot(down)
			#
	#else:
		#if !arrow.arrow_is_moving:
			#$"../arrow".position = (self.position) - (Vector2(115, -119))
			#previous_dir = arrow.arrow_dir()
		#else:
			#if previous_dir == 1:
				#arrow.arrow_shoot(left)
			#elif previous_dir == 2:
				#arrow.arrow_shoot(right)
			#elif previous_dir == 3:
				#arrow.arrow_shoot(up)
			#elif previous_dir == 4:
				#arrow.arrow_shoot(down)
					
		
