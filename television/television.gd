extends RigidBody2D

var picked = false 
var move = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if move == true:
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "player" and get_node("../player").canPick == true:
				picked = true
				get_node("../player").canPick = false
				set_applied_force(Vector2())

# Called when there is an input event. 
func _input(event):
	if event.is_action_pressed("move_to_object"):
		move = true
		
	if event.is_action_released("move_to_object"):
		move = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_bounce(0.5)
	set_friction(0.2)

func launch(force : Vector2) -> void:
	picked = false
	move = false
	get_node("../player").canPick = true
	apply_impulse(Vector2.ZERO, force * 5)
