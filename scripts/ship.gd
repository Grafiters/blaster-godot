#scripts : ship following mouse
extends Area2D

const scn_laser = preload("res://scenes/laser_ship.tscn")

func _ready():
	set_process(true)
	
	yield(utils.create_timer(0.5), "timeout")
	shoot()
	pass

func _process(delta):
	#tracking mouse
	var motion = (utils.mouse_pos.x - get_pos().x) * 0.2
	translate(Vector2(motion, 0))
	
	#clamping to view
	var pos = get_pos()
	pos.x = clamp(pos.x, 0+16, utils.view_size.width-16)
	set_pos(pos)
	pass	

func shoot():
	while true:
		var pos_left = get_node("cannons/left").get_global_pos()
		var pos_right = get_node("cannons/right").get_global_pos()
		create_laser(pos_left)
		create_laser(pos_right)
		
		yield(utils.create_timer(0.25), "timeout")
		pass

func create_laser(pos):
	var laser = scn_laser.instance()
	laser.set_pos(pos)
	utils.main_node.add_child(laser)
	pass