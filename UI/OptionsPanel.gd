extends PopupPanel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func openOptionsMenu():
	popup_centered()
	
func closeOptionsMenu():
	hide()

func onOptionsLabelClicked(event: InputEvent):
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		openOptionsMenu()
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		openOptionsMenu()

func onBackLabelClicked(event: InputEvent):
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		closeOptionsMenu()
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		closeOptionsMenu()
