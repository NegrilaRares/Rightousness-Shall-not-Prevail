extends CharacterBody2D


@onready var menu = get_tree().get_root().get_node("Menu")
var speed = 100

@onready var target = $"../Player"
@onready var enemy_hitbox = $"../Player4/AnimatedSprite2D_2/Hitbox_Melee4/CollisionShape2D"
@onready var player_hurtbox = $"../Player/AnimatedSprite2D/HurtBox_Player"

var right : Vector2 = Vector2(1, 0)
var left : Vector2 = Vector2(-1, 0)
var up : Vector2 = Vector2(0, -1)
var down : Vector2 = Vector2(0, 1)
var move = false

func _ready():
	move = false
	$".".hide()
	$AnimatedSprite2D_2/HurtBox_Enemy_3/CollisionShape2D_Hurt.set_deferred("disabled", true)
	$AnimatedSprite2D_2/Hitbox_Melee4/CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D_2.set_deferred("disabled", true)
	Narrative.entered_level_2.connect(on_active)
	Narrative.exited_level_2.connect(on_inactive)
	
func on_active():
	move = true
	$".".show()
	$AnimatedSprite2D_2/HurtBox_Enemy_3/CollisionShape2D_Hurt.set_deferred("disabled", false)
	$AnimatedSprite2D_2/Hitbox_Melee4/CollisionShape2D.set_deferred("disabled", false)
	$CollisionShape2D_2.set_deferred("disabled", false)
	
func on_inactive():
	move = false
	$".".hide()
	$AnimatedSprite2D_2/HurtBox_Enemy_3/CollisionShape2D_Hurt.set_deferred("disabled", true)
	$AnimatedSprite2D_2/Hitbox_Melee4/CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D_2.set_deferred("disabled", true)
	
func _process(delta: float) -> void:
	if is_instance_valid(target) && player_hurtbox.in_melee_range == false:
		var direction = (target.global_position - global_position).normalized()	

		
		var initial_velocity = direction * speed
		var steering = (initial_velocity - velocity) * delta * 2.5
		velocity += steering
		
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
			$AnimatedSprite2D_2/Hitbox_Melee4/CollisionShape2D/AnimatedSprite2D.animation="melee_right"
			enemy_hitbox.position.x = 57
			enemy_hitbox.position.y = 10
			
		elif dominant_direction == "Left":
			$AnimatedSprite2D_2.animation = "walk_left"
			$AnimatedSprite2D_2/Hitbox_Melee4/CollisionShape2D/AnimatedSprite2D.animation="melee_left"
			enemy_hitbox.position.x = -53
			enemy_hitbox.position.y = 10
		elif dominant_direction == "Up":
			$AnimatedSprite2D_2.animation = "walk_up"
			$AnimatedSprite2D_2/Hitbox_Melee4/CollisionShape2D/AnimatedSprite2D.animation="melee_up"
			enemy_hitbox.position.x = 0
			enemy_hitbox.position.y = -44
		elif dominant_direction == "Down":
			$AnimatedSprite2D_2.animation = "walk_down"
			$AnimatedSprite2D_2/Hitbox_Melee4/CollisionShape2D/AnimatedSprite2D.animation="melee_down"
			enemy_hitbox.position.x = 0
			enemy_hitbox.position.y = 63

		if move == true:
			move_and_slide()
