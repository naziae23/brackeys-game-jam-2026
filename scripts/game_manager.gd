extends Node

var score = 0
@onready var score_label: Label = $"../HUD/score"

func add_point():
	score += 1
	score_label.text = str(score)
	print(score)
	
func win_game():
	get_tree().change_scene_to_file("res://scenes/winscreen.tscn")

func lose_game():
	get_tree().reload_current_scene()
