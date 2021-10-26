extends CanvasLayer


func _input(event):
	if event.is_action_pressed("pause"):
		if not get_node("PauseMenu").visible:
			get_node("PauseMenu").show()
		else:
			get_node("PauseMenu").hide()
			

	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

