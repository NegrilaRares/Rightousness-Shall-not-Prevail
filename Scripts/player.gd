extends CharacterBody2D

var speed : int
var local_game_start : bool = false

func _ready():
	speed = 200
	Menu.game_start.connect(on_button_play_pressed_received)
	
func on_button_play_pressed_received():
	local_game_start = true
	

func get_input():
	
	if local_game_start:
		#keyboard input
		var input_dir = Input.get_vector("left", "right", "up", "down")
		velocity = input_dir.normalized() * speed; 
		
		if Input.is_key_pressed(KEY_W):
			$AnimatedSprite2D.animation = "walk_up"
		if Input.is_key_pressed(KEY_A):
			$AnimatedSprite2D.animation = "walk_left"
		if Input.is_key_pressed(KEY_S):
			$AnimatedSprite2D.animation = "walk_down"
		if Input.is_key_pressed(KEY_D):
			$AnimatedSprite2D.animation = "walk_right"

func _physics_process(_delta):
	#player movement
	get_input()
	move_and_slide()
