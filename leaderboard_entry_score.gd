extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_leaderboard_entry_values_changed(username, score):
	text = "{score}".format({"score": score})

func open():
	pass