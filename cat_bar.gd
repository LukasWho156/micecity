extends Polygon2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale.x = Globals.cat_dist / Globals.MAX_CAT_DIST
	position.x = 9 + (1 - scale.x) * 223
