extends Node2D

signal game_start
signal level_1
	
func _on_button_play_pressed() -> void:
	$walls/button_play.hide()
	$walls/button_exit.hide()
	Menu.game_start.emit()
	
func _ready():
	Narrative.set_stage_elements(
		$single_door_closed,
		$single_door_open,
		$door_cave_closed,
		$door_cave_with_door_open,
		$door_cave_with_cave_open,
		$door_cave_both_open,
		$cave_cave_with_second_closed,
		$cave_cave_with_second_open,
		$boss_cave_open,
		$boss_door_open,
		$tower_floor,
		$floor,
		$door_door_with_second_closed,
		$door_door_with_second_open
	)
