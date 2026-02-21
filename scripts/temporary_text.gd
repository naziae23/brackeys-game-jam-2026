extends Label

signal show_text(text, color)

@onready var parent_node = get_parent()
@onready var timer: Timer = $Timer

@export var time_shown = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	parent_node.show_text.connect(handle_show_text)

func handle_show_text(display_text: String, color: Color) -> void:
	timer.wait_time =time_shown
	timer.start()
	self.visible = true
	self.add_theme_color_override("font_color", color)
	self.text = display_text

func _on_timer_timeout() -> void:
	self.visible = false
