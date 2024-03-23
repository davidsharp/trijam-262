extends CharacterBody2D


const speed = 500.0
var acceleration = 0
var max_acceleration = 1.5

var mouse_down = false
var target_position = Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if mouse_down:
		if acceleration < max_acceleration:
			acceleration += min(max_acceleration,delta/3)
	else:
		if acceleration > 0:
			acceleration = max(0,acceleration - (delta/1.5))
	if floor(target_position.x) != floor(position.x) and floor(target_position.y) != floor(position.y):
		velocity = (acceleration*speed*Vector2(target_position.x-position.x,target_position.y-position.y).normalized())
		var old_rot = rotation
		look_at(Vector2(target_position.x,target_position.y))
		move_and_slide()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		mouse_down = event.pressed
		target_position = event.position

	if event is InputEventMouseMotion and mouse_down:
		target_position = event.position
