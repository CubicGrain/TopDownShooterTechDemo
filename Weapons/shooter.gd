class_name Shooter
extends RayCast2D

## Launches projectiles when TryShoot is called successfully

@export var fireable : Fireable
@export var group_names : GroupNames

@export var default_diretion = Vector2.RIGHT

var projectiles_parent : Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	projectiles_parent = get_tree().get_first_node_in_group(group_names.projectiles_parent_group)
	assert(projectiles_parent != null, "Projectiles node is required for tjis script to work.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func try_shoot() -> bool:
	if not is_colliding():
		_shoot()
		return true
	
	return false



func _shoot():
	var projectile = fireable.scene.instantiate() as Projectile
	projectiles_parent.add_child(projectile)
	projectile.name = fireable.display_name
	projectile.global_position = global_position
	projectile.global_rotation = global_rotation
	
	var launch_direction = default_diretion.rotated(global_rotation)
	projectile.launch(launch_direction)
