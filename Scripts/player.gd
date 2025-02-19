extends CharacterBody2D

var speed : int
var local_game_start : bool = false


func _ready():
	speed = 200
	Menu.game_start.connect(on_button_play_pressed_received)
	
func on_button_play_pressed_received():
	local_game_start = true	

func get_input():

	if local_game_start :
	
		#keyboard input
		var input_dir = Input.get_vector("left", "right", "up", "down")
		velocity = input_dir.normalized() * speed
		
		
		# Change Sprite + Attack HitBox direction (relative to player node (parent) )
		
		if Input.is_key_pressed(KEY_W):
			$AnimatedSprite2D.animation = "walk_up"
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.x = 533
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.y = 654
			#print($AnimatedSprite2D/HitBox/CollisionShape2D.position)	
			
		if Input.is_key_pressed(KEY_A):
			$AnimatedSprite2D.animation = "walk_left"
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.x = 489
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.y = 695
			#print($AnimatedSprite2D/HitBox/CollisionShape2D.position)	
		if Input.is_key_pressed(KEY_S):
			$AnimatedSprite2D.animation = "walk_down"
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.x = 532
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.y = 726
			#print($AnimatedSprite2D/HitBox/CollisionShape2D.position)	
		if Input.is_key_pressed(KEY_D):
			$AnimatedSprite2D.animation = "walk_right"
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.x = 576
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.y = 692
			#print($AnimatedSprite2D/HitBox/CollisionShape2D.position)	
	

func _physics_process(_delta):
	#player movement
	get_input()
	move_and_slide()
