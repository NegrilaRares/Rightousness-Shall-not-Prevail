extends MarginContainer

func _ready() -> void:
	# Register the UI elements with the Narrative autoload
	Narrative.set_ui_elements(
		$MarginContainer/VBoxContainer/textRight,  # Label
		$MarginContainer/VBoxContainer/textEnd,  # Label
		$"../imageSword",  # TextureRect
		$Panel/titleSword,  # Label
		$Panel/titleNarator  # Label
	)
