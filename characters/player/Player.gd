extends Area2D

class_name Player

export (int) var speed = 300
export (int) var hp = 3
export (int) var damage = 1

var input_vector = Vector2.ZERO

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	global_position.x += input_vector.x * speed * delta
	global_position.y += input_vector.y * speed * delta

	global_position.x = clamp(global_position.x, 0, 540)
	global_position.y = clamp(global_position.y, 0, 960)


func _on_Player_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(damage)

func take_damage(damage_taken):
	hp -= damage_taken
	if hp <= 0:
		queue_free()
