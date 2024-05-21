extends Label

const TEXTS = [
	{ "threshold": 20, "msg": "Meh."},
	{ "threshold": 40, "msg": "Okay."},
	{ "threshold": 60, "msg": "Nice!"},
	{ "threshold": 80, "msg": "Wicked!"},
	{ "threshold": 100, "msg": "Amousing!!"},
	{ "threshold": 1000, "msg": "Mousestanding!!!"},
]

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.critique.connect(_on_final_evaluator_scored)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_final_evaluator_scored(points):
	for t in TEXTS:
		if(points < t.threshold):
			text = t.msg
			return
