extends CanvasLayer

@export var day_number: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$day.set_text("day " + str(day_number))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
