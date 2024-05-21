extends Sprite2D

signal left_screen

const VELOCITY = Vector2(-500, 0)

var evaluated = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += delta * VELOCITY.x * Globals.speed
	if(position.x < -500 and !evaluated):
		evaluated = true
		left_screen.emit()

func _on_node_2d_reset():
	position.x = 1380
	evaluated = false


func _on_node_2d_reset_full():
	evaluated = true
	position.x = -700
