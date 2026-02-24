class_name Player
extends CharacterBody2D


@export var max_speed = 300.0
@export var friction = 50.0
@export var acceleration = 30.0

@export var direction : Vector2

func _physics_process(delta: float) -> void:
	
	
	
	player_movement(delta)

	move_and_slide()

func player_movement(delta: float):
	# Get the input direction and handle the movement/deceleration.
	var movement := direction.normalized()
	
	var lerp_weight = delta * (acceleration if movement else friction)
	velocity = lerp(velocity, movement * max_speed, lerp_weight)
	
