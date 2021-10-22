extends Node2D

var RopePiece = preload("res://PowerCord/powercord.tscn")
var piece_length = 4.0
var rope_parts := []

func spawn_rope(start_pos: Vector2, end_pos: Vector2):
	var distance = start_pos.distance_to(end_pos)
	var segment_amount = round(distance / piece_length)
	
	for i in segment_amount:
		print(i)

func add_piece(parent: Object, id: int, spawn_angle: float) -> Object:
	var joint: PinJoint2D = parent.get_node("C/J") as PinJoint2D
	var piece : Object = RopePiece.instance() as Object
	piece.global_position = joint.global_position
	piece.roation = spawn_angle
	piece.parent = self
	piece.id = id
	add_child(piece)
	joint.node_a = parent.get_path()
	joint.node_b = piece.get_path()
	return piece
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
