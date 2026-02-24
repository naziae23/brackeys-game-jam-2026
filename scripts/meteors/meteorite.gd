extends Area2D

@onready var deathTimer: Timer = $deathTimer
@onready var byeTimer: Timer = $byeTimer

var level_manager: Node
var killedPlayer: bool = false

var vel: Vector2 = Vector2(-100, 100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += vel*delta
	pass

func _on_body_entered(body: Node2D) -> void:
	if(body is CharacterBody2D):
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		body.die()
		killedPlayer = true
		deathTimer.start()
		self.visible = false

func _on_timer_timeout() -> void:
	level_manager.lose_level()
	Engine.time_scale = 1.0
	queue_free()

func _screen_exited() -> void:
	if !killedPlayer:
		byeTimer.start()

func _on_bye_timer_timeout() -> void:
	queue_free()
