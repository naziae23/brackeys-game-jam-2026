extends Node

signal scene_changed(scene_name, context)

@onready var score_label: Label = $"../HUD/score"

var score = 0

func add_point():
	score += 1
	score_label.text = str(score)
	
func win_level():
	emit_signal("scene_changed", "Level", "")

func lose_level():
	get_tree().reload_current_scene()
