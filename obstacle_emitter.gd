extends Node2D

signal hit
signal play
signal pause

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_hit():
	hit.emit()

func on_game_play():
	play.emit()

func on_game_pause():
	pause.emit()

func _on_play():
	pass # Replace with function body.
