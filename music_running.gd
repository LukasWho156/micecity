extends AudioStreamPlayer

var target_volume = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	volume_db = -40
	play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(volume_db > target_volume):
		volume_db -= delta * 100
		if(volume_db < target_volume):
			volume_db = target_volume
	if(volume_db < target_volume):
		volume_db += delta * 100
		if(volume_db > target_volume):
			volume_db = target_volume

func _on_finished():
	play()

func _on_player_state_change(animation):
	if(animation == "run"):
		target_volume = 0
	if(animation == "brake"):
		target_volume = -40
