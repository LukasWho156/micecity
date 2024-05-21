extends AnimatedSprite2D

var tut_jump = false
var tut_brake = false
var tut_spray = false
var tut_accelerate = false
var right_open = false
var left_open = false

var target_scale = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	scale.x = target_scale
	scale.y = target_scale
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var s = (target_scale - scale.x) * (1 - pow(0.002, delta))
	scale.x += s
	scale.y += s
	if(Globals.speed <= 0.1 and !tut_spray):
		tut_spray = true
		tutorialize_left_click()
	if(Globals.cat_dist / Globals.MAX_CAT_DIST < 0.3 and !tut_accelerate):
		tut_accelerate = true
		tutorialize_right_click()

func tutorialize_left_click():
	target_scale = 1
	play("left_click")
	left_open = true

func tutorialize_right_click():
	target_scale = 1
	play("right_click")
	right_open = true

func _input(event):
	if(event is InputEventMouseButton):
		if(!event.pressed):
			return
		if(event.button_index == MOUSE_BUTTON_LEFT and left_open):
			target_scale = 0
			left_open = false
		if(event.button_index == MOUSE_BUTTON_RIGHT and right_open):
			target_scale = 0
			right_open = false

func _on_power_box_enter():
	if(!tut_brake):
		tut_brake = true
		tutorialize_right_click()

func _on_game_jump_tut():
	if(!tut_jump):
		tut_jump = true
		tutorialize_left_click()
