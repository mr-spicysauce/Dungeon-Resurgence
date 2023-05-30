extends MarginContainer

var fps

func _physics_process(delta):
	if GVar.show_fps == true:
		show()
		fps = Engine.get_frames_per_second()
		$Control/fps.text = "FPS: " + str(fps)
		if Engine.get_frames_per_second() <= 30:
			$Control.modulate = Color(255,0,0)
		elif Engine.get_frames_per_second() <= 59:
			$Control.modulate = Color(255,255,0)
		if fps >= 60:
			$Control.modulate = modulate
	else:
		hide()
