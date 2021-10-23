extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var touch_down := false
var increase_velocity := true
export var min_velocity := 300.0
export var max_velocity := 1000.0
export var launch_velocity := 600.0
export var gravity := 1000.0


# Called when the node enters the scene tree for the first time.
func _ready():
	set_bounce(0.5)
	set_friction(0.2)

func launch(force : Vector2) -> void:
	
	apply_impulse(Vector2.ZERO, force * 3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#	if (launch_velocity >= max_velocity):
	#		print("increase_velocity: ", launch_velocity)
	#		increase_velocity = false
	#	elif (launch_velocity <= min_velocity):
	#		increase_velocity = true
	#	if increase_velocity:
	#		launch_velocity += 5
	#	else:
	#		launch_velocity -= 5
	#	launch_velocity = clamp(launch_velocity, min_velocity, max_velocity)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_touch"):
		$RotationPoint.look_at(get_global_mouse_position())
		touch_down = true
	
	if not touch_down:
		return
		
	if event.is_action_released("ui_touch"):
		touch_down = false
	if event is InputEventMouseButton:
		if !event.is_pressed(): return
