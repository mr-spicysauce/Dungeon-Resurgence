extends MeshInstance3D

var sound = [
	load("res://sound_effects/exit_door_sound_1.wav"),
	load("res://sound_effects/exit_door_sound_2.wav"),
	load("res://sound_effects/exit_door_sound_3.wav")
]

var lvl = [
	"res://levels/lvl_1.tscn",
	"res://levels/lvl_1.tscn",
	"res://levels/lvl_2.tscn"
]

var one_shot = true

func _ready():
	$OmniLight3D.light_energy = 0

func _physics_process(delta):
	if GVar.bad_guys_killed_in_lvl >= GVar.bad_guys_to_kill:
		$finnish.play("show")
		if one_shot == true:
			one_shot = false
			$AudioStreamPlayer3D.play()

func _on_area_3d_body_entered(body):
	print(GVar.bad_guys_killed_in_lvl)
	if body.is_in_group("player") and GVar.bad_guys_killed_in_lvl >= GVar.bad_guys_to_kill:
		get_tree().change_scene_to_file(lvl.pick_random())
		GVar.difficulty += 0.2

func _on_audio_stream_player_3d_finished():
	$AudioStreamPlayer3D.set_stream(sound.pick_random())
	$AudioStreamPlayer3D.play()
