extends Node

signal score_change(score)
signal critique(points)

const INITIAL_SPEED = 1.4
const SPEED_INCREASE = 1.0125
const BRAKE_SPEED = 0.05
const MAX_CAT_DIST = 20

var speed = INITIAL_SPEED
var temp_speed = INITIAL_SPEED
var braking = false
var accelerating = false

var score = 0

var cat_dist = MAX_CAT_DIST

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func brake():
	if(speed == 0):
		return
	if(!braking and !accelerating):
		temp_speed = speed
	accelerating = false
	braking = true
	
func accelerate():
	braking = false
	accelerating = true

func reset():
	speed = INITIAL_SPEED
	temp_speed = INITIAL_SPEED
	braking = false
	accelerating = false
	score = 0
	cat_dist = MAX_CAT_DIST
	score_change.emit(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cat_dist = cat_dist + 3 * speed * delta - temp_speed * delta
	if(cat_dist > MAX_CAT_DIST):
		cat_dist = MAX_CAT_DIST
	if(cat_dist <= 0):
		cat_dist = 0
	if(braking):
		if(speed > 0):
			speed -= BRAKE_SPEED
			if(speed <= 0):
				speed = 0
				braking = false
	elif(accelerating):
		if(speed < temp_speed):
			speed += BRAKE_SPEED
			if(speed >= temp_speed):
				speed = temp_speed
				accelerating = false
	else:
		speed *= pow(SPEED_INCREASE, delta)
	pass

func add_points(points, artwork = false):
	score += points
	score_change.emit(score)
	if(artwork):
		critique.emit(points)
