extends Node2D

const NOTIFICATION_TIME = 2
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	scale.x = 0
	scale.y = 0
	Globals.critique.connect(_on_final_evaluator_scored)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(timer > 0):
		timer -= delta
	if(timer < 0):
		timer = 0
	var s = 1 - 4 * pow(0.5 - (timer / NOTIFICATION_TIME), 2)
	scale.x = s
	scale.y = s
	rotation = 0.2 * sin(0.5 - (timer / NOTIFICATION_TIME))

func _on_final_evaluator_scored(score):
	timer = NOTIFICATION_TIME
