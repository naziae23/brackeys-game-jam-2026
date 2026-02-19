extends Control

signal scene_changed(scene_name, context)

@onready var scene_name = self.name

func _on_retry_button_up() -> void:
	emit_signal("scene_changed", scene_name, "Retry")

func _on_next_day_button_up() -> void:
	emit_signal("scene_changed", scene_name, "NextDay")

func _on_main_menu_button_up() -> void:
	emit_signal("scene_changed", scene_name, "MainMenu")
