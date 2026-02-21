extends Area2D

const WINZONE: PackedScene = preload("res://scenes/winzone.tscn")

signal show_text(text, color)
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	var display_text
	var display_color
	if body.has_key:
		display_text = "unlocked"
		display_color = Color.GREEN
		animation_player.play("unlocked")
		body.used_key()
	else:
		display_text = "locked"
		display_color = Color.RED
	emit_signal("show_text", display_text, display_color)

func replace_with_winzone() -> void:
	var winzone_instance = WINZONE.instantiate()
	var parent_node = get_parent()
	parent_node.add_child(winzone_instance)
	winzone_instance.global_position = global_position
	queue_free()
