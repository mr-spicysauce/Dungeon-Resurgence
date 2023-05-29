extends MeshInstance3D

var lvl = [
	"res://levels/lvl_1.tscn",
	"res://levels/lvl_1.tscn",
	"res://levels/lvl_2.tscn"
]

func _ready():
	$OmniLight3D.light_energy = 0

func _physics_process(delta):
	if GVar.bad_guys_killed_in_lvl >= GVar.bad_guys_to_kill:
		$finnish.play("show")

func _on_area_3d_body_entered(body):
	print(GVar.bad_guys_killed_in_lvl)
	if body.is_in_group("player") and GVar.bad_guys_killed_in_lvl >= GVar.bad_guys_to_kill:
		get_tree().change_scene_to_file(lvl.pick_random())
		GVar.difficulty += 0.2
