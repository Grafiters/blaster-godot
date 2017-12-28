#scripts = enemy
extends Area2D

export var armor = 2 setget set_armor
export var velocity = Vector2()

const scn_explosion = preload("res://scenes/explosion.tscn")

func _ready():
	set_process(true)
	add_to_group("enemy")
	connect("area_enter", self, "_on_area_enter")
	pass

func _process(delta):
	translate(velocity * delta)
	
	if get_pos().y-16 >= get_viewport_rect().size.height:
		queue_free()
	pass

func _on_area_enter(other):
	if other.is_in_group("ship"):
		other.armor -= 1
		create_explosion()
		queue_free()
	pass

func set_armor(new_value):
	if is_queued_for_deletion(): return
	armor = new_value
	
	if armor <= 0:
		utils.find_node("tex_score").score += 5
		create_explosion()
		queue_free()
	pass

func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.set_pos(get_pos())
	utils.main_node.add_child(explosion)
	pass

