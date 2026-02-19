extends Control

signal scene_changed(scene_name, context)

@onready var scene_name = self.name

func _on_play_button_button_up():
	emit_signal("scene_changed", scene_name, "")

func _on_exit_button_button_up():
	get_tree().quit()
