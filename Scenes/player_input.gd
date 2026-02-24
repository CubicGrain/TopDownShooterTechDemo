class_name PlayerInput
extends Node

@export var player : Player
@export var shooter : Shooter
@export var actions : PlayerInputActions 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	player.direction = Input.get_vector(actions.left, actions.right, actions.up, actions.down)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(actions.shoot):
		shooter.try_shoot()
