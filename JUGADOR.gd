extends KinematicBody2D
 
const ACCELERATION = 70
const MAX_SPEED = 300
const JUMP_H = -1000
const UP = Vector2(0, -1)
const gravity = 40
 
onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
 
var motion = Vector2()
 
# warning-ignore:unused_argument
func _physics_process(delta):
	
	motion.y += gravity
	var friction = false
 
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = true
		animationPlayer.play("Walk")
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		animationPlayer.play("Walk")
		sprite.flip_h = false
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		animationPlayer.play("idle")
		friction = true
 
	if is_on_floor():
 
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_H
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)
 
	motion = move_and_slide(motion, UP)
