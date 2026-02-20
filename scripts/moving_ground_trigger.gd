extends Area2D

@onready var platforms = $"../Platforms/MovingGround/"

func _on_body_entered(_body: Node2D) -> void:
	print("entered")
	# check if the entering body is in the "player" group
	for p in platforms.get_children():
		if _body.is_in_group("player"):
			p.get_node("AnimationPlayer").play("move_up")
			queue_free()
	print("ground pieces are moving")
