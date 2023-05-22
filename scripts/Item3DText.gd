@tool
extends SubViewport

func _ready():
	set_update_mode(SubViewport.UPDATE_WHEN_PARENT_VISIBLE)

func _process(delta):
	size = $Label.size
	pass
