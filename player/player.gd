extends RigidBody2D

func _ready() -> void:
	pass

func _physics_process(delta):
	var direction = sign(get_global_mouse_position().x - $Sprite.global_position.x)
	if (rotation_degrees >= 130 and rotation_degrees <= 220) or (rotation_degrees <= -130 and rotation_degrees >= -220):
		direction = direction * -1
		
	if direction < 0:
		$Sprite.set_flip_h(false)
		$CollisionPolygon2D.scale.x = 1.804
	else:
		$Sprite.set_flip_h(true)
		$CollisionPolygon2D.scale.x = -1.804
