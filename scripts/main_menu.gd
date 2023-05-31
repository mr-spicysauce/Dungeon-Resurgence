extends Node3D

@onready var AnimPlayer = $Control/AnimationPlayer1

var day_night = false

func _ready():
	$"Sun/Day-night".play("Day_night_anim")

func _on_quit_game_button_pressed():
	GSound.click()
	AnimPlayer.play("Gui_move")
	await get_tree().create_timer(0.4).timeout
	get_tree().quit()

func _on_test_map_button_pressed():
	GSound.click()
	AnimPlayer.play("Gui_move")
	await get_tree().create_timer(0.4).timeout
	get_tree().change_scene_to_file("res://levels/test_lvl.tscn")

func _on_options_button_pressed():
	GSound.click()
	AnimPlayer.play("Gui_move")
	await get_tree().create_timer(0.4).timeout
	$Control/HBox_Main_menu.hide()
	$Control/Option_menu.position = Vector2(-300,0)
	$Control/Option_menu.show()
	AnimPlayer.play_backwards("options_move")

func hide_options():
	AnimPlayer.play("options_move")
	await get_tree().create_timer(0.4).timeout
	$Control/Option_menu.hide()
	$Control/Option_menu.position = Vector2(-300,0)
	$Control/HBox_Main_menu.show()
	AnimPlayer.play_backwards("Gui_move")

func _on_play_game_button_pressed():
	GSound.click()
	AnimPlayer.play("Gui_move")
	await get_tree().create_timer(0.4).timeout
	$Control/HBox_startgame.position = Vector2(-300,0)
	$Control/HBox_startgame.show()
	$Control/AnimationPlayer1.play("Start_game_move")

func _on_daynight_animation_finished(anim_name):
	if day_night == false:
		$"Sun/Day-night".play_backwards("Day_night_anim")
		day_night = true
	else:
		$"Sun/Day-night".play("Day_night_anim")

func _on_back_button_pressed():
	GSound.click()
	$Control/AnimationPlayer1.play_backwards("Start_game_move")
	await get_tree().create_timer(0.4).timeout
	$Control/HBox_startgame.hide()
	$Control/HBox_Main_menu.position = Vector2(-300,0)
	$Control/HBox_Main_menu.show()
	AnimPlayer.play_backwards("Gui_move")


func _on_load_game_1_pressed():
	GSound.click()
	$Load_game.load_game1_data()
	GVar.on_game_save = "game_save_1"
	$Control/AnimationPlayer1.play_backwards("Start_game_move")
	await get_tree().create_timer(0.2).timeout
	$Control/AnimationPlayer1.play("Fade_to_newgame")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://levels/outside_level.tscn")

func _on_load_game_2_pressed():
	GSound.click()
	$Load_game.load_game2_data()
	GVar.on_game_save = "game_save_2"
	$Control/AnimationPlayer1.play_backwards("Start_game_move")
	await get_tree().create_timer(0.2).timeout
	$Control/AnimationPlayer1.play("Fade_to_newgame")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://levels/outside_level.tscn")

func _on_load_game_3_pressed():
	GSound.click()
	$Load_game.load_game3_data()
	GVar.on_game_save = "game_save_3"
	$Control/AnimationPlayer1.play_backwards("Start_game_move")
	await get_tree().create_timer(0.2).timeout
	$Control/AnimationPlayer1.play("Fade_to_newgame")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://levels/outside_level.tscn")

func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
