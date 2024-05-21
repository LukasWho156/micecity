extends Sprite2D

const VELOCITY = 500

var running = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!running):
		return
	position.x -= VELOCITY * delta * Globals.speed
	if(position.x) <= -1280 * 2:
		position.x += 1280 * 3


func _on_node_2d_pause():
	running = false


func _on_node_2d_play():
	running = true
