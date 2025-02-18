extends Node2D

signal game_start


func _on_button_play_pressed() -> void:
	$walls/button_play.hide()
	$walls/button_exit.hide()
	Menu.game_start.emit()
	pass
