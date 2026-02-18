extends Area2D

@onready var timer: Timer = $Timer
@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	print("You died")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	body.die()
	timer.start()

func _on_timer_timeout() -> void:
	game_manager.lose_game()
	Engine.time_scale = 1.0
