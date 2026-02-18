extends Control

func _on_retry_button_up() -> void:
		get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_next_day_button_up() -> void:
		get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_main_menu_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")
