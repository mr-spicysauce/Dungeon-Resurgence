extends HBoxContainer

func _on_new_game_button_pressed():
	GSound.click()
	$"../AnimationPlayer1".play("Fade_to_newgame")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://levels/outside_level.tscn")


func _on_button_pressed():
	SaveGame.Save_Game1_data()
