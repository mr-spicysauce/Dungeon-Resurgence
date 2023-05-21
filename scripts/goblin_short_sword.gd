extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D

@onready var anim_player = $AnimationPlayer

@onready var ragdoll = preload("res://bad_guys/goblin_short_sword_ragdoll.tscn")

var atk_anim = [
	"atk_1"
]

var SPEED = 3.0

var max_health = 30
var health = 30
var damage = 5
var player
var walking
var coin_for_kill

var should_move = true
var can_atk = false

func _ready():
	
	max_health = randf_range(25,50)
	max_health = round(max_health)
	coin_for_kill = randf_range(0,3)
	coin_for_kill = round(coin_for_kill)
	health = max_health
	
	anim_player.play("walking")
	walking = true
	$Timer.start()

func _physics_process(delta):
	
	$Sprite3D/SubViewport/VBoxContainer/TextureProgressBar/Label.text = str(str(health) + "/" + str(max_health))
	$Sprite3D/SubViewport/VBoxContainer/TextureProgressBar.value = health
	$Sprite3D/SubViewport/VBoxContainer/TextureProgressBar.max_value = max_health
	
	look_at(Vector3(GVar.player_pos.x, GVar.player_pos.y, GVar.player_pos.z))
	rotate_object_local(Vector3.UP, PI)
	rotation_degrees.x = 0
	var current_location = global_transform.origin
	var next_location = nav_agent.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED

	if $NavigationAgent3D.distance_to_target() < 1.5:
		should_move = false

	else:
		should_move = true
	velocity = new_velocity
	if should_move:
		move_and_slide()

func update_target_location(target_location):
	$NavigationAgent3D.set_target_position(target_location)

func _on_animation_player_animation_finished(anim_name):
	if walking == true:
		walking = false
		anim_player.play_backwards("walking")
	elif walking == false:
		walking = true
		anim_player.play("walking")

func take_damage():
	health = health - GVar.Item_damage
	if health <= 0:
		ragdoll = ragdoll.instantiate()
		get_parent().add_child(ragdoll)
		print(global_position)
		ragdoll.global_position = global_position
		GVar.add_coins = coin_for_kill
		GVar.Monsters_killed += 1
		self.queue_free()

func _on_area_3d_body_entered(body):
	if $Skeleton3D/Area3D.monitoring == true and body.is_in_group("player"):
		player = body
		anim_player.play("atk_1")
		await get_tree().create_timer(0.35).timeout
		player.take_damage(damage)

func _on_timer_timeout():
	$Skeleton3D/Area3D.monitoring = true
	await get_tree().create_timer(0.1).timeout
	$Skeleton3D/Area3D.monitoring = false
