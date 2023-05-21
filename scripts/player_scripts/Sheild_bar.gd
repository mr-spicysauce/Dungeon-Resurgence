extends HBoxContainer

func _physics_process(delta):
	$Sheild_bar.value = GVar.Max_shield
	$Sheild_bar/Sheild_bar_lable.text = str(GVar.Max_shield) + "/100"
