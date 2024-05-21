extends Sprite2D

var evaluated = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func evaluate():
	var data = texture.get_image().data.data
	var red = 0
	var green = 0
	for i in data.size() / 4:
		red += data[i * 4]
		green += data[i * 4 + 1]
	var score = max(floor((green - red) * 0.001), 0)
	Globals.add_points(score, true)

func _on_box_left_screen():
	if(!evaluated):
		evaluate()

func _on_node_2d_reset():
	evaluated = false

func _on_node_2d_reset_full():
	evaluated = true
