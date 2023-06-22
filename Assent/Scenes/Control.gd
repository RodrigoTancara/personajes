extends Control


func _input(Scene_1):
	
	if Input.is_action_just_pressed("pausa"):
		get_tree().paused = not get_tree().paused
	if  get_tree().paused == false:
		$ColorRect.visible = false
	else:
		$ColorReact.visible = true
