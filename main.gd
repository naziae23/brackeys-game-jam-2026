extends Node

const HIGHEST_LEVEL = 2

@onready var current_scene = $MainMenu
@onready var current_level = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_scene.scene_changed.connect(handle_scene_changed)
	
func handle_scene_changed(current_scene_name: String, context: String) -> void:

	var next_scene_name

	if "Level" == current_scene_name:
		current_level = context.to_int()

	match current_scene_name:
		"MainMenu":
			next_scene_name = "level_0"
		"Level":
			next_scene_name = "win_screen"
		"WinScreen":
			match context:
				"Retry": 
					next_scene_name = "level_" + str(current_level)
				"NextDay":
					next_scene_name = "level_" + str(min(current_level + 1, HIGHEST_LEVEL))
					current_level = min(current_level + 1, HIGHEST_LEVEL)
				"MainMenu":
					next_scene_name = "main_menu"
		_: 
			return

	var next_scene
	if "level" in next_scene_name:
		next_scene = load("res://scenes/levels/" + next_scene_name + ".tscn")
	else:
		next_scene = load("res://scenes/menus/" + next_scene_name + ".tscn")

	var next_scene_instance = next_scene.instantiate()
	add_child(next_scene_instance)
	current_scene.queue_free()
	current_scene = next_scene_instance
	if current_scene.has_signal("scene_changed"):
		current_scene.scene_changed.connect(handle_scene_changed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
