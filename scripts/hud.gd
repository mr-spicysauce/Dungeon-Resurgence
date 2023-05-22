extends Control

var is_in_menu = false

func _input(event):
	if Input.is_action_just_pressed("esc") and is_in_menu == false:
		is_in_menu = true
		$esc_menu.show()
		$AnimationPlayer.play_backwards("open_esc")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if GVar.is_ingame == true:
			$esc_menu/HBoxContainer/VBoxContainer/Save_and_quit.show()
			$esc_menu/HBoxContainer/VBoxContainer/Save_and_quit_normal.hide()
		elif GVar.is_ingame == false:
			$esc_menu/HBoxContainer/VBoxContainer/Save_and_quit.hide()
			$esc_menu/HBoxContainer/VBoxContainer/Save_and_quit_normal.show()
		get_tree().paused = true
	elif Input.is_action_just_pressed("esc") and is_in_menu == true:
		is_in_menu = false
		get_tree().paused = false
		$AnimationPlayer.play("open_esc")
		await get_tree().create_timer(0.2).timeout
		$esc_menu.hide()
		if GVar.is_ingame == true:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		elif GVar.is_ingame == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_continue_pressed():
	get_tree().paused = false
	$AnimationPlayer.play("open_esc")
	await get_tree().create_timer(0.2).timeout
	$esc_menu.hide()
	if GVar.is_ingame == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif GVar.is_ingame == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_save_and_quit_pressed():
	$ConfirmationDialog.popup_centered()

func _on_confirmation_dialog_confirmed():
	GVar.just_quit = true
	get_tree().paused = false
	get_parent().take_damage(999)

func save_the_game():
	if GVar.on_game_save == "game_save_1":
		SaveGame.Save_Game1_data()
	elif GVar.on_game_save == "game_save_2":
		SaveGame.Save_Game2_data()
	elif GVar.on_game_save == "game_save_3":
		SaveGame.Save_Game3_data()

func _on_temp_quit_pressed():
	get_tree().quit()

func _on_save_and_quit_normal_pressed():
	$ConfirmationDialog2.popup_centered()

func _on_confirmation_dialog_2_confirmed():
	SaveGame.save_game()
	$AnimationPlayer.play_backwards("open_esc")
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()
