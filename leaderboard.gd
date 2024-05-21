extends Node2D

signal load_scores
signal closed

# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(2).set_type("close")
	load_scores.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open():
	visible = true
	load_scores.emit()

func close():
	visible = false
	closed.emit()
