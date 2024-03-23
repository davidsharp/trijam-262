extends CharacterBody2D

const SPEED = 150.0
const RAD = 16

var x = 1
var y = 1

func _physics_process(delta):
	if global_position.x < 50 + RAD:
		x=-x+randf_range(-0.1,0.1) # small bit of randomness
	if global_position.x > 750 - RAD:
		x=-x+randf_range(-0.1,0.1)
	if global_position.y < 50 + RAD:
		y=-y+randf_range(-0.1,0.1)
	if global_position.y > 550 - RAD:
		y=-y+randf_range(-0.1,0.1)

	velocity = Vector2(x*SPEED,y*SPEED)

	move_and_slide()

func _on_area_2D_body_entered(body):
	if body.is_in_group('player'):
		print('player hit')
