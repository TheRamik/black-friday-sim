extends StaticBody2D

signal istouched(touched)
var touched = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies:
		if body.name == "player":
			touched = true
			emit_signal("istouched", touched)
			touched = false
