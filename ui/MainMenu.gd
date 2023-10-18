extends Control



func _on_StartButton_pressed():
	assert(get_tree().change_scene("res://World.tscn") == OK)

func _on_QuitButton_pressed():
	get_tree().quit()
