@tool
extends SubViewport

func _ready():
	$Label.self_modulate = Color(255,255,255,0)
	await get_tree().create_timer(0.1).timeout
	set_update_mode(SubViewport.UPDATE_WHEN_PARENT_VISIBLE)

func _process(delta):
	size = $Label.size
	pass
