extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	volume_db = -40 * Globals.cat_dist / Globals.MAX_CAT_DIST
	pass

func _on_finished():
	play()
	pass # Replace with function body.
