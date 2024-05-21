extends Node2D

const MAIN_SCENE = preload("res://game.tscn")

signal draw_start(pos)
signal draw_move(pos)
signal draw_end
signal start

var pressed = false
var started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(4).set_type("play")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if(started):
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


func _on_button_clicked():
	print("button")
	started = true
	start.emit()

func _on_transition_done():
	get_tree().root.add_child(MAIN_SCENE.instantiate())
	queue_free()
