extends Area2D

@onready var platforms = get_node("../Platforms/MovingGround/")

func _on_animation_trigger_area_body_entered(body):
	# check if the entering body is in the "player" group
	for p in platforms.get_children():
		if body.is_in_group("player"):
			p.get_node("AnimationPlayer").play("move_up")
	print("ground pieces are moving")
