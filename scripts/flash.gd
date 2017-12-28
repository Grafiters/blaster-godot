#scripts = flash
extends Sprite

func _ready():
	get_node("anim").play("fade_out")
	yield(get_node("anim"), "finished")
	queue_free()
	pass
