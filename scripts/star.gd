#scripts = stars
extends Sprite

export var velocity = Vector2()

func _ready():
	set_process(true)
	pass

func _process(delta):
	translate(velocity * delta)
	
	if get_pos().y >= get_viewport_rect().size.height:
		set_pos(Vector2(0, -180))
	pass
