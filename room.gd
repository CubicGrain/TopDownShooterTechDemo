class_name Room
extends Node

@onready var level_node : Node = self.get_parent().get_parent()
@onready var room_area : Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# how do I make it only run for oly the room the player is colliding with, 
# all rooms are listening using the same area2D
func _on_area_2d_body_entered(body: Node2D) -> void:
	for child in level_node.get_children():
		if body == child:
			level_node.update_room(self)
		
	
