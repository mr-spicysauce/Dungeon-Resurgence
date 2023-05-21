extends HBoxContainer

@onready var AnimPlayer = $"../AnimationPlayer1"

func _on_back_to_mainmenu_button_pressed():
	AnimPlayer.play("options_move")
	await get_tree().create_timer(0.4).timeout
	self.hide()
	$"../HBox_Main_menu".position = Vector2(-300,0)
	$"../HBox_Main_menu".show()
	AnimPlayer.play_backwards("Gui_move")
