extends HSlider

export var audio_bus_name := "SFX"

onready var _bus = AudioServer.get_bus_index(audio_bus_name)
onready var SFXPlayer:AudioStreamPlayer = $SFXPlayer
var loaded = false


func _ready() -> void:
	value = db2linear(AudioServer.get_bus_volume_db(_bus))
	
func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear2db(value))
	# So it doesn't play on start-
	if loaded:
		SFXPlayer.play()
	else:
		loaded = true
