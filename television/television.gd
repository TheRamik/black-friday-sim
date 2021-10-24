extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var picked = true

func _physics_process(delta):
	if picked == true:
		self.position = get_node("../player/Position2D").global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	set_bounce(0.5)
	set_friction(0.2)

func launch(force : Vector2) -> void:
	picked = false
	apply_impulse(Vector2.ZERO, force * 3)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
