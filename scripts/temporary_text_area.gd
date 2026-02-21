extends Area2D

signal show_text(text, color)

@export_multiline var text = "text"
@export var check_for_property = ""

var display_text = true

func _on_body_entered(body: Node2D) -> void:
	emit_signal("show_text", text, Color.YELLOW)
