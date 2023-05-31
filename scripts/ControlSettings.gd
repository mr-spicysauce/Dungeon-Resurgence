extends MarginContainer
var get_texture
var current_key

var key_change

func _on_forwards_input_button_down():
	GSound.click()
	$HBoxContainer/VBoxContainer/forwards_input/forwards_input_apply.show()
	key_change = "forwards"

func _on_forwards_input_apply_pressed():
	GSound.click()
	key_change = ""
	$HBoxContainer/VBoxContainer/forwards_input/HboxContainer/TextureRect.texture = get_texture
	$HBoxContainer/VBoxContainer/forwards_input/forwards_input_apply.hide()
	InputMap.action_erase_events("move_forward")
	InputMap.action_add_event("move_forward", current_key)

func _on_backwards_input_button_down():
	GSound.click()
	$HBoxContainer/VBoxContainer/backwards_input/backwards_input_apply.show()
	key_change = "backwards"

func _on_backwards_input_apply_pressed():
	GSound.click()
	key_change = ""
	$HBoxContainer/VBoxContainer/backwards_input/HboxContainer/TextureRect.texture = get_texture
	$HBoxContainer/VBoxContainer/backwards_input/backwards_input_apply.hide()
	InputMap.action_erase_events("move_backwards")
	InputMap.action_add_event("move_backwards", current_key)

func _on_right_input_pressed():
	GSound.click()
	$HBoxContainer/VBoxContainer/right_input/right_input_apply.show()
	key_change = "right"

func _on_right_input_apply_pressed():
	GSound.click()
	key_change = ""
	$HBoxContainer/VBoxContainer/right_input/HboxContainer/TextureRect.texture = get_texture
	$HBoxContainer/VBoxContainer/right_input/right_input_apply.hide()
	InputMap.action_erase_events("move_right")
	InputMap.action_add_event("move_right", current_key)

func _on_left_input_button_down():
	GSound.click()
	$HBoxContainer/VBoxContainer/left_input/left_input_apply.show()
	key_change = "left"

func _on_left_input_apply_pressed():
	GSound.click()
	key_change = ""
	$HBoxContainer/VBoxContainer/left_input/HboxContainer/TextureRect.texture = get_texture
	$HBoxContainer/VBoxContainer/left_input/left_input_apply.hide()
	InputMap.action_erase_events("move_left")
	InputMap.action_add_event("move_left", current_key)

func _on_jump_input_button_down():
	GSound.click()
	$HBoxContainer/VBoxContainer2/jump_input/jump_input_apply.show()
	key_change = "jump"

func _on_jump_input_apply_pressed():
	GSound.click()
	key_change = ""
	$HBoxContainer/VBoxContainer2/jump_input/HboxContainer/TextureRect.texture = get_texture
	$HBoxContainer/VBoxContainer2/jump_input/jump_input_apply.hide()
	InputMap.action_erase_events("jump")
	InputMap.action_add_event("jump", current_key)

func _on_sprint_input_2_pressed():
	GSound.click()
	$HBoxContainer/VBoxContainer2/sprint_input2/sprint_input_apply.show()
	key_change = "sprint"


func _on_sprint_input_apply_pressed():
	GSound.click()
	key_change = ""
	$HBoxContainer/VBoxContainer2/sprint_input2/HboxContainer/TextureRect.texture = get_texture
	$HBoxContainer/VBoxContainer2/sprint_input2/sprint_input_apply.hide()
	InputMap.action_erase_events("sprint")
	InputMap.action_add_event("sprint", current_key)

func _on_pickup_input_3_pressed():
	GSound.click()
	$HBoxContainer/VBoxContainer2/pickup_input3/pickup_input_apply.show()
	key_change = "pickup_items"

func _on_pickup_input_apply_pressed():
	GSound.click()
	key_change = ""
	$HBoxContainer/VBoxContainer2/pickup_input3/HboxContainer/TextureRect.texture = get_texture
	$HBoxContainer/VBoxContainer2/pickup_input3/pickup_input_apply.hide()
	InputMap.action_erase_events("pickup_items")
	InputMap.action_add_event("pickup_items", current_key)

func _on_drop_input_4_pressed():
	GSound.click()
	key_change="drop_items"
	$HBoxContainer/VBoxContainer2/drop_input4/drop_input_apply.show()

func _on_drop_input_apply_pressed():
	GSound.click()
	key_change=""
	$HBoxContainer/VBoxContainer2/drop_input4/HboxContainer/TextureRect.texture = get_texture
	$HBoxContainer/VBoxContainer2/drop_input4/drop_input_apply.hide()
	InputMap.action_erase_events("drop_items")
	InputMap.action_add_event("drop_items", current_key)

func _input(event):
	if event is InputEventKey:
		current_key = event
		get_texture = load("res://recorces/Xelu_Free_Controller&Key_Prompts/Keyboard & Mouse/Light/" + event.as_text() + "_Key_Light.png")
		
		if key_change == "forwards":
			$HBoxContainer/VBoxContainer/forwards_input/HboxContainer/TextureRect.texture = get_texture
		elif key_change =="backwards":
			$HBoxContainer/VBoxContainer/backwards_input/HboxContainer/TextureRect.texture = get_texture
		elif key_change =="right":
			$HBoxContainer/VBoxContainer/right_input/HboxContainer/TextureRect.texture = get_texture
		elif key_change =="left":
			$HBoxContainer/VBoxContainer/left_input/HboxContainer/TextureRect.texture = get_texture
		elif key_change =="jump":
			$HBoxContainer/VBoxContainer2/jump_input/HboxContainer/TextureRect.texture = get_texture
		elif key_change =="sprint":
			$HBoxContainer/VBoxContainer2/sprint_input2/HboxContainer/TextureRect.texture = get_texture
		elif key_change =="pickup_items":
			$HBoxContainer/VBoxContainer2/pickup_input3/HboxContainer/TextureRect.texture = get_texture
		elif key_change =="drop_items":
			$HBoxContainer/VBoxContainer2/drop_input4/HboxContainer/TextureRect.texture = get_texture

func _on_sens_slider_value_changed(value):
	$HBoxContainer/VBoxContainer2/sensContainer/Label.text = "Sensitivity: " + str(value)
	GVar.sensitivity = value
	GSound.click()
