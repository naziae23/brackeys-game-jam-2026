extends Area2D

signal show_text(text, color)

@export_multiline var text = "text"
@export var check_for_property = ""

@export var times_entered_for_activation = 1

var times_entered = 0

var display_text = true

func _on_body_entered(body: Node2D) -> void:
	times_entered += 1
	if(times_entered >= times_entered_for_activation):
		emit_signal("show_text", text, Color.YELLOW)
