@tool
extends SubViewport

func _ready():
	await get_tree().create_timer(0.1).timeout
	set_update_mode(SubViewport.UPDATE_WHEN_PARENT_VISIBLE)

func _process(delta):
	size = $VBoxContainer.size
