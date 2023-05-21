extends Node3D

func _ready():
	$AnimationPlayer.play("Fire")


func _on_animation_player_animation_finished(anim_name):
	$AnimationPlayer.play("Fire")
