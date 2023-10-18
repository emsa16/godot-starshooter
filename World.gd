extends Node2D

var total_score = 0

onready var hud = $UILayer/HUD
onready var enemy_spawner = $EnemySpawner
onready var ui_layer = $UILayer

var GameOverMenu = preload("res://ui/GameOverMenu.tscn")

func _ready():
	update_score_and_hud(0)
	hud.update_lives($Player.hp)

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
	
func _on_Player_player_took_damage(hp_left):
	hud.update_lives(hp_left)


func _on_Player_player_died():
	var timer = get_tree().create_timer(3)
	yield(timer, "timeout")
	game_over()
	
func game_over():
	enemy_spawner.stop()
	var game_over_menu = GameOverMenu.instance()
	ui_layer.add_child(game_over_menu)
	game_over_menu.update_score(total_score)
