extends CharacterBody2D

@export var stats : CharacterStats :
	set(value):
		if is_instance_valid(stats):
			stats.death.disconnect(_on_death)
		
		stats = value
		
		if is_instance_valid(stats):
			stats.death.connect(_on_death)

@export var max_speed = 300.0
@export var friction = 50.0
@export var acceleration = 30.0

@export var direction : Vector2

func _ready() -> void:
	if not stats:
		push_warning("[stats] must be assigned.")

func _physics_process(delta: float) -> void:
	
	
	
	character_movement(delta)

	move_and_slide()

func character_movement(delta: float):
	# Get the input direction and handle the movement/deceleration.
	var movement := direction.normalized()
	
	var lerp_weight = delta * (acceleration if movement else friction)
	velocity = lerp(velocity, movement * max_speed, lerp_weight)
	

func _on_death():
	queue_free()
