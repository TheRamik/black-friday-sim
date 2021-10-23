extends Node2D

onready var line = $Line2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var touch_down := false
var max_points = 50.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_touch"):
		touch_down = true
	
	if not touch_down:
		return
		
	if event.is_action_released("ui_touch"):
		touch_down = false
		line.clear_points()
		
	if event is InputEventMouseMotion:
		$television.launch_velocity = clamp($television.launch_velocity, $television.min_velocity, $television.max_velocity)
		#vector = -(position_end - position_start).clamped(maximum_length)
		#update()
		
	#if event is InputEventMouseMotion:
	#	position_end = event.position
	#	$television.bullet_velocity = -(position_end - position_start).clamped(maximum_length)
	#	update()

func _physics_process(delta: float) -> void:
	if not touch_down:
		return
	update_trajectory(delta)
	
func update_trajectory(delta):
	line.clear_points()
	var pos = $television/RotationPoint/ShootPoint.global_position
	var vel = $television/RotationPoint/ShootPoint.global_transform.x * $television.launch_velocity
	for i in max_points:
		line.add_point(pos)
		vel.y += $television.gravity * delta
		pos += vel * delta
		# if Geometry.is_point_in_polygon($Terrain/Polygon2D.to_local(pos), $Terrain/Polygon2D.polygon):
		#	break
