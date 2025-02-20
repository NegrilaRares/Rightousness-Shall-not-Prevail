extends Label

# UI element references
var ui_text_right: Label = null
var ui_text_end: Label = null
var ui_image_sword: TextureRect = null
var ui_title_sword: Label = null
var ui_title_narrator: Label = null 

# TileMap layer references
var tile_single_door_closed: TileMapLayer = null
var tile_single_door_open: TileMapLayer = null
var tile_door_cave_closed: TileMapLayer = null
var tile_door_cave_with_door_open: TileMapLayer = null
var tile_door_cave_with_cave_open: TileMapLayer = null
var tile_door_cave_both_open: TileMapLayer = null
var tile_cave_cave_with_second_closed: TileMapLayer = null
var tile_cave_cave_with_second_open: TileMapLayer = null
var tile_boss_cave_open: TileMapLayer = null
var tile_boss_door_open: TileMapLayer = null
var tile_tower_floor: TileMapLayer = null
var tile_floor: TileMapLayer = null


var local_game_start : bool = false
var key_pressed_last_frame: bool = false
var local_stage_text_click : int = 0
const CHAR_READ_RATE = 0.5


signal narrator_end_0
signal level_1
signal level_1_up
signal level_1_down 
signal level_2


# Public function to dynamically register UI elements
func set_ui_elements(text_right: Label, text_end: Label, image_sword: TextureRect, title_sword: Label, title_narrator: Label):
	ui_text_right = text_right
	ui_text_end = text_end
	ui_image_sword = image_sword
	ui_title_sword = title_sword
	ui_title_narrator = title_narrator
	
# Function to dynamically register TileMap layers
func set_stage_elements(
	single_door_closed: TileMapLayer, single_door_open: TileMapLayer,
	door_cave_closed: TileMapLayer, door_cave_with_door_open: TileMapLayer,
	door_cave_with_cave_open: TileMapLayer, door_cave_both_open: TileMapLayer,
	cave_cave_with_second_closed: TileMapLayer, cave_cave_with_second_open: TileMapLayer,
	boss_cave_open: TileMapLayer, boss_door_open: TileMapLayer,
	tower_floor: TileMapLayer, floor: TileMapLayer):
		
	tile_single_door_closed = single_door_closed
	tile_single_door_open = single_door_open
	tile_door_cave_closed = door_cave_closed
	tile_door_cave_with_door_open = door_cave_with_door_open
	tile_door_cave_with_cave_open = door_cave_with_cave_open
	tile_door_cave_both_open = door_cave_both_open
	tile_cave_cave_with_second_closed = cave_cave_with_second_closed
	tile_cave_cave_with_second_open = cave_cave_with_second_open
	tile_boss_cave_open = boss_cave_open
	tile_boss_door_open = boss_door_open
	tile_tower_floor = tower_floor
	tile_floor = floor


func _ready():
	Menu.game_start.connect(on_button_play_pressed_received)
	
func on_button_play_pressed_received():
	local_game_start = true
	text_clear()
	await get_tree().create_timer(0.5).timeout
	change_text()
	
func _process(_delta):
	get_input()
	
func get_input():
	if local_game_start:
		var key_pressed_now = Input.is_key_pressed(KEY_R)
		
		# Ensure key press is only counted once per press
		if key_pressed_now and not key_pressed_last_frame:
			local_stage_text_click += 1
			change_text()
		
		key_pressed_last_frame = key_pressed_now  # Store current key state

func text_clear():
	if is_instance_valid(ui_text_right): 
		ui_text_right.text = ""
	if is_instance_valid(ui_text_end): 
		ui_text_end.hide()
	if is_instance_valid(ui_image_sword): 
		ui_image_sword.hide()
	if is_instance_valid(ui_title_sword): 
		ui_title_sword.hide()
	if is_instance_valid(ui_title_narrator): 
		ui_title_narrator.hide()

func change_text():
	var display_text : String
	if is_instance_valid(ui_text_right): 
		ui_text_right.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	match local_stage_text_click:
		### NARRATOR START SEGMENT
		0:
			if is_instance_valid(ui_text_end): 
				ui_text_end.show()
			if is_instance_valid(ui_title_narrator): 
				ui_title_narrator.show()
			display_text = "Hello There..?
			Have u come to 
			see the battle
			of this
			young man
			unfold?"
		1:
			display_text = "
			Did it change yet?\n... \nOh Hello"
		### DRAGON MOVEMENT TUTORIAL SEGMENT
		2:
			if is_instance_valid(ui_title_narrator): 
				ui_title_narrator.hide()
			if is_instance_valid(ui_text_right): 
				ui_text_right.text = ""
				
			narrator_end_0.emit()
			
			await get_tree().create_timer(0.3).timeout
			
			hide_all_stage_elements()
			if is_instance_valid(tile_single_door_closed): 
				tile_single_door_open.show()
			if is_instance_valid(tile_floor): 
				tile_floor.show()
			
			await get_tree().create_timer(1).timeout
			
			if is_instance_valid(ui_image_sword): 
				ui_image_sword.show()
			if is_instance_valid(ui_title_sword): 
				ui_title_sword.show()
			
			display_text = "WHy wont this work"
		_:
			if is_instance_valid(ui_title_narrator): 
				ui_title_narrator.hide()
			if is_instance_valid(ui_title_sword): 
				ui_title_sword.hide()
			if is_instance_valid(ui_text_end): 
				ui_text_end.hide()
			if is_instance_valid(ui_image_sword): 
				ui_image_sword.hide()
			if is_instance_valid(ui_text_right): 
				ui_text_right.show()
				ui_text_right.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			display_text = "End 
			of 
			Story"
				
	if is_instance_valid(ui_text_right):
		ui_text_right.text = display_text
		ui_text_right.visible_ratio = 0
		create_tween().tween_property(ui_text_right, "visible_ratio", 1, 2)
		
		
		
		
func hide_all_stage_elements():
	if is_instance_valid(tile_single_door_closed): 
		tile_single_door_closed.hide()
	if is_instance_valid(tile_single_door_open): 
		tile_single_door_open.hide()
	if is_instance_valid(tile_door_cave_closed): 
		tile_door_cave_closed.hide()
	if is_instance_valid(tile_door_cave_with_door_open): 
		tile_door_cave_with_door_open.hide()
	if is_instance_valid(tile_door_cave_with_cave_open): 
		tile_door_cave_with_cave_open.hide()
	if is_instance_valid(tile_door_cave_both_open): 
		tile_door_cave_both_open.hide()
	if is_instance_valid(tile_cave_cave_with_second_closed): 
		tile_cave_cave_with_second_closed.hide()
	if is_instance_valid(tile_cave_cave_with_second_open): 
		tile_cave_cave_with_second_open.hide()
	if is_instance_valid(tile_boss_cave_open): 
		tile_boss_cave_open.hide()
	if is_instance_valid(tile_boss_door_open): 
		tile_boss_door_open.hide()
	if is_instance_valid(tile_tower_floor): 
		tile_tower_floor.hide()
	if is_instance_valid(tile_floor): 
		tile_floor.hide()
		
		
func enter_level_1():
	hide_all_stage_elements()
	if is_instance_valid(tile_door_cave_closed): 
		tile_door_cave_closed.show()
	if is_instance_valid(tile_tower_floor): 
		tile_tower_floor.show()
	Narrative.level_1.emit()
	#local_stage_text_click = // whatever comes after the tutorial tuhinmng dont forget await after teleport
	
func enter_level_2():
	hide_all_stage_elements()
	if is_instance_valid(tile_single_door_closed): 
		tile_single_door_closed.show()
	if is_instance_valid(tile_tower_floor): 
		tile_tower_floor.show()
	Narrative.level_2.emit()
