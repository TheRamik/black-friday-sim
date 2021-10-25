extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Replace with function body.
	$player.toFollow = $television
	$player.objToFollow = $television

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $television.picked:
		$player.position = $television/Position2D.global_position
		_enableVectorLauncher()
	else:
		$television/CanvasLayer/VectorCreator.visible = false

func _enableVectorLauncher()->void:
	if $television.colTimerStopped:
		$television/CanvasLayer/VectorCreator.visible = true
		$television.colTimerStopped = false


# Called every frame. 'delta' is the elapsed time since the previous frame.	
func _physics_process(delta):
	if $television.picked:
		$player.add_force(Vector2(), Vector2())
		$player.set_applied_force(Vector2())
