#scripts = laser_ship
extends "res://scripts/laser.gd"

func _ready():
	connect("area_enter", self, "_on_area_enter")
	pass

func _on_area_enter(other):
	if other.is_in_group("enemy"):
		other.armor -= 1
		create_flare()
		queue_free()
	pass
