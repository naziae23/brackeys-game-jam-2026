extends Node2D

@export var prefab : PackedScene
@onready var level_manager: Node = $"../LevelManager"
@onready var timer: Timer = $Timer

@export var vel: Vector2 = Vector2(-100, 100)
@export var frequency: float = 3.0

func _ready() -> void:
	timer.wait_time = frequency
	
func _on_timer_timeout() -> void:	
	var camera = get_viewport().get_camera_2d()
	if not camera: return
	
	var viewport_size = get_viewport_rect().size / camera.zoom
	var cam_center = camera.get_screen_center_position()
	
	var left_edge = cam_center.x
	var right_edge = cam_center.x + (viewport_size.x)
	var top_edge = cam_center.y - (viewport_size.y / 2.0)
	
	var spawn_x = randf_range(left_edge, right_edge)
	var spawn_y = top_edge - 100
	
	var meteor = prefab.instantiate()
	meteor.level_manager = level_manager
	meteor.vel = vel
	add_child(meteor)
	meteor.global_position = Vector2(spawn_x, spawn_y)
