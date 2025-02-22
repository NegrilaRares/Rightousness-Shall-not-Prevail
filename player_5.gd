extends CharacterBody2D

func _ready():
	$".".hide()
	$AnimatedSprite2D/HurtBox_Wizard.monitoring = false
	$CollisionShape2D_2.disabled = true
	Narrative.entered_level_2.connect(on_active)
	Narrative.exited_level_2.connect(on_inactive)
	
func on_active():
	$".".show()
	$AnimatedSprite2D/HurtBox_Wizard.monitoring = true
	$CollisionShape2D_2.disabled = false
	
func on_inactive():
	$".".hide()
	$AnimatedSprite2D/HurtBox_Wizard.monitoring = false
	$CollisionShape2D_2.disabled = true

func _process(_delta):
	move_and_slide()
