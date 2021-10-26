extends CanvasLayer

func _input(event):
	if event.is_action_pressed("pause"):
		if not get_node("PauseMenu").visible:
			get_node("PauseMenu").show()
		else:
			get_node("PauseMenu").hide()
