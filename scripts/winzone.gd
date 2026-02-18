extends Area2D

@onready var timer: Timer = $Timer
@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	print("you win")
	Engine.time_scale = 0.5
	timer.start()
	
func _on_timer_timeout() -> void:
	game_manager.win_game()
	Engine.time_scale = 1.0
