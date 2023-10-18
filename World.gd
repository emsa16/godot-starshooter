extends Node2D

func _on_Player_spawn_laser(Laser, location):
	var laser = Laser.instance()
	add_child(laser)
	laser.global_position = location


func _on_ShootingEnemy_spawn_laser(Laser, location):
	var laser = Laser.instance()
	add_child(laser)
	laser.global_position = location
