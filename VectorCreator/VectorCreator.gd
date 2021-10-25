extends Area2D

signal vector_created(vector)

export var maximum_length := 200

var touch_down := false
var position_start := Vector2.ZERO
var position_end := Vector2.ZERO

var vector := Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("input_event", self, "_on_input_event")

# Draws the lines for the vector
func _draw() -> void:
	draw_line(position_start - global_position,
		(position_end - global_position),
		Color.white, 
		8)
	
	draw_line(position_start - global_position,
		position_start - global_position + vector/2,
		Color.red,
		12)

# Resets the lines and the vectors back to 0
func _reset() -> void:
	position_start = Vector2.ZERO
	position_end = Vector2.ZERO
	vector = Vector2.ZERO
	update()

# Called when there is an input event. 
func _input(event) -> void:
	if not touch_down:
		return
		
	if event.is_action_released("ui_touch"):
		touch_down = false
		emit_signal("vector_created", vector)
		_reset()
		
	if event is InputEventMouseMotion:
		position_end = event.position
		vector = -(position_end - position_start).clamped(maximum_length)
		update()

# Our own input event that does extra work
func _on_input_event(_viewport, event, _shape_idx) -> void:
	if event.is_action_pressed("ui_touch"):
		touch_down = true
		position_start = event.position
