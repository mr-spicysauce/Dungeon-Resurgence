extends Node

const SAVE_FILE1 = "user://game_save1.save"
const SAVE_FILE2 = "user://game_save2.save"
const SAVE_FILE3 = "user://game_save3.save"

var coins
var deaths

var g_data = {
	
}


func load_game1_data():
	var file = FileAccess.open(SAVE_FILE1, FileAccess.READ)
	
	if file.file_exists(SAVE_FILE1):
		file = FileAccess.open(SAVE_FILE1, FileAccess.READ)
		var json = JSON.new()
		g_data = JSON.parse_string(file.get_as_text())
		update_globals()

func load_game2_data():
	var file = FileAccess.open(SAVE_FILE2, FileAccess.READ)
	
	if file.file_exists(SAVE_FILE2):
		file = FileAccess.open(SAVE_FILE2, FileAccess.READ)
		var json = JSON.new()
		g_data = JSON.parse_string(file.get_as_text())
		update_globals()

func load_game3_data():
	var file = FileAccess.open(SAVE_FILE3, FileAccess.READ)
	
	if file.file_exists(SAVE_FILE3):
		file = FileAccess.open(SAVE_FILE3, FileAccess.READ)
		var json = JSON.new()
		g_data = JSON.parse_string(file.get_as_text())
		update_globals()

func update_globals():
	GVar.Max_health = g_data["Max_health"]
	GVar.Max_shield = g_data["Max_shield"]
	GVar.Coins = g_data["Coins"]
	GVar.Item1 = g_data["Item1"]
	GVar.Item2 = g_data["Item2"]
	GVar.Item3 = g_data["Item3"]
	GVar.Item4 = g_data["Item4"]
	GVar.Item5 = g_data["Item5"]
	GVar.Monsters_killed = g_data["Monsters_killed"]
	GVar.Deaths = g_data["Deaths"]
