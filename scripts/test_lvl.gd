extends Node3D

@onready var player = $Player

func _ready():
	GVar.is_ingame = true

func _physics_process(delta):
	get_tree().call_group("bad_guy", "update_target_location",player.global_transform.origin)
