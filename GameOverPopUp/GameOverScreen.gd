extends CanvasLayer

onready var sfx_player = $SFXPlayer

func _input(event):
	if event.is_action_pressed("test"):
		get_node("MarginContainer/PopupPanel").openOptionsMenu()

func _on_BaeStation_istouched(touched):
	sfx_player.play()
	get_tree().paused = not get_tree().paused
	get_node("MarginContainer/PopupPanel").openOptionsMenu()
