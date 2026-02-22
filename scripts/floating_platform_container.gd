extends Node2D

@onready var platform: AnimatableBody2D = $Platform
@onready var area_2d: Area2D = $Area2D

@export var xDist: float = -5
@export var yDist: float = -75

@export var goDuration: float = 1
@export var returnDuration: float = 1

@export var returnAfter: float = 3.0

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	platform.x = xDist
	platform.y = yDist
	platform.goDuration = goDuration
	platform.returnDuration = returnDuration
	area_2d.returnTime = returnAfter
	
