extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = 576 - 250 * max(1 - Globals.speed / Globals.temp_speed, 0)
	pass
