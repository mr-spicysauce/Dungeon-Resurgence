extends Node3D

signal add_coins

func _ready():
	GVar.is_ingame = false
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$HUD.hide()
	$"SHOP TEXT/MarginContainer/Button".hide()
	$"SHOP TEXT/start_game_container/Start_game".hide()
	$Shop_text_bounce.play("Text_bounce")
	$Move_head.play("Move_head")
	await get_tree().create_timer(5).timeout
	$AnimationPlayer.play("load_in")
	$HUD.show()
	await get_tree().create_timer(8.5).timeout
	$"SHOP TEXT/MarginContainer/Button".show()
	$"SHOP TEXT/start_game_container/Start_game".show()
	emit_signal("add_coins")

func _on_move_head_animation_finished(anim_name):
	$Move_head.play("Move_head")

func _on_shop_text_bounce_animation_finished(anim_name):
	$Shop_text_bounce.play_backwards("Text_bounce")

func _on_button_mouse_entered():
	$"SHOP TEXT/MarginContainer/Button/Label".modulate = Color(0, 255, 255)

func _on_button_mouse_exited():
	$"SHOP TEXT/MarginContainer/Button/Label".modulate = Color(255, 255, 255)


func _on_start_game_mouse_entered():
	$"SHOP TEXT/start_game_container/Start_game/Label".modulate = Color(0, 255, 255)


func _on_start_game_mouse_exited():
	$"SHOP TEXT/start_game_container/Start_game/Label".modulate = Color(255, 255, 255)

func _on_button_pressed():
	GSound.click()
	$Gotoshop.play("GotoShop")
	$"SHOP TEXT/start_game_container/Start_game".hide()
	$"SHOP TEXT".modulate = Color(255, 255, 255)
	$"SHOP TEXT/MarginContainer/Button".hide()
	await get_tree().create_timer(1).timeout
	$Outside_level/shop_guy/MoveHead.stop()
	$Outside_level/shop_guy/AnimationPlayer.play("wave")
	await get_tree().create_timer(2.4).timeout
	$"SHOP TEXT/Shop_animation".play("show_shop")
	$"SHOP TEXT/MarginContainer2".show()
	$Outside_level/shop_guy/MoveHead.play("Move_head")
	

func _on_go_out_shop_pressed():
	GSound.click()
	$"SHOP TEXT/Shop_animation".play_backwards("show_shop")
	await get_tree().create_timer(0.5).timeout
	$"SHOP TEXT/MarginContainer2".hide()
	$Outside_level/shop_guy/MoveHead.stop()
	$Outside_level/shop_guy/AnimationPlayer.play_backwards("wave")
	$Gotoshop.play_backwards("GotoShop")
	await get_tree().create_timer(5).timeout
	$"SHOP TEXT/MarginContainer/Button".show()
	$"SHOP TEXT/start_game_container/Start_game".show()
	$Outside_level/shop_guy/MoveHead.play("Move_head")

func _on_start_game_pressed():
	if GVar.can_buy_item == true:
		get_tree().change_scene_to_file("res://levels/lvl_1.tscn")
		GVar.difficulty = 1

func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()

func _input(event):
	if event.is_action_pressed("esc"):
		if GVar.is_ingame == true:
			$"SHOP TEXT/MarginContainer/Button".MOUSE_FILTER_STOP
		else:
			$"SHOP TEXT/MarginContainer/Button".MOUSE_FILTER_IGNORE
