extends Node

const SAVE_FILE1 = "user://game_save1.save"
const SAVE_FILE2 = "user://game_save2.save"
const SAVE_FILE3 = "user://game_save3.save"



var g_data = {
	}

func save_game():
	
	g_data = {
	"Max_health": 100,
	"Max_shield": GVar.Max_shield,
	"Coins": GVar.Coins,
	"Item1": GVar.Item1,
	"Item2": GVar.Item2,
	"Item3": GVar.Item3,
	"Item4": GVar.Item4,
	"Item5": GVar.Item5,
	"Monsters_killed": GVar.Monsters_killed,
	"Deaths": GVar.Deaths,
	}
	
	print("gonna save game")
	if GVar.on_game_save == "game_save_1":
		print("about to save game 1")
		Save_Game1_data()
	elif GVar.on_game_save == "game_save_2":
		print("about to save game 2")
		Save_Game2_data()
	elif GVar.on_game_save == "game_save_3":
		print("about to save game 3")
		Save_Game3_data()

func Save_Game1_data():
	var file = FileAccess.open(SAVE_FILE1, FileAccess.WRITE)
	var json = JSON.new()
	print(g_data)
	print(str(GVar.Coins))
	var json_string = json.stringify(g_data)
	file.store_line(json_string)
	print("just saved game 1")

func Save_Game2_data():
	var file = FileAccess.open(SAVE_FILE2, FileAccess.WRITE)
	var json = JSON.new()
	var json_string = json.stringify(g_data)
	file.store_line(json_string)
	print("just saved game 1")

func Save_Game3_data():
	var file = FileAccess.open(SAVE_FILE3, FileAccess.WRITE)
	var json = JSON.new()
	var json_string = json.stringify(g_data)
	file.store_line(json_string)
	print("just saved game 1")
