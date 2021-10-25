extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func closePauseMenu():
	self.hide()
	get_tree().paused = not get_tree().paused
	
func toggleOptionsMenu():
	$Panel/VBoxContainer/MusicLabel.visible = not $Panel/VBoxContainer/MusicLabel.visible
	$Panel/VBoxContainer/MusicSlider.visible = not $Panel/VBoxContainer/MusicSlider.visible 
	$Panel/VBoxContainer/SFXLabel.visible = not $Panel/VBoxContainer/SFXLabel.visible
	$Panel/VBoxContainer/SFXSlider.visible = not $Panel/VBoxContainer/SFXSlider.visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused

func _on_closeMenu_pressed(event):
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		closePauseMenu()
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		closePauseMenu()
		
func _on_mainMenu_pressed(event):
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		closePauseMenu()
		get_tree().change_scene("res://UI/MainMenu.tscn")
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		closePauseMenu()
		get_tree().change_scene("res://UI/MainMenu.tscn")
		
func _on_options_pressed(event):
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		toggleOptionsMenu()
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		toggleOptionsMenu()

func _on_exitGame_pressed(event: InputEvent) -> void:
	if(event is InputEventMouseButton && event.pressed && event.button_index == 1):
		get_tree().quit()
	elif(event is InputEventKey && event.pressed && event.scancode == KEY_ENTER):
		get_tree().quit()
