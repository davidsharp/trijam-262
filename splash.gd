extends Node2D

func _ready():
	if Globals.high_score:
		$Label2.text = $Label2.text + '\n\nHighscore: ' + str(Globals.high_score)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
