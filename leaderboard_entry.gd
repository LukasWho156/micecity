extends Control

signal values_changed(username, score)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_values(username, score):
	values_changed.emit(username, score)
