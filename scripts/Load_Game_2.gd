extends TextureRect

var save_exsits = false
var open = false

const SAVE_FILE2 = "user://game_save2.save"

@onready var no_clicked_bg = preload("res://recorces/GUI/NEW_GAME_BACKGROUND.png")
@onready var Clicked_bg = preload("res://recorces/GUI/NEW_GAME_BACKGROUND_CLICKED.png")

var coins
var deaths

var g_data = {
	
}

func game1_menu_check():
	var file = FileAccess.open(SAVE_FILE2, FileAccess.READ)
	if not str(file) == "<Object#null>":
		save_exsits = true
		var json = JSON.new()
		g_data = JSON.parse_string(file.get_as_text())
		coins = g_data["Coins"]
		deaths = g_data["Deaths"]
		$MarginContainer/VBoxContainer/Game_stats/COINS.text = "COINS: " + str(coins)
		$MarginContainer/VBoxContainer/Game_stats/DEATHS.text = "DEATHS: " + str(deaths)
	else:
		save_exsits = false

func _ready():
	
	game1_menu_check()
	
	if save_exsits == true:
		$MarginContainer/VBoxContainer/Game_stats.show()
		$MarginContainer/VBoxContainer/New_Game.hide()
	else :
		$MarginContainer/VBoxContainer/Game_stats.hide()
		$MarginContainer/VBoxContainer/New_Game.show()

func _on_load_game_2_button_down():
	if save_exsits == true and open == false:
		open = true
		self.texture = Clicked_bg
		$Load_game.show()
		$AnimationPlayer.play("Load_game_1")
	elif save_exsits == true and open == true:
		open = false
		self.texture = no_clicked_bg
		$AnimationPlayer.play_backwards("Load_game_1")
		await get_tree().create_timer(0.2).timeout
		$Load_game.hide()
	if save_exsits == false:
		self.texture = Clicked_bg
		$Start_new.popup_centered()

func _on_start_new_canceled():
	self.texture = no_clicked_bg

func _on_overwrite_button_down():
	$ConfirmationDialog.popup_centered()

func _on_start_new_confirmed():
	new_game_fade()

func _on_confirmation_dialog_confirmed():
	new_game_fade()

func new_game_fade():
	$"../../../../../New_game".Make_Game2_data()
	$"../../../../AnimationPlayer1".play_backwards("Start_game_move")
	await get_tree().create_timer(0.2).timeout
	$"../../../../AnimationPlayer1".play("Fade_to_newgame")
	await get_tree().create_timer(2).timeout
	GVar.on_game_save = "game_save_2"
	$"../../../../../Load_game".load_game2_data()
	get_tree().change_scene_to_file("res://levels/outside_level.tscn")
