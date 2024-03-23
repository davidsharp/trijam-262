extends CharacterBody2D


const speed = 300.0
var acceleration = 0
var initial_acceleration = 0.5
var max_acceleration = 2.0

var mouse_down = false
var target_position = Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if mouse_down:
		if acceleration < max_acceleration:
			acceleration = max(initial_acceleration,acceleration)
			acceleration += delta/2
			acceleration = min(max_acceleration,acceleration)
	else:
		if acceleration > 0:
			acceleration = max(0,acceleration - (delta/1.5))
	if floor(target_position.x) != floor(position.x) and floor(target_position.y) != floor(position.y):
		var angle = Vector2.LEFT.rotated(rotation).angle_to(global_position-target_position)
		rotation = lerp(rotation,rotation+angle,delta*10)
		velocity = (acceleration*speed*Vector2.RIGHT.rotated(rotation))
		move_and_slide()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		mouse_down = event.pressed
		target_position = event.position

	if event is InputEventMouseMotion and mouse_down:
		target_position = event.position
