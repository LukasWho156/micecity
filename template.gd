extends Sprite2D

const GRAFFITIS = [
	preload("res://assets/graffiti_cheese.png"),
	preload("res://assets/graffiti_godot.png"),
	preload("res://assets/graffiti_gurtle.png"),
	preload("res://assets/graffiti_mickey.png"),
	preload("res://assets/graffiti_mike.png"),
	preload("res://assets/graffiti_mousarchy.png"),
	preload("res://assets/graffiti_mouse.png"),
	preload("res://assets/graffiti_mushroom.png"),
	preload("res://assets/graffiti_nikolaus.png"),
	preload("res://assets/graffiti_nocats.png"),
	preload("res://assets/graffiti_peace.png"),
	preload("res://assets/graffiti_skull.png"),
	preload("res://assets/graffiti_triforce.png"),
]

var global_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_time += delta
	material.set_shader_parameter("alpha", 0.375 + 0.125 * sin(global_time))

func _on_node_2d_reset():
	texture = GRAFFITIS.pick_random()
	pass # Replace with function body.
