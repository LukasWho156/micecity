extends Label

var label_text

# Called when the node enters the scene tree for the first time.
func _ready():
	label_text = text 
	Globals.score_change.connect(_on_score_change)
	_on_score_change(0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_score_change(score):
	text = "{label}: {score}".format({ "label": label_text, "score": score })
