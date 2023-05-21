extends Node

var selected_hotbar = load("res://recorces/GUI/Hotbar selected.png")
var hotbar = load("res://recorces/GUI/Hotbar slot.png")

func _ready():
	load_items()

#This fuction loads the item images into the hotbar.
func load_items():
	if GVar.Item1 != null:
		var Item1_image
		Item1_image = load("res://recorces/HotBar_Item_textures/" + str(GVar.Item1) + ".png")
		print(GVar.Item1)
		$"../HotBar_margin/Hotbar/Slot_1/Image".texture = Item1_image
	else:
		$"../HotBar_margin/Hotbar/Slot_1/Image".texture = null

	if GVar.Item2 != null:
		var Item2_image
		Item2_image = load("res://recorces/HotBar_Item_textures/" + str(GVar.Item2) + ".png")
		$"../HotBar_margin/Hotbar/Slot_2/Image".texture = Item2_image
	else:
		$"../HotBar_margin/Hotbar/Slot_2/Image".texture = null

	if GVar.Item3 != null:
		var Item3_image
		Item3_image = load("res://recorces/HotBar_Item_textures/" + str(GVar.Item3) + ".png")
		$"../HotBar_margin/Hotbar/Slot_3/Image".texture = Item3_image
	else:
		$"../HotBar_margin/Hotbar/Slot_3/Image".texture = null

	if GVar.Item4 != null:
		var Item4_image
		Item4_image = load("res://recorces/HotBar_Item_textures/" + str(GVar.Item4) + ".png")
		$"../HotBar_margin/Hotbar/Slot_4/Image".texture = Item4_image
	else:
		$"../HotBar_margin/Hotbar/Slot_4/Image".texture = null

	if GVar.Item5 != null:
		var Item5_image
		Item5_image = load("res://recorces/HotBar_Item_textures/" + str(GVar.Item5) + ".png")
		$"../HotBar_margin/Hotbar/Slot_5/Image".texture = Item5_image
	else:
		$"../HotBar_margin/Hotbar/Slot_5/Image".texture = null

func _input(event):

	if GVar.is_ingame == true:

		if Input.is_action_just_pressed("select_item_1"):
			if GVar.Item_slot == 1:
				GVar.Item_slot = null
				$"../HotBar_margin/Hotbar/Slot_1".texture = hotbar
			else:
				GVar.Item_slot = 1
				GVar.Holding_item = GVar.Item1
				$"../HotBar_margin/Hotbar/Slot_1".texture = selected_hotbar
				$"../HotBar_margin/Hotbar/Slot_2".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_3".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_4".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_5".texture = hotbar
			load_current_item_stats(str(GVar.Item1))

		if Input.is_action_just_pressed("select_item_2"):
			if GVar.Item_slot == 2:
				GVar.Item_slot = null
				$"../HotBar_margin/Hotbar/Slot_2".texture = hotbar
			else:
				GVar.Item_slot = 2
				GVar.Holding_item = GVar.Item2
				$"../HotBar_margin/Hotbar/Slot_1".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_2".texture = selected_hotbar
				$"../HotBar_margin/Hotbar/Slot_3".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_4".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_5".texture = hotbar
			load_current_item_stats(str(GVar.Item2))

		if Input.is_action_just_pressed("select_item_3"):
			if GVar.Item_slot == 3:
				GVar.Item_slot = null
				$"../HotBar_margin/Hotbar/Slot_3".texture = hotbar
			else:
				GVar.Item_slot = 3
				GVar.Holding_item = GVar.Item3
				$"../HotBar_margin/Hotbar/Slot_1".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_2".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_3".texture = selected_hotbar
				$"../HotBar_margin/Hotbar/Slot_4".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_5".texture = hotbar
			load_current_item_stats(str(GVar.Item3))

		if Input.is_action_just_pressed("select_item_4"):
			if GVar.Item_slot == 4:
				GVar.Item_slot = null
				$"../HotBar_margin/Hotbar/Slot_4".texture = hotbar
			else:
				GVar.Item_slot = 4
				GVar.Holding_item = GVar.Item4
				$"../HotBar_margin/Hotbar/Slot_1".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_2".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_3".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_4".texture = selected_hotbar
				$"../HotBar_margin/Hotbar/Slot_5".texture = hotbar
			load_current_item_stats(str(GVar.Item4))

		if Input.is_action_just_pressed("select_item_5"):
			if GVar.Item_slot == 5:
				GVar.Item_slot = null
				$"../HotBar_margin/Hotbar/Slot_5".texture = hotbar
			else:
				GVar.Item_slot = 5
				GVar.Holding_item = GVar.Item5
				$"../HotBar_margin/Hotbar/Slot_1".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_2".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_3".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_4".texture = hotbar
				$"../HotBar_margin/Hotbar/Slot_5".texture = selected_hotbar
			load_current_item_stats(str(GVar.Item5))

		if Input.is_action_just_pressed("pickup_items"):
		
			if GVar.Item_slot == null:
				pass
			
			if GVar.Item_to_pickup != null and GVar.Item_slot == 1 and GVar.Item1 == null:
				GVar.Item1 = GVar.Item_to_pickup
				GVar.Item_to_pickup = null
				GVar.Can_pickup = true
				GVar.Holding_item = GVar.Item1
				load_items()
				load_current_item_stats(GVar.Item1)

			if GVar.Item_to_pickup != null and GVar.Item_slot == 2 and GVar.Item2 == null:
				GVar.Item2 = GVar.Item_to_pickup
				GVar.Item_to_pickup = null
				GVar.Can_pickup = true
				GVar.Holding_item = GVar.Item2
				load_items()
				load_current_item_stats(GVar.Item2)

			if GVar.Item_to_pickup != null and GVar.Item_slot == 3 and GVar.Item3 == null:
				GVar.Item3 = GVar.Item_to_pickup
				GVar.Item_to_pickup = null
				GVar.Can_pickup = true
				GVar.Holding_item = GVar.Item3
				load_items()
				load_current_item_stats(GVar.Item3)

			if GVar.Item_to_pickup != null and GVar.Item_slot == 4 and GVar.Item4 == null:
				GVar.Item4 = GVar.Item_to_pickup
				GVar.Item_to_pickup = null
				GVar.Can_pickup = true
				GVar.Holding_item = GVar.Item4
				load_items()
				load_current_item_stats(GVar.Item4)

			if GVar.Item_to_pickup != null and GVar.Item_slot == 5 and GVar.Item5 == null:
				GVar.Item5 = GVar.Item_to_pickup
				GVar.Item_to_pickup = null
				GVar.Can_pickup = true
				GVar.Holding_item = GVar.Item5
				load_items()
				load_current_item_stats(GVar.Item5)

		if Input.is_action_just_pressed("drop_items"):

			if GVar.Item_slot == 1 and GVar.Item1 != null:
				var item_name = GVar.Item1
				var new_item
				new_item = ResourceLoader.load("res://game_items/" + item_name + ".tscn")
				new_item = new_item.instantiate()
				get_parent().get_parent().get_parent().add_child(new_item)
				print(GVar.item_drop_pos)
				new_item.global_position = GVar.item_drop_pos
				GVar.Item1 = null
				GVar.Holding_item = null
				load_items()

			if GVar.Item_slot == 2 and GVar.Item2 != null:
				var item_name = GVar.Item2
				var new_item
				new_item = ResourceLoader.load("res://game_items/" + item_name + ".tscn")
				new_item = new_item.instantiate()
				get_parent().get_parent().get_parent().add_child(new_item)
				print(GVar.item_drop_pos)
				new_item.global_position = GVar.item_drop_pos
				GVar.Item2 = null
				GVar.Holding_item = null
				load_items()

			if GVar.Item_slot == 3 and GVar.Item3 != null:
				var item_name = GVar.Item3
				var new_item
				new_item = ResourceLoader.load("res://game_items/" + item_name + ".tscn")
				new_item = new_item.instantiate()
				get_parent().get_parent().get_parent().add_child(new_item)
				print(GVar.item_drop_pos)
				new_item.global_position = GVar.item_drop_pos
				GVar.Item3 = null
				GVar.Holding_item = null
				load_items()

			if GVar.Item_slot == 4 and GVar.Item4 != null:
				var item_name = GVar.Item4
				var new_item
				new_item = ResourceLoader.load("res://game_items/" + item_name + ".tscn")
				new_item = new_item.instantiate()
				get_parent().get_parent().get_parent().add_child(new_item)
				print(GVar.item_drop_pos)
				new_item.global_position = GVar.item_drop_pos
				GVar.Item4 = null
				GVar.Holding_item = null
				load_items()

			if GVar.Item_slot == 5 and GVar.Item5 != null:
				var item_name = GVar.Item5
				var new_item
				new_item = ResourceLoader.load("res://game_items/" + item_name + ".tscn")
				new_item = new_item.instantiate()
				get_parent().get_parent().get_parent().add_child(new_item)
				print(GVar.item_drop_pos)
				new_item.global_position = GVar.item_drop_pos
				GVar.Item5 = null
				GVar.Holding_item = null
				load_items()

func used_item():
	GVar.Holding_item = null
	if GVar.Item_slot == 1:
		GVar.Item1 = null
	elif GVar.Item_slot == 2:
		GVar.Item2 = null
	elif GVar.Item_slot == 3:
		GVar.Item3 = null
	elif GVar.Item_slot == 4:
		GVar.Item4 = null
	elif GVar.Item_slot == 5:
		GVar.Item5 = null
	load_items()

func load_current_item_stats(Item_name):
	if str(Item_name) != "<null>" and GVar.Item_list.get(Item_name).get("type") == "melee":
		GVar.Item_damage = GVar.Item_list.get(Item_name).get("damage")
		GVar.Item_atk_speed =GVar.Item_list.get(Item_name).get("atk_speed")
