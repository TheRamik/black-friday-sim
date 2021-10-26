extends AudioStreamPlayer

export(Array, AudioStream) var audio_files: Array
var audio_files_size: int

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	audio_files_size = audio_files.size()

func play_random() ->  void:
	var random_index: = randi() % audio_files.size()
	stop()
	stream = audio_files[random_index]
	play()
