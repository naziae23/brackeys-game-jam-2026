extends Area2D

@onready var gravityModifier = $"../Player/Gravity_modifier"
@onready var timerLabel = $"../HUD/timer"

func _ready() -> void:
	gravityModifier.active = false
	timerLabel.visible = false

func _on_body_entered(body: Node2D) -> void:
	gravityModifier.active = true
	timerLabel.visible = true
	# disable collision monitoring immediately
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
