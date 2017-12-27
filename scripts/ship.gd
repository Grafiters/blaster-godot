#scripts : ship following mouse
extends Area2D

func _ready():
	set_process(true)
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