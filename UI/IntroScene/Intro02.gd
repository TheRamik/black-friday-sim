extends MarginContainer


func goToGame(event: InputEvent) -> void:
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		get_tree().change_scene("res://Main/main.tscn")
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		get_tree().change_scene("res://Main/main.tscn")
