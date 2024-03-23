extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var mouse_down = false
var target_position = Vector2.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# todo - normalise
	if mouse_down:
		velocity.x = (-1 if global_position.x > target_position.x else 1) * SPEED
		velocity.y = (-1 if global_position.y > target_position.y else 1) * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		mouse_down = event.pressed
		target_position = event.position

	if event is InputEventMouseMotion and mouse_down:
		target_position = event.position