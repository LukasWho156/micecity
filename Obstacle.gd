extends AnimatableBody2D

signal hit

const VELOCITY = Vector2(-500, 0)

var evaluated = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sync_to_physics = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(position.x < 0 and !evaluated):
		Globals.add_points(10)
		evaluated = true
	if(position.x < -200):
		get_parent().queue_free()
	var collision = move_and_collide(VELOCITY * delta * Globals.speed, true)
	position.x += delta * VELOCITY.x * Globals.speed
	if(collision != null):
		hit.emit()
