class_name Projectile
extends RigidBody2D

@export_range(0, 100, 0.02, "or_greater") var move_speed : float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func launch(projectile_move_direction : Vector2):
	linear_velocity = move_speed * projectile_move_direction
