extends Node

var score = 0
@onready var score_label: Label = $"../HUD/score"

func add_point():
	score += 1
	score_label.text = str(score)
	print(score)
	
