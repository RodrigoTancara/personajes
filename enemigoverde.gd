extends KinematicBody2D

var velocity = Vector2(0,0)
var gofowrd = true
func _physics_process(delta):
	
	if is_on_wall():
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		gofowrd = not gofowrd
		gofowrd = not gofowrd
	
	if gofowrd == true:
		velocity.x = 50 

	else:
		velocity.x = -50
		
		velocity = move_and_slide(velocity, Vector2.UP)

 func _on_Area2D_area_entered (area):
	if area.is_in_group ("player"):
		get_tree().realod_current_scene()
		
