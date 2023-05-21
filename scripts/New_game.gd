extends Node

const SAVE_FILE1 = "user://game_save1.save"
const SAVE_FILE2 = "user://game_save2.save"
const SAVE_FILE3 = "user://game_save3.save"

var g_data = {
	"Max_health": 100,
	"Max_shield": 5,
	"Coins": 12,
	"Item1": null,
	"Item2": null,
	"Item3": null,
	"Item4": null,
	"Item5": null,
	"Monsters_killed": 0,
	"Deaths": 0,
	}

signal game_save_here

func Make_Game1_data():
	var file = FileAccess.open(SAVE_FILE1, FileAccess.WRITE)
	var json = JSON.new()
	var json_string = json.stringify(g_data)
	file.store_line(json_string)

func Make_Game2_data():
	var file = FileAccess.open(SAVE_FILE2, FileAccess.WRITE)
	var json = JSON.new()
	var json_string = json.stringify(g_data)
	file.store_line(json_string)

func Make_Game3_data():
	var file = FileAccess.open(SAVE_FILE3, FileAccess.WRITE)
	var json = JSON.new()
	var json_string = json.stringify(g_data)
	file.store_line(json_string)
