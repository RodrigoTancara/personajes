extends Area2D
onready var animatedsprite = $AnimatedSprite

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	animatedsprite.play("movimiento")
	
	for body in bodies:
		if body.name == "player":
			get_tree().reload_current_scene()
		


