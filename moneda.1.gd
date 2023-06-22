extends Area2D


onready var sprite = $Sprite

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body.name == "player":
			get_parent().remove_child(self)

