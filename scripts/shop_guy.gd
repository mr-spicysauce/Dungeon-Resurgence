extends Node3D

func _ready():
	$MoveHead.play("Move_head")

func _on_move_head_animation_finished(anim_name):
	$MoveHead.play_backwards("Move_head")
