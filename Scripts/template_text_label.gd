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
var tile_door_door_with_second_closed : TileMapLayer = null
var tile_door_door_with_second_open : TileMapLayer = null


var local_game_start : bool = false
var local_level : int = 0
var local_level_1 : bool = false
var local_level_2 : bool = false
var local_level_m1 : bool = false
var key_pressed_last_frame: bool = false
var local_stage_text_click : int = 0
const CHAR_READ_RATE = 0.5
var read_ready = true


signal narrator_end_0
signal level_1
signal level_1_up
signal level_1_down 
signal level_2
signal level_m1
signal ready_teleport
signal torch_hide
signal torch_show
signal entered_level_2
signal exited_level_2
signal entered_level_m1
signal exited_level_m1

signal torch_1_touched
signal torch_2_touched
signal torch_3_touched
signal torch_4_touched
signal torch_5_touched
signal torch_6_touched


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
	tower_floor: TileMapLayer, floor: TileMapLayer,
	door_door_with_second_closed: TileMapLayer, door_door_with_second_open: TileMapLayer):
		
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
	tile_door_door_with_second_closed = door_door_with_second_closed
	tile_door_door_with_second_open = door_door_with_second_open


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
		await get_tree().create_timer(0.5).timeout
		var key_pressed_now = Input.is_key_pressed(KEY_R)
		
		# Ensure key press is only counted once per press
		if key_pressed_now and not key_pressed_last_frame and read_ready:
			if local_stage_text_click < 7:
				local_stage_text_click += 1
				change_text()
			elif local_stage_text_click > 7 and local_level == 1:
				local_stage_text_click = 9
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
			What is 
			happening
			you ask?"
		2:
			display_text = "
			Oh... Well not
			long ago
			this lad up 
			and found 
			himself
			an Ancient
			\"Holy Sword\"."
		3:
			display_text = "The sword guided
			him here through 
			thick and thin
			to scrap the plan of an 
			evil wizard 
			..."
		4:
			display_text = "who wishes
			to unleash
			the evil dragon
			of old upon us all."
		5:
			display_text = "Now the Hero 
			begins his 
			final challange.
			As clueless as
			he may be...
			may peace 
			find us."
		### DRAGON MOVEMENT TUTORIAL SEGMENT
		6:
			read_ready = false
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
			
			display_text = "We've reached
			the gate 
			of the tower
			where the dragon
			once resided."
			read_ready = true
		7:
			display_text = "Quick now!
			Use 
			W A S D 
			to move around.
			We have got
			no time to waste."
			
		8:
			display_text = "Ahaa
			Simple Torch
			puzzle!
			Listen here kid
			use the flames
			from the blade
			by LEFT CLICKing
			..."
		9:
			display_text = "
			to light up
			all the 
			remainging 
			torches."
			if is_instance_valid(ui_text_end): 
				ui_text_end.hide()
		10:
			display_text = "There he is!
			Finish his
			henchmen
			and get to the 
			evil bastard 
			before
			he unleashes 
			his 
			unsealing spell."
			if is_instance_valid(ui_text_end): 
				ui_text_end.hide()
		11:
			display_text = "wHaT
			aRe YOu dOIng?!!
			Get away from 
			me!
			Why would you
			extinguish the 
			torches?
			NOOO 
			STAY AWAY!!!!"
			if is_instance_valid(ui_text_end): 
				ui_text_end.hide()
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
		
		create_tween().tween_property(ui_text_right, "visible_ratio", 1, len(display_text)* 0.02)
		
		
		
		
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
	if local_level == 0:
		if is_instance_valid(tile_door_cave_closed): 
			tile_door_cave_closed.show()
		if is_instance_valid(tile_tower_floor): 
			tile_tower_floor.show()
		Narrative.level_1.emit()
		if local_level_1 == false:
			local_level_1 = true
			local_stage_text_click = 8
			change_text()
		#local_stage_text_click = // whatever comes after the tutorial tuhinmng dont forget await after teleport
	if local_level == 1:
		print("gg")
	if local_level == 2:
		Narrative.exited_level_2.emit()
		if is_instance_valid(tile_door_cave_with_door_open): 
			tile_door_cave_with_door_open.show()
		if is_instance_valid(tile_tower_floor): 
			tile_tower_floor.show()
		if is_instance_valid(tile_door_door_with_second_closed): 
			tile_door_door_with_second_closed.hide()
		
		Narrative.level_1.emit()
	if local_level == -1:
		Narrative.exited_level_m1.emit()
		if is_instance_valid(tile_door_cave_with_cave_open): 
			tile_door_cave_with_cave_open.show()
		if is_instance_valid(tile_tower_floor): 
			tile_tower_floor.show()
		
		Narrative.level_1.emit()
		
	local_level = 1
	
func enter_level_2():
	local_level = 2
	Narrative.entered_level_2.emit()
	hide_all_stage_elements()
	if is_instance_valid(tile_door_cave_with_door_open): 
		tile_door_cave_with_door_open.show()
	if is_instance_valid(tile_tower_floor): 
		tile_tower_floor.show()
	if local_level_2 == false:
		local_level_2 = true
		local_stage_text_click = 10
		change_text()
		
	Narrative.level_2.emit()
	await get_tree().create_timer(2).timeout
	Narrative.ready_teleport.emit()

func enter_level_m1():
	local_level = -1
	Narrative.entered_level_m1.emit()
	hide_all_stage_elements()
	if is_instance_valid(tile_cave_cave_with_second_closed): 
		tile_cave_cave_with_second_closed.show()
	if is_instance_valid(tile_tower_floor): 
		tile_tower_floor.show()
	if local_level_m1 == false:
		local_level_m1 = true
		local_stage_text_click = 11
		change_text()
		
	Narrative.level_m1.emit()
	await get_tree().create_timer(2).timeout
	Narrative.ready_teleport.emit()	
