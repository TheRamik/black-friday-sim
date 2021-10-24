extends RigidBody2D

export(NodePath) var toFollow
export var followSpeed: float
var objToFollow : CollisionObject2D


# Declare member variables here. Examples:
var moveVector : Vector2
var move := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_to_object"):
		move = true
		
	if event.is_action_released("move_to_object"):
		move = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if objToFollow and move:
		moveVector = objToFollow.position - position
		moveVector *= followSpeed
		print(moveVector)
		set_applied_force(moveVector)
	else:
		set_applied_force(Vector2())
	var direction = sign(get_global_mouse_position().x - $Sprite.global_position.x)
	if (rotation_degrees >= 130 and rotation_degrees <= 220) or (rotation_degrees <= -130 and rotation_degrees >= -220):
		direction = direction * -1
		
	if direction < 0:
		$Sprite.set_flip_h(false)
		# $CollisionPolygon2D.scale.x = 1.804
	else:
		$Sprite.set_flip_h(true)
		# $CollisionPolygon2D.scale.x = -1.804
