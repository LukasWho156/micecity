extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = get_parent().position.x
	if(pos < 0):
		volume_db = pos / 10
	elif(pos < 200):
		volume_db = 0
	else:
		volume_db = (200 - pos) / 10
	pass

func _on_finished():
	play()
	pass # Replace with function body.
