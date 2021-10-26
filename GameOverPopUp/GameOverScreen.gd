extends CanvasLayer


func _input(event):
	if event.is_action_pressed("test"):
		get_node("MarginContainer/PopupPanel").openOptionsMenu()
		#if not get_node("MarginContainer/PopupPanel").visible:
		#	get_node("PauseMenu").show()
		#else:
		#	get_node("PauseMenu").hide()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_BaeStation_istouched(touched):
	print("baestation was touched: ", touched)
	get_tree().paused = not get_tree().paused
	get_node("MarginContainer/PopupPanel").openOptionsMenu()
