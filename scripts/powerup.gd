#scripts = powerup_armor
extends Area2D

var velocity = Vector2(0, 200)

func _ready():
	set_process(true)
	pass

func _process(delta):
	translate(velocity * delta)
	
	if get_pos().y >= utils.view_size.height+7:
		queue_free()
	pass
