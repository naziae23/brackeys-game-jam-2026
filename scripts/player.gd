extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -350.0

const DASH_VEL = 300.0
const DASH_TIME = 0.16

var can_dash: bool = true
var is_dashing: bool = true
var dash_dir: Vector2 = Vector2.RIGHT
var dash_timer: float = 0.0
var dead: bool = false

var is_jumping: bool = false
var time_since_grounded = 0.0

@export var omnidash: bool = true;
@export var coyoteTime: float = 0.1

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if dead:
		velocity += 1.75 * get_gravity() * delta
		move_and_slide()
		return
		
	if !is_on_floor():
		time_since_grounded += delta
	else:
		time_since_grounded = 0
		is_jumping = false
	
	if !is_dashing:
		update_gravity(delta)
	
	var direction := Input.get_axis("move_left", "move_right")
	
	if !is_dashing:
		update_movement(direction)
	animate(direction)
	
	if is_on_floor_coyote():
		if !is_dashing and !can_dash:
			can_dash = true
			
	_dash_logic(delta)
	_update_dash_visuals()
	
	move_and_slide()

func update_gravity(delta: float) -> void:
	if not is_on_floor_coyote():
		velocity += get_gravity() * delta
	
func update_movement(direction: float) -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor_coyote():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_released("jump"): #if released early
		if velocity.y < -150:
			velocity.y = -150
	
func _dash_logic(delta: float) -> void:
	var y_move: float = 0.0
	if omnidash:
		y_move = Input.get_axis("move_up", "move_down")
	
	var input_dir: Vector2 = Vector2(
		Input.get_axis("move_left", "move_right"),
		y_move
	).normalized()
	
	if input_dir.x != 0:
		dash_dir.x = input_dir.x
	
	if can_dash and Input.is_action_just_pressed("Dash"):
		var final_dash_dir: Vector2 = dash_dir
		final_dash_dir.y = input_dir.y
		if input_dir.y != 0 and input_dir.x == 0:
			return
		
		can_dash = false
		is_dashing = true
		dash_timer = DASH_TIME
		
		velocity = final_dash_dir * DASH_VEL
		
	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0.0:
			is_dashing = false
			
func _update_dash_visuals() -> void:
	if is_dashing:
		$GPUParticles2D.emitting = true
	else:
		$GPUParticles2D.emitting = false

func die(play_anim: bool = true) -> void:
	if dead:
		return
	dead = true
	sprite.play("death")

func animate(direction: int) -> void :
	if direction > 0:
		sprite.flip_h = false
		$GPUParticles2D.scale.x = 1
	elif direction < 0:
		sprite.flip_h = true
		$GPUParticles2D.scale.x = -1
	
	if is_dashing:
			sprite.play("dash")	
	elif is_on_floor_coyote():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
	else:
		sprite.play("jump")

func is_on_floor_coyote() -> bool:
	return (time_since_grounded <= coyoteTime) and !is_jumping
	
