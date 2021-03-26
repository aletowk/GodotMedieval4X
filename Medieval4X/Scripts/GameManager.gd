extends Node2D

export var timer_period = 1.0
var _timer = null
var _player

func _ready():
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout",self,"_on_timer_timeout")
	_timer.set_wait_time(timer_period)
	_timer.set_one_shot(false)
	_timer.start()
	_player = PlayerManager.new()

func _on_timer_timeout():
	print("Second")
	_player.update_owned_ressources()
	print(_player.get_ressources_str())

