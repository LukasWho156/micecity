extends Sprite2D

signal done

var progress = 0;
var started = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(started):
		progress += delta * 2;
		material.set_shader_parameter("progress", progress)
		if(progress > 1.5):
			started = false
			done.emit()
	pass


func _on_cat_enter():
	started = true
