extends RigidBody2D

var picked = false 
var move = false
var postLaunchCollision = false		#True if the tv has collided with something after being launched
var colTimerStopped = true
var cooldownGUI: TextureProgress
export var cooldownTime:float = 3.0
onready var t = Timer.new()
onready var sfx_player := $RandomSFXPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	t.set_wait_time(cooldownTime)
	t.set_one_shot(true)
	self.add_child(t)
	set_bounce(0.5)
	set_friction(0.2)

func _process(delta):
	cooldownGUI.value = t.time_left

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if move == true:
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "player" and get_node("../player").canPick == true && colTimerStopped:
				picked = true
				get_node("../player").canPick = false
				set_applied_force(Vector2())
	

# Called when there is an input event. 
func _input(event):
	if event.is_action_pressed("move_to_object"):
		move = true
		
	if event.is_action_released("move_to_object"):
		move = false
	
func launch(force : Vector2) -> void:
	sfx_player.play_random()
	start_collision_timer()
	picked = false
	move = false
	postLaunchCollision = false
	get_node("../player").canPick = true
	apply_impulse(Vector2.ZERO, force * 5)
	
func start_collision_timer() -> void:
	colTimerStopped = false
	t.start()
	yield(t, "timeout")
	colTimerStopped = true


func _on_television_body_entered(body):
	pass
	# Old code to renable on collision
#	if colTimerStopped && !postLaunchCollision:
#		postLaunchCollision = true
