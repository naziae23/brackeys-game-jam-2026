extends Node2D

signal scene_changed(scene_name, context)
@onready var level_name = self.name
@onready var level_manager: Node = $LevelManager

func _ready() -> void:
	level_manager.scene_changed.connect(handle_scene_changed)

func handle_scene_changed(current_scene_name: String, context: String):
	var level_number = level_name.to_int()
	emit_signal("scene_changed", current_scene_name, str(level_number))
