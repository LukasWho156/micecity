extends AnimatedSprite2D

var target_scale = 1
var scale_multiplier = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	play("restart")
	scale_multiplier = scale.x
	target_scale = scale_multiplier
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var add_scale = (target_scale - scale.x) * (1 - pow(0.01, delta))
	scale.x += add_scale
	scale.y += add_scale

func _on_button_hovered():
	target_scale = scale_multiplier * 1.1

func _on_button_unhovered():
	target_scale = scale_multiplier * 1

func _on_button_type_change(type):
	play(type)
