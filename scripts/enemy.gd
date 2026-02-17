extends Node2D

const SPEED = 50
var dir = 1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	update_movement(delta)
	
func update_movement(delta:float) -> void:
	if ray_cast_right.is_colliding():
		dir = -1
		sprite.flip_h = true
	if ray_cast_left.is_colliding():
		dir = 1
		sprite.flip_h = false
	position.x += SPEED * dir * delta
