extends Node3D

func _ready():
	var mat = $Roof.get_active_material(1)
	mat.albedo_color = Color(randf(), randf(), randf())
	
