extends CharacterBody2D


@export var max_speed = 300.0
@export var jump_velocity = -400.0
@export var acceleration = 400

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if  abs(velocity.x) < max_speed:
			velocity.x += direction * acceleration * delta
	else:
		velocity.x = move_toward(velocity.x, 0, max_speed / 20)

	move_and_slide()
