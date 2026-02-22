extends Area2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
const LEVEL_CHUNK: PackedScene = preload("res://scenes/levels/level_chunks/level_2_post_activation.tscn")

func _on_body_entered(body: Node2D) -> void:
	animation_player.play("transform_level")
	var level_chunk = LEVEL_CHUNK.instantiate()
	var parent_node = get_parent()
	parent_node.add_child(level_chunk)
	$"../TileMap2".queue_free()
