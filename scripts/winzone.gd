extends Area2D

@onready var timer: Timer = $Timer
@onready var level_manager: Node = $"../LevelManager"

func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	timer.start()
	
func _on_timer_timeout() -> void:
	level_manager.win_level()
	Engine.time_scale = 1.0
