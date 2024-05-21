extends Node2D

signal clicked
signal type_change(type)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_clicked():
	if(is_visible_in_tree()):
		clicked.emit()

func set_type(type):
	type_change.emit(type)
