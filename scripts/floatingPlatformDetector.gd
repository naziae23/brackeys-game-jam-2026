extends Area2D

signal move
signal goBack
@onready var platform: AnimatableBody2D = $"../Platform"
@export var returnTimer: Timer
@export var cooldownTimer: Timer

@export var returnTime: float = 3.0

var onCooldown: bool = false

func _ready():
	# connect all nodes in a group to one function
		# Assuming the signal is named "collected"
	move.connect(platform._on_moving_ground_trigger_move)
	goBack.connect(platform._on_timeout_return)

func _on_body_entered(_body: Node2D) -> void:
	if !onCooldown:
		move.emit()
		# disable collision monitoring immediately
		set_deferred("monitoring", false)
		set_deferred("monitorable", false)
		returnTimer.wait_time = returnTime
		returnTimer.start()


func _on_timer_timeout() -> void:
	goBack.emit()
	returnTimer.stop()
	cooldownTimer.start()
	onCooldown = true
	set_deferred("monitoring", true)
	set_deferred("monitorable", true)


func _on_cooldown_timer_timeout() -> void:
	onCooldown = false
