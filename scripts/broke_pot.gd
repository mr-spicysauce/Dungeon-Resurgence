extends Node3D

var coin_for_kill

func _ready():
	coin_for_kill = randf_range(1,3)
	$GPUParticles3D.emitting = true
	GVar.add_coins = coin_for_kill
