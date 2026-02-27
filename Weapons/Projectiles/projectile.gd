class_name Projectile
extends RigidBody2D

@export var remove_on_object_hit : bool = true
@export var remove_on_ground_hit : bool = true
@export_range(0, 100, 0.02, "or_greater") var move_speed : float = 100.0
@export var hitbox : Hitbox2D :
	set(value):
		if is_instance_valid(hitbox):
			hitbox.hit.disconnect(_on_hit)
		
		hitbox = value
		if is_instance_valid(hitbox):
			hitbox.hit.connect(_on_hit)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 1



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func launch(projectile_move_direction : Vector2):
	linear_velocity = move_speed * projectile_move_direction

func _on_hit(_p_target : Hurtbox2D, _p_health_change : float):
	if remove_on_ground_hit:
		queue_free()
	


func _on_body_entered(_body: Node) -> void:
	if remove_on_ground_hit:
		queue_free()
