extends Label

const NOTIFICATION_TIME = 3
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.critique.connect(_on_final_evaluator_scored)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_final_evaluator_scored(score):
	text = "+{score}".format({ "score": score })
