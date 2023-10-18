extends Control

onready var score_label = $ScoreLabel

func update_score(val):
	score_label.text = "SCORE: " + str(val)
