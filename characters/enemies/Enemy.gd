extends Area2D

export (int) var speed = 150
export (int) var hp = 1
export (int) var damage = 1
export (int) var score = 10

onready var hit_sound = $HitSound

signal enemy_died(score, location)

func _physics_process(delta):
	global_position.y += speed * delta

func _on_Enemy_area_entered(area):
	if area is Player:
		area.take_damage(damage)

func take_damage(damage_taken):
	hp -= damage_taken
	hit_sound.play()
	if hp <= 0:
		queue_free()
		emit_signal("enemy_died", score, global_position)
