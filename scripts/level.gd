extends Node2D

signal scene_changed(scene_name, context)
@onready var current_scene = self

func _ready() -> void:
	%LevelManager.scene_changed.connect(handle_scene_changed)

func handle_scene_changed(current_scene_name: String, context: String):
	emit_signal("scene_changed", current_scene_name, context)
