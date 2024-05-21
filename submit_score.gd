extends Node2D

signal submit(name)
signal cancel

var username = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_submit_button_up():
	if(username == ""):
		return
	submit.emit(username)

func _on_name_text_changed(new_text):
	username = new_text

func _on_cancel_button_up():
	cancel.emit()

func open():
	visible = true

func close():
	visible = false
