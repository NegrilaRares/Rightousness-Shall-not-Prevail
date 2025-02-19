extends Label

var local_game_start : bool = false
var local_stage_text_click : int = 0
const CHAR_READ_RATE = 0.5

func _ready():
	Menu.game_start.connect(on_button_play_pressed_received)
	
func on_button_play_pressed_received():
	local_game_start = true
	text_clear()
	await get_tree().create_timer(1).timeout
	change_text()
	
func _process(_delta):
	get_input()
	
func get_input():
	
	if local_game_start:
		if Input.is_key_pressed(KEY_R):
			local_stage_text_click = local_stage_text_click + 1
			change_text()

func text_clear():
	$"../walls/TextboxContainer/MarginContainer/VBoxContainer/textRight".text = ""
	$"../walls/TextboxContainer/MarginContainer/VBoxContainer/textEnd".hide()
	$"../walls/imageSword".hide()
	$"../walls/TextboxContainer/Panel/titleSword".hide()
	$"../walls/TextboxContainer/Panel/titleNarator".hide()

func change_text():
	var display_text : String
	match local_stage_text_click:
		0:
			display_text = "Hello There..?
			Have u come to 
			see the battle
			of this
			young man
			unfold?"
			$"../walls/TextboxContainer/MarginContainer/VBoxContainer/textEnd".show()
			$"../walls/TextboxContainer/Panel/titleNarator".show()
			$"../walls/TextboxContainer/MarginContainer/VBoxContainer/textRight".text = display_text
		1:
			display_text = "
			Did it change yet?\n... \nOh Hello"
			$"../walls/TextboxContainer/MarginContainer/VBoxContainer/textRight".text = display_text
		_:
			display_text = "
			Did it change yet?\n... \nOh Hello"
			$"../walls/TextboxContainer/MarginContainer/VBoxContainer/textRight".text = display_text
		#3:
		#4:
	$"../walls/TextboxContainer/MarginContainer/VBoxContainer/textRight".visible_ratio = 0;
	create_tween().tween_property($"../walls/TextboxContainer/MarginContainer/VBoxContainer/textRight", "visible_ratio", 1, 2)
	
