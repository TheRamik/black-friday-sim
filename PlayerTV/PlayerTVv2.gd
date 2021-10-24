extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Replace with function body.
	$player.toFollow = $television
	$player.objToFollow = $television
