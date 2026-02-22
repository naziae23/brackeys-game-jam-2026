extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer
@onready var tutorialLabel = $"../Glide_Tutorial_Text"

signal show_text(text, color)

func _on_body_entered(body: Node2D) -> void:
	body.unlock_glide()
	emit_signal("show_text", "Glide unlocked!", Color.YELLOW)
	animation_player.play("pickup")
	tutorialLabel.visible = true
