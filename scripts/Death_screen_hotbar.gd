extends MarginContainer

func _ready():
	load_items()

#This fuction loads the item images into the hotbar.
func load_items():
	if GVar.Item1 != null:
		var Item1_image
		Item1_image = load("res://recorces/HotBar_Item_textures/" + str(GVar.Item1) + ".png")
		print(GVar.Item1)
		$HotBar_margin/Hotbar/Slot_1/Image.texture = Item1_image
	else:
		$HotBar_margin/Hotbar/Slot_1/Image.texture = null

	if GVar.Item2 != null:
		var Item2_image
		Item2_image = load("res://recorces/HotBar_Item_textures/" + str(GVar.Item2) + ".png")
		$HotBar_margin/Hotbar/Slot_2/Image.texture = Item2_image
	else:
		$HotBar_margin/Hotbar/Slot_2/Image.texture = null

	if GVar.Item3 != null:
		var Item3_image
		Item3_image = load("res://recorces/HotBar_Item_textures/" + str(GVar.Item3) + ".png")
		$HotBar_margin/Hotbar/Slot_3/Image.texture = Item3_image
	else:
		$HotBar_margin/Hotbar/Slot_3/Image.texture = null

	if GVar.Item4 != null:
		var Item4_image
		Item4_image = load("res://recorces/HotBar_Item_textures/" + str(GVar.Item4) + ".png")
		$HotBar_margin/Hotbar/Slot_4/Image.texture = Item4_image
	else:
		$HotBar_margin/Hotbar/Slot_4/Image.texture = null

	if GVar.Item5 != null:
		var Item5_image
		Item5_image = load("res://recorces/HotBar_Item_textures/" + str(GVar.Item5) + ".png")
		$HotBar_margin/Hotbar/Slot_5/Image.texture = Item5_image
	else:
		$HotBar_margin/Hotbar/Slot_5/Image.texture = null
