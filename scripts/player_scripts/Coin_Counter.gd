extends MarginContainer

@onready var pickup_coin = preload("res://sound_effects/pickupCoin.wav")
@onready var remove_coin = preload("res://sound_effects/remove_coin.wav")

func _ready():
	update_coins()

func update_coins():
	$Coin_lable.text = "COINS: " + str(GVar.Coins)

func _physics_process(delta):
	if GVar.add_coins > 0:
		_coin_add(GVar.add_coins)
		GVar.add_coins = 0

func _coin_add(ammount):
	for i in ammount:
		GVar.Coins +=1
		var Sound_play = AudioStreamPlayer.new()
		self.add_child(Sound_play)
		
		Sound_play.set_stream(pickup_coin)
		Sound_play.volume_db = 0
		
		Sound_play.play()
		update_coins()
		Sound_play.finished.connect(func ():
			Sound_play.queue_free()
		)
		await get_tree().create_timer(0.1).timeout
	

func _coin_remove(ammount):
	for i in ammount:
		GVar.Coins -=1
		var Sound_play = AudioStreamPlayer.new()
		self.add_child(Sound_play)
		Sound_play.set_stream(remove_coin)
		Sound_play.volume_db = -20
		
		Sound_play.play()
		update_coins()
		Sound_play.finished.connect(func ():
			Sound_play.queue_free()
		)
		await get_tree().create_timer(0.1).timeout
	GVar.can_buy_item = true
