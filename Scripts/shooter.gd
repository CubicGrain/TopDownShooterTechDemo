class_name Shooter
extends Node2D

## Launches projectiles when TryShoot is called successfully

@export var fireable : Fireable
@export var group_names : GroupNames

var projectiles_node : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	projectiles_node = get_tree().get_first_node_in_group(group_names.projectiles_parent_group)
	assert(projectiles_node != null, "Projectiles node is required for tjis script to work.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func tryShoot() -> bool:
	_shoot()
	return true

func _shoot():
	var projectile = fireable.scene.instantiate() as Projectile
	projectile.add_child(projectiles_node)
