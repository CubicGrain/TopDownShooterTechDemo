class_name Hurtbox2D
extends Area2D

@export var stats : ObjectStats

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func get_hittable() -> bool:
	return stats.current_health > 0
