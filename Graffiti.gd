extends Sprite2D

signal draw_start(pos)
signal draw_move(pos)
signal draw_end

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_node_2d_draw_start(pos):
	draw_start.emit((pos - global_position) / global_scale)

func _on_node_2d_draw_move(pos):
	draw_move.emit((pos - global_position) / global_scale)

func _on_node_2d_draw_end():
	draw_end.emit()
