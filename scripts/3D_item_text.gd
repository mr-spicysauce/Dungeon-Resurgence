extends Sprite3D

func _physics_process(delta):
	self.position = $"../RigidBody3D".position + Vector3(0,1.2,0)
