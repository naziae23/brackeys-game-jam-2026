extends ColorRect

@onready var parent_sprite = get_parent().get_node("../Sprite2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	start_glitch_loop()

func start_glitch_loop():
	while true:
		# 1. Wait for a random time (2 to 5 seconds)
		await get_tree().create_timer(randf_range(0.1, 0.2)).timeout
		
		var camera = get_viewport().get_camera_2d()
		if not camera: return
		
		var cam_pos = camera.get_screen_center_position()
		var viewport_size = get_viewport_rect().size / camera.zoom
		
		# 2. Calculate the top-left corner of the camera view
		var top_left = cam_pos - (viewport_size / 2.0)
		
		global_position.x = randf_range(top_left.x, top_left.x + viewport_size.x - size.x)
		global_position.y = randf_range(top_left.y, top_left.y + viewport_size.y - size.y)
		# 3. Show the glitch for a split second
		visible = true
		await get_tree().create_timer(randf_range(0.1, 0.3)).timeout
		visible = false
