extends RigidBody3D

var damage = 5

func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		var player = body
		player.take_damage(damage)
