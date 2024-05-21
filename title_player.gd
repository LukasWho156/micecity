extends AnimatedSprite2D

var started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(started):
		position.x += delta * 500

func _on_title_draw_start(pos):
	play("spray")

func _on_title_draw_end():
	play("stop_spray")

func _on_title_start():
	play("run")
	started = true
