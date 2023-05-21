@tool
extends SubViewport

func _ready():
	$Label.self_modulate = Color(255,255,255,0)

func _process(delta):
	size = $Label.size
	pass
