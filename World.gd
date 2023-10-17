extends Node2D

func _on_Player_spawn_laser(Laser, location):
	var laser = Laser.instance()
	add_child(laser)
	laser.global_position = location
	laser.vertical_direction = -1
