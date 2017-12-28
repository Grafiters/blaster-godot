#scripts = spawner_powerup
extends Node

const powerups = [
	preload("res://scenes/powerup_armor.tscn"),
	preload("res://scenes/powerup_laser.tscn")
]

func _ready():
	yield(utils.create_timer(rand_range(10, 15)), "timeout")
	spawn()
	pass

func spawn():
	while(true):
		randomize()
		
		var enemy = utils.choose(powerups).instance()
		var pos = Vector2()
		pos.x = rand_range(0+7, utils.view_size.width-7)
		pos.y = 0-7
		enemy.set_pos(pos)
		get_node("container").add_child(enemy)
		yield(utils.create_timer(rand_range(10, 15)), "timeout")
	pass