extends "res://characters/enemies/Enemy.gd"

var Laser = preload("res://projectiles/EnemyLaser.tscn")

signal spawn_laser(Laser, location)

onready var muzzle = $Muzzle

func _on_Timer_timeout():
	emit_signal("spawn_laser", Laser, muzzle.global_position)
