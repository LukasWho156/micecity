extends Node2D

var target_y = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var add_y = (target_y - position.y) * (1 - pow(0.01, delta))
	position.y += add_y


func _on_player_state_change(animation):
	if(animation == "brake"):
		target_y = 0
	if(animation == "run"):
		target_y = 100
