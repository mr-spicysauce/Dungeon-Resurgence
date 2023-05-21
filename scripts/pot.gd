extends RigidBody3D

@onready var broke_pot = preload("res://game_items/broke_pot.tscn")

func breakitem():
	broke_pot = broke_pot.instantiate()
	get_parent().add_child(broke_pot)
	broke_pot.global_position = global_position
	queue_free()
