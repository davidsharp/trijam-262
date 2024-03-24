extends Area2D

var SPEED = 150.0
var RAD = 16

var x = 1
var y = 1

func _ready():
	x = 1 if randf()>0.5 else -1
	y = 1 if randf()>0.5 else -1
	var _scale = randf_range(0.75,1.25)
	scale = Vector2(_scale,_scale)
	RAD = 16 * _scale
	SPEED = randf_range(125.0,175.0)

func _physics_process(delta):
	if global_position.x < 50 + RAD:
		x=1+randf_range(-0.1,0.1) # small bit of randomness
		random_audio()
	if global_position.x > 750 - RAD:
		x=-1+randf_range(-0.1,0.1)
		random_audio()
	if global_position.y < 50 + RAD:
		y=1+randf_range(-0.1,0.1)
		random_audio()
	if global_position.y > 550 - RAD:
		y=-1+randf_range(-0.1,0.1)
		random_audio()

	position = position + Vector2(x*SPEED/100,y*SPEED/100)

func random_audio():
	get_node("AudioStreamPlayer2D" + str(randi_range(1,5))).play()

func _on_body_entered(body):
	if body.is_in_group('player'):
		print('player hit')
		body.hit()
		queue_free()
