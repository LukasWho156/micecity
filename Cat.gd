extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = 50 - 1000 * Globals.cat_dist / Globals.MAX_CAT_DIST
	pass
