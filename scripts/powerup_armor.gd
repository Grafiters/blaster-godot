#scripts = powerup_armor
extends "res://scripts/powerup.gd"

func _ready():
	connect("area_enter", self, "_on_area_enter")
	pass

func _on_are_enter(other):
	if other.is_in_group("ship"):
		other.armor += 1
		queue_free()
	pass
