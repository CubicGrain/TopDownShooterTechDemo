class_name LevelControl
extends Node

@onready var rooms_node = $Rooms
var rooms
@export var current_room : Node2D
@onready var player = $Player
@onready var camera = $Camera
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rooms = rooms_node.get_children()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass

func update_room(room: Node2D) -> void:
	current_room = room
	var tween = camera.create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.tween_property(camera, "position", room.global_position, 0.5)
	tween.play()
