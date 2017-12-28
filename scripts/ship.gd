#scripts : ship following mouse
extends Area2D

var armor = 4 setget set_armor
var is_double_shooting = false setget set_double_shooting

const scn_laser = preload("res://scenes/laser_ship.tscn")
const scn_explosion = preload("res://scenes/explosion.tscn")
const scn_flash = preload("res://scenes/flash.tscn")

signal armor_changed

func _ready():
	set_process(true)
	add_to_group("ship")
	
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
		
		if is_double_shooting:
			var laser_left = create_laser(pos_left)
			var laser_right = create_laser(pos_right)
			laser_left.velocity.x = -25
			laser_right.velocity.x = 25
		
		yield(utils.create_timer(0.25), "timeout")
		pass

func set_armor(new_value):
	if new_value > 4: return
	
	if new_value < armor:
		utils.main_node.add_child(scn_flash.instance())
	
	armor = new_value
	emit_signal("armor_changed", armor)
	
	if armor <= 0:
		create_explosion()
		queue_free()
	pass

func set_double_shooting(new_value):
	is_double_shooting = new_value
	
	if is_double_shooting:
		yield(utils.create_timer(5), "timeout")
		is_double_shooting = false
	pass

func create_laser(pos):
	var laser = scn_laser.instance()
	laser.set_pos(pos)
	utils.main_node.add_child(laser)
	return laser
	pass

func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.set_pos(get_pos())
	utils.main_node.add_child(explosion)
	pass
