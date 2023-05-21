@tool
extends RigidBody3D

var health = 100

func test_dam():
	health = health - GVar.Item_damage
	$Sprite3D/SubViewport/TextureProgressBar.value = health

func _ready():
	$Sprite3D/SubViewport.size = $Sprite3D/SubViewport/TextureProgressBar.size
