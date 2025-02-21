extends CharacterBody2D

var speed : int
var local_game_start : bool = false
var local_narrator_start_dialogue_end : bool = false
var input_dir

func _ready():
	speed = 200
	Menu.game_start.connect(on_button_play_pressed_received)
	Menu.level_1.connect(on_level_1_received)
	Narrative.narrator_end_0.connect(on_narrator_start_dialogue_end_received)
	
func on_button_play_pressed_received():
	local_game_start = true	
#
func on_narrator_start_dialogue_end_received():
	local_narrator_start_dialogue_end = true

func on_level_1_received():
	local_game_start = false
	await get_tree().create_timer(0.3).timeout
	local_game_start = true
	

func get_input():

	if local_game_start && local_narrator_start_dialogue_end:
	
		#keyboard input
		input_dir = Input.get_vector("left", "right", "up", "down")
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

	get_input()
	move_and_slide()
