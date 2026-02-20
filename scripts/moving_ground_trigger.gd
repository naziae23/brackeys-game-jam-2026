extends Area2D

signal move
@onready var platforms = $"../Platforms/MovingGround/"

func _ready():
	# connect all nodes in a group to one function
	for p in platforms.get_children():
		# Assuming the signal is named "collected"
		move.connect(p._on_moving_ground_trigger_move)

func _on_body_entered(_body: Node2D) -> void:
	move.emit()
	# disable collision monitoring immediately
	set_deferred("monitoring", false)
	set_deferred("monitorable", false)
