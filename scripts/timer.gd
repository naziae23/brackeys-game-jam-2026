extends Label

@export var on: bool = false
@onready var player = $"../../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (player.find_child("Gravity_modifier")):
		on = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if on:
		var grav = $"../../Player/Gravity_modifier"
		var timer = $"../../Player/Gravity_modifier/Timer"
		if !grav.isOn:
			self.set_text("Time until gravity inverts: " + str(snapped(timer.get_time_left(), 0.01)))
		else:
			self.set_text("")
