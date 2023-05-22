extends Node3D

var coin_for_kill

@onready var glass1 = preload("res://sound_effects/glass1.wav")
@onready var glass2 = preload("res://sound_effects/glass2.wav")
@onready var glass3 = preload("res://sound_effects/glass3.wav")

func _ready():
	
	var break_sounds = [
	glass1,
	glass2,
	glass3
	]
	
	$AudioStreamPlayer3D.set_stream(break_sounds.pick_random())
	$AudioStreamPlayer3D.play()
	
	coin_for_kill = randf_range(1,3)
	$GPUParticles3D.emitting = true
	GVar.add_coins = coin_for_kill
