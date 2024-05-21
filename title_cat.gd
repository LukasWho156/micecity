extends AnimatedSprite2D

signal enter

var started = false
var entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(started):
		position.x += delta * 200
	if(position.x > 500 and !entered):
		entered = true
		enter.emit()

func _on_title_start():
	started = true
