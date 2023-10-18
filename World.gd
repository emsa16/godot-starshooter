extends Node2D

var total_score = 0

onready var hud = $HUD

func _ready():
	update_score_and_hud(0)

func spawn_laser(Laser, location):
	var laser = Laser.instance()
	add_child(laser)
	laser.global_position = location


func _on_EnemySpawner_spawn_enemy(EnemyScene, location):
	var enemy = EnemyScene.instance()
	add_child(enemy)
	enemy.global_position = location
	if enemy.has_signal("spawn_laser"):
		enemy.connect("spawn_laser", self, "spawn_laser")
	enemy.connect("enemy_died", self, "_on_enemy_died")

func _on_DeathZone_area_entered(area):
	area.queue_free()

func _on_enemy_died(score):
	update_score_and_hud(total_score + score)

func update_score_and_hud(val):
	total_score = val
	hud.update_score(val)
	
