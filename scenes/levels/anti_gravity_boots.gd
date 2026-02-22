extends Polygon2D

@onready var player = $".."
@onready var gravityModifier

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if (player.find_child("Gravity_modifier")):
		gravityModifier = $"../Gravity_modifier"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if gravityModifier.isOn:
		self.visible = true
	else:
		self.visible = false
