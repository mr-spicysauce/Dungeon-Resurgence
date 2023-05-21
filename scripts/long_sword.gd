extends Node3D

var player_near = false

func _physics_process(delta):
	if GVar.Can_pickup == true and player_near == true:
		_remove_item()

func _remove_item():
	GVar.Can_pickup = false
	GVar.Item_to_pickup = null
	self.queue_free()

func _on_long_sword_area_entered(area):
	if area.name == "player_area":
		player_near = true

func _on_long_sword_area_exited(area):
	if area.name == "player_area":
		player_near = false
