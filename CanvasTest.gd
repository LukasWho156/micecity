extends SubViewport

# Called when the node enters the scene tree for the first time.
func _ready():
	render_target_clear_mode = SubViewport.CLEAR_MODE_ONCE
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_node_2d_reset():
	render_target_clear_mode = SubViewport.CLEAR_MODE_ONCE
