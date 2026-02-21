@tool
class_name breakable_tile extends StaticBody2D

@onready var collider: CollisionShape2D = $Collider
@onready var area_2d: Area2D = $Area2D
@onready var detector: CollisionShape2D = $Area2D/Detector

@export_category("Properties")
@export var scaleWidth: float = 1.0
@export var scaleHeight: float = 1.0
@export var oneWay: bool = false

@export_category("Graphical Properties")
@export var platformTexture: Texture2D
@export var sprite: Sprite2D
@export var animator: AnimationPlayer
@export var normal: String = "Normal"
@export var breaking: String = "Breaking"
@export var broken: String = "Broken"

enum PlatformStates {
	Normal,
	Breaking,
	Broken
}

var currentState: PlatformStates = PlatformStates.Normal
var areaHeight: int = 4

func _ready() -> void:
	sprite.texture = platformTexture
	sprite.scale = Vector2(scaleWidth, scaleHeight)
	collider.one_way_collision = oneWay
	animator.animation_finished.connect(onAnimationFinished)
	
	resizeColliderToSprite()
	resizeAreaToSprite()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!Engine.is_editor_hint()):
		match currentState:
			PlatformStates.Breaking: 
				animator.play(breaking)
			PlatformStates.Broken:
				collider.disabled = true
				animator.play(broken)
			_: 
				collider.disabled = false
				animator.play(normal)
		
	handlePlatformTrigger()

func onAnimationFinished(currentAnimation: String):
	if(currentAnimation == breaking):
		currentState = PlatformStates.Broken
	if(currentAnimation == broken):
		#currentState = PlatformStates.Normal #Never comes back
		pass
	
func handlePlatformTrigger():
	var _bodies = area_2d.get_overlapping_bodies()
	for item in _bodies:
		if (item is CharacterBody2D):
			if (item.is_on_floor()):
				if(currentState == PlatformStates.Normal):
					currentState = PlatformStates.Breaking

func resizeColliderToSprite():
	if(!sprite.texture):
		print("Sprite Texture Missing")
	
	var _spriteSize = sprite.get_rect().size * sprite.scale
	
	if (collider.shape is RectangleShape2D):
		collider.shape.extents = _spriteSize / 2
	elif (collider.shape is CircleShape2D):
		collider.shape.radius = max(_spriteSize.x, _spriteSize.y) / 2
	else:
		print("Unsupported collider shape")

func resizeAreaToSprite():
	if(!sprite.texture):
		print("Sprite Texture Missing")
	
	var _spriteSize = sprite.get_rect().size * sprite.scale
	
	if (collider.shape is RectangleShape2D):
		detector.shape.extents = Vector2(_spriteSize.x / 2, areaHeight)
		detector.position = detector.position - Vector2(0, collider.shape.extents.y)
	else:
		print("Unsupported collider shape")
