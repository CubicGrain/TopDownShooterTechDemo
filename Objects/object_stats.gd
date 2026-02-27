class_name ObjectStats
extends Resource
## Statistics about an object

signal death()

@export var max_health : float = 100
@export var current_health : float = 100 :
	set(value):
		var old = current_health
		current_health = value
		
		if old > 0 && current_health <= 0:
			death.emit()

func _init() -> void:
	resource_local_to_scene = true
