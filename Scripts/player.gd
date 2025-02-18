extends CharacterBody2D

var speed : int
var game_start = false

func _ready():
	speed = 200

func get_input():

	if game_start :
	
		var enemy = get_node("../Player2/AnimatedSprite2D_2")
		var player = $AnimatedSprite2D
	
		#keyboard input
		var input_dir = Input.get_vector("left", "right", "up", "down")
		velocity = input_dir.normalized() * speed
		
		
		# Change Sprite + Attack HitBox direction (relative to player node (parent) )
		
		if Input.is_key_pressed(KEY_W):
			$AnimatedSprite2D.animation = "walk_up"
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.x = -1
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.y = -17
			print($AnimatedSprite2D/HitBox/CollisionShape2D.position)	
			
		if Input.is_key_pressed(KEY_A):
			$AnimatedSprite2D.animation = "walk_left"
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.x = -32
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.y = 16
			print($AnimatedSprite2D/HitBox/CollisionShape2D.position)	
		if Input.is_key_pressed(KEY_S):
			$AnimatedSprite2D.animation = "walk_down"
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.x = -1
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.y = 49
			print($AnimatedSprite2D/HitBox/CollisionShape2D.position)	
		if Input.is_key_pressed(KEY_D):
			$AnimatedSprite2D.animation = "walk_right"
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.x = 32
			$AnimatedSprite2D/HitBox/CollisionShape2D.position.y = 16
			print($AnimatedSprite2D/HitBox/CollisionShape2D.position)	
	

func _physics_process(_delta):
	#player movement
	get_input()
	move_and_slide()

func _on_button_play_pressed() -> void:
	
	game_start = true
	
	$/root/Menu/walls/button_exit.hide()
	$/root/Menu/walls/button_play.hide()
	
