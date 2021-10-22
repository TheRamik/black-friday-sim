extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var bullet_velocity := 600.0
var gravity := 400.0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_bounce(0.5)
	set_friction(0.2)

func launch(force : Vector2) -> void:
	
	apply_impulse(Vector2.ZERO, force * 3)
	
func _process(delta: float) -> void:
	$RotationPoint.look_at(get_global_mouse_position())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
