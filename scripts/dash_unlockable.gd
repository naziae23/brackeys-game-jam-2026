extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

signal show_text(text, color)
signal show_tutorial

func _on_body_entered(body: Node2D) -> void:
	body.unlock_dash()
	emit_signal("show_text", "Dash unlocked!", Color.YELLOW)
	emit_signal("show_tutorial")
	animation_player.play("pickup")
