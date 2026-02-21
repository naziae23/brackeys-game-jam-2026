extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

signal show_text(text, color)

func _on_body_entered(body: Node2D) -> void:
	body.unlock_dash()
	emit_signal("show_text", "Dash unlcoked!", Color.YELLOW)
	animation_player.play("pickup")
