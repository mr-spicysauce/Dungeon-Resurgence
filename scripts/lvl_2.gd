extends Node3D

@onready var player = $Player

var random_pos_x
var random_pos_z
var random_spawn_pos

var random_spawn_ammount

var random_pot_pos
var pot_amount

var door_can_open = true

func _ready():
	GVar.bad_guys_killed_in_lvl = 0
	random_spawn_ammount = randf_range(4,8)
	pot_amount = randf_range(0,6)
	random_spawn_ammount = (random_spawn_ammount * GVar.difficulty)
	random_spawn_ammount = round(random_spawn_ammount)
	GVar.bad_guys_to_kill = random_spawn_ammount
	print("spawing " + str(random_spawn_ammount))
	spawn_lvl()
	GVar.is_ingame = true

func _physics_process(delta):
	await get_tree().create_timer(1).timeout
	get_tree().call_group("bad_guy", "update_target_location",player.global_transform.origin)
	
	if GVar.bad_guys_killed_in_lvl >= GVar.bad_guys_to_kill and door_can_open == true:
		door_can_open = false
		$lvl2/door1/AudioStreamPlayer3D.play()
		$lvl2/AnimationPlayer.play("open_door_1")

func spawn_lvl():
	spawn_bricks(randf_range(40,80))
	spawn_pillars(5)
	spawn_pots(pot_amount)
	$NavigationRegion3D.bake_navigation_mesh()
	spawn_bad_guy(random_spawn_ammount)

func spawn_pillars(amount):
	
	print("spawn ammount pillars:" + str(amount))
	
	for i in amount:
		
		var has_torch = randf_range(0,10)
		
		var pillar
		
		if has_torch >= 4:
			pillar = preload("res://objects/pillar_and_torch.tscn")
		else:
			pillar = preload("res://objects/pillar.tscn")
		
		pillar = pillar.instantiate()
		random_pos_x = randf_range(-13,13.5)
		random_pos_z = randf_range(-6,9.5)
		random_spawn_pos = Vector3(random_pos_x,0.1,random_pos_z)
		
		print(random_spawn_pos)
		$NavigationRegion3D.add_child(pillar)
		pillar.global_position = random_spawn_pos
		pillar.rotation.y = randf_range(0,360)

func spawn_pots(amount):
	
	print("spawn ammount pots:" + str(amount))
	
	for i in amount:
		var pot = preload("res://game_items/pot.tscn")
		
		pot = pot.instantiate()
		
		random_pos_x = randf_range(-13,13.5)
		random_pos_z = randf_range(-6,9.5)
		random_spawn_pos = Vector3(random_pos_x,0.5,random_pos_z)
		
		print(random_spawn_pos)
		$NavigationRegion3D.add_child(pot)
		pot.global_position = random_spawn_pos

func spawn_bricks(amount):
	
	var bricks = [
		"res://objects/bricks/brick.tscn",
		"res://objects/bricks/brick_001.tscn",
		"res://objects/bricks/brick_002.tscn",
		"res://objects/bricks/brick_003.tscn",
		"res://objects/bricks/brick_004.tscn",
		"res://objects/bricks/brick_005.tscn"
	]
	
	for i in amount:
		var brick = load(bricks.pick_random())
		
		brick = brick.instantiate()
		
		random_pos_x = randf_range(-40,40)
		random_pos_z = randf_range(-6.5,12)
		random_spawn_pos = Vector3(random_pos_x,0,random_pos_z)
		
		add_child(brick)
		brick.global_position = random_spawn_pos
		brick.rotation.y = randf_range(0,360)

func spawn_bad_guy(ammount):
	
	print("spawn ammount:" + str(ammount))
	
	for i in ammount:
		
		var goblin_short_sword = preload("res://bad_guys/goblin_short_sword.tscn")
		
		goblin_short_sword = goblin_short_sword.instantiate()
		
		random_pos_x = randf_range(-13,13.5)
		random_pos_z = randf_range(-6,9.5)
		random_spawn_pos = Vector3(random_pos_x,0,random_pos_z)
		
		print(random_spawn_pos)
		add_child(goblin_short_sword)
		goblin_short_sword.global_position = random_spawn_pos

func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
