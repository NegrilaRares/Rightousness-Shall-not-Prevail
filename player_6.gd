extends CharacterBody2D

func _ready():
	$".".hide()
	$AnimatedSprite2D/HurtBox_Wizard/CollisionShape2D_Hurt.set_deferred("disabled", true)
	$CollisionShape2D.set_deferred("disabled", true)
	Narrative.entered_level_m1.connect(on_active)
	Narrative.exited_level_m1.connect(on_inactive)
	
func on_active():
	$".".show()
	$AnimatedSprite2D/HurtBox_Wizard/CollisionShape2D_Hurt.set_deferred("disabled", false)
	$CollisionShape2D.set_deferred("disabled", false)
	
func on_inactive():
	$".".hide()
	$AnimatedSprite2D/HurtBox_Wizard/CollisionShape2D_Hurt.set_deferred("disabled", true)
	$CollisionShape2D.set_deferred("disabled", true)
	
