extends Node2D

const Ball = preload("res://ball.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var t = 0.0
var spawn_timer = 5.0
var dead_timer = 3.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Ship.dead:
		dead_timer -= delta
		if dead_timer <= 0.0:
			Globals.high_score = floor(t)
			get_tree().change_scene_to_file("res://splash.tscn")
	t += delta
	spawn_timer -= delta
	if spawn_timer <= 0.0:
		spawn()
		spawn_timer = 4.0 + $BallBag.get_child_count()
	$Time.text = str(int(t))
	if $Ship.health < 3: $Health/Heart3.hide()
	if $Ship.health < 2: $Health/Heart2.hide()
	if $Ship.health < 1: $Health/Heart1.hide()

func spawn():
	var v = Vector2(
		50+(int(($Ship.global_position.x-50)+350)%700),
		50+(int(($Ship.global_position.y-50)+250))%500)
	var b = Ball.instantiate()
	b.global_position = v
	$BallBag.add_child(b)
