extends Node3D

signal add_coins

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$HUD.hide()
	$"SHOP TEXT/MarginContainer/Button".hide()
	$Shop_text_bounce.play("Text_bounce")
	$Move_head.play("Move_head")
	await get_tree().create_timer(5).timeout
	$AnimationPlayer.play("load_in")
	$HUD.show()
	await get_tree().create_timer(8.5).timeout
	$"SHOP TEXT/MarginContainer/Button".show()
	emit_signal("add_coins")

func _on_move_head_animation_finished(anim_name):
	$Move_head.play("Move_head")

func _on_shop_text_bounce_animation_finished(anim_name):
	$Shop_text_bounce.play_backwards("Text_bounce")

func _on_button_mouse_entered():
	$"SHOP TEXT".modulate = Color(0, 255, 255)

func _on_button_mouse_exited():
	$"SHOP TEXT".modulate = Color(255, 255, 255)


func _on_start_game_mouse_entered():
	$Cave_text.modulate = Color(0, 255, 255)


func _on_start_game_mouse_exited():
	$Cave_text.modulate = Color(255, 255, 255)

func _on_button_pressed():
	$Gotoshop.play("GotoShop")
	$"SHOP TEXT".modulate = Color(255, 255, 255)
	$"SHOP TEXT/MarginContainer/Button".hide()
	await get_tree().create_timer(1).timeout
	$Outside_level/shop_guy/MoveHead.stop()
	$Outside_level/shop_guy/AnimationPlayer.play("wave")
	await get_tree().create_timer(2.4).timeout
	$"SHOP TEXT/Shop_animation".play("show_shop")
	$"SHOP TEXT/MarginContainer2".show()
	$Outside_level/shop_guy/MoveHead.play("Move_head")
	

func _on_go_out_shop_pressed():
	$"SHOP TEXT/Shop_animation".play_backwards("show_shop")
	await get_tree().create_timer(0.5).timeout
	$"SHOP TEXT/MarginContainer2".hide()
	$Outside_level/shop_guy/AnimationPlayer.play("wave")
	await get_tree().create_timer(2.4).timeout
	$Gotoshop.play_backwards("GotoShop")
	await get_tree().create_timer(1).timeout
	$"SHOP TEXT/MarginContainer/Button".show()

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://levels/lvl_1.tscn")
