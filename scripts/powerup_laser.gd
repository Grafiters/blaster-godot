#scripts = powerup_armor
extends "res://scripts/powerup.gd"

func _ready():
	connect("area_enter", self, "_on_area_enter")
	pass

func _on_are_enter(other):
	if other.is_in_group("ship"):
		other.is_double_shooting = true
		queue_free()
	pass
