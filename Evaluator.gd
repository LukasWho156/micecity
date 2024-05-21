extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	texture = get_parent().get_parent().get_child(0).texture
	material.set_shader_parameter("artwork", get_parent().get_parent().get_child(1).texture)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	pass


func _on_node_2d_reset():
	texture = get_parent().get_parent().get_child(0).texture
