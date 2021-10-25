extends PopupPanel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func openOptionsMenu():
	popup_centered()
	
func closeOptionsMenu():
	hide()
	
func onRestartGameClicked(event: InputEvent) -> void:
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		get_tree().change_scene("res://test.tscn")
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		get_tree().change_scene("res://test.tscn")
		
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
