extends RigidBody2D

export(NodePath) var toFollow
onready var objToFollow : CollisionObject2D = get_node(toFollow)


# Declare member variables here. Examples:
var moveVector : Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	print(toFollow)
	print(objToFollow.position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	moveVector = objToFollow.position - position
	set_applied_force((moveVector))
