extends Node2D

onready var line = $Line2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var max_points = 500.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta: float) -> void:
	update_trajectory(delta)
	
func update_trajectory(delta):
	line.clear_points()
	var pos = $television/RotationPoint/ShootPoint.global_position
	print("$television/RotationPoint: ", $television/RotationPoint.global_position)
	print("$television: ", $television.global_position)
	print("pos: ", pos)
	var vel = $television/RotationPoint/ShootPoint.global_transform.x * $television.bullet_velocity
	for i in max_points:
		line.add_point(pos)
		vel.y += $television.gravity * delta
		pos += vel * delta
		# if Geometry.is_point_in_polygon($Terrain/Polygon2D.to_local(pos), $Terrain/Polygon2D.polygon):
		#	break
