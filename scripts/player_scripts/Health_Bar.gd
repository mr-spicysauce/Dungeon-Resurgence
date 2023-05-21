extends HBoxContainer

func _physics_process(delta):
	$Health_bar.value = GVar.Max_health
	$Health_bar/health_bar_lable.text = str(GVar.Max_health) + "/100"
