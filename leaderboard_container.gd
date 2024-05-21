extends TabContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).duration = "weekly"
	get_child(1).duration = "monthly"
	get_child(2).duration = "alltime"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
