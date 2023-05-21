extends Skeleton3D

func _ready():
	await get_tree().create_timer(0.01).timeout
	$"Physical Bone spine005/GPUParticles3D".emitting = true
	physical_bones_start_simulation()
