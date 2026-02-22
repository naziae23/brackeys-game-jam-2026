extends CharacterBody2D

@export var target_to_chase: CharacterBody2D
@export var  RAFTAAR = 180.0
@export var slowdown_radius = 300.0

@onready var navigation_agent = $NavigationAgent2D

func _physics_process(delta):
	
	navigation_agent.target_position = target_to_chase.global_position
	var distance_to_player = global_position.distance_to(target_to_chase.global_position)
	
	var current_speed = RAFTAAR
	if distance_to_player < slowdown_radius:
		current_speed = max(60.0, RAFTAAR * (distance_to_player / slowdown_radius))
	var direction = global_position.direction_to(navigation_agent.get_next_path_position())
	velocity = direction * current_speed
	
	move_and_slide()
