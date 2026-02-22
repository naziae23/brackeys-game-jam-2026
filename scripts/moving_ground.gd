extends AnimatableBody2D

#@onready var animationPlayer = $AnimationPlayer
#var rng = RandomNumberGenerator.new()

@export var x: float = -5
@export var y: float = -75

@export var goDuration: float = 1
@export var returnDuration: float = 1

func move_relative(offset: Vector2, duration: float):
	var tween = create_tween()
	var current_global_pos = global_position
	var end_global_pos = current_global_pos + offset
	tween.tween_property(self, "global_position", end_global_pos, duration)

func _on_moving_ground_trigger_move() -> void:
	#makes random allocation of floating objects
	#var x = rng.randf_range(-5, 5)
	#var y = rng.randf_range(-75, -125)
	move_relative(Vector2(x, y), goDuration)
	
func _on_timeout_return() -> void:
	move_relative(Vector2(-x, -y), returnDuration)
