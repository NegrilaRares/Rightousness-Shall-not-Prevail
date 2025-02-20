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

	shoot()

	

func shoot():
	if arrow.arrow_dir() == 1:
		arrow.arrow_shoot(right)
	elif arrow.arrow_dir() == 2:
		arrow.arrow_shoot(left)
	elif arrow.arrow_dir() == 3:
		arrow.arrow_shoot(up)
	elif arrow.arrow_dir() == 4:
		arrow.arrow_shoot(down)
