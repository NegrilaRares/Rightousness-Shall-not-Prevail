extends CharacterBody2D

var speed : int
var game_start = false;

func _ready():
	speed = 200



func get_input():
	
	
	if game_start :
	
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


func _on_button_play_pressed() -> void:
	
	game_start = true;
	
	$/root/Menu/walls/button_exit.hide();
	$/root/Menu/walls/button_play.hide();
	
	pass # Replace with function body.
