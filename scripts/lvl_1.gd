extends Node3D

@onready var player = $Player

var random_pos_x
var random_pos_z
var random_spawn_pos

var random_spawn_ammount

func _ready():
	GVar.bad_guys_killed_in_lvl = 0
	random_spawn_ammount = randf_range(4,10)
	random_spawn_ammount = (random_spawn_ammount * GVar.difficulty)
	GVar.bad_guys_to_kill = random_spawn_ammount
	print("spawing " + str(random_spawn_ammount))
	spawn_bad_guy(random_spawn_ammount)
	GVar.is_ingame = true


func _physics_process(delta):
	await get_tree().create_timer(1).timeout
	get_tree().call_group("bad_guy", "update_target_location",player.global_transform.origin)

func spawn_bad_guy(ammount):
	
	for i in ammount:
		
		var goblin_short_sword = preload("res://bad_guys/goblin_short_sword.tscn")
		
		goblin_short_sword = goblin_short_sword.instantiate()
		
		random_pos_x = randf_range(-9,9)
		random_pos_z = randf_range(6,34)
		
		random_spawn_pos = -Vector3(random_pos_x,1,random_pos_z)
		
		print(random_spawn_pos)
		add_child(goblin_short_sword)
		goblin_short_sword.global_position = random_spawn_pos
