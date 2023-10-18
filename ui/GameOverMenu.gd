extends Control

onready var score_label = $Score

func _on_RetryButton_pressed():
	assert(get_tree().change_scene("res://World.tscn") == 0)

func _on_BackButton_pressed():
	assert(get_tree().change_scene("res://ui/MainMenu.tscn") == 0)

func update_score(val):
	score_label.text = "SCORE: " + str(val)
