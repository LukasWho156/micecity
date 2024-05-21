extends AnimatableBody2D

signal state_change(animation)

const GROUND_HEIGHT = 550
const ACCELERATION = 1500
const JUMP_BASE = 750
const JUMP_DECAY = 1250

var velocity = 0
var jump_force = JUMP_BASE
var on_ground = true
var running = true
var dead = false
var spraying = false
var braking = false
var brake_buffer = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sync_to_physics = false

func reset():
	dead = false
	braking = false
	velocity = 0
	jump_force = JUMP_BASE
	on_ground = true
	running = true
	rotation = 0
	position.y = GROUND_HEIGHT
	state_change.emit("run")

func process_jump(delta: float):
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		if(on_ground):
			state_change.emit("jump")
		if(velocity <= 0):
			velocity = -max(jump_force, 0)
		else:
			state_change.emit("fall")
		on_ground = false
		jump_force -= JUMP_DECAY * delta
	else:
		if(!on_ground):
			if(velocity < 0):
				state_change.emit("fall")
				velocity = 0
			jump_force = 0

func process_spraying():
	if(dead):
		return
	if(Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		if(!spraying):
			state_change.emit("spray")
			spraying = true
	else:
		if(spraying):
			state_change.emit("stop_spray")
			spraying = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(on_ground and brake_buffer):
		brake_buffer = false
		brake()
	if(braking and Globals.speed == 0):
		braking = false
		state_change.emit("idle")
	if(running):
		process_jump(delta)
	else:
		process_spraying()
	if(on_ground):
		return
	velocity += ACCELERATION * delta
	if(!Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		velocity += ACCELERATION * delta * 0.5
	position.y += velocity * delta
	if(position.y > GROUND_HEIGHT):
		state_change.emit("run")
		position.y = GROUND_HEIGHT
		velocity = 0
		jump_force = JUMP_BASE
		on_ground = true

func brake():
	running = false
	braking = true
	state_change.emit("brake")
	Globals.brake()

func accelerate():
	running = true
	state_change.emit("run")
	Globals.accelerate()

func _input(event):
	if(dead):
		return
	if(event is InputEventMouseButton):
		if(event.button_index == MOUSE_BUTTON_RIGHT and event.pressed):
			if(!on_ground):
				brake_buffer = true
				return
			if(running):
				brake()
			else:
				accelerate()


func _on_game_die():
	if(dead):
		return
	dead = true
	running = false
	rotate(PI / 2)
