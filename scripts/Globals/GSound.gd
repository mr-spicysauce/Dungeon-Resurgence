extends Node

@onready var hover_sound = preload("res://sound_effects/click.wav")

@onready var button_click = preload("res://sound_effects/button_click.wav")

func click():
	var sound_play = AudioStreamPlayer.new()
	add_child(sound_play)
	sound_play.set_stream(button_click)
	sound_play.set_bus("UI")
	sound_play.play()
	sound_play.finished.connect(func ():
		sound_play.queue_free()
	)
