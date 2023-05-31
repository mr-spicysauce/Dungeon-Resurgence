extends HBoxContainer

@onready var AnimPlayer = $"../AnimationPlayer1"

@onready var res_drop_down = $GraphicsMargin/VBoxContainer/resolution/OptionButton

var master_bus = AudioServer.get_bus_index("Master")
var UI_bus = AudioServer.get_bus_index("UI")
var Background_bus = AudioServer.get_bus_index("Background")

var vsync = false

func _ready():
	print(DisplayServer.screen_get_size())
	add_res_items()
	get_screen_size_drop_menu()
	$AudioMargin/VBoxContainer/master_audio/m_audio_slider.value = GVar.master_sound_db
	$AudioMargin/VBoxContainer/gui_audio/ui_audio_slider.value = GVar.ui_sound_dp

func _on_back_to_mainmenu_button_pressed():
	GSound.click()
	get_parent().get_parent().hide_options()

func _on_full_screen_check_box_toggled(button_pressed):
	GSound.click()
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		get_screen_size_drop_menu()
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(DisplayServer.screen_get_size())
		get_screen_size_drop_menu()

func add_res_items():
	res_drop_down.add_item("640x480")
	res_drop_down.add_item("1024x546")
	res_drop_down.add_item("1280x720")
	res_drop_down.add_item("1600x900")
	res_drop_down.add_item("1920x1080")
	res_drop_down.add_item("2560x1440")
	res_drop_down.add_item("3840x2160")

func _on_option_button_item_selected(index):
	GSound.click()
	var current_slected = index
	print(current_slected)
	
	if current_slected == 0:
		DisplayServer.window_set_size(Vector2i(640,480))
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	if current_slected == 1:
		DisplayServer.window_set_size(Vector2i(1024,546))
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	if current_slected == 2:
		DisplayServer.window_set_size(Vector2i(1280,720))
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	if current_slected == 3:
		DisplayServer.window_set_size(Vector2i(1600,900))
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	if current_slected == 4:
		DisplayServer.window_set_size(Vector2i(1920,1080))
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	if current_slected == 5:
		DisplayServer.window_set_size(Vector2i(2560,1440))
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	if current_slected == 6:
		DisplayServer.window_set_size(Vector2i(3840,2160))
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func get_screen_size_drop_menu():
	if DisplayServer.screen_get_size() == Vector2i(640,480):
		res_drop_down.selected = 0
	if DisplayServer.screen_get_size() == Vector2i(1024,546):
		res_drop_down.selected = 1
	if DisplayServer.screen_get_size() == Vector2i(1280,720):
		res_drop_down.selected = 2
	if DisplayServer.screen_get_size() == Vector2i(1600,900):
		res_drop_down.selected = 3
	if DisplayServer.screen_get_size() == Vector2i(1920,1080):
		res_drop_down.selected = 4
	if DisplayServer.screen_get_size() == Vector2i(2560,1440):
		res_drop_down.selected = 5
	if DisplayServer.screen_get_size() == Vector2i(3840,2160):
		res_drop_down.selected = 6

func _on_vsync_check_box_toggled(button_pressed):
	GSound.click()
	if button_pressed == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
		$GraphicsMargin/VBoxContainer/limitFPS.hide()
		Engine.max_fps = 9999
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		$GraphicsMargin/VBoxContainer/limitFPS.show()
		Engine.max_fps = $GraphicsMargin/VBoxContainer/limitFPS/HSlider.value

func _on_show_fps_check_box_toggled(button_pressed):
	GSound.click()
	if button_pressed == true:
		GVar.show_fps = true
	else:
		GVar.show_fps = false

func _on_graphics_setting_button_pressed():
	GSound.click()
	$AnimationPlayer.play("options_move")
	await get_tree().create_timer(0.4).timeout
	$MarginContainer.hide()
	position = Vector2(-300,0)
	$GraphicsMargin.show()
	$AnimationPlayer.play_backwards("move_graphics")

func _on_back_to_options_pressed():
	GSound.click()
	$AnimationPlayer.play("move_graphics")
	await get_tree().create_timer(0.4).timeout
	$MarginContainer.show()
	$GraphicsMargin.position = Vector2(-300,0)
	$GraphicsMargin.hide()
	$AnimationPlayer.play_backwards("options_move")

func _on_control_setting_button_2_pressed():
	GSound.click()
	$AnimationPlayer.play("options_move")
	await get_tree().create_timer(0.4).timeout
	$MarginContainer.hide()
	position = Vector2(-300,0)
	$ControlMargin.show()
	$AnimationPlayer.play_backwards("options_move")

func _on_back_to_options_control_button_down():
	GSound.click()
	$AnimationPlayer.play("options_move")
	await get_tree().create_timer(0.4).timeout
	$ControlMargin.hide()
	position = Vector2(-300,0)
	$MarginContainer.show()
	$AnimationPlayer.play_backwards("options_move")


func _on_audio_setting_button_pressed():
	GSound.click()
	$AnimationPlayer.play("options_move")
	await get_tree().create_timer(0.4).timeout
	$MarginContainer.hide()
	position = Vector2(-300,0)
	$AudioMargin.show()
	$AnimationPlayer.play_backwards("move_audio")

func _on_back_to_options_audio_pressed():
	GSound.click()
	$AnimationPlayer.play("move_audio")
	await get_tree().create_timer(0.4).timeout
	$MarginContainer.show()
	$GraphicsMargin.position = Vector2(-300,0)
	$AudioMargin.hide()
	$AnimationPlayer.play_backwards("options_move")

func _on_m_audio_slider_value_changed(value):
	
	$AudioMargin/VBoxContainer/master_audio/AudioStreamPlayer.play()
	
	AudioServer.set_bus_volume_db(master_bus, value)
	GVar.master_sound_db = value
	
	if value == -20:
		AudioServer.set_bus_mute(master_bus,true)
		$AudioMargin/VBoxContainer/master_audio/m_audio_text.text = "Master Audio: MUTE"
	elif value >= 0:
		AudioServer.set_bus_mute(master_bus,false)
		$AudioMargin/VBoxContainer/master_audio/m_audio_text.text = "Master Audio: +" + str(value) +"db"
	else:
		AudioServer.set_bus_mute(master_bus,false)
		$AudioMargin/VBoxContainer/master_audio/m_audio_text.text = "Master Audio: " + str(value) +"db"

func _on_b_audio_slider_value_changed(value):
	$AudioMargin/VBoxContainer/background_audio/b_audio_text.text = "Ambient Audio: " + str(value) +"db"

func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()

func _on_h_slider_value_changed(value):
	if vsync == false:
		$GraphicsMargin/VBoxContainer/limitFPS/Label.text = "Limit FPS: " + str(value)
		Engine.max_fps = value

func _on_check_box_toggled(button_pressed):
	GSound.click()
	if button_pressed == true:
		GVar.show_advanced_debug = true
	else:
		GVar.show_advanced_debug = false

func _on_ui_audio_slider_value_changed(value):
	
	$AudioMargin/VBoxContainer/gui_audio/AudioStreamPlayer.play()
	
	AudioServer.set_bus_volume_db(UI_bus, value)
	GVar.ui_sound_dp = value
	
	if value == -20:
		AudioServer.set_bus_mute(UI_bus,true)
		$AudioMargin/VBoxContainer/gui_audio/gui_audio_text.text = "Menu Audio: MUTE"
	elif value >= 0:
		AudioServer.set_bus_mute(UI_bus,false)
		$AudioMargin/VBoxContainer/gui_audio/gui_audio_text.text = "Menu Audio: +" + str(value) +"db"
	else:
		AudioServer.set_bus_mute(UI_bus,false)
		$AudioMargin/VBoxContainer/gui_audio/gui_audio_text.text = "Menu Audio: " + str(value) +"db"

func _on_bg_audio_slider_value_changed(value):
	
	$AudioMargin/VBoxContainer/background_audio/AudioStreamPlayer.play()
	
	AudioServer.set_bus_volume_db(Background_bus, value)
	GVar.bg_sound_db = value
	
	if value == -20:
		AudioServer.set_bus_mute(Background_bus,true)
		$AudioMargin/VBoxContainer/background_audio/bg_audio_text.text = "Ambient Audio: MUTE"
	elif value >= 0:
		AudioServer.set_bus_mute(Background_bus,false)
		$AudioMargin/VBoxContainer/background_audio/bg_audio_text.text = "Ambient Audio: +" + str(value) +"db"
	else:
		AudioServer.set_bus_mute(Background_bus,false)
		$AudioMargin/VBoxContainer/background_audio/bg_audio_text.text = "Ambient Audio: " + str(value) +"db"
