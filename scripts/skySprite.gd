extends Sprite2D
@onready var game_manager: Node = get_node("/root/Main")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(game_manager.current_level)
	material.set_shader_parameter("level", game_manager.current_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
