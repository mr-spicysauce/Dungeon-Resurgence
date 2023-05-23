extends Node

var item_to_buy

var coins_cost
var item_name
var shield_cost

func change_image(image):
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/VBoxContainer/TextureRect".texture = image

func change_damge(damage):
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/DamageLable".show()
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/DamageLable".text = str(damage)

func change_cost(cost):
	coins_cost = cost
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/VBoxContainer2/CostLable".text = str("cost: " + str(cost))

func change_item_type(type):
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats/ItemTypeLable".text = str("Item Type: " + type)

func change_item_name(name):
	item_name = name
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/VBoxContainer/Name".text = str(name)

func change_atk_speed(speed):
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/AttackSpeedLable".show()
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/AttackSpeedLable".text = str(speed)

func change_item_info(info):
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/VBoxContainer/Extra_info".text = str(info)

func _on_short_sword_pressed():
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/VBoxContainer".hide()
	item_to_buy = "short_sword"
	change_cost(GVar.Item_list.get("short_sword").get("cost"))
	change_damge( "Damage: " + str(GVar.Item_list.get("short_sword").get("damage")))
	change_item_name("Short Sword")
	change_item_type(GVar.Item_list.get("short_sword").get("type"))
	change_item_info("This is a short sword, not much to say")
	change_atk_speed( "Attack Speed: " + str(GVar.Item_list.get("short_sword").get("atk_speed")))
	change_image(load("res://recorces/HotBar_Item_textures/short_sword.png"))

func _on_long_sword_pressed():
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/VBoxContainer".hide()
	item_to_buy = "long_sword"
	change_cost(GVar.Item_list.get("long_sword").get("cost"))
	change_damge( "Damage: " + str(GVar.Item_list.get("long_sword").get("damage")))
	change_item_name("Long Sword")
	change_item_type(GVar.Item_list.get("long_sword").get("type"))
	change_item_info("This is a long sword, not much to say")
	change_atk_speed( "Attack Speed: " + str(GVar.Item_list.get("long_sword").get("atk_speed")))
	change_image(load("res://recorces/HotBar_Item_textures/long_sword.png"))

func _on_big_health_potoin_pressed():
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/VBoxContainer".hide()
	item_to_buy = "big_health"
	change_cost(GVar.Item_list.get("big_health").get("cost"))
	change_damge( "Health Gain: " + str(GVar.Item_list.get("big_health").get("healing")))
	change_item_name("Big Health Potion")
	change_item_type(GVar.Item_list.get("big_health").get("type"))
	change_item_info("This is a health potion, use it for more health")
	change_atk_speed( "Drink Speed: " + str(GVar.Item_list.get("big_health").get("atk_speed")))
	change_image(load("res://recorces/HotBar_Item_textures/big_health.png"))

func _on_small_health_potoin_pressed():
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/VBoxContainer".hide()
	item_to_buy = "small_health"
	change_cost(GVar.Item_list.get("small_health").get("cost"))
	change_damge("Health Gain: " + str(GVar.Item_list.get("small_health").get("healing")))
	change_item_name("Small Health Potion")
	change_item_type(GVar.Item_list.get("small_health").get("type"))
	change_item_info("This is a health potion, use it for more health")
	change_atk_speed( "Drink Speed: " + str(GVar.Item_list.get("small_health").get("atk_speed")))
	change_image(load("res://recorces/HotBar_Item_textures/small_health.png"))

func _on_more_shield_pressed():
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/VBoxContainer".show()
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/DamageLable".hide()
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/AttackSpeedLable".hide()
	item_to_buy = "shield"
	change_cost(str(shield_cost))
	change_item_name("Shield")
	change_item_type("shield")
	change_item_info("You can buy more Shield for 1 coin per Shield point")
	change_image(load("res://recorces/HotBar_Item_textures/sheild.png"))

func _on_brick_pressed():
	$"../MarginContainer2/MarginContainer/HBoxContainer/background/MarginContainer/Control/HBoxItemStats/VBoxItemStats2/VBoxContainer".hide()
	item_to_buy = "brick"
	change_cost(GVar.Item_list.get("brick").get("cost"))
	change_damge( "Damage: " + str(GVar.Item_list.get("brick").get("damage")))
	change_item_name("Brick")
	change_item_type(GVar.Item_list.get("brick").get("type"))
	change_item_info("This the last hope. A brick... Good luck!")
	change_atk_speed( "Attack Speed: " + str(GVar.Item_list.get("brick").get("atk_speed")))
	change_image(load("res://recorces/HotBar_Item_textures/brick.png"))

func _on_buy_item_pressed():
	$"../MarginContainer2/ConfirmationDialog".popup_centered()
	$"../MarginContainer2/ConfirmationDialog".dialog_text = "Are you sure you want to buy " + str(item_name) + " for " + str(coins_cost) + " coins?"

func _on_confirmation_dialog_confirmed():
	var money_needed
	
	if GVar.can_buy_item == true:
		if GVar.Coins >= coins_cost:
			
			if item_to_buy == "shield":
				GVar.can_buy_item = false
				GVar.Max_shield += shield_cost
				$"../../HUD/Coin_MarginContainer"._coin_remove(coins_cost)
				$"../../HUD/InventrySystem".load_items()
			else:
				if GVar.Item1 == null :
					GVar.can_buy_item = false
					GVar.Item1 = item_to_buy
					$"../../HUD/Coin_MarginContainer"._coin_remove(coins_cost)
					$"../../HUD/InventrySystem".load_items()
				else :
					if GVar.Item2 == null:
						GVar.can_buy_item = false
						GVar.Item2 = item_to_buy
						$"../../HUD/Coin_MarginContainer"._coin_remove(coins_cost)
						$"../../HUD/InventrySystem".load_items()
					else:
						if GVar.Item3 == null:
							GVar.can_buy_item = false
							GVar.Item3 = item_to_buy
							$"../../HUD/Coin_MarginContainer"._coin_remove(coins_cost)
							$"../../HUD/InventrySystem".load_items()
						else:
							if GVar.Item4 == null:
								GVar.can_buy_item = false
								GVar.Item4 = item_to_buy
								$"../../HUD/Coin_MarginContainer"._coin_remove(coins_cost)
								$"../../HUD/InventrySystem".load_items()
							else:
								if GVar.Item5 == null:
									GVar.can_buy_item = false
									GVar.Item5 = item_to_buy
									$"../../HUD/Coin_MarginContainer"._coin_remove(coins_cost)
									$"../../HUD/InventrySystem".load_items()
								else:
									$"../MarginContainer2/No_space_popup".popup_centered() 
		else:
			money_needed = coins_cost - GVar.Coins
			$"../MarginContainer2/No_money_popip".popup_centered()
			$"../MarginContainer2/No_money_popip".dialog_text = str("Not enough money! You need " + str(money_needed) + " more coins!")

func _on_spin_box_value_changed(value):
	shield_cost = value
	change_cost(value)
