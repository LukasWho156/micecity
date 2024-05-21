extends Node2D

var draw_queue = []
var last_mouse_position = null

# Called when the node enters the scene tree for the first time.
func _ready():
	# draw_queue.append(Vector4(100, 100, 400, 300))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw():
	while(!draw_queue.is_empty()):
		var line = draw_queue.pop_front()
		var light_green = Color(Color.GREEN, 0.5)
		var start = Vector2(line.x, line.y)
		var end = Vector2(line.z, line.w)
		var width = (0.5 + 0.5 * pow(0.9, start.distance_to(end) / 5)) * 1.5
		draw_circle(start, 3 * width, light_green)
		draw_circle(end, 3 * width, light_green)
		draw_line(start, end, light_green, 10 * width)
		draw_line(start, end, light_green, 7 * width)
		draw_line(start, end, Color.GREEN, 3 * width)

func _on_graffiti_draw_start(pos):
	last_mouse_position = pos

func _on_graffiti_draw_move(pos):
	if(last_mouse_position == null):
		return
	draw_queue.append(Vector4(last_mouse_position.x, last_mouse_position.y, pos.x, pos.y))
	last_mouse_position = pos
	queue_redraw()

func _on_graffiti_draw_end():
	last_mouse_position = null

func _on_node_2d_reset():
	last_mouse_position = null
	draw_queue.clear()
	queue_redraw()
