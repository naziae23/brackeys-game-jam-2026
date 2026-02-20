extends AnimatableBody2D

@onready var animationPlayer = $AnimationPlayer

func _on_moving_ground_trigger_move() -> void:
	animationPlayer.play("move_up")
