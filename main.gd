extends Node2D

const Ball = preload("res://ball.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var t = 0.0
var spawn_timer = 5.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	t += delta
	spawn_timer -= delta
	if spawn_timer <= 0.0:
		spawn()
		spawn_timer = 4.0 + $BallBag.get_child_count()
	$Time.text = str(int(t))

func spawn():
	var v = Vector2(
		50+(int(($Ship.global_position.x-50)+350)%700),
		50+(int(($Ship.global_position.y-50)+250))%500)
	var b = Ball.instantiate()
	b.global_position = v
	$BallBag.add_child(b)
