extends Node3D

@onready var player = $Player

func _ready():
	GVar.is_ingame = true

func _physics_process(delta):
	get_tree().call_group("bad_guy", "update_target_location",player.global_transform.origin)

func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://levels/outside_level.tscn")
