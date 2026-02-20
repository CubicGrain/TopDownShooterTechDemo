class_name Projectile
extends RigidBody2D

@export_range(0, 300, 0.2, "or_greater") var move_speed : float = 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	linear_velocity.x = move_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
