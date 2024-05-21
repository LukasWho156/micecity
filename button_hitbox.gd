extends Area2D

signal hovered
signal unhovered
signal clicked

var hover = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _mouse_enter():
	hover = true
	hovered.emit()

func _mouse_exit():
	hover = false
	unhovered.emit()

func _input(event):
	if(!hover):
		return
	if(event is InputEventMouseButton):
		if(event.button_index == MOUSE_BUTTON_LEFT and !event.pressed):
			clicked.emit()
