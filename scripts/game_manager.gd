extends Node

var score = 0
@export var level = 0 #export for testing

@onready var score_label: Label = $"../HUD/score"
@onready var bg_sky: Material = $"../Background/Sky/Sprite2D".material

func next_level():
	level += 1

func add_point():
	score += 1
	score_label.text = str(score)
	print(score)
	
func win_game():
	get_tree().change_scene_to_file("res://scenes/menus/win_screen.tscn")
	bg_sky.set_shader_parameter("level", level)
	

func lose_game():
	get_tree().reload_current_scene()
