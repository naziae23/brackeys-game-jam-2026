extends Node

var score = 0
@onready var score_label: Label = $"../HUD/score"

func add_point():
	score += 1
	score_label.text = str(score)
	print(score)
	
func win_game():
	get_tree().change_scene_to_file("res://scenes/menus/win_screen.tscn")

func lose_game():
	get_tree().reload_current_scene()


func _on_platform_on_enter() -> void:
	pass # Replace with function body.
