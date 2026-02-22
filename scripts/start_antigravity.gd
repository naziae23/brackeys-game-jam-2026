extends Area2D

@onready var gravityModifier = $"../Player/Gravity_modifier"
@onready var timerLabel = $"../HUD/timer"

func _ready() -> void:
	gravityModifier.isOnTimer = false

func _on_body_entered(body: Node2D) -> void:
	gravityModifier.isOnTimer = true
	timerLabel.visible = true
