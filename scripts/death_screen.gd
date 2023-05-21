extends Control

var current_slot = 1
var random_item

@onready var sound = preload("res://sound_effects/click.wav")

func _ready():
	GVar.Deaths += 1
	random_item = randf_range(50,100)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$MarginContainer.hide()
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer.play("death")
	await get_tree().create_timer(0.1).timeout
	$MarginContainer.show()
	await get_tree().create_timer(13).timeout
	spin(random_item)

func spin(ammount):
	var cool_down = 0.001
	for i in ammount:
		if current_slot > 6:
			current_slot = 1
		else:
			current_slot += 1

		var Sound_play =AudioStreamPlayer.new()
		self.add_child(Sound_play)
		
		Sound_play.set_stream(sound)
		Sound_play.volume_db = 5

		Sound_play.play()
		Sound_play.finished.connect(func ():
			Sound_play.queue_free()
		)
		
		await get_tree().create_timer(cool_down).timeout
		cool_down += 0.002
		
	print(str(current_slot) + "will be deleted")
	if current_slot ==1:
		$AnimationPlayer.play("slot1_fade")
		await get_tree().create_timer(2).timeout
		GVar.Item1 = null
		GVar.Max_health = 100
		SaveGame.save_game()
		change()
	elif current_slot == 2:
		$AnimationPlayer.play("slot2_fade")
		await get_tree().create_timer(2).timeout
		GVar.Item2 = null
		GVar.Max_health = 100
		SaveGame.save_game()
		change()
	elif current_slot == 3:
		$AnimationPlayer.play("slot3_fade")
		await get_tree().create_timer(2).timeout
		GVar.Item3 = null
		GVar.Max_health = 100
		SaveGame.save_game()
		change()
	elif current_slot == 4:
		$AnimationPlayer.play("slot4_fade")
		await get_tree().create_timer(2).timeout
		GVar.Item4 = null
		GVar.Max_health = 100
		SaveGame.save_game()
		change()
	elif current_slot == 5:
		$AnimationPlayer.play("slot5_fade")
		await get_tree().create_timer(2).timeout
		GVar.Item5 = null
		GVar.Max_health = 100
		SaveGame.save_game()
		change()
	elif current_slot == 6 or current_slot == 7:
		$AnimationPlayer.play("slot6_fade")
		await get_tree().create_timer(2).timeout
		GVar.Coins = (GVar.Coins * 0.9)
		round(GVar.Coins)
		GVar.Max_health = 100
		SaveGame.save_game()
		change()

func change():
	if GVar.just_quit == true:
		get_tree().quit()
	else :
		get_tree().change_scene_to_file("res://levels/outside_level.tscn")

func _physics_process(delta):
	if current_slot == 1:
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_1/selector.show()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_2/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_3/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_4/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_5/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_6/selector.hide()
	elif current_slot == 2:
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_1/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_2/selector.show()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_3/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_4/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_5/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_6/selector.hide()
	elif current_slot == 3:
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_1/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_2/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_3/selector.show()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_4/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_5/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_6/selector.hide()
	elif current_slot == 4:
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_1/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_2/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_3/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_4/selector.show()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_5/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_6/selector.hide()
	elif current_slot == 5:
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_1/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_2/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_3/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_4/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_5/selector.show()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_6/selector.hide()
	elif current_slot == 6:
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_1/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_2/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_3/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_4/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_5/selector.hide()
		$MarginContainer/MarginContainer/HotBar_margin/Hotbar/Slot_6/selector.show()
