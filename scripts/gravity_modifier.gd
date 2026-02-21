extends Node

@export var isOnTimer = false
@export var timeInterval = 6.0
@export var duration = 3.0
@export var inverse_strength = 0.25

@onready var timer: Timer = $Timer

@onready var true_gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var isOn = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.one_shot = true
	if isOnTimer:
		start_idle_timer()

func start_idle_timer() -> void:
	timer.wait_time = timeInterval
	timer.start()

func trigger_gravity_mod() -> void:
	if isOn:
		return
	get_parent().gravity = -(get_parent().gravity) * inverse_strength
	isOn = true
	timer.wait_time = duration
	timer.start()


func _on_timer_timeout() -> void:
	if isOn:
		get_parent().gravity = true_gravity
		isOn = false
		if isOnTimer:
			start_idle_timer()
		return
	if isOnTimer:
		trigger_gravity_mod()
