extends VBoxContainer


func startGame(event: InputEvent) -> void:
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		get_tree().change_scene("res://UI/IntroScene/Intro01.tscn")
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		get_tree().change_scene("res://UI/IntroScene/Intro01.tscn")


func exitGame(event: InputEvent) -> void:
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		get_tree().quit()
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		get_tree().quit()
