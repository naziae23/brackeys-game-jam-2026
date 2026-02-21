extends Area2D

@onready var timer: Timer = $Timer
@onready var level_manager: Node = $"../LevelManager"

var vel: Vector2 = Vector2(-100, 100)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += vel*delta
	pass

func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	body.die()
	timer.start()

func _on_timer_timeout() -> void:
	level_manager.lose_level()
	Engine.time_scale = 1.0
