extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	play("run")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_state_change(animation):
	play(animation)
	pass # Replace with function body.
