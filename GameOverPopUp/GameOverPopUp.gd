extends PopupPanel

func openOptionsMenu():
	popup_centered()
	
func closeOptionsMenu():
	hide()
	
func onRestartGameClicked(event: InputEvent) -> void:
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		get_tree().paused = not get_tree().paused
		get_tree().change_scene("res://Main/main.tscn")
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		get_tree().paused = not get_tree().paused
		get_tree().change_scene("res://Main/main.tscn")
		
func onMainMenuClicked(event):
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		get_tree().paused = not get_tree().paused
		get_tree().change_scene("res://UI/MainMenu.tscn")
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		get_tree().paused = not get_tree().paused
		get_tree().change_scene("res://UI/MainMenu.tscn")
		
func onExitGameClicked(event: InputEvent) -> void:
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		get_tree().quit()
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		get_tree().quit()

func onOptionsLabelClicked(event: InputEvent):
	if(event is InputEventKey):
		print("event is input event key")
	if(event is InputEventKey && event.pressed):
		print("event was pressed")
		print("scancode is: ", event.scancode)
	if(event is InputEventKey && event.pressed && event.scancode == KEY_ESCAPE):
		print("Escape pressed")
		openOptionsMenu()

func onBackLabelClicked(event: InputEvent):
	if(event is InputEventKey && event.pressed && event.scancode == KEY_ESCAPE):
		closeOptionsMenu()
