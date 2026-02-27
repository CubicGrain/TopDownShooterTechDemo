class_name Hitbox2D
extends Area2D
## Area where on enter, can do damage to a hurtbox

signal hit(target : Hurtbox2D, health_change : float)

@export var weapon_stats : WeaponStats

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(_on_area_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_area_entered(p_area : Area2D):
	var hurtbox = p_area as Hurtbox2D
	
	if not hurtbox || not hurtbox.get_hittable():
		return
	
	var damage_dealt = weapon_stats.damage
	hurtbox.stats.current_health -= damage_dealt
	hit.emit(hurtbox, damage_dealt)
