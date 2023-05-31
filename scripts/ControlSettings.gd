extends MarginContainer
var get_texture

func _on_forwards_input_button_down():
	
	$VBoxContainer/forwards_input/HboxContainer/TextureRect.texture = get_texture
	

func _on_backwards_input_button_down():
	pass # Replace with function body.


func _input(event):
	if event is InputEventKey:
		get_texture = load("res://recorces/Xelu_Free_Controller&Key_Prompts/Keyboard & Mouse/Light/" + event.as_text() + "_Key_Light.png")
