extends Line2D


export(NodePath) var pointA
export(NodePath) var pointB
onready var objAtPointA: Node2D = get_node(pointA)
onready var objAtPointB: Node2D = get_node(pointB)

var pos: PoolVector2Array
var pointCount: int


# Called when the node enters the scene tree for the first time.
func _ready():
	pointCount = 25
	resize_arrays()
	set_start(objAtPointA.global_position)
	set_last(objAtPointB.global_position)
	
func resize_arrays():
	pos.resize(pointCount)

func update_points():
	for i in range(pointCount):
		pos[i] = Vector2(10 * i, 10 * i)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_points()
	set_start(objAtPointA.global_position)
	set_last(objAtPointB.global_position)
	points = pos
	
func set_last(p:Vector2)->void:
	pos[-1] = p
	
func set_start(p:Vector2)->void:
	pos[0] = p
