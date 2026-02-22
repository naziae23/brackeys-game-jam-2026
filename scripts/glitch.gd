extends ColorRect
@onready var game_manager: Node = get_node("/root/Main")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	if game_manager.current_level >= 2:
		start_glitch_loop()

func start_glitch_loop():
	var frequency = 5.0 - (((game_manager.current_level)/game_manager.HIGHEST_LEVEL) * 5.0)
	while true:
		await get_tree().create_timer(randf_range(frequency, 2*frequency)).timeout
		
		var camera = get_viewport().get_camera_2d()
		if not camera: return
		
		var cam_pos = camera.get_screen_center_position()
		var viewport_size = get_viewport_rect().size / camera.zoom
		
		var top_left = cam_pos - (viewport_size / 2.0)
		
		# Position the glitch randomly within the visible rectangle
		global_position.x = randf_range(top_left.x, top_left.x + viewport_size.x - size.x)
		global_position.y = randf_range(top_left.y, top_left.y + viewport_size.y - size.y)
		
		visible = true
		await get_tree().create_timer(randf_range(0.3, 0.8)).timeout
		visible = false
