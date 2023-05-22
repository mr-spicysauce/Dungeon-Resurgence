class_name Player extends CharacterBody3D

var can_atk = true

var is_dead = false

var short_sword_anim = [
	"short_sword_swing_1",
	"short_sword_swing_2"
]

var long_sword_anim = [
	"long_sword_swing_1",
	"long_sword_swing_2"
]

var short_sword_sound = [
	load("res://sound_effects/short_sword1.wav"),
	load("res://sound_effects/short_sword2.wav"),
	load("res://sound_effects/short_sword3.wav")
]

var long_sword_sound = [
	load("res://sound_effects/long_sword1.wav"),
	load("res://sound_effects/long_sword2.wav"),
	load("res://sound_effects/long_sword3.wav")
]

var drink_sound = [
	load("res://sound_effects/drink1.mp3"),
	load("res://sound_effects/drink2.wav")
]

var footsteps = [
	load("res://sound_effects/footstep1.wav"),
	load("res://sound_effects/footstep2.wav"),
	load("res://sound_effects/footstep3.wav"),
	load("res://sound_effects/footstep4.wav")
]

var pain = [
	load("res://sound_effects/pain1.wav"),
	load("res://sound_effects/pain2.wav")
]

var brick_anim = [
	"brick_swing_1"
]

var step = true

@export_category("Player")
@export_range(1, 35, 1) var speed: float = 10 # m/s
@export_range(10, 400, 1) var acceleration: float = 100 # m/s^2

@export_range(0.1, 3.0, 0.1) var jump_height: float = 1 # m
@export_range(0.1, 9.25, 0.05, "or_greater") var camera_sens: float = 3

var jumping: bool = false
var mouse_captured: bool = false

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

var move_dir: Vector2 # Input direction for movement
var look_dir: Vector2 # Input direction for look/aim

var walk_vel: Vector3 # Walking velocity 
var grav_vel: Vector3 # Gravity velocity 
var jump_vel: Vector3 # Jumping velocity

@onready var camera: Camera3D = $Camera

func _ready() -> void:
	capture_mouse()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion: look_dir = event.relative * 0.01
	if Input.is_action_just_pressed("jump"): jumping = true
	if Input.is_action_just_pressed("exit"): get_tree().quit()
	if Input.is_action_pressed("sprint"):
		speed = 10
	else:
		speed = 6
	
	
	if Input.get_vector("move_left", "move_right", "move_forward", "move_backwards") and step == true and is_on_floor():
		step = false
		var Sound_play = AudioStreamPlayer.new()
		self.add_child(Sound_play)
			
		Sound_play.set_stream(footsteps.pick_random())
		Sound_play.volume_db = -20
		
		Sound_play.play()
		Sound_play.finished.connect(func ():
			step = true
			Sound_play.queue_free()
			)


	if Input.is_action_just_pressed("attack") and GVar.Holding_item != null and can_atk == true:
		
		if GVar.Holding_item == "small_health" and GVar.Max_health < 100:
			can_atk = false
			GVar.is_ingame = false #quick hack to stop player from changing item mid drink
			$Weapon_animaion.play("drink_small_health")
			$Camera/AudioStreamPlayer3D.set_stream(drink_sound.pick_random())
			$Camera/AudioStreamPlayer3D.play()
			await get_tree().create_timer(0.75).timeout
			GVar.Max_health += 25
			$HUD/InventrySystem.used_item()
			can_atk = true
			GVar.is_ingame = true

		if GVar.Holding_item == "big_health" and GVar.Max_health < 100:
			can_atk = false
			GVar.is_ingame = false #quick hack to stop player from changing item mid drink
			$Weapon_animaion.play("drink_big_health")
			$Camera/AudioStreamPlayer3D.set_stream(drink_sound.pick_random())
			$Camera/AudioStreamPlayer3D.play()
			await get_tree().create_timer(0.75).timeout
			GVar.Max_health += 50
			$HUD/InventrySystem.used_item()
			can_atk = true
			GVar.is_ingame = true

		if GVar.Holding_item == "short_sword":
			can_atk = false
			$Weapon_animaion.play(short_sword_anim.pick_random())
			$Camera/AudioStreamPlayer3D.set_stream(short_sword_sound.pick_random())
			$Camera/AudioStreamPlayer3D.play()
			do_damage()
			await get_tree().create_timer(0.3).timeout
			can_atk = true

		if GVar.Holding_item == "long_sword":
			can_atk = false
			$Weapon_animaion.play(long_sword_anim.pick_random())
			$Camera/AudioStreamPlayer3D.set_stream(long_sword_sound.pick_random())
			$Camera/AudioStreamPlayer3D.play()
			do_damage()
			await get_tree().create_timer(0.6).timeout
			can_atk = true

		if GVar.Holding_item == "brick":
			can_atk = false
			$Weapon_animaion.play(brick_anim.pick_random())
			$Camera/AudioStreamPlayer3D.set_stream(short_sword_sound.pick_random())
			$Camera/AudioStreamPlayer3D.play()
			do_damage()
			await get_tree().create_timer(0.5).timeout
			can_atk = true

func _physics_process(delta: float) -> void:
	
	GVar.player_pos = global_transform.origin
	GVar.player_rotation = self.rotation_degrees
	GVar.item_drop_pos = $Camera/spawn_item.global_position
	if mouse_captured: _rotate_camera(delta)
	velocity = _walk(delta) + _gravity(delta) + _jump(delta)
	
	move_and_slide()

	if GVar.Item_slot == null:
		GVar.Holding_item = null

	if GVar.Holding_item != null:
		$Camera/player_area.monitorable = false
		show_item(GVar.Holding_item)
	else:
		$Camera/player_area.monitorable = true
		$"Camera/Weapon_holder/Long sword".hide()
		$"Camera/Weapon_holder/Short Sword".hide()
		$Camera/Weapon_holder/Small_Red.hide()
		$Camera/Weapon_holder/Medium_Red.hide()
		$Camera/Weapon_holder/brick.hide()

func capture_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true

func release_mouse() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false

func _rotate_camera(delta: float, sens_mod: float = 1.0) -> void:
#	look_dir += Input.get_vector("look_left","look_right","look_up","look_down")
	camera.rotation.y -= look_dir.x * camera_sens * sens_mod * delta
	camera.rotation.x = clamp(camera.rotation.x - look_dir.y * camera_sens * sens_mod * delta, -1.5, 1.5)
	look_dir = Vector2.ZERO

func _walk(delta: float) -> Vector3:
	move_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	var _forward: Vector3 = camera.transform.basis * Vector3(move_dir.x, 0, move_dir.y)
	var walk_dir: Vector3 = Vector3(_forward.x, 0, _forward.z).normalized()
	walk_vel = walk_vel.move_toward(walk_dir * speed * move_dir.length(), acceleration * delta)
	
	return walk_vel

func _gravity(delta: float) -> Vector3:
	grav_vel = Vector3.ZERO if is_on_floor() else grav_vel.move_toward(Vector3(0, velocity.y - gravity, 0), gravity * delta)
	return grav_vel

func _jump(delta: float) -> Vector3:
	if jumping:
		if is_on_floor(): jump_vel = Vector3(0, sqrt(4 * jump_height * gravity), 0)
		jumping = false
		return jump_vel
	jump_vel = Vector3.ZERO if is_on_floor() else jump_vel.move_toward(Vector3.ZERO, gravity * delta)
	return jump_vel

func _on_area_3d_area_entered(area):
	if area.is_in_group("item") == true:
		GVar.Item_to_pickup = area.name

func _on_area_3d_area_exited(area):
	if area.is_in_group("item") == true:
		GVar.Item_to_pickup = null

func show_item(item_name):
	if item_name == "short_sword":
		$"Camera/Weapon_holder/Short Sword".show()
	else:
		$"Camera/Weapon_holder/Short Sword".hide()
	if item_name == "long_sword":
		$"Camera/Weapon_holder/Long sword".show()
	else:
		$"Camera/Weapon_holder/Long sword".hide()
	if item_name == "small_health":
		$Camera/Weapon_holder/Small_Red.show()
	else:
		$Camera/Weapon_holder/Small_Red.hide()
	if item_name == "big_health":
		$Camera/Weapon_holder/Medium_Red.show()
	else:
		$Camera/Weapon_holder/Medium_Red.hide()
	if item_name == "brick":
		$Camera/Weapon_holder/brick.show()
	else:
		$Camera/Weapon_holder/brick.hide()

func do_damage():
	$Camera/Area3D.monitoring = true
	await get_tree().create_timer(0.1).timeout
	$Camera/Area3D.monitoring = false

func _on_area_3d_body_entered(body):
	if body.is_in_group("bad_guy") and $Camera/Area3D.monitoring == true:
		var bad_guy = body
		bad_guy.take_damage()
	elif body.is_in_group("can_break") and $Camera/Area3D.monitoring == true:
		var can_break = body
		can_break.breakitem()

func take_damage(damage):
	if is_dead == false:
		$AudioStreamPlayer.set_stream(pain.pick_random())
		$AudioStreamPlayer.play()
		if GVar.Max_shield == 0:
			GVar.Max_health = GVar.Max_health - damage
			if GVar.Max_health <= 0:
				is_dead = true
				player_death()
		else:
			GVar.Max_shield = GVar.Max_shield - damage

func add_coins(coins):
	$HUD/Coin_MarginContainer._coin_add(coins)

func player_death():
	$Death.play("death")
	await get_tree().create_timer(2.1).timeout
	get_tree().change_scene_to_file("res://levels/death_screen.tscn")
