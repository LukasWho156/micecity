extends Node2D

signal draw_start(pos)
signal draw_move(pos)
signal draw_end
signal reset
signal reset_full

var pressed = false
var evaluated = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _reset():
	evaluated = false
	pressed = false
	reset.emit()

func _reset_full():
	evaluated = true
	pressed = false
	reset_full.emit()

func _input(event):
	if(Globals.speed > 0.2):
		return
	if event is InputEventMouseButton:
		if(event.button_index == MOUSE_BUTTON_LEFT):
			if(event.pressed):
				draw_start.emit(get_global_mouse_position())
				pressed = true
			else:
				draw_end.emit()
				pressed = false
	elif event is InputEventMouseMotion:
		if(pressed):
			draw_move.emit(get_global_mouse_position())
