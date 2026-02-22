extends Sprite2D
@onready var game_manager: Node = get_node("/root/Main")
@onready var player = $"../../../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(game_manager.current_level)
	material.set_shader_parameter("level", game_manager.current_level)
	material.set_shader_parameter("max_level", game_manager.HIGHEST_LEVEL)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (player.find_child("Gravity_modifier")):
		var grav = $"../../../Player/Gravity_modifier"
		material.set_shader_parameter("gravityOn", grav.isOn)
