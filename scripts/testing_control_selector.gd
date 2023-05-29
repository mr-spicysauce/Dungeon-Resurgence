extends Control

var read_input = false
var get_texture


func _on_button_pressed():
	read_input = true


func _input(event):
	
	$VBoxContainer/Label.text = "YOUR INPUT IS: " + event.as_text()
	get_texture = load("res://recorces/Xelu_Free_Controller&Key_Prompts/Keyboard & Mouse/Light/" + event.as_text() + "_Key_Light.png")
	$VBoxContainer/TextureRect.texture = get_texture
