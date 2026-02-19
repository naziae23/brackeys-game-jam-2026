extends Node

@onready var current_scene = $MainMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_scene.scene_changed.connect(handle_scene_changed)
	
func handle_scene_changed(current_scene_name: String, context: String) -> void:
	var next_scene
	print(context)
	match current_scene_name:
		"MainMenu":
			next_scene = load("res://scenes/levels/level_1.tscn")
		"WinScreen":
			match context:
				"Retry": 
					next_scene = load("res://scenes/levels/level_1.tscn")
				"NextDay":
					next_scene = load("res://scenes/levels/level_1.tscn")
				"MainMenu":
					next_scene = load("res://scenes/menus/main_menu.tscn")
		"Level_1":
			next_scene = load("res://scenes/menus/win_screen.tscn")
		_: 
			return

	var next_scene_instance = next_scene.instantiate()
	add_child(next_scene_instance)
	current_scene.queue_free()
	current_scene = next_scene_instance
	if current_scene.has_signal("scene_changed"):
		current_scene.scene_changed.connect(handle_scene_changed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
