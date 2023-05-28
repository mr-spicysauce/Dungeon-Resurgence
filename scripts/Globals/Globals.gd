extends Node

func _physics_process(delta):
	Max_health = clamp(Max_health,0,100)
	Max_shield = clamp(Max_shield,0,100)
	Coins = round(Coins)

#Player stats (All needs to be saved for when you load the game)
var Max_health = 100
var Max_shield = 0
var Coins = 40
var Item1 = "long_sword"
var Item2 = "short_sword"
var Item3 = "big_health"
var Item4 = "big_health"
var Item5 = "brick"
var Monsters_killed = 0
var Deaths = 0

#Player stats that need to be loaded at all times
var on_game_save
var Item_to_pickup
var Can_pickup
var Item_slot
var Holding_item
var Item_type
var Item_damage
var Item_atk_speed
var player_pos = Vector3(0,0,0)
var player_rotation
var item_drop_pos
var is_ingame = false
var add_coins = 0
var just_quit = false
var bad_guys_killed_in_lvl = 0
var bad_guys_to_kill = 0
var difficulty = 1
var can_buy_item = true

#func  _ready():
#	print(Item_list.get("short_sword").get("damage"))

#this is a list of every item in the game
var Item_list = {

	"short_sword":
	{
		"type":"melee",
		"damage":5,
		"atk_speed":0.3,
		"cost":12
	},

	"long_sword":
	{
		"type":"melee",
		"damage":11,
		"atk_speed":0.6,
		"cost": 24
	},

	"big_health":
	{
		"type":"health_pot",
		"healing":50,
		"atk_speed":1,
		"cost":40
	},

	"small_health":
	{
		"type":"health_pot",
		"healing":25,
		"atk_speed":0.75,
		"cost":20
	},

	"brick":
	{
		"type": "melee",
		"damage":1,
		"atk_speed":0.5,
		"cost":0
	}

}
