extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	update_gravity(delta)
	
	var direction := Input.get_axis("move_left", "move_right")
	
	update_movement(direction)
	animate(direction)
	
	move_and_slide()

func update_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
func update_movement(direction: int) -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
func animate(direction: int) -> void :
	
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
	else:
		sprite.play("jump")
	
