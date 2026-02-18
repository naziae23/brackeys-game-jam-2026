extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -350.0

const DASH_VEL = 300.0
const DASH_TIME = 0.16

var can_dash: bool = true
var is_dashing: bool = true
var dash_dir: Vector2 = Vector2.RIGHT
var dash_timer: float = 0.0

@export var omnidash: bool = true;

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if !is_dashing:
		update_gravity(delta)
	
	var direction := Input.get_axis("move_left", "move_right")
	
	if !is_dashing:
		update_movement(direction)
	animate(direction)
	
	if is_on_floor():
		if !is_dashing and !can_dash:
			can_dash = true
			_update_dash_visuals()
			
	_dash_logic(delta)
	
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
		
		_update_dash_visuals()
		velocity = final_dash_dir * DASH_VEL
		
	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0.0:
			is_dashing = false
			
func _update_dash_visuals() -> void:
	if can_dash:
#		what to look like when can dash
		pass
	else:
#		what to look like when cant dash
		pass

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
